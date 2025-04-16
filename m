Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE92FA8B546
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC88E10E8AB;
	Wed, 16 Apr 2025 09:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CFE10E8AB
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 09:27:19 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-524168b16d3so5662211e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 02:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744795638; x=1745400438;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tPBOJO5UG+x/dngfvQ5zlWtvDGsvqEQXdZ75xyrthRw=;
 b=uDG98UIPauzSivklTi3C8yr3oL+zQZYLAHZTzMdqpUOV7OE+TY+gwZrmRXOhqatXCr
 h3wmdkcxMo1wOdC5G4VLyHEXsy88sxOF/0TY/DNgKIFY3/dmkn+n8BwLLaznLhJpJ+pz
 upVxOh4pokjNULRrz7KAkyZbJcOzYzXcheHZQOhQYEDbeDTNRjJc78rmlJrFWuX3sl3R
 GKmfORmNe3RRwXLP1/3y2AvruYfUCsY/UXnBAhPXF7DEVxUnjLWiRXM/YrSg8Hq/SLwT
 13vv69mjSf263Ek0pwwUFu/5aMSxylN0SQET9l2UMwTEwCmS5mMxu0cnoNSrHMLIzqIE
 Xttw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgySOv0LtWsgxvCR8ljWC/1BzIc/0BIRY/nm6dKY/hZ0vT9GBkAtICmWGqe+PtrlDRxY+ZPz3msbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCb5xHFpe3CxcAHIf45WwTnu6kfZxfl3Q2DVccVEua3UnLxV3P
 JgrMCkxnH5NpK1uzYVQvWhaA2xy69QE2e3Fuc25Z2MVzVNN3wmFhETXYzfrT
X-Gm-Gg: ASbGnctYPxOL+iTLUfav2ZAI1nh8VXDnIhX5iJL2jrtm+C5DyXLS7LoKhpWttjPvk1/
 V0shvPQ4WWy9Uhy45jrl6RYMq54GH6NQHreD1s8F9lZKQnXfGkGtXpKu6E3nKjqvd7xIEcQqixk
 fCS6xUXZPKn6JSI9Jl7PMAGLSKIVnMJQCUF7pxwCzKYweaxH17B9SIcEsApL6kVuCZcj7K8r1Cd
 ySGZvQlWgNYzFB0dxYE32SFoExJO0uRBpZvCnallcS3G4CYZ/p0bCoxma+Im5tsoaiHJvf3u1a8
 Cc74md8xJzzjaCHjpFcesv06a3anqnJVXDtl0ZstdqhktZVlGrHzoTXAsGe164PeHhfCROAP76N
 u1zn1q5s=
X-Google-Smtp-Source: AGHT+IFa9wJ3v4Dmlt+ldHprfL68s5ATqsQhOstRpl6sGIj/++4R+MSaWMtw6ADHDg9d+OfM29x8Hw==
X-Received: by 2002:a05:6102:668:b0:4bb:c24b:b61a with SMTP id
 ada2fe7eead31-4cb592e4c4dmr287435137.19.1744795637512; 
 Wed, 16 Apr 2025 02:27:17 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-8755716eebesm3035596241.19.2025.04.16.02.27.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 02:27:17 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-51eb1818d4fso6888819e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 02:27:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVvzj8Ih4EFlrQQ3lmpjYsmFlmhz9wd3CDe92CRws27iIJXBaRP2IMY0Kf9DxoYfB+6WFpjvfAitIE=@lists.freedesktop.org
X-Received: by 2002:a05:6122:2a55:b0:520:6773:e5ba with SMTP id
 71dfb90a1353d-5290dd6d3f6mr493249e0c.2.1744795636873; Wed, 16 Apr 2025
 02:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 11:27:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjVEVh+dHKG_afZwyqsXwHj2FR7enHNrfuE9HJ0ELjEA@mail.gmail.com>
X-Gm-Features: ATxdqUHErCIXYLH43Ye7HXRW9FeYZxSAjZP0fHT2v6HHa72xBFJMLig-6M-q7Xg
Message-ID: <CAMuHMdVjVEVh+dHKG_afZwyqsXwHj2FR7enHNrfuE9HJ0ELjEA@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
To: Prabhakar <prabhakar.csengg@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Prabhakar, Fabrizio,

Thanks for your patch!

On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for PLLDSI and PLLDSI divider clocks.
>
> The `renesas-rzv2h-dsi.h` header file is added to share the PLL divider
> algorithm between the CPG and DSI drivers.

Please explain here why the DSI driver needs access to this algorithm.

> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> @@ -196,6 +225,253 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
>         return ret;
>  }
>
> +static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
> +                                                     unsigned long parent_rate)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       struct ddiv ddiv = dsi_div->ddiv;
> +       u32 div;
> +
> +       div = readl(priv->base + ddiv.offset);
> +       div >>= ddiv.shift;
> +       div &= ((2 << ddiv.width) - 1);

Shouldn't that "2" be "1"?
GENMASK(ddiv.width - 1, 0), or even better: clk_div_mask(ddiv.width).

> +
> +       div = dsi_div->dtable[div].div;
> +
> +       return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
> +}
> +
> +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> +                                              struct clk_rate_request *req)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       struct rzv2h_plldsi_parameters *dsi_dividers = &priv->plldsi_div_parameters;
> +       unsigned long long rate_mhz;

u64?
Please use "millihz" instead of "mhz" everywhere, so it becomes very
clear this is really "mHz" and not "MHz".

> +
> +       /*
> +        * Adjust the requested clock rate (`req->rate`) to ensure it falls within
> +        * the supported range of 5.44 MHz to 187.5 MHz.
> +        */
> +       req->rate = clamp(req->rate, 5440000UL, 187500000UL);
> +
> +       rate_mhz = req->rate * MILLI * 1ULL;
> +       if (rate_mhz == dsi_dividers->error_mhz + dsi_dividers->freq_mhz)
> +               goto exit_determine_rate;
> +
> +       if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> +                                                dsi_dividers, rate_mhz)) {
> +               dev_err(priv->dev,
> +                       "failed to determine rate for req->rate: %lu\n",
> +                       req->rate);
> +               return -EINVAL;
> +       }
> +
> +exit_determine_rate:
> +       req->best_parent_rate = req->rate * dsi_dividers->csdiv;
> +
> +       return 0;
> +};
> +
> +static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
> +                                        unsigned long rate,
> +                                        unsigned long parent_rate)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       struct rzv2h_plldsi_parameters *dsi_dividers = &priv->plldsi_div_parameters;
> +       struct ddiv ddiv = dsi_div->ddiv;
> +       const struct clk_div_table *clkt;
> +       u32 reg, shift, div;
> +
> +       div = dsi_dividers->csdiv;
> +       for (clkt = dsi_div->dtable; clkt->div; clkt++) {
> +               if (clkt->div == div)
> +                       break;
> +       }
> +
> +       if (!clkt->div && !clkt->val)
> +               return -EINVAL;

No need to check clkt->dev.

> +
> +       shift = ddiv.shift;
> +       reg = readl(priv->base + ddiv.offset);
> +       reg &= ~(GENMASK(shift + ddiv.width, shift));
> +
> +       writel(reg | (clkt->val << shift) |
> +              DDIV_DIVCTL_WEN(shift), priv->base + ddiv.offset);
> +
> +       return 0;

This function is very similar to the existing rzv2h_ddiv_set_rate().
If you can't re-use it as-is, please consider factoring out the common
part, or at least follow the same style of RMW-operation.

> +};


> +static long rzv2h_cpg_plldsi_round_rate(struct clk_hw *hw,
> +                                       unsigned long rate,
> +                                       unsigned long *parent_rate)
> +{
> +       return clamp(rate, 25000000UL, 375000000UL);

This only rounds rates outside the range from 25 to 375 MHz.
What about rates between 25 and 375 MHz?

> +}
> +
> +static unsigned long rzv2h_cpg_plldsi_clk_recalc_rate(struct clk_hw *hw,
> +                                                     unsigned long parent_rate)
> +{
> +       struct pll_clk *pll_clk = to_pll(hw);
> +       struct rzv2h_cpg_priv *priv = pll_clk->priv;
> +       unsigned int val1, val2;
> +       u64 rate;
> +
> +       val1 = readl(priv->base + CPG_PLL_CLK1(pll_clk->pll.offset));
> +       val2 = readl(priv->base + CPG_PLL_CLK2(pll_clk->pll.offset));
> +
> +       rate = mul_u64_u32_shr(parent_rate, (CPG_PLL_CLK1_MDIV(val1) << 16) +
> +                              CPG_PLL_CLK1_KDIV(val1), 16 + CPG_PLL_CLK2_SDIV(val2));
> +
> +       return DIV_ROUND_CLOSEST_ULL(rate, CPG_PLL_CLK1_PDIV(val1));

Can't you just reuse the existing rzv2h_cpg_pll_clk_recalc_rate()?

> +}
> +
> +static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw,
> +                                    unsigned long rate,
> +                                    unsigned long parent_rate)
> +{
> +       struct pll_clk *pll_clk = to_pll(hw);
> +       struct rzv2h_cpg_priv *priv = pll_clk->priv;
> +       struct rzv2h_plldsi_parameters *dsi_dividers;
> +       struct pll pll = pll_clk->pll;
> +       u16 offset = pll.offset;
> +       u32 val;
> +       int ret;
> +
> +       /* Put PLL into standby mode */
> +       writel(CPG_PLL_STBY_RESETB_WEN, priv->base + CPG_PLL_STBY(offset));
> +       ret = readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
> +                                       val, !(val & CPG_PLL_MON_LOCK),
> +                                       100, 2000);
> +       if (ret) {
> +               dev_err(priv->dev, "Failed to put PLLDSI into standby mode");
> +               return ret;
> +       }
> +
> +       dsi_dividers = &priv->plldsi_div_parameters;
> +       /* Output clock setting 1 */
> +       writel((dsi_dividers->k << 16) | (dsi_dividers->m << 6) | (dsi_dividers->p),
> +              priv->base + CPG_PLL_CLK1(offset));
> +
> +       /* Output clock setting 2 */
> +       val = readl(priv->base + CPG_PLL_CLK2(offset));
> +       writel((val & ~GENMASK(2, 0)) | dsi_dividers->s,
> +              priv->base + CPG_PLL_CLK2(offset));
> +
> +       /* Put PLL to normal mode */
> +       writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
> +              priv->base + CPG_PLL_STBY(offset));
> +
> +       /* PLL normal mode transition, output clock stability check */
> +       ret = readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
> +                                       val, (val & CPG_PLL_MON_LOCK),
> +                                       100, 2000);
> +       if (ret) {
> +               dev_err(priv->dev, "Failed to put PLLDSI into normal mode");
> +               return ret;
> +       }
> +
> +       return 0;

This function could be reused for non-DSI PLLs?

> +};
> +
> +static const struct clk_ops rzv2h_cpg_plldsi_ops = {
> +       .recalc_rate = rzv2h_cpg_plldsi_clk_recalc_rate,
> +       .round_rate = rzv2h_cpg_plldsi_round_rate,
> +       .set_rate = rzv2h_cpg_plldsi_set_rate,
> +};
> +
> +static struct clk * __init
> +rzv2h_cpg_plldsi_clk_register(const struct cpg_core_clk *core,
> +                             struct rzv2h_cpg_priv *priv)
> +{
> +       void __iomem *base = priv->base;
> +       struct device *dev = priv->dev;
> +       struct clk_init_data init;
> +       const struct clk *parent;
> +       const char *parent_name;
> +       struct pll_clk *pll_clk;
> +       int ret;
> +
> +       parent = priv->clks[core->parent];
> +       if (IS_ERR(parent))
> +               return ERR_CAST(parent);
> +
> +       pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
> +       if (!pll_clk)
> +               return ERR_PTR(-ENOMEM);
> +
> +       parent_name = __clk_get_name(parent);
> +       init.name = core->name;
> +       init.ops = &rzv2h_cpg_plldsi_ops;
> +       init.flags = 0;
> +       init.parent_names = &parent_name;
> +       init.num_parents = 1;
> +
> +       pll_clk->hw.init = &init;
> +       pll_clk->pll = core->cfg.pll;
> +       pll_clk->base = base;
> +       pll_clk->priv = priv;
> +
> +       /* Disable SSC and turn on PLL clock when init */
> +       writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB |
> +              CPG_PLL_STBY_SSCGEN_WEN, base + CPG_PLL_STBY(pll_clk->pll.offset));

Apart from the three lines above, this function does the same as the
existing rzv2h_cpg_pll_clk_register().  Merge/reuse?

> +
> +       ret = devm_clk_hw_register(dev, &pll_clk->hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return pll_clk->hw.clk;
> +}
> +
>  static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
>                                                    unsigned long parent_rate)
>  {

> --- /dev/null
> +++ b/include/linux/clk/renesas-rzv2h-dsi.h
> @@ -0,0 +1,207 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ/V2H(P) DSI CPG helper
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */

Missing include guard.

> +
> +#include <linux/limits.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/units.h>
> +
> +#define OSC_CLK_IN_MEGA                (24 * MEGA)
> +
> +struct rzv2h_plldsi_div_limits {

This structure looks applicable to all RZ/V2H PLLs, so perhaps drop the
"dsi" part from the name?

> +       struct {
> +               u64 min;
> +               u64 max;
> +       } fvco;
> +
> +       struct {
> +               u16 min;
> +               u16 max;
> +       } m;
> +
> +       struct {
> +               u8 min;
> +               u8 max;
> +       } p;
> +
> +       struct {
> +               u8 min;
> +               u8 max;
> +       } s;
> +
> +       struct {
> +               s16 min;
> +               s16 max;
> +       } k;
> +
> +       struct {
> +               u8 min;
> +               u8 max;
> +       } csdiv;
> +};
> +
> +struct rzv2h_plldsi_parameters {
> +       u64 freq_mhz;
> +       s64 error_mhz;
> +       u16 m;
> +       s16 k;
> +       u8 csdiv;
> +       u8 p;
> +       u8 s;
> +};
> +
> +#define RZV2H_CPG_PLL_DSI_LIMITS(name)                                 \
> +       static const struct rzv2h_plldsi_div_limits (name) = {          \
> +               .m = { .min = 64, .max = 533 },                         \
> +               .p = { .min = 1, .max = 4 },                            \
> +               .s = { .min = 0, .max = 6 },                            \
> +               .k = { .min = -32768, .max = 32767 },                   \
> +               .csdiv = { .min = 2, .max = 32 },                       \
> +               .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA }      \
> +       }                                                               \
> +
> +/**
> + * rzv2h_dsi_get_pll_parameters_values - Finds the best combination of PLL parameters
> + * and divider value for a given frequency.
> + *
> + * @limits: Pointer to the structure containing the limits for the PLL parameters and
> + * divider values
> + * @pars: Pointer to the structure where the best calculated PLL parameters and divider
> + * values will be stored
> + * @freq: Target output frequency (in mHz)
> + *
> + * This function calculates the best set of PLL parameters (M, K, P, S) and divider
> + * value (CSDIV) to achieve the desired frequency.
> + * There is no direct formula to calculate the PLL parameters and the divider value,
> + * as it's an open system of equations, therefore this function uses an iterative
> + * approach to determine the best solution. The best solution is one that minimizes
> + * the error (desired frequency - actual frequency).
> + *
> + * Return: true if a valid set of divider values is found, false otherwise.
> + */
> +static __maybe_unused bool
> +rzv2h_dsi_get_pll_parameters_values(const struct rzv2h_plldsi_div_limits *limits,
> +                                   struct rzv2h_plldsi_parameters *pars,
> +                                   u64 freq_mhz)
> +{

I haven't reviewed the heavy calculations yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
