Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF21A919B02
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 01:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC3410E9DE;
	Wed, 26 Jun 2024 23:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C3s4yfPZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4852110E9DC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 23:07:20 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2c7cfba36f8so1267914a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719443240; x=1720048040; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cub6IPz1p2WkK4nokug8jNwRfG4Pv2MvtgnRT8WYtyg=;
 b=C3s4yfPZHAXpADtCl4QzCV7SqG+p5f+kc1taFOKha2kjvTJXTf8zUnieBTjjKGr0q+
 +odhW2DKKH5vRjKcrRTucuuXPm3zeGor4yeFWv4KL9gQzyFJJom0Cy+BCIS0UlSMYpUG
 6gnueImEPgJsJ80jHyDDaXowPJ7hVfs7CMafyANzNTW8b+rcCnksk3XX4nX11534YqPt
 iVChd9SbDBN614uQd44Vp755SuPedpZIBVPnOyF8yTUmZn1/jNPrUDmFK8DI581YZgMI
 dalDroL/V4bBsqzgtrkt5gmKz86KNuew5ftpjT0Yf0C24bR6TdrXxrZmZ1vvhn9y7OT3
 V6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719443240; x=1720048040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cub6IPz1p2WkK4nokug8jNwRfG4Pv2MvtgnRT8WYtyg=;
 b=RtBzaVQq+urZWVYZ7B4d38d2LRmnmXe0k33MLfVlMpkLQx7pvg2tG0JN4FYVRlNKOk
 WvykXEtA6n5rtc54Wm+bKKd2FWCy0dBWZLoUDwU3U2BZkRyaYaUoYh08t0MY+4wbsZkW
 W9F2qtB/FxLxjpBYo9DevQ1jhC99o4NFM8Lmke8lkPy19ohrIyfsmKKuvFcgbVa68dAa
 ZdrUhcp4GuAJubQkKcI6vf4h1JIjFD9xiDnHENNxbhOHFBuk6TgLfC8fyhj9IgGt8OO9
 SjwR7DaEeQ3jd7bMjvTwP4PI4V13AHjR1+2Ki0TUkFwceUjavlBaMPehpGqV3+FYQe0M
 jLZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe1KQgJpoq6/epXGfBNn6bcPID98SjDZxpn6+biCc6+abKluRFxZNHR+Ak5mZNE7gbMYdp1XH5wwr9FX2rIerlADjUljBlkH8xh6J4nCsk
X-Gm-Message-State: AOJu0YzJW4BTpTQzcC5K6W3mg3bxhLbB/8b6m/PwpBKDStFv1lFRKite
 DsC37/u0bmpJx5UaeLRAaiWgvwgRJ8t9w1lz6dwHSbL4BY5joweM
X-Google-Smtp-Source: AGHT+IHP3jBXnk9AU75xptJoINvWJwMZLCJcxYBk2ATSguTIe2dvIUIuHnXA+euWta3Db9hfiD0c8Q==
X-Received: by 2002:a17:90a:6286:b0:2c8:af45:adb9 with SMTP id
 98e67ed59e1d1-2c8af45af82mr6338902a91.0.1719443239791; 
 Wed, 26 Jun 2024 16:07:19 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:a460:36ee:dca1:f711])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8fead3100sm61908a91.49.2024.06.26.16.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 16:07:19 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: rfoss@kernel.org
Cc: neil.armstrong@linaro.org, victor.liu@nxp.com,
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH 3/6] drm/bridge: imx8qxp-pixel-combiner: Switch to
 RUNTIME_PM_OPS()
Date: Wed, 26 Jun 2024 20:07:01 -0300
Message-Id: <20240626230704.708234-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626230704.708234-1-festevam@gmail.com>
References: <20240626230704.708234-1-festevam@gmail.com>
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

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS with its modern RUNTIME_PM_OPS() alternative.

The combined usage of pm_ptr() and RUNTIME_PM_OPS()
allows the compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index e6dbbdc87ce2..ce43e4069e21 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -371,7 +371,7 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused imx8qxp_pc_runtime_suspend(struct device *dev)
+static int imx8qxp_pc_runtime_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
@@ -393,7 +393,7 @@ static int __maybe_unused imx8qxp_pc_runtime_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused imx8qxp_pc_runtime_resume(struct device *dev)
+static int imx8qxp_pc_runtime_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
@@ -415,8 +415,7 @@ static int __maybe_unused imx8qxp_pc_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops imx8qxp_pc_pm_ops = {
-	SET_RUNTIME_PM_OPS(imx8qxp_pc_runtime_suspend,
-			   imx8qxp_pc_runtime_resume, NULL)
+	RUNTIME_PM_OPS(imx8qxp_pc_runtime_suspend, imx8qxp_pc_runtime_resume, NULL)
 };
 
 static const struct of_device_id imx8qxp_pc_dt_ids[] = {
@@ -430,7 +429,7 @@ static struct platform_driver imx8qxp_pc_bridge_driver = {
 	.probe	= imx8qxp_pc_bridge_probe,
 	.remove_new = imx8qxp_pc_bridge_remove,
 	.driver	= {
-		.pm = &imx8qxp_pc_pm_ops,
+		.pm = pm_ptr(&imx8qxp_pc_pm_ops),
 		.name = DRIVER_NAME,
 		.of_match_table = imx8qxp_pc_dt_ids,
 	},
-- 
2.34.1

