Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E54BF6F27
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E4410E08A;
	Tue, 21 Oct 2025 14:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C300310E08A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:02:28 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-54bc6356624so5597924e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761055347; x=1761660147;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YXugAlNcvucEYnbbLM3xKX3aXFg6Ylpfx0k5Z7y5qH4=;
 b=ZVZVMSJSTViVO3IHGZAjFj0kATXCMX8XltGjTxaEu0GsUeYnBXfuSVjE9LAW74mFH7
 TGNYsvQHc5BcU94yeynejqUBfk9QINUKizi1KYzfL8rzsOduehEg08SCoty/wVYHq6Cm
 fUpoO9Qu8LvW9bT95zxaxyeq5w1+BHC1L10e2/vL9gkkBsJrAWNzV6CWvWTD00PwifkA
 zpicygG+w66EW+AMkvUcxSeBxYQOd/4jeewyQbcnqyCkWBZ9hXmzNDl99o7xDH20O80x
 pTfc/lg6b7vA2BTj19zC5vSIEisPlQVSGHfyhrEVgJQlSdSyYVflzr0SuK+gvO+Idqmn
 eumA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7soMEXiakRPhDiURW7Y5AOWB2C0XU9v+gAMln/G8mw2AKL5Bjgv+7Lflg0qQiq1sd2kRV4Bfz314=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwII1Wfga+299vwIHB7NyUraWlNrBO328iXd1x/JD8alpCmBjCB
 cUBWK2b+jNYBcNPGbEjqyu83nijA02h5O2S6i4E/3S20zURfHhv6uqjWLtj1Lv5S
X-Gm-Gg: ASbGncs218i82dKfJil3Z2VRNuTM/DsYCW4+FbOI5XwGmD0O/6Bh534lyxoDC+63TgX
 bRZxUoFajvFE8EPuOXxMCoANlFjUBaFwKXIRdLleZZKm8qfN1AHCXXzFxciBLNG9WXNpckuhNab
 G5TL5zfVMSqKXxpm+xfo+ACFyRezBnIUBIB4O19zP5Md0MZWYUuCwsEWo3ADRaCrdZmKRoo+qUl
 g3e7kCWPul+N8YEFdj5PpR2MsWdfIH2aMxKu+Ii1FA+Cq3FMo0ayhBinOgXNjEqiEyf9exOQ2RL
 5zMz/tLxE/cYV/csiguoq7bzDJA90UiIynkp3tmpY0+Dh9kmTg9xIYn4SRqq+ROqW1g0No7sbXn
 XsMtQ//DOUsFo+6OKZN6PhwmWdL3IP7dCxhsPA9re3I0o05xrLhTZEsnFqMmekcNAwIL37GUgqZ
 OvmIQujKe9Em4WWFyXLMVGA9KaYuvZY5d+L1NVew==
X-Google-Smtp-Source: AGHT+IHZZCxbm2TPU06dFI5WxfsZyLF5jJd2YOC7CxDyoPckIN6bvXVC5/HGrqAQD08PrbwIlswvUA==
X-Received: by 2002:a05:6122:e0d5:b0:556:94ae:ae32 with SMTP id
 71dfb90a1353d-55694aeb05amr88123e0c.4.1761055347329; 
 Tue, 21 Oct 2025 07:02:27 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5568d49c8c7sm565882e0c.21.2025.10.21.07.02.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 07:02:25 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-932e88546a8so662718241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:02:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX8QFWT7epSGdLR/g4gZN6YPcKrWVFRgl1A3IEDciiJOexP1p3/M6DdapCsy65SLie2IkiMJm+0isk=@lists.freedesktop.org
X-Received: by 2002:a05:6102:2ad3:b0:5d5:f6ae:3914 with SMTP id
 ada2fe7eead31-5d7dd6dae8amr6635478137.22.1761055331143; Tue, 21 Oct 2025
 07:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
 <20250912142056.2123725-2-chris.brandt@renesas.com>
In-Reply-To: <20250912142056.2123725-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 16:02:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVf7dSeqAhtyxDCFuCheQRzwS-8996Rr2Ntui21uiBgdA@mail.gmail.com>
X-Gm-Features: AS18NWAilKOsk0msuDZD61x0CWnEgj86O5ttkvj001Q_uv_hFWGEg6rSKnFmYMU
Message-ID: <CAMuHMdVf7dSeqAhtyxDCFuCheQRzwS-8996Rr2Ntui21uiBgdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
 Hugo Villeneuve <hugo@hugovil.com>, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
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

Hi Chris,

On Fri, 12 Sept 2025 at 16:22, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -74,6 +74,22 @@
>  #define MSTOP_OFF(conf)                FIELD_GET(GENMASK(31, 16), (conf))
>  #define MSTOP_MASK(conf)       FIELD_GET(GENMASK(15, 0), (conf))
>
> +#define PLL5_FOUTVCO_MIN       800000000
> +#define PLL5_FOUTVCO_MAX       3000000000
> +#define PLL5_POSTDIV_MIN       1
> +#define PLL5_POSTDIV_MAX       7
> +#define PLL5_POSTDIV_DEF       1
> +#define PLL5_REFDIV_MIN                1
> +#define PLL5_REFDIV_MAX                2

Documentation says 1..63?

> +#define PLL5_REFDIV_DEF                1
> +#define PLL5_INTIN_MIN         20
> +#define PLL5_INTIN_MAX         320
> +#define PLL5_INTIN_DEF         125
> +#define PLL5_FRACIN_DEF                0
> +
> +#define PLL5_TARGET_DPI                0
> +#define PLL5_TARGET_DSI                1

These two should become an enum in include/linux/clk/renesas.h,
as their values are passed (as magic numbers) from outside.

> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw
> @@ -129,6 +145,12 @@ struct rzg2l_pll5_param {
>         u8 pl5_spread;
>  };
>
> +/* PLL5 output will be used for DPI or MIPI-DSI */
> +static int dsi_div_target = PLL5_TARGET_DPI;
> +
> +/* Required division ratio for MIPI D-PHY clock changes depending on resolution and lanes. */
> +static int dsi_div_ab;

unsigned int

> +
>  struct rzg2l_pll5_mux_dsi_div_param {
>         u8 clksrc;
>         u8 dsi_div_a;
> @@ -557,24 +579,102 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
>  }
>
>  static unsigned long
> -rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
> +rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
> +                              struct rzg2l_pll5_param *params,
>                                unsigned long rate)
>  {
>         unsigned long foutpostdiv_rate, foutvco_rate;
> +       u8 div = 1;
> +       bool found = 0;
> +       int a, b;

unsigned int

> +
> +       if (priv->mux_dsi_div_params.clksrc)
> +               div = 2;
> +
> +       /* Calculate the DIV_DSI_A and DIV_DSI_B based on the final DIV DSI */
> +       for (a = 0; a < 4; a++) {
> +
> +               if (dsi_div_target == PLL5_TARGET_DPI && a == 0)
> +                       continue;       /* 1/1 div not supported for DIV_DSI_A for DPI */
> +
> +               for (b = 0; b < 16; b++) {
> +
> +                       if (dsi_div_target == PLL5_TARGET_DPI && b != 0)
> +                               continue;       /* Only 1/1 div supported for DIV_DSI_B in DPI */
> +
> +                       if (((1 << a) * (b + 1)) == dsi_div_ab) {

"(b + 1) << a"?

> +                               priv->mux_dsi_div_params.dsi_div_a = a;
> +                               priv->mux_dsi_div_params.dsi_div_b = b;
> +
> +                               goto found_dsi_div;
> +                       }
> +               }
> +       }
> +
> +found_dsi_div:
> +       /*
> +        * Below conditions must be set for PLL5 parameters:
> +        * - REFDIV must be between 1 and 2.
> +        * - POSTDIV1/2 must be between 1 and 7.
> +        * - INTIN must be between 20 and 320.
> +        * - FOUTVCO must be between 800MHz and 3000MHz.
> +        */
> +       for (params->pl5_postdiv1 = PLL5_POSTDIV_MIN;
> +            params->pl5_postdiv1 < PLL5_POSTDIV_MAX + 1;
> +            params->pl5_postdiv1++) {
> +               for (params->pl5_postdiv2 = PLL5_POSTDIV_MIN;
> +                    params->pl5_postdiv2 < PLL5_POSTDIV_MAX + 1;
> +                    params->pl5_postdiv2++) {
> +                       foutvco_rate = rate * ((1 << priv->mux_dsi_div_params.dsi_div_a) *

rate * ... << priv->mux_dsi_div_params.dsi_div_a;

> +                                              (priv->mux_dsi_div_params.dsi_div_b + 1)) *
> +                                             div * params->pl5_postdiv1 * params->pl5_postdiv2;
> +                       if (foutvco_rate < PLL5_FOUTVCO_MIN + 1 ||
> +                           foutvco_rate > PLL5_FOUTVCO_MAX - 1)
> +                               continue;
> +
> +                       for (params->pl5_refdiv = PLL5_REFDIV_MIN;
> +                            params->pl5_refdiv < PLL5_REFDIV_MAX + 1;
> +                            params->pl5_refdiv++) {
> +                               params->pl5_intin = (foutvco_rate * params->pl5_refdiv) /
> +                                                   (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +                               if (params->pl5_intin < PLL5_INTIN_MIN + 1 ||
> +                                   params->pl5_intin > PLL5_INTIN_MAX - 1)
> +                                       continue;
> +                               params->pl5_fracin = div_u64(((u64)
> +                                                    (foutvco_rate * params->pl5_refdiv) %
> +                                                    (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,

Please move the cast to u64 outside the modulo operation, else
the latter becomes a 64-by-32 modulo, which requires using a helper
from <linux/math64.h> when compile-testing for a 32-bit platform.

> +                                                    EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +                               found = 1;
> +                               goto found_clk;
> +                       }
> +               }
> +       }
> +
> +found_clk:
> +       if (!found) {
> +               params->pl5_intin = PLL5_INTIN_DEF;
> +               params->pl5_fracin = PLL5_FRACIN_DEF;
> +               params->pl5_refdiv = PLL5_REFDIV_DEF;
> +               params->pl5_postdiv1 = PLL5_POSTDIV_DEF;
> +               params->pl5_postdiv2 = PLL5_POSTDIV_DEF;
> +       }
>
> -       params->pl5_intin = rate / MEGA;
> -       params->pl5_fracin = div_u64(((u64)rate % MEGA) << 24, MEGA);

(u64)(rate % MEGA)

> -       params->pl5_refdiv = 2;
> -       params->pl5_postdiv1 = 1;
> -       params->pl5_postdiv2 = 1;
>         params->pl5_spread = 0x16;
>
>         foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
> -                                          (params->pl5_intin << 24) + params->pl5_fracin),
> -                              params->pl5_refdiv) >> 24;
> +                      (params->pl5_intin << 24) + params->pl5_fracin),
> +                      params->pl5_refdiv) >> 24;
>         foutpostdiv_rate = DIV_ROUND_CLOSEST_ULL(foutvco_rate,

foutvco_rate is unsigned long, but the division uses the _ULL() macro variant?

>                                                  params->pl5_postdiv1 * params->pl5_postdiv2);
>
> +       /* If foutvco is above 1.5GHz, change parent and recalculate */
> +       if (priv->mux_dsi_div_params.clksrc && foutvco_rate > 1500000000) {
> +               priv->mux_dsi_div_params.clksrc = 0;
> +               dsi_div_ab *= 2;
> +               dsi_div_target = PLL5_TARGET_DSI;       /* Assume MIPI-DSI */
> +               return rzg2l_cpg_get_foutpostdiv_rate(priv, params, rate);
> +       }
> +
>         return foutpostdiv_rate;
>  }
>
> @@ -607,7 +707,7 @@ static unsigned long rzg2l_cpg_get_vclk_parent_rate(struct clk_hw *hw,
>         struct rzg2l_pll5_param params;
>         unsigned long parent_rate;
>
> -       parent_rate = rzg2l_cpg_get_foutpostdiv_rate(&params, rate);
> +       parent_rate = rzg2l_cpg_get_foutpostdiv_rate(priv, &params, rate);
>
>         if (priv->mux_dsi_div_params.clksrc)
>                 parent_rate /= 2;
> @@ -626,6 +726,13 @@ static int rzg2l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
>         return 0;
>  }
>
> +void rzg2l_cpg_dsi_div_set_divider(int divider, int target)

unsigned int divider

> +{
> +       dsi_div_ab = divider;
> +       dsi_div_target = target;
> +}
> +EXPORT_SYMBOL_GPL(rzg2l_cpg_dsi_div_set_divider);
> +
>  static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
>                                       unsigned long rate,
>                                       unsigned long parent_rate)
> @@ -859,7 +966,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
>
>         vclk_rate = rzg2l_cpg_get_vclk_rate(hw, rate);
>         sipll5->foutpostdiv_rate =
> -               rzg2l_cpg_get_foutpostdiv_rate(&params, vclk_rate);
> +               rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
>
>         /* Put PLL5 into standby mode */
>         writel(CPG_SIPLL5_STBY_RESETB_WEN, priv->base + CPG_SIPLL5_STBY);
> @@ -949,6 +1056,8 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
>         priv->mux_dsi_div_params.clksrc = 1; /* Use clk src 1 for DSI */
>         priv->mux_dsi_div_params.dsi_div_a = 1; /* Divided by 2 */
>         priv->mux_dsi_div_params.dsi_div_b = 2; /* Divided by 3 */
> +       dsi_div_ab = (1 << priv->mux_dsi_div_params.dsi_div_a) *
> +                    (priv->mux_dsi_div_params.dsi_div_b + 1);

(priv->mux_dsi_div_params.dsi_div_b + 1) << priv->mux_dsi_div_params.dsi_div_a

>
>         return clk_hw->clk;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
