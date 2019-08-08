Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC14868DB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 20:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02366E8A8;
	Thu,  8 Aug 2019 18:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7657F6E8A8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 18:37:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2CE9CC;
 Thu,  8 Aug 2019 20:37:24 +0200 (CEST)
Date: Thu, 8 Aug 2019 21:37:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: drm_panel_get_modes() should take the connector as an argument
 [Was: drm/bridge: panel: Implement bridge ...]
Message-ID: <20190808183722.GY6055@pendragon.ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-9-laurent.pinchart@ideasonboard.com>
 <20190716110827.GA27797@ravnborg.org>
 <20190808160726.GU6055@pendragon.ideasonboard.com>
 <20190808165253.GA24715@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808165253.GA24715@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565289445;
 bh=i5kifduu4q6wr7p5LwscmMXSJgZJsnkPX8+TXkDDH+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t3/anLSQjra9QfJGVt3TXzwxBFCiy6kixl/JpGlfGp501HSUaP3kO6gpeBCc/QZkO
 YBpS7xD0uKGpX+klZc0FjOmd5A9mZbLgS3GYAU0jKEUDthI7rP9A3XZ5hQavQ0cq4p
 j1FWnUGSlpssFTOmzQ502Agawgn47dPdwX9m0Q+s=
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

SGkgU2FtLAoKT24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDY6NTI6NTNQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IEhpIExhdXJlbnQuCj4gCj4gQXMgSSBzYWlkIGluIGFub3RoZXIgbWFp
bCwgeW91IGhhdmUgbWFuYWdlZCB0byBrZWVwIG1lIGJ1c3kuLi4KPiAKPiA+ID4gSSB0b29rIGEg
bG9vayBhdCB0aGlzIC0gaXQgc2VlbXMgc2ltcGxlOgo+ID4gPiAtIFVwZGF0ZSBkcm1fcGFuZWwu
Z2V0X21vZGVzKCkgdG8gdGFrZSBkcm1fY29ubmVjdG9yIGFzIGFyZ3VtZW50LCBhbmQgZml4Cj4g
PiA+ICAgYWxsIGNhbGxlcnMuIEFsbCBjYWxsZXJzIGFscmVhZHkgaGF2ZSBjb25uZWN0b3IgYXZh
aWxhYmxlLgo+ID4gPiAtIERyb3AgZHJtX3BhbmVsX2F0dGFjaCgpLCBkcm1fcGFuZWxfZGV0YWNo
KCkgYW5kIHVwZGF0ZSBhbGwgY2FsbGVycy4KPiA+ID4gICBJbiByZWFsaXR5IGp1c3QgZHJvcCBh
bGwgY29kZSBhcm91bmQgYXR0YWNoKCksIGRldGFjaCgpLgo+ID4gPiAgIGRybV9wYW5lbF9hdHRh
Y2goKSwgZHJtX3BhbmVsX2RldGFjaCgpIHdpbGwgYmUgbm9vcHMgd2hlbiB0aGUKPiA+ID4gICBj
b25uZWN0b3Igc3RvcmVkIGluIGRybV9wYW5lbCBpcyBubyBsb25nZXIgdXNlZC4KPiA+ID4gCj4g
PiA+IFRoZSBzZW1hbnRpYyBkaWZmZXJlbmNlIGlzIHRoYXQgd2Ugc3VwcGx5IHRoZSBjb25uZWN0
b3Igd2hlbiB3ZSBjYWxsCj4gPiA+IGRybV9wYW5lbF9nZXRfbW9kZXMoKSBhbmQgbm90IGF0IHBh
bmVsIGNyZWF0aW9uIHRpbWUgd2l0aCBhbiBkcm1fcGFuZWxfYXR0YWNoKCkuCj4gPiA+IAo+ID4g
PiBTbyBpdCBzaG91bGQgYmUgZG9hYmxlIHdpdGhvdXQgYW55IG1pZ3JhdGlvbiBmcm9tIG9uZSB3
b3JsZCB0byB0aGUgb3RoZXIuCj4gPiA+IAo+ID4gPiBJZiBzb21lb25lIGNhbiBzYXkgInllcyBp
dCBzaG91bGQgYmUgdGhhdCBzaW1wbGUiLCB0aGVuIEkgd2lsbAo+ID4gPiBnaXZlIGl0IGEgc3Bp
bi4KPiA+IAo+ID4gTG9va2luZyBmb3J3YXJkIHRvIHRoYXQgOi0pCj4gCj4gQWxtb3N0IHRoZXJl
Li4uLgo+IEkgaGF2ZSBhbGwgdGhlIHByZXBhcmF0aW9uIHBhdGNoZXMgb24gZHJpLWRldmVsLCB3
aXRoIHBvc2l0aXZlCj4gZmVlZGJhY2sgb24gbW9zdC4KPiAKPiBBbmQgbG9jYWxseSBJIGhhdmUg
dXBkYXRlZCBhbGwgZ2V0X21vZGVzKCkgdG8gdGFrZSBkcm1fY29ubmVjdG9yIGFzCj4gYXJndW1l
bnQuCj4gCj4gQSBmZXcgZHJpdmVycyBhY2Nlc3MgZHJtX3BhbmVsLT5jb25uZWN0b3IsIHN0aWxs
IG5lZWQgdG8gbG9vayBpbnRvIHRoaXMuCj4gCj4gQW5kIHRoZW4gZm9yIGRybV9wYW5lbF9hdHRh
Y2goKSwgZHJtX3BhbmVsX2RldGFjaCgpIC0gc28gZmFyIHRoZXkgYXJlCj4ga2VwdCBidXQgY2hh
bmdlZCB0byB0YWtlIGEgZHJtX2RldmljZSouCj4gCj4gSnVzdCBzaGFyaW5nIHRoaXMgc28geW91
IGRvIG5vdCBqdW1wIGF0IGl0IGFuZCBkdXBsaWNhdGUgdGhlIHdvcmsuCj4gSXQgd2lsbCB0YWtl
IGEgbGl0dGxlIHRpbWUgYmVmb3JlIEkgY2FuIGludmVzdCB0aW1lIGluIHRoaXMgYWdhaW4uCj4g
V2lsbCBwb3N0IHBhdGNoZXMgd2hlbiBzb21ldGhpbmcgaXMgcmVhZHkgZm9yIHJldmlldy4KClRo
YW5rcyBmb3IgdGhlIHVwZGF0ZS4gVGFrZSB5b3VyIHRpbWUsIHRoaXMgaXNuJ3QgYmxvY2tpbmcg
bWUuCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
