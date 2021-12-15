Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8A54760E9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 19:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BDF10F57C;
	Wed, 15 Dec 2021 18:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569A210F5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 18:42:06 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id A88C329F92B;
 Wed, 15 Dec 2021 18:42:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1639593725; bh=X/V4++eTj4V+zP/r5cbZN0DG01piND4QiluL0kbnnjM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IU168wHVGDjQ5yv7dVUu2I2+vxYsrKrcrYOUh7TZawstKSpJv53JaHVvlx1E01ztT
 7hrMCYwKqaK9CegAOydBThjV5su5H3cryihwUtt7clZrPeXbeF6vrfMEvfwNfwNvrm
 GOn5ALFxV7iTh9CV+q6OZX0UYL/w5uvuPodFMyPzpJcnXds4zAXXsmNSI8CIGeSFkR
 +cnS6+kALzsmJcKbc3hgJ6KoE+iVcl8e6gPwxzZVl4pKxxPPR+XFW58YZEbTClsJ1c
 q0crhFdOaNdRxQtXSe3DHjhps4346RuHXEoW7o7OqAx01ERG//H8bXgkDhNp3pweZu
 6p11uL0TvqvOQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/vmwgfx: Remove unused compile options
Date: Wed, 15 Dec 2021 13:41:47 -0500
Message-Id: <20211215184147.3688785-3-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211215184147.3688785-1-zack@kde.org>
References: <20211215184147.3688785-1-zack@kde.org>
MIME-Version: 1.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Before the driver had screen targets support we had to disable explicit
bringup of its infrastructure because it was breaking screen objects
support.
Since the implementation of screen targets landed there hasn't been a
reason to explicitly disable it and the options were never used.
Remove of all that unused code.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: d80efd5cb3de ("drm/vmwgfx: Initial DX support")
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  |  3 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c  | 12 +++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  4 ++--
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index e2baca9a55f8..d6b66636a19b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -59,11 +59,8 @@
 #define VMWGFX_DRIVER_MINOR 20
 #define VMWGFX_DRIVER_PATCHLEVEL 0
 #define VMWGFX_FIFO_STATIC_SIZE (1024*1024)
-#define VMWGFX_MAX_RELOCATIONS 2048
-#define VMWGFX_MAX_VALIDATIONS 2048
 #define VMWGFX_MAX_DISPLAYS 16
 #define VMWGFX_CMD_BOUNCE_INIT_SIZE 32768
-#define VMWGFX_ENABLE_SCREEN_TARGET_OTABLE 1
 
 #define VMWGFX_PCI_ID_SVGA2              0x0405
 #define VMWGFX_PCI_ID_SVGA3              0x0406
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
index 2d91a44a3b22..0a8cc28d6606 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2012-2015 VMware, Inc., Palo Alto, CA., USA
+ * Copyright 2012-2021 VMware, Inc., Palo Alto, CA., USA
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -29,12 +29,6 @@
 
 #include "vmwgfx_drv.h"
 
-/*
- * If we set up the screen target otable, screen objects stop working.
- */
-
-#define VMW_OTABLE_SETUP_SUB ((VMWGFX_ENABLE_SCREEN_TARGET_OTABLE ? 0 : 1))
-
 #ifdef CONFIG_64BIT
 #define VMW_PPN_SIZE 8
 #define VMW_MOBFMT_PTDEPTH_0 SVGA3D_MOBFMT_PT64_0
@@ -75,7 +69,7 @@ static const struct vmw_otable pre_dx_tables[] = {
 	{VMWGFX_NUM_GB_CONTEXT * sizeof(SVGAOTableContextEntry), NULL, true},
 	{VMWGFX_NUM_GB_SHADER * sizeof(SVGAOTableShaderEntry), NULL, true},
 	{VMWGFX_NUM_GB_SCREEN_TARGET * sizeof(SVGAOTableScreenTargetEntry),
-	 NULL, VMWGFX_ENABLE_SCREEN_TARGET_OTABLE}
+	 NULL, true}
 };
 
 static const struct vmw_otable dx_tables[] = {
@@ -84,7 +78,7 @@ static const struct vmw_otable dx_tables[] = {
 	{VMWGFX_NUM_GB_CONTEXT * sizeof(SVGAOTableContextEntry), NULL, true},
 	{VMWGFX_NUM_GB_SHADER * sizeof(SVGAOTableShaderEntry), NULL, true},
 	{VMWGFX_NUM_GB_SCREEN_TARGET * sizeof(SVGAOTableScreenTargetEntry),
-	 NULL, VMWGFX_ENABLE_SCREEN_TARGET_OTABLE},
+	 NULL, true},
 	{VMWGFX_NUM_DXCONTEXT * sizeof(SVGAOTableDXContextEntry), NULL, true},
 };
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index a66cc4b841c0..4bf766017e7a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1872,8 +1872,8 @@ int vmw_kms_stdu_init_display(struct vmw_private *dev_priv)
 	int i, ret;
 
 
-	/* Do nothing if Screen Target support is turned off */
-	if (!VMWGFX_ENABLE_SCREEN_TARGET_OTABLE || !dev_priv->has_mob)
+	/* Do nothing if there's no support for MOBs */
+	if (!dev_priv->has_mob)
 		return -ENOSYS;
 
 	if (!(dev_priv->capabilities & SVGA_CAP_GBOBJECTS))
-- 
2.32.0

