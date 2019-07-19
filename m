Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF396E9C9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 19:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEDF6E82D;
	Fri, 19 Jul 2019 17:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1EF6E82D;
 Fri, 19 Jul 2019 17:06:58 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 10:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="170186099"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 19 Jul 2019 10:06:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Jul 2019 20:06:54 +0300
Date: Fri, 19 Jul 2019 20:06:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/vblank: Document and fix vblank
 count barrier semantics
Message-ID: <20190719170654.GQ5942@intel.com>
References: <20190719152314.7706-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719152314.7706-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDU6MjM6MTJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBOb3RpY2VkIHdoaWxlIHJldmlld2luZyBjb2RlLiBJJ20gbm90IHN1cmUgd2hldGhl
ciB0aGlzIG1pZ2h0IG9yIG1pZ2h0Cj4gbm90IGV4cGxhaW4gc29tZSBvZiB0aGUgbWlzc2VkIHZi
bGFuayBoaWxhcml0eSB3ZSd2ZSBiZWVuIHNlZWluZy4gSQo+IHRoaW5rIHRob3NlIGFsbCBnbyB0
aHJvdWdoIHRoZSB2YmxhbmsgY29tcGxldGlvbiBldmVudCwgd2hpY2ggaGFzCj4gdW5jb25kaXRp
b25hbCBiYXJyaWVycyAtIGl0IGFsd2F5cyB0YWtlcyB0aGUgc3BpbmxvY2suIFRoZXJlZm9yZSBu
bwo+IGNjIHN0YWJsZS4KPiAKPiB2MjoKPiAtIEJhcnJyaWVycyBhcmUgaGFyZCwgcHV0IHRoZW0g
aW4gaW4gdGhlIHJpZ2h0IG9yZGVyIChDaHJpcykuCj4gLSBJbXByb3ZlIHRoZSBjb21tZW50cyBh
IGJpdC4KPiAKPiBDYzogUm9kcmlnbyBTaXF1ZWlyYSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFp
bC5jb20+Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IFNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgMzggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystCj4gIGluY2x1ZGUvZHJtL2RybV92YmxhbmsuaCAgICAgfCAxMyAr
KysrKysrKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+IGluZGV4IDYwM2FiMTA1MTI1ZC4uZWIyYTgz
MDQ1MzZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4gQEAgLTI5NSwxMSArMjk1LDIzIEBAIHN0
YXRpYyB2b2lkIGRybV91cGRhdGVfdmJsYW5rX2NvdW50KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHVuc2lnbmVkIGludCBwaXBlLAo+ICBzdGF0aWMgdTY0IGRybV92YmxhbmtfY291bnQoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUpCj4gIHsKPiAgCXN0cnVjdCBkcm1f
dmJsYW5rX2NydGMgKnZibGFuayA9ICZkZXYtPnZibGFua1twaXBlXTsKPiArCXU2NCBjb3VudDsK
PiAgCj4gIAlpZiAoV0FSTl9PTihwaXBlID49IGRldi0+bnVtX2NydGNzKSkKPiAgCQlyZXR1cm4g
MDsKPiAgCj4gLQlyZXR1cm4gdmJsYW5rLT5jb3VudDsKPiArCWNvdW50ID0gdmJsYW5rLT5jb3Vu
dDsKCkhtbS4gVGhpcyBpcyBub3cgYSA2NGJpdCBxdWFudGl0eSwgd2hpY2ggbWVhbnMgb24gMzJi
aXQgdGhlIGxvYWQvc3RvcmUKd29uJ3QgYmUgYXRvbWljLiBUaGF0IGRvZXNuJ3Qgc2VlbSBwYXJ0
aWN1bGFybHkgZ3JlYXQuCgo+ICsKPiArCS8qCj4gKwkgKiBUaGlzIHJlYWQgYmFycmllciBjb3Jy
ZXNwb25kcyB0byB0aGUgaW1wbGljaXQgd3JpdGUgYmFycmllciBvZiB0aGUKPiArCSAqIHdyaXRl
IHNlcWxvY2sgaW4gc3RvcmVfdmJsYW5rKCkuIE5vdGUgdGhhdCB0aGlzIGlzIHRoZSBvbmx5IHBs
YWNlCj4gKwkgKiB3aGVyZSB3ZSBuZWVkIGFuIGV4cGxpY2l0IGJhcnJpZXIsIHNpbmNlIGFsbCBv
dGhlciBhY2Nlc3MgZ29lcwo+ICsJICogdGhyb3VnaCBkcm1fdmJsYW5rX2NvdW50X2FuZF90aW1l
KCksIHdoaWNoIGFscmVhZHkgaGFzIHRoZSByZXF1aXJlZAo+ICsJICogcmVhZCBiYXJyaWVyIGN1
cnRlc3kgb2YgdGhlIHJlYWQgc2VxbG9jay4KPiArCSAqLwo+ICsJc21wX3JtYigpOwo+ICsKPiAr
CXJldHVybiBjb3VudDsKPiAgfQo+ICAKPiAgLyoqCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
