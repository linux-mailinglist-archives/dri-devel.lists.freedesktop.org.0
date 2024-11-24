Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47B29D6D0C
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 09:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB3410E31C;
	Sun, 24 Nov 2024 08:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UTnbIwEc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F310810E31C
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 08:03:25 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ea4e9e6ef2so2798337a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 00:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732435405; x=1733040205; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxPBOBd+6Ed9xkatjMkJJQxFqeLTkfs9bcOKmm2N2Vs=;
 b=UTnbIwEc0MAdXWQNhqqvCEwad3Rs4XC/SXGMu/a0sp6S+haizT64+GMLhdNeZJ2VLg
 k3olMd1AtQ0PTmpWDbcp67PmvpwLuL89M94ECehlVW5m9p5SHpyuA14E4diRBFNHLOxY
 vG/Q9xESxpA9wFH8JJxDHOGGB0Wp/z0EhF7sYTcxREjgq8L0yocPQS9EM3UHXPZMhPAH
 7Cg3XqWOeGQSS/TqmTbAZUBN+drHPJIBFsDal9EduLqhrJvhKgd1iCDEEVv3hcJ+rLwd
 LwCmer2f7CxctPBhlNHNUXcamzNUplydArKz5BrKatuDy+SjtF9Y+ooHbEAsDwgmmeAW
 0puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732435405; x=1733040205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MxPBOBd+6Ed9xkatjMkJJQxFqeLTkfs9bcOKmm2N2Vs=;
 b=s96hrkX6PjtvUDZl/7VuL0AB3E3ZrjZOwuhbP13lcH2F5g+Q81OTStzm6DCNfoNcLl
 SaPJ741lyT1dbsYqwhzBTISM6t4pzYpSdteu0Qfje0Xls+SAGoq4VoWVy0kjcm4mbfOg
 d2kXj1p6Io1fSj2BREfPeSbGWNgcxSqJRgW/1XE0TplsYI6YEtqr7bbo3rlTiYP6zwwf
 sP+Rk7U5hEUwWHAGD2Pb4KNyJsCbb32zrp7AdXTqEFfXGHBMmjols6OCMClVCw6vOaec
 KVMJHjdHzz+wEkBSmEbnAzRTL/2gqdf/rXD4doGiAMs093SMQNlJdJkSbJncGjf1k8Io
 j3bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6CJNHQg+fo+9iH9507i2ktRvcFig6tx/SlZZaq3iranNLufp1bYxboaWQcDLTTnMUqlIyrYaCUa8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAVfvqaMCRJYKZDqlLmchRv02wBL7+KkqCEwvZvFvLIZxk8jtW
 ty/H8VjoFIa72MYswxu0x5iPCtgnR6XWwkDaeBdRWq/qTPKgRe8m
X-Gm-Gg: ASbGncu1Bytu/i1miLkacl+jfr9+WmNn3vs8I9bKgAfB7rnP85ZNTohDmd1NpFsMvUh
 f0SvUWvSFlaJzjPFxLvXCvdf3jB4gtYNqXgxI8TzLD2bJQ4aY8e4eOs5zKN4qRDM2FqNi+721sP
 theCHrDtbRMJzAWcB3G4Hof/xdrFkzjz3QuNrYjj3bJD4SEWE+QPVTbYubG51yYgfapgVoQL9S8
 uXVDwx8yTS/JNPVvkHBj0mB+5w8I06rMe5QhgarDXaSHvNRJmUh0cwpaAvxeFA=
X-Google-Smtp-Source: AGHT+IFe3GZWneGawX4l12Zavw69tECcDmSfwFVctb4X1ic+vmFklHYNFAP8pxdvBF7i0bBGfsfO7g==
X-Received: by 2002:a17:90b:3881:b0:2ea:a737:60ab with SMTP id
 98e67ed59e1d1-2eb0e234ccbmr13443895a91.12.1732435405454; 
 Sun, 24 Nov 2024 00:03:25 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:fa8f:7c3e:835f:c642])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ead03de6f6sm7956708a91.34.2024.11.24.00.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 00:03:25 -0800 (PST)
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
Subject: [PATCH 6/6] drm: panel: nv3052c: Add a panel for RG CubeXX
Date: Sun, 24 Nov 2024 17:02:17 +0900
Message-ID: <20241124080220.1657238-7-kikuchan98@gmail.com>
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

This is a display panel used in the Anbernic RG CubeXX, a handheld
gaming device from Anbernic. It is 3.95 inches in size (diagonally)
with a resolution of 720x720.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 198 ++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 5a7cf6cb8be..bd5be0b5e93 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -963,6 +963,176 @@ static const struct nv3052c_reg ylm_lbv0400001x_v1_panel_regs[] = {
 	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
 };
 
+static const struct nv3052c_reg ylm_lbn0395004h_v1_panel_regs[] = {
+	// EXTC Command set enable, select page 1
+	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x01 },
+	// Mostly unknown registers
+	{ 0xe3, 0x00 },
+	{ 0x0a, 0x01 }, // WRMADC_EN
+	{ 0x23, 0x00 }, // RGB interface control: DE+SYNC MODE PCLK-N
+	{ 0x25, 0x14 },
+	{ 0x29, 0x02 },
+	{ 0x2a, 0xcf },
+	{ 0x38, 0x9c }, // VCOM_ADJ1
+	{ 0x39, 0xa7 }, // VCOM_ADJ2
+	{ 0x3a, 0x5f }, // VCOM_ADJ3
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
+	{ 0xb0, 0x02 }, // PGAMVR0
+	{ 0xb1, 0x11 }, // PGAMVR1
+	{ 0xb2, 0x12 }, // PGAMVR2
+	{ 0xb3, 0x2e }, // PGAMVR3
+	{ 0xb4, 0x30 }, // PGAMVR4
+	{ 0xb5, 0x37 }, // PGAMVR5
+	{ 0xb6, 0x1c }, // PGAMPR0
+	{ 0xb7, 0x39 }, // PGAMPR1
+	{ 0xb8, 0x08 }, // PGAMPK0
+	{ 0xb9, 0x00 }, // PGAMPK1
+	{ 0xba, 0x12 }, // PGAMPK2
+	{ 0xbb, 0x12 }, // PGAMPK3
+	{ 0xbc, 0x14 }, // PGAMPK4
+	{ 0xbd, 0x15 }, // PGAMPK5
+	{ 0xbe, 0x16 }, // PGAMPK6
+	{ 0xbf, 0x0d }, // PGAMPK7
+	{ 0xc0, 0x15 }, // PGAMPK8
+	{ 0xc1, 0x04 }, // PGAMPK9
+	{ 0xd0, 0x05 }, // NGAMVR0
+	{ 0xd1, 0x07 }, // NGAMVR0
+	{ 0xd2, 0x08 }, // NGAMVR1
+	{ 0xd3, 0x30 }, // NGAMVR2
+	{ 0xd4, 0x2e }, // NGAMVR3
+	{ 0xd5, 0x32 }, // NGAMVR4
+	{ 0xd6, 0x1c }, // NGAMPR0
+	{ 0xd7, 0x3b }, // NGAMPR1
+	{ 0xd8, 0x10 }, // NGAMPK0
+	{ 0xd9, 0x06 }, // NGAMPK1
+	{ 0xda, 0x12 }, // NGAMPK2
+	{ 0xdb, 0x12 }, // NGAMPK3
+	{ 0xdc, 0x14 }, // NGAMPK4
+	{ 0xdd, 0x15 }, // NGAMPK5
+	{ 0xde, 0x18 }, // NGAMPK6
+	{ 0xdf, 0x0f }, // NGAMPK7
+	{ 0xe0, 0x17 }, // NGAMPK8
+	{ 0xe1, 0x0a }, // NGAMPK9
+	// EXTC Command set enable, select page 3
+	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x03 },
+	// Set various timing settings
+	{ 0x08, 0x09 }, // GIP_VST_9
+	{ 0x09, 0x0a }, // GIP_VST_10
+	{ 0x0a, 0x0b }, // GIP_VST_11
+	{ 0x0b, 0x0c }, // GIP_VST_12
+	{ 0x28, 0x22 }, // GIP_VEND_9
+	{ 0x2a, 0xec }, // GIP_VEND_11
+	{ 0x2b, 0xec }, // GIP_VEND_12
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
+	{ 0x44, 0x22 }, // GIP_CLKA_5
+	{ 0x45, 0xe1 }, // GIP_CLKA_6
+	{ 0x46, 0xe2 }, // GIP_CLKA_7
+	{ 0x47, 0x22 }, // GIP_CLKA_8
+	{ 0x48, 0xe3 }, // GIP_CLKA_9
+	{ 0x49, 0xe4 }, // GIP_CLKA_10
+	{ 0x50, 0x11 }, // GIP_CLKB_1
+	{ 0x51, 0x12 }, // GIP_CLKB_2
+	{ 0x52, 0x13 }, // GIP_CLKB_3
+	{ 0x53, 0x14 }, // GIP_CLKB_4
+	{ 0x54, 0x22 }, // GIP_CLKB_5
+	{ 0x55, 0xe5 }, // GIP_CLKB_6
+	{ 0x56, 0xe6 }, // GIP_CLKB_7
+	{ 0x57, 0x22 }, // GIP_CLKB_8
+	{ 0x58, 0xe7 }, // GIP_CLKB_9
+	{ 0x59, 0xe8 }, // GIP_CLKB_10
+	// Map internal GOA signals to GOA output pad
+	{ 0x80, 0x05 }, // PANELU2D1
+	{ 0x81, 0x1e }, // PANELU2D2
+	{ 0x82, 0x02 }, // PANELU2D3
+	{ 0x83, 0x04 }, // PANELU2D4
+	{ 0x84, 0x1e }, // PANELU2D5
+	{ 0x85, 0x1e }, // PANELU2D6
+	{ 0x86, 0x1f }, // PANELU2D7
+	{ 0x87, 0x1f }, // PANELU2D8
+	{ 0x88, 0x0e }, // PANELU2D9
+	{ 0x89, 0x10 }, // PANELU2D10
+	{ 0x8a, 0x0a }, // PANELU2D11
+	{ 0x8b, 0x0c }, // PANELU2D12
+	{ 0x96, 0x05 }, // PANELU2D23
+	{ 0x97, 0x1e }, // PANELU2D24
+	{ 0x98, 0x01 }, // PANELU2D25
+	{ 0x99, 0x03 }, // PANELU2D26
+	{ 0x9a, 0x1e }, // PANELU2D27
+	{ 0x9b, 0x1e }, // PANELU2D28
+	{ 0x9c, 0x1f }, // PANELU2D29
+	{ 0x9d, 0x1f }, // PANELU2D30
+	{ 0x9e, 0x0d }, // PANELU2D31
+	{ 0x9f, 0x0f }, // PANELU2D32
+	{ 0xa0, 0x09 }, // PANELU2D33
+	{ 0xa1, 0x0b }, // PANELU2D34
+	{ 0xb0, 0x05 }, // PANELD2U1
+	{ 0xb1, 0x1f }, // PANELD2U2
+	{ 0xb2, 0x03 }, // PANELD2U3
+	{ 0xb3, 0x01 }, // PANELD2U4
+	{ 0xb4, 0x1e }, // PANELD2U5
+	{ 0xb5, 0x1e }, // PANELD2U6
+	{ 0xb6, 0x1f }, // PANELD2U7
+	{ 0xb7, 0x1e }, // PANELD2U8
+	{ 0xb8, 0x0b }, // PANELD2U9
+	{ 0xb9, 0x09 }, // PANELD2U10
+	{ 0xba, 0x0f }, // PANELD2U11
+	{ 0xbb, 0x0d }, // PANELD2U12
+	{ 0xc6, 0x05 }, // PANELD2U23
+	{ 0xc7, 0x1f }, // PANELD2U24
+	{ 0xc8, 0x04 }, // PANELD2U25
+	{ 0xc9, 0x02 }, // PANELD2U26
+	{ 0xca, 0x1e }, // PANELD2U27
+	{ 0xcb, 0x1e }, // PANELD2U28
+	{ 0xcc, 0x1f }, // PANELD2U29
+	{ 0xcd, 0x1e }, // PANELD2U30
+	{ 0xce, 0x0c }, // PANELD2U31
+	{ 0xcf, 0x0a }, // PANELD2U32
+	{ 0xd0, 0x10 }, // PANELD2U33
+	{ 0xd1, 0x0e }, // PANELD2U34
+	// EXTC Command set enable, select page 0
+	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x00 },
+	// Display Access Control
+	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
+};
+
 static inline struct nv3052c *to_nv3052c(struct drm_panel *panel)
 {
 	return container_of(panel, struct nv3052c, panel);
@@ -1245,6 +1415,21 @@ static const struct drm_display_mode ylm_lbv0400001x_v1_mode[] = {
 	},
 };
 
+static const struct drm_display_mode ylm_lbn0395004h_v1_mode[] = {
+	{
+		.clock = 36000,
+		.hdisplay = 720,
+		.hsync_start = 720 + 28,
+		.hsync_end = 720 + 28 + 4,
+		.htotal = 720 + 28 + 4 + 42,
+		.vdisplay = 720,
+		.vsync_start = 720 + 16,
+		.vsync_end = 720 + 16 + 4,
+		.vtotal = 720 + 16 + 4 + 16,
+		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+	},
+};
+
 static const struct nv3052c_panel_info ltk035c5444t_panel_info = {
 	.display_modes = ltk035c5444t_modes,
 	.num_modes = ARRAY_SIZE(ltk035c5444t_modes),
@@ -1300,12 +1485,24 @@ static const struct nv3052c_panel_info ylm_lbv0400001x_v1_panel_info = {
 	.panel_regs_len = ARRAY_SIZE(ylm_lbv0400001x_v1_panel_regs),
 };
 
+static const struct nv3052c_panel_info ylm_lbn0395004h_v1_panel_info = {
+	.display_modes = ylm_lbn0395004h_v1_mode,
+	.num_modes = ARRAY_SIZE(ylm_lbn0395004h_v1_mode),
+	.width_mm = 71,
+	.height_mm = 71,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.panel_regs = ylm_lbn0395004h_v1_panel_regs,
+	.panel_regs_len = ARRAY_SIZE(ylm_lbn0395004h_v1_panel_regs),
+};
+
 static const struct spi_device_id nv3052c_ids[] = {
 	{ "ltk035c5444t", },
 	{ "fs035vg158", },
 	{ "rg35xx-plus-panel", },
 	{ "rg35xx-plus-rev6-panel", },
 	{ "rg40xx-panel", },
+	{ "rgcubexx-panel", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, nv3052c_ids);
@@ -1316,6 +1513,7 @@ static const struct of_device_id nv3052c_of_match[] = {
 	{ .compatible = "anbernic,rg35xx-plus-panel", .data = &wl_355608_a8_panel_info },
 	{ .compatible = "anbernic,rg35xx-plus-rev6-panel", .data = &ylm_lbv0345001h_v2_panel_info },
 	{ .compatible = "anbernic,rg40xx-panel", .data = &ylm_lbv0400001x_v1_panel_info },
+	{ .compatible = "anbernic,rgcubexx-panel", .data = &ylm_lbn0395004h_v1_panel_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, nv3052c_of_match);
-- 
2.47.0

