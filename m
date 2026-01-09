Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C35D0BDE4
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D381710E92A;
	Fri,  9 Jan 2026 18:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C5810E93A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 18:38:52 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-56021f047d6so1496846e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:38:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767983932; x=1768588732;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owKRR1yw9zmwxecUjh86QCCGN7unQ2k03XZJfdt7ufo=;
 b=gVds2Hp+QcI6ZGp2ppQSrC3r646XNAFvG30VCsg2xel+Y7hwghbSbcJne1D4EC3B7L
 uSyafjtn62mDCruhmbKPK5NOX+OV9r+GMvEo/mhywzJVtVfiEHczGlZKUGESQHUel34A
 7mXRGXFI/Vz3N/r+MW+Ayja36YH87x1zSQLH5cWRTNVDg0fYZmT3plR8AiuXsqoqr2Ak
 smarn9lFwlpMrVikwned08pek5OJGdUutnq/exOS0O3AAF6TRPqBpgsmS38mjGbFu5hA
 VU4WK0cfXgTSKgFNQXqeZA5dAgALzQxvwZnsrjenDyc4PrqUZV0I4SdAtfLGnb0GPmW+
 fWqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH9gwMuI45X7OQ0h1uJDRRxdBwKssYSfzQNi1ubqj5yFFYrTZnOwRtp+Jckr7SU+aeBg40ndDncAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO7xBKnuxFXnTsiJ2apKKlTGjryWVXRmqsKqN0DJ2Id5/yRBJc
 to+CkQQZKB8YLoFupTqFZdF73LDdjJ6dKMIStK1+yaCFFjl4u8YY9ScGhFKKNrDH
X-Gm-Gg: AY/fxX7XeahW6/Q41ScPtmzHcuikPyXjbSuKupSbSrb4hxyzaM/+QepOBECKbN52Ljr
 MuKBCspL3H57s6Az0z2mvtZxhURP15HibQML31jb04Cr8dEb2rdNq/2MZn+K8OlEgPBkSb0DwAh
 IbxHp+abcRh/W2Gk3niFekXMQ0KNR65lSSzYQjVaQj+gWVNr0HFZJfnXUn0Rualkjlq3YqDxaJN
 bCRevBk7eXh+wT84TGhimcjjH+uZSIqoqPkKvVplWCgcW4Zj/s3F0rlQFxwtGb8EmGxCruSbEfo
 MYLmtaHNDqb0kF8kUdVKnBU2VqJpOVooZJtV8YanX8i+Gdv4jS2sWZTkFKfm9eO+pdWeNQZwKEQ
 5NXftmOUcUzOSVFjAmL5N60zjbtg+uUll/Bd6+4K3cWf7pn9lr9zh6W3XI59bKdTZS61LX20SwU
 YZaP/mQF+pQSRIsjFQ7B5PHhBBRllEz0D/DAZhb+AVG7XFD6ze/78+gp/06uA=
X-Google-Smtp-Source: AGHT+IGg+swe+1tUIwD5nugWBMSK2pFY8BaMyeB0UGEGJsMXyUfbbqiAXDpB8knS1QprSwEXsY3z+g==
X-Received: by 2002:a05:6102:6c7:b0:5db:d411:20cd with SMTP id
 ada2fe7eead31-5ecb6946bcfmr4156923137.28.1767983931759; 
 Fri, 09 Jan 2026 10:38:51 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec772e322asm10621744137.13.2026.01.09.10.38.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 10:38:51 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-5eae7bb8018so1757047137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:38:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXQd208E//OK7MrrmoEL5dmh76x3NY6EWGKb9po2KlrrtEcLiTIFoxNM8gtfeJeOck4cIGPcDyv5pI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3e86:b0:5db:eeb6:812c with SMTP id
 ada2fe7eead31-5ecbb161af3mr3548015137.43.1767983931089; Fri, 09 Jan 2026
 10:38:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <cdd044968c1d199ad41ec84ed71162725cb2ec66.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <cdd044968c1d199ad41ec84ed71162725cb2ec66.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:38:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpgnCXVzuZ7ZJQ8dy4Yae=zse3pq=r-g3frymbSVRpVg@mail.gmail.com>
X-Gm-Features: AZwV_QjPxiRlZoVjD9lDA1offfLVFh-eBcX3h9n60XoTGjHhb5ZXNJrajC-uZ0U
Message-ID: <CAMuHMdVpgnCXVzuZ7ZJQ8dy4Yae=zse3pq=r-g3frymbSVRpVg@mail.gmail.com>
Subject: Re: [PATCH 06/22] clk: renesas: r9a09g047: Add support for
 SMUX2_DSI{0, 1}_CLK
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

On Wed, 26 Nov 2025 at 15:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add support for the SMUX2_DSI0_CLK and SMUX2_DSI1_CLK clock muxes
> present on the r9a09g047 SoC.
>
> These muxes select between CDIV7_DSI{0,1}_CLK and CSDIV_2to16_PLLDSI{0,1}
> using the CPG_SSEL3 register (SELCTL0 and SELCTL1 bits).
>
> According to the hardware manual, when LVDS0 or LVDS1 outputs are used,
> SELCTL0 or SELCTL1 must be set accordingly.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -64,6 +64,8 @@ enum clk_ids {
>         CLK_SMUX2_GBE0_RXCLK,
>         CLK_SMUX2_GBE1_TXCLK,
>         CLK_SMUX2_GBE1_RXCLK,
> +       CLK_SMUX2_DSI0_CLK,
> +       CLK_SMUX2_DSI1_CLK,

Please move these up, before CLK_SMUX2_GBE0_TXCLK.

>         CLK_PLLDTY_DIV16,
>         CLK_PLLVDO_CRU0,
>         CLK_PLLVDO_GPU,
> @@ -143,6 +145,8 @@ RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
>  #define PLLDSI1                PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
>
>  /* Mux clock tables */
> +static const char * const smux2_dsi0_clk[] = { ".plldsi0_div7", ".plldsi0_csdiv" };
> +static const char * const smux2_dsi1_clk[] = { ".plldsi1_div7", ".plldsi1_csdiv" };
>  static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
>  static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
>  static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
> @@ -218,6 +222,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>                        CSDIV1_DIVCTL3, dtable_2_16_plldsi),
>         DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
>         DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
> +       DEF_PLLDSI_SMUX(".smux2_dsi0_clk", CLK_SMUX2_DSI0_CLK,
> +                       SSEL3_SELCTL0, smux2_dsi0_clk),
> +       DEF_PLLDSI_SMUX(".smux2_dsi1_clk", CLK_SMUX2_DSI1_CLK,
> +                       SSEL3_SELCTL1, smux2_dsi1_clk),

Why can't these use the existing DEF_SMUX()?
>
>         /* Core Clocks */
>         DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
