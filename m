Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9229B96D4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 19:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F24B6E0B7;
	Fri, 20 Sep 2019 17:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3516E0A8;
 Fri, 20 Sep 2019 17:55:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 10:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,529,1559545200"; d="scan'208";a="217719014"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 20 Sep 2019 10:55:41 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iBN89-0009cT-0y; Sat, 21 Sep 2019 01:55:41 +0800
Date: Sat, 21 Sep 2019 01:55:25 +0800
From: kbuild test robot <lkp@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Subject: [drm-intel:drm-intel-next-queued 6/7]
 drivers/gpu/drm/i915/display/intel_color.c:1576 ilk_read_lut_10() error:
 potential null dereference 'blob'.  (drm_property_create_blob returns null)
Message-ID: <201909210114.iKWrswyk%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 kbuild-all@01.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dHJlZTogICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0taW50ZWwgZHJtLWludGVs
LW5leHQtcXVldWVkCmhlYWQ6ICAgNGJiNmE5ZDVkOWE4Mjg5NjczYzRjYjA3ODZkNDRiZThhNjNj
MjFkYgpjb21taXQ6IDZiOTdiMTE4ZDRkNTQyYzdiYzI1YjcyNWM2ZGUzOTQ3ZmZmYjkyMWIgWzYv
N10gZHJtL2k5MTUvZGlzcGxheTogRXh0cmFjdCBpbGtfcmVhZF9sdXRzKCkKCklmIHlvdSBmaXgg
dGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcKUmVwb3J0ZWQtYnk6IGtidWlsZCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgoKTmV3IHNtYXRjaCB3YXJuaW5nczoKZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jOjE1NzYgaWxrX3JlYWRfbHV0XzEwKCkg
ZXJyb3I6IHBvdGVudGlhbCBudWxsIGRlcmVmZXJlbmNlICdibG9iJy4gIChkcm1fcHJvcGVydHlf
Y3JlYXRlX2Jsb2IgcmV0dXJucyBudWxsKQoKT2xkIHNtYXRjaCB3YXJuaW5nczoKZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jOjE1MzUgaTl4eF9yZWFkX2x1dF84KCkg
ZXJyb3I6IHBvdGVudGlhbCBudWxsIGRlcmVmZXJlbmNlICdibG9iJy4gIChkcm1fcHJvcGVydHlf
Y3JlYXRlX2Jsb2IgcmV0dXJucyBudWxsKQoKdmltICsvYmxvYiArMTU3NiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMKCiAgMTU1OAkKICAxNTU5CXN0YXRpYyBzdHJ1
Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKgogIDE1NjAJaWxrX3JlYWRfbHV0XzEwKGNvbnN0IHN0cnVj
dCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQogIDE1NjEJewogIDE1NjIJCXN0cnVjdCBp
bnRlbF9jcnRjICpjcnRjID0gdG9faW50ZWxfY3J0YyhjcnRjX3N0YXRlLT5iYXNlLmNydGMpOwog
IDE1NjMJCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoY3J0Yy0+
YmFzZS5kZXYpOwogIDE1NjQJCXUzMiBsdXRfc2l6ZSA9IElOVEVMX0lORk8oZGV2X3ByaXYpLT5j
b2xvci5nYW1tYV9sdXRfc2l6ZTsKICAxNTY1CQllbnVtIHBpcGUgcGlwZSA9IGNydGMtPnBpcGU7
CiAgMTU2NgkJc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpibG9iOwogIDE1NjcJCXN0cnVjdCBk
cm1fY29sb3JfbHV0ICpibG9iX2RhdGE7CiAgMTU2OAkJdTMyIGksIHZhbDsKICAxNTY5CQogIDE1
NzAJCWJsb2IgPSBkcm1fcHJvcGVydHlfY3JlYXRlX2Jsb2IoJmRldl9wcml2LT5kcm0sCiAgMTU3
MQkJCQkJCXNpemVvZihzdHJ1Y3QgZHJtX2NvbG9yX2x1dCkgKiBsdXRfc2l6ZSwKICAxNTcyCQkJ
CQkJTlVMTCk7CiAgMTU3MwkJaWYgKElTX0VSUihibG9iKSkKICAxNTc0CQkJcmV0dXJuIE5VTEw7
CiAgMTU3NQkKPiAxNTc2CQlibG9iX2RhdGEgPSBibG9iLT5kYXRhOwogIDE1NzcJCiAgMTU3OAkJ
Zm9yIChpID0gMDsgaSA8IGx1dF9zaXplOyBpKyspIHsKICAxNTc5CQkJdmFsID0gSTkxNV9SRUFE
KFBSRUNfUEFMRVRURShwaXBlLCBpKSk7CiAgMTU4MAkKICAxNTgxCQkJYmxvYl9kYXRhW2ldLnJl
ZCA9IGludGVsX2NvbG9yX2x1dF9wYWNrKFJFR19GSUVMRF9HRVQoCiAgMTU4MgkJCQkJCQkJUFJF
Q19QQUxFVFRFX1JFRF9NQVNLLCB2YWwpLCAxMCk7CiAgMTU4MwkJCWJsb2JfZGF0YVtpXS5ncmVl
biA9IGludGVsX2NvbG9yX2x1dF9wYWNrKFJFR19GSUVMRF9HRVQoCiAgMTU4NAkJCQkJCQkJICBQ
UkVDX1BBTEVUVEVfR1JFRU5fTUFTSywgdmFsKSwgMTApOwogIDE1ODUJCQlibG9iX2RhdGFbaV0u
Ymx1ZSA9IGludGVsX2NvbG9yX2x1dF9wYWNrKFJFR19GSUVMRF9HRVQoCiAgMTU4NgkJCQkJCQkJ
IFBSRUNfUEFMRVRURV9CTFVFX01BU0ssIHZhbCksIDEwKTsKICAxNTg3CQl9CiAgMTU4OAkKICAx
NTg5CQlyZXR1cm4gYmxvYjsKICAxNTkwCX0KICAxNTkxCQoKLS0tCjAtREFZIGtlcm5lbCB0ZXN0
IGluZnJhc3RydWN0dXJlICAgICAgICAgICAgICAgIE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2Vu
dGVyCmh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9rYnVpbGQtYWxsICAgICAgICAgICAg
ICAgICAgIEludGVsIENvcnBvcmF0aW9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
