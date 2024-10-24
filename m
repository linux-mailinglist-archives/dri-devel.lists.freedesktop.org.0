Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544379ADA5B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 05:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9337310E267;
	Thu, 24 Oct 2024 03:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="YaD+/h0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic305-21.consmr.mail.ir2.yahoo.com
 (sonic305-21.consmr.mail.ir2.yahoo.com [77.238.177.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F3D10E896
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 03:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1729739921; bh=XLp036BwmbZpgXYR1m9+ojQGCSAhTh/SmX7gBH+7S0Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=YaD+/h0HsolWctHi+VqUr3EcJREbG0AWHWeWSuVoDl9FwkPFPnvqIej6FDY3WqIV5aY9Jf63qcVcupPjwSQvRgtaz/3abdub/vO390yBoGJjMJZmGL6oIOfPexsXGWdskT/BBWvwsKkk6vLcjK+YCI2Tpsht3Pq5hsJifWPxEK4+nwoDSHSnL82MWQtewJwC7gwmtErEhQKdE/AhigfOaid1Wa9MfZy1QAU359haKcrOCNvf8F7fvN0CtxchmdSXvtCdMjbgDvo/yVKx1MzVZKllKzT270yoCtRVY0xd4CV8JMMUUk6HhOhjF8YbtD3mIoo4oPV/62uQWiXyuPrs8w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1729739921; bh=1ONgEs1S+AC4xzQiUySNLaqJHXBagjxQQZhzRcMYnzE=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=Frk2wuWrctiQLImmb5hCWhB9IDqRAyxxu8ZBnltCNDOkf9GyIGa7Bar9OYQg4AtxKk/qTvdvyaeHC26MOjIoiokqd3kxTDJXcvWIYNMISgRsAfklpB+XUjun9hXkiAK/+lni/3VdZPRDisayAJm2MSjVbJb/8JGzBLQp0RV5ZGF5TbUAlhjOQ5X0Ygiq8PPfhumEotHa1QZ0os8da1rPHPSOdPvgHK/8AWrlAp3lnxEVvuCzb5VkXnEYv/4tt8r9sGOB/GrCnE3D295IDcrI5QEnp3O2BGaTKWR3vqkfYkrVnmuLQM+TRoPu8hMsBYhe67FwWVXLmbD45kK2c0EbkA==
X-YMail-OSG: YMIhNQ0VM1muqvyAB3N9ac.FbFEjrdY9yL_rn2RHXW0YIi9nnVll.MmniK_GwUf
 Dr3oSRVvE14HQp_x.nmvWGriI1eSASMtjQol9hUgbbxShITAQup6M.0jmVPOv.c2ocSUQiBl.vZB
 vlePjOcKdW0N9djY68dtPoyajSyxbtAPCKMtAEONUsldoTL6wtgZ1VKhs7lF4wY.zYiJMM71kM57
 Wl5WTCTHQmu4Z8wJBbkJwEMOz7QFogm0fDBgtcbYVaR3F2Ll0.KX9hi_TTZg8hgw5F3UqMU9HgP4
 Z21Gd2qwIFOUILec6_SeZY4X_PJN4NZ_k0UHuVFhHQ21ylnMcvZF6llq1g0g_IqB0E5YzgYEJ3mZ
 FgH93yqBOeKONSOMkrIt_3x5Lm47ha1RS4ow97LDn.SDMW6PXxKw172DEPsoe_OOYws0bpoFIi6x
 skMzyGyk3O34o9ozaDvnubS0JIQie_O0PzRPAyczknli279EArrnBbUKB6QYtHJ02mRUphplXoGg
 5b3A6KewoWlF2fsJ73yJ4oN5b7jAckGepiqdgGnkbXqIKDHLnkRmYaIOS6F9W2viOGtzcNKv0iy3
 maIHph1rUVHDesdU69bOUkLs7zIkzQcub2sguon.16YnkTOFZFRwx.bzvW.5Q9PHn11fFEdrEEb5
 gPY3ir3ex2Bml4aJw7ct6x.yj7CoUtdEsnXI6fCYB535AkS6GAKw51GX8e.XRK8YNSUD9BmjtFG4
 q0R8uZItNKsNoG9IDpuyA62HQTcmdYjC_tlpvqfixX3kzOswTsaxOSdEYm9aOgLqDvQnCYlGUFcf
 iKshI7lOzDmLqB3sNpcXJbgwxF9qbw2xg1csdToSaCwa2sPSonFWD66MffWKMAniFuCSVoaudOdy
 44M.Muy0mEpOp5qN6XPSp49rIW8MXjgFVeOm9D0EDZuw2JvECNfvp9eF1AJeVZfjgvPAkbe0KJ8R
 DVlvdBKUP14KBL2jvUWcj4.VcT8Pzx9ut.N2cJlqS4Yw1SdvarZ7qFD85tLdCmgfG6_bwy51lgQO
 vBt8ZXWeVH_r.hGuibfNf_Wj59Q3yYkAV_GlvvqzFolZ17Sxn2bffS5Fx8IAhsvSoar.bnjcrWD9
 65_HwM98CjF3CZUBeh9sY8NQ4C0rkkJXF1WKhiv9vwTNd_Ha7ZCZznhbS18v0gNg2Erafmqlq1C0
 6vcKEZWyFtP5GvVcCFegD_0xTc13MwPmzpNunUa.gDw9I701tGBAnQyseilSDsiwMXu0ikiKtZmA
 UwHUNmO0DLchbmV9QiDRltLKPlkjRBJaYCqhQs6Jce1jju38T.YpketsHucuJ66L.7iCvpkHi6I0
 vHnOIsqS8X6.14q.3C6aPpbsEsMMwWcbVqSPjfZrUg.i_kh_0WJI2aIfB43hwcCvwg.qgg04nEDn
 .Aj.B78bs5okpJ5s8dHQESVo9XFTRMCIJgfbTGQn7z16zSfjvd.qQPs43RPo8iiskwDwiyjVGdDT
 fh5fswhkNa9YC8eBug4DDel.OD7DBaNtnF3OtYl_9Iil3vsQEb_UeB0y02nIMJyLcbF5W2OxlO0T
 vGNao4.LeNEygfHR4JizpFs1T8hyuKHbV0Q2WBUeZDnbE2iYRa6OpIGs8AzODdVZN9wGjg9ky96q
 PVHLaQ1NVsngaWyHGD.r.kkv6eSnsA37NUIPyPVoGX0pJUuYRrad2EguOZY1QN8RsjKLesuMOY_F
 rJs.9m5A.l4RA3ZOzIb.Tl3SOFrXuETFsKfj6XD6Fr8kazwyIwRIdY_6iCYlevZ5kDiO3O3Hay9S
 YqFDCiSAsiyigrjKDHTD9nALkClOLhISk3zhR24q6EblSoKl.4b8y1jdZ7lPahQ6X2cXc76eBOFl
 aG3SLGqQQs3M0JBpFydyVCwnw7kQSX09eXSmfJ05H5uQP4uUXqXMD4sOVA7DwPBOzNvMlbIcB7JP
 7V0_eIN6p0skZA88U_aFNvoOcWkZlhgoYIlmTcEKLHU9.FMmtWpOKeLaWjc5KGw1JkKHNhA96e.d
 Px9ZhdTyopT.NibNPyx0EW.8p3m9rrc4ti6XgdggpVom5FGMa2OUW5c31dXRJ.ZGZrAcArK47vXF
 QJsOAHcfsVh98SDfoQPs0PpSdzOxgg_6cL17D5jKodpHSNWiE83hfAiAuBJyPWsGAJRsbU2StsA8
 .jAWLpAsPlCg5jaTxFE0dQDhh8HFKV9sjX5kbb5Ty7Izo26KGvyNt9RMqdfeJDbvwNWcvgpp_enJ
 LIl6.QRL1MqSKJcsyFBx8IrtzsU0aJIoMW3m0E6sKUZHh2Up_pzDefPQdaqeW8o.gxkwNWrhABV4
 hjsAxz5ZtN3xyJ2VJqeCfX8j3KELLdqj_XpZ7jEhQEp6vOmZdN9rSkQM-
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 66342042-12ab-43bd-bf63-08845b443e26
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ir2.yahoo.com with HTTP; Thu, 24 Oct 2024 03:18:41 +0000
Received: by hermes--production-ir2-c694d79d9-2zgj2 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 26d1652bc1703d2ade3e89c3cd33808b; 
 Thu, 24 Oct 2024 03:18:40 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH v3 3/5] drm/panel: samsung-s6e88a0-ams427ap24: Add initial
 driver
Date: Thu, 24 Oct 2024 05:18:25 +0200
Message-Id: <bef462116190c26e6339cd58240773f035efcca9.1729738189.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1729738189.git.jahau@rocketmail.com>
References: <cover.1729738189.git.jahau@rocketmail.com>
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

[1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
[2] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/drivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/dsi_panel_S6E88A0_AMS427AP24_qhd_octa_video.dtsi

Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
---
Changes in v3:
 - Made struct s6e88a0_ams427ap24_supplies[] "static".
 - Removed the "panel->prepared" parts from functions
   s6e88a0_ams427ap24_prepare() and s6e88a0_ams427ap24_unprepare().
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../panel/panel-samsung-s6e88a0-ams427ap24.c  | 252 ++++++++++++++++++
 3 files changed, 262 insertions(+)
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
index 000000000000..7435e0fcb4f5
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Samsung AMS427AP24 panel with S6E88A0 controller
+ * Copyright (c) 2024 Jakob Hauser <jahau@rocketmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
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
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x30);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x03, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca,
+				     0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x80,
+				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				     0x80, 0x80, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2,
+				     0x40, 0x08, 0x20, 0x00, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x28, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
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

