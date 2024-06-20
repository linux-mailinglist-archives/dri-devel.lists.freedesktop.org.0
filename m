Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CB891105A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 20:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B0510E07A;
	Thu, 20 Jun 2024 18:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m0WJtkni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD0910EBDB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 18:12:25 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1f992388bbbso10731145ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718907145; x=1719511945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r2HzAIPRZdkW+tj9ANIWovc+pu+HPRBNk4X+XXrJl3g=;
 b=m0WJtkniWuaKTDaxZ+nE9pq0640Nq7zrtuMQXYtnv63sqyEC09/qa2s7VFiUkJ7DLr
 Wgrc4ubYmldqEUlLrd2rTn3m4SRJrFVz5zRZwiUVBlqBlgWkMJyCTu/EavE/hixwdYb1
 oUy20Yk7nV9QQPpZq2NNgYKSp7djvf8JNneOAPm9iiXHkEXppSAudwe+WAxNPN5HlqIJ
 hFr17fcdOPETbiPfxhBzV/I7wOjjbH+jHVHPHSreWe1UB9u+Q6CCRtO1upONUMEhkikJ
 vQr9oahn9Y3jkmwiFNSgdkVmiznpc4EcuYrbX3HBlyEWqVBBP2bhyMBTPFE2xLdQNO+V
 6d3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718907145; x=1719511945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r2HzAIPRZdkW+tj9ANIWovc+pu+HPRBNk4X+XXrJl3g=;
 b=mjbJSCkHFQfiejRKgK/ybWkhu4sJHCQMe5bmEkANcOSBggEjWpYlrTejfugkuilPXM
 FtqDTIl1QBN/mE5L1oX/Ha1bG8+nFVz6p9CMUi3krS3KqhHYdQe+ZfDG7/6i6B8xfDl0
 N4teY51ZPflraKz/Vua2/98yz+uurQF0yt9p0N9hx0sBuIVoKT/0gIdKQnSRH134FtKe
 /t48OhXApR7JsqiisczPoD+DVgzwJfeNFHqksCGwEFh577yxO8XQ6XlLjCFvwPt5dkDw
 PQt98dpy+3eBGYVWkCvwBuGKXBgOXo1qOLIqo1O3tLkmsAKksJWyCW8YjrkX+sygM1Hx
 ChAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+LtPSEZWbIIbKI5BO/wRiPeyMKDtQ5e68ThrqpP9vh2bGbUhvzLXxe8pw/lTWXLfTDZzqGQZjzkoHQj2Xb1XPcFTC9+waOhhbCmYF6fBn
X-Gm-Message-State: AOJu0YzRqwc4bA9NMU4ufcb/nRVmo/RRg7U0yn8vs5y1GdQ4iOeZmVTc
 5E0UTNCsNq+dkJp/yZjMhByvbWANdoDIee5Y9ntPVyeFvhH4POYW
X-Google-Smtp-Source: AGHT+IGgJzwQnUgC2K3ytXxUiEyV+EGacfXYG59zNba1MzMuaxu2FlEmjfeH9HgVlPLqJgvR9z5Agw==
X-Received: by 2002:a17:903:1cf:b0:1f7:42ba:5b1e with SMTP id
 d9443c01a7336-1f9aa412090mr63353065ad.17.1718907144898; 
 Thu, 20 Jun 2024 11:12:24 -0700 (PDT)
Received: from distilledx.localdomain ([122.172.85.149])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9cd18cde5sm17240035ad.66.2024.06.20.11.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 11:12:24 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com
Cc: Tejas Vipin <tejasvipin76@gmail.com>, dianders@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/panel: raydium-rm692e5: transition to mipi_dsi wrapped
 functions
Date: Thu, 20 Jun 2024 23:40:49 +0530
Message-ID: <20240620181051.102173-1-tejasvipin76@gmail.com>
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
raydium-rm692e5 panel.

Additionally, the error handling in rm692e5_prepare() is changed to
properly power the panel off in the case of a wider range of
initialization commands failing than before. 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v3:
    - Remove extra blank line
    - Expanded on error handling functionality in patch notes

Changes in v2:
    - Change rm692e5_on to return void and take mipi_dsi_multi_context
      as an argument.
    - Remove unnecessary warnings.
    - More efficient error handling in rm692e5_prepare

v1: https://lore.kernel.org/all/20240615093758.65431-1-tejasvipin76@gmail.com/

v2: https://lore.kernel.org/all/20240619033351.230929-1-tejasvipin76@gmail.com/
---
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 238 ++++++++----------
 1 file changed, 99 insertions(+), 139 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
index 21d97f6b8a2f..ea1b728e85a2 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
@@ -40,176 +40,136 @@ static void rm692e5_reset(struct rm692e5_panel *ctx)
 	usleep_range(10000, 11000);
 }
 
-static int rm692e5_on(struct rm692e5_panel *ctx)
+static void rm692e5_on(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
-
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
+	dsi_ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0x41);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd6, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0x16);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x8a, 0x87);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0x71);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x82, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc6, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc7, 0x2c);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc8, 0x64);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc9, 0x3c);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xca, 0x80);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xcb, 0x02);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xcc, 0x02);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0x38);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x18, 0x13);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0xf4);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x00, 0xff);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x01, 0xff);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x02, 0xcf);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x03, 0xbc);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x04, 0xb9);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x05, 0x99);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x06, 0x02);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x07, 0x0a);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x08, 0xe0);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x09, 0x4c);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0a, 0xeb);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0b, 0xe8);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0c, 0x32);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0d, 0x07);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0xf4);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0d, 0xc0);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0e, 0xff);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x0f, 0xff);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x10, 0x33);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x11, 0x6f);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x12, 0x6e);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x13, 0xa6);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x14, 0x80);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x15, 0x02);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x16, 0x38);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x17, 0xd3);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x18, 0x3a);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x19, 0xba);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1a, 0xcc);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1b, 0x01);
+
+	mipi_dsi_dcs_nop_multi(dsi_ctx);
+
+	mipi_dsi_msleep(dsi_ctx, 32);
+
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0x38);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x18, 0x13);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0xd1);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd3, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd0, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd2, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xd4, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xb4, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0xf9);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x00, 0xaf);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x1d, 0x37);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x44, 0x0a, 0x7b);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfe, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xfa, 0x01);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0xc2, 0x08);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x35, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x51, 0x05, 0x42);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 100);
+	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
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
 {
 	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
 	struct drm_dsc_picture_parameter_set pps;
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators: %d\n", ret);
-		return ret;
-	}
+	dsi_ctx.accum_err = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
 
 	rm692e5_reset(ctx);
 
-	ret = rm692e5_on(ctx);
-	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
-		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-		return ret;
-	}
+	rm692e5_on(&dsi_ctx);
 
 	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
 
-	ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_compression_mode(ctx->dsi, true);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable compression mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
+	mipi_dsi_compression_mode_ext_multi(&dsi_ctx, true, MIPI_DSI_COMPRESSION_DSC, 0);
+	mipi_dsi_msleep(&dsi_ctx, 28);
 
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
+	if (dsi_ctx.accum_err) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	}
+
+	return dsi_ctx.accum_err;
 }
 
 static int rm692e5_unprepare(struct drm_panel *panel)
-- 
2.45.2

