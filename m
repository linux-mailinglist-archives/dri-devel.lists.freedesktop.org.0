Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347199B147D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 06:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8F210E04C;
	Sat, 26 Oct 2024 04:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VTTxYXBx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C62710E04C
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 04:00:11 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20ca388d242so23853005ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 21:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729915211; x=1730520011; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FrZVDoCH6k+llBeMt5cmmnNwxFx08wp1hQlvS6a4Mh0=;
 b=VTTxYXBxq2c+gM9eIIuhGbBREfsXZLFMqkKUVVWxtSYEKVmE5f1dZUsJ8e2FPLANlI
 Bp1CmrqQC74264sdNSg5TtBf/O8TiORCmrDIUfapjI095DaliShSaqWCsCJF73T/7w33
 r5DOFJRZ7Cy5LrPqBwJC8LOTIw0dumGG7hKj0wFibSbhD2prx2aM6n5lWWpiuWzRImTX
 ghzeL/OQ6QL14P47ham6G/fnXAA5kBi/T9z7XX4Or1izxx8nwA8raPfqB1bLKQTne1bc
 wlqBXITKRm49WJPP1wm0Z5aApL7mqnQcH2CmsrjQavZ5NlDZLReCK8c1jHXOI9txMoVv
 vFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729915211; x=1730520011;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FrZVDoCH6k+llBeMt5cmmnNwxFx08wp1hQlvS6a4Mh0=;
 b=HjvrNh9iuZzdNghXa0Qj1way3rVtgcNq8KLCVDSaxZhATQm/UzgvXJi6ZF8QaqsAF2
 ffZy1POzCx5lxkLQKJZTWTlqZh6n52qOG9Lc1lnEZqZKqaCsm0E5+k/gq8sRhUXa1cAP
 h3aUZghj50y2cvPx96sNAe0GJa86IX5qPHI8vvqaSzmyF14WZ0jamDHmNjq6H/v4fl9P
 UYhnDqVeBLm91u1xNYF3TKzU9mBmEb8aT5MBazg+dbDK8G8i8FByzqKmZMbtYi31ZNrj
 bYRM1aWXQ1gPPGaIz+VxYqGCEB/JCB2nzXSSS5PhcGB0XKFvc5sJ1/tJ6eOQNWLzJFgB
 E89Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd09ZdOoxRgFP/t6I7DntOkYHtp/nOkz/HwlGS/I8xDhYKa1NFWXIkLaP23lB9yFMXfj5fms0K/bU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzno/7+13bF7DxCatyrhHpXeCXkbj8ado392S+TT+GIcCYvV8yg
 WZopjsSO91AKUbiwTRGKjDKID39hrI3hnluUyK6SzUqvC8idpkr+
X-Google-Smtp-Source: AGHT+IFQqdCN/ilGyJhTACggtkwbjYpRNDCKOlBJ8YIVtTgt8ovRFEZIF1ZYleZs0gttbJK5ZgBzzQ==
X-Received: by 2002:a17:902:e74d:b0:20c:637e:b28 with SMTP id
 d9443c01a7336-210c6c3e224mr22026365ad.39.1729915211207; 
 Fri, 25 Oct 2024 21:00:11 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf4432esm16897485ad.26.2024.10.25.21.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 21:00:10 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: leadtek-ltk050h3146w: transition to mipi_dsi
 wrapped functions
Date: Sat, 26 Oct 2024 09:29:28 +0530
Message-ID: <20241026035928.183454-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.47.0
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

Changes the leadtek-ltk050h3146w panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 .../drm/panel/panel-leadtek-ltk050h3146w.c    | 345 +++++++-----------
 1 file changed, 134 insertions(+), 211 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index 292aa26a456d..77f74e6c467e 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -26,7 +26,7 @@ struct ltk050h3146w;
 struct ltk050h3146w_desc {
 	const unsigned long mode_flags;
 	const struct drm_display_mode *mode;
-	int (*init)(struct ltk050h3146w *ctx);
+	void (*init)(struct mipi_dsi_multi_context *dsi_ctx);
 };
 
 struct ltk050h3146w {
@@ -243,67 +243,57 @@ struct ltk050h3146w *panel_to_ltk050h3146w(struct drm_panel *panel)
 	return container_of(panel, struct ltk050h3146w, panel);
 }
 
-static int ltk050h3148w_init_sequence(struct ltk050h3146w *ctx)
+static void ltk050h3148w_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
-
 	/*
 	 * Init sequence was supplied by the panel vendor without much
 	 * documentation.
 	 */
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0xff, 0x83, 0x94);
-	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x50, 0x15, 0x75, 0x09, 0x32, 0x44,
-			       0x71, 0x31, 0x55, 0x2f);
-	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
-	mipi_dsi_dcs_write_seq(dsi, 0xd2, 0x88);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x80, 0x64, 0x10, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x05, 0x70, 0x05, 0x70, 0x01, 0x70,
-			       0x01, 0x0c, 0x86, 0x75, 0x00, 0x3f, 0x01, 0x74,
-			       0x01, 0x74, 0x01, 0x74, 0x01, 0x0c, 0x86);
-	mipi_dsi_dcs_write_seq(dsi, 0xd3, 0x00, 0x00, 0x07, 0x07, 0x40, 0x1e,
-			       0x08, 0x00, 0x32, 0x10, 0x08, 0x00, 0x08, 0x54,
-			       0x15, 0x10, 0x05, 0x04, 0x02, 0x12, 0x10, 0x05,
-			       0x07, 0x33, 0x34, 0x0c, 0x0c, 0x37, 0x10, 0x07,
-			       0x17, 0x11, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0xd5, 0x19, 0x19, 0x18, 0x18, 0x1b, 0x1b,
-			       0x1a, 0x1a, 0x04, 0x05, 0x06, 0x07, 0x00, 0x01,
-			       0x02, 0x03, 0x20, 0x21, 0x18, 0x18, 0x22, 0x23,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
-	mipi_dsi_dcs_write_seq(dsi, 0xd6, 0x18, 0x18, 0x19, 0x19, 0x1b, 0x1b,
-			       0x1a, 0x1a, 0x03, 0x02, 0x01, 0x00, 0x07, 0x06,
-			       0x05, 0x04, 0x23, 0x22, 0x18, 0x18, 0x21, 0x20,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
-	mipi_dsi_dcs_write_seq(dsi, 0xe0, 0x00, 0x03, 0x09, 0x11, 0x11, 0x14,
-			       0x18, 0x16, 0x2e, 0x3d, 0x4d, 0x4d, 0x58, 0x6c,
-			       0x72, 0x78, 0x88, 0x8b, 0x86, 0xa4, 0xb2, 0x58,
-			       0x55, 0x59, 0x5b, 0x5d, 0x60, 0x64, 0x7f, 0x00,
-			       0x03, 0x09, 0x0f, 0x11, 0x14, 0x18, 0x16, 0x2e,
-			       0x3d, 0x4d, 0x4d, 0x58, 0x6d, 0x73, 0x78, 0x88,
-			       0x8b, 0x87, 0xa5, 0xb2, 0x58, 0x55, 0x58, 0x5b,
-			       0x5d, 0x61, 0x65, 0x7f);
-	mipi_dsi_dcs_write_seq(dsi, 0xcc, 0x0b);
-	mipi_dsi_dcs_write_seq(dsi, 0xc0, 0x1f, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0xc4, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc6, 0xef);
-	mipi_dsi_dcs_write_seq(dsi, 0xd4, 0x02);
-
-	ret = mipi_dsi_dcs_set_tear_on(dsi, 1);
-	if (ret < 0) {
-		dev_err(ctx->dev, "failed to set tear on: %d\n", ret);
-		return ret;
-	}
-
-	msleep(60);
-
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9, 0xff, 0x83, 0x94);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1, 0x50, 0x15, 0x75, 0x09, 0x32, 0x44,
+				     0x71, 0x31, 0x55, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xba, 0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd2, 0x88);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2, 0x00, 0x80, 0x64, 0x10, 0x07);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb4, 0x05, 0x70, 0x05, 0x70, 0x01, 0x70,
+				     0x01, 0x0c, 0x86, 0x75, 0x00, 0x3f, 0x01, 0x74,
+				     0x01, 0x74, 0x01, 0x74, 0x01, 0x0c, 0x86);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd3, 0x00, 0x00, 0x07, 0x07, 0x40, 0x1e,
+				     0x08, 0x00, 0x32, 0x10, 0x08, 0x00, 0x08, 0x54,
+				     0x15, 0x10, 0x05, 0x04, 0x02, 0x12, 0x10, 0x05,
+				     0x07, 0x33, 0x34, 0x0c, 0x0c, 0x37, 0x10, 0x07,
+				     0x17, 0x11, 0x40);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd5, 0x19, 0x19, 0x18, 0x18, 0x1b, 0x1b,
+				     0x1a, 0x1a, 0x04, 0x05, 0x06, 0x07, 0x00, 0x01,
+				     0x02, 0x03, 0x20, 0x21, 0x18, 0x18, 0x22, 0x23,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd6, 0x18, 0x18, 0x19, 0x19, 0x1b, 0x1b,
+				     0x1a, 0x1a, 0x03, 0x02, 0x01, 0x00, 0x07, 0x06,
+				     0x05, 0x04, 0x23, 0x22, 0x18, 0x18, 0x21, 0x20,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe0, 0x00, 0x03, 0x09, 0x11, 0x11, 0x14,
+				     0x18, 0x16, 0x2e, 0x3d, 0x4d, 0x4d, 0x58, 0x6c,
+				     0x72, 0x78, 0x88, 0x8b, 0x86, 0xa4, 0xb2, 0x58,
+				     0x55, 0x59, 0x5b, 0x5d, 0x60, 0x64, 0x7f, 0x00,
+				     0x03, 0x09, 0x0f, 0x11, 0x14, 0x18, 0x16, 0x2e,
+				     0x3d, 0x4d, 0x4d, 0x58, 0x6d, 0x73, 0x78, 0x88,
+				     0x8b, 0x87, 0xa5, 0xb2, 0x58, 0x55, 0x58, 0x5b,
+				     0x5d, 0x61, 0x65, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xcc, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc0, 0x1f, 0x31);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb6, 0xc4, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc6, 0xef);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd4, 0x02);
+
+	mipi_dsi_dcs_set_tear_on_multi(dsi_ctx, 1);
+	mipi_dsi_msleep(dsi_ctx, 60);
 }
 
 static const struct drm_display_mode ltk050h3148w_mode = {
@@ -327,74 +317,64 @@ static const struct ltk050h3146w_desc ltk050h3148w_data = {
 		      MIPI_DSI_MODE_VIDEO_BURST,
 };
 
-static int ltk050h3146w_init_sequence(struct ltk050h3146w *ctx)
+static void ltk050h3146w_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
-
 	/*
 	 * Init sequence was supplied by the panel vendor without much
 	 * documentation.
 	 */
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x93, 0x65, 0xf8);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x01, 0x03, 0x02, 0x00, 0x64, 0x06,
-			       0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0xb5);
-	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x00, 0xb5);
-	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x00, 0xbf, 0x00, 0x00, 0xbf, 0x00);
-
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xc4, 0x23, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x02, 0x01, 0x24, 0x00, 0x28, 0x0f,
-			       0x28, 0x04, 0xcc, 0xcc, 0xcc);
-	mipi_dsi_dcs_write_seq(dsi, 0xbc, 0x0f, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xbe, 0x1e, 0xf2);
-	mipi_dsi_dcs_write_seq(dsi, 0xc0, 0x26, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x12);
-	mipi_dsi_dcs_write_seq(dsi, 0xc3, 0x04, 0x02, 0x02, 0x76, 0x01, 0x80,
-			       0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xc4, 0x24, 0x80, 0xb4, 0x81, 0x12, 0x0f,
-			       0x16, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc8, 0x7f, 0x72, 0x67, 0x5d, 0x5d, 0x50,
-			       0x56, 0x41, 0x59, 0x57, 0x55, 0x70, 0x5b, 0x5f,
-			       0x4f, 0x47, 0x38, 0x23, 0x08, 0x7f, 0x72, 0x67,
-			       0x5d, 0x5d, 0x50, 0x56, 0x41, 0x59, 0x57, 0x55,
-			       0x70, 0x5b, 0x5f, 0x4f, 0x47, 0x38, 0x23, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xd0, 0x1e, 0x1f, 0x57, 0x58, 0x48, 0x4a,
-			       0x44, 0x46, 0x40, 0x1f, 0x42, 0x1f, 0x1f, 0x1f,
-			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	mipi_dsi_dcs_write_seq(dsi, 0xd1, 0x1e, 0x1f, 0x57, 0x58, 0x49, 0x4b,
-			       0x45, 0x47, 0x41, 0x1f, 0x43, 0x1f, 0x1f, 0x1f,
-			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	mipi_dsi_dcs_write_seq(dsi, 0xd2, 0x1f, 0x1e, 0x17, 0x18, 0x07, 0x05,
-			       0x0b, 0x09, 0x03, 0x1f, 0x01, 0x1f, 0x1f, 0x1f,
-			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	mipi_dsi_dcs_write_seq(dsi, 0xd3, 0x1f, 0x1e, 0x17, 0x18, 0x06, 0x04,
-			       0x0a, 0x08, 0x02, 0x1f, 0x00, 0x1f, 0x1f, 0x1f,
-			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	mipi_dsi_dcs_write_seq(dsi, 0xd4, 0x00, 0x00, 0x00, 0x0c, 0x06, 0x20,
-			       0x01, 0x02, 0x00, 0x60, 0x15, 0xb0, 0x30, 0x03,
-			       0x04, 0x00, 0x60, 0x72, 0x0a, 0x00, 0x60, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xd5, 0x00, 0x06, 0x06, 0x00, 0x30, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0xbc, 0x50, 0x00, 0x05,
-			       0x21, 0x00, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0xdd, 0x2c, 0xa3, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x32, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x3b, 0x70, 0x00, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x21, 0x22, 0x23, 0x24, 0x36, 0x37);
-	mipi_dsi_dcs_write_seq(dsi, 0xc2, 0x20, 0x38, 0x1e, 0x84);
-	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x00);
-
-	ret = mipi_dsi_dcs_set_tear_on(dsi, 1);
-	if (ret < 0) {
-		dev_err(ctx->dev, "failed to set tear on: %d\n", ret);
-		return ret;
-	}
-
-	msleep(60);
-
-	return 0;
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdf, 0x93, 0x65, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x01, 0x03, 0x02, 0x00, 0x64, 0x06,
+				     0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2, 0x00, 0xb5);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb3, 0x00, 0xb5);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb7, 0x00, 0xbf, 0x00, 0x00, 0xbf, 0x00);
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9, 0x00, 0xc4, 0x23, 0x07);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbb, 0x02, 0x01, 0x24, 0x00, 0x28, 0x0f,
+				     0x28, 0x04, 0xcc, 0xcc, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbc, 0x0f, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbe, 0x1e, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc0, 0x26, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc1, 0x00, 0x12);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc3, 0x04, 0x02, 0x02, 0x76, 0x01, 0x80,
+				     0x80);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc4, 0x24, 0x80, 0xb4, 0x81, 0x12, 0x0f,
+				     0x16, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc8, 0x7f, 0x72, 0x67, 0x5d, 0x5d, 0x50,
+				     0x56, 0x41, 0x59, 0x57, 0x55, 0x70, 0x5b, 0x5f,
+				     0x4f, 0x47, 0x38, 0x23, 0x08, 0x7f, 0x72, 0x67,
+				     0x5d, 0x5d, 0x50, 0x56, 0x41, 0x59, 0x57, 0x55,
+				     0x70, 0x5b, 0x5f, 0x4f, 0x47, 0x38, 0x23, 0x08);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd0, 0x1e, 0x1f, 0x57, 0x58, 0x48, 0x4a,
+				     0x44, 0x46, 0x40, 0x1f, 0x42, 0x1f, 0x1f, 0x1f,
+				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd1, 0x1e, 0x1f, 0x57, 0x58, 0x49, 0x4b,
+				     0x45, 0x47, 0x41, 0x1f, 0x43, 0x1f, 0x1f, 0x1f,
+				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd2, 0x1f, 0x1e, 0x17, 0x18, 0x07, 0x05,
+				     0x0b, 0x09, 0x03, 0x1f, 0x01, 0x1f, 0x1f, 0x1f,
+				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd3, 0x1f, 0x1e, 0x17, 0x18, 0x06, 0x04,
+				     0x0a, 0x08, 0x02, 0x1f, 0x00, 0x1f, 0x1f, 0x1f,
+				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd4, 0x00, 0x00, 0x00, 0x0c, 0x06, 0x20,
+				     0x01, 0x02, 0x00, 0x60, 0x15, 0xb0, 0x30, 0x03,
+				     0x04, 0x00, 0x60, 0x72, 0x0a, 0x00, 0x60, 0x08);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd5, 0x00, 0x06, 0x06, 0x00, 0x30, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0xbc, 0x50, 0x00, 0x05,
+				     0x21, 0x00, 0x60);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdd, 0x2c, 0xa3, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xde, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2, 0x32, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb7, 0x3b, 0x70, 0x00, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc1, 0x11);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbb, 0x21, 0x22, 0x23, 0x24, 0x36, 0x37);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc2, 0x20, 0x38, 0x1e, 0x84);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xde, 0x00);
+
+	mipi_dsi_dcs_set_tear_on_multi(dsi_ctx, 1);
+	mipi_dsi_msleep(dsi_ctx, 60);
 }
 
 static const struct drm_display_mode ltk050h3146w_mode = {
@@ -418,79 +398,42 @@ static const struct ltk050h3146w_desc ltk050h3146w_data = {
 		MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
 };
 
-static int ltk050h3146w_a2_select_page(struct ltk050h3146w *ctx, int page)
+static void ltk050h3146w_a2_select_page(struct mipi_dsi_multi_context *dsi_ctx, int page)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	u8 d[3] = { 0x98, 0x81, page };
+	u8 d[4] = { 0xff, 0x98, 0x81, page };
 
-	return mipi_dsi_dcs_write(dsi, 0xff, d, ARRAY_SIZE(d));
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, d, ARRAY_SIZE(d));
 }
 
-static int ltk050h3146w_a2_write_page(struct ltk050h3146w *ctx, int page,
+static void ltk050h3146w_a2_write_page(struct mipi_dsi_multi_context *dsi_ctx, int page,
 				      const struct ltk050h3146w_cmd *cmds,
 				      int num)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int i, ret;
+	ltk050h3146w_a2_select_page(dsi_ctx, page);
 
-	ret = ltk050h3146w_a2_select_page(ctx, page);
-	if (ret < 0) {
-		dev_err(ctx->dev, "failed to select page %d: %d\n", page, ret);
-		return ret;
-	}
-
-	for (i = 0; i < num; i++) {
-		ret = mipi_dsi_generic_write(dsi, &cmds[i],
+	for (int i = 0; i < num; i++)
+		mipi_dsi_generic_write_multi(dsi_ctx, &cmds[i],
 					     sizeof(struct ltk050h3146w_cmd));
-		if (ret < 0) {
-			dev_err(ctx->dev, "failed to write page %d init cmds: %d\n", page, ret);
-			return ret;
-		}
-	}
-
-	return 0;
 }
 
-static int ltk050h3146w_a2_init_sequence(struct ltk050h3146w *ctx)
+static void ltk050h3146w_a2_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
-
 	/*
 	 * Init sequence was supplied by the panel vendor without much
 	 * documentation.
 	 */
-	ret = ltk050h3146w_a2_write_page(ctx, 3, page3_cmds,
+	ltk050h3146w_a2_write_page(dsi_ctx, 3, page3_cmds,
 					 ARRAY_SIZE(page3_cmds));
-	if (ret < 0)
-		return ret;
-
-	ret = ltk050h3146w_a2_write_page(ctx, 4, page4_cmds,
+	ltk050h3146w_a2_write_page(dsi_ctx, 4, page4_cmds,
 					 ARRAY_SIZE(page4_cmds));
-	if (ret < 0)
-		return ret;
-
-	ret = ltk050h3146w_a2_write_page(ctx, 1, page1_cmds,
+	ltk050h3146w_a2_write_page(dsi_ctx, 1, page1_cmds,
 					 ARRAY_SIZE(page1_cmds));
-	if (ret < 0)
-		return ret;
-
-	ret = ltk050h3146w_a2_select_page(ctx, 0);
-	if (ret < 0) {
-		dev_err(ctx->dev, "failed to select page 0: %d\n", ret);
-		return ret;
-	}
+	ltk050h3146w_a2_select_page(dsi_ctx, 0);
 
 	/* vendor code called this without param, where there should be one */
-	ret = mipi_dsi_dcs_set_tear_on(dsi, 0);
-	if (ret < 0) {
-		dev_err(ctx->dev, "failed to set tear on: %d\n", ret);
-		return ret;
-	}
-
-	msleep(60);
+	mipi_dsi_dcs_set_tear_on_multi(dsi_ctx, 0);
 
-	return 0;
+	mipi_dsi_msleep(dsi_ctx, 60);
 }
 
 static const struct drm_display_mode ltk050h3146w_a2_mode = {
@@ -518,19 +461,12 @@ static int ltk050h3146w_unprepare(struct drm_panel *panel)
 {
 	struct ltk050h3146w *ctx = panel_to_ltk050h3146w(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
 
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vci);
@@ -542,17 +478,17 @@ static int ltk050h3146w_prepare(struct drm_panel *panel)
 {
 	struct ltk050h3146w *ctx = panel_to_ltk050h3146w(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dev_dbg(ctx->dev, "Resetting the panel\n");
-	ret = regulator_enable(ctx->vci);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to enable vci supply: %d\n", ret);
-		return ret;
+	dsi_ctx.accum_err = regulator_enable(ctx->vci);
+	if (dsi_ctx.accum_err) {
+		dev_err(ctx->dev, "Failed to enable vci supply: %d\n", dsi_ctx.accum_err);
+		return dsi_ctx.accum_err;
 	}
-	ret = regulator_enable(ctx->iovcc);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
+	dsi_ctx.accum_err = regulator_enable(ctx->iovcc);
+	if (dsi_ctx.accum_err) {
+		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", dsi_ctx.accum_err);
 		goto disable_vci;
 	}
 
@@ -561,28 +497,15 @@ static int ltk050h3146w_prepare(struct drm_panel *panel)
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 	msleep(20);
 
-	ret = ctx->panel_desc->init(ctx);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
-		goto disable_iovcc;
-	}
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
-		goto disable_iovcc;
-	}
-
+	ctx->panel_desc->init(&dsi_ctx);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 	/* T9: 120ms */
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
+	if (dsi_ctx.accum_err)
 		goto disable_iovcc;
-	}
-
-	msleep(50);
 
 	return 0;
 
@@ -590,7 +513,7 @@ static int ltk050h3146w_prepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 disable_vci:
 	regulator_disable(ctx->vci);
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static int ltk050h3146w_get_modes(struct drm_panel *panel,
-- 
2.47.0

