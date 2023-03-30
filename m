Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C65736D017D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9358610E1D8;
	Thu, 30 Mar 2023 10:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A08110E1DB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 10:42:44 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-69f00c18059so544135a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 03:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680172963; x=1682764963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YIFxKXVUHfM0d37cCgcyId44UL4K5UZcuNyUe7CoHHo=;
 b=iH6EM5IzodKNooc3/YPq+ikNsCYCS7pJvQ1ElswrmhWkbw2/JUGY14Z9zsUppR4twv
 iAkHFqc2PO9/CNiJ7rawYw1NQeexnUCPCnt2p5HNT1urI3xqZsapXqE1/s9tie2sDVJo
 tv4uaz+/bL9tePUifbHEOBoGBmZJEUHQMFI/qafDN60Kkp6Zd+tj24xkGQft8Mr9fgwh
 /DNkftZb6SGT9qbCZyTKXesNj/gvJFqM89pEftZ2jU4SohXNf/b4TjgvUB41jkSVM5VC
 HfvJANY+qSQOkwD8KJK7njVyls3gUW9F/9ozuDJKvfTQEuFuztEpfLqyrTh+pX7TIMfz
 dC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680172963; x=1682764963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YIFxKXVUHfM0d37cCgcyId44UL4K5UZcuNyUe7CoHHo=;
 b=NCUfsduIokDqRJa5vr47+H7wZzS9yVTwSb+3251UNCn15GU6gn3Z+iiAnwoKViK47P
 HMj87B1wObCr50hVFs74c7hfZ5DU0FBad1y/X1sdZ4ycgP4G8C9Nl/odrXQr1neTJOuX
 4tn9Mi7+nB44wn4IkWERgns//x4RQ3QSdH04C/cobmamdj8UwWw+I0tsCZ0s6XA+2+IK
 LRc5pUcM94JboVPXfWpMYWC3rvu/ISRB5Me7i9jJ4o7fNFu/X51Yv5h6St68JjTPqDhp
 qmOpFqwLzIB3XNTLt9sNTNRp0PuTagDHWKdD0gz7KyD/2gpQsbvAbe1F+TLZe59MGf66
 ZjqQ==
X-Gm-Message-State: AAQBX9drQ/cnP3wjKQDGVDQj3e3fZFWbPiwNdA7v4vazN84qXVAeU2kX
 fra4xFFrs2uVf2m8uaJlONU=
X-Google-Smtp-Source: AKy350bqzOqY/SUHhX3cPZyuOYVwT5EZUxpKO1hjiP8LYcVD/4N9yUgs5ozQrBYWQTkOeqJojkeX8A==
X-Received: by 2002:a05:6870:65a3:b0:180:1519:35d6 with SMTP id
 fp35-20020a05687065a300b00180151935d6mr921996oab.1.1680172963631; 
 Thu, 30 Mar 2023 03:42:43 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:bb2:6db6:1a29:3df5])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a0568080b0400b0038755008179sm8414071oij.26.2023.03.30.03.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:42:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v2 2/2] drm/bridge: fsl-ldb: Add i.MX6SX support
Date: Thu, 30 Mar 2023 07:42:33 -0300
Message-Id: <20230330104233.785097-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230330104233.785097-1-festevam@gmail.com>
References: <20230330104233.785097-1-festevam@gmail.com>
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

