Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EA0BE05FF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 21:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3500210E8C4;
	Wed, 15 Oct 2025 19:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GOyxDF5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6C010E8C4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 19:27:04 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-78118e163e5so1195192b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 12:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760556424; x=1761161224; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I7v9pHDAeOAq+Vk7Oo2eA1ARB6UJBIXPWUcJvji7JLc=;
 b=GOyxDF5m3TBMrFvfiSLMYuk4Y2InjMxXb13GsGgVzN8vZ+4m9BIaTLOogiMcodODbu
 T9UrBp+q++VFq/jOj3mcZbFpB7f6Ah7wiodQoqNomCm348TwYlQCjMMLaBcRDnt5bLbP
 1afQ2O1Fi5Uz/6XDxcOsqcny21Q0vTLwFlLNA0aGVnzYJf4/tJPOFRllFWWlNG+WRe0a
 II768FIMbjxPRtmVYf6E9n+d1e5tawQf3mgx3x7EwDw6CseoD6jdOfb3sddBhCLA5bKg
 5NY5Z7T9Kytp0dnKZy36MJdNPzg7QcKgZ+LxUVUjA6sg09FCHwL1eGDspeKSQFnseAry
 mrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760556424; x=1761161224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I7v9pHDAeOAq+Vk7Oo2eA1ARB6UJBIXPWUcJvji7JLc=;
 b=VSQzrYfJ9STc2OgqBoBekZULoGmZwBMZ8lcvxnEdOFkJ1BwAMUeF5kHGCnb26BTxvt
 psZ66psIfGN+nIqiDEwcMF3oHDCpjkmksX6HvUiLDaeIguqH3CIAFok0HtJd4iD+4njH
 ZmVjQEmpW42g8YHkfTTpMdLO0xXMmzGJMSLfWLTwTBo8cMxLeLsOx+IBkdxgGumrBBea
 ZC/uPUGrxEYzcwawdg5GXjB2WsfBNcaoB6K0WMCr/KPPhNto7TWU8+oLjCFmYhotEJKE
 A6bw/wA1R7EclWxtBPv/BgbQUS6iXDydeXd5IfwEtbMZLkRizqqWG7j+3oZME6WPctpG
 vKRA==
X-Gm-Message-State: AOJu0YzFEL4ItaZQerN0c3oWGlX1UQ0oMlHDfkvdrpirGcITOXUR+ikt
 fJfxQ7HVhj1qFLftIa37xTRoD768lejn9ZSOc9aYPu3YGWg/ENXLcOAN
X-Gm-Gg: ASbGncu/IvJ+t2XH2TqU79Nf8jW4xh2LtMx1lLM063BZdyzqP5nU5qH2I5YYHwPDXaw
 GeGJqtYPn4ttslHgKcrlIlSQ0kgQ9TBotPJwXlKp/5JuPHT/payVZzPVbwPIYed+9BBjpOqcpTZ
 qKXNJFwhgJ6evJZHzilyp/XS8ztcU6gsu4PMwyWQPQzuSD3v9Xgw31ZRSQMEIP+ZOg1L6B9Ubei
 aRu0M8+J9AOHrQa8cmh7GdhPg3xC+RMTsfvssLkpoLjuY1R/ba4XQHp9wcvj0Fx9OeLb4VoGiVe
 /ur6/7W0gr4fbIclB7gxC/kubHdmH3xAnpS/c6H4zbg1BOJlLu0cf+G8OGICEF2fVVRUKUMQHU0
 xbkIW8vVByCSUDI8/305JUkK94MnCHrV19UBPqe3sTQsxcDU/lpKm20kFOtu1peSX9vCpr9boGx
 ox/OGxf8fAkRlAXqkEN8wcu59KCPumoeBe
X-Google-Smtp-Source: AGHT+IHQZrSW7Bt7HEErdGXPJT7s1c8sc+ySvpTq2gcFKcHOQHcXAay/lKlxZ4wtY6mhHEwLa9O0Tw==
X-Received: by 2002:a17:902:ccc2:b0:288:5ce8:ea74 with SMTP id
 d9443c01a7336-290919d5364mr14751325ad.3.1760556424104; 
 Wed, 15 Oct 2025 12:27:04 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-290993102c9sm4427005ad.24.2025.10.15.12.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 12:27:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 4/7] clk: renesas: r9a09g057: Add clock and reset entries
 for DSI and LCDC
Date: Wed, 15 Oct 2025 20:26:08 +0100
Message-ID: <20251015192611.241920-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v10->v11:
- No changes.

v9->v10:
- No changes.

v8->v9:
- Updated to use renesas.h

v7->v8:
- Added reviewed-by tags from Geert and Biju

v6->v7:
- Dropped passing plldsi_limits

v5->v6:
- Renamed CLK_DIV_PLLETH_LPCLK to CLK_CDIV4_PLLETH_LPCLK
- Renamed CLK_CSDIV_PLLETH_LPCLK to CLK_PLLETH_LPCLK_GEAR
- Renamed CLK_PLLDSI_SDIV2 to CLK_PLLDSI_GEAR
- Renamed plldsi_sdiv2 to plldsi_gear

v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- Reverted CSDIV0_DIVCTL2() to use DDIV_PACK()
- Renamed plleth_lpclk_div4 -> cdiv4_plleth_lpclk
- Renamed plleth_lpclk -> plleth_lpclk_gear

v1->v2:
- Changed CSDIV0_DIVCTL2 to the NO_RMW
---
 drivers/clk/renesas/r9a09g057-cpg.c | 62 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  3 ++
 2 files changed, 65 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index c9c117c6782c..4d63eaad2365 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas.h>
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
@@ -64,6 +66,9 @@ enum clk_ids {
 	CLK_SMUX2_GBE0_RXCLK,
 	CLK_SMUX2_GBE1_TXCLK,
 	CLK_SMUX2_GBE1_RXCLK,
+	CLK_CDIV4_PLLETH_LPCLK,
+	CLK_PLLETH_LPCLK_GEAR,
+	CLK_PLLDSI_GEAR,
 	CLK_PLLGPU_GEAR,
 
 	/* Module Clocks */
@@ -92,6 +97,26 @@ static const struct clk_div_table dtable_2_16[] = {
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
@@ -108,6 +133,17 @@ static const struct clk_div_table dtable_2_100[] = {
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
+RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
+#define PLLDSI		PLL_PACK_LIMITS(0xc0, 1, 0, &rzv2h_cpg_pll_dsi_limits)
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -129,6 +165,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
+	DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
@@ -170,6 +207,12 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
 	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
 	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
+	DEF_FIXED(".cdiv4_plleth_lpclk", CLK_CDIV4_PLLETH_LPCLK, CLK_PLLETH, 1, 4),
+	DEF_CSDIV(".plleth_lpclk_gear", CLK_PLLETH_LPCLK_GEAR, CLK_CDIV4_PLLETH_LPCLK,
+		  CSDIV0_DIVCTL2, dtable_16_128),
+
+	DEF_PLLDSI_DIV(".plldsi_gear", CLK_PLLDSI_GEAR, CLK_PLLDSI,
+		       CSDIV1_DIVCTL2, dtable_2_32),
 
 	DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
 
@@ -381,6 +424,22 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(9))),
 	DEF_MOD("isp_0_isp_sclk",		CLK_PLLVDO_ISP, 14, 5, 7, 5,
 						BUS_MSTOP(9, BIT(9))),
+	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_vclk1",			CLK_PLLDSI_GEAR, 14, 10, 7, 10,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_lpclk",			CLK_PLLETH_LPCLK_GEAR, 14, 11, 7, 11,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("lcdc_0_clk_a",			CLK_PLLDTY_ACPU_DIV2, 14, 13, 7, 13,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
+	DEF_MOD("lcdc_0_clk_p",			CLK_PLLDTY_DIV16, 14, 14, 7, 14,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
+	DEF_MOD("lcdc_0_clk_d",			CLK_PLLDSI_GEAR, 14, 15, 7, 15,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
 	DEF_MOD("gpu_0_clk",			CLK_PLLGPU_GEAR, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("gpu_0_axi_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -456,6 +515,9 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(13, 2, 6, 3),		/* ISP_0_REG_ARESETN */
 	DEF_RST(13, 3, 6, 4),		/* ISP_0_ISP_SRESETN */
 	DEF_RST(13, 4, 6, 5),		/* ISP_0_PRESETN */
+	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
+	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
+	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
 	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index f7b4e4785d0f..dc957bdaf5e9 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -127,6 +127,7 @@ struct fixed_mod_conf {
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
 #define CPG_CSDIV0		(0x500)
+#define CPG_CSDIV1		(0x504)
 
 #define CDDIV0_DIVCTL1	DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
@@ -144,7 +145,9 @@ struct fixed_mod_conf {
 
 #define CSDIV0_DIVCTL0	DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL1	DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
+#define CSDIV0_DIVCTL2	DDIV_PACK(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL3	DDIV_PACK_NO_RMW(CPG_CSDIV0, 12, 2, CSDIV_NO_MON)
+#define CSDIV1_DIVCTL2	DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
 
 #define SSEL0_SELCTL2	SMUX_PACK(CPG_SSEL0, 8, 1)
 #define SSEL0_SELCTL3	SMUX_PACK(CPG_SSEL0, 12, 1)
-- 
2.43.0

