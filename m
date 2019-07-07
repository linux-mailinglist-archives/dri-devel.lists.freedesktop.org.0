Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E162A61609
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83EE89BFC;
	Sun,  7 Jul 2019 18:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D4D89BFC
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:38:43 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 825E5CC;
 Sun,  7 Jul 2019 20:38:23 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 51/60] drm/omap: dpi: Sort includes alphabetically
Date: Sun,  7 Jul 2019 21:19:28 +0300
Message-Id: <20190707181937.6250-48-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562524722;
 bh=FGeXOqi2tEyeiGkgxpT3/gp1m8rI+KIaJYTxNuWCzZo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dmiQeHvlHPht1a4+K9vSSpdzM9OFwiCRB0rFIZq0QxnsOFcqFicgFZi39L3QJsGWI
 tW3Nhf+ODFRcv7eNKYJYT/iGbZBBI0+ukSyPvlMfTvrh8nmkRv8OIsD+wWJcJFjpmy
 WF6WNytaJfB2vPRT4rICiGhIsLCtpNfeli1vFM2A=
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
c29uYm9hcmQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kcGkuYyB8IDEw
ICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RwaS5jIGIvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RwaS5jCmluZGV4IGUxZjk0YTg0YzliZC4uZGE3ZDUw
Y2RlMzFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHBpLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RwaS5jCkBAIC0yMCwyMCArMjAsMjAgQEAK
IAogI2RlZmluZSBEU1NfU1VCU1lTX05BTUUgIkRQSSIKIAotI2luY2x1ZGUgPGxpbnV4L2tlcm5l
bC5oPgorI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Ci0j
aW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CiAjaW5jbHVk
ZSA8bGludXgvZXJybm8uaD4KKyNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KKyNpbmNsdWRlIDxs
aW51eC9rZXJuZWwuaD4KKyNpbmNsdWRlIDxsaW51eC9vZi5oPgogI2luY2x1ZGUgPGxpbnV4L3Bs
YXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgog
I2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgotI2luY2x1ZGUgPGxpbnV4L29mLmg+Ci0jaW5jbHVk
ZSA8bGludXgvY2xrLmg+CiAjaW5jbHVkZSA8bGludXgvc3lzX3NvYy5oPgogCi0jaW5jbHVkZSAi
b21hcGRzcy5oIgogI2luY2x1ZGUgImRzcy5oIgorI2luY2x1ZGUgIm9tYXBkc3MuaCIKIAogc3Ry
dWN0IGRwaV9kYXRhIHsKIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2OwotLSAKUmVnYXJk
cywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
