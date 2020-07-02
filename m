Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D1A212095
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 12:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CF76E153;
	Thu,  2 Jul 2020 10:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3186E153
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 10:07:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062A5GBs000419; Thu, 2 Jul 2020 12:07:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=TKqCPybnMdCJw0JOP40tdCEiMwOMyImyHsuRzRC+4XQ=;
 b=BS603QcQ/Z2uvFS+6ctLAg8Ek7vEXyTA/9RS/h/eUVNGWJt8mScFce5/KE0KrIwoD7E8
 Z4N3I1n8MA8p+c3Qly2S4cU5SbjvNrcQXCD7usPuE0L6jHFR7Riq5eaxX7I3XJSCotSE
 YJerGEhDoKWo5mTdTXW0bRAGs99+bVBM73x51TzF88gLILp8CKmu/kEDAt1ihaS39HvM
 GFJwSrJJNtwrfhfHNnAvwJTTDWmud3xZCbOLDBvdmxA7lK74EorU/sfHgW50WQA+ByWX
 W/Ni5Ji7/pXbRtc1gWkDfexPG/l6ENoQngOc6R89wm7oSKRItfDkJ/xnFedSSJSze4n3 xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu89yt8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 12:07:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E485310002A;
 Thu,  2 Jul 2020 12:07:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA07A2AD9E4;
 Thu,  2 Jul 2020 12:07:19 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 12:07:19 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 12:07:19 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Marek Vasut <marex@denx.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/stm: repair runtime power management
Thread-Topic: [PATCH] drm/stm: repair runtime power management
Thread-Index: AQHV70304+mKtyVsAU2WSR7LYHvRkqhAG4HQgAAJD4CAsx2dAIABbskA
Date: Thu, 2 Jul 2020 10:07:19 +0000
Message-ID: <3121f339-c513-f75d-569e-81c5c0f3cd1a@st.com>
References: <20200229221649.90813-1-marex@denx.de>
 <a30ad5a774004221903292871797607a@SFHDAG6NODE1.st.com>
 <64ea7f77-0a0b-ae3a-2911-5fdc8633255e@denx.de>
 <68f47008-f0ed-384c-7e21-f29b444da3ee@st.com>
In-Reply-To: <68f47008-f0ed-384c-7e21-f29b444da3ee@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <63DBC0C570A66E4284DCCE2EE20CF32C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_04:2020-07-01,
 2020-07-02 signatures=0
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDcvMS8yMCAyOjE0IFBNLCBZYW5uaWNrIEZFUlRSRSB3cm90ZToNCj4gDQo+IA0KPiBP
biAzLzkvMjAgMTI6NTcgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOg0KPj4gT24gMy85LzIwIDExOjM1
IEFNLCBZYW5uaWNrIEZFUlRSRSB3cm90ZToNCj4+PiBIZWxsbyBNYXJlaywNCj4+DQo+PiBIaSwN
Cj4+DQo+PiAocGxlYXNlIHN0b3AgdG9wLXBvc3RpbmcpDQo+Pg0KPj4+IFRoYW5rIGZvciB5b3Vy
IHBhdGNoLiBQbV9ydW50aW1lX3B1dF9zeW5jIGlzIGFsc28gZG9uZSBpbnRvIGZ1bmN0aW9uIGx0
ZGNfY3J0Y19tb2RlX2ZpeHVwLg0KPj4+IFRvIGF2b2lkIHNldmVyYWwgY2FsbCBvZiBQbV9ydW50
aW1lX3B1dF9zeW5jLCBpdCBjb3VsZCBiZSBiZXR0ZXIgdG8gY2hlY2sgcG1fcnVudGltZSBhY3Rp
dml0eToNCj4+Pg0KPj4+ICsJaW50IHJldDsNCj4+PiAgICANCj4+PiAgICAJRFJNX0RFQlVHX0RS
SVZFUigiXG4iKTsNCj4+PiAgICANCj4+PiArCWlmICghcG1fcnVudGltZV9hY3RpdmUoZGRldi0+
ZGV2KSkgew0KPj4+ICsJCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoZGRldi0+ZGV2KTsNCj4+
PiArCQlpZiAocmV0KSB7DQo+Pj4gKwkJCURSTV9FUlJPUigiRmFpbGVkIHRvIGVuYWJsZSBjcnRj
LCBjYW5ub3QgZ2V0IHN5bmNcbiIpOw0KPj4+ICsJCQlyZXR1cm47DQo+Pj4gKwkJfQ0KPj4+ICsJ
fQ0KPj4+ICsNCj4+DQo+PiBXaGVyZSBzaG91bGQgdGhpcyBnbyA/IEFuZCB3b3VsZG4ndCB0aGF0
IG9ubHkgaGlkZSBuYXN0aWVyIFBNIGltYmFsYW5jZQ0KPj4gaXNzdWVzID8NCj4gSGkgTWFyZWss
DQo+IEkgdGVzdGVkIHRoZSBwYXRjaCAmICBpdCBnZW5lcmF0ZSBhbiBlcnJvciB3aGVuIEkgdHJ5
IHdha2UgdXAgLyBzbGVlcA0KPiB0aGUgYm9hcmQgU1RNMzJNUDEgREsyIHdpdGggd2VzdG9uIGFw
cGxpY2F0aW9uLg0KPiBJdCBuZWVkIGFuIGFkZGl0aW9uYWwgcGF0Y2gNCj4gZHJtLXN0bS1sdGRj
LXJlbW92ZS1jYWxsLW9mLXBtLXJ1bnRpbWUtZnVuY3Rpb25zLg0KPiANCj4gVGhhbmtzIGZvciB0
aGUgcGF0Y2guDQo+IA0KPiBUZXN0ZWQtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRy
ZUBzdC5jb20+DQo+IA0KDQpIaSBNYXJlaywNCmJlZm9yZSBtZXJnaW5nIHRoZSAyIHBhdGNoZXMs
IEkgd291bGQgbGlrZSB0byBiZSBzdXJlIHRoYXQgWWFubmljaydzIA0KcGF0Y2ggZG9lcyBub3Qg
ImJyZWFrIiB5b3VyIHVzZSBjYXNlIChRdCBJIHRoaW5rKT8NCk1heSBJIGFzayB5b3UgcGxlYXNl
IHRvIGdpdmUgaXQgYSB0cnk/DQpOb3RlOiBJZiB5b3UgdGhpbmsgdGhlcmUgaXMgbm8gbmVlZCB0
byBkbyBleHRyYSBjaGVja3MsIHNpbXBseSB0ZWxsIG1lIA0Kb2YgY291cnNlDQpQaGlsaXBwZSA6
LSkNCg0KPiANCj4+DQo+Pj4gICAgQmVzdCByZWdhcmRzDQo+Pj4NCj4+PiBZYW5uaWNrIEZlcnRy
w6kNCj4+Pg0KPj4+DQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBN
YXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4+PiBTZW50OiBzYW1lZGkgMjkgZsOpdnJpZXIg
MjAyMCAyMzoxNw0KPj4+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4g
Q2M6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPjsgWWFubmljayBGRVJUUkUgPHlhbm5pY2su
ZmVydHJlQHN0LmNvbT47IFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5jb3JudUBzdC5jb20+OyBC
ZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz47IFZpbmNlbnQg
QUJSSU9VIDx2aW5jZW50LmFicmlvdUBzdC5jb20+OyBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxp
bi5zdG0zMkBnbWFpbC5jb20+OyBBbGV4YW5kcmUgVE9SR1VFIDxhbGV4YW5kcmUudG9yZ3VlQHN0
LmNvbT47IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb207IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPj4+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL3N0
bTogcmVwYWlyIHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudA0KPj4+DQo+Pj4gQWRkIG1pc3Npbmcg
cG1fcnVudGltZV9nZXRfc3luYygpIGludG8gbHRkY19jcnRjX2F0b21pY19lbmFibGUoKSB0byBt
YXRjaCBwbV9ydW50aW1lX3B1dF9zeW5jKCkgaW4gbHRkY19jcnRjX2F0b21pY19kaXNhYmxlKCks
IG90aGVyd2lzZSB0aGUgTFREQyBtaWdodCBzdXNwZW5kIHZpYSBydW50aW1lIFBNLCBkaXNhYmxl
IGNsb2NrLCBhbmQgdGhlbiBmYWlsIHRvIHJlc3VtZSBsYXRlciBvbi4NCj4+Pg0KPj4+IFRoZSB0
ZXN0IHdoaWNoIHRyaWdnZXJzIGl0IGlzIHJvdWdobHkgLS0gcnVuIHF0NSBhcHBsaWNhdGlvbiB3
aGljaCB1c2VzIGVnbGZzIHBsYXRmb3JtIGFuZCBldG5hdml2LCBzdG9wIHRoZSBhcHBsaWNhdGlv
biwgc2xlZXAgZm9yIDE1IG1pbnV0ZXMsIHJ1biB0aGUgYXBwbGljYXRpb24gYWdhaW4uIFRoaXMg
bGVhZHMgdG8gYSB0aW1lb3V0IHdhaXRpbmcgZm9yIHZzeW5jLCBiZWNhdXNlIHRoZSBMVERDIGhh
cyBzdXNwZW5kZWQsIGJ1dCBkaWQgbm90IHJlc3VtZS4NCj4+Pg0KPj4+IEZpeGVzOiAzNWFiNmNm
YmYyMTEgKCJkcm0vc3RtOiBzdXBwb3J0IHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudCIpDQo+Pj4g
U2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+Pj4gQ2M6IFlhbm5p
Y2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KPj4+IENjOiBQaGlsaXBwZSBDb3Ju
dSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KPj4+IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVu
amFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4NCj4+PiBDYzogVmluY2VudCBBYnJpb3UgPHZpbmNl
bnQuYWJyaW91QHN0LmNvbT4NCj4+PiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3Rt
MzJAZ21haWwuY29tPg0KPj4+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3Vl
QHN0LmNvbT4NCj4+PiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+IENj
OiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tDQo+Pj4gQ2M6IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPj4+IC0tLQ0KPj4+IC0tLS0tLS0tLS0t
LVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPj4+IFdBUk5JTkc6IENQVTogMCBQSUQ6IDI5NyBh
dCBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYzoxNDk0IGRybV9hdG9taWNfaGVs
cGVyX3dhaXRfZm9yX3ZibGFua3MrMHgxZGMvMHgyMDANCj4+PiBbQ1JUQzozNTpjcnRjLTBdIHZi
bGFuayB3YWl0IHRpbWVkIG91dA0KPj4+IE1vZHVsZXMgbGlua2VkIGluOg0KPj4+IENQVTogMCBQ
SUQ6IDI5NyBDb21tOiBRU0dSZW5kZXJUaHJlYWQgTm90IHRhaW50ZWQgNS42LjAtcmMzLW5leHQt
MjAyMDAyMjgtMDAwMTAtZzMxOGJmMGZjMDhlZiAjMiBIYXJkd2FyZSBuYW1lOiBTVE0zMiAoRGV2
aWNlIFRyZWUgU3VwcG9ydCkgWzxjMDEwZjE4Yz5dICh1bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8
YzAxMGFmYjg+XSAoc2hvd19zdGFjaysweDEwLzB4MTQpIFs8YzAxMGFmYjg+XSAoc2hvd19zdGFj
aykgZnJvbSBbPGMwN2IxZDNjPl0gKGR1bXBfc3RhY2srMHhiNC8weGQwKSBbPGMwN2IxZDNjPl0g
KGR1bXBfc3RhY2spIGZyb20gWzxjMDExZDhiOD5dIChfX3dhcm4rMHhkNC8weGYwKSBbPGMwMTFk
OGI4Pl0gKF9fd2FybikgZnJvbSBbPGMwMTFkYzRjPl0gKHdhcm5fc2xvd3BhdGhfZm10KzB4Nzgv
MHhhOCkgWzxjMDExZGM0Yz5dICh3YXJuX3Nsb3dwYXRoX2ZtdCkgZnJvbSBbPGMwNGEyNjZjPl0g
KGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX3ZibGFua3MrMHgxZGMvMHgyMDApDQo+Pj4gWzxj
MDRhMjY2Yz5dIChkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92YmxhbmtzKSBmcm9tIFs8YzA0
YTUxMGM+XSAoZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3RhaWwrMA0KPj4+IHg1MC8weDYwKQ0K
Pj4+IFs8YzA0YTUxMGM+XSAoZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3RhaWwpIGZyb20gWzxj
MDRhNTJhOD5dIChjb21taXRfdGFpbCsweDEyYy8weDEzYykgWzxjMDRhNTJhOD5dIChjb21taXRf
dGFpbCkgZnJvbSBbPGMwNGE1M2I0Pl0gKGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCsweGY0LzB4
MTAwKQ0KPj4+IFs8YzA0YTUzYjQ+XSAoZHJtX2F0b21pY19oZWxwZXJfY29tbWl0KSBmcm9tIFs8
YzA0YTJkMzg+XSAoZHJtX2F0b21pY19oZWxwZXJfc2V0X2NvbmZpZysweDU4LzB4NmMpDQo+Pj4g
WzxjMDRhMmQzOD5dIChkcm1fYXRvbWljX2hlbHBlcl9zZXRfY29uZmlnKSBmcm9tIFs8YzA0YjE5
OTQ+XSAoZHJtX21vZGVfc2V0Y3J0YysweDQ1MC8weDU1MCkgWzxjMDRiMTk5ND5dIChkcm1fbW9k
ZV9zZXRjcnRjKSBmcm9tIFs8YzA0YWQ1NzA+XSAoZHJtX2lvY3RsX2tlcm5lbCsweDkwLzB4ZTgp
IFs8YzA0YWQ1NzA+XSAoZHJtX2lvY3RsX2tlcm5lbCkgZnJvbSBbPGMwNGFkOGFjPl0gKGRybV9p
b2N0bCsweDJlNC8weDMyYykgWzxjMDRhZDhhYz5dIChkcm1faW9jdGwpIGZyb20gWzxjMDI0Njc4
ND5dICh2ZnNfaW9jdGwrMHgyMC8weDM4KSBbPGMwMjQ2Nzg0Pl0gKHZmc19pb2N0bCkgZnJvbSBb
PGMwMjQ3MGYwPl0gKGtzeXNfaW9jdGwrMHhiYy8weDdiMCkgWzxjMDI0NzBmMD5dIChrc3lzX2lv
Y3RsKSBmcm9tIFs8YzAxMDEwMDA+XSAocmV0X2Zhc3Rfc3lzY2FsbCsweDAvMHg1NCkgRXhjZXB0
aW9uIHN0YWNrKDB4ZWU4ZjNmYTggdG8gMHhlZThmM2ZmMCkNCj4+PiAzZmEwOiAgICAgICAgICAg
ICAgICAgICAwMDAwMDAwNSBhZGNiZWIxOCAwMDAwMDAwNSBjMDY4NjRhMiBhZGNiZWIxOCAwMDAw
MDAwMQ0KPj4+IDNmYzA6IDAwMDAwMDA1IGFkY2JlYjE4IGMwNjg2NGEyIDAwMDAwMDM2IDAwMDAw
MDI5IDAwMDAwMDIzIDAwMDAwMDIzIDAwMDAwMDA3DQo+Pj4gM2ZlMDogYjExM2IwOTggYWRjYmVh
ZmMgYjExMjU0MTMgYjYxNTVjZjggLS0tWyBlbmQgdHJhY2UgMmFkNWJhOTU0Y2ViNzY3YSBdLS0t
DQo+Pj4gLS0tDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAzICsrKw0KPj4+
ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5j
IGluZGV4IDk5YmY5M2U4YjM2Zi4uMzAxZGUwNDk4MDc4IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9zdG0vbHRkYy5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRj
LmMNCj4+PiBAQCAtNDI1LDkgKzQyNSwxMiBAQCBzdGF0aWMgdm9pZCBsdGRjX2NydGNfYXRvbWlj
X2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQo+Pj4gICAgCQkJCSAgICBzdHJ1Y3QgZHJt
X2NydGNfc3RhdGUgKm9sZF9zdGF0ZSkgIHsNCj4+PiAgICAJc3RydWN0IGx0ZGNfZGV2aWNlICps
ZGV2ID0gY3J0Y190b19sdGRjKGNydGMpOw0KPj4+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRkZXYg
PSBjcnRjLT5kZXY7DQo+Pj4gICAgDQo+Pj4gICAgCURSTV9ERUJVR19EUklWRVIoIlxuIik7DQo+
Pj4gICAgDQo+Pj4gKwlwbV9ydW50aW1lX2dldF9zeW5jKGRkZXYtPmRldik7DQo+Pj4gKw0KPj4+
ICAgIAkvKiBTZXRzIHRoZSBiYWNrZ3JvdW5kIGNvbG9yIHZhbHVlICovDQo+Pj4gICAgCXJlZ193
cml0ZShsZGV2LT5yZWdzLCBMVERDX0JDQ1IsIEJDQ1JfQkNCTEFDSyk7DQo+Pj4gICAgDQo+Pj4g
LS0NCj4+PiAyLjI1LjANCj4+Pg0KPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
