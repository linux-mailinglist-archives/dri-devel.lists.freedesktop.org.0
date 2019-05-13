Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5711B4CF
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 13:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF38389121;
	Mon, 13 May 2019 11:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F2C89121
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 11:21:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4DBLgWo022861; Mon, 13 May 2019 13:21:46 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdkuyjn29-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 13 May 2019 13:21:46 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3850C38;
 Mon, 13 May 2019 11:21:45 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F3997251D;
 Mon, 13 May 2019 11:21:44 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 13 May
 2019 13:21:44 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Mon, 13 May 2019 13:21:44 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] drm/stm: dsi: add support of an optional regulator
Thread-Topic: [PATCH v2 2/3] drm/stm: dsi: add support of an optional regulator
Thread-Index: AQHVBzuGk3zmpKD8A0icC0w7qYlN5KZkZ1OAgARkxQA=
Date: Mon, 13 May 2019 11:21:44 +0000
Message-ID: <514ab93f-ba2e-2799-003d-2cb484079c56@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
 <1557498023-10766-3-git-send-email-yannick.fertre@st.com>
 <c1a7f401-a736-8145-2732-c7eea881ba37@st.com>
In-Reply-To: <c1a7f401-a736-8145-2732-c7eea881ba37@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <C6D2B85254CDA041933D86D36928C1F4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_06:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=P9tWVfi9RSlIQVe8Ynd+o6z/kHYnqlDcl6LI5kg1LGY=;
 b=S6e3ZJ5Dpc03Tsn3AqA/YorrChaKiZ5jrrsNiAYbSddeazLtyP7qZF67P3u/xPhfay4N
 48sNAltSCnIsFtU87TJ6mO+/ynY7Appv2AMgybE4R1fVzwFXhRwHI6hZ9rViq3+eUlwN
 +vbS/YShWCK7RIWWxkMlhd2ZvYXrwfHYUMfTwiD+h6E/C+dwDHrCSszM3i2fCzXK2U+t
 qynOTupoT8pRIisoxGlhr/iKk5p9avrOVnk7rAaHmshzvMoBcCwxAREU1S6A7UiYTcUm
 5jQxy0A7ikMrdGJu6BE2FE3PzRE6yqP9zCAyMwQGEuNKVyA9uc2wlkQJVzyaEK3QFOQS sA== 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

SGkgWWFubmljaywNCg0KDQpPbiA1LzEwLzE5IDY6MTYgUE0sIFBoaWxpcHBlIENvcm51IHdyb3Rl
Og0KPiBEZWFyIFlhbm5pY2ssDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaCwNCj4gDQo+IEkg
bGlrZSBiZXR0ZXIgdGhlIG5ldyBzaG9ydGVyIGNvbW1pdCBoZWFkaW5nLCB0aGFuayB5b3UuDQo+
IA0KPiANCj4gT24gNS8xMC8xOSA0OjIwIFBNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6DQo+PiBB
ZGQgc3VwcG9ydCBvZiBhbiBvcHRpb25hbCByZWd1bGF0b3IgZm9yIHRoZSBwaHkgcGFydCBvZiB0
aGUgRFNJDQo+PiBjb250cm9sbGVyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVy
dHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9k
cm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jIHwgNDUgDQo+PiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdf
bWlwaV9kc2ktc3RtLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3Rt
LmMNCj4+IGluZGV4IDFiZWY3M2UuLjIyYmQwOTUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3Rt
L2R3X21pcGlfZHNpLXN0bS5jDQo+PiBAQCAtOSw2ICs5LDcgQEANCj4+IMKgICNpbmNsdWRlIDxs
aW51eC9jbGsuaD4NCj4+IMKgICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4NCj4+IMKgICNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1
bWVyLmg+DQo+PiDCoCAjaW5jbHVkZSA8ZHJtL2RybVAuaD4NCj4+IMKgICNpbmNsdWRlIDxkcm0v
ZHJtX21pcGlfZHNpLmg+DQo+PiDCoCAjaW5jbHVkZSA8ZHJtL2JyaWRnZS9kd19taXBpX2RzaS5o
Pg0KPj4gQEAgLTc2LDYgKzc3LDcgQEAgc3RydWN0IGR3X21pcGlfZHNpX3N0bSB7DQo+PiDCoMKg
wqDCoMKgIHUzMiBod192ZXJzaW9uOw0KPj4gwqDCoMKgwqDCoCBpbnQgbGFuZV9taW5fa2JwczsN
Cj4+IMKgwqDCoMKgwqAgaW50IGxhbmVfbWF4X2ticHM7DQo+PiArwqDCoMKgIHN0cnVjdCByZWd1
bGF0b3IgKnZkZF9zdXBwbHk7DQo+PiDCoCB9Ow0KPj4gwqAgc3RhdGljIGlubGluZSB2b2lkIGRz
aV93cml0ZShzdHJ1Y3QgZHdfbWlwaV9kc2lfc3RtICpkc2ksIHUzMiByZWcsIA0KPj4gdTMyIHZh
bCkNCj4+IEBAIC0zMTgsMTcgKzMyMCwzMSBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3N0bV9w
cm9iZShzdHJ1Y3QgDQo+PiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIFBUUl9FUlIoZHNpLT5iYXNlKTsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gK8Kg
wqDCoCBkc2ktPnZkZF9zdXBwbHkgPSBkZXZtX3JlZ3VsYXRvcl9nZXRfb3B0aW9uYWwoZGV2LCAi
cGh5LWRzaSIpOw0KPj4gK8KgwqDCoCBpZiAoSVNfRVJSKGRzaS0+dmRkX3N1cHBseSkpIHsNCj4+
ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBQVFJfRVJSKGRzaS0+dmRkX3N1cHBseSk7DQo+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKQ0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgRFJNX0VSUk9SKCJmYWlsZWQgdG8gcmVxdWVzdCByZWd1bGF0b3I6ICVkXG4iLCBy
ZXQpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+PiArwqDCoMKgIH0NCg0KDQpJ
IGRpZCBtb3JlIHRlc3RzIG9uIGEgc3RtMzJmNDY5IGRpc2NvIGJvYXJkIGFuZCB0aGlzIGFib3Zl
IGNvZGUgZG9lcyBub3QgDQp3b3JrICh0aGUgcmV0IHZhbHVlIGlzIC1FTk9ERVYpDQoNClR3byBw
b3NzaWJpbGl0aWVzIHRoZW46DQoxKSByZW1vdmUgdGhlIF9vcHRpb25hbCAoYnV0IHdlIGhhdmUg
dGhlICJ1c2luZyBkdW1teSByZWd1bGF0b3IiIA0KbWVzc2FnZSwgSSBhbSBmaW5lIHdpdGggaXQp
DQoNCm9yDQoyKSBoYW5kbGUgLUVOT0RFViBidXQgZG8gbm90IGZvcmdldCB0byBjaGVjayB2ZGRf
c3VwcGx5IT1OVUxMIGJlZm9yZSANCmNhbGxpbmcgYWxsIHJlZ3VsYXRvcl8oZW5hYmxlL2Rpc2Fi
bGUpDQoNCglpZiAocmV0ICE9IC1FTk9ERVYpIHsNCgkJaWYgKHJldCAhPSAtRVBST0JFX0RFRkVS
KQ0KCQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gcmVxdWVzdCByZWd1bGF0b3I6ICVkXG4iLA0KCQkJ
CXJldCk7DQoJCQlyZXR1cm4gcmV0Ow0KCQl9DQoJCWRzaS0+dmRkX3N1cHBseSA9IE5VTEw7DQoJ
fQ0KDQoJaWYgKGRzaS0+dmRkX3N1cHBseSkgew0KCQlyZXQgPSByZWd1bGF0b3JfZW5hYmxlKGRz
aS0+dmRkX3N1cHBseSk7DQoJCS4uLg0KDQoNCglpZiAoZHNpLT52ZGRfc3VwcGx5KQ0KCQlyZWd1
bGF0b3JfZGlzYWJsZShkc2ktPnZkZF9zdXBwbHkpOw0KDQoNCkkgbGV0IHlvdSBjaG9vc2UgeW91
ciBmYXZvcml0ZSBvbmUuDQoNClRoYW5rIHlvdSwNClBoaWxpcHBlDQoNCj4+ICsNCj4+ICvCoMKg
wqAgcmV0ID0gcmVndWxhdG9yX2VuYWJsZShkc2ktPnZkZF9zdXBwbHkpOw0KPj4gK8KgwqDCoCBp
ZiAocmV0KSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgRFJNX0VSUk9SKCJmYWlsZWQgdG8gZW5hYmxl
IHJlZ3VsYXRvcjogJWRcbiIsIHJldCk7DQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsN
Cj4+ICvCoMKgwqAgfQ0KPj4gKw0KPj4gwqDCoMKgwqDCoCBkc2ktPnBsbHJlZl9jbGsgPSBkZXZt
X2Nsa19nZXQoZGV2LCAicmVmIik7DQo+PiDCoMKgwqDCoMKgIGlmIChJU19FUlIoZHNpLT5wbGxy
ZWZfY2xrKSkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IFBUUl9FUlIoZHNpLT5wbGxy
ZWZfY2xrKTsNCj4+IC3CoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIlVuYWJsZSB0byBnZXQg
cGxsIHJlZmVyZW5jZSBjbG9jazogJWRcbiIsIHJldCk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIHJldDsNCj4+ICvCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoIlVuYWJsZSB0byBnZXQgcGxs
IHJlZmVyZW5jZSBjbG9jazogJWRcbiIsIHJldCk7DQo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBl
cnJfY2xrX2dldDsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoCByZXQgPSBjbGtfcHJl
cGFyZV9lbmFibGUoZHNpLT5wbGxyZWZfY2xrKTsNCj4+IMKgwqDCoMKgwqAgaWYgKHJldCkgew0K
Pj4gLcKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiJXM6IEZhaWxlZCB0byBlbmFibGUgcGxs
cmVmX2Nsa1xuIiwgX19mdW5jX18pOw0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+
PiArwqDCoMKgwqDCoMKgwqAgRFJNX0VSUk9SKCIlczogRmFpbGVkIHRvIGVuYWJsZSBwbGxyZWZf
Y2xrXG4iLCBfX2Z1bmNfXyk7DQo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfY2xrX2dldDsN
Cj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoCBkd19taXBpX2RzaV9zdG1fcGxhdF9kYXRh
LmJhc2UgPSBkc2ktPmJhc2U7DQo+PiBAQCAtMzM5LDExICszNTUsMTkgQEAgc3RhdGljIGludCBk
d19taXBpX2RzaV9zdG1fcHJvYmUoc3RydWN0IA0KPj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
Pj4gwqDCoMKgwqDCoCBkc2ktPmRzaSA9IGR3X21pcGlfZHNpX3Byb2JlKHBkZXYsICZkd19taXBp
X2RzaV9zdG1fcGxhdF9kYXRhKTsNCj4+IMKgwqDCoMKgwqAgaWYgKElTX0VSUihkc2ktPmRzaSkp
IHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoIkZhaWxlZCB0byBpbml0aWFsaXpl
IG1pcGkgZHNpIGhvc3RcbiIpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJl
cGFyZShkc2ktPnBsbHJlZl9jbGspOw0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJS
KGRzaS0+ZHNpKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBQVFJfRVJSKGRzaS0+ZHNpKTsN
Cj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9kc2lfcHJvYmU7DQo+PiDCoMKgwqDCoMKgIH0N
Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiArDQo+PiArZXJyX2RzaV9wcm9iZToNCj4+ICvC
oMKgwqAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRzaS0+cGxscmVmX2Nsayk7DQo+PiArZXJyX2Ns
a19nZXQ6DQo+PiArwqDCoMKgIHJlZ3VsYXRvcl9kaXNhYmxlKGRzaS0+dmRkX3N1cHBseSk7DQo+
PiArDQo+PiArwqDCoMKgIHJldHVybiByZXQ7DQo+PiArDQo+PiDCoCB9DQo+PiDCoCBzdGF0aWMg
aW50IGR3X21pcGlfZHNpX3N0bV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4+IEBAIC0zNTEsNiArMzc1LDcgQEAgc3RhdGljIGludCBkd19taXBpX2RzaV9zdG1fcmVtb3Zl
KHN0cnVjdCANCj4+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+IMKgwqDCoMKgwqAgc3RydWN0
IGR3X21pcGlfZHNpX3N0bSAqZHNpID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+PiDC
oMKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkc2ktPnBsbHJlZl9jbGspOw0KPj4gK8Kg
wqDCoCByZWd1bGF0b3JfZGlzYWJsZShkc2ktPnZkZF9zdXBwbHkpOw0KPj4gwqDCoMKgwqDCoCBk
d19taXBpX2RzaV9yZW1vdmUoZHNpLT5kc2kpOw0KPiANCj4gZm9yIGEgZnV0dXJlIHBhdGNoOiB3
ZSBtYXkgaGF2ZSBhIGRpZmZlcmVudCBvcmRlcg0KPiAgwqDCoMKgwqBkd19taXBpX2RzaV9yZW1v
dmUoZHNpLT5kc2kpOw0KPiAgwqDCoMKgwqBjbGtfZGlzYWJsZV91bnByZXBhcmUoZHNpLT5wbGxy
ZWZfY2xrKTsNCj4gIMKgwqDCoMKgcmVndWxhdG9yX2Rpc2FibGUoZHNpLT52ZGRfc3VwcGx5KTsN
Cj4gDQo+PiDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4gQEAgLTM2Myw2ICszODgsNyBAQCBzdGF0
aWMgaW50IF9fbWF5YmVfdW51c2VkIA0KPj4gZHdfbWlwaV9kc2lfc3RtX3N1c3BlbmQoc3RydWN0
IGRldmljZSAqZGV2KQ0KPj4gwqDCoMKgwqDCoCBEUk1fREVCVUdfRFJJVkVSKCJcbiIpOw0KPj4g
wqDCoMKgwqDCoCBjbGtfZGlzYWJsZV91bnByZXBhcmUoZHNpLT5wbGxyZWZfY2xrKTsNCj4+ICvC
oMKgwqAgcmVndWxhdG9yX2Rpc2FibGUoZHNpLT52ZGRfc3VwcGx5KTsNCj4+IMKgwqDCoMKgwqAg
cmV0dXJuIDA7DQo+PiDCoCB9DQo+PiBAQCAtMzcwLDkgKzM5NiwxNiBAQCBzdGF0aWMgaW50IF9f
bWF5YmVfdW51c2VkIA0KPj4gZHdfbWlwaV9kc2lfc3RtX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KQ0KPj4gwqAgc3RhdGljIGludCBfX21heWJlX3VudWR3X21pcGlfZHNpX3JlbW92ZShkc2kt
PmRzaSk7c2VkIA0KPj4gZHdfbWlwaV9kc2lfc3RtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYp
DQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkd19taXBpX2RzaV9zdG0gKmRzaSA9IGR3
X21pcGlfZHNpX3N0bV9wbGF0X2RhdGEucHJpdl9kYXRhOw0KPj4gK8KgwqDCoCBpbnQgcmV0Ow0K
Pj4gwqDCoMKgwqDCoCBEUk1fREVCVUdfRFJJVkVSKCJcbiIpOw0KPj4gK8KgwqDCoCByZXQgPSBy
ZWd1bGF0b3JfZW5hYmxlKGRzaS0+dmRkX3N1cHBseSk7DQo+PiArwqDCoMKgIGlmIChyZXQpIHsN
Cj4+ICvCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoImZhaWxlZCB0byBlbmFibGUgcmVndWxhdG9y
OiAlZFxuIiwgcmV0KTsNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4gK8KgwqDC
oCB9DQo+PiArDQo+PiDCoMKgwqDCoMKgIGNsa19wcmVwYXJlX2VuYWJsZShkc2ktPnBsbHJlZl9j
bGspOw0KPiANCj4gZm9yIGEgZnV0dXJlIHBhdGNoOiB3ZSBtYXkgY2hlY2sgY2xrX3ByZXBhcmVf
ZW5hYmxlIHJldHVybiB2YWx1ZS4NCj4gDQo+PiDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4NCj4g
DQo+IA0KPiBBY2tlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4N
Cj4gDQo+IFBoaWxpcHBlIDopDQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
