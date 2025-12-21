Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959E5CD4694
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 00:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6308910E2C1;
	Sun, 21 Dec 2025 23:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E8110E2C1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 23:32:18 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1F7B11F8D5;
 Mon, 22 Dec 2025 00:32:16 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 22 Dec 2025 00:32:09 +0100
Subject: [PATCH v2 03/11] drm/panel: Add LGD LH599QH3-EDB1 panel driver for
 Sony Xperia XZ3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-drm-panels-sony-v2-3-82a87465d163@somainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Casey Connolly <casey.connolly@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13560;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=aakIP0/P/4gYIuZGysXPPNSVNKO3o0juJpt5+c0Gd5Y=;
 b=owEBbQKS/ZANAwAKAfFi0jHH5IZ2AcsmYgBpSIN7yxJhNAjNI79YgjNc9vBLGpntGmLcP3d0i
 bdM2AHwmF6JAjMEAAEKAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCaUiDewAKCRDxYtIxx+SG
 dgTlEACHvs4ElKaIvrG3Mu9e8+i/pjF2MIg73J1tJRs1jKWeDbxzi+nuVruGTWRv/nLea7Nvl6A
 dW4oqEqhC3JXhAmxhP6X+bKVkZZgXgzk4g5MWw1JIUI73K/o5Cgoyuwu/Nl0uTzDWZyUn8lyS01
 nOBTCTglWzLH1SsjFkT7FZsjTlZfN21exNP8xxPemCg4Sqm8W9hIupi90WXOtDRCxOfSbilfxyO
 yTbQ/IL4tsHivp/Xbft6aGjwuMdM6An3WXmNngwv1IzR38az/OECzteZK+rE4/Dg+hujSXN55Z+
 g/Pg3H93iC/2AVmm/zjY/S4Jh3+3CmM+cZIVpfArlgsPnYdxt1VKeSwpaBc9vR3iFB3mgCn6dVM
 56AWzh9UXpV7qO/MIPPgFp5zPXnOEFlEZtiXH2RUVC5wAiDYqT2eft44vdTtpXskyNSO7rYOtWK
 BIUWm7KspXJ6eEG85qFfr4B/kius87gDvkrkkKFdcjWrQjaefAMncX2rzpw5qgl4CAo/oJtIOyj
 qkF/AMPDI/b9bW7kDH4oniUFRQPOLL0dA05d/rSxwPRnCgVpHmqqOQU3WDumyMflcJKDCWgE/rf
 yGP3kKerTybCy+vsHncksKwDD8E4A4ko9IRgycXKyBf/y2YgeS5OhFne16shNpUZmiYTYXr5uZD
 YT8++YNxv59DjGQ==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676
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

Sony provides an LGD LH599QH3-EDB1 panel + Atmel maXTouch assembly in
its Xperia XZ3 (tama akatsuki) phone, with custom DCS commands to match.

The panel is 1440x2880 pixels and runs at 60Hz.  It requires Display
Stream Compression 1.1 to be driven at that mode.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 MAINTAINERS                                     |   1 +
 drivers/gpu/drm/panel/Kconfig                   |  16 ++
 drivers/gpu/drm/panel/Makefile                  |   1 +
 drivers/gpu/drm/panel/panel-lgd-lh599qh3-edb1.c | 340 ++++++++++++++++++++++++
 4 files changed, 358 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a358fee4cae..fcd99a8f9c71 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7935,6 +7935,7 @@ DRM DRIVER FOR LGD LH599QH3-EDB1 PANELS
 M:	Marijn Suijten <marijn.suijten@somainline.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/lgd,lh599qh3-edb1.yaml
+F:	drivers/gpu/drm/panel/panel-lgd-lh599qh3-edb1.c
 
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
 M:	Paul Kocialkowski <paulk@sys-base.io>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 9242fb894511..10381291707e 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -442,6 +442,22 @@ config DRM_PANEL_LG_SW43408
 	  pixel. It provides a MIPI DSI interface to the host and has a
 	  built-in LED backlight.
 
+config DRM_PANEL_LGD_LH599QH3_EDB1
+	tristate "LGD LH599QH3-EDB1 DSI cmd mode panel"
+	depends on GPIOLIB
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
+	select DRM_DISPLAY_HELPER
+	help
+	  Say Y or M here if you want to enable support for the LGD LH599QH3-EDB1
+	  6.0" OLED DSI command-mode panel found in the Sony
+	  Xperia XZ3.
+
+	  This Display-IC uses Display Stream Compression 1.1 and features a
+	  fixed 1440x2880@60 mode.
+
 config DRM_PANEL_MAGNACHIP_D53E6EA8966
 	tristate "Magnachip D53E6EA8966 DSI panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index aeffaa95666d..186eb895af21 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LD070WX3) += panel-lg-ld070wx3.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
+obj-$(CONFIG_DRM_PANEL_LGD_LH599QH3_EDB1) += panel-lgd-lh599qh3-edb1.o
 obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
 obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
diff --git a/drivers/gpu/drm/panel/panel-lgd-lh599qh3-edb1.c b/drivers/gpu/drm/panel/panel-lgd-lh599qh3-edb1.c
new file mode 100644
index 000000000000..02049b37729e
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lgd-lh599qh3-edb1.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Marijn Suijten <marijn.suijten@somainline.org>
+ *
+ * Based on the following Sony downstream DTS command sequence:
+ * https://github.com/sonyxperiadev/kernel-copyleft/blob/52.0.A.3.xxx/arch/arm64/boot/dts/somc/dsi-panel-akatsuki_vendor.dtsi
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+
+#define WRITE_CONTROL_DISPLAY_BACKLIGHT BIT(5)
+
+const struct regulator_bulk_data lgd_lh599qh3_edb1_supplies[] = {
+	{ .supply = "vddio", /* 1.8 V */ },
+	{ .supply = "avdd", /* 3.0 V */ },
+};
+
+struct lgd_lh599qh3_edb1 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct drm_dsc_config dsc;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static inline struct lgd_lh599qh3_edb1 *
+to_lgd_lh599qh3_edb1(struct drm_panel *panel)
+{
+	return container_of(panel, struct lgd_lh599qh3_edb1, panel);
+}
+
+static int lgd_lh599qh3_edb1_program(struct lgd_lh599qh3_edb1 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	dsi_ctx.dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     WRITE_CONTROL_DISPLAY_BACKLIGHT);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x20, 0x80, 0xde, 0x60, 0x00);
+
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, 1440 - 1);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, 2880 - 1);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf6, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf6, 0x01, 0x7f, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0xac, 0x19, 0x34, 0x14, 0x7d);
+
+	return 0;
+}
+
+static int lgd_lh599qh3_edb1_prepare(struct drm_panel *panel)
+{
+	struct lgd_lh599qh3_edb1 *ctx = to_lgd_lh599qh3_edb1(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+	struct drm_dsc_picture_parameter_set pps;
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(lgd_lh599qh3_edb1_supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	msleep(100);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(5000, 5100);
+
+	ret = lgd_lh599qh3_edb1_program(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to program panel: %d\n", ret);
+		goto fail;
+	}
+
+	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
+
+	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
+	mipi_dsi_compression_mode_multi(&dsi_ctx, true);
+	mipi_dsi_msleep(&dsi_ctx, 28);
+
+	ret = dsi_ctx.accum_err;
+
+	if (ret < 0)
+		goto fail;
+
+	return 0;
+
+fail:
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(lgd_lh599qh3_edb1_supplies), ctx->supplies);
+	return ret;
+}
+
+static int lgd_lh599qh3_edb1_enable(struct drm_panel *panel)
+{
+	struct lgd_lh599qh3_edb1 *ctx = to_lgd_lh599qh3_edb1(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int lgd_lh599qh3_edb1_disable(struct drm_panel *panel)
+{
+	struct lgd_lh599qh3_edb1 *ctx = to_lgd_lh599qh3_edb1(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	return dsi_ctx.accum_err;
+}
+
+static int lgd_lh599qh3_edb1_unprepare(struct drm_panel *panel)
+{
+	struct lgd_lh599qh3_edb1 *ctx = to_lgd_lh599qh3_edb1(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_tear_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 100);
+
+	dsi_ctx.dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(lgd_lh599qh3_edb1_supplies), ctx->supplies);
+
+	usleep_range(5000, 5100);
+
+	return dsi_ctx.accum_err;
+}
+
+/*
+ * Small fake porch to force the DSI pclk/byteclk
+ * high enough to have a smooth panel at 60Hz.
+ */
+static const int fake_porch = 60;
+
+static const struct drm_display_mode lgd_lh599qh3_edb1_mode = {
+	.clock = (1440 + fake_porch) * 2880 * 60 / 1000,
+	.hdisplay = 1440,
+	.hsync_start = 1440 + fake_porch,
+	.hsync_end = 1440 + fake_porch,
+	.htotal = 1440 + fake_porch,
+	.vdisplay = 2880,
+	.vsync_start = 2880,
+	.vsync_end = 2880,
+	.vtotal = 2880,
+	.width_mm = 68,
+	.height_mm = 136,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int lgd_lh599qh3_edb1_get_modes(struct drm_panel *panel,
+				       struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector,
+						    &lgd_lh599qh3_edb1_mode);
+}
+
+static const struct drm_panel_funcs lgd_lh599qh3_edb1_panel_funcs = {
+	.prepare = lgd_lh599qh3_edb1_prepare,
+	.enable = lgd_lh599qh3_edb1_enable,
+	.disable = lgd_lh599qh3_edb1_disable,
+	.unprepare = lgd_lh599qh3_edb1_unprepare,
+	.get_modes = lgd_lh599qh3_edb1_get_modes,
+};
+
+static int lgd_lh599qh3_edb1_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+
+	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+}
+
+static int lgd_lh599qh3_edb1_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness;
+	int ret;
+
+	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
+	if (ret < 0)
+		return ret;
+
+	return brightness & 0x3ff;
+}
+
+static const struct backlight_ops lgd_lh599qh3_edb1_bl_ops = {
+	.update_status = lgd_lh599qh3_edb1_bl_update_status,
+	.get_brightness = lgd_lh599qh3_edb1_bl_get_brightness,
+};
+
+static int lgd_lh599qh3_edb1_probe(struct mipi_dsi_device *dsi)
+{
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 100,
+		.max_brightness = 1023,
+	};
+	struct device *dev = &dsi->dev;
+	struct lgd_lh599qh3_edb1 *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct lgd_lh599qh3_edb1, panel,
+				   &lgd_lh599qh3_edb1_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = devm_regulator_bulk_get_const(
+		dev,
+		ARRAY_SIZE(lgd_lh599qh3_edb1_supplies),
+		lgd_lh599qh3_edb1_supplies,
+		&ctx->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
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
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = devm_backlight_device_register(
+		dev, dev_name(dev), dev, dsi,
+		&lgd_lh599qh3_edb1_bl_ops,
+		&props);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	/* This panel only supports DSC; unconditionally enable it */
+	dsi->dsc = &ctx->dsc;
+
+	ctx->dsc.dsc_version_major = 1;
+	ctx->dsc.dsc_version_minor = 1;
+
+	ctx->dsc.slice_height = 32;
+	ctx->dsc.slice_count = 2;
+	/*
+	 * hdisplay should be read from the selected mode once
+	 * it is passed back to drm_panel (in prepare?)
+	 */
+	WARN_ON(1440 % ctx->dsc.slice_count);
+	ctx->dsc.slice_width = 1440 / ctx->dsc.slice_count;
+	ctx->dsc.bits_per_component = 8;
+	ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
+	ctx->dsc.block_pred_enable = true;
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
+static void lgd_lh599qh3_edb1_remove(struct mipi_dsi_device *dsi)
+{
+	struct lgd_lh599qh3_edb1 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id lgd_lh599qh3_edb1_of_match[] = {
+	{ .compatible = "lgd,lh599qh3-edb1-um1" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, lgd_lh599qh3_edb1_of_match);
+
+static struct mipi_dsi_driver lgd_lh599qh3_edb1_driver = {
+	.probe = lgd_lh599qh3_edb1_probe,
+	.remove = lgd_lh599qh3_edb1_remove,
+	.driver = {
+		.name = "panel-lgd-lh599qh3-edb1",
+		.of_match_table = lgd_lh599qh3_edb1_of_match,
+	},
+};
+module_mipi_dsi_driver(lgd_lh599qh3_edb1_driver);
+
+MODULE_AUTHOR("Marijn Suijten <marijn.suijten@somainline.org>");
+MODULE_DESCRIPTION("DRM panel driver for an LGD LH599QH3-EDB1 OLED assembly found in the Sony Xperia XZ3");
+MODULE_LICENSE("GPL");

-- 
2.52.0

