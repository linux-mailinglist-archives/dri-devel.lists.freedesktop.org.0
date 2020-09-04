Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4107625DC18
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAB36EC25;
	Fri,  4 Sep 2020 14:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0F86EC2A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:40:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c18so6973496wrm.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=onJaBf7cogfZvGiBgkWimmj+83F0Y7zTn6JsKLkyU/A=;
 b=MG40UuxndvuDIb1eMdrSEf28NlUMRM2y9wPQ95XikDbEP/723R3A3g9w5VXpeJG59U
 4L5CYUuYTDGVf7R9sNssUBTn28VeziJen1e/YUW6mQAO4H0aZegy6oh2rNo0EvKXCM2z
 qxZB1v1qWs+06pKtc53ZcbLEryjIbdZd65N3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=onJaBf7cogfZvGiBgkWimmj+83F0Y7zTn6JsKLkyU/A=;
 b=iEIL6+/ZgRMuIezsRqUem3N+INdEcWAvlcP/q6Rm6qEOS3mx8sguEqgvmE8+rJh9IE
 h1+JEj91zXfW/g1d05fEWUxrjTULpio6yGLcGbWz6FoysyxJt65pLG3HjLvdf6E+xMB2
 MGm22CysB0Nl0irfhdaE/VWUu97ahfV/WU5GPfRPXrd1vwWWV2cM0gFK8ELT4G0+BOK8
 28QbeRa0livCuD/vkagJirQtISH09JiN4kJa1OiaqSAicvyxwq2LJC/B5p+aDwtI2pg0
 GjoWZReyo29AvSyeY4OZ85pY1GO/LKY9ibnCkz0o4ZHv7/5sSnMXHjzwHwXUPYxHYZZH
 3o1w==
X-Gm-Message-State: AOAM5335bBpeMgXgkzYSvZlSgHvKyCe5ZV6/X9Fkn2jZSBsCeTs2wdGQ
 wPoC+Y8VE/arhYHRxEMxsPb2HDnSwF35aXbc
X-Google-Smtp-Source: ABdhPJwUVWmCLjnR8iGpb0moKtP3zMq6hIWcwqzAKAqHSgIs7siUXEwJjoho/QlnZZDl6Mfi5SUVZQ==
X-Received: by 2002:a5d:67d0:: with SMTP id n16mr8595409wrw.198.1599230414131; 
 Fri, 04 Sep 2020 07:40:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:40:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 22/24] drm/arc: Inline remaining files
Date: Fri,  4 Sep 2020 16:39:39 +0200
Message-Id: <20200904143941.110665-23-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
