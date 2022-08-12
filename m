Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D155591687
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 23:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA9712BE71;
	Fri, 12 Aug 2022 20:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDE210F0E8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 20:58:34 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4M4GHG0kgyzDrVy;
 Fri, 12 Aug 2022 20:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1660337914; bh=+5D7uHE/auwFvlOw3q1l74r90MUsvTeHdD2XmuMoZAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sEx6338JJrL2aTWU6Djp837PM+GosfWj+fPpEIDv98j6DpdFIhOno7czJXNtaTBVn
 euxSREXqOhalFJT9oE2CT/hebLtdn7NBHFNUn+3gKyMn5EXFXZbVvUnlbU18PZyA4i
 XXYMmCSMwZDR5EcySQaGq0RuH+R7Bg51T7XKkki0=
X-Riseup-User-ID: 3E3F3A4663E39F6CE14249ECF034F0D0F5DCA7766374AF9685B88D20D0D69A1E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4M4GHB6TWCz5vTk;
 Fri, 12 Aug 2022 20:58:30 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/5] drm/mediatek: Drop of_gpio header
Date: Fri, 12 Aug 2022 17:57:43 -0300
Message-Id: <20220812205746.609107-3-mairacanal@riseup.net>
In-Reply-To: <20220812205746.609107-1-mairacanal@riseup.net>
References: <20220812205746.609107-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These drivers include the deprecated OF GPIO header <linux/of_gpio.h>
yet fail to use symbols from it, so drop the include.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c  | 1 -
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 630a4e301ef6..508a6d994e83 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -11,7 +11,6 @@
 #include <linux/media-bus-format.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 3196189429bc..4c80b6896dc3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -16,7 +16,6 @@
 #include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
-- 
2.37.1

