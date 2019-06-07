Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C69391F4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 18:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8310C89E1A;
	Fri,  7 Jun 2019 16:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1462289E1A;
 Fri,  7 Jun 2019 16:26:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 09:26:23 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 07 Jun 2019 09:26:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2019 19:26:21 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915: Throw away the BIOS fb if has the wrong
 depth/bpp
Date: Fri,  7 Jun 2019 19:26:11 +0300
Message-Id: <20190607162611.23514-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607162611.23514-1-ville.syrjala@linux.intel.com>
References: <20190607162611.23514-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
c3BlY3QgdGhlIHVzZXIncyBjaG9pY2Ugb2YgZGVwdGgvYnBwIGZvciB0aGUgZmJkZXYgZnJhbWVi
dWZmZXIKYW5kIHRocm93IG91dCB0aGUgZmIgd2UgaW5oZXJpdGVkIGZyb20gdGhlIEJJT1MgaWYg
aXQgZG9lc24ndAptYXRjaC4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxf
ZmJkZXYuYyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2ZiZGV2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9mYmRldi5jCmluZGV4IDBkM2E2ZmE2NzRlNi4uMWE5MzVk
Yzc0ZDIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9mYmRldi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2ZiZGV2LmMKQEAgLTE5OSw2ICsxOTksMTcg
QEAgc3RhdGljIGludCBpbnRlbGZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVy
LAogCQlkcm1fZnJhbWVidWZmZXJfcHV0KCZpbnRlbF9mYi0+YmFzZSk7CiAJCWludGVsX2ZiID0g
aWZiZGV2LT5mYiA9IE5VTEw7CiAJfQorCWlmIChpbnRlbF9mYiAmJgorCSAgICAoc2l6ZXMtPnN1
cmZhY2VfZGVwdGggIT0gaW50ZWxfZmItPmJhc2UuZm9ybWF0LT5kZXB0aCB8fAorCSAgICAgc2l6
ZXMtPnN1cmZhY2VfYnBwICE9IGludGVsX2ZiLT5iYXNlLmZvcm1hdC0+Y3BwWzBdICogOCkpIHsK
KwkJRFJNX0RFQlVHX0tNUygiQklPUyBmYiB1c2luZyB3cm9uZyBkZXB0aC9icHAgKCVkLyVkKSwg
d2UgcmVxdWlyZSAoJWQvJWQpLCIKKwkJCSAgICAgICIgcmVsZWFzaW5nIGl0XG4iLAorCQkJICAg
ICAgaW50ZWxfZmItPmJhc2UuZm9ybWF0LT5kZXB0aCwKKwkJCSAgICAgIGludGVsX2ZiLT5iYXNl
LmZvcm1hdC0+Y3BwWzBdICogOCwKKwkJCSAgICAgIHNpemVzLT5zdXJmYWNlX2RlcHRoLCBzaXpl
cy0+c3VyZmFjZV9icHApOworCQlkcm1fZnJhbWVidWZmZXJfcHV0KCZpbnRlbF9mYi0+YmFzZSk7
CisJCWludGVsX2ZiID0gaWZiZGV2LT5mYiA9IE5VTEw7CisJfQogCWlmICghaW50ZWxfZmIgfHwg
V0FSTl9PTighaW50ZWxfZmJfb2JqKCZpbnRlbF9mYi0+YmFzZSkpKSB7CiAJCURSTV9ERUJVR19L
TVMoIm5vIEJJT1MgZmIsIGFsbG9jYXRpbmcgYSBuZXcgb25lXG4iKTsKIAkJcmV0ID0gaW50ZWxm
Yl9hbGxvYyhoZWxwZXIsIHNpemVzKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
