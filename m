Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18A410F7C2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 07:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201A86E398;
	Tue,  3 Dec 2019 06:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE88C6E398
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 06:25:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED8F8309;
 Tue,  3 Dec 2019 07:25:05 +0100 (CET)
Date: Tue, 3 Dec 2019 08:24:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 01/26] drm/drm_panel: no error when no callback
Message-ID: <20191203062459.GA4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-2-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575354306;
 bh=xMhIy5HaiSKkNSrpN5V89DDzQfYcJU5ugOWimrHaPOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h6qBeI/WhmgWblAgjLQFXmZpvICtdJ7ang5ZAu5QF/RWsHFhxgfKLrUQgLiN0ZySP
 te8cQY0l0xw5SKujiIaFAPliBjJuQRSuy8VjWqLPVlmREWdKpCygHfjb38yR1iYlaQ
 x2aoQRv36caeBrjXBdi/fF336MdBMzwTFlpaN1nk=
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
dCAwODozMjowNVBNICswMTAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gVGhlIGNhbGxiYWNrcyBp
biBkcm1fcGFuZWxfZnVuY3MgYXJlIG9wdGlvbmFsLCBzbyBkbyBub3QKPiByZXR1cm4gYW4gZXJy
b3IganVzdCBiZWNhdXNlIG5vIGNhbGxiYWNrIGlzIGFzc2lnbmVkLgoKVW5sZXNzIEknbSBtaXN0
YWtlbiB0aGUgY2FsbGJhY2tzIGFyZSBub3QgZG9jdW1lbnRlZCBhcyBvcHRpb25hbC4gU2hvdWxk
CnRoaXMgYmUgZml4ZWQgdG9vID8KCj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+
Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWwuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gaW5kZXggZWQ3OTg1YzA1MzVhLi4yZDU5Y2Rk
MDVlNTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gQEAgLTE1MSwxMCArMTUxLDEzIEBAIEVYUE9S
VF9TWU1CT0woZHJtX3BhbmVsX2RldGFjaCk7Cj4gICAqLwo+ICBpbnQgZHJtX3BhbmVsX3ByZXBh
cmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCj4gIHsKPiAtCWlmIChwYW5lbCAmJiBwYW5lbC0+
ZnVuY3MgJiYgcGFuZWwtPmZ1bmNzLT5wcmVwYXJlKQo+ICsJaWYgKCFwYW5lbCkKPiArCQlyZXR1
cm4gLUVJTlZBTDsKPiArCj4gKwlpZiAocGFuZWwtPmZ1bmNzICYmIHBhbmVsLT5mdW5jcy0+cHJl
cGFyZSkKPiAgCQlyZXR1cm4gcGFuZWwtPmZ1bmNzLT5wcmVwYXJlKHBhbmVsKTsKPiAgCj4gLQly
ZXR1cm4gcGFuZWwgPyAtRU5PU1lTIDogLUVJTlZBTDsKPiArCXJldHVybiAwOwo+ICB9Cj4gIEVY
UE9SVF9TWU1CT0woZHJtX3BhbmVsX3ByZXBhcmUpOwo+ICAKPiBAQCAtMTcxLDEwICsxNzQsMTMg
QEAgRVhQT1JUX1NZTUJPTChkcm1fcGFuZWxfcHJlcGFyZSk7Cj4gICAqLwo+ICBpbnQgZHJtX3Bh
bmVsX3VucHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKPiAgewo+IC0JaWYgKHBhbmVs
ICYmIHBhbmVsLT5mdW5jcyAmJiBwYW5lbC0+ZnVuY3MtPnVucHJlcGFyZSkKPiArCWlmICghcGFu
ZWwpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJaWYgKHBhbmVsLT5mdW5jcyAmJiBwYW5l
bC0+ZnVuY3MtPnVucHJlcGFyZSkKPiAgCQlyZXR1cm4gcGFuZWwtPmZ1bmNzLT51bnByZXBhcmUo
cGFuZWwpOwo+ICAKPiAtCXJldHVybiBwYW5lbCA/IC1FTk9TWVMgOiAtRUlOVkFMOwo+ICsJcmV0
dXJuIDA7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChkcm1fcGFuZWxfdW5wcmVwYXJlKTsKPiAgCj4g
QEAgLTE5MCwxMCArMTk2LDEzIEBAIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX3VucHJlcGFyZSk7
Cj4gICAqLwo+ICBpbnQgZHJtX3BhbmVsX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkK
PiAgewo+IC0JaWYgKHBhbmVsICYmIHBhbmVsLT5mdW5jcyAmJiBwYW5lbC0+ZnVuY3MtPmVuYWJs
ZSkKPiArCWlmICghcGFuZWwpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJaWYgKHBhbmVs
LT5mdW5jcyAmJiBwYW5lbC0+ZnVuY3MtPmVuYWJsZSkKPiAgCQlyZXR1cm4gcGFuZWwtPmZ1bmNz
LT5lbmFibGUocGFuZWwpOwo+ICAKPiAtCXJldHVybiBwYW5lbCA/IC1FTk9TWVMgOiAtRUlOVkFM
Owo+ICsJcmV0dXJuIDA7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChkcm1fcGFuZWxfZW5hYmxlKTsK
PiAgCj4gQEAgLTIwOSwxMCArMjE4LDEzIEBAIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX2VuYWJs
ZSk7Cj4gICAqLwo+ICBpbnQgZHJtX3BhbmVsX2Rpc2FibGUoc3RydWN0IGRybV9wYW5lbCAqcGFu
ZWwpCj4gIHsKPiAtCWlmIChwYW5lbCAmJiBwYW5lbC0+ZnVuY3MgJiYgcGFuZWwtPmZ1bmNzLT5k
aXNhYmxlKQo+ICsJaWYgKCFwYW5lbCkKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCj4gKwlpZiAo
cGFuZWwtPmZ1bmNzICYmIHBhbmVsLT5mdW5jcy0+ZGlzYWJsZSkKPiAgCQlyZXR1cm4gcGFuZWwt
PmZ1bmNzLT5kaXNhYmxlKHBhbmVsKTsKPiAgCj4gLQlyZXR1cm4gcGFuZWwgPyAtRU5PU1lTIDog
LUVJTlZBTDsKPiArCXJldHVybiAwOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX2Rp
c2FibGUpOwo+ICAKPiBAQCAtMjI4LDEwICsyNDAsMTMgQEAgRVhQT1JUX1NZTUJPTChkcm1fcGFu
ZWxfZGlzYWJsZSk7Cj4gICAqLwo+ICBpbnQgZHJtX3BhbmVsX2dldF9tb2RlcyhzdHJ1Y3QgZHJt
X3BhbmVsICpwYW5lbCkKPiAgewo+IC0JaWYgKHBhbmVsICYmIHBhbmVsLT5mdW5jcyAmJiBwYW5l
bC0+ZnVuY3MtPmdldF9tb2RlcykKPiArCWlmICghcGFuZWwpCj4gKwkJcmV0dXJuIC1FSU5WQUw7
Cj4gKwo+ICsJaWYgKHBhbmVsLT5mdW5jcyAmJiBwYW5lbC0+ZnVuY3MtPmdldF9tb2RlcykKPiAg
CQlyZXR1cm4gcGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXMocGFuZWwpOwoKU2hvdWxkIGdldF9tb2Rl
cygpIGJlIG9wdGlvbmFsID8gQXMgZmFyIGFzIEkgY2FuIHRlbGwgYWxsIHRoZSBwYW5lbApkcml2
ZXJzIGluIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC8gaW1wbGVtZW50IGl0LCBhbmQgSSdtIG5vdCBz
dXJlIHRvIHNlZQpob3cgYSBwYW5lbCBjb3VsZCBiZSB1c2FibGUgaWYgaXQgY2FuJ3QgcmV0dXJu
IGl0cyBtb2RlLgoKT24gdGhlIG90aGVyIGhhbmQgeW91IHJldHVybiAwIGlmIHRoZSBjYWxsYmFj
ayBpc24ndCBpbXBsZW1lbnRlZCwgd2hpY2gKZG9lc24ndCBtZWFuIHN1Y2Nlc3MgaGVyZSwgc28g
SSBzdXBwb3NlIHRoYXQncyBmaW5lLCBidXQgSSBkb24ndCB0aGluawp3ZSBzaG91bGQgZG9jdW1l
bnQgLmdldF9tb2RlcygpIGFzIGJlaW5nIG9wdGlvbmFsLgoKV2l0aCB0aGVzZSBpc3N1ZXMgYWRk
cmVzc2VkIChpZiB0aGV5IG5lZWQgdG8gYmUpLAoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCj4gIAo+IC0JcmV0dXJuIHBh
bmVsID8gLUVOT1NZUyA6IC1FSU5WQUw7Cj4gKwlyZXR1cm4gMDsKPiAgfQo+ICBFWFBPUlRfU1lN
Qk9MKGRybV9wYW5lbF9nZXRfbW9kZXMpOwo+ICAKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5j
aGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
