Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD6D1C240E
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452096ED95;
	Sat,  2 May 2020 08:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC456ED4A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 20:48:44 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h9so2626060wrt.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 13:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UDJxw/ug0/U/iGbtoFqQBVqVbjHxpxn12zHozN7SZ2o=;
 b=W/PSwxyMlgLuDUXQysstYJPaIVhDWE8D1NvIkylvSXwDko/rxN0qGw9jw1NJQ51owP
 y4UsF2jtnuBKqNeWoCGSsuUkJlizN9AtSrOp4RQ36e7OpNMXCTMt9A1BXs/8LMiYhCc5
 FsgAoUbzJ4yX89RUCWUEswIWCQSi/GpUBi7+/TvfWcfWrJOjrCq9Qo6zqdITsuPzykO4
 oV64kV2Za6eji1WDN0vg6LXcJY0Lo/3wpoZ0bHA23LrvRHq+KV6taLKJ9v0iHlwoT32R
 K/l1DFcggSQQSNJhcQkIWDpHMRiIa/vLd1SoMt/0HMI1Ibgf8Ezgaz7Hl+jWAcm9N2Ef
 FGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UDJxw/ug0/U/iGbtoFqQBVqVbjHxpxn12zHozN7SZ2o=;
 b=pin2pzCtomGzbg0bzoTxD0xhazOk9WRMISW3JeMcf0Js8q8XGYH6wnLTm97Zxdv+i9
 wQy8HnE7WzIwcySMjxgQH5pg+Qr3lMXS5n4grXkG68HFG0ke/S7zEN5GOMNVid5j+mPP
 FiN5A+8GPhhKwGwoAoCJb5wTj1KxRlIJBe2XPX7cFxM00mKt+/ktC9zjSUuT2ySQPUVx
 M2XcvojfkdTa2tsD2Lx0QrH1rtYt96hXAqhzUx1egnVON1bSxgQJJ3cWJNNRevC67Xxp
 itVU6hRd3B2wCXJk2+FVg/iMDQa+fPqWNFtQMaaOhuUjhCxNUSS6qdZzBHLuJ0T8ITOB
 4BSA==
X-Gm-Message-State: AGi0PuaIoJr0Plf5ZTTw4JxjmFvGiqTFgqbY/J3SgfJPLByleEfaY/VE
 2J+ikC1qUGOGHRkdF80aWEo=
X-Google-Smtp-Source: APiQypL8/wMynBDyQuDHgDZwf8aULrdD+p6HLs9oEQWYrW1FDjC3o+Tu9KpmQcAM6E38OkTCJL+Pww==
X-Received: by 2002:a05:6000:1287:: with SMTP id
 f7mr6098085wrx.345.1588366123398; 
 Fri, 01 May 2020 13:48:43 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl.
 [83.6.170.125])
 by smtp.googlemail.com with ESMTPSA id w12sm5938623wrk.56.2020.05.01.13.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 13:48:43 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: skrzynka@konradybcio.pl
Subject: [PATCH 1/2] drivers: drm: panel: Add TM5P5 NT35596 panel driver
Date: Fri,  1 May 2020 22:48:22 +0200
Message-Id: <20200501204825.146424-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200501204825.146424-1-konradybcio@gmail.com>
References: <20200501204825.146424-1-konradybcio@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig               |   9 +
 drivers/gpu/drm/panel/Makefile              |   1 +
 drivers/gpu/drm/panel/panel-tm5p5-nt35596.c | 366 ++++++++++++++++++++
 3 files changed, 376 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-tm5p5-nt35596.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a1723c1b5fbf8..6ff892334ac4b 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -401,6 +401,15 @@ config DRM_PANEL_SONY_ACX565AKM
 	  Say Y here if you want to enable support for the Sony ACX565AKM
 	  800x600 3.5" panel (found on the Nokia N900).
 
+config DRM_PANEL_TM5P5_NT35596
+	tristate "TM5P5 NT35596 panel"
+	depends on GPIOLIB && OF
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y here if you want to enable support for the TMP5P5
+	  NT35596 1080x1920 video mode panel as found in some Asus
+	  Zenfone 2 Laser Z00T devices.
+
 config DRM_PANEL_TPO_TD028TTEC1
 	tristate "Toppoly (TPO) TD028TTEC1 panel driver"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 96a883cd66305..4fc7e00b18502 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX424AKP) += panel-sony-acx424akp.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
+obj-$(CONFIG_DRM_PANEL_TM5P5_NT35596) += panel-tm5p5-nt35596.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
diff --git a/drivers/gpu/drm/panel/panel-tm5p5-nt35596.c b/drivers/gpu/drm/panel/panel-tm5p5-nt35596.c
new file mode 100644
index 0000000000000..c361ab76812b8
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-tm5p5-nt35596.c
@@ -0,0 +1,366 @@
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
+		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
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
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
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
+// TODO: Check if /sys/class/backlight/.../actual_brightness actually returns
+// correct values. If not, remove this function.
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
+	struct backlight_properties props = {
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
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+
+	return 0;
+}
+
+static const struct of_device_id tm5p5_nt35596_of_match[] = {
+	{ .compatible = "tm5p5,nt35596" },
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
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
