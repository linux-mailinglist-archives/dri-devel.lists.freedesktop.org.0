Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6EBB101F8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B302A10E8A8;
	Thu, 24 Jul 2025 07:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.b="KNmktPnJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E371910E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 14:52:48 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-60bf5a08729so12985979a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google; t=1753282367; x=1753887167;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Am1JBNV0HkYK+0lcOte5YOE0wpQ64M0Fby5sEdZvWpc=;
 b=KNmktPnJ/As7tSJyJ4UQrNw5HdByejYauEcWynznAFvJfH7EtDaHnnLgo4/GoZpNmZ
 p6X3mGde6/JTZF1nBoWg1oFXZ7ctRtMAE7lN0RviT1Tiu62E0gWQwzGSORWyj58vubFy
 frVvEV7L8CM6cX+qw1+bOT5SKkzgOLz4hjMxBoOQesKojrr0tCzso7xKvORLR4hyuz46
 Ch2a9nrI5KTDsVYev+XQMbZl1B23p6f8O2lyrATUCGNh7nODKyc4wV1zL4Yd17A+hOs/
 b7cqv8FpyDOAHU2rmelIKKO1Gzm7wANbqgRXQHU29XNrG4dv5M5ubC6gMYSDu8HZHvoi
 orJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753282367; x=1753887167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Am1JBNV0HkYK+0lcOte5YOE0wpQ64M0Fby5sEdZvWpc=;
 b=uLyU2/pxJfKtE4KWEerwIOcjZKb/+3TBfvnGrruX74DkUUa2aWkjaTiPkVHVaKD202
 z5Ae0vcaaA/OtbpdKAmLfaIGQZC21TRWOOy30BSiW+/rsa3xn3GE3TDVFHWSJ5gnHwZo
 xghKAyqgYz0/+Ianf9DJMDht0HK/EeFIZ4UHBrrqGOOw0yjOPaNMpA0vOW38416x3TRQ
 uTdlQldyebJqm0aNOGn822zqfcmcnbuUYhJfaHkuX/mTIX6+KQTvpfR23IDNKMlE3uTP
 VyjTzUyOd0tx+5p5c0EqtAlaZtIWHMdC0//wWK7W4i9093YT0vbq2D0Kb1x1GmcpwAw9
 G5Ug==
X-Gm-Message-State: AOJu0YzrxnuXZQIPETyMI6AnZ6hZIEPbHe9NrJK/UFz2T5IIPCqQzxAo
 rhuhVATcRQm4GlM7edEXhjEOmtPDyRuRmDBncgamjS9gg10AcmGmu1AGYxvJ2PFwWX0=
X-Gm-Gg: ASbGncvSqSpN7IzfaOJz0XBWicdLcaTCz9NFoOeiWPuewAeBoTySqmE5o8oVs6o343e
 2MhSHlQUGFco+CtRObmJYE4OZwIRyHtXdyrMPt79v1wVH0gAY8YkljaJ7bM9EMncU9/eVYC+EPl
 HYD+nsjiU9H+rl67V2Qa4660d6bUsuHcYoaRc1xi6DrFg1WAy/8IL8rCcegcGnLQr6nryFssoUm
 V3n4zi08qR0BYDzyVKTrOunR41RHSWkbV0Ejx2kga7/QnlEQpTtyuQhjSptGQTTZoBwBv8uD7gD
 Ht4PPDNcIE1LYaN1MKXinGpdusXhP+1aJnlT9gw3IwWk86t3HCmxohef5iXVWsHUkLLAvwFwMgc
 vF0AkMjYM211NFtLLHJEEz4IQ9QutJP5n6YasbNIOzxxACXvOp7N9u0vqIgsLzllfUg==
X-Google-Smtp-Source: AGHT+IH94ZUnNGb0lEOVe4bBx+yjJhL5gBjTgdRmkg+90vAKsmFBMP4Z1uTvu/CRcx/fw+MLkWtpGA==
X-Received: by 2002:a05:6402:3593:b0:60c:44d6:281f with SMTP id
 4fb4d7f45d1cf-6149b409f56mr3513844a12.7.1753282367163; 
 Wed, 23 Jul 2025 07:52:47 -0700 (PDT)
Received: from tora.lan (83.22.10.6.ipv4.supernova.orange.pl. [83.22.10.6])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f33964sm8575657a12.18.2025.07.23.07.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 07:52:46 -0700 (PDT)
From: Alicja Michalska <alicja.michalska@9elements.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Alicja Michalska <alicja.michalska@9elements.com>
Subject: [PATCH 2/3] drm: panel: Add support for Samsung EA8076 AMOLED panel
Date: Wed, 23 Jul 2025 16:52:10 +0200
Message-ID: <20250723145208.338162-4-alicja.michalska@9elements.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723145208.338162-2-alicja.michalska@9elements.com>
References: <20250723145208.338162-2-alicja.michalska@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 24 Jul 2025 07:35:09 +0000
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

Signed-off-by: Alicja Michalska <alicja.michalska@9elements.com>
---
 MAINTAINERS                                  |   6 +
 drivers/gpu/drm/panel/Kconfig                |   7 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-samsung-ea8076.c | 274 +++++++++++++++++++
 4 files changed, 288 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ea8076.c

diff --git a/MAINTAINERS b/MAINTAINERS
index dd844ac8d910..d392760bdc34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7673,6 +7673,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
 
+DRM DRIVER FOR SAMSUNG EA8076 PANELS
+M:	Alicja Michalska <alicja.michalska@9elements.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-ea8076.c
+
 DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
 M:	Dzmitry Sankouski <dsankouski@gmail.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index c288dcc87d98..5b594f25a03c 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -729,6 +729,13 @@ config DRM_PANEL_SAMSUNG_S6D7AA0
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 
+config DRM_PANEL_SAMSUNG_EA8076
+	tristate "Samsung EA8076 DSI video mode panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+
 config DRM_PANEL_SAMSUNG_S6E3HA2
 	tristate "Samsung S6E3HA2 DSI video mode panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 40b1693988d6..ce4ea1a9fc61 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_EA8076) += panel-samsung-ea8076.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FA7) += panel-samsung-s6e3fa7.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8) += panel-samsung-s6e3ha8.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-ea8076.c b/drivers/gpu/drm/panel/panel-samsung-ea8076.c
new file mode 100644
index 000000000000..2b01ab113c63
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-ea8076.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Samsung EA8076 (1080x2340 AMOLED) panel driver
+ * Copyright (c) 2025 Alicja Michalska <alicja.michalska@9elements.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+
+#include <video/mipi_display.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct ea8076 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+};
+
+static inline struct ea8076 *to_ea8076(struct drm_panel *panel)
+{
+	return container_of(panel, struct ea8076, panel);
+}
+
+static void ea8076_reset(struct ea8076 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int ea8076_on(struct ea8076 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x01, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x0923);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe9,
+				     0x11, 0x75, 0xa6, 0x75, 0xa3, 0xb6, 0x85,
+				     0x7a, 0x00, 0x32, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1,
+				     0x00, 0x00, 0x02, 0x02, 0x42, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x20);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 67);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int ea8076_off(struct ea8076 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 35);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return dsi_ctx.accum_err;
+}
+
+static int ea8076_prepare(struct drm_panel *panel)
+{
+	struct ea8076 *ctx = to_ea8076(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ea8076_reset(ctx);
+
+	ret = ea8076_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ea8076_unprepare(struct drm_panel *panel)
+{
+	struct ea8076 *ctx = to_ea8076(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = ea8076_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	return 0;
+}
+
+static const struct drm_display_mode ea8076_mode = {
+	.clock = (1080 + 64 + 20 + 64) * (2340 + 64 + 20 + 64) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 64,
+	.hsync_end = 1080 + 64 + 20,
+	.htotal = 1080 + 64 + 20 + 64,
+	.vdisplay = 2340,
+	.vsync_start = 2340 + 64,
+	.vsync_end = 2340 + 64 + 20,
+	.vtotal = 2340 + 64 + 20 + 64,
+	.width_mm = 69,
+	.height_mm = 147,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int ea8076_get_modes(struct drm_panel *panel,
+				   struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &ea8076_mode);
+}
+
+static const struct drm_panel_funcs ea8076_panel_funcs = {
+	.prepare = ea8076_prepare,
+	.unprepare = ea8076_unprepare,
+	.get_modes = ea8076_get_modes,
+};
+
+static int ea8076_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static int ea8076_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return brightness;
+}
+
+static const struct backlight_ops ea8076_bl_ops = {
+	.update_status = ea8076_bl_update_status,
+	.get_brightness = ea8076_bl_get_brightness,
+};
+
+static struct backlight_device *
+ea8076_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 2047,
+		.max_brightness = 2047,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &ea8076_bl_ops, &props);
+}
+
+static int ea8076_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct ea8076 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
+
+	drm_panel_init(&ctx->panel, dev, &ea8076_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = ea8076_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void ea8076_remove(struct mipi_dsi_device *dsi)
+{
+	struct ea8076 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id ea8076_of_match[] = {
+	{ .compatible = "samsung,ea8076" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, ea8076_of_match);
+
+static struct mipi_dsi_driver ea8076_driver = {
+	.probe = ea8076_probe,
+	.remove = ea8076_remove,
+	.driver = {
+		.name = "panel-samsung-ea8076",
+		.of_match_table = ea8076_of_match,
+	},
+};
+module_mipi_dsi_driver(ea8076_driver);
+
+MODULE_AUTHOR("Alicja Michalska <alicja.michalska@9elements.com>");
+MODULE_DESCRIPTION("Samsung EA8076 panel driver");
+MODULE_LICENSE("GPL v2");
-- 
2.50.1

