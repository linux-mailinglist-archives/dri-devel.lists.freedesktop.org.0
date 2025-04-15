Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE3BA8A37D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 17:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DD010E7E7;
	Tue, 15 Apr 2025 15:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E4310E7E8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 15:57:57 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-4c364c723acso365434137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 08:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744732673; x=1745337473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TuEbYlZMiJuO8E2YPXwmbMAltImu0P0byOBQlAv2mMo=;
 b=B1IIXtiFliEpgIpGwfUsGgY6Dg0J/Dj1d0YomXKVlkVzFnlyu5SKGw13dgz9ZStoUl
 YuRPwQgmgLt9t+rMEB3M03TsvcnMBV55X1l0ZssvEQa7bQ5svJ+pwAW6pmqfYtM+3rZ5
 wGpqw/H6wUXCKUy6TMKlms2uT/m9MDPBjS/3OA3as5YSK9FuvBwOCGMboL3yf719jczm
 xthzbEdTNZtWQlxdgqXoP0FC/H7O6jUxEVKpjx8/V074zvyAhmj8wI1LjtlS/R4rwXXy
 jQow+rUYsQWaRIH3sj8RvWl54TvvsFhCz1EO50ktEU33CFUfZsDQ/9vgiRffH+Cac3bD
 UBDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXodoQ68yq4EEtSOAZDQeBh2yngtQaRVNAM2YWiq/RgO2HM4tmWuiN8d1EHyJK3WSxc3cv0V8Cokg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYx4pa/EoUJRuDM3yCZSlROmbMxn/knkre0E38+xXLBT/xMuq3
 XlXdaDmrl41fN0gmBtgJPitpMa+eXpvxs7tUEEYnzAsGY4mmkVIdNtHryWCd
X-Gm-Gg: ASbGnct+n28aXZnvTz9dIXCLHiYbYABAGqKwwR3DkwyTRTY+D744tid2jze7vKKuOe8
 0MNyLzQq2mzdcy7TmR4Ylvd8g00keznwFLtQ7vOWMSPdQ3OPNNLOXiHM1qG64YnREPpD6cMbhR6
 5r4AgXIzEFIU9VFRJz6pCyQ33+WSyJKQIPEq7QUuTDDfmUKSfdunSh7CkzRlg6EMK9tZagRMfGe
 tc6dFTxqpwJgFmnw/onOKXtXv+9t8L4oSFNxIwFPyBtyVUUlq99ht8Ps5u6jmiwTW7DScyH+MnY
 dYq/a5RInbb+juhejpsDL3NVepsO3j4M89JF0GpkmlM6zG0JqbJqqlTkBAueipbKjqLWNoSjJhp
 HTchsgSU=
X-Google-Smtp-Source: AGHT+IFpsc70XnhZDyiKyKWD13majkxdjU7/BiRq5NEucii1P9v/hw7y4/G99hCqSWq3kBzB2cXrUw==
X-Received: by 2002:a05:6102:5e85:b0:4bb:623:e1f7 with SMTP id
 ada2fe7eead31-4c9e4ffec8emr11512302137.16.1744732673449; 
 Tue, 15 Apr 2025 08:57:53 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4c9c98afc1csm2672059137.22.2025.04.15.08.57.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 08:57:52 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-52403e39a23so4243273e0c.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 08:57:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXLdbBESzpeZBsp7/6VCIcgmBsTDHprUjcspIGJjhLiJ9f0n1Ua/X345vJhe56AlM4vFtpCIw9fWmc=@lists.freedesktop.org
X-Received: by 2002:a05:6122:1d0a:b0:525:9dd5:d55a with SMTP id
 71dfb90a1353d-527c35e7a47mr11730397e0c.8.1744732671704; Tue, 15 Apr 2025
 08:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 17:57:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9WhKeMyKfdiLWmLC8mabNe-4ROW5uCZhx6z503GE0Ug@mail.gmail.com>
X-Gm-Features: ATxdqUHtuz_A-xS1tTTRA3AiVheg582GK6_Rn09grQ8w2iOfDNKRllrwvo1MBQw
Message-ID: <CAMuHMdW9WhKeMyKfdiLWmLC8mabNe-4ROW5uCZhx6z503GE0Ug@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
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

On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for PLLDSI and PLLDSI divider clocks.
>
> The `renesas-rzv2h-dsi.h` header file is added to share the PLL divider
> algorithm between the CPG and DSI drivers.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

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
> +
> +       /*
> +        * Adjust the requested clock rate (`req->rate`) to ensure it falls within
> +        * the supported range of 5.44 MHz to 187.5 MHz.
> +        */
> +       req->rate = clamp(req->rate, 5440000UL, 187500000UL);
> +
> +       rate_mhz = req->rate * MILLI * 1ULL;

The first multiplication overflows on 32-bit systems.
Probably you wanted to use mul_u32_u32() instead?

More review later, I fell too deep in the wrong rabbit hole ("mhz !=
megaHertz"), again...

> --- /dev/null
> +++ b/include/linux/clk/renesas-rzv2h-dsi.h
> @@ -0,0 +1,207 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ/V2H(P) DSI CPG helper
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#include <linux/limits.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/units.h>
> +
> +#define OSC_CLK_IN_MEGA                (24 * MEGA)
> +
> +struct rzv2h_plldsi_div_limits {
> +       struct {
> +               u64 min;
> +               u64 max;

u32 should be sufficient?

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

Please initialize the members in declaration order.


> +       }                                                               \
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
