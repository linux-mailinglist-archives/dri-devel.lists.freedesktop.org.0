Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC55A5B1FE5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CF110EB03;
	Thu,  8 Sep 2022 14:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75DD10EAFE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 14:00:00 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id v1so4613964plo.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 07:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=B7xOc0KzeEMtJEdq+cmNrExIH9zecNQ4eqzDQ7ZceTs=;
 b=ZhgIc1JD99kofUYEQd8Snnf9gveW1aB2mgsNVn1b58m44ahiyL/vGVYhsrdOPeRT/d
 WRlaHu5+Lk9teNITc63eEDuTaeaKcxUWehFzHe41cW9snb55HLLYPWhDOMX2jRl9UpTU
 A7zbRNAUwkV/dZVRePid4vJsAwnHw3LE9T4ycZqsSgAc9K2xA+2xQxWmNm/RM/VtFsxf
 63fDqBKcAXx0tyLQdxtn66kF7cJl5JNsJNvmvkMis8GWmIX9syeIEC9q6c/BjrYmU25b
 HcJyfbWGjjhNi37hg1FIQEJcxAY0HExvOmOoUDUz7CMwUYOCeYfIpHDorGlOC5GSXIaW
 4L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=B7xOc0KzeEMtJEdq+cmNrExIH9zecNQ4eqzDQ7ZceTs=;
 b=BRF101WaFzEFQb88rCQemS+5zUX0aS/zHmQCjQRpeGRieaY/3Xhp9JQJa4wcmf9/Hc
 eRdr/imytj/V279yEJBZQbPXl+GtGFAFyZUxrdyY+3Hp9Wpby1z7fxpeSLq8yH1HwAcj
 DO3O98LJ8i9UTWDsLpF8bZ2MQ2mvCo3lyIiOszf9MhITLhW0Fo3NWpeevTq/eP0CfqJ6
 pr55pkQkq2fH4CiZzAgPeYm6DQW+I1nZGU67b4o8NVNfhJHTlwXaQrRmq4tO3Gmt8UBb
 oEJMmPFvGakGvtYG7UzRhAi83pbibL+4hiMswJR5hhoce1qkQe0wdnz/g1rzP9LVgyWN
 BkTg==
X-Gm-Message-State: ACgBeo2ysEzy+XNXbgRiA644suXnKgmCMVK1GD+qEckZtgdcRJ+x+Wnh
 sMBoV355+JYk+t5cLZmHeP/HJA==
X-Google-Smtp-Source: AA6agR5gDLVfHo3wivyZ/iYEsvb9MmkIjF5Zp6yspWd5f+yWT4eVGcS72Y8p29digLCWNY3MnbxVaw==
X-Received: by 2002:a17:90b:1b0d:b0:1fe:3993:2a82 with SMTP id
 nu13-20020a17090b1b0d00b001fe39932a82mr4430761pjb.155.1662645600283; 
 Thu, 08 Sep 2022 07:00:00 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:f525:b238:30b0:311e])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a170902d2c700b001709e3c755fsm7073200plc.230.2022.09.08.06.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 06:59:59 -0700 (PDT)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 4/4] drm: panel: Add Jadard JD9365DA-H3 DSI panel
Date: Thu,  8 Sep 2022 19:29:40 +0530
Message-Id: <20220908135940.299324-4-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908135940.299324-1-jagan@edgeble.ai>
References: <20220908135940.299324-1-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jadard JD9365DA-H3 is WUXGA MIPI DSI panel and it support TFT
dot matrix LCD with 800RGBx1280 dots at maximum.

Add support for it.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v2:
- rebased on drm-misc-next

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 509 ++++++++++++++++++
 4 files changed, 521 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ef45fbac0ba0..4e8f4f82f866 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6392,6 +6392,7 @@ DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@edgeble.ai>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+F:	drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
 
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
 M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a582ddd583c2..e6e805e4a0ec 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -203,6 +203,16 @@ config DRM_PANEL_INNOLUX_P079ZCA
 	  24 bit RGB per pixel. It provides a MIPI DSI interface to
 	  the host and has a built-in LED backlight.
 
+config DRM_PANEL_JADARD_JD9365DA_H3
+	tristate "Jadard JD9365DA-H3 WUXGA DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Jadard JD9365DA-H3
+	  WUXGA MIPI DSI panel. The panel support TFT dot matrix LCD with
+	  800RGBx1280 dots at maximum.
+
 config DRM_PANEL_JDI_LT070ME05000
 	tristate "JDI LT070ME05000 WUXGA DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 34e717382dbb..af0b1ebdbac8 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
+obj-$(CONFIG_DRM_PANEL_JADARD_JD9365DA_H3) += panel-jadard-jd9365da-h3.o
 obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
 obj-$(CONFIG_DRM_PANEL_JDI_R63452) += panel-jdi-fhd-r63452.o
 obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) += panel-khadas-ts050.o
diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
new file mode 100644
index 000000000000..0e703c47b2dc
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -0,0 +1,509 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2019 Radxa Limited
+ * Copyright (c) 2022 Edgeble AI Technologies Pvt. Ltd.
+ *
+ * Author:
+ * - Jagan Teki <jagan@amarulasolutions.com>
+ * - Stephen Chen <stephen@radxa.com>
+ */
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
+#include <linux/gpio/consumer.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+
+enum cmd_type {
+	CMD_TYPE_DCS,
+	CMD_TYPE_DELAY,
+};
+
+struct jadard_init_cmd {
+	enum cmd_type type;
+	const char *data;
+	size_t len;
+};
+
+#define _INIT_CMD_DCS(...)					\
+	{							\
+		.type	= CMD_TYPE_DCS,				\
+		.data	= (char[]){__VA_ARGS__},		\
+		.len	= sizeof((char[]){__VA_ARGS__})		\
+	}							\
+
+#define _INIT_CMD_DELAY(...)					\
+	{							\
+		.type	= CMD_TYPE_DELAY,			\
+		.data	= (char[]){__VA_ARGS__},		\
+		.len	= sizeof((char[]){__VA_ARGS__})		\
+	}							\
+
+struct jadard_panel_desc {
+	const struct drm_display_mode mode;
+	unsigned int lanes;
+	enum mipi_dsi_pixel_format format;
+	const struct jadard_init_cmd *init_cmds;
+	u32 num_init_cmds;
+};
+
+struct jadard {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	const struct jadard_panel_desc *desc;
+
+	struct regulator *vdd;
+	struct regulator *vccio;
+	struct gpio_desc *reset;
+};
+
+static inline struct jadard *panel_to_jadard(struct drm_panel *panel)
+{
+	return container_of(panel, struct jadard, panel);
+}
+
+static int jadard_enable(struct drm_panel *panel)
+{
+	struct device *dev = panel->dev;
+	struct jadard *jadard = panel_to_jadard(panel);
+	const struct jadard_panel_desc *desc = jadard->desc;
+	struct mipi_dsi_device *dsi = jadard->dsi;
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < desc->num_init_cmds; i++) {
+		const struct jadard_init_cmd *cmd = &desc->init_cmds[i];
+
+		switch (cmd->type) {
+		case CMD_TYPE_DELAY:
+			msleep(cmd->data[0]);
+			err = 0;
+			break;
+		case CMD_TYPE_DCS:
+			err = mipi_dsi_dcs_write(dsi, cmd->data[0],
+						 cmd->len <= 1 ? NULL : &cmd->data[1],
+						 cmd->len - 1);
+			break;
+		default:
+			err = -EINVAL;
+		}
+
+		if (err < 0) {
+			DRM_DEV_ERROR(dev, "failed to write CMD#0x%x\n", cmd->data[0]);
+			return err;
+		}
+	}
+
+	err = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (err < 0)
+		DRM_DEV_ERROR(dev, "failed to exit sleep mode ret = %d\n", err);
+
+	err =  mipi_dsi_dcs_set_display_on(dsi);
+	if (err < 0)
+		DRM_DEV_ERROR(dev, "failed to set display on ret = %d\n", err);
+
+	return 0;
+}
+
+static int jadard_disable(struct drm_panel *panel)
+{
+	struct device *dev = panel->dev;
+	struct jadard *jadard = panel_to_jadard(panel);
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_off(jadard->dsi);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to set display off: %d\n", ret);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(jadard->dsi);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to enter sleep mode: %d\n", ret);
+
+	return 0;
+}
+
+static int jadard_prepare(struct drm_panel *panel)
+{
+	struct jadard *jadard = panel_to_jadard(panel);
+	int ret;
+
+	ret = regulator_enable(jadard->vccio);
+	if (ret)
+		return ret;
+
+	ret = regulator_enable(jadard->vdd);
+	if (ret)
+		return ret;
+
+	gpiod_set_value(jadard->reset, 1);
+	msleep(5);
+
+	gpiod_set_value(jadard->reset, 0);
+	msleep(10);
+
+	gpiod_set_value(jadard->reset, 1);
+	msleep(120);
+
+	return 0;
+}
+
+static int jadard_unprepare(struct drm_panel *panel)
+{
+	struct jadard *jadard = panel_to_jadard(panel);
+
+	gpiod_set_value(jadard->reset, 1);
+	msleep(120);
+
+	regulator_disable(jadard->vdd);
+	regulator_disable(jadard->vccio);
+
+	return 0;
+}
+
+static int jadard_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
+{
+	struct jadard *jadard = panel_to_jadard(panel);
+	const struct drm_display_mode *desc_mode = &jadard->desc->mode;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, desc_mode);
+	if (!mode) {
+		DRM_DEV_ERROR(&jadard->dsi->dev, "failed to add mode %ux%ux@%u\n",
+			      desc_mode->hdisplay, desc_mode->vdisplay,
+			      drm_mode_vrefresh(desc_mode));
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+
+	return 1;
+}
+
+static const struct drm_panel_funcs jadard_funcs = {
+	.disable = jadard_disable,
+	.unprepare = jadard_unprepare,
+	.prepare = jadard_prepare,
+	.enable = jadard_enable,
+	.get_modes = jadard_get_modes,
+};
+
+static const struct jadard_init_cmd cz101b4001_init_cmds[] = {
+	_INIT_CMD_DELAY(10),
+
+	_INIT_CMD_DCS(0xE0, 0x00),
+	_INIT_CMD_DCS(0xE1, 0x93),
+	_INIT_CMD_DCS(0xE2, 0x65),
+	_INIT_CMD_DCS(0xE3, 0xF8),
+	_INIT_CMD_DCS(0x80, 0x03),
+	_INIT_CMD_DCS(0xE0, 0x01),
+	_INIT_CMD_DCS(0x00, 0x00),
+	_INIT_CMD_DCS(0x01, 0x3B),
+	_INIT_CMD_DCS(0x0C, 0x74),
+	_INIT_CMD_DCS(0x17, 0x00),
+	_INIT_CMD_DCS(0x18, 0xAF),
+	_INIT_CMD_DCS(0x19, 0x00),
+	_INIT_CMD_DCS(0x1A, 0x00),
+	_INIT_CMD_DCS(0x1B, 0xAF),
+	_INIT_CMD_DCS(0x1C, 0x00),
+	_INIT_CMD_DCS(0x35, 0x26),
+	_INIT_CMD_DCS(0x37, 0x09),
+	_INIT_CMD_DCS(0x38, 0x04),
+	_INIT_CMD_DCS(0x39, 0x00),
+	_INIT_CMD_DCS(0x3A, 0x01),
+	_INIT_CMD_DCS(0x3C, 0x78),
+	_INIT_CMD_DCS(0x3D, 0xFF),
+	_INIT_CMD_DCS(0x3E, 0xFF),
+	_INIT_CMD_DCS(0x3F, 0x7F),
+	_INIT_CMD_DCS(0x40, 0x06),
+	_INIT_CMD_DCS(0x41, 0xA0),
+	_INIT_CMD_DCS(0x42, 0x81),
+	_INIT_CMD_DCS(0x43, 0x14),
+	_INIT_CMD_DCS(0x44, 0x23),
+	_INIT_CMD_DCS(0x45, 0x28),
+	_INIT_CMD_DCS(0x55, 0x02),
+	_INIT_CMD_DCS(0x57, 0x69),
+	_INIT_CMD_DCS(0x59, 0x0A),
+	_INIT_CMD_DCS(0x5A, 0x2A),
+	_INIT_CMD_DCS(0x5B, 0x17),
+	_INIT_CMD_DCS(0x5D, 0x7F),
+	_INIT_CMD_DCS(0x5E, 0x6B),
+	_INIT_CMD_DCS(0x5F, 0x5C),
+	_INIT_CMD_DCS(0x60, 0x4F),
+	_INIT_CMD_DCS(0x61, 0x4D),
+	_INIT_CMD_DCS(0x62, 0x3F),
+	_INIT_CMD_DCS(0x63, 0x42),
+	_INIT_CMD_DCS(0x64, 0x2B),
+	_INIT_CMD_DCS(0x65, 0x44),
+	_INIT_CMD_DCS(0x66, 0x43),
+	_INIT_CMD_DCS(0x67, 0x43),
+	_INIT_CMD_DCS(0x68, 0x63),
+	_INIT_CMD_DCS(0x69, 0x52),
+	_INIT_CMD_DCS(0x6A, 0x5A),
+	_INIT_CMD_DCS(0x6B, 0x4F),
+	_INIT_CMD_DCS(0x6C, 0x4E),
+	_INIT_CMD_DCS(0x6D, 0x20),
+	_INIT_CMD_DCS(0x6E, 0x0F),
+	_INIT_CMD_DCS(0x6F, 0x00),
+	_INIT_CMD_DCS(0x70, 0x7F),
+	_INIT_CMD_DCS(0x71, 0x6B),
+	_INIT_CMD_DCS(0x72, 0x5C),
+	_INIT_CMD_DCS(0x73, 0x4F),
+	_INIT_CMD_DCS(0x74, 0x4D),
+	_INIT_CMD_DCS(0x75, 0x3F),
+	_INIT_CMD_DCS(0x76, 0x42),
+	_INIT_CMD_DCS(0x77, 0x2B),
+	_INIT_CMD_DCS(0x78, 0x44),
+	_INIT_CMD_DCS(0x79, 0x43),
+	_INIT_CMD_DCS(0x7A, 0x43),
+	_INIT_CMD_DCS(0x7B, 0x63),
+	_INIT_CMD_DCS(0x7C, 0x52),
+	_INIT_CMD_DCS(0x7D, 0x5A),
+	_INIT_CMD_DCS(0x7E, 0x4F),
+	_INIT_CMD_DCS(0x7F, 0x4E),
+	_INIT_CMD_DCS(0x80, 0x20),
+	_INIT_CMD_DCS(0x81, 0x0F),
+	_INIT_CMD_DCS(0x82, 0x00),
+	_INIT_CMD_DCS(0xE0, 0x02),
+	_INIT_CMD_DCS(0x00, 0x02),
+	_INIT_CMD_DCS(0x01, 0x02),
+	_INIT_CMD_DCS(0x02, 0x00),
+	_INIT_CMD_DCS(0x03, 0x00),
+	_INIT_CMD_DCS(0x04, 0x1E),
+	_INIT_CMD_DCS(0x05, 0x1E),
+	_INIT_CMD_DCS(0x06, 0x1F),
+	_INIT_CMD_DCS(0x07, 0x1F),
+	_INIT_CMD_DCS(0x08, 0x1F),
+	_INIT_CMD_DCS(0x09, 0x17),
+	_INIT_CMD_DCS(0x0A, 0x17),
+	_INIT_CMD_DCS(0x0B, 0x37),
+	_INIT_CMD_DCS(0x0C, 0x37),
+	_INIT_CMD_DCS(0x0D, 0x47),
+	_INIT_CMD_DCS(0x0E, 0x47),
+	_INIT_CMD_DCS(0x0F, 0x45),
+	_INIT_CMD_DCS(0x10, 0x45),
+	_INIT_CMD_DCS(0x11, 0x4B),
+	_INIT_CMD_DCS(0x12, 0x4B),
+	_INIT_CMD_DCS(0x13, 0x49),
+	_INIT_CMD_DCS(0x14, 0x49),
+	_INIT_CMD_DCS(0x15, 0x1F),
+	_INIT_CMD_DCS(0x16, 0x01),
+	_INIT_CMD_DCS(0x17, 0x01),
+	_INIT_CMD_DCS(0x18, 0x00),
+	_INIT_CMD_DCS(0x19, 0x00),
+	_INIT_CMD_DCS(0x1A, 0x1E),
+	_INIT_CMD_DCS(0x1B, 0x1E),
+	_INIT_CMD_DCS(0x1C, 0x1F),
+	_INIT_CMD_DCS(0x1D, 0x1F),
+	_INIT_CMD_DCS(0x1E, 0x1F),
+	_INIT_CMD_DCS(0x1F, 0x17),
+	_INIT_CMD_DCS(0x20, 0x17),
+	_INIT_CMD_DCS(0x21, 0x37),
+	_INIT_CMD_DCS(0x22, 0x37),
+	_INIT_CMD_DCS(0x23, 0x46),
+	_INIT_CMD_DCS(0x24, 0x46),
+	_INIT_CMD_DCS(0x25, 0x44),
+	_INIT_CMD_DCS(0x26, 0x44),
+	_INIT_CMD_DCS(0x27, 0x4A),
+	_INIT_CMD_DCS(0x28, 0x4A),
+	_INIT_CMD_DCS(0x29, 0x48),
+	_INIT_CMD_DCS(0x2A, 0x48),
+	_INIT_CMD_DCS(0x2B, 0x1F),
+	_INIT_CMD_DCS(0x2C, 0x01),
+	_INIT_CMD_DCS(0x2D, 0x01),
+	_INIT_CMD_DCS(0x2E, 0x00),
+	_INIT_CMD_DCS(0x2F, 0x00),
+	_INIT_CMD_DCS(0x30, 0x1F),
+	_INIT_CMD_DCS(0x31, 0x1F),
+	_INIT_CMD_DCS(0x32, 0x1E),
+	_INIT_CMD_DCS(0x33, 0x1E),
+	_INIT_CMD_DCS(0x34, 0x1F),
+	_INIT_CMD_DCS(0x35, 0x17),
+	_INIT_CMD_DCS(0x36, 0x17),
+	_INIT_CMD_DCS(0x37, 0x37),
+	_INIT_CMD_DCS(0x38, 0x37),
+	_INIT_CMD_DCS(0x39, 0x08),
+	_INIT_CMD_DCS(0x3A, 0x08),
+	_INIT_CMD_DCS(0x3B, 0x0A),
+	_INIT_CMD_DCS(0x3C, 0x0A),
+	_INIT_CMD_DCS(0x3D, 0x04),
+	_INIT_CMD_DCS(0x3E, 0x04),
+	_INIT_CMD_DCS(0x3F, 0x06),
+	_INIT_CMD_DCS(0x40, 0x06),
+	_INIT_CMD_DCS(0x41, 0x1F),
+	_INIT_CMD_DCS(0x42, 0x02),
+	_INIT_CMD_DCS(0x43, 0x02),
+	_INIT_CMD_DCS(0x44, 0x00),
+	_INIT_CMD_DCS(0x45, 0x00),
+	_INIT_CMD_DCS(0x46, 0x1F),
+	_INIT_CMD_DCS(0x47, 0x1F),
+	_INIT_CMD_DCS(0x48, 0x1E),
+	_INIT_CMD_DCS(0x49, 0x1E),
+	_INIT_CMD_DCS(0x4A, 0x1F),
+	_INIT_CMD_DCS(0x4B, 0x17),
+	_INIT_CMD_DCS(0x4C, 0x17),
+	_INIT_CMD_DCS(0x4D, 0x37),
+	_INIT_CMD_DCS(0x4E, 0x37),
+	_INIT_CMD_DCS(0x4F, 0x09),
+	_INIT_CMD_DCS(0x50, 0x09),
+	_INIT_CMD_DCS(0x51, 0x0B),
+	_INIT_CMD_DCS(0x52, 0x0B),
+	_INIT_CMD_DCS(0x53, 0x05),
+	_INIT_CMD_DCS(0x54, 0x05),
+	_INIT_CMD_DCS(0x55, 0x07),
+	_INIT_CMD_DCS(0x56, 0x07),
+	_INIT_CMD_DCS(0x57, 0x1F),
+	_INIT_CMD_DCS(0x58, 0x40),
+	_INIT_CMD_DCS(0x5B, 0x30),
+	_INIT_CMD_DCS(0x5C, 0x16),
+	_INIT_CMD_DCS(0x5D, 0x34),
+	_INIT_CMD_DCS(0x5E, 0x05),
+	_INIT_CMD_DCS(0x5F, 0x02),
+	_INIT_CMD_DCS(0x63, 0x00),
+	_INIT_CMD_DCS(0x64, 0x6A),
+	_INIT_CMD_DCS(0x67, 0x73),
+	_INIT_CMD_DCS(0x68, 0x1D),
+	_INIT_CMD_DCS(0x69, 0x08),
+	_INIT_CMD_DCS(0x6A, 0x6A),
+	_INIT_CMD_DCS(0x6B, 0x08),
+	_INIT_CMD_DCS(0x6C, 0x00),
+	_INIT_CMD_DCS(0x6D, 0x00),
+	_INIT_CMD_DCS(0x6E, 0x00),
+	_INIT_CMD_DCS(0x6F, 0x88),
+	_INIT_CMD_DCS(0x75, 0xFF),
+	_INIT_CMD_DCS(0x77, 0xDD),
+	_INIT_CMD_DCS(0x78, 0x3F),
+	_INIT_CMD_DCS(0x79, 0x15),
+	_INIT_CMD_DCS(0x7A, 0x17),
+	_INIT_CMD_DCS(0x7D, 0x14),
+	_INIT_CMD_DCS(0x7E, 0x82),
+	_INIT_CMD_DCS(0xE0, 0x04),
+	_INIT_CMD_DCS(0x00, 0x0E),
+	_INIT_CMD_DCS(0x02, 0xB3),
+	_INIT_CMD_DCS(0x09, 0x61),
+	_INIT_CMD_DCS(0x0E, 0x48),
+	_INIT_CMD_DCS(0xE0, 0x00),
+	_INIT_CMD_DCS(0xE6, 0x02),
+	_INIT_CMD_DCS(0xE7, 0x0C),
+
+	_INIT_CMD_DELAY(120),
+};
+
+static const struct jadard_panel_desc cz101b4001_desc = {
+	.mode = {
+		.clock		= 70000,
+
+		.hdisplay	= 800,
+		.hsync_start	= 800 + 40,
+		.hsync_end	= 800 + 40 + 18,
+		.htotal		= 800 + 40 + 18 + 20,
+
+		.vdisplay	= 1280,
+		.vsync_start	= 1280 + 20,
+		.vsync_end	= 1280 + 20 + 4,
+		.vtotal		= 1280 + 20 + 4 + 20,
+
+		.width_mm	= 62,
+		.height_mm	= 110,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_cmds = cz101b4001_init_cmds,
+	.num_init_cmds = ARRAY_SIZE(cz101b4001_init_cmds),
+};
+
+static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct jadard_panel_desc *desc;
+	struct jadard *jadard;
+	int ret;
+
+	jadard = devm_kzalloc(&dsi->dev, sizeof(*jadard), GFP_KERNEL);
+	if (!jadard)
+		return -ENOMEM;
+
+	desc = of_device_get_match_data(dev);
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_NO_EOT_PACKET;
+	dsi->format = desc->format;
+	dsi->lanes = desc->lanes;
+
+	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(jadard->reset)) {
+		DRM_DEV_ERROR(&dsi->dev, "failed to get our reset GPIO\n");
+		return PTR_ERR(jadard->reset);
+	}
+
+	jadard->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(jadard->vdd)) {
+		DRM_DEV_ERROR(&dsi->dev, "failed to get vdd regulator\n");
+		return PTR_ERR(jadard->vdd);
+	}
+
+	jadard->vccio = devm_regulator_get(dev, "vccio");
+	if (IS_ERR(jadard->vccio)) {
+		DRM_DEV_ERROR(&dsi->dev, "failed to get vccio regulator\n");
+		return PTR_ERR(jadard->vccio);
+	}
+
+	drm_panel_init(&jadard->panel, dev, &jadard_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&jadard->panel);
+	if (ret)
+		return ret;
+
+	drm_panel_add(&jadard->panel);
+
+	mipi_dsi_set_drvdata(dsi, jadard);
+	jadard->dsi = dsi;
+	jadard->desc = desc;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&jadard->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void jadard_dsi_remove(struct mipi_dsi_device *dsi)
+{
+	struct jadard *jadard = mipi_dsi_get_drvdata(dsi);
+
+	mipi_dsi_detach(dsi);
+	drm_panel_remove(&jadard->panel);
+}
+
+static const struct of_device_id jadard_of_match[] = {
+	{ .compatible = "chongzhou,cz101b4001", .data = &cz101b4001_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jadard_of_match);
+
+static struct mipi_dsi_driver jadard_driver = {
+	.probe = jadard_dsi_probe,
+	.remove = jadard_dsi_remove,
+	.driver = {
+		.name = "jadard-jd9365da",
+		.of_match_table = jadard_of_match,
+	},
+};
+module_mipi_dsi_driver(jadard_driver);
+
+MODULE_AUTHOR("Jagan Teki <jagan@edgeble.ai>");
+MODULE_AUTHOR("Stephen Chen <stephen@radxa.com>");
+MODULE_DESCRIPTION("Jadard JD9365DA-H3 WUXGA DSI panel");
+MODULE_LICENSE("GPL");
-- 
2.25.1

