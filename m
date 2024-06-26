Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B69D59183DE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6510E10E8DA;
	Wed, 26 Jun 2024 14:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EIhfiAYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C37710E8D7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:22:35 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4217926991fso57563475e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719411753; x=1720016553;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwpzrw+8a9jskXuzzJFLsA7zHzZayXfGDHG3CFsewrw=;
 b=EIhfiAYpRpeQrLyCQSWC3MvO9hfA5lsS0lVGsQv/9aD6fwV9E16dMfd7J/FMZe5llb
 xzOYEIAh2lghX7D34o4eJi2+z7oAtx/Ei7THoVGQyy/oeg78K2xoTy2QULsB/75QIvjo
 pZhJ1ePF2uCIGzvjZk8CDLVX7ivXA8xu7irC7+k9zOlDdmN57LqNU+jOVz3aSHR8ZRwu
 Bh8YN/tNo5e6PZ304h9REGx5xpYndQUuS3LwqQpS7XEzfHdZXaQKrDM47ZdtC8t+dgI3
 R5/Bs5CJGuZqrGGtlY5fnpCjFeDxZYMhGX6ovm4SzXvkfz4n0YBRI10lzUoikX8d8o0h
 W5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719411753; x=1720016553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwpzrw+8a9jskXuzzJFLsA7zHzZayXfGDHG3CFsewrw=;
 b=rDe0jM3i1/GMmSLmz6fFBwANoMXWYMzKvkEKEl7y7VrB+ai2eMEQAuXiykWMmC5zVk
 ZFA+ZYNCgjlHfbZAs83px6Jpvx8z1jsteEBhX1G5zlikcwTa6gbHHVLlqhTRAl15/Vh3
 FVSfqPtByEQoWPTOWjv+tJ9YrnZo3RnxpIN80KItYpACY0cQIul9/i9WjdXYmCLj0SZD
 tbj3T6dPt01eFZDbA7dQkgSs1fJ3jIE6PKxjTfkcBVuox4eB+3VmlwXQ/Ac3Wx9EtZJX
 WxfzYxkLiNg3EgTGjMufukbzlnMjvRTvf4MsMJ4xLDX8qJ6ywtaCb6kofhOLeOyw7FjS
 HXyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOC5+FjUiCItd5kWKnYSPjYX0Ecsav//pRlmxtcq4G4NYOx9i+eaIvAPRJFwewvUHpfkt28rS3v0L8jLsid2QvxSlu89T/izFQNFitIKLI
X-Gm-Message-State: AOJu0YwXUzmQORyhYL81tewXtydRKTqOYnTk59EI0vuL4zip7jPMhhxw
 wu+6UFFQXuCL1bwguwGfhwP05D3QhZb+kdR2xujp/IXd0/7P2fQPR/+UvcTe+Pc=
X-Google-Smtp-Source: AGHT+IG/zVNbdytUxpsnA6murZW7/z/3aHbXG+Dmjm/+e+zRYJz7j+BhZMDSlRfAtJ1/OJNNs+ud1Q==
X-Received: by 2002:a05:600c:3510:b0:424:76d7:2cca with SMTP id
 5b1f17b1804b1-4248b9363d3mr70141385e9.4.1719411753185; 
 Wed, 26 Jun 2024 07:22:33 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7be7:aef1:af9e:fff6])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-424c823c28asm27141105e9.5.2024.06.26.07.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 07:22:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 3/3] drm/panel: add lincolntech lcd197 support
Date: Wed, 26 Jun 2024 16:22:09 +0200
Message-ID: <20240626142212.1341556-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626142212.1341556-1-jbrunet@baylibre.com>
References: <20240626142212.1341556-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

Add support for the Lincoln Technologies LCD197 1080x1920 DSI panel.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-lincolntech-lcd197.c  | 262 ++++++++++++++++++
 3 files changed, 274 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index bf4eadfe21cb..30206be56f68 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -328,6 +328,17 @@ config DRM_PANEL_LEADTEK_LTK500HD1829
 	  24 bit RGB per pixel. It provides a MIPI DSI interface to
 	  the host and has a built-in LED backlight.
 
+config DRM_PANEL_LINCOLNTECH_LCD197
+	tristate "Lincoln Technologies lcd197 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for lincolntech lcd197
+	  TFT-LCD modules. The panel has a 1080x1920 resolution and uses
+	  24 bit RGB per pixel. It provides a MIPI DSI interface to
+	  the host.
+
 config DRM_PANEL_LG_LB035Q02
 	tristate "LG LB035Q024573 RGB panel"
 	depends on GPIOLIB && OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 051b75b3df7b..7706ff9087d8 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) += panel-khadas-ts050.o
 obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04) += panel-kingdisplay-kd097d04.o
 obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
 obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
+obj-$(CONFIG_DRM_PANEL_LINCOLNTECH_LCD197) += panel-lincolntech-lcd197.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
diff --git a/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c b/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
new file mode 100644
index 000000000000..032c542aab0f
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 BayLibre, SAS
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct lincoln_lcd197_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator *supply;
+	struct gpio_desc *enable_gpio;
+	struct gpio_desc *reset_gpio;
+};
+
+static inline
+struct lincoln_lcd197_panel *to_lincoln_lcd197_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct lincoln_lcd197_panel, panel);
+}
+
+static int lincoln_lcd197_panel_prepare(struct drm_panel *panel)
+{
+	struct lincoln_lcd197_panel *lcd = to_lincoln_lcd197_panel(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = lcd->dsi };
+	int err;
+
+	gpiod_set_value_cansleep(lcd->enable_gpio, 0);
+	err = regulator_enable(lcd->supply);
+	if (err < 0)
+		return err;
+
+	gpiod_set_value_cansleep(lcd->enable_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(lcd->reset_gpio, 1);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(lcd->reset_gpio, 0);
+	msleep(50);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9, 0xff, 0x83, 0x99);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd2, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0x02, 0x04, 0x70, 0x90, 0x01,
+			       0x32, 0x33, 0x11, 0x11, 0x4d, 0x57, 0x56, 0x73,
+			       0x02, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb2, 0x00, 0x80, 0x80, 0xae, 0x0a,
+			       0x0e, 0x75, 0x11, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb4, 0x00, 0xff, 0x04, 0xa4, 0x02,
+			       0xa0, 0x00, 0x00, 0x10, 0x00, 0x00, 0x02, 0x00,
+			       0x24, 0x02, 0x04, 0x0a, 0x21, 0x03, 0x00, 0x00,
+			       0x08, 0xa6, 0x88, 0x04, 0xa4, 0x02, 0xa0, 0x00,
+			       0x00, 0x10, 0x00, 0x00, 0x02, 0x00, 0x24, 0x02,
+			       0x04, 0x0a, 0x00, 0x00, 0x08, 0xa6, 0x00, 0x08,
+			       0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd3, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x18, 0x18, 0x32, 0x10, 0x09, 0x00, 0x09,
+			       0x32, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x11, 0x00, 0x02, 0x02, 0x03, 0x00,
+			       0x00, 0x00, 0x0a, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd5, 0x18, 0x18, 0x18, 0x18, 0x21,
+			       0x20, 0x18, 0x18, 0x19, 0x19, 0x19, 0x19, 0x18,
+			       0x18, 0x18, 0x18, 0x03, 0x02, 0x01, 0x00, 0x2f,
+			       0x2f, 0x30, 0x30, 0x31, 0x31, 0x18, 0x18, 0x18,
+			       0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd6, 0x18, 0x18, 0x18, 0x18, 0x20,
+			       0x21, 0x19, 0x19, 0x18, 0x18, 0x19, 0x19, 0x18,
+			       0x18, 0x18, 0x18, 0x00, 0x01, 0x02, 0x03, 0x2f,
+			       0x2f, 0x30, 0x30, 0x31, 0x31, 0x18, 0x18, 0x18,
+			       0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd8, 0x0a, 0xbe, 0xfa, 0xa0, 0x0a,
+			       0xbe, 0xfa, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd8, 0x0f, 0xff, 0xff, 0xe0, 0x0f,
+			       0xff, 0xff, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbd, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd8, 0x0f, 0xff, 0xff, 0xe0, 0x0f,
+			       0xff, 0xff, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe0, 0x01, 0x11, 0x1c, 0x17, 0x39,
+			       0x43, 0x54, 0x51, 0x5a, 0x64, 0x6c, 0x74, 0x7a,
+			       0x83, 0x8d, 0x92, 0x99, 0xa4, 0xa9, 0xb4, 0xaa,
+			       0xba, 0xbe, 0x63, 0x5e, 0x69, 0x73, 0x01, 0x11,
+			       0x1c, 0x17, 0x39, 0x43, 0x54, 0x51, 0x5a, 0x64,
+			       0x6c, 0x74, 0x7a, 0x83, 0x8d, 0x92, 0x99, 0xa4,
+			       0xa7, 0xb2, 0xa9, 0xba, 0xbe, 0x63, 0x5e, 0x69,
+			       0x73);
+	mipi_dsi_usleep_range(&ctx, 200, 300);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb6, 0x92, 0x92);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xcc, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbf, 0x40, 0x41, 0x50, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc6, 0xff, 0xf9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc0, 0x25, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x02);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 120);
+
+	if (ctx.accum_err) {
+		gpiod_set_value_cansleep(lcd->enable_gpio, 0);
+		gpiod_set_value_cansleep(lcd->reset_gpio, 1);
+		regulator_disable(lcd->supply);
+	}
+
+	return ctx.accum_err;
+}
+
+static int lincoln_lcd197_panel_unprepare(struct drm_panel *panel)
+{
+	struct lincoln_lcd197_panel *lcd = to_lincoln_lcd197_panel(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = lcd->dsi };
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+	mipi_dsi_usleep_range(&ctx, 5000, 6000);
+	gpiod_set_value_cansleep(lcd->enable_gpio, 0);
+	gpiod_set_value_cansleep(lcd->reset_gpio, 1);
+	regulator_disable(lcd->supply);
+
+	return ctx.accum_err;
+}
+
+static int lincoln_lcd197_panel_enable(struct drm_panel *panel)
+{
+	struct lincoln_lcd197_panel *lcd = to_lincoln_lcd197_panel(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = lcd->dsi };
+
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 20);
+
+	return ctx.accum_err;
+}
+
+static int lincoln_lcd197_panel_disable(struct drm_panel *panel)
+{
+	struct lincoln_lcd197_panel *lcd = to_lincoln_lcd197_panel(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = lcd->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 50);
+
+	return ctx.accum_err;
+}
+
+static const struct drm_display_mode lcd197_mode = {
+	.clock = 154002,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 20,
+	.hsync_end = 1080 + 20 + 6,
+	.htotal = 1080 + 204,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 4,
+	.vsync_end = 1920 + 4 + 4,
+	.vtotal = 1920 + 79,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.width_mm = 79,
+	.height_mm = 125,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int lincoln_lcd197_panel_get_modes(struct drm_panel *panel,
+					  struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &lcd197_mode);
+}
+
+static const struct drm_panel_funcs lincoln_lcd197_panel_funcs = {
+	.prepare = lincoln_lcd197_panel_prepare,
+	.unprepare = lincoln_lcd197_panel_unprepare,
+	.enable = lincoln_lcd197_panel_enable,
+	.disable = lincoln_lcd197_panel_disable,
+	.get_modes = lincoln_lcd197_panel_get_modes,
+};
+
+static int lincoln_lcd197_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct lincoln_lcd197_panel *lcd;
+	struct device *dev = &dsi->dev;
+	int err;
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = (MIPI_DSI_MODE_VIDEO |
+			   MIPI_DSI_MODE_VIDEO_BURST);
+
+	lcd = devm_kzalloc(&dsi->dev, sizeof(*lcd), GFP_KERNEL);
+	if (!lcd)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, lcd);
+	lcd->dsi = dsi;
+
+	lcd->supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(lcd->supply))
+		return dev_err_probe(dev, PTR_ERR(lcd->supply),
+				     "failed to get power supply");
+
+	lcd->enable_gpio = devm_gpiod_get(dev, "enable",
+					  GPIOD_OUT_HIGH);
+	if (IS_ERR(lcd->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(lcd->enable_gpio),
+				     "failed to get enable gpio");
+
+	lcd->reset_gpio = devm_gpiod_get(dev, "reset",
+					  GPIOD_OUT_HIGH);
+	if (IS_ERR(lcd->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(lcd->reset_gpio),
+				     "failed to get reset gpio");
+
+	drm_panel_init(&lcd->panel, dev,
+		       &lincoln_lcd197_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	err = drm_panel_of_backlight(&lcd->panel);
+	if (err)
+		return err;
+
+	drm_panel_add(&lcd->panel);
+	err = mipi_dsi_attach(dsi);
+	if (err)
+		drm_panel_remove(&lcd->panel);
+
+	return err;
+}
+
+static void lincoln_lcd197_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct lincoln_lcd197_panel *lcd = mipi_dsi_get_drvdata(dsi);
+	int err;
+
+	err = mipi_dsi_detach(dsi);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
+
+	drm_panel_remove(&lcd->panel);
+}
+
+static const struct of_device_id lincoln_lcd197_of_match[] = {
+	{ .compatible = "lincolntech,lcd197", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, lincoln_lcd197_of_match);
+
+static struct mipi_dsi_driver lincoln_lcd197_panel_driver = {
+	.driver = {
+		.name = "panel-lincolntech-lcd197",
+		.of_match_table = lincoln_lcd197_of_match,
+	},
+	.probe = lincoln_lcd197_panel_probe,
+	.remove = lincoln_lcd197_panel_remove,
+};
+module_mipi_dsi_driver(lincoln_lcd197_panel_driver);
+
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_DESCRIPTION("Lincoln Technologies LCD197 panel driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

