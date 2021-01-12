Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F13B2F2A3D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C176E140;
	Tue, 12 Jan 2021 08:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035B16E140
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:44:21 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id a6so1141805wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0GoysSBGT3HYQFBzaOo3TJT+VMitd1GzIQch5bE61pQ=;
 b=Xv/gd7c41kME0e6d0b2o4u5hscG+DiTOG5su17GJnG8nH8Db6jox6lNxx/9mxMNwBd
 8X8cqDBKjWer8eC5P1Bgqtz3iAFlS5n+0MlZrtmMBjz2p/Lk2iao7LVgrS4sep+Q5b1S
 iga6kD9055usoENwT54k6jn6mkQEnfMcY8Sdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0GoysSBGT3HYQFBzaOo3TJT+VMitd1GzIQch5bE61pQ=;
 b=FUyf5JJInUxE3paLtMGECiEg5Tg0KdQc+UAiBc/voFpPJyadYN78p05leCYPfNLvKf
 Bxw3MuqQNK7rtSb/JPe9qCByimT/+n31fZDTSL9+LrTdJpf2/MY5Ctk6cb492aZGTt/t
 cdafNVHfwqRkFHBxOPSmUD7g8LS0VRlu9WJwIa4+omn5WsN0eh+tGtEXasYd//vUfQfo
 Hbm9JIFLXnM5VKsKg0sl6youz96+i2g4rJ/108c+aesS+ejEpTGhHrrmN/er0hVvEki5
 OCr1hraQgP0OsElwnMX6IjUHi+XoWpaHULlEHWs2bm3j/YAUyWSgKXD4JvkOpZpVssjC
 Yj/w==
X-Gm-Message-State: AOAM530uiOrDHs75Wd1tFR6Lo4YkTw+vLa8GsoiPnre20XZl9lhgNdz+
 AjwyMNnZdD4qLJkFpWfxADKlY0i02iHDfROX
X-Google-Smtp-Source: ABdhPJyzH+ofat+gg6GRUSiedEnG52O4cY/pMFYkz/7aUMaWTrvcXrh0fCaC2epWllVmkOvmmpbkmQ==
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr2486735wmg.189.1610441059368; 
 Tue, 12 Jan 2021 00:44:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3707017wrr.85.2021.01.12.00.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:44:18 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/15] drm/arc: Inline remaining files
Date: Tue, 12 Jan 2021 09:43:56 +0100
Message-Id: <20210112084358.2771527-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At less than 500 lines total feels like the right thing to do.

Also noticed that the simple wrapper around drm_connector_cleanup can
be dropped.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/arc/Makefile      |   2 +-
 drivers/gpu/drm/arc/arcpgu.h      |  39 ------------
 drivers/gpu/drm/arc/arcpgu_drv.c  | 102 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/arc/arcpgu_regs.h |  31 ---------
 drivers/gpu/drm/arc/arcpgu_sim.c  |  74 ----------------------
 5 files changed, 101 insertions(+), 147 deletions(-)
 delete mode 100644 drivers/gpu/drm/arc/arcpgu.h
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_regs.h
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_sim.c

diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
index 379a1145bc2f..b26f2495c532 100644
--- a/drivers/gpu/drm/arc/Makefile
+++ b/drivers/gpu/drm/arc/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-arcpgu-y := arcpgu_sim.o arcpgu_drv.o
+arcpgu-y := arcpgu_drv.o
 obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
deleted file mode 100644
index 7dce0c2313ba..000000000000
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * ARC PGU DRM driver.
- *
- * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
- */
-
-#ifndef _ARCPGU_H_
-#define _ARCPGU_H_
-
-#include <drm/drm_simple_kms_helper.h>
-
-struct arcpgu_drm_private {
-	struct drm_device	drm;
-	void __iomem		*regs;
-	struct clk		*clk;
-	struct drm_simple_display_pipe pipe;
-	struct drm_connector	sim_conn;
-};
-
-#define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
-
-#define pipe_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, pipe)
-
-static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
-				 unsigned int reg, u32 value)
-{
-	iowrite32(value, arcpgu->regs + reg);
-}
-
-static inline u32 arc_pgu_read(struct arcpgu_drm_private *arcpgu,
-			       unsigned int reg)
-{
-	return ioread32(arcpgu->regs + reg);
-}
-
-int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np);
-
-#endif
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index 0e959e42893d..0a0b54993773 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -17,13 +17,111 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 
-#include "arcpgu.h"
-#include "arcpgu_regs.h"
+#define ARCPGU_REG_CTRL		0x00
+#define ARCPGU_REG_STAT		0x04
+#define ARCPGU_REG_FMT		0x10
+#define ARCPGU_REG_HSYNC	0x14
+#define ARCPGU_REG_VSYNC	0x18
+#define ARCPGU_REG_ACTIVE	0x1c
+#define ARCPGU_REG_BUF0_ADDR	0x40
+#define ARCPGU_REG_STRIDE	0x50
+#define ARCPGU_REG_START_SET	0x84
+
+#define ARCPGU_REG_ID		0x3FC
+
+#define ARCPGU_CTRL_ENABLE_MASK	0x02
+#define ARCPGU_CTRL_VS_POL_MASK	0x1
+#define ARCPGU_CTRL_VS_POL_OFST	0x3
+#define ARCPGU_CTRL_HS_POL_MASK	0x1
+#define ARCPGU_CTRL_HS_POL_OFST	0x4
+#define ARCPGU_MODE_XRGB8888	BIT(2)
+#define ARCPGU_STAT_BUSY_MASK	0x02
+
+struct arcpgu_drm_private {
+	struct drm_device	drm;
+	void __iomem		*regs;
+	struct clk		*clk;
+	struct drm_simple_display_pipe pipe;
+	struct drm_connector	sim_conn;
+};
+
+#define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
+
+#define pipe_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, pipe)
+
+static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
+				 unsigned int reg, u32 value)
+{
+	iowrite32(value, arcpgu->regs + reg);
+}
+
+static inline u32 arc_pgu_read(struct arcpgu_drm_private *arcpgu,
+			       unsigned int reg)
+{
+	return ioread32(arcpgu->regs + reg);
+}
+
+#define XRES_DEF	640
+#define YRES_DEF	480
+
+#define XRES_MAX	8192
+#define YRES_MAX	8192
+
+static int arcpgu_drm_connector_get_modes(struct drm_connector *connector)
+{
+	int count;
+
+	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
+	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
+	return count;
+}
+
+static const struct drm_connector_helper_funcs
+arcpgu_drm_connector_helper_funcs = {
+	.get_modes = arcpgu_drm_connector_get_modes,
+};
+
+static const struct drm_connector_funcs arcpgu_drm_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
+{
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
+	int ret;
+
+	encoder = &arcpgu->pipe.encoder;
+
+	connector = &arcpgu->sim_conn;
+	drm_connector_helper_add(connector, &arcpgu_drm_connector_helper_funcs);
+
+	ret = drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
+			DRM_MODE_CONNECTOR_VIRTUAL);
+	if (ret < 0) {
+		dev_err(drm->dev, "failed to initialize drm connector\n");
+		return ret;
+	}
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret < 0) {
+		dev_err(drm->dev, "could not attach connector to encoder\n");
+		return ret;
+	}
+
+	return 0;
+}
 
 #define ENCODE_PGU_XY(x, y)	((((x) - 1) << 16) | ((y) - 1))
 
diff --git a/drivers/gpu/drm/arc/arcpgu_regs.h b/drivers/gpu/drm/arc/arcpgu_regs.h
deleted file mode 100644
index b689a382d556..000000000000
--- a/drivers/gpu/drm/arc/arcpgu_regs.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * ARC PGU DRM driver.
- *
- * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
- */
-
-#ifndef _ARC_PGU_REGS_H_
-#define _ARC_PGU_REGS_H_
-
-#define ARCPGU_REG_CTRL		0x00
-#define ARCPGU_REG_STAT		0x04
-#define ARCPGU_REG_FMT		0x10
-#define ARCPGU_REG_HSYNC	0x14
-#define ARCPGU_REG_VSYNC	0x18
-#define ARCPGU_REG_ACTIVE	0x1c
-#define ARCPGU_REG_BUF0_ADDR	0x40
-#define ARCPGU_REG_STRIDE	0x50
-#define ARCPGU_REG_START_SET	0x84
-
-#define ARCPGU_REG_ID		0x3FC
-
-#define ARCPGU_CTRL_ENABLE_MASK	0x02
-#define ARCPGU_CTRL_VS_POL_MASK	0x1
-#define ARCPGU_CTRL_VS_POL_OFST	0x3
-#define ARCPGU_CTRL_HS_POL_MASK	0x1
-#define ARCPGU_CTRL_HS_POL_OFST	0x4
-#define ARCPGU_MODE_XRGB8888	BIT(2)
-#define ARCPGU_STAT_BUSY_MASK	0x02
-
-#endif
diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
deleted file mode 100644
index 1a63f0868504..000000000000
--- a/drivers/gpu/drm/arc/arcpgu_sim.c
+++ /dev/null
@@ -1,74 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * ARC PGU DRM driver.
- *
- * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
- */
-
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_device.h>
-#include <drm/drm_probe_helper.h>
-
-#include "arcpgu.h"
-
-#define XRES_DEF	640
-#define YRES_DEF	480
-
-#define XRES_MAX	8192
-#define YRES_MAX	8192
-
-
-static int arcpgu_drm_connector_get_modes(struct drm_connector *connector)
-{
-	int count;
-
-	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
-	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
-	return count;
-}
-
-static void arcpgu_drm_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
-static const struct drm_connector_helper_funcs
-arcpgu_drm_connector_helper_funcs = {
-	.get_modes = arcpgu_drm_connector_get_modes,
-};
-
-static const struct drm_connector_funcs arcpgu_drm_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = arcpgu_drm_connector_destroy,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
-{
-	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
-	int ret;
-
-	encoder = &arcpgu->pipe.encoder;
-
-	connector = &arcpgu->sim_conn;
-	drm_connector_helper_add(connector, &arcpgu_drm_connector_helper_funcs);
-
-	ret = drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
-			DRM_MODE_CONNECTOR_VIRTUAL);
-	if (ret < 0) {
-		dev_err(drm->dev, "failed to initialize drm connector\n");
-		return ret;
-	}
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret < 0) {
-		dev_err(drm->dev, "could not attach connector to encoder\n");
-		return ret;
-	}
-
-	return 0;
-}
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
