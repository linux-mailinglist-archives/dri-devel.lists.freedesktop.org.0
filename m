Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28038823C4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 19:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D776E51C;
	Mon,  5 Aug 2019 17:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B51F6E51C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 17:15:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DD622F9;
 Mon,  5 Aug 2019 19:15:06 +0200 (CEST)
Date: Mon, 5 Aug 2019 20:15:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: connector: Clarify drm_connecter.ddc field
 documentation
Message-ID: <20190805171502.GA13149@pendragon.ideasonboard.com>
References: <20190804122653.6587-1-laurent.pinchart@ideasonboard.com>
 <20190805162815.GT7444@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805162815.GT7444@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565025306;
 bh=yuuihDQ3MBpqpYJmKFoMeFyZ4tAmnsE5OwqUx7cksag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hrpzAwkwIsBLK/LDYpVgj+P5BKKJ+rL4pkmbYw6Fj/nQWXlLPJQoT20fm5sOQFh3p
 PPV/qKTX7WUurkyihU2gvt3gWBgw9YcK9LBJWzM++HLI1fQwkjmOSv3G6GDPHoLNx2
 0et3+q7AGbSNLHoatVUQFqTSJMT/faUnkf5kzBaQ=
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
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDY6Mjg6MTVQTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBTdW4sIEF1ZyAwNCwgMjAxOSBhdCAwMzoyNjo1M1BNICsw
MzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gSW1wcm92ZSB0aGUgZG9jdW1lbnRhdGlv
biBvZiB0aGUgZGRjIGZpZWxkIGJ5IHVzaW5nIEREQyBhbmQgSTJDCj4gPiBjb25zaXN0ZW50bHks
IGFuZCBleHBsYWluaW5nIG1vcmUgY2xlYXJseSB3aGF0IHRoZSBmaWVsZCBwb2ludHMgdG8uCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3Iu
aCB8IDggKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rv
ci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4gPiBpbmRleCBmYzVkMDg0MzgzMzMu
LjBkMDE2NjJhYTQwZSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3Iu
aAo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4gPiBAQCAtMTMxNSwxMCAr
MTMxNSwxMCBAQCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciB7Cj4gPiAgCj4gPiAgCS8qKgo+ID4gIAkg
KiBAZGRjOiBhc3NvY2lhdGVkIGRkYyBhZGFwdGVyLgo+ID4gLQkgKiBBIGNvbm5lY3RvciB1c3Vh
bGx5IGhhcyBpdHMgYXNzb2NpYXRlZCBkZGMgYWRhcHRlci4gSWYgYSBkcml2ZXIgdXNlcwo+ID4g
LQkgKiB0aGlzIGZpZWxkLCB0aGVuIGFuIGFwcHJvcHJpYXRlIHN5bWJvbGljIGxpbmsgaXMgY3Jl
YXRlZCBpbiBjb25uZWN0b3IKPiA+IC0JICogc3lzZnMgZGlyZWN0b3J5IHRvIG1ha2UgaXQgZWFz
eSBmb3IgdGhlIHVzZXIgdG8gdGVsbCB3aGljaCBpMmMKPiA+IC0JICogYWRhcHRlciBpcyBmb3Ig
YSBwYXJ0aWN1bGFyIGRpc3BsYXkuCj4gPiArCSAqIFdoZW4gdGhlIGNvbm5lY3RvciBjYXJyaWVz
IEREQyBzaWduYWxzLCB0aGlzIGZpZWxkIHBvaW50cyB0byB0aGUgSTJDCj4gCj4gcy9EREMvYSBE
REMvCgpEREMgaXMgY2FycmllZCBieSB0d28gc2lnbmFscyAoYXQgbGVhc3QgZm9yIEREQzIsIHRo
ZSBtb3N0bHkKdW5pbXBsZW1lbnRlZCBEREMxIHVzZWQgYSBzaW5nbGUgc2lnbmFsKSwgc28gImNh
cnJpZXMgRERDIHNpZ25hbHMiIHNlZW1zCmFwcHJvcHJpYXRlIHRvIG1lLgoKPiA+ICsJICogYWRh
cHRlciBjb25uZWN0ZWQgdG8gdGhlIEREQyBzaWduYWxzLCBpZiBhbnkuIFdoZW4gdGhpcyBmaWVs
ZCBpcyBub3QKPiBzL25vdCBOVUxML2lzIHNldC8gb3RoZXJ3aXNlIHBhcnNpbmcgaGljY3VwIG9u
IHRoZSBkb3VibGUgbmVnYXRpdmUgOi0pCj4gCj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gCj4gPiArCSAqIE5VTEwgYSBzeW1ib2xpYyBsaW5r
IGlzIGNyZWF0ZWQgaW4gdGhlIGNvbm5lY3RvcidzIHN5c2ZzIGRpcmVjdG9yeQo+ID4gKwkgKiB0
byBleHBvc2UgdGhlIEkyQyBhZGFwdGVyIHVzZWQgYnkgdGhlIGNvbm5lY3Rvci4KPiA+ICAJICoK
PiA+ICAJICogVGhlIGZpZWxkIHNob3VsZCBiZSBzZXQgYnkgY2FsbGluZyBkcm1fY29ubmVjdG9y
X2luaXRfd2l0aF9kZGMoKS4KPiA+ICAJICovCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hh
cnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
