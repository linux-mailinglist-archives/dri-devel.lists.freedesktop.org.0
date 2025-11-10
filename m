Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4022C458EE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651CC10E35F;
	Mon, 10 Nov 2025 09:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VdsRPTAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC74810E35D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:15:27 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-59435d82c1fso2813121e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 01:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762766126; x=1763370926; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=veHv/uRfxtfoSVQhbpvYC1/mXF+mOr0qW/T/KMequQ0=;
 b=VdsRPTAITLgZzDMj6FlKmxzKyXFJCG2UPKea7WY8xnGHAea3byiJEeVCZfJ23AMnIM
 9VcRT/hQx+IJy9KEZJIYF1jr1yr/y1XPcN8sD/GGCaY/AigNhWpIAlASpCfE8vlTMzn2
 vJXZOoIVNiQXfY370l3lEBJCxqVA5qtBs0OeezLi3UQofupTc8wfFWLD94vxSfECh1Sn
 18nS8XTkThpfqL87jSGEDo1zMg/a0maNLx8w+BKpQ6sGpaI6fHI+xqJLBmOjD6FEXkey
 K0zrUuQEsTlvfoqPuFLZCferjWrpXGfOVTbxuAjhTEAJtqLpI4WyK81MtV1vxsxXZ8+t
 xRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762766126; x=1763370926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=veHv/uRfxtfoSVQhbpvYC1/mXF+mOr0qW/T/KMequQ0=;
 b=j6itwcgVkoI5aF0RAHadFqNQSn2WNLf7Ag+KkrLLJJGo275GN+aouD8MwOozz48Bm3
 5iwiSX/iN419dXn94M0V6cPrOFmtNPQ/bmXjOwjMj73TP1MRVGzCE8xWlI3b8TIKRvqV
 09iidB4JrZnp+JUk3GhvX1ewu8nYmY2BtU5jQRITICaRt5ZiVpm5mqnqTvCYQK5oVLLj
 20jRL/0HwiRJCs9rfAPfWtwllY6YvxaFEVMtPaVm+ByB4yLDLuaPGyy/YvYTTNXVvgVN
 1wV6vAgeNqlNgEbUsIXL2qM5m0kHtckD+APMPcuikwQREDQPosSCmHZ69ySEw/qmF1OR
 fXzQ==
X-Gm-Message-State: AOJu0YxY7nM+LesUC2O3oE0LjrSLMJiViHKYA25HKRjwldHvkz4DryDD
 ZzcUe2M+CuD5AwHJovcTqcYQ+Mw689t1eYekmQu/WNzGW1RieED5o9f6
X-Gm-Gg: ASbGncs/VtsylcKPlP4Ny+RBhRpo5vNr8NV+lihjg027TE0cqi74iFynIPDsHlOMnUv
 8fcv1XKFtnY8QAPUwE3hZcIhCCQ/du2lgrYYY9l5bZ7Y7ZRvZmrolwJebj63VFXUo3me00R9rU2
 yWyKlywEO+WNbyLOerHa/mvYmJp84AP2t/HjnsvqZj/7vlaPz7OytTL0EAVFWp2BZNjUJ3DFvdT
 cO0AAfIavoR12AR0bVdD4ITva4Wup/l+tAaRLpeYAoyi6Vcpw91IgRNNb8EpthaZg0VPhHvXsw/
 lYWUx5ah8PPM/6leu6oirIODe7UfOhs7hpxenn2VOMgUycc5yCd+eWdWzjXv6e1af04C3xWY8DX
 PjMblCt+pEy+aCqP1ZMDKhmA7lQQ4smmFOgF6wTABGqd7dB3LuIHNVLHNOJq9L3AY
X-Google-Smtp-Source: AGHT+IEYKC+UVtlSAdBpY8qGaxywx7G3p1nhsry/fr15fjGb+9mY1iP3g5oIkKF/qfU4YqicbtZh9Q==
X-Received: by 2002:a05:6512:a96:b0:592:f44e:a28b with SMTP id
 2adb3069b0e04-5945f1dfb7bmr2195041e87.57.1762766125833; 
 Mon, 10 Nov 2025 01:15:25 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 01:15:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
Subject: [PATCH v3 2/7 RESEND] gpu/drm: panel: add support for LG
 LD070WX3-SL01 MIPI DSI panel
Date: Mon, 10 Nov 2025 11:14:32 +0200
Message-ID: <20251110091440.5251-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/Kconfig             |  13 ++
 drivers/gpu/drm/panel/Makefile            |   1 +
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c | 184 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c      |  31 ----
 4 files changed, 198 insertions(+), 31 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 045ffb2ccd0f..1f660ba065a1 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -408,6 +408,19 @@ config DRM_PANEL_LG_LB035Q02
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
index 0356775a443a..9281221183ac 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
 obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
 obj-$(CONFIG_DRM_PANEL_LINCOLNTECH_LCD197) += panel-lincolntech-lcd197.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
+obj-$(CONFIG_DRM_PANEL_LG_LD070WX3) += panel-lg-ld070wx3.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
 obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
diff --git a/drivers/gpu/drm/panel/panel-lg-ld070wx3.c b/drivers/gpu/drm/panel/panel-lg-ld070wx3.c
new file mode 100644
index 000000000000..00cbfc5518a5
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lg-ld070wx3.c
@@ -0,0 +1,184 @@
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
+static const struct regulator_bulk_data lg_ld070wx3_supplies[] = {
+	{ .supply = "vdd" }, { .supply = "vcc" },
+};
+
+struct lg_ld070wx3 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator_bulk_data *supplies;
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
+	ret = regulator_bulk_enable(ARRAY_SIZE(lg_ld070wx3_supplies), priv->supplies);
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
+	return ctx.accum_err;
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
+	regulator_bulk_disable(ARRAY_SIZE(lg_ld070wx3_supplies), priv->supplies);
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
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(lg_ld070wx3_supplies),
+					    lg_ld070wx3_supplies, &priv->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get supplies\n");
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
index da6b71b70a46..6369e5828189 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -5600,34 +5600,6 @@ static const struct panel_desc_dsi boe_tv080wum_nl0 = {
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
@@ -5751,9 +5723,6 @@ static const struct of_device_id dsi_of_match[] = {
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

