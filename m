Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8866CB2C4EC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2730510E1A8;
	Tue, 19 Aug 2025 13:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7770410E1A8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:14:21 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-50f8bd52e8bso1795084137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 06:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755609260; x=1756214060;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cClO6zHEQrfoJMz2Ox6tdZxUhk3Ecays5stT+RWYVyI=;
 b=quaEk4tB/Kr2P0et/VmK7am75aDS6sXFGvF3tgblIzjxRebuOs+YNMjk7Xc0xnugya
 IxkZbMer1Vmik7MIBAd8HqR9LOwFGokpHWJflgZwryu0AHSdD/8eYNgNptTx6WUXAPxG
 nH9txvXNdZOQrDlgOXXRr7H0Iet5G0IFkP1LeW8FQylZ92NMJMzRTdYrtFdj/Tf/XSmY
 2LnuKy+coHx1DCYhhwk1ZHw5KAt3TKBVwEcGbP6T8Nh1o24ZU2PT9/kx8Uca3M8LJcd2
 uOhlOU5UW4GLFc7Lsm5hYrWt2VchD6ylYcYiJ16yA6lUZOTFxjhJsRCeUbF6RjPNb+6p
 LsJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWwL2pe2CEXlnaZ2gZBaeU3TKvq6sEBNa+TUUJ7xCOEW8q21MV1gptykBF85bqlbeHCwHdv0vvB6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxFVnEEJ/I3Msi10d0j6EyCHfmRLyQk//NY2+GN6RaPJPe9ZXJ
 MecFP9Ky23t0PvCXTbrw3rmUzScpMKZ9qMS721mBXj5pqQhcZt4DtvHT+hswv7u7
X-Gm-Gg: ASbGncvYKVu/LLZtYNawr4nKQSz0DkscEUvhliWmwH8FRqAxOws4Xoh0iglDCRKkcpE
 Et9nrF0ydhayIRakvNafJb7QvqXkBkYorJeCLWzRt/3oJzjnfGuvtp7YLjysnPUrFafmZzkb+ca
 Gy0szUL9aRmZG1ld1kEJwJAizkd3dx3LwR0+bswtwsUQD8Nh3BH8nG5uBG4/jv5rw6o6cyjLVNP
 pgGdb2CUa85HhCf5c6QW3R/p0yXbQo76K+NZCvH/yb8KZ+C22xuE5qvYdzxprNqtHY9R9EDwJ5d
 NGcyLCQoI+ezMZgoNDFl4WO9MNMw6BUGGTAVSI3+4iPkZXMRsgp3ptVYCI0dePRbsUi9C3vQx17
 Nl9bXmMplCl8yYsIzbnCPiSaPgNi34PQep6O454jQZAjqjRoUTScOaVtiOFww
X-Google-Smtp-Source: AGHT+IHG5UEPTJTk3F5XvaDIVwxr64Mg9ArQckAuRzaEzTeNQCDWS2s7j1EPzdVQg/pdbyQBJOBy6w==
X-Received: by 2002:a05:6102:38cd:b0:4e6:d911:dd84 with SMTP id
 ada2fe7eead31-51924535f0dmr694176137.22.1755609260326; 
 Tue, 19 Aug 2025 06:14:20 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-890278d419esm2328456241.13.2025.08.19.06.14.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 06:14:20 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-8901912bcfeso1284731241.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 06:14:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUf4zpe9sTJmuRlzTFRzG5IQgz6DYo01sbQKQCjiPXEMKdadBUlY2j8mBfQzPF4TF/FIK6tx6HKSU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:e0d:b0:4e7:b728:e34b with SMTP id
 ada2fe7eead31-51921c1313emr736920137.3.1755609258938; Tue, 19 Aug 2025
 06:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 15:14:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj=W17j9WHhTR1gH9MZ_fcxve_dOi6eMiL62xphXG+GQ@mail.gmail.com>
X-Gm-Features: Ac12FXzirwmbUHbtZJubjNclxZ4jN6c4IoIckX8DRoXm22ZLrDzBZdlraaPItcA
Message-ID: <CAMuHMdWj=W17j9WHhTR1gH9MZ_fcxve_dOi6eMiL62xphXG+GQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
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

On Mon, 28 Jul 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for PLLDSI and PLLDSI divider clocks.
>
> Introduce the `renesas-rzv2h-cpg-pll.h` header to centralize and share
> PLLDSI related data structures, limits, and algorithms between the
> RZ/V2H(P) CPG and DSI drivers.
>
> The DSI PLL is functionally similar to the CPG's PLLDSI, but has slightly
> different parameter limits and omits the programmable divider present in
> CPG. To ensure precise frequency calculations, especially for milliHz-level
> accuracy needed by the DSI driver, the shared algorithm allows both drivers
> to compute PLL parameters consistently using the same logic and input
> clock.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v6->v7:
> - Made struct rzv2h_pll_limits more modular also added Ffout limits
> - Made the alogirithm modular and also added apis based on the
>   needs for lvds and dpi

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +static struct rzv2h_pll_dsi_info *rzv2h_get_pll_dsi_info(struct clk_hw *pll_dsi,
> +                                                        struct rzv2h_cpg_priv *priv)
> +{
> +       struct pll_clk *pll_clk = to_pll(pll_dsi);
> +
> +       return &priv->pll_dsi_info[pll_clk->pll.instance];
> +}

This (very simple helper) is used twice, while there are two (almost
three) other locations where it is open-coded.  Perhaps just open-code
it everywhere?

> @@ -246,7 +526,8 @@ static const struct clk_ops rzv2h_cpg_pll_ops = {
>  static struct clk * __init
>  rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
>                            struct rzv2h_cpg_priv *priv,
> -                          const struct clk_ops *ops)
> +                          const struct clk_ops *ops,
> +                          bool is_plldsi)

No need for this parameter...

>  {
>         struct device *dev = priv->dev;
>         struct clk_init_data init;
> @@ -263,6 +544,10 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
>         if (!pll_clk)
>                 return ERR_PTR(-ENOMEM);
>
> +       if (is_plldsi)

... as you can just test "core->type == CLK_TYPE_PLLDSI" here.

> +               priv->pll_dsi_info[core->cfg.pll.instance].pll_dsi_limits =
> +                       core->cfg.pll.limits;
> +
>         parent_name = __clk_get_name(parent);
>         init.name = core->name;
>         init.ops = ops;

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
