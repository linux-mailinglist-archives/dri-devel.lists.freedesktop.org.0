Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A156AA7FB1
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 11:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F01E10E0B1;
	Sat,  3 May 2025 09:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bNNzWFVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A1010E0B1
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 09:42:13 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so525836466b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 02:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746265332; x=1746870132; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFuxSn6XO2LJxO7m7jcl/wHqLyG8qlITz6/SsfnYv4s=;
 b=bNNzWFVBE4ARbEAS90fpIXSBRoWGjKCQLnEvzrNKnVHUOORDmCoevVKlvKqEvR25vH
 X/hOZ+X6bgnxng1r29+QQIJClFBkXnK/fzMwojI+9giEw8JaP3wNspadrxL98dqaE8m2
 ks2sB6VZb3q8SlJrmrvKdJUMGgJ9mZjdys29j93UKpgyRAi31qCikqNBJzWOmBdjjbv9
 U/kwciGBcrgOPuCLVCu2eHMmpfGGGn1noa49OO0zQlfjrggwfXf945w198jPIicNFszR
 vgwtbQnuGjJujkmwocACjmO4X43Sq2JUj8r8DfX2IluR9XYczJk24YI0CU3go+Lb8UGh
 lUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746265332; x=1746870132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFuxSn6XO2LJxO7m7jcl/wHqLyG8qlITz6/SsfnYv4s=;
 b=EdbXx3fuvtg92Mc+BYZHkDlqIBZKHrm44Eet+aofIRs2U/8rE/pJ74tsqjtihY5IBA
 wNViIel3M6kPmzZy4DgagvENO68uMz3/FNEF2E40xJ7lTj1Lnco+f8TpVdXiE6Prk8i2
 oXymq6smgqWi4GuVxZGxxGRCqdRV+KfHfvN10WfY1xWZ3RaROIaScEpnsvEho9hKn5fI
 6pVzIot14JuIVR1irdiOSwLmfd1ZUCcGpNM7gbxDnsQHo6EkE72GO5t+RYtJBB/P301S
 PsZ+xhMtJuLsqMCTpbZI9o0uQ/MniOa5DDK5MVuTGW62DAr3kXKwoCpN4VkRHff/vRNS
 04sA==
X-Gm-Message-State: AOJu0Yx++RWLuKliUu/zR/bqrZpaupT8S2cuHmW9H2Jj/lfXe/Fw1Cfo
 xoxi4Ik9i5jR+oX/RY+yEqd26ntn4ZH7rtTgwwbN/H9aztk43v5s
X-Gm-Gg: ASbGncuBPiiD/6108Yh6HCXrTlYEcnX8UKMat8o1q/AIKO9UMk0BGVtlpXreZhtUD64
 ZE0IKuImreYm8itkCrX/r+JH7boKvWWbazkGDBawlCnSgTPYjIJhLEnMN7/ArRrAsufo/jKGTOO
 N6nnZBrY4pkMwvTK1bWY/dJiwsIogwktncldUdlQfT8S/ft/QkxnUao7FAtHAs9+yrVsKy9fcQ5
 EnNluZhvn1cCQDDn8SLWPHrR7lKtfDWh7ah1soRgYLpw1pF1arZElYI9XstawI5qlHGPF5G3cO4
 zcIQg87mQEP/XuSMHZH0RiOrsVgZd5XhuZ7S/Zu5EPE=
X-Google-Smtp-Source: AGHT+IFiJJS9T7yjMh6KUPf0R5CWBIjfNnMiQZyQ8NVplyk1Yyy6iGv/T+u2wGcOvVEica1qbMhlNg==
X-Received: by 2002:a17:906:c109:b0:ace:f075:3e56 with SMTP id
 a640c23a62f3a-acefed6affamr933581166b.11.1746265331555; 
 Sat, 03 May 2025 02:42:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad18950e3ecsm169103966b.160.2025.05.03.02.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 02:42:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] drm: panel: Add support for Renesas R69328 based MIPI
 DSI panel
Date: Sat,  3 May 2025 12:41:49 +0300
Message-ID: <20250503094149.29201-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503094149.29201-1-clamor95@gmail.com>
References: <20250503094149.29201-1-clamor95@gmail.com>
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

From: Maxim Schwalm <maxim.schwalm@gmail.com>

Driver adds support for panels with Renesas R69328 IC

Currently supported compatible is:
- jdi,dx12d100vm0eaa

Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                |  13 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-renesas-r69328.c | 283 +++++++++++++++++++
 3 files changed, 297 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index e8723f42cafb..86c66f818a11 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -618,6 +618,19 @@ config DRM_PANEL_RENESAS_R61307
 	  This panel controller can be found in LG Optimus Vu P895 smartphone
 	  in combination with LCD panel.
 
+config DRM_PANEL_RENESAS_R69328
+	tristate "Renesas R69328 720x1280 DSI video mode panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for JDI dx12d100vm0eaa
+	  IPS-LCD module with Renesas R69328 IC. The panel has a 720x1280
+	  resolution and uses 24 bit RGB per pixel.
+
+	  This panel controller can be found in LG Optimus 4X P895 smartphone
+	  in combination with LCD panel.
+
 config DRM_PANEL_RONBO_RB070D30
 	tristate "Ronbo Electronics RB070D30 panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 61d8853df1a7..37e4e13165a9 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
 obj-$(CONFIG_DRM_PANEL_RENESAS_R61307) += panel-renesas-r61307.o
+obj-$(CONFIG_DRM_PANEL_RENESAS_R69328) += panel-renesas-r69328.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
diff --git a/drivers/gpu/drm/panel/panel-renesas-r69328.c b/drivers/gpu/drm/panel/panel-renesas-r69328.c
new file mode 100644
index 000000000000..ea627660563c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-renesas-r69328.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0
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
+
+#define R69328_MACP		0xb0 /* Manufacturer Access CMD Protect */
+#define   R69328_MACP_ON	0x03
+#define   R69328_MACP_OFF	0x04
+
+#define R69328_GAMMA_SET_A	0xc8 /* Gamma Setting A */
+#define R69328_GAMMA_SET_B	0xc9 /* Gamma Setting B */
+#define R69328_GAMMA_SET_C	0xca /* Gamma Setting C */
+
+#define R69328_POWER_SET	0xd1
+
+struct renesas_r69328 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator *vdd_supply;
+	struct regulator *vddio_supply;
+	struct gpio_desc *reset_gpio;
+
+	bool prepared;
+};
+
+static inline struct renesas_r69328 *to_renesas_r69328(struct drm_panel *panel)
+{
+	return container_of(panel, struct renesas_r69328, panel);
+}
+
+static void renesas_r69328_reset(struct renesas_r69328 *priv)
+{
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+	usleep_range(2000, 3000);
+}
+
+static int renesas_r69328_prepare(struct drm_panel *panel)
+{
+	struct renesas_r69328 *priv = to_renesas_r69328(panel);
+	struct device *dev = &priv->dsi->dev;
+	int ret;
+
+	if (priv->prepared)
+		return 0;
+
+	ret = regulator_enable(priv->vdd_supply);
+	if (ret) {
+		dev_err(dev, "failed to enable vdd power supply\n");
+		return ret;
+	}
+
+	usleep_range(10000, 11000);
+
+	ret = regulator_enable(priv->vddio_supply);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable vddio power supply\n");
+		return ret;
+	}
+
+	usleep_range(10000, 11000);
+
+	renesas_r69328_reset(priv);
+
+	priv->prepared = true;
+	return 0;
+}
+
+static int renesas_r69328_enable(struct drm_panel *panel)
+{
+	struct renesas_r69328 *priv = to_renesas_r69328(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+
+	/* Set address mode */
+	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_dcs_set_pixel_format_multi(&ctx, MIPI_DCS_PIXEL_FMT_24BIT << 4);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+
+	mipi_dsi_msleep(&ctx, 100);
+
+	/* MACP Off */
+	mipi_dsi_generic_write_seq_multi(&ctx, R69328_MACP, R69328_MACP_OFF);
+
+	mipi_dsi_generic_write_seq_multi(&ctx, R69328_POWER_SET, 0x14, 0x1d,
+					 0x21, 0x67, 0x11, 0x9a);
+
+	mipi_dsi_generic_write_seq_multi(&ctx, R69328_GAMMA_SET_A, 0x00, 0x1a,
+					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
+					 0x11, 0x18, 0x1e, 0x1c, 0x00, 0x00, 0x1a,
+					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
+					 0x11, 0x18, 0x1e, 0x1c, 0x00);
+
+	mipi_dsi_generic_write_seq_multi(&ctx, R69328_GAMMA_SET_B, 0x00, 0x1a,
+					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
+					 0x11, 0x18, 0x1e, 0x1c, 0x00, 0x00, 0x1a,
+					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
+					 0x11, 0x18, 0x1e, 0x1c, 0x00);
+
+	mipi_dsi_generic_write_seq_multi(&ctx, R69328_GAMMA_SET_C, 0x00, 0x1a,
+					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
+					 0x11, 0x18, 0x1e, 0x1c, 0x00, 0x00, 0x1a,
+					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
+					 0x11, 0x18, 0x1e, 0x1c, 0x00);
+
+	/* MACP On */
+	mipi_dsi_generic_write_seq_multi(&ctx, R69328_MACP, R69328_MACP_ON);
+
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 50);
+
+	return 0;
+}
+
+static int renesas_r69328_disable(struct drm_panel *panel)
+{
+	struct renesas_r69328 *priv = to_renesas_r69328(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 60);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+
+	return 0;
+}
+
+static int renesas_r69328_unprepare(struct drm_panel *panel)
+{
+	struct renesas_r69328 *priv = to_renesas_r69328(panel);
+
+	if (!priv->prepared)
+		return 0;
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+
+	usleep_range(5000, 6000);
+
+	regulator_disable(priv->vddio_supply);
+	regulator_disable(priv->vdd_supply);
+
+	priv->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode renesas_r69328_mode = {
+	.clock = (720 + 92 + 62 + 4) * (1280 + 6 + 3 + 1) * 60 / 1000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 92,
+	.hsync_end = 720 + 92 + 62,
+	.htotal = 720 + 92 + 62 + 4,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 6,
+	.vsync_end = 1280 + 6 + 3,
+	.vtotal = 1280 + 6 + 3 + 1,
+	.width_mm = 59,
+	.height_mm = 105,
+};
+
+static int renesas_r69328_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &renesas_r69328_mode);
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
+static const struct drm_panel_funcs renesas_r69328_panel_funcs = {
+	.prepare = renesas_r69328_prepare,
+	.enable = renesas_r69328_enable,
+	.disable = renesas_r69328_disable,
+	.unprepare = renesas_r69328_unprepare,
+	.get_modes = renesas_r69328_get_modes,
+};
+
+static int renesas_r69328_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct renesas_r69328 *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->vdd_supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(priv->vdd_supply))
+		return dev_err_probe(dev, PTR_ERR(priv->vdd_supply),
+				     "Failed to get vdd-supply\n");
+
+	priv->vddio_supply = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(priv->vddio_supply))
+		return dev_err_probe(dev, PTR_ERR(priv->vddio_supply),
+				     "Failed to get vddio-supply\n");
+
+	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(priv->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	priv->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, priv);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
+
+	drm_panel_init(&priv->panel, dev, &renesas_r69328_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&priv->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&priv->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret) {
+		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		drm_panel_remove(&priv->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void renesas_r69328_remove(struct mipi_dsi_device *dsi)
+{
+	struct renesas_r69328 *priv = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&priv->panel);
+}
+
+static const struct of_device_id renesas_r69328_of_match[] = {
+	{ .compatible = "jdi,dx12d100vm0eaa" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, renesas_r69328_of_match);
+
+static struct mipi_dsi_driver renesas_r69328_driver = {
+	.probe = renesas_r69328_probe,
+	.remove = renesas_r69328_remove,
+	.driver = {
+		.name = "panel-renesas-r69328",
+		.of_match_table = renesas_r69328_of_match,
+	},
+};
+module_mipi_dsi_driver(renesas_r69328_driver);
+
+MODULE_AUTHOR("Maxim Schwalm <maxim.schwalm@gmail.com>");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Renesas R69328-based panel driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1

