Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8B9BCF9D6
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EE510E340;
	Sat, 11 Oct 2025 17:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="PNf/bEi5";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Vn59NB66";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9576A10E345
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:04:37 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVMm38Lbz9tDZ;
 Sat, 11 Oct 2025 19:04:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lk3Rjyeus3C9NAKENHUJ5fCfgM5p+pUPtcQUUdf0M2s=;
 b=PNf/bEi5UmwSIw7LftOEG6yTn05zV8q7Di1J+9KdT6NAbfthBasd+PbByWcw5g96hEJiGf
 4/jE5BUeLnTIIrVpezHP+HxlBkcIGehYwHUXYSz9lA7EZEyTQ9lMjUaGgrXhk+Gk7mU/eQ
 Fp0v2UvgdbKYy6uBvkT8t1vB1aQ9xjpXIPU+gZQMjO7HJkQqoPeEswxLHgTrXm+opbLsY0
 iPmEJNkbZ5hnvYd9WKHulHl/7Ha6/KQJdoyvmjVfym0gtJlif/5K46/bLtNI88uzygetaO
 EUO98Y45867+ifLihhqYIwyf8DAIwLDCvCNGTgfHWCd3hstg2GY4dbbc73so0A==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Vn59NB66;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lk3Rjyeus3C9NAKENHUJ5fCfgM5p+pUPtcQUUdf0M2s=;
 b=Vn59NB66csKLpwuqIH9fKkZu7byxv//rOSaMAsG9UdmjDfizMtjoTzd0sToLFjCi8bq24w
 01FyCdOBvQ6YsV1+/CAM+0CVeVk93++kCK/LEX3Zgh5QfF3SsBgTsGXpG3j4noZ4ptRS1x
 07WbC2DyPKu+sCE///L/A3uswipRqVJ2irRjzN59ccKZOFVF+v5xV+sBdOHwC/W4kpIS28
 01cj5Gqpi71OkpKqqg84/Tn2sC9goGwmoH5/xL4V6n6s3BurcxVGvL6iK+ga8CpqBEnngc
 Antni4rHRENzhc+EnAKQKg0LWBslbE4IIzC1pvmccqfTb/L4JKpzJSEiyVr+SQ==
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
Subject: [PATCH 36/39] drm/bridge: fsl-ldb: Add i.MX95 support
Date: Sat, 11 Oct 2025 18:51:51 +0200
Message-ID: <20251011170213.128907-37-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: df8c5370bfe38e02228
X-MBO-RS-META: 7857bnidkfoow6m87bmkwenfakofii1p
X-Rspamd-Queue-Id: 4ckVMm38Lbz9tDZ
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

Add support for i.MX95 SoC variant of the LDB. This variant supports
single channel and all configuration is done via single register,
but there are two instances of this IP preceded by another bridge,
which handles the dual-lane configuration instead. This is also the
reason for special-case handling of input format, where the preceding
bridge needs the format details as well.

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
 drivers/gpu/drm/bridge/fsl-ldb.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index c54caea0b63fc..1560438e4cb10 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -58,6 +58,7 @@ enum fsl_ldb_devtype {
 	IMX6SX_LDB,
 	IMX8MP_LDB,
 	IMX93_LDB,
+	IMX95_LDB,
 };
 
 struct fsl_ldb_devdata {
@@ -73,6 +74,9 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 	[IMX93_LDB] = {
 		.lvds_en_bit = true,
 	},
+	[IMX95_LDB] = {
+		.lvds_en_bit = true,
+	},
 };
 
 struct fsl_ldb {
@@ -235,7 +239,7 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
 	clk_disable_unprepare(fsl_ldb->clk);
 }
 
-#define MAX_INPUT_SEL_FORMATS 1
+#define MAX_INPUT_SEL_FORMATS 4
 static u32 *
 fsl_ldb_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 				  struct drm_bridge_state *bridge_state,
@@ -244,17 +248,26 @@ fsl_ldb_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 				  u32 output_fmt,
 				  unsigned int *num_input_fmts)
 {
+	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 	u32 *input_fmts;
 
 	*num_input_fmts = 0;
 
-	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, MAX_INPUT_SEL_FORMATS * sizeof(*input_fmts),
 			     GFP_KERNEL);
 	if (!input_fmts)
 		return NULL;
 
-	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
-	*num_input_fmts = MAX_INPUT_SEL_FORMATS;
+	if (of_device_is_compatible(fsl_ldb->dev->of_node, "fsl,imx95-ldb")) {
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
+		input_fmts[1] = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
+		input_fmts[2] = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+		input_fmts[3] = MEDIA_BUS_FMT_FIXED;
+		*num_input_fmts = 4;
+	} else {
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+		*num_input_fmts = 1;
+	}
 
 	return input_fmts;
 }
@@ -396,6 +409,8 @@ static const struct of_device_id fsl_ldb_match[] = {
 	  .data = &fsl_ldb_devdata[IMX8MP_LDB], },
 	{ .compatible = "fsl,imx93-ldb",
 	  .data = &fsl_ldb_devdata[IMX93_LDB], },
+	{ .compatible = "fsl,imx95-ldb",
+	  .data = &fsl_ldb_devdata[IMX95_LDB], },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, fsl_ldb_match);
-- 
2.51.0

