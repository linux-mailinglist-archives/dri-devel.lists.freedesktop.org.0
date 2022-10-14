Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E115A5FE798
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 05:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFC710E120;
	Fri, 14 Oct 2022 03:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B36F10E120
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 03:28:35 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 14 Oct 2022 11:28:33 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 29E3SVQ1062332;
 Fri, 14 Oct 2022 11:28:31 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from CSBMAIL1.internal.ite.com.tw (192.168.65.58) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Fri, 14 Oct 2022 11:28:31 +0800
Received: from CSBMAIL1.internal.ite.com.tw ([fe80::dd22:b444:859b:61c7]) by
 CSBMAIL1.internal.ite.com.tw ([fe80::dd22:b444:859b:61c7%18]) with mapi id
 15.01.2176.014; Fri, 14 Oct 2022 11:28:31 +0800
From: <allen.chen@ite.com.tw>
To: <robh@kernel.org>, <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v4 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Thread-Topic: [PATCH v4 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Thread-Index: AQHY3vPJt2BxrbTZTketnPM7zo04e64MLaIAgAEFYfA=
Date: Fri, 14 Oct 2022 03:28:31 +0000
Message-ID: <e24a52c109444452a9027d53a21d6ef0@ite.com.tw>
References: <20221013105116.180380-1-allen.chen@ite.com.tw>
 <20221013105116.180380-2-allen.chen@ite.com.tw>
 <Y0fxCVUtlkB4XHIq@pendragon.ideasonboard.com>
 <20221013192016.GA95717-robh@kernel.org>
In-Reply-To: <20221013192016.GA95717-robh@kernel.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.70.46]
x-tm-snts-smtp: 5B72E33DD26C6D172F89B33E0E1B75AE939EC55DD65B7C0244349CC685D2962D2002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 29E3SVQ1062332
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Kenneth.Hung@ite.com.tw,
 krzysztof.kozlowski+dt@linaro.org, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Jau-Chih.Tseng@ite.com.tw,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, treapking@chromium.org,
 Hermes.Wu@ite.com.tw, jernej.skrabec@gmail.com, andrzej.hajda@intel.com,
 jonas@kwiboo.se
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+IA0KU2VudDogRnJpZGF5LCBPY3RvYmVyIDE0LCAyMDIyIDM6MjAgQU0NClRv
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+OyBB
bGxlbiBDaGVuICizr6xmpnQpIDxhbGxlbi5jaGVuQGl0ZS5jb20udHc+DQpDYzogUGluLXllbiBM
aW4gPHRyZWFwa2luZ0BjaHJvbWl1bS5vcmc+OyBKYXUtQ2hpaCBUc2VuZyAotL+sTLS8KSA8SmF1
LUNoaWguVHNlbmdAaXRlLmNvbS50dz47IEtlbm5ldGggSHVuZyAorHiuYa3bKSA8S2VubmV0aC5I
dW5nQGl0ZS5jb20udHc+OyBIZXJtZXMgV3UgKKdkqM6nuykgPEhlcm1lcy5XdUBpdGUuY29tLnR3
PjsgQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+OyBOZWlsIEFybXN0cm9u
ZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+OyBSb2JlcnQgRm9zcyA8cm9iZXJ0LmZvc3NAbGlu
YXJvLm9yZz47IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT47IEplcm5laiBTa3JhYmVj
IDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBvcGVuIGxpc3Q6RFJNIERSSVZF
UlMgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBvcGVuIGxpc3Q6T1BFTiBGSVJN
V0FSRSBBTkQgRkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTIDxkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZz47IG9wZW4gbGlzdCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4NClN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMS8yXSBkdC1iaW5kaW5nczogaXQ2NTA1OiBhZGQgcHJvcGVy
dGllcyB0byByZXN0cmljdCBvdXRwdXQgYmFuZHdpZHRoDQoNCk9uIFRodSwgT2N0IDEzLCAyMDIy
IGF0IDAyOjA1OjQ1UE0gKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+IEhpIEFsbGVu
LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBUaHUsIE9jdCAxMywg
MjAyMiBhdCAwNjo1MToxM1BNICswODAwLCBhbGxlbiB3cm90ZToNCj4gPiBGcm9tOiBhbGxlbiBj
aGVuIDxhbGxlbi5jaGVuQGl0ZS5jb20udHc+DQo+ID4gDQo+ID4gQWRkIHByb3BlcnRpZXMgdG8g
cmVzdHJpY3QgZHAgb3V0cHV0IGRhdGEtbGFuZXMgYW5kIGNsb2NrLg0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFBpbi1ZZW4gTGluIDx0cmVhcGtpbmdAY2hyb21pdW0ub3JnPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFsbGVuIENoZW4gPGFsbGVuLmNoZW5AaXRlLmNvbS50dz4NCj4gPiAtLS0NCj4g
PiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDY1MDUueWFtbCAgIHwgNDMgKysr
KysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQ0K
PiA+IA0KPiA+IGRpZmYgLS1naXQgDQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS55YW1sIA0KPiA+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDY1MDUueWFtbA0KPiA+
IGluZGV4IDgzM2QxMWIyMzAzYTcuLmYyYzNkMWQxMDM1OWUgMTAwNjQ0DQo+ID4gLS0tIA0KPiA+
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxp
dDY1MDUueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2JyaWRnZS9pdGUsaXQ2NTA1LnlhDQo+ID4gKysrIG1sDQo+ID4gQEAgLTUyLDEwICs1
Miw1MSBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgbWF4SXRlbXM6IDENCj4gPiAgICAgIGRlc2Ny
aXB0aW9uOiBleHRjb24gc3BlY2lmaWVyIGZvciB0aGUgUG93ZXIgRGVsaXZlcnkNCj4gPiAgDQo+
ID4gKyAgZGF0YS1sYW5lczoNCj4gPiArICAgIG9uZU9mOg0KPiA+ICsgICAgICAtIG1pbkl0ZW1z
OiAxDQo+ID4gKyAgICAgICAgbWF4SXRlbXM6IDENCj4gPiArICAgICAgICB1bmlxdWVJdGVtczog
dHJ1ZQ0KPiA+ICsgICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgZW51bToNCj4gPiArICAg
ICAgICAgICAgLSAwDQo+ID4gKyAgICAgICAgICAgIC0gMQ0KPiA+ICsgICAgICAgIGRlc2NyaXB0
aW9uOiBGb3Igb25lIGxhbmUgb3BlcmF0aW9uLg0KPiA+ICsNCj4gPiArICAgICAgLSBtaW5JdGVt
czogMg0KPiA+ICsgICAgICAgIG1heEl0ZW1zOiAyDQo+ID4gKyAgICAgICAgdW5pcXVlSXRlbXM6
IHRydWUNCj4gPiArICAgICAgICBpdGVtczoNCj4gPiArICAgICAgICAgIGVudW06DQo+ID4gKyAg
ICAgICAgICAgIC0gMA0KPiA+ICsgICAgICAgICAgICAtIDENCj4gPiArICAgICAgICBkZXNjcmlw
dGlvbjogRm9yIHR3byBsYW5lcyBvcGVyYXRpb24uDQo+ID4gKw0KPiA+ICsgICAgICAtIG1pbkl0
ZW1zOiA0DQo+ID4gKyAgICAgICAgbWF4SXRlbXM6IDQNCj4gPiArICAgICAgICB1bmlxdWVJdGVt
czogdHJ1ZQ0KPiA+ICsgICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgZW51bToNCj4gPiAr
ICAgICAgICAgICAgLSAwDQo+ID4gKyAgICAgICAgICAgIC0gMQ0KPiA+ICsgICAgICAgICAgICAt
IDINCj4gPiArICAgICAgICAgICAgLSAzDQo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IEZvciBm
b3VyIGxhbmVzIG9wZXJhdGlvbi4NCj4gDQo+IFRoZSBkYXRhIGxhbmVzIHNob3VsZCBiZSBpbiB0
aGUgb3V0cHV0IGVuZHBvaW50LiBJZiB0aGVyZSdzIG5vIG91dHB1dCANCj4gcG9ydCwgb25lIHNo
b3VsZCBiZSBhZGRlZC4NCj4gDQo9PT4gSW4gdGhpcyBkdC1iaW5kaW5nLCBvdXIgb3V0cHV0IHBv
aW50IGlzICJleHRjb24iIHNvIGRvZXNuJ3QgaGF2ZSBvdXRwdXQgZW5kcG9pbnQuDQpJIGRvbid0
IGtub3cgaG93IHRvIGFkZCB0aGUgZW5kcG9pbnQuDQpJZiBuZWVkIHRvIGFkZCB0aGUgZW5kcG9p
bnQgdG8gdGhpcyBkdC1iaW5kaW5nLCB3aGF0IGlzIHlvdXIgcmVjb21tZW5kIGFib3V0IGFkZGlu
ZyB0aGUgZW5kcG9pbnQ/DQpCeSB0aGUgd2F5LCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHNhaWQgd2UgY291bGQgcHV0ICJkYXRhLWxhbmVzIiBo
ZXJlLg0KPiA+ICsNCj4gPiAgICBwb3J0Og0KPiA+ICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgu
eWFtbCMvcHJvcGVydGllcy9wb3J0DQoNClRvIGZpeCB0aGUgZXJyb3IsIHRoaXMgbXVzdCBiZToN
Cg0KJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvJGRlZnMvcG9ydC1iYXNlDQp1bmV2YWx1YXRl
ZFByb3BlcnRpZXM6IGZhbHNlDQoNCj4gPiAgICAgIGRlc2NyaXB0aW9uOiBBIHBvcnQgbm9kZSBw
b2ludGluZyB0byBEUEkgaG9zdCBwb3J0IG5vZGUNCj4gPiAgDQo+ID4gKyAgICBwcm9wZXJ0aWVz
Og0KPiA+ICsgICAgICBlbmRwb2ludDoNCj4gPiArICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFw
aC55YW1sIy8kZGVmcy9lbmRwb2ludC1iYXNlDQo+ID4gKw0KPiA+ICsgICAgICAgIHByb3BlcnRp
ZXM6DQo+ID4gKyAgICAgICAgICBsaW5rLWZyZXF1ZW5jaWVzOg0KPiA+ICsgICAgICAgICAgICBt
aW5JdGVtczogMQ0KPiA+ICsgICAgICAgICAgICBtYXhJdGVtczogMQ0KPiA+ICsgICAgICAgICAg
ICBkZXNjcmlwdGlvbjogQWxsb3dlZCBtYXggbGluayBmcmVxdWVuY2llcyBpbiBIei4NCj4gPiAr
DQo+ID4gIHJlcXVpcmVkOg0KPiA+ICAgIC0gY29tcGF0aWJsZQ0KPiA+ICAgIC0gb3ZkZC1zdXBw
bHkNCj4gPiBAQCAtODQsMTAgKzEyNSwxMiBAQCBleGFtcGxlczoNCj4gPiAgICAgICAgICAgICAg
cHdyMTgtc3VwcGx5ID0gPCZpdDY1MDVfcHAxOF9yZWc+Ow0KPiA+ICAgICAgICAgICAgICByZXNl
dC1ncGlvcyA9IDwmcGlvIDE3OSAxPjsNCj4gPiAgICAgICAgICAgICAgZXh0Y29uID0gPCZ1c2Jj
X2V4dGNvbj47DQo+ID4gKyAgICAgICAgICAgIGRhdGEtbGFuZXMgPSA8MCAxPjsNCj4gPiAgDQo+
ID4gICAgICAgICAgICAgIHBvcnQgew0KPiA+ICAgICAgICAgICAgICAgICAgaXQ2NTA1X2luOiBl
bmRwb2ludCB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZk
cGlfb3V0PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICBsaW5rLWZyZXF1ZW5jaWVzID0gL2Jp
dHMvIDY0IDwxNTAwMDAwMDA+Ow0KPiA+ICAgICAgICAgICAgICAgICAgfTsNCj4gPiAgICAgICAg
ICAgICAgfTsNCj4gPiAgICAgICAgICB9Ow0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExh
dXJlbnQgUGluY2hhcnQNCj4gDQo=
