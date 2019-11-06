Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2F9F1F92
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 21:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C8E6EACA;
	Wed,  6 Nov 2019 20:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BCE6EACA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 20:14:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 12:14:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="212850463"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 06 Nov 2019 12:14:35 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 06 Nov 2019 22:14:34 +0200
Date: Wed, 6 Nov 2019 22:14:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/mst: Fix up u64 division
Message-ID: <20191106201434.GW1208@intel.com>
References: <20191106182813.GV1208@intel.com>
 <20191106194121.164458-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106194121.164458-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Harry Wentland <hwentlan@amd.com>, Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDI6NDE6MTVQTSAtMDUwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IENoYW5nZSBy
ZW1fbnNlYyB0byB1MzIgc2luY2UgdGhhdCdzIHdoYXQgZG9fZGl2IHJldHVybnMsIHRoaXMgYXZv
aWRzIHRoZQo+IHU2NCBkaXZpZGUgaW4gdGhlIGRybV9wcmludCBhcmdzLgo+IAo+IENoYW5nZXMg
aW4gdjI6Cj4gLSBJbnN0ZWFkIG9mIGRvaW5nIGRvX2RpdiBpbiBkcm1fcHJpbnQsIG1ha2UgcmVt
X25zZWMgdTMyIChWaWxsZSkKPiAKPiBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTExMDYxNzM2MjIuMTU1NzMtMS1zZWFuQHBvb3Js
eS5ydW4KPiAKPiBGaXhlczogMTJhMjgwYzcyODY4ICgiZHJtL2RwX21zdDogQWRkIHRvcG9sb2d5
IHJlZiBoaXN0b3J5IHRyYWNraW5nIGZvciBkZWJ1Z2dpbmciKQo+IENjOiBKdXN0b24gTGkgPGp1
c3Rvbi5saUBpbnRlbC5jb20+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4K
PiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBD
YzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVu
Pgo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IENjOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlw
YXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFu
cGF1bEBjaHJvbWl1bS5vcmc+CgpsZ3RtClJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYwo+IGluZGV4IDExYWRjNGI2Y2NmZS4uYWU1ODA5YTFmMTlhIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTE1MDcsMTIgKzE1MDcsMTIgQEAgX19kdW1w
X3RvcG9sb2d5X3JlZl9oaXN0b3J5KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X3JlZl9oaXN0
b3J5ICpoaXN0b3J5LAo+ICAJCXVsb25nICplbnRyaWVzOwo+ICAJCXVpbnQgbnJfZW50cmllczsK
PiAgCQl1NjQgdHNfbnNlYyA9IGVudHJ5LT50c19uc2VjOwo+IC0JCXU2NCByZW1fbnNlYyA9IGRv
X2Rpdih0c19uc2VjLCAxMDAwMDAwMDAwKTsKPiArCQl1MzIgcmVtX25zZWMgPSBkb19kaXYodHNf
bnNlYywgMTAwMDAwMDAwMCk7Cj4gIAo+ICAJCW5yX2VudHJpZXMgPSBzdGFja19kZXBvdF9mZXRj
aChlbnRyeS0+YmFja3RyYWNlLCAmZW50cmllcyk7Cj4gIAkJc3RhY2tfdHJhY2Vfc25wcmludChi
dWYsIFBBR0VfU0laRSwgZW50cmllcywgbnJfZW50cmllcywgNCk7Cj4gIAo+IC0JCWRybV9wcmlu
dGYoJnAsICIgICVkICVzcyAobGFzdCBhdCAlNWxsdS4lMDZsbHUpOlxuJXMiLAo+ICsJCWRybV9w
cmludGYoJnAsICIgICVkICVzcyAobGFzdCBhdCAlNWxsdS4lMDZ1KTpcbiVzIiwKPiAgCQkJICAg
ZW50cnktPmNvdW50LAo+ICAJCQkgICB0b3BvbG9neV9yZWZfdHlwZV90b19zdHIoZW50cnktPnR5
cGUpLAo+ICAJCQkgICB0c19uc2VjLCByZW1fbnNlYyAvIDEwMDAsIGJ1Zik7Cj4gLS0gCj4gU2Vh
biBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCi0tIApWaWxs
ZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
