Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE4B3E3CA4
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 22:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909E08994A;
	Sun,  8 Aug 2021 20:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532808994A
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 20:09:02 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id t68so16134353qkf.8
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Aug 2021 13:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttkNC8S7h6Q4nQKTj7BxzOwXy3Ly2Ki5qjz5ZuE1wIg=;
 b=GTQHSLyZmoNHmb9n8xi6Efx/Bc5Kw5BEAZ2j0vd14UsaFBzSs48/AlHjUDtCjwq1Le
 kvuFNbXHWygBsycNssOMhT8kyWTooGzN2ascCc4fFFrhTESUMTHDIZQBctkHOtscj6X2
 F1glH84bAiOB/iLBkF/OuUZGuVFGHCYdjLzA+ZphCctxUATFp1ORxl4hFFokBoii4tHM
 mJlH9vUXQe6/jf9seL/wCbS0IVty/ZJ5JCQ7XO5/B4JEuxYOtsXtUq4/OvLMcCJSWZpc
 AwP+JKhGGNaMkqXFeTrdiYMNfqAoFHDDI6h8BanLJmXVuu4EO+M6LKzBdJ5phZFcEiKb
 K22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ttkNC8S7h6Q4nQKTj7BxzOwXy3Ly2Ki5qjz5ZuE1wIg=;
 b=l87RinMePFZHsQpFAUbAnyuhGrk27I4UXX6DYK/rely8SbOWG/WSa86O0OYTSN+v2R
 1tb28xTH5Ae1J2mbQQJNgAVdvYsEG082ZZdwY7aRHtdXrAUUs4Jd59DziadYyR7xaJdB
 rHseMn78CLJJ2zQSy1zla/XLOvyInpHX6ulnoI5SGDriBnnmFf74hjIFMaD7FKjZ8lLO
 HV71XwTRN0kxV+h8RX7QHMeJ36sIrDSHeJPXYiqUBFZ2f11emJRAcCrYqHcafwDZTjFs
 I+Dtbz5mi3i0RntB/kYh+nU/RJO2g58BPrCWKYKyey+QQ4Qa70g00/IqUez0rFRyjPwf
 Y30A==
X-Gm-Message-State: AOAM532nAntuTGimXxbqgKwNORu09P33kd93d2ulyLC5QY7NsPSpWpYw
 ywnVu6QGeunVWFo61uXb19A=
X-Google-Smtp-Source: ABdhPJwW+haqNvtSymZ98zTFwky5nLNCrNVE8edQ6L0wQTs1ruqOvpfGE/2ISHxIJcyuwuYKjd/Xbw==
X-Received: by 2002:a05:620a:22f8:: with SMTP id
 p24mr12646447qki.428.1628453341207; 
 Sun, 08 Aug 2021 13:09:01 -0700 (PDT)
Received: from localhost.localdomain ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id q11sm7696155qkm.56.2021.08.08.13.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 13:09:00 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: thierry.reding@gmail.com, airlied@linux.ie, sam@ravnborg.org,
 daniel@ffwll.ch
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panel/tianma-tl057fvxp01: add panel for Motorola Moto
 G6
Date: Sun,  8 Aug 2021 16:08:54 -0400
Message-Id: <20210808200854.187648-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a 5.7" 2160x1080 panel found on the Motorola Moto G6.
There may be other smartphones using it, as well.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   7 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-tianma-tl057fvxp01.c  | 262 ++++++++++++++++++
 3 files changed, 270 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-tianma-tl057fvxp01.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index beb581b96ecd..9e8a5fffa626 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -557,6 +557,13 @@ config DRM_PANEL_TDO_TL070WSH30
 	  24 bit RGB per pixel. It provides a MIPI DSI interface to
 	  the host, a built-in LED backlight and touch controller.
 
+config DRM_PANEL_TIANMA_TL057FVXP01
+	tristate "Tianma TL057FVXP01 panel"
+	select DRM_PANEL_MIPI_DSI_COMMON
+	help
+	  Say Y here if you want to enable support for the Tianma TL057FVXP01
+	  2160x1080 5.7" panel (found on the Motorola Moto G6).
+
 config DRM_PANEL_TPO_TD028TTEC1
 	tristate "Toppoly (TPO) TD028TTEC1 panel driver"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index c8132050bcec..9bdc2a12e719 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX424AKP) += panel-sony-acx424akp.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
 obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
+obj-$(CONFIG_DRM_PANEL_TIANMA_TL057FVXP01) += panel-tianma-tl057fvxp01.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
diff --git a/drivers/gpu/drm/panel/panel-tianma-tl057fvxp01.c b/drivers/gpu/drm/panel/panel-tianma-tl057fvxp01.c
new file mode 100644
index 000000000000..7dcdcbd8ef5f
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-tianma-tl057fvxp01.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 Julian Braha <julianbraha@gmail.com>
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct tianma_tl057fvxp01 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+	bool prepared;
+};
+
+static inline struct tianma_tl057fvxp01 *to_tianma_tl057fvxp01(struct drm_panel *panel)
+{
+	return container_of(panel, struct tianma_tl057fvxp01, panel);
+}
+
+#define dsi_dcs_write_seq(dsi, seq...) do {				\
+		static const u8 d[] = { seq };				\
+		int ret;						\
+		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
+		if (ret < 0)						\
+			return ret;					\
+	} while (0)
+
+static void tianma_tl057fvxp01_reset(struct tianma_tl057fvxp01 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int tianma_tl057fvxp01_on(struct tianma_tl057fvxp01 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi_dcs_write_seq(dsi, 0x00, 0x00);
+	dsi_dcs_write_seq(dsi, 0xff, 0x19, 0x11, 0x01);
+	dsi_dcs_write_seq(dsi, 0x00, 0x80);
+	dsi_dcs_write_seq(dsi, 0xff, 0x19, 0x11);
+	dsi_dcs_write_seq(dsi, 0x00, 0xb0);
+	dsi_dcs_write_seq(dsi, 0xb3, 0x04, 0x38, 0x08, 0x70);
+	dsi_dcs_write_seq(dsi, 0x00, 0x00);
+	dsi_dcs_write_seq(dsi, 0xff, 0xff, 0xff, 0xff);
+	dsi_dcs_write_seq(dsi, 0x35, 0x00);
+	dsi_dcs_write_seq(dsi, 0x51, 0xcc, 0x08);
+	dsi_dcs_write_seq(dsi, 0x53, 0x2c);
+	dsi_dcs_write_seq(dsi, 0x55, 0x01);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(120);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
+	usleep_range(10000, 11000);
+
+	return 0;
+}
+
+static int tianma_tl057fvxp01_off(struct tianma_tl057fvxp01 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display off: %d\n", ret);
+		return ret;
+	}
+	msleep(50);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(70);
+
+	return 0;
+}
+
+static int tianma_tl057fvxp01_prepare(struct drm_panel *panel)
+{
+	struct tianma_tl057fvxp01 *ctx = to_tianma_tl057fvxp01(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	tianma_tl057fvxp01_reset(ctx);
+
+	ret = tianma_tl057fvxp01_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		return ret;
+	}
+
+	ctx->prepared = true;
+	return 0;
+}
+
+static int tianma_tl057fvxp01_unprepare(struct drm_panel *panel)
+{
+	struct tianma_tl057fvxp01 *ctx = to_tianma_tl057fvxp01(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = tianma_tl057fvxp01_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	ctx->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode tianma_tl057fvxp01_mode = {
+	.clock = (1080 + 53 + 4 + 53) * (2160 + 14 + 1 + 11) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 53,
+	.hsync_end = 1080 + 53 + 4,
+	.htotal = 1080 + 53 + 4 + 53,
+	.vdisplay = 2160,
+	.vsync_start = 2160 + 14,
+	.vsync_end = 2160 + 14 + 1,
+	.vtotal = 2160 + 14 + 1 + 11,
+	.width_mm = 62,
+	.height_mm = 110,
+};
+
+static int tianma_tl057fvxp01_get_modes(struct drm_panel *panel,
+				   struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &tianma_tl057fvxp01_mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs tianma_tl057fvxp01_panel_funcs = {
+	.prepare = tianma_tl057fvxp01_prepare,
+	.unprepare = tianma_tl057fvxp01_unprepare,
+	.get_modes = tianma_tl057fvxp01_get_modes,
+};
+
+static int tianma_tl057fvxp01_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct tianma_tl057fvxp01 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
+
+	drm_panel_init(&ctx->panel, dev, &tianma_tl057fvxp01_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int tianma_tl057fvxp01_remove(struct mipi_dsi_device *dsi)
+{
+	struct tianma_tl057fvxp01 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
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
+static const struct of_device_id tianma_tl057fvxp01_of_match[] = {
+	{ .compatible = "tianma,tl057fvxp01" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tianma_tl057fvxp01_of_match);
+
+static struct mipi_dsi_driver tianma_tl057fvxp01_driver = {
+	.probe = tianma_tl057fvxp01_probe,
+	.remove = tianma_tl057fvxp01_remove,
+	.driver = {
+		.name = "panel-tianma-tl057fvxp01",
+		.of_match_table = tianma_tl057fvxp01_of_match,
+	},
+};
+module_mipi_dsi_driver(tianma_tl057fvxp01_driver);
+
+MODULE_AUTHOR("Julian Braha <julianbraha@gmail.com>");
+MODULE_DESCRIPTION("Tianma TL057FVXP01 panel driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

