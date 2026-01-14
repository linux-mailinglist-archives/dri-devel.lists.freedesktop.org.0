Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B290AD1EFA1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 14:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1880110E609;
	Wed, 14 Jan 2026 13:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B9C10E609
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 13:08:02 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-5eef115c781so2578666137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 05:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768396082; x=1769000882;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JOnvgxequhkaVjnrcP/Abcj5FnEjgQ9Z6oOwYXqR9LY=;
 b=a0dTHwE4fh7WBFdsaieOB0N+oybxU7H9+76wctAvHfCtaOQMqf5DcWx3lUC61SVCbi
 K6tQhZNwAIB+FeVgM9eIYDHKSrgoGfKgYH/UD8x/YT3tIQfXyqUpzhe0F366sD0pYy/m
 bYSl/PCv9BGkK1H3fGSXVG6Z1w/0+aYe7G33CjRfV1pDUbjfaq9EJkqzfjumVR3SFr5z
 YJWc8o3bK8cSvIwNLlm62Z/hBcwTJl7YiWc3/K9Iodq9UY1gr1qAV3LpIqOdpZyt+70j
 Mk/LEMwAMe2UYZsezDRWxcaUfiwheUBQ1/a4nn1aanRsEb5pT9bThafou4o977sApEcX
 y2WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL1/SsFFZSQPfKniLDCwtQp2mCGwlz165cODz2VzGdxi9LqziSb+kSmscoKYhIdnv+E3hHTlf1oto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznAqDez/Ml/1NPCSeBmeKdvAF/zDHPsMcPf8Pdw+p+V76kqbxq
 +S+sQIgdGLA3UoGrOO6c7AzQgiNzC3RRe43Qir480WhDXrF0QeR1SPEn0Gao+cAN
X-Gm-Gg: AY/fxX7tyzjR8Rgk9Zbb6MF6Z/Ph300CbYKbDGKWWxAda+U9unT0/LWxApequmaOZ99
 4QBpXEXuFDc2Z1ec43ZWHOt7WsnSTYDUVMLjxJphVhHnxXKYx5jlJZQwQjg9NPOsvAqoDJSfNlx
 pR4DEyiV/L8tbQPNmjU0g0tiCGst2/dFsjbXYt+yHaGxbuxATAvQZOStqXUWeTQj9DoKYhPBsaf
 779w6DfTn1WNjeOwPvwMiKncEpSielxBM88t/UtQtE/lFrQmUIaYLx0+cs1tWB63bGUmEd/8oP6
 MUiqwaF+eN5S8QjUcUWsTIqBDptQMHV8l6BMATLhXUTLkeESn6gWt+/jquf0d4312Dr+Jx6r70P
 R1kzm0VQmmPZFRTN/mHd+SPbmptq7XIbyuQKZykW8yY9tf043L52QKdXzXqvo2Lh3x9Mdy8Bo4u
 Jt/RFadzs6qJgOi/+Z9ChlpmU70EanAMnJkYy2uXqZ7H90SF8t
X-Received: by 2002:a05:6102:3711:b0:5db:fce3:af8b with SMTP id
 ada2fe7eead31-5f17f439381mr950479137.12.1768396081241; 
 Wed, 14 Jan 2026 05:08:01 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-944124a3386sm21907499241.11.2026.01.14.05.08.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 05:08:00 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-5eea9fbe4a4so2096415137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 05:08:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXcQXY+ej6iF0lQ7pqZj2C5HMNzhzthwryDiNM+Z6S5YZt/O5j+2V9xj/rsvUrVvaDcDVeDXGNTqmc=@lists.freedesktop.org
X-Received: by 2002:a05:6102:1497:b0:5d5:dbbb:5b86 with SMTP id
 ada2fe7eead31-5f17f5c4c63mr892720137.25.1768396080489; Wed, 14 Jan 2026
 05:08:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdXU6traB73KaFj0kRtdo4NDT4ynUyfd-4L36=D6cUUd6A@mail.gmail.com>
 <aWSs75UPtTezytxQ@tom-desktop>
In-Reply-To: <aWSs75UPtTezytxQ@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 14:07:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9G4an1nhPoHvXa5RtrAw+-tP=VrEz4YFNnE7-MD-Vrw@mail.gmail.com>
X-Gm-Features: AZwV_QjFXX-xMGPOrl95tfVFxAWP1NtPnSeHetQ4hnMLWm1TvwJXuiUd8szKzi8
Message-ID: <CAMuHMdV9G4an1nhPoHvXa5RtrAw+-tP=VrEz4YFNnE7-MD-Vrw@mail.gmail.com>
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

On Mon, 12 Jan 2026 at 09:13, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Fri, Jan 09, 2026 at 07:27:04PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > Add PLLDSI clk mux support to select PLLDSI clock from different clock
> > > sources.
> > >
> > > Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> > > them in the clock driver.
> > >
> > > Extend the determine_rate callback to calculate and propagate PLL
> > > parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> > > using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> >
> > [...]
> >
> > >  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
> > >  {
> > >         struct pll_clk *pll_clk = to_pll(hw);
> > > @@ -1085,6 +1213,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
> > >         case CLK_TYPE_PLLDSI_DIV:
> > >                 clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
> > >                 break;
> > > +       case CLK_TYPE_PLLDSI_SMUX:
> > > +               clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
> > > +               break;
> > >         default:
> > >                 goto fail;
> > >         }
> > > diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
> > > index dc957bdaf5e9..5f6e775612e7 100644
> > > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > > @@ -203,6 +203,7 @@ enum clk_types {
> > >         CLK_TYPE_SMUX,          /* Static Mux */
> > >         CLK_TYPE_PLLDSI,        /* PLLDSI */
> > >         CLK_TYPE_PLLDSI_DIV,    /* PLLDSI divider */
> > > +       CLK_TYPE_PLLDSI_SMUX,   /* PLLDSI Static Mux */
> > >  };
> > >
> > >  #define DEF_TYPE(_name, _id, _type...) \
> > > @@ -241,6 +242,13 @@ enum clk_types {
> > >                  .dtable = _dtable, \
> > >                  .parent = _parent, \
> > >                  .flag = CLK_SET_RATE_PARENT)
> > > +#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
> > > +       DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
> > > +                .cfg.smux = _smux_packed, \
> > > +                .parent_names = _parent_names, \
> > > +                .num_parents = ARRAY_SIZE(_parent_names), \
> > > +                .flag = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, \
> > > +                .mux_flags = CLK_MUX_HIWORD_MASK)
> > >
> > >  /**
> > >   * struct rzv2h_mod_clk - Module Clocks definitions
> >
> > Why do you need a completely new clock type, and can't you just use
> > the existing CLK_TYPE_SMUX?
>
> From reference manual (Table 4.4-10 Specifications of the CPG_SSELm
> Registers)
>
> We have the following:
>
>  - SMUX2_DSI0_CLK*2
>         0b: CDIV7_DSI0_CLK (default)
>         1b: CSDIV_2to16_PLLDSI0
>
>  - SMUX2_DSI1_CLK*2
>         0b: CDIV7_DSI1_CLK (default)
>         1b: CSDIV_2to16_PLLDSI1
>
> Note 2.If LVDS0 / LVDS1 is used, be sure to set 0b.
>
> For this reason these clocks needs an ad hoc determine_rate function:
>         - rzv2h_cpg_plldsi_smux_determine_rate()
>
> For that CLK_TYPE_PLLDSI_SMUX has been introduced.
> What do you think?

OK, your solution sounds good to me.  Still, as this is used from the
DRM driver, I would like to get some feedback from the DRM people, too.

BTW, I just noticed in the RZ/G3E clock system diagram that
CDIV7_DSI0_CLK has a duty cycle "DUTY H/L=4/3", while all other clocks
use the symmetrical 50%.  Perhaps the DRM driver can request a duty
cycle of 4/7 when using LVDS? Currently the DRM driver communicates
its requirements by explicitly setting the parent.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
