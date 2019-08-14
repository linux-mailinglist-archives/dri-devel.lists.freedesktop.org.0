Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591778D055
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 12:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554C889C52;
	Wed, 14 Aug 2019 10:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092069026.outbound.protection.outlook.com [40.92.69.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7224B89C52
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:08:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYZdoUFbDc24k4Drgu4L5VCczH+skK1P8U+x02aUluvN+eNqIJy9sgxQ8LM7pdiYJTQH/ap1ac7pf4EZuny0REYKuLSmMJ/y95nvU8K+gwtYTqxpUFNnWszHDYLiL/EFG1U0mu3TGuSLtKS3CrBVtKxZsr+0ucKJF6W6IS1IB5/c2bm0QQg3uJWp+aaT90lZ8Y5s0YiCq6+lZOsWdHEW5p3jdtcx+428IDSeOK/rX6SjaPfNj5+a8fuqOX6cUmsIWt/ZP3df2ZpVFnpy2GZ9W0NRipeKRZY6qvh21dxkaXUOz+z9BpuYtb5Gx17S7TlbRmel/OnRNwkdwItfnAFgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NR5NxNQJtyUapF1QtPDV/DA8grF7qTEf6BJpmdlP268=;
 b=DajBhFgd6hwT+CwmlU/AkFLBwQYIrRjYo9Pnul/Phw2bIAzEMRqPyVxFujP18QwASrzE4W5eWUikKT6in2ngnWPHphXirKUx7ArO+lFqfbpDRLABZ+ePqBHWKGHJf7qhX8ion1o4ad5j9ufVfBuDCeeqTmTnmdVq0j2/IsSRKf4tE9t8pKVIYECtdUPYbEkWb9abNWXNnm71mmmCj1KaEoh4ysnwe0HXtB8HlS/UoHjA9axAUrZVsbHCWLH79Zu2Cg/ng1WvSxXCuFKXa69JgySy4Jzw38Jr1OwTrbk4N9ezRgmPsCF0rJAJSdyq9AwOvKdEPzmZSPfvb5PHojP8qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR02FT013.eop-EUR02.prod.protection.outlook.com
 (10.152.12.56) by VE1EUR02HT217.eop-EUR02.prod.protection.outlook.com
 (10.152.13.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.15; Wed, 14 Aug
 2019 10:08:00 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.12.57) by
 VE1EUR02FT013.mail.protection.outlook.com (10.152.12.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 14 Aug 2019 10:08:00 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b952:7cd2:4c8d:e460]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b952:7cd2:4c8d:e460%4]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 10:08:00 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Jerome Brunet <jbrunet@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RESEND PATCH v2 8/8] drm/bridge: dw-hdmi-i2s: add .get_eld
 support
Thread-Topic: [RESEND PATCH v2 8/8] drm/bridge: dw-hdmi-i2s: add .get_eld
 support
Thread-Index: AQHVUQyHpB7kAWBn7kqPIxD3pWYTiqb6bjGA
Date: Wed, 14 Aug 2019 10:08:00 +0000
Message-ID: <HE1PR06MB401112DA555C49332C968D50ACAD0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20190812120726.1528-9-jbrunet@baylibre.com>
 <20190812125016.20169-1-jbrunet@baylibre.com>
In-Reply-To: <20190812125016.20169-1-jbrunet@baylibre.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0701CA0051.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::19) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:D494B6AF08BF40FBF92638DDD8A4D59F407F39174239B7F9E6523763EA9E57BB;
 UpperCasedChecksum:DAF511C40F22CAC2B53AA4142B4A255422B1A9FE2C55EB46054A32F190BF0572;
 SizeAsReceived:7723; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [LCsCnxmRS6BMnifjFpxUzBOE12c/6op/]
x-microsoft-original-message-id: <13bb5f91-c9aa-7e66-e2ae-492ec8b46b57@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:VE1EUR02HT217; 
x-ms-traffictypediagnostic: VE1EUR02HT217:
x-microsoft-antispam-message-info: wZKtRV7CwSIA7HMbUiA5v1ZzohMuRGjuU/LHFClGgLuXagAvmKGU2w6CRzkPT+ueJ3jnFrttFOynK9kBYdejMo/pSYwRGOAGwL5ygQi/Ip/TKEXBUiw/gQQHpxrzJ8u+qpBSqAWeGkRsXyzIshaRJLtfJV0EP/mJz/hH/ABy5kAboE7SGoOSDYleRgivrZuf
x-ms-exchange-transport-forked: True
Content-ID: <2CFCBE53D18BD54898332EA4864AEF33@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2601b5fb-ee98-4491-9ade-08d7209f4919
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 10:08:00.2084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT217
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

T24gMjAxOS0wOC0xMiAxNDo1MCwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBQcm92aWRlIHRoZSBl
bGQgdG8gdGhlIGdlbmVyaWMgaGRtaS1jb2RlYyBkcml2ZXIuCj4gVGhpcyB3aWxsIGxldCB0aGUg
ZHJpdmVyIGVuZm9yY2UgdGhlIG1heGltdW0gY2hhbm5lbCBudW1iZXIgYW5kIHNldCB0aGUKPiBj
aGFubmVsIGFsbG9jYXRpb24gZGVwZW5kaW5nIG9uIHRoZSBoZG1pIHNpbmsuCj4KPiBDYzogSm9u
YXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgo+IFNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVu
ZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgoKVGVzdGVkIG9uIFJvY2tjaGlwIFJLMzI4OC9SSzMz
MjggZGV2aWNlcywgZnVsbCBFTEQgaXMgbm93IGF2YWlsYWJsZSB0byB1c2Vyc3BhY2UuClBsZWFz
ZSBub3RlIHRoYXQgdGhlIHItYiBsaW5lIGluIHBhdGNoIDIgaXMgbWl4ZWQgaW4gbWlkZGxlIG9m
IGNvbW1pdCBtZXNzYWdlLgoKUmV2aWV3ZWQtYnk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJv
by5zZT4KClJlZ2FyZHMsCkpvbmFzCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWktYXVkaW8uaCAgICAgfCAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyB8IDExICsrKysrKysrKysrCj4gIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jICAgICAgICAgICB8ICAxICsKPiAg
MyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWF1ZGlvLmggYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktYXVkaW8uaAo+IGluZGV4IDYzYjU3NTZmNDYzYi4u
Y2IwN2RjMGRhNWE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS1hdWRpby5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLWF1ZGlvLmgKPiBAQCAtMTQsNiArMTQsNyBAQCBzdHJ1Y3QgZHdfaGRtaV9hdWRp
b19kYXRhIHsKPiAgCj4gIHN0cnVjdCBkd19oZG1pX2kyc19hdWRpb19kYXRhIHsKPiAgCXN0cnVj
dCBkd19oZG1pICpoZG1pOwo+ICsJdTggKmVsZDsKPiAgCj4gIAl2b2lkICgqd3JpdGUpKHN0cnVj
dCBkd19oZG1pICpoZG1pLCB1OCB2YWwsIGludCBvZmZzZXQpOwo+ICAJdTggKCpyZWFkKShzdHJ1
Y3QgZHdfaGRtaSAqaGRtaSwgaW50IG9mZnNldCk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwo+IGluZGV4IGI4ZWNlOWMxYmEy
Yy4uMWQxNWNmOWI2ODIxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwo+IEBAIC0xMCw2ICsxMCw3IEBACj4gICNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgCj4gICNpbmNsdWRlIDxkcm0vYnJpZGdlL2R3X2hkbWku
aD4KPiArI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgo+ICAKPiAgI2luY2x1ZGUgPHNvdW5kL2hk
bWktY29kZWMuaD4KPiAgCj4gQEAgLTEyMSw2ICsxMjIsMTUgQEAgc3RhdGljIHZvaWQgZHdfaGRt
aV9pMnNfYXVkaW9fc2h1dGRvd24oc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQo+ICAJ
ZHdfaGRtaV9hdWRpb19kaXNhYmxlKGhkbWkpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IGR3X2hk
bWlfaTJzX2dldF9lbGQoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhLCB1aW50OF90ICpi
dWYsCj4gKwkJCSAgICAgICBzaXplX3QgbGVuKQo+ICt7Cj4gKwlzdHJ1Y3QgZHdfaGRtaV9pMnNf
YXVkaW9fZGF0YSAqYXVkaW8gPSBkYXRhOwo+ICsKPiArCW1lbWNweShidWYsIGF1ZGlvLT5lbGQs
IG1pbl90KHNpemVfdCwgTUFYX0VMRF9CWVRFUywgbGVuKSk7Cj4gKwlyZXR1cm4gMDsKPiArfQo+
ICsKPiAgc3RhdGljIGludCBkd19oZG1pX2kyc19nZXRfZGFpX2lkKHN0cnVjdCBzbmRfc29jX2Nv
bXBvbmVudCAqY29tcG9uZW50LAo+ICAJCQkJICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmVuZHBvaW50
KQo+ICB7Cj4gQEAgLTE0NCw2ICsxNTQsNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2dldF9k
YWlfaWQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsCj4gIHN0YXRpYyBzdHJ1
Y3QgaGRtaV9jb2RlY19vcHMgZHdfaGRtaV9pMnNfb3BzID0gewo+ICAJLmh3X3BhcmFtcwk9IGR3
X2hkbWlfaTJzX2h3X3BhcmFtcywKPiAgCS5hdWRpb19zaHV0ZG93bgk9IGR3X2hkbWlfaTJzX2F1
ZGlvX3NodXRkb3duLAo+ICsJLmdldF9lbGQJPSBkd19oZG1pX2kyc19nZXRfZWxkLAo+ICAJLmdl
dF9kYWlfaWQJPSBkd19oZG1pX2kyc19nZXRfZGFpX2lkLAo+ICB9Owo+ICAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IGluZGV4IGJlZDRiYjAxN2FmZC4uOGRm
NjljOWRiZmFkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMv
ZHctaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LmMKPiBAQCAtMjc5Nyw2ICsyNzk3LDcgQEAgX19kd19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYsCj4gIAkJc3RydWN0IGR3X2hkbWlfaTJzX2F1ZGlvX2RhdGEgYXVkaW87
Cj4gIAo+ICAJCWF1ZGlvLmhkbWkJPSBoZG1pOwo+ICsJCWF1ZGlvLmVsZAk9IGhkbWktPmNvbm5l
Y3Rvci5lbGQ7Cj4gIAkJYXVkaW8ud3JpdGUJPSBoZG1pX3dyaXRlYjsKPiAgCQlhdWRpby5yZWFk
CT0gaGRtaV9yZWFkYjsKPiAgCQloZG1pLT5lbmFibGVfYXVkaW8gPSBkd19oZG1pX2kyc19hdWRp
b19lbmFibGU7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
