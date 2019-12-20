Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A0212800F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 16:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCB46E02F;
	Fri, 20 Dec 2019 15:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677AB6E02F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 15:52:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBKFWf55010734; Fri, 20 Dec 2019 16:52:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pENKoiwULbvq0hyKA8Hp9Enyt4zTdRxz5UBuiMV9jFc=;
 b=UHfzswet2gzNY4uzxk/g2FXQAptquafgM85m3epKpBAFJG5KXo+VgZvxPS8P778zyr+M
 2SRvDIXKDzLHpZvQQIQ7QrlNUE+MJpMDBg8MDlaaZFWzsguM6+IUagw+pJYMb5a1AtXr
 sylp+jpR+GOAe9awluR0WoDUbnqrKZNw4IxLl3w8pYP5VN9YzWwzTj2/HYdP58J1aK4N
 Su4NKVhJpsDwoa71KQNNlJwiMxDP3lJrw/VFRGouNDZbmTfxrVdyCf7q1SeKbWMnBc3s
 94xAmVfLBf35WA9NDMKchSeNMvs8PnsABlc1g6d18dmNRgz1SJ52nHX+9PfwEBzfTkT8 UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wvqgq7s0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Dec 2019 16:52:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69E97100034;
 Fri, 20 Dec 2019 16:52:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 50EC22B9523;
 Fri, 20 Dec 2019 16:52:48 +0100 (CET)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Dec
 2019 16:52:47 +0100
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Fri, 20 Dec 2019 16:52:47 +0100
From: Yannick FERTRE <yannick.fertre@st.com>
To: Heiko Stuebner <heiko@sntech.de>, "a.hajda@samsung.com"
 <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/bridge/synopsys: dsi: use mipi_dsi_device to find
 panel or bridge
Thread-Topic: [PATCH] drm/bridge/synopsys: dsi: use mipi_dsi_device to find
 panel or bridge
Thread-Index: AQHVtSs8ndhlVqaLakG+k5PK7fogYKfDH/KA
Date: Fri, 20 Dec 2019 15:52:47 +0000
Message-ID: <00359841-35ab-e1bb-5750-fe83f81aeef0@st.com>
References: <20191217224150.20540-1-heiko@sntech.de>
In-Reply-To: <20191217224150.20540-1-heiko@sntech.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <0AA86CA051B8C04B944D6A886357E6B9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-20_03:2019-12-17,2019-12-20 signatures=0
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
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>, Heiko
 Stuebner <heiko.stuebner@theobroma-systems.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "christoph.muellner@theobroma-systems.com"
 <christoph.muellner@theobroma-systems.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gSGVpa28sDQpJIHRlc3Qgd2l0aCBzdWNjZXNzIHlvdXIgcGF0Y2ggb24gYSBib2FyZCBz
dG0zMm1wMSB3aXRoIGEgcGFuZWwgcmF5ZGl1bSANCnJtNjgyMDAuDQpJIG5lZWQgbW9yZSB0aW1l
IHRvIHRlc3Qgd2l0aCBhIEhETUkgYnJpZGdlwqAgbGlrZSBhZDc1MzMuDQoNCkJlc3QgcmVnYXJk
cw0KDQpZYW5uaWNrIEZlcnRyw6kNCg0KDQoNCk9uIDEyLzE3LzE5IDExOjQxIFBNLCBIZWlrbyBT
dHVlYm5lciB3cm90ZToNCj4gRnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHRo
ZW9icm9tYS1zeXN0ZW1zLmNvbT4NCj4NCj4gUmlnaHQgbm93IHRoZSBkc2kgZHJpdmVyIHVzZXMg
ZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCkgdG8gZmluZCBhDQo+IGNvbm5lY3RlZCBwYW5l
bCBvciBicmlkZ2UuIEJ1dCB0aGlzIHJlcXVpcmVzIGFuIG9mLWdyYXBoIGNvbm5lY3Rpb24NCj4g
YmV0d2VlbiB0aGUgZHNpLWhvc3QgYW5kIGRzaS1kZXZpY2UsIHdoZXJlIG5vcm1hbCBiaW5kaW5n
cyBmb3IgcmVndWxhcg0KPiBwYW5lbHMganVzdCBleHBlY3QgdGhlIGRzaSBkZXZpY2UgdG8gYmUg
YSBzdWJub2RlIG9mIHRoZSBhY3R1YWwgZHNpIGhvc3QNCj4gbm90IHJlcXVpcmluZyBwb3J0cy4N
Cj4NCj4gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlIGlzIHVzZWQgdG8gZmluZCBwYW5lbC9i
cmlkZ2UgdW5kZXIgdGhlIGFjdHVhbA0KPiBkZXZpY2Utbm9kZSBvZiB0aGUgZHNpIGRldmljZSwg
YnV0IGFzIHRoaXMgaGFwcGVucyBpbiB0aGUgZHNpX2hvc3RfYXR0YWNoDQo+IGNhbGxiYWNrIHdl
IGFscmVhZHkgaGF2ZSB0aGUgZHNpLWRldmljZSBhbmQgaXRzIGRldmljZS1ub2RlIGF2YWlsYWJs
ZSBhbmQNCj4gdGhlcmVmb3JlIGNhbiBqdXN0IGNhbGwgdGhlIHJlbGV2YW50IHBhbmVsK2JyaWRn
ZSBmdW5jdGlvbnMgb3Vyc2VsZiwNCj4gbWFraW5nIGl0IHdvcmsgYXMgd2VsbCBpbiBzZXR1cHMg
d2l0aG91dCBwb3J0LWNvbm5lY3Rpb25zLg0KPg0KPiBUZXN0ZWQgb24gYSBSb2NrY2hpcCBweDMw
IHNpbmdsZS1kc2kgd2l0aCBwYW5lbHMgZm9ybSBMZWFkdGVrIGFuZCBYaW5wZW5nDQo+IGFzIHdl
bGwgb24gR3J1LVNjYXJsZXQgKHJrMzM5OSkgd2l0aCBkdWFsLWRzaSAoYW5kIHRodXMgcG9ydC1j
b25uZWN0aW9ucw0KPiB0byBib3RoIGRzaSBjb250cm9sbGVycykgY29ubmVjdGVkIHRvIHRoZSBJ
bm5vdGVrIGRpc3BsYXkgdmFyaWFudC4NCj4NCj4gY2hhbmdlcyBpbiB2MjoNCj4gLSByZXdvcmsg
Y29tbWl0IG1lc3NhZ2UsIHJlcmVhZGluZyB3aGF0IEkgaGFkIHdyaXR0ZW4gd2FzIGp1c3QgdG9v
DQo+ICAgIGNyaW5nZS13b3J0aHkgOy0pDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVi
bmVyIDxoZWlrby5zdHVlYm5lckB0aGVvYnJvbWEtc3lzdGVtcy5jb20+DQo+IC0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8IDE3ICsrKysrKysr
KystLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LW1pcGktZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGkt
ZHNpLmMNCj4gaW5kZXggOTgxZDUzMmNkZDU5Li40YjQ5NjFlN2M2ODAgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMNCj4gQEAgLTI2LDYg
KzI2LDcgQEANCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9taXBpX2RzaS5oPg0KPiAgICNpbmNsdWRl
IDxkcm0vZHJtX21vZGVzLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fb2YuaD4NCj4gKyNpbmNs
dWRlIDxkcm0vZHJtX3BhbmVsLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4NCj4g
ICAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4NCj4gICANCj4gQEAgLTMxMCwxNiAr
MzExLDE2IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfaG9zdF9hdHRhY2goc3RydWN0IG1pcGlf
ZHNpX2hvc3QgKmhvc3QsDQo+ICAgCWRzaS0+Zm9ybWF0ID0gZGV2aWNlLT5mb3JtYXQ7DQo+ICAg
CWRzaS0+bW9kZV9mbGFncyA9IGRldmljZS0+bW9kZV9mbGFnczsNCj4gICANCj4gLQlyZXQgPSBk
cm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoaG9zdC0+ZGV2LT5vZl9ub2RlLCAxLCAwLA0KPiAt
CQkJCQkgICZwYW5lbCwgJmJyaWRnZSk7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJldDsN
Cj4gLQ0KPiAtCWlmIChwYW5lbCkgew0KPiArCXBhbmVsID0gb2ZfZHJtX2ZpbmRfcGFuZWwoZGV2
aWNlLT5kZXYub2Zfbm9kZSk7DQo+ICsJaWYgKCFJU19FUlIocGFuZWwpKSB7DQo+ICAgCQlicmlk
Z2UgPSBkcm1fcGFuZWxfYnJpZGdlX2FkZF90eXBlZChwYW5lbCwNCj4gICAJCQkJCQkgICAgRFJN
X01PREVfQ09OTkVDVE9SX0RTSSk7DQo+ICAgCQlpZiAoSVNfRVJSKGJyaWRnZSkpDQo+ICAgCQkJ
cmV0dXJuIFBUUl9FUlIoYnJpZGdlKTsNCj4gKwl9IGVsc2Ugew0KPiArCQlicmlkZ2UgPSBvZl9k
cm1fZmluZF9icmlkZ2UoZGV2aWNlLT5kZXYub2Zfbm9kZSk7DQo+ICsJCWlmICghYnJpZGdlKQ0K
PiArCQkJcmV0dXJuIC1FUFJPQkVfREVGRVI7DQo+ICAgCX0NCj4gICANCj4gICAJZHNpLT5wYW5l
bF9icmlkZ2UgPSBicmlkZ2U7DQo+IEBAIC0zNDAsNiArMzQxLDcgQEAgc3RhdGljIGludCBkd19t
aXBpX2RzaV9ob3N0X2RldGFjaChzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdCwNCj4gICB7DQo+
ICAgCXN0cnVjdCBkd19taXBpX2RzaSAqZHNpID0gaG9zdF90b19kc2koaG9zdCk7DQo+ICAgCWNv
bnN0IHN0cnVjdCBkd19taXBpX2RzaV9wbGF0X2RhdGEgKnBkYXRhID0gZHNpLT5wbGF0X2RhdGE7
DQo+ICsJc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsNCj4gICAJaW50IHJldDsNCj4gICANCj4g
ICAJaWYgKHBkYXRhLT5ob3N0X29wcyAmJiBwZGF0YS0+aG9zdF9vcHMtPmRldGFjaCkgew0KPiBA
QCAtMzQ4LDcgKzM1MCw4IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfaG9zdF9kZXRhY2goc3Ry
dWN0IG1pcGlfZHNpX2hvc3QgKmhvc3QsDQo+ICAgCQkJcmV0dXJuIHJldDsNCj4gICAJfQ0KPiAg
IA0KPiAtCWRybV9vZl9wYW5lbF9icmlkZ2VfcmVtb3ZlKGhvc3QtPmRldi0+b2Zfbm9kZSwgMSwg
MCk7DQo+ICsJYnJpZGdlID0gb2ZfZHJtX2ZpbmRfYnJpZGdlKGRldmljZS0+ZGV2Lm9mX25vZGUp
Ow0KPiArCWRybV9wYW5lbF9icmlkZ2VfcmVtb3ZlKGJyaWRnZSk7DQo+ICAgDQo+ICAgCWRybV9i
cmlkZ2VfcmVtb3ZlKCZkc2ktPmJyaWRnZSk7DQo+ICAgDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
