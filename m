Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969B51A1AD
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 18:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A973689D2E;
	Fri, 10 May 2019 16:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBED89D2E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 16:40:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AGZtVj027928; Fri, 10 May 2019 18:40:07 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2scdjpa6c6-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:40:07 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B3E834;
 Fri, 10 May 2019 16:40:06 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 163C82CB4;
 Fri, 10 May 2019 16:40:06 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 May
 2019 18:40:05 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Fri, 10 May 2019 18:40:05 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
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
Thread-Index: AQHVB0GDvPb0BWdKa0uOjh9ZFPgpeqZkbf8A
Date: Fri, 10 May 2019 16:40:05 +0000
Message-ID: <c84e4be5-ec3d-aa6a-9571-4c6d2877fa5f@st.com>
References: <1557500600-19771-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1557500600-19771-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <10FDEE3B6C3BE84288DE873FAFE85886@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fDK2pUKnts0/2XyIv5cUGXTEXKWAR3aldEBvpXZ7VTI=;
 b=Ey4pb4EdeDMM19KPcSg9nHnXTVOch4HpmrFb4ZCEyqyH3wCyY8dP8p1IrB2E7AqkIXHl
 yV2MgQzE8VwAxHHStg2zN92vTKRPfFA4oDS5OoxaX5m+6vEON45nHPPftAyA5NXqXpcV
 vjPCTKy4hYug8CrPW7JHZhHQDQh0ORBztG9qNWP2INF2BLBvsFHXmBP3Tvykzve60NNn
 NkhCAvMULjlW1UhmG0wK0NY5Oz5+FQdyr+cUTtPnkpa+Z4z1wvlQpGrti+YNH8U+bXWa
 qZCjTdsojVIlbbxRRURHSZG4OfhrawFMHv8sd2DBJIhP/86fY9sJyL30XYK+b9v7vUSS jg== 
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

RGVhciBZYW5uaWNrLA0KVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLA0KDQpJbiB5b3VyIHBhdGNo
LCB5b3UgaGF2ZSByZW1vdmVkIGNsa19kaXNhYmxlKCkgJiBjbGtfZW5hYmxlKCkuDQpDb3VsZCB5
b3UgcGxlYXNlIGRvdWJsZSBjb25maXJtID8NCg0KdGhhbmtzDQpQaGlsaXBwZSA6LSkNCg0KDQpP
biA1LzEwLzE5IDU6MDMgUE0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToNCj4gQ2xrX3JvdW5kX3Jh
dGUgcmV0dXJucyByb3VuZGVkIGNsb2NrIHdpdGhvdXQgY2hhbmdpbmcNCj4gdGhlIGhhcmR3YXJl
IGluIGFueSB3YXkuDQo+IFRoaXMgZnVuY3Rpb24gY291bGRuJ3QgcmVwbGFjZSBzZXRfcmF0ZS9n
ZXRfcmF0ZSBjYWxscy4NCj4gVG9kbyBjb21tZW50IGhhcyBiZWVuIHJlbW92ZWQgJiBhIG5ldyBs
b2cgaW5zZXJ0ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5p
Y2suZmVydHJlQHN0LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMg
fCAxMCArKystLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jDQo+IGluZGV4IDk3OTEyZTIuLjJmOGFhMmUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9zdG0vbHRkYy5jDQo+IEBAIC01MDcsMjAgKzUwNywxNiBAQCBzdGF0aWMgYm9v
bCBsdGRjX2NydGNfbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQo+ICAgCXN0cnVj
dCBsdGRjX2RldmljZSAqbGRldiA9IGNydGNfdG9fbHRkYyhjcnRjKTsNCj4gICAJaW50IHJhdGUg
PSBtb2RlLT5jbG9jayAqIDEwMDA7DQo+ICAgDQo+IC0JLyoNCj4gLQkgKiBUT0RPIGNsa19yb3Vu
ZF9yYXRlKCkgZG9lcyBub3Qgd29yayB5ZXQuIFdoZW4gcmVhZHksIGl0IGNhbg0KPiAtCSAqIGJl
IHVzZWQgaW5zdGVhZCBvZiBjbGtfc2V0X3JhdGUoKSB0aGVuIGNsa19nZXRfcmF0ZSgpLg0KPiAt
CSAqLw0KPiAtDQo+IC0JY2xrX2Rpc2FibGUobGRldi0+cGl4ZWxfY2xrKTsNCj4gICAJaWYgKGNs
a19zZXRfcmF0ZShsZGV2LT5waXhlbF9jbGssIHJhdGUpIDwgMCkgew0KPiAgIAkJRFJNX0VSUk9S
KCJDYW5ub3Qgc2V0IHJhdGUgKCVkSHopIGZvciBwaXhlbCBjbGtcbiIsIHJhdGUpOw0KPiAgIAkJ
cmV0dXJuIGZhbHNlOw0KPiAgIAl9DQo+IC0JY2xrX2VuYWJsZShsZGV2LT5waXhlbF9jbGspOw0K
PiAgIA0KPiAgIAlhZGp1c3RlZF9tb2RlLT5jbG9jayA9IGNsa19nZXRfcmF0ZShsZGV2LT5waXhl
bF9jbGspIC8gMTAwMDsNCj4gICANCj4gKwlEUk1fREVCVUdfRFJJVkVSKCJyZXF1ZXN0ZWQgY2xv
Y2sgJWRrSHosIGFkanVzdGVkIGNsb2NrICVka0h6XG4iLA0KPiArCQkJIG1vZGUtPmNsb2NrLCBh
ZGp1c3RlZF9tb2RlLT5jbG9jayk7DQo+ICsNCj4gICAJcmV0dXJuIHRydWU7DQo+ICAgfQ0KPiAg
IA0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
