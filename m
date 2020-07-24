Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B94A22D035
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 23:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AFD6EA08;
	Fri, 24 Jul 2020 21:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A866EA08
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 21:07:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2031538;
 Fri, 24 Jul 2020 23:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595624813;
 bh=GbxyeV2MM2SmP/z/nlJSX7QXctvusLx5BHg62OVHcEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d8yP6ouUOJYBRWMr5Mh2NBlfpRJbNJPF9CW7pGAQv24kJhCnzP5s6ZTmxYjFMosne
 fOPlfmVGa6U3NJwBrbDsrEdtH7i0I8AhQr1EBG4kN43oH2VyH/IrvogNfcMYNi2KQC
 ooM9Ax1m6uzp6eet2e/gOCOM2XfJ+pFuZKZ+M5qo=
Date: Sat, 25 Jul 2020 00:06:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/omap: Use {} to zero initialize the mode
Message-ID: <20200724210646.GC5921@pendragon.ideasonboard.com>
References: <20200724190718.23567-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724190718.23567-1-ville.syrjala@linux.intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCwgYW5kIHNvcnJ5IGZvciBoYXZpbmcg
bGV0IHRoaXMgaXNzdWUgc2xpcAp0aHJvdWdoIHRoZSBjcmFja3MgOi1TCgpPbiBGcmksIEp1bCAy
NCwgMjAyMCBhdCAxMDowNzoxOFBNICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+IEZyb206
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gVGhl
IGZpcnN0IG1lbWJlciBvZiBkcm1fZGlzcGxheV9tb2RlIGlzIG5vIGxvbmdlciBhIHN0cnVjdHVy
ZSwgYnV0Cj4gdGhlIGNvZGUgaXMgc3RpbGwgdXNpbmcge3swfX0gdG8gemVybyBpbml0aWFsaXpl
IGl0LiBNYWtlIHRoYXQganVzdAo+IHt9IHNvIGl0IHdvcmtzIHJlZ2FyZGxlc3Mgb2Ygd2hhdCBs
aWVzIGluc2lkZS4KPiAKPiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiBD
YzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2Fy
ZC5jb20+Cj4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gRml4
ZXM6IDQyYWNiMDZiMDFiMSAoImRybTogcGFob2xlIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIikK
PiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBf
Y29ubmVjdG9yLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFw
X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jb25uZWN0b3IuYwo+
IGluZGV4IDUyODc2NDU2NmIxNy4uZGU5NWRjMWI4NjFjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9vbWFwX2Nvbm5lY3Rvci5jCj4gQEAgLTg5LDcgKzg5LDcgQEAgc3RhdGljIGVudW0g
ZHJtX21vZGVfc3RhdHVzIG9tYXBfY29ubmVjdG9yX21vZGVfdmFsaWQoc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm4KPiAgCQkJCSBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiAgewo+
ICAJc3RydWN0IG9tYXBfY29ubmVjdG9yICpvbWFwX2Nvbm5lY3RvciA9IHRvX29tYXBfY29ubmVj
dG9yKGNvbm5lY3Rvcik7Cj4gLQlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBuZXdfbW9kZSA9IHsg
eyAwIH0gfTsKPiArCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG5ld19tb2RlID0ge307Cj4gIAll
bnVtIGRybV9tb2RlX3N0YXR1cyBzdGF0dXM7Cj4gIAo+ICAJc3RhdHVzID0gb21hcF9jb25uZWN0
b3JfbW9kZV9maXh1cChvbWFwX2Nvbm5lY3Rvci0+b3V0cHV0LCBtb2RlLAoKLS0gClJlZ2FyZHMs
CgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
