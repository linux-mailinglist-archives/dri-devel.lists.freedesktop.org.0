Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9B3955BC9
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 09:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0769F10E16A;
	Sun, 18 Aug 2024 07:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d/RpCEHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A27510E16A
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 07:24:24 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3dab336717fso2153459b6e.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 00:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723965863; x=1724570663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W/4wel2er+Y+8qgdhA7QELr/jTAEL57Ae/A8Ya8smkc=;
 b=d/RpCEHc1KZCwqGIXiBumiPZQhytq7US1ainf1GSYLsm/cWYTcNakWvL3xuqhig5SD
 Y4H0tp8PqjZPrDw9iFngJaTXPdp2SIGc2fXy4NkL47MyAykZXYaQszp5X97wZygdV1XX
 YLk+0/W3o4/PItO7WQGN4Y20CC/SkdykYldAIkPU24Dmhw+rzFxSRhcOL4E1rZZuzORm
 HZ3oDpzjSatYtogmA8KXq+leua2S4Mssgg3MwHbZMJo1GDaj20P5PFHbUXe9aXOF81zM
 gYQ43NDKC+pZK1FcbwqYEuG/nj9zuSuTQ6FkR1Tr1IbrTBMBzO51jqZU+/1TQDimaXhc
 fDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723965863; x=1724570663;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W/4wel2er+Y+8qgdhA7QELr/jTAEL57Ae/A8Ya8smkc=;
 b=GmSucdnarj5ikTAFFCFDPLsdH5iWmhSoJ9re9OxpuVgw8isuO8zraiSJ0LEJYbmHMh
 ucPb9XiE7HL15Tvw4HqoN5knTUMk4D/AeOcnH2LVlvcXmvSW/tPBc+rTZbuBhMvISHKW
 HAAsGumZv39DOVPldktkbXTmF4/WhejXPLc9gL7siGWDFiebQuzMfw1vYivipnsydeM6
 b3QO0ErSwQfd0O9iU7JL/Ocu5Qaok+SVzZS5xUm/DHxfat2u8owXsnKKiRT1kC/qudND
 uYcO7ppKlUtBvHJCVmo0Ce/Aien/hQ0otAKA5adMMbeTaVffbJQSR0262E8lcg53matE
 Cohg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPP37NjD9puyTFymvShXaHiRR13SMol90JaL/L2GKFxI+BK5ZxCklc6462HuSL5fYwpTvXqCswJEF0E4j9Rp5tr4xea+raRx+1Je/clSt8
X-Gm-Message-State: AOJu0YyAQUQFZk6IZZV4UdiuIzBlqKaEnxQHwrn9dTnGfLzId1X/e7OL
 yOCgqXpBAAAb4lRkhE6zvzvxsMcRGLJTRwK3ZwThH+lACMOITqPH
X-Google-Smtp-Source: AGHT+IGsv4PuPwr9QsF658mBwaaoRWK38GUFATboGtPG6yrFi3MrCZRRZy/VfscnEYXs5akOAzXnQQ==
X-Received: by 2002:a05:6808:1693:b0:3dc:39e9:df6 with SMTP id
 5614622812f47-3dd3ade0dfcmr9031124b6e.23.1723965863488; 
 Sun, 18 Aug 2024 00:24:23 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b6356929sm5704860a12.73.2024.08.18.00.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 00:24:23 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: agx@sigxcpu.org,
	kernel@puri.sm,
	neil.armstrong@linaro.org
Cc: dianders@chromium.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: mantix-mlaf057we51: transition to mipi_dsi wrapped
 functions
Date: Sun, 18 Aug 2024 12:53:56 +0530
Message-ID: <20240818072356.870465-1-tejasvipin76@gmail.com>
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

Changes the mantix-mlaf057we51 panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 79 +++++++------------
 1 file changed, 27 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index ea4a6bf6d35b..4db852ffb0f6 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -23,7 +23,7 @@
 
 /* Manufacturer specific Commands send via DSI */
 #define MANTIX_CMD_OTP_STOP_RELOAD_MIPI 0x41
-#define MANTIX_CMD_INT_CANCEL           0x4C
+#define MANTIX_CMD_INT_CANCEL           0x4c
 #define MANTIX_CMD_SPI_FINISH           0x90
 
 struct mantix {
@@ -45,82 +45,57 @@ static inline struct mantix *panel_to_mantix(struct drm_panel *panel)
 	return container_of(panel, struct mantix, panel);
 }
 
-static int mantix_init_sequence(struct mantix *ctx)
+static void mantix_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	struct device *dev = ctx->dev;
-
 	/*
 	 * Init sequence was supplied by the panel vendor.
 	 */
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
-
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_INT_CANCEL, 0x03);
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
-	mipi_dsi_generic_write_seq(dsi, 0x80, 0xA9, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a);
 
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
-	mipi_dsi_generic_write_seq(dsi, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
-	msleep(20);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x03);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0xa9, 0x00);
 
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_SPI_FINISH, 0xA5);
-	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
-	msleep(20);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x09);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
+	mipi_dsi_msleep(dsi_ctx, 20);
 
-	dev_dbg(dev, "Panel init sequence done\n");
-	return 0;
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xa5);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2f);
+	mipi_dsi_msleep(dsi_ctx, 20);
 }
 
 static int mantix_enable(struct drm_panel *panel)
 {
 	struct mantix *ctx = panel_to_mantix(panel);
-	struct device *dev = ctx->dev;
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
-	int ret;
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mantix_init_sequence(ctx);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
-		return ret;
-	}
+	mantix_init_sequence(&dsi_ctx);
+	if (!dsi_ctx.accum_err)
+		dev_dbg(ctx->dev, "Panel init sequence done\n");
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode\n");
-		return ret;
-	}
-	msleep(20);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret)
-		return ret;
-	usleep_range(10000, 12000);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 12000);
 
-	ret = mipi_dsi_turn_on_peripheral(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to turn on peripheral\n");
-		return ret;
-	}
+	mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int mantix_disable(struct drm_panel *panel)
 {
 	struct mantix *ctx = panel_to_mantix(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(ctx->dev, "Failed to turn off the display: %d\n", ret);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		dev_err(ctx->dev, "Failed to enter sleep mode: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int mantix_unprepare(struct drm_panel *panel)
-- 
2.46.0

