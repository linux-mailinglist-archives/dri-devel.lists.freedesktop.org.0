Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5327593FD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 13:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DDA10E09C;
	Wed, 19 Jul 2023 11:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC35210E09C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 11:11:52 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id BEB97D8475
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:59:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1299D60007;
 Wed, 19 Jul 2023 10:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689764346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=INBu3P3S1gZdEhtPxSWbNhdhaThn/dov55l5MihIIxc=;
 b=me1+yVQy2h5JS8f9pszwSrbXJrRxg1rUArG7+6vJ5euBuQMTh3l0c1xoPNGtUdqkKIebSN
 SUVo1pA0k1vhhxZa+dqQuTU3DjkgcbaaM/QrWxwJg8Od4ZP7NSP3CJkbnY4x13Pmh+Urcp
 zMfjsdUYEAkbrxk1gxEILiglpcK1cy+K4yrDNvLwU2JNuTDQjTPSmsGzPRpP353aiOJT1t
 73dn1pdVy7NOab2thbwZMed3r1JvHLro3OZx5s52yxdeGdqpAhp6OTv/ehTvXT+5B5FQps
 rOdUKwkx2Fz5Qj6ACS6PCO/MgzjtXY3S9jY/RG5kSeFT8NNz07/srx1sLf+m0Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel: db7430: remove unused variables
Date: Wed, 19 Jul 2023 12:58:29 +0200
Message-Id: <20230719105829.148011-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These variables are never referenced in the code.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/panel/panel-samsung-db7430.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-db7430.c b/drivers/gpu/drm/panel/panel-samsung-db7430.c
index 117b26845083..14c6700e37b3 100644
--- a/drivers/gpu/drm/panel/panel-samsung-db7430.c
+++ b/drivers/gpu/drm/panel/panel-samsung-db7430.c
@@ -56,10 +56,6 @@ struct db7430 {
 	struct mipi_dbi dbi;
 	/** @panel: the DRM panel instance for this device */
 	struct drm_panel panel;
-	/** @width: the width of this panel in mm */
-	u32 width;
-	/** @height: the height of this panel in mm */
-	u32 height;
 	/** @reset: reset GPIO line */
 	struct gpio_desc *reset;
 	/** @regulators: VCCIO and VIO supply regulators */
-- 
2.34.1

