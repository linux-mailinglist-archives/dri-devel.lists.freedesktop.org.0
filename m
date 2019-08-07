Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B50184F48
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF996E723;
	Wed,  7 Aug 2019 14:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02olkn0802.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::802])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB816E723
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:57:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFQsEYydBvUh89r53Q6N/nxQzM3JwQ8s5+9q1/TMQIteMrMKuL6QqZKxsgymDQqXM4syGAF6pv0/mvJDCAjGTvI2e8xf9ld+jzy25obCutEkiIYngGhqgHOIKSfA1BcPecnOXHnE32tPPvPxSSjGgJi1zLmLEAIECiSV55uVRv+aqTpmuvksPogBIrBwUPo77saymLYuJDjNpi47XSKjeMJnzE1S2X7HW2EZUK3ce2D46PUzaupSBPcsF1Yoy5wO+krsIdK5cF81OfSSxLFPoLvl4uO/PSy9RixV++6IqfhF6LN68WyjdxTbEPcoLzkCe1K/QceDxxq/Ph18GBt/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krAO9Vcb3TWPVi+jgwDCKhYYl+NDI+NYXpBKn9OUAkA=;
 b=QQ/fmusyasWNU24yEZKTsCHZSngZV7swAIxO3jIVuI19St1ePtW2kXoocp7WQ/r4xCavH7lER/iyiGFB6SXAU7OJP+qLi6eoJL7ginuikm9JPNPUfNGqdw1m+0l2LEMqiivIyoiw9tK51ARGLNxLWe7FWj6V6rPRCum/OQ6xrNoErZpAxAfQbIkHiTrcJ0FESSTkqKOUWBKfB3Y6EDLKgK55pngjea/6MV+LsJos9xgWsizBiN5fiPeHpAF2vCHBrXnOS2HuP8Sid17CkFoHtqb++6qeOmJTXudrQzs+eYVsUZ31qGjlhO/E6PLWFHlxV4psQdzX0Odjnob55YA9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from VE1EUR02FT018.eop-EUR02.prod.protection.outlook.com
 (10.152.12.60) by VE1EUR02HT159.eop-EUR02.prod.protection.outlook.com
 (10.152.13.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.14; Wed, 7 Aug
 2019 14:57:53 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.12.56) by
 VE1EUR02FT018.mail.protection.outlook.com (10.152.12.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Wed, 7 Aug 2019 14:57:53 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b952:7cd2:4c8d:e460]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b952:7cd2:4c8d:e460%4]) with mapi id 15.20.2157.015; Wed, 7 Aug 2019
 14:57:53 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Jerome Brunet <jbrunet@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 8/8] drm/bridge: dw-hdmi-i2s: add .get_eld support
Thread-Topic: [PATCH 8/8] drm/bridge: dw-hdmi-i2s: add .get_eld support
Thread-Index: AQHVS5N0jSIKg921YEambElhd5+H3qbvyc8A
Date: Wed, 7 Aug 2019 14:57:53 +0000
Message-ID: <HE1PR06MB40117A899E057B36BE461B8EACD40@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
 <20190805134102.24173-9-jbrunet@baylibre.com>
In-Reply-To: <20190805134102.24173-9-jbrunet@baylibre.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:200:89::20) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:5F0EFE78D58F44619228BFF3DA3D0769E7EAD631B5AE7906D0299939D681FF76;
 UpperCasedChecksum:EB3E31C703F69500A8E8A941F3EFFDF9CC91D2BDC281AA706DC00A1D1EBFE832;
 SizeAsReceived:7735; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [dG3e88mril5xWIDYYzJRdQb3X6dNLYAI]
x-microsoft-original-message-id: <a8f15dd4-9122-404b-625c-d8783f2c1f8d@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:VE1EUR02HT159; 
x-ms-traffictypediagnostic: VE1EUR02HT159:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: 3UWih373MKW4Dkk+kMwJcYyem/V+Zz06Tixg8tsqP4rfX36ffr+dmTiNhOqzsON6KZJChTljVxSazs84rzo4rKgc3ccVqi3h9SRyHv0xm0qoM0rnCsu9zxzIGVEVqRYAuOoyZGOxvWIjK93/nVsLOm6oe7B/KvU8sAV5gGcinU7SwDry1uniqKE3oj8j6FPU
Content-ID: <CEFFEE3B8C6D594DA8DF310362DFBD3D@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a63a0008-4dfc-4fc7-5358-08d71b479f38
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 14:57:53.2226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT159
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0wNSAxNTo0MSwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBQcm92aWRlIHRoZSBl
bGQgdG8gdGhlIGdlbmVyaWMgaGRtaS1jb2RlYyBkcml2ZXIuCj4gVGhpcyB3aWxsIGxldCB0aGUg
ZHJpdmVyIGVuZm9yY2UgdGhlIG1heGltdW0gY2hhbm5lbCBudW1iZXIgYW5kIHNldCB0aGUKPiBj
aGFubmVsIGFsbG9jYXRpb24gZGVwZW5kaW5nIG9uIHRoZSBoZG1pIHNpbmsuCj4KPiBDYzogSm9u
YXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgo+IFNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVu
ZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWktYXVkaW8uaCAgICAgfCAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyB8IDEwICsrKysrKysrKysKPiAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgICAgICAgICAgIHwgIDEgKwo+
ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktYXVkaW8uaCBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1hdWRpby5oCj4gaW5kZXggNjNiNTc1NmY0NjNi
Li5jYjA3ZGMwZGE1YTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLWF1ZGlvLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWktYXVkaW8uaAo+IEBAIC0xNCw2ICsxNCw3IEBAIHN0cnVjdCBkd19oZG1pX2F1
ZGlvX2RhdGEgewo+ICAKPiAgc3RydWN0IGR3X2hkbWlfaTJzX2F1ZGlvX2RhdGEgewo+ICAJc3Ry
dWN0IGR3X2hkbWkgKmhkbWk7Cj4gKwl1OCAqZWxkOwo+ICAKPiAgCXZvaWQgKCp3cml0ZSkoc3Ry
dWN0IGR3X2hkbWkgKmhkbWksIHU4IHZhbCwgaW50IG9mZnNldCk7Cj4gIAl1OCAoKnJlYWQpKHN0
cnVjdCBkd19oZG1pICpoZG1pLCBpbnQgb2Zmc2V0KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCj4gaW5kZXggYjhlY2U5YzFi
YTJjLi4xNGQ0OTliMzQ0YzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCj4gQEAgLTEyMSw2ICsxMjEsMTUgQEAgc3Rh
dGljIHZvaWQgZHdfaGRtaV9pMnNfYXVkaW9fc2h1dGRvd24oc3RydWN0IGRldmljZSAqZGV2LCB2
b2lkICpkYXRhKQo+ICAJZHdfaGRtaV9hdWRpb19kaXNhYmxlKGhkbWkpOwo+ICB9Cj4gIAo+ICtz
dGF0aWMgaW50IGR3X2hkbWlfaTJzX2dldF9lbGQoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpk
YXRhLCB1aW50OF90ICpidWYsCj4gKwkJCSAgICAgICBzaXplX3QgbGVuKQo+ICt7Cj4gKwlzdHJ1
Y3QgZHdfaGRtaV9pMnNfYXVkaW9fZGF0YSAqYXVkaW8gPSBkYXRhOwo+ICsKPiArCW1lbWNweShi
dWYsIGF1ZGlvLT5lbGQsIG1pbihzaXplb2YoYXVkaW8tPmVsZCksIGxlbikpOwoKQWJvdmUgc2l6
ZW9mIGRvZXMgbm90IHdvcmsgYXMgaW50ZW5kZWQsIHNpemVvZihhdWRpby0+ZWxkKSBpcyBwcm9i
YWJseSB0aGUgc2l6ZSBvZiBhIHBvaW50ZXIgYW5kIG5vdCBNQVhfRUxEX0JZVEVTICgxMjgpLApy
ZXN1bHRpbmcgaW4gb25seSBwYXJ0IG9mIHRoZSBFTEQgZ2V0cyBjb3BpZWQgdG8gYnVmLgoKClRo
YW5rcyBmb3IgcmV3b3JraW5nIGR3LWhkbWkgbXVsdGkgY2hhbm5lbCBscGNtIHN1cHBvcnQhLCB0
aGlzIHdvcmtzIG9uIFJvY2tjaGlwIGZvciBtb3N0IHBhcnRzLgpXaXRob3V0IHRoZSBbMV0gcGF0
Y2ggKHJlc2V0IGN0cytuIGFmdGVyIGNsb2NrIGlzIGVuYWJsZWQpIGF1ZGlvIHNvbWV0aW1lIHN0
YXkgc2lsZW50IHdoZW4gc3dpdGNoaW5nIGJldHdlZW4gZS5nLiAyY2ggNDQuMWtoeiBhbmQgNmNo
IDQ4a2h6IHRyYWNrcy4KSXQgaXMgbm90IGZ1bGx5IGNsZWFyIHRvIG1lIHdoeSByZXNldCBjdHMr
biBoZWxwcywgaWYgdGhhdCBoYXZlIG5lZ2F0aXZlIGFmZmVjdHMgb24gb3RoZXIgcGxhdGZvcm1z
IG9yIGlmIHRoZXJlIGlzIGFub3RoZXIgd2F5IHRvIHNvbHZlIGxvb3NpbmcgYXVkaW8uCgpJIGFs
c28gaGF2ZSBhIHNtYWxsIGlzc3VlIHdpdGggdGhlIGNoYW5uZWwgYWxsb2NhdGlvbiBiZWluZyBz
ZWxlY3RlZCBieSBoZG1pLWNvZGVjLCBteSBzb3VuZGJhciByZXBvcnRzIExQQ00gNi4xY2ggaW5z
dGVhZCBvZiBMUENNIDcuMWNoIHdoZW4gSSBwbGF5IGEgNy4xY2ggc3BlYWtlciB0ZXN0IGNsaXAu
CkkgaGF2ZSBhIGhkbWktY29kZWMgcGF0Y2ggdG8gZml4IHNlbGVjdGlvbiBvZiBjaGFubmVsIGFs
bG9jYXRpb24gaW4gcXVldWUuCgoKRm9yIHBhdGNoIDEtNzoKClJldmlld2VkLWJ5OiBKb25hcyBL
YXJsbWFuIDxqb25hc0Brd2lib28uc2U+CgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9Ld2lib28v
bGludXgtcm9ja2NoaXAvY29tbWl0L2MwODM5ZTg3NGY4NDNhZDE3M2RkZGU5NTgzMDNkNjg3ODM5
NGVmOTIKClJlZ2FyZHMsCkpvbmFzCgo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gIHN0YXRpYyBp
bnQgZHdfaGRtaV9pMnNfZ2V0X2RhaV9pZChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBv
bmVudCwKPiAgCQkJCSAgc3RydWN0IGRldmljZV9ub2RlICplbmRwb2ludCkKPiAgewo+IEBAIC0x
NDQsNiArMTUzLDcgQEAgc3RhdGljIGludCBkd19oZG1pX2kyc19nZXRfZGFpX2lkKHN0cnVjdCBz
bmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50LAo+ICBzdGF0aWMgc3RydWN0IGhkbWlfY29kZWNf
b3BzIGR3X2hkbWlfaTJzX29wcyA9IHsKPiAgCS5od19wYXJhbXMJPSBkd19oZG1pX2kyc19od19w
YXJhbXMsCj4gIAkuYXVkaW9fc2h1dGRvd24JPSBkd19oZG1pX2kyc19hdWRpb19zaHV0ZG93biwK
PiArCS5nZXRfZWxkCT0gZHdfaGRtaV9pMnNfZ2V0X2VsZCwKPiAgCS5nZXRfZGFpX2lkCT0gZHdf
aGRtaV9pMnNfZ2V0X2RhaV9pZCwKPiAgfTsKPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMKPiBpbmRleCBiZWQ0YmIwMTdhZmQuLjhkZjY5YzlkYmZhZCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gQEAgLTI3OTcs
NiArMjc5Nyw3IEBAIF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LAo+ICAJCXN0cnVjdCBkd19oZG1pX2kyc19hdWRpb19kYXRhIGF1ZGlvOwo+ICAKPiAgCQlhdWRp
by5oZG1pCT0gaGRtaTsKPiArCQlhdWRpby5lbGQJPSBoZG1pLT5jb25uZWN0b3IuZWxkOwo+ICAJ
CWF1ZGlvLndyaXRlCT0gaGRtaV93cml0ZWI7Cj4gIAkJYXVkaW8ucmVhZAk9IGhkbWlfcmVhZGI7
Cj4gIAkJaGRtaS0+ZW5hYmxlX2F1ZGlvID0gZHdfaGRtaV9pMnNfYXVkaW9fZW5hYmxlOwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
