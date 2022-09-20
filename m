Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D8B5BEB9E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 19:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84A110E728;
	Tue, 20 Sep 2022 17:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965FC10E1FE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 17:09:47 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-127ba06d03fso5192679fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 10:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qkEkl1T24VS6THCkYE/ePve2BexAGuuTTaNBxBE7vME=;
 b=GdNwOw3jD/7pINx9z9fWkNhc8elh6hMz5MbddK2cvX4jaFWZjL4tfH596RxYnRKvKa
 zDgaT6hPaXFw1exakoYc6GW+3FT0rAXvnkBgtrUnLSb+KN4Lm3VxSGsljGtHaB1aieID
 B96jHMFE6c9kyShOxXkfm5wTZ0VY/rnJeVvKNKWdsz28OTSlnWJdv11+w7ulI366gec1
 /z9uH2SGb7znFqZ73PTjq2tuBb24HkaaWt/1CH8RMaiWPbhCE7G0LvYxq2VRgmvtVLm8
 3b1b4uPgLwNtVppKj7AfioGpWn/dtb2CgAzSJhP/Vv32/j0INV93x5e2uD/E8m/1tIhp
 6X8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qkEkl1T24VS6THCkYE/ePve2BexAGuuTTaNBxBE7vME=;
 b=XjoYreykCS7CDh/gaarqO5ne3KBZht2H++dIvNortQJPQkjvzx4RGwj+FNLtVvuB+Z
 xZ21IKAWgHl/tFD1i7IuWOOJVB5oHKQ8sNiafKEWzXLQcsI5A9SQiZ4kz/tQCTmN6LWq
 vezkquAXH73R3858vhnWUWS2pZ+UGO/QjXoBP37zLhu2UuROFeOki8HjSSgjcPHM7erJ
 FiCG5LpoTku4VxbER9fQuE742zrFSPwMxvU4v551+xOlKhwCBYpNYvSbJDdhs6SYMs9r
 oHD07kCVwPoXx9dBE4UNeJpP/GDYGXcKzXN+x+VK7tRCDm8uuJLLkG9uR3JYrmIfBWqc
 YclA==
X-Gm-Message-State: ACrzQf2FVrdAJYT4bcjKqKra1A4RCcyVyX/YiyN0LU9bpfBVvtmVwXeT
 LCh5Q8VsMlFQdrCxeAZPHRNXV/N0db0=
X-Google-Smtp-Source: AMsMyM6blCSAhNeOyz5NuIH6XGBmaYwelD4Q1GwgkFAdPygTXc/cOEUo4hbGpX8hR8/HEjVyxNmiPQ==
X-Received: by 2002:a05:6870:f10a:b0:127:856b:828c with SMTP id
 k10-20020a056870f10a00b00127856b828cmr2560103oac.225.1663693786401; 
 Tue, 20 Sep 2022 10:09:46 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a9d69cd000000b00636956b3080sm121468oto.43.2022.09.20.10.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:09:45 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 2/2] drm/panel: Add Samsung AMS495QA01 MIPI-DSI LCD panel
Date: Tue, 20 Sep 2022 12:09:37 -0500
Message-Id: <20220920170937.14486-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920170937.14486-1-macroalpha82@gmail.com>
References: <20220920170937.14486-1-macroalpha82@gmail.com>
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

Support Samsung AMS495QA01 panel as found on the Anbernic RG503. Note
This panel receives video signals via DSI, however it receives
commands via 3-wire SPI.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams495qa01.c  | 505 ++++++++++++++++++
 3 files changed, 516 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams495qa01.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a9043eacce97..954b66a2adee 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -444,6 +444,16 @@ config DRM_PANEL_RONBO_RB070D30
 	  Say Y here if you want to enable support for Ronbo Electronics
 	  RB070D30 1024x600 DSI panel.
 
+config DRM_PANEL_SAMSUNG_AMS495QA01
+	tristate "Samsung AMS495QA01 DSI panel"
+	depends on OF && SPI
+	depends on DRM_MIPI_DSI
+	select DRM_MIPI_DBI
+	help
+	  DRM panel driver for the Samsung AMS495QA01 panel. This panel
+	  receives video data via DSI but commands via 3-Wire 9-bit
+	  SPI.
+
 config DRM_PANEL_SAMSUNG_ATNA33XC20
 	tristate "Samsung ATNA33XC20 eDP panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 34e717382dbb..de0b57baf851 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN) += panel-raspberrypi-touchscreen
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS495QA01) += panel-samsung-ams495qa01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-ams495qa01.c b/drivers/gpu/drm/panel/panel-samsung-ams495qa01.c
new file mode 100644
index 000000000000..d693ba5f20c9
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-ams495qa01.c
@@ -0,0 +1,505 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung ams495qa01 MIPI-DSI panel driver
+ * Copyright (C) 2022 Chris Morgan
+ */
+
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+
+#include <video/mipi_display.h>
+
+struct ams495qa01 {
+	/** @dev: the container device */
+	struct device *dev;
+	/** @dbi: the DBI bus abstraction handle */
+	struct mipi_dbi dbi;
+	/** @panel: the DRM panel instance for this device */
+	struct drm_panel panel;
+	/** @reset: reset GPIO line */
+	struct gpio_desc *reset;
+	/** @enable: enable GPIO line */
+	struct gpio_desc *enable;
+	/** @reg_vdd: VDD supply regulator for panel logic */
+	struct regulator *reg_vdd;
+	/** @reg_elvdd: ELVDD supply regulator for panel display */
+	struct regulator *reg_elvdd;
+	/** @dsi_dev: DSI child device (panel) */
+	struct mipi_dsi_device *dsi_dev;
+	/** @bl_dev: pseudo-backlight device for oled panel */
+	struct backlight_device *bl_dev;
+	/** @prepared: value tracking panel prepare status */
+	bool prepared;
+};
+
+static const struct drm_display_mode ams495qa01_mode = {
+	.clock = 33500,
+	.hdisplay = 960,
+	.hsync_start = 960 + 10,
+	.hsync_end = 960 + 10 + 2,
+	.htotal = 960 + 10 + 2 + 10,
+	.vdisplay = 544,
+	.vsync_start = 544 + 10,
+	.vsync_end = 544 + 10 + 2,
+	.vtotal = 544 + 10 + 2 + 10,
+	.width_mm = 117,
+	.height_mm = 74,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+#define NUM_GAMMA_LEVELS	16
+#define GAMMA_TABLE_COUNT	23
+#define MAX_BRIGHTNESS		(NUM_GAMMA_LEVELS - 1)
+
+/* Table of gamma values provided in datasheet */
+static u8 ams495qa01_gamma[NUM_GAMMA_LEVELS][GAMMA_TABLE_COUNT] = {
+	{0x01, 0x79, 0x78, 0x8d, 0xd9, 0xdf, 0xd5, 0xcb, 0xcf, 0xc5,
+	 0xe5, 0xe0, 0xe4, 0xdc, 0xb8, 0xd4, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x7d, 0x7c, 0x92, 0xd7, 0xdd, 0xd2, 0xcb, 0xd0, 0xc6,
+	 0xe5, 0xe1, 0xe3, 0xda, 0xbd, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x7f, 0x7e, 0x95, 0xd7, 0xde, 0xd2, 0xcb, 0xcf, 0xc5,
+	 0xe5, 0xe3, 0xe3, 0xda, 0xbf, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x82, 0x81, 0x99, 0xd6, 0xdd, 0xd1, 0xca, 0xcf, 0xc3,
+	 0xe4, 0xe3, 0xe3, 0xda, 0xc2, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x84, 0x83, 0x9b, 0xd7, 0xde, 0xd2, 0xc8, 0xce, 0xc2,
+	 0xe4, 0xe3, 0xe2, 0xd9, 0xc3, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x87, 0x86, 0x9f, 0xd6, 0xdd, 0xd1, 0xc7, 0xce, 0xc1,
+	 0xe4, 0xe3, 0xe2, 0xd9, 0xc6, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x89, 0x89, 0xa2, 0xd5, 0xdb, 0xcf, 0xc8, 0xcf, 0xc2,
+	 0xe3, 0xe3, 0xe1, 0xd9, 0xc7, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x8b, 0x8b, 0xa5, 0xd5, 0xdb, 0xcf, 0xc7, 0xce, 0xc0,
+	 0xe3, 0xe3, 0xe1, 0xd8, 0xc7, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x8d, 0x8d, 0xa7, 0xd5, 0xdb, 0xcf, 0xc6, 0xce, 0xc0,
+	 0xe4, 0xe4, 0xe1, 0xd7, 0xc8, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x8f, 0x8f, 0xaa, 0xd4, 0xdb, 0xce, 0xc6, 0xcd, 0xbf,
+	 0xe3, 0xe3, 0xe1, 0xd7, 0xca, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x91, 0x91, 0xac, 0xd3, 0xda, 0xce, 0xc5, 0xcd, 0xbe,
+	 0xe3, 0xe3, 0xe0, 0xd7, 0xca, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x93, 0x93, 0xaf, 0xd3, 0xda, 0xcd, 0xc5, 0xcd, 0xbe,
+	 0xe2, 0xe3, 0xdf, 0xd6, 0xca, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x95, 0x95, 0xb1, 0xd2, 0xd9, 0xcc, 0xc4, 0xcd, 0xbe,
+	 0xe2, 0xe3, 0xdf, 0xd7, 0xcc, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x99, 0x99, 0xb6, 0xd1, 0xd9, 0xcc, 0xc3, 0xcb, 0xbc,
+	 0xe2, 0xe4, 0xdf, 0xd6, 0xcc, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x9c, 0x9c, 0xba, 0xd0, 0xd8, 0xcb, 0xc3, 0xcb, 0xbb,
+	 0xe2, 0xe4, 0xdf, 0xd6, 0xce, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+	{0x01, 0x9f, 0x9f, 0xbe, 0xcf, 0xd7, 0xc9, 0xc2, 0xcb, 0xbb,
+	 0xe1, 0xe3, 0xde, 0xd6, 0xd0, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
+	 0x00, 0x2f},
+};
+
+/*
+ * Table of elvss values provided in datasheet and corresponds to
+ * gamma values.
+ */
+static u8 ams495qa01_elvss[NUM_GAMMA_LEVELS] = {
+	0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15,
+	0x15, 0x15, 0x14, 0x14, 0x13, 0x12,
+};
+
+static inline struct ams495qa01 *to_ams495qa01(struct drm_panel *panel)
+{
+	return container_of(panel, struct ams495qa01, panel);
+}
+
+static int ams495qa01_update_gamma(struct mipi_dbi *dbi, u32 brightness)
+{
+	u32 tmp = brightness;
+
+	if (brightness > MAX_BRIGHTNESS)
+		tmp = MAX_BRIGHTNESS;
+
+	/* Set gamma values */
+	mipi_dbi_command_buf(dbi, 0xf9, ams495qa01_gamma[tmp],
+			     ARRAY_SIZE(ams495qa01_gamma[tmp]));
+	/* Set gamma change */
+	mipi_dbi_command(dbi, 0xf9, 0x00);
+	/* Undocumented command */
+	mipi_dbi_command(dbi, 0x26, 0x00);
+	/* Set ELVSS value */
+	mipi_dbi_command(dbi, 0xb2, ams495qa01_elvss[tmp]);
+
+	return 0;
+}
+
+static int ams495qa01_prepare(struct drm_panel *panel)
+{
+	struct ams495qa01 *db = to_ams495qa01(panel);
+	struct mipi_dbi *dbi = &db->dbi;
+	int ret;
+
+	if (db->prepared)
+		return 0;
+
+	/* Power up */
+	ret = regulator_enable(db->reg_vdd);
+	if (ret) {
+		dev_err(db->dev, "failed to enable vdd regulator: %d\n", ret);
+		return ret;
+	}
+	if (db->reg_elvdd) {
+		ret = regulator_enable(db->reg_elvdd);
+		if (ret) {
+			dev_err(db->dev,
+				"failed to enable elvdd regulator: %d\n", ret);
+			regulator_disable(db->reg_vdd);
+			return ret;
+		}
+	}
+
+	/* Enable */
+	if (db->enable)
+		gpiod_set_value_cansleep(db->enable, 1);
+
+	msleep(50);
+
+	/* Reset */
+	gpiod_set_value_cansleep(db->reset, 1);
+	usleep_range(1000, 5000);
+	gpiod_set_value_cansleep(db->reset, 0);
+	msleep(20);
+
+	/* Panel Init Sequence */
+
+	/* Password to start command sequence */
+	mipi_dbi_command(dbi, 0xf0, 0x5a, 0x5a);
+	mipi_dbi_command(dbi, 0xf1, 0x5a, 0x5a);
+
+	/* Undocumented commands */
+	mipi_dbi_command(dbi, 0xb0, 0x02);
+	mipi_dbi_command(dbi, 0xf3, 0x3b);
+
+	/* Analog Power condition set */
+	mipi_dbi_command(dbi, 0xf4, 0x33, 0x42, 0x00, 0x08);
+	mipi_dbi_command(dbi, 0xf5, 0x00, 0x06, 0x26, 0x35, 0x03);
+
+	/* Undocumented commands */
+	mipi_dbi_command(dbi, 0xf6, 0x02);
+	mipi_dbi_command(dbi, 0xc6, 0x0b, 0x00, 0x00, 0x3c, 0x00, 0x22,
+			 0x00, 0x00, 0x00, 0x00);
+
+	/* GTCON set */
+	mipi_dbi_command(dbi, 0xf7, 0x20);
+
+	/* TEMP_SWIRE set */
+	mipi_dbi_command(dbi, 0xb2, 0x06, 0x06, 0x06, 0x06);
+
+	/* ELVSS_CON set */
+	mipi_dbi_command(dbi, 0xb1, 0x07, 0x00, 0x10);
+
+	/* Gateless signal set */
+	mipi_dbi_command(dbi, 0xf8, 0x7f, 0x7a, 0x89, 0x67, 0x26, 0x38,
+			 0x00, 0x00, 0x09, 0x67, 0x70, 0x88, 0x7a,
+			 0x76, 0x05, 0x09, 0x23, 0x23, 0x23);
+
+	/* Undocumented commands */
+	mipi_dbi_command(dbi, 0xb5, 0xff, 0xef, 0x35, 0x42, 0x0d, 0xd7,
+			 0xff, 0x07, 0xff, 0xff, 0xfd, 0x00, 0x01,
+			 0xff, 0x05, 0x12, 0x0f, 0xff, 0xff, 0xff,
+			 0xff);
+	mipi_dbi_command(dbi, 0xb4, 0x15);
+	mipi_dbi_command(dbi, 0xb3, 0x00);
+
+	ams495qa01_update_gamma(dbi, MAX_BRIGHTNESS);
+
+	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(200);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+	usleep_range(10000, 15000);
+
+	db->prepared = true;
+
+	return 0;
+}
+
+static int ams495qa01_unprepare(struct drm_panel *panel)
+{
+	struct ams495qa01 *db = to_ams495qa01(panel);
+	struct mipi_dbi *dbi = &db->dbi;
+
+	if (!db->prepared)
+		return 0;
+
+	/* Panel Exit Sequence */
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
+	msleep(20);
+	mipi_dbi_command(dbi, MIPI_DCS_ENTER_SLEEP_MODE);
+	usleep_range(10000, 15000);
+
+	if (db->enable)
+		gpiod_set_value_cansleep(db->enable, 0);
+	if (db->reg_elvdd)
+		regulator_disable(db->reg_elvdd);
+	regulator_disable(db->reg_vdd);
+	msleep(20);
+
+	db->prepared = false;
+
+	return 0;
+}
+
+static int ams495qa01_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
+{
+	struct ams495qa01 *db = to_ams495qa01(panel);
+	struct drm_display_mode *mode;
+	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	mode = drm_mode_duplicate(connector->dev, &ams495qa01_mode);
+	if (!mode) {
+		dev_err(db->dev, "failed to add mode\n");
+		return -ENOMEM;
+	}
+
+	connector->display_info.bpc = 8;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.bus_flags =
+		DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE |
+		DRM_BUS_FLAG_DE_LOW;
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &bus_format, 1);
+
+	drm_mode_set_name(mode);
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs ams495qa01_drm_funcs = {
+	.unprepare = ams495qa01_unprepare,
+	.prepare = ams495qa01_prepare,
+	.get_modes = ams495qa01_get_modes,
+};
+
+static int ams495qa01_set_brightness(struct backlight_device *bd)
+{
+	struct ams495qa01 *db = bl_get_data(bd);
+	struct mipi_dbi *dbi = &db->dbi;
+	int brightness = bd->props.brightness;
+
+	ams495qa01_update_gamma(dbi, brightness);
+
+	return 0;
+}
+
+static const struct backlight_ops ams495qa01_backlight_ops = {
+	.update_status	= ams495qa01_set_brightness,
+};
+
+static int ams495qa01_backlight_register(struct ams495qa01 *db)
+{
+	struct backlight_properties props = {
+		.type		= BACKLIGHT_RAW,
+		.brightness	= MAX_BRIGHTNESS,
+		.max_brightness = MAX_BRIGHTNESS,
+	};
+	struct device *dev = db->dev;
+	int ret = 0;
+
+	db->bl_dev = devm_backlight_device_register(dev, "panel", dev, db,
+						     &ams495qa01_backlight_ops,
+						     &props);
+	if (IS_ERR(db->bl_dev)) {
+		ret = PTR_ERR(db->bl_dev);
+		dev_err(dev, "error registering backlight device (%d)\n", ret);
+	}
+
+	return ret;
+}
+
+static int ams495qa01_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct device_node *endpoint, *dsi_host_node;
+	struct mipi_dsi_host *dsi_host;
+	struct ams495qa01 *db;
+	int ret;
+	struct mipi_dsi_device_info info = {
+		.type = "dupa",
+		.channel = 0,
+		.node = NULL,
+	};
+
+	db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
+	if (!db)
+		return -ENOMEM;
+
+	spi_set_drvdata(spi, db);
+
+	db->dev = dev;
+
+	db->reg_vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(db->reg_vdd))
+		return dev_err_probe(dev, PTR_ERR(db->reg_vdd),
+				     "Failed to get vdd supply\n");
+
+	db->reg_elvdd = devm_regulator_get_optional(dev, "elvdd");
+	if (IS_ERR(db->reg_elvdd))
+		db->reg_elvdd = NULL;
+
+	db->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(db->reset)) {
+		ret = PTR_ERR(db->reset);
+		return dev_err_probe(dev, ret, "no RESET GPIO\n");
+	}
+
+	db->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(db->enable)) {
+		ret = PTR_ERR(db->enable);
+		return dev_err_probe(dev, ret, "cannot get ENABLE GPIO\n");
+	}
+
+	ret = mipi_dbi_spi_init(spi, &db->dbi, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
+
+	/*
+	 * Get the DSI controller that is supplying data for this display
+	 * which is controlled via SPI 3-wire.
+	 */
+	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+	if (!endpoint) {
+		dev_err(dev, "failed to get endpoint\n");
+		return -ENODEV;
+	}
+	dsi_host_node = of_graph_get_remote_port_parent(endpoint);
+	if (!dsi_host_node) {
+		dev_err(dev, "failed to get remote port parent\n");
+		goto put_endpoint;
+	}
+	dsi_host = of_find_mipi_dsi_host_by_node(dsi_host_node);
+	if (!dsi_host) {
+		dev_err(dev, "failed to find dsi host\n");
+		goto put_host;
+	}
+	info.node = of_graph_get_remote_port(endpoint);
+	if (!info.node) {
+		dev_err(dev, "failed to get remote port node\n");
+		ret = -ENODEV;
+		goto put_host;
+	}
+
+	db->dsi_dev = devm_mipi_dsi_device_register_full(dev, dsi_host, &info);
+	if (IS_ERR(db->dsi_dev)) {
+		dev_err(dev, "failed to register dsi device: %ld\n",
+			PTR_ERR(db->dsi_dev));
+		ret = PTR_ERR(db->dsi_dev);
+		goto put_host;
+	}
+
+	db->dsi_dev->lanes = 2;
+	db->dsi_dev->format = MIPI_DSI_FMT_RGB888;
+	db->dsi_dev->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
+
+	drm_panel_init(&db->panel, dev, &ams495qa01_drm_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = ams495qa01_backlight_register(db);
+	if (ret < 0)
+		return ret;
+
+	drm_panel_add(&db->panel);
+
+	ret = devm_mipi_dsi_attach(dev, db->dsi_dev);
+	if (ret < 0) {
+		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
+		drm_panel_remove(&db->panel);
+		return ret;
+	}
+
+	of_node_put(dsi_host_node);
+	of_node_put(endpoint);
+
+	return 0;
+
+put_host:
+	of_node_put(dsi_host_node);
+
+put_endpoint:
+	of_node_put(endpoint);
+	return -ENODEV;
+}
+
+static void ams495qa01_shutdown(struct spi_device *spi)
+{
+	struct ams495qa01 *db = spi_get_drvdata(spi);
+	int ret;
+
+	ret = drm_panel_unprepare(&db->panel);
+	if (ret < 0)
+		dev_err(&spi->dev, "Failed to unprepare panel: %d\n", ret);
+
+	ret = drm_panel_disable(&db->panel);
+	if (ret < 0)
+		dev_err(&spi->dev, "Failed to disable panel: %d\n", ret);
+}
+
+static void ams495qa01_remove(struct spi_device *spi)
+{
+	struct ams495qa01 *db = spi_get_drvdata(spi);
+
+	ams495qa01_shutdown(spi);
+
+	drm_panel_remove(&db->panel);
+}
+
+static const struct of_device_id ams495qa01_match[] = {
+	{ .compatible = "samsung,ams495qa01", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ams495qa01_match);
+
+static const struct spi_device_id ams495qa01_ids[] = {
+	{ "ams495qa01", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(spi, ams495qa01_ids);
+
+static struct spi_driver ams495qa01_driver = {
+	.driver		= {
+		.name	= "ams495qa01-panel",
+		.of_match_table = ams495qa01_match,
+	},
+	.id_table	= ams495qa01_ids,
+	.probe		= ams495qa01_probe,
+	.remove		= ams495qa01_remove,
+	.shutdown	= ams495qa01_shutdown,
+};
+module_spi_driver(ams495qa01_driver);
+
+MODULE_AUTHOR("Chris Morgan <macromorgan@hotmail.com>");
+MODULE_DESCRIPTION("Samsung ams495qa01 panel driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

