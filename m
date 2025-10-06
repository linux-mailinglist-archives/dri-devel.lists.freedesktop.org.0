Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD27BBE18D
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 14:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE0310E406;
	Mon,  6 Oct 2025 12:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5411210E429
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 12:51:44 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-43f802f8712so2916451b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 05:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759755103; x=1760359903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ho6ZY8xNwM+EAsNC64leoQCnflv58g1Ah42jCSjX7S4=;
 b=EOo9GVFi+6+9uenJ/QIWNTV94IG8Gmir7/6EG2JmjmN+LJirZ9joZV/BqkKZtl2EL1
 8f7rTQAFAFBOVp0zA0gTtznJAJx/SKy3r7aXpNRWyM8xSX12eQio0jWVneggY9BySVUI
 avY9WoZSr6Ay2kDbF14bOWEUS8+L3jhiBpygcEvdz+R5f7Su3xWUy9pi/4XImfze1NT3
 GeB/1mgGq/HJKr16Zw0pCLYIuJlcbdParNG5WXMgc8XBfnzMwPRhpQT6TNare6Rn8la9
 WWIwY/qzIADPx48/z3ACziyTKe1HfydwSZ99PP+GG/xZXVx+56mJ+AWkwUbKm5GR9wiC
 9efQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/jXSxoMvNP5PYQHr8wHnSFYHTITgcT7LARSsE6oOP+4Lzy13QFUyYKmq/y4zrq5a5v8F/6TV84q8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yztv3igSPiyA1nRpKv+73vuHaHpd9+KvetZyD/uUUnnXCSCxCGt
 +sIgz43aKlBY6hAnxHEyBEPxyMlYIPc57ixySQnUft9YaveXg6RLmiMUYYZdYx0C
X-Gm-Gg: ASbGncvASEMha7WIfqDOfB9bTFf6U2XlTlm+8QFdHxxtGN0lDu5oABNjZRFanwreXUo
 rqpPzXv56WnfrIar1q8bjADa7a0FXGmuyzG0VzNUHLYh2b6JlDwLVzVg7KDMVNvhwh1t9gVgfUJ
 cSNvM0XKkl27Ce6K1VtqkukhuB60GvriCRCQSKZslz08Qq2Q2ospfsmijszwl2OpOUJtzqGLv4Z
 IIIxmWMuefZocq8BVwjmHJNC5RC1zb5nXW2stT0gnbDZ2xG0NWiRZHOKyAqGY1EYPp0yJbaND0I
 9sJok7yClBbWw1MIEuVDN0fSHJYn02qpeAP8BuVoztW/TBKoYUtyOhVc/d4ID8WYdD4bzsW/IdV
 sBihGTpVFMGsOFb+OHcyyyCuJQ1Bg81pECjioFVCbOnovFJ3mMMceh/AOevzJIq/AgoxAM/FITV
 gzzTRVz3vJ+e4dRXkTVYs=
X-Google-Smtp-Source: AGHT+IHUcFXbZeaL2ddKtTm3nDOuXpFi4ykRv5rVbFInvWGlrsLCzRXJt4jmEveuFhOUUO79Zp8yUw==
X-Received: by 2002:a05:6808:13c4:b0:43f:7dee:4693 with SMTP id
 5614622812f47-43fc179e294mr5197681b6e.14.1759755103124; 
 Mon, 06 Oct 2025 05:51:43 -0700 (PDT)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com.
 [209.85.161.44]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-43fb964edf8sm2642197b6e.3.2025.10.06.05.51.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 05:51:42 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-6418c6b8cbdso2615171eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 05:51:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUfOKIz5Hb/h0z7a5kWaFtG4XqudNRbapz7eak/+Tbttn3q1e9dgLBGi6lxGWA17gwm+7cQpE54B1U=@lists.freedesktop.org
X-Received: by 2002:a05:6102:8390:20b0:59c:110b:d09 with SMTP id
 ada2fe7eead31-5d41d119086mr2823864137.21.1759754700652; Mon, 06 Oct 2025
 05:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251002161728.186024-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251002161728.186024-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 14:44:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVP4xgsc6rD_Z6OMAXR-mOe9WdfZb2jXZSzDmXdgZzFSw@mail.gmail.com>
X-Gm-Features: AS18NWAKcswsGBx4X1VkXRPN2VpzHKv-APvKiuQzxFxRIZ_kWAvuysedQxbLQ04
Message-ID: <CAMuHMdVP4xgsc6rD_Z6OMAXR-mOe9WdfZb2jXZSzDmXdgZzFSw@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
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

Hi Prabhakar,

On Thu, 2 Oct 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for PLLDSI and its post-dividers in the RZ/V2H CPG driver and
> export helper APIs for use by the DSI driver.
>
> Introduce per-PLL-DSI state in the CPG private structure and provide a
> set of helper functions that find valid PLL parameter combinations for
> a requested frequency. The new helpers are rzv2h_get_pll_pars(),
> rzv2h_get_pll_div_pars(), rzv2h_get_pll_divs_pars() and
> rzv2h_get_pll_dtable_pars() and they are exported in the "RZV2H_CPG"
> namespace for use by other consumers (notably the DSI driver). These
> helpers perform iterative searches over PLL parameters (M, K, P, S)
> and optional post-dividers and return the best match (or an exact
> match when possible).
>
> Move PLL/CLK related limits and parameter types into the shared
> include (include/linux/clk/renesas.h) by adding struct rzv2h_pll_limits,
> struct rzv2h_pll_pars and struct rzv2h_pll_div_pars plus the
> RZV2H_CPG_PLL_DSI_LIMITS() helper macro to define DSI PLL limits.
>
> This change centralises the PLLDSI algorithms so the CPG and DSI
> drivers compute PLL parameters consistently and allows the DSI driver
> to accurately request rates and program its PLL.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v8->v9:
> - Dropped `renesas-rzv2h-cpg-pll.h` header and merged into `renesas.h`
> - Exported the symbols for PLL calculation apis
> - Updated commit message
> - Dropped reviewed-by tags due to above changes

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +/*
> + * rzv2h_get_pll_div_pars - Finds the best combination of PLL parameters
> + * and divider value for a given frequency.
> + *
> + * @limits: Pointer to the structure containing the limits for the PLL parameters
> + * @pars: Pointer to the structure where the best calculated PLL parameters and
> + * divider values will be stored
> + * @divider: Divider value to be applied to the PLL output
> + * @freq_millihz: Target output frequency in millihertz
> + *
> + * This function calculates the best set of PLL parameters (M, K, P, S) where
> + * the divider value is already known. See rzv2h_get_pll_pars() for more details
> + * on how the PLL parameters are calculated.
> + */
> +bool rzv2h_get_pll_div_pars(const struct rzv2h_pll_limits *limits,
> +                           struct rzv2h_pll_div_pars *pars, u8 divider,
> +                           u64 freq_millihz)
> +{
> +       if (!rzv2h_get_pll_pars(limits, &pars->pll, freq_millihz * divider))
> +               return false;
> +
> +       pars->div.divider_value = divider;
> +       pars->div.freq_millihz = DIV_U64_ROUND_CLOSEST(pars->pll.freq_millihz, divider);
> +       pars->div.error_millihz = freq_millihz - pars->div.freq_millihz;
> +
> +       return true;
> +}
> +EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_div_pars, "RZV2H_CPG");

This function does not seem to be used outside this module yet,
so why is it exported?

If you do ever need it, you could define a simple wrapper in the
header file:

    static inline bool rzv2h_get_pll_div_pars(const struct
rzv2h_pll_limits *limits,
                                              struct rzv2h_pll_div_pars *pars,
                                              u8 divider, u64 freq_millihz)
    {
            return rzv2h_get_pll_divs_pars(limits, pars, &divider, 1,
freq_millihz);
    }

> +
> +/*
> + * rzv2h_get_pll_divs_pars - Finds the best combination of PLL parameters
> + * and divider value for a given frequency.
> + *
> + * @limits: Pointer to the structure containing the limits for the PLL parameters
> + * @pars: Pointer to the structure where the best calculated PLL parameters and
> + * divider values will be stored
> + * @table: Pointer to the array of valid divider values
> + * @table_size: Size of the divider values array
> + * @freq_millihz: Target output frequency in millihertz
> + *
> + * This function calculates the best set of PLL parameters (M, K, P, S) and divider
> + * value to achieve the desired frequency. See rzv2h_get_pll_pars() for more details
> + * on how the PLL parameters are calculated.
> + *
> + * freq_millihz is the desired frequency generated by the PLL followed by a
> + * a gear.
> + */
> +bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +                            struct rzv2h_pll_div_pars *pars,
> +                            const u8 *table, u8 table_size, u64 freq_millihz)
> +{
> +       struct rzv2h_pll_div_pars p, best;
> +
> +       best.div.error_millihz = S64_MAX;
> +       p.div.error_millihz = S64_MAX;
> +       for (unsigned int i = 0; i < table_size; i++) {
> +               if (!rzv2h_get_pll_div_pars(limits, &p, table[i], freq_millihz))

If you don't need rzv2h_get_pll_div_pars() elsewhere, you could just
expand it here.

> +                       continue;
> +
> +               if (p.div.error_millihz == 0) {
> +                       *pars = p;
> +                       return true;
> +               }
> +
> +               if (abs(best.div.error_millihz) > abs(p.div.error_millihz))
> +                       best = p;
> +       }
> +
> +       if (best.div.error_millihz == S64_MAX)
> +               return false;
> +
> +       *pars = best;
> +       return true;
> +}
> +EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
> +
> +/*
> + * rzv2h_get_pll_dtable_pars - Finds the best combination of PLL parameters
> + * and divider value for a given frequency using a divider table.
> + *
> + * @limits: Pointer to the structure containing the limits for the PLL parameters
> + * @pars: Pointer to the structure where the best calculated PLL parameters and
> + * divider values will be stored
> + * @dtable: Pointer to the array of valid divider values
> + * @freq_millihz: Target output frequency in millihertz
> + *
> + * See rzv2h_get_pll_divs_pars() for more details on how the PLL
> + * parameters and divider values are calculated.
> + */
> +bool rzv2h_get_pll_dtable_pars(const struct rzv2h_pll_limits *limits,
> +                              struct rzv2h_pll_div_pars *pars,
> +                              const struct clk_div_table *dtable, u64 freq_millihz)
> +{
> +       const struct clk_div_table *div = dtable;
> +       u8 table[RZV2H_MAX_DIV_TABLES] = { 0 };
> +       unsigned int i = 0;
> +
> +       for (; div->div; div++) {
> +               if (i >= RZV2H_MAX_DIV_TABLES)
> +                       return false;
> +               table[i++] = div->div;
> +       }
> +
> +       return rzv2h_get_pll_divs_pars(limits, pars, table, i, freq_millihz);
> +}
> +EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_dtable_pars, "RZV2H_CPG");

This function does not seem to be used outside this module yet,
so why is it exported?

> +
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
> +       div &= clk_div_mask(ddiv.width);
> +       div = dsi_div->dtable[div].div;
> +
> +       return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
> +}
> +
> +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> +                                              struct clk_rate_request *req)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       struct rzv2h_pll_div_pars *dsi_params;
> +       struct rzv2h_pll_dsi_info *dsi_info;
> +       u64 rate_millihz;
> +
> +       dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +       dsi_params = &dsi_info->pll_dsi_parameters;
> +
> +       rate_millihz = mul_u32_u32(req->rate, MILLI);
> +       if (rate_millihz == dsi_params->div.error_millihz + dsi_params->div.freq_millihz)
> +               goto exit_determine_rate;
> +
> +       if (!rzv2h_get_pll_dtable_pars(dsi_info->pll_dsi_limits, dsi_params, dsi_div->dtable,
> +                                      rate_millihz)) {

If you don't need rzv2h_get_pll_dtable_pars() elsewhere, you could just
expand it here.

> +               dev_err(priv->dev,
> +                       "failed to determine rate for req->rate: %lu\n",
> +                       req->rate);
> +               return -EINVAL;
> +       }
> +
> +exit_determine_rate:
> +       req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
> +       req->best_parent_rate = req->rate * dsi_params->div.divider_value;
> +       dsi_info->req_pll_dsi_rate = req->best_parent_rate;
> +
> +       return 0;
> +}

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -10,7 +10,9 @@
>  #ifndef __LINUX_CLK_RENESAS_H_
>  #define __LINUX_CLK_RENESAS_H_
>
> +#include <linux/clk-provider.h>
>  #include <linux/types.h>
> +#include <linux/units.h>
>
>  struct device;
>  struct device_node;
> @@ -32,4 +34,138 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
>  #define cpg_mssr_attach_dev    NULL
>  #define cpg_mssr_detach_dev    NULL
>  #endif
> +
> +/**
> + * struct rzv2h_pll_limits - PLL parameter constraints
> + *
> + * This structure defines the minimum and maximum allowed values for
> + * various parameters used to configure a PLL. These limits ensure
> + * the PLL operates within valid and stable ranges.
> + *
> + * @fout: Output frequency range (in MHz)
> + * @fout.min: Minimum allowed output frequency
> + * @fout.max: Maximum allowed output frequency
> + *
> + * @fvco: PLL oscillation frequency range (in MHz)
> + * @fvco.min: Minimum allowed VCO frequency
> + * @fvco.max: Maximum allowed VCO frequency
> + *
> + * @m: Main-divider range
> + * @m.min: Minimum main-divider value
> + * @m.max: Maximum main-divider value
> + *
> + * @p: Pre-divider range
> + * @p.min: Minimum pre-divider value
> + * @p.max: Maximum pre-divider value
> + *
> + * @s: Divider range
> + * @s.min: Minimum divider value
> + * @s.max: Maximum divider value
> + *
> + * @k: Delta-sigma modulator range (signed)
> + * @k.min: Minimum delta-sigma value
> + * @k.max: Maximum delta-sigma value
> + */
> +struct rzv2h_pll_limits {
> +       struct {
> +               u32 min;
> +               u32 max;
> +       } fout;
> +
> +       struct {
> +               u32 min;
> +               u32 max;
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
> +};
> +
> +/**
> + * struct rzv2h_pll_pars - PLL configuration parameters
> + *
> + * This structure contains the configuration parameters for the
> + * Phase-Locked Loop (PLL), used to achieve a specific output frequency.
> + *
> + * @m: Main divider value
> + * @p: Pre-divider value
> + * @s: Output divider value
> + * @k: Delta-sigma modulation value
> + * @freq_millihz: Calculated PLL output frequency in millihertz
> + * @error_millihz: Frequency error from target in millihertz (signed)
> + */
> +struct rzv2h_pll_pars {
> +       u16 m;
> +       u8 p;
> +       u8 s;
> +       s16 k;
> +       u64 freq_millihz;
> +       s64 error_millihz;
> +};
> +
> +/**
> + * struct rzv2h_pll_div_pars - PLL parameters with post-divider
> + *
> + * This structure is used for PLLs that include an additional post-divider
> + * stage after the main PLL block. It contains both the PLL configuration
> + * parameters and the resulting frequency/error values after the divider.
> + *
> + * @pll: Main PLL configuration parameters (see struct rzv2h_pll_pars)
> + *
> + * @div: Post-divider configuration and result
> + * @div.divider_value: Divider applied to the PLL output
> + * @div.freq_millihz: Output frequency after divider in millihertz
> + * @div.error_millihz: Frequency error from target in millihertz (signed)
> + */
> +struct rzv2h_pll_div_pars {
> +       struct rzv2h_pll_pars pll;
> +       struct {
> +               u8 divider_value;
> +               u64 freq_millihz;
> +               s64 error_millihz;
> +       } div;
> +};
> +
> +#define RZV2H_CPG_PLL_DSI_LIMITS(name)                                 \
> +       static const struct rzv2h_pll_limits (name) = {                 \
> +               .fout = { .min = 25 * MEGA, .max = 375 * MEGA },        \
> +               .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },     \
> +               .m = { .min = 64, .max = 533 },                         \
> +               .p = { .min = 1, .max = 4 },                            \
> +               .s = { .min = 0, .max = 6 },                            \
> +               .k = { .min = -32768, .max = 32767 },                   \
> +       }                                                               \
> +
> +bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
> +                       struct rzv2h_pll_pars *pars, u64 freq_millihz);

Please add a dummy returning false for the !CONFIG_CLK_RZV2H case.

> +
> +bool rzv2h_get_pll_div_pars(const struct rzv2h_pll_limits *limits,
> +                           struct rzv2h_pll_div_pars *pars, u8 divider,
> +                           u64 freq_millihz);

Unused, please drop.

> +
> +bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +                            struct rzv2h_pll_div_pars *pars,
> +                            const u8 *table, u8 table_size, u64 freq_millihz);

Please add a dummy returning false for the !CONFIG_CLK_RZV2H case.

> +
> +bool rzv2h_get_pll_dtable_pars(const struct rzv2h_pll_limits *limits,
> +                              struct rzv2h_pll_div_pars *pars,
> +                              const struct clk_div_table *dtable, u64 freq_millihz);

Unused, please drop.

> +
>  #endif

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
