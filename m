Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C27811E8F0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A4A6E2EA;
	Fri, 13 Dec 2019 17:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9846E2EA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:10:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A61B7E1D;
 Fri, 13 Dec 2019 18:10:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576257047;
 bh=zn9I2+W9n9yW37O2l/bdOIDUCOKYH46nzAWKSfMmVvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wn0wp5tCAQBmrc56Ik8TmVWk61nc4RX1gJmKqw8lmCyCVW+KVYoSLrShHab6Xt4dC
 uqbqZALEMxZVX2t/yhcWTbEfZ/jk/9cZcOTbmApylU5oZJ/wf+QHSfA6AUmqeKwpFq
 3CQSiQyMdpPGSgke/7BeNf2TEVR0W1cHhj8ZZs+o=
Date: Fri, 13 Dec 2019 19:10:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Message-ID: <20191213171038.GH4860@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
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
 Simon Horman <horms@verge.net.au>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpPbiBXZWQsIE5vdiAxMywgMjAxOSBhdCAwMzo1MToyNVBNICswMDAwLCBG
YWJyaXppbyBDYXN0cm8gd3JvdGU6Cj4gQWRkIHN1cHBvcnQgZm9yIHRyYW5zcGFyZW50IExWRFMg
ZGVjb2RlcnMgYnkgYWRkaW5nIGEgbmV3Cj4gY29tcGF0aWJsZSBzdHJpbmcgKCJsdmRzLWRlY29k
ZXIiKSB0byB0aGUgZHJpdmVyLgo+IFRoaXMgcGF0Y2ggYWxzbyBhZGRzIG1lbWJlciBjb25uZWN0
b3JfdHlwZSB0byBzdHJ1Y3QgbHZkc19jb2RlYywKPiBhbmQgdGhhdCdzIGJlY2F1c2UgTFZEUyBk
ZWNvZGVycyBoYXZlIGEgZGlmZmVyZW50IGNvbm5lY3RvciB0eXBlCj4gZnJvbSBMVkRTIGVuY29k
ZXJzLiBXZSBmaWxsIHRoaXMgbmV3IG1lbWJlciB1cCB3aXRoIHRoZSBkYXRhCj4gbWF0Y2hpbmcg
dGhlIGNvbXBhdGlibGUgc3RyaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3Ry
byA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+IAo+IC0tLQo+IHYzLT52NDoKPiAq
IE5ldyBwYXRjaAo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYyB8
IDE5ICsrKysrKysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvbHZkcy1jb2RlYy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmMKPiBp
bmRleCBiNTgwMWEyLi5jMzJlMTI1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvbHZkcy1jb2RlYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVj
LmMKPiBAQCAtNyw2ICs3LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGgu
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICAKPiBAQCAtMTcsNiAr
MTgsNyBAQCBzdHJ1Y3QgbHZkc19jb2RlYyB7Cj4gIAlzdHJ1Y3QgZHJtX2JyaWRnZSBicmlkZ2U7
Cj4gIAlzdHJ1Y3QgZHJtX2JyaWRnZSAqcGFuZWxfYnJpZGdlOwo+ICAJc3RydWN0IGdwaW9fZGVz
YyAqcG93ZXJkb3duX2dwaW87Cj4gKwl1MzIgY29ubmVjdG9yX3R5cGU7Cj4gIH07Cj4gIAo+ICBz
dGF0aWMgaW50IGx2ZHNfY29kZWNfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4g
QEAgLTY1LDYgKzY3LDcgQEAgc3RhdGljIGludCBsdmRzX2NvZGVjX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlpZiAoIWx2ZHNfY29kZWMpCj4gIAkJcmV0dXJuIC1FTk9N
RU07Cj4gIAo+ICsJbHZkc19jb2RlYy0+Y29ubmVjdG9yX3R5cGUgPSAodTMyKW9mX2RldmljZV9n
ZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsKCkknbSBub3cgZ2V0dGluZyBhIGNvbXBpbGF0aW9u
IGZhaWx1cmUgaGVyZToKCmRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jOiBJbiBm
dW5jdGlvbiDigJhsdmRzX2NvZGVjX3Byb2Jl4oCZOgpkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2
ZHMtY29kZWMuYzo2ODozMTogZXJyb3I6IGNhc3QgZnJvbSBwb2ludGVyIHRvIGludGVnZXIgb2Yg
ZGlmZmVyZW50IHNpemUgWy1XZXJyb3I9cG9pbnRlci10by1pbnQtY2FzdF0KICBsdmRzX2NvZGVj
LT5jb25uZWN0b3JfdHlwZSA9ICh1MzIpb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5k
ZXYpOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoKVGhlIGZpeCBzaG91bGQgYmUg
c2ltcGxlOgoKCWx2ZHNfY29kZWMtPmNvbm5lY3Rvcl90eXBlID0gKHVpbnRwdHJfdClvZl9kZXZp
Y2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKCkknbSBib3RoZXJlZCBieSB0aGUgZmFjdCB0aGF0IEkn
dmUgY29tcGlsZWQgdGhpcyBiZWZvcmUgd2l0aG91dCBhbnkKaXNzdWUsIHNvIHRoaXMgcmVhbGx5
IHB1enpsZXMgbWUuIERvIHlvdSBnZXQgdGhlIHNhbWUgd2FybmluZyA/Cgo+ICAJbHZkc19jb2Rl
Yy0+cG93ZXJkb3duX2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJwb3dlcmRv
d24iLAo+ICAJCQkJCQkJICAgICBHUElPRF9PVVRfSElHSCk7Cj4gIAlpZiAoSVNfRVJSKGx2ZHNf
Y29kZWMtPnBvd2VyZG93bl9ncGlvKSkgewo+IEBAIC0xMDUsNyArMTA4LDcgQEAgc3RhdGljIGlu
dCBsdmRzX2NvZGVjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJ
bHZkc19jb2RlYy0+cGFuZWxfYnJpZGdlID0KPiAgCQlkZXZtX2RybV9wYW5lbF9icmlkZ2VfYWRk
X3R5cGVkKGRldiwgcGFuZWwsCj4gLQkJCQkJCURSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTKTsKPiAr
CQkJCQkJbHZkc19jb2RlYy0+Y29ubmVjdG9yX3R5cGUpOwo+ICAJaWYgKElTX0VSUihsdmRzX2Nv
ZGVjLT5wYW5lbF9icmlkZ2UpKQo+ICAJCXJldHVybiBQVFJfRVJSKGx2ZHNfY29kZWMtPnBhbmVs
X2JyaWRnZSk7Cj4gIAo+IEBAIC0xMzMsOCArMTM2LDE4IEBAIHN0YXRpYyBpbnQgbHZkc19jb2Rl
Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgfQo+ICAKPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbHZkc19jb2RlY19tYXRjaFtdID0gewo+IC0JeyAu
Y29tcGF0aWJsZSA9ICJsdmRzLWVuY29kZXIiIH0sCj4gLQl7IC5jb21wYXRpYmxlID0gInRoaW5l
LHRoYzYzbHZkbTgzZCIgfSwKPiArCXsKPiArCQkuY29tcGF0aWJsZSA9ICJsdmRzLWRlY29kZXIi
LAo+ICsJCS5kYXRhID0gKHZvaWQgKilEUk1fTU9ERV9DT05ORUNUT1JfRFBJLAo+ICsJfSwKPiAr
CXsKPiArCQkuY29tcGF0aWJsZSA9ICJsdmRzLWVuY29kZXIiLAo+ICsJCS5kYXRhID0gKHZvaWQg
KilEUk1fTU9ERV9DT05ORUNUT1JfTFZEUywKPiArCX0sCj4gKwl7Cj4gKwkJLmNvbXBhdGlibGUg
PSAidGhpbmUsdGhjNjNsdmRtODNkIiwKPiArCQkuZGF0YSA9ICh2b2lkICopRFJNX01PREVfQ09O
TkVDVE9SX0xWRFMsCj4gKwl9LAo+ICAJe30sCj4gIH07Cj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIGx2ZHNfY29kZWNfbWF0Y2gpOwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
