Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512FEA93DA6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201F710E265;
	Fri, 18 Apr 2025 18:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GUaKoDiW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E884710E261
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:47:10 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-39c14016868so2025479f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745002029; x=1745606829; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmkzWK4kNUdhx63p0ccIK1qI2zvB9zaGAIl1LMk1yns=;
 b=GUaKoDiWtWM79+5S47yqHvQl/+81fxHBZTtvUP9lAwKc8B0S1msC7JQd+Gi8Z/CM1K
 ADYd9daao/cRUG7QzFVmCoL4dPevcV97fsROPi3YFCKZ44SHmbBRWuxeDaCpYV2t2cCA
 mrRt2LQl7GP+Nmiut31qXUqsPk1yfS0Mf1xDtA/IuzKLI5d1gpJRlBQl/eV8+hxN+BIn
 F87fClRU5qkw7o35bUFnU4ZcmaKx0tp1Nedo0bsCCK11TUZNuSHiZhBu/RIIsURaldSq
 1vm8+di+O8giRthe3LWRU9QvpVltpHYtBuJY59Ls95QUb9a9RJPfxbfTxf7ffpLSPofP
 NOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745002029; x=1745606829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lmkzWK4kNUdhx63p0ccIK1qI2zvB9zaGAIl1LMk1yns=;
 b=pl/8v1KsdUVSB9b9fj8/BLs67SZKH8YZ0R9WMvudHtnCC+AQU+WwngB9jpSB8l5moy
 x339oleSTOh8RZDNmuphDhCDJUpVG7qfQkZ5agMe8UFD0Nl5UVkbFabQ5v5PgfBvrwfZ
 lo0VoQJeJ1mBnv/XYFcIEKEr17jKfbbZ7tsd94o7bN8zZgB0xepMScf3ZBhxxfZ1hNi2
 0AD13vWobumAk2+8LJvqgDcnlOT1QTbGcPPMj5E7eGemKakwA+u0cXLPmElpBZJ089nz
 g0Xby26WaxBWOf1aytdaXwI6ShM/xfQ9tJSqjEwwTWyw4clHD0Rxilya6RiMegsURWmu
 CqIg==
X-Gm-Message-State: AOJu0YztN2msh6kBwYsvpqVvz9ZSXhLSji2eevdlYtsHzlYJ7PaCcjFF
 DmC7+T0xMfSQWsBQpblTRU+0TOUWvs+dnMbMb/JqG9BfO5f5fE8h
X-Gm-Gg: ASbGncvQjOvZsAzDMuIlNCW6npnDI7FUvShDzMSz/25tmMIX/j3+SQ+bSnjUJuaCU3A
 2xse6StcVf1O7TGZABB8Ifq2nYak4bb8bII5n2bVIaOWyELxKzcPu4/6HtOTCQHlddc/H4PDk10
 IYueWmGTzdnVxEnRqNKo8boE1S4b+K23Agex0p8H012FhDYO4MkG3IPUetfUizTRmJSoImMHp5d
 9dcZtkuxLfR7IEMtvujkuPZH6A4jWSte6zhSu5ENVrzIX08jq4xp8+u7fR5AolIobe4Gd6c/lcG
 ctLxAvvCjreRQOrCMU+RTuGEYZtrZXSsXo7Y90quLB1DG8cu0LdpUfdGMbeiDbBk4A==
X-Google-Smtp-Source: AGHT+IG2jg9Qemh+F1q2RnoYgu8uC3C4tT5LTHuNH+nLb35i7FaPCJVQ1TpqMco36WCELH7Gum1AEw==
X-Received: by 2002:a05:6000:4201:b0:391:456b:6ab7 with SMTP id
 ffacd0b85a97d-39efba5db9bmr2713384f8f.34.1745002029098; 
 Fri, 18 Apr 2025 11:47:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:47:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v3 02/15] clk: renesas: r9a09g057: Add clock and reset entries
 for DSI and LCDC
Date: Fri, 18 Apr 2025 19:46:45 +0100
Message-ID: <20250418184658.456398-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 057bfa0e2a57..dcd84cda4aff 100644
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
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0-rxc-rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0-txc-txclk" };
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
 
@@ -327,6 +367,22 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
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
@@ -388,11 +444,16 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
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
@@ -410,4 +471,6 @@ const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
 	.num_resets = ARRAY_SIZE(r9a09g057_resets),
 
 	.num_mstop_bits = 192,
+
+	.plldsi_limits = &rzv2h_cpg_pll_dsi_limits,
 };
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 5cdb0f67852e..2ae409fd65a3 100644
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

