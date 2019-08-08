Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6558677C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 18:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB1F892FA;
	Thu,  8 Aug 2019 16:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49260892FA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 16:52:58 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D6D5B804FC;
 Thu,  8 Aug 2019 18:52:54 +0200 (CEST)
Date: Thu, 8 Aug 2019 18:52:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: drm_panel_get_modes() should take the connector as an argument
 [Was: drm/bridge: panel: Implement bridge ...]
Message-ID: <20190808165253.GA24715@ravnborg.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-9-laurent.pinchart@ideasonboard.com>
 <20190716110827.GA27797@ravnborg.org>
 <20190808160726.GU6055@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808160726.GU6055@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=VqPULK3TWqHsyd6lvikA:9 a=CjuIK1q_8ugA:10
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCkFzIEkgc2FpZCBpbiBhbm90aGVyIG1haWwsIHlvdSBoYXZlIG1hbmFnZWQg
dG8ga2VlcCBtZSBidXN5Li4uCgo+ID4gSSB0b29rIGEgbG9vayBhdCB0aGlzIC0gaXQgc2VlbXMg
c2ltcGxlOgo+ID4gLSBVcGRhdGUgZHJtX3BhbmVsLmdldF9tb2RlcygpIHRvIHRha2UgZHJtX2Nv
bm5lY3RvciBhcyBhcmd1bWVudCwgYW5kIGZpeAo+ID4gICBhbGwgY2FsbGVycy4gQWxsIGNhbGxl
cnMgYWxyZWFkeSBoYXZlIGNvbm5lY3RvciBhdmFpbGFibGUuCj4gPiAtIERyb3AgZHJtX3BhbmVs
X2F0dGFjaCgpLCBkcm1fcGFuZWxfZGV0YWNoKCkgYW5kIHVwZGF0ZSBhbGwgY2FsbGVycy4KPiA+
ICAgSW4gcmVhbGl0eSBqdXN0IGRyb3AgYWxsIGNvZGUgYXJvdW5kIGF0dGFjaCgpLCBkZXRhY2go
KS4KPiA+ICAgZHJtX3BhbmVsX2F0dGFjaCgpLCBkcm1fcGFuZWxfZGV0YWNoKCkgd2lsbCBiZSBu
b29wcyB3aGVuIHRoZQo+ID4gICBjb25uZWN0b3Igc3RvcmVkIGluIGRybV9wYW5lbCBpcyBubyBs
b25nZXIgdXNlZC4KPiA+IAo+ID4gVGhlIHNlbWFudGljIGRpZmZlcmVuY2UgaXMgdGhhdCB3ZSBz
dXBwbHkgdGhlIGNvbm5lY3RvciB3aGVuIHdlIGNhbGwKPiA+IGRybV9wYW5lbF9nZXRfbW9kZXMo
KSBhbmQgbm90IGF0IHBhbmVsIGNyZWF0aW9uIHRpbWUgd2l0aCBhbiBkcm1fcGFuZWxfYXR0YWNo
KCkuCj4gPiAKPiA+IFNvIGl0IHNob3VsZCBiZSBkb2FibGUgd2l0aG91dCBhbnkgbWlncmF0aW9u
IGZyb20gb25lIHdvcmxkIHRvIHRoZSBvdGhlci4KPiA+IAo+ID4gSWYgc29tZW9uZSBjYW4gc2F5
ICJ5ZXMgaXQgc2hvdWxkIGJlIHRoYXQgc2ltcGxlIiwgdGhlbiBJIHdpbGwKPiA+IGdpdmUgaXQg
YSBzcGluLgo+IAo+IExvb2tpbmcgZm9yd2FyZCB0byB0aGF0IDotKQoKQWxtb3N0IHRoZXJlLi4u
LgpJIGhhdmUgYWxsIHRoZSBwcmVwYXJhdGlvbiBwYXRjaGVzIG9uIGRyaS1kZXZlbCwgd2l0aCBw
b3NpdGl2ZQpmZWVkYmFjayBvbiBtb3N0LgoKQW5kIGxvY2FsbHkgSSBoYXZlIHVwZGF0ZWQgYWxs
IGdldF9tb2RlcygpIHRvIHRha2UgZHJtX2Nvbm5lY3RvciBhcwphcmd1bWVudC4KCkEgZmV3IGRy
aXZlcnMgYWNjZXNzIGRybV9wYW5lbC0+Y29ubmVjdG9yLCBzdGlsbCBuZWVkIHRvIGxvb2sgaW50
byB0aGlzLgoKQW5kIHRoZW4gZm9yIGRybV9wYW5lbF9hdHRhY2goKSwgZHJtX3BhbmVsX2RldGFj
aCgpIC0gc28gZmFyIHRoZXkgYXJlCmtlcHQgYnV0IGNoYW5nZWQgdG8gdGFrZSBhIGRybV9kZXZp
Y2UqLgoKSnVzdCBzaGFyaW5nIHRoaXMgc28geW91IGRvIG5vdCBqdW1wIGF0IGl0IGFuZCBkdXBs
aWNhdGUgdGhlIHdvcmsuCkl0IHdpbGwgdGFrZSBhIGxpdHRsZSB0aW1lIGJlZm9yZSBJIGNhbiBp
bnZlc3QgdGltZSBpbiB0aGlzIGFnYWluLgpXaWxsIHBvc3QgcGF0Y2hlcyB3aGVuIHNvbWV0aGlu
ZyBpcyByZWFkeSBmb3IgcmV2aWV3LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
