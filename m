Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8DE9D018
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 15:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDD689DB4;
	Mon, 26 Aug 2019 13:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C6789DB4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 13:10:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 06:10:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="197051939"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2019 06:10:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Ser <simon.ser@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: add port info to debugfs
In-Reply-To: <20190822110927.28249-1-simon.ser@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190822110927.28249-1-simon.ser@intel.com>
Date: Mon, 26 Aug 2019 16:10:00 +0300
Message-ID: <878srg9ion.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Manasi Navare <nabasi.d.navare@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMiBBdWcgMjAxOSwgU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPiB3cm90
ZToKPiBUaGlzIHBhdGNoIGFkZHMgYSBsaW5lIHdpdGggdGhlIHBvcnQgbmFtZSB0byBjb25uZWN0
b3JzIGluCj4gZGVidWdmcy9pOTE1X2RlYnVnX2luZm8uIElmIHRoZSBwb3J0IGlzIFR5cGUtQywg
dGhlIFR5cGUtQyBwb3J0IG51bWJlciBpcwo+IHByaW50ZWQgdG9vLgo+Cj4gU2lnbmVkLW9mZi1i
eTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgo+IENjOiBJbXJlIERlYWsgPGltcmUu
ZGVha0BpbnRlbC5jb20+Cj4gQ2M6IE1hbmFzaSBOYXZhcmUgPG5hYmFzaS5kLm5hdmFyZUBpbnRl
bC5jb20+Cj4gLS0tCj4KPiBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMsIEltcmUgYW5kIE1hbmFz
aS4gSGVyZSBpcyB2MjoKPgo+IC0gVXNlIHNhbWUgcG9ydCBmb3JtYXR0aW5nIGFzIGludGVsX3Rj
X3BvcnRfaW5pdCAoZS5nLiAiQy9UQyMxIikKPiAtIEZpeCB0eXBvIGluIGNvbW1pdCBtZXNzYWdl
CgpVc3VhbGx5IGluIGRybSB3ZSBwdXQgdGhlIHBhdGNoIGNoYW5nZWxvZyBhcyBwYXJ0IG9mIHRo
ZSBjb21taXQgbWVzc2FnZS4KClBsZWFzZSByZXNlbmQgdGhlIHBhdGNoIHRvIGludGVsLWdmeEAs
IGFuZCB5b3UnbGwgZ2V0IG91ciBDSSByZXN1bHRzCnRvby4KCkJSLApKYW5pLgoKCgo+Cj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jIHwgMTAgKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1
Z2ZzLmMKPiBpbmRleCBiMzkyMjZkN2Y4ZDIuLjRiYTUwOGM5NTRmOCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfZGVidWdmcy5jCj4gQEAgLTI1NTcsOSArMjU1NywxMSBAQCBzdGF0aWMgdm9p
ZCBpbnRlbF9sdmRzX2luZm8oc3RydWN0IHNlcV9maWxlICptLAo+ICBzdGF0aWMgdm9pZCBpbnRl
bF9jb25uZWN0b3JfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sCj4gIAkJCQkgc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvcikKPiAgewo+ICsJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5
MTUgPSB0b19pOTE1KGNvbm5lY3Rvci0+ZGV2KTsKPiAgCXN0cnVjdCBpbnRlbF9jb25uZWN0b3Ig
KmludGVsX2Nvbm5lY3RvciA9IHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0b3IpOwo+ICAJc3Ry
dWN0IGludGVsX2VuY29kZXIgKmludGVsX2VuY29kZXIgPSBpbnRlbF9jb25uZWN0b3ItPmVuY29k
ZXI7Cj4gIAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZTsKPiArCWVudW0gdGNfcG9ydCB0
Y19wb3J0Owo+Cj4gIAlzZXFfcHJpbnRmKG0sICJjb25uZWN0b3IgJWQ6IHR5cGUgJXMsIHN0YXR1
czogJXNcbiIsCj4gIAkJICAgY29ubmVjdG9yLT5iYXNlLmlkLCBjb25uZWN0b3ItPm5hbWUsCj4g
QEAgLTI1NzgsNiArMjU4MCwxNCBAQCBzdGF0aWMgdm9pZCBpbnRlbF9jb25uZWN0b3JfaW5mbyhz
dHJ1Y3Qgc2VxX2ZpbGUgKm0sCj4gIAlpZiAoIWludGVsX2VuY29kZXIpCj4gIAkJcmV0dXJuOwo+
Cj4gKwlpZiAoaW50ZWxfZW5jb2Rlci0+cG9ydCAhPSBQT1JUX05PTkUpIHsKPiArCQlzZXFfcHJp
bnRmKG0sICJcdHBvcnQ6ICVjIiwgcG9ydF9uYW1lKGludGVsX2VuY29kZXItPnBvcnQpKTsKPiAr
CQl0Y19wb3J0ID0gaW50ZWxfcG9ydF90b190YyhpOTE1LCBpbnRlbF9lbmNvZGVyLT5wb3J0KTsK
PiArCQlpZiAodGNfcG9ydCAhPSBQT1JUX1RDX05PTkUpCj4gKwkJCXNlcV9wcmludGYobSwgIi9U
QyMlZCIsIHRjX3BvcnQgKyAxKTsKPiArCQlzZXFfcHJpbnRmKG0sICJcbiIpOwo+ICsJfQo+ICsK
PiAgCXN3aXRjaCAoY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSkgewo+ICAJY2FzZSBEUk1fTU9E
RV9DT05ORUNUT1JfRGlzcGxheVBvcnQ6Cj4gIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9lRFA6
Cj4gLS0KPiAyLjIyLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGlj
cyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
