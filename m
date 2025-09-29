Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BCABA98B2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1206710E43B;
	Mon, 29 Sep 2025 14:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YbU93qLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092C610E428
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:25:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-370f3111dedso34064751fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759155921; x=1759760721; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ELe2vhfEw39oaGK6Kto/c+ZIf5LvyG/wUb5bXZqNKjM=;
 b=YbU93qLmk9caqeuMLjxovqsxsLheNawqZXcUgWddWK8uulrZgLnL5IqtMdkK/QdiZX
 VA+C+HsBys25u6WVRa97C7dtd4KsilFLDw/BQU/IydTrRoKYYR28K8md/1lkJ53207Kt
 phXUToMPwSCDdEMQ+54S8F+fHkO5mM+2d4LPkdDRnTouaF+tQMNH6vnWR7o0SfncQpNd
 R0WCDXWPOFdjRBtNJRowg2ETeOoCWjRfFPUEXXZGvbIK0S0NT193GItVZDi87cJEwTbN
 5Ik1A9UdP4vw310sj+VpTDOKw2u8deVwDPsCE9M+BktM7tkyW3lbIbmPOe+DSQyevJrY
 8v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759155921; x=1759760721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ELe2vhfEw39oaGK6Kto/c+ZIf5LvyG/wUb5bXZqNKjM=;
 b=Qi4tujDyiZOEPB77Dx1UfV3mzjufOgTSxKVviss4ioCYIl9sQ9zUHoQEb+9fUlRTv2
 7pI9unDS5D+lcrFWjwttob3WMg1eSv2gXxEWsIT6h0izI59ZWnnOENk7EMT7tz8dpXL+
 yFUOXy0AyoDLM5Dc798PvtQ20hnSFrdU+hvlUk/xfKYN0+q6R3ukmSFtF/fuXF3IY8+c
 Yn5mDf45ohcVBDAqOQWYyGeM8GTrwfnCNeXX8XBVD0+CaEpyCNVXJUWxyl+0b1mptY0D
 tQI1S5KnEPjQcVEtkxzOze0eQAHsNIrXmK6+tDraB9gzelfQBobifX0/BdoK95UL5Yvg
 F69g==
X-Gm-Message-State: AOJu0Yz0d4QWk4KKQNY8alvJEcwJrttYo92Yde5eaWiOxYfcV0VG3njn
 99KOF/T4BgH3lnXoPKqfMKp364XFWad6yuo8PmXgVSdNx05MRqyI1RTI
X-Gm-Gg: ASbGncu7CJoPu3zrg21vWi3lKiuK7cfkyQzutDEMYrt/q8l8U8+OXLwZ42bRhqKpvgR
 aZEP3KNE6sp/4ZQ1d4RDO+Y9t/YUJowyCcfca+Yx6PvEHNiboW8pFizrzAmwPQe1+dnnPWfwuJq
 DbsEY75kPz3Z41Hc1KfQar7cFLlBCgZXfYzuk3r9XCtW5mQMUF0qUsTu1XlxmeGRL0hD/Xu4haS
 odttFyAoiaUxGk4jHP2cFJULN52mS5T60u4LCJaokeNbLu+cTRBNYjy7z2/6NEGG+gdQrfAVHUK
 fSD1rPTax+usfVySmm+HM86ZiJ7b4yafLtAi26AJF3GHQHoD9H1++KKjtzoEY6/ew+yjZAPnOFu
 E/yiMi2oYl/5r+i4/TifLTDaX
X-Google-Smtp-Source: AGHT+IGN10WWShi/9Wp0wIZcksW5AO9ghOe0ooW53NJcadk31t/3RmEZnGFoAU3Fq/6WZIo0oJrADQ==
X-Received: by 2002:a05:651c:23d2:20b0:372:950f:2b1b with SMTP id
 38308e7fff4ca-372fa222e8dmr2148641fa.9.1759155920935; 
 Mon, 29 Sep 2025 07:25:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 07:25:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/8] gpu/drm: panel: add support for LG LD070WX3-SL01 MIPI
 DSI panel
Date: Mon, 29 Sep 2025 17:24:48 +0300
Message-ID: <20250929142455.24883-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250929142455.24883-1-clamor95@gmail.com>
References: <20250929142455.24883-1-clamor95@gmail.com>
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

The LD070WX3 is a Color Active Matrix Liquid Crystal Display with an
integral Light Emitting Diode (LED) backlight system. The matrix employs
a-Si Thin Film Transistor as the active element. It is a transmissive type
display operating in the normally Black mode. This TFT-LCD has 7.0 inches
diagonally measured active display area with WXGA resolution (800 by 1280
pixel array).

LG LD070WX3-SL01 MIPI DSI panel was treated as simple DSI panel when it is
actually not and requires proper setup for correct work. Simple panel work
relied on preliminary configuration done by bootloader.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig             |  13 ++
 drivers/gpu/drm/panel/Makefile            |   1 +
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c | 182 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c      |  31 ----
 4 files changed, 196 insertions(+), 31 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index aad4e0da8f75..ca5c5e60cfa1 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -398,6 +398,19 @@ config DRM_PANEL_LG_LB035Q02
 	  (found on the Gumstix Overo Palo35 board). To compile this driver as
 	  a module, choose M here.
 
+config DRM_PANEL_LG_LD070WX3
+	tristate "LG LD070WX3 MIPI DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y here if you want to enable support for the LD070WX3 MIPI DSI
+	  panel found in the NVIDIA Tegra Note 7 tablet.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called panel-lg-ld070wx3.
+
 config DRM_PANEL_LG_LG4573
 	tristate "LG4573 RGB/SPI panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index a6a100e4c4e6..a673a74cd371 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
 obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
 obj-$(CONFIG_DRM_PANEL_LINCOLNTECH_LCD197) += panel-lincolntech-lcd197.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
+obj-$(CONFIG_DRM_PANEL_LG_LD070WX3) += panel-lg-ld070wx3.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
 obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
diff --git a/drivers/gpu/drm/panel/panel-lg-ld070wx3.c b/drivers/gpu/drm/panel/panel-lg-ld070wx3.c
new file mode 100644
index 000000000000..da46a317a749
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lg-ld070wx3.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/array_size.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct lg_ld070wx3 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator_bulk_data supplies[2];
+};
+
+static inline struct lg_ld070wx3 *to_lg_ld070wx3(struct drm_panel *panel)
+{
+	return container_of(panel, struct lg_ld070wx3, panel);
+}
+
+static int lg_ld070wx3_prepare(struct drm_panel *panel)
+{
+	struct lg_ld070wx3 *priv = to_lg_ld070wx3(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+	struct device *dev = panel->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable power supplies: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * According to spec delay between enabling supply is 0,
+	 * for regulators to reach required voltage ~5ms needed.
+	 * MIPI interface signal for setup requires additional
+	 * 110ms which in total results in 115ms.
+	 */
+	mdelay(115);
+
+	mipi_dsi_dcs_soft_reset_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 20);
+
+	/* Differential input impedance selection */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xae, 0x0b);
+
+	/* Enter test mode 1 and 2*/
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xee, 0xea);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x5f);
+
+	/* Increased MIPI CLK driving ability */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x68);
+
+	/* Exit test mode 1 and 2 */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xee, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x00);
+
+	return 0;
+}
+
+static int lg_ld070wx3_unprepare(struct drm_panel *panel)
+{
+	struct lg_ld070wx3 *priv = to_lg_ld070wx3(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+
+	msleep(50);
+
+	regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->supplies);
+
+	/* power supply must be off for at least 1s after panel disable */
+	msleep(1000);
+
+	return 0;
+}
+
+static const struct drm_display_mode lg_ld070wx3_mode = {
+	.clock = (800 + 32 + 48 + 8) * (1280 + 5 + 3 + 1) * 60 / 1000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 32,
+	.hsync_end = 800 + 32 + 48,
+	.htotal = 800 + 32 + 48 + 8,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 5,
+	.vsync_end = 1280 + 5 + 3,
+	.vtotal = 1280 + 5 + 3 + 1,
+	.width_mm = 94,
+	.height_mm = 151,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int lg_ld070wx3_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &lg_ld070wx3_mode);
+}
+
+static const struct drm_panel_funcs lg_ld070wx3_panel_funcs = {
+	.prepare = lg_ld070wx3_prepare,
+	.unprepare = lg_ld070wx3_unprepare,
+	.get_modes = lg_ld070wx3_get_modes,
+};
+
+static int lg_ld070wx3_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct lg_ld070wx3 *priv;
+	int ret;
+
+	priv = devm_drm_panel_alloc(dev, struct lg_ld070wx3, panel,
+				    &lg_ld070wx3_panel_funcs,
+				    DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	priv->supplies[0].supply = "vcc";
+	priv->supplies[1].supply = "vdd";
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(priv->supplies), priv->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	priv->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, priv);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
+
+	ret = drm_panel_of_backlight(&priv->panel);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get backlight\n");
+
+	drm_panel_add(&priv->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		drm_panel_remove(&priv->panel);
+		return dev_err_probe(dev, ret, "failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void lg_ld070wx3_remove(struct mipi_dsi_device *dsi)
+{
+	struct lg_ld070wx3 *priv = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&priv->panel);
+}
+
+static const struct of_device_id lg_ld070wx3_of_match[] = {
+	{ .compatible = "lg,ld070wx3-sl01" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, lg_ld070wx3_of_match);
+
+static struct mipi_dsi_driver lg_ld070wx3_driver = {
+	.driver = {
+		.name = "panel-lg-ld070wx3",
+		.of_match_table = lg_ld070wx3_of_match,
+	},
+	.probe = lg_ld070wx3_probe,
+	.remove = lg_ld070wx3_remove,
+};
+module_mipi_dsi_driver(lg_ld070wx3_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("LG LD070WX3-SL01 DSI panel driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9f81fa960b46..ea2cdddb9b8f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -5512,34 +5512,6 @@ static const struct panel_desc_dsi boe_tv080wum_nl0 = {
 	.lanes = 4,
 };
 
-static const struct drm_display_mode lg_ld070wx3_sl01_mode = {
-	.clock = 71000,
-	.hdisplay = 800,
-	.hsync_start = 800 + 32,
-	.hsync_end = 800 + 32 + 1,
-	.htotal = 800 + 32 + 1 + 57,
-	.vdisplay = 1280,
-	.vsync_start = 1280 + 28,
-	.vsync_end = 1280 + 28 + 1,
-	.vtotal = 1280 + 28 + 1 + 14,
-};
-
-static const struct panel_desc_dsi lg_ld070wx3_sl01 = {
-	.desc = {
-		.modes = &lg_ld070wx3_sl01_mode,
-		.num_modes = 1,
-		.bpc = 8,
-		.size = {
-			.width = 94,
-			.height = 151,
-		},
-		.connector_type = DRM_MODE_CONNECTOR_DSI,
-	},
-	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS,
-	.format = MIPI_DSI_FMT_RGB888,
-	.lanes = 4,
-};
-
 static const struct drm_display_mode lg_lh500wx1_sd03_mode = {
 	.clock = 67000,
 	.hdisplay = 720,
@@ -5663,9 +5635,6 @@ static const struct of_device_id dsi_of_match[] = {
 	}, {
 		.compatible = "boe,tv080wum-nl0",
 		.data = &boe_tv080wum_nl0
-	}, {
-		.compatible = "lg,ld070wx3-sl01",
-		.data = &lg_ld070wx3_sl01
 	}, {
 		.compatible = "lg,lh500wx1-sd03",
 		.data = &lg_lh500wx1_sd03
-- 
2.48.1

