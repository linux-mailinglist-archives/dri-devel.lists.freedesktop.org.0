Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0951A56CA30
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 16:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520E110F67F;
	Sat,  9 Jul 2022 14:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEE910F678
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 14:48:41 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CDEDB845CA;
 Sat,  9 Jul 2022 16:48:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657378119;
 bh=OLOPA1r8jMHgHpvhQWRIX0ItBqj7IZS0CFGe2FGJh2w=;
 h=From:To:Cc:Subject:Date:From;
 b=o1cCFu+6jSQnkGfPbQ67dSEkG7PYkmKb0uSetmp+OM5nEEHls+cBfVAEDYXlwOpOO
 Bql6M3GT8qHGOy+fiCa0MFfZBdhvdhoIk8UWL67rJBNycYKDjBDVgnJnwy6zP/r8Yt
 7g7tbGG7ZLgvlKcKtKcQ5S8m2DrNO+0H6X0UHDU8fpYGh4vAItol4HAsQeznEI6aml
 RSjwuTmKRobbXE1PzG/V/n+mC3KEqPqgm7mCSDZq95SgX2COZR4hf9SaFx6GVREzmB
 ppVMQ/ayiG/X20ATU3Tzin/Hj4Azui29i9w2c9ZUXSb0zhuxPLrgikAFZe6kgmdzQ6
 WRirDWVVWYyLg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/lcdif: Clean up headers
Date: Sat,  9 Jul 2022 16:48:23 +0200
Message-Id: <20220709144826.9278-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Martyn Welch <martyn.welch@collabora.com>, Liu Ying <victor.liu@nxp.com>,
 robert.foss@linaro.org, Liu Ying <victor.liu@oss.nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop unneeded headers, sort rest alphabetically, no functional change.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reported-by: Liu Ying <victor.liu@oss.nxp.com>
Tested-by: Martyn Welch <martyn.welch@collabora.com>
Fixes: 9db35bb349a0e ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>
Cc: Martyn Welch <martyn.welch@collabora.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
V2: Add RB from Liu
V3: Add TB from Martyn from V1
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 3 ---
 drivers/gpu/drm/mxsfb/lcdif_drv.h | 1 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index befad33dcb959..1370889c6d687 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -8,7 +8,6 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
-#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -16,10 +15,8 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mode_config.h>
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h b/drivers/gpu/drm/mxsfb/lcdif_drv.h
index cb916341e8454..6cdba6e20c02b 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
@@ -8,6 +8,7 @@
 #ifndef __LCDIF_DRV_H__
 #define __LCDIF_DRV_H__
 
+#include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_encoder.h>
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 1bec1279c8b56..d7363e2b2fad0 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -17,9 +17,9 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
-#include <drm/drm_framebuffer.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane.h>
-- 
2.35.1

