Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CFBD37BF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A410210E399;
	Mon, 13 Oct 2025 14:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74D810E111
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:21:22 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-89018e9f902so2618324241.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760365281; x=1760970081;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wM5BKo03UXTKAaO0inlA90fZOzSgvU3v+GhQ9ytzuNM=;
 b=rFOgrvUimynTXhb8pcLaUyzqlwo0i8bEfwmcjK89TAfXEG5lBJRb+17xKhi7mGobN8
 e05sOPDIjY96/2NY28O0lP6aGeN3SSJjMsLDa0Z48sU0Oh+qMZXpYG/EVWPI8/qSig+F
 lpZ+fZRC8cXeGe0T3iCleAlxKOilATobD/sq9NTsrMKBd9QkFgQ+t9TluwbOIwVwqFdc
 14SAGNDu0krckF8adOERqHIroKRBLHL/ZpazlInMAcof0DdqXIaGD/jJSlnUl09XR96t
 WxLvZkRVme4ExtLFoSRHHW9cRcVusFgQa7/nUkbdtUDK2E4GKreY6FumMgv7FMLHBF22
 +u3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLlkcACknb1F4oeVI8RGCaAfMXetUac5QXPC0RuXzOpysP/en2VRiNZRaTo+F6fkAcH2BsQ8J/vbU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxN8q0telbleApWNEbKe4RYdXlSPc3RFrcrhOD5e6bze0YC9HCV
 TarJ0jHF3lFpagqHTKjegTy16w4HtH9AK2l8iJbpLnT7xLmSZ2kRVkGGcffaVS9B
X-Gm-Gg: ASbGncsWLnoWUaXwUH3/odeRpHGn3ibmLOokoGax7QSl0zorwc5W+WDnvrlhhVpcQuz
 1s7Pv+4Ph50XfTsZsDPzTlvSubn0GK9JCP0i82Cv+lkwPwx+rFHWl5+lphhVfGTW0lpecYZryD8
 uYsEwzBOOtfVZ8LNPKmfwibdpreYFCMoPkV6iNvM/7jZG4sBIogwCkj6seniUsfvFWCm7vS6UaM
 OAuvjY14Kn3nDYmFtGAntlTCIgshgH/dGSXns1FGk6s22r9CcZt0INMlH38HqWRf+I3r/Ms64OD
 bwjiZAlbJgLaCaaL16rKIrqVDS3NYc+zV58PGITRgXE49qsLj+APwDGSFXweEI9G2MwXvtWKheX
 oXGmTLz2t7B0sDRfDmKZXC9Gt8ggIaEsV18ruulyzyKM9eYw7zMxNitBeQUEQmZrP2og6z3wr9t
 9U4bbn/kQge9E7bQ==
X-Google-Smtp-Source: AGHT+IHV7U1Bm/7HRluzHZFX/tJonaVQ/sp32yUoW+O7WSI2iJm+yZmBXydRNPnhM4gfoGQrY3qpzA==
X-Received: by 2002:a05:6102:3310:b0:5d3:febb:c231 with SMTP id
 ada2fe7eead31-5d5e1fbf449mr8219062137.0.1760365280977; 
 Mon, 13 Oct 2025 07:21:20 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-930bf76bcabsm2797041241.11.2025.10.13.07.21.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 07:21:20 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-556f7e21432so4009724137.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:21:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtpvdvT2jpGfjYfoWXB2pzin/KAXhO+BvIiithE8EIm5dvq5Nj1kkyLrVy0Gin6pHvajCnzZNvPPs=@lists.freedesktop.org
X-Received: by 2002:a05:6102:512b:b0:5d3:ff01:363d with SMTP id
 ada2fe7eead31-5d5e2323bc3mr8711756137.21.1760365279124; Mon, 13 Oct 2025
 07:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251009160732.1623262-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251009160732.1623262-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 16:21:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2-YrktT+=D2LVFw5oR+6EOLcPB_Yuh5wnos099W9YHQ@mail.gmail.com>
X-Gm-Features: AS18NWACXzl9qHe2hLpg2jHp4NfY_rtfyBAoBdwcOf1UGmjWi7aFUHns305Ee_M
Message-ID: <CAMuHMdV2-YrktT+=D2LVFw5oR+6EOLcPB_Yuh5wnos099W9YHQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
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

On Thu, 9 Oct 2025 at 18:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for PLLDSI and its post-dividers to the RZ/V2H CPG driver and
> export a set of helper APIs to allow other consumers (notably the DSI
> driver) to compute and select PLL parameter combinations.
>
> Introduce per-PLL-DSI state in the CPG private structure and implement
> clk ops and registration for PLLDSI and PLLDSI divider clocks. Implement
> rzv2h_cpg_plldsi_determine_rate and rzv2h_cpg_plldsi_set_rate to drive
> PLL programming via the new per-PLL state and add a plldsi divider clk
> with determine/set/recalc operations that cooperate with the PLL
> algorithm.
>
> Centralize PLL parameter types and limits by moving definitions into a
> shared header (include/linux/clk/renesas.h). Add struct rzv2h_pll_limits,
> struct rzv2h_pll_pars and struct rzv2h_pll_div_pars, plus the
> RZV2H_CPG_PLL_DSI_LIMITS() macro to declare DSI PLL limits.
>
> Provide two exported helper functions, rzv2h_get_pll_pars() and
> rzv2h_get_pll_divs_pars(), that perform iterative searches over PLL
> parameters (M, K, P, S) and optional post-dividers to find the best (or
> exact) match for a requested frequency. Export these helpers in the
> "RZV2H_CPG" namespace for use by external drivers.
>
> This change centralizes DSI PLL rate selection logic, prevents duplicate
> implementations in multiple drivers, and enables the DSI driver to
> request accurate PLL rates and program the hardware consistently.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v9->v10:
> - Dropped rzv2h_get_pll_div_pars() helper and opencoded instead.
> - Dropped rzv2h_get_pll_dtable_pars() helper and opencoded instead.
> - Added dummy helpers rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars()
>   in renesas.h for !CONFIG_CLK_RZV2H case.
> - Updated commit message.

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> +                                              struct clk_rate_request *req)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       u8 table[RZV2H_MAX_DIV_TABLES] = { 0 };
> +       struct rzv2h_pll_div_pars *dsi_params;
> +       struct rzv2h_pll_dsi_info *dsi_info;
> +       const struct clk_div_table *div;
> +       u64 rate_millihz;
> +       unsigned int i;
> +
> +       dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +       dsi_params = &dsi_info->pll_dsi_parameters;
> +
> +       rate_millihz = mul_u32_u32(req->rate, MILLI);
> +       if (rate_millihz == dsi_params->div.error_millihz + dsi_params->div.freq_millihz)
> +               goto exit_determine_rate;
> +
> +       div = dsi_div->dtable;

This belongs inside the for-initializer below.

> +       i = 0;

Ditto; or better: in the variable declaration at the top of the function.

> +       for (; div->div; div++) {
> +               if (i >= RZV2H_MAX_DIV_TABLES)
> +                       return -EINVAL;
> +               table[i++] = div->div;
> +       }
> +
> +       if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params, table, i,
> +                                    rate_millihz)) {
> +               dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
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

The rest LGTM, so with the above fixed, and the field changes factored
out into a separate patch:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
