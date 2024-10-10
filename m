Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B459995B0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 01:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECB210EA06;
	Thu, 10 Oct 2024 23:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="bgvRaJr9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic312-26.consmr.mail.ir2.yahoo.com
 (sonic312-26.consmr.mail.ir2.yahoo.com [77.238.178.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4807210E9B2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1728585119; bh=VQ4NzBF3TD+BrXUOBvpilZ2FzFEEeRSPx8VYOZUJm+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=bgvRaJr940vdJWV+FI+yDeww3ulr9vY1x0ynmSendnaqRRxVztNaxJf6UYURdsw/n6pFbCcSO8vKC+9e3eIZLwKOR8uzYSXRbi04z64oX//8SYZTG3fA5JahA6t8m3zznikdokNNK+bDWafsDBt7EGszGiQejsuA5z+5hHi7abkmC/7EC9gZNKAcf9QHsaZY0hJe6Q0cJXW1cpJNhib9PrRB9sbF93owi8DumVJS6aXnEb8qanq+efX3WX97eXCKGx+zC4Uc9qoLF7mr2iAvY5llw0EUVlOdz1jZ8z6XzY42jufQqr8peuF0jYJXlg+vSsAGSYgEGIWUo6jtyasQCg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1728585119; bh=JdBHWUbpSfnMm7zJPo1pYf7uSpdUwJhEmDdaHM/15qN=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=j0ZDfWmlupqcdIYP1ylNlQfUVSogiApCaAifTTyjTqCsJMw4QqHjL5BfrveSXULVMA0Gq4QnTTwEHdHqN0QwNpB8szMfl6anEcPpbadEevJpC3zM+58TRUExJw52dmYDTQVJESp0xPpiYtcxjyNB+7+iQj6+e/Ykfo28kYhPbjmQfvkKsCatfS5SKsNyWZvriq7tL/mo3FnkmeK84vWvLmTgbrRZF3Ixzfq1ICKPK/eBHmqS73GbtkrMWDlCb5V3JJ4NozO4DPujP0CZfsEQa5exfKgEDMzGrcqX9yT7DowFdOACjyMm1tgk3CsFjFm/+787tSwFR1w9nTJ+8Pg+Jg==
X-YMail-OSG: 3biwbCAVM1mlJm9aOwgaudQl_eL6hS4.hyv1B4KHFQJSm4uZSVzsPG1b0yv0BE.
 cJ0GXBSGPN4yhowR8EbDZSg5He3ro0ikTBf2q9TtbPymfUsn480CGgrwlmHU8oh6wtQ0WLQUxl_p
 yvO3BSy0pMsgkiwm9XZCpUnPs9eCwPWbO6m653V1xmWsvhG5JwUT.Z08aNgNnb4OXZZJbkjaZJC.
 ZrMhnY54eijM3ez_2eOqsM0LvB1h.zHrIJ.2hVIpD4V_ATGrpWJoHk0FpDyvneztvjJ3XzZvLRMg
 cjE.bOr308TG..ubKyz2MdlP5kJzsUMOElc1Np65OOFESC3YbNewmgPFXEqpksFEMam262etqZKs
 FL6C3A4aV4GSAM7MFXxAPwqmEEuDlpvg6UgmAwyaw8K4FbCyqyKE1UahzyFx6kZYjHCZIR5XQyQh
 yZ6CE8jJF2Y0Mbh1rJMrCpBxfKhTxBG_FIOivZbdte_hlNt0p9yr6xKEE5tQj.E4w27IvGhe5b55
 8Dkj_lWDL8MtU983Gu2_rxrrwMSu1xAIz9PVgLHB6E9gKgVnPXdq5XVgczDarnwBDwy_QwtKKMF_
 Ks8bOtRlip9qmvJYH9PAd6Jxxij2cL79oymPUbD2ICxG4wnyqRnP_qV4SDgL9xsoiU1vCGiFxddR
 qb0F4ZXHqsbRpPYpTEIdhl99iG7_wMaYJzuHpu7Xd1ypYnxXxGdySYFzoB52JFocvCUQFaj1mTPK
 AqasYdN5W3xgLzzGih9AyUIgA0IZaowo_oSU_QCUSWAkPfcEFqVtiomiaF_9XF3Mc8M.b3Dfne0J
 Ok94fHB.fLz5qAUfoYZXV.cCHJsZgq2meWx_1.sZAqSFPJz8zcg4cZeAlRH3LMm3fCTOCwj0HR_h
 rmcyHWPAtf1crTQzWeQB5IJbKACWLhwAIXhoxsEpyyGirmOCHn8AZvqHVs6k.kwN40R.GZBHOq1m
 tIbB6G9i7aulJ2eVA6LsS5GbilU_q71Pev2NK3qaOb7x2lGIh3vpyv1M49VF1SkzhZozW_xncT7s
 l0l4.mKPLSzmSO3toqqWv0M4kGVDYUZs6D6tio58oIJ7ehDsnUrW91f6MYu0U263wVdeDMYC7kTB
 TKaIYEBmPtQVhIU9e0Q5vqsNzUrfJTYGLjStaEMCOdXCzAUwmRB_XbBU7Cn8Dvmc0.PvnJ5Ya8vx
 I16DZS7VnGBEnGqyIt.p1I4E5Zhci9u9XKVRQCHH2hbF3YHa7GDAmt_5TKycpm.n5J574rdS6TtI
 z7Mi_Ov6NwVpvxC0J67YOxcRzvmZlUaHYzw4VbWQAYF7gPcWXSHFEkv8cOG4jVnsKkcYDlvp3xVz
 aCGE3qD3ZflRiTB8eUnMFbhG_zTjCK5Kd4pJi2hzkv5NBZ3v9_UtXvkokLTntibLu1TrK1I5pNDh
 i.vmko6XkdRt_xW3wRHxsbKHISZGU84priLSJIxpwflI9TyQ3oWwv.TAJ7tgwIPCY43F3AVICNke
 wwV1.6ud9f5tczQWn5WiKLqTpSSw6gwcgtKmOgNVL72cm1MydUlgb5uQtbBkqVvoop.GDQ7d5eIQ
 jXK0RROft.yaZmGJyXK8jVAoG4OAZfzayqSOojoLTpqAf7.IvZCrE97v_DwgfZsafk6TrI0rATz5
 o_83oaG8Ed8PIsMoBWcB5tDWs6etrbQFerIUrks5CAlHfwHy4.vtBkhNem8GZfC.bjiM1Glpk0E6
 4EjzYujz0FMB2V9Pr93Zp7le0UIv7sORRMDCaSZoL24ForBAKI3su7GneB.vI4czDQ9pfnWGI6tq
 6m9Ku1DGzls5ndHSVN2W1gXkt.mCmNn7lw712SbodbSGoU_S4.OcZC2vO1cST.36Dk70vGgD6opz
 Gue.tkrZ3s.sK5n_VBLUB6b7L8Gg85zl17B4Q0xCqu1T.wlYkECBB32hVTzpq_xJpZxC_vGZH7KH
 rYlTqwljOwBfCDStx60RUS4W0IfeZk5uftfQzyV9Z7uf3g1PjVOGhZwFubP0AI07yGaadGTTVKj.
 cn4AWjG_bGYSh5xb4Fe1g82_m4kSxZ0frQmery1MJDkhl9mFg0JKm4FzF1QW262L96nZTymuRLsZ
 9mlcoQNE.XLWrPVWzDq_cGXEgNd6mIgQ1YPOxBmy0WS50w8nNX2moZYkjAhlBrh_MVkFMGXW9FDm
 AoMpZ5lVDoJWmqr6m0trowEnLrxakWlKReSUde8wdYwSCvCuQFbFQIlikjR8rpLe3WphUgeldMCj
 CpOiQhTi.Du9RGDMcoAcGiBMMR2esWz8v955IaoF0OY2VOBD7IEdbobCd5wwRs.tndvMXK4yeits
 4mj1SPDU8L67uSp3iLRZl.Y8EExK7MFIbbIUAtn7ZyHR58jz1lhhuPzle5Q--
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: c3365b06-8d82-45d8-b1b1-a24869898cf7
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Thu, 10 Oct 2024 18:31:59 +0000
Received: by hermes--production-ir2-6664f499fc-97g4x (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 7a7b462d09211a1a6528a42ebeb90f61; 
 Thu, 10 Oct 2024 18:31:58 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH 2/4] drm/panel: samsung-s6e88a0-ams427ap24: Add initial driver
Date: Thu, 10 Oct 2024 20:31:49 +0200
Message-Id: <d36d0d152c509b78d02f9f7adbea665c0c863446.1728582727.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1728582727.git.jahau@rocketmail.com>
References: <cover.1728582727.git.jahau@rocketmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Oct 2024 23:20:22 +0000
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

Coulnd't read out RAW EDID, /sys/class/drm/card0-DSI-1/edid is empty.

[1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
[2] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/drivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/dsi_panel_S6E88A0_AMS427AP24_qhd_octa_video.dtsi

Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../panel/panel-samsung-s6e88a0-ams427ap24.c  | 261 ++++++++++++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ddfaa99ea9dd..fa6a8c6cac5b 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -623,6 +623,15 @@ config DRM_PANEL_SAMSUNG_AMS639RQ08
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
index 4b5eaf111676..3002087c26d1 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -76,6 +76,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_SPI) += panel-samsung-s6e63m0-spi.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI) += panel-samsung-s6e63m0-dsi.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24) += panel-samsung-s6e88a0-ams427ap24.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
new file mode 100644
index 000000000000..182ba8c347e2
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
@@ -0,0 +1,261 @@
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
+	bool prepared;
+};
+
+const struct regulator_bulk_data s6e88a0_ams427ap24_supplies[] = {
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
+	if (ctx->prepared)
+		return 0;
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
+	ctx->prepared = true;
+	return 0;
+}
+
+static int s6e88a0_ams427ap24_unprepare(struct drm_panel *panel)
+{
+	struct s6e88a0_ams427ap24 *ctx = to_s6e88a0_ams427ap24(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ret = s6e88a0_ams427ap24_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
+			       ctx->supplies);
+
+	ctx->prepared = false;
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

