Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4410909753
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 11:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAD310E040;
	Sat, 15 Jun 2024 09:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MXNVrz90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE87510E181
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 09:40:04 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3737b250ef9so11492995ab.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 02:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718444404; x=1719049204; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZiLdP+9sA6oR0kZo4KdguH/da0qxBYn83tZMB/WiZQQ=;
 b=MXNVrz90+vO+Cj28TzQ0YlN0w40Rq88c9XHiLRC6kyVPiaMoBptMQdV+kE4Hf/uTKj
 Cv+17yWsb/IKYryLQVec0c7NNgzDS7N18sbmv/uu249gkrnl6i+mm7096j6I+UqnHDJH
 drRMLWpxwDGbbSWzwK0H8Y7jXEocx4kMPpmJN7nJz0vLyeE4r6TFdyvDACy1mIpc8o8g
 q3eI9rO8Xo2nEUSyCAmIjeyeQjfH/JvaVJUApQhI1ydDctEb2FzGrGlxT4Q2g7VsKEEW
 6BrosNqv69dMmf9EIDDULI6BQj83Url05xE/TVsFOkjqtalQc8qe23O7z2e/nddzsuSH
 C2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718444404; x=1719049204;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZiLdP+9sA6oR0kZo4KdguH/da0qxBYn83tZMB/WiZQQ=;
 b=s5viLtjfmuM6YgWCB6Q8wmnwD+rJshtdOjZhm5gZ96d/lOXrMgYx93LpxQnrjENhW9
 CgSzM+ew9S416kChTZ2BcPYkiy0D3fJF1AeDpyUaumSrttDboY1r9mg0G6bN12cYfeXn
 v9T/YyZfVfIqmZrk5PrJAhjCW4UPyAFLHUcGkIt7KqbhPYTTixw1BfGnfm9ZXI63W+4h
 UvaNBnYiMO5ECIhBoVSuHDpa9aiq3xzWgLz187V7Ur6X38/oUeOAvFQvecXWQXnSpR1l
 CO/giz7xYbjTwgTiAzhF7Yak0uWeEO0eMymIAsMfqPwjGO65HUN6+EFqu23urMbKmj3U
 bc9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ/BkjPUsOExN4QB4Gvw/PHCzOK/TbClDKuCr89rZZ2RtoDO4uHNvVjphGlvD27c8KM1J1E768PpOewRaSlpsKXb2YJa3acv9l4BhMwMoP
X-Gm-Message-State: AOJu0YxwyLVA/wSxW0xNyO0rCNyA6MG8mzL3R/m6KH+Q6SYtYPtXbqTK
 DKdO88fY7bWXPo6VlNOEewffhqZGj7KlmOmR6EcKRuSKTL8oLS57
X-Google-Smtp-Source: AGHT+IFqkpQeldL/9iCr7r6/3b7xn076LxgQ9fqnhd1/Ju9STe0r2sWeiLC02bJUVM8893IE8Cqr+g==
X-Received: by 2002:a05:6e02:1c29:b0:375:8740:4560 with SMTP id
 e9e14a558f8ab-375e0e1306amr55727355ab.1.1718444403752; 
 Sat, 15 Jun 2024 02:40:03 -0700 (PDT)
Received: from distilledx.localdomain ([122.172.82.61])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc925ffdsm4361143b3a.22.2024.06.15.02.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 02:40:03 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com
Cc: Tejas Vipin <tejasvipin76@gmail.com>, dianders@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: raydium-rm692e5: transition to mipi_dsi wrapped
 functions
Date: Sat, 15 Jun 2024 15:07:55 +0530
Message-ID: <20240615093758.65431-1-tejasvipin76@gmail.com>
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

Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Introduce
mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
("drm/mipi-dsi: wrap more functions for streamline handling") for the
raydium rm692e5 panel.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 227 ++++++++----------
 1 file changed, 98 insertions(+), 129 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
index 21d97f6b8a2f..3ddbedeac077 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
@@ -43,124 +43,103 @@ static void rm692e5_reset(struct rm692e5_panel *ctx)
 static int rm692e5_on(struct rm692e5_panel *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x41);
-	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x16);
-	mipi_dsi_generic_write_seq(dsi, 0x8a, 0x87);
-	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x71);
-	mipi_dsi_generic_write_seq(dsi, 0x82, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xc6, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xc7, 0x2c);
-	mipi_dsi_generic_write_seq(dsi, 0xc8, 0x64);
-	mipi_dsi_generic_write_seq(dsi, 0xc9, 0x3c);
-	mipi_dsi_generic_write_seq(dsi, 0xca, 0x80);
-	mipi_dsi_generic_write_seq(dsi, 0xcb, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xcc, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x38);
-	mipi_dsi_generic_write_seq(dsi, 0x18, 0x13);
-	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xf4);
-	mipi_dsi_generic_write_seq(dsi, 0x00, 0xff);
-	mipi_dsi_generic_write_seq(dsi, 0x01, 0xff);
-	mipi_dsi_generic_write_seq(dsi, 0x02, 0xcf);
-	mipi_dsi_generic_write_seq(dsi, 0x03, 0xbc);
-	mipi_dsi_generic_write_seq(dsi, 0x04, 0xb9);
-	mipi_dsi_generic_write_seq(dsi, 0x05, 0x99);
-	mipi_dsi_generic_write_seq(dsi, 0x06, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0x07, 0x0a);
-	mipi_dsi_generic_write_seq(dsi, 0x08, 0xe0);
-	mipi_dsi_generic_write_seq(dsi, 0x09, 0x4c);
-	mipi_dsi_generic_write_seq(dsi, 0x0a, 0xeb);
-	mipi_dsi_generic_write_seq(dsi, 0x0b, 0xe8);
-	mipi_dsi_generic_write_seq(dsi, 0x0c, 0x32);
-	mipi_dsi_generic_write_seq(dsi, 0x0d, 0x07);
-	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xf4);
-	mipi_dsi_generic_write_seq(dsi, 0x0d, 0xc0);
-	mipi_dsi_generic_write_seq(dsi, 0x0e, 0xff);
-	mipi_dsi_generic_write_seq(dsi, 0x0f, 0xff);
-	mipi_dsi_generic_write_seq(dsi, 0x10, 0x33);
-	mipi_dsi_generic_write_seq(dsi, 0x11, 0x6f);
-	mipi_dsi_generic_write_seq(dsi, 0x12, 0x6e);
-	mipi_dsi_generic_write_seq(dsi, 0x13, 0xa6);
-	mipi_dsi_generic_write_seq(dsi, 0x14, 0x80);
-	mipi_dsi_generic_write_seq(dsi, 0x15, 0x02);
-	mipi_dsi_generic_write_seq(dsi, 0x16, 0x38);
-	mipi_dsi_generic_write_seq(dsi, 0x17, 0xd3);
-	mipi_dsi_generic_write_seq(dsi, 0x18, 0x3a);
-	mipi_dsi_generic_write_seq(dsi, 0x19, 0xba);
-	mipi_dsi_generic_write_seq(dsi, 0x1a, 0xcc);
-	mipi_dsi_generic_write_seq(dsi, 0x1b, 0x01);
-
-	ret = mipi_dsi_dcs_nop(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to nop: %d\n", ret);
-		return ret;
-	}
-	msleep(32);
-
-	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x38);
-	mipi_dsi_generic_write_seq(dsi, 0x18, 0x13);
-	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xd1);
-	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xd0, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xd2, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xb4, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xf9);
-	mipi_dsi_generic_write_seq(dsi, 0x00, 0xaf);
-	mipi_dsi_generic_write_seq(dsi, 0x1d, 0x37);
-	mipi_dsi_generic_write_seq(dsi, 0x44, 0x0a, 0x7b);
-	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xfa, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xc2, 0x08);
-	mipi_dsi_generic_write_seq(dsi, 0x35, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0x51, 0x05, 0x42);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(100);
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0x41);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd6, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0x16);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8a, 0x87);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0x71);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x82, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc6, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc7, 0x2c);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc8, 0x64);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc9, 0x3c);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xca, 0x80);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xcb, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xcc, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0x38);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x18, 0x13);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0xf4);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x00, 0xff);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x01, 0xff);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x02, 0xcf);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x03, 0xbc);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x04, 0xb9);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x05, 0x99);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x06, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x07, 0x0a);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x08, 0xe0);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x09, 0x4c);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x0a, 0xeb);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x0b, 0xe8);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x0c, 0x32);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x0d, 0x07);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0xf4);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x0d, 0xc0);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x0e, 0xff);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x0f, 0xff);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x10, 0x33);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x11, 0x6f);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x12, 0x6e);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x13, 0xa6);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x14, 0x80);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x15, 0x02);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x16, 0x38);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x17, 0xd3);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x18, 0x3a);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x19, 0xba);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x1a, 0xcc);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x1b, 0x01);
+
+	mipi_dsi_dcs_nop_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 32);
+
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0x38);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x18, 0x13);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0xd1);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd3, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd0, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd2, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd4, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb4, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0xf9);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x00, 0xaf);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x1d, 0x37);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x44, 0x0a, 0x7b);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfa, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc2, 0x08);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x35, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x51, 0x05, 0x42);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 100);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
 }
 
 static int rm692e5_disable(struct drm_panel *panel)
 {
 	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(100);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	return 0;
+	mipi_dsi_msleep(&dsi_ctx, 100);
+
+	return dsi_ctx.accum_err;
 }
 
 static int rm692e5_prepare(struct drm_panel *panel)
@@ -168,48 +147,38 @@ static int rm692e5_prepare(struct drm_panel *panel)
 	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
 	struct drm_dsc_picture_parameter_set pps;
 	struct device *dev = &ctx->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators: %d\n", ret);
-		return ret;
+	dsi_ctx.accum_err = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (dsi_ctx.accum_err) {
+		dev_err(dev, "Failed to enable regulators: %d\n", dsi_ctx.accum_err);
+		return dsi_ctx.accum_err;
 	}
 
 	rm692e5_reset(ctx);
 
-	ret = rm692e5_on(ctx);
-	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+	dsi_ctx.accum_err = rm692e5_on(ctx);
+	if (dsi_ctx.accum_err) {
+		dev_err(dev, "Failed to initialize panel: %d\n", dsi_ctx.accum_err);
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-		return ret;
+		return dsi_ctx.accum_err;
 	}
 
 	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
 
-	ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
+	mipi_dsi_compression_mode_ext_multi(&dsi_ctx, true, MIPI_DSI_COMPRESSION_DSC, 0);
+	mipi_dsi_msleep(&dsi_ctx, 28);
 
-	ret = mipi_dsi_compression_mode(ctx->dsi, true);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable compression mode: %d\n", ret);
-		return ret;
-	}
-
-	msleep(28);
-
-	mipi_dsi_generic_write_seq(ctx->dsi, 0xfe, 0x40);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0x40);
 
 	/* 0x05 -> 90Hz, 0x00 -> 60Hz */
-	mipi_dsi_generic_write_seq(ctx->dsi, 0xbd, 0x05);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbd, 0x05);
 
-	mipi_dsi_generic_write_seq(ctx->dsi, 0xfe, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int rm692e5_unprepare(struct drm_panel *panel)
-- 
2.45.2

