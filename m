Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF18D0BD24
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E5C10E266;
	Fri,  9 Jan 2026 18:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BC410E266
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 18:27:18 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-5eea2b345fbso630564137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767983237; x=1768588037;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KcttSXs7hZcQIHZPsbTRNE9EfXDmld5bm3jzlnDASfE=;
 b=uldPBAtrg78D+kNOl1QKwBbTd9r8mb063AaXqvRLMk/C5YbITUQP7uzJkwZYJmLfwu
 2ryHmR2OPvq51/1xJGCKt2MUcVzGhn0kWdZYi1GK4KB4ZWrdrKI8wlTTJ/vTU5SPZIJS
 v7SNa5df3tRZE0s3ZVd/oXUsxRiciBiP9BforIpJuNJE2OBtNYThExcf5a8AeWCq8IFE
 JIU5iDdy7xgfUgJuXafiKkJetpVe/rWiAGZ1CqO81UWElV0KqP4qfu53GvBqj93byUs+
 DGiP1TvS9USgRn1/txOSEmkEUCleRiqUSS8ak/IfJvwJ8tbel/yILAYTb2F8OGWld4je
 k6/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUa7efnd7cec5bVAgA1cUeAKF6OJDqYKkh1yczynqTgrIPfQtiT2lTRmLm32ocffDD+7UMd/MIKV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyDoQ2iEa+IPmjgBvWwyO7lDIegaP90S2uPr+DuRjDGB/fR+Eg
 Pka/3znfFoiDo6tCb4w2f+7LfAncCOOxu3M1Euim72G94lAj850+GPIoUzB2yexF
X-Gm-Gg: AY/fxX4APWGVrNIYwYyPmbnWdA2H3ok5zkmnJelAvB+3qiPgOFu7KyCxjfV6QZJHsEs
 NFWzEh1clwQXFko4veWsXzSSjUoOAd1qEz/9lOdtOkBo6+omkWTSBoRoB+uHKasli+yCUoSLK76
 jqm4BlyO9ApZ8dBGygkBkqMGkN+4nKTkZhR9CTmnLlhZpLoWHr2mi2OuDo2p1zu5Y02O8JOZ2kk
 Oa17hBfC28PUQHILd3kU+bFVKyIq/OKULnXvZUNAvdpfOiBnoTZTE5qHvR0WeBbnau7JEYkClli
 KAsFSk3OPcFJf8ktfEFR/IiXC/dG1VjsKCr/juE45WyWSwJWtF7rYqOOLxdOrgV6ZQv+T5zjcqu
 4bWTsXSxkOxE51JQeRxpRM60mFREkqZODBnq7r/0rtroH2ej5GONc2GQ21XXBVaRvqNlUo+/Za3
 C/l9ocgudDQrYFt26C9k1arOe+t+pUhSeF9ZGtHuu8Uivdp7GZpdKq7P/NBSo=
X-Google-Smtp-Source: AGHT+IEHgzPkqPA3B/4nkA/emUglVfOkQ1B4STEPOuEOeHWCnTcNbeAzDhFzHdz3hrcEGY+N1juGWw==
X-Received: by 2002:a05:6102:4412:b0:5df:c354:18c5 with SMTP id
 ada2fe7eead31-5ecb5cbba48mr4302732137.7.1767983237438; 
 Fri, 09 Jan 2026 10:27:17 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec770644d5sm10181587137.8.2026.01.09.10.27.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 10:27:16 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-93f5b804d4aso1652857241.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:27:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUGwuylq/6OIZJN7P1N8sAjABalwXuEuMdoaI7QC7KrPZzaJtZwou/p8ZZ2ziAn/r51jq5Ml3Cwovs=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3908:b0:5ee:a6f8:f925 with SMTP id
 ada2fe7eead31-5eea6f90e16mr2088665137.8.1767983235950; Fri, 09 Jan 2026
 10:27:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:27:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXU6traB73KaFj0kRtdo4NDT4ynUyfd-4L36=D6cUUd6A@mail.gmail.com>
X-Gm-Features: AZwV_QiFWie1jtTH6cP5clrt_EyRli2uQRED0h6evUp71Jo1c1Hn9WoeLwyfMeU
Message-ID: <CAMuHMdXU6traB73KaFj0kRtdo4NDT4ynUyfd-4L36=D6cUUd6A@mail.gmail.com>
Subject: Re: [PATCH 01/22] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
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

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add PLLDSI clk mux support to select PLLDSI clock from different clock
> sources.
>
> Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> them in the clock driver.
>
> Extend the determine_rate callback to calculate and propagate PLL
> parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

[...]

>  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
>  {
>         struct pll_clk *pll_clk = to_pll(hw);
> @@ -1085,6 +1213,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
>         case CLK_TYPE_PLLDSI_DIV:
>                 clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
>                 break;
> +       case CLK_TYPE_PLLDSI_SMUX:
> +               clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
> +               break;
>         default:
>                 goto fail;
>         }
> diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
> index dc957bdaf5e9..5f6e775612e7 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -203,6 +203,7 @@ enum clk_types {
>         CLK_TYPE_SMUX,          /* Static Mux */
>         CLK_TYPE_PLLDSI,        /* PLLDSI */
>         CLK_TYPE_PLLDSI_DIV,    /* PLLDSI divider */
> +       CLK_TYPE_PLLDSI_SMUX,   /* PLLDSI Static Mux */
>  };
>
>  #define DEF_TYPE(_name, _id, _type...) \
> @@ -241,6 +242,13 @@ enum clk_types {
>                  .dtable = _dtable, \
>                  .parent = _parent, \
>                  .flag = CLK_SET_RATE_PARENT)
> +#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
> +                .cfg.smux = _smux_packed, \
> +                .parent_names = _parent_names, \
> +                .num_parents = ARRAY_SIZE(_parent_names), \
> +                .flag = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, \
> +                .mux_flags = CLK_MUX_HIWORD_MASK)
>
>  /**
>   * struct rzv2h_mod_clk - Module Clocks definitions

Why do you need a completely new clock type, and can't you just use
the existing CLK_TYPE_SMUX?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
