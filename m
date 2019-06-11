Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73703D498
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 19:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02872891BF;
	Tue, 11 Jun 2019 17:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C51891AC;
 Tue, 11 Jun 2019 17:51:12 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 10:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,362,1557212400"; d="scan'208";a="183881099"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 11 Jun 2019 10:51:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 11 Jun 2019 20:51:07 +0300
Date: Tue, 11 Jun 2019 20:51:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Throw away the BIOS fb if has
 the wrong depth/bpp
Message-ID: <20190611175107.GJ5942@intel.com>
References: <20190607162611.23514-1-ville.syrjala@linux.intel.com>
 <20190607162611.23514-4-ville.syrjala@linux.intel.com>
 <20190607184356.GO21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607184356.GO21222@phenom.ffwll.local>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDg6NDM6NTZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEp1biAwNywgMjAxOSBhdCAwNzoyNjoxMVBNICswMzAwLCBWaWxsZSBT
eXJqYWxhIHdyb3RlOgo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KPiA+IAo+ID4gUmVzcGVjdCB0aGUgdXNlcidzIGNob2ljZSBvZiBkZXB0
aC9icHAgZm9yIHRoZSBmYmRldiBmcmFtZWJ1ZmZlcgo+ID4gYW5kIHRocm93IG91dCB0aGUgZmIg
d2UgaW5oZXJpdGVkIGZyb20gdGhlIEJJT1MgaWYgaXQgZG9lc24ndAo+ID4gbWF0Y2guCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Cj4gCj4gSSBndWVzcyB3ZSdyZSBnb2luZyBib29tIHJpZ2h0IG5vdywgd2hpY2gg
aXMgbWF5YmUgYSBiaXQgbXVjaD8gaS5lLgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCgpJ
IHRoaW5rIGN1cnJlbnRseSBpdCBqdXN0IGlnbm9yZXMgd2hhdGV2ZXIgdGhlIHVzZXIgc2FpZC4K
SSBkaWRuJ3Qgc2VlIGFueSBleHBsb3Npb25zLgoKPiAKPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAKPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX2ZiZGV2LmMgfCAxMSArKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pbnRlbF9mYmRldi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZmJkZXYu
Ywo+ID4gaW5kZXggMGQzYTZmYTY3NGU2Li4xYTkzNWRjNzRkMjMgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9mYmRldi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pbnRlbF9mYmRldi5jCj4gPiBAQCAtMTk5LDYgKzE5OSwxNyBAQCBzdGF0aWMgaW50
IGludGVsZmJfY3JlYXRlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpoZWxwZXIsCj4gPiAgCQlkcm1f
ZnJhbWVidWZmZXJfcHV0KCZpbnRlbF9mYi0+YmFzZSk7Cj4gPiAgCQlpbnRlbF9mYiA9IGlmYmRl
di0+ZmIgPSBOVUxMOwo+ID4gIAl9Cj4gPiArCWlmIChpbnRlbF9mYiAmJgo+ID4gKwkgICAgKHNp
emVzLT5zdXJmYWNlX2RlcHRoICE9IGludGVsX2ZiLT5iYXNlLmZvcm1hdC0+ZGVwdGggfHwKPiA+
ICsJICAgICBzaXplcy0+c3VyZmFjZV9icHAgIT0gaW50ZWxfZmItPmJhc2UuZm9ybWF0LT5jcHBb
MF0gKiA4KSkgewo+IAo+IEJpa2VzaGVkOiBBIGxpdHRsZSBoZWxwZXIgdGhhdCBkb2VzIGFsbCB0
aGVzZSBjaGVja3Mgd2l0aCBkZWJ1ZyBvdXRwdXQsCj4gYW5kIGp1c3Qgb25lICJ0aHJvdyBiaW9z
IGZiIGF3YXkiIHBhdGggd291bGQgbG9vayBhIGxvdCBuZWF0ZXIuCj4gLURhbmllbAo+IAo+ID4g
KwkJRFJNX0RFQlVHX0tNUygiQklPUyBmYiB1c2luZyB3cm9uZyBkZXB0aC9icHAgKCVkLyVkKSwg
d2UgcmVxdWlyZSAoJWQvJWQpLCIKPiA+ICsJCQkgICAgICAiIHJlbGVhc2luZyBpdFxuIiwKPiA+
ICsJCQkgICAgICBpbnRlbF9mYi0+YmFzZS5mb3JtYXQtPmRlcHRoLAo+ID4gKwkJCSAgICAgIGlu
dGVsX2ZiLT5iYXNlLmZvcm1hdC0+Y3BwWzBdICogOCwKPiA+ICsJCQkgICAgICBzaXplcy0+c3Vy
ZmFjZV9kZXB0aCwgc2l6ZXMtPnN1cmZhY2VfYnBwKTsKPiA+ICsJCWRybV9mcmFtZWJ1ZmZlcl9w
dXQoJmludGVsX2ZiLT5iYXNlKTsKPiA+ICsJCWludGVsX2ZiID0gaWZiZGV2LT5mYiA9IE5VTEw7
Cj4gPiArCX0KPiA+ICAJaWYgKCFpbnRlbF9mYiB8fCBXQVJOX09OKCFpbnRlbF9mYl9vYmooJmlu
dGVsX2ZiLT5iYXNlKSkpIHsKPiA+ICAJCURSTV9ERUJVR19LTVMoIm5vIEJJT1MgZmIsIGFsbG9j
YXRpbmcgYSBuZXcgb25lXG4iKTsKPiA+ICAJCXJldCA9IGludGVsZmJfYWxsb2MoaGVscGVyLCBz
aXplcyk7Cj4gPiAtLSAKPiA+IDIuMjEuMAo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdAo+ID4g
SW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngKPiAKPiAtLSAKPiBEYW5pZWwgVmV0
dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
