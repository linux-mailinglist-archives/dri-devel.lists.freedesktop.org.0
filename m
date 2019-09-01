Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29948A48A8
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 12:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435156E1D2;
	Sun,  1 Sep 2019 10:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092066088.outbound.protection.outlook.com [40.92.66.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54D76E1D2
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 10:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkbehVc7oP/dh9Cps3Ox79sWtE5xjnwgI7pxhpTOZ1YV0wNviIt0HQotyDMf1UvOxivJSIKaLQAQKb+Y8U4uluXZ7v9CudLEQ+dHTH0znJdDS6q6sms0qvti+ZAoGtmQswwv4aMLo34t6Q6gtantJ8jDeLR47lch6cckTXa8u6xfJT49nOZFPL9XLCDYFHSkyKSTa9iBP9Y/lf+T0hCtexE8QHZ9rIyeZ2O8y5B+sCUaxAhoKovNeuFU+yCuvMWNmsJDQEQPNkR7JH/yWc0IMjcjOnhrIQvKYH1tnWo8Ndu5vwmvbRxy2ggazTm+FRoxWggQmWZAD9n6R4R61jY6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaavbiEG3ZX9MFpUhrwDr9aaAj5KgWam58l2xiiE6eQ=;
 b=l6sIMC+Bb89eVWvxW1RB5egb4YTTxLdfcWVoaLo9fCA+zKXwvk17cgChbUGzKKqOacaKoMgDKgWjOWOpc9X2pcDHYV4qYUsM4QE1maIqeGyjMy3qxnepQMhi/j5ceuzJXRNLQrkSdrdrm098VgllknEPf6NZD7RlWxce0PfhXhRbiJOXm+NVfbbkyffvfZ7iOIVtr3r6xbXrxSHlez5bq8WC9wc3Q46h4pm1gaX1HmWZi7MsUvNLa2rYdN3LDrZwFfMb5Rdr1zMYgZDuF+lIR3fFFf9C19Gj3PFGFVlBKGptGsVskZI6ow66yUBcTLSrX/Y2Og0/E4vo3PnIeD3DEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT007.eop-EUR01.prod.protection.outlook.com
 (10.152.0.51) by HE1EUR01HT185.eop-EUR01.prod.protection.outlook.com
 (10.152.1.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 10:03:53 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.57) by
 HE1EUR01FT007.mail.protection.outlook.com (10.152.1.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 10:03:53 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088%3]) with mapi id 15.20.2199.021; Sun, 1 Sep 2019
 10:03:53 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Cheng-Yi Chiang <cychiang@chromium.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: dw-hdmi-i2s: enable audio clock in audio_startup
Thread-Topic: [PATCH] drm: dw-hdmi-i2s: enable audio clock in audio_startup
Thread-Index: AQHVXiJ4olMh5nfx9ESKyNNc1nttD6cWnNeA
Date: Sun, 1 Sep 2019 10:03:53 +0000
Message-ID: <HE1PR06MB4011FA45247F186BB83DFF04ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20190829042957.150929-1-cychiang@chromium.org>
In-Reply-To: <20190829042957.150929-1-cychiang@chromium.org>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::12)
 To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:16C72D0C8AB52BEE626484D0B0E852CFFB509B27838AC274E6A26036719DAA6B;
 UpperCasedChecksum:118D8592DF4188344C2A8E08D26BEBCC14626A9511864823E42993A4B8E11281;
 SizeAsReceived:8542; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [+npBKufwFZGj9FtjgXjbVb5NfZd1lCOJ]
x-microsoft-original-message-id: <4c191c41-1e7a-0fd5-e4c8-f5df55a92fc4@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:HE1EUR01HT185; 
x-ms-traffictypediagnostic: HE1EUR01HT185:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: qId+/Ijj75PN1F7VHwgSPyHM6ytGrwqcE0kM9ZL5GN8eIY6LX1+kkIR0e+NM1JiunrCQDeVb7SFyzTa+RWRxARj/pD6QUH0dzyd3QsN5jiDmSt4uDgLLOuIRlZQrkcuJwZBNfYfbzgoKIjqzvmmkecbCX0YzGKnjEGWiHIufvHMeNxLmyb2OAnEnpQUOmrYz
x-ms-exchange-transport-forked: True
Content-ID: <0218E2ADABBE9D4DBD0D6B875F7CFEE1@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8ec63f-234b-4be1-5cad-08d72ec3b1b5
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 10:03:53.5265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT185
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>,
 "zhengxing@rock-chips.com" <zhengxing@rock-chips.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "jeffy.chen@rock-chips.com" <jeffy.chen@rock-chips.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "cain.cai@rock-chips.com" <cain.cai@rock-chips.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "eddie.cai@rock-chips.com" <eddie.cai@rock-chips.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "dgreid@chromium.org" <dgreid@chromium.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yOSAwNjoyOSwgQ2hlbmctWWkgQ2hpYW5nIHdyb3RlOgo+IEluIHRoZSBkZXNp
Z253YXJlIGRhdGFib29rLCB0aGUgc2VxdWVuY2Ugb2YgZW5hYmxpbmcgYXVkaW8gY2xvY2sgYW5k
Cj4gc2V0dGluZyBmb3JtYXQgaXMgbm90IGNsZWFybHkgc3BlY2lmaWVkLgo+IEN1cnJlbnRseSwg
YXVkaW8gY2xvY2sgaXMgZW5hYmxlZCBpbiB0aGUgZW5kIG9mIGh3X3BhcmFtIG9wcyBhZnRlcgo+
IHNldHRpbmcgZm9ybWF0Lgo+Cj4gT24gc29tZSBtb25pdG9ycywgdGhlcmUgaXMgYSBwb3NzaWJp
bGl0eSB0aGF0IGF1ZGlvIGRvZXMgbm90IGNvbWUgb3V0Lgo+IEZpeCB0aGlzIGJ5IGVuYWJsaW5n
IGF1ZGlvIGNsb2NrIGluIGF1ZGlvX3N0YXJ0dXAgb3BzCj4gYmVmb3JlIGh3X3BhcmFtIG9wcyBz
ZXR0aW5nIGZvcm1hdC4KPgo+IFNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlh
bmdAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWktaTJzLWF1ZGlvLmMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLWkycy1hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLWkycy1hdWRpby5jCj4gaW5kZXggNWNiYjcxYTg2NmQ1Li4wOGI0YWRiYjFkZGMg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWky
cy1hdWRpby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LWkycy1hdWRpby5jCj4gQEAgLTY5LDYgKzY5LDE0IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9pMnNf
aHdfcGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgCWhkbWlfd3JpdGUo
YXVkaW8sIGNvbmYwLCBIRE1JX0FVRF9DT05GMCk7Cj4gIAloZG1pX3dyaXRlKGF1ZGlvLCBjb25m
MSwgSERNSV9BVURfQ09ORjEpOwo+ICAKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
aW50IGR3X2hkbWlfaTJzX2F1ZGlvX3N0YXJ0dXAoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpk
YXRhKQo+ICt7Cj4gKwlzdHJ1Y3QgZHdfaGRtaV9pMnNfYXVkaW9fZGF0YSAqYXVkaW8gPSBkYXRh
Owo+ICsJc3RydWN0IGR3X2hkbWkgKmhkbWkgPSBhdWRpby0+aGRtaTsKPiArCj4gIAlkd19oZG1p
X2F1ZGlvX2VuYWJsZShoZG1pKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiBAQCAtMTA1LDYgKzExMyw3
IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9pMnNfZ2V0X2RhaV9pZChzdHJ1Y3Qgc25kX3NvY19jb21w
b25lbnQgKmNvbXBvbmVudCwKPiAgfQo+ICAKPiAgc3RhdGljIHN0cnVjdCBoZG1pX2NvZGVjX29w
cyBkd19oZG1pX2kyc19vcHMgPSB7Cj4gKwkuYXVkaW9fc3RhcnR1cCA9IGR3X2hkbWlfaTJzX2F1
ZGlvX3N0YXJ0dXAsCgpBIHNtYWxsIHdoaXRlIHNwYWNlIG5pdCwgdGhlcmUgc2hvdWxkIGJlIGEg
dGFiIGFuZCBub3Qgc3BhY2UgdG8gYWxpZ24gdGhlIGVxdWFsIHNpZ24gYWJvdmUuCkFsc28gdGhp
cyBwYXRjaCBkbyBub3QgY2xlYW5seSBhcHBseSB0byBkcm0tbWlzYy1uZXh0IG9yIGxpbnV4LW5l
eHQgYWZ0ZXIKZmMxY2E2ZTAxZDBhICJkcm0vYnJpZGdlOiBkdy1oZG1pLWkyczogYWRkIC5nZXRf
ZWxkIHN1cHBvcnQiIHdhcyBtZXJnZWQuCgpUaGlzIHBhdGNoIGRvZXMgZml4IGFuIGlzc3VlIEkg
aGF2ZSBvYnNlcnZlZCBvbiBteSBSb2NrY2hpcCBkZXZpY2VzIHdoZXJlIGF1ZGlvIHdvdWxkIG5v
dCBhbHdheXMKY2FtZSBvdXQgYWZ0ZXIgc3dpdGNoaW5nIGJldHdlZW4gYXVkaW8gc3RyZWFtcyBo
YXZpbmcgZGlmZmVyZW50IHJhdGUgYW5kIGNoYW5uZWxzIHBhcmFtZXRlcnMuCkkgdXNlZCB0byBj
YXJyeSBbMV0gdG8gZml4IHRoYXQgaXNzdWUsIGJ1dCB0aGlzIHNlZW1zIGxpa2UgYSBtb3JlIHNh
bmUgZml4LgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9Ld2lib28vbGludXgtcm9ja2NoaXAvY29t
bWl0LzQ4NjJlNDA0NDUzMmI4YjQ4MGZhM2EwZmFkZGMxOTc1ODY2MjM4MDgKCldpdGggYWJvdmUg
Zml4ZWQsCgpSZXZpZXdlZC1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgoKUmVn
YXJkcywKSm9uYXMKCj4gIAkuaHdfcGFyYW1zCT0gZHdfaGRtaV9pMnNfaHdfcGFyYW1zLAo+ICAJ
LmF1ZGlvX3NodXRkb3duCT0gZHdfaGRtaV9pMnNfYXVkaW9fc2h1dGRvd24sCj4gIAkuZ2V0X2Rh
aV9pZAk9IGR3X2hkbWlfaTJzX2dldF9kYWlfaWQsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
