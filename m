Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4EBA262BE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 19:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B859610E131;
	Mon,  3 Feb 2025 18:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="JCERP6Oo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="hygMn6Ab";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="xjx1GXIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback3.i.mail.ru (fallback3.i.mail.ru [79.137.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2850610E087;
 Mon,  3 Feb 2025 18:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=efPJ83izhnLGT+vv3kNxvNoLh3leGKVKDx03/rwnaeg=; 
 t=1738608281;x=1738698281; 
 b=JCERP6OoXo3rBtHCsjAsBTWySgmwaqiPZQ7PXYieNeYdWccuAs0Z8G6UbErwn6NYTi2N7RBTAprfOk8w3RV1f0DVimI3btw1sp5H7dFddboCLcR1Wd8J866lAxZnmJM2IMadabjWWutzUA3HpeNNqYIY33q95hqm6RaeWHqa204=;
Received: from [10.113.20.168] (port=37804 helo=send123.i.mail.ru)
 by fallback3.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1tf0yn-00GcTL-6D; Mon, 03 Feb 2025 21:15:29 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=efPJ83izhnLGT+vv3kNxvNoLh3leGKVKDx03/rwnaeg=; t=1738606529; x=1738696529; 
 b=hygMn6AbbZ7iPkNuNy6AEMNdDzpjUYD+Hxkjy1XwZRNHGZXOzSrTIhxHoLBEePcjH29YPMivkTw
 pLCNQ6C8t3bdnFt4hd8gguUpVuEcCc5ewnMBweED4KqEN+Leo58ctzgJB9nLt5PGs+doML9bOn1Il
 FhIKZn6Neo/UHbYq+8M=;
Received: from [10.113.171.82] (port=48486 helo=send175.i.mail.ru)
 by exim-fallback-5fbdbdcb77-bt2wt with esmtp (envelope-from
 <danila@jiaxyga.com>)
 id 1tf0ye-00000000L87-2dD5; Mon, 03 Feb 2025 21:15:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=efPJ83izhnLGT+vv3kNxvNoLh3leGKVKDx03/rwnaeg=; t=1738606520; x=1738696520; 
 b=xjx1GXIZC83lfpeTy2XvQVuiSm9NX2oL10A++YNtD91uvIQkANlA8rrBv0cFbNOnXIZJOwaoUTb
 q4EzTNC3G+PX4ncB4ZU/JQBKc1l0ccZRBNCaX5deA4N1geDSAMUvl69qeczqVW/zByDKS0Gr+SkS7
 Iao47EK1+IFWTUaVazo=;
Received: by exim-smtp-6d97ff8cf4-crh4d with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1tf0yI-00000000H1P-2xRn; Mon, 03 Feb 2025 21:14:59 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, jun.nie@linaro.org,
 fekz115@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 2/4] drm/panel: Add Visionox RM692E5 panel driver
Date: Mon,  3 Feb 2025 21:14:25 +0300
Message-ID: <20250203181436.87785-3-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203181436.87785-1-danila@jiaxyga.com>
References: <20250203181436.87785-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9279F651DE5037A50CB9835DFB12218DF141C43C6B1DC11281313CFAB8367EF908E2BE116634AD74DD7AC46B258B82C2B89CEA9C911D0999599040278B651AAC27C4C7F57E7B43BBC09DF98A5C5F6EC85
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7180ADF26E81B0C77EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063726AE6912A880E7848638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89608E6808181C378A51576F636F323C9AE7E6FF4FBD83A8ACC7F00164DA146DAFE8445B8C89999728AA50765F7900637FD2911E685725BF8389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80A9EC8C3488E7643F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C6925688D23FC3BD3AD7EC71F1DB884274AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C33A036A29F4E21B84BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE702706FBA10211704731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A57F45B30656A57CD75002B1117B3ED69698DAD4984879839654BB1175C6E7DD9409CF0A614B9999B12D69E7FE39063EFC1E618B5D5F965AFDFE0C267D7D9174FAB2D1C9E48B6DC60AE2A7E19323554B12787CBDA4B9FA07AC65936A0BD82B957F4EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF505830FD47C92F6C63
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFEEDC7BA391375FD34EF0D3859D3258D1A9956C8CF5E73B4EFD4589EF11E746F9BDB65CFD5BA197A7C56FE0738BD31C04511C2260C6B4039F139AD299E36D9692D0807282E556B82D354DA1E504E663BD02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojks+hT+CyYL2efxoEko04LA==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FF5005910AAC1867381508210FEB0A3EA8BACB764CC5EC4B5D3FB731B38F374A02C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C11582D74B19986F8F049FFFDB7839CE9E725523CC1EE150EB622EA5B6A1E5560EE953B917C677F172D2BA161AA9DDF4FA92C5588333875E59
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSoFW4IxQ609erJdENjvzQK2
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C156D80AD3124A8CDD049FFFDB7839CE9E725523CC1EE150EBE40AA04DB413162F226431897ED67AC84C23FF0858A53D55
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSoFW4IxQ609ejqYQ0PEDyTA
X-Mailru-MI: 20000000000000800
X-Mras: Ok
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

From: Eugene Lepshy <fekz115@gmail.com>

Add the driver for Visionox RM692E5 panel support found in Nothing
Phone (1).

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Co-developed-by: Danila Tikhonov <danila@jiaxyga.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-rm692e5.c    | 433 ++++++++++++++++++
 3 files changed, 444 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm692e5.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d7469c565d1d..66b2827169fb 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -996,6 +996,16 @@ config DRM_PANEL_VISIONOX_RM69299
 	  Say Y here if you want to enable support for Visionox
 	  RM69299  DSI Video Mode panel.
 
+config DRM_PANEL_VISIONOX_RM692E5
+	tristate "Visionox RM692E5"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Visionox RM692E5 amoled
+	  display panels, such as the one found in the Nothing Phone (1)
+	  smartphone.
+
 config DRM_PANEL_VISIONOX_VTDR6130
 	tristate "Visionox VTDR6130"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 7dcf72646cac..6177f2d4113e 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -100,6 +100,7 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
 obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
+obj-$(CONFIG_DRM_PANEL_VISIONOX_RM692E5) += panel-visionox-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_R66451) += panel-visionox-r66451.o
 obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) += panel-widechips-ws2401.o
diff --git a/drivers/gpu/drm/panel/panel-visionox-rm692e5.c b/drivers/gpu/drm/panel/panel-visionox-rm692e5.c
new file mode 100644
index 000000000000..abaa035f3a92
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-visionox-rm692e5.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+ * Copyright (c) 2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2025, Eugene Lepshy <fekz115@gmail.com>
+ * Copyright (c) 2025, Danila Tikhonov <danila@jiaxyga.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct visionox_rm692e5 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct drm_dsc_config dsc;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+};
+
+static const struct regulator_bulk_data visionox_rm692e5_supplies[] = {
+	{ .supply = "vddio" },	/* 1p8 */
+	{ .supply = "vdd" },	/* 3p3 */
+};
+
+static inline
+struct visionox_rm692e5 *to_visionox_rm692e5(struct drm_panel *panel)
+{
+	return container_of(panel, struct visionox_rm692e5, panel);
+}
+
+static void visionox_rm692e5_reset(struct visionox_rm692e5 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	msleep(32);
+}
+
+static int visionox_rm692e5_on(struct visionox_rm692e5 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbd, 0x07);
+	mipi_dsi_usleep_range(&dsi_ctx, 17000, 18000);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x11);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00ab);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0xe8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x69);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x79);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x7d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x7e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x83, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x84, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x85, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x86, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x87, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x88, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x89, 0xbe);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8a, 0x3a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8b, 0xfc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8c, 0x3a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8d, 0xfa);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8e, 0x3a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8f, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x3b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x92, 0x3b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x93, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x94, 0x3b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x95, 0xb6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x96, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x97, 0xf6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x98, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x99, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9a, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9b, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9c, 0x5c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9d, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9e, 0x8c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9f, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_READ_PPS_START, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa3, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa4, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa6, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa7, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_READ_PPS_CONTINUE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xaa, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa0, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xa1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x6b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xce, 0xbb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfa, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x08);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x000d);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
+
+	return dsi_ctx.accum_err;
+}
+
+static int visionox_rm692e5_disable(struct drm_panel *panel)
+{
+	struct visionox_rm692e5 *ctx = to_visionox_rm692e5(panel);
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
+
+	return dsi_ctx.accum_err;
+}
+
+static int visionox_rm692e5_prepare(struct drm_panel *panel)
+{
+	struct visionox_rm692e5 *ctx = to_visionox_rm692e5(panel);
+	struct drm_dsc_picture_parameter_set pps;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	dsi_ctx.accum_err = regulator_bulk_enable(ARRAY_SIZE
+				(visionox_rm692e5_supplies), ctx->supplies);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
+
+	visionox_rm692e5_reset(ctx);
+	visionox_rm692e5_on(ctx);
+	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
+	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
+	mipi_dsi_compression_mode_ext_multi(&dsi_ctx, true, MIPI_DSI_COMPRESSION_DSC, 0);
+
+	mipi_dsi_msleep(&dsi_ctx, 28);
+
+	if (dsi_ctx.accum_err) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(visionox_rm692e5_supplies),
+				       ctx->supplies);
+	}
+
+	return dsi_ctx.accum_err;
+}
+
+static int visionox_rm692e5_unprepare(struct drm_panel *panel)
+{
+	struct visionox_rm692e5 *ctx = to_visionox_rm692e5(panel);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(visionox_rm692e5_supplies),
+			       ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode visionox_rm692e5_modes[] = {
+	/* Let's initialize the highest frequency first */
+	{ /* 120Hz mode */
+		.clock = (1080 + 26 + 39 + 36) * (2400 + 16 + 21 + 16) * 120 / 1000,
+		.hdisplay = 1080,
+		.hsync_start = 1080 + 26,
+		.hsync_end = 1080 + 26 + 39,
+		.htotal = 1080 + 26 + 39 + 36,
+		.vdisplay = 2400,
+		.vsync_start = 2400 + 16,
+		.vsync_end = 2400 + 16 + 21,
+		.vtotal = 2400 + 16 + 21 + 16,
+		.width_mm = 68,
+		.height_mm = 152,
+		.type = DRM_MODE_TYPE_DRIVER,
+	},
+	{ /* 90Hz mode */
+		.clock = (1080 + 26 + 39 + 36) * (2400 + 16 + 21 + 16) * 90 / 1000,
+		.hdisplay = 1080,
+		.hsync_start = 1080 + 26,
+		.hsync_end = 1080 + 26 + 39,
+		.htotal = 1080 + 26 + 39 + 36,
+		.vdisplay = 2400,
+		.vsync_start = 2400 + 16,
+		.vsync_end = 2400 + 16 + 21,
+		.vtotal = 2400 + 16 + 21 + 16,
+		.width_mm = 68,
+		.height_mm = 152,
+		.type = DRM_MODE_TYPE_DRIVER,
+	},
+	{ /* 60Hz mode */
+		.clock = (1080 + 26 + 39 + 36) * (2400 + 16 + 21 + 16) * 60 / 1000,
+		.hdisplay = 1080,
+		.hsync_start = 1080 + 26,
+		.hsync_end = 1080 + 26 + 39,
+		.htotal = 1080 + 26 + 39 + 36,
+		.vdisplay = 2400,
+		.vsync_start = 2400 + 16,
+		.vsync_end = 2400 + 16 + 21,
+		.vtotal = 2400 + 16 + 21 + 16,
+		.width_mm = 68,
+		.height_mm = 152,
+		.type = DRM_MODE_TYPE_DRIVER,
+	},
+};
+
+static int visionox_rm692e5_get_modes(struct drm_panel *panel,
+						   struct drm_connector *connector)
+{
+	int count = 0;
+
+	for (int i = 0; i < ARRAY_SIZE(visionox_rm692e5_modes); i++) {
+		count += drm_connector_helper_get_modes_fixed(connector,
+						    &visionox_rm692e5_modes[i]);
+	}
+
+	return count;
+}
+
+static const struct drm_panel_funcs visionox_rm692e5_panel_funcs = {
+	.prepare = visionox_rm692e5_prepare,
+	.unprepare = visionox_rm692e5_unprepare,
+	.disable = visionox_rm692e5_disable,
+	.get_modes = visionox_rm692e5_get_modes,
+};
+
+static int visionox_rm692e5_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static int visionox_rm692e5_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return brightness;
+}
+
+static const struct backlight_ops visionox_rm692e5_bl_ops = {
+	.update_status = visionox_rm692e5_bl_update_status,
+	.get_brightness = visionox_rm692e5_bl_get_brightness,
+};
+
+static struct backlight_device *
+visionox_rm692e5_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 2047,
+		.max_brightness = 4095,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &visionox_rm692e5_bl_ops, &props);
+}
+
+static int visionox_rm692e5_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct visionox_rm692e5 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = devm_regulator_bulk_get_const(&dsi->dev,
+					    ARRAY_SIZE(visionox_rm692e5_supplies),
+					    visionox_rm692e5_supplies,
+					    &ctx->supplies);
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
+	drm_panel_init(&ctx->panel, dev, &visionox_rm692e5_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = visionox_rm692e5_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	dsi->dsc = &ctx->dsc;
+	ctx->dsc.dsc_version_major = 1;
+	ctx->dsc.dsc_version_minor = 1;
+	ctx->dsc.slice_height = 20;
+	ctx->dsc.slice_width = 540;
+	ctx->dsc.slice_count = 1080 / ctx->dsc.slice_width;
+	ctx->dsc.bits_per_component = 10;
+	ctx->dsc.bits_per_pixel = 8 << 4;
+	ctx->dsc.block_pred_enable = true;
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
+static void visionox_rm692e5_remove(struct mipi_dsi_device *dsi)
+{
+	struct visionox_rm692e5 *ctx = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id visionox_rm692e5_of_match[] = {
+	{ .compatible = "visionox,rm692e5" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, visionox_rm692e5_of_match);
+
+static struct mipi_dsi_driver visionox_rm692e5_driver = {
+	.probe = visionox_rm692e5_probe,
+	.remove = visionox_rm692e5_remove,
+	.driver = {
+		.name = "panel-visionox-rm692e5",
+		.of_match_table = visionox_rm692e5_of_match,
+	},
+};
+module_mipi_dsi_driver(visionox_rm692e5_driver);
+
+MODULE_AUTHOR("Eugene Lepshy <fekz115@gmail.com>");
+MODULE_AUTHOR("Danila Tikhonov <danila@jiaxyga.com>");
+MODULE_DESCRIPTION("DRM driver for Visionox RM692E5 cmd mode dsi panel");
+MODULE_LICENSE("GPL");
-- 
2.48.1

