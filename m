Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE89D64C79C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 12:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931C410E3AA;
	Wed, 14 Dec 2022 11:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F43210E05E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 11:00:52 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h7so18874188wrs.6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 03:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8bWuYbccLYmlsDCbZTaH3xdKqDQ0uR+OEo7p2PSCMbQ=;
 b=oN3w0I2bk93R5ECyRPURXl4IDTqrrZMgcPk+c9G6phIU2yuf9H4Uv/TCM/KbzRuW9o
 xuna75vjt6w+OEv60Qkn4450hcUgUqOXyrstiqv9MsHDEj6dCufFwVlzB/OFU3iV2cuM
 UbyEK+OvdUgHLXdc4n4+fsG2V0c6Y/wF6Cd+arWWlgD92wFwEIgO7i+tmjzKjiCdnhzX
 dc+4LpjyqVgvEm4AJpUZ5Pd4y9fe5g3Z/PRQMNRlYxEqcXcBPZbrU0LFRGGOX5RHXEIt
 hhTGthv2uEh8er357yWVZpTzE07jySVlocgm+EEFcKoTw9sVuTwsX22MVbVDpSIQc42z
 q8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bWuYbccLYmlsDCbZTaH3xdKqDQ0uR+OEo7p2PSCMbQ=;
 b=xJTqfoqJmlYCeYFUPW5I2W0+lDGGQM7vaHVqh3EiB1FIKOgwHbhTtuaHqPnUzeurcd
 0Eeu98BHKGc+X5UVq5xuru3Oou8pE587Qg+pQ2tTYIQ/CF4mOv9clasnYDVlesQMweTX
 aW3ezZyPVHeHzPN+b7W76EEfNP2Fa7lR1A1yXMPc62AGFyaOVjitBKtWW4f59B4CWKjG
 HpZZu11v8bGWMJk4DNsFM56UkQ8ARq0T9HTQqrAo6RzXn90XQfDizJSbP9kT7EPHhCw1
 4C6TZewEqDlNJ3xP3chxR6xoLkz7x4ExRF9MLPngaDChiDLP7iwQg63jSRpl4DQ2WL0w
 p/Wg==
X-Gm-Message-State: ANoB5plew5VM848Z3UyBriDfqdoMMvQfKz1LZkbNkxDAD7NvEdeiKtHG
 LhSj7z08iCA2G/r84dAb/ow=
X-Google-Smtp-Source: AA0mqf4fDa95aULXawsKqT1SKBgAy/p3IaxzRBOJtO1UUceZ7KPiYNq/Kj7zzXOYoCmB6O9yxJcXvg==
X-Received: by 2002:a05:6000:1a4f:b0:242:30c8:c368 with SMTP id
 t15-20020a0560001a4f00b0024230c8c368mr16073608wry.14.1671015650721; 
 Wed, 14 Dec 2022 03:00:50 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-bc7c-15f1-6c3b-ad74.rev.sfr.net.
 [2a02:8428:46a0:7c01:bc7c:15f1:6c3b:ad74])
 by smtp.gmail.com with ESMTPSA id
 h1-20020adfaa81000000b002366c3eefccsm2462096wrc.109.2022.12.14.03.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 03:00:50 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/panel: add the orisetech ota5601a
Date: Wed, 14 Dec 2022 12:00:36 +0100
Message-Id: <20221214110037.149387-2-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221214110037.149387-1-cbranchereau@gmail.com>
References: <20221214110037.149387-1-cbranchereau@gmail.com>
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
Cc: Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the orisetech ota5601a ic driver

For now it only supports the focaltech gpt3 3" 640x480 ips panel
found in the ylm rg300x handheld.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-orisetech-ota5601a.c  | 351 ++++++++++++++++++
 3 files changed, 361 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a582ddd583c2..2f492e402cd1 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -381,6 +381,15 @@ config DRM_PANEL_OLIMEX_LCD_OLINUXINO
 	  Say Y here if you want to enable support for Olimex Ltd.
 	  LCD-OLinuXino panel.
 
+config DRM_PANEL_ORISETECH_OTA5601A
+	tristate "Orise Technology ota5601a RGB/SPI panel"
+	depends on OF && SPI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select REGMAP_SPI
+	help
+	  Say Y here if you want to enable support for the panels built
+	  around the Orise Technology OTA9601A display controller.
+
 config DRM_PANEL_ORISETECH_OTM8009A
 	tristate "Orise Technology otm8009a 480x800 dsi 2dl panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 34e717382dbb..91d1870312af 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
 obj-$(CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO) += panel-olimex-lcd-olinuxino.o
+obj-$(CONFIG_DRM_PANEL_ORISETECH_OTA5601A) += panel-orisetech-ota5601a.o
 obj-$(CONFIG_DRM_PANEL_ORISETECH_OTM8009A) += panel-orisetech-otm8009a.o
 obj-$(CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS) += panel-osd-osd101t2587-53ts.o
 obj-$(CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00) += panel-panasonic-vvx10f034n00.o
diff --git a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
new file mode 100644
index 000000000000..018fea7c6354
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Orisetech OTA5601A TFT LCD panel driver
+ *
+ * Copyright (C) 2021, Christophe Branchereau <cbranchereau@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct ota5601a_panel_info {
+	const struct drm_display_mode *display_modes;
+	unsigned int num_modes;
+	u16 width_mm, height_mm;
+	u32 bus_format, bus_flags;
+};
+
+struct ota5601a {
+	struct drm_panel drm_panel;
+	struct regmap *map;
+	struct regulator *supply;
+	const struct ota5601a_panel_info *panel_info;
+
+	struct gpio_desc *reset_gpio;
+};
+
+static inline struct ota5601a *to_ota5601a(struct drm_panel *panel)
+{
+	return container_of(panel, struct ota5601a, drm_panel);
+}
+
+static const struct reg_sequence ota5601a_panel_regs[] = {
+	{ 0xfd, 0x00 },
+	{ 0x02, 0x00 },
+
+	{ 0x18, 0x00 },
+	{ 0x34, 0x20 },
+
+	{ 0x0c, 0x01 },
+	{ 0x0d, 0x48 },
+	{ 0x0e, 0x48 },
+	{ 0x0f, 0x48 },
+	{ 0x07, 0x40 },
+	{ 0x08, 0x33 },
+	{ 0x09, 0x3a },
+
+	{ 0x16, 0x01 },
+	{ 0x19, 0x8d },
+	{ 0x1a, 0x28 },
+	{ 0x1c, 0x00 },
+
+	{ 0xfd, 0xc5 },
+	{ 0x82, 0x0c },
+	{ 0xa2, 0xb4 },
+
+	{ 0xfd, 0xc4 },
+	{ 0x82, 0x45 },
+
+	{ 0xfd, 0xc1 },
+	{ 0x91, 0x02 },
+
+	{ 0xfd, 0xc0 },
+	{ 0xa1, 0x01 },
+	{ 0xa2, 0x1f },
+	{ 0xa3, 0x0b },
+	{ 0xa4, 0x38 },
+	{ 0xa5, 0x00 },
+	{ 0xa6, 0x0a },
+	{ 0xa7, 0x38 },
+	{ 0xa8, 0x00 },
+	{ 0xa9, 0x0a },
+	{ 0xaa, 0x37 },
+
+	{ 0xfd, 0xce },
+	{ 0x81, 0x18 },
+	{ 0x82, 0x43 },
+	{ 0x83, 0x43 },
+	{ 0x91, 0x06 },
+	{ 0x93, 0x38 },
+	{ 0x94, 0x02 },
+	{ 0x95, 0x06 },
+	{ 0x97, 0x38 },
+	{ 0x98, 0x02 },
+	{ 0x99, 0x06 },
+	{ 0x9b, 0x38 },
+	{ 0x9c, 0x02 },
+
+	{ 0xfd, 0x00 },
+};
+
+static const struct regmap_config ota5601a_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int ota5601a_prepare(struct drm_panel *drm_panel)
+{
+	struct ota5601a *panel = to_ota5601a(drm_panel);
+	int err;
+
+	err = regulator_enable(panel->supply);
+	if (err) {
+		dev_err(drm_panel->dev, "Failed to enable power supply: %d\n", err);
+		return err;
+	}
+
+	/* Reset to be held low for 10us min according to the doc, 10ms before sending commands */
+	gpiod_set_value_cansleep(panel->reset_gpio, 1);
+	usleep_range(10, 30);
+	gpiod_set_value_cansleep(panel->reset_gpio, 0);
+	usleep_range(10000, 20000);
+
+	/* Init all registers. */
+	err = regmap_multi_reg_write(panel->map, ota5601a_panel_regs,
+				     ARRAY_SIZE(ota5601a_panel_regs));
+	if (err) {
+		dev_err(drm_panel->dev, "Failed to init registers: %d\n", err);
+		goto err_disable_regulator;
+	}
+
+	msleep(120);
+
+	return 0;
+
+err_disable_regulator:
+	regulator_disable(panel->supply);
+	return err;
+}
+
+static int ota5601a_unprepare(struct drm_panel *drm_panel)
+{
+	struct ota5601a *panel = to_ota5601a(drm_panel);
+
+	gpiod_set_value_cansleep(panel->reset_gpio, 1);
+
+	regulator_disable(panel->supply);
+
+	return 0;
+}
+
+static int ota5601a_enable(struct drm_panel *drm_panel)
+{
+	struct ota5601a *panel = to_ota5601a(drm_panel);
+	int err;
+
+	err = regmap_write(panel->map, 0x01, 0x01);
+
+	if (err) {
+		dev_err(drm_panel->dev, "Unable to enable panel: %d\n", err);
+		return err;
+	}
+
+	if (drm_panel->backlight) {
+		/* Wait for the picture to be ready before enabling backlight */
+		msleep(120);
+	}
+
+	return 0;
+}
+
+static int ota5601a_disable(struct drm_panel *drm_panel)
+{
+	struct ota5601a *panel = to_ota5601a(drm_panel);
+	int err;
+
+	err = regmap_write(panel->map, 0x01, 0x00);
+
+	if (err) {
+		dev_err(drm_panel->dev, "Unable to disable panel: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int ota5601a_get_modes(struct drm_panel *drm_panel,
+			     struct drm_connector *connector)
+{
+	struct ota5601a *panel = to_ota5601a(drm_panel);
+	const struct ota5601a_panel_info *panel_info = panel->panel_info;
+	struct drm_display_mode *mode;
+	unsigned int i;
+
+	for (i = 0; i < panel_info->num_modes; i++) {
+		mode = drm_mode_duplicate(connector->dev,
+					  &panel_info->display_modes[i]);
+		if (!mode)
+			return -ENOMEM;
+
+		drm_mode_set_name(mode);
+
+		mode->type = DRM_MODE_TYPE_DRIVER;
+		if (panel_info->num_modes == 1)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_probed_add(connector, mode);
+	}
+
+	connector->display_info.bpc = 8;
+	connector->display_info.width_mm = panel_info->width_mm;
+	connector->display_info.height_mm = panel_info->height_mm;
+
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &panel_info->bus_format, 1);
+	connector->display_info.bus_flags = panel_info->bus_flags;
+
+	return panel_info->num_modes;
+}
+
+static const struct drm_panel_funcs ota5601a_funcs = {
+	.prepare	= ota5601a_prepare,
+	.unprepare	= ota5601a_unprepare,
+	.enable		= ota5601a_enable,
+	.disable	= ota5601a_disable,
+	.get_modes	= ota5601a_get_modes,
+};
+
+static int ota5601a_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct ota5601a *panel;
+	int err;
+
+	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
+	if (!panel)
+		return -ENOMEM;
+
+	spi_set_drvdata(spi, panel);
+
+	panel->panel_info = of_device_get_match_data(dev);
+	if (!panel->panel_info)
+		return -EINVAL;
+
+	panel->supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(panel->supply)) {
+		dev_err(dev, "Failed to get power supply\n");
+		return PTR_ERR(panel->supply);
+	}
+
+	panel->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(panel->reset_gpio)) {
+		dev_err(dev, "Failed to get reset GPIO\n");
+		return PTR_ERR(panel->reset_gpio);
+	}
+
+	spi->bits_per_word = 8;
+	spi->mode = SPI_MODE_3 | SPI_3WIRE;
+	err = spi_setup(spi);
+	if (err) {
+		dev_err(dev, "Failed to setup SPI\n");
+		return err;
+	}
+
+	panel->map = devm_regmap_init_spi(spi, &ota5601a_regmap_config);
+	if (IS_ERR(panel->map)) {
+		dev_err(dev, "Failed to init regmap\n");
+		return PTR_ERR(panel->map);
+	}
+
+	drm_panel_init(&panel->drm_panel, dev, &ota5601a_funcs,
+		       DRM_MODE_CONNECTOR_DPI);
+
+	err = drm_panel_of_backlight(&panel->drm_panel);
+	if (err) {
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get backlight handle\n");
+		return err;
+	}
+
+	drm_panel_add(&panel->drm_panel);
+
+	return 0;
+}
+
+static void ota5601a_remove(struct spi_device *spi)
+{
+	struct ota5601a *panel = spi_get_drvdata(spi);
+
+	drm_panel_remove(&panel->drm_panel);
+
+	ota5601a_disable(&panel->drm_panel);
+	ota5601a_unprepare(&panel->drm_panel);
+}
+
+static const struct drm_display_mode gpt3_display_modes[] = {
+	{ /* 60 Hz */
+		.clock = 27000,
+		.hdisplay = 640,
+		.hsync_start = 640 + 220,
+		.hsync_end = 640 + 220 + 20,
+		.htotal = 640 + 220 + 20 + 20,
+		.vdisplay = 480,
+		.vsync_start = 480 + 7,
+		.vsync_end = 480 + 7 + 6,
+		.vtotal = 480 + 7 + 6 + 7,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+
+	{ /* 50 Hz */
+		.clock = 24000,
+		.hdisplay = 640,
+		.hsync_start = 640 + 280,
+		.hsync_end = 640 + 280 + 20,
+		.htotal = 640 + 280 + 20 + 20,
+		.vdisplay = 480,
+		.vsync_start = 480 + 7,
+		.vsync_end = 480 + 7 + 6,
+		.vtotal = 480 + 7 + 6 + 7,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+};
+
+static const struct ota5601a_panel_info gpt3_info = {
+	.display_modes = gpt3_display_modes,
+	.num_modes = ARRAY_SIZE(gpt3_display_modes),
+	.width_mm = 71,
+	.height_mm = 51,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+};
+
+static const struct of_device_id ota5601a_of_match[] = {
+	{ .compatible = "focaltech,gpt3", .data = &gpt3_info },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ota5601a_of_match);
+
+static struct spi_driver ota5601a_driver = {
+	.driver = {
+		.name = "ota5601a",
+		.of_match_table = ota5601a_of_match,
+	},
+	.probe = ota5601a_probe,
+	.remove = ota5601a_remove,
+};
+
+module_spi_driver(ota5601a_driver);
+
+MODULE_AUTHOR("Christophe Branchereau <cbranchereau@gmail.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.35.1

