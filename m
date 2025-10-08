Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A37BC3D40
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 10:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD2910E77E;
	Wed,  8 Oct 2025 08:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jwtzqj3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEA310E77D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 08:28:47 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-57b8fc6097fso9291669e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 01:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759912126; x=1760516926; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tanbjVQInwNXwsuRUHW57vdooILwUCkscqmzWBh825c=;
 b=jwtzqj3pI9bm83OlDex4mNEZHApZA16wsNSixvUtlIpTE4O30FxIDOpJOBq0/WYtxv
 GsI5ZFj9JR2Oimt/m1A12fZBYm1iq2jRStHLpLKXT6RcWf+NmOL+ZWdEqoII8LWpL9kt
 U4Hf6pCagsgAI87EYaWf1MvJDRgqlfca/x6FWfPGYnQ/AyoR+3/whz0HvpEhCYk+2gDd
 mTMry/gDtSPRdMDXTLs78dOCHd+jiFqFUwukAPEXUmJe0Ikiwds20+vOoWgJQjQ5FDcO
 k73/d2IsvGB0L063a01FUg4h0z5wL542ttFsAQvPdDuwejjG1wZb1PgCQFizBVGnGgYW
 bGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759912126; x=1760516926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tanbjVQInwNXwsuRUHW57vdooILwUCkscqmzWBh825c=;
 b=K809N52P5Ye5kEGguImUBW+L7lv5E8XXIFMWaJRNPH8sqfJFsTxLAIfXjIqwYlJolu
 taefly0MccoiGrpDoPvwrXlkcaM6iUH28KzRKWLZ077COHU8VtJHTc6r9kEtRZXjlFJL
 3RwB3LDCahlWNJGPRFj7ODEoaNmx+txRVkvOg3rviKbtGt9EDdlUa4fHgyFFLh43dqV7
 sDdztXXb8sO2IhMQQpC7DZ3eA61o08DIiNIB/zxF6It1xvxhpRaKp6E5CL1QK39mKtKU
 q8SBRRB94wK4uqnQJna7YBNz9f20ebb6O++/nvSvUpo5Sdn13ZO5rat8IZApmXmlrMqo
 dIZQ==
X-Gm-Message-State: AOJu0YxgI2xQBRD0Hjr4mFWT1dLDlDvgAkP0WueM8E7bSEtW/WCvz8HN
 PBoK/5/bN+0XNV9Nv69RqOx3rcX7aeHb1pD2tj0M1cEbirvZYLAIAIE1
X-Gm-Gg: ASbGncvqrGbdMjFi3V2WiAUn+pQEL/NWYrtGu5rqVWqdA1vkN/tvtH3RQkVCeWydUWd
 H6hO9tmPqD+Rgyn9YUJo9Rw5pSCb01cavNDjoAffZlLA/avsM21JPEoxnz2LGYwyhnOzuK4bh5Y
 EQ1fBmgOnZYlCtKMXvm2ao1yHt1FJPWfiSqWNAtLNrbK1SHofvLF/AuHRWtYlhoz5KIlvAYfL+H
 IDyPbUJO5GAbGejXo29jyed4ORE73PXEiPhMgcSZFm1Sohx5Es1J3DVcAXI9StYQdm4Wvp7L+MV
 1jbsOIbmYXaNOzMIaxPGHPKiPKnnIN/y5Wyio4pUc1P48AMx0UAxRvAsgb+Yno0BjEBUe/M5Xhz
 FLCdhybX2g/ODigvKoqYnEiQQMEw3bXwf5y4fkw==
X-Google-Smtp-Source: AGHT+IFYhOHXvIB/IXogSLQnW12fzbq9+hzW5B7qM2oJqmmRUlMRmtAdj2WVYS7TUc170eZQ+0D9cw==
X-Received: by 2002:ac2:5685:0:b0:58a:fa11:b7a1 with SMTP id
 2adb3069b0e04-5906dc16d75mr761505e87.24.1759912125752; 
 Wed, 08 Oct 2025 01:28:45 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b01124649sm6968733e87.15.2025.10.08.01.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:28:45 -0700 (PDT)
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
Subject: [PATCH v2 7/7] gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI panel
 driver
Date: Wed,  8 Oct 2025 11:27:59 +0300
Message-ID: <20251008082800.67718-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008082800.67718-1-clamor95@gmail.com>
References: <20251008082800.67718-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Anton Bambura <jenneron@protonmail.com>

LTL106HL02 is a color active matrix TFT (Thin Film Transistor) liquid
crystal display (LCD) that uses amorphous silicon TFT as switching
devices. This model is composed of a TFT LCD panel, a driver circuit and a
backlight unit. The resolution of a 10.6" contains 1920 x 1080 pixels and
can display up to 16,8M color with wide viewing angle.

Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Signed-off-by: Anton Bambura <jenneron@protonmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  13 ++
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ltl106hl02.c  | 179 ++++++++++++++++++
 3 files changed, 193 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index cf6174da5105..cafd1a75956f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -781,6 +781,19 @@ config DRM_PANEL_SAMSUNG_LD9040
 	depends on BACKLIGHT_CLASS_DEVICE
 	select VIDEOMODE_HELPERS
 
+config DRM_PANEL_SAMSUNG_LTL106HL02
+	tristate "Samsung LTL106HL02 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y here if you want to enable support for the Samsung LTL106HL02
+	  panel driver which is used in Microsoft Surface 2.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called panel-samsung-ltl106hl02.
+
 config DRM_PANEL_SAMSUNG_S6E3FA7
 	tristate "Samsung S6E3FA7 panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 9281221183ac..a87ae98362bd 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -76,6 +76,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_LTL106HL02) += panel-samsung-ltl106hl02.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c b/drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c
new file mode 100644
index 000000000000..1618841b7caa
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c
@@ -0,0 +1,179 @@
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
+struct samsung_ltl106hl02 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator *supply;
+	struct gpio_desc *reset_gpio;
+};
+
+static inline struct samsung_ltl106hl02 *to_samsung_ltl106hl02(struct drm_panel *panel)
+{
+	return container_of(panel, struct samsung_ltl106hl02, panel);
+}
+
+static void samsung_ltl106hl02_reset(struct samsung_ltl106hl02 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(2000, 3000);
+}
+
+static int samsung_ltl106hl02_prepare(struct drm_panel *panel)
+{
+	struct samsung_ltl106hl02 *ctx = to_samsung_ltl106hl02(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_enable(ctx->supply);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable power supply %d\n", ret);
+		return ret;
+	}
+
+	if (ctx->reset_gpio)
+		samsung_ltl106hl02_reset(ctx);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 70);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 5);
+
+	return dsi_ctx.accum_err;
+}
+
+static int samsung_ltl106hl02_unprepare(struct drm_panel *panel)
+{
+	struct samsung_ltl106hl02 *ctx = to_samsung_ltl106hl02(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 150);
+
+	if (ctx->reset_gpio)
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	regulator_disable(ctx->supply);
+
+	return 0;
+}
+
+static const struct drm_display_mode samsung_ltl106hl02_mode = {
+	.clock = (1920 + 32 + 32 + 64) * (1080 + 6 + 3 + 22) * 60 / 1000,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 32,
+	.hsync_end = 1920 + 32 + 32,
+	.htotal = 1920 + 32 + 32 + 64,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 6,
+	.vsync_end = 1080 + 6 + 3,
+	.vtotal = 1080 + 6 + 3 + 22,
+	.width_mm = 235,
+	.height_mm = 132,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int samsung_ltl106hl02_get_modes(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &samsung_ltl106hl02_mode);
+}
+
+static const struct drm_panel_funcs samsung_ltl106hl02_panel_funcs = {
+	.prepare = samsung_ltl106hl02_prepare,
+	.unprepare = samsung_ltl106hl02_unprepare,
+	.get_modes = samsung_ltl106hl02_get_modes,
+};
+
+static int samsung_ltl106hl02_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct samsung_ltl106hl02 *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct samsung_ltl106hl02, panel,
+				   &samsung_ltl106hl02_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ctx->supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(ctx->supply))
+		return dev_err_probe(dev, PTR_ERR(ctx->supply),
+				     "Failed to get power regulator\n");
+
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void samsung_ltl106hl02_remove(struct mipi_dsi_device *dsi)
+{
+	struct samsung_ltl106hl02 *ctx = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id samsung_ltl106hl02_of_match[] = {
+	{ .compatible = "samsung,ltl106hl02-001" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, samsung_ltl106hl02_of_match);
+
+static struct mipi_dsi_driver samsung_ltl106hl02_driver = {
+	.driver = {
+		.name = "panel-samsung-ltl106hl02",
+		.of_match_table = samsung_ltl106hl02_of_match,
+	},
+	.probe = samsung_ltl106hl02_probe,
+	.remove = samsung_ltl106hl02_remove,
+};
+module_mipi_dsi_driver(samsung_ltl106hl02_driver);
+
+MODULE_AUTHOR("Anton Bambura <jenneron@protonmail.com>");
+MODULE_DESCRIPTION("DRM driver for Samsung LTL106HL02 video mode DSI panel");
+MODULE_LICENSE("GPL");
-- 
2.48.1

