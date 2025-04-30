Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784B5AA55C2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 22:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F9E10E802;
	Wed, 30 Apr 2025 20:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QLFC81pV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DDD10E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 20:41:31 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-39c1ef4acf2so179354f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746045690; x=1746650490; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjeGEHFhQrwReOhsdL4NgFWDff3mxawseiq2vCwBk4w=;
 b=QLFC81pVjkH3Zwrh4tN071S93Lm2d3LtxcazXGg+HthZRQosBnxlXl+/YC+sBW+q/W
 y5x7lOXEI39UJ7ik19XjoZX5X2E28eZQgld9hCZkPpxWkAW9J0KFh6mTez5ke5Sd9dVz
 QTUwN0qYDtNly8WNQN+z9Mxwy5xQDUvBtRoVvUX6mn1ultpJC7aV1pyVE0rQH1D5IOS5
 ezgLMAib5PkSArk97x0X78z0ynhacCq1eww5yZgNTPMMekAwqObTESCUuRli+dS0Nea1
 F+Jy0wo+N8BJ58V+CFi9x+YJS/RUG19+hJFPbrBzRNoQQlP1eqKPFWNoyeOxYFU3C/t0
 huLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746045690; x=1746650490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjeGEHFhQrwReOhsdL4NgFWDff3mxawseiq2vCwBk4w=;
 b=eTwPskfCL43UoUAn2xuiHUvoQA8xHofcESYRYVjCg7bRfSRnszQYut5LJVUPM+mlkH
 ULfhAyKx9rOtSDwHWeC0kxJDUOs1OeMVBhtOtq+/xacIr6bPloUPARLkTB/owVph7Ys2
 OMdQuX5Pw8AQiL4ymfErwraqmp9foIte6iZmY4LqBbozhcpAY7XwHEPSt34NHkJ7A0pb
 MRJt8qfMbrLmXCEZ1H7dJVsNQfQrf5VTS+ADUadExxvdN/tdugP3Bs433pWKMXgDY2As
 SVNY2zrC1OXYz8zVCmkJPXIhD0EG4ILauxqXGvTa7jo053yaT19+XY0eIw4BH87Usjxc
 JMEg==
X-Gm-Message-State: AOJu0YzX/r4rYS0OhItl3x3K+qfqx1xFHikJrvAzsiddwAzN0el/2yvI
 Crs+hYO75XEovXzkEjS+kLkhC0ogkr1ttrcD6Pj+hYfhYA2+VCLp
X-Gm-Gg: ASbGncsrcCQvp428E8DuGbeE6Zz5Wyf0tz/b2rvGEalW7s8d7xt/kb2jJbngLIfwIdl
 T9QeJB4dKmsC5HPFXTuRSlLPgb5iQz1ljtecAdTr+R2hlf0XKp9z4RSx5jqD8IlLKY6eEdjE7o2
 V6gwBwWGWJwMohmqw68dY9yiVVHAW5ZxY5wXdKP4enynWrbpNtwWQRm16PdNH2W8HirljkWHGni
 2VacfuMQPR/b7LrAEqRbjWL96IzweVuf11+WJO8czOlN2rFLcZ1mXdUxr4/NV22B84e/0iIflba
 OQcn88wSyaIB+SxelGQbM7qvYuR1Og92YB3RfIiK8J3PAxnjKEF/3e2u+BEvXTFVAWzm+oiKx9o
 =
X-Google-Smtp-Source: AGHT+IGqhYGb+EftLhll49pvj3i+SCNYO3DMsEER3+g1HHBc8aDZKCP96zTu6RJGkUAISRfoTnMojg==
X-Received: by 2002:a5d:64cb:0:b0:3a0:7a5d:bc01 with SMTP id
 ffacd0b85a97d-3a08f79d2demr4724264f8f.13.1746045689487; 
 Wed, 30 Apr 2025 13:41:29 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 13:41:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
Date: Wed, 30 Apr 2025 21:41:07 +0100
Message-ID: <20250430204112.342123-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
high accuracy.

These changes prepare the driver for upcoming RZ/V2H(P) SoC support.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Used MILLI instead of KILO
- Made use of mul_u32_u32() for multiplication

v2->v3:
- Replaced `unsigned long long` with `u64`
- Replaced *_mhz with *_millihz` in functions

v1->v2:
- No changes
---
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ed259627f5e8..a4c0dbae4a46 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -33,7 +33,7 @@
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
-	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -203,8 +203,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
  */
 
 static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
-				    unsigned long hsfreq)
+				    u64 hsfreq_millihz)
 {
+	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	const struct rzg2l_mipi_dsi_timings *dphy_timings;
 	unsigned int i;
 	u32 dphyctrl0;
@@ -277,6 +278,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
 	unsigned long hsfreq, vclk_rate;
+	u64 hsfreq_millihz;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	vclk_rate = clk_get_rate(dsi->vclk);
-	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
+	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
 
-	ret = dsi->info->dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
 		goto err_phy;
 
@@ -315,6 +317,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
 	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
@@ -778,7 +781,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * MILLI);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0

