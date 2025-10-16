Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53650BE482A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 18:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08DC10EA39;
	Thu, 16 Oct 2025 16:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sceyIGmR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9B010EA2D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 184474A8E9;
 Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6F49C116C6;
 Thu, 16 Oct 2025 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760631419;
 bh=4kxrh8lNYomQLHHWdaX5r8SkUlzAABJDEHVlYbahRBs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=sceyIGmR15EAcjd1njXAu3BJRRtdiKg7hCR1VbNsVPn6G2MfqoF4brj52FcaCV5VG
 OwG16irAPM3aFpSrDfoXk4w78WA2bqp2CEEpaZCcQtIVjZCGsrl8KNsGmzLVMDzjHQ
 oEkxxi2vynjmiCKys13wEqSBV9ylLCz3KTl276fg4ZenSEHd/8g5gN7U4TyuOLQ3TK
 YUrWTlTjWC6QhTC9R9vmnNo8n5yHesReoZZLHDLm1bzdZfv5y4Jxf/RLBoKX/HsY1R
 rHsCn6dNBwfwchEWShTGI9ZGytFSR7ZwNScqfxzIsbxMZYYMr9V4YT7jVmt2F+FCuO
 A8IBXOKhkPmnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CBA2ACCD195;
 Thu, 16 Oct 2025 16:16:59 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 16 Oct 2025 18:16:59 +0200
Subject: [PATCH v3 4/8] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-s6e3fc2x01-v3-4-ce0f3566b903@ixit.cz>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
In-Reply-To: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15722; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=hHuOninuip/7GLZ6Epila7GjYzxz0dHL4Hl4YTk5a/w=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo8Rp5MMONnzc/IAyMzo9A6xnOGzUHJ8p+kkzlF
 XB5kzF+OgWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPEaeQAKCRBgAj/E00kg
 cq+/D/9ZWJ8Cj15B302shgw5hA4hd5s1BTiqlJPKT1/Bj/iJfPoCfsWzNKseW0swnwD7UzgjYuj
 y1EEQx924ICu/SOCD9nt13Ezk8KLuyk9k26j2pnJ7G4sAiz/j9RevhXP6a3FHk2W9NcCJXHsE+I
 vMJu83feoeAIGvYy1VMXp1VOMmv5g4sKqgN8RfDb8AJib3KEKhUOtOW37FiWT8z5R4wl2mL7tiX
 LyDGJCJf+fQfPH9QyqPc8tX7047r99Du4tuOMQ7EcANmzFdyxVEhWH68Q5QOedGNaG6IGlEKVH7
 sNGQRf77xb2TgEghqNSvuip+4parMITHL/A2toOJT1lUvFLefwb2KvBNgfW0pFt/veQVFXaZDB0
 wxPV4Dcs+Ki7tszgjS8S25KMmA4hU3J98gfYZTf+kHJrB22yXeaDCGJgAXyhb3n89j7OjxaioZA
 dJiEQdD32X66tTBi8vnvjVlFD+pVDKrXdWFk/Ssr9n0bD7XoDHxWwMr4PqvXDnAv3438DnoLyYn
 OHuGosWXuvMca7iRhhZFM9ryLaB7FoRvrQMgeTdyTub3cYnqTyP0U5xCqG6c20MG1LC+2H9QJx1
 8tHXLB6Xrjbs4TANGq6capJrINr+4LKsjheIag6/0wCUet4VLHUE+ohWz5oVlzHTByH19d5dB92
 F4Xq2vwiUbBR9gg==
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
 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 399 +++++++++++++++++++++++
 4 files changed, 414 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d11dd6c7a6b27..ee715864e1f97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8060,6 +8060,7 @@ DRM DRIVER FOR SAMSUNG S6E3FC2X01 DDIC
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
index 0000000000000..36e7cf1a3654a
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
@@ -0,0 +1,399 @@
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
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &ams641rw_mode);
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
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
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
+	drm_panel_init(&ctx->panel, dev, &samsung_s6e3fc2x01_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
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
+	/* samsung,s6e3fc2x01 will default to the AMS641RW mode (legacy) */
+	{ .compatible = "samsung,s6e3fc2x01", .data = &ams641rw_mode },
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


