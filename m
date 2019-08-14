Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F618E682
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31246E8DF;
	Thu, 15 Aug 2019 08:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840AC6E483
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 09:24:01 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by andre.telenet-ops.be with bizsmtp
 id oxPy2000U05gfCL01xPy41; Wed, 14 Aug 2019 11:23:59 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hxpVe-0003TP-Ds; Wed, 14 Aug 2019 11:23:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hxpVe-0003TJ-C9; Wed, 14 Aug 2019 11:23:58 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: ti-tfp410: Update drm_connector_init_with_ddc()
 error message
Date: Wed, 14 Aug 2019 11:23:57 +0200
Message-Id: <20190814092357.13198-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvZGUgd2FzIGNoYW5nZWQgdG8gY2FsbCBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMo
KSBpbnN0ZWFkIG9mCmRybV9jb25uZWN0b3JfaW5pdCgpLCBidXQgdGhlIGNvcnJlc3BvbmRpbmcg
ZXJyb3IgbWVzc2FnZSB3YXMgbm90CnVwZGF0ZWQuCgpGaXhlczogY2ZiNDQ0NTUyOTI2OTg5ZiAo
ImRybS9icmlkZ2U6IHRpLXRmcDQxMDogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3Ig
c3lzZnMgZGlyZWN0b3J5IikKU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQx
MC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwppbmRleCA2MWNjMjM1NGVmMWJmZTdlLi5i
ZTZjOTljYWM0MTk1M2U5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRm
cDQxMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKQEAgLTEzOSw3
ICsxMzksOCBAQCBzdGF0aWMgaW50IHRmcDQxMF9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSkKIAkJCQkJICBkdmktPmNvbm5lY3Rvcl90eXBlLAogCQkJCQkgIGR2aS0+ZGRjKTsKIAlp
ZiAocmV0KSB7Ci0JCWRldl9lcnIoZHZpLT5kZXYsICJkcm1fY29ubmVjdG9yX2luaXQoKSBmYWls
ZWQ6ICVkXG4iLCByZXQpOworCQlkZXZfZXJyKGR2aS0+ZGV2LCAiZHJtX2Nvbm5lY3Rvcl9pbml0
X3dpdGhfZGRjKCkgZmFpbGVkOiAlZFxuIiwKKwkJCXJldCk7CiAJCXJldHVybiByZXQ7CiAJfQog
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
