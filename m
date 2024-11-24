Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7249D6D09
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 09:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B7E10E2C6;
	Sun, 24 Nov 2024 08:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kofLxLMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04BB10E2C6
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 08:03:17 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2ea6f821decso2998117a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 00:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732435397; x=1733040197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6C0VSpqHJ4qDm/QynyM6hHlMGBr/aZVtEWrJLfbsX/Y=;
 b=kofLxLMFnQmnouFhjAevYsSSzadXhELGnYRAwjfac5YCIIIPG7IC5coDac4NEco+zI
 7RpzfAdJ1sIRDxyNt/sVFu6z9LOZ4Tt4EpaT63vkotCoNhM8sP2c92IYsH7ITIH1gDYv
 LEFE/LdbHRUFS7n1AU7CbrAGT3Xlk8RFYVczJm0Et9ihB1Y00kPcY5+D9TM9FDOJhRNt
 0pII61ekEl+k+H+gMBPYw9qZKpEncNK2BrECLWXnxEEhbBQe2jp7PX4HnF//PVSiePRw
 7bRX6jAsnMtEZ2ktCEPRdibxDQ2QAUCBUOwumQ/yeT9qsuhEF8n+iB2Hoq02YGclIMiY
 vpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732435397; x=1733040197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6C0VSpqHJ4qDm/QynyM6hHlMGBr/aZVtEWrJLfbsX/Y=;
 b=TG6KbqPqQfWzYk1+MsMfNibi7Xrc73jeg+TXlPvLDpvNZwAkGza5r8Ion8ofuKxNo2
 nQh3S3qcnKV+nW04tyCFVfpWTrakC9AysXdGSdvNbWwR+nej/sat5/aqrhxOFk+tZHX8
 gt+r40vBzk6MRppJgrsXpib0zAqVWrGXxNBsmbGMCuB4lgnlAXQs9y/U47R2gaBQW8hL
 4/vZitzudby4UeLWNHamKHQD4JtQ/foYKu8d3DD3BNrMjFCFL4mg897Xxn16N0eD71iF
 AU9D4diOyVi273+8TUBYiaHptkHR6+LG6zJMJmnUM43A7H8z6/A36rNHA9mIRgN8ywk6
 eCaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbCBbRPK3pReSLadhDujvMVQCLXVx6mRYTa29j1zqlU2Ow11baWe30zIeGuAS6MfvqC8n6Iatxt+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6h3tM5Jdx/4w4EW0m7TngkJ2hZa9NozEhZO4r5Mt/yoHUCpZI
 QigRG2X2YVPeaOsEQBweegshoag5rddxmR503ze8d09T4cTxRStq
X-Gm-Gg: ASbGnct2VL81+lhwZLlULq5NIe5kRPagh5T1BHk26MFJ/MSP6h9Nou34gkHW2Fl8Zlj
 KmpvjfROJv9euz8nmlDGwUFQvlHXgG8aHq9+UGk3rfK9qByvhbIy7ENMJ7xOgh0aqNygj98cEoz
 HSDI53LpanGGSDRrWJ56IhSfYaEMK01BzBYdVMumVmjLsd56fMCou+wirMKvFlcSyhqwT5m0xxc
 mWtfyuO7iolZBerfQWz8hHiUXGjkE9NZBT0ifgXBtZ+Q6IjrKd68l9IKltWG/Q=
X-Google-Smtp-Source: AGHT+IGe+c7w0mSssm11jhSDpPDgnKc+pnCl/8Vm/OFco3CDhxyb5AnDciU1Nf0Hh76biUY15o0iFQ==
X-Received: by 2002:a17:90b:2e44:b0:2ea:a565:18b1 with SMTP id
 98e67ed59e1d1-2eb0e02b6d6mr12150652a91.8.1732435397178; 
 Sun, 24 Nov 2024 00:03:17 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:fa8f:7c3e:835f:c642])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ead03de6f6sm7956708a91.34.2024.11.24.00.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 00:03:16 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH 4/6] drm: panel: nv3052c: Add a panel for RG40XX series
Date: Sun, 24 Nov 2024 17:02:15 +0900
Message-ID: <20241124080220.1657238-5-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241124080220.1657238-1-kikuchan98@gmail.com>
References: <20241124080220.1657238-1-kikuchan98@gmail.com>
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

This is a display panel used in the Anbernic RG40XX series (H and V),
a handheld gaming device from Anbernic. It is 4.00 inches in size
(diagonally) with a resolution of 640x480.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 212 ++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 166393ccfed..5a7cf6cb8be 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -779,6 +779,190 @@ static const struct nv3052c_reg ylm_lbv0345001h_v2_panel_regs[] = {
 	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
 };
 
+static const struct nv3052c_reg ylm_lbv0400001x_v1_panel_regs[] = {
+	// EXTC Command set enable, select page 1
+	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x01 },
+	// Mostly unknown registers
+	{ 0xe3, 0x00 },
+	{ 0x0a, 0x01 }, // WRMADC_EN
+	{ 0x23, 0x00 }, // RGB interface control: DE+SYNC MODE PCLK-N
+	{ 0x25, 0x14 },
+	{ 0x28, 0x47 },
+	{ 0x29, 0x01 },
+	{ 0x2a, 0xdf },
+	{ 0x38, 0x9c }, // VCOM_ADJ1
+	{ 0x39, 0xa7 }, // VCOM_ADJ2
+	{ 0x3a, 0x47 }, // VCOM_ADJ3
+	{ 0x91, 0x77 }, // EXTPW_CTRL2
+	{ 0x92, 0x77 }, // EXTPW_CTRL3
+	{ 0x99, 0x52 }, // PUMP_CTRL2
+	{ 0x9b, 0x5b }, // PUMP_CTRL4
+	{ 0xa0, 0x55 },
+	{ 0xa1, 0x50 },
+	{ 0xa4, 0x9c },
+	{ 0xa7, 0x02 },
+	{ 0xa8, 0x01 },
+	{ 0xa9, 0x01 },
+	{ 0xaa, 0xfc },
+	{ 0xab, 0x28 },
+	{ 0xac, 0x06 },
+	{ 0xad, 0x06 },
+	{ 0xae, 0x06 },
+	{ 0xaf, 0x03 },
+	{ 0xb0, 0x08 },
+	{ 0xb1, 0x26 },
+	{ 0xb2, 0x28 },
+	{ 0xb3, 0x28 },
+	{ 0xb4, 0x03 },
+	{ 0xb5, 0x08 },
+	{ 0xb6, 0x26 },
+	{ 0xb7, 0x08 },
+	{ 0xb8, 0x26 },
+	// EXTC Command set enable, select page 2
+	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
+	// Set gray scale voltage to adjust gamma
+	{ 0xb0, 0x05 }, // PGAMVR0
+	{ 0xb1, 0x12 }, // PGAMVR1
+	{ 0xb2, 0x13 }, // PGAMVR2
+	{ 0xb3, 0x2c }, // PGAMVR3
+	{ 0xb4, 0x2a }, // PGAMVR4
+	{ 0xb5, 0x37 }, // PGAMVR5
+	{ 0xb6, 0x27 }, // PGAMPR0
+	{ 0xb7, 0x42 }, // PGAMPR1
+	{ 0xb8, 0x0f }, // PGAMPK0
+	{ 0xb9, 0x06 }, // PGAMPK1
+	{ 0xba, 0x12 }, // PGAMPK2
+	{ 0xbb, 0x12 }, // PGAMPK3
+	{ 0xbc, 0x13 }, // PGAMPK4
+	{ 0xbd, 0x15 }, // PGAMPK5
+	{ 0xbe, 0x1b }, // PGAMPK6
+	{ 0xbf, 0x14 }, // PGAMPK7
+	{ 0xc0, 0x1d }, // PGAMPK8
+	{ 0xc1, 0x09 }, // PGAMPK9
+	{ 0xd0, 0x02 }, // NGAMVR0
+	{ 0xd1, 0x1c }, // NGAMVR0
+	{ 0xd2, 0x1d }, // NGAMVR1
+	{ 0xd3, 0x36 }, // NGAMVR2
+	{ 0xd4, 0x34 }, // NGAMVR3
+	{ 0xd5, 0x32 }, // NGAMVR4
+	{ 0xd6, 0x25 }, // NGAMPR0
+	{ 0xd7, 0x40 }, // NGAMPR1
+	{ 0xd8, 0x0d }, // NGAMPK0
+	{ 0xd9, 0x04 }, // NGAMPK1
+	{ 0xda, 0x12 }, // NGAMPK2
+	{ 0xdb, 0x12 }, // NGAMPK3
+	{ 0xdc, 0x13 }, // NGAMPK4
+	{ 0xdd, 0x15 }, // NGAMPK5
+	{ 0xde, 0x15 }, // NGAMPK6
+	{ 0xdf, 0x0c }, // NGAMPK7
+	{ 0xe0, 0x13 }, // NGAMPK8
+	{ 0xe1, 0x07 }, // NGAMPK9
+	// EXTC Command set enable, select page 3
+	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x03 },
+	// Set various timing settings
+	{ 0x08, 0x0a }, // GIP_VST_9
+	{ 0x09, 0x0b }, // GIP_VST_10
+	{ 0x30, 0x00 }, // GIP_CLK_1
+	{ 0x31, 0x00 }, // GIP_CLK_2
+	{ 0x32, 0x00 }, // GIP_CLK_3
+	{ 0x33, 0x00 }, // GIP_CLK_4
+	{ 0x34, 0x61 }, // GIP_CLK_5
+	{ 0x35, 0xd4 }, // GIP_CLK_6
+	{ 0x36, 0x24 }, // GIP_CLK_7
+	{ 0x37, 0x03 }, // GIP_CLK_8
+	{ 0x40, 0x0d }, // GIP_CLKA_1
+	{ 0x41, 0x0e }, // GIP_CLKA_2
+	{ 0x42, 0x0f }, // GIP_CLKA_3
+	{ 0x43, 0x10 }, // GIP_CLKA_4
+	{ 0x44, 0x11 }, // GIP_CLKA_5
+	{ 0x45, 0xf4 }, // GIP_CLKA_6
+	{ 0x46, 0xf5 }, // GIP_CLKA_7
+	{ 0x47, 0x11 }, // GIP_CLKA_8
+	{ 0x48, 0xf6 }, // GIP_CLKA_9
+	{ 0x49, 0xf7 }, // GIP_CLKA_10
+	{ 0x50, 0x11 }, // GIP_CLKB_1
+	{ 0x51, 0x12 }, // GIP_CLKB_2
+	{ 0x52, 0x13 }, // GIP_CLKB_3
+	{ 0x53, 0x14 }, // GIP_CLKB_4
+	{ 0x54, 0x11 }, // GIP_CLKB_5
+	{ 0x55, 0xf8 }, // GIP_CLKB_6
+	{ 0x56, 0xf9 }, // GIP_CLKB_7
+	{ 0x57, 0x11 }, // GIP_CLKB_8
+	{ 0x58, 0xfa }, // GIP_CLKB_9
+	{ 0x59, 0xfb }, // GIP_CLKB_10
+	{ 0x60, 0x05 }, // GIP_CLKC_1
+	{ 0x61, 0x05 }, // GIP_CLKC_2
+	{ 0x65, 0x0a }, // GIP_CLKC_6
+	{ 0x66, 0x0a }, // GIP_CLKC_7
+	// Map internal GOA signals to GOA output pad
+	{ 0x82, 0x1e }, // PANELU2D3
+	{ 0x83, 0x1f }, // PANELU2D4
+	{ 0x84, 0x11 }, // PANELU2D5
+	{ 0x85, 0x02 }, // PANELU2D6
+	{ 0x86, 0x1e }, // PANELU2D7
+	{ 0x87, 0x1e }, // PANELU2D8
+	{ 0x88, 0x1f }, // PANELU2D9
+	{ 0x89, 0x0e }, // PANELU2D10
+	{ 0x8a, 0x0e }, // PANELU2D11
+	{ 0x8b, 0x10 }, // PANELU2D12
+	{ 0x8c, 0x10 }, // PANELU2D13
+	{ 0x8d, 0x0a }, // PANELU2D14
+	{ 0x8e, 0x0a }, // PANELU2D15
+	{ 0x8f, 0x0c }, // PANELU2D16
+	{ 0x90, 0x0c }, // PANELU2D17
+	{ 0x98, 0x1e }, // PANELU2D25
+	{ 0x99, 0x1f }, // PANELU2D26
+	{ 0x9a, 0x11 }, // PANELU2D27
+	{ 0x9b, 0x01 }, // PANELU2D28
+	{ 0x9c, 0x1e }, // PANELU2D29
+	{ 0x9d, 0x1e }, // PANELU2D30
+	{ 0x9e, 0x1f }, // PANELU2D31
+	{ 0x9f, 0x0d }, // PANELU2D32
+	{ 0xa0, 0x0d }, // PANELU2D33
+	{ 0xa1, 0x0f }, // PANELU2D34
+	{ 0xa2, 0x0f }, // PANELU2D35
+	{ 0xa3, 0x09 }, // PANELU2D36
+	{ 0xa4, 0x09 }, // PANELU2D37
+	{ 0xa5, 0x0b }, // PANELU2D38
+	{ 0xa6, 0x0b }, // PANELU2D39
+	{ 0xb2, 0x1f }, // PANELD2U3
+	{ 0xb3, 0x1e }, // PANELD2U4
+	{ 0xb4, 0x11 }, // PANELD2U5
+	{ 0xb5, 0x01 }, // PANELD2U6
+	{ 0xb6, 0x1e }, // PANELD2U7
+	{ 0xb7, 0x1e }, // PANELD2U8
+	{ 0xb8, 0x1f }, // PANELD2U9
+	{ 0xb9, 0x0b }, // PANELD2U10
+	{ 0xba, 0x0b }, // PANELD2U11
+	{ 0xbb, 0x09 }, // PANELD2U12
+	{ 0xbc, 0x09 }, // PANELD2U13
+	{ 0xbd, 0x0f }, // PANELD2U14
+	{ 0xbe, 0x0f }, // PANELD2U15
+	{ 0xbf, 0x0d }, // PANELD2U16
+	{ 0xc0, 0x0d }, // PANELD2U17
+	{ 0xc8, 0x1f }, // PANELD2U25
+	{ 0xc9, 0x1e }, // PANELD2U26
+	{ 0xca, 0x11 }, // PANELD2U27
+	{ 0xcb, 0x02 }, // PANELD2U28
+	{ 0xcc, 0x1e }, // PANELD2U29
+	{ 0xcd, 0x1e }, // PANELD2U30
+	{ 0xce, 0x1f }, // PANELD2U31
+	{ 0xcf, 0x0c }, // PANELD2U32
+	{ 0xd0, 0x0c }, // PANELD2U33
+	{ 0xd1, 0x0a }, // PANELD2U34
+	{ 0xd2, 0x0a }, // PANELD2U35
+	{ 0xd3, 0x10 }, // PANELD2U36
+	{ 0xd4, 0x10 }, // PANELD2U37
+	{ 0xd5, 0x0e }, // PANELD2U38
+	{ 0xd6, 0x0e }, // PANELD2U39
+	// EXTC Command set enable, select page 0
+	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x00 },
+	// Interface Pixel Format
+	{ 0x3a, 0x77 },
+	// Display Access Control
+	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
+};
+
 static inline struct nv3052c *to_nv3052c(struct drm_panel *panel)
 {
 	return container_of(panel, struct nv3052c, panel);
@@ -1046,6 +1230,21 @@ static const struct drm_display_mode ylm_lbv0345001h_v2_mode[] = {
 	},
 };
 
+static const struct drm_display_mode ylm_lbv0400001x_v1_mode[] = {
+	{
+		.clock = 24000,
+		.hdisplay = 640,
+		.hsync_start = 640 + 84,
+		.hsync_end = 640 + 84 + 20,
+		.htotal = 640 + 84 + 20 + 26,
+		.vdisplay = 480,
+		.vsync_start = 480 + 20,
+		.vsync_end = 480 + 20 + 4,
+		.vtotal = 480 + 20 + 4 + 16,
+		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+	},
+};
+
 static const struct nv3052c_panel_info ltk035c5444t_panel_info = {
 	.display_modes = ltk035c5444t_modes,
 	.num_modes = ARRAY_SIZE(ltk035c5444t_modes),
@@ -1090,11 +1289,23 @@ static const struct nv3052c_panel_info ylm_lbv0345001h_v2_panel_info = {
 	.panel_regs_len = ARRAY_SIZE(ylm_lbv0345001h_v2_panel_regs),
 };
 
+static const struct nv3052c_panel_info ylm_lbv0400001x_v1_panel_info = {
+	.display_modes = ylm_lbv0400001x_v1_mode,
+	.num_modes = ARRAY_SIZE(ylm_lbv0400001x_v1_mode),
+	.width_mm = 81,
+	.height_mm = 61,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.panel_regs = ylm_lbv0400001x_v1_panel_regs,
+	.panel_regs_len = ARRAY_SIZE(ylm_lbv0400001x_v1_panel_regs),
+};
+
 static const struct spi_device_id nv3052c_ids[] = {
 	{ "ltk035c5444t", },
 	{ "fs035vg158", },
 	{ "rg35xx-plus-panel", },
 	{ "rg35xx-plus-rev6-panel", },
+	{ "rg40xx-panel", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, nv3052c_ids);
@@ -1104,6 +1315,7 @@ static const struct of_device_id nv3052c_of_match[] = {
 	{ .compatible = "fascontek,fs035vg158", .data = &fs035vg158_panel_info },
 	{ .compatible = "anbernic,rg35xx-plus-panel", .data = &wl_355608_a8_panel_info },
 	{ .compatible = "anbernic,rg35xx-plus-rev6-panel", .data = &ylm_lbv0345001h_v2_panel_info },
+	{ .compatible = "anbernic,rg40xx-panel", .data = &ylm_lbv0400001x_v1_panel_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, nv3052c_of_match);
-- 
2.47.0

