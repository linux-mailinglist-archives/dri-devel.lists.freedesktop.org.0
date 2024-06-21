Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D6491267E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 15:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0781D10F179;
	Fri, 21 Jun 2024 13:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wt3f4ShC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31C110F19E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:17:19 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1f9aeb96b93so15307505ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718975839; x=1719580639; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q8Jo6W/oSNP8jr6rmsVk9Fz1TTt99fPqwc+b/r8xVV4=;
 b=Wt3f4ShCC1J8n1kLJRnW92TZozG7RhySlW6N1qsKew+tylGMLgDPnsoedzZYo9udJa
 78rd/6uQ4a713dAE0CbYJsp1pEihuhkeE1jwIm7CygPMimps0G6yyn5Lhyp5tMn4+vy+
 Qhn88OsggecHeBKXI0V/IVDXm0EW6XAyWNFmp0hOaO9MJ8lT1C1chrCmn5l1TUycvmHQ
 xVA3uYyrix6Md7s9GD+zx3kM+jJRr5EZXYau8dUGOu/wbaFtOp1fWLwkUo5jQIPIVTBm
 Jv9wAY1Nw3MLslVwm1aA/BvMY97pt34xv7AN6iqZT4iWSKdFeT7v1Bo5KgRjLYVCX9l3
 xh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718975839; x=1719580639;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q8Jo6W/oSNP8jr6rmsVk9Fz1TTt99fPqwc+b/r8xVV4=;
 b=bAmJ7/yiHkgc3vWeffAIi3meDQ6cAvzjcNAQfmV7b2MJR9HesVwso11G+5k1/a1SPL
 nVRv5NUmtOS5JlVZgZoZw6Ql+vMCabRLMnJhBC43qpc9WO8KKhyjH5s3+KMrmRHoyOfR
 UBILgyltc/fid2pL/Mj0sABUNUAwB7E6+dbUHKZ78AfyOyFEEyKYg993iYm96j3ombdg
 jRhucWH6CPIVw5KIVe1RUwqBSNFLZMQUphKV60H07rdPEg+vNVb17vOIEnW2JE7FkhPA
 ZgRxy/ywyvLzIYnZfVucwA3LLmuKPyAN0qgxMs7pTrP99gpeSFtxVwNekjX9B7X7GTDh
 0CNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVyb0rzzm8y1OdKikz8dCjFdYGXRgWnx9hrGKi8cSKFf2v0A3Mrh0YwJVXCxV2FOyYMCIvlV8h5Z/sMD1spf1im9k4lxLOWoPyXV3tHsMv
X-Gm-Message-State: AOJu0Yx3gfWsMMRXUXsZMRXWwYAJfKGVpYToL7WJIDNX+wtET3Cx9ljD
 BZiuMvUh/cjIJuc+v2JNXqQdk4XKfmjp4udZ8WOprDpXd9VHMrdM
X-Google-Smtp-Source: AGHT+IH/ujlQpjyJpVOol708EAJiossfwncho/7eSVf/kW6J8Bt8687f96NhgOmOJu8sQGHkNYB4Qw==
X-Received: by 2002:a17:902:d482:b0:1f8:3c9e:3b92 with SMTP id
 d9443c01a7336-1f9aa3dd710mr102086615ad.23.1718975838796; 
 Fri, 21 Jun 2024 06:17:18 -0700 (PDT)
Received: from distilledx.localdomain ([122.172.87.96])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb2f030csm13804045ad.43.2024.06.21.06.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 06:17:18 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com
Cc: Tejas Vipin <tejasvipin76@gmail.com>, dianders@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: asus-z00t-tm5p5-n35596: transition to mipi_dsi
 wrapped functions
Date: Fri, 21 Jun 2024 18:46:46 +0530
Message-ID: <20240621131648.131667-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi:
Introduce mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
("drm/mipi-dsi: wrap more functions for streamline handling") for the
asus-z00t-tm5p5-n35596 panel.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 140 ++++++++----------
 1 file changed, 59 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
index bcaa63d1955f..b05a663c134c 100644
--- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -33,119 +33,97 @@ static void tm5p5_nt35596_reset(struct tm5p5_nt35596 *ctx)
 	usleep_range(15000, 16000);
 }
 
-static int tm5p5_nt35596_on(struct tm5p5_nt35596 *ctx)
+static void tm5p5_nt35596_on(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-
-	mipi_dsi_generic_write_seq(dsi, 0xff, 0x05);
-	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xc5, 0x31);
-	mipi_dsi_generic_write_seq(dsi, 0xff, 0x04);
-	mipi_dsi_generic_write_seq(dsi, 0x01, 0x84);
-	mipi_dsi_generic_write_seq(dsi, 0x05, 0x25);
-	mipi_dsi_generic_write_seq(dsi, 0x06, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0x07, 0x20);
-	mipi_dsi_generic_write_seq(dsi, 0x08, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0x09, 0x08);
-	mipi_dsi_generic_write_seq(dsi, 0x0a, 0x10);
-	mipi_dsi_generic_write_seq(dsi, 0x0b, 0x10);
-	mipi_dsi_generic_write_seq(dsi, 0x0c, 0x10);
-	mipi_dsi_generic_write_seq(dsi, 0x0d, 0x14);
-	mipi_dsi_generic_write_seq(dsi, 0x0e, 0x14);
-	mipi_dsi_generic_write_seq(dsi, 0x0f, 0x14);
-	mipi_dsi_generic_write_seq(dsi, 0x10, 0x14);
-	mipi_dsi_generic_write_seq(dsi, 0x11, 0x14);
-	mipi_dsi_generic_write_seq(dsi, 0x12, 0x14);
-	mipi_dsi_generic_write_seq(dsi, 0x17, 0xf3);
-	mipi_dsi_generic_write_seq(dsi, 0x18, 0xc0);
-	mipi_dsi_generic_write_seq(dsi, 0x19, 0xc0);
-	mipi_dsi_generic_write_seq(dsi, 0x1a, 0xc0);
-	mipi_dsi_generic_write_seq(dsi, 0x1b, 0xb3);
-	mipi_dsi_generic_write_seq(dsi, 0x1c, 0xb3);
-	mipi_dsi_generic_write_seq(dsi, 0x1d, 0xb3);
-	mipi_dsi_generic_write_seq(dsi, 0x1e, 0xb3);
-	mipi_dsi_generic_write_seq(dsi, 0x1f, 0xb3);
-	mipi_dsi_generic_write_seq(dsi, 0x20, 0xb3);
-	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xff, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0x35, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x06);
-	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x04);
-	mipi_dsi_generic_write_seq(dsi, 0x5e, 0x0d);
-	mipi_dsi_generic_write_seq(dsi, 0x11, 0x00);
-	msleep(100);
-	mipi_dsi_generic_write_seq(dsi, 0x29, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0x53, 0x24);
-
-	return 0;
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xff, 0x05);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc5, 0x31);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xff, 0x04);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x01, 0x84);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x05, 0x25);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x06, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x07, 0x20);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x08, 0x06);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x09, 0x08);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0a, 0x10);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0b, 0x10);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0c, 0x10);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0d, 0x14);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0e, 0x14);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0f, 0x14);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x10, 0x14);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x11, 0x14);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x12, 0x14);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x17, 0xf3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x18, 0xc0);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x19, 0xc0);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1a, 0xc0);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1b, 0xb3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1c, 0xb3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1d, 0xb3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1e, 0xb3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1f, 0xb3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x20, 0xb3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xff, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x35, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd3, 0x06);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd4, 0x04);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x5e, 0x0d);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x11, 0x00);
+
+	mipi_dsi_msleep(dsi_ctx, 100);
+
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x29, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x53, 0x24);
 }
 
-static int tm5p5_nt35596_off(struct tm5p5_nt35596 *ctx)
+static void tm5p5_nt35596_off(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(60);
+	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_msleep(dsi_ctx, 60);
 
-	mipi_dsi_dcs_write_seq(dsi, 0x4f, 0x01);
+	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
 
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x4f, 0x01);
 }
 
 static int tm5p5_nt35596_prepare(struct drm_panel *panel)
 {
 	struct tm5p5_nt35596 *ctx = to_tm5p5_nt35596(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx =	{.dsi = ctx->dsi};
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators: %d\n", ret);
-		return ret;
-	}
+	dsi_ctx.accum_err = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
 
 	tm5p5_nt35596_reset(ctx);
 
-	ret = tm5p5_nt35596_on(ctx);
-	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+	tm5p5_nt35596_on(&dsi_ctx);
+
+	if (dsi_ctx.accum_err) {
 		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies),
 				       ctx->supplies);
-		return ret;
 	}
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int tm5p5_nt35596_unprepare(struct drm_panel *panel)
 {
 	struct tm5p5_nt35596 *ctx = to_tm5p5_nt35596(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx =	{.dsi = ctx->dsi};
 
-	ret = tm5p5_nt35596_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	tm5p5_nt35596_off(&dsi_ctx);
 
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies),
 			       ctx->supplies);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static const struct drm_display_mode tm5p5_nt35596_mode = {
-- 
2.45.2

