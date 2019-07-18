Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1326D06F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 16:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9816E40D;
	Thu, 18 Jul 2019 14:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8276E40B;
 Thu, 18 Jul 2019 14:51:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 07:51:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,278,1559545200"; d="scan'208";a="158800842"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 18 Jul 2019 07:51:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Jul 2019 17:51:21 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/12] drm/i915: Add PIPECONF YCbCr 4:4:4 programming for HSW
Date: Thu, 18 Jul 2019 17:50:50 +0300
Message-Id: <20190718145053.25808-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk9u
IEhTVyB0aGUgcGlwZSBjb2xvcnNwYWNlIGlzIGNvbmZpZ3VyZWQgdmlhIFBJUEVDT05GCihhcyBv
cHBvc2VkIHRvIFBJUEVNSVNDIGluIEJEVyspLiBMZXQncyBjb25maWd1cmUrcmVhZG91dAp0aGF0
IHN0dWZmIGNvcnJlY3RseS4KCkVuYWJsbGluZyBZQ2JDciA0OjQ6NCBvdXRwdXQgd2lsbCBub3cg
YmUgYSBzaW1wbGUgbWF0dGVyIG9mCnNldHRpbmcgY3J0Y19zdGF0ZS0+b3V0cHV0X2Zvcm1hdCBh
cHByb3ByaWF0ZWx5IGluIHRoZSBlbmNvZGVyCi5jb21wdXRlX2NvbmZpZygpLgoKU2lnbmVkLW9m
Zi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDEzICsrKysr
KysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAgICAgIHwg
IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwppbmRleCAxZGQx
YWEyOWE2NDkuLmJkM2ZmOTZjMTYxOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5LmMKQEAgLTk0MzAsNiArOTQzMCwxMCBAQCBzdGF0aWMgdm9pZCBoYXN3
ZWxsX3NldF9waXBlY29uZihjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0
ZSkKIAllbHNlCiAJCXZhbCB8PSBQSVBFQ09ORl9QUk9HUkVTU0lWRTsKIAorCWlmIChJU19IQVNX
RUxMKGRldl9wcml2KSAmJgorCSAgICBjcnRjX3N0YXRlLT5vdXRwdXRfZm9ybWF0ICE9IElOVEVM
X09VVFBVVF9GT1JNQVRfUkdCKQorCQl2YWwgfD0gUElQRUNPTkZfT1VUUFVUX0NPTE9SU1BBQ0Vf
WVVWX0hTVzsKKwogCUk5MTVfV1JJVEUoUElQRUNPTkYoY3B1X3RyYW5zY29kZXIpLCB2YWwpOwog
CVBPU1RJTkdfUkVBRChQSVBFQ09ORihjcHVfdHJhbnNjb2RlcikpOwogfQpAQCAtMTA0MjMsNyAr
MTA0MjcsMTQgQEAgc3RhdGljIGJvb2wgaGFzd2VsbF9nZXRfcGlwZV9jb25maWcoc3RydWN0IGlu
dGVsX2NydGMgKmNydGMsCiAKIAlpbnRlbF9nZXRfcGlwZV9zcmNfc2l6ZShjcnRjLCBwaXBlX2Nv
bmZpZyk7CiAKLQlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSA5IHx8IElTX0JST0FEV0VMTChk
ZXZfcHJpdikpIHsKKwlpZiAoSVNfSEFTV0VMTChkZXZfcHJpdikpIHsKKwkJdTMyIHRtcCA9IEk5
MTVfUkVBRChQSVBFQ09ORihwaXBlX2NvbmZpZy0+Y3B1X3RyYW5zY29kZXIpKTsKKworCQlpZiAo
dG1wICYgUElQRUNPTkZfT1VUUFVUX0NPTE9SU1BBQ0VfWVVWX0hTVykKKwkJCXBpcGVfY29uZmln
LT5vdXRwdXRfZm9ybWF0ID0gSU5URUxfT1VUUFVUX0ZPUk1BVF9ZQ0JDUjQ0NDsKKwkJZWxzZQor
CQkJcGlwZV9jb25maWctPm91dHB1dF9mb3JtYXQgPSBJTlRFTF9PVVRQVVRfRk9STUFUX1JHQjsK
Kwl9IGVsc2UgewogCQlwaXBlX2NvbmZpZy0+b3V0cHV0X2Zvcm1hdCA9CiAJCQliZHdfZ2V0X3Bp
cGVtaXNjX291dHB1dF9mb3JtYXQoY3J0Yyk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfcmVnLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCmluZGV4
IDY2ZjdmNDE3MjMxZi4uNTg0NzEzMTJiOGIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X3JlZy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgKQEAg
LTU3MTIsNiArNTcxMiw3IEBAIGVudW0gewogI2RlZmluZSAgIFBJUEVDT05GX0NYU1JfRE9XTkNM
T0NLCSgxIDw8IDE2KQogI2RlZmluZSAgIFBJUEVDT05GX0VEUF9SUl9NT0RFX1NXSVRDSF9WTFYJ
KDEgPDwgMTQpCiAjZGVmaW5lICAgUElQRUNPTkZfQ09MT1JfUkFOR0VfU0VMRUNUCSgxIDw8IDEz
KQorI2RlZmluZSAgIFBJUEVDT05GX09VVFBVVF9DT0xPUlNQQUNFX1lVVl9IU1cJKDEgPDwgMTEp
IC8qIGhzdyBvbmx5ICovCiAjZGVmaW5lICAgUElQRUNPTkZfQlBDX01BU0sJKDB4NyA8PCA1KQog
I2RlZmluZSAgIFBJUEVDT05GXzhCUEMJCSgwIDw8IDUpCiAjZGVmaW5lICAgUElQRUNPTkZfMTBC
UEMJKDEgPDwgNSkKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
