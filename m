Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561C3BA6954
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 08:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E068210E1D9;
	Sun, 28 Sep 2025 06:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oo1R6ai3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E85B10E1D8
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 06:41:36 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-57b8fc6097fso4590820e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 23:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759041695; x=1759646495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFoMJ7zKVdrx9q8NkIV86n6GIggHo5/6uqUvCBf+0Sg=;
 b=Oo1R6ai3Q05XwnZzrjHZEsRXolMNbzw1v+9PaVeiqhckwJnyXHxCV6uF+XVk6HQkpC
 P1wQlqIlZoZfqqWeaZyuKUNc2OVq6nVU1WC392lZ8R6f7/IQ5SAhz5oiLqQIjyhQMMsM
 0ToKhUiIQ2cmAKmYUaPy41VGDaymQM2Ps2Pfggr+I5OrId7lYDkqvFwTkBmQXHVqnrDv
 0a8XEGXXg/8xOwX39Lk/SkqDFCOtMlt4m6yvIoN9HHylkTnWqTTdhL13UxP1TaRZK5OS
 N4uimbZbppQm9sdYybzjSrDAxxiSQ56BrRhU3XeIT7jP6MBtKK4xclwTz8XXYMUwzvBW
 vDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759041695; x=1759646495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HFoMJ7zKVdrx9q8NkIV86n6GIggHo5/6uqUvCBf+0Sg=;
 b=AbGIXQZ9B73VQw2Ooad+/b8unpFoziRmtPMgZz2Kp7PVlfhUImpvJehX8jlQsrD572
 l4U32iu2/G7v4wyx1ptDJveLqH4d5KdXEstZ/jH2bnb2cPDt5WYnRWlkFokXqPjnsZwd
 HY+Qb0wFtSmJu5Kd+OOPDY7lAPlOMVoc1NqKYsBwAfQhDVXui009O8S6++/YBDESs8Er
 YFrNUq6stABOtjsLFEdC2tIs4mdEr6snnyVWTSOo0wpYZ+kf2XdaP7HTM4udxCFg+74q
 BKScM8iYX4SjwIRGTDIyuGI8HT2B5gTKFh/iq8y9E02NHj6H4xwFjaNGvAgUZV+G0feO
 WddQ==
X-Gm-Message-State: AOJu0YyOHwpIGB9uRFUf6iG+NGs49RwHp0estBeUx2yscZHv7i22d1fe
 NCUWOjtAjAFJMYq8DDCldWY8RPoNxr+PG1wje1vuugstoswZt/qGB9ha
X-Gm-Gg: ASbGnctRMoKJJUjHzv87Ov1skF7c3rwTei4mpdCgoRs5VYBGeGFUGK7v7D6mR9Ox8NM
 noSzydLpohbri3vjsqZTWHW5hiMmXtinPZQTYvepMa2hvg3S7g/J6sy5Gg9KveGy7ppnf6MSpsN
 UdJdEjYCGy/E3J1Y2RnEGsdI6KmfRGu2bkEL6GXH+8IHsIHfB4zrZM/ktmxUKpglAighTDgonid
 mNKxJqruM5l1T37IpMh6wFG2hICC4NjN1PSDy06SP5sqQ0PVtllMdZT7Gg3bHVsgBByKo0xfEa+
 jT3kQVjZJwp+IrAWSzk3jn0UipFs1OISzpuJNLGDuU+VXaINUV/PCF/1+vNIs4uOHMHgb65QVR/
 xcSgsDi9WTGMBow==
X-Google-Smtp-Source: AGHT+IGa91/aFmoXW2OJTTO8hVbaUDD7wgYHGOYDpqONdGKaqXh01tTsybrN3e7+825SHTtutCkfJg==
X-Received: by 2002:a05:6512:3f28:b0:55f:4714:efe with SMTP id
 2adb3069b0e04-582d0c28f31mr3728882e87.23.1759041694573; 
 Sat, 27 Sep 2025 23:41:34 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58600043386sm973735e87.86.2025.09.27.23.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Sep 2025 23:41:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] gpu/drm: panel: Add Sharp LQ079L1SX01 panel support
Date: Sun, 28 Sep 2025 09:41:06 +0300
Message-ID: <20250928064106.46756-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250928064106.46756-1-clamor95@gmail.com>
References: <20250928064106.46756-1-clamor95@gmail.com>
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

This panel requires dual-channel mode. The device accepts video-mode data
on 8 lanes and will therefore need a dual-channel DSI controller. The two
interfaces that make up this device need to be instantiated in the
controllers that gang up to provide the dual-channel DSI host.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  15 ++
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-sharp-lq079l1sx01.c   | 223 ++++++++++++++++++
 3 files changed, 239 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 407c5f6a268b..56d9377934c4 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -888,6 +888,21 @@ config DRM_PANEL_SEIKO_43WVF1G
 	  Say Y here if you want to enable support for the Seiko
 	  43WVF1G controller for 800x480 LCD panels
 
+config DRM_PANEL_SHARP_LQ079L1SX01
+	tristate "Sharp LQ079L1SX01 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y here if you want to enable support for Sharp LQ079L1SX01
+	  TFT-LCD modules. The panel has a 1536x2048 resolution and uses
+	  24 bit RGB per pixel. It provides a dual MIPI DSI interface to
+	  the host.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called panel-sharp-lq079l1sx01.
+
 config DRM_PANEL_SHARP_LQ101R1SX01
 	tristate "Sharp LQ101R1SX01 panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 3615a761b44f..0356775a443a 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -91,6 +91,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) += panel-samsung-s6e8aa5x01-ams561ra01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
 obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
+obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) += panel-sharp-lq079l1sx01.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) += panel-sharp-ls037v7dw01.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) += panel-sharp-ls043t1le01.o
diff --git a/drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c
new file mode 100644
index 000000000000..c25698c74bcb
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016 XiaoMi, Inc.
+ * Copyright (c) 2024 Svyatoslav Ryhel <clamor95@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+static const struct regulator_bulk_data sharp_supplies[] = {
+	{ .supply = "avdd" }, { .supply = "vddio" },
+	{ .supply = "vsp" }, { .supply = "vsn" },
+};
+
+struct sharp_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi[2];
+
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+};
+
+static inline struct sharp_panel *to_sharp_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct sharp_panel, panel);
+}
+
+static void sharp_panel_reset(struct sharp_panel *sharp)
+{
+	gpiod_set_value_cansleep(sharp->reset_gpio, 1);
+	usleep_range(2000, 3000);
+	gpiod_set_value_cansleep(sharp->reset_gpio, 0);
+	usleep_range(2000, 3000);
+}
+
+static int sharp_panel_prepare(struct drm_panel *panel)
+{
+	struct sharp_panel *sharp = to_sharp_panel(panel);
+	struct device *dev = panel->dev;
+	struct mipi_dsi_device *dsi0 = sharp->dsi[0];
+	struct mipi_dsi_device *dsi1 = sharp->dsi[1];
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = NULL };
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(sharp_supplies), sharp->supplies);
+	if (ret) {
+		dev_err(dev, "error enabling regulators (%d)\n", ret);
+		return ret;
+	}
+
+	msleep(24);
+
+	if (sharp->reset_gpio)
+		sharp_panel_reset(sharp);
+
+	msleep(32);
+
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, MIPI_DCS_EXIT_SLEEP_MODE);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
+					  MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
+					  MIPI_DCS_WRITE_POWER_SAVE, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
+					  MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x2c);
+
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, MIPI_DCS_SET_DISPLAY_ON);
+
+	return 0;
+}
+
+static int sharp_panel_unprepare(struct drm_panel *panel)
+{
+	struct sharp_panel *sharp = to_sharp_panel(panel);
+	struct mipi_dsi_device *dsi0 = sharp->dsi[0];
+	struct mipi_dsi_device *dsi1 = sharp->dsi[1];
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = NULL };
+
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, MIPI_DCS_SET_DISPLAY_OFF);
+	mipi_dsi_msleep(&dsi_ctx, 100);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, MIPI_DCS_ENTER_SLEEP_MODE);
+	mipi_dsi_msleep(&dsi_ctx, 150);
+
+	if (sharp->reset_gpio)
+		gpiod_set_value_cansleep(sharp->reset_gpio, 1);
+
+	return regulator_bulk_disable(ARRAY_SIZE(sharp_supplies), sharp->supplies);
+}
+
+static const struct drm_display_mode default_mode = {
+	.clock = (1536 + 136 + 28 + 28) * (2048 + 14 + 8 + 2) * 60 / 1000,
+	.hdisplay = 1536,
+	.hsync_start = 1536 + 136,
+	.hsync_end = 1536 + 136 + 28,
+	.htotal = 1536 + 136 + 28 + 28,
+	.vdisplay = 2048,
+	.vsync_start = 2048 + 14,
+	.vsync_end = 2048 + 14 + 8,
+	.vtotal = 2048 + 14 + 8 + 2,
+	.width_mm = 120,
+	.height_mm = 160,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int sharp_panel_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &default_mode);
+}
+
+static const struct drm_panel_funcs sharp_panel_funcs = {
+	.prepare = sharp_panel_prepare,
+	.unprepare = sharp_panel_unprepare,
+	.get_modes = sharp_panel_get_modes,
+};
+
+static int sharp_panel_probe(struct mipi_dsi_device *dsi)
+{
+	const struct mipi_dsi_device_info info = { "sharp-link1", 0, NULL };
+	struct device *dev = &dsi->dev;
+	struct device_node *dsi_r;
+	struct mipi_dsi_host *dsi_r_host;
+	struct sharp_panel *sharp;
+	int i, ret;
+
+	sharp = devm_drm_panel_alloc(dev, struct sharp_panel, panel,
+				     &sharp_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(sharp))
+		return PTR_ERR(sharp);
+
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(sharp_supplies),
+					    sharp_supplies, &sharp->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get supplies\n");
+
+	sharp->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(sharp->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(sharp->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	/* Panel is always connected to two DSI hosts, DSI0 is left, DSI1 is right */
+	dsi_r = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
+	if (!dsi_r)
+		return dev_err_probe(dev, -ENODEV, "failed to find second DSI host node\n");
+
+	dsi_r_host = of_find_mipi_dsi_host_by_node(dsi_r);
+	of_node_put(dsi_r);
+	if (!dsi_r_host)
+		return dev_err_probe(dev, -EPROBE_DEFER, "cannot get secondary DSI host\n");
+
+	sharp->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi_r_host, &info);
+	if (IS_ERR(sharp->dsi[1]))
+		return dev_err_probe(dev, PTR_ERR(sharp->dsi[1]),
+				     "second link registration failed\n");
+
+	sharp->dsi[0] = dsi;
+	mipi_dsi_set_drvdata(dsi, sharp);
+
+	ret = drm_panel_of_backlight(&sharp->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&sharp->panel);
+
+	for (i = 0; i < ARRAY_SIZE(sharp->dsi); i++) {
+		if (!sharp->dsi[i])
+			continue;
+
+		sharp->dsi[i]->lanes = 4;
+		sharp->dsi[i]->format = MIPI_DSI_FMT_RGB888;
+		sharp->dsi[i]->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
+
+		ret = devm_mipi_dsi_attach(dev, sharp->dsi[i]);
+		if (ret < 0) {
+			drm_panel_remove(&sharp->panel);
+			return dev_err_probe(dev, ret, "failed to attach to DSI%d\n", i);
+		}
+	}
+
+	return 0;
+}
+
+static void sharp_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct sharp_panel *sharp = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&sharp->panel);
+}
+
+static const struct of_device_id sharp_of_match[] = {
+	{ .compatible = "sharp,lq079l1sx01" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sharp_of_match);
+
+static struct mipi_dsi_driver sharp_panel_driver = {
+	.driver = {
+		.name = "panel-sharp-lq079l1sx01",
+		.of_match_table = sharp_of_match,
+	},
+	.probe = sharp_panel_probe,
+	.remove = sharp_panel_remove,
+};
+module_mipi_dsi_driver(sharp_panel_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Sharp LQ079L1SX01 panel driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1

