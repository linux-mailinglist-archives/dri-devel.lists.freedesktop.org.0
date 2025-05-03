Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F5AA7FB2
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 11:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B004110E1D0;
	Sat,  3 May 2025 09:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="djhh0uVg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEFE10E00E
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 09:42:10 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so463277066b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 02:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746265329; x=1746870129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPyXbL2BWEVNxz3Mvv3R8Wv4wDVHdoOgC6e7Pbh1SZM=;
 b=djhh0uVgDVoWgnIOuizBvet0Gp17ExRh8SBJev4/9PdXYYRLZkb341xz/quNnxQAeh
 rGJUU0EvWWycBXwdHrdgWkybGG7xvsglCkPq7dHOcvVHv/mXZiLpqt9hBsH8sfDc0T6T
 UG5wfArKTSdL6kTOFL0aewMBzpU42qQ1X78DleCWFlMnaf1WVrVMsnBANfVy2aMuc+u1
 J9E5WgIcX7tkv2q4BRzP4ev/dRnXWCUp2tI8v4ZZ6i73dajY2vvdFZuulfuSAdOBZf2j
 I15SO/etydOqYxLSClXB5mpxkmhLEzOb86mBqG65v3zaNyyWzIFnfTkmCGptWAHYhrwW
 bgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746265329; x=1746870129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IPyXbL2BWEVNxz3Mvv3R8Wv4wDVHdoOgC6e7Pbh1SZM=;
 b=g+9tgJeIHw2eIuCXuivgX6kQLaqygXhJbbmGB7I/DQCUk15xNqsL3A3voPCpDs9MxG
 MC6VH2qahTdOoiO2IaACp13AjOFOSqj+UlKk7Jiwln1ih27D/d2tPn+OxUIuPkoUfpsw
 Q8jkGW2tQJpX3i5PiWQJ/jD4kpKC9EnhnATkpzKlZ78Vg4kUhqdOyUq7ZVUuiE0Dcx6d
 cbBK9s7gMsOF0IAqo6Zv1+T4CBfkwJGVDC/R3GxvFPEQNCLw0YX49SwGIjBaxNOUDzLR
 b8cIQ6QeMIGb0rFmPaEMsNMbLcwwCXT4wkmgOvTQlCm6YBoEdh67SLqIKmWDyHi0gUDe
 /cKQ==
X-Gm-Message-State: AOJu0YyH0y0Yf+ja5iXvzQpBd5rDI6ox/rqvQfp8UXhjyyob2yMD7nee
 JKwvVBBBeV79YrNJC3ByVdlDw4+A5r8gcicOKuhuvWWFgv4loYzf
X-Gm-Gg: ASbGncsRP57xxNDmREE2b+UJ5UcAtBIspE+h6c3Q0enXINMHqYkhOJFEXMAbfrZzOKa
 bGPWRk5C/wzFoBz2qtVaF0gAWgOwgvmjZ4M3RaY++Y522FSqvxPJEpAZN5Jj0AuEobGiPjtZ5UV
 zxJvs2/zgGr9DhczMav4GNGKQF+LHxU6nUNogYtAl1ixVR2iq6ItfyXoY5qXDtKc9EomBPtxsrV
 CgAWR/Mkyql8cByVyP/ceGBqE30vbl17G6OQ11DgZfDF18JW8JBwfHPIcUCXk2uAGSVNua8bonz
 JBYcwaIaVbG5o38ngd1fn8tgH7aDhGjTQNY0a6/Y0UQ=
X-Google-Smtp-Source: AGHT+IGE3twEcRTEvEf6/ewloLzSFwC0DVEiOu/QU7XwlCDLp/JJm49t3OUD0papLUygjV9WXFMLfA==
X-Received: by 2002:a17:907:3d90:b0:ac2:9c7d:e144 with SMTP id
 a640c23a62f3a-ad1a4acf69cmr38971666b.40.1746265328774; 
 Sat, 03 May 2025 02:42:08 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad18950e3ecsm169103966b.160.2025.05.03.02.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 02:42:08 -0700 (PDT)
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
Subject: [PATCH v2 2/4] drm: panel: Add support for Renesas R61307 based MIPI
 DSI panel
Date: Sat,  3 May 2025 12:41:47 +0300
Message-ID: <20250503094149.29201-3-clamor95@gmail.com>
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

R61307 is liquid crystal driver for high-definition amorphous silicon
(a-Si) panels and is ideal for tablets and smartphones.

Supported compatibles are:
- hit,tx13d100vm0eaa
- koe,tx13d100vm0eaa

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                |  13 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-renesas-r61307.c | 327 +++++++++++++++++++
 3 files changed, 341 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d7469c565d1d..e8723f42cafb 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -605,6 +605,19 @@ config DRM_PANEL_RAYDIUM_RM69380
 	  This panel controller can be found in the Lenovo Xiaoxin Pad Pro 2021
 	  in combination with an EDO OLED panel.
 
+config DRM_PANEL_RENESAS_R61307
+	tristate "Renesas R61307 DSI video mode panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for KOE tx13d100vm0eaa
+	  IPS-LCD module with Renesas R69328 IC. The panel has a 1024x768
+	  resolution and uses 24 bit RGB per pixel.
+
+	  This panel controller can be found in LG Optimus Vu P895 smartphone
+	  in combination with LCD panel.
+
 config DRM_PANEL_RONBO_RB070D30
 	tristate "Ronbo Electronics RB070D30 panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 7dcf72646cac..61d8853df1a7 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
+obj-$(CONFIG_DRM_PANEL_RENESAS_R61307) += panel-renesas-r61307.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
new file mode 100644
index 000000000000..4406f00c5932
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
@@ -0,0 +1,327 @@
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
+#define R61307_MACP		0xb0 /* Manufacturer CMD Protect */
+#define   R61307_MACP_ON	0x03
+#define   R61307_MACP_OFF	0x04
+
+#define R61307_INVERSION	0xc1
+#define R61307_GAMMA_SET_A	0xc8 /* Gamma Setting A */
+#define R61307_GAMMA_SET_B	0xc9 /* Gamma Setting B */
+#define R61307_GAMMA_SET_C	0xca /* Gamma Setting C */
+#define R61307_CONTRAST_SET	0xcc
+
+struct renesas_r61307 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator *vcc_supply;
+	struct regulator *iovcc_supply;
+
+	struct gpio_desc *reset_gpio;
+
+	bool prepared;
+
+	bool dig_cont_adj;
+	bool inversion;
+	u32 gamma;
+};
+
+static const u8 gamma_setting[][25] = {
+	{ /* sentinel */ },
+	{
+		R61307_GAMMA_SET_A,
+		0x00, 0x06, 0x0a, 0x0f,
+		0x14, 0x1f, 0x1f, 0x17,
+		0x12, 0x0c, 0x09, 0x06,
+		0x00, 0x06, 0x0a, 0x0f,
+		0x14, 0x1f, 0x1f, 0x17,
+		0x12, 0x0c, 0x09, 0x06
+	},
+	{
+		R61307_GAMMA_SET_A,
+		0x00, 0x05, 0x0b, 0x0f,
+		0x11, 0x1d, 0x20, 0x18,
+		0x18, 0x09, 0x07, 0x06,
+		0x00, 0x05, 0x0b, 0x0f,
+		0x11, 0x1d, 0x20, 0x18,
+		0x18, 0x09, 0x07, 0x06
+	},
+	{
+		R61307_GAMMA_SET_A,
+		0x0b, 0x0d, 0x10, 0x14,
+		0x13, 0x1d, 0x20, 0x18,
+		0x12, 0x09, 0x07, 0x06,
+		0x0a, 0x0c, 0x10, 0x14,
+		0x13, 0x1d, 0x20, 0x18,
+		0x12, 0x09, 0x07, 0x06
+	},
+};
+
+static inline struct renesas_r61307 *to_renesas_r61307(struct drm_panel *panel)
+{
+	return container_of(panel, struct renesas_r61307, panel);
+}
+
+static void renesas_r61307_reset(struct renesas_r61307 *priv)
+{
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+	usleep_range(2000, 3000);
+}
+
+static int renesas_r61307_prepare(struct drm_panel *panel)
+{
+	struct renesas_r61307 *priv = to_renesas_r61307(panel);
+	struct device *dev = &priv->dsi->dev;
+	int ret;
+
+	if (priv->prepared)
+		return 0;
+
+	ret = regulator_enable(priv->vcc_supply);
+	if (ret) {
+		dev_err(dev, "failed to enable vcc power supply\n");
+		return ret;
+	}
+
+	usleep_range(2000, 3000);
+
+	ret = regulator_enable(priv->iovcc_supply);
+	if (ret) {
+		dev_err(dev, "failed to enable iovcc power supply\n");
+		return ret;
+	}
+
+	usleep_range(2000, 3000);
+
+	renesas_r61307_reset(priv);
+
+	priv->prepared = true;
+	return 0;
+}
+
+static int renesas_r61307_enable(struct drm_panel *panel)
+{
+	struct renesas_r61307 *priv = to_renesas_r61307(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 80);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_msleep(&ctx, 20);
+
+	mipi_dsi_dcs_set_pixel_format_multi(&ctx, MIPI_DCS_PIXEL_FMT_24BIT << 4);
+
+	/* MACP Off */
+	mipi_dsi_generic_write_seq_multi(&ctx, R61307_MACP, R61307_MACP_OFF);
+
+	if (priv->dig_cont_adj)
+		mipi_dsi_generic_write_seq_multi(&ctx, R61307_CONTRAST_SET,
+						 0xdc, 0xb4, 0xff);
+
+	if (priv->gamma)
+		mipi_dsi_generic_write_multi(&ctx, gamma_setting[priv->gamma],
+					     sizeof(gamma_setting[priv->gamma]));
+
+	if (priv->inversion)
+		mipi_dsi_generic_write_seq_multi(&ctx, R61307_INVERSION,
+						 0x00, 0x50, 0x03, 0x22,
+						 0x16, 0x06, 0x60, 0x11);
+	else
+		mipi_dsi_generic_write_seq_multi(&ctx, R61307_INVERSION,
+						 0x00, 0x10, 0x03, 0x22,
+						 0x16, 0x06, 0x60, 0x01);
+
+	/* MACP On */
+	mipi_dsi_generic_write_seq_multi(&ctx, R61307_MACP, R61307_MACP_ON);
+
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 50);
+
+	return 0;
+}
+
+static int renesas_r61307_disable(struct drm_panel *panel)
+{
+	struct renesas_r61307 *priv = to_renesas_r61307(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 100);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+
+	return 0;
+}
+
+static int renesas_r61307_unprepare(struct drm_panel *panel)
+{
+	struct renesas_r61307 *priv = to_renesas_r61307(panel);
+
+	if (!priv->prepared)
+		return 0;
+
+	usleep_range(10000, 11000);
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(5000, 6000);
+
+	regulator_disable(priv->iovcc_supply);
+	usleep_range(2000, 3000);
+	regulator_disable(priv->vcc_supply);
+
+	priv->prepared = false;
+	return 0;
+}
+
+static const struct drm_display_mode renesas_r61307_mode = {
+	.clock = (768 + 116 + 81 + 5) * (1024 + 24 + 8 + 2) * 60 / 1000,
+	.hdisplay = 768,
+	.hsync_start = 768 + 116,
+	.hsync_end = 768 + 116 + 81,
+	.htotal = 768 + 116 + 81 + 5,
+	.vdisplay = 1024,
+	.vsync_start = 1024 + 24,
+	.vsync_end = 1024 + 24 + 8,
+	.vtotal = 1024 + 24 + 8 + 2,
+	.width_mm = 76,
+	.height_mm = 101,
+};
+
+static int renesas_r61307_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &renesas_r61307_mode);
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
+static const struct drm_panel_funcs renesas_r61307_panel_funcs = {
+	.prepare = renesas_r61307_prepare,
+	.enable = renesas_r61307_enable,
+	.disable = renesas_r61307_disable,
+	.unprepare = renesas_r61307_unprepare,
+	.get_modes = renesas_r61307_get_modes,
+};
+
+static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct renesas_r61307 *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->vcc_supply = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(priv->vcc_supply))
+		return dev_err_probe(dev, PTR_ERR(priv->vcc_supply),
+				     "Failed to get vcc-supply\n");
+
+	priv->iovcc_supply = devm_regulator_get(dev, "iovcc");
+	if (IS_ERR(priv->iovcc_supply))
+		return dev_err_probe(dev, PTR_ERR(priv->iovcc_supply),
+				     "Failed to get iovcc-supply\n");
+
+	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
+				     "Failed to get reset gpios\n");
+
+	if (device_property_read_bool(dev, "renesas,inversion"))
+		priv->inversion = true;
+
+	if (device_property_read_bool(dev, "renesas,contrast"))
+		priv->dig_cont_adj = true;
+
+	priv->gamma = 0;
+	device_property_read_u32(dev, "renesas,gamma", &priv->gamma);
+
+	priv->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, priv);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
+
+	drm_panel_init(&priv->panel, dev, &renesas_r61307_panel_funcs,
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
+static void renesas_r61307_remove(struct mipi_dsi_device *dsi)
+{
+	struct renesas_r61307 *priv = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&priv->panel);
+}
+
+static const struct of_device_id renesas_r61307_of_match[] = {
+	{ .compatible = "hit,tx13d100vm0eaa" },
+	{ .compatible = "koe,tx13d100vm0eaa" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, renesas_r61307_of_match);
+
+static struct mipi_dsi_driver renesas_r61307_driver = {
+	.probe = renesas_r61307_probe,
+	.remove = renesas_r61307_remove,
+	.driver = {
+		.name = "panel-renesas-r61307",
+		.of_match_table = renesas_r61307_of_match,
+	},
+};
+module_mipi_dsi_driver(renesas_r61307_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Renesas R61307-based panel driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1

