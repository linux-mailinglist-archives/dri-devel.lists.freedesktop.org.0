Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0047970293
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 16:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BB210E0F6;
	Sat,  7 Sep 2024 14:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ltq4cYTx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846B110E0F6
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 14:01:45 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-718d962ad64so1439587b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Sep 2024 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725717705; x=1726322505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yo5z6YbpFCbyn45YhRjk1uY7oiivyYsSSZRIxOYV05w=;
 b=Ltq4cYTxCq9ywylzohSBAykPxkvmKJe0Ek2KbqHQUBeFkKGLj1c3Eq2vV1rSXVJcQ5
 F0dQEOgpYod88DcNF8DXvnjhYMaeocZFOoEFZCjuqPf6A4hSmbBa30n0WVeZ/iYvOmh7
 vc3k2MqGg2t0tjXVt3aspevZvYGQOHLpeHCMH+Q1YVd7ddmXWXRExIwwIgC8NFe9vmTt
 jUH32JTnCVlB0UQMYumzIR4WTanA2gHxb66YV7q141NXoiAUQlVt409VNYnohAEFZRFT
 kepX+blQHN0w3YG3Fi0eUGQ0+Tp/XjqWp7ZdKLH00DwbsMCnoLrV3WScZfi5fIg7eSPr
 wUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725717705; x=1726322505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yo5z6YbpFCbyn45YhRjk1uY7oiivyYsSSZRIxOYV05w=;
 b=GbFZkMJcyh9RAUdEkkLAYK7ye3unLTfnvSO3PjL8d1ioi8luCuoJlmu2zPvPO2wKsq
 mKRR42J24zH3dBo7puKjpxzx4oTHtrjejyKIlU9yO+QeV7AZYUZKr1tiXdJ7roKONdM+
 DYtJbsNLi5cld7aame41VvWnvGCsMzs7fplQVb28HLrB6DP7USz5ZZcO+hH15mohTJuF
 vBlQTXSml/pjYwBGnoWl3eWCXgX1qbZy7i6aWKgEXklZu/O5REUBZnZ4SbdnZXCRS4LZ
 7n5v2gEj8hB0z0O2ep26WUJCsEgRxwrSbvCtAoUQtApuEauVO0uTo0nZlBcwfG85LQai
 BjBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBP8oyWPbVcnipHLTk+YgyjP6cNejXiggjPQVNbhTTTDJTOf//XxJGFbpPH1eAiNq1kZRe68OP/G0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb86BRDWF+MO3p0HtdmYiVsAZhKgMSiUFCOI9yB8xTHkE6mtyW
 N5OE0mMEt1VsA/ZqrABvfp8yCO2S+nae+UefchkNm8JHQdpAS+nysmJATM/i
X-Google-Smtp-Source: AGHT+IGpqmqTNRmwfY/bZDZsLNpspnrjrnzEOH1n3LP9HaM8oIrON1a1L3mL3prDKSrR4TjZIAul6A==
X-Received: by 2002:a05:6a00:1a8b:b0:704:2563:5079 with SMTP id
 d2e1a72fcca58-718d5f1b705mr7533743b3a.27.1725717704642; 
 Sat, 07 Sep 2024 07:01:44 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-718e58b2e1bsm914232b3a.52.2024.09.07.07.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2024 07:01:44 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: raydium-rm69380: transition to mipi_dsi wrapped
 functions
Date: Sat,  7 Sep 2024 19:31:30 +0530
Message-ID: <20240907140130.410349-1-tejasvipin76@gmail.com>
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

Changes the raydium-rm69380 panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-raydium-rm69380.c | 95 ++++++-------------
 1 file changed, 30 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm69380.c b/drivers/gpu/drm/panel/panel-raydium-rm69380.c
index 4dca6802faef..bdab844dab55 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm69380.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm69380.c
@@ -46,108 +46,73 @@ static void rm69380_reset(struct rm69380_panel *ctx)
 static int rm69380_on(struct rm69380_panel *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi[0];
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 	if (ctx->dsi[1])
 		ctx->dsi[1]->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0xd4);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0xd0);
-	mipi_dsi_dcs_write_seq(dsi, 0x48, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x26);
-	mipi_dsi_dcs_write_seq(dsi, 0x75, 0x3f);
-	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x28);
-	mipi_dsi_dcs_write_seq(dsi, 0xc2, 0x08);
-
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear on: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(36);
-
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x08);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 36);
+
+	return dsi_ctx.accum_err;
 }
 
-static int rm69380_off(struct rm69380_panel *ctx)
+static void rm69380_off(struct rm69380_panel *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi[0];
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 	if (ctx->dsi[1])
 		ctx->dsi[1]->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(35);
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
-
-	return 0;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 35);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 }
 
 static int rm69380_prepare(struct drm_panel *panel)
 {
 	struct rm69380_panel *ctx = to_rm69380_panel(panel);
-	struct device *dev = &ctx->dsi[0]->dev;
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0) 
+		return ret;	
 
 	rm69380_reset(ctx);
 
 	ret = rm69380_on(ctx);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-		return ret;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int rm69380_unprepare(struct drm_panel *panel)
 {
 	struct rm69380_panel *ctx = to_rm69380_panel(panel);
-	struct device *dev = &ctx->dsi[0]->dev;
-	int ret;
 
-	ret = rm69380_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	rm69380_off(ctx);
 
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-- 
2.46.0

