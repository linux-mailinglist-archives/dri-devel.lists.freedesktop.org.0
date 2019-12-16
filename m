Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE0C121BA2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 22:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9998C6E8A9;
	Mon, 16 Dec 2019 21:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE84B6E8A9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 21:22:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE6B6A34;
 Mon, 16 Dec 2019 22:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576531340;
 bh=i/uB6H/CjaAw0feo0Z/rgT5eoamSWrMJVqfUrzcWYZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BlookWsAG5UmDE9RJphOSHHcIUkb5/WhcfOte9jJq7WeSkLXTNi8g2kJCx1EVQV2K
 V6bQovyrWNd1UqPeisfwUa9XKH+v4YehVOrGxJqN+2fFxDqTNa4dHNXPBe8g2tlyHJ
 oLvFqhEMgaE7ajFMOe9V/dgaC149oCDrC/6yrfTE=
Date: Mon, 16 Dec 2019 23:22:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Message-ID: <20191216212210.GA15826@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213171038.GH4860@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpQaW5nID8KCk9uIEZyaSwgRGVjIDEzLCAyMDE5IGF0IDA3OjEwOjM4UE0g
KzAyMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gT24gV2VkLCBOb3YgMTMsIDIwMTkgYXQg
MDM6NTE6MjVQTSArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOgo+ID4gQWRkIHN1cHBvcnQg
Zm9yIHRyYW5zcGFyZW50IExWRFMgZGVjb2RlcnMgYnkgYWRkaW5nIGEgbmV3Cj4gPiBjb21wYXRp
YmxlIHN0cmluZyAoImx2ZHMtZGVjb2RlciIpIHRvIHRoZSBkcml2ZXIuCj4gPiBUaGlzIHBhdGNo
IGFsc28gYWRkcyBtZW1iZXIgY29ubmVjdG9yX3R5cGUgdG8gc3RydWN0IGx2ZHNfY29kZWMsCj4g
PiBhbmQgdGhhdCdzIGJlY2F1c2UgTFZEUyBkZWNvZGVycyBoYXZlIGEgZGlmZmVyZW50IGNvbm5l
Y3RvciB0eXBlCj4gPiBmcm9tIExWRFMgZW5jb2RlcnMuIFdlIGZpbGwgdGhpcyBuZXcgbWVtYmVy
IHVwIHdpdGggdGhlIGRhdGEKPiA+IG1hdGNoaW5nIHRoZSBjb21wYXRpYmxlIHN0cmluZy4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAu
cmVuZXNhcy5jb20+Cj4gPiAKPiA+IC0tLQo+ID4gdjMtPnY0Ogo+ID4gKiBOZXcgcGF0Y2gKPiA+
IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jIHwgMTkgKysrKysr
KysrKysrKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9s
dmRzLWNvZGVjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYwo+ID4gaW5k
ZXggYjU4MDFhMi4uYzMyZTEyNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvbHZkcy1jb2RlYy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29k
ZWMuYwo+ID4gQEAgLTcsNiArNyw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3Vt
ZXIuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4
L29mLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+ID4gICNpbmNsdWRlIDxs
aW51eC9vZl9ncmFwaC5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4K
PiA+ICAKPiA+IEBAIC0xNyw2ICsxOCw3IEBAIHN0cnVjdCBsdmRzX2NvZGVjIHsKPiA+ICAJc3Ry
dWN0IGRybV9icmlkZ2UgYnJpZGdlOwo+ID4gIAlzdHJ1Y3QgZHJtX2JyaWRnZSAqcGFuZWxfYnJp
ZGdlOwo+ID4gIAlzdHJ1Y3QgZ3Bpb19kZXNjICpwb3dlcmRvd25fZ3BpbzsKPiA+ICsJdTMyIGNv
bm5lY3Rvcl90eXBlOwo+ID4gIH07Cj4gPiAgCj4gPiAgc3RhdGljIGludCBsdmRzX2NvZGVjX2F0
dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ID4gQEAgLTY1LDYgKzY3LDcgQEAgc3Rh
dGljIGludCBsdmRzX2NvZGVjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
PiAgCWlmICghbHZkc19jb2RlYykKPiA+ICAJCXJldHVybiAtRU5PTUVNOwo+ID4gIAo+ID4gKwls
dmRzX2NvZGVjLT5jb25uZWN0b3JfdHlwZSA9ICh1MzIpb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRh
KCZwZGV2LT5kZXYpOwo+IAo+IEknbSBub3cgZ2V0dGluZyBhIGNvbXBpbGF0aW9uIGZhaWx1cmUg
aGVyZToKPiAKPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYzogSW4gZnVuY3Rp
b24g4oCYbHZkc19jb2RlY19wcm9iZeKAmToKPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMt
Y29kZWMuYzo2ODozMTogZXJyb3I6IGNhc3QgZnJvbSBwb2ludGVyIHRvIGludGVnZXIgb2YgZGlm
ZmVyZW50IHNpemUgWy1XZXJyb3I9cG9pbnRlci10by1pbnQtY2FzdF0KPiAgIGx2ZHNfY29kZWMt
PmNvbm5lY3Rvcl90eXBlID0gKHUzMilvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRl
dik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiAKPiBUaGUgZml4IHNob3Vs
ZCBiZSBzaW1wbGU6Cj4gCj4gCWx2ZHNfY29kZWMtPmNvbm5lY3Rvcl90eXBlID0gKHVpbnRwdHJf
dClvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPiAKPiBJJ20gYm90aGVyZWQgYnkgdGhl
IGZhY3QgdGhhdCBJJ3ZlIGNvbXBpbGVkIHRoaXMgYmVmb3JlIHdpdGhvdXQgYW55Cj4gaXNzdWUs
IHNvIHRoaXMgcmVhbGx5IHB1enpsZXMgbWUuIERvIHlvdSBnZXQgdGhlIHNhbWUgd2FybmluZyA/
Cj4gCj4gPiAgCWx2ZHNfY29kZWMtPnBvd2VyZG93bl9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0
aW9uYWwoZGV2LCAicG93ZXJkb3duIiwKPiA+ICAJCQkJCQkJICAgICBHUElPRF9PVVRfSElHSCk7
Cj4gPiAgCWlmIChJU19FUlIobHZkc19jb2RlYy0+cG93ZXJkb3duX2dwaW8pKSB7Cj4gPiBAQCAt
MTA1LDcgKzEwOCw3IEBAIHN0YXRpYyBpbnQgbHZkc19jb2RlY19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ID4gIAo+ID4gIAlsdmRzX2NvZGVjLT5wYW5lbF9icmlkZ2UgPQo+
ID4gIAkJZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2FkZF90eXBlZChkZXYsIHBhbmVsLAo+ID4gLQkJ
CQkJCURSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTKTsKPiA+ICsJCQkJCQlsdmRzX2NvZGVjLT5jb25u
ZWN0b3JfdHlwZSk7Cj4gPiAgCWlmIChJU19FUlIobHZkc19jb2RlYy0+cGFuZWxfYnJpZGdlKSkK
PiA+ICAJCXJldHVybiBQVFJfRVJSKGx2ZHNfY29kZWMtPnBhbmVsX2JyaWRnZSk7Cj4gPiAgCj4g
PiBAQCAtMTMzLDggKzEzNiwxOCBAQCBzdGF0aWMgaW50IGx2ZHNfY29kZWNfcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgfQo+ID4gIAo+ID4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIGx2ZHNfY29kZWNfbWF0Y2hbXSA9IHsKPiA+IC0JeyAuY29tcGF0
aWJsZSA9ICJsdmRzLWVuY29kZXIiIH0sCj4gPiAtCXsgLmNvbXBhdGlibGUgPSAidGhpbmUsdGhj
NjNsdmRtODNkIiB9LAo+ID4gKwl7Cj4gPiArCQkuY29tcGF0aWJsZSA9ICJsdmRzLWRlY29kZXIi
LAo+ID4gKwkJLmRhdGEgPSAodm9pZCAqKURSTV9NT0RFX0NPTk5FQ1RPUl9EUEksCj4gPiArCX0s
Cj4gPiArCXsKPiA+ICsJCS5jb21wYXRpYmxlID0gImx2ZHMtZW5jb2RlciIsCj4gPiArCQkuZGF0
YSA9ICh2b2lkICopRFJNX01PREVfQ09OTkVDVE9SX0xWRFMsCj4gPiArCX0sCj4gPiArCXsKPiA+
ICsJCS5jb21wYXRpYmxlID0gInRoaW5lLHRoYzYzbHZkbTgzZCIsCj4gPiArCQkuZGF0YSA9ICh2
b2lkICopRFJNX01PREVfQ09OTkVDVE9SX0xWRFMsCj4gPiArCX0sCj4gPiAgCXt9LAo+ID4gIH07
Cj4gPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbHZkc19jb2RlY19tYXRjaCk7CgotLSAKUmVn
YXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
