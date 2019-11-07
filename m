Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80251F38FA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 20:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CA66E516;
	Thu,  7 Nov 2019 19:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D1E6E516
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 19:52:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 681F071D;
 Thu,  7 Nov 2019 20:52:24 +0100 (CET)
Date: Thu, 7 Nov 2019 21:52:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 5/8] drm: bridge: thc63: Do not report input bus mode
 through bridge timings
Message-ID: <20191107195215.GJ24983@pendragon.ideasonboard.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567017402-5895-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573156344;
 bh=kazRCQV5JWHrZPbNlTQFxg3ZB3fL5gW+pdi4x+nRfWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O5JEr6omSQikk2K3y0bWvRAqYz3kcAWskkk0TMSRebEr161BrNjX7tdR8E4tCSwZm
 FEaXYawQZCtuJ0iSB138PhoAZkBl17/d62qD8AKaG7dLWsezFfMNLChdtZNtNQZzIg
 jSv2423pD72PNcL+o2sEI5Ltiy4b4jiWpcMN4GNU=
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 sam@ravnborg.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgQXVnIDI4LCAy
MDE5IGF0IDA3OjM2OjM5UE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBObyBuZWVk
IHRvIHJlcG9ydCB0aGUgaW5wdXQgYnVzIG1vZGUgdGhyb3VnaCBicmlkZ2UgdGltaW5ncwo+IGFu
eW1vcmUsIHRoYXQncyBub3cgZG9uZSB0aHJvdWdoIHRoZSBEVCwgYXMgc3BlY2lmaWVkIGJ5IHRo
ZQo+IGR0LWJpbmRpbmdzLgoKRG9lc24ndCB0aGlzIGJyZWFrIGJhY2t3YXJkIGNvbXBhdGliaWxp
dHkgd2l0aCBvbGRlciBEVCwgYXMgbWVudGlvbmVkIGluCnRoZSByZXZpZXcgb2YgNC84ID8KCj4g
U2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNh
cy5jb20+Cj4gCj4gLS0tCj4gdjItPnYzOgo+ICogbmV3IHBhdGNoCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGhjNjNsdmQxMDI0LmMgfCA5ICsrKystLS0tLQo+ICBpbmNsdWRlL2Ry
bS9kcm1fYnJpZGdlLmggICAgICAgICAgICAgIHwgOCAtLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGhjNjNsdmQxMDI0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RoYzYzbHZkMTAyNC5jCj4gaW5kZXggM2Q3NDEyOWIuLjczMGY2ODIgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2M2x2ZDEwMjQuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGhjNjNsdmQxMDI0LmMKPiBAQCAtMzQsNyArMzQsNyBAQCBzdHJ1Y3Qg
dGhjNjNfZGV2IHsKPiAgCXN0cnVjdCBkcm1fYnJpZGdlIGJyaWRnZTsKPiAgCXN0cnVjdCBkcm1f
YnJpZGdlICpuZXh0Owo+ICAKPiAtCXN0cnVjdCBkcm1fYnJpZGdlX3RpbWluZ3MgdGltaW5nczsK
PiArCWJvb2wgZHVhbF9saW5rOwo+ICB9Owo+ICAKPiAgc3RhdGljIGlubGluZSBzdHJ1Y3QgdGhj
NjNfZGV2ICp0b190aGM2MyhzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+IEBAIC02Miw3ICs2
Miw3IEBAIHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyB0aGM2M19tb2RlX3ZhbGlkKHN0cnVj
dCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gIAkgKiBpc24ndCBzdXBwb3J0ZWQgYnkgdGhlIGRyaXZl
ciB5ZXQsIHNpbXBseSBkZXJpdmUgdGhlIGxpbWl0cyBmcm9tIHRoZQo+ICAJICogaW5wdXQgbW9k
ZS4KPiAgCSAqLwo+IC0JaWYgKHRoYzYzLT50aW1pbmdzLmR1YWxfbGluaykgewo+ICsJaWYgKHRo
YzYzLT5kdWFsX2xpbmspIHsKPiAgCQltaW5fZnJlcSA9IDQwMDAwOwo+ICAJCW1heF9mcmVxID0g
MTUwMDAwOwo+ICAJfSBlbHNlIHsKPiBAQCAtMTU3LDEzICsxNTcsMTMgQEAgc3RhdGljIGludCB0
aGM2M19wYXJzZV9kdChzdHJ1Y3QgdGhjNjNfZGV2ICp0aGM2MykKPiAgCj4gIAkJaWYgKHJlbW90
ZSkgewo+ICAJCQlpZiAob2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShyZW1vdGUpKQo+IC0JCQkJdGhj
NjMtPnRpbWluZ3MuZHVhbF9saW5rID0gdHJ1ZTsKPiArCQkJCXRoYzYzLT5kdWFsX2xpbmsgPSB0
cnVlOwo+ICAJCQlvZl9ub2RlX3B1dChyZW1vdGUpOwo+ICAJCX0KPiAgCX0KPiAgCj4gIAlkZXZf
ZGJnKHRoYzYzLT5kZXYsICJvcGVyYXRpbmcgaW4gJXMtbGluayBtb2RlXG4iLAo+IC0JCXRoYzYz
LT50aW1pbmdzLmR1YWxfbGluayA/ICJkdWFsIiA6ICJzaW5nbGUiKTsKPiArCQl0aGM2My0+ZHVh
bF9saW5rID8gImR1YWwiIDogInNpbmdsZSIpOwo+ICAKPiAgCXJldHVybiAwOwo+ICB9Cj4gQEAg
LTIyMSw3ICsyMjEsNiBAQCBzdGF0aWMgaW50IHRoYzYzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gIAl0aGM2My0+YnJpZGdlLmRyaXZlcl9wcml2YXRlID0gdGhjNjM7Cj4g
IAl0aGM2My0+YnJpZGdlLm9mX25vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKPiAgCXRoYzYzLT5i
cmlkZ2UuZnVuY3MgPSAmdGhjNjNfYnJpZGdlX2Z1bmM7Cj4gLQl0aGM2My0+YnJpZGdlLnRpbWlu
Z3MgPSAmdGhjNjMtPnRpbWluZ3M7Cj4gIAo+ICAJZHJtX2JyaWRnZV9hZGQoJnRoYzYzLT5icmlk
Z2UpOwo+ICAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2JyaWRnZS5oCj4gaW5kZXggNzYxNmY2NS4uMzIyODAxOCAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdl
LmgKPiBAQCAtMzYyLDE0ICszNjIsNiBAQCBzdHJ1Y3QgZHJtX2JyaWRnZV90aW1pbmdzIHsKPiAg
CSAqIGlucHV0IHNpZ25hbCBhZnRlciB0aGUgY2xvY2sgZWRnZS4KPiAgCSAqLwo+ICAJdTMyIGhv
bGRfdGltZV9wczsKPiAtCS8qKgo+IC0JICogQGR1YWxfbGluazoKPiAtCSAqCj4gLQkgKiBUcnVl
IGlmIHRoZSBidXMgb3BlcmF0ZXMgaW4gZHVhbC1saW5rIG1vZGUuIFRoZSBleGFjdCBtZWFuaW5n
IGlzCj4gLQkgKiBkZXBlbmRlbnQgb24gdGhlIGJ1cyB0eXBlLiBGb3IgTFZEUyBidXNlcywgdGhp
cyBpbmRpY2F0ZXMgdGhhdCBldmVuLQo+IC0JICogYW5kIG9kZC1udW1iZXJlZCBwaXhlbHMgYXJl
IHJlY2VpdmVkIG9uIHNlcGFyYXRlIGxpbmtzLgo+IC0JICovCj4gLQlib29sIGR1YWxfbGluazsK
PiAgfTsKPiAgCj4gIC8qKgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
