Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B441B2237B2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A32D6ED7C;
	Fri, 17 Jul 2020 09:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544CD6ED6A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q5so10191173wru.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MPdKQmXR/4ZD7PaqTxpVccSIF/911K5feLgWyR6FutM=;
 b=DzX1OVt8U2NHXVZXUXwxusEte8d6X+mujC8uK/f1+xR4BDuCJL+dLLLgI57jJ0NLAw
 jvm74P01XvaTdfsiOcJzzwtDVDRgNCMaIFLCKVXTWkvXLR9Cm9dsDgglBrotFMt9L8jh
 vp2JL4WU4hMCbc8+VEGnAcGlkECM/qlTBEiv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MPdKQmXR/4ZD7PaqTxpVccSIF/911K5feLgWyR6FutM=;
 b=Iq+AaDhzFRYP0L/ZfYnOk+IEhHVp9DDtve33E8f2IGE9GcMZ2PsOkyP+XQJwI2DRca
 wnd+//Fv15bhJLZN+Eg3/mZEkd0J5s5fkrfJCV8QXcIIKyR2kqeplcKG5NmlmtHHeEkc
 tPnW4X1lkGD4872LquThMBCT0GNAR8T1INeFEYQUvTIG+Z4wuNAhl4AStQFJ61fadH4d
 pV/xsf+U6m29qay62r1A7usa9ECZVg1Z5Jg9mqFlcDrnQ+R5M85LIfl0oYihjbhR/YIs
 jT/y9mx/9V+hYoLjsgQiNzElCZBQfrRGNIpBKa9X/yun6zbNshsr1Q5vR1cNCIzTy4//
 Oytw==
X-Gm-Message-State: AOAM530yyUm5G7t8aM/p0KRt3aOO0ANPEkkTZapm7NiGozO7/qJeeF4V
 BlDyhaHltaYlYLYPmQ5TY3txOI5OJ60=
X-Google-Smtp-Source: ABdhPJxsSB6k920Ypp9qj+tHJTAjO6QF6XUC55WMdzyEJ5qOlnabOg/9i99VEPA1bWb+Ttt4haBX0w==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr8844450wrs.4.1594976689302;
 Fri, 17 Jul 2020 02:04:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/18] drm/arc: Inline remaining files
Date: Fri, 17 Jul 2020 11:04:27 +0200
Message-Id: <20200717090430.1146256-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
References: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At less than 500 lines total feels like the right thing to do.

Also noticed that the simple wrapper around drm_connector_cleanup can
be dropped.

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
index 40697cab0d03..3c44b9b4acec 100644
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
