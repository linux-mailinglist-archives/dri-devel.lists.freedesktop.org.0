Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75327222A1B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 19:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B0F6E2F8;
	Thu, 16 Jul 2020 17:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4076E2F8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 17:41:50 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jw7tA-00065m-Ju; Thu, 16 Jul 2020 19:41:44 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jw7t8-0000UW-32; Thu, 16 Jul 2020 19:41:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/mxsfb: drop unused function parameter
Date: Thu, 16 Jul 2020 19:41:39 +0200
Message-Id: <20200716174139.16602-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZmxhZ3MgaXMgdW51c2VkIHNpbmNlIHRoZSBkcml2ZXIgd2FzIGludHJvZHVjZWQgaW4gY29tbWl0
IDQ1ZDU5ZDcwNDA4MAooImRybTogQWRkIG5ldyBkcml2ZXIgZm9yIE1YU0ZCIGNvbnRyb2xsZXIi
KS4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIHwgNCAr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9teHNmYi9teHNmYl9kcnYuYwppbmRleCA0OTdjZjQ0M2E5YWYuLmZiOTcyZGQ0ZjY0MiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYwpAQCAtMTkxLDcgKzE5MSw3IEBAIHN0YXRpYyBz
dHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVuY3MgbXhzZmJfZnVuY3MgPSB7CiAJLmRp
c2FibGVfdmJsYW5rCT0gbXhzZmJfcGlwZV9kaXNhYmxlX3ZibGFuaywKIH07CiAKLXN0YXRpYyBp
bnQgbXhzZmJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB1bnNpZ25lZCBsb25nIGZsYWdz
KQorc3RhdGljIGludCBteHNmYl9sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCiB7CiAJc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkcm0tPmRldik7
CiAJc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpteHNmYjsKQEAgLTQwNyw3ICs0MDcsNyBAQCBz
dGF0aWMgaW50IG14c2ZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYg
KElTX0VSUihkcm0pKQogCQlyZXR1cm4gUFRSX0VSUihkcm0pOwogCi0JcmV0ID0gbXhzZmJfbG9h
ZChkcm0sIDApOworCXJldCA9IG14c2ZiX2xvYWQoZHJtKTsKIAlpZiAocmV0KQogCQlnb3RvIGVy
cl9mcmVlOwogCi0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
