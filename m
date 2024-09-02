Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98858968022
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 09:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AF510E169;
	Mon,  2 Sep 2024 07:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q+6TJUmr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA8210E169
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 07:10:44 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2d8815ef6d2so1631549a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 00:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725261044; x=1725865844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TOY94K2Mh0IapSjH2sQrQvMt6OsnaIbHwlnnud6QQKk=;
 b=Q+6TJUmrV5klyVHV7XJvFfZrPUtoQUy6IBsn1xwxofsdG2SaJLCK4t/GOyFK9DBH2E
 uslDnx4BdxD2eK9JJ0wZi6cqXY7+qJS9/T8PdM8kNpHEgf0PVx2NPHz530Fg7tqPC/7O
 auBRcKRQRGDruTGj1TtiJFOZHjGyAHY0CMVH4mREeXnmd4hIqmdS0b8IGLNvitBYMegE
 TmpNgb/bkNlIoCjgCdl2BXF58kr7TccwouoqFRAv2BtHh9N0z3huf9xXJdDImagcDVEP
 tvLOtXyXD83OlHY1s+wNeWAkvHmL/JfJvH2sjZGrkm/ZPKSOCFrtRN7aKRGVULdblnm6
 YB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725261044; x=1725865844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TOY94K2Mh0IapSjH2sQrQvMt6OsnaIbHwlnnud6QQKk=;
 b=tdUI7P5yzbxzVm0L440a+vVofircIEfuEahiBs9zR1uRbCZEV2gKQoHs2r557eVMja
 RsNN3tFbCBkR5epJImtquzPUCT5uP8DBKFZ58ESM3Vekjh9F0N7vfaxcpo5Oc4dPDFfg
 BuPIETMqc3rX1Q9WrebT8oTLk3VRE+L5njwjFzwBi9cSCugZpRucDnp3UcmVd3EsIqHO
 M4jpuQQ5obWX7fHr/w0rxQNqDrZ2apKreGCgV6lNqRdyCyRudvdACQ8f3eCSbyX+NmeV
 cTkPKbRMlxl0mGJq9BEsxZAJ6kEpEqhXu3J4esMT4+0xJrJ+ZifyOhTmF4taqWgAWDSU
 O3+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX568jRvqWfSDJuI/1FS2o/7sCAQyMO6N7tbNK9XKF5kJ2A25TSNtxGe3dbGcjnCWG8L76B2HbpTiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycDZAQK7jmFGJGVuH2qywEX1ctuR5j1iRkQ7x4rE9uKgyuZpyA
 fpCdMr+2OaAZF+oWgWYHiV1oBIZdCMKlgP3FPoByzE283OVZT3XK
X-Google-Smtp-Source: AGHT+IEmw6q1DRvrefSp2AkZbs1EPDuMAj9FZdiWBHNEwdE+ma3GuHFZcwpYEjBuAoI+krAogHJqpg==
X-Received: by 2002:a17:90a:4b85:b0:2cf:7388:ad9e with SMTP id
 98e67ed59e1d1-2d85616eccamr14325219a91.2.1725261043981; 
 Mon, 02 Sep 2024 00:10:43 -0700 (PDT)
Received: from distilledx.srmu.edu.in
 ([2401:4900:6344:e783:1e00:4325:ad65:51fa])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8818feacesm5299674a91.30.2024.09.02.00.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 00:10:43 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: samsung-s6e3fa7: transition to mipi_dsi wrapped
 functions
Date: Mon,  2 Sep 2024 12:40:19 +0530
Message-ID: <20240902071019.351158-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Changes the samsung-s6e3fa7 panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c | 71 ++++++-------------
 1 file changed, 21 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c b/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
index 10bc8fb5f1f9..27a059b55ae5 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
@@ -38,57 +38,38 @@ static void s6e3fa7_panel_reset(struct s6e3fa7_panel *ctx)
 	usleep_range(10000, 11000);
 }
 
-static int s6e3fa7_panel_on(struct s6e3fa7_panel *ctx)
+static int s6e3fa7_panel_on(struct mipi_dsi_device *dsi)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4,
+				     0xbb, 0x23, 0x19, 0x3a, 0x9f, 0x0f, 0x09, 0xc0,
+				     0x00, 0xb4, 0x37, 0x70, 0x79, 0x69);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
-	mipi_dsi_dcs_write_seq(dsi, 0xf4,
-			       0xbb, 0x23, 0x19, 0x3a, 0x9f, 0x0f, 0x09, 0xc0,
-			       0x00, 0xb4, 0x37, 0x70, 0x79, 0x69);
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int s6e3fa7_panel_prepare(struct drm_panel *panel)
 {
 	struct s6e3fa7_panel *ctx = to_s6e3fa7_panel(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
 	s6e3fa7_panel_reset(ctx);
 
-	ret = s6e3fa7_panel_on(ctx);
-	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+	ret = s6e3fa7_panel_on(ctx->dsi);
+	if (ret < 0)
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-		return ret;
-	}
 
-	return 0;
+	return ret;
 }
 
 static int s6e3fa7_panel_unprepare(struct drm_panel *panel)
@@ -104,23 +85,13 @@ static int s6e3fa7_panel_disable(struct drm_panel *panel)
 {
 	struct s6e3fa7_panel *ctx = to_s6e3fa7_panel(panel);
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static const struct drm_display_mode s6e3fa7_panel_mode = {
-- 
2.46.0

