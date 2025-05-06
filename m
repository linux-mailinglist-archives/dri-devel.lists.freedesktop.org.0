Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B934AABF6B
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 11:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7380410E077;
	Tue,  6 May 2025 09:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nDWAH1eD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1BE10E625
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 09:27:33 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5f728aeedacso7895583a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746523651; x=1747128451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LPsMRRyqU9kLt4ctQ/S1nlywRWwftNW4JfqL3Gg9Xk0=;
 b=nDWAH1eDNDhzQ3wBhkVa1O2L8r8PJjxNDlrm6Ddd8SjfvXrI4+sbwTLWs21zk4ikgA
 a8+BD99jIbadx+mAlg61IrvKdoVlxSlv7Vw6kfvqsTmfc+K6+GplMLyIkJJtm94jSoH5
 6UjwK+XKbrTCzbmxvralk8mwWiw51BnaKFc+QiSg6ZZufuv3kkOYrG9taMckeBQoaX0b
 KR947jhTiwh75e5vsvaPQnOqpcvon/UeWFyqRUGL5K8qZC+UCubNEJdFlpsGNHlPzE+U
 FZXLAIhemxfTo4sML6jYdxBew+dW0JMBmgEr3AC8hCXt29PbYw1akt83I0eid1uv9hGF
 jBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746523651; x=1747128451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LPsMRRyqU9kLt4ctQ/S1nlywRWwftNW4JfqL3Gg9Xk0=;
 b=KbvJrzScdim/ErI0inQPCymNjmAQdOfwRYIQ9eZqOmn6eL0Vdsrwc/8JH2eDaWxwLU
 zHlfsnLfRjBQvt7k8Ty3oYY9hwNSV1F4RWZtuN+MBN6QN5CKc1F3cLbW7kAiybyWNLkH
 635CPnv/3EEHfelPkD63QzZWbifHx0lqHBiY6B/PfIiDQVhnuDTVSv0+2KGrmNmb+qOy
 qYO4jQcjbfSvWD41lzgU6okkwi1oOZM2v1SNaLMpzhxmUzgUI0j4FlyWHSZcMOfwgyEv
 Lp4tA0srx3dvNIHPXEQKYJQMVCI2O1YLN3+KyUxdu92H+0ARZpIHS87C+kQfW5cx/Nwt
 UeOQ==
X-Gm-Message-State: AOJu0YyiUcT/uQLNkOQLx0ObYbyDh5IHZewcqa315bELK0Y54LIGLHGr
 QTfH+P2eI7rjaTPnv2mX2PEqvBZVOEIcq5u5Ws5R7FoxCnon+7X1
X-Gm-Gg: ASbGncsBDvDBehH/tGhOxrmRwbtS3WJvKXJrkmKWT2iSy33gG1Iws+iIVGq+mYH1IfM
 bZaxKa+rI3FnQhodoc+ds8U7baxCZ8zxk+gtOcU0fs+DH79zz+usEj88D3C64Gi+N1JVEbmiEYF
 6b/jrSwdn1u3aUQi2JkEzWNdSsRFzUIDq+tthv3Lt+x8XDYx7KVcA5yD5Qvnlxd1H3AJN3I3dlF
 2QTCgM6SzpZsD1rYOtge8Q9nOv1VvlFrF/hNSB8m4fAXfZhFfPuClsjD56/RXa6Bu9NiYTPbTuo
 iBQQUyTDO5DIjOL8db5fX0sm/OpJiM4w
X-Google-Smtp-Source: AGHT+IF0G52K5OTADThlZDTrSm95WmPjzAO5b6B7TD2AwzGrMQeRJpmOGTQWhJTo8w20KM+D00kqDg==
X-Received: by 2002:a05:6402:d0e:b0:5f3:4665:bfa5 with SMTP id
 4fb4d7f45d1cf-5fab05e1bbcmr8721986a12.33.1746523650457; 
 Tue, 06 May 2025 02:27:30 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa77756206sm7349523a12.3.2025.05.06.02.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 02:27:30 -0700 (PDT)
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
Subject: [PATCH v3 2/4] drm: panel: Add support for Renesas R61307 based MIPI
 DSI panel
Date: Tue,  6 May 2025 12:27:16 +0300
Message-ID: <20250506092718.106088-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506092718.106088-1-clamor95@gmail.com>
References: <20250506092718.106088-1-clamor95@gmail.com>
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                |  13 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-renesas-r61307.c | 325 +++++++++++++++++++
 3 files changed, 339 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 639f4324db61..d15ad60d977f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -635,6 +635,19 @@ config DRM_PANEL_RAYDIUM_RM69380
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
index 5eec88e4ac3d..196288532c9f 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67200) += panel-raydium-rm67200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
+obj-$(CONFIG_DRM_PANEL_RENESAS_R61307) += panel-renesas-r61307.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
new file mode 100644
index 000000000000..319415194839
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
@@ -0,0 +1,325 @@
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
+	priv = devm_drm_panel_alloc(dev, struct renesas_r61307, panel,
+				    &renesas_r61307_panel_funcs,
+				    DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
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
+	ret = drm_panel_of_backlight(&priv->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&priv->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret) {
+		drm_panel_remove(&priv->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
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

