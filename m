Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523D91C8303
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B64E6E91F;
	Thu,  7 May 2020 07:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1576E8EB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 21:10:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i15so3417385wrx.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 14:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Euo67aDxUC4aKknrYnuzBtPugZDmAxUcjh4hawW7BWs=;
 b=ULF6U3pgbRr7s6YppTqDaCT7tmRExUcPUyNq/dc0mXFcBWKDjPD1tK2Bi7ul1Ivq2V
 qA4N0Gnbhxhrj0E0MIAsZnOnQo2nt6cpcst5r6QpEdn/ZAyDOXuB3K3PoX7JBai9ERe5
 js0TE7qmX1q3gOuExDyJtWuiEw58hX/0IjMahX1gmWUaQjxu1Qzyfr1cXWukJXN1Qf38
 jebct3ZwZp10vSf72WqBCe4GyUQoyovyp13JOVYS3d/V2BK/r1e1juPK/jjKflnLOxcy
 j+DSDCk9/GAdOtF3crpT6clTCnY8rKfWfL7HLrpvA2DW8Xsl9L1y02AINsBGD8qmHBks
 +P6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Euo67aDxUC4aKknrYnuzBtPugZDmAxUcjh4hawW7BWs=;
 b=N4oAGeiZ46CIRzkHXiN/hptbBdnfKcmkZFr7c0tXwAUBmaAYXULzDir1mipjp7jCNr
 nXR525cxGTU0MfmMEo+MZ3zmlkLrcmcqlyoAdJJhrnGIRw451xz5ZXC49+aZC6AK8MTk
 MSV9nrFQL7/I6p7jaooU9q2yaXFmrcvwn8NaFKEYS3IqKzj3LNTiHJQSAkRToueesvru
 Qe5Wx2tFa4a5LVzcfVQz8wgphhzXDoLcIpOJIC00Ohw+vjOF25uG/6Uz3rx/ApYxoMWU
 XPgraHWZNeC+sgpJj3b3Qyw+YY1mAZNLSOBFdNuvDVcU61bSNGkxWb2WHlf+cTc1fgXv
 h0ww==
X-Gm-Message-State: AGi0PuZ3UeTngKtuO3JUdhGTdG5Xpcu9grcGF9JCq/jJTeLjMn5Z+pR4
 wBxToHQ6VU0cV9N9XCLY5FatH1CxYns=
X-Google-Smtp-Source: APiQypKG1xYRwpiiV75AvyZ79q96fwhZD7nUUYp9r+jr7t4HPCAFRnpEgW+U25jXrT/HW5NaZj3JtQ==
X-Received: by 2002:adf:cc89:: with SMTP id p9mr11698550wrj.269.1588799406081; 
 Wed, 06 May 2020 14:10:06 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl.
 [83.6.170.125])
 by smtp.googlemail.com with ESMTPSA id b191sm5135056wmd.39.2020.05.06.14.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 14:10:05 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: 
Subject: [v4 PATCH 1/2] drivers: drm: panel: Add ASUS TM5P5 NT35596 panel
 driver
Date: Wed,  6 May 2020 23:09:55 +0200
Message-Id: <20200506210957.344590-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200506210957.344590-1-konradybcio@gmail.com>
References: <20200506210957.344590-1-konradybcio@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konradybcio@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support for TMP5P5 NT35596 1080x1920 video
mode panel that can be found on some Asus Zenfone 2
Laser (Z00T) devices.

This panel seems to only be found in this device
and we have no straightforward way of actually
getting the correct model number, as no schematics
are released publicly.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 367 ++++++++++++++++++
 3 files changed, 378 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a1723c1b5fbf8..ad896a877d49f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -18,6 +18,16 @@ config DRM_PANEL_ARM_VERSATILE
 	  reference designs. The panel is detected using special registers
 	  in the Versatile family syscon registers.
 
+config DRM_PANEL_ASUS_Z00T_TM5P5_NT35596
+	tristate "ASUS Z00T TM5P5 NT35596 panel"
+	depends on GPIOLIB && OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the ASUS TMP5P5
+	  NT35596 1080x1920 video mode panel as found in some Asus
+	  Zenfone 2 Laser Z00T devices.
+
 config DRM_PANEL_BOE_HIMAX8279D
 	tristate "Boe Himax8279d panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 96a883cd66305..3efc1de93aeeb 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
+obj-$(CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596) += panel-asus-z00t-tm5p5-n35596.o
 obj-$(CONFIG_DRM_PANEL_BOE_HIMAX8279D) += panel-boe-himax8279d.o
 obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
new file mode 100644
index 0000000000000..ec5599685a4c2
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -0,0 +1,367 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct tm5p5_nt35596 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data supplies[2];
+	struct gpio_desc *reset_gpio;
+	bool prepared;
+};
+
+static inline struct tm5p5_nt35596 *to_tm5p5_nt35596(struct drm_panel *panel)
+{
+	return container_of(panel, struct tm5p5_nt35596, panel);
+}
+
+#define dsi_generic_write_seq(dsi, seq...) do {				\
+		static const u8 d[] = { seq };				\
+		int ret;						\
+		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
+		if (ret < 0)						\
+			return ret;					\
+	} while (0)
+
+#define dsi_dcs_write_seq(dsi, seq...) do {				\
+		static const u8 d[] = { seq };				\
+		int ret;						\
+		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
+		if (ret < 0)						\
+			return ret;					\
+	} while (0)
+
+static void tm5p5_nt35596_reset(struct tm5p5_nt35596 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(15000, 16000);
+}
+
+static int tm5p5_nt35596_on(struct tm5p5_nt35596 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+
+	dsi_generic_write_seq(dsi, 0xff, 0x05);
+	dsi_generic_write_seq(dsi, 0xfb, 0x01);
+	dsi_generic_write_seq(dsi, 0xc5, 0x31);
+	dsi_generic_write_seq(dsi, 0xff, 0x04);
+	dsi_generic_write_seq(dsi, 0x01, 0x84);
+	dsi_generic_write_seq(dsi, 0x05, 0x25);
+	dsi_generic_write_seq(dsi, 0x06, 0x01);
+	dsi_generic_write_seq(dsi, 0x07, 0x20);
+	dsi_generic_write_seq(dsi, 0x08, 0x06);
+	dsi_generic_write_seq(dsi, 0x09, 0x08);
+	dsi_generic_write_seq(dsi, 0x0a, 0x10);
+	dsi_generic_write_seq(dsi, 0x0b, 0x10);
+	dsi_generic_write_seq(dsi, 0x0c, 0x10);
+	dsi_generic_write_seq(dsi, 0x0d, 0x14);
+	dsi_generic_write_seq(dsi, 0x0e, 0x14);
+	dsi_generic_write_seq(dsi, 0x0f, 0x14);
+	dsi_generic_write_seq(dsi, 0x10, 0x14);
+	dsi_generic_write_seq(dsi, 0x11, 0x14);
+	dsi_generic_write_seq(dsi, 0x12, 0x14);
+	dsi_generic_write_seq(dsi, 0x17, 0xf3);
+	dsi_generic_write_seq(dsi, 0x18, 0xc0);
+	dsi_generic_write_seq(dsi, 0x19, 0xc0);
+	dsi_generic_write_seq(dsi, 0x1a, 0xc0);
+	dsi_generic_write_seq(dsi, 0x1b, 0xb3);
+	dsi_generic_write_seq(dsi, 0x1c, 0xb3);
+	dsi_generic_write_seq(dsi, 0x1d, 0xb3);
+	dsi_generic_write_seq(dsi, 0x1e, 0xb3);
+	dsi_generic_write_seq(dsi, 0x1f, 0xb3);
+	dsi_generic_write_seq(dsi, 0x20, 0xb3);
+	dsi_generic_write_seq(dsi, 0xfb, 0x01);
+	dsi_generic_write_seq(dsi, 0xff, 0x00);
+	dsi_generic_write_seq(dsi, 0xfb, 0x01);
+	dsi_generic_write_seq(dsi, 0x35, 0x01);
+	dsi_generic_write_seq(dsi, 0xd3, 0x06);
+	dsi_generic_write_seq(dsi, 0xd4, 0x04);
+	dsi_generic_write_seq(dsi, 0x5e, 0x0d);
+	dsi_generic_write_seq(dsi, 0x11, 0x00);
+	msleep(100);
+	dsi_generic_write_seq(dsi, 0x29, 0x00);
+	dsi_generic_write_seq(dsi, 0x53, 0x24);
+
+	return 0;
+}
+
+static int tm5p5_nt35596_off(struct tm5p5_nt35596 *ctx)
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
+	msleep(60);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+		return ret;
+	}
+
+	dsi_dcs_write_seq(dsi, 0x4f, 0x01);
+
+	return 0;
+}
+
+static int tm5p5_nt35596_prepare(struct drm_panel *panel)
+{
+	struct tm5p5_nt35596 *ctx = to_tm5p5_nt35596(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	tm5p5_nt35596_reset(ctx);
+
+	ret = tm5p5_nt35596_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies),
+			ctx->supplies);
+		return ret;
+	}
+
+	ctx->prepared = true;
+	return 0;
+}
+
+static int tm5p5_nt35596_unprepare(struct drm_panel *panel)
+{
+	struct tm5p5_nt35596 *ctx = to_tm5p5_nt35596(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = tm5p5_nt35596_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies),
+		ctx->supplies);
+
+	ctx->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode tm5p5_nt35596_mode = {
+	.clock = (1080 + 100 + 8 + 16) * (1920 + 4 + 2 + 4) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 100,
+	.hsync_end = 1080 + 100 + 8,
+	.htotal = 1080 + 100 + 8 + 16,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 4,
+	.vsync_end = 1920 + 4 + 2,
+	.vtotal = 1920 + 4 + 2 + 4,
+	.vrefresh = 60,
+	.width_mm = 68,
+	.height_mm = 121,
+};
+
+static int tm5p5_nt35596_get_modes(struct drm_panel *panel,
+				   struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &tm5p5_nt35596_mode);
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
+static const struct drm_panel_funcs tm5p5_nt35596_panel_funcs = {
+	.prepare = tm5p5_nt35596_prepare,
+	.unprepare = tm5p5_nt35596_unprepare,
+	.get_modes = tm5p5_nt35596_get_modes,
+};
+
+static int tm5p5_nt35596_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = bl->props.brightness;
+	int ret;
+
+	if (bl->props.power != FB_BLANK_UNBLANK ||
+	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
+	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
+		brightness = 0;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static int tm5p5_nt35596_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = bl->props.brightness;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return brightness & 0xff;
+}
+
+static const struct backlight_ops tm5p5_nt35596_bl_ops = {
+	.update_status = tm5p5_nt35596_bl_update_status,
+	.get_brightness = tm5p5_nt35596_bl_get_brightness,
+};
+
+static struct backlight_device *
+tm5p5_nt35596_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 255,
+		.max_brightness = 255,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &tm5p5_nt35596_bl_ops, &props);
+}
+
+static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct tm5p5_nt35596 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->supplies[0].supply = "vdd";
+	ctx->supplies[1].supply = "vddio";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get regulators: %d\n", ret);
+		return ret;
+	}
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio)) {
+		ret = PTR_ERR(ctx->reset_gpio);
+		dev_err(dev, "Failed to get reset-gpios: %d\n", ret);
+		return ret;
+	}
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_EOT_PACKET |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
+
+	drm_panel_init(&ctx->panel, dev, &tm5p5_nt35596_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ctx->panel.backlight = tm5p5_nt35596_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight)) {
+		ret = PTR_ERR(ctx->panel.backlight);
+		dev_err(dev, "Failed to create backlight: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_panel_add(&ctx->panel);
+	if (ret < 0) {
+		dev_err(dev, "Failed to add panel: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int tm5p5_nt35596_remove(struct mipi_dsi_device *dsi)
+{
+	struct tm5p5_nt35596 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev,
+		 "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+
+	return 0;
+}
+
+static const struct of_device_id tm5p5_nt35596_of_match[] = {
+	{ .compatible = "asus,z00t-tm5p5-n35596" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tm5p5_nt35596_of_match);
+
+static struct mipi_dsi_driver tm5p5_nt35596_driver = {
+	.probe = tm5p5_nt35596_probe,
+	.remove = tm5p5_nt35596_remove,
+	.driver = {
+		.name = "panel-tm5p5-nt35596",
+		.of_match_table = tm5p5_nt35596_of_match,
+	},
+};
+module_mipi_dsi_driver(tm5p5_nt35596_driver);
+
+MODULE_AUTHOR("Konrad Dybcio <konradybcio@gmail.com>");
+MODULE_DESCRIPTION("DRM driver for tm5p5 nt35596 1080p video mode dsi panel");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
