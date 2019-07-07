Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A446160D
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD6089C09;
	Sun,  7 Jul 2019 18:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DEE89C09
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:40:06 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3015BCC;
 Sun,  7 Jul 2019 20:39:47 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 55/60] drm/omap: sdi: Sort includes alphabetically
Date: Sun,  7 Jul 2019 21:19:32 +0300
Message-Id: <20190707181937.6250-52-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562524804;
 bh=hyYX+GJPHFTWtMNHae68fIvJxMJ8/FLowqW2krA1ihs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H0F6Kx8ayPcHiyEoqd+95w8+pSJyi2FboJzagW90oil2bDbJdF2H+a17kWpzQaNuW
 KBEgUBW1uvyjzaCZCw5vTiocNaqurrV0S9mEIE3S8uMn8cAVf3zghF4WpC1DwUHbAG
 dr4foaU/FExBXuzwJqEwTOiao8tGsSjDMxJva5pI=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtYWtlcyBpdCBlYXNpZXIgdG8gcXVpY2tseSBsb2NhdGUgZHVwbGljYXRlIGluY2x1ZGVz
LgoKU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9zZGkuYyB8IDgg
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL3NkaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL3NkaS5jCmluZGV4IDJjNWVhYWM5MTkzZi4uOTJjMmNkMmMw
ODg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvc2RpLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL3NkaS5jCkBAIC0xNywxNyArMTcsMTcgQEAKIAog
I2RlZmluZSBEU1NfU1VCU1lTX05BTUUgIlNESSIKIAotI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5o
PgogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+Ci0jaW5j
bHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvZXhwb3J0
Lmg+CisjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CisjaW5jbHVkZSA8bGludXgvb2YuaD4KICNp
bmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0
b3IvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9zdHJpbmcuaD4KLSNpbmNsdWRlIDxsaW51
eC9vZi5oPgogCi0jaW5jbHVkZSAib21hcGRzcy5oIgogI2luY2x1ZGUgImRzcy5oIgorI2luY2x1
ZGUgIm9tYXBkc3MuaCIKIAogc3RydWN0IHNkaV9kZXZpY2UgewogCXN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXY7Ci0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
