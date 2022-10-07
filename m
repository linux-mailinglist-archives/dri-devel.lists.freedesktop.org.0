Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E965F7340
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 05:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13CB10E909;
	Fri,  7 Oct 2022 03:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2754010E909
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 03:18:31 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 07 Oct 2022 11:18:28 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 2973INig052837;
 Fri, 7 Oct 2022 11:18:23 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from CSBMAIL1.internal.ite.com.tw (192.168.65.58) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Fri, 7 Oct 2022 11:18:23 +0800
Received: from CSBMAIL1.internal.ite.com.tw ([fe80::dd22:b444:859b:61c7]) by
 CSBMAIL1.internal.ite.com.tw ([fe80::dd22:b444:859b:61c7%18]) with mapi id
 15.01.2176.014; Fri, 7 Oct 2022 11:18:23 +0800
From: <allen.chen@ite.com.tw>
To: <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Thread-Topic: [PATCH v3 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Thread-Index: AQHY2VwH4XaKCUkNtUyljQ/FMSbcHK4CPVTQ
Date: Fri, 7 Oct 2022 03:18:23 +0000
Message-ID: <7acf5664832f43fbaa684c19415894c7@ite.com.tw>
References: <20221006020444.15823-1-allen.chen@ite.com.tw>
 <20221006020444.15823-2-allen.chen@ite.com.tw>
 <94c660bc-b7eb-1aea-8ae2-0ee7993091fd@linaro.org>
In-Reply-To: <94c660bc-b7eb-1aea-8ae2-0ee7993091fd@linaro.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.70.46]
x-tm-snts-smtp: 7A0657408AC383F36A83D34E00884192F659069CA4697D1DC55F10CE896CB5A62002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 2973INig052837
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
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Jau-Chih.Tseng@ite.com.tw, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, treapking@chromium.org, Hermes.Wu@ite.com.tw,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 jonas@kwiboo.se
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aGkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gDQpTZW50OiBUaHVyc2RheSwgT2N0
b2JlciA2LCAyMDIyIDQ6MTcgUE0NClRvOiBBbGxlbiBDaGVuICjpmbPmn4/lrocpIDxhbGxlbi5j
aGVuQGl0ZS5jb20udHc+DQpDYzogSmF1LUNoaWggVHNlbmcgKOabvuaYreaZuikgPEphdS1DaGlo
LlRzZW5nQGl0ZS5jb20udHc+OyBLZW5uZXRoIEh1bmcgKOa0quWutuWAqykgPEtlbm5ldGguSHVu
Z0BpdGUuY29tLnR3PjsgSGVybWVzIFd1ICjlkLPkvbPlro8pIDxIZXJtZXMuV3VAaXRlLmNvbS50
dz47IFBpbi15ZW4gTGluIDx0cmVhcGtpbmdAY2hyb21pdW0ub3JnPjsgQW5kcnplaiBIYWpkYSA8
YW5kcnplai5oYWpkYUBpbnRlbC5jb20+OyBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXls
aWJyZS5jb20+OyBSb2JlcnQgRm9zcyA8cm9iZXJ0LmZvc3NAbGluYXJvLm9yZz47IExhdXJlbnQg
UGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IEpvbmFzIEthcmxt
YW4gPGpvbmFzQGt3aWJvby5zZT47IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFp
bC5jb20+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+OyBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgb3BlbiBs
aXN0OkRSTSBEUklWRVJTIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgb3BlbiBs
aXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJQ0UgVFJFRSBCSU5ESU5HUyA8ZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc+DQpTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvMl0gZHQtYmluZGluZ3M6IGl0NjUw
NTogYWRkIHByb3BlcnRpZXMgdG8gcmVzdHJpY3Qgb3V0cHV0IGJhbmR3aWR0aA0KDQpPbiAwNi8x
MC8yMDIyIDA0OjA0LCBhbGxlbiB3cm90ZToNCj4gRnJvbTogYWxsZW4gY2hlbiA8YWxsZW4uY2hl
bkBpdGUuY29tLnR3Pg0KPiANCj4gQWRkIHByb3BlcnRpZXMgdG8gcmVzdHJpY3QgZHAgb3V0cHV0
IGRhdGEtbGFuZXMgYW5kIGNsb2NrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGluLVllbiBMaW4g
PHRyZWFwa2luZ0BjaHJvbWl1bS5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEFsbGVuIENoZW4gPGFs
bGVuLmNoZW5AaXRlLmNvbS50dz4NCj4gLS0tDQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvaXRlLGl0NjUwNS55YW1sICAgICAgICAgIHwgMTIgKysrKysrKysrKysrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCANCj4gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS55YW1s
IA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9p
dGUsaXQ2NTA1LnlhbWwNCj4gaW5kZXggODMzZDExYjIzMDNhLi5mNTQ4MmE2MTRkMDUgMTAwNjQ0
DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9pdGUsaXQ2NTA1LnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDY1MDUueWFtbA0KPiBAQCAtNTIsNiArNTIsMTYgQEAg
cHJvcGVydGllczoNCj4gICAgICBtYXhJdGVtczogMQ0KPiAgICAgIGRlc2NyaXB0aW9uOiBleHRj
b24gc3BlY2lmaWVyIGZvciB0aGUgUG93ZXIgRGVsaXZlcnkNCj4gIA0KPiArICBpdGUsZHAtb3V0
cHV0LWRhdGEtbGFuZS1jb3VudDoNCj4gKyAgICBkZXNjcmlwdGlvbjogcmVzdHJpY3QgdGhlIGRw
IG91dHB1dCBkYXRhLWxhbmVzIHdpdGggdmFsdWUgb2YgMS00DQoNCkRyb3AgIndpdGggdmFsdWUg
b2YgMS00IiBiZWNhdXNlIGl0IGlzIHJlZHVuZGFudCwgYnV0IGluc3RlYWQgZXhwbGFpbiB3aGF0
IHRoaXMgcHJvcGVydHkgaXMgYWJvdXQuICJSZXN0cmljdCBvdXRwdXQiIGlzIG5vdCB5ZXQgZW5v
dWdoLg0KUmVzdHJpY3QgdGhlIG51bWJlcj8gT3IgY2hvb3NlIHNwZWNpZmljIGxhbmVzPyBXaHkg
aXQgY2Fubm90IGJlIGRhdGEtbGFuZXMgZnJvbSB2aWRlby1pbnRlcmZhY2VzPw0KDQo9PT4gRFAg
b3V0cHV0IGJhbmR3aWR0aCBkZXBlbmRzIG9uIGRhdGEtbGFuZS1jb3VudCwgc28gdGhlIG51bWJl
ciBvZiBvdXRwdXQgZGF0YS1sYW5lLWNvdW50IHdpbGwgcmVzdHJpY3Qgb3V0cHV0IGJhbmR3aWR0
aC4NCkluIHRoaXMgZHQtYmluZGluZyB3ZSBkb24ndCBoYXZlIG91dHB1dCBlbmRwb2ludCwgc28g
dXNlIGFub3RoZXIgcHJvcGVydHkgbmFtZSB0byBjb25maWd1cmUuDQpJZiBuZWVkIHRvIHVzZSBk
YXRhLWxhbmVzLCB3aGVyZSBjYW4gd2UgcHV0IGluIHRoaXMgZHQtYmluZGluZz8NCg0KPiArICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiArICAgIGVu
dW06IFsgMSwgMiwgNCBdDQo+ICsNCj4gKyAgaXRlLGRwLW91dHB1dC1tYXgtcGl4ZWwtY2xvY2st
bWh6Og0KDQpUZXN0IHlvdXIgcGF0Y2hlcyBiZWZvcmUgc2VuZGluZy4NCg0KQmVzdCByZWdhcmRz
LA0KS3J6eXN6dG9mDQoNCg==
