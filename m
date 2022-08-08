Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6343058CFD2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 23:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090D58B7D8;
	Mon,  8 Aug 2022 21:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B633D8DDD0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 21:37:29 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id z3so7518242qtv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 14:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:sender:from:to:cc;
 bh=Q9PKtfstb3IaH3UDQ2Oh3oWLE6JBB39oUjolcp8WJoM=;
 b=cnV1pvEvXh5HnU2ss5eLswHpz9CsKbEe0HUXDSpEdKLdYQxv5hL4W9Ch0G3LuaYibo
 HRs+2IFOjhfFtMshePef6TfRcEuQunx0l3/XEWNIlOZhTOlmQj1lZCqFPXORhic+ul7n
 zwcBmo7I4twRJKLXhcLxAqJhZSmdgCmqx6QwxxDUgcBPoh9FtZNNQAsUdu38u99HLfP+
 Ct+5dF3ZHTYAW6P+N8S6W3vL8uhkzUl++c0Tz8JRMmbuawZd/vUwKV1XSA6IQLywKf3I
 iAnPCeo90axEXvRBUru6csJHN00zjA0ni15Abm8NFhu+C2TXQ0XY+JUPn8dXTJSApU4N
 Xqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
 :cc; bh=Q9PKtfstb3IaH3UDQ2Oh3oWLE6JBB39oUjolcp8WJoM=;
 b=3FIHYspDr0ptZgY4uT6CBcSZlVuVPCd5FiGlrs4dQ5cy/YYf5QrJBEW4wc3IInqiaR
 Wcz+AVUOkdHpX+fnQ9juVW0nulpKZEHE2OaxiqzrNGJM5xo5oQeH1Yy39zZBm0QbN96/
 iiPDFwn6UK16mWh9QdDsOqb1Wcrkc7k9MzXyDMtMxatT+OO8+lEk8uMyNOh7tprSBa/b
 dRWqjDqjwHeyKbliSZsNJS/L0EXW4/tRP6BQNU3lP/atYNy1napR/rdvtSx4kINSzWcj
 kkwNiocTiChf/hI+6whLTQpX+DGxvSY6CN9aOXNwdt1aEtC99mOwuf3fM47mBsNgkn0b
 f9/A==
X-Gm-Message-State: ACgBeo3zBhFmBhu2LT61AE8UHljodQcm7h3AnzfVAbGRKBNQKqbW2LVq
 T9QKNqmLpqOppWBuTGAR5l8=
X-Google-Smtp-Source: AA6agR5An55LBn0ChO0mUR4t+VVt6Bb7URGonGhlMAWqADocP9TpbTn+D3h07ZCYcAOMSlecPsmWXw==
X-Received: by 2002:a05:622a:100a:b0:342:9a3d:cd58 with SMTP id
 d10-20020a05622a100a00b003429a3dcd58mr15376507qte.479.1659994648534; 
 Mon, 08 Aug 2022 14:37:28 -0700 (PDT)
Received: from kubuntu-desktop..
 (108-215-65-189.lightspeed.dybhfl.sbcglobal.net. [108.215.65.189])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05622a110d00b00339163a06fcsm9146656qty.6.2022.08.08.14.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 14:37:28 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
 thierry.reding@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/panel/tianma-tl057fvxp01: add panel for Motorola
 Moto G6
Date: Mon,  8 Aug 2022 17:37:26 -0400
Message-Id: <20220808213726.883003-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808213726.883003-1-julianbraha@gmail.com>
References: <20220808213726.883003-1-julianbraha@gmail.com>
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
v3:
Fixed kconfig dependencies.

v2:
Fixed accidental whitespace deletion.
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-tianma-tl057fvxp01.c  | 262 ++++++++++++++++++
 3 files changed, 272 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-tianma-tl057fvxp01.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a9043eacce97..f7d637084d96 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -658,6 +658,15 @@ config DRM_PANEL_TDO_TL070WSH30
 	  24 bit RGB per pixel. It provides a MIPI DSI interface to
 	  the host, a built-in LED backlight and touch controller.

+config DRM_PANEL_TIANMA_TL057FVXP01
+	tristate "Tianma TL057FVXP01 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the Tianma TL057FVXP01
+	  2160x1080 5.7" panel (found on the Motorola Moto G6)
+
 config DRM_PANEL_TPO_TD028TTEC1
 	tristate "Toppoly (TPO) TD028TTEC1 panel driver"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 34e717382dbb..8f9228082c32 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -66,6 +66,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
 obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
 obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
+obj-$(CONFIG_DRM_PANEL_TIANMA-TL057FVXP01) += panel-tianma-tl057fvxp01.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
diff --git a/drivers/gpu/drm/panel/panel-tianma-tl057fvxp01.c b/drivers/gpu/drm/panel/panel-tianma-tl057fvxp01.c
new file mode 100644
index 000000000000..92238defa9ad
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
+	{ .compatible = "tianma,tl057fvxp01" }, // FIXME
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
2.34.1
