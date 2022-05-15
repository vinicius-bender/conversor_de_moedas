import 'package:conversor_de_moedas/app/components/currency_box.dart';
import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  
late HomeController homeController = HomeController(toText: toText, fromText: fromText);
final TextEditingController toText = TextEditingController();
final TextEditingController fromText = TextEditingController();

void iniState(){
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 20),
          child: ListView(
            children: [
              Image.asset("assets/images/logo.png", width: 150, height: 150,),
               SizedBox(height: 50),
              CurrencyBox(
                selectedItem: homeController.toCurrency,
                items: homeController.currencies, controller: toText, onChanged: (model){
                setState(() {
                  homeController.toCurrency = model!;
                });
              },),
               SizedBox(height: 10),
              CurrencyBox(
                selectedItem: homeController.fromCurrency,
                items: homeController.currencies, controller: fromText, onChanged: (model){
                setState(() {
                  homeController.fromCurrency = model!;
                });
              },),
               SizedBox(height: 50),
              ElevatedButton(
                
                onPressed: (){
                  homeController.convert();
                }, 
                child:  Text("CONVERTER"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}