Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30972BF630D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 13:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058D810E5CA;
	Tue, 21 Oct 2025 11:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BaQ8kWDe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410DB10E274
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1549B49C25;
 Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D479FC4CEFD;
 Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761047587;
 bh=v5D7nE1ZWhuJ6MDMTzwFDQBR/WaGOhAInmMJsBFluxg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=BaQ8kWDe4ZqZAtdOyeDIwg+p2tZeiJ+drWwmuI61Vo+ovzP3RhwcDitWnI/Z1QMlB
 cMrpvUxSKTonUMw1B85yADKZ+Nf8Fuc+Gg09nCOJ8uOSTovqYAHM0h+/usZj77gOuc
 WWKPe+hrabSwhKmvBMVfLXDzYez6LFNMx68Imv4pUJe3XWDfHJ0b5hgZmQrjL9oMnY
 IoUf8cdM9jOlNn1+N5nTGlC6KRlosK1Ftxe/za6K3bXkztIxRxjKrHO8xetK3qgXch
 x6AHEBl/4gmnv+sLZEF9nwoU1pKYJILaeNNIBPxIxIHG6QSa0FuIIujntgG5kDkuGL
 3oHvsq6MBYHGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C439ECCD1A5;
 Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 21 Oct 2025 13:53:02 +0200
Subject: [PATCH v4 2/7] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-s6e3fc2x01-v4-2-5e3ee21c688a@ixit.cz>
References: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
In-Reply-To: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15295; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=9MgG9IyU3Z2P4zB5yh+ZZym8fZkFc1R+kwdqnFGHYec=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo93Qh7YbTlVXOCSaiYAyt70wVmFAZNL0XKFng/
 DZFW9CBP5eJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPd0IQAKCRBgAj/E00kg
 csq0EAC6dh+43I2iv5rPtm6ya6vbyiLLKxnzMZnEM5uJxeb2cSq3R4GmofgfIQg09LwVcQIJi2Z
 m79BeIh8OTX+SKjvpED0XnU71IJRpVoQmfIMaKteA3U2iJRinvrkw0QlWHi83b7z2EZBmvKQ8E+
 hF25gIq3id2WD1lCGoJ9BDiTHPpLmtIY0KGE6eAlO0LbHD6K1d7NGidFbWRebznXM83lkJomm+w
 34gDWgWzfz6x1/jr3N5CtSUTkXGjsC2tUXyN7BIXsWTDoVdbHCE+6qbhnJTxR5FitJZ7bX+kzbz
 wxHzDTbIw4asUtzW4MMFjV1/sFunh7Fe1Kn1No/zrkZL9ewNxIvYPlFxmfLt9mnZxeQezG9kn0h
 s3jeYyDxx5HwK5W0df7O9yVFTsqVB8b0HReoSTGCWnuMSIQCaMgqHmFLQNI9nrvso2wQzMH8EpK
 sxbfwuP9ph5eMbjT6pOZPRQp0GifrAMypIKQQRbWvdUHmzMh7uvKg/q86ZDF3O1MkNHFQkK9C9a
 KRRY/lcauMCAcMgIUUgrwg5O6ZeJMJHlNkMM70F4bUgI8yTpWKQed61KT01F3v6d1UgY3WWxcEE
 eE6MhwCdSPV2nfX3FsQwfDTrIFzvAXRl4Mcrx/opk4/0Ry1TdAUQWA0YZd6kGLUZ7armBvQ05Kp
 riaNE1NbXeEaW9Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

Add panel driver used in the OnePlus 6T.

No datasheet, based mostly on EDK2 init sequence and the downstream driver.

Note: This driver doesn't use previously mentioned "samsung,s6e3fc2x01"
by OnePlus 6T device-tree.
The reason is because DDIC itself without knowing the panel type used
with it will not give the driver enough information about the panel used,
as the panel cannot be autodetected.
While would be more practical to support the original compatible,
I would like to avoid it, to prevent confusing devs upstreaming DDICs.

Based on work of:
  Casey Connolly <casey@connolly.tech>
  Joel Selvaraj <foss@joelselvaraj.com>
  Nia Espera <a5b6@riseup.net>

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 MAINTAINERS                                      |   1 +
 drivers/gpu/drm/panel/Kconfig                    |  13 +
 drivers/gpu/drm/panel/Makefile                   |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 385 +++++++++++++++++++++++
 4 files changed, 400 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42be36b42c29b..a3296756f5ca3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8065,6 +8065,7 @@ DRM DRIVER FOR SAMSUNG S6E3FC2X01 DDIC
 M:	David Heidelberg <david@ixit.cz>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
 
 DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
 M:	Dzmitry Sankouski <dsankouski@gmail.com>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 045ffb2ccd0f0..fadb7f397837e 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -801,6 +801,19 @@ config DRM_PANEL_SAMSUNG_S6D7AA0
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 
+config DRM_PANEL_SAMSUNG_S6E3FC2X01
+	tristate "Samsung S6E3FC2X01 DSI panel controller"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y or M here if you want to enable support for the
+	  Samsung S6E3FC2 DDIC and connected MIPI DSI panel.
+	  Currently supported panels:
+
+	    Samsung AMS641RW (found in the OnePlus 6T smartphone)
+
 config DRM_PANEL_SAMSUNG_S6E3HA2
 	tristate "Samsung S6E3HA2 DSI video mode panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 0356775a443ad..ae56f64982cfb 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -79,6 +79,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FA7) += panel-samsung-s6e3fa7.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FC2X01) += panel-samsung-s6e3fc2x01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8) += panel-samsung-s6e3ha8.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c b/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
new file mode 100644
index 0000000000000..e63080204af77
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Nia Espera <a5b6@riseup.net>
+ * Copyright (c) 2025 David Heidelberg <david@ixit.cz>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/swab.h>
+#include <linux/backlight.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+#define MCS_ELVSS_ON            0xb1
+
+struct samsung_s6e3fc2x01 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regulator_bulk_data s6e3fc2x01_supplies[] = {
+	{ .supply = "vddio" },
+	{ .supply = "vci" },
+	{ .supply = "poc" },
+};
+
+static inline
+struct samsung_s6e3fc2x01 *to_samsung_s6e3fc2x01(struct drm_panel *panel)
+{
+	return container_of(panel, struct samsung_s6e3fc2x01, panel);
+}
+
+#define s6e3fc2x01_test_key_on_lvl1(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x9f, 0xa5, 0xa5)
+#define s6e3fc2x01_test_key_off_lvl1(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x9f, 0x5a, 0x5a)
+#define s6e3fc2x01_test_key_on_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
+#define s6e3fc2x01_test_key_off_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
+#define s6e3fc2x01_test_key_on_lvl3(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0x5a, 0x5a)
+#define s6e3fc2x01_test_key_off_lvl3(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0xa5, 0xa5)
+
+static void s6e3fc2x01_reset(struct samsung_s6e3fc2x01 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(5000, 6000);
+}
+
+static int s6e3fc2x01_on(struct samsung_s6e3fc2x01 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	s6e3fc2x01_test_key_on_lvl1(&dsi_ctx);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x0a);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
+
+	s6e3fc2x01_test_key_off_lvl1(&dsi_ctx);
+
+	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x01);
+	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
+
+	mipi_dsi_usleep_range(&dsi_ctx, 15000, 16000);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x0f);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
+
+	s6e3fc2x01_test_key_on_lvl1(&dsi_ctx);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	s6e3fc2x01_test_key_off_lvl1(&dsi_ctx);
+
+	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xeb, 0x17,
+					       0x41, 0x92,
+					       0x0e, 0x10,
+					       0x82, 0x5a);
+	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
+
+	/* Column & Page Address Setting */
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x0437);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x0923);
+
+	/* Horizontal & Vertical sync Setting */
+	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe8, 0x10, 0x30);
+	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
+
+	s6e3fc2x01_test_key_on_lvl3(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed, 0x67);
+	s6e3fc2x01_test_key_off_lvl3(&dsi_ctx);
+
+	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x12);
+	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
+
+	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ELVSS_ON, 0x00, 0x01);
+	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
+
+	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x00, 0xc1);
+	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x78);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x90);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
+
+	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ELVSS_ON, 0xc6, 0x00, 0x00,
+				     0x21, 0xed, 0x02, 0x08, 0x06, 0xc1, 0x27,
+				     0xfc, 0xdc, 0xe4, 0x00, 0xd9, 0xe6, 0xe7,
+				     0x00, 0xfc, 0xff, 0xea);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ELVSS_ON, 0x00, 0x00);
+	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
+
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
+
+	return dsi_ctx.accum_err;
+}
+
+static int s6e3fc2x01_enable(struct drm_panel *panel)
+{
+	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	s6e3fc2x01_test_key_on_lvl1(&dsi_ctx);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	s6e3fc2x01_test_key_off_lvl1(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int s6e3fc2x01_off(struct samsung_s6e3fc2x01 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	s6e3fc2x01_test_key_on_lvl1(&dsi_ctx);
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
+
+	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 16000, 17000);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x82);
+	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 16000, 17000);
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+
+	s6e3fc2x01_test_key_off_lvl1(&dsi_ctx);
+
+	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x01);
+	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 160);
+
+	return dsi_ctx.accum_err;
+}
+
+static int s6e3fc2x01_disable(struct drm_panel *panel)
+{
+	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
+
+	s6e3fc2x01_off(ctx);
+
+	return 0;
+}
+
+static int s6e3fc2x01_prepare(struct drm_panel *panel)
+{
+	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(s6e3fc2x01_supplies), ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	s6e3fc2x01_reset(ctx);
+
+	ret = s6e3fc2x01_on(ctx);
+	if (ret < 0) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(s6e3fc2x01_supplies), ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int s6e3fc2x01_unprepare(struct drm_panel *panel)
+{
+	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(s6e3fc2x01_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode ams641rw_mode = {
+	.clock = (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 72,
+	.hsync_end = 1080 + 72 + 16,
+	.htotal = 1080 + 72 + 16 + 36,
+	.vdisplay = 2340,
+	.vsync_start = 2340 + 32,
+	.vsync_end = 2340 + 32 + 4,
+	.vtotal = 2340 + 32 + 4 + 18,
+	.width_mm = 68,
+	.height_mm = 145,
+};
+
+static int s6e3fc2x01_get_modes(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &ams641rw_mode);
+}
+
+static const struct drm_panel_funcs samsung_s6e3fc2x01_panel_funcs = {
+	.prepare = s6e3fc2x01_prepare,
+	.enable = s6e3fc2x01_enable,
+	.disable = s6e3fc2x01_disable,
+	.unprepare = s6e3fc2x01_unprepare,
+	.get_modes = s6e3fc2x01_get_modes,
+};
+
+static int s6e3fc2x01_panel_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int err;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	err = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (err < 0)
+		return err;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static const struct backlight_ops s6e3fc2x01_panel_bl_ops = {
+	.update_status = s6e3fc2x01_panel_bl_update_status,
+};
+
+static struct backlight_device *
+s6e3fc2x01_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_PLATFORM,
+		.brightness = 512,
+		.max_brightness = 1023,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &s6e3fc2x01_panel_bl_ops, &props);
+}
+
+static int s6e3fc2x01_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct samsung_s6e3fc2x01 *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct samsung_s6e3fc2x01, panel,
+				   &samsung_s6e3fc2x01_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(s6e3fc2x01_supplies),
+					    s6e3fc2x01_supplies,
+					    &ctx->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+
+	/* keep the display on for flicker-free experience */
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
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
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = s6e3fc2x01_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
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
+static void s6e3fc2x01_remove(struct mipi_dsi_device *dsi)
+{
+	struct samsung_s6e3fc2x01 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id s6e3fc2x01_of_match[] = {
+	{ .compatible = "samsung,s6e3fc2x01-ams641rw", .data = &ams641rw_mode },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s6e3fc2x01_of_match);
+
+static struct mipi_dsi_driver s6e3fc2x01_driver = {
+	.probe = s6e3fc2x01_probe,
+	.remove = s6e3fc2x01_remove,
+	.driver = {
+		.name = "panel-samsung-s6e3fc2x01",
+		.of_match_table = s6e3fc2x01_of_match,
+	},
+};
+module_mipi_dsi_driver(s6e3fc2x01_driver);
+
+MODULE_AUTHOR("David Heidelberg <david@ixit.cz>");
+MODULE_DESCRIPTION("DRM driver for Samsung S6E3FC2X01 DDIC");
+MODULE_LICENSE("GPL");

-- 
2.51.0


