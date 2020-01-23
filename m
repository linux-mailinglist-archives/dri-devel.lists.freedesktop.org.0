Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B47146546
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 11:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909CA6FB9A;
	Thu, 23 Jan 2020 10:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883E46FB9A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 10:01:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00N9lii0016829; Thu, 23 Jan 2020 10:51:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=T/YIP5KOKmJo3u1A5u+SESxGEriYvHw0pRGBTv6flAk=;
 b=laMMUSlIWfAE1t5I5o3iea7f3hUgQkBSEYiUi5Y++30PQZT+Mn3BPUdE8cJp78DeHfOh
 aa16hHUaBJmDwCsXm5B2M+4hboHBJXvEfNgblAvtCvYZe2ApcisW6pxbrl06ivAK4Yy0
 YlktQjLFGlGCBt3w7b6/nug5VQNJU0nO09J/QKaIYDqrAJGbpJuTuaKgHB2uVPW2h1Yb
 +4jx1RCRVqpqS0V4OSi7+apYRY3RKo3yyfmFc5wHc26PXc+HkJTcqhuNymC3O7JVM/LR
 H7gkobcItIxbvLLKbIcSoftBd4ffHav+oVEwJE5Satg7DTAdTYZCT1+oenks2Bvce2uu XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkssp96dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 10:51:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C0BD10003E;
 Thu, 23 Jan 2020 10:51:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7CC04220301;
 Thu, 23 Jan 2020 10:51:30 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jan
 2020 10:51:30 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 23 Jan 2020 10:51:30 +0100
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 TORGUE" <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/stm: ltdc: check number of endpoints
Thread-Topic: [PATCH] drm/stm: ltdc: check number of endpoints
Thread-Index: AQHV0EOURSMjvZYjaE6ExH6tBTGDg6f39BOA
Date: Thu, 23 Jan 2020 09:51:30 +0000
Message-ID: <882271f1-5b91-f4c9-4619-fbdb70a32a46@st.com>
References: <1579601673-7111-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1579601673-7111-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <78E917FBF0C3A942BCC416B14FFBCC3E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_01:2020-01-23,
 2020-01-22 signatures=0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVhciBZYW5uaWNrLA0KVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLA0KDQpBY2tlZC1ieTogUGhp
bGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4NCg0KUGhpbGlwcGUgOi0pDQoNCk9u
IDEvMjEvMjAgMTE6MTQgQU0sIFlhbm5pY2sgRmVydHJlIHdyb3RlOg0KPiBOdW1iZXIgb2YgZW5k
cG9pbnRzIGNvdWxkIGV4Y2VlZCB0aGUgZml4IHZhbHVlIE1BWF9FTkRQT0lOVFMoMikuDQo+IElu
c3RlYWQgb2YgaW5jcmVhc2Ugc2ltcGx5IHRoaXMgdmFsdWUsIHRoZSBudW1iZXIgb2YgZW5kcG9p
bnQNCj4gY291bGQgYmUgcmVhZCBmcm9tIGRldmljZSB0cmVlLiBMb2FkIHNlcXVlbmNlIGhhcyBi
ZWVuIGEgbGl0dGxlDQo+IHJld29yayB0byB0YWtlIGNhcmUgb2Ygc2V2ZXJhbCBwYW5lbCBvciBi
cmlkZ2Ugd2hpY2ggY2FuIGJlDQo+IGNvbm5lY3RlZC9kaXNjb25uZWN0ZWQgb3IgZW5hYmxlL2Rp
c2FibGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVy
dHJlQHN0LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAxMDQg
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDUyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9s
dGRjLmMNCj4gaW5kZXggYzI4MTVlOC4uZGJhOGU3ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMNCj4g
QEAgLTQyLDggKzQyLDYgQEANCj4gICANCj4gICAjZGVmaW5lIE1BWF9JUlEgNA0KPiAgIA0KPiAt
I2RlZmluZSBNQVhfRU5EUE9JTlRTIDINCj4gLQ0KPiAgICNkZWZpbmUgSFdWRVJfMTAyMDAgMHgw
MTAyMDANCj4gICAjZGVmaW5lIEhXVkVSXzEwMzAwIDB4MDEwMzAwDQo+ICAgI2RlZmluZSBIV1ZF
Ul8yMDEwMSAweDAyMDEwMQ0KPiBAQCAtMTE5MCwzNiArMTE4OCwyMCBAQCBpbnQgbHRkY19sb2Fk
KHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQ0KPiAgIAlzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYg
PSBkZGV2LT5kZXZfcHJpdmF0ZTsNCj4gICAJc3RydWN0IGRldmljZSAqZGV2ID0gZGRldi0+ZGV2
Ow0KPiAgIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOw0KPiAtCXN0cnVj
dCBkcm1fYnJpZGdlICpicmlkZ2VbTUFYX0VORFBPSU5UU10gPSB7TlVMTH07DQo+IC0Jc3RydWN0
IGRybV9wYW5lbCAqcGFuZWxbTUFYX0VORFBPSU5UU10gPSB7TlVMTH07DQo+ICsJc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZTsNCj4gKwlzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbDsNCj4gICAJc3Ry
dWN0IGRybV9jcnRjICpjcnRjOw0KPiAgIAlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0YzsNCj4g
ICAJc3RydWN0IHJlc291cmNlICpyZXM7DQo+IC0JaW50IGlycSwgcmV0LCBpLCBlbmRwb2ludF9u
b3RfcmVhZHkgPSAtRU5PREVWOw0KPiArCWludCBpcnEsIGksIG5iX2VuZHBvaW50czsNCj4gKwlp
bnQgcmV0ID0gLUVOT0RFVjsNCj4gICANCj4gICAJRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsNCj4g
ICANCj4gLQkvKiBHZXQgZW5kcG9pbnRzIGlmIGFueSAqLw0KPiAtCWZvciAoaSA9IDA7IGkgPCBN
QVhfRU5EUE9JTlRTOyBpKyspIHsNCj4gLQkJcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJp
ZGdlKG5wLCAwLCBpLCAmcGFuZWxbaV0sDQo+IC0JCQkJCQkgICZicmlkZ2VbaV0pOw0KPiAtDQo+
IC0JCS8qDQo+IC0JCSAqIElmIGF0IGxlYXN0IG9uZSBlbmRwb2ludCBpcyAtRVBST0JFX0RFRkVS
LCBkZWZlciBwcm9iaW5nLA0KPiAtCQkgKiBlbHNlIGlmIGF0IGxlYXN0IG9uZSBlbmRwb2ludCBp
cyByZWFkeSwgY29udGludWUgcHJvYmluZy4NCj4gLQkJICovDQo+IC0JCWlmIChyZXQgPT0gLUVQ
Uk9CRV9ERUZFUikNCj4gLQkJCXJldHVybiByZXQ7DQo+IC0JCWVsc2UgaWYgKCFyZXQpDQo+IC0J
CQllbmRwb2ludF9ub3RfcmVhZHkgPSAwOw0KPiAtCX0NCj4gLQ0KPiAtCWlmIChlbmRwb2ludF9u
b3RfcmVhZHkpDQo+IC0JCXJldHVybiBlbmRwb2ludF9ub3RfcmVhZHk7DQo+IC0NCj4gLQlyc3Rj
ID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNpdmUoZGV2LCBOVUxMKTsNCj4gLQ0KPiAt
CW11dGV4X2luaXQoJmxkZXYtPmVycl9sb2NrKTsNCj4gKwkvKiBHZXQgbnVtYmVyIG9mIGVuZHBv
aW50cyAqLw0KPiArCW5iX2VuZHBvaW50cyA9IG9mX2dyYXBoX2dldF9lbmRwb2ludF9jb3VudChu
cCk7DQo+ICsJaWYgKCFuYl9lbmRwb2ludHMpDQo+ICsJCXJldHVybiAtRU5PREVWOw0KPiAgIA0K
PiAgIAlsZGV2LT5waXhlbF9jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAibGNkIik7DQo+ICAgCWlm
IChJU19FUlIobGRldi0+cGl4ZWxfY2xrKSkgew0KPiBAQCAtMTIzMyw2ICsxMjE1LDQzIEBAIGlu
dCBsdGRjX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYpDQo+ICAgCQlyZXR1cm4gLUVOT0RF
VjsNCj4gICAJfQ0KPiAgIA0KPiArCS8qIEdldCBlbmRwb2ludHMgaWYgYW55ICovDQo+ICsJZm9y
IChpID0gMDsgaSA8IG5iX2VuZHBvaW50czsgaSsrKSB7DQo+ICsJCXJldCA9IGRybV9vZl9maW5k
X3BhbmVsX29yX2JyaWRnZShucCwgMCwgaSwgJnBhbmVsLCAmYnJpZGdlKTsNCj4gKw0KPiArCQkv
Kg0KPiArCQkgKiBJZiBhdCBsZWFzdCBvbmUgZW5kcG9pbnQgaXMgLUVOT0RFViwgY29udGludWUg
cHJvYmluZywNCj4gKwkJICogZWxzZSBpZiBhdCBsZWFzdCBvbmUgZW5kcG9pbnQgcmV0dXJuZWQg
YW4gZXJyb3INCj4gKwkJICogKGllIC1FUFJPQkVfREVGRVIpIHRoZW4gc3RvcCBwcm9iaW5nLg0K
PiArCQkgKi8NCj4gKwkJaWYgKHJldCA9PSAtRU5PREVWKQ0KPiArCQkJY29udGludWU7DQo+ICsJ
CWVsc2UgaWYgKHJldCkNCj4gKwkJCWdvdG8gZXJyOw0KPiArDQo+ICsJCWlmIChwYW5lbCkgew0K
PiArCQkJYnJpZGdlID0gZHJtX3BhbmVsX2JyaWRnZV9hZGRfdHlwZWQocGFuZWwsDQo+ICsJCQkJ
CQkJICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9EUEkpOw0KPiArCQkJaWYgKElTX0VSUihicmlkZ2Up
KSB7DQo+ICsJCQkJRFJNX0VSUk9SKCJwYW5lbC1icmlkZ2UgZW5kcG9pbnQgJWRcbiIsIGkpOw0K
PiArCQkJCXJldCA9IFBUUl9FUlIoYnJpZGdlKTsNCj4gKwkJCQlnb3RvIGVycjsNCj4gKwkJCX0N
Cj4gKwkJfQ0KPiArDQo+ICsJCWlmIChicmlkZ2UpIHsNCj4gKwkJCXJldCA9IGx0ZGNfZW5jb2Rl
cl9pbml0KGRkZXYsIGJyaWRnZSk7DQo+ICsJCQlpZiAocmV0KSB7DQo+ICsJCQkJRFJNX0VSUk9S
KCJpbml0IGVuY29kZXIgZW5kcG9pbnQgJWRcbiIsIGkpOw0KPiArCQkJCWdvdG8gZXJyOw0KPiAr
CQkJfQ0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJcnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9n
ZXRfZXhjbHVzaXZlKGRldiwgTlVMTCk7DQo+ICsNCj4gKwltdXRleF9pbml0KCZsZGV2LT5lcnJf
bG9jayk7DQo+ICsNCj4gICAJaWYgKCFJU19FUlIocnN0YykpIHsNCj4gICAJCXJlc2V0X2NvbnRy
b2xfYXNzZXJ0KHJzdGMpOw0KPiAgIAkJdXNsZWVwX3JhbmdlKDEwLCAyMCk7DQo+IEBAIC0xMjY4
LDcgKzEyODcsNiBAQCBpbnQgbHRkY19sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQ0KPiAg
IAkJfQ0KPiAgIAl9DQo+ICAgDQo+IC0NCj4gICAJcmV0ID0gbHRkY19nZXRfY2FwcyhkZGV2KTsN
Cj4gICAJaWYgKHJldCkgew0KPiAgIAkJRFJNX0VSUk9SKCJoYXJkd2FyZSBpZGVudGlmaWVyICgw
eCUwOHgpIG5vdCBzdXBwb3J0ZWQhXG4iLA0KPiBAQCAtMTI3OCwyNyArMTI5Niw2IEBAIGludCBs
dGRjX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYpDQo+ICAgDQo+ICAgCURSTV9ERUJVR19E
UklWRVIoImx0ZGMgaHcgdmVyc2lvbiAweCUwOHhcbiIsIGxkZXYtPmNhcHMuaHdfdmVyc2lvbik7
DQo+ICAgDQo+IC0JLyogQWRkIGVuZHBvaW50cyBwYW5lbHMgb3IgYnJpZGdlcyBpZiBhbnkgKi8N
Cj4gLQlmb3IgKGkgPSAwOyBpIDwgTUFYX0VORFBPSU5UUzsgaSsrKSB7DQo+IC0JCWlmIChwYW5l
bFtpXSkgew0KPiAtCQkJYnJpZGdlW2ldID0gZHJtX3BhbmVsX2JyaWRnZV9hZGRfdHlwZWQocGFu
ZWxbaV0sDQo+IC0JCQkJCQkJICAgICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9EUEkpOw0KPiAtCQkJ
aWYgKElTX0VSUihicmlkZ2VbaV0pKSB7DQo+IC0JCQkJRFJNX0VSUk9SKCJwYW5lbC1icmlkZ2Ug
ZW5kcG9pbnQgJWRcbiIsIGkpOw0KPiAtCQkJCXJldCA9IFBUUl9FUlIoYnJpZGdlW2ldKTsNCj4g
LQkJCQlnb3RvIGVycjsNCj4gLQkJCX0NCj4gLQkJfQ0KPiAtDQo+IC0JCWlmIChicmlkZ2VbaV0p
IHsNCj4gLQkJCXJldCA9IGx0ZGNfZW5jb2Rlcl9pbml0KGRkZXYsIGJyaWRnZVtpXSk7DQo+IC0J
CQlpZiAocmV0KSB7DQo+IC0JCQkJRFJNX0VSUk9SKCJpbml0IGVuY29kZXIgZW5kcG9pbnQgJWRc
biIsIGkpOw0KPiAtCQkJCWdvdG8gZXJyOw0KPiAtCQkJfQ0KPiAtCQl9DQo+IC0JfQ0KPiAtDQo+
ICAgCWNydGMgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmNydGMpLCBHRlBfS0VSTkVMKTsN
Cj4gICAJaWYgKCFjcnRjKSB7DQo+ICAgCQlEUk1fRVJST1IoIkZhaWxlZCB0byBhbGxvY2F0ZSBj
cnRjXG4iKTsNCj4gQEAgLTEzMzEsOCArMTMyOCw4IEBAIGludCBsdGRjX2xvYWQoc3RydWN0IGRy
bV9kZXZpY2UgKmRkZXYpDQo+ICAgDQo+ICAgCXJldHVybiAwOw0KPiAgIGVycjoNCj4gLQlmb3Ig
KGkgPSAwOyBpIDwgTUFYX0VORFBPSU5UUzsgaSsrKQ0KPiAtCQlkcm1fcGFuZWxfYnJpZGdlX3Jl
bW92ZShicmlkZ2VbaV0pOw0KPiArCWZvciAoaSA9IDA7IGkgPCBuYl9lbmRwb2ludHM7IGkrKykN
Cj4gKwkJZHJtX29mX3BhbmVsX2JyaWRnZV9yZW1vdmUoZGRldi0+ZGV2LT5vZl9ub2RlLCAwLCBp
KTsNCj4gICANCj4gICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGxkZXYtPnBpeGVsX2Nsayk7DQo+
ICAgDQo+IEBAIC0xMzQxLDExICsxMzM4LDE0IEBAIGludCBsdGRjX2xvYWQoc3RydWN0IGRybV9k
ZXZpY2UgKmRkZXYpDQo+ICAgDQo+ICAgdm9pZCBsdGRjX3VubG9hZChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGRldikNCj4gICB7DQo+IC0JaW50IGk7DQo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gZGRl
di0+ZGV2Ow0KPiArCWludCBuYl9lbmRwb2ludHMsIGk7DQo+ICAgDQo+ICAgCURSTV9ERUJVR19E
UklWRVIoIlxuIik7DQo+ICAgDQo+IC0JZm9yIChpID0gMDsgaSA8IE1BWF9FTkRQT0lOVFM7IGkr
KykNCj4gKwluYl9lbmRwb2ludHMgPSBvZl9ncmFwaF9nZXRfZW5kcG9pbnRfY291bnQoZGV2LT5v
Zl9ub2RlKTsNCj4gKw0KPiArCWZvciAoaSA9IDA7IGkgPCBuYl9lbmRwb2ludHM7IGkrKykNCj4g
ICAJCWRybV9vZl9wYW5lbF9icmlkZ2VfcmVtb3ZlKGRkZXYtPmRldi0+b2Zfbm9kZSwgMCwgaSk7
DQo+ICAgDQo+ICAgCXBtX3J1bnRpbWVfZGlzYWJsZShkZGV2LT5kZXYpOw0KPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
