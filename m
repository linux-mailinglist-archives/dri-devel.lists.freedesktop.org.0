Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E72AAA55AD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 22:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048B510E140;
	Wed, 30 Apr 2025 20:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EgQl4lMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B8610E131
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 20:41:20 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so211597f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746045679; x=1746650479; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2bD+5Ge0wy18N6igG01fWsd9reTR5MEu7i4o/NGqbgM=;
 b=EgQl4lMo3KTqxUbATB2BQ/1AhOBOD+ftds+yVq8lEb8ZS+3KhGYiur5PGDRL1QbOfl
 0QxM1fVXxsFftGUdcsE77Bv8QOlXqOOs4HW6u2r9hPpieb1GBFRbpL3i+i7qGH79tTQi
 dJgAVUyIvCp8lnSVKACsl9wfNzvrEPmOvdWMCEgQB+9XPk18dr/Ednofje9WErvIDnXQ
 iTf4JkdAGFOspuXzMGplDsXhS+1qhDOFBMjkfE1RCquqX51c0uLpAD+vjwPIGo1igxjy
 nlhhbme8kPSIO6CEwkSl0DSvbUOSUh5k1F0g8vQ96XVA188+guWRtAsr1iGJ/J0inAbG
 JCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746045679; x=1746650479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2bD+5Ge0wy18N6igG01fWsd9reTR5MEu7i4o/NGqbgM=;
 b=SdZxB72WMSK3yrbRViAL+JR3rZJfj8LT3RR2IbmTfc+Atbt31rZUxT4Oj7BCCgzzAT
 GlnrK0B0c+dF6JgHDUwAPOO/ZksoXQsPQ1reUDCZtx1CWNsscjVFNCEkFmK4Rmo7S7a2
 OxIVnhCFOh0zjlaVQHPJIWrv3PmD+zbiBS9HHDeET2JGWvNUJCCVGR04fFHjqwGSH57C
 XFTDAQB6tEJcDj49u1Uat6pZv9MLUVk/ghFOlD8Vr5Ki9gxoRnOgu2VACj37YA0sjERB
 kq6nYFE8NC7/GMyy5giQeaCrPgFQTIHL0MjYjMRh9B8ff1+5NYRy71a2tGxpbmLChWtQ
 qDgQ==
X-Gm-Message-State: AOJu0YysdVoTuTW96fPxw9GxfDe/H3ZwRDmBDwm4M31mRZv7ebMNswf9
 5S5Fi0IWVUgdRSmD6WcntKvgFpLttjwNGn6HINER8GdPqi4WUh33
X-Gm-Gg: ASbGncuC2C+aqidmhxHT28oHrzk1qo/do/v/h1Ex6zMjk62KCsQkZSaU6UEZqwXj9A3
 +mvwuTGswywmifJIvmw6WSPn/SWSaKWk8RCikiwW9BRT0gk9HWSGxztZ9TrUZMvNM1BmzVyg4xJ
 UWXiyBIrRpaAAFOfDRKFgzBa2nMGYH66IXjbIJIoZ6bEbxbpThp5JyKOqQEOkjZTeJn7t3W2L1V
 ni1T5l2LtZnwI/6zARaBrP27+7dIlOWGEuDYIsylFiVFtwUWjS2TJyC5VzITZIBuE7Q3d5nGPK0
 KjlyaiQUqusH0vOACjgYJan+eoI9m9i7TUqqFc8wIArjlWP8dYVFfEwHwtemh0nxNX3a2V+jhgw
 =
X-Google-Smtp-Source: AGHT+IEoopZWeXC3JQKBpZ3YqQIh+wnIf3C6wCzMDLPz5k37G7HGz219IR6a0JKqE+ZFEOyV48qZvA==
X-Received: by 2002:a05:6000:2282:b0:39e:f9e8:d07d with SMTP id
 ffacd0b85a97d-3a08f764d93mr4344288f8f.20.1746045679059; 
 Wed, 30 Apr 2025 13:41:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 13:41:18 -0700 (PDT)
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
Subject: [PATCH v4 02/15] clk: renesas: r9a09g057: Add clock and reset entries
 for DSI and LCDC
Date: Wed, 30 Apr 2025 21:40:59 +0100
Message-ID: <20250430204112.342123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add clock and reset entries for the DSI and LCDC peripherals.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No changes

v2->v3:
- Reverted CSDIV0_DIVCTL2() to use DDIV_PACK()
- Renamed plleth_lpclk_div4 -> cdiv4_plleth_lpclk
- Renamed plleth_lpclk -> plleth_lpclk_gear

v1->v2:
- Changed CSDIV0_DIVCTL2 to the NO_RMW
---
 drivers/clk/renesas/r9a09g057-cpg.c | 63 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  3 ++
 2 files changed, 66 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index da908e820950..a79b67181f11 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas-rzv2h-dsi.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -30,6 +31,7 @@ enum clk_ids {
 	CLK_PLLCA55,
 	CLK_PLLVDO,
 	CLK_PLLETH,
+	CLK_PLLDSI,
 	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
@@ -58,6 +60,9 @@ enum clk_ids {
 	CLK_SMUX2_GBE0_RXCLK,
 	CLK_SMUX2_GBE1_TXCLK,
 	CLK_SMUX2_GBE1_RXCLK,
+	CLK_DIV_PLLETH_LPCLK,
+	CLK_CSDIV_PLLETH_LPCLK,
+	CLK_PLLDSI_SDIV2,
 	CLK_PLLGPU_GEAR,
 
 	/* Module Clocks */
@@ -78,6 +83,26 @@ static const struct clk_div_table dtable_2_4[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_32[] = {
+	{0, 2},
+	{1, 4},
+	{2, 6},
+	{3, 8},
+	{4, 10},
+	{5, 12},
+	{6, 14},
+	{7, 16},
+	{8, 18},
+	{9, 20},
+	{10, 22},
+	{11, 24},
+	{12, 26},
+	{13, 28},
+	{14, 30},
+	{15, 32},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -94,6 +119,14 @@ static const struct clk_div_table dtable_2_100[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_16_128[] = {
+	{0, 16},
+	{1, 32},
+	{2, 64},
+	{3, 128},
+	{0, 0},
+};
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -113,6 +146,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
+	DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
@@ -148,6 +182,12 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
 	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
 	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
+	DEF_FIXED(".cdiv4_plleth_lpclk", CLK_DIV_PLLETH_LPCLK, CLK_PLLETH, 1, 4),
+	DEF_CSDIV(".plleth_lpclk_gear", CLK_CSDIV_PLLETH_LPCLK, CLK_DIV_PLLETH_LPCLK,
+		  CSDIV0_DIVCTL2, dtable_16_128),
+
+	DEF_PLLDSI_DIV(".plldsi_sdiv2", CLK_PLLDSI_SDIV2, CLK_PLLDSI,
+		       CSDIV1_DIVCTL2, dtable_2_32),
 
 	DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
 
@@ -319,6 +359,22 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(7))),
 	DEF_MOD("cru_3_pclk",			CLK_PLLDTY_DIV16, 13, 13, 6, 29,
 						BUS_MSTOP(9, BIT(7))),
+	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_vclk1",			CLK_PLLDSI_SDIV2, 14, 10, 7, 10,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_lpclk",			CLK_CSDIV_PLLETH_LPCLK, 14, 11, 7, 11,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("lcdc_0_clk_a",			CLK_PLLDTY_ACPU_DIV2, 14, 13, 7, 13,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
+	DEF_MOD("lcdc_0_clk_p",			CLK_PLLDTY_DIV16, 14, 14, 7, 14,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
+	DEF_MOD("lcdc_0_clk_d",			CLK_PLLDSI_SDIV2, 14, 15, 7, 15,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
 	DEF_MOD("gpu_0_clk",			CLK_PLLGPU_GEAR, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("gpu_0_axi_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -380,11 +436,16 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(12, 14, 5, 31),		/* CRU_3_PRESETN */
 	DEF_RST(12, 15, 6, 0),		/* CRU_3_ARESETN */
 	DEF_RST(13, 0, 6, 1),		/* CRU_3_S_RESETN */
+	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
+	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
+	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
 	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
 };
 
+RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
+
 const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
 	/* Core Clocks */
 	.core_clks = r9a09g057_core_clks,
@@ -402,4 +463,6 @@ const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
 	.num_resets = ARRAY_SIZE(r9a09g057_resets),
 
 	.num_mstop_bits = 192,
+
+	.plldsi_limits = &rzv2h_cpg_pll_dsi_limits,
 };
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index acae042fdf5b..b402b04ff050 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -28,6 +28,7 @@ struct pll {
 	})
 
 #define PLLCA55		PLL_PACK(0x60, 1)
+#define PLLDSI		PLL_PACK(0xc0, 1)
 #define PLLGPU		PLL_PACK(0x120, 1)
 
 /**
@@ -117,6 +118,8 @@ struct smuxed {
 
 #define CSDIV0_DIVCTL0	DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL1	DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
+#define CSDIV0_DIVCTL2	DDIV_PACK(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)
+#define CSDIV1_DIVCTL2	DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
 
 #define SSEL0_SELCTL2	SMUX_PACK(CPG_SSEL0, 8, 1)
 #define SSEL0_SELCTL3	SMUX_PACK(CPG_SSEL0, 12, 1)
-- 
2.49.0

