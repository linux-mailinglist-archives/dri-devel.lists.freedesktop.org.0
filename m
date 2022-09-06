Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907005AF3F5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 20:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB64710E130;
	Tue,  6 Sep 2022 18:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B155A10E130
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 18:52:14 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-11eab59db71so30358933fac.11
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 11:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YPktpomhXdnRkrCR6CBSt1ACWZQ4QwUVMPMuYlEKAQY=;
 b=KD3PPj9zM4qIOSJ8HNwWjx9UBUAzvvhWfFP6G5FcSEA14hfbYhT0aL+nFiLcgw8kqv
 ckkWxMm1MxngkSDMbwuGLjyDBN4tdcGlvwEl7O2fv/AokVuBC5RRFTUb5HoDI8k3MYqC
 FK2Jm0myOjgpUzjxdK7R64ZGhSjzVnqi3RvYxwhL6pqexcTuc873E8I2rkOnLjIYYUeF
 kecnFCJoc4mHUh/xdJxZFHFOqnhaSZ/tPUZDrOwGmnMmWpdyNfBx8K9LDXObn+6c5qyK
 yr4f2on+wckduLtBZ/AtxM/rET/sS/QyARwKq2PexCUGWehmPGLxLDiugybbBL782oGS
 pRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YPktpomhXdnRkrCR6CBSt1ACWZQ4QwUVMPMuYlEKAQY=;
 b=j30zgFBLM+avIDUyTBCGi4yF17N129ozLFAp6CqWSxpLScCsxVHeBT85opohVMSEp5
 iiNISbMjUHw3Z7upEVEzinr1/3IOvQbqanvZ90l6jPVGfDnif9vfh1aBmiHQt6D3qq7l
 /DGRm+8XbYFFdI0shQfbkLQfJsriAOVi4nFZCWBsrQCOeBLmpDtdFYsgmh3MqNvbyi+T
 2cq0FxDnAnf6vwVq2PZTmkzWlt9MJZQbZ3fao1ZINA44PWBOCH7wWUuXnUBY9kaVnM2s
 ygAJ7QviUBT9lN2xqhw4Z0KeHUcAbZ+8toAT3sQo9D/M44FliJ0MgGTs9h5csJawDhhM
 nj7g==
X-Gm-Message-State: ACgBeo1O5VDG7SBvCigNYT3N1y4D44J9Lfr1Lm2T83/V+6Gtnv93yOVh
 TzwZL3bvjM+oWIvuqoGny3TLzhmzq9Q=
X-Google-Smtp-Source: AA6agR6u8zOSPs/1GVqrFF6x32x1I6ZTdEVVWxxhrVgg6BSaVxFh/XkVuH+hhCaSXqPgDmT17xCzXA==
X-Received: by 2002:a05:6870:1718:b0:127:399a:b26f with SMTP id
 h24-20020a056870171800b00127399ab26fmr6811870oae.158.1662490333926; 
 Tue, 06 Sep 2022 11:52:13 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 f205-20020aca38d6000000b003449ff2299esm5666177oia.4.2022.09.06.11.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 11:52:13 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel
Date: Tue,  6 Sep 2022 13:52:08 -0500
Message-Id: <20220906185208.13395-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906185208.13395-1-macroalpha82@gmail.com>
References: <20220906185208.13395-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Support NewVision NV3051D panels as found on the Anbernic RG353P and
RG353V. The underlying panel part number for the RG353x devices is
unknown, so the device name is used instead.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 478 ++++++++++++++++++
 3 files changed, 488 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3051d.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a9043eacce97..7258d28dda2f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -296,6 +296,15 @@ config DRM_PANEL_NEC_NL8048HL11
 	  panel (found on the Zoom2/3/3630 SDP boards). To compile this driver
 	  as a module, choose M here.
 
+config DRM_PANEL_NEWVISION_NV3051D
+	tristate "NewVision NV3051D DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  This driver supports the NV3051D based panel found on the Anbernic
+	  RG353P and RG353V.
+
 config DRM_PANEL_NEWVISION_NV3052C
 	tristate "NewVision NV3052C RGB/SPI panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 34e717382dbb..cb03b3a82738 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
+obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
 obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35560) += panel-novatek-nt35560.o
diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
new file mode 100644
index 000000000000..c46edd4df765
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -0,0 +1,478 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * NV3051D MIPI-DSI panel driver for Anbernic RG353x
+ * Copyright (C) 2022 Chris Morgan
+ *
+ * based on
+ *
+ * Elida kd35t133 3.5" MIPI-DSI panel driver
+ * Copyright (C) Theobroma Systems 2020
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/display_timing.h>
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct panel_nv3051d {
+	struct device *dev;
+	struct drm_panel panel;
+	struct gpio_desc *reset_gpio;
+	struct regulator *vdd;
+	bool prepared;
+};
+
+static inline struct panel_nv3051d *panel_to_panelnv3051d(struct drm_panel *panel)
+{
+	return container_of(panel, struct panel_nv3051d, panel);
+}
+
+#define dsi_dcs_write_seq(dsi, cmd, seq...) do {			\
+		static const u8 b[] = { cmd, seq };			\
+		int ret;						\
+		ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b));	\
+		if (ret < 0)						\
+			return ret;					\
+	} while (0)
+
+static int panel_nv3051d_init_sequence(struct panel_nv3051d *ctx)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+
+	/*
+	 * Init sequence was supplied by device vendor with no
+	 * documentation.
+	 */
+
+	dsi_dcs_write_seq(dsi, 0xFF, 0x30);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x52);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x01);
+	dsi_dcs_write_seq(dsi, 0xE3, 0x00);
+	dsi_dcs_write_seq(dsi, 0x03, 0x40);
+	dsi_dcs_write_seq(dsi, 0x04, 0x00);
+	dsi_dcs_write_seq(dsi, 0x05, 0x03);
+	dsi_dcs_write_seq(dsi, 0x24, 0x12);
+	dsi_dcs_write_seq(dsi, 0x25, 0x1E);
+	dsi_dcs_write_seq(dsi, 0x26, 0x28);
+	dsi_dcs_write_seq(dsi, 0x27, 0x52);
+	dsi_dcs_write_seq(dsi, 0x28, 0x57);
+	dsi_dcs_write_seq(dsi, 0x29, 0x01);
+	dsi_dcs_write_seq(dsi, 0x2A, 0xDF);
+	dsi_dcs_write_seq(dsi, 0x38, 0x9C);
+	dsi_dcs_write_seq(dsi, 0x39, 0xA7);
+	dsi_dcs_write_seq(dsi, 0x3A, 0x53);
+	dsi_dcs_write_seq(dsi, 0x44, 0x00);
+	dsi_dcs_write_seq(dsi, 0x49, 0x3C);
+	dsi_dcs_write_seq(dsi, 0x59, 0xFE);
+	dsi_dcs_write_seq(dsi, 0x5C, 0x00);
+	dsi_dcs_write_seq(dsi, 0x91, 0x77);
+	dsi_dcs_write_seq(dsi, 0x92, 0x77);
+	dsi_dcs_write_seq(dsi, 0xA0, 0x55);
+	dsi_dcs_write_seq(dsi, 0xA1, 0x50);
+	dsi_dcs_write_seq(dsi, 0xA4, 0x9C);
+	dsi_dcs_write_seq(dsi, 0xA7, 0x02);
+	dsi_dcs_write_seq(dsi, 0xA8, 0x01);
+	dsi_dcs_write_seq(dsi, 0xA9, 0x01);
+	dsi_dcs_write_seq(dsi, 0xAA, 0xFC);
+	dsi_dcs_write_seq(dsi, 0xAB, 0x28);
+	dsi_dcs_write_seq(dsi, 0xAC, 0x06);
+	dsi_dcs_write_seq(dsi, 0xAD, 0x06);
+	dsi_dcs_write_seq(dsi, 0xAE, 0x06);
+	dsi_dcs_write_seq(dsi, 0xAF, 0x03);
+	dsi_dcs_write_seq(dsi, 0xB0, 0x08);
+	dsi_dcs_write_seq(dsi, 0xB1, 0x26);
+	dsi_dcs_write_seq(dsi, 0xB2, 0x28);
+	dsi_dcs_write_seq(dsi, 0xB3, 0x28);
+	dsi_dcs_write_seq(dsi, 0xB4, 0x33);
+	dsi_dcs_write_seq(dsi, 0xB5, 0x08);
+	dsi_dcs_write_seq(dsi, 0xB6, 0x26);
+	dsi_dcs_write_seq(dsi, 0xB7, 0x08);
+	dsi_dcs_write_seq(dsi, 0xB8, 0x26);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x30);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x52);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x02);
+	dsi_dcs_write_seq(dsi, 0xB1, 0x0E);
+	dsi_dcs_write_seq(dsi, 0xD1, 0x0E);
+	dsi_dcs_write_seq(dsi, 0xB4, 0x29);
+	dsi_dcs_write_seq(dsi, 0xD4, 0x2B);
+	dsi_dcs_write_seq(dsi, 0xB2, 0x0C);
+	dsi_dcs_write_seq(dsi, 0xD2, 0x0A);
+	dsi_dcs_write_seq(dsi, 0xB3, 0x28);
+	dsi_dcs_write_seq(dsi, 0xD3, 0x28);
+	dsi_dcs_write_seq(dsi, 0xB6, 0x11);
+	dsi_dcs_write_seq(dsi, 0xD6, 0x0D);
+	dsi_dcs_write_seq(dsi, 0xB7, 0x32);
+	dsi_dcs_write_seq(dsi, 0xD7, 0x30);
+	dsi_dcs_write_seq(dsi, 0xC1, 0x04);
+	dsi_dcs_write_seq(dsi, 0xE1, 0x06);
+	dsi_dcs_write_seq(dsi, 0xB8, 0x0A);
+	dsi_dcs_write_seq(dsi, 0xD8, 0x0A);
+	dsi_dcs_write_seq(dsi, 0xB9, 0x01);
+	dsi_dcs_write_seq(dsi, 0xD9, 0x01);
+	dsi_dcs_write_seq(dsi, 0xBD, 0x13);
+	dsi_dcs_write_seq(dsi, 0xDD, 0x13);
+	dsi_dcs_write_seq(dsi, 0xBC, 0x11);
+	dsi_dcs_write_seq(dsi, 0xDC, 0x11);
+	dsi_dcs_write_seq(dsi, 0xBB, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xDB, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xBA, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xDA, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xBE, 0x18);
+	dsi_dcs_write_seq(dsi, 0xDE, 0x18);
+	dsi_dcs_write_seq(dsi, 0xBF, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xDF, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xC0, 0x17);
+	dsi_dcs_write_seq(dsi, 0xE0, 0x17);
+	dsi_dcs_write_seq(dsi, 0xB5, 0x3B);
+	dsi_dcs_write_seq(dsi, 0xD5, 0x3C);
+	dsi_dcs_write_seq(dsi, 0xB0, 0x0B);
+	dsi_dcs_write_seq(dsi, 0xD0, 0x0C);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x30);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x52);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x03);
+	dsi_dcs_write_seq(dsi, 0x00, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x01, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x02, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x03, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x04, 0x61);
+	dsi_dcs_write_seq(dsi, 0x05, 0x80);
+	dsi_dcs_write_seq(dsi, 0x06, 0xC7);
+	dsi_dcs_write_seq(dsi, 0x07, 0x01);
+	dsi_dcs_write_seq(dsi, 0x08, 0x82);
+	dsi_dcs_write_seq(dsi, 0x09, 0x83);
+	dsi_dcs_write_seq(dsi, 0x30, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x31, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x32, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x33, 0x2A);
+	dsi_dcs_write_seq(dsi, 0x34, 0x61);
+	dsi_dcs_write_seq(dsi, 0x35, 0xC5);
+	dsi_dcs_write_seq(dsi, 0x36, 0x80);
+	dsi_dcs_write_seq(dsi, 0x37, 0x23);
+	dsi_dcs_write_seq(dsi, 0x40, 0x82);
+	dsi_dcs_write_seq(dsi, 0x41, 0x83);
+	dsi_dcs_write_seq(dsi, 0x42, 0x80);
+	dsi_dcs_write_seq(dsi, 0x43, 0x81);
+	dsi_dcs_write_seq(dsi, 0x44, 0x11);
+	dsi_dcs_write_seq(dsi, 0x45, 0xF2);
+	dsi_dcs_write_seq(dsi, 0x46, 0xF1);
+	dsi_dcs_write_seq(dsi, 0x47, 0x11);
+	dsi_dcs_write_seq(dsi, 0x48, 0xF4);
+	dsi_dcs_write_seq(dsi, 0x49, 0xF3);
+	dsi_dcs_write_seq(dsi, 0x50, 0x02);
+	dsi_dcs_write_seq(dsi, 0x51, 0x01);
+	dsi_dcs_write_seq(dsi, 0x52, 0x04);
+	dsi_dcs_write_seq(dsi, 0x53, 0x03);
+	dsi_dcs_write_seq(dsi, 0x54, 0x11);
+	dsi_dcs_write_seq(dsi, 0x55, 0xF6);
+	dsi_dcs_write_seq(dsi, 0x56, 0xF5);
+	dsi_dcs_write_seq(dsi, 0x57, 0x11);
+	dsi_dcs_write_seq(dsi, 0x58, 0xF8);
+	dsi_dcs_write_seq(dsi, 0x59, 0xF7);
+	dsi_dcs_write_seq(dsi, 0x7E, 0x02);
+	dsi_dcs_write_seq(dsi, 0x7F, 0x80);
+	dsi_dcs_write_seq(dsi, 0xE0, 0x5A);
+	dsi_dcs_write_seq(dsi, 0xB1, 0x00);
+	dsi_dcs_write_seq(dsi, 0xB4, 0x0E);
+	dsi_dcs_write_seq(dsi, 0xB5, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xB6, 0x04);
+	dsi_dcs_write_seq(dsi, 0xB7, 0x07);
+	dsi_dcs_write_seq(dsi, 0xB8, 0x06);
+	dsi_dcs_write_seq(dsi, 0xB9, 0x05);
+	dsi_dcs_write_seq(dsi, 0xBA, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xC7, 0x00);
+	dsi_dcs_write_seq(dsi, 0xCA, 0x0E);
+	dsi_dcs_write_seq(dsi, 0xCB, 0x0F);
+	dsi_dcs_write_seq(dsi, 0xCC, 0x04);
+	dsi_dcs_write_seq(dsi, 0xCD, 0x07);
+	dsi_dcs_write_seq(dsi, 0xCE, 0x06);
+	dsi_dcs_write_seq(dsi, 0xCF, 0x05);
+	dsi_dcs_write_seq(dsi, 0xD0, 0x0F);
+	dsi_dcs_write_seq(dsi, 0x81, 0x0F);
+	dsi_dcs_write_seq(dsi, 0x84, 0x0E);
+	dsi_dcs_write_seq(dsi, 0x85, 0x0F);
+	dsi_dcs_write_seq(dsi, 0x86, 0x07);
+	dsi_dcs_write_seq(dsi, 0x87, 0x04);
+	dsi_dcs_write_seq(dsi, 0x88, 0x05);
+	dsi_dcs_write_seq(dsi, 0x89, 0x06);
+	dsi_dcs_write_seq(dsi, 0x8A, 0x00);
+	dsi_dcs_write_seq(dsi, 0x97, 0x0F);
+	dsi_dcs_write_seq(dsi, 0x9A, 0x0E);
+	dsi_dcs_write_seq(dsi, 0x9B, 0x0F);
+	dsi_dcs_write_seq(dsi, 0x9C, 0x07);
+	dsi_dcs_write_seq(dsi, 0x9D, 0x04);
+	dsi_dcs_write_seq(dsi, 0x9E, 0x05);
+	dsi_dcs_write_seq(dsi, 0x9F, 0x06);
+	dsi_dcs_write_seq(dsi, 0xA0, 0x00);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x30);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x52);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x02);
+	dsi_dcs_write_seq(dsi, 0x01, 0x01);
+	dsi_dcs_write_seq(dsi, 0x02, 0xDA);
+	dsi_dcs_write_seq(dsi, 0x03, 0xBA);
+	dsi_dcs_write_seq(dsi, 0x04, 0xA8);
+	dsi_dcs_write_seq(dsi, 0x05, 0x9A);
+	dsi_dcs_write_seq(dsi, 0x06, 0x70);
+	dsi_dcs_write_seq(dsi, 0x07, 0xFF);
+	dsi_dcs_write_seq(dsi, 0x08, 0x91);
+	dsi_dcs_write_seq(dsi, 0x09, 0x90);
+	dsi_dcs_write_seq(dsi, 0x0A, 0xFF);
+	dsi_dcs_write_seq(dsi, 0x0B, 0x8F);
+	dsi_dcs_write_seq(dsi, 0x0C, 0x60);
+	dsi_dcs_write_seq(dsi, 0x0D, 0x58);
+	dsi_dcs_write_seq(dsi, 0x0E, 0x48);
+	dsi_dcs_write_seq(dsi, 0x0F, 0x38);
+	dsi_dcs_write_seq(dsi, 0x10, 0x2B);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x30);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x52);
+	dsi_dcs_write_seq(dsi, 0xFF, 0x00);
+	dsi_dcs_write_seq(dsi, 0x36, 0x02);
+	dsi_dcs_write_seq(dsi, 0x3A, 0x70);
+
+	dev_dbg(ctx->dev, "Panel init sequence done\n");
+
+	return 0;
+}
+
+static int panel_nv3051d_unprepare(struct drm_panel *panel)
+{
+	struct panel_nv3051d *ctx = panel_to_panelnv3051d(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0)
+		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
+
+	msleep(20);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(10000, 15000);
+
+	regulator_disable(ctx->vdd);
+
+	ctx->prepared = false;
+
+	return 0;
+}
+
+static int panel_nv3051d_prepare(struct drm_panel *panel)
+{
+	struct panel_nv3051d *ctx = panel_to_panelnv3051d(panel);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	dev_dbg(ctx->dev, "Resetting the panel\n");
+	ret = regulator_enable(ctx->vdd);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Failed to enable vdd supply: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(2000, 3000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	msleep(150);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	msleep(20);
+
+	ret = panel_nv3051d_init_sequence(ctx);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
+		goto disable_vdd;
+	}
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
+		goto disable_vdd;
+	}
+
+	msleep(200);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
+		goto disable_vdd;
+	}
+
+	usleep_range(10000, 15000);
+
+	ctx->prepared = true;
+
+	return 0;
+
+disable_vdd:
+	regulator_disable(ctx->vdd);
+	return ret;
+}
+
+static const struct drm_display_mode default_mode = {
+	.hdisplay	= 640,
+	.hsync_start	= 640 + 40,
+	.hsync_end	= 640 + 40 + 2,
+	.htotal		= 640 + 40 + 2 + 80,
+	.vdisplay	= 480,
+	.vsync_start	= 480 + 18,
+	.vsync_end	= 480 + 18 + 2,
+	.vtotal		= 480 + 18 + 2 + 28,
+	.clock		= 25000,
+	.width_mm	= 70,
+	.height_mm	= 57,
+	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static int panel_nv3051d_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	struct panel_nv3051d *ctx = panel_to_panelnv3051d(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	if (!mode) {
+		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
+			default_mode.hdisplay, default_mode.vdisplay,
+			drm_mode_vrefresh(&default_mode));
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.bus_flags =
+				DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE |
+				DRM_BUS_FLAG_DE_LOW;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs panel_nv3051d_funcs = {
+	.unprepare	= panel_nv3051d_unprepare,
+	.prepare	= panel_nv3051d_prepare,
+	.get_modes	= panel_nv3051d_get_modes,
+};
+
+static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct panel_nv3051d *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio)) {
+		dev_err(dev, "cannot get reset gpio\n");
+		return PTR_ERR(ctx->reset_gpio);
+	}
+
+	ctx->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(ctx->vdd)) {
+		ret = PTR_ERR(ctx->vdd);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to request vdd regulator: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	ctx->dev = dev;
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
+
+	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void panel_nv3051d_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct panel_nv3051d *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = drm_panel_unprepare(&ctx->panel);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
+
+	ret = drm_panel_disable(&ctx->panel);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
+}
+
+static int panel_nv3051d_remove(struct mipi_dsi_device *dsi)
+{
+	struct panel_nv3051d *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	panel_nv3051d_shutdown(dsi);
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+
+	return 0;
+}
+
+static const struct of_device_id newvision_nv3051d_of_match[] = {
+	{ .compatible = "anbernic,rg353p-panel" },
+	{ .compatible = "anbernic,rg353v-panel" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, newvision_nv3051d_of_match);
+
+static struct mipi_dsi_driver newvision_nv3051d_driver = {
+	.driver = {
+		.name = "panel-newvision-nv3051d",
+		.of_match_table = newvision_nv3051d_of_match,
+	},
+	.probe	= panel_nv3051d_probe,
+	.remove = panel_nv3051d_remove,
+	.shutdown = panel_nv3051d_shutdown,
+};
+module_mipi_dsi_driver(newvision_nv3051d_driver);
+
+MODULE_AUTHOR("Chris Morgan <macromorgan@hotmail.com>");
+MODULE_DESCRIPTION("DRM driver for Newvision NV3051D based MIPI DSI panels");
+MODULE_LICENSE("GPL");
-- 
2.25.1

