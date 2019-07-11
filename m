Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17795653C4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 11:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC31D89F85;
	Thu, 11 Jul 2019 09:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A65C89F85
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 09:27:40 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6B9Qltj019115; Thu, 11 Jul 2019 11:27:34 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tmvx04bpn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 11 Jul 2019 11:27:34 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4779442;
 Thu, 11 Jul 2019 09:27:31 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 00F1C26BB;
 Thu, 11 Jul 2019 09:27:30 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 11 Jul
 2019 11:27:30 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 11 Jul 2019 11:27:30 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Olivier MOYSAN <olivier.moysan@st.com>, "a.hajda@samsung.com"
 <a.hajda@samsung.com>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@siol.net"
 <jernej.skrabec@siol.net>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Benjamin
 GAIGNARD" <benjamin.gaignard@st.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "jsarha@ti.com" <jsarha@ti.com>
Subject: Re: [PATCH] drm/bridge: sii902x: add audio graph card support
Thread-Topic: [PATCH] drm/bridge: sii902x: add audio graph card support
Thread-Index: AQHVMXX5EUvh0puEZ0ygMEtXg5C9Kaa72VsAgAgKHwCAAS3HAA==
Date: Thu, 11 Jul 2019 09:27:30 +0000
Message-ID: <e29c1671-99fb-581d-bfb7-61ca2cfa8622@st.com>
References: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
 <7c17b3f2-afee-7548-7620-b67d11d09b24@st.com>
 <20190710152720.GR15868@phenom.ffwll.local>
In-Reply-To: <20190710152720.GR15868@phenom.ffwll.local>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <97E4496BC2C9B749B2D4DC4A340B3153@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-11_01:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ozuHaFSyD+aZJ4haNAizK22rnLxhHA6aUOrq7v4rYzM=;
 b=BwUFcHBnsNVm3nBNpAUuttYo/2pyWXJoO+rXajtM4GNAlGhVGMdHqALX7vzbQnDTZm5Q
 aFtg9FJCiobvdsNyuS4/Tr/a160Goosfo41RUowkcDnUBF2ZVSe/oWcUn4+zgRT3xPyS
 QHSn0h2dlB6RhitmkIdM9nizn91BYHGlYGcTP4AFV1VZ+GBu7PPiiM2f6Bjlqs8bOmGK
 fhQZGbqpP6OcMYoSPja1MduluPvVF/S+XvofNbfbK3I+49Z4X0OyHCkqNON7EapvLHCD
 7OyZBcjV6Z/fL8+o62L1vLwyz3iSQo0M5GFQ12/vMmGjoivVQTuaZHmReke6Up4wkiXO 4A== 
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

SGkgRGFuaWVsLA0KDQoNCk9uIDcvMTAvMTkgNToyNyBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToN
Cj4gT24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMTI6NDE6MDNQTSArMDAwMCwgUGhpbGlwcGUgQ09S
TlUgd3JvdGU6DQo+PiBIaSBPbGl2aWVyLA0KPj4gYW5kIG1hbnkgdGhhbmtzIGZvciB5b3VyIHBh
dGNoLg0KPj4gR29vZCB0byBoYXZlIHRoZSBhdWRpbyBncmFwaCBjYXJkIHN1cHBvcnQsIGxvb2tz
IG9rLg0KPj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5j
b20+DQo+IA0KPiBTaW5jZSB5b3UgaGF2ZSBkcm0tbWlzYyBjb21taXQgcmlnaHRzIEknbSBhc3N1
bWluZyB5b3UncmUgZ29pbmcgdG8gcHVzaA0KPiB0aGlzIHRvby4gQ29ycmVjdD8NCj4gLURhbmll
bA0KDQpSZWdhcmRpbmcgdGhpcyBwYXRjaCBpbiBwYXJ0aWN1bGFyLCB0aGVyZSBpcyBzdGlsbCBt
aXNzaW5nIGFuIGFja2VkLWJ5IA0KZnJvbSBhICJicmlkZ2UiIG1haW50YWluZXIuIEFsc28gaXQg
Y291bGQgYmUgbmljZSB0byB3YWl0IGZvciB0aGUgDQpyZXZpZXdlZC1ieSBmcm9tIEppcnkgYXMg
aXQga25vd3Mgd2VsbCB0aGlzIHNpaSBkcml2ZXIgYW5kIHNlbnQgcmVjZW50bHkgDQpnb29kIHBh
dGNoZXMgb24gaXQgKGFscmVhZHkgbWVyZ2VkKS4NCg0KV2l0aCB0aGF0LCBCZW5qYW1pbiBvciBJ
IChvciBhIGJyaWRnZSBtYWludGFpbmVyKSBjYW4gcHVzaCB0aGlzIHBhdGNoICsgDQp0aGUgc2Vy
aWUgbmFtZWQgImRybS9icmlkZ2U6IHNpaTkwMng6IGZpeCBhdWRpbyBtY2xrIG1hbmFnZW1lbnQi
IGFzIEkgDQp0aGluayBpdCBpcyBiZXR0ZXIgdG8gcHVzaCB0aGlzIHNlcmllICpiZWZvcmUqIHRo
aXMgcGF0Y2guDQoNClRoYW5rcywNClBoaWxpcHBlIDotKQ0KDQoNCj4+IFBoaWxpcHBlIDotKQ0K
Pj4NCj4+IE9uIDcvMy8xOSAxMDowNCBBTSwgT2xpdmllciBNb3lzYW4gd3JvdGU6DQo+Pj4gSW1w
bGVtZW50IGdldF9kYWlfaWQgY2FsbGJhY2sgb2YgYXVkaW8gSERNSSBjb2RlYw0KPj4+IHRvIHN1
cHBvcnQgQVNvQyBhdWRpbyBncmFwaCBjYXJkLg0KPj4+IEhETUkgYXVkaW8gb3V0cHV0IGhhcyB0
byBiZSBjb25uZWN0ZWQgdG8gc2lpOTAyeCBwb3J0IDMuDQo+Pj4gZ2V0X2RhaV9pZCBjYWxsYmFj
ayBtYXBzIHRoaXMgcG9ydCB0byBBU29DIERBSSBpbmRleCAwLg0KPj4+DQo+Pj4gU2lnbmVkLW9m
Zi1ieTogT2xpdmllciBNb3lzYW4gPG9saXZpZXIubW95c2FuQHN0LmNvbT4NCj4+PiAtLS0NCj4+
PiAgICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8IDIzICsrKysrKysrKysrKysr
KysrKysrKysrDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykNCj4+Pg0K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jDQo+Pj4gaW5kZXggZGQ3YWE0NjZiMjgwLi5kYWY5
ZWYzY2Q4MTcgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4
LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYw0KPj4+IEBAIC0x
NTgsNiArMTU4LDggQEANCj4+PiAgICANCj4+PiAgICAjZGVmaW5lIFNJSTkwMlhfSTJDX0JVU19B
Q1FVSVNJVElPTl9USU1FT1VUX01TCTUwMA0KPj4+ICAgIA0KPj4+ICsjZGVmaW5lIFNJSTkwMlhf
QVVESU9fUE9SVF9JTkRFWAkJMw0KPj4+ICsNCj4+PiAgICBzdHJ1Y3Qgc2lpOTAyeCB7DQo+Pj4g
ICAgCXN0cnVjdCBpMmNfY2xpZW50ICppMmM7DQo+Pj4gICAgCXN0cnVjdCByZWdtYXAgKnJlZ21h
cDsNCj4+PiBAQCAtNjkwLDExICs2OTIsMzIgQEAgc3RhdGljIGludCBzaWk5MDJ4X2F1ZGlvX2dl
dF9lbGQoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPj4+ICAgIAlyZXR1cm4gMDsN
Cj4+PiAgICB9DQo+Pj4gICAgDQo+Pj4gK3N0YXRpYyBpbnQgc2lpOTAyeF9hdWRpb19nZXRfZGFp
X2lkKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50LA0KPj4+ICsJCQkJICAgIHN0
cnVjdCBkZXZpY2Vfbm9kZSAqZW5kcG9pbnQpDQo+Pj4gK3sNCj4+PiArCXN0cnVjdCBvZl9lbmRw
b2ludCBvZl9lcDsNCj4+PiArCWludCByZXQ7DQo+Pj4gKw0KPj4+ICsJcmV0ID0gb2ZfZ3JhcGhf
cGFyc2VfZW5kcG9pbnQoZW5kcG9pbnQsICZvZl9lcCk7DQo+Pj4gKwlpZiAocmV0IDwgMCkNCj4+
PiArCQlyZXR1cm4gcmV0Ow0KPj4+ICsNCj4+PiArCS8qDQo+Pj4gKwkgKiBIRE1JIHNvdW5kIHNo
b3VsZCBiZSBsb2NhdGVkIGF0IHJlZyA9IDwzPg0KPj4+ICsJICogUmV0dXJuIGV4cGVjdGVkIERB
SSBpbmRleCAwLg0KPj4+ICsJICovDQo+Pj4gKwlpZiAob2ZfZXAucG9ydCA9PSBTSUk5MDJYX0FV
RElPX1BPUlRfSU5ERVgpDQo+Pj4gKwkJcmV0dXJuIDA7DQo+Pj4gKw0KPj4+ICsJcmV0dXJuIC1F
SU5WQUw7DQo+Pj4gK30NCj4+PiArDQo+Pj4gICAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZG1pX2Nv
ZGVjX29wcyBzaWk5MDJ4X2F1ZGlvX2NvZGVjX29wcyA9IHsNCj4+PiAgICAJLmh3X3BhcmFtcyA9
IHNpaTkwMnhfYXVkaW9faHdfcGFyYW1zLA0KPj4+ICAgIAkuYXVkaW9fc2h1dGRvd24gPSBzaWk5
MDJ4X2F1ZGlvX3NodXRkb3duLA0KPj4+ICAgIAkuZGlnaXRhbF9tdXRlID0gc2lpOTAyeF9hdWRp
b19kaWdpdGFsX211dGUsDQo+Pj4gICAgCS5nZXRfZWxkID0gc2lpOTAyeF9hdWRpb19nZXRfZWxk
LA0KPj4+ICsJLmdldF9kYWlfaWQgPSBzaWk5MDJ4X2F1ZGlvX2dldF9kYWlfaWQsDQo+Pj4gICAg
fTsNCj4+PiAgICANCj4+PiAgICBzdGF0aWMgaW50IHNpaTkwMnhfYXVkaW9fY29kZWNfaW5pdChz
dHJ1Y3Qgc2lpOTAyeCAqc2lpOTAyeCwNCj4+Pg0KPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
