Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B9F644E6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 12:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A7C89B11;
	Wed, 10 Jul 2019 10:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FAE89B11;
 Wed, 10 Jul 2019 10:07:00 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 03:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,474,1557212400"; d="scan'208";a="186112715"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 10 Jul 2019 03:06:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Jul 2019 13:06:57 +0300
Date: Wed, 10 Jul 2019 13:06:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sunpeng.li@amd.com
Subject: Re: [PATCH 07/10] drm/i915: Implement MST Aux device registration
Message-ID: <20190710100657.GA5942@intel.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
 <20190704190519.29525-8-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704190519.29525-8-sunpeng.li@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMDM6MDU6MTZQTSAtMDQwMCwgc3VucGVuZy5saUBhbWQu
Y29tIHdyb3RlOgo+IEZyb206IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IAo+IEltcGxl
bWVudCBsYXRlX3JlZ2lzdGVyIGFuZCBlYXJseV91bnJlZ2lzdGVyIGhvb2tzIGZvciBNU1QgY29u
bmVjdG9ycy4KPiBDYWxsIGRybSBoZWxwZXJzIGZvciBNU1QgY29ubmVjdG9yIHJlZ2lzdHJhdGlv
biwgd2hpY2ggcmVnaXN0ZXJzIHRoZQo+IEFVWCBkZXZpY2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RwX21zdC5jIHwgMjkgKysrKysrKysrKysrKysrKysrKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwo+IGluZGV4IDYwNjUyZWJi
ZGY2MS4uYmUzMDkwMTZmNzQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHBfbXN0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwX21zdC5jCj4gQEAgLTQwMCwxMyArNDAwLDM4IEBAIGludGVsX2RwX21zdF9kZXRl
Y3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgYm9vbCBmb3JjZSkKPiAgCQkJCSAg
ICAgIGludGVsX2Nvbm5lY3Rvci0+cG9ydCk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQKPiAraW50
ZWxfZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpCj4gK3sKPiArCXN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmludGVsX2Nvbm5lY3Rv
ciA9IHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0b3IpOwo+ICsJc3RydWN0IGRybV9kcF9tc3Rf
cG9ydCAqcG9ydCA9IGludGVsX2Nvbm5lY3Rvci0+cG9ydDsKPiArCj4gKwlpbnQgcmV0Owo+ICsK
PiArCXJldCA9IGludGVsX2Nvbm5lY3Rvcl9yZWdpc3Rlcihjb25uZWN0b3IpOwo+ICsJaWYgKHJl
dCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCXJldHVybiBkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9s
YXRlX3JlZ2lzdGVyKGNvbm5lY3RvciwgcG9ydCk7CgpXZSBzaG91bGQgcHJvYmFibHkgdW53aW5k
IHByb3Blcmx5IGluIGNhc2Ugb2YgYW4gZXJyb3IgZnJvbSB0aGlzIGd1eS4KQ3VycmVudGx5IGl0
IHdvbid0IG1hdHRlciBzaW5jZSBpbnRlbF9jb25uZWN0b3JfcmVnaXN0ZXIoKSBvbmx5IHNldHMK
dXAgdGhlIGJhY2tsaWdodCBhbmQgdGhhdCBkb2Vzbid0IGV4aXN0IGZvciBNU1QgY29ubmVjdG9y
cywgYnV0IGlmIGFuZAp3aGVuIHNvbWVvbmUgYWRkcyBtb3JlIHN0dWZmIHRvIGludGVsX2Nvbm5l
Y3Rvcl9yZWdpc3RlcigpIHRoZXkgbWF5IG5vdApub3RpY2UgdGhhdCB0aGUgY2FsbGVyIGlzIGxl
YWtpbmcuCgo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZAo+ICtpbnRlbF9kcF9tc3RfY29ubmVjdG9y
X2Vhcmx5X3VucmVnaXN0ZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiArewo+
ICsJc3RydWN0IGludGVsX2Nvbm5lY3RvciAqaW50ZWxfY29ubmVjdG9yID0gdG9faW50ZWxfY29u
bmVjdG9yKGNvbm5lY3Rvcik7Cj4gKwlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0ID0gaW50
ZWxfY29ubmVjdG9yLT5wb3J0Owo+ICsKPiArCWRybV9kcF9tc3RfY29ubmVjdG9yX2Vhcmx5X3Vu
cmVnaXN0ZXIoY29ubmVjdG9yLCBwb3J0KTsKPiArCWludGVsX2Nvbm5lY3Rvcl91bnJlZ2lzdGVy
KGNvbm5lY3Rvcik7Cj4gK30KPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl9mdW5jcyBpbnRlbF9kcF9tc3RfY29ubmVjdG9yX2Z1bmNzID0gewo+ICAJLmRldGVjdCA9IGlu
dGVsX2RwX21zdF9kZXRlY3QsCj4gIAkuZmlsbF9tb2RlcyA9IGRybV9oZWxwZXJfcHJvYmVfc2lu
Z2xlX2Nvbm5lY3Rvcl9tb2RlcywKPiAgCS5hdG9taWNfZ2V0X3Byb3BlcnR5ID0gaW50ZWxfZGln
aXRhbF9jb25uZWN0b3JfYXRvbWljX2dldF9wcm9wZXJ0eSwKPiAgCS5hdG9taWNfc2V0X3Byb3Bl
cnR5ID0gaW50ZWxfZGlnaXRhbF9jb25uZWN0b3JfYXRvbWljX3NldF9wcm9wZXJ0eSwKPiAtCS5s
YXRlX3JlZ2lzdGVyID0gaW50ZWxfY29ubmVjdG9yX3JlZ2lzdGVyLAo+IC0JLmVhcmx5X3VucmVn
aXN0ZXIgPSBpbnRlbF9jb25uZWN0b3JfdW5yZWdpc3RlciwKPiArCS5sYXRlX3JlZ2lzdGVyID0g
aW50ZWxfZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyLAo+ICsJLmVhcmx5X3VucmVnaXN0
ZXIgPSBpbnRlbF9kcF9tc3RfY29ubmVjdG9yX2Vhcmx5X3VucmVnaXN0ZXIsCj4gIAkuZGVzdHJv
eSA9IGludGVsX2Nvbm5lY3Rvcl9kZXN0cm95LAo+ICAJLmF0b21pY19kZXN0cm95X3N0YXRlID0g
ZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsCj4gIAkuYXRvbWljX2R1
cGxpY2F0ZV9zdGF0ZSA9IGludGVsX2RpZ2l0YWxfY29ubmVjdG9yX2R1cGxpY2F0ZV9zdGF0ZSwK
PiAtLSAKPiAyLjIyLjAKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
