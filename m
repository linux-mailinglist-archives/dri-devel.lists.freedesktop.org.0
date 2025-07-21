Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12D6B0C803
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193E589C86;
	Mon, 21 Jul 2025 15:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="VlqOWZSi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1239 seconds by postgrey-1.36 at gabe;
 Mon, 21 Jul 2025 15:49:23 UTC
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F0689C86
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
 :From:subject:date:message-id:reply-to;
 bh=Ey3xOTKqI0BLXWienDIPPsKiuMwbEHrDRNd0N6CIGRs=; b=VlqOWZSi26qY3yJ0sB/48LmVEy
 RJmLIbHbXngyMD3xkYHPnOm7TwIWkPTwGyO7sbpLthc+8MqMMrJUMK1JJeq2E1w4ovuUB/BUkgFTZ
 ncyv3GNSy6Sc3VFFkJd70UplaYxkkFLdK2VFvQM85X5J0lNoKrwe9LWiIQAvP9/rT/N4=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:45616
 helo=localhost.localdomain)
 by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1udsRI-0001Ys-SG; Mon, 21 Jul 2025 11:28:29 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: hugo@hugovil.com, Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 21 Jul 2025 11:28:15 -0400
Message-Id: <20250721152818.1891212-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.2
Subject: [PATCH] drm/panel: sitronix-st7703: fix typo in comments
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Fix typo in comments:
    souch -> such.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 1a007a244d84..6c348fe28955 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Driver for panels based on Sitronix ST7703 controller, souch as:
+ * Driver for panels based on Sitronix ST7703 controller, such as:
  *
  * - Rocktech jh057n00900 5.5" MIPI-DSI panel
  *

base-commit: ba0f4c4c0f9d0f90300578fc8d081f43be281a71
-- 
2.39.5

