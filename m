Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52363366F43
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 17:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AE96E9A7;
	Wed, 21 Apr 2021 15:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA806E50C;
 Wed, 21 Apr 2021 15:34:16 +0000 (UTC)
IronPort-SDR: LDy6GEheLkNFDbp43uoeDLqpqC8qgpHK5Uvm9PiUHCfaO104tW8vDyzfA1ubAdWXSvdEB9YSNO
 AJwiZVc+E7wA==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="259671660"
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="259671660"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 08:34:16 -0700
IronPort-SDR: OPlGLwDuaC4hATVw7HcJZhvRkbkZMLFfHOFZm3HAP5kT7aclBwktD/7LMHXbeYgLlattjm4aHz
 plHXQpSmJC9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="463620113"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 21 Apr 2021 08:34:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 21 Apr 2021 18:34:13 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915: Give C0DRB3/C1DRB3 a _BW suffix
Date: Wed, 21 Apr 2021 18:34:00 +0300
Message-Id: <20210421153401.13847-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
References: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZXNlIGFyZSB0aGUgOTY1Zy9nNDUvZzMzIHNwZWNpZmljIERSQiByZWdpc3RlcnMuIEdpdmUgdGhl
bQphIHN1aXRhYmxlIHN1ZmZpeCBzbyB3ZSBjYW4gYWRkIHRoZWlyIGNvdW50ZXJwYXJ0cyBmb3Ig
b3RoZXIKcGxhdGZvcm1zLgoKUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2dn
dHRfZmVuY2luZy5jIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMu
YyAgICAgICAgICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAg
ICAgICAgICAgfCA0ICsrLS0KIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2dn
dHRfZmVuY2luZy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dF9mZW5jaW5n
LmMKaW5kZXggOGEzMjI1OTQyMTBjLi4wZmE2YzM4ODkzZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L2ludGVsX2dndHRfZmVuY2luZy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX2dndHRfZmVuY2luZy5jCkBAIC02NTMsOCArNjUzLDggQEAgc3RhdGlj
IHZvaWQgZGV0ZWN0X2JpdF82X3N3aXp6bGUoc3RydWN0IGk5MTVfZ2d0dCAqZ2d0dCkKIAkJICog
YmFua3Mgb2YgbWVtb3J5IGFyZSBwYWlyZWQgYW5kIHVuc3dpenpsZWQgb24gdGhlCiAJCSAqIHVu
ZXZlbiBwb3J0aW9uLCBzbyBsZWF2ZSB0aGF0IGFzIHVua25vd24uCiAJCSAqLwotCQlpZiAoaW50
ZWxfdW5jb3JlX3JlYWQxNih1bmNvcmUsIEMwRFJCMykgPT0KLQkJICAgIGludGVsX3VuY29yZV9y
ZWFkMTYodW5jb3JlLCBDMURSQjMpKSB7CisJCWlmIChpbnRlbF91bmNvcmVfcmVhZDE2KHVuY29y
ZSwgQzBEUkIzX0JXKSA9PQorCQkgICAgaW50ZWxfdW5jb3JlX3JlYWQxNih1bmNvcmUsIEMxRFJC
M19CVykpIHsKIAkJCXN3aXp6bGVfeCA9IEk5MTVfQklUXzZfU1dJWlpMRV85XzEwOwogCQkJc3dp
enpsZV95ID0gSTkxNV9CSVRfNl9TV0laWkxFXzk7CiAJCX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9k
ZWJ1Z2ZzLmMKaW5kZXggYjY1NGI3NDk4YmNkLi44ZGQzNzQ2OTExMDIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZGVidWdmcy5jCkBAIC02MjIsOSArNjIyLDkgQEAgc3RhdGljIGludCBpOTE1X3N3
aXp6bGVfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCiAJCXNlcV9wcmludGYo
bSwgIkREQzIgPSAweCUwOHhcbiIsCiAJCQkgICBpbnRlbF91bmNvcmVfcmVhZCh1bmNvcmUsIERD
QzIpKTsKIAkJc2VxX3ByaW50ZihtLCAiQzBEUkIzID0gMHglMDR4XG4iLAotCQkJICAgaW50ZWxf
dW5jb3JlX3JlYWQxNih1bmNvcmUsIEMwRFJCMykpOworCQkJICAgaW50ZWxfdW5jb3JlX3JlYWQx
Nih1bmNvcmUsIEMwRFJCM19CVykpOwogCQlzZXFfcHJpbnRmKG0sICJDMURSQjMgPSAweCUwNHhc
biIsCi0JCQkgICBpbnRlbF91bmNvcmVfcmVhZDE2KHVuY29yZSwgQzFEUkIzKSk7CisJCQkgICBp
bnRlbF91bmNvcmVfcmVhZDE2KHVuY29yZSwgQzFEUkIzX0JXKSk7CiAJfSBlbHNlIGlmIChJTlRF
TF9HRU4oZGV2X3ByaXYpID49IDYpIHsKIAkJc2VxX3ByaW50ZihtLCAiTUFEX0RJTU1fQzAgPSAw
eCUwOHhcbiIsCiAJCQkgICBpbnRlbF91bmNvcmVfcmVhZCh1bmNvcmUsIE1BRF9ESU1NX0MwKSk7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9yZWcuaAppbmRleCA2NmE5MDJiM2JiOGUuLjA1ODdiMjQ1NWVhMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCkBAIC0zNzg3LDggKzM3ODcsOCBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgaTkxNV9tbWlvX3JlZ192YWxpZChpOTE1X3JlZ190IHJlZykKICNkZWZpbmUgQ1NI
UkREUjNDVExfRERSMyAgICAgICAoMSA8PCAyKQogCiAvKiA5NjUgTUNIIHJlZ2lzdGVyIGNvbnRy
b2xsaW5nIERSQU0gY2hhbm5lbCBjb25maWd1cmF0aW9uICovCi0jZGVmaW5lIEMwRFJCMwkJCV9N
TUlPKE1DSEJBUl9NSVJST1JfQkFTRSArIDB4MjA2KQotI2RlZmluZSBDMURSQjMJCQlfTU1JTyhN
Q0hCQVJfTUlSUk9SX0JBU0UgKyAweDYwNikKKyNkZWZpbmUgQzBEUkIzX0JXCQlfTU1JTyhNQ0hC
QVJfTUlSUk9SX0JBU0UgKyAweDIwNikKKyNkZWZpbmUgQzFEUkIzX0JXCQlfTU1JTyhNQ0hCQVJf
TUlSUk9SX0JBU0UgKyAweDYwNikKIAogLyogc25iIE1DSCByZWdpc3RlcnMgZm9yIHJlYWRpbmcg
dGhlIERSQU0gY2hhbm5lbCBjb25maWd1cmF0aW9uICovCiAjZGVmaW5lIE1BRF9ESU1NX0MwCQkJ
X01NSU8oTUNIQkFSX01JUlJPUl9CQVNFX1NOQiArIDB4NTAwNCkKLS0gCjIuMjYuMwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
