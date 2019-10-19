Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDCCDDBA7
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABB889D40;
	Sun, 20 Oct 2019 00:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from h1.fbrelay.privateemail.com (h1.fbrelay.privateemail.com
 [131.153.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB8089F97
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 07:30:22 +0000 (UTC)
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com
 [198.54.127.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id B826B809EE
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 03:18:49 -0400 (EDT)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id 1FE4E60049;
 Sat, 19 Oct 2019 03:18:47 -0400 (EDT)
Received: from wambui.zuku.co.ke (unknown [10.20.151.220])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id 8E05560040;
 Sat, 19 Oct 2019 07:18:43 +0000 (UTC)
From: Wambui Karuga <wambui@karuga.xyz>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: remove unnecessary return variable
Date: Sat, 19 Oct 2019 10:18:40 +0300
Message-Id: <20191019071840.16877-1-wambui@karuga.xyz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com, sean@poorly.run,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogV2FtYnVpIEthcnVnYSA8d2FtYnVpLmthcnVnYXhAZ21haWwuY29tPgoKUmVtb3ZlIHVu
bmVjZXNzYXJ5IHZhcmlhYmxlIGByZXRgIGluIGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Nsb3Rz
KCkKb25seSB1c2VkIHRvIGhvbGQgdGhlIGZ1bmN0aW9uIHJldHVybiB2YWx1ZSBhbmQgaGF2ZSB0
aGUgZnVuY3Rpb24KcmV0dXJuIHRoZSB2YWx1ZSBkaXJlY3RseS4KSXNzdWUgZm91bmQgYnkgY29j
Y2luZWxsZToKQEAKbG9jYWwgaWRleHByZXNzaW9uIHJldDsKZXhwcmVzc2lvbiBlOwpAQAoKLXJl
dCA9CityZXR1cm4KICAgICBlOwotcmV0dXJuIHJldDsKClNpZ25lZC1vZmYtYnk6IFdhbWJ1aSBL
YXJ1Z2EgPHdhbWJ1aS5rYXJ1Z2F4QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpp
bmRleCA5Y2NjYzVlNjMzMDkuLmI4NTRhNDIyYTUyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCkBAIC0zNTQwLDcgKzM1NDAsNyBAQCBpbnQgZHJtX2RwX2F0b21pY19maW5k
X3ZjcGlfc2xvdHMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogewogCXN0cnVjdCBk
cm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlICp0b3BvbG9neV9zdGF0ZTsKIAlzdHJ1Y3QgZHJtX2Rw
X3ZjcGlfYWxsb2NhdGlvbiAqcG9zLCAqdmNwaSA9IE5VTEw7Ci0JaW50IHByZXZfc2xvdHMsIHJl
cV9zbG90cywgcmV0OworCWludCBwcmV2X3Nsb3RzLCByZXFfc2xvdHM7CiAKIAl0b3BvbG9neV9z
dGF0ZSA9IGRybV9hdG9taWNfZ2V0X21zdF90b3BvbG9neV9zdGF0ZShzdGF0ZSwgbWdyKTsKIAlp
ZiAoSVNfRVJSKHRvcG9sb2d5X3N0YXRlKSkKQEAgLTM1ODcsOCArMzU4Nyw3IEBAIGludCBkcm1f
ZHBfYXRvbWljX2ZpbmRfdmNwaV9zbG90cyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUs
CiAJfQogCXZjcGktPnZjcGkgPSByZXFfc2xvdHM7CiAKLQlyZXQgPSByZXFfc2xvdHM7Ci0JcmV0
dXJuIHJldDsKKwlyZXR1cm4gcmVxX3Nsb3RzOwogfQogRVhQT1JUX1NZTUJPTChkcm1fZHBfYXRv
bWljX2ZpbmRfdmNwaV9zbG90cyk7CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
