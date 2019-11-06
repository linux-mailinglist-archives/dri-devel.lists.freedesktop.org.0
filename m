Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E72DF1D80
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 19:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50B86E271;
	Wed,  6 Nov 2019 18:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4212F6E271
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 18:28:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 10:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="201173380"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 06 Nov 2019 10:28:14 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 06 Nov 2019 20:28:13 +0200
Date: Wed, 6 Nov 2019 20:28:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/mst: Fix up u64 division
Message-ID: <20191106182813.GV1208@intel.com>
References: <20191106173622.15573-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106173622.15573-1-sean@poorly.run>
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

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTI6MzY6MTVQTSAtMDUwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IFVzZSBkb19k
aXYgdG8gZGl2aWRlIHJlbV9uc2VjIGluc3RlYWQgb2YgLy4KPiAKPiBGaXhlczogMTJhMjgwYzcy
ODY4ICgiZHJtL2RwX21zdDogQWRkIHRvcG9sb2d5IHJlZiBoaXN0b3J5IHRyYWNraW5nIGZvciBk
ZWJ1Z2dpbmciKQo+IENjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+Cj4gQ2M6IElt
cmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFu
QGFtZC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4g
Q2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUBy
ZWRoYXQuY29tPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
U2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA0ICsrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBpbmRleCAxMWFkYzRiNmNjZmUuLmQyZGE1ZjExM2Yx
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC0xNTEyLDEw
ICsxNTEyLDEwIEBAIF9fZHVtcF90b3BvbG9neV9yZWZfaGlzdG9yeShzdHJ1Y3QgZHJtX2RwX21z
dF90b3BvbG9neV9yZWZfaGlzdG9yeSAqaGlzdG9yeSwKPiAgCQlucl9lbnRyaWVzID0gc3RhY2tf
ZGVwb3RfZmV0Y2goZW50cnktPmJhY2t0cmFjZSwgJmVudHJpZXMpOwo+ICAJCXN0YWNrX3RyYWNl
X3NucHJpbnQoYnVmLCBQQUdFX1NJWkUsIGVudHJpZXMsIG5yX2VudHJpZXMsIDQpOwo+ICAKPiAt
CQlkcm1fcHJpbnRmKCZwLCAiICAlZCAlc3MgKGxhc3QgYXQgJTVsbHUuJTA2bGx1KTpcbiVzIiwK
PiArCQlkcm1fcHJpbnRmKCZwLCAiICAlZCAlc3MgKGxhc3QgYXQgJTVsbHUuJTA2dSk6XG4lcyIs
Cj4gIAkJCSAgIGVudHJ5LT5jb3VudCwKPiAgCQkJICAgdG9wb2xvZ3lfcmVmX3R5cGVfdG9fc3Ry
KGVudHJ5LT50eXBlKSwKPiAtCQkJICAgdHNfbnNlYywgcmVtX25zZWMgLyAxMDAwLCBidWYpOwo+
ICsJCQkgICB0c19uc2VjLCBkb19kaXYocmVtX25zZWMsIDEwMDApLCBidWYpOwoKT3IganVzdCBj
aGFuZ2UgcmVtX25zZWMgdG8gdTMyIHNpbmNlIHRoYXQncyB3aGF0IGRvX2RpdigpIGdpdmVzIHlv
dS4KCj4gIAl9Cj4gIAo+ICAJLyogTm93IGZyZWUgdGhlIGhpc3RvcnksIHNpbmNlIHRoaXMgaXMg
dGhlIG9ubHkgdGltZSB3ZSBleHBvc2UgaXQgKi8KPiAtLSAKPiBTZWFuIFBhdWwsIFNvZnR3YXJl
IEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
