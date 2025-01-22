Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CBBA18A5E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 04:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858CF10E659;
	Wed, 22 Jan 2025 03:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RKRuub1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF01610E659
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 03:12:20 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2efe25558ddso8265461a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 19:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737515480; x=1738120280; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ux115BZ6yMp4mGDHcgSg3b/SgxdnLXCDKrOt/YcxPPI=;
 b=RKRuub1+VNbjSRPZCfg3Ov9vRbfek7zyfgbuYc+y75XXkV8BDbz+ChOrcYGBQ15hvk
 vXq/i3wciMUMGdZoObN1e092v6Sn2cbO2o1rNmGDjnxvPJE7t0QsGv6Vi/1W9tbSAZkw
 duPiL88QDUUjFGfrgkdlHPn19JhzR7+SULLnajj88xonYvQtqRQIOBeueEVnwI6mXaz7
 YWPtw1qKI1HwoK3jBgCXzUv4CjPQciSeQTk0zL3ptqdTzl5znHeMsnXUeH23G6Hc1lmS
 zEHd0dyJXv3G9IcfV0K1GYGECGutPSC6txpuKlLrlz1AmYZkRIkJx+QfU0m9YG4Gw2Ak
 cM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737515480; x=1738120280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ux115BZ6yMp4mGDHcgSg3b/SgxdnLXCDKrOt/YcxPPI=;
 b=F2d8eUymOE+VU3ScY3NtLnCGtPq5At7bEm/m93+wvVUqcwr2KcWtJLbjCHV+ATa7NX
 KPQINX+t51omV47axAUwjPYEMtlHKcmWpiv7oXhvS/BxvQNp5KGDWIcH/uLJKSuUAU0B
 loByvEG03WjC3AalEolE280AIYzU/qPHpy93/mYK28XSceygQn97ZRZpx0OY71eECYOJ
 CtcNUgejfkxHoW6FMfHkvkeRPyAFE6apCsbSSgT0bQha6UclZ6p3eS56JuGjCUWR0hE7
 tIK/UvysPe3Ng4JqtReZOCcoTl3fIZlqaAoeTOPYAX+6uDtVwl3p8Kw4qrnZKCRKgrRZ
 XkTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4PqlgJg6bbu5Jg1RVYSBC/6CDHRQmotIq0Ovo0R5QhiixSbr7/5zdjPPDzfFRq/gqsCO7uBnwpzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIWUKnsnjV27rf8i/n9UewggB9JG+F32FOHwo1VWddFVNQmxcY
 IJQdRkSGIy8pQwhN1DfjKfn85+ChKzJtWSQWxMp0Kw9jcDSbINer
X-Gm-Gg: ASbGncuIZO3+HEqloYzMyvgxRVChe+851bbKbQU4iXV1kMgFWWHmPIRn0tUBh9/c8ky
 BxXAsQWLPbr+xzAZnvY6f9z7LQZuDRZGoFeHPJi1CMdo8ATJ/VimjZuF39eAfjuVhMjT37V/duG
 4HWQ4/H+JyN4e1IASr+bZ6vvPqVhex8/chxoMrhfGIGsEFGDkTdXArb5fj42JGC4jA1m3ke3m1q
 xltUihwa633J/+emngJXeEU5M8CTHpnnWyOLBwJRvkBzzqRATIUcFItlV0kZzCt7F7CfccTzCL5
 Hdi3G+3tguje
X-Google-Smtp-Source: AGHT+IFNfCmWcYFe6+zV6ILkzqGYAgdGnHc7yVUtAkDwTfWhNG3crD05nOKk4p+hHJMDbHAVGXnzOg==
X-Received: by 2002:a17:90a:e18f:b0:2ee:acb4:fecd with SMTP id
 98e67ed59e1d1-2f782c70244mr28919903a91.9.1737515480477; 
 Tue, 21 Jan 2025 19:11:20 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7e6af0104sm303914a91.49.2025.01.21.19.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 19:11:20 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2] drm/panel: samsung-s6e88a0-ams452ef01: transition to
 mipi_dsi wrapped functions
Date: Wed, 22 Jan 2025 08:41:10 +0530
Message-ID: <20250122031110.286079-1-tejasvipin76@gmail.com>
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v2:
    - changed s6e88a0_ams452ef01_off to return void

Link to v1: https://lore.kernel.org/all/20250121134819.251718-1-tejasvipin76@gmail.com/
---
 .../panel/panel-samsung-s6e88a0-ams452ef01.c  | 91 +++++++------------
 1 file changed, 31 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
index d2df227abbea..57b1a899bbdc 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
@@ -39,91 +39,66 @@ static void s6e88a0_ams452ef01_reset(struct s6e88a0_ams452ef01 *ctx)
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
 
-static int s6e88a0_ams452ef01_off(struct s6e88a0_ams452ef01 *ctx)
+static void s6e88a0_ams452ef01_off(struct s6e88a0_ams452ef01 *ctx)
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
-
-	return 0;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 35);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
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
@@ -136,12 +111,8 @@ static int s6e88a0_ams452ef01_prepare(struct drm_panel *panel)
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

