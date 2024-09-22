import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Odd Even Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == 'yayank' && password == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.blue, // Mengubah warna navbar menjadi biru
        foregroundColor: Colors.white, // Warna teks tombol

      ),
      body: Center( // Menempatkan konten di tengah layar
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
             ElevatedButton(
            onPressed: login,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue[300], // Warna biru muda untuk tombol
              foregroundColor: Colors.white, // Warna teks tombol
              
              shape:StadiumBorder (
              ),
            ),
            child: Text('Login'),


              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Page'),
        backgroundColor: Colors.blue, 
         foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OddEvenPage()),
                );
              },
              child: Text('Periksa bilangan Ganjil/Genap'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MathOperationsPage()),
                );
              },
              child: Text('Pertambahan/Pengurangan'),
            ),
          ],
        ),
      ),
    );
  }
}


class OddEvenPage extends StatefulWidget {
  @override
  _OddEvenPageState createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  final TextEditingController numberController = TextEditingController();
  String result = '';

  void checkOddEven() {
    int number = int.parse(numberController.text);
    setState(() {
      result = (number % 2 == 0) ? 'Genap' : 'Ganjil';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Periksa bilangan Ganjil/Genap'),
         backgroundColor: Colors.blue, 
          foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: numberController,
              decoration: InputDecoration(labelText: 'Masukkan angka'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkOddEven,
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue[300], // Warna biru muda untuk tombol
              foregroundColor: Colors.white, // Warna teks tombol
              shape:StadiumBorder (
              ),
            ),
              child: Text('Check'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class MathOperationsPage extends StatefulWidget {
  @override
  _MathOperationsPageState createState() => _MathOperationsPageState();
}

class _MathOperationsPageState extends State<MathOperationsPage> {
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  String result = '';

  void calculate(String operation) {
    int firstNumber = int.parse(firstNumberController.text);
    int secondNumber = int.parse(secondNumberController.text);
    setState(() {
      if (operation == 'add') {
        result = 'Hasil: ${firstNumber + secondNumber}';
      } else if (operation == 'subtract') {
        result = 'Hasil: ${firstNumber - secondNumber}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertambahan/Pengurangan'),
         backgroundColor: Colors.blue, 
          foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: firstNumberController,
              decoration: InputDecoration(labelText: 'Masukkan angka pertama'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: secondNumberController,
              decoration: InputDecoration(labelText: 'Masukkan angka kedua'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => calculate('add'),
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue[300], // Warna biru muda untuk tombol
                    foregroundColor: Colors.white, // Warna teks tombol
                    shape:StadiumBorder (
                    ),
                  ),
                  child: Text('Tambah'),
                ),

                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => calculate('subtract'),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[300], // Warna biru muda untuk tombol
                  foregroundColor: Colors.white, // Warna teks tombol
                  shape:StadiumBorder (
                  ),
                ),
                  child: Text('Kurang'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
