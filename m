Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2FCA8164A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DED610E733;
	Tue,  8 Apr 2025 20:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YJPKS0Qo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF35010E733
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:09:27 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso40370745e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744142966; x=1744747766; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g3eyyAWjmmAML6lRxFgVAO+7VQk9L/xmldc6ikAylKc=;
 b=YJPKS0QojSwoLR3yxOQCPG9XSKFGm4a4iKVNFtrXKqlW1X/tLx9t+rt4s7V8drekur
 YjLudfciKzKwkm5fJgJ6xs5HQnRqbNvsyDuRtUbq4fpSvFmwTywKnNsFL5vLf44SDKUx
 TYE77t/SpjbeEK/Z5Anx4vH5P0NLmXQDnOtIuIhJKJ+7UbZA7y3wBdMd32/jGm/cipoV
 DvxXFFsnjsLGfdxqxCBbKsq33YdanW1aA9JKylfIxytxNIKm57YIkQ0iTiqT1Kuu6flm
 xw+0/5fb1jeaA9SZr67pIn5JMvjGKtNfUVzfPTOkTfhQNHg0KmWpI7Ewz/DXI6IckMm9
 uhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744142966; x=1744747766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g3eyyAWjmmAML6lRxFgVAO+7VQk9L/xmldc6ikAylKc=;
 b=dLw+HBAzfc4b1W9tSLphePPqMwTh0Qw4AuqCMNU9rp3p2/CINvk3ny5v61u9MobXtt
 i4g3kerwbIViFYlkcIv03eNBrPjEjD35dGvBq3BauCKesZENrSKb9nzJDdg5IqTE+D8U
 e5g3i7ydGU0W1lR3a1ffPrPnclljsy7+iPqdby8qnAACOkFzWS4dmc4Lr4E95IX5zT/W
 SjePtR01NWAKdBRez7GGUgp8qAE+IKXOV2GYgi5tx5+FJyUzAyuhqWO8e9P6P8xacy2C
 N5hGz9zSNcHsEyo8pf+xndksPuFyM8DUT/igttP7tdOuyuYIR/vGhcL7rPxHP3DUqhbB
 cR5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbD4S2RPfoKM2mA3wucfY+fZ+tTaDbctaz3p4tJSJWBuLk/GnizD2yApVxlKKINPSfMPHk4fg8q6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwATPh5hViRw/Rl/1mCxLCapvtAPRPELrrtIst2PBBwSmJvtgkw
 aiVD0A7fkVYpl+GhMPktJl+IYiqsvAj2n3rrLUKpIhfg+R7OSEo6
X-Gm-Gg: ASbGnct1D2c2Bo0wamf4gloF4+XZzZyScYnU5CdaNUF7eCctlMFlzdkhgGz5nlT5El4
 PACRY3/edYPcRtO2KqJNhrdBfJ2LfS+rmy/eO/4ByWhL0OsX22V6GXKy1nwyB9MktXAvQP++3mH
 yGQa9mopeX26hfSp1BRxEFQ5lzd3Qfk8SkI86UF1Tzmm/Xj+647pUwbB5LUdLgfE6Ixh1LQGkhc
 kBRJsrsGFqUroOl6uf5K23O34D0Vx6oE3Y0qg7Vsh/HHhow8uljvzBFuYTViSjXxspRAgASEhtf
 +rHxfAkreXpGPnYvhU3bgq/pF741caCQWFFXRDKbF8gq1lrnFazFy0ys3iggo/Agkmw5
X-Google-Smtp-Source: AGHT+IF6A7HaQh8bNuMbk1KKkhSFvjF2Xo9AbudBUurouduywBc2yHOyTpmOlXP79PDSsm6uZ+qg/w==
X-Received: by 2002:a05:600c:501f:b0:43c:e9f7:d6a3 with SMTP id
 5b1f17b1804b1-43f1eca8152mr4054775e9.13.1744142965834; 
 Tue, 08 Apr 2025 13:09:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 13:09:25 -0700 (PDT)
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 01/15] clk: renesas: rzv2h-cpg: Add support for DSI clocks
Date: Tue,  8 Apr 2025 21:08:58 +0100
Message-ID: <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add support for PLLDSI and PLLDSI divider clocks.

The `renesas-rzv2h-dsi.h` header file is added to share the PLL divider
algorithm between the CPG and DSI drivers.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes
---
 drivers/clk/renesas/rzv2h-cpg.c       | 284 ++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h       |  14 ++
 include/linux/clk/renesas-rzv2h-dsi.h | 207 +++++++++++++++++++
 3 files changed, 505 insertions(+)
 create mode 100644 include/linux/clk/renesas-rzv2h-dsi.h

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index dca0940b3df9..3b4f520df627 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -14,9 +14,13 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas-rzv2h-dsi.h>
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
+#include <linux/math.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -26,6 +30,7 @@
 #include <linux/refcount.h>
 #include <linux/reset-controller.h>
 #include <linux/string_choices.h>
+#include <linux/units.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
 
@@ -48,6 +53,7 @@
 #define CPG_PLL_STBY(x)		((x))
 #define CPG_PLL_STBY_RESETB	BIT(0)
 #define CPG_PLL_STBY_RESETB_WEN	BIT(16)
+#define CPG_PLL_STBY_SSCGEN_WEN BIT(18)
 #define CPG_PLL_CLK1(x)		((x) + 0x004)
 #define CPG_PLL_CLK1_KDIV(x)	((s16)FIELD_GET(GENMASK(31, 16), (x)))
 #define CPG_PLL_CLK1_MDIV(x)	FIELD_GET(GENMASK(15, 6), (x))
@@ -79,6 +85,8 @@
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
  * @mstop_count: Array of mstop values
  * @rcdev: Reset controller entity
+ * @dsi_limits: PLL DSI parameters limits
+ * @plldsi_div_parameters: PLL DSI and divider parameters configuration
  */
 struct rzv2h_cpg_priv {
 	struct device *dev;
@@ -95,6 +103,9 @@ struct rzv2h_cpg_priv {
 	atomic_t *mstop_count;
 
 	struct reset_controller_dev rcdev;
+
+	const struct rzv2h_plldsi_div_limits *dsi_limits;
+	struct rzv2h_plldsi_parameters plldsi_div_parameters;
 };
 
 #define rcdev_to_priv(x)	container_of(x, struct rzv2h_cpg_priv, rcdev)
@@ -148,6 +159,24 @@ struct ddiv_clk {
 
 #define to_ddiv_clock(_div) container_of(_div, struct ddiv_clk, div)
 
+/**
+ * struct rzv2h_plldsi_div_clk - PLL DSI DDIV clock
+ *
+ * @dtable: divider table
+ * @priv: CPG private data
+ * @hw: divider clk
+ * @ddiv: divider configuration
+ */
+struct rzv2h_plldsi_div_clk {
+	const struct clk_div_table *dtable;
+	struct rzv2h_cpg_priv *priv;
+	struct clk_hw hw;
+	struct ddiv ddiv;
+};
+
+#define to_plldsi_div_clk(_hw) \
+	container_of(_hw, struct rzv2h_plldsi_div_clk, hw)
+
 static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
@@ -196,6 +225,253 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
 	return ret;
 }
 
+static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
+						      unsigned long parent_rate)
+{
+	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
+	struct rzv2h_cpg_priv *priv = dsi_div->priv;
+	struct ddiv ddiv = dsi_div->ddiv;
+	u32 div;
+
+	div = readl(priv->base + ddiv.offset);
+	div >>= ddiv.shift;
+	div &= ((2 << ddiv.width) - 1);
+
+	div = dsi_div->dtable[div].div;
+
+	return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
+}
+
+static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
+					       struct clk_rate_request *req)
+{
+	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
+	struct rzv2h_cpg_priv *priv = dsi_div->priv;
+	struct rzv2h_plldsi_parameters *dsi_dividers = &priv->plldsi_div_parameters;
+	unsigned long long rate_mhz;
+
+	/*
+	 * Adjust the requested clock rate (`req->rate`) to ensure it falls within
+	 * the supported range of 5.44 MHz to 187.5 MHz.
+	 */
+	req->rate = clamp(req->rate, 5440000UL, 187500000UL);
+
+	rate_mhz = req->rate * MILLI * 1ULL;
+	if (rate_mhz == dsi_dividers->error_mhz + dsi_dividers->freq_mhz)
+		goto exit_determine_rate;
+
+	if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
+						 dsi_dividers, rate_mhz)) {
+		dev_err(priv->dev,
+			"failed to determine rate for req->rate: %lu\n",
+			req->rate);
+		return -EINVAL;
+	}
+
+exit_determine_rate:
+	req->best_parent_rate = req->rate * dsi_dividers->csdiv;
+
+	return 0;
+};
+
+static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
+					 unsigned long rate,
+					 unsigned long parent_rate)
+{
+	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
+	struct rzv2h_cpg_priv *priv = dsi_div->priv;
+	struct rzv2h_plldsi_parameters *dsi_dividers = &priv->plldsi_div_parameters;
+	struct ddiv ddiv = dsi_div->ddiv;
+	const struct clk_div_table *clkt;
+	u32 reg, shift, div;
+
+	div = dsi_dividers->csdiv;
+	for (clkt = dsi_div->dtable; clkt->div; clkt++) {
+		if (clkt->div == div)
+			break;
+	}
+
+	if (!clkt->div && !clkt->val)
+		return -EINVAL;
+
+	shift = ddiv.shift;
+	reg = readl(priv->base + ddiv.offset);
+	reg &= ~(GENMASK(shift + ddiv.width, shift));
+
+	writel(reg | (clkt->val << shift) |
+	       DDIV_DIVCTL_WEN(shift), priv->base + ddiv.offset);
+
+	return 0;
+};
+
+static const struct clk_ops rzv2h_cpg_plldsi_div_ops = {
+	.recalc_rate = rzv2h_cpg_plldsi_div_recalc_rate,
+	.determine_rate = rzv2h_cpg_plldsi_div_determine_rate,
+	.set_rate = rzv2h_cpg_plldsi_div_set_rate,
+};
+
+static struct clk * __init
+rzv2h_cpg_plldsi_div_clk_register(const struct cpg_core_clk *core,
+				  struct rzv2h_cpg_priv *priv)
+{
+	struct rzv2h_plldsi_div_clk *clk_hw_data;
+	struct clk **clks = priv->clks;
+	struct clk_init_data init;
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_hw *clk_hw;
+	int ret;
+
+	parent = clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+	clk_hw_data->ddiv = core->cfg.ddiv;
+	clk_hw_data->dtable = core->dtable;
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = &rzv2h_cpg_plldsi_div_ops;
+	init.flags = core->flag;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	clk_hw = &clk_hw_data->hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
+static long rzv2h_cpg_plldsi_round_rate(struct clk_hw *hw,
+					unsigned long rate,
+					unsigned long *parent_rate)
+{
+	return clamp(rate, 25000000UL, 375000000UL);
+}
+
+static unsigned long rzv2h_cpg_plldsi_clk_recalc_rate(struct clk_hw *hw,
+						      unsigned long parent_rate)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+	unsigned int val1, val2;
+	u64 rate;
+
+	val1 = readl(priv->base + CPG_PLL_CLK1(pll_clk->pll.offset));
+	val2 = readl(priv->base + CPG_PLL_CLK2(pll_clk->pll.offset));
+
+	rate = mul_u64_u32_shr(parent_rate, (CPG_PLL_CLK1_MDIV(val1) << 16) +
+			       CPG_PLL_CLK1_KDIV(val1), 16 + CPG_PLL_CLK2_SDIV(val2));
+
+	return DIV_ROUND_CLOSEST_ULL(rate, CPG_PLL_CLK1_PDIV(val1));
+}
+
+static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw,
+				     unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+	struct rzv2h_plldsi_parameters *dsi_dividers;
+	struct pll pll = pll_clk->pll;
+	u16 offset = pll.offset;
+	u32 val;
+	int ret;
+
+	/* Put PLL into standby mode */
+	writel(CPG_PLL_STBY_RESETB_WEN, priv->base + CPG_PLL_STBY(offset));
+	ret = readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
+					val, !(val & CPG_PLL_MON_LOCK),
+					100, 2000);
+	if (ret) {
+		dev_err(priv->dev, "Failed to put PLLDSI into standby mode");
+		return ret;
+	}
+
+	dsi_dividers = &priv->plldsi_div_parameters;
+	/* Output clock setting 1 */
+	writel((dsi_dividers->k << 16) | (dsi_dividers->m << 6) | (dsi_dividers->p),
+	       priv->base + CPG_PLL_CLK1(offset));
+
+	/* Output clock setting 2 */
+	val = readl(priv->base + CPG_PLL_CLK2(offset));
+	writel((val & ~GENMASK(2, 0)) | dsi_dividers->s,
+	       priv->base + CPG_PLL_CLK2(offset));
+
+	/* Put PLL to normal mode */
+	writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
+	       priv->base + CPG_PLL_STBY(offset));
+
+	/* PLL normal mode transition, output clock stability check */
+	ret = readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
+					val, (val & CPG_PLL_MON_LOCK),
+					100, 2000);
+	if (ret) {
+		dev_err(priv->dev, "Failed to put PLLDSI into normal mode");
+		return ret;
+	}
+
+	return 0;
+};
+
+static const struct clk_ops rzv2h_cpg_plldsi_ops = {
+	.recalc_rate = rzv2h_cpg_plldsi_clk_recalc_rate,
+	.round_rate = rzv2h_cpg_plldsi_round_rate,
+	.set_rate = rzv2h_cpg_plldsi_set_rate,
+};
+
+static struct clk * __init
+rzv2h_cpg_plldsi_clk_register(const struct cpg_core_clk *core,
+			      struct rzv2h_cpg_priv *priv)
+{
+	void __iomem *base = priv->base;
+	struct device *dev = priv->dev;
+	struct clk_init_data init;
+	const struct clk *parent;
+	const char *parent_name;
+	struct pll_clk *pll_clk;
+	int ret;
+
+	parent = priv->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
+	if (!pll_clk)
+		return ERR_PTR(-ENOMEM);
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = &rzv2h_cpg_plldsi_ops;
+	init.flags = 0;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	pll_clk->hw.init = &init;
+	pll_clk->pll = core->cfg.pll;
+	pll_clk->base = base;
+	pll_clk->priv = priv;
+
+	/* Disable SSC and turn on PLL clock when init */
+	writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB |
+	       CPG_PLL_STBY_SSCGEN_WEN, base + CPG_PLL_STBY(pll_clk->pll.offset));
+
+	ret = devm_clk_hw_register(dev, &pll_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pll_clk->hw.clk;
+}
+
 static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 						   unsigned long parent_rate)
 {
@@ -511,6 +787,12 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_SMUX:
 		clk = rzv2h_cpg_mux_clk_register(core, priv);
 		break;
+	case CLK_TYPE_PLLDSI:
+		clk = rzv2h_cpg_plldsi_clk_register(core, priv);
+		break;
+	case CLK_TYPE_PLLDSI_DIV:
+		clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
@@ -1050,6 +1332,8 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 	priv->last_dt_core_clk = info->last_dt_core_clk;
 	priv->num_resets = info->num_resets;
 
+	priv->dsi_limits = info->plldsi_limits;
+
 	for (i = 0; i < nclks; i++)
 		clks[i] = ERR_PTR(-ENOENT);
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index e730179d92aa..c4b67a56b805 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -100,6 +100,7 @@ struct smuxed {
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
 #define CPG_CSDIV0		(0x500)
+#define CPG_CSDIV1		(0x504)
 
 #define CDDIV0_DIVCTL1	DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
@@ -163,6 +164,8 @@ enum clk_types {
 	CLK_TYPE_PLL,
 	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
 	CLK_TYPE_SMUX,		/* Static Mux */
+	CLK_TYPE_PLLDSI,	/* PLLDSI */
+	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -190,6 +193,14 @@ enum clk_types {
 		 .num_parents = ARRAY_SIZE(_parent_names), \
 		 .flag = CLK_SET_RATE_PARENT, \
 		 .mux_flags = CLK_MUX_HIWORD_MASK)
+#define DEF_PLLDSI(_name, _id, _parent, _pll_packed) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI, .parent = _parent, .cfg.pll = _pll_packed)
+#define DEF_PLLDSI_DIV(_name, _id, _parent, _ddiv_packed, _dtable) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_DIV, \
+		 .cfg.ddiv = _ddiv_packed, \
+		 .dtable = _dtable, \
+		 .parent = _parent, \
+		 .flag = CLK_SET_RATE_PARENT)
 
 /**
  * struct rzv2h_mod_clk - Module Clocks definitions
@@ -301,6 +312,7 @@ struct rzv2h_reset {
  *
  * @num_mstop_bits: Maximum number of MSTOP bits supported, equivalent to the
  *		    number of CPG_BUS_m_MSTOP registers multiplied by 16.
+ * @plldsi_limits: PLL DSI parameters limits
  */
 struct rzv2h_cpg_info {
 	/* Core Clocks */
@@ -319,6 +331,8 @@ struct rzv2h_cpg_info {
 	unsigned int num_resets;
 
 	unsigned int num_mstop_bits;
+
+	const struct rzv2h_plldsi_div_limits *plldsi_limits;
 };
 
 extern const struct rzv2h_cpg_info r9a09g047_cpg_info;
diff --git a/include/linux/clk/renesas-rzv2h-dsi.h b/include/linux/clk/renesas-rzv2h-dsi.h
new file mode 100644
index 000000000000..ee8bae8b7375
--- /dev/null
+++ b/include/linux/clk/renesas-rzv2h-dsi.h
@@ -0,0 +1,207 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Renesas RZ/V2H(P) DSI CPG helper
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/limits.h>
+#include <linux/math.h>
+#include <linux/math64.h>
+#include <linux/units.h>
+
+#define OSC_CLK_IN_MEGA		(24 * MEGA)
+
+struct rzv2h_plldsi_div_limits {
+	struct {
+		u64 min;
+		u64 max;
+	} fvco;
+
+	struct {
+		u16 min;
+		u16 max;
+	} m;
+
+	struct {
+		u8 min;
+		u8 max;
+	} p;
+
+	struct {
+		u8 min;
+		u8 max;
+	} s;
+
+	struct {
+		s16 min;
+		s16 max;
+	} k;
+
+	struct {
+		u8 min;
+		u8 max;
+	} csdiv;
+};
+
+struct rzv2h_plldsi_parameters {
+	u64 freq_mhz;
+	s64 error_mhz;
+	u16 m;
+	s16 k;
+	u8 csdiv;
+	u8 p;
+	u8 s;
+};
+
+#define RZV2H_CPG_PLL_DSI_LIMITS(name)					\
+	static const struct rzv2h_plldsi_div_limits (name) = {		\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+		.csdiv = { .min = 2, .max = 32 },			\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA }	\
+	}								\
+
+/**
+ * rzv2h_dsi_get_pll_parameters_values - Finds the best combination of PLL parameters
+ * and divider value for a given frequency.
+ *
+ * @limits: Pointer to the structure containing the limits for the PLL parameters and
+ * divider values
+ * @pars: Pointer to the structure where the best calculated PLL parameters and divider
+ * values will be stored
+ * @freq: Target output frequency (in mHz)
+ *
+ * This function calculates the best set of PLL parameters (M, K, P, S) and divider
+ * value (CSDIV) to achieve the desired frequency.
+ * There is no direct formula to calculate the PLL parameters and the divider value,
+ * as it's an open system of equations, therefore this function uses an iterative
+ * approach to determine the best solution. The best solution is one that minimizes
+ * the error (desired frequency - actual frequency).
+ *
+ * Return: true if a valid set of divider values is found, false otherwise.
+ */
+static __maybe_unused bool
+rzv2h_dsi_get_pll_parameters_values(const struct rzv2h_plldsi_div_limits *limits,
+				    struct rzv2h_plldsi_parameters *pars,
+				    u64 freq_mhz)
+{
+	struct rzv2h_plldsi_parameters p, best;
+
+	/* Initialize best error to maximum possible value */
+	best.error_mhz = S64_MAX;
+
+	for (p.csdiv = limits->csdiv.min; p.csdiv <= limits->csdiv.max; p.csdiv += 2) {
+		for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
+			u32 fref = OSC_CLK_IN_MEGA / p.p;
+
+			for (p.s = limits->s.min; p.s <= limits->s.max; p.s++) {
+				u16 two_pow_s = 1 << p.s;
+				u16 divider = two_pow_s * p.csdiv;
+
+				for (p.m = limits->m.min; p.m <= limits->m.max; p.m++) {
+					u64 output_m, output_k_range;
+					s64 pll_k, output_k;
+					u64 fvco, output;
+
+					/*
+					 * The frequency generated by the combination of the
+					 * PLL + divider is calculated as follows:
+					 *
+					 * Freq = Ffout / csdiv
+					 *
+					 * With:
+					 * Ffout = Ffvco / 2^(pll_s)
+					 * Ffvco = (pll_m + (pll_k / 65536)) * Ffref
+					 * Ffref = 24MHz / pll_p
+					 *
+					 * Freq can also be rewritten as:
+					 * Freq = Ffvco / (2^(pll_s) * csdiv))
+					 *      = Ffvco / divider
+					 *      = (pll_m * Ffref) / divider + ((pll_k / 65536) * Ffref) / divider
+					 *      = output_m + output_k
+					 *
+					 * Every parameter has been determined at this point, but pll_k.
+					 * Considering that:
+					 * -32768 <= pll_k <= 32767
+					 * Then:
+					 * -0.5 <= (pll_k / 65536) < 0.5
+					 * Therefore:
+					 * -Ffref / (2 * divider) <= output_k < Ffref / (2 * divider)
+					 */
+
+					/* Compute output M component (in mHz) */
+					output_m = DIV_ROUND_CLOSEST_ULL(p.m * fref * 1000ULL,
+									 divider);
+					/* Compute range for output K (in mHz) */
+					output_k_range = DIV_ROUND_CLOSEST_ULL(fref * 1000ULL,
+									       divider * 2);
+					/*
+					 * No point in continuing if we can't achieve the
+					 * desired frequency
+					 */
+					if (freq_mhz <  (output_m - output_k_range) ||
+					    freq_mhz >= (output_m + output_k_range))
+						continue;
+
+					/*
+					 * Compute the K component
+					 *
+					 * Since:
+					 * Freq = output_m + output_k
+					 * Then:
+					 * output_k = Freq - output_m
+					 *          = ((pll_k / 65536) * Ffref) / divider
+					 * Therefore:
+					 * pll_k = (output_k * 65536 * divider) / Ffref
+					 */
+					output_k = freq_mhz - output_m;
+					pll_k = div64_s64(output_k * 65536ULL * divider, fref);
+					pll_k = DIV_S64_ROUND_CLOSEST(pll_k, 1000);
+
+					/* Validate K value within allowed limits */
+					if (pll_k < limits->k.min || pll_k > limits->k.max)
+						continue;
+
+					p.k = pll_k;
+
+					/* Compute (Ffvco * 65536) */
+					fvco = ((p.m * 65536ULL) + p.k) * fref;
+					if ((fvco < (limits->fvco.min * 65536ULL)) ||
+					    (fvco > (limits->fvco.max * 65536ULL)))
+						continue;
+
+					/* PLL_M component of (output * 65536 * PLL_P) */
+					output = p.m * 65536ULL * OSC_CLK_IN_MEGA;
+					/* PLL_K component of (output * 65536 * PLL_P) */
+					output += p.k * OSC_CLK_IN_MEGA;
+					/* Make it in mHz */
+					output *= 1000ULL;
+					output /= 65536ULL * p.p * divider;
+
+					p.error_mhz = freq_mhz - output;
+					p.freq_mhz = output;
+
+					/* If an exact match is found, return immediately */
+					if (p.error_mhz == 0) {
+						*pars = p;
+						return true;
+					}
+
+					/* Update best match if error is smaller */
+					if (abs(best.error_mhz) > abs(p.error_mhz))
+						best = p;
+				}
+			}
+		}
+	}
+
+	/* If no valid parameters were found, return false */
+	if (best.error_mhz == S64_MAX)
+		return false;
+
+	*pars = best;
+	return true;
+}
-- 
2.49.0

