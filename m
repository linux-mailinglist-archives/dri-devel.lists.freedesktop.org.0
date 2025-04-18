Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AB1A93A9E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 18:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A9210E073;
	Fri, 18 Apr 2025 16:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CVb/7bg0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2527E10E073
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 16:20:17 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-39c1efc457bso1207325f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744993216; x=1745598016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lg2nEDrkhUSorPX1TF01jndQPRc7b/tFFfdzWj6Yd3c=;
 b=CVb/7bg0tkg5HRtnqnj90NVqEYrreg2yb4IORhw32qfvE/sjpP3Zmwwbk8nKSX9HCY
 rR8U1PCmM2Y1RRW4ZJvXQnD7knZAhZh96V8qQ7OCUYZA/bIhkIY2Y7RrKcQ75/peSGSg
 rE9owcq928kNiW4fyQET/tT6CuaZfziPtR0Ok1WYVkVJ/2tvlWH49yFRmYQxiptVIjtC
 tHAtrqE/3O9m3Jhe5kdL6Z/MtSCAgFAcoqycrlHKQ7DcmzXR2J+CyT1/CRIL/Xl8LOWU
 RMIQzk1+r9s1l79I7gn4UQTUl5GfUAaMw5cfgzBwA4z1PrZxusxl/1yaS/32D4VkWswi
 xUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744993216; x=1745598016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lg2nEDrkhUSorPX1TF01jndQPRc7b/tFFfdzWj6Yd3c=;
 b=XQbd7KtHPlCEO9Gy93DlXm0zlFf0rPeuIA29r+t+QGsNBqN0OWJOkDDGtB+kkJuIeU
 +RUG1eD4upwZWE7DFe9f6KfIHPsh7XQsHihNqY6nLOCwX6Y5kQhoTsEOICvb21dC4y5e
 Pod92ayzEpoNXn6dSW3AE4N13fq6fHIhhPcc95hIkID8/Im8GohphH0FZkvt9r7OyPLu
 jasXaik4nU683ZEXdfN5TrA6KglKpWVMsOsli9TG/ai15Q2SJrJ5geUY1XxJrC53yGox
 wChFInLvsaMbjasBWAF8XGmosVN+1d3l6ftIAwroE1gyGsM/ayZpplUE3rA+MRQ+i7I+
 4rcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9pVNiocTxRO8SznZ8gxtcuQRN8O27OU6lsRTQ6/ef3dKn7tmxle92oeYwha4BhnDlSSAa0fO5IEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpfKdBteXmb/IGn4iY0lXjYMg8DPHwBTjtnzyDXrHkNQWb8Ns7
 UYq1Uxyw6dmmCLqHPlL5Uww240jJKj8hb+IaBq8QvK4PirVnoP/84w77Le2mXZXYEopLKTu9miq
 1zY56bwvZjFh2dexA63Qa7gtG/vY=
X-Gm-Gg: ASbGnctOPnpS7pxSPp4KxewtByIw01NXxKzFCftHKvP/f9tDpI3xCrb4lJP5pEGVT1e
 2iIpUtddOa5hven1GkyU07IfWp2bmDpGUnopZY3T9PBDwk583WYgR19ZypTNv9PjLwToMleVERX
 iQWIex7C+xv5W1xUP0wte3mboax2IxbApcjj7sL4UmROYn+sfxgRQ0mCo=
X-Google-Smtp-Source: AGHT+IEV8nQTdx71bXcsntH0008bnHpQrtXie8jNHCgnnEl5r+L0tBJL/zzaH6f3dMSiz8NUoJhMEwSZKKUKtHX5/lU=
X-Received: by 2002:a05:6000:2913:b0:39e:f641:c43 with SMTP id
 ffacd0b85a97d-39efbaf689bmr2593076f8f.53.1744993215679; Fri, 18 Apr 2025
 09:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVjVEVh+dHKG_afZwyqsXwHj2FR7enHNrfuE9HJ0ELjEA@mail.gmail.com>
In-Reply-To: <CAMuHMdVjVEVh+dHKG_afZwyqsXwHj2FR7enHNrfuE9HJ0ELjEA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Apr 2025 17:19:49 +0100
X-Gm-Features: ATxdqUEv6B6wG3-yJDLbiPWcjxc0fko3GJZ2QYvMG7cMut2VaxrivVkJC_7m9sY
Message-ID: <CA+V-a8sqpv=Gbj+TDgkayx9ya_YfYQ=-v0-9J+GDEjHzyWEbJg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable
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

Hi Geert,

On Wed, Apr 16, 2025 at 10:27=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar, Fabrizio,
>
> Thanks for your patch!
>
> On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and PLLDSI divider clocks.
> >
> > The `renesas-rzv2h-dsi.h` header file is added to share the PLL divider
> > algorithm between the CPG and DSI drivers.
>
> Please explain here why the DSI driver needs access to this algorithm.
>
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > @@ -196,6 +225,253 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw=
 *hw)
> >         return ret;
> >  }
> >
> > +static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *h=
w,
> > +                                                     unsigned long par=
ent_rate)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct ddiv ddiv =3D dsi_div->ddiv;
> > +       u32 div;
> > +
> > +       div =3D readl(priv->base + ddiv.offset);
> > +       div >>=3D ddiv.shift;
> > +       div &=3D ((2 << ddiv.width) - 1);
>
> Shouldn't that "2" be "1"?
> GENMASK(ddiv.width - 1, 0), or even better: clk_div_mask(ddiv.width).
>
> > +
> > +       div =3D dsi_div->dtable[div].div;
> > +
> > +       return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
> > +}
> > +
> > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > +                                              struct clk_rate_request =
*req)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_=
div_parameters;
> > +       unsigned long long rate_mhz;
>
> u64?
> Please use "millihz" instead of "mhz" everywhere, so it becomes very
> clear this is really "mHz" and not "MHz".
>
> > +
> > +       /*
> > +        * Adjust the requested clock rate (`req->rate`) to ensure it f=
alls within
> > +        * the supported range of 5.44 MHz to 187.5 MHz.
> > +        */
> > +       req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> > +
> > +       rate_mhz =3D req->rate * MILLI * 1ULL;
> > +       if (rate_mhz =3D=3D dsi_dividers->error_mhz + dsi_dividers->fre=
q_mhz)
> > +               goto exit_determine_rate;
> > +
> > +       if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> > +                                                dsi_dividers, rate_mhz=
)) {
> > +               dev_err(priv->dev,
> > +                       "failed to determine rate for req->rate: %lu\n"=
,
> > +                       req->rate);
> > +               return -EINVAL;
> > +       }
> > +
> > +exit_determine_rate:
> > +       req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;
> > +
> > +       return 0;
> > +};
> > +
> > +static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
> > +                                        unsigned long rate,
> > +                                        unsigned long parent_rate)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_=
div_parameters;
> > +       struct ddiv ddiv =3D dsi_div->ddiv;
> > +       const struct clk_div_table *clkt;
> > +       u32 reg, shift, div;
> > +
> > +       div =3D dsi_dividers->csdiv;
> > +       for (clkt =3D dsi_div->dtable; clkt->div; clkt++) {
> > +               if (clkt->div =3D=3D div)
> > +                       break;
> > +       }
> > +
> > +       if (!clkt->div && !clkt->val)
> > +               return -EINVAL;
>
> No need to check clkt->dev.
>
> > +
> > +       shift =3D ddiv.shift;
> > +       reg =3D readl(priv->base + ddiv.offset);
> > +       reg &=3D ~(GENMASK(shift + ddiv.width, shift));
> > +
> > +       writel(reg | (clkt->val << shift) |
> > +              DDIV_DIVCTL_WEN(shift), priv->base + ddiv.offset);
> > +
> > +       return 0;
>
> This function is very similar to the existing rzv2h_ddiv_set_rate().
> If you can't re-use it as-is, please consider factoring out the common
> part, or at least follow the same style of RMW-operation.
>
> > +};
>
>
> > +static long rzv2h_cpg_plldsi_round_rate(struct clk_hw *hw,
> > +                                       unsigned long rate,
> > +                                       unsigned long *parent_rate)
> > +{
> > +       return clamp(rate, 25000000UL, 375000000UL);
>
> This only rounds rates outside the range from 25 to 375 MHz.
> What about rates between 25 and 375 MHz?
>
My intention was to clamp it and let the PLL DSI DIV determine_rate
handle rejecting the rates if they dont get best dividers. Let's take
this discussion to v3.

Cheers,
Prabhakar
