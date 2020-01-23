Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95AA146547
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 11:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6395F6FB9D;
	Thu, 23 Jan 2020 10:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4886FB9D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 10:01:46 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00N9gOWP010714; Thu, 23 Jan 2020 10:47:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Ee7JMj7P+X5t7prD9iCwmR1WOo33+7cFo6FcbCsMCJ0=;
 b=xQPBD8LpTOT3PNBUf9BdGOqZAV3UF1PoCJjUGHSieHQPAoqmwsc9NSJ09hrN/siaw+Yj
 cvg3bXXIFO1ezQGu+UfKjh/8d6f2x3EH7kl2LhznyFzcy/5+MIvfke8WWTRL2nW1cehf
 cQg81nOJP5brp/pkBlgOkaP67YZh/itlOkoxZWCHf8J5rMRenMnimT68swHzJ83XKEFJ
 r3okRzqD/hT5Fm8XFBdEsaKIVeA/TddOWI4FVKvHPJut9XFLAP5qKzcaOh21TI+QOjl+
 I4cLR9WHfTpCZKbkEiopp5uJk3wQKEN0P+4xsLzu+6OpPXw3+vBHqQYPgDcggn81JawK iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrp2hdt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 10:47:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D39B610002A;
 Thu, 23 Jan 2020 10:47:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97F9121FEBF;
 Thu, 23 Jan 2020 10:47:22 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jan
 2020 10:47:22 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 23 Jan 2020 10:47:22 +0100
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
Subject: Re: [PATCH] drm/stm: ltdc: enable/disable depends on encoder
Thread-Topic: [PATCH] drm/stm: ltdc: enable/disable depends on encoder
Thread-Index: AQHVz5gWDqh+tSb29kCN+B0hu2GdDKf39EOA
Date: Thu, 23 Jan 2020 09:47:22 +0000
Message-ID: <69cced11-c30a-da6c-0465-79b632901b62@st.com>
References: <1579528013-28445-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1579528013-28445-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <752BB9EC20A560488E65BA0D876A022B@st.com>
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
IDEvMjAvMjAgMjo0NiBQTSwgWWFubmljayBGZXJ0cmUgd3JvdGU6DQo+IEZyb206IFlhbm5pY2sg
RmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KPiANCj4gV2hlbiBjb25uZWN0ZWQgdG8g
YSBkc2kgaG9zdCwgdGhlIGx0ZGMgZGlzcGxheSBjb250cm9sbGVyDQo+IG11c3Qgc2VuZCBmcmFt
ZXMgb25seSBhZnRlciB0aGUgZW5kIG9mIHRoZSBkc2kgcGFuZWwNCj4gaW5pdGlhbGl6YXRpb24g
dG8gYXZvaWQgZXJyb3JzIHdoZW4gdGhlIGRzaSBob3N0IHNlbmRzDQo+IGNvbW1hbmRzIHRvIHRo
ZSBkc2kgcGFuZWwgKGRzaSBweCBmaWZvIGZ1bGwpLg0KPiBUbyBhdm9pZCB0aGlzIGlzc3VlLCB0
aGUgZGlzcGxheSBjb250cm9sbGVyIG11c3QgYmUNCj4gZW5hYmxlZC9kaXNhYmxlZCB3aGVuIHRo
ZSBlbmNvZGVyIGlzIGVuYWJsZWQvZGlzYWJsZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5u
aWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmMgfCAxNCArKysrKysrKy0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYw0KPiBp
bmRleCA3MTlkZmM1Li45ZWYxMjVkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3Rt
L2x0ZGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYw0KPiBAQCAtNDM3LDkg
KzQzNyw2IEBAIHN0YXRpYyB2b2lkIGx0ZGNfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywNCj4gICAJLyogQ29tbWl0IHNoYWRvdyByZWdpc3RlcnMgPSB1cGRhdGUgcGxh
bmVzIGF0IG5leHQgdmJsYW5rICovDQo+ICAgCXJlZ19zZXQobGRldi0+cmVncywgTFREQ19TUkNS
LCBTUkNSX1ZCUik7DQo+ICAgDQo+IC0JLyogRW5hYmxlIExUREMgKi8NCj4gLQlyZWdfc2V0KGxk
ZXYtPnJlZ3MsIExURENfR0NSLCBHQ1JfTFREQ0VOKTsNCj4gLQ0KPiAgIAlkcm1fY3J0Y192Ymxh
bmtfb24oY3J0Yyk7DQo+ICAgfQ0KPiAgIA0KPiBAQCAtNDUzLDkgKzQ1MCw2IEBAIHN0YXRpYyB2
b2lkIGx0ZGNfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQo+ICAg
DQo+ICAgCWRybV9jcnRjX3ZibGFua19vZmYoY3J0Yyk7DQo+ICAgDQo+IC0JLyogZGlzYWJsZSBM
VERDICovDQo+IC0JcmVnX2NsZWFyKGxkZXYtPnJlZ3MsIExURENfR0NSLCBHQ1JfTFREQ0VOKTsN
Cj4gLQ0KPiAgIAkvKiBkaXNhYmxlIElSUSAqLw0KPiAgIAlyZWdfY2xlYXIobGRldi0+cmVncywg
TFREQ19JRVIsIElFUl9SUklFIHwgSUVSX0ZVSUUgfCBJRVJfVEVSUklFKTsNCj4gICANCj4gQEAg
LTEwNTgsOSArMTA1MiwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNz
IGx0ZGNfZW5jb2Rlcl9mdW5jcyA9IHsNCj4gICBzdGF0aWMgdm9pZCBsdGRjX2VuY29kZXJfZGlz
YWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJt
X2RldmljZSAqZGRldiA9IGVuY29kZXItPmRldjsNCj4gKwlzdHJ1Y3QgbHRkY19kZXZpY2UgKmxk
ZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsNCj4gICANCj4gICAJRFJNX0RFQlVHX0RSSVZFUigiXG4i
KTsNCj4gICANCj4gKwkvKiBEaXNhYmxlIExUREMgKi8NCj4gKwlyZWdfY2xlYXIobGRldi0+cmVn
cywgTFREQ19HQ1IsIEdDUl9MVERDRU4pOw0KPiArDQo+ICAgCS8qIFNldCB0byBzbGVlcCBzdGF0
ZSB0aGUgcGluY3RybCB3aGF0ZXZlciB0eXBlIG9mIGVuY29kZXIgKi8NCj4gICAJcGluY3RybF9w
bV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGRldi0+ZGV2KTsNCj4gICB9DQo+IEBAIC0xMDY4LDYgKzEw
NjYsNyBAQCBzdGF0aWMgdm9pZCBsdGRjX2VuY29kZXJfZGlzYWJsZShzdHJ1Y3QgZHJtX2VuY29k
ZXIgKmVuY29kZXIpDQo+ICAgc3RhdGljIHZvaWQgbHRkY19lbmNvZGVyX2VuYWJsZShzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGRl
diA9IGVuY29kZXItPmRldjsNCj4gKwlzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBkZGV2LT5k
ZXZfcHJpdmF0ZTsNCj4gICANCj4gICAJRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsNCj4gICANCj4g
QEAgLTEwNzgsNiArMTA3Nyw5IEBAIHN0YXRpYyB2b2lkIGx0ZGNfZW5jb2Rlcl9lbmFibGUoc3Ry
dWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQ0KPiAgIAkgKi8NCj4gICAJaWYgKGVuY29kZXItPmVu
Y29kZXJfdHlwZSA9PSBEUk1fTU9ERV9FTkNPREVSX0RQSSkNCj4gICAJCXBpbmN0cmxfcG1fc2Vs
ZWN0X2RlZmF1bHRfc3RhdGUoZGRldi0+ZGV2KTsNCj4gKw0KPiArCS8qIEVuYWJsZSBMVERDICov
DQo+ICsJcmVnX3NldChsZGV2LT5yZWdzLCBMVERDX0dDUiwgR0NSX0xURENFTik7DQo+ICAgfQ0K
PiAgIA0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIGx0
ZGNfZW5jb2Rlcl9oZWxwZXJfZnVuY3MgPSB7DQo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
