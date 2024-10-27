Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57DD9B216D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 00:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFBF10E225;
	Sun, 27 Oct 2024 23:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="G8gq/3Ue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic306-21.consmr.mail.ir2.yahoo.com
 (sonic306-21.consmr.mail.ir2.yahoo.com [77.238.176.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A9F10E07E
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 23:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1730072542; bh=8XIBMPPJ42gdb5Y/4rMuxdsvD17E+KR1v4HtmxfGLTY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=G8gq/3UeSpd062yZ2kCFaa8ODQ0C0+WOjhJbvcgU46aueIomifbBQBsc96joFEe6IeuS2ZUOZ8sqTXa17ikj9cFtnEFab/wXuAsn/TWeHMEKRjTyZ/l9ux4xce0VrW2F/xo5GOkfzP/2HElZUHslov69+T7xT2mEGXY/9lkG5WEIEmQOae0ebFHP5jNcEVEtVoBPIBzchLdG6IkpEqM5f9DSpJtD4Umz9RVPNs0yldY4+9Om9/t07/JKfygGTAg240YBo9KmVn51t0Wo74c8mKyqogduD3WzkvW80KeKHhZbEp1eEK72bXQhXqH7R5wEF+3eBoLgo1OFkvJUyFLoTw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1730072542; bh=pUEGDzGQKxESuaOBAiC5fkjpdcuIXVxHR7QxIBzeSI6=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=MyUpYEH5S/xMu2mB+YoFzWrITjb/4+vbgFu/c/VsUqm7WjmriWoVGafAXzBPkQxxQO0l2Gor2uP0yf7ZNAXDAm6t8HjwVbEALDXy1rvdOacnJjwbru8gTgUT57MXDfFJ2nZrkQFok3HZNc5Z+P0BsLBiEoKqD4/WI7CN2WewjkIRqUrkQObx8E39cNK0SdMcG0dKn9ELvbuKIA7GHtmwm3TViwtbTRAIYe2B9LtAXQonJd7tLcb2y8hFPOaCtGyX7VdhJEjHaLvlsUJoOe9X8KB2IIeQ7aSJrhFLnTELtKf4SehO7Df4p3K7vUMUpFPss9mVu71ZLMiFIVLT7+ClaQ==
X-YMail-OSG: 5ITGqTcVM1m51TwlXbrgnZq8zDBs2eGzzI3MH19.va07sDiyi0t_Fv0A2KOWRLK
 T5CK743FX3pRBLpR6NTfapOBZos86713q_V_vh_yE7y7NJ.4SYzYf7t3KQmgTMa69qnjK3e4NqLc
 pUiAn9H0r.KXJ557JVx.sRl6fmi_zImMnkseDkFRDaFN2iPksUMudhvWh9RtCcIulU87VVX_evzc
 cSgv.LsEdxrDhzrLQBAG14rxul2g8QYCjaHLwFA.8PpSeeW_LzOr_PqSascTE6QqHZ8OWqDuMGkt
 IA_FMECR8qGX4SazwrvcMAP6KH7nWDEq0qOXRiTSxdHVD4BZMj500lFkvwj9LxnF1QaWhTIYMVX7
 I1.7u_Ua2RHhrDgcXI7KBA1t.XMLuhiJYZSBMRZlm1Zij2JCSR.j85rwxM4_miUYTJ8d8PhwvNlv
 Ccte3ipjN0mrj2jLgxy3KLJVSCEdnVr_.l4OFTXcnF7FesfT3YnEi5Jq2VnYnKm308hDvGbUAZpo
 lDqDlZpyWw0Yw5nyFORXosmB.AZhomBruAoOzgcaqXLupVuJlxN8JcTQAEAupEE9CFygX4_ecJdy
 b7Ei1TooeO7MlQDJiVo16lIdYfEOFkaoPyGCAS8GzARE9RyzSgvuCIw9HS2gELQrPiHJKDzJZlxl
 Y8ZqDwxTDUFs4nRZutdNRq_BhFrqM2DAyc0VtXF8J5S_h.d97xV2onEDLOcevXD1cMJLDTI1MgrP
 t0A7cwZfI7VP70Ckr4rKehQpTAqlgegGAXmuNbO8Uyo_af.9F5yifYOMRHw6OuBfL8gyvClh.Y2I
 SloHnrj0MwJe7cqbi2yfGApqej0LvIk6AYHm7iIj82nVHSDkdIpr5rQEo9DuJ2ZS29NCHx9PLwlO
 fPBGJHmUycSncwTpBTIpNIABkUKptvL1gL8YnhQBHLt0OZtQak6YOw9KWSgh2rNxwXzSuj_RKIwm
 XugbmSDimgqd5NFU34qyl8bcrptduB7UHTj9u_70J_TX.yIfscfxkadKZkeyXQwoZfRg9RPWuPjT
 yujg9RsK2UbIofVfnsISZa0myAghPIJvpRkkxbjwAb0YvgyCzjhm7HNaL6R510rLSKGhu4lkAdKV
 CLhvnflhmmjxY3UTlKlGNUNQoDi3Y_lTbnV81g288oX77PSEj4cgex_Qgza8q2Ymf.7n7AcUxY.y
 7o9lyzv8ZZO.qzqi1c8S1vlCuG1KV.oHo.URHZiGbrFQ4nkb6wQb2SHKERnoucUS_KYgq85oH5se
 sSnkrarYL1Mv.s39a4RUySgf91XTYh9oy6ZPNf5oj.a_Kq9rXMezMSMTUxY1Ux9enZdQOqPBlEFw
 FcwA7Ksph8NEz3acdZN6k8bGeyj3AodXaW.TkMe0Yt8gjBWEvxzDlL.GY6FCkdGwNCcZ5uQ3x__L
 51qe.hjb0ymp3m5UHrTjMOycdbpO9BaMe3_o0NmLVeWsjTrywqUc5UDMOS5Yf0DbdBcZ7WMO1Hmx
 WnQeKyGnHOipdwFrsuL5WP3ZKOwMKmLSjYdWSFsjL6PdiJzLj4fOKV.nEZCwgvwwMUBg0SJgnGtO
 3c1.PKAbv0IDXl5MGJ4A299gND5Qwmg0TjMU9cQPXfGcEZAG5Fn_2ve_xZZUbGp1pCYarfjOsLMc
 L535_QhmmGSK3ECNfsaAo5JGZRKBFdg7sJ5rOFyJsieNovpKnehhEcz9MagMqLiNAi3sf3wjRvjn
 TXZRpe9swjUZUPZ92HuhF_nWfKo6tNvabc795kv9q3K1sWJM3IXUsnVYkD3TXvcjWqP2CFyqRHcX
 uyCOAmTahrTVrx09s8JQoKjGRiCxTFz3fuY.T8Aal8hFgnWfE6PruZbW6GQVNj_vsuQDfDoJGmLf
 RLdYEFhmJT5p2qffHEDqDIN63vTk79az4a3FP2rHwcAHVd14npSJQSCAoiDlvpt1eJg4rPsVswVs
 Zouex65.PdyCSzI.1avwd7v07JpU_inRfkWtGExjftyP4TfUTMMmvBj7zV7cMAPaf3P8uSrGCN9q
 f4L472al3u6L.vnfBT_wmdm_CiCNPzsqf4nbqS6GG0k2pM0L2CJ4zHyOuPyHCE.4PNCJejfyqswr
 GFtjKZ.ZFZ6nEeuZQS3DIHQqWpG9qVeuR7D6pqtopcNSWjYuFedkjgRd.1sUnV991fGZ.UXMEL5D
 xjW9nw6VN99OT5U91Mb9DbgxCDKdEKIXrLe4UIeECFQWyKt7gGpvco8tUe5kW9H1Q5.2yXPiADrn
 dT2aYtvlk4iWtBfkL18mitmn_UElrFrAI9NU.5OIq4xMq5kU2_9CNPzAsTuIS.WJ4NkpmVsf97PD
 qcJWBkAMZ8TcnREqSC83GlxtP0LKQTyhTgiLVyRYih6iRzZFovQ--
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 8aed8bf0-e626-496f-9a83-4ac2794e898c
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ir2.yahoo.com with HTTP; Sun, 27 Oct 2024 23:42:22 +0000
Received: by hermes--production-ir2-c694d79d9-qzm27 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID fc681596c483b48011d8a98a0d7203e6; 
 Sun, 27 Oct 2024 23:42:20 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH v4 3/5] drm/panel: samsung-s6e88a0-ams427ap24: Add initial
 driver
Date: Mon, 28 Oct 2024 00:42:04 +0100
Message-Id: <d92ef0036b66520bb6d1ec908165e776cf30c303.1730070570.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1730070570.git.jahau@rocketmail.com>
References: <cover.1730070570.git.jahau@rocketmail.com>
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

This initial part of the panel driver was mostly generated by the
"linux-mdss-dsi-panel-driver-generator" tool [1], reading downstream
Android kernel file "dsi_panel_S6E88A0_AMS427AP24_qhd_octa_video.dtsi" [2].

On top of the generic output of the tool, there were a couple of changes
applied:
- Added mipi_dsi_dcs_set_display_on() to function s6e88a0_ams427ap24_on(),
  otherwise the display does not show up.
- In functions s6e88a0_ams427ap24_on() and s6e88a0_ams427ap24_off()
  changed DSI commands to multi context and used "accum_err" returns.
- In functions s6e88a0_ams427ap24_on() and s6e88a0_ams427ap24_off() replaced
  msleep() by mipi_dsi_msleep().
- The function s6e88a0_ams427ap24_get_modes() was changed to make use of
  drm_connector_helper_get_modes_fixed(). This also required to include
  drm/drm_probe_helper.h.
- In function s6e88a0_ams427ap24_probe() registring the regulators was changed
  to devm_regulator_bulk_get_const(). This required to change supplies in struct
  s6e88a0_ams427ap24 to a pointer.
- Removed bool "prepared" from struct s6e88a0_ams427ap24 and according parts in
  functions s6e88a0_ams427ap24_prepare() and s6e88a0_ams427ap24_unprepare().
- Removed include <linux/of.h>, it's not needed.
- Added comments to the mipi_dsi_dcs_write_seq_multi() lines in function
  s6e88a0_ams427ap24_on().

[1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
[2] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/drivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/dsi_panel_S6E88A0_AMS427AP24_qhd_octa_video.dtsi

Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
---
Changes in v4:
 - Removed include <linux/of.h>, it's not needed.
 - Added comments to the mipi_dsi_dcs_write_seq_multi() lines in function
   s6e88a0_ams427ap24_on().
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../panel/panel-samsung-s6e88a0-ams427ap24.c  | 251 ++++++++++++++++++
 3 files changed, 261 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index bce4cb64184a..f8adc38447fb 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -632,6 +632,15 @@ config DRM_PANEL_SAMSUNG_AMS639RQ08
 	  Say Y or M here if you want to enable support for the
 	  Samsung AMS639RQ08 FHD Plus (2340x1080@60Hz) CMD mode panel.
 
+config DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24
+	tristate "Samsung AMS427AP24 panel with S6E88A0 controller"
+	depends on GPIOLIB && OF && REGULATOR
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y here if you want to enable support for Samsung AMS427AP24 panel
+	  with S6E88A0 controller (found in Samsung Galaxy S4 Mini Value Edition
+	  GT-I9195I). To compile this driver as a module, choose M here.
+
 config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
 	tristate "Samsung AMS452EF01 panel with S6E88A0 DSI video mode controller"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 4db02c2411ae..7dcf72646cac 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_SPI) += panel-samsung-s6e63m0-spi.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI) += panel-samsung-s6e63m0-dsi.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24) += panel-samsung-s6e88a0-ams427ap24.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
new file mode 100644
index 000000000000..8e4d012667d7
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Samsung AMS427AP24 panel with S6E88A0 controller
+ * Copyright (c) 2024 Jakob Hauser <jahau@rocketmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct s6e88a0_ams427ap24 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regulator_bulk_data s6e88a0_ams427ap24_supplies[] = {
+	{ .supply = "vdd3" },
+	{ .supply = "vci" },
+};
+
+static inline
+struct s6e88a0_ams427ap24 *to_s6e88a0_ams427ap24(struct drm_panel *panel)
+{
+	return container_of(panel, struct s6e88a0_ams427ap24, panel);
+}
+
+static void s6e88a0_ams427ap24_reset(struct s6e88a0_ams427ap24 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(18000, 19000);
+}
+
+static int s6e88a0_ams427ap24_on(struct s6e88a0_ams427ap24 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a); // level 1 key on
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a); // level 2 key on
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x11); // src latch set global 1
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x11); // src latch set 1
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x13); // src latch set global 2
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x18); // src latch set 2
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x02); // avdd set 1
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x30); // avdd set 2
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0x5a, 0x5a); // level 3 key on
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x4c); // pixel clock divider pol.
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x03, 0x0d); // unknown
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0xa5, 0xa5); // level 3 key off
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca,
+				     0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x80,
+				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				     0x80, 0x80, 0x00, 0x00, 0x00); // set gamma
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2,
+				     0x40, 0x08, 0x20, 0x00, 0x08); // set aid
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x28, 0x0b); // set elvss
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7, 0x03); // gamma update
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x00); // acl off
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5); // level 1 key off
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5); // level 2 key off
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int s6e88a0_ams427ap24_off(struct s6e88a0_ams427ap24 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return dsi_ctx.accum_err;
+}
+
+static int s6e88a0_ams427ap24_prepare(struct drm_panel *panel)
+{
+	struct s6e88a0_ams427ap24 *ctx = to_s6e88a0_ams427ap24(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
+				    ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	s6e88a0_ams427ap24_reset(ctx);
+
+	ret = s6e88a0_ams427ap24_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
+				       ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int s6e88a0_ams427ap24_unprepare(struct drm_panel *panel)
+{
+	struct s6e88a0_ams427ap24 *ctx = to_s6e88a0_ams427ap24(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = s6e88a0_ams427ap24_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
+			       ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode s6e88a0_ams427ap24_mode = {
+	.clock = (540 + 94 + 4 + 18) * (960 + 12 + 1 + 3) * 60 / 1000,
+	.hdisplay = 540,
+	.hsync_start = 540 + 94,
+	.hsync_end = 540 + 94 + 4,
+	.htotal = 540 + 94 + 4 + 18,
+	.vdisplay = 960,
+	.vsync_start = 960 + 12,
+	.vsync_end = 960 + 12 + 1,
+	.vtotal = 960 + 12 + 1 + 3,
+	.width_mm = 55,
+	.height_mm = 95,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int s6e88a0_ams427ap24_get_modes(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector,
+						    &s6e88a0_ams427ap24_mode);
+}
+
+static const struct drm_panel_funcs s6e88a0_ams427ap24_panel_funcs = {
+	.prepare = s6e88a0_ams427ap24_prepare,
+	.unprepare = s6e88a0_ams427ap24_unprepare,
+	.get_modes = s6e88a0_ams427ap24_get_modes,
+};
+
+static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct s6e88a0_ams427ap24 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = devm_regulator_bulk_get_const(dev,
+				      ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
+				      s6e88a0_ams427ap24_supplies,
+				      &ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 2;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_NO_EOT_PACKET;
+
+	drm_panel_init(&ctx->panel, dev, &s6e88a0_ams427ap24_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
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
+static void s6e88a0_ams427ap24_remove(struct mipi_dsi_device *dsi)
+{
+	struct s6e88a0_ams427ap24 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id s6e88a0_ams427ap24_of_match[] = {
+	{ .compatible = "samsung,s6e88a0-ams427ap24" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, s6e88a0_ams427ap24_of_match);
+
+static struct mipi_dsi_driver s6e88a0_ams427ap24_driver = {
+	.probe = s6e88a0_ams427ap24_probe,
+	.remove = s6e88a0_ams427ap24_remove,
+	.driver = {
+		.name = "panel-s6e88a0-ams427ap24",
+		.of_match_table = s6e88a0_ams427ap24_of_match,
+	},
+};
+module_mipi_dsi_driver(s6e88a0_ams427ap24_driver);
+
+MODULE_AUTHOR("Jakob Hauser <jahau@rocketmail.com>");
+MODULE_DESCRIPTION("Samsung AMS427AP24 panel with S6E88A0 controller");
+MODULE_LICENSE("GPL v2");
-- 
2.39.5

