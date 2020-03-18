Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 843011895E5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 07:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE556E86F;
	Wed, 18 Mar 2020 06:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E73898CE;
 Wed, 18 Mar 2020 06:33:48 +0000 (UTC)
IronPort-SDR: SqEtN9/E8/jwY5V6hDAm8C38ojeIGQs13sBDFfaQwpDVhR19b72Lq2wokCM9mHJk+1at59o0HH
 2qJ4aMPYKTkw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 23:33:47 -0700
IronPort-SDR: KTi2+Je3Z5QzX1f/QuXhoYMQ8zsv8fJDoFimqj/t6cxH+/YXXIymzMGiS/xzT1UNXCiGCbik1u
 RwJI7wF0Dviw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; d="scan'208";a="417839761"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by orsmga005.jf.intel.com with ESMTP; 17 Mar 2020 23:33:47 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/dp: intel_dp connector hook for VRR support
Date: Tue, 17 Mar 2020 23:35:17 -0700
Message-Id: <20200318063517.3844-3-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200318063517.3844-1-manasi.d.navare@intel.com>
References: <20200318063517.3844-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
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
Cc: Aditya Swarup <aditya.swarup@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBkZWZpbmVzIHRoZSBnZXRfdnJyX3N1cHBvcnQgaG9vayBmb3IgaW50ZWwgRFAgY29ubmVj
dG9yClZSUiBzdXBwb3J0IGlzIHNldCB0byB0cnVlIGJhc2VkIG9uIHRoZSBEUENEIGlnbm9yZSBN
U0EgYW5kCkVESUQgbW9uaXRvciByYW5nZQoKQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBs
aW51eC5pbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CkNj
OiBOaWNob2xhcyBLYXpsYXVza2FzIDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+CkNjOiBB
ZGl0eWEgU3dhcnVwIDxhZGl0eWEuc3dhcnVwQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTWFu
YXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KLS0tCiAuLi4vZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmggICAgfCAgMyArKysKIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgKaW5kZXggNWUwMGU2MTFmMDc3
Li5jZDM3ZWU2ZGIxZmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheV90eXBlcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheV90eXBlcy5oCkBAIC0xMzUzLDYgKzEzNTMsOSBAQCBzdHJ1Y3QgaW50ZWxf
ZHAgewogCiAJLyogRGlzcGxheSBzdHJlYW0gY29tcHJlc3Npb24gdGVzdGluZyAqLwogCWJvb2wg
Zm9yY2VfZHNjX2VuOworCisJLyogRFAgVmFyaWFibGUgcmVmcmVzaCByYXRlLyBBZGFwdGl2ZSBz
eW5jIHN1cHBvcnQgKi8KKwlib29sIHZycl9jYXBhYmxlOwogfTsKIAogZW51bSBsc3Bjb25fdmVu
ZG9yIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwppbmRleCAwYTQxN2Nk
MmFmMmIuLmNjZjVkODY4YjVjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHAuYwpAQCAtNTg2MCw2ICs1ODYwLDI0IEBAIHN0YXRpYyBpbnQgaW50ZWxfZHBfZ2V0X21vZGVz
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRp
YyB2b2lkIGludGVsX2RwX2dldF92cnJfc3VwcG9ydChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQoreworCXN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAgPSBpbnRlbF9hdHRhY2hlZF9k
cCh0b19pbnRlbF9jb25uZWN0b3IoY29ubmVjdG9yKSk7CisJY29uc3Qgc3RydWN0IGRybV9kaXNw
bGF5X2luZm8gKmluZm8gPSAmY29ubmVjdG9yLT5kaXNwbGF5X2luZm87CisJc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShjb25uZWN0b3ItPmRldik7CisKKwkvKgor
CSAqIERQIFNpbmsgaXMgY2FwYWJsZSBvZiBWYXJpYWJsZSByZWZyZXNoIHZpZGVvIHRpbWluZ3Mg
aWYKKwkgKiBJZ25vcmUgTVNBIGJpdCBpcyBzZXQgaW4gRFBDRC4KKwkgKiBFRElEIG1vbml0b3Ig
cmFuZ2UgYWxzbyBzaG91bGQgYmUgYXRsZWFzdCAxMCBmb3IgcmVhc29uYWJsZQorCSAqIEFkYXB0
aXZlIHN5bmMvIFZSUiBlbmQgdXNlciBleHBlcmllbmNlLgorCSAqLworCWlmIChJTlRFTF9HRU4o
ZGV2X3ByaXYpID49IDEyICYmCisJICAgIGRybV9kcF9zaW5rX2lzX2NhcGFibGVfd2l0aG91dF90
aW1pbmdfbXNhKGludGVsX2RwLT5kcGNkKSAmJgorCSAgICBpbmZvLT5tb25pdG9yX3JhbmdlLm1h
eF92ZnJlcSAtIGluZm8tPm1vbml0b3JfcmFuZ2UubWluX3ZmcmVxID4gMTApCisJCWludGVsX2Rw
LT52cnJfY2FwYWJsZSA9IHRydWU7Cit9CisKIHN0YXRpYyBpbnQKIGludGVsX2RwX2Nvbm5lY3Rv
cl9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewpAQCAtNjc1Niw2
ICs2Nzc0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5j
cyBpbnRlbF9kcF9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0KIAkuZ2V0X21vZGVzID0gaW50ZWxf
ZHBfZ2V0X21vZGVzLAogCS5tb2RlX3ZhbGlkID0gaW50ZWxfZHBfbW9kZV92YWxpZCwKIAkuYXRv
bWljX2NoZWNrID0gaW50ZWxfZHBfY29ubmVjdG9yX2F0b21pY19jaGVjaywKKwkuZ2V0X2FkYXB0
aXZlX3N5bmNfc3VwcG9ydCA9IGludGVsX2RwX2dldF92cnJfc3VwcG9ydCwKIH07CiAKIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfZnVuY3MgaW50ZWxfZHBfZW5jX2Z1bmNzID0gewot
LSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
