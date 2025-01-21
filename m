Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C85A17F29
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 14:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6714710E099;
	Tue, 21 Jan 2025 13:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EbD1yF8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5447D10E099
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 13:49:32 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-21670dce0a7so116858305ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 05:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737467312; x=1738072112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KHhrcwSV5gVycE0fiHKV7RdTl3Q9CP6hDVIbPOyumYU=;
 b=EbD1yF8LF1WS+KWk2Bf5jfP8KPsRlSBao1Hbfhh4gGvh8v7xTU+TJOpri6KFsdAk8I
 MnFd8JLPy6TxX08FBHz3P0IZiIaHwD4GS27zmI/8SSeq5lcTBUvMiHGmYZe2KhFU+0Q3
 yzlui0wjI08W2uHsHNB1Y5/le1hYFvcw1IEoQr3INkwcnezlwBfsqp0xkEibkNImVuag
 iQX3cd+Xj5idEhm/w0+s+VtdXkkC+d4syQGWU6dnoCZkVQtAmiQ88wvqmL9VCiHHd1V/
 aPUCfMFlITBJO3K8nmMqjdmnKoguhDB2rwHPxdZ2VYIfclaBPcEooUiz0EeQRLLcSjTp
 Tdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737467312; x=1738072112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KHhrcwSV5gVycE0fiHKV7RdTl3Q9CP6hDVIbPOyumYU=;
 b=WYdrOBe5McNN1OPUfu6NON/bBIfAzBcozjmPqyCUV14oS3pQIJmU7+gZ4/3/wpbFDD
 AhfHChXSfc7CVAz5tWcJtqpAJKiQCoGMoKFoI5PiUCSRw+UoS5lAmBhUFn6gutHpPQCX
 38q2pQLNTPeSPL9TxhxYtXlliohD5tRwAnm4WZuXflncI4H4JZWe1C62JeXYvK+mUswg
 lhXDBdvwq22+l/VjVlfkSAkUwATwA4oKSpiIMNKzexSP+Dwfh1PWhn39ryjKMmuxXiBk
 cCaoiJNUC/D8AwOArkZrxIcdTH3CcOCf6HFFs0yGwePIm3uYGODHz/ZtEgoGZixUfKQj
 SyPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPOy/Xo/hOSErtE6nXExUCxUUdbicvOho168/GIx1+BqHci+wCI6uwvBvRvX5TVKtQyNZlQxemYEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPtgHZe4+7ACFyP57U0waC/LDPUBidYcGBQNiDpSP6wG2tq3NC
 NHYOOuQPm+qCB0AdD7Vnw0rFAHfwTG/hYfZrAmDwhuP+DjSaGA44
X-Gm-Gg: ASbGnctLXSSOxgjSMY1Kyk2d/jdk0BEOmCVeuR8/Y3IhP+GvOlDy6+iZJxpg6YHtWL1
 3AD9WxHEe8QHd/eifKIa7K1f4LUBTipgg8Q3gO3rpLCbbFrbUSSYB0gNFEYmuVDUJKH84qdb6LY
 B0cb5soRQ5FZX3FW3L8gHWDRBsHPMGP36B5YvD5XIS6U89RNf5aXu4K98ziOb3Azd16bLwIsy54
 SqpBwydfhPUguLShly5ZmYJoleDyojSDmzfWeGwpZiQ1KtXTNXEgDiDIBK/2p8nkUMhZuV4Jsgl
 nHg3c+kQjjStGQ==
X-Google-Smtp-Source: AGHT+IHm5MzzsASxMbvgFHxZ+JP4w7CgMK4Xn//ZyrTxkv9Iyn+vWv+tr7VrWbz1DqG9EtF+rt1Z3g==
X-Received: by 2002:a05:6a20:d49a:b0:1e1:adcd:eae5 with SMTP id
 adf61e73a8af0-1eb2160ff91mr21719711637.42.1737467311797; 
 Tue, 21 Jan 2025 05:48:31 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN ([103.4.222.252])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-a9bdf0b513asm7408655a12.71.2025.01.21.05.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 05:48:31 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: samsung-s6e88a0-ams452ef01: transition to mipi_dsi
 wrapped functions
Date: Tue, 21 Jan 2025 19:18:19 +0530
Message-ID: <20250121134819.251718-1-tejasvipin76@gmail.com>
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

Changes the samsung-s6e88a0-ams452ef01 panel to use multi style functions
for improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 .../panel/panel-samsung-s6e88a0-ams452ef01.c  | 89 +++++++------------
 1 file changed, 31 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
index d2df227abbea..c80775b0aad3 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
@@ -39,91 +39,68 @@ static void s6e88a0_ams452ef01_reset(struct s6e88a0_ams452ef01 *ctx)
 static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a); // enable LEVEL2 commands
-	mipi_dsi_dcs_write_seq(dsi, 0xcc, 0x4c); // set Pixel Clock Divider polarity
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a); // enable LEVEL2 commands
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x4c); // set Pixel Clock Divider polarity
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
 	// set default brightness/gama
-	mipi_dsi_dcs_write_seq(dsi, 0xca,
-			       0x01, 0x00, 0x01, 0x00, 0x01, 0x00,	// V255 RR,GG,BB
-			       0x80, 0x80, 0x80,			// V203 R,G,B
-			       0x80, 0x80, 0x80,			// V151 R,G,B
-			       0x80, 0x80, 0x80,			// V87  R,G,B
-			       0x80, 0x80, 0x80,			// V51  R,G,B
-			       0x80, 0x80, 0x80,			// V35  R,G,B
-			       0x80, 0x80, 0x80,			// V23  R,G,B
-			       0x80, 0x80, 0x80,			// V11  R,G,B
-			       0x6b, 0x68, 0x71,			// V3   R,G,B
-			       0x00, 0x00, 0x00);			// V1   R,G,B
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca,
+				     0x01, 0x00, 0x01, 0x00, 0x01, 0x00,// V255 RR,GG,BB
+				     0x80, 0x80, 0x80,			// V203 R,G,B
+				     0x80, 0x80, 0x80,			// V151 R,G,B
+				     0x80, 0x80, 0x80,			// V87  R,G,B
+				     0x80, 0x80, 0x80,			// V51  R,G,B
+				     0x80, 0x80, 0x80,			// V35  R,G,B
+				     0x80, 0x80, 0x80,			// V23  R,G,B
+				     0x80, 0x80, 0x80,			// V11  R,G,B
+				     0x6b, 0x68, 0x71,			// V3   R,G,B
+				     0x00, 0x00, 0x00);			// V1   R,G,B
 	// set default Amoled Off Ratio
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x40, 0x0a, 0x17, 0x00, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x2c, 0x0b); // set default elvss voltage
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x03); // gamma/aor update
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5); // disable LEVEL2 commands
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x40, 0x0a, 0x17, 0x00, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x2c, 0x0b); // set default elvss voltage
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7, 0x03); // gamma/aor update
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5); // disable LEVEL2 commands
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int s6e88a0_ams452ef01_off(struct s6e88a0_ams452ef01 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi};
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
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
-	msleep(120);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 35);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int s6e88a0_ams452ef01_prepare(struct drm_panel *panel)
 {
 	struct s6e88a0_ams452ef01 *ctx = to_s6e88a0_ams452ef01(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	s6e88a0_ams452ef01_reset(ctx);
 
 	ret = s6e88a0_ams452ef01_on(ctx);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies),
 				       ctx->supplies);
@@ -136,12 +113,8 @@ static int s6e88a0_ams452ef01_prepare(struct drm_panel *panel)
 static int s6e88a0_ams452ef01_unprepare(struct drm_panel *panel)
 {
 	struct s6e88a0_ams452ef01 *ctx = to_s6e88a0_ams452ef01(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
 
-	ret = s6e88a0_ams452ef01_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	s6e88a0_ams452ef01_off(ctx);
 
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-- 
2.48.1

