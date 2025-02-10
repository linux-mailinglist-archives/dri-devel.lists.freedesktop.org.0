Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F3BA2E795
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 10:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578AB10E1BB;
	Mon, 10 Feb 2025 09:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZjMRPgDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602A510E1BB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 09:24:21 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-21f7f03d856so21787455ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 01:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739179461; x=1739784261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OcbX5q6WEaM/IJQGvi4DRQAGMaIPCuY/QQej/3KoUgs=;
 b=ZjMRPgDAvI7+vdsETpXFyjO9kIsQfZPZDpqf8mJXQBiKJ0G+733PZoAv9FLOlilbKY
 wJxuxQeCvn40pwgKKLIy90DgRpRCkngnBSDTKETCmY7PEo2GE80rd/3DjOsMQukgnSEC
 btbyG1Nnt+3YxGXd+l6rGL1gGClI/FHV4Z84g63JCj3Uo/cg7hmW3y5gk/qzLobU7c3S
 Ew5TE54BUKq645rcb68Bo1tjcEnUlP/CN4ZNJKym9hiQBihp16lVUYKnR7ng7JJfoqTM
 vLknaDjmJFu33TclonZCoFrDEjB2i3cG4Nby78mczcZWx8dibrMHBur11IqIrEjbBinS
 BATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739179461; x=1739784261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OcbX5q6WEaM/IJQGvi4DRQAGMaIPCuY/QQej/3KoUgs=;
 b=WMibuubOVwbxDdSFTFbQYVj2m9yKHGV5p4hrVijAwquW+VL5dS8msxlZs1zbEc2SRb
 DTIQaIqBiblX4ozpauNjZEiwzsLmbs2wQ6tNoyBd7zf4cc9ZilNey93wH2ThlUwLg0qd
 IWj7TqLgFcfuYW7ghLKB6Rf4jFDhUTyY4rhkaF/26LWqW1I7d/C0mZRYDQev3OI6hY5G
 OUMtVcml0oH3WqkmgRVY3oPk8wIn6WodZHgTE6YB0rQ5u1pWo0n0xhfleq2Pan0iWGd0
 tKV9Hwh4Y1/dmoOX3EtR39f9o//jz6guyoONBlej6Zf7ZuFsIeZyOWqYOBXvIEJUc3mz
 f5pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEUtgNBMVUPPLJaZ/xql9QWBVxdDyU4pJSHth5PLyniLKYElVSr3CK0eThv6cvBGncJeDDCieZifk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+6j6i5DZOmekZgHFCR4mlMUWunEEcRMFIvcrvUH1kc25eboe+
 V90lQS61i4skQv21IyRfuNbHChszinwVV+bCqLGf6WpE2NX1JIbk
X-Gm-Gg: ASbGnctoZxwctRhMUDfRWl3YXbB0gcIUpsuzlMVAqOQapjPYHGuFtnQAJtdcfKDK9Rp
 hleZXMUZqT6RHJleFT5Ju2Su2wPks8JCxfCLg5UmWlFFXRWHU5zMnF9rVtkSWb+Z4A9b+RIQomt
 PD9EMVUwosJ1cV1slYdlhdzMDs7h3f8rzHCawJhpYWx7x1yGmHc9GW1NNAAxchpS/owb3q7eeWA
 Oex9SDJX6WHokZnt8BLsgR91P0Ld/WvjnGUfYMzzlDiriRXWL3cOPS/o6iWk/L6Jckd+kVtOSaI
 pJzJrCw5VXMm//HLpNflqoeDpZvbNA8LBZw=
X-Google-Smtp-Source: AGHT+IFdyewoI8rEicwhAhAqUJTpI+RCgM5//6FuLkxEOonCeovqvT9ZsLosUdLI414ugbByGf/LXQ==
X-Received: by 2002:a05:6a20:6f8b:b0:1e0:de01:4407 with SMTP id
 adf61e73a8af0-1ee03b70c02mr23182363637.37.1739179460776; 
 Mon, 10 Feb 2025 01:24:20 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN ([14.139.187.71])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-730880ec313sm2142993b3a.140.2025.02.10.01.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 01:24:20 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2] drm/panel: visionox-r66451: transition to mipi_dsi wrapped
 functions
Date: Mon, 10 Feb 2025 14:53:42 +0530
Message-ID: <20250210092342.287324-1-tejasvipin76@gmail.com>
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
improved error handling. Additionally, always drop LPM flag after
sending init sequence.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v2:
    - Fixed visionox_r66451_enable to return dsi_ctx.accum_err
    - Mentioned changed handling of LPM flag in commit message

Link to v1: https://lore.kernel.org/all/20250208051541.176667-1-tejasvipin76@gmail.com/
---
 drivers/gpu/drm/panel/panel-visionox-r66451.c | 181 ++++++++----------
 1 file changed, 77 insertions(+), 104 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/drm/panel/panel-visionox-r66451.c
index 493f2a6076f8..3ea0a86f6e69 100644
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
@@ -187,51 +181,30 @@ static int visionox_r66451_enable(struct drm_panel *panel)
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
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int visionox_r66451_disable(struct drm_panel *panel)
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

