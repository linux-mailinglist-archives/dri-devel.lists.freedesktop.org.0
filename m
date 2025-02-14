Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDE0A3649C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB00710ED23;
	Fri, 14 Feb 2025 17:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S1EBnMjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0873010ED23
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:30:33 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-22100006bc8so7714965ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739554233; x=1740159033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JG67CoErQ4jk/j2wz6ZGsEzl+oGpqJgy4uTscNC0oGk=;
 b=S1EBnMjcps3AR87BCthoWqn3Zk2PxiiwAXkI0FlLxokLYe2eyuG934wILuPp/tyLq7
 3l+iWnZrm12YvgKpp3nfpIK37je0jpFclBSjkaE9ifN/ukjkm3M/yvZTX3G+38C6FAe4
 eSZIag/YkqSXma8Ubn/MWWkmHmM5n9MYBxx76PSvhzXSK7Aus80Y2JT8ik9WpqZnvI9N
 SAOkqquK9Y9MkjBxwNtTuXs5YVtezrAv5obuzd5IqlwCJHIm54FVB0x9qt79A9aOEkXX
 soOoIzgXjq2PoxRGW+zO5/a3rwmtR6oX/Kfoyy7BD5PQMQUSHLJN7/l7pXe6KLzsVQ/t
 wgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739554233; x=1740159033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JG67CoErQ4jk/j2wz6ZGsEzl+oGpqJgy4uTscNC0oGk=;
 b=V8EtT9F636OJ/evtlkk2XAiB8QF0RZHwaeoSDcfrH0FMSyQsLAO6MxvAiNcFrlK07q
 RuFikAVuIBB+tiGbYCgWkKgSHTKAE2GhGYSMBpV/Lec2MJlkXnXB1NdymTj3CQnJm5XH
 ywpV3V16mj5Ib854aJHkRcjWqRi619hfmQrgMN80Cfw2gYzLH3qn3Dha+JJEwgqFH3Tm
 4TLWyfaQOznS5L8FbWtK9yadmIXN4G8xbGbFmVw7RdbKQkFQISvsbbRF++EecHV5ceQd
 IfOTsx0VDn+Y9naZQA9bJDS/oUVnTczApowOS1exJqNs1zfQSZ5JJogaA59wagtwaQQJ
 3DcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUil3+G2tchkLpj1hNy29kZ/QTfkBxQOrUWY+oAntwhCTy8PTgZ1QoKSOKkrPWRuzRr0sr1IfM8u2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ/o88/6UBTx0UPqJFfpR6zESl+LnH9WUSQQB1THjb9ZaqraV2
 vkSOZUb3W/ea832BlOn7fpOUWEPUtzJ7xz3GzeftNidcBNQxGPYV
X-Gm-Gg: ASbGncvsqrFoTu2qVlUa8wi22Nsq/BY+DHH6iP/9CY8JpRKI60dmKbO5MV11slNU5dK
 Y+yKYc4KKhi9uQ6bp24l1l27x1JS2ZLuTtcV77QxEm/vnOju6EZDffepwDxxmfLkDW9DNxSFqK7
 OJoEoMCjpzOXlVWp+gwZ43rwm86660Ty6sn4vCzEqUBcqtklKEmolM1eOuMtVyPqPiUT0Ln9yot
 FAW5RvKNh53BjJEBfpgUCxcKkWY0B2pNJAidmVfAvMtpyIGg2uZrw2pF5NA+o2H60adn2vusfVH
 ivU8UpqwP/Su9aYMhe2UEwcYDwgsGqQVzQ==
X-Google-Smtp-Source: AGHT+IEo0wiggK4AdGkrdqyzJ6jWqqzwh3wptoY15dEQvTVEJw6wVA6kehfEZXMQuLRKEaZFZ1jYkw==
X-Received: by 2002:a05:6a21:e8c:b0:1eb:48e2:2c2f with SMTP id
 adf61e73a8af0-1ee8cbc1ea9mr535075637.30.1739554233442; 
 Fri, 14 Feb 2025 09:30:33 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-adcc6fb20f8sm1355138a12.37.2025.02.14.09.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 09:30:33 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 2/2] drm/panel: sony-td4353-jdi: transition to mipi_dsi
 wrapped functions
Date: Fri, 14 Feb 2025 22:59:58 +0530
Message-ID: <20250214172958.81258-3-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214172958.81258-1-tejasvipin76@gmail.com>
References: <20250214172958.81258-1-tejasvipin76@gmail.com>
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

Change the sony-td4353-jdi panel to use multi style functions for 
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 107 ++++--------------
 1 file changed, 23 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
index 472195d4bbbe..97f4bb4e1029 100644
--- a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
+++ b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
@@ -47,93 +47,40 @@ static inline struct sony_td4353_jdi *to_sony_td4353_jdi(struct drm_panel *panel
 static int sony_td4353_jdi_on(struct sony_td4353_jdi *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_column_address(dsi, 0x0000, 1080 - 1);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set column address: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_page_address(dsi, 0x0000, 2160 - 1);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set page address: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_tear_scanline(dsi, 0);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear scanline: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 1080 - 1);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 2160 - 1);
+	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx, 0);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS,
-			  0x00, 0x00, 0x08, 0x6f);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(70);
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS,
+				     0x00, 0x00, 0x08, 0x6f);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to turn display on: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
-static int sony_td4353_jdi_off(struct sony_td4353_jdi *ctx)
+static void sony_td4353_jdi_off(struct sony_td4353_jdi *ctx)
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
-	msleep(22);
-
-	ret = mipi_dsi_dcs_set_tear_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear off: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(80);
-
-	return 0;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 22);
+	mipi_dsi_dcs_set_tear_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 80);
 }
 
 static void sony_td4353_assert_reset_gpios(struct sony_td4353_jdi *ctx, int mode)
@@ -146,14 +93,11 @@ static void sony_td4353_assert_reset_gpios(struct sony_td4353_jdi *ctx, int mode
 static int sony_td4353_jdi_prepare(struct drm_panel *panel)
 {
 	struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	msleep(100);
 
@@ -161,7 +105,6 @@ static int sony_td4353_jdi_prepare(struct drm_panel *panel)
 
 	ret = sony_td4353_jdi_on(ctx);
 	if (ret < 0) {
-		dev_err(dev, "Failed to power on panel: %d\n", ret);
 		sony_td4353_assert_reset_gpios(ctx, 0);
 		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 		return ret;
@@ -173,12 +116,8 @@ static int sony_td4353_jdi_prepare(struct drm_panel *panel)
 static int sony_td4353_jdi_unprepare(struct drm_panel *panel)
 {
 	struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
 
-	ret = sony_td4353_jdi_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to power off panel: %d\n", ret);
+	sony_td4353_jdi_off(ctx);
 
 	sony_td4353_assert_reset_gpios(ctx, 0);
 	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-- 
2.48.1

