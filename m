Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF9010F899
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 08:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BE56E3D6;
	Tue,  3 Dec 2019 07:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA456E3D6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 07:17:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71191309;
 Tue,  3 Dec 2019 08:17:03 +0100 (CET)
Date: Tue, 3 Dec 2019 09:16:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 25/26] drm/panel: tpo-td028ttec1: use drm_panel
 backlight support
Message-ID: <20191203071656.GJ4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-26-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-26-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575357423;
 bh=2sS2BNdYv6fX1ZVYfHwfsift774drFxDzzXfy61j3mo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bPWhZrNrgOWtYf8bWSO9OXFRAzb0KzASqB+zcaGgwB8egLfVpmjpHb99ocat/HVZ2
 KXP6LctrJxUyHcBA8x+LtERl6X5lfcld+a+pF6yK2NbTsQYBNyZReQFnyJF+++NUfS
 WDvTL4PNlJKHLKW1i522QTbrUwCqyUerScR5JFEU=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBNb24sIERlYyAwMiwgMjAxOSBh
dCAwODozMjoyOVBNICswMTAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gVXNlIHRoZSBiYWNrbGln
aHQgc3VwcG9ydCBpbiBkcm1fcGFuZWwgdG8gc2ltcGxpZnkgdGhlIGRyaXZlcgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogVGhpZXJyeSBS
ZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC10cG8tdGQwMjh0dGVjMS5jIHwgMTQgKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQwMjh0dGVjMS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXRwby10ZDAyOHR0ZWMxLmMKPiBpbmRleCAzNzI1MjU5MGI1NDEuLmNm
Mjk0MDVhMmRiZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBv
LXRkMDI4dHRlYzEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQw
Mjh0dGVjMS5jCj4gQEAgLTE3LDcgKzE3LDYgQEAKPiAgICogSC4gTmlrb2xhdXMgU2NoYWxsZXIg
PGhuc0Bnb2xkZWxpY28uY29tPgo+ICAgKi8KPiAgCj4gLSNpbmNsdWRlIDxsaW51eC9iYWNrbGln
aHQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1
bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NwaS9zcGkuaD4KPiBAQCAtODMsNyArODIsNiBAQCBz
dHJ1Y3QgdGQwMjh0dGVjMV9wYW5lbCB7Cj4gIAlzdHJ1Y3QgZHJtX3BhbmVsIHBhbmVsOwo+ICAK
PiAgCXN0cnVjdCBzcGlfZGV2aWNlICpzcGk7Cj4gLQlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAq
YmFja2xpZ2h0Owo+ICB9Owo+ICAKPiAgI2RlZmluZSB0b190ZDAyOHR0ZWMxX2RldmljZShwKSBj
b250YWluZXJfb2YocCwgc3RydWN0IHRkMDI4dHRlYzFfcGFuZWwsIHBhbmVsKQo+IEBAIC0yNDMs
OCArMjQxLDYgQEAgc3RhdGljIGludCB0ZDAyOHR0ZWMxX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVs
ICpwYW5lbCkKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQliYWNrbGlnaHRf
ZW5hYmxlKGxjZC0+YmFja2xpZ2h0KTsKPiAtCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiBAQCAt
MjUyLDggKzI0OCw2IEBAIHN0YXRpYyBpbnQgdGQwMjh0dGVjMV9kaXNhYmxlKHN0cnVjdCBkcm1f
cGFuZWwgKnBhbmVsKQo+ICB7Cj4gIAlzdHJ1Y3QgdGQwMjh0dGVjMV9wYW5lbCAqbGNkID0gdG9f
dGQwMjh0dGVjMV9kZXZpY2UocGFuZWwpOwo+ICAKPiAtCWJhY2tsaWdodF9kaXNhYmxlKGxjZC0+
YmFja2xpZ2h0KTsKPiAtCj4gIAlqYnRfcmV0X3dyaXRlXzAobGNkLCBKQlRfUkVHX0RJU1BMQVlf
T0ZGLCBOVUxMKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiBAQCAtMzM0LDEwICszMjgsNiBAQCBzdGF0
aWMgaW50IHRkMDI4dHRlYzFfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKPiAgCXNwaV9z
ZXRfZHJ2ZGF0YShzcGksIGxjZCk7Cj4gIAlsY2QtPnNwaSA9IHNwaTsKPiAgCj4gLQlsY2QtPmJh
Y2tsaWdodCA9IGRldm1fb2ZfZmluZF9iYWNrbGlnaHQoJnNwaS0+ZGV2KTsKPiAtCWlmIChJU19F
UlIobGNkLT5iYWNrbGlnaHQpKQo+IC0JCXJldHVybiBQVFJfRVJSKGxjZC0+YmFja2xpZ2h0KTsK
PiAtCj4gIAlzcGktPm1vZGUgPSBTUElfTU9ERV8zOwo+ICAJc3BpLT5iaXRzX3Blcl93b3JkID0g
OTsKPiAgCj4gQEAgLTM1MCw2ICszNDAsMTAgQEAgc3RhdGljIGludCB0ZDAyOHR0ZWMxX3Byb2Jl
KHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCj4gIAlkcm1fcGFuZWxfaW5pdCgmbGNkLT5wYW5lbCwg
JmxjZC0+c3BpLT5kZXYsICZ0ZDAyOHR0ZWMxX2Z1bmNzLAo+ICAJCSAgICAgICBEUk1fTU9ERV9D
T05ORUNUT1JfRFBJKTsKPiAgCj4gKwlyZXQgPSBkcm1fcGFuZWxfb2ZfYmFja2xpZ2h0KCZsY2Qt
PnBhbmVsKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gIAlyZXR1cm4gZHJt
X3BhbmVsX2FkZCgmbGNkLT5wYW5lbCk7Cj4gIH0KPiAgCgotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
