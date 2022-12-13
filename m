Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F154164B159
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 09:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0510E0FC;
	Tue, 13 Dec 2022 08:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A88310E0FC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 08:42:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id co23so14839608wrb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 00:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8bWuYbccLYmlsDCbZTaH3xdKqDQ0uR+OEo7p2PSCMbQ=;
 b=fAlaFRtT6MWnwhv9oXNvcW49l6l2AAeXQQD1f8m6j2Uw1XOkadb49LfvoRScAZEIxi
 Y/zXMr/1XO2BD7VqKBvRoX8r4WDAxxImcDYjcW65HyhXmxrtlg8V6ESTfSqs2nVd5Tvt
 1uRkIL2PUoqYSEfWHAEng708s4ho9N17owb1a0v/W8e4qh4keiN4QWFjGFp3CBMmCpcV
 XC1GLySvD8yhkRsml7rPJvG48ng6OqcxrBvUx5c7wIj7LOnAtjWrToSwBCeHfkGWfrOc
 7ni1wCiy0Ha6fd7UQtbwip0IQ4/2fVyYTYfvJglkrO2FXhy0I5WJXaKtcnjo6y5SNI+K
 +4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8bWuYbccLYmlsDCbZTaH3xdKqDQ0uR+OEo7p2PSCMbQ=;
 b=4+Qvuf0FGyq4SChrpfaWOTH6NYWpsDuWu/LrYEXFdLidvnZRs855zsX3pgIyDA+vjI
 D61KQMDWXNI05aOEvLVrl/lE388XqmXWfmkpZ9kHOJsbP3ROmDZDpx72bDszCjvl5mnk
 KNXETrLn5g4JdaFPBbfNCEATkiImCr/nWCAnmo10/Suwh14ZO8xbzUxR8cKt+TDzp1rI
 fB0eEQxxboXK2kF2ezKwWXlhLHQ2oXLKrvnAIkXl4v4dezvVWA+X7FH/G2hHqX1DxhNc
 WsAwF5bU6Xln2N+JYkl5K4lAoCEEKrQOe0L3G74OObl374o2KAdM/haXQKt8/sp0m+mW
 104A==
X-Gm-Message-State: ANoB5pmWdMAqOFUSDZdfRMtfHhmgKTUUyhNEY9HqW+hW/kForC5AePHo
 aIh5y03PN9MY+Q+r82UyJdg=
X-Google-Smtp-Source: AA0mqf55eBdCHJzqMUM1TDF83vzjS4Mv/f5aTFQDk/5ZaEUvYM50Vuc/pSEaMWItdaS582K1KIFIfw==
X-Received: by 2002:adf:e685:0:b0:242:0:83ef with SMTP id
 r5-20020adfe685000000b00242000083efmr11484743wrm.51.1670920930394; 
 Tue, 13 Dec 2022 00:42:10 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-bc7c-15f1-6c3b-ad74.rev.sfr.net.
 [2a02:8428:46a0:7c01:bc7c:15f1:6c3b:ad74])
 by smtp.gmail.com with ESMTPSA id
 ay2-20020a5d6f02000000b002366e3f1497sm11474037wrb.6.2022.12.13.00.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 00:42:09 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net
Subject: [PATCH 1/2] drm/panel: add the orisetech ota5601a
Date: Tue, 13 Dec 2022 09:42:02 +0100
Message-Id: <20221213084203.17729-1-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
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

