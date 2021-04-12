Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB5B35BB8F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 10:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBDE6E071;
	Mon, 12 Apr 2021 08:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F42E6E071
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 08:02:05 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id d10so8734457pgf.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 01:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=i4KiQmLrkLOzeN8hLf2dN/NrgF3DSMBO5gpVyoWaFzc=;
 b=o1FIPutAV09D7htR4uEq40Y6WSnQ0vz4qbL0UIOsIGevW+LUx26hK/LKNQZkr/mp2c
 hkz9ukVC2REtA/pPu8OqLFimk+v4vpSkR2+3VZ6Z0pkUPMZAkUxegyG0frkyY/eFivnu
 nopBhJz40JRJUOGYIUhcFjqby2Ca5Q4NnGk+gkQTXeYRqV7hrdEIcTLYfRbgcFFbCcAj
 iJalEDVGgXqj3bh85dPWELJQ06Rif20prwP/7YEwrNyVpgryW3/Rem5cHIdEEXD1g+Gk
 a1cWhNMzxRnAWlklermQOEp5uML1GTHzAMJkm8dwDEUF1DwbksvLol3GS8yVxyL8K3lR
 l2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=i4KiQmLrkLOzeN8hLf2dN/NrgF3DSMBO5gpVyoWaFzc=;
 b=sb3vFGCFDoMAt6HXQpr6kCOYo9OR0a9xYEfqVBlbB39In1iyHyIO3OWWL4Kn5NWKSs
 IsB95ihCXTDi9aDydPnctpLwnrvyHTwu5Pl3bUHkp7wtd7IxS4Qg+AgkfSBS/bDQHi6A
 zExjr0wlFinTB/eLOOjg0CjRUcYPMHAY5Gr0W2JVEdI3YLMiwHNa4vkdcaRR7x89J/6B
 4XAoiFldB6ks2ZQCBerX1adSqOT8Lzn9M9E1dFd3e7q4ktZ1AnN0E08jmJVtS94cj8Ys
 zwQs7qA/yPWzb7M7YOdhfW31tklxQM0I8vDIUavc6qMrbLynJ4CGr3Of0C55twn9AHx0
 1+og==
X-Gm-Message-State: AOAM531wKLzWb0wHl5BbjprVll/XkzLt5ScYXFh6xWslIn5dq0wLrHGN
 +qlz8/9DrkOsz/I4ixoYYseARw==
X-Google-Smtp-Source: ABdhPJz8loTReRnnlRXaRfDFwbMj/t2RhuCHNHcWtOmP3VdijFdsigIMBt/E+RNWO3V+QYgxW+h9KQ==
X-Received: by 2002:a05:6a00:15c6:b029:24e:9dd1:8813 with SMTP id
 o6-20020a056a0015c6b029024e9dd18813mr1061022pfu.80.1618214525064; 
 Mon, 12 Apr 2021 01:02:05 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id g24sm3752616pfh.164.2021.04.12.01.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 01:02:04 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: pihsun@chromium.org, drinkcat@google.com, marcheu@chromium.org,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: Add inx Himax8279d MIPI-DSI LCD panel driver
Date: Mon, 12 Apr 2021 16:01:34 +0800
Message-Id: <20210412080134.24598-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-innolux-himax8279d.c  | 515 ++++++++++++++++++
 3 files changed, 525 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-innolux-himax8279d.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 4894913936e9..288d9268cead 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -132,6 +132,15 @@ config DRM_PANEL_ILITEK_ILI9881C
 	  Say Y if you want to enable support for panels based on the
 	  Ilitek ILI9881c controller.
 
+config DRM_PANEL_INNOLUX_HIMAX8279D
+	tristate "INX 2081101qfh032011-53g 1200x1920 video panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to support for inx 2081101qfh032011-53g
+	  1200x1920 video panel.
+
 config DRM_PANEL_INNOLUX_P079ZCA
 	tristate "Innolux P079ZCA panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index cae4d976c069..06be76db0a5b 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
+obj-$(CONFIG_DRM_PANEL_INNOLUX_HIMAX8279D) += panel-innolux-himax8279d.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
 obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
 obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) += panel-khadas-ts050.o
diff --git a/drivers/gpu/drm/panel/panel-innolux-himax8279d.c b/drivers/gpu/drm/panel/panel-innolux-himax8279d.c
new file mode 100644
index 000000000000..6840449548e4
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-innolux-himax8279d.c
@@ -0,0 +1,515 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021, Huaqin Telecom Technology Co., Ltd
+ * Author: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+struct panel_desc {
+	const struct drm_display_mode *modes;
+	unsigned int bpc;
+
+	/**
+	 * @width_mm: width of the panel's active display area
+	 * @height_mm: height of the panel's active display area
+	 */
+	struct {
+		unsigned int width_mm;
+		unsigned int height_mm;
+	} size;
+
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	const struct panel_init_cmd *init_cmds;
+	unsigned int lanes;
+	bool discharge_on_disable;
+};
+
+struct inx_panel {
+	struct drm_panel base;
+	struct mipi_dsi_device *dsi;
+
+	const struct panel_desc *desc;
+
+	enum drm_panel_orientation orientation;
+	struct regulator *pp1800;
+	struct regulator *avee;
+	struct regulator *avdd;
+	struct gpio_desc *enable_gpio;
+
+	bool prepared;
+};
+
+enum dsi_cmd_type {
+	INIT_DCS_CMD,
+	DELAY_CMD,
+};
+
+struct panel_init_cmd {
+	enum dsi_cmd_type type;
+	size_t len;
+	const char *data;
+};
+
+#define _INIT_DCS_CMD(...) { \
+	.type = INIT_DCS_CMD, \
+	.len = sizeof((char[]){__VA_ARGS__}), \
+	.data = (char[]){__VA_ARGS__} }
+
+#define _INIT_DELAY_CMD(...) { \
+	.type = DELAY_CMD,\
+	.len = sizeof((char[]){__VA_ARGS__}), \
+	.data = (char[]){__VA_ARGS__} }
+
+static const struct panel_init_cmd starry_qfh032011_53g_init_cmd[] = {
+	_INIT_DCS_CMD(0xB0, 0x01),
+	_INIT_DCS_CMD(0xC3, 0x4F),
+	_INIT_DCS_CMD(0xC4, 0x40),
+	_INIT_DCS_CMD(0xC5, 0x40),
+	_INIT_DCS_CMD(0xC6, 0x40),
+	_INIT_DCS_CMD(0xC7, 0x40),
+	_INIT_DCS_CMD(0xC8, 0x4D),
+	_INIT_DCS_CMD(0xC9, 0x52),
+	_INIT_DCS_CMD(0xCA, 0x51),
+	_INIT_DCS_CMD(0xCD, 0x5D),
+	_INIT_DCS_CMD(0xCE, 0x5B),
+	_INIT_DCS_CMD(0xCF, 0x4B),
+	_INIT_DCS_CMD(0xD0, 0x49),
+	_INIT_DCS_CMD(0xD1, 0x47),
+	_INIT_DCS_CMD(0xD2, 0x45),
+	_INIT_DCS_CMD(0xD3, 0x41),
+	_INIT_DCS_CMD(0xD7, 0x50),
+	_INIT_DCS_CMD(0xD8, 0x40),
+	_INIT_DCS_CMD(0xD9, 0x40),
+	_INIT_DCS_CMD(0xDA, 0x40),
+	_INIT_DCS_CMD(0xDB, 0x40),
+	_INIT_DCS_CMD(0xDC, 0x4E),
+	_INIT_DCS_CMD(0xDD, 0x52),
+	_INIT_DCS_CMD(0xDE, 0x51),
+	_INIT_DCS_CMD(0xE1, 0x5E),
+	_INIT_DCS_CMD(0xE2, 0x5C),
+	_INIT_DCS_CMD(0xE3, 0x4C),
+	_INIT_DCS_CMD(0xE4, 0x4A),
+	_INIT_DCS_CMD(0xE5, 0x48),
+	_INIT_DCS_CMD(0xE6, 0x46),
+	_INIT_DCS_CMD(0xE7, 0x42),
+	_INIT_DCS_CMD(0xB0, 0x03),
+	_INIT_DCS_CMD(0xBE, 0x03),
+	_INIT_DCS_CMD(0xCC, 0x44),
+	_INIT_DCS_CMD(0xC8, 0x07),
+	_INIT_DCS_CMD(0xC9, 0x05),
+	_INIT_DCS_CMD(0xCA, 0x42),
+	_INIT_DCS_CMD(0xCD, 0x3E),
+	_INIT_DCS_CMD(0xCF, 0x60),
+	_INIT_DCS_CMD(0xD2, 0x04),
+	_INIT_DCS_CMD(0xD3, 0x04),
+	_INIT_DCS_CMD(0xD4, 0x01),
+	_INIT_DCS_CMD(0xD5, 0x00),
+	_INIT_DCS_CMD(0xD6, 0x03),
+	_INIT_DCS_CMD(0xD7, 0x04),
+	_INIT_DCS_CMD(0xD9, 0x01),
+	_INIT_DCS_CMD(0xDB, 0x01),
+	_INIT_DCS_CMD(0xE4, 0xF0),
+	_INIT_DCS_CMD(0xE5, 0x0A),
+	_INIT_DCS_CMD(0xB0, 0x00),
+	_INIT_DCS_CMD(0xCC, 0x08),
+	_INIT_DCS_CMD(0xC2, 0x08),
+	_INIT_DCS_CMD(0xC4, 0x10),
+	_INIT_DCS_CMD(0xB0, 0x02),
+	_INIT_DCS_CMD(0xC0, 0x00),
+	_INIT_DCS_CMD(0xC1, 0x0A),
+	_INIT_DCS_CMD(0xC2, 0x20),
+	_INIT_DCS_CMD(0xC3, 0x24),
+	_INIT_DCS_CMD(0xC4, 0x23),
+	_INIT_DCS_CMD(0xC5, 0x29),
+	_INIT_DCS_CMD(0xC6, 0x23),
+	_INIT_DCS_CMD(0xC7, 0x1C),
+	_INIT_DCS_CMD(0xC8, 0x19),
+	_INIT_DCS_CMD(0xC9, 0x17),
+	_INIT_DCS_CMD(0xCA, 0x17),
+	_INIT_DCS_CMD(0xCB, 0x18),
+	_INIT_DCS_CMD(0xCC, 0x1A),
+	_INIT_DCS_CMD(0xCD, 0x1E),
+	_INIT_DCS_CMD(0xCE, 0x20),
+	_INIT_DCS_CMD(0xCF, 0x23),
+	_INIT_DCS_CMD(0xD0, 0x07),
+	_INIT_DCS_CMD(0xD1, 0x00),
+	_INIT_DCS_CMD(0xD2, 0x00),
+	_INIT_DCS_CMD(0xD3, 0x0A),
+	_INIT_DCS_CMD(0xD4, 0x13),
+	_INIT_DCS_CMD(0xD5, 0x1C),
+	_INIT_DCS_CMD(0xD6, 0x1A),
+	_INIT_DCS_CMD(0xD7, 0x13),
+	_INIT_DCS_CMD(0xD8, 0x17),
+	_INIT_DCS_CMD(0xD9, 0x1C),
+	_INIT_DCS_CMD(0xDA, 0x19),
+	_INIT_DCS_CMD(0xDB, 0x17),
+	_INIT_DCS_CMD(0xDC, 0x17),
+	_INIT_DCS_CMD(0xDD, 0x18),
+	_INIT_DCS_CMD(0xDE, 0x1A),
+	_INIT_DCS_CMD(0xDF, 0x1E),
+	_INIT_DCS_CMD(0xE0, 0x20),
+	_INIT_DCS_CMD(0xE1, 0x23),
+	_INIT_DCS_CMD(0xE2, 0x07),
+	_INIT_DCS_CMD(0X11),
+	_INIT_DELAY_CMD(120),
+	_INIT_DCS_CMD(0X29),
+	_INIT_DELAY_CMD(80),
+	{},
+};
+
+static inline struct inx_panel *to_inx_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct inx_panel, base);
+}
+
+static int inx_panel_init_dcs_cmd(struct inx_panel *inx)
+{
+	struct mipi_dsi_device *dsi = inx->dsi;
+	struct drm_panel *panel = &inx->base;
+	int i, err = 0;
+
+	if (inx->desc->init_cmds) {
+		const struct panel_init_cmd *init_cmds = inx->desc->init_cmds;
+
+		for (i = 0; init_cmds[i].len != 0; i++) {
+			const struct panel_init_cmd *cmd = &init_cmds[i];
+
+			switch (cmd->type) {
+			case DELAY_CMD:
+				msleep(cmd->data[0]);
+				err = 0;
+				break;
+
+			case INIT_DCS_CMD:
+				err = mipi_dsi_dcs_write(dsi, cmd->data[0],
+							 cmd->len <= 1 ? NULL :
+							 &cmd->data[1],
+							 cmd->len - 1);
+				break;
+
+			default:
+				err = -EINVAL;
+			}
+
+			if (err < 0) {
+				dev_err(panel->dev,
+					"failed to write command %u\n", i);
+				return err;
+			}
+		}
+	}
+	return 0;
+}
+
+static int inx_panel_enter_sleep_mode(struct inx_panel *inx)
+{
+	struct mipi_dsi_device *dsi = inx->dsi;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0)
+		return ret;
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int inx_panel_unprepare(struct drm_panel *panel)
+{
+	struct inx_panel *inx = to_inx_panel(panel);
+	int ret;
+
+	if (!inx->prepared)
+		return 0;
+
+	ret = inx_panel_enter_sleep_mode(inx);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
+		return ret;
+	}
+
+	msleep(150);
+
+	if (inx->desc->discharge_on_disable) {
+		regulator_disable(inx->avee);
+		regulator_disable(inx->avdd);
+		usleep_range(5000, 7000);
+		gpiod_set_value(inx->enable_gpio, 0);
+		usleep_range(5000, 7000);
+		regulator_disable(inx->pp1800);
+	} else {
+		gpiod_set_value(inx->enable_gpio, 0);
+		usleep_range(500, 1000);
+		regulator_disable(inx->avee);
+		regulator_disable(inx->avdd);
+		usleep_range(5000, 7000);
+		regulator_disable(inx->pp1800);
+	}
+
+	inx->prepared = false;
+
+	return 0;
+}
+
+static int inx_panel_prepare(struct drm_panel *panel)
+{
+	struct inx_panel *inx = to_inx_panel(panel);
+	int ret;
+
+	if (inx->prepared)
+		return 0;
+
+	gpiod_set_value(inx->enable_gpio, 0);
+	usleep_range(1000, 1500);
+
+	ret = regulator_enable(inx->pp1800);
+	if (ret < 0)
+		return ret;
+
+	usleep_range(3000, 5000);
+
+	ret = regulator_enable(inx->avdd);
+	if (ret < 0)
+		goto poweroff1v8;
+	ret = regulator_enable(inx->avee);
+	if (ret < 0)
+		goto poweroffavdd;
+
+	usleep_range(5000, 10000);
+
+	gpiod_set_value(inx->enable_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value(inx->enable_gpio, 0);
+	usleep_range(1000, 2000);
+	gpiod_set_value(inx->enable_gpio, 1);
+	usleep_range(6000, 10000);
+
+	ret = inx_panel_init_dcs_cmd(inx);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to init panel: %d\n", ret);
+		goto poweroff;
+	}
+
+	inx->prepared = true;
+
+	return 0;
+
+poweroff:
+	regulator_disable(inx->avee);
+poweroffavdd:
+	regulator_disable(inx->avdd);
+poweroff1v8:
+	usleep_range(5000, 7000);
+	regulator_disable(inx->pp1800);
+	gpiod_set_value(inx->enable_gpio, 0);
+
+	return ret;
+}
+
+static int inx_panel_enable(struct drm_panel *panel)
+{
+	msleep(130);
+	return 0;
+}
+
+static const struct drm_display_mode starry_qfh032011_53g_default_mode = {
+	.clock = 165731,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 100,
+	.hsync_end = 1200 + 100 + 10,
+	.htotal = 1200 + 100 + 10 + 100,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 14,
+	.vsync_end = 1920 + 14 + 10,
+	.vtotal = 1920 + 14 + 10 + 15,
+};
+
+static const struct panel_desc starry_qfh032011_53g_desc = {
+	.modes = &starry_qfh032011_53g_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 135,
+		.height_mm = 216,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = starry_qfh032011_53g_init_cmd,
+	.discharge_on_disable = false,
+};
+
+static int inx_panel_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
+{
+	struct inx_panel *inx = to_inx_panel(panel);
+	const struct drm_display_mode *m = inx->desc->modes;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, m);
+	if (!mode) {
+		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
+			m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
+		return -ENOMEM;
+	}
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = inx->desc->size.width_mm;
+	connector->display_info.height_mm = inx->desc->size.height_mm;
+	connector->display_info.bpc = inx->desc->bpc;
+	drm_connector_set_panel_orientation(connector, inx->orientation);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs inx_panel_funcs = {
+	.unprepare = inx_panel_unprepare,
+	.prepare = inx_panel_prepare,
+	.enable = inx_panel_enable,
+	.get_modes = inx_panel_get_modes,
+};
+
+static int inx_panel_add(struct inx_panel *inx)
+{
+	struct device *dev = &inx->dsi->dev;
+	int err;
+
+	inx->avdd = devm_regulator_get(dev, "avdd");
+	if (IS_ERR(inx->avdd))
+		return PTR_ERR(inx->avdd);
+
+	inx->avee = devm_regulator_get(dev, "avee");
+	if (IS_ERR(inx->avee))
+		return PTR_ERR(inx->avee);
+
+	inx->pp1800 = devm_regulator_get(dev, "pp1800");
+	if (IS_ERR(inx->pp1800))
+		return PTR_ERR(inx->pp1800);
+
+	inx->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(inx->enable_gpio)) {
+		dev_err(dev, "cannot get reset-gpios %ld\n",
+			PTR_ERR(inx->enable_gpio));
+		return PTR_ERR(inx->enable_gpio);
+	}
+
+	gpiod_set_value(inx->enable_gpio, 0);
+
+	drm_panel_init(&inx->base, dev, &inx_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	err = of_drm_get_panel_orientation(dev->of_node, &inx->orientation);
+	if (err < 0) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
+		return err;
+	}
+
+	err = drm_panel_of_backlight(&inx->base);
+	if (err)
+		return err;
+
+	inx->base.funcs = &inx_panel_funcs;
+	inx->base.dev = &inx->dsi->dev;
+
+	drm_panel_add(&inx->base);
+
+	return 0;
+}
+
+static int inx_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct inx_panel *inx;
+	int ret;
+	const struct panel_desc *desc;
+
+	inx = devm_kzalloc(&dsi->dev, sizeof(*inx), GFP_KERNEL);
+	if (!inx)
+		return -ENOMEM;
+
+	desc = of_device_get_match_data(&dsi->dev);
+	dsi->lanes = desc->lanes;
+	dsi->format = desc->format;
+	dsi->mode_flags = desc->mode_flags;
+	inx->desc = desc;
+	inx->dsi = dsi;
+	ret = inx_panel_add(inx);
+	if (ret < 0)
+		return ret;
+
+	mipi_dsi_set_drvdata(dsi, inx);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret)
+		drm_panel_remove(&inx->base);
+
+	return ret;
+}
+
+static void inx_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct inx_panel *inx = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_disable(&inx->base);
+	drm_panel_unprepare(&inx->base);
+}
+
+static int inx_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct inx_panel *inx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	inx_panel_shutdown(dsi);
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
+
+	if (inx->base.dev)
+		drm_panel_remove(&inx->base);
+
+	return 0;
+}
+
+static const struct of_device_id inx_of_match[] = {
+	{ .compatible = "starry,2081101qfh032011-53g",
+	  .data = &starry_qfh032011_53g_desc
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, inx_of_match);
+
+static struct mipi_dsi_driver inx_panel_driver = {
+	.driver = {
+		.name = "panel-innolux-himax8279d",
+		.of_match_table = inx_of_match,
+	},
+	.probe = inx_panel_probe,
+	.remove = inx_panel_remove,
+	.shutdown = inx_panel_shutdown,
+};
+module_mipi_dsi_driver(inx_panel_driver);
+
+MODULE_AUTHOR("Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>");
+MODULE_DESCRIPTION("INNOLUX HIMAX8279D 1200x1920 video mode panel driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
