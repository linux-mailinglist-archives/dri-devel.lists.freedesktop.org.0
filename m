Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E07E278CA8C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C8C10E400;
	Tue, 29 Aug 2023 17:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0211010E3EC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:30 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ba1e9b1fa9so71250641fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329449; x=1693934249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNxQT2nW9mlsSDnVrDv6HQBpykI5WwmT69S9mmtvT8k=;
 b=rIZufC/gg1cYUNWmECI/46YrswF+nz0k1qq+H1hHISIBeklCOGZL8h2zth49s1RZVn
 eMS3vy1eFt2ISgqitOHnd4xuxo8+iIWNjZlqmvBCCd87J02vlKd9Zv2ixpmsy3+NU0X9
 E6adDktPfEsTttBTxou7dNp3mYCHJNgYXp560go1foEMofcjlXypG662p63Ig8m3cmIh
 UFn69k7Ma5DeluYhdc/QnbUg7APs4PdqWBW62MJ5Ot0JzD4YKKxqVIb5DHUgpvEQGy3r
 mpTSAiIAR3NgLP3rxocc0Zn+PefKtU9K8u1OLjR5xxIB3SeSayWFc+RP4TW8MGuVV22m
 +lag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329449; x=1693934249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNxQT2nW9mlsSDnVrDv6HQBpykI5WwmT69S9mmtvT8k=;
 b=bOdXmOO4Hl5envhwQ38kgZNJcnF83JN2ktVXsZbx63Qc/aBx/nwJOiBrWBWdQNk2hJ
 O7Y6Jj0W19MHA70l+fShYKQTe4xSyngxN+XEocPaTLitHEuA60F+Geyyw0FmzLNJCuzF
 SARoniCF4PSac1l1F2b7LcPMcURDBCuN5RAhZ2s618iSHpHMNCvOrqeBjDm+UY4VD+NA
 2Zex+WwmBeAoAdfS71yKxvsF4rlKlc0k/U3Mg/n0yzHLPbumSCbl9udZQjOpLpVOZAW0
 xIeS/dshMmi8iNypGEiwQ8LhYHgh5XTRmMN+RLUF4t++bH/HZDaxmWcuq572c+dydz/k
 45sg==
X-Gm-Message-State: AOJu0Ywtwu4xU5C46/jY1ORvTIiwTJZA30l9LSKNXuizIcn1pGdqk8mQ
 4sUvG/U5NInl/LXNE0tqlw==
X-Google-Smtp-Source: AGHT+IEznm3zQlYtjDygMW1JWLcjCU2/3FhOjEydGc5ISDGtGkj+FNhlC7tDKoYprU72zEt2ma8PQg==
X-Received: by 2002:a2e:9b97:0:b0:2bc:b694:6d6e with SMTP id
 z23-20020a2e9b97000000b002bcb6946d6emr21085768lji.27.1693329449142; 
 Tue, 29 Aug 2023 10:17:29 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:28 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 05/31] clk: rockchip: rk3128: Fix aclk_peri_src parent
Date: Tue, 29 Aug 2023 19:16:21 +0200
Message-ID: <20230829171647.187787-6-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, Finley Xiao <finley.xiao@rock-chips.com>,
 linux-phy@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Finley Xiao <finley.xiao@rock-chips.com>

According to the TRM there are no specific cpll_peri, gpll_div2_peri or
gpll_div3_peri gates, but a single clk_peri_src gate and the peri mux
directly connects to the plls respectivly the pll divider clocks.
Fix this by creating a single gated composite.

Also rename all occurrences of "aclk_peri_src*" to clk_peri_src, since it
is the parent for both peri aclks and hclks and that also matches the
naming in the TRM.

Fixes: f6022e88faca ("clk: rockchip: add clock controller for rk3128")
Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
[renamed aclk_peri_src -> clk_peri_src and added commit message]
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/clk/rockchip/clk-rk3128.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index aa53797dbfc1..fcacfe758829 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -138,7 +138,7 @@ PNAME(mux_pll_src_5plls_p)	= { "cpll", "gpll", "gpll_div2", "gpll_div3", "usb480
 PNAME(mux_pll_src_4plls_p)	= { "cpll", "gpll", "gpll_div2", "usb480m" };
 PNAME(mux_pll_src_3plls_p)	= { "cpll", "gpll", "gpll_div2" };
 
-PNAME(mux_aclk_peri_src_p)	= { "gpll_peri", "cpll_peri", "gpll_div2_peri", "gpll_div3_peri" };
+PNAME(mux_clk_peri_src_p)	= { "gpll", "cpll", "gpll_div2", "gpll_div3" };
 PNAME(mux_mmc_src_p)		= { "cpll", "gpll", "gpll_div2", "xin24m" };
 PNAME(mux_clk_cif_out_src_p)		= { "clk_cif_src", "xin24m" };
 PNAME(mux_sclk_vop_src_p)	= { "cpll", "gpll", "gpll_div2", "gpll_div3" };
@@ -275,23 +275,17 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 			RK2928_CLKGATE_CON(0), 11, GFLAGS),
 
 	/* PD_PERI */
-	GATE(0, "gpll_peri", "gpll", CLK_IGNORE_UNUSED,
+	COMPOSITE(0, "clk_peri_src", mux_clk_peri_src_p, 0,
+			RK2928_CLKSEL_CON(10), 14, 2, MFLAGS, 0, 5, DFLAGS,
 			RK2928_CLKGATE_CON(2), 0, GFLAGS),
-	GATE(0, "cpll_peri", "cpll", CLK_IGNORE_UNUSED,
-			RK2928_CLKGATE_CON(2), 0, GFLAGS),
-	GATE(0, "gpll_div2_peri", "gpll_div2", CLK_IGNORE_UNUSED,
-			RK2928_CLKGATE_CON(2), 0, GFLAGS),
-	GATE(0, "gpll_div3_peri", "gpll_div3", CLK_IGNORE_UNUSED,
-			RK2928_CLKGATE_CON(2), 0, GFLAGS),
-	COMPOSITE_NOGATE(0, "aclk_peri_src", mux_aclk_peri_src_p, 0,
-			RK2928_CLKSEL_CON(10), 14, 2, MFLAGS, 0, 5, DFLAGS),
-	COMPOSITE_NOMUX(PCLK_PERI, "pclk_peri", "aclk_peri_src", 0,
+
+	COMPOSITE_NOMUX(PCLK_PERI, "pclk_peri", "clk_peri_src", 0,
 			RK2928_CLKSEL_CON(10), 12, 2, DFLAGS | CLK_DIVIDER_POWER_OF_TWO,
 			RK2928_CLKGATE_CON(2), 3, GFLAGS),
-	COMPOSITE_NOMUX(HCLK_PERI, "hclk_peri", "aclk_peri_src", 0,
+	COMPOSITE_NOMUX(HCLK_PERI, "hclk_peri", "clk_peri_src", 0,
 			RK2928_CLKSEL_CON(10), 8, 2, DFLAGS | CLK_DIVIDER_POWER_OF_TWO,
 			RK2928_CLKGATE_CON(2), 2, GFLAGS),
-	GATE(ACLK_PERI, "aclk_peri", "aclk_peri_src", 0,
+	GATE(ACLK_PERI, "aclk_peri", "clk_peri_src", 0,
 			RK2928_CLKGATE_CON(2), 1, GFLAGS),
 
 	GATE(SCLK_TIMER0, "sclk_timer0", "xin24m", 0,
-- 
2.42.0

