Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E464D263
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 17:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576AE6E5CB;
	Thu, 20 Jun 2019 15:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907826E5C8;
 Thu, 20 Jun 2019 15:46:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 08:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; d="scan'208";a="154155046"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 20 Jun 2019 08:46:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Jun 2019 18:46:08 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Dump mode picture aspect ratio
Date: Thu, 20 Jun 2019 18:46:08 +0300
Message-Id: <20190620154608.16239-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkN1
cnJlbnRseSB0aGUgbG9ncyBzaG93IG5vdGhpbmcgYWJvdXQgdGhlIG1vZGUncyBhc3BlY3QgcmF0
aW8uCkluY2x1ZGUgdGhhdCBpbmZvcm1hdGlvbiBpbiB0aGUgbm9ybWFsIG1vZGUgZHVtcC4KCkNj
OiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+ClNpZ25lZC1vZmYtYnk6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy92
aWRlby9oZG1pLmMgICAgfCAzICsrLQogaW5jbHVkZS9kcm0vZHJtX21vZGVzLmggfCA0ICsrLS0K
IGluY2x1ZGUvbGludXgvaGRtaS5oICAgIHwgMyArKysKIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vaGRt
aS5jIGIvZHJpdmVycy92aWRlby9oZG1pLmMKaW5kZXggYjkzOWJjMjhkODg2Li5iYzU5M2ZlMWMy
NjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vaGRtaS5jCisrKyBiL2RyaXZlcnMvdmlkZW8v
aGRtaS5jCkBAIC0xMDU3LDcgKzEwNTcsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqaGRtaV9jb2xv
cmltZXRyeV9nZXRfbmFtZShlbnVtIGhkbWlfY29sb3JpbWV0cnkgY29sb3JpbWV0cnkpCiAJcmV0
dXJuICJJbnZhbGlkIjsKIH0KIAotc3RhdGljIGNvbnN0IGNoYXIgKgorY29uc3QgY2hhciAqCiBo
ZG1pX3BpY3R1cmVfYXNwZWN0X2dldF9uYW1lKGVudW0gaGRtaV9waWN0dXJlX2FzcGVjdCBwaWN0
dXJlX2FzcGVjdCkKIHsKIAlzd2l0Y2ggKHBpY3R1cmVfYXNwZWN0KSB7CkBAIC0xMDc2LDYgKzEw
NzYsNyBAQCBoZG1pX3BpY3R1cmVfYXNwZWN0X2dldF9uYW1lKGVudW0gaGRtaV9waWN0dXJlX2Fz
cGVjdCBwaWN0dXJlX2FzcGVjdCkKIAl9CiAJcmV0dXJuICJJbnZhbGlkIjsKIH0KK0VYUE9SVF9T
WU1CT0woaGRtaV9waWN0dXJlX2FzcGVjdF9nZXRfbmFtZSk7CiAKIHN0YXRpYyBjb25zdCBjaGFy
ICoKIGhkbWlfYWN0aXZlX2FzcGVjdF9nZXRfbmFtZShlbnVtIGhkbWlfYWN0aXZlX2FzcGVjdCBh
Y3RpdmVfYXNwZWN0KQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmggYi9pbmNs
dWRlL2RybS9kcm1fbW9kZXMuaAppbmRleCAwODNmMTY3NDczNjkuLjJiMTgwOWM3NGZiZSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX21v
ZGVzLmgKQEAgLTQzMSw3ICs0MzEsNyBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB7CiAvKioK
ICAqIERSTV9NT0RFX0ZNVCAtIHByaW50ZiBzdHJpbmcgZm9yICZzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZQogICovCi0jZGVmaW5lIERSTV9NT0RFX0ZNVCAgICAiXCIlc1wiOiAlZCAlZCAlZCAlZCAl
ZCAlZCAlZCAlZCAlZCAlZCAweCV4IDB4JXgiCisjZGVmaW5lIERSTV9NT0RFX0ZNVCAgICAiXCIl
c1wiOiAlZCAlZCAlZCAlZCAlZCAlZCAlZCAlZCAlZCAlZCAweCV4IDB4JXggJXMiCiAKIC8qKgog
ICogRFJNX01PREVfQVJHIC0gcHJpbnRmIGFyZ3VtZW50cyBmb3IgJnN0cnVjdCBkcm1fZGlzcGxh
eV9tb2RlCkBAIC00NDEsNyArNDQxLDcgQEAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgewogCSht
KS0+bmFtZSwgKG0pLT52cmVmcmVzaCwgKG0pLT5jbG9jaywgXAogCShtKS0+aGRpc3BsYXksICht
KS0+aHN5bmNfc3RhcnQsIChtKS0+aHN5bmNfZW5kLCAobSktPmh0b3RhbCwgXAogCShtKS0+dmRp
c3BsYXksIChtKS0+dnN5bmNfc3RhcnQsIChtKS0+dnN5bmNfZW5kLCAobSktPnZ0b3RhbCwgXAot
CShtKS0+dHlwZSwgKG0pLT5mbGFncworCShtKS0+dHlwZSwgKG0pLT5mbGFncywgaGRtaV9waWN0
dXJlX2FzcGVjdF9nZXRfbmFtZSgobSktPnBpY3R1cmVfYXNwZWN0X3JhdGlvKQogCiAjZGVmaW5l
IG9ial90b19tb2RlKHgpIGNvbnRhaW5lcl9vZih4LCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSwg
YmFzZSkKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9oZG1pLmggYi9pbmNsdWRlL2xpbnV4
L2hkbWkuaAppbmRleCA5OTE4YTZjOTEwYzUuLmRlN2NiZTM4NWRiYSAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9saW51eC9oZG1pLmgKKysrIGIvaW5jbHVkZS9saW51eC9oZG1pLmgKQEAgLTQzNCw0ICs0
MzQsNyBAQCBpbnQgaGRtaV9pbmZvZnJhbWVfdW5wYWNrKHVuaW9uIGhkbWlfaW5mb2ZyYW1lICpm
cmFtZSwKIHZvaWQgaGRtaV9pbmZvZnJhbWVfbG9nKGNvbnN0IGNoYXIgKmxldmVsLCBzdHJ1Y3Qg
ZGV2aWNlICpkZXYsCiAJCQljb25zdCB1bmlvbiBoZG1pX2luZm9mcmFtZSAqZnJhbWUpOwogCitj
b25zdCBjaGFyICoKK2hkbWlfcGljdHVyZV9hc3BlY3RfZ2V0X25hbWUoZW51bSBoZG1pX3BpY3R1
cmVfYXNwZWN0IHBpY3R1cmVfYXNwZWN0KTsKKwogI2VuZGlmIC8qIF9EUk1fSERNSV9IICovCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
