Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C864BCF8F6
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB3110E322;
	Sat, 11 Oct 2025 17:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="D9GcZ8Am";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lbh+dnf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F19210E325
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:28 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVLR29Bpz9spd;
 Sat, 11 Oct 2025 19:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErK6e9i/wjS7D9cMMdBt0NCt0j83MkMrjGYuP5XcID0=;
 b=D9GcZ8AmG6AaoIZj+ceFkBpWEV5qgsuYHj5s6pbmYGi2wrzioPz0ybULF2sPVhfUJFDmbA
 G96veOOJNUbb+hncWaEBiOodi8d0oiUnDfwid/P9f/TNVG5lvnfK2B0w5+zocKazi7DL8m
 UUoTUiV8Sxei9bt1tZ+vgWc0X40Allt2DiytVbtXoJ+eWP9DfFKX+Lqp0/PzXxZ/7ME6wm
 fAEIT0qREgTYwc4g1lQQ3qrwcszsQWjOFc9cEikNzI3zoZ3FYc9Z6mZtkEWMPwVDokbICr
 6+waA8gcHPVS3CpNxIECG3iOjZcyRZ3IPo2OtA/gRj/k1MwuZnYKWdRVuHFbIQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=lbh+dnf1;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErK6e9i/wjS7D9cMMdBt0NCt0j83MkMrjGYuP5XcID0=;
 b=lbh+dnf1T9rBBuA4bHYXlRFBd0VztWtZjlMnkmWfCrHKYuUfdm2/z6D4wcnnYjdNuBEBWV
 Dvc7e4taqQI28ga2ZEELRkIH3QgSJnHbYgXxlPspk9EnGSb3ODznhXWdc5ofsNZb/CrKlt
 fnD+5IaZ27AF0wk/deZhLDthDiX8N+Z90872nvTbIgOXXTxHe3iCxu+7ELAXLVKM2a8KXq
 vpc26uyYWmcoKZRosDUOZnAMnQBDWWhC6kQmLMwPFpjtlz1QA5pcvCqJQbAchNBt5nVc15
 qTSr1CiCrgWK4cd4WX5JneVKd1EenTk2M/FlFtnNE/nkW2nvc4QaPJN45EDY8A==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 12/39] drm/imx: dc: ed: Pass struct dc_fg_subdev_match_data
 via OF match data
Date: Sat, 11 Oct 2025 18:51:27 +0200
Message-ID: <20251011170213.128907-13-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: kmprimnucqnf3djqono8dz78r7jet6sw
X-MBO-RS-ID: 1ce2888521c792f702c
X-Rspamd-Queue-Id: 4ckVLR29Bpz9spd
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

Introduce struct dc_fg_subdev_match_data which describes the differences
between i.MX8QXP and i.MX95, which in this case is registers offset and
address space offsets, and pass it as OF match data into the driver, so
the driver can use the match data to apply correct offset to access the
IP registers on each SoC. This is a preparatory patch for i.MX95 addition.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-de.h |  1 +
 drivers/gpu/drm/imx/dc/dc-fg.c | 74 +++++++++++++++++++++-------------
 2 files changed, 46 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
index e054ad88190e1..797056a09ddb4 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.h
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -26,6 +26,7 @@ struct dc_fg {
 	struct device *dev;
 	struct regmap *reg;
 	struct clk *clk_disp;
+	unsigned int reg_offset;
 };
 
 struct dc_tc {
diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
index 05e635fdb4f9c..e13b057a92ffb 100644
--- a/drivers/gpu/drm/imx/dc/dc-fg.c
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -12,6 +12,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/units.h>
 
@@ -82,6 +83,12 @@
 #define FGCHSTATCLR(o)		(0x7c + (o))
 #define  CLRSECSTAT		BIT(16)
 
+struct dc_fg_subdev_match_data {
+	const struct regmap_config	*regmap_config;
+	unsigned int			reg_offset;
+	const struct dc_subdev_info	*info;
+};
+
 enum dc_fg_syncmode {
 	FG_SYNCMODE_OFF,	/* No side-by-side synchronization. */
 };
@@ -91,46 +98,52 @@ enum dc_fg_dm {
 	FG_DM_SEC_ON_TOP = 0x5,	/* Both inputs overlaid with secondary on top. */
 };
 
-static const struct dc_subdev_info dc_fg_info[] = {
+static const struct dc_subdev_info dc_fg_info_imx8qxp[] = {
 	{ .reg_start = 0x5618b800, .id = 0, },
 	{ .reg_start = 0x5618d400, .id = 1, },
 	{ /* sentinel */ },
 };
 
-static const struct regmap_range dc_fg_regmap_write_ranges[] = {
+static const struct regmap_range dc_fg_regmap_write_ranges_imx8qxp[] = {
 	regmap_reg_range(FGSTCTRL, VTCFG2),
 	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
 	regmap_reg_range(PACFG(OFFSET_MX8QXP), FGSLR(OFFSET_MX8QXP)),
 	regmap_reg_range(FGCHSTATCLR(OFFSET_MX8QXP), FGCHSTATCLR(OFFSET_MX8QXP)),
 };
 
-static const struct regmap_range dc_fg_regmap_read_ranges[] = {
+static const struct regmap_range dc_fg_regmap_read_ranges_imx8qxp[] = {
 	regmap_reg_range(FGSTCTRL, VTCFG2),
 	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
 	regmap_reg_range(PACFG(OFFSET_MX8QXP), FGENABLE(OFFSET_MX8QXP)),
 	regmap_reg_range(FGTIMESTAMP(OFFSET_MX8QXP), FGCHSTAT(OFFSET_MX8QXP)),
 };
 
-static const struct regmap_access_table dc_fg_regmap_write_table = {
-	.yes_ranges = dc_fg_regmap_write_ranges,
-	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_write_ranges),
+static const struct regmap_access_table dc_fg_regmap_write_table_imx8qxp = {
+	.yes_ranges = dc_fg_regmap_write_ranges_imx8qxp,
+	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_write_ranges_imx8qxp),
 };
 
-static const struct regmap_access_table dc_fg_regmap_read_table = {
-	.yes_ranges = dc_fg_regmap_read_ranges,
-	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_read_ranges),
+static const struct regmap_access_table dc_fg_regmap_read_table_imx8qxp = {
+	.yes_ranges = dc_fg_regmap_read_ranges_imx8qxp,
+	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_read_ranges_imx8qxp),
 };
 
-static const struct regmap_config dc_fg_regmap_config = {
+static const struct regmap_config dc_fg_regmap_config_imx8qxp = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
 	.fast_io = true,
-	.wr_table = &dc_fg_regmap_write_table,
-	.rd_table = &dc_fg_regmap_read_table,
+	.wr_table = &dc_fg_regmap_write_table_imx8qxp,
+	.rd_table = &dc_fg_regmap_read_table_imx8qxp,
 	.max_register = FGCHSTATCLR(OFFSET_MX8QXP),
 };
 
+static const struct dc_fg_subdev_match_data dc_fg_match_data_imx8qxp = {
+	.regmap_config = &dc_fg_regmap_config_imx8qxp,
+	.reg_offset = OFFSET_MX8QXP,
+	.info = dc_fg_info_imx8qxp,
+};
+
 static inline void dc_fg_enable_shden(struct dc_fg *fg)
 {
 	regmap_write_bits(fg->reg, FGSTCTRL, SHDEN, SHDEN);
@@ -174,15 +187,15 @@ void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
 	regmap_write(fg->reg, SKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
 
 	/* primary and secondary area position configuration */
-	regmap_write(fg->reg, PACFG(OFFSET_MX8QXP), STARTX(0) | STARTY(0));
-	regmap_write(fg->reg, SACFG(OFFSET_MX8QXP), STARTX(0) | STARTY(0));
+	regmap_write(fg->reg, PACFG(fg->reg_offset), STARTX(0) | STARTY(0));
+	regmap_write(fg->reg, SACFG(fg->reg_offset), STARTX(0) | STARTY(0));
 
 	/* alpha */
-	regmap_write_bits(fg->reg, FGINCTRL(OFFSET_MX8QXP), ENPRIMALPHA | ENSECALPHA, 0);
-	regmap_write_bits(fg->reg, FGINCTRLPANIC(OFFSET_MX8QXP), ENPRIMALPHA | ENSECALPHA, 0);
+	regmap_write_bits(fg->reg, FGINCTRL(fg->reg_offset), ENPRIMALPHA | ENSECALPHA, 0);
+	regmap_write_bits(fg->reg, FGINCTRLPANIC(fg->reg_offset), ENPRIMALPHA | ENSECALPHA, 0);
 
 	/* constant color is green(used in panic mode)  */
-	regmap_write(fg->reg, FGCCR(OFFSET_MX8QXP), CCGREEN(0x3ff));
+	regmap_write(fg->reg, FGCCR(fg->reg_offset), CCGREEN(0x3ff));
 
 	ret = clk_set_rate(fg->clk_disp, m->clock * HZ_PER_KHZ);
 	if (ret < 0)
@@ -191,34 +204,34 @@ void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
 
 static inline void dc_fg_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
 {
-	regmap_write_bits(fg->reg, FGINCTRL(OFFSET_MX8QXP), FGDM_MASK, mode);
+	regmap_write_bits(fg->reg, FGINCTRL(fg->reg_offset), FGDM_MASK, mode);
 }
 
 static inline void dc_fg_panic_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
 {
-	regmap_write_bits(fg->reg, FGINCTRLPANIC(OFFSET_MX8QXP), FGDM_MASK, mode);
+	regmap_write_bits(fg->reg, FGINCTRLPANIC(fg->reg_offset), FGDM_MASK, mode);
 }
 
 void dc_fg_enable(struct dc_fg *fg)
 {
-	regmap_write(fg->reg, FGENABLE(OFFSET_MX8QXP), FGEN);
+	regmap_write(fg->reg, FGENABLE(fg->reg_offset), FGEN);
 }
 
 void dc_fg_disable(struct dc_fg *fg)
 {
-	regmap_write(fg->reg, FGENABLE(OFFSET_MX8QXP), 0);
+	regmap_write(fg->reg, FGENABLE(fg->reg_offset), 0);
 }
 
 void dc_fg_shdtokgen(struct dc_fg *fg)
 {
-	regmap_write(fg->reg, FGSLR(OFFSET_MX8QXP), SHDTOKGEN);
+	regmap_write(fg->reg, FGSLR(fg->reg_offset), SHDTOKGEN);
 }
 
 u32 dc_fg_get_frame_index(struct dc_fg *fg)
 {
 	u32 val;
 
-	regmap_read(fg->reg, FGTIMESTAMP(OFFSET_MX8QXP), &val);
+	regmap_read(fg->reg, FGTIMESTAMP(fg->reg_offset), &val);
 
 	return FRAMEINDEX(val);
 }
@@ -227,7 +240,7 @@ u32 dc_fg_get_line_index(struct dc_fg *fg)
 {
 	u32 val;
 
-	regmap_read(fg->reg, FGTIMESTAMP(OFFSET_MX8QXP), &val);
+	regmap_read(fg->reg, FGTIMESTAMP(fg->reg_offset), &val);
 
 	return LINEINDEX(val);
 }
@@ -251,21 +264,21 @@ bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg)
 {
 	u32 val;
 
-	regmap_read(fg->reg, FGCHSTAT(OFFSET_MX8QXP), &val);
+	regmap_read(fg->reg, FGCHSTAT(fg->reg_offset), &val);
 
 	return !!(val & SFIFOEMPTY);
 }
 
 void dc_fg_secondary_clear_channel_status(struct dc_fg *fg)
 {
-	regmap_write(fg->reg, FGCHSTATCLR(OFFSET_MX8QXP), CLRSECSTAT);
+	regmap_write(fg->reg, FGCHSTATCLR(fg->reg_offset), CLRSECSTAT);
 }
 
 int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg)
 {
 	unsigned int val;
 
-	return regmap_read_poll_timeout(fg->reg, FGCHSTAT(OFFSET_MX8QXP), val,
+	return regmap_read_poll_timeout(fg->reg, FGCHSTAT(fg->reg_offset), val,
 					val & SECSYNCSTAT, 5, 100000);
 }
 
@@ -305,6 +318,8 @@ void dc_fg_init(struct dc_fg *fg)
 
 static int dc_fg_bind(struct device *dev, struct device *master, void *data)
 {
+	const struct dc_fg_subdev_match_data *dc_fg_match_data = device_get_match_data(dev);
+	const struct dc_subdev_info *dc_fg_info = dc_fg_match_data->info;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dc_drm_device *dc_drm = data;
 	struct resource *res;
@@ -320,7 +335,7 @@ static int dc_fg_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
+	fg->reg = devm_regmap_init_mmio(dev, base, dc_fg_match_data->regmap_config);
 	if (IS_ERR(fg->reg))
 		return PTR_ERR(fg->reg);
 
@@ -336,6 +351,7 @@ static int dc_fg_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	fg->dev = dev;
+	fg->reg_offset = dc_fg_match_data->reg_offset;
 	dc_drm->fg[id] = fg;
 
 	return 0;
@@ -363,7 +379,7 @@ static void dc_fg_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dc_fg_dt_ids[] = {
-	{ .compatible = "fsl,imx8qxp-dc-framegen" },
+	{ .compatible = "fsl,imx8qxp-dc-framegen", .data = &dc_fg_match_data_imx8qxp },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_fg_dt_ids);
-- 
2.51.0

