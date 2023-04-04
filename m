Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC99E6D565B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 04:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007EA10E2BE;
	Tue,  4 Apr 2023 02:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7168510E2BE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 02:01:39 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 cm7-20020a056830650700b006a11f365d13so15360137otb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 19:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680573698; x=1683165698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohM149XF2ZhahWcAJgbJmv8+mf6AIWwQ15+ABDtMw48=;
 b=CetjEtzdOvFRhni+NV0NKPSfVk7Y2LHkaXf0CDCxwMUBdBrj4b6wBDSdzs6r1iFFzA
 HBXnpLW26LcRoipFeTyjXA0YwZFf6Nhjqf0Vugykb8uVyYmSsflBdj7Pwq9WYhujK4W1
 6zmOgBmgOcU7nyepl2Ok819STalT/YGaG4jnJKgXU6n6Aw67+VW3H87c7oFxpChf6gpA
 Gi7+WcXpso73c6FFXprTe7VTnnX7aiSSEW8U8xXn/RH0koWio9iRKNDAv0fj/GYcVnTb
 W8jZGP+KttznnYrRDSAmQMZCTBWCEpmi+m046g6LyoImnQkHMqzbd2DxLV0u9VoqvbG6
 Yhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680573698; x=1683165698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohM149XF2ZhahWcAJgbJmv8+mf6AIWwQ15+ABDtMw48=;
 b=XyHnKTTvrY9KHilc8g3mz5PZy9YvLJXsfcmeWwEAZfwFCPc+IO3afYO5sX4uH7ZI4I
 lmS2NAew3Qul+KBupw1AodxwqM0xtyocOREpCqmbAMN/Y8Cqpn/lcCELwcAHGq2aR6e9
 iD9T/h49C0EXJVf+XWLPhciCdsEaxrx5sD21UB41hcz40Of5qFX+hymooOXMBq+lebaL
 H37QmPD7eGfu9KMB9Tz6M1jV/CJdUVaw4B1fvsR4ERgRCI0BLDB9q2+k91Dvn3xhtDNe
 buhzcLV9kdEKS3vgxDU+gug3PjNsxbXULuncgWlId4iEuMXLs0YFcAnlWBFSULODD8ZJ
 OiSw==
X-Gm-Message-State: AAQBX9dRIHwtU34ow05PtJFEJxS6dI+vKmrkWUZ7meLq4mJH5KLvL/aq
 98mi/PUdnQxfN1S5b0YAPBY=
X-Google-Smtp-Source: AKy350YRCAsiM7REtuuhFPupEswriUa+e40VlzNMzF/sz0zlwTEp0vy5A7aOybWDyc+RMSr5v2M0xw==
X-Received: by 2002:a05:6830:31b5:b0:69f:865a:a493 with SMTP id
 q21-20020a05683031b500b0069f865aa493mr658457ots.1.1680573698469; 
 Mon, 03 Apr 2023 19:01:38 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:b774:9c46:6b8:3f2])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a9d6c43000000b0069f509ad088sm4927955otq.65.2023.04.03.19.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 19:01:38 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v3 2/2] drm/bridge: fsl-ldb: Add i.MX6SX support
Date: Mon,  3 Apr 2023 23:01:29 -0300
Message-Id: <20230404020129.509356-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404020129.509356-1-festevam@gmail.com>
References: <20230404020129.509356-1-festevam@gmail.com>
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Marek Vasut <marex@denx.de>
---
Changes since v2:
- Rename it to 'single_ctrl_reg' to make it clearer that on i.MX6X, there
is a single ctrl register. On the newer SoCs there are two ctrl registers.

Changes since v1:
- None

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
+	bool single_ctrl_reg;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
+	[IMX6SX_LDB] = {
+		.ldb_ctrl = 0x18,
+		.single_ctrl_reg = true,
+	},
 	[IMX8MP_LDB] = {
 		.ldb_ctrl = 0x5c,
 		.lvds_ctrl = 0x128,
@@ -202,6 +208,9 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 
 	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);
 
+	if (fsl_ldb->devdata->single_ctrl_reg)
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
+		if (!fsl_ldb->devdata->single_ctrl_reg)
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

