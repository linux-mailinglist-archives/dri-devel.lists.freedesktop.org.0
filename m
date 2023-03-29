Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A39336CD9E5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DF810EAA7;
	Wed, 29 Mar 2023 13:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3378C10EAA2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:04:29 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-69f00c18059so430524a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680095068; x=1682687068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2nlDdxQ+8oqnxMfAmS2IM4hfEcDsCHfoeDDJXGLcGs=;
 b=Ghnd82MukIsklEvY2FPCOYreW8VJlcWxEqiwIg3Dw0YJxNPuMmo3Ncx00mnTor7maz
 n9KTPnc/dAtLKMmbaibtTY2bLdQQxLkNRitcIx7fwCqdv458HruOTuNVzU5SuscqzrsL
 L8Au8dwLlD2529piZbHwzX1/Jx3Ksv9UOQW7aduiGy8tFRBkusVpLg+eqHzqdZdSOdA1
 LGHhWCUQVs+vLEplE/lHjYMJn6h7xdKJgNOj1kK4kEDtx/7SCurB1RIGba/VI7/xTOB2
 FSQo/WBGqJv6afMqHFMiCUoKwjNgUYvUKDMHO3qy2etCof5aG1QJ/naT6EZqCYoWqBBJ
 vpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095068; x=1682687068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W2nlDdxQ+8oqnxMfAmS2IM4hfEcDsCHfoeDDJXGLcGs=;
 b=6LRg294DGEnhTliDU+GhRYlcVxypy+afa9NVouj70g/zHwpOn9UUs6GNpDBO1Hcc4Y
 F2MJfUW/W/2Mh3MHD6PLsaPJHAsPAQvu9Pn/To/tEX0toQOIvfgQXVYiidAEkfR4W0WN
 w2436sZ7v1TkqRe+ZH6vptr3uYtoij0mnZgfH7wg5Al41BgFLh0ge2oTxIgy1pyWowwr
 CZ+q8YKvG86Ig/E9eU7KGe0Il4XZSzutfwGZQX+6CLim3htJxRsgmJzqIFEoUhTLcDeo
 L0FgQwUsMUzh4wVm+McscOuDmRsiYxUKArD4DLcIE13L9W++UGILIXdOFk4a8FqMFioP
 7/+Q==
X-Gm-Message-State: AO0yUKUcBWjlfdmP3DSY3z+n2m4m6rG6wX/q3MYpDqu2GCjPfJ9+qzNB
 /vTbfS/tEimfwR+JSfqxsD4=
X-Google-Smtp-Source: AKy350bKUi+LEKXbWkxah0X0OpfbGYrotDH6ZTw7UY8XP7oE/qIJgJiTYuMSFNAHUUxwW4pG885Myg==
X-Received: by 2002:a05:6870:b14c:b0:177:8383:7287 with SMTP id
 a12-20020a056870b14c00b0017783837287mr10879516oal.5.1680095068471; 
 Wed, 29 Mar 2023 06:04:28 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:1c2d:271:d34:84ea])
 by smtp.gmail.com with ESMTPSA id
 vh22-20020a0568710d1600b00177c21c3ae1sm11756738oab.54.2023.03.29.06.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:04:28 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH 2/2] drm/bridge: fsl-ldb: Add i.MX6SX support
Date: Wed, 29 Mar 2023 10:04:13 -0300
Message-Id: <20230329130413.683636-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230329130413.683636-1-festevam@gmail.com>
References: <20230329130413.683636-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

i.MX6SX has a single LVDS port and share a similar LDB_CTRL register layout
with i.MX8MP and i.MX93.

There is no LVDS CTRL register on the i.MX6SX, so only write to
this register on the appropriate SoCs.

Add support for the i.MX6SX LDB.

Tested on a imx6sx-sdb board with a Hannstar HSD100PXN1 LVDS panel
and also on a custom i.MX6SX-based board.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 450b352914f4..f8e5d8ab98e3 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -56,6 +56,7 @@
 #define LVDS_CTRL_VBG_ADJ_MASK			GENMASK(19, 17)
 
 enum fsl_ldb_devtype {
+	IMX6SX_LDB,
 	IMX8MP_LDB,
 	IMX93_LDB,
 };
@@ -64,9 +65,14 @@ struct fsl_ldb_devdata {
 	u32 ldb_ctrl;
 	u32 lvds_ctrl;
 	bool lvds_en_bit;
+	bool not_lvds_ctrl;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
+	[IMX6SX_LDB] = {
+		.ldb_ctrl = 0x18,
+		.not_lvds_ctrl = true,
+	},
 	[IMX8MP_LDB] = {
 		.ldb_ctrl = 0x5c,
 		.lvds_ctrl = 0x128,
@@ -202,6 +208,9 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 
 	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);
 
+	if (fsl_ldb->devdata->not_lvds_ctrl)
+		return;
+
 	/* Program LVDS_CTRL */
 	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
 	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
@@ -228,7 +237,8 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
 		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl,
 			     LVDS_CTRL_LVDS_EN);
 	else
-		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
+		if (!fsl_ldb->devdata->not_lvds_ctrl)
+			regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
 	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
 
 	clk_disable_unprepare(fsl_ldb->clk);
@@ -355,6 +365,8 @@ static void fsl_ldb_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id fsl_ldb_match[] = {
+	{ .compatible = "fsl,imx6sx-ldb",
+	  .data = &fsl_ldb_devdata[IMX6SX_LDB], },
 	{ .compatible = "fsl,imx8mp-ldb",
 	  .data = &fsl_ldb_devdata[IMX8MP_LDB], },
 	{ .compatible = "fsl,imx93-ldb",
-- 
2.34.1

