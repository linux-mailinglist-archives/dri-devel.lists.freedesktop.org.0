Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC47C1FDB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 13:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F5C6E378;
	Mon, 30 Sep 2019 11:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54056E378
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 11:15:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UBFNhK084786;
 Mon, 30 Sep 2019 06:15:23 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UBFNvl081834
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Sep 2019 06:15:23 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 06:15:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 06:15:13 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UBFKlj045295;
 Mon, 30 Sep 2019 06:15:21 -0500
Subject: Re: [PATCH 10/60] drm/bridge: Add bridge driver for display connectors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-7-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <6024b178-f4e0-b54a-fcec-ace6ec256048@ti.com>
Date: Mon, 30 Sep 2019 14:15:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190707181937.6250-7-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569842123;
 bh=shWE8eLSrOk2LIBBN13KFmNyDbAeusJaH/SlDIzZqCw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=LNCVE6hASW81AeUqb+muY1VDP2aVPVyZVZxDhnQbKGu4y6b+micE7EfCM6s0CVGLE
 CFFFHDxIeJCQipeO/Y6EQfXQjW2iYIlk9RR3Dr4IYdRH/JWgNhRXLwQ0RqyeOYAQJx
 xsOH8OSkvYETqQGVH5Q7DDd27uDqaj5FMvlBSl54=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIDA3LzA3LzIwMTkgMjE6MTgsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4gRGlzcGxheSBjb25uZWN0b3JzIGFyZSBtb2RlbGxlZCBpbiBEVCBhcyBhIGRldmljZSBub2Rl
LCBidXQgaGF2ZSBzbyBmYXIKPiBiZWVuIGhhbmRsZWQgbWFudWFsbHkgaW4gc2V2ZXJhbCBicmlk
Z2UgZHJpdmVycy4gVGhpcyByZXN1bHRlZCBpbgo+IGR1cGxpY2F0ZSBjb2RlIGluIHNldmVyYWwg
YnJpZGdlIGRyaXZlcnMsIHdpdGggc2xpZ2h0bHkgZGlmZmVyZW50IChhbmQKPiB0aHVzIGNvbmZ1
c2luZykgbG9naWNzLgo+IAo+IEluIG9yZGVyIHRvIGZpeCB0aGlzLCBpbXBsZW1lbnQgYSBicmlk
Z2UgZHJpdmVyIGZvciBkaXNwbGF5IGNvbm5lY3RvcnMuCj4gVGhlIGRyaXZlciBjZW50cmFsaXNl
cyBsb2dpYyBmb3IgdGhlIERWSSwgSERNSSwgVkdBbiBjb21wb3NpdGUgYW5kCj4gUy12aWRlbyBj
b25uZWN0b3JzIGFuZCBleHBvc2VzIGNvcnJlc3BvbmRpbmcgYnJpZGdlIG9wZXJhdGlvbnMuCj4g
Cj4gVGhpcyBkcml2ZXIgaW4gaXRzZWxmIGRvZXNuJ3Qgc29sdmUgdGhlIGlzc3VlIGNvbXBsZXRl
bHksIGNoYW5nZXMgaW4KPiBicmlkZ2UgYW5kIGRpc3BsYXkgY29udHJvbGxlciBkcml2ZXJzIGFy
ZSBuZWVkZWQgdG8gbWFrZSB1c2Ugb2YgdGhlIG5ldwo+IGNvbm5lY3RvciBkcml2ZXIuCj4gCj4g
U2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnICAgICAg
ICAgICAgIHwgIDExICsKPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUgICAgICAg
ICAgICB8ICAgMSArCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Rpc3BsYXktY29ubmVjdG9y
LmMgfCAzMjcgKysrKysrKysrKysrKysrKysrKysrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDMzOSBp
bnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9kaXNwbGF5LWNvbm5lY3Rvci5jCgoKPiArCWRldl9pbmZvKCZwZGV2LT5kZXYsCj4gKwkJICJG
b3VuZCAlcyBkaXNwbGF5IGNvbm5lY3RvciAnJXMnICVzIEREQyBidXMgYW5kICVzIEhQRCBHUElP
IChvcHMgMHgleClcbiIsCj4gKwkJIGRpc3BsYXlfY29ubmVjdG9yX3R5cGVfbmFtZShjb25uKSwK
PiArCQkgY29ubi0+bGFiZWwgPyBjb25uLT5sYWJlbCA6ICI8dW5sYWJlbGxlZD4iLAo+ICsJCSBj
b25uLT5kZGMgPyAid2l0aCIgOiAid2l0aG91dCIsCj4gKwkJIGNvbm4tPmhwZF9ncGlvID8gIndp
dGgiIDogIndpdGhvdXQiLAo+ICsJCSBjb25uLT5icmlkZ2Uub3BzKTsKCmRldl9kYmcoKT8KCiAg
VG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIs
IDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFp
a2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
