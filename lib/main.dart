import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();

  String resultadoIMC = '';
  String tipoIMC = '';

  void calcularIMC() {

    //Coloquei tudo em número para realizar o calculo
    double calculo = (num.parse(controllerPeso.text) / (num.parse(controllerAltura.text) * (num.parse(controllerAltura.text))));

    //calculando o tipo de IMC
    String tipo = '';

    if (calculo < 18.5){
      tipo = "Abaixo do peso";
    } else if (calculo > 18.5 && calculo <= 24.9){
      tipo = "Peso ideal";
    } else if (calculo > 25.0 && calculo <= 30){
      tipo = "Sobrepeso";
    } else if (calculo > 30.0 && calculo <= 35){
      tipo = "Obesidade";
    } else if (calculo > 35.0 && calculo <= 40){
      tipo = "Obesidade Severa";
    }
    setState(() {
      //coloco o número resultante de calculo em string para exibir
      resultadoIMC = calculo.toStringAsFixed(2);
      tipoIMC = tipo;
    });
  }
  

  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Calculadora de IMC',
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controllerPeso,
                decoration: InputDecoration(
                  labelText: "Peso ",
                  hintText: "Digite seu peso",
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controllerAltura,
                decoration: InputDecoration(
                  labelText: "Altura ",
                  hintText: "Digite sua altura",
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),

              const SizedBox(height: 32,),
              Text(resultadoIMC, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(tipoIMC, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              //vamos criar o botão
              SizedBox(height: 16,),
              Container(
                width: 150,
                child: ElevatedButton(
                  onPressed: calcularIMC,
                   child: const Text('Calcular'),
                   ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          setState(() {
            resultadoIMC = '';
          });
        },
        child: Text('Limpar resultado'),
      ),
    );
  }
}