Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E86C8E6DB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752C16E926;
	Thu, 15 Aug 2019 08:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FC86E5CC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:57:04 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 233B31A039C;
 Wed, 14 Aug 2019 12:49:07 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 173F01A039B;
 Wed, 14 Aug 2019 12:49:07 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 163AA2060E;
 Wed, 14 Aug 2019 12:49:06 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 10/15] drm/mxsfb: Add max-res property for MXSFB
Date: Wed, 14 Aug 2019 13:48:46 +0300
Message-Id: <1565779731-1300-11-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVjYXVzZSBvZiBzdGFiaWxpdHkgaXNzdWVzLCB3ZSBtYXkgd2FudCB0byBsaW1pdCB0aGUgbWF4
aW11bSByZXNvbHV0aW9uCnN1cHBvcnRlZCBieSB0aGUgTVhTRkIgKGVMQ0RJRikgZHJpdmVyLgpU
aGlzIHBhdGNoIGFkZCBzdXBwb3J0IGZvciBhIG5ldyBwcm9wZXJ0eSB3aGljaCB3ZSBjYW4gdXNl
IHRvIGltcG9zZSBzdWNoCmxpbWl0YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFz
IDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2Zi
X2Rydi5jIHwgMTIgKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhz
ZmJfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKaW5kZXggNTljOGJh
Ny4uNmRhZTJiZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYwpAQCAtMjY0LDYgKzI2NCw3
IEBAIHN0YXRpYyBpbnQgbXhzZmJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB1bnNpZ25l
ZCBsb25nIGZsYWdzKQogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9y
bV9kZXZpY2UoZHJtLT5kZXYpOwogCXN0cnVjdCBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmI7CiAJ
c3RydWN0IHJlc291cmNlICpyZXM7CisJdTMyIG1heF9yZXNbMl0gPSB7MCwgMH07CiAJaW50IHJl
dDsKIAogCW14c2ZiID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqbXhzZmIpLCBH
RlBfS0VSTkVMKTsKQEAgLTM0NCwxMCArMzQ1LDE3IEBAIHN0YXRpYyBpbnQgbXhzZmJfbG9hZChz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB1bnNpZ25lZCBsb25nIGZsYWdzKQogCQl9CiAJfQogCisJ
b2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkoZHJtLT5kZXYtPm9mX25vZGUsICJtYXgtcmVzIiwK
KwkJCQkgICAmbWF4X3Jlc1swXSwgMik7CisJaWYgKCFtYXhfcmVzWzBdKQorCQltYXhfcmVzWzBd
ID0gTVhTRkJfTUFYX1hSRVM7CisJaWYgKCFtYXhfcmVzWzFdKQorCQltYXhfcmVzWzFdID0gTVhT
RkJfTUFYX1lSRVM7CisKIAlkcm0tPm1vZGVfY29uZmlnLm1pbl93aWR0aAk9IE1YU0ZCX01JTl9Y
UkVTOwogCWRybS0+bW9kZV9jb25maWcubWluX2hlaWdodAk9IE1YU0ZCX01JTl9ZUkVTOwotCWRy
bS0+bW9kZV9jb25maWcubWF4X3dpZHRoCT0gTVhTRkJfTUFYX1hSRVM7Ci0JZHJtLT5tb2RlX2Nv
bmZpZy5tYXhfaGVpZ2h0CT0gTVhTRkJfTUFYX1lSRVM7CisJZHJtLT5tb2RlX2NvbmZpZy5tYXhf
d2lkdGgJPSBtYXhfcmVzWzBdOworCWRybS0+bW9kZV9jb25maWcubWF4X2hlaWdodAk9IG1heF9y
ZXNbMV07CiAJZHJtLT5tb2RlX2NvbmZpZy5mdW5jcwkJPSAmbXhzZmJfbW9kZV9jb25maWdfZnVu
Y3M7CiAJZHJtLT5tb2RlX2NvbmZpZy5oZWxwZXJfcHJpdmF0ZQk9ICZteHNmYl9tb2RlX2NvbmZp
Z19oZWxwZXJzOwogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
