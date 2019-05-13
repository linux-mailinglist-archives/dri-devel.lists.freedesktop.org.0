Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D51B6CD
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 15:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144A789C08;
	Mon, 13 May 2019 13:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C6B89C08
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 13:12:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4DD7LSn015912; Mon, 13 May 2019 15:12:57 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sdn9fk47v-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 13 May 2019 15:12:57 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E66E131;
 Mon, 13 May 2019 13:12:56 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC91C2724;
 Mon, 13 May 2019 13:12:56 +0000 (GMT)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 13 May
 2019 15:12:56 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1347.000; Mon, 13 May 2019 15:12:56 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Philippe CORNU <philippe.cornu@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/stm: ltdc: remove clk_round_rate comment
Thread-Topic: [PATCH] drm/stm: ltdc: remove clk_round_rate comment
Thread-Index: AQHVB0GDxA/7lA0P2UW6qyl6IvCmt6ZkbgCAgAR9HYA=
Date: Mon, 13 May 2019 13:12:56 +0000
Message-ID: <65e9219b-3f64-01bb-645c-d3746e2363e7@st.com>
References: <1557500600-19771-1-git-send-email-yannick.fertre@st.com>
 <c84e4be5-ec3d-aa6a-9571-4c6d2877fa5f@st.com>
In-Reply-To: <c84e4be5-ec3d-aa6a-9571-4c6d2877fa5f@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <1B473D66FAD5024C838090D56C937A63@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_07:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=BVlpseAlnra93hK/F7xLbOTR3/j0/3f0pvw+YcKDzFQ=;
 b=bQ0ZgTSkLLpntTOhaKCIU336iPwLQQu5wTloSPjCuNt0J/KNjQDEs6sX5ZWVXx92HZ9Q
 gTQP3plLq6+ndleABUoI7tURni8lNLKBjdWa4LHFBGxI4jQnz4dbCCFTfTJ3ArTkHkIn
 CjFMkorBfzBqn9G1RbRCwxXA5RNq7DI8BWESCd8jfvxzg2kyo/eYWA7KmUpYyMlVugZq
 mmY6deavB0WUXYlG3T6PhOZwZaQzeq4rNfG0fi7i8uwWiI+yrGtJVf3cbbf0iLJxIqGJ
 N5znExn+gv5AfNodaua4YZrjZSCTjrEF5OfeYKIT7v0y1qe00OkdacuHZiOdPvPiJ16R uA== 
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

RGVhciBQaGlsaXBwZSwNCg0KeW91J3JlIHJpZ2h0LCBjbGtfZGlzYWJsZSgpICYgY2xrX2VuYWJs
ZSgpIGFyZSBuZWNlc3Nhcnkgd2l0aCBTVE0zMkY0IA0KU09DIChub3QgZm9yIFNUTTMyTVAxKS4N
Cg0KSSdsbCByZXZlcnQgdGhpcyBwYXJ0IG9mIHRoZSBwYXRjaC4NCg0KTWFueSB0aGFua3MNCg0K
DQotLSANCllhbm5pY2sgRmVydHLDqSB8IFRJTkE6IDE2NiA3MTUyIHwgVGVsOiArMzMgMjQ0MDI3
MTUyIHwgTW9iaWxlOiArMzMgNjIwNjAwMjcwDQpNaWNyb2NvbnRyb2xsZXJzIGFuZCBEaWdpdGFs
IElDcyBHcm91cCB8IE1pY3JvY29udHJvbGxldXJzIERpdmlzaW9uDQoNCk9uIDUvMTAvMTkgNjo0
MCBQTSwgUGhpbGlwcGUgQ09STlUgd3JvdGU6DQo+IERlYXIgWWFubmljaywNCj4gVGhhbmsgeW91
IGZvciB5b3VyIHBhdGNoLA0KPg0KPiBJbiB5b3VyIHBhdGNoLCB5b3UgaGF2ZSByZW1vdmVkIGNs
a19kaXNhYmxlKCkgJiBjbGtfZW5hYmxlKCkuDQo+IENvdWxkIHlvdSBwbGVhc2UgZG91YmxlIGNv
bmZpcm0gPw0KPg0KPiB0aGFua3MNCj4gUGhpbGlwcGUgOi0pDQo+DQo+DQo+IE9uIDUvMTAvMTkg
NTowMyBQTSwgWWFubmljayBGZXJ0csOpIHdyb3RlOg0KPj4gQ2xrX3JvdW5kX3JhdGUgcmV0dXJu
cyByb3VuZGVkIGNsb2NrIHdpdGhvdXQgY2hhbmdpbmcNCj4+IHRoZSBoYXJkd2FyZSBpbiBhbnkg
d2F5Lg0KPj4gVGhpcyBmdW5jdGlvbiBjb3VsZG4ndCByZXBsYWNlIHNldF9yYXRlL2dldF9yYXRl
IGNhbGxzLg0KPj4gVG9kbyBjb21tZW50IGhhcyBiZWVuIHJlbW92ZWQgJiBhIG5ldyBsb2cgaW5z
ZXJ0ZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZl
cnRyZUBzdC5jb20+DQo+PiAtLS0NCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwg
MTAgKysrLS0tLS0tLQ0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYw0KPj4gaW5kZXggOTc5MTJlMi4uMmY4YWEy
ZSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jDQo+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYw0KPj4gQEAgLTUwNywyMCArNTA3LDE2IEBAIHN0YXRp
YyBib29sIGx0ZGNfY3J0Y19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4+ICAg
IAlzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBjcnRjX3RvX2x0ZGMoY3J0Yyk7DQo+PiAgICAJ
aW50IHJhdGUgPSBtb2RlLT5jbG9jayAqIDEwMDA7DQo+PiAgICANCj4+IC0JLyoNCj4+IC0JICog
VE9ETyBjbGtfcm91bmRfcmF0ZSgpIGRvZXMgbm90IHdvcmsgeWV0LiBXaGVuIHJlYWR5LCBpdCBj
YW4NCj4+IC0JICogYmUgdXNlZCBpbnN0ZWFkIG9mIGNsa19zZXRfcmF0ZSgpIHRoZW4gY2xrX2dl
dF9yYXRlKCkuDQo+PiAtCSAqLw0KPj4gLQ0KPj4gLQljbGtfZGlzYWJsZShsZGV2LT5waXhlbF9j
bGspOw0KPj4gICAgCWlmIChjbGtfc2V0X3JhdGUobGRldi0+cGl4ZWxfY2xrLCByYXRlKSA8IDAp
IHsNCj4+ICAgIAkJRFJNX0VSUk9SKCJDYW5ub3Qgc2V0IHJhdGUgKCVkSHopIGZvciBwaXhlbCBj
bGtcbiIsIHJhdGUpOw0KPj4gICAgCQlyZXR1cm4gZmFsc2U7DQo+PiAgICAJfQ0KPj4gLQljbGtf
ZW5hYmxlKGxkZXYtPnBpeGVsX2Nsayk7DQo+PiAgICANCj4+ICAgIAlhZGp1c3RlZF9tb2RlLT5j
bG9jayA9IGNsa19nZXRfcmF0ZShsZGV2LT5waXhlbF9jbGspIC8gMTAwMDsNCj4+ICAgIA0KPj4g
KwlEUk1fREVCVUdfRFJJVkVSKCJyZXF1ZXN0ZWQgY2xvY2sgJWRrSHosIGFkanVzdGVkIGNsb2Nr
ICVka0h6XG4iLA0KPj4gKwkJCSBtb2RlLT5jbG9jaywgYWRqdXN0ZWRfbW9kZS0+Y2xvY2spOw0K
Pj4gKw0KPj4gICAgCXJldHVybiB0cnVlOw0KPj4gICAgfQ0KPj4gICAgDQotLSANCllhbm5pY2sg
RmVydHLDqSB8IFRJTkE6IDE2NiA3MTUyIHwgVGVsOiArMzMgMjQ0MDI3MTUyIHwgTW9iaWxlOiAr
MzMgNjIwNjAwMjcwDQpNaWNyb2NvbnRyb2xsZXJzIGFuZCBEaWdpdGFsIElDcyBHcm91cCB8IE1p
Y3JvY29udHJvbGxldXJzIERpdmlzaW9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
