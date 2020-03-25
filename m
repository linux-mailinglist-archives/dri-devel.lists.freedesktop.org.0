Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E1191E8C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 02:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE136E588;
	Wed, 25 Mar 2020 01:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5126D6E580;
 Wed, 25 Mar 2020 01:20:24 +0000 (UTC)
IronPort-SDR: vMNuP9Lhdb330wbj7SCdkxE3hSbuKgkTAh44Ug+wwBTTvHkt4bRtd3LLnJT7gPE4Ixc0VwWMiE
 GpYoII1/RsCQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 18:20:23 -0700
IronPort-SDR: eIf1cg9BaflJtioi2HdPSbKxAuq4uHTI5Uk4uP8OrP9wdNbwl0r4g3yvy2sHuBoi+mMS7jeRSa
 sIwi/jRdq7jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,302,1580803200"; d="scan'208";a="448108142"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga006.fm.intel.com with ESMTP; 24 Mar 2020 18:20:23 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/dp: Attach and set drm connector VRR property
Date: Tue, 24 Mar 2020 18:22:01 -0700
Message-Id: <20200325012201.11376-2-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200325012201.11376-1-manasi.d.navare@intel.com>
References: <20200325012201.11376-1-manasi.d.navare@intel.com>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Aditya Swarup <aditya.swarup@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWRpdHlhIFN3YXJ1cCA8YWRpdHlhLnN3YXJ1cEBpbnRlbC5jb20+CgpUaGlzIGZ1bmN0
aW9uIHNldHMgdGhlIFZSUiBwcm9wZXJ0eSBmb3IgY29ubmVjdG9yIGJhc2VkCm9uIHRoZSBwbGF0
Zm9ybSBzdXBwb3J0LCBFRElEIG1vbml0b3IgcmFuZ2UgYW5kIERQIHNpbmsKRFBDRCBjYXBhYmls
aXR5IG9mIG91dHB1dGluZyB2aWRlbyB3aXRob3V0IG1zYQp0aW1pbmcgaW5mb3JtYXRpb24uCgp2
MjoKKiBKdXN0IHNldCB0aGlzIGluIGludGVsX2RwX2dldF9tb2RlcyBpbnN0ZWFkIG9mIG5ldyBo
b29rIChKYW5pKQoKQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+CkNjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBZGl0eWEgU3dhcnVwIDxhZGl0eWEuc3dhcnVwQGludGVsLmNvbT4KU2lnbmVk
LW9mZi1ieTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgfCAyNCArKysrKysrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCmluZGV4IGVmMmUwNmUyOTJkNS4uOTVkYjRlNzgz
ODkzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCkBAIC01ODQzLDYg
KzU4NDMsMjMgQEAgaW50ZWxfZHBfZm9yY2Uoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
cikKIAlpbnRlbF9kaXNwbGF5X3Bvd2VyX3B1dChkZXZfcHJpdiwgYXV4X2RvbWFpbiwgd2FrZXJl
Zik7CiB9CiAKK3N0YXRpYyBib29sIGludGVsX2RwX2lzX3Zycl9jYXBhYmxlKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IpCit7CisJc3RydWN0IGludGVsX2RwICppbnRlbF9kcCA9IGlu
dGVsX2F0dGFjaGVkX2RwKHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0b3IpKTsKKwljb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfaW5mbyAqaW5mbyA9ICZjb25uZWN0b3ItPmRpc3BsYXlfaW5mbzsK
KwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGNvbm5lY3Rvci0+
ZGV2KTsKKworCS8qCisJICogRFAgU2luayBpcyBjYXBhYmxlIG9mIFZhcmlhYmxlIHJlZnJlc2gg
dmlkZW8gdGltaW5ncyBpZgorCSAqIElnbm9yZSBNU0EgYml0IGlzIHNldCBpbiBEUENELgorCSAq
IEVESUQgbW9uaXRvciByYW5nZSBhbHNvIHNob3VsZCBiZSBhdGxlYXN0IDEwIGZvciByZWFzb25h
YmxlCisJICogQWRhcHRpdmUgc3luYy8gVlJSIGVuZCB1c2VyIGV4cGVyaWVuY2UuCisJICovCisJ
cmV0dXJuIElOVEVMX0dFTihkZXZfcHJpdikgPj0gMTIgJiYKKwkJZHJtX2RwX3NpbmtfY2FuX2Rv
X3ZpZGVvX3dpdGhvdXRfdGltaW5nX21zYShpbnRlbF9kcC0+ZHBjZCkgJiYKKwkJaW5mby0+bW9u
aXRvcl9yYW5nZS5tYXhfdmZyZXEgLSBpbmZvLT5tb25pdG9yX3JhbmdlLm1pbl92ZnJlcSA+IDEw
OworfQorCiBzdGF0aWMgaW50IGludGVsX2RwX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yKQogewogCXN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmludGVsX2Nvbm5lY3Rv
ciA9IHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0b3IpOwpAQCAtNTg1Myw2ICs1ODcwLDEwIEBA
IHN0YXRpYyBpbnQgaW50ZWxfZHBfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCiAJCWludCByZXQgPSBpbnRlbF9jb25uZWN0b3JfdXBkYXRlX21vZGVzKGNvbm5lY3Rv
ciwgZWRpZCk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OworCisJCWlmIChpbnRlbF9kcF9p
c192cnJfY2FwYWJsZShjb25uZWN0b3IpKQorCQkJZHJtX2Nvbm5lY3Rvcl9zZXRfdnJyX2NhcGFi
bGVfcHJvcGVydHkoY29ubmVjdG9yLAorCQkJCQkJCSAgICAgICB0cnVlKTsKIAl9CiAKIAkvKiBp
ZiBlRFAgaGFzIG5vIEVESUQsIGZhbGwgYmFjayB0byBmaXhlZCBtb2RlICovCkBAIC02ODgwLDYg
KzY5MDEsOSBAQCBpbnRlbF9kcF9hZGRfcHJvcGVydGllcyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVs
X2RwLCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdAogCQljb25uZWN0b3ItPnN0YXRlLT5z
Y2FsaW5nX21vZGUgPSBEUk1fTU9ERV9TQ0FMRV9BU1BFQ1Q7CiAKIAl9CisKKwlpZiAoSU5URUxf
R0VOKGRldl9wcml2KSA+PSAxMikKKwkJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfdnJyX2NhcGFibGVf
cHJvcGVydHkoY29ubmVjdG9yKTsKIH0KIAogc3RhdGljIHZvaWQgaW50ZWxfZHBfaW5pdF9wYW5l
bF9wb3dlcl90aW1lc3RhbXBzKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApCi0tIAoyLjE5LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
