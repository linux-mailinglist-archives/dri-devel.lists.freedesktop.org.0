Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F4BA2D3F8
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 06:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFD110E2A1;
	Sat,  8 Feb 2025 05:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cps1lmM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FE510E2A1
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 05:16:10 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2fa0f222530so4820944a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 21:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738991770; x=1739596570; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XsXdVNzMronb2yUVKZu1ghjJ64uz8qffcCW+yBp7e6g=;
 b=cps1lmM+QejuR1e4MDqYwst0bzfgrTHqZOcX5JdtGpiA1Gp+Bh6zmIHPEnqOdA/AeS
 5wqkHg3zyh7kgLUmPMd1+XyZQtd7S2RyLiOqrsSgKsyqOfpWu2H/oivyhnjbZ3jtBnAM
 69ERoLU+dLgn7ReoVatHWGQ0uwdnxGH+dHboBXPhEdcbOqJc+dKJ3l2cxSwEp3qOjZGF
 +KPhTZwF39ofvhdjN4qHNLlXcFW4aMe/u/PtYavU2HXD6TQqTGuMfo+FGBle0mzq2xb+
 IdUZdDdo3HZiNC2l6r6FUF1QuumKofo3dmF1Db68rEM6hg5hl2n7+5zsfNdFVsUUMKPu
 keYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738991770; x=1739596570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XsXdVNzMronb2yUVKZu1ghjJ64uz8qffcCW+yBp7e6g=;
 b=j4WhKC34JdItDowyL+/E2M3tWRJuGhBaH0xKIYQJiP3Aac4gQFT2SvitB7/vVMafnD
 D2nGLT2vvQ1LlH67R/SgQh1jX2nhMuHCsz4x3eAX8hpTsvGtI5SvWv5sye0cJVFskQxa
 WtnplS2keu5982yUu9JsyM3miD9xiBdWQMpCKNw8llrVw7To2G3YLkeBXQgmyjFtMlBl
 obgjLl5qBSxahp1NIH3TLKx7NfwxcGaQMzp6ji74c67E1IvaXTeRyLdcRCt6YDL074yt
 nxascNvXcu2NBHh3gSgY5lwgJEoYBNs91T/1gvSr064NXRbYyFmYMCGmEOaR1YI0IsoQ
 6DlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2YwGWAL287aKmvtF0h8LV8xIKJxe4MOcrf/9MiurMjpzJ7MLFh0yneCha9lct00OjXbC1zbeDx9g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1W3PHE0foOqRvpu2b0eoB/FGYFlj+x0oZlFvZnuZhVInfZIph
 epEWJvdZ+S2y8ldtvadaq3oArndseuoGh7ebHF6CEM5HbXxiW9UJ
X-Gm-Gg: ASbGncuIoR+Dhkuf6SpGAWF2WX3rJVapOg3sppL4siugDDN9WRBsrpxXfmrlxgpSaVO
 QtCC+bzuFzQNGVaUDJSfq5907Fspl5JHMM+DHq4VrL3d+rxtGkeV348G8OlhOAZahNxdWfbYTf8
 zA55x5DVkcybdgo3FmkOU0lIq2Omeg+pXoLmaGiO2rxMzWsriusHU3bp4iU1kDrql8CKLsa2qjk
 YFeisERwusoD590Tx9maSYhkTWb0Lq6sw0BtK+HCHdCWeuHE/tLtw2E2LFkdYg3+av/xYq36dHi
 ivpYZ1fY27hKLV1GcnA6Dj4v7Oe0pAwViQ==
X-Google-Smtp-Source: AGHT+IHeyXd1oxn7vL3HZr3tjnvx9Z4KKJpTYR1eaOG453ZqVGJwef/+ZJCtj+ujTNMOFPDU7EwVog==
X-Received: by 2002:a17:90b:48ca:b0:2f9:9ddd:68b9 with SMTP id
 98e67ed59e1d1-2fa243db8dcmr7753416a91.26.1738991769558; 
 Fri, 07 Feb 2025 21:16:09 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa099f4d81sm4330134a91.4.2025.02.07.21.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 21:16:09 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: visionox-r66451: transition to mipi_dsi wrapped
 functions
Date: Sat,  8 Feb 2025 10:45:41 +0530
Message-ID: <20250208051541.176667-1-tejasvipin76@gmail.com>
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

Change the visionox-r66451 panel to use multi style functions for 
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-visionox-r66451.c | 179 ++++++++----------
 1 file changed, 76 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/drm/panel/panel-visionox-r66451.c
index 493f2a6076f8..81d615e1937a 100644
--- a/drivers/gpu/drm/panel/panel-visionox-r66451.c
+++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
@@ -42,85 +42,84 @@ static void visionox_r66451_reset(struct visionox_r66451 *ctx)
 static int visionox_r66451_on(struct visionox_r66451 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc2,
-			       0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x00,
-			       0x09, 0x3c);
-	mipi_dsi_dcs_write_seq(dsi, 0xd7,
-			       0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
-			       0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
-			       0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xde,
-			       0x40, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18,
-			       0x10, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x02, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xe8, 0x00, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x00, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc4,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x32);
-	mipi_dsi_dcs_write_seq(dsi, 0xcf,
-			       0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
-			       0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
-			       0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0xd3,
-			       0x45, 0x00, 0x00, 0x01, 0x13, 0x15, 0x00, 0x15, 0x07,
-			       0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, 0x11, 0x00, 0xa0,
-			       0x3c, 0x9c);
-	mipi_dsi_dcs_write_seq(dsi, 0xd7,
-			       0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
-			       0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
-			       0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0xd8,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a,
-			       0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a,
-			       0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf,
-			       0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, 0xf1, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x34, 0xb4, 0x00, 0x00, 0x00, 0x39, 0x04, 0x09, 0x34);
-	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x50, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x01, 0x00, 0x00, 0x00, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x00, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x19);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x42);
-	mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
-	mipi_dsi_dcs_set_page_address(dsi, 0, 2340 - 1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2,
+				     0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x00,
+				     0x09, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7,
+				     0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
+				     0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
+				     0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde,
+				     0x40, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18,
+				     0x10, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x02, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe8, 0x00, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x00, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcf,
+				     0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
+				     0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+				     0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd3,
+				     0x45, 0x00, 0x00, 0x01, 0x13, 0x15, 0x00, 0x15, 0x07,
+				     0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, 0x11, 0x00, 0xa0,
+				     0x3c, 0x9c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7,
+				     0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
+				     0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
+				     0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd8,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a,
+				     0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a,
+				     0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf,
+				     0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, 0xf1, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x34, 0xb4, 0x00, 0x00, 0x00, 0x39,
+				     0x04, 0x09, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x50, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x01, 0x00, 0x00, 0x00, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x00, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x42);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, 1080 - 1);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, 2340 - 1);
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
-static int visionox_r66451_off(struct visionox_r66451 *ctx)
+static void visionox_r66451_off(struct visionox_r66451 *ctx)
 {
 	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-	return 0;
 }
 
 static int visionox_r66451_prepare(struct drm_panel *panel)
 {
 	struct visionox_r66451 *ctx = to_visionox_r66451(panel);
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies),
@@ -132,7 +131,6 @@ static int visionox_r66451_prepare(struct drm_panel *panel)
 
 	ret = visionox_r66451_on(ctx);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 		return ret;
@@ -146,12 +144,8 @@ static int visionox_r66451_prepare(struct drm_panel *panel)
 static int visionox_r66451_unprepare(struct drm_panel *panel)
 {
 	struct visionox_r66451 *ctx = to_visionox_r66451(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
 
-	ret = visionox_r66451_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	visionox_r66451_off(ctx);
 
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
@@ -179,7 +173,7 @@ static int visionox_r66451_enable(struct drm_panel *panel)
 	struct visionox_r66451 *ctx = to_visionox_r66451(panel);
 	struct mipi_dsi_device *dsi = ctx->dsi;
 	struct drm_dsc_picture_parameter_set pps;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	if (!dsi->dsc) {
 		dev_err(&dsi->dev, "DSC not attached to DSI\n");
@@ -187,25 +181,13 @@ static int visionox_r66451_enable(struct drm_panel *panel)
 	}
 
 	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
-	ret = mipi_dsi_picture_parameter_set(dsi, &pps);
-	if (ret) {
-		dev_err(&dsi->dev, "Failed to set PPS\n");
-		return ret;
-	}
+	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(&dsi->dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(&dsi->dev, "Failed on set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
 	return 0;
 }
@@ -214,24 +196,15 @@ static int visionox_r66451_disable(struct drm_panel *panel)
 {
 	struct visionox_r66451 *ctx = to_visionox_r66451(panel);
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int visionox_r66451_get_modes(struct drm_panel *panel,
-- 
2.48.1

