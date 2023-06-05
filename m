Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E33722B30
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 17:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D106210E2EA;
	Mon,  5 Jun 2023 15:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C650410E2E7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 15:36:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30aef0b8837so4106635f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 08:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685979361; x=1688571361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iw4xe2kZuG8KqvEJxQXTcri4Ji5XfjK24E1pZsxxYiU=;
 b=htbynRvdx0KS24iHolV77fkG72CAfj2K/pzhTTQ6ntuhd1Uh7FjcepaWXyUaRIPNbV
 guNHd0kDSUqpzyrvj8be8mAVz2mcM8up8B+lo0kPk4QXdvnBfcDxoRor+pbTxxtSwsgL
 L5j8OgGsjqPnxdiVYgGVKGBfCAFVPuMl1PlyJ/s7zqnQTsSkEiZhBaxH6d2rK/7VTlvA
 To5e/KXIGPbt/LPlLrFUA2QlF3XFCpXnfex/jD3qx5efrJCYSosaYJfzUQGdyYMA6jNL
 HHM/myP01wKtHHFGGnevY1MntgK5M7UmrYMs52Hs9SMGnFHBFA1WYn0mWfQSEEz1YgAw
 lLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685979361; x=1688571361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iw4xe2kZuG8KqvEJxQXTcri4Ji5XfjK24E1pZsxxYiU=;
 b=jT+F25IhUIgXQGVFcf7ce3gxEvjesyazSmJvTq3LO8IBqRkjwcjp3eCMYCJu9LcccX
 suaUr21oHjKdRI0p1l4Lq7exYc4clNrwhIF6AGrB0Mof+REydqClStzIVNJRS8GFQUx+
 wKEqAzejBEiWmKl53D/gDa8+Ic/DgQDZKRebo+WU8SSHVwCwNo+DyyS+SjZ16gfwXER2
 vAjt03sVFuky0Zh/khA9UM//mRipjdqpaCvE07FtaBV7TGJt9V11x2jZ0BZz9iMkJ+Fu
 ebCD9u6W6osE6S5Q3Jc9RypHXrKJ5DupLm2f0BYvC18uGH4vMW7ltZZGeVToF0dKnAGD
 SMHw==
X-Gm-Message-State: AC+VfDzJhPS2S06Z9+JQbmZKyJJb213BN/sRKtX/0qfOLpmRDlIlOmJM
 Xdte0YGBcosUcboeMM+DS5E=
X-Google-Smtp-Source: ACHHUZ6LeA4Eg0JCIdycgFa+g4J7jRITLW+i/a23M4q+ZNs3ud8QNT19zaDqRdynqiVwBHxSuNtGwQ==
X-Received: by 2002:adf:f68c:0:b0:30d:8490:58 with SMTP id
 v12-20020adff68c000000b0030d84900058mr4797459wrp.9.1685979360630; 
 Mon, 05 Jun 2023 08:36:00 -0700 (PDT)
Received: from fedora.. ([95.168.107.36]) by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003f7298a32ccsm9741165wma.41.2023.06.05.08.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 08:36:00 -0700 (PDT)
From: Paulo Pavacic <pavacic.p@gmail.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Subject: [PATCH v2 3/3] drm/panel-fannal-c3003: Add fannal c3004 DSI panel
Date: Mon,  5 Jun 2023 17:35:39 +0200
Message-Id: <20230605153539.497602-4-pavacic.p@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605153539.497602-1-pavacic.p@gmail.com>
References: <20230605153539.497602-1-pavacic.p@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paulo Pavacic <pavacic.p@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fannal C3004 is a 480x800 display made by fannal that requires
DCS initialization sequences.

Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
---
v3 changelog:
 - using generic mipi_dsi_dcs_write_seq
 - removed success prints
 - removed some comments
 - simplified code/removed support for different panels
 - changed namespace from fann to fannal
v2 changelog:
 - renamed from panel-mipi-dsi-bringup
 - only one MAINTAINER e-mail
---
 MAINTAINERS                                |   1 +
 drivers/gpu/drm/panel/Kconfig              |  11 +
 drivers/gpu/drm/panel/Makefile             |   1 +
 drivers/gpu/drm/panel/panel-fannal-c3004.c | 319 +++++++++++++++++++++
 4 files changed, 332 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-fannal-c3004.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 62374c8424b9..93fc1ae6832f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6432,6 +6432,7 @@ M:	Paulo Pavacic <pavacic.p@gmail.com>
 S:	Maintained
 C:	matrix:r/mipi-dsi-bringup:matrix.org
 F:	Documentation/devicetree/bindings/display/panel/panel-fannal,c3004.yaml
+F:	drivers/gpu/drm/panel/panel-fannal-c3004.c
 
 DRM DRIVER FOR FARADAY TVE200 TV ENCODER
 M:	Linus Walleij <linus.walleij@linaro.org>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 2b9d6db7860b..a1041c1e6bf6 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -144,6 +144,17 @@ config DRM_PANEL_ELIDA_KD35T133
 	  KD35T133 controller for 320x480 LCD panels with MIPI-DSI
 	  system interfaces.
 
+config DRM_PANEL_FANNAL_C3004
+	tristate "Fannal C3004 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y here if you want to enable support for the Fannal C3004
+	  2-lane 480x800 MIPI DSI panel which requires initialization
+	  sequence.
+
+	  If M is selected the module will be called panel-fannal-c3004.
+
 config DRM_PANEL_FEIXIN_K101_IM2BA02
 	tristate "Feixin K101 IM2BA02 panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index ff169781e82d..13c0f00038b5 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
 obj-$(CONFIG_DRM_PANEL_EDP) += panel-edp.o
 obj-$(CONFIG_DRM_PANEL_EBBG_FT8719) += panel-ebbg-ft8719.o
 obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
+obj-$(CONFIG_DRM_PANEL_FANNAL_C3004) += panel-fannal-c3004.o
 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
diff --git a/drivers/gpu/drm/panel/panel-fannal-c3004.c b/drivers/gpu/drm/panel/panel-fannal-c3004.c
new file mode 100644
index 000000000000..69bf648ad15f
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-fannal-c3004.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MIPI DSI driver for fannal C3004.
+ * Copyright (C) 2023, Zenitel
+ * Author: Paulo Pavacic <pavacic.p@gmail.com>
+ */
+
+// ↓ include headers, static values, static functions ↓
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+
+#include <video/mipi_display.h>
+#include <video/of_videomode.h>
+#include <video/videomode.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+
+struct fannal_panel_data {
+	struct drm_panel panel;
+	struct gpio_desc *reset;
+};
+
+static struct fannal_panel_data *
+get_fannal_panel_data_from_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct fannal_panel_data, panel);
+}
+
+static const u32 fannal_bus_formats[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+};
+
+// resolution 480p x 800p, 56mmx93mm
+static const struct drm_display_mode fannal_c3004_display_mode = {
+	.clock = 27000,
+	.hdisplay = 480, // display height pixels
+	.hsync_start = 480 + 30, // hdisplay + HBP
+	.hsync_end = 480 + 30 + 8, // hdisplay + HBP + HSync
+	.htotal = 480 + 30 + 8 + 30, // hdisplay + HBP + HSync + HFP
+	.vdisplay = 800, // display width pixels
+	.vsync_start = 800 + 20, // vdisplay + VBP
+	.vsync_end = 800 + 20 + 8, // vdisplay + VBP + VSync
+	.vtotal = 800 + 20 + 8 + 20, // vdisplay + VBP + VSync + VFP
+	.width_mm = 93,
+	.height_mm = 56,
+	.flags = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static void fannal_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct fannal_panel_data *panel_data = mipi_dsi_get_drvdata(dsi);
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret)
+		dev_err(dev, "error: disable: mipi detach (%d)\n", ret);
+
+	drm_panel_remove(&panel_data->panel);
+}
+
+static int fannal_panel_disable(struct drm_panel *panel)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(panel->dev);
+	struct device *dev = panel->dev;
+	int ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "error: disable: turn display OFF (%d)\n", ret);
+		return ret;
+	}
+
+	usleep_range(5000, 10000);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "error: disable: enter sleep mode (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int fannal_panel_unprepare(struct drm_panel *panel)
+{
+	struct fannal_panel_data *panel_data =
+		get_fannal_panel_data_from_panel(panel);
+
+	if (panel_data->reset) {
+		gpiod_set_value_cansleep(panel_data->reset, 1);
+		usleep_range(15000, 17000);
+		gpiod_set_value_cansleep(panel_data->reset, 0);
+	}
+
+	return 0;
+}
+
+static void fannal_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct fannal_panel_data *panel_data = mipi_dsi_get_drvdata(dsi);
+
+	fannal_panel_disable(&panel_data->panel);
+	fannal_panel_unprepare(&panel_data->panel);
+}
+
+static int fannal_panel_get_modes(struct drm_panel *panel,
+				  struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+	const struct drm_display_mode *panel_display_mode =
+		&fannal_c3004_display_mode;
+
+	mode = drm_mode_duplicate(connector->dev, &fannal_c3004_display_mode);
+	if (!mode) {
+		dev_err(panel->dev, "error: get_modes: add drm mode %ux%u@%u\n",
+			panel_display_mode->hdisplay,
+			panel_display_mode->vdisplay,
+			drm_mode_vrefresh(panel_display_mode));
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.bus_flags = DRM_BUS_FLAG_DE_LOW |
+					    DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE;
+
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 fannal_bus_formats,
+					 ARRAY_SIZE(fannal_bus_formats));
+	return 1;
+}
+
+static const struct of_device_id fannal_of_match[] = {
+	{ .compatible = "fannal,c3004" },
+	{ /* sentinel */ }
+};
+
+static int fannal_panel_enable(struct drm_panel *panel)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(panel->dev);
+
+	mipi_dsi_generic_write_seq(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x13);
+	mipi_dsi_generic_write_seq(dsi, 0xEF, 0x08);
+
+	mipi_dsi_generic_write_seq(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x10);
+	mipi_dsi_generic_write_seq(dsi, 0xC0, 0x63, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xC1, 0x0A, 0x0C);
+	mipi_dsi_generic_write_seq(dsi, 0xC2, 0x31, 0x08);
+	mipi_dsi_generic_write_seq(dsi, 0xCC, 0x18);
+
+	mipi_dsi_generic_write_seq(dsi, 0xB0, 0x00, 0x08, 0x10, 0x0E, 0x11,
+				   0x07, 0x08, 0x08, 0x08, 0x25, 0x04, 0x12,
+				   0x0F, 0x2C, 0x30, 0x1F);
+	mipi_dsi_generic_write_seq(dsi, 0xB1, 0x00, 0x11, 0x18, 0x0C, 0x10,
+				   0x05, 0x07, 0x09, 0x08, 0x24, 0x04, 0x11,
+				   0x10, 0x2B, 0x30, 0x1F);
+
+	mipi_dsi_generic_write_seq(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x11);
+	mipi_dsi_generic_write_seq(dsi, 0xB0, 0x4D);
+	mipi_dsi_generic_write_seq(dsi, 0xB1, 0x39);
+	mipi_dsi_generic_write_seq(dsi, 0xB2, 0x87);
+	mipi_dsi_generic_write_seq(dsi, 0xB3, 0x80);
+	mipi_dsi_generic_write_seq(dsi, 0xB5, 0x47);
+	mipi_dsi_generic_write_seq(dsi, 0xB7, 0x8A);
+	mipi_dsi_generic_write_seq(dsi, 0xB8, 0x20);
+	mipi_dsi_generic_write_seq(dsi, 0xB9, 0x10, 0x13);
+	mipi_dsi_generic_write_seq(dsi, 0xC1, 0x78);
+	mipi_dsi_generic_write_seq(dsi, 0xC2, 0x78);
+	mipi_dsi_generic_write_seq(dsi, 0xD0, 0x88);
+
+	//PANEL
+	mipi_dsi_generic_write_seq(dsi, 0xE0, 0x00, 0x00, 0x02);
+	mipi_dsi_generic_write_seq(dsi, 0xE1, 0x04, 0x00, 0x00, 0x00, 0x05,
+				   0x00, 0x00, 0x00, 0x00, 0x20, 0x20);
+	mipi_dsi_generic_write_seq(dsi, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00,
+				   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				   0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xE3, 0x00, 0x00, 0x33, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xE4, 0x22, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xE5, 0x04, 0x34, 0xAA, 0xAA, 0x06,
+				   0x34, 0xAA, 0xAA, 0x00, 0x00, 0x00, 0x00,
+				   0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xE6, 0x00, 0x00, 0x33, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xE7, 0x22, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xE8, 0x05, 0x34, 0xAA, 0xAA, 0x07,
+				   0x34, 0xAA, 0xAA, 0x00, 0x00, 0x00, 0x00,
+				   0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xEB, 0x02, 0x00, 0x40, 0x40, 0x00,
+				   0x00, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xEC, 0x00, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xED, 0xFA, 0x45, 0x0B, 0xFF, 0xFF,
+				   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
+				   0xFF, 0xB0, 0x54, 0xAF);
+	mipi_dsi_generic_write_seq(dsi, 0xEF, 0x10, 0x0D, 0x04, 0x08, 0x3F,
+				   0x1F);
+
+	mipi_dsi_generic_write_seq(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x13);
+	mipi_dsi_generic_write_seq(dsi, 0xE8, 0x00, 0x0E);
+
+	mipi_dsi_generic_write_seq(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0x11); //MIPI_DCS_EXIT_SLEEP_MODE
+
+	msleep(600);
+
+	mipi_dsi_generic_write_seq(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x13);
+	mipi_dsi_generic_write_seq(dsi, 0xE8, 0x00, 0x0C);
+	msleep(50);
+	mipi_dsi_generic_write_seq(dsi, 0xE8, 0x00, 0x00);
+
+	mipi_dsi_generic_write_seq(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0x29); //MIPI_DCS_SET_DISPLAY_ON
+	msleep(100);
+	return 0;
+}
+
+static int fannal_panel_prepare(struct drm_panel *panel)
+{
+	struct fannal_panel_data *panel_data =
+		get_fannal_panel_data_from_panel(panel);
+
+	/* At lest 10ms needed between power-on and reset-out as RM specifies */
+	usleep_range(10000, 12000);
+
+	if (panel_data->reset) {
+		gpiod_set_value_cansleep(panel_data->reset, 0);
+		/*
+		 * 50ms delay after reset-out, as per manufacturer initalization
+		 * sequence.
+		 */
+		msleep(50);
+	}
+
+	return 0;
+}
+
+static const struct drm_panel_funcs fannal_panel_funcs = {
+	.prepare = fannal_panel_prepare,
+	.unprepare = fannal_panel_unprepare,
+	.enable = fannal_panel_enable,
+	.disable = fannal_panel_disable,
+	.get_modes = fannal_panel_get_modes,
+};
+
+static int fannal_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct fannal_panel_data *panel_data;
+	int ret;
+
+	panel_data = devm_kzalloc(&dsi->dev, sizeof(*panel_data), GFP_KERNEL);
+
+	if (!panel_data)
+		return -ENOMEM;
+
+	panel_data->reset = devm_gpiod_get_optional(
+		dev, "reset", GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+
+	if (IS_ERR(panel_data->reset)) {
+		ret = PTR_ERR(panel_data->reset);
+		dev_err(dev,
+			"error: probe: get reset GPIO: (%d) Check the fdt\n",
+			ret);
+		return ret;
+	}
+
+	mipi_dsi_set_drvdata(dsi, panel_data);
+
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
+			  MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_HSE |
+			  MIPI_DSI_MODE_NO_EOT_PACKET |
+			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO;
+	dsi->lanes = 2;
+
+	gpiod_set_value_cansleep(panel_data->reset, 1);
+
+	drm_panel_init(&panel_data->panel, dev, &fannal_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	dev_set_drvdata(dev, panel_data);
+
+	drm_panel_add(&panel_data->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret) {
+		drm_panel_remove(&panel_data->panel);
+		dev_err(dev, "error: probe fail: can't attach mipi_dsi!\n");
+	}
+
+	return ret;
+}
+
+static struct mipi_dsi_driver fannal_panel_driver = {
+	.driver = {
+		.name = "panel-fannal-c3004",
+		.of_match_table = fannal_of_match,
+	},
+	.probe = fannal_panel_probe,
+	.remove = fannal_panel_remove,
+	.shutdown = fannal_panel_shutdown,
+};
+
+module_mipi_dsi_driver(fannal_panel_driver);
+
+MODULE_AUTHOR("Paulo Pavacic <pavacic.p@gmail.com>");
+MODULE_DESCRIPTION("fannal C3004 panel driver");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, fannal_of_match);
-- 
2.40.1

