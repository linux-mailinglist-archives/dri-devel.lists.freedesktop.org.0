Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E686ABC55C9
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D2010E827;
	Wed,  8 Oct 2025 14:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VVcCR5xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A5E10E822
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4A43B6203C;
 Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6847C116D0;
 Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759932331;
 bh=LHoRmVHb93U/+5ORJcpQSoiWREJUgtZoUNCT0zFPXFs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=VVcCR5xhiUjk++Vwd7j0xNZ/Caqct5xwQCJ4UUWETlWi0EOlbD/P0Hx+tZF6uMvwx
 OWzITqk/Dqv1jCh0d5iTbEXNN6RNseH5fsG5TvVR5Ux0aTkrAqXos8UL3OSJsDxgya
 7IJZws3xX0eGEzEYtGeLiAtAmNKGREwl+8RGR9yfmtj6iuUBKolyQoShpAqtQz6sj0
 qV1R+eE8yXVvYE2LSiFx0xK/M2T7giXyhpdQz5V8svGw8Flr2aPQLfDivsxMw3hvqI
 FkzENwhwhQxQDB0mTv2ZJpIpC94WbEsRRO5w4VOFhcNZLdOy4MLFbXB9cJZB9wt98C
 tG1iw14bdHcew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id DD026CCA472;
 Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 08 Oct 2025 16:05:32 +0200
Subject: [PATCH v2 5/7] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
In-Reply-To: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15287; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=PhqQ4MykF+zre+n4B9FqtMTa44yfAaX2KbFgpDbp7xU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo5m+o3Vb8vIWFekGtTso1a9PcN/q3zsqxkNWWG
 U+Ls/CmmAWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaOZvqAAKCRBgAj/E00kg
 cgrRD/9Iy6/cROgYX9QdR/wo80puH/2nWlr671QFnzotjA75hsr9vrGbOf3trVe4lP54+OBahY2
 ijkXCrqLdk2xBdBNrWMYSEsVAkSeY0DxLdui8oWjbt0ZnPaYMYhWNg36yPxVG76T4sgngNJCxjO
 viFxbfPUjhw/Ny8Hu1yT4VIq0oWvhhUs8jEkpWUPMgQnXja5I/dRQefLTCDbOSh4avu56ncRuxg
 atOaEYODaNABVUEOuVw7RoLi5miCKycPbw4uE2E89Vgdr8T+OCByJViQwsTRiC7GxPFvZ1ls3yE
 QKRK3HUvrmGuddbZ/3r6ko+8lL3VF71N1BNc4QBu6va76bv3fdYoBi5BBCXldwaxsn+k37bNyN6
 tMuuLGUbOfMNs4Ctcl/51I+uX/E6uIYL6fgWZ3XThpeSBZ3qv7rGHy1MQR0vXXKTYgDbJ3ZPHWd
 rfMX0Hvf6uKNIre8Imfs4Y/9p9Y1gJl+LIEgVguilmalPORTVlm4Jv5znhcJuU8NaFgvlxOcGtm
 p5Sbu9PV8/q6k3REUZfMjWSmapblLgxX0OW276WBVbZ1nY4LNuA+ffA05kMLqCPCmhSChmIF+5U
 KOF4Op06HkVnvT4jsDsMzOJ37CsetO/tedv54+alcDlbkFr7h7iXZDNjdCukvdMNNjkRAqOMbaS
 8KjZXrh5nE6Oi+w==
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

Based on work of:
  Casey Connolly <casey@connolly.tech>
  Joel Selvaraj <foss@joelselvaraj.com>
  Nia Espera <a5b6@riseup.net>

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 MAINTAINERS                                      |   1 +
 drivers/gpu/drm/panel/Kconfig                    |  13 +
 drivers/gpu/drm/panel/Makefile                   |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 402 +++++++++++++++++++++++
 4 files changed, 417 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e5c5a19f6d710..3cb9193b83c2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8056,6 +8056,7 @@ DRM DRIVER FOR SAMSUNG S6E3FC2X01 DDIC
 M:	David Heidelberg <david@ixit.cz>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
 
 DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
 M:	Dzmitry Sankouski <dsankouski@gmail.com>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 407c5f6a268b2..39e9777640efd 100644
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
index 3615a761b44f9..a2587c724331d 100644
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
index 0000000000000..5097143c21d52
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
@@ -0,0 +1,402 @@
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
+	/*  This panel needs the high and low bytes swapped
+	 *  for the brightness value
+	 */
+	brightness = __swab16(brightness);
+
+	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
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


