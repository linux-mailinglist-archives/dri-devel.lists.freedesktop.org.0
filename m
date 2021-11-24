Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7681845CAFF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 18:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456DE6E89B;
	Wed, 24 Nov 2021 17:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609BC6E89B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 17:26:16 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id r5so2769802pgi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 09:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iqx50NiQ6zUG2/ME5zPETyacKkjeSFUlsnvIyBUr+9A=;
 b=NHkn+Ri0zXnB/SpJtBWpMPqnCTtbZr81RNF+IWcOv2+FemcgOv0muLKTKeEN2DMXIn
 TwFIVnvVqkXu/k33Vb/NxAwPkl/ab9F1jQm4MEHtATYBQXUPr6kGlt1rFm9V9lMwbjha
 asg7BtF6bXHIGy1AtqirSTWQf/PbeVH/SDa2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iqx50NiQ6zUG2/ME5zPETyacKkjeSFUlsnvIyBUr+9A=;
 b=VaB3gZdHbG5r8/I5VC2A9rEkLzSAFiVUJSEojsKJGay03ItRrGUq4GQhJUzuzkoPHl
 6JlwXZiblN2lLnN+Z5Ww5nv/032g375TUYObFvMX1lSB7CpapYwmohemTVAskWiEkhmj
 bucwoUOoAovRYLTSQR7+hUZIynKwKSWSQo0424Xv/E0DHYGpF9r0a/FrcL3sGWvXaqT6
 5IVnUo+iBErNaoMQZsTxNBD5AQCIhBqbTVEIS445mH5Ht0scSzvPUrejXoQg7VUm66r4
 xiQwgtrHSONRwhfFuva0o4X/SpLSZn0Sy7tGLRyek6XnTaCazmz+jzctadBnJpUbctus
 /SmA==
X-Gm-Message-State: AOAM533FdCZBOzAu8LoqQJTnr94I1/XLPSpUqARDHXDpqULouBxnlQ7d
 C3tQ44ULzWualcDbla2Vgq8X/U8a0vEQOENM
X-Google-Smtp-Source: ABdhPJzmM0rL8x2IbCHkEjFDVyYNphub3dXGVdh3wHoVZs20divy+IPaKcLoB9dKSADG4gC8GvYoYQ==
X-Received: by 2002:a05:6a00:13a5:b0:4a4:cfb3:8284 with SMTP id
 t37-20020a056a0013a500b004a4cfb38284mr7843318pfg.10.1637774775927; 
 Wed, 24 Nov 2021 09:26:15 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:d111:e958:d982:546e])
 by smtp.gmail.com with ESMTPSA id s19sm334618pfu.104.2021.11.24.09.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 09:26:15 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/2] drm: bridge: Add TI DLPC3433
Date: Wed, 24 Nov 2021 22:55:53 +0530
Message-Id: <20211124172553.519309-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124172553.519309-1-jagan@amarulasolutions.com>
References: <20211124172553.519309-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Christopher Vollo <chris@renewoutreach.org>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TI DLPC3433 is a MIPI DSI based display controller bridge
for processing high resolution DMD based projectors.

It has a flexible configuration of MIPI DSI signal input
produces RGB565, RGB666, RGB888 output format with maximum
of 720p resolution.

Add bridge driver for it.

Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 MAINTAINERS                          |   1 +
 drivers/gpu/drm/bridge/Kconfig       |  13 +
 drivers/gpu/drm/bridge/Makefile      |   1 +
 drivers/gpu/drm/bridge/ti-dlpc3433.c | 386 +++++++++++++++++++++++++++
 4 files changed, 401 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/ti-dlpc3433.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a3019399dec0..36a63b4f96c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6203,6 +6203,7 @@ M:	Jagan Teki <jagan@amarulasolutions.com>
 M:	Christopher Vollo <chris@renewoutreach.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
+F:	drivers/gpu/drm/bridge/ti-dlpc3433.c
 
 DRM DRIVER FOR TPO TPG110 PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 61db5a66b493..5fc51e537829 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -279,6 +279,19 @@ config DRM_TOSHIBA_TC358775
 	help
 	  Toshiba TC358775 DSI/LVDS bridge chip driver.
 
+config DRM_TI_DLPC3433
+	tristate "TI DLPC3433 Display controller"
+	depends on DRM && DRM_PANEL
+	depends on OF
+	select DRM_MIPI_DSI
+	help
+	  TI DLPC3433 is a MIPI DSI based display controller bridge
+	  for processing high resolution DMD based projectors.
+
+	  It has a flexible configuration of MIPI DSI signal input
+	  produces RGB565, RGB666, RGB888 output format with maximum
+	  of 720p resolution in 60 and 120 Hz refresh rates.
+
 config DRM_TI_TFP410
 	tristate "TI TFP410 DVI/HDMI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index f2c73683cfcb..7ff4bf27e6b5 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358768) += tc358768.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358775) += tc358775.o
 obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
+obj-$(CONFIG_DRM_TI_DLPC3433) += ti-dlpc3433.o
 obj-$(CONFIG_DRM_TI_SN65DSI83) += ti-sn65dsi83.o
 obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
 obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
new file mode 100644
index 000000000000..557fa832a2fd
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2021 RenewOutReach
+ * Copyright (C) 2021 Amarula Solutions(India)
+ *
+ * Author:
+ * Jagan Teki <jagan@amarulasolutions.com>
+ * Christopher Vollo <chris@renewoutreach.org>
+ */
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+#include <drm/drm_mipi_dsi.h>
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+enum cmd_registers {
+	WR_INPUT_SOURCE		= 0x05,	/* Write Input Source Select */
+	WR_EXT_SOURCE_FMT	= 0x07, /* Write External Video Source Format */
+	WR_IMAGE_CROP		= 0x10,	/* Write Image Crop */
+	WR_DISPLAY_SIZE		= 0x12,	/* Write Display Size */
+	WR_IMAGE_FREEZE		= 0x1A,	/* Write Image Freeze */
+	WR_INPUT_IMAGE_SIZE	= 0x2E,	/* Write External Input Image Size */
+	WR_RGB_LED_EN		= 0x52,	/* Write RGB LED Enable */
+	WR_RGB_LED_CURRENT	= 0x54,	/* Write RGB LED Current */
+	WR_RGB_LED_MAX_CURRENT	= 0x5C,	/* Write RGB LED Max Current */
+	WR_DSI_HS_CLK		= 0xBD,	/* Write DSI HS Clock */
+	RD_DEVICE_ID		= 0xD4,	/* Read Controller Device ID */
+	WR_DSI_PORT_EN		= 0xD7,	/* Write DSI Port Enable */
+};
+
+enum dev_id {
+	DLPC3430		= 0x0,
+	DLPC3433,
+};
+
+enum input_source {
+	INPUT_EXTERNAL_VIDEO	= 0,
+	INPUT_TEST_PATTERN,
+	INPUT_SPLASH_SCREEN,
+};
+
+#define DEV_ID_MASK		GENMASK(3, 0)
+#define IMAGE_FREESE_EN		BIT(0)
+#define DSI_PORT_EN		0
+#define EXT_SOURCE_FMT_DSI	0
+#define RED_LED_EN		BIT(0)
+#define GREEN_LED_EN		BIT(1)
+#define BLUE_LED_EN		BIT(2)
+#define LED_MASK		GENMASK(2, 0)
+#define MAX_BYTE_SIZE		8
+
+struct dlpc {
+	struct device		*dev;
+	struct drm_bridge	bridge;
+	struct drm_bridge	*panel_bridge;
+	struct device_node	*host_node;
+	struct mipi_dsi_device	*dsi;
+	struct drm_display_mode	mode;
+
+	struct gpio_desc	*enable_gpio;
+	struct regulator	*vcc_intf;
+	struct regulator	*vcc_flsh;
+	struct regmap		*regmap;
+	unsigned int		dsi_lanes;
+};
+
+static inline struct dlpc *bridge_to_dlpc(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct dlpc, bridge);
+}
+
+static bool dlpc_writeable_noinc_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case WR_IMAGE_CROP:
+	case WR_DISPLAY_SIZE:
+	case WR_INPUT_IMAGE_SIZE:
+	case WR_DSI_HS_CLK:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_range dlpc_volatile_ranges[] = {
+	{ .range_min = 0x10, .range_max = 0xBF },
+};
+
+static const struct regmap_access_table dlpc_volatile_table = {
+	.yes_ranges = dlpc_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dlpc_volatile_ranges),
+};
+
+static struct regmap_config dlpc_regmap_config = {
+	.reg_bits		= 8,
+	.val_bits		= 8,
+	.max_register		= WR_DSI_PORT_EN,
+	.writeable_noinc_reg	= dlpc_writeable_noinc_reg,
+	.volatile_table		= &dlpc_volatile_table,
+	.cache_type		= REGCACHE_RBTREE,
+	.name			= "dlpc3433",
+};
+
+static void dlpc_atomic_enable(struct drm_bridge *bridge,
+			       struct drm_bridge_state *old_bridge_state)
+{
+	struct dlpc *dlpc = bridge_to_dlpc(bridge);
+	struct drm_display_mode *mode = &dlpc->mode;
+	struct regmap *regmap = dlpc->regmap;
+	char buf[MAX_BYTE_SIZE];
+	unsigned int devid;
+
+	regmap_read(regmap, RD_DEVICE_ID, &devid);
+	WARN_ON(DLPC3433 != (devid & DEV_ID_MASK));
+
+	/* disable image freeze */
+	regmap_write(regmap, WR_IMAGE_FREEZE, IMAGE_FREESE_EN);
+
+	/* enable DSI port */
+	regmap_write(regmap, WR_DSI_PORT_EN, DSI_PORT_EN);
+
+	memset(buf, 0, MAX_BYTE_SIZE);
+
+	/* set image crop */
+	buf[4] = mode->hdisplay & 0xff;
+	buf[5] = (mode->hdisplay & 0xff00) >> 8;
+	buf[6] = mode->vdisplay & 0xff;
+	buf[7] = (mode->vdisplay & 0xff00) >> 8;
+	regmap_noinc_write(regmap, WR_IMAGE_CROP, buf, MAX_BYTE_SIZE);
+
+	/* set display size */
+	regmap_noinc_write(regmap, WR_DISPLAY_SIZE, buf, MAX_BYTE_SIZE);
+
+	/* set input image size */
+	buf[0] = mode->hdisplay & 0xff;
+	buf[1] = (mode->hdisplay & 0xff00) >> 8;
+	buf[2] = mode->vdisplay & 0xff;
+	buf[3] = (mode->vdisplay & 0xff00) >> 8;
+	regmap_noinc_write(regmap, WR_INPUT_IMAGE_SIZE, buf, 4);
+
+	/* set external video port */
+	regmap_write(regmap, WR_INPUT_SOURCE, INPUT_EXTERNAL_VIDEO);
+
+	/* set external video format select as DSI */
+	regmap_write(regmap, WR_EXT_SOURCE_FMT, EXT_SOURCE_FMT_DSI);
+
+	/* disable image freeze */
+	regmap_write(regmap, WR_IMAGE_FREEZE, 0x00);
+
+	/* enable RGB led */
+	regmap_update_bits(regmap, WR_RGB_LED_EN, LED_MASK,
+			   RED_LED_EN | GREEN_LED_EN | BLUE_LED_EN);
+
+	msleep(10);
+}
+
+static void dlpc_atomic_pre_enable(struct drm_bridge *bridge,
+				   struct drm_bridge_state *old_bridge_state)
+{
+	struct dlpc *dlpc = bridge_to_dlpc(bridge);
+	int ret;
+
+	gpiod_set_value(dlpc->enable_gpio, 1);
+
+	msleep(500);
+
+	if (dlpc->vcc_intf) {
+		ret = regulator_enable(dlpc->vcc_intf);
+		if (ret)
+			DRM_DEV_ERROR(dlpc->dev,
+				      "failed to enable VCC_INTF regulator: %d\n", ret);
+	}
+
+	if (dlpc->vcc_flsh) {
+		ret = regulator_enable(dlpc->vcc_flsh);
+		if (ret)
+			DRM_DEV_ERROR(dlpc->dev,
+				      "failed to enable VCC_FLSH regulator: %d\n", ret);
+	}
+}
+
+static void dlpc_atomic_post_disable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
+{
+	struct dlpc *dlpc = bridge_to_dlpc(bridge);
+
+	regulator_disable(dlpc->vcc_flsh);
+	regulator_disable(dlpc->vcc_intf);
+
+	msleep(500);
+
+	gpiod_set_value(dlpc->enable_gpio, 0);
+}
+
+static void dlpc_mode_set(struct drm_bridge *bridge,
+			  const struct drm_display_mode *mode,
+			  const struct drm_display_mode *adjusted_mode)
+{
+	struct dlpc *dlpc = bridge_to_dlpc(bridge);
+
+	drm_mode_copy(&dlpc->mode, adjusted_mode);
+}
+
+static int dlpc_attach(struct drm_bridge *bridge,
+		       enum drm_bridge_attach_flags flags)
+{
+	struct dlpc *dlpc = bridge_to_dlpc(bridge);
+
+	return drm_bridge_attach(bridge->encoder, dlpc->panel_bridge,
+				 bridge, flags);
+}
+
+static const struct drm_bridge_funcs dlpc_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable	= dlpc_atomic_pre_enable,
+	.atomic_enable		= dlpc_atomic_enable,
+	.atomic_post_disable	= dlpc_atomic_post_disable,
+	.mode_set		= dlpc_mode_set,
+	.attach			= dlpc_attach,
+};
+
+static int dlpc3433_parse_dt(struct dlpc *dlpc)
+{
+	struct device *dev = dlpc->dev;
+	struct device_node *endpoint;
+	struct drm_panel *panel;
+	int ret;
+
+	dlpc->vcc_intf = devm_regulator_get(dlpc->dev, "vcc_intf");
+	if (IS_ERR(dlpc->vcc_intf)) {
+		return PTR_ERR(dlpc->vcc_intf);
+		if (ret == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dlpc->vcc_intf = NULL;
+	}
+
+	dlpc->vcc_flsh = devm_regulator_get(dlpc->dev, "vcc_flsh");
+	if (IS_ERR(dlpc->vcc_flsh)) {
+		return PTR_ERR(dlpc->vcc_flsh);
+		if (ret == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dlpc->vcc_flsh = NULL;
+	}
+
+	dlpc->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(dlpc->enable_gpio))
+		return PTR_ERR(dlpc->enable_gpio);
+
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
+	if (ret)
+		return ret;
+	if (panel) {
+		dlpc->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+		if (IS_ERR(dlpc->panel_bridge))
+			return PTR_ERR(dlpc->panel_bridge);
+	}
+
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	dlpc->dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	dlpc->host_node = of_graph_get_remote_port_parent(endpoint);
+	of_node_put(endpoint);
+
+	if (dlpc->dsi_lanes < 0 || dlpc->dsi_lanes > 4)
+		return -EINVAL;
+	if (!dlpc->host_node)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int dlpc_host_attach(struct dlpc *dlpc)
+{
+	struct device *dev = dlpc->dev;
+	struct mipi_dsi_host *host;
+	struct mipi_dsi_device_info info = {
+		.type = "dlpc3433",
+		.channel = 0,
+		.node = NULL,
+	};
+	int ret;
+
+	host = of_find_mipi_dsi_host_by_node(dlpc->host_node);
+	if (!host) {
+		DRM_DEV_ERROR(dev, "failed to find dsi host\n");
+		return -EPROBE_DEFER;
+	}
+
+	dlpc->dsi = mipi_dsi_device_register_full(host, &info);
+	if (IS_ERR(dlpc->dsi)) {
+		DRM_DEV_ERROR(dev, "failed to create dsi device\n");
+		return PTR_ERR(dlpc->dsi);
+	}
+
+	dlpc->dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST;
+	dlpc->dsi->format = MIPI_DSI_FMT_RGB565;
+	dlpc->dsi->lanes = dlpc->dsi_lanes;
+
+	return devm_mipi_dsi_attach(dev, dlpc->dsi);
+}
+
+static int dlpc3433_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct dlpc *dlpc;
+	int ret;
+
+	dlpc = devm_kzalloc(dev, sizeof(*dlpc), GFP_KERNEL);
+	if (!dlpc)
+		return -ENOMEM;
+
+	dlpc->dev = dev;
+
+	dev_set_drvdata(dev, dlpc);
+	i2c_set_clientdata(client, dlpc);
+
+	dlpc->regmap = devm_regmap_init_i2c(client, &dlpc_regmap_config);
+	if (IS_ERR(dlpc->regmap))
+		return PTR_ERR(dlpc->regmap);
+
+	ret = dlpc3433_parse_dt(dlpc);
+	if (ret)
+		return ret;
+
+	dlpc->bridge.funcs = &dlpc_bridge_funcs;
+	dlpc->bridge.of_node = dev->of_node;
+	drm_bridge_add(&dlpc->bridge);
+
+	ret = dlpc_host_attach(dlpc);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to attach dsi host\n");
+		goto err_remove_bridge;
+	}
+
+	return 0;
+
+err_remove_bridge:
+	drm_bridge_remove(&dlpc->bridge);
+	return ret;
+}
+
+static int dlpc3433_remove(struct i2c_client *client)
+{
+	struct dlpc *dlpc = i2c_get_clientdata(client);
+
+	drm_bridge_remove(&dlpc->bridge);
+	of_node_put(dlpc->host_node);
+
+	return 0;
+}
+
+static const struct i2c_device_id dlpc3433_id[] = {
+	{ "ti,dlpc3433", 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, dlpc3433_id);
+
+static const struct of_device_id dlpc3433_match_table[] = {
+	{ .compatible = "ti,dlpc3433" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dlpc3433_match_table);
+
+static struct i2c_driver dlpc3433_driver = {
+	.probe_new = dlpc3433_probe,
+	.remove = dlpc3433_remove,
+	.id_table = dlpc3433_id,
+	.driver = {
+		.name = "ti-dlpc3433",
+		.of_match_table = dlpc3433_match_table,
+	},
+};
+module_i2c_driver(dlpc3433_driver);
+
+MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
+MODULE_AUTHOR("Christopher Vollo <chris@renewoutreach.org>");
+MODULE_DESCRIPTION("TI DLPC3433 MIPI DSI Display Controller Bridge");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

