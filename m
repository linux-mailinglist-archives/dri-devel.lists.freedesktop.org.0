Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F37BCF895
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E1610E239;
	Sat, 11 Oct 2025 17:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="XT+fK0jV";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EPBZMZkf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5511A10E239
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:00 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ckVKs6YN1z9tX0;
 Sat, 11 Oct 2025 19:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeJ3480foHs4P/4QH2kuvmYbUusLrT5/lA1r++dUvvU=;
 b=XT+fK0jV5U0dn2TRnz3k/jWoqUoNfUnJ0nGRVgqqYK3uE2VeUjM7SuvRKxQlBvO/jCUFr8
 yAc/1FU+TmSVbGPqEK950D73TNrOEJ0x7y5M4Nb5W5s3vGveKAd4kIKDg2jxCc1xT0m73B
 54A1X9Q+MAhtWAxYAaxGlUI9w5GHkMb4lt/GnMlQ5XpscBHmCSQQPsNrBpIsy4PNVh2nWe
 llC0ziT4dx5yglFqdvyDEv0XvPtJKPVXqVVtpZAAHs8Bf2NGAy5e/hoSnXmnIAgcOesvbE
 KFcVm7DOijgsVz0MSvZh8Q+DHO6tr+o8dxTHz1lyiSdeKqLWq0iHyMq/TxaECQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=EPBZMZkf;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeJ3480foHs4P/4QH2kuvmYbUusLrT5/lA1r++dUvvU=;
 b=EPBZMZkfGdt137DgmB9SHudd4z4syxJEmkRFWMYZhqRHYSqXRpIRz7+daVy+ChG6HCeKZa
 nYafZ+e9C8gm82wOvf94eojMgx/CkGifw3w+3p8PWejEwofBkL6QvdNKzRfrnBBz4n5vC6
 Wii0eeWk/V5R6ZzOFP+ttWBDGnfCQrwFzmoUU5cpn/r9bOJ8HUhvXyuvB9byp6PERuG68w
 XEyxk2JWDnaslAkjIFkgF7pWOm3sn6XG5oJ6WGCL2PAASKcCo25/GXbZxpFW1NJj1TWF4b
 jTAcN0lgzcZRragpfzB4B/EzAcFKTvLoXtDTes/FZMVWlmZWjKZWIdPAzM0/Gw==
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
Subject: [PATCH 02/39] drm/imx: Add i.MX95 Display Controller DomainBlend
Date: Sat, 11 Oct 2025 18:51:17 +0200
Message-ID: <20251011170213.128907-3-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fuzqd5nfnkzf88phuhdfdrktxttszs3z
X-MBO-RS-ID: 4c2a417960d5f920dbd
X-Rspamd-Queue-Id: 4ckVKs6YN1z9tX0
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

i.MX95 Display Controller display engine consists of all processing
units that operate in a display clock domain. Add DomainBlend driver
which is specific to i.MX95 and required to get any display output on
that SoC.

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
 drivers/gpu/drm/imx/dc/Makefile  |   2 +-
 drivers/gpu/drm/imx/dc/dc-crtc.c |   2 +
 drivers/gpu/drm/imx/dc/dc-db.c   | 226 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.c   |   2 +
 drivers/gpu/drm/imx/dc/dc-de.h   |  11 ++
 drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h  |   3 +
 drivers/gpu/drm/imx/dc/dc-kms.h  |   4 +
 8 files changed, 250 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imx/dc/dc-db.c

diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index b9d33c074984a..20386e4082e56 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
+imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-db.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
 		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o \
 		    dc-plane.o dc-tc.o
 
diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 31d3a982deaf7..56991cb033945 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -272,6 +272,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_fg_enable_clock(dc_crtc->fg);
 	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
 	dc_ed_pec_sync_trigger(dc_crtc->ed_safe);
+	dc_db_shdtokgen(dc_crtc->db);
 	dc_fg_shdtokgen(dc_crtc->fg);
 	dc_fg_enable(dc_crtc->fg);
 
@@ -521,6 +522,7 @@ int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index)
 	dc_crtc->ed_cont = pe->ed_cont[crtc_index];
 	dc_crtc->ed_safe = pe->ed_safe[crtc_index];
 	dc_crtc->fg = de->fg;
+	dc_crtc->db = de->db;
 
 	dc_crtc->irq_dec_framecomplete = de->irq_framecomplete;
 	dc_crtc->irq_dec_seqcomplete = de->irq_seqcomplete;
diff --git a/drivers/gpu/drm/imx/dc/dc-db.c b/drivers/gpu/drm/imx/dc/dc-db.c
new file mode 100644
index 0000000000000..789942d1c446d
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-db.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 Marek Vasut <marek.vasut@mailbox.org>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_blend.h>
+
+#include "dc-drv.h"
+#include "dc-pe.h"
+
+#define PIXENGCFG_DYNAMIC			0x8
+#define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
+#define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
+		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
+#define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		GENMASK(13, 8)
+#define  PIXENGCFG_DYNAMIC_SEC_SEL(x)		\
+		FIELD_PREP(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
+
+#define STATICCONTROL				0x8
+#define  SHDTOKSEL_MASK				GENMASK(6, 4)
+#define  SHDTOKSEL(x)				FIELD_PREP(SHDTOKSEL_MASK, (x))
+#define  SHDLDSEL_MASK				GENMASK(3, 1)
+#define  SHDLDSEL(x)				FIELD_PREP(SHDLDSEL_MASK, (x))
+
+#define CONTROL					0xc
+#define  SHDTOKGEN				BIT(0)
+
+#define MODECONTROL				0x10
+
+#define ALPHACONTROL				0x14
+#define  ALPHAMASKENABLE			BIT(0)
+
+#define BLENDCONTROL				0x18
+#define  ALPHA_MASK				GENMASK(23, 16)
+#define  ALPHA(x)				FIELD_PREP(ALPHA_MASK, (x))
+#define  PRIM_C_BLD_FUNC_MASK			GENMASK(2, 0)
+#define  PRIM_C_BLD_FUNC(x)			\
+		FIELD_PREP(PRIM_C_BLD_FUNC_MASK, (x))
+#define  SEC_C_BLD_FUNC_MASK			GENMASK(6, 4)
+#define  SEC_C_BLD_FUNC(x)			\
+		FIELD_PREP(SEC_C_BLD_FUNC_MASK, (x))
+#define  PRIM_A_BLD_FUNC_MASK			GENMASK(10, 8)
+#define  PRIM_A_BLD_FUNC(x)			\
+		FIELD_PREP(PRIM_A_BLD_FUNC_MASK, (x))
+#define  SEC_A_BLD_FUNC_MASK			GENMASK(14, 12)
+#define  SEC_A_BLD_FUNC(x)			\
+		FIELD_PREP(SEC_A_BLD_FUNC_MASK, (x))
+
+enum dc_db_blend_func {
+	DC_DOMAINBLEND_BLEND_ZERO,
+	DC_DOMAINBLEND_BLEND_ONE,
+	DC_DOMAINBLEND_BLEND_PRIM_ALPHA,
+	DC_DOMAINBLEND_BLEND_ONE_MINUS_PRIM_ALPHA,
+	DC_DOMAINBLEND_BLEND_SEC_ALPHA,
+	DC_DOMAINBLEND_BLEND_ONE_MINUS_SEC_ALPHA,
+	DC_DOMAINBLEND_BLEND_CONST_ALPHA,
+	DC_DOMAINBLEND_BLEND_ONE_MINUS_CONST_ALPHA,
+};
+
+enum dc_db_shadow_sel {
+	SW = 0x4,
+	SW_PRIM = 0x5,
+	SW_SEC = 0x6,
+};
+
+static const struct dc_subdev_info dc_db_info[] = {
+	{ .reg_start = 0x4b6a0000, .id = 0, },
+	{ .reg_start = 0x4b720000, .id = 1, },
+};
+
+static const struct regmap_range dc_db_regmap_ranges[] = {
+	regmap_reg_range(STATICCONTROL, BLENDCONTROL),
+};
+
+static const struct regmap_access_table dc_db_regmap_access_table = {
+	.yes_ranges = dc_db_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_db_regmap_ranges),
+};
+
+static const struct regmap_config dc_db_cfg_regmap_config = {
+	.name = "cfg",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_db_regmap_access_table,
+	.rd_table = &dc_db_regmap_access_table,
+	.max_register = BLENDCONTROL,
+};
+
+enum dc_db_mode {
+	DB_PRIMARY,
+	DB_SECONDARY,
+	DB_BLEND,
+	DB_SIDEBYSIDE,
+};
+
+static inline void dc_db_enable_shden(struct dc_db *db)
+{
+	regmap_write_bits(db->reg_cfg, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static inline void dc_db_shdtoksel(struct dc_db *db, enum dc_db_shadow_sel sel)
+{
+	regmap_write_bits(db->reg_cfg, STATICCONTROL, SHDTOKSEL_MASK,
+			  SHDTOKSEL(sel));
+}
+
+static inline void dc_db_shdldsel(struct dc_db *db, enum dc_db_shadow_sel sel)
+{
+	regmap_write_bits(db->reg_cfg, STATICCONTROL, SHDLDSEL_MASK,
+			  SHDLDSEL(sel));
+}
+
+void dc_db_shdtokgen(struct dc_db *db)
+{
+	regmap_write(db->reg_cfg, CONTROL, SHDTOKGEN);
+}
+
+static void dc_db_mode(struct dc_db *db, enum dc_db_mode mode)
+{
+	regmap_write(db->reg_cfg, MODECONTROL, mode);
+}
+
+static inline void dc_db_alphamaskmode_disable(struct dc_db *db)
+{
+	regmap_write_bits(db->reg_cfg, ALPHACONTROL, ALPHAMASKENABLE, 0);
+}
+
+static inline void dc_db_blendcontrol(struct dc_db *db)
+{
+	u32 val = PRIM_A_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
+		  SEC_A_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
+		  PRIM_C_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
+		  SEC_C_BLD_FUNC(DC_DOMAINBLEND_BLEND_ONE);
+
+	regmap_write(db->reg_cfg, BLENDCONTROL, val);
+}
+
+void dc_db_init(struct dc_db *db)
+{
+	dc_db_enable_shden(db);
+	dc_db_shdtoksel(db, SW);
+	dc_db_shdldsel(db, SW);
+	dc_db_mode(db, DB_PRIMARY);
+	dc_db_alphamaskmode_disable(db);
+	dc_db_blendcontrol(db);
+}
+
+static int dc_db_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct resource *res_cfg;
+	void __iomem *base_cfg;
+	struct dc_db *db;
+
+	db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
+	if (!db)
+		return -ENOMEM;
+
+	base_cfg = devm_platform_get_and_ioremap_resource(pdev, 0, &res_cfg);
+	if (IS_ERR(base_cfg))
+		return PTR_ERR(base_cfg);
+
+	db->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
+					    &dc_db_cfg_regmap_config);
+	if (IS_ERR(db->reg_cfg))
+		return PTR_ERR(db->reg_cfg);
+
+	db->id = dc_subdev_get_id(dc_db_info, ARRAY_SIZE(dc_db_info), res_cfg);
+	if (db->id < 0) {
+		dev_err(dev, "failed to get instance number: %d\n", db->id);
+		return db->id;
+	}
+
+	db->dev = dev;
+	dc_drm->db[db->id] = db;
+
+	return 0;
+}
+
+static const struct component_ops dc_db_ops = {
+	.bind = dc_db_bind,
+};
+
+static int dc_db_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_db_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_db_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_db_ops);
+}
+
+static const struct of_device_id dc_db_dt_ids[] = {
+	{ .compatible = "fsl,imx95-dc-domainblend" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_db_dt_ids);
+
+struct platform_driver dc_db_driver = {
+	.probe = dc_db_probe,
+	.remove = dc_db_remove,
+	.driver = {
+		.name = "imx95-dc-domainblend",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_db_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
index 5a3125596fdf4..23b0cea68d325 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.c
+++ b/drivers/gpu/drm/imx/dc/dc-de.c
@@ -114,6 +114,7 @@ void dc_de_post_bind(struct dc_drm_device *dc_drm)
 
 	for (i = 0; i < DC_DISPLAYS; i++) {
 		de = dc_drm->de[i];
+		de->db = dc_drm->db[i];
 		de->fg = dc_drm->fg[i];
 		de->tc = dc_drm->tc[i];
 	}
@@ -149,6 +150,7 @@ static int dc_de_runtime_resume(struct device *dev)
 	struct dc_de *de = dev_get_drvdata(dev);
 
 	dc_dec_init(de);
+	dc_db_init(de->db);
 	dc_fg_init(de->fg);
 	dc_tc_init(de->tc);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
index 211f3fcc1a9ad..1ac70b4f6276f 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.h
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -16,6 +16,12 @@
 #define DC_FRAMEGEN_MAX_FRAME_INDEX	0x3ffff
 #define DC_FRAMEGEN_MAX_CLOCK_KHZ	300000
 
+struct dc_db {
+	struct device *dev;
+	struct regmap *reg_cfg;
+	int id;
+};
+
 struct dc_fg {
 	struct device *dev;
 	struct regmap *reg;
@@ -30,6 +36,7 @@ struct dc_tc {
 struct dc_de {
 	struct device *dev;
 	struct regmap *reg_top;
+	struct dc_db *db;
 	struct dc_fg *fg;
 	struct dc_tc *tc;
 	int irq_shdload;
@@ -37,6 +44,10 @@ struct dc_de {
 	int irq_seqcomplete;
 };
 
+/* Domain Blend Unit */
+void dc_db_init(struct dc_db *db);
+void dc_db_shdtokgen(struct dc_db *db);
+
 /* Frame Generator Unit */
 void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m);
 void dc_fg_enable(struct dc_fg *fg);
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 04f021d2d6cfc..f108964bf89f4 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -263,6 +263,7 @@ static struct platform_driver dc_driver = {
 
 static struct platform_driver * const dc_drivers[] = {
 	&dc_cf_driver,
+	&dc_db_driver,
 	&dc_de_driver,
 	&dc_ed_driver,
 	&dc_fg_driver,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index eb61b8c762693..17ce2d748262b 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -40,6 +40,8 @@ struct dc_drm_device {
 	struct dc_ed *ed_safe[DC_DISPLAYS];
 	/** @ed_cont: extdst list(content stream) */
 	struct dc_ed *ed_cont[DC_DISPLAYS];
+	/** @lb: domainblend list */
+	struct dc_db *db[DC_DISPLAYS];
 	/** @fg: framegen list */
 	struct dc_fg *fg[DC_DISPLAYS];
 	/** @fu_disp: fetchunit list(used by display engine) */
@@ -71,6 +73,7 @@ void dc_kms_uninit(struct dc_drm_device *dc_drm);
 int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane);
 
 extern struct platform_driver dc_cf_driver;
+extern struct platform_driver dc_db_driver;
 extern struct platform_driver dc_de_driver;
 extern struct platform_driver dc_ed_driver;
 extern struct platform_driver dc_fg_driver;
diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
index cd7860eff986a..3e61dbb87afe7 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.h
+++ b/drivers/gpu/drm/imx/dc/dc-kms.h
@@ -48,6 +48,8 @@ struct dc_crtc {
 	struct dc_ed *ed_cont;
 	/** @ed_safe: safety stream extdst */
 	struct dc_ed *ed_safe;
+	/** @db: domain blend */
+	struct dc_db *db;
 	/** @fg: framegen */
 	struct dc_fg *fg;
 	/**
@@ -122,6 +124,8 @@ struct dc_plane {
 	struct dc_fu *fu;
 	/** @cf: content stream constframe */
 	struct dc_cf *cf;
+	/** @db: domainblend */
+	struct dc_db *db;
 	/** @lb: layerblend */
 	struct dc_lb *lb;
 	/** @ed: content stream extdst */
-- 
2.51.0

