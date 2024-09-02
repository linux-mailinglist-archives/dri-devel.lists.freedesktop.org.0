Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5707F968C9E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 19:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AE310E356;
	Mon,  2 Sep 2024 17:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nBxBHjfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B648610E356
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 17:02:06 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-6e7b121be30so2602430a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725296526; x=1725901326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=15gdF/5rednKwRR/H/BsMJwPars63vsN9aTaORv5oqw=;
 b=nBxBHjfv1F6Wzz/gk/hiDxHjWdsnarghdnE8LXLgt0Tu0hjzhWH6OVKyZgfqrgbBQF
 Uwdm0rT+xkc6jSw62aLqsqqyH7I+SWGRRaDnT+Zewk8kNN4DNruFk6kV2xzs/UH6si2W
 5M9OSKNxD5ApkgjWZUkVewifqORWDrrKEqs1a8Vmz8IeN1mj5nrFH/0CQVll6GVcnHie
 E9UdDA5/1dTcAkfXpm55Ct9tS2z+LSphzPi9Lpk/imREyF4Tuama9NfDZt8thX9M3n1V
 wwgBLE745sXZU3hNv7fDac4wJ7DRJ4MLjkyHimXbEQUmKVn9ffJ0a2/7GZBx26cjpmIm
 MN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725296526; x=1725901326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=15gdF/5rednKwRR/H/BsMJwPars63vsN9aTaORv5oqw=;
 b=SWTXwP0BzF4YePrrT9wlSeoTypsiUpkEhJOwiS2Q/Yf41IRW4RwnYu7zj0rDfDDUdc
 VQ7hvpMWqM/iZIKd9s1Y9TF3xNbJcf2CIxYhC5gQwtA3cBB3zB2/bcETFAdcbigGFbrh
 IH65qF79c9k4CySx5+jHlf2Rvt/dKx6LiXGdR1qQmaJtbVWYxVnDEZeIEiOR/T63g0sL
 xof5c/6a3FfT1SKXI1DVESaC91UTaMt2i+u2Q8x4sjaDCeMbhHUSFwbCBdLp52MsUucQ
 F38o9FVH/cJK0OzJJeSlbOcYx02NXxd64kRO/FYM2auVZOC41LIADE8KysuN3OLBoJCQ
 hqHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtbO1fHHqkQyytK3Z5U3YyyIsCNYwG07SP4y706y6UvibzmQmcJ+HuT+lvPaAG8pBoFcfN3+4s7+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx21Dg5TrLR5GvRs9dZr1vt8Aiv35ItzVxyeK6+O7lcX68LYxMs
 i0TthyXm8RPdLbAP0U2SH2YmAp1W/3dvym2hzW44GXrsjhIXmYrhgoAiRpo2
X-Google-Smtp-Source: AGHT+IEOeGwc/ueFhc4jL1/9jEQVaqu/D1yKXQv70d2uYnmjo9MscuUKA73/xo1KCWn0ztiudhOprg==
X-Received: by 2002:a17:902:e88b:b0:205:6566:cb07 with SMTP id
 d9443c01a7336-2056566cd79mr42995265ad.17.1725296525710; 
 Mon, 02 Sep 2024 10:02:05 -0700 (PDT)
Received: from embed-PC.. ([106.222.229.246]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-205682cdc5dsm24124215ad.243.2024.09.02.10.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 10:02:05 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: hx83112a: Switch to wrapped mipi_dsi functions
Date: Mon,  2 Sep 2024 22:31:53 +0530
Message-Id: <20240902170153.34512-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Use the new mipi_dsi_*_multi wrapped function in hx83112a_on
and hx83112a_disable function.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83112a.c | 136 ++++++++-----------
 1 file changed, 58 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83112a.c b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
index 466c27012abf..391684e62d24 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83112a.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
@@ -58,30 +58,28 @@ static void hx83112a_reset(struct hx83112a_panel *ctx)
 
 static int hx83112a_on(struct hx83112a_panel *ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = ctx->dsi};
+
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETEXTC, 0x83, 0x11, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPOWER1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETEXTC, 0x83, 0x11, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPOWER1,
 			       0x08, 0x28, 0x28, 0x83, 0x83, 0x4c, 0x4f, 0x33);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDISP,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDISP,
 			       0x00, 0x02, 0x00, 0x90, 0x24, 0x00, 0x08, 0x19,
 			       0xea, 0x11, 0x11, 0x00, 0x11, 0xa3);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDRV,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDRV,
 			       0x58, 0x68, 0x58, 0x68, 0x0f, 0xef, 0x0b, 0xc0,
 			       0x0b, 0xc0, 0x0b, 0xc0, 0x00, 0xff, 0x00, 0xff,
 			       0x00, 0x00, 0x14, 0x15, 0x00, 0x29, 0x11, 0x07,
 			       0x12, 0x00, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDRV,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDRV,
 			       0x00, 0x12, 0x12, 0x11, 0x88, 0x12, 0x12, 0x00,
 			       0x53);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
 			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
 			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
 			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
@@ -90,8 +88,8 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
 			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
 			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
 			       0x40);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
 			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
 			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
 			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
@@ -100,8 +98,8 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
 			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
 			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
 			       0x40);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
 			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
 			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
 			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
@@ -110,13 +108,13 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
 			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
 			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
 			       0x40);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTCON,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTCON,
 			       0x70, 0x00, 0x04, 0xe0, 0x33, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPANEL, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPOWER2, 0x2b, 0x2b);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP0,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPANEL, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPOWER2, 0x2b, 0x2b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP0,
 			       0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08,
 			       0x08, 0x03, 0x03, 0x22, 0x18, 0x07, 0x07, 0x07,
 			       0x07, 0x32, 0x10, 0x06, 0x00, 0x06, 0x32, 0x10,
@@ -124,105 +122,87 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
 			       0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x08,
 			       0x09, 0x30, 0x00, 0x00, 0x00, 0x06, 0x0d, 0x00,
 			       0x0f);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP0,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP0,
 			       0x00, 0x00, 0x19, 0x10, 0x00, 0x0a, 0x00, 0x81);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP1,
 			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
 			       0xc0, 0xc0, 0x18, 0x18, 0x19, 0x19, 0x18, 0x18,
 			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
 			       0x28, 0x28, 0x24, 0x24, 0x02, 0x03, 0x02, 0x03,
 			       0x00, 0x01, 0x00, 0x01, 0x31, 0x31, 0x31, 0x31,
 			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP2,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP2,
 			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
 			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19,
 			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
 			       0x24, 0x24, 0x28, 0x28, 0x01, 0x00, 0x01, 0x00,
 			       0x03, 0x02, 0x03, 0x02, 0x31, 0x31, 0x31, 0x31,
 			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
 			       0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea,
 			       0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa,
 			       0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa, 0xaa, 0xaa);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
 			       0xaa, 0x2e, 0x28, 0x00, 0x00, 0x00, 0xaa, 0x2e,
 			       0x28, 0x00, 0x00, 0x00, 0xaa, 0xee, 0xaa, 0xaa,
 			       0xaa, 0xaa, 0xaa, 0xee, 0xaa, 0xaa, 0xaa, 0xaa);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
 			       0xaa, 0xff, 0xff, 0xff, 0xff, 0xff, 0xaa, 0xff,
 			       0xff, 0xff, 0xff, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
 			       0xaa, 0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
 			       0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xff, 0xff, 0xff,
 			       0xff, 0xff, 0xaa, 0xff, 0xff, 0xff, 0xff, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
 			       0x0e, 0x0e, 0x1e, 0x65, 0x1c, 0x65, 0x00, 0x50,
 			       0x20, 0x20, 0x00, 0x00, 0x02, 0x02, 0x02, 0x05,
 			       0x14, 0x14, 0x32, 0xb9, 0x23, 0xb9, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
 			       0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
 			       0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00,
 			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
 			       0x00, 0x00, 0x00, 0x02, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETCLOCK, 0xd1, 0xd6);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0x3f);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0xc6);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPTBA, 0x37);
-	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0x3f);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(150);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETCLOCK, 0xd1, 0xd6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPTBA, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0x3f);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(50);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 150);
 
-	return 0;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	return dsi_ctx.accum_err;
 }
 
 static int hx83112a_disable(struct drm_panel *panel)
 {
 	struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = ctx->dsi};
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
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
 
 static int hx83112a_prepare(struct drm_panel *panel)
-- 
2.34.1

