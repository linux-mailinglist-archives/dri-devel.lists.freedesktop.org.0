Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A07566208B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 09:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B16F10E380;
	Mon,  9 Jan 2023 08:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C7910E380
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 08:49:38 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so6734670wml.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 00:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wXjPbyrPP49p0O5pBUzIB0DmkgrdNUpNzhSiFyPfgoA=;
 b=Gx7m7H9c/IYeWajz26M6CvOCQCe2cb0oyXpme52MlMumm11e3e/9Q3qqlT1DZplIu/
 wcGPQGjI749KBAdx+YLIKojTvavTo4xa70sY2QoHcMLgv+hsOTrbcSqouQClmI4GLT0F
 peKXtroZnl61mRObSTJ+PSkbcY7fOFw3cRsqMe83vWvXOjCy7gxvCxHR3LXyUZh0vH1H
 gH9amwsU2bjovidpdPklQdZxfnj2xE/eo3enKgbYjkeCe/6Oa3+X0WUkJHhQWJSBwkFT
 Jn5ftX1HsLMgDrr+GxahXeKx7FTxyjeIaIB+juSP6XCxp+SYMhm2xBclKiSunPxuMU7C
 iY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wXjPbyrPP49p0O5pBUzIB0DmkgrdNUpNzhSiFyPfgoA=;
 b=w9ybd85GM7f9y8akVdIvOOTvTBzMLWNHiu6YPo+o2w7mHvakNIC0W3cf4G844Wecgw
 pH8M/6F5B+8OtKPwt80a1Jb0op4nz27TM/wX71B5hhRFU3NyX44z1YUbHdMdn3Sd0gh0
 3N9TPWOs6z4fLwCGbtTS8aU5p4z8RT3vlwtShYvdleo4zchVunFJUlJDJNbY2NltyntH
 12bq8sNlwuuflJzVKZchpN1oOvUrj8DvzOeLerUL6Yv8aZZXubL6ateYFCmI5hLuplFR
 dFUEQEdmV3ccdeXejuRHp1S+H/87sws7AvRvEg+Zlqkv7pI/TMJimnb+1DOyZSTNCEuX
 mq+g==
X-Gm-Message-State: AFqh2krdqFkxqpjY8hyUMu9Fetw6puRAuEEFapDJTOnl+KEXwbdBC9bR
 Tn9HzG/Hb4vZMFHY8Q/eyZM8dQ==
X-Google-Smtp-Source: AMrXdXu3vyy+JqtqbmdkKBAObq+6OFv4a8O1t+Zw78NtfIKj24rxOaXikO/bbgEDhmEjTk3IiUTANg==
X-Received: by 2002:a05:600c:35d1:b0:3d3:58d1:2588 with SMTP id
 r17-20020a05600c35d100b003d358d12588mr47000653wmq.41.1673254176578; 
 Mon, 09 Jan 2023 00:49:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm15039619wmb.14.2023.01.09.00.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 00:49:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 09:49:30 +0100
Subject: [PATCH v2 2/2] drm/panel: add visionox vtdr6130 DSI panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-2-dd6200f47a76@linaro.org>
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-0-dd6200f47a76@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-0-dd6200f47a76@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.11.1
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 1080x2400 Visionox VTDR6130 AMOLED DSI panel
found on the Qualcomm SM8550 MTP board.

By default the the panel is configured to work with DSI compressed
streams, but can work in uncompressed video mode since 1080x2400 in
RGB888 fits in the 4 DSI lanes bandwidth.

While display compression is preferred for performance and power
reasons, let's start with the uncompressed video mode support and
add the DSC support later on.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                   |   8 +
 drivers/gpu/drm/panel/Makefile                  |   1 +
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 358 ++++++++++++++++++++++++
 3 files changed, 367 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 737edcdf9eef..fd1d7e6f536b 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -717,6 +717,14 @@ config DRM_PANEL_VISIONOX_RM69299
 	  Say Y here if you want to enable support for Visionox
 	  RM69299  DSI Video Mode panel.
 
+config DRM_PANEL_VISIONOX_VTDR6130
+	tristate "Visionox VTDR6130"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y here if you want to enable support for Visionox
+	  VTDR6130 1080x2400 AMOLED DSI panel.
+
 config DRM_PANEL_WIDECHIPS_WS2401
 	tristate "Widechips WS2401 DPI panel driver"
 	depends on SPI && GPIOLIB
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index f8f9d9f6a307..1966404fcf7a 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -73,5 +73,6 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
 obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
+obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
 obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) += panel-widechips-ws2401.o
 obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
new file mode 100644
index 000000000000..c107c88b22b4
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2023, Linaro Limited
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/display/drm_dsc.h>
+
+#include <video/mipi_display.h>
+
+struct visionox_vtdr6130 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[3];
+	bool prepared;
+};
+
+static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
+{
+	return container_of(panel, struct visionox_vtdr6130, panel);
+}
+
+static void visionox_vtdr6130_reset(struct visionox_vtdr6130 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	if (ret)
+		return ret;
+
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
+	mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x70,
+			       0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
+			       0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
+			       0x02, 0x0e, 0x00, 0x20, 0x03, 0xdd, 0x00, 0x07, 0x00,
+			       0x0c, 0x02, 0x77, 0x02, 0x8b, 0x18, 0x00, 0x10, 0xf0,
+			       0x07, 0x10, 0x20, 0x00, 0x06, 0x0f, 0x0f, 0x33, 0x0e,
+			       0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62, 0x69, 0x70, 0x77,
+			       0x79, 0x7b, 0x7d, 0x7e, 0x02, 0x02, 0x22, 0x00, 0x2a,
+			       0x40, 0x2a, 0xbe, 0x3a, 0xfc, 0x3a, 0xfa, 0x3a, 0xf8,
+			       0x3b, 0x38, 0x3b, 0x78, 0x3b, 0xb6, 0x4b, 0xb6, 0x4b,
+			       0xf4, 0x4b, 0xf4, 0x6c, 0x34, 0x84, 0x74, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xaa, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, 0xb1,
+			       0x01, 0x38, 0x00, 0x14, 0x00, 0x1c, 0x00, 0x01, 0x66,
+			       0x00, 0x14, 0x00, 0x14, 0x00, 0x01, 0x66, 0x00, 0x14,
+			       0x05, 0xcc, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xaa, 0x13);
+	mipi_dsi_dcs_write_seq(dsi, 0xce,
+			       0x09, 0x11, 0x09, 0x11, 0x08, 0xc1, 0x07, 0xfa, 0x05,
+			       0xa4, 0x00, 0x3c, 0x00, 0x34, 0x00, 0x24, 0x00, 0x0c,
+			       0x00, 0x0c, 0x04, 0x00, 0x35);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xaa, 0x14);
+	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x03, 0x33);
+	mipi_dsi_dcs_write_seq(dsi, 0xb4,
+			       0x00, 0x33, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x00, 0x00,
+			       0x3e, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xb5,
+			       0x00, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x06, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0x00, 0x08, 0x09, 0x09, 0x09);
+	mipi_dsi_dcs_write_seq(dsi, 0xbc,
+			       0x10, 0x00, 0x00, 0x06, 0x11, 0x09, 0x3b, 0x09, 0x47,
+			       0x09, 0x47, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xbe,
+			       0x10, 0x10, 0x00, 0x08, 0x22, 0x09, 0x19, 0x09, 0x25,
+			       0x09, 0x25, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x80);
+	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x14);
+	mipi_dsi_dcs_write_seq(dsi, 0xfa, 0x08, 0x08, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x81);
+	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x0f);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xaa, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x82);
+	mipi_dsi_dcs_write_seq(dsi, 0xf9, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x51, 0x83);
+	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0xf8, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x9a);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x00);
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
+	msleep(20);
+
+	return 0;
+}
+
+static int visionox_vtdr6130_off(struct visionox_vtdr6130 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display off: %d\n", ret);
+		return ret;
+	}
+	msleep(20);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(120);
+
+	return 0;
+}
+
+static int visionox_vtdr6130_prepare(struct drm_panel *panel)
+{
+	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies),
+				    ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	visionox_vtdr6130_reset(ctx);
+
+	ret = visionox_vtdr6130_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+		return ret;
+	}
+
+	ctx->prepared = true;
+	return 0;
+}
+
+static int visionox_vtdr6130_unprepare(struct drm_panel *panel)
+{
+	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = visionox_vtdr6130_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+
+	ctx->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode visionox_vtdr6130_mode = {
+	.clock = (1080 + 20 + 2 + 20) * (2400 + 20 + 2 + 18) * 144 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 20,
+	.hsync_end = 1080 + 20 + 2,
+	.htotal = 1080 + 20 + 2 + 20,
+	.vdisplay = 2400,
+	.vsync_start = 2400 + 20,
+	.vsync_end = 2400 + 20 + 2,
+	.vtotal = 2400 + 20 + 2 + 18,
+	.width_mm = 71,
+	.height_mm = 157,
+};
+
+static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
+				       struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &visionox_vtdr6130_mode);
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
+static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
+	.prepare = visionox_vtdr6130_prepare,
+	.unprepare = visionox_vtdr6130_unprepare,
+	.get_modes = visionox_vtdr6130_get_modes,
+};
+
+static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	/* Panel needs big-endian order of brightness value */
+	u8 payload[2] = { brightness >> 8, brightness & 0xff };
+	int ret;
+
+	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
+				 payload, sizeof(payload));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static const struct backlight_ops visionox_vtdr6130_bl_ops = {
+	.update_status = visionox_vtdr6130_bl_update_status,
+};
+
+static struct backlight_device *
+visionox_vtdr6130_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 4095,
+		.max_brightness = 4095,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &visionox_vtdr6130_bl_ops, &props);
+}
+
+static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct visionox_vtdr6130 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->supplies[0].supply = "vddio";
+	ctx->supplies[1].supply = "vci";
+	ctx->supplies[2].supply = "vdd";
+
+	ret = devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ctx->panel.backlight = visionox_vtdr6130_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
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
+static void visionox_vtdr6130_remove(struct mipi_dsi_device *dsi)
+{
+	struct visionox_vtdr6130 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id visionox_vtdr6130_of_match[] = {
+	{ .compatible = "visionox,vtdr6130" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, visionox_vtdr6130_of_match);
+
+static struct mipi_dsi_driver visionox_vtdr6130_driver = {
+	.probe = visionox_vtdr6130_probe,
+	.remove = visionox_vtdr6130_remove,
+	.driver = {
+		.name = "panel-visionox-vtdr6130",
+		.of_match_table = visionox_vtdr6130_of_match,
+	},
+};
+module_mipi_dsi_driver(visionox_vtdr6130_driver);
+
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_DESCRIPTION("Panel driver for the Visionox VTDR6130 AMOLED DSI panel");
+MODULE_LICENSE("GPL");

-- 
2.34.1
