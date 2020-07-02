Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8037621235B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 14:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CEB6E248;
	Thu,  2 Jul 2020 12:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38866E248
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 12:31:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062CNAEs017346; Thu, 2 Jul 2020 14:31:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=3Xo4brCUW4HQGixENdTxHK/JZMaC1IhUbS/nmdelnsU=;
 b=WtiQhr4gTdMERVl13cb4ePX+egaYhnVhxDdH4WwrcWvT+GvWXeueFegIHuEuPODWUYMJ
 88DDKR3AFM6hmowwa8kGAMG77z2NkeI7wh2zfH7RPzy1jBEORJ59ngz+9Tp4WER4KlGV
 6Y65uRa/j3fSto5wC+358N+7UJP50yLJFjeFKK1pUcBcj/1HO1utSTW1w+5wjtzGi+uc
 MROGmcMz1bHJeWKD4g7YuTk174XSKLSu2JbvDhRCHWTCRCW06NQmLMzOWB+lKrSRr/tu
 hbu0lMS5MSsxRIzot1GL1iWYelmg+g0RgvAVBhUYeerHOuaysfM8vOlUvki8q1GxCpA4 XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0gg2fd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 14:31:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB4A610002A;
 Thu,  2 Jul 2020 14:31:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94C0A2AD2B3;
 Thu,  2 Jul 2020 14:31:54 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 14:31:54 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 14:31:53 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Marek Vasut <marex@denx.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/stm: repair runtime power management
Thread-Topic: [PATCH] drm/stm: repair runtime power management
Thread-Index: AQHV70304+mKtyVsAU2WSR7LYHvRkqj02WWA
Date: Thu, 2 Jul 2020 12:31:53 +0000
Message-ID: <965f6edb-c6f8-880c-8f4a-0b6b47dbd3c1@st.com>
References: <20200229221649.90813-1-marex@denx.de>
In-Reply-To: <20200229221649.90813-1-marex@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <53BBE7716BE44E48A3710521D3843349@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_08:2020-07-02,
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
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIvMjkvMjAgMTE6MTYgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBBZGQgbWlzc2lu
ZyBwbV9ydW50aW1lX2dldF9zeW5jKCkgaW50byBsdGRjX2NydGNfYXRvbWljX2VuYWJsZSgpIHRv
DQo+IG1hdGNoIHBtX3J1bnRpbWVfcHV0X3N5bmMoKSBpbiBsdGRjX2NydGNfYXRvbWljX2Rpc2Fi
bGUoKSwgb3RoZXJ3aXNlDQo+IHRoZSBMVERDIG1pZ2h0IHN1c3BlbmQgdmlhIHJ1bnRpbWUgUE0s
IGRpc2FibGUgY2xvY2ssIGFuZCB0aGVuIGZhaWwNCj4gdG8gcmVzdW1lIGxhdGVyIG9uLg0KPiAN
Cj4gVGhlIHRlc3Qgd2hpY2ggdHJpZ2dlcnMgaXQgaXMgcm91Z2hseSAtLSBydW4gcXQ1IGFwcGxp
Y2F0aW9uIHdoaWNoDQo+IHVzZXMgZWdsZnMgcGxhdGZvcm0gYW5kIGV0bmF2aXYsIHN0b3AgdGhl
IGFwcGxpY2F0aW9uLCBzbGVlcCBmb3IgMTUNCj4gbWludXRlcywgcnVuIHRoZSBhcHBsaWNhdGlv
biBhZ2Fpbi4gVGhpcyBsZWFkcyB0byBhIHRpbWVvdXQgd2FpdGluZw0KPiBmb3IgdnN5bmMsIGJl
Y2F1c2UgdGhlIExUREMgaGFzIHN1c3BlbmRlZCwgYnV0IGRpZCBub3QgcmVzdW1lLg0KPiANCj4g
Rml4ZXM6IDM1YWI2Y2ZiZjIxMSAoImRybS9zdG06IHN1cHBvcnQgcnVudGltZSBwb3dlciBtYW5h
Z2VtZW50IikNCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+
IENjOiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4gQ2M6IFBoaWxp
cHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+DQo+IENjOiBCZW5qYW1pbiBHYWlnbmFy
ZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4NCj4gQ2M6IFZpbmNlbnQgQWJyaW91IDx2
aW5jZW50LmFicmlvdUBzdC5jb20+DQo+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5z
dG0zMkBnbWFpbC5jb20+DQo+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3Vl
QHN0LmNvbT4NCj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20NCj4gQ2M6IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiAtLS0NCj4gLS0tLS0tLS0tLS0tWyBjdXQgaGVy
ZSBdLS0tLS0tLS0tLS0tDQo+IFdBUk5JTkc6IENQVTogMCBQSUQ6IDI5NyBhdCBkcml2ZXJzL2dw
dS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYzoxNDk0IGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9y
X3ZibGFua3MrMHgxZGMvMHgyMDANCj4gW0NSVEM6MzU6Y3J0Yy0wXSB2Ymxhbmsgd2FpdCB0aW1l
ZCBvdXQNCj4gTW9kdWxlcyBsaW5rZWQgaW46DQo+IENQVTogMCBQSUQ6IDI5NyBDb21tOiBRU0dS
ZW5kZXJUaHJlYWQgTm90IHRhaW50ZWQgNS42LjAtcmMzLW5leHQtMjAyMDAyMjgtMDAwMTAtZzMx
OGJmMGZjMDhlZiAjMg0KPiBIYXJkd2FyZSBuYW1lOiBTVE0zMiAoRGV2aWNlIFRyZWUgU3VwcG9y
dCkNCj4gWzxjMDEwZjE4Yz5dICh1bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8YzAxMGFmYjg+XSAo
c2hvd19zdGFjaysweDEwLzB4MTQpDQo+IFs8YzAxMGFmYjg+XSAoc2hvd19zdGFjaykgZnJvbSBb
PGMwN2IxZDNjPl0gKGR1bXBfc3RhY2srMHhiNC8weGQwKQ0KPiBbPGMwN2IxZDNjPl0gKGR1bXBf
c3RhY2spIGZyb20gWzxjMDExZDhiOD5dIChfX3dhcm4rMHhkNC8weGYwKQ0KPiBbPGMwMTFkOGI4
Pl0gKF9fd2FybikgZnJvbSBbPGMwMTFkYzRjPl0gKHdhcm5fc2xvd3BhdGhfZm10KzB4NzgvMHhh
OCkNCj4gWzxjMDExZGM0Yz5dICh3YXJuX3Nsb3dwYXRoX2ZtdCkgZnJvbSBbPGMwNGEyNjZjPl0g
KGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX3ZibGFua3MrMHgxZGMvMHgyMDApDQo+IFs8YzA0
YTI2NmM+XSAoZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcykgZnJvbSBbPGMwNGE1
MTBjPl0gKGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsKzANCj4geDUwLzB4NjApDQo+IFs8
YzA0YTUxMGM+XSAoZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3RhaWwpIGZyb20gWzxjMDRhNTJh
OD5dIChjb21taXRfdGFpbCsweDEyYy8weDEzYykNCj4gWzxjMDRhNTJhOD5dIChjb21taXRfdGFp
bCkgZnJvbSBbPGMwNGE1M2I0Pl0gKGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCsweGY0LzB4MTAw
KQ0KPiBbPGMwNGE1M2I0Pl0gKGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCkgZnJvbSBbPGMwNGEy
ZDM4Pl0gKGRybV9hdG9taWNfaGVscGVyX3NldF9jb25maWcrMHg1OC8weDZjKQ0KPiBbPGMwNGEy
ZDM4Pl0gKGRybV9hdG9taWNfaGVscGVyX3NldF9jb25maWcpIGZyb20gWzxjMDRiMTk5ND5dIChk
cm1fbW9kZV9zZXRjcnRjKzB4NDUwLzB4NTUwKQ0KPiBbPGMwNGIxOTk0Pl0gKGRybV9tb2RlX3Nl
dGNydGMpIGZyb20gWzxjMDRhZDU3MD5dIChkcm1faW9jdGxfa2VybmVsKzB4OTAvMHhlOCkNCj4g
WzxjMDRhZDU3MD5dIChkcm1faW9jdGxfa2VybmVsKSBmcm9tIFs8YzA0YWQ4YWM+XSAoZHJtX2lv
Y3RsKzB4MmU0LzB4MzJjKQ0KPiBbPGMwNGFkOGFjPl0gKGRybV9pb2N0bCkgZnJvbSBbPGMwMjQ2
Nzg0Pl0gKHZmc19pb2N0bCsweDIwLzB4MzgpDQo+IFs8YzAyNDY3ODQ+XSAodmZzX2lvY3RsKSBm
cm9tIFs8YzAyNDcwZjA+XSAoa3N5c19pb2N0bCsweGJjLzB4N2IwKQ0KPiBbPGMwMjQ3MGYwPl0g
KGtzeXNfaW9jdGwpIGZyb20gWzxjMDEwMTAwMD5dIChyZXRfZmFzdF9zeXNjYWxsKzB4MC8weDU0
KQ0KPiBFeGNlcHRpb24gc3RhY2soMHhlZThmM2ZhOCB0byAweGVlOGYzZmYwKQ0KPiAzZmEwOiAg
ICAgICAgICAgICAgICAgICAwMDAwMDAwNSBhZGNiZWIxOCAwMDAwMDAwNSBjMDY4NjRhMiBhZGNi
ZWIxOCAwMDAwMDAwMQ0KPiAzZmMwOiAwMDAwMDAwNSBhZGNiZWIxOCBjMDY4NjRhMiAwMDAwMDAz
NiAwMDAwMDAyOSAwMDAwMDAyMyAwMDAwMDAyMyAwMDAwMDAwNw0KPiAzZmUwOiBiMTEzYjA5OCBh
ZGNiZWFmYyBiMTEyNTQxMyBiNjE1NWNmOA0KPiAtLS1bIGVuZCB0cmFjZSAyYWQ1YmE5NTRjZWI3
NjdhIF0tLS0NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAzICsrKw0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jDQo+
IGluZGV4IDk5YmY5M2U4YjM2Zi4uMzAxZGUwNDk4MDc4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vc3RtL2x0ZGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYw0K
PiBAQCAtNDI1LDkgKzQyNSwxMiBAQCBzdGF0aWMgdm9pZCBsdGRjX2NydGNfYXRvbWljX2VuYWJs
ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQo+ICAgCQkJCSAgICBzdHJ1Y3QgZHJtX2NydGNfc3Rh
dGUgKm9sZF9zdGF0ZSkNCj4gICB7DQo+ICAgCXN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGNy
dGNfdG9fbHRkYyhjcnRjKTsNCj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGNydGMtPmRl
djsNCj4gICANCj4gICAJRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsNCj4gICANCj4gKwlwbV9ydW50
aW1lX2dldF9zeW5jKGRkZXYtPmRldik7DQo+ICsNCj4gICAJLyogU2V0cyB0aGUgYmFja2dyb3Vu
ZCBjb2xvciB2YWx1ZSAqLw0KPiAgIAlyZWdfd3JpdGUobGRldi0+cmVncywgTFREQ19CQ0NSLCBC
Q0NSX0JDQkxBQ0spOw0KPiAgIA0KPiANCkhpIE1hcmVrLA0KTWFueSB0aGFua3MgZm9yIHlvdXIg
cGF0Y2gsDQpBY2tlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4N
ClRlc3RlZC1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCg0KDQpI
aSBCZW5qYW1pbiwNCkNvdWxkIHlvdSBwbGVhc2UgYXBwbHkgImRybS9zdG06IGx0ZGM6IHJlbW92
ZSBjYWxsIG9mIHBtLXJ1bnRpbWUgDQpmdW5jdGlvbnMiICoqYmVmb3JlKiogdGhpcyBvbmUuIFRo
YW5rIHlvdS4NCg0KUGhpbGlwcGUgOi0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
