Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE1BA24B79
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 19:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2AA10E096;
	Sat,  1 Feb 2025 18:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cpTC9kYP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD8F10E096
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2025 18:54:58 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2164b662090so61975975ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Feb 2025 10:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738436098; x=1739040898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ops9ELJDL1NIZCRIYwnyu3rCU1aJ/oZhPS0Iz0V8PzI=;
 b=cpTC9kYP0HGyXQnnql53ZYcTaGeKCjwznG07Agon/YYFfp+nYFBmAOBYaWHNz3n3Mz
 g/fpfXVqo9HIZuqBLwxyNeGHYp92OMyv5l+TAEE15AL6jsNJdLeiDRBsVU/1Oqj3H1H8
 9EN5yVjiLoJft9m32XGo3Q2NTtdATP+qk8x01kOV0Het0bUnaIGevZgcM/+PINTCsd7z
 mYLFAIy2VOjrbprfXgcXd1cCrEqYzrgGdZ3cY4skK8SRXmVVadmEbMpEetWpZamy7eTU
 0/O0mmmQWp1I/3wV/0nsrYnKBHyoNmr0fnfj0vZfFjFy1PzfFWlLoad+wJtjEGglHTWQ
 sGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738436098; x=1739040898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ops9ELJDL1NIZCRIYwnyu3rCU1aJ/oZhPS0Iz0V8PzI=;
 b=VONdEXIP00en1ipLDzz1r4YxI/4grt2Oqsh+0AbIM8AC0Jhj5KXUqRbGBl7UljGPYa
 kqDQAbfike2gmOPBDMFa4BpLo7fZdLwgj9tqpKdbHvdvrWAN27YNC2Z5XDODG8KWgJLD
 lTnZP+I4/mhRG3/0gBCBLzyHU6KUUFwIOBiO2PGiiO3v3hQRAUnwjyqfu41kk2Gbc7gq
 bN94q52Un5P9CmqV8S2G6a4h+C5Ze4/uQS1U3azgQekA0rYxN1HAZxye2Ui1dNSPUoeF
 ZF1orYuKt8m5oBcLCVZTiY3hHxsVk8rqCqu+QW84K8Ock14qoBUwLfYspDqlwpxISiIS
 nxSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeB82iar8YQWfxnlpXzm/ClX6bsg3VvzkyyAR6pzqcU2JQETyzlSFWkT/mOoJ9c2wQ4ul/z6ycIjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJvWlqQC9QBa7CU+EBtqSNy7AYusBGWYoE0lqjbq4SZFhCPstO
 rS9s0qu6lmwM785WKOFRJA7EY5AeGaZXgAfyk4oP9H8ePtCwtsa0
X-Gm-Gg: ASbGncvjxi8XIuatHU8Lnszq+8WXqzxYZl2/XB3ilP8OAqrOdb6cRAzBuh08trwRR11
 KqDC8LP5i8QAHu9orMmFKxrXlAAn8CtLqCKdetSyFNbTy3EXS+a5bjHQLletT+hO71wMHgbzTCW
 ls3QPagfnajeiBHpwjC2ba+YDrt8fQ6U1bZkGIoHYEQ2ybHi1nsrKcFPm4XAmMUjb8LqSwfICXP
 hLlT02EC44b7dLpMy0h5xRzBhm0E0zaKj5JGOCdvV2EIXSqOpJMBDzVQiy5Soex9qGs2aRlqRwc
 5Bxlhd5iRdQyW2rTjvOr+CUXNRoyCbqJoIZRAA4u
X-Google-Smtp-Source: AGHT+IFhmfTPPLodizZramfbwgrc6Oz3a2e0JcZP2X32XQ8aCjkIReuDmb2qKOkikP37xdL+cFEIcg==
X-Received: by 2002:a17:902:e84c:b0:215:ac55:fd72 with SMTP id
 d9443c01a7336-21dd7dd86b9mr209518615ad.37.1738436097979; 
 Sat, 01 Feb 2025 10:54:57 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN
 ([2401:4900:6285:9329:d5f4:874f:7c80:132b])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21de4a91af6sm46942785ad.17.2025.02.01.10.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 10:54:57 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: sharp-ls060t1sx01: transition to mipi_dsi wrapped
 functions
Date: Sun,  2 Feb 2025 00:24:39 +0530
Message-ID: <20250201185439.157613-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Changes the sharp-ls060t1sx01 panel to use multi style functions for 
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   | 59 +++++--------------
 1 file changed, 16 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
index 74c760ee0c2d..0b4e0983639b 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
@@ -44,60 +44,39 @@ static void sharp_ls060_reset(struct sharp_ls060 *ctx)
 static int sharp_ls060_on(struct sharp_ls060 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_MEMORY_START);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(50);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
-static int sharp_ls060_off(struct sharp_ls060 *ctx)
+static void sharp_ls060_off(struct sharp_ls060 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	usleep_range(2000, 3000);
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(121);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 2000, 3000);
 
-	return 0;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 121);
 }
 
 static int sharp_ls060_prepare(struct drm_panel *panel)
 {
 	struct sharp_ls060 *ctx = to_sharp_ls060(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
 	ret = regulator_enable(ctx->vddi_supply);
@@ -125,10 +104,8 @@ static int sharp_ls060_prepare(struct drm_panel *panel)
 	sharp_ls060_reset(ctx);
 
 	ret = sharp_ls060_on(ctx);
-	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+	if (ret < 0)
 		goto err_on;
-	}
 
 	return 0;
 
@@ -154,12 +131,8 @@ static int sharp_ls060_prepare(struct drm_panel *panel)
 static int sharp_ls060_unprepare(struct drm_panel *panel)
 {
 	struct sharp_ls060 *ctx = to_sharp_ls060(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
 
-	ret = sharp_ls060_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	sharp_ls060_off(ctx);
 
 	regulator_disable(ctx->vddh_supply);
 
-- 
2.48.1

