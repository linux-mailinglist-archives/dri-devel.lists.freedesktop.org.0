Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B342B89EC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 06:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509BC6E911;
	Fri, 20 Sep 2019 04:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3711A6E911;
 Fri, 20 Sep 2019 04:13:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 21:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,527,1559545200"; d="scan'208";a="202426387"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2019 21:13:37 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iBAIa-0004cN-Lu; Fri, 20 Sep 2019 12:13:36 +0800
Date: Fri, 20 Sep 2019 12:12:40 +0800
From: kbuild test robot <lkp@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Subject: [drm-intel:drm-intel-next-queued 5/7]
 drivers/gpu/drm/i915/display/intel_color.c:1535 i9xx_read_lut_8() error:
 potential null dereference 'blob'.  (drm_property_create_blob returns null)
Message-ID: <201909201233.X1brvSvY%lkp@intel.com>
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
MjFkYgpjb21taXQ6IDFhZjIyMzgzODI5ODY0Mjk5MTAyY2EwYzJlYWI0NThmNzU1YTk5NzEgWzUv
N10gZHJtL2k5MTUvZGlzcGxheTogRXh0cmFjdCBpOXh4X3JlYWRfbHV0cygpCgpJZiB5b3UgZml4
IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnClJlcG9ydGVkLWJ5OiBrYnVpbGQg
dGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KCnNtYXRjaCB3YXJuaW5nczoKZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jOjE1MzUgaTl4eF9yZWFkX2x1dF84KCkgZXJy
b3I6IHBvdGVudGlhbCBudWxsIGRlcmVmZXJlbmNlICdibG9iJy4gIChkcm1fcHJvcGVydHlfY3Jl
YXRlX2Jsb2IgcmV0dXJucyBudWxsKQoKdmltICsvYmxvYiArMTUzNSBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMKCiAgMTUxOAkKICAxNTE5CXN0YXRpYyBzdHJ1Y3Qg
ZHJtX3Byb3BlcnR5X2Jsb2IgKgogIDE1MjAJaTl4eF9yZWFkX2x1dF84KGNvbnN0IHN0cnVjdCBp
bnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQogIDE1MjEJewogIDE1MjIJCXN0cnVjdCBpbnRl
bF9jcnRjICpjcnRjID0gdG9faW50ZWxfY3J0YyhjcnRjX3N0YXRlLT5iYXNlLmNydGMpOwogIDE1
MjMJCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoY3J0Yy0+YmFz
ZS5kZXYpOwogIDE1MjQJCWVudW0gcGlwZSBwaXBlID0gY3J0Yy0+cGlwZTsKICAxNTI1CQlzdHJ1
Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmJsb2I7CiAgMTUyNgkJc3RydWN0IGRybV9jb2xvcl9sdXQg
KmJsb2JfZGF0YTsKICAxNTI3CQl1MzIgaSwgdmFsOwogIDE1MjgJCiAgMTUyOQkJYmxvYiA9IGRy
bV9wcm9wZXJ0eV9jcmVhdGVfYmxvYigmZGV2X3ByaXYtPmRybSwKICAxNTMwCQkJCQkJc2l6ZW9m
KHN0cnVjdCBkcm1fY29sb3JfbHV0KSAqIExFR0FDWV9MVVRfTEVOR1RILAogIDE1MzEJCQkJCQlO
VUxMKTsKICAxNTMyCQlpZiAoSVNfRVJSKGJsb2IpKQogIDE1MzMJCQlyZXR1cm4gTlVMTDsKICAx
NTM0CQo+IDE1MzUJCWJsb2JfZGF0YSA9IGJsb2ItPmRhdGE7CiAgMTUzNgkKICAxNTM3CQlmb3Ig
KGkgPSAwOyBpIDwgTEVHQUNZX0xVVF9MRU5HVEg7IGkrKykgewogIDE1MzgJCQlpZiAoSEFTX0dN
Q0goZGV2X3ByaXYpKQogIDE1MzkJCQkJdmFsID0gSTkxNV9SRUFEKFBBTEVUVEUocGlwZSwgaSkp
OwogIDE1NDAJCQllbHNlCiAgMTU0MQkJCQl2YWwgPSBJOTE1X1JFQUQoTEdDX1BBTEVUVEUocGlw
ZSwgaSkpOwogIDE1NDIJCiAgMTU0MwkJCWJsb2JfZGF0YVtpXS5yZWQgPSBpbnRlbF9jb2xvcl9s
dXRfcGFjayhSRUdfRklFTERfR0VUKAogIDE1NDQJCQkJCQkJCUxHQ19QQUxFVFRFX1JFRF9NQVNL
LCB2YWwpLCA4KTsKICAxNTQ1CQkJYmxvYl9kYXRhW2ldLmdyZWVuID0gaW50ZWxfY29sb3JfbHV0
X3BhY2soUkVHX0ZJRUxEX0dFVCgKICAxNTQ2CQkJCQkJCQkgIExHQ19QQUxFVFRFX0dSRUVOX01B
U0ssIHZhbCksIDgpOwogIDE1NDcJCQlibG9iX2RhdGFbaV0uYmx1ZSA9IGludGVsX2NvbG9yX2x1
dF9wYWNrKFJFR19GSUVMRF9HRVQoCiAgMTU0OAkJCQkJCQkJIExHQ19QQUxFVFRFX0JMVUVfTUFT
SywgdmFsKSwgOCk7CiAgMTU0OQkJfQogIDE1NTAJCiAgMTU1MQkJcmV0dXJuIGJsb2I7CiAgMTU1
Mgl9CiAgMTU1MwkKCi0tLQowLURBWSBrZXJuZWwgdGVzdCBpbmZyYXN0cnVjdHVyZSAgICAgICAg
ICAgICAgICBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlcgpodHRwczovL2xpc3RzLjAxLm9y
Zy9waXBlcm1haWwva2J1aWxkLWFsbCAgICAgICAgICAgICAgICAgICBJbnRlbCBDb3Jwb3JhdGlv
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
