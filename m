Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB76AC5C76
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 23:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC0310E562;
	Tue, 27 May 2025 21:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gQQs4Y/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAEB10E55B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 21:51:18 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so52267645e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 14:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748382677; x=1748987477; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ANlM/y/5wQo8XVOBp6jB0AhCmxQBhDmPML3mVImUY0=;
 b=gQQs4Y/wrCNqTsp9hZzxZCA7LgK6Nol2DiDc+mnnMWYCTuyKIj/LIR4Qw8IcRbkrfE
 vfkhePsvDo8yW13E4wwCMHDJg/RPWO8Z3vAyQEy5nTIvfwr4BJnCP1Gt1ReBSfa8VVxM
 yMOol5UDeW1FqwV1DLcXGNjPCjiFMUTNfq0oRU4Xngwr0Rpmja1a7ZLJU49kBrRRM76V
 1GsM0F/BzFRua82F3GqKnbw4zuzh1bu/WOqQ0HjTdmKkIS7EJ0hloljeWjg5WveefY1B
 AUauOB3kIFAjamW2lxPPHW0yJahHdgM6LCahi3sWTTsdpD7tkKikD82xN9CxFf7Dmqu/
 AnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748382677; x=1748987477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ANlM/y/5wQo8XVOBp6jB0AhCmxQBhDmPML3mVImUY0=;
 b=P+TV7X9I0JQ/V3rFY8v4rHEAklL800552NnVbHtyhYJIiBojlUVMlpVXEiAj/is0iA
 /PUdKP6s6Suh1oe9Kfb/YNmm+8eM1PYKW6zKTBvCBYq6h5HYXiO15gOnLL921tm5y5cx
 8z+E9rmUTI8Ia/Jnct50bK0yIRQmXKeongITcwEemaSqclR+TY4bVRXxSQSAwb6tldiG
 pHN8WwjxOjfO7gh8cOnmkloOtlyllFeo0Ox274D/t7QqajMICIz7+8VaS4O5UKi9OOEi
 4BqTGuJu/lze1AQH6Y53IRCzG2LaHMszrD7OtiKEh5UIjqcu9q7HVgKieELZLk3Gok/Y
 2Ynw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR8tvVgyGgHkogxBc95ZqYlVxugp+EtykLUvdw+tJ/hlG1qeluFByE/cYLSMTL9Nmvwnrbp5OU4eI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI25SlXYBPVp0MlywHTqabMuLfp4jetOkyokiM1yFG/mkoB2wg
 Ldfqxvs71ajJmhHTPS01OGO5738atIxPBXYPZL74ZLdLy4KPz8JYGHUn214RsXwsIn1vPWdkTSi
 200+VGreHUdjWeqvd4IFciNnEqR5CxdA=
X-Gm-Gg: ASbGnctKDgqrTuEX4hoKUeyNDeEq8UQGWkf+/SCwu05MpHLfCnRT2rF+nbQ9GkI62nl
 jFe0QzuFUeyYziMKy2ldYn9WkjDSvsjBUryyvEAD+VFA/WSmXPmUHOpbZZPChecJaauFJJ8Tc6P
 kbqyFYiCBrvgWyLgP1EseS2AUtkatrZSCURVUqqmLQ41ngRSCTqkw85jZLbjY14XKiLA==
X-Google-Smtp-Source: AGHT+IHY0lTBT6R7JQZbl411ozaobo4awDJXkKCRKg/dwglByLQ01zjW8u684iTwUYZQQmo1zdVGUmLYq0DyfHFK9GY=
X-Received: by 2002:a05:600c:64c5:b0:43c:fbbf:7bf1 with SMTP id
 5b1f17b1804b1-44c935dbb26mr154130975e9.30.1748382676721; Tue, 27 May 2025
 14:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU=iuVFo=VJjV7UM-fLTeZk9TwyOJwojOVOSJiniRneHA@mail.gmail.com>
In-Reply-To: <CAMuHMdU=iuVFo=VJjV7UM-fLTeZk9TwyOJwojOVOSJiniRneHA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 May 2025 22:50:49 +0100
X-Gm-Features: AX0GCFuy7yj7FMfp_Z7mMaw3r7sy2VKYqtHUV1JYbr6knOb5H8IscDUwp3nPA_k
Message-ID: <CA+V-a8sOGEEajx9TQsVBb+NeFRUx2eSo81ZdRQMsLzd0Eiox2w@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] clk: renesas: rzv2h-cpg: Add support for DSI clocks
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
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
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

Thank you for the review.

On Fri, May 23, 2025 at 3:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar, Fabrizio,
>
> On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and PLLDSI divider clocks.
> >
> > Introduce the `renesas-rzv2h-dsi.h` header to centralize and share
> > PLLDSI-related data structures, limits, and algorithms between the RZ/V=
2H
> > CPG and DSI drivers.
> >
> > The DSI PLL is functionally similar to the CPG's PLLDSI, but has slight=
ly
> > different parameter limits and omits the programmable divider present i=
n
> > CPG. To ensure precise frequency calculations-especially for milliHz-le=
vel
> > accuracy needed by the DSI driver-the shared algorithm allows both driv=
ers
> > to compute PLL parameters consistently using the same logic and input
> > clock.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -48,6 +53,7 @@
> >  #define CPG_PLL_STBY(x)                ((x))
> >  #define CPG_PLL_STBY_RESETB    BIT(0)
> >  #define CPG_PLL_STBY_RESETB_WEN        BIT(16)
> > +#define CPG_PLL_STBY_SSCGEN_WEN BIT(18)
>
> CPG_PLL_STBY_SSC_EN_WEN?
>
OK, I will rename it as above.

> >  #define CPG_PLL_CLK1(x)                ((x) + 0x004)
> >  #define CPG_PLL_CLK1_KDIV(x)   ((s16)FIELD_GET(GENMASK(31, 16), (x)))
>
> You are already using FIELD_GET() for extracting the K, M, P, and
> S fields, but are still still open-coding shifts for writing in
> rzv2h_cpg_pll_set_rate().
>
> What about replacing CPG_PLL_CLK1_KDIV() by:
>
>     #define CPG_PLL_CLK1_DIV_K    GENMASK(31,16)
>
> Then the code can use:
>
>     (s16)FIELD_GET(CPG_PLL_CLK1_DIV_K, clk1)
>
> for reading and:
>
>     FIELD_PREP(CPG_PLL_CLK1_DIV_K, (u16)k) | ...
>
> for writing?
>
> Same for the M, P, and S fields (but without the s16/u16 casts, as
> they are unsigned, unlike K).
>
Ok, I will update the macros as below:
#define CPG_PLL_CLK1_KDIV      GENMASK(31, 16)
#define CPG_PLL_CLK1_MDIV      GENMASK(15, 6)
#define CPG_PLL_CLK1_PDIV      GENMASK(5, 0)
#define CPG_PLL_CLK2_SDIV      GENMASK(2, 0)

> >  #define CPG_PLL_CLK1_MDIV(x)   FIELD_GET(GENMASK(15, 6), (x))
>
> > @@ -198,6 +227,188 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw=
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
> > +       div &=3D clk_div_mask(ddiv.width);
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
> > +       u64 rate_millihz;
> > +
> > +       /*
> > +        * Adjust the requested clock rate (`req->rate`) to ensure it f=
alls within
> > +        * the supported range of 5.44 MHz to 187.5 MHz.
> > +        */
> > +       req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> > +
> > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > +       if (rate_millihz =3D=3D dsi_dividers->error_millihz + dsi_divid=
ers->freq_millihz)
> > +               goto exit_determine_rate;
> > +
> > +       if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> > +                                                dsi_dividers, rate_mil=
lihz)) {
> > +               dev_err(priv->dev,
> > +                       "failed to determine rate for req->rate: %lu\n"=
,
> > +                       req->rate);
> > +               return -EINVAL;
> > +       }
> > +
> > +exit_determine_rate:
> > +       req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;
>
> Shouldn't this also update req->rate with the actual rate?
>
>     req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_dividers->freq_millihz, MILLI=
);
>
Agreed, I will update it.

> Would it help the DSI driver if this clock would provide a
> .recalc_accuracy() callback that takes into account the difference
> between req->rate and dsi_dividers->freq_millihz?
> Or would that be considered abuse of the accuracy concept?
>
Our understanding is that this describes how precisely a clock keeps
time. A clock with 1 ppb accuracy will gain or lose one second in
approximately 31.5 million seconds (1 year). In our case the meaning
is completely different.

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
> > +       bool div_found =3D false;
> > +       u32 val, shift, div;
> > +
> > +       div =3D dsi_dividers->csdiv;
> > +       for (clkt =3D dsi_div->dtable; clkt->div; clkt++) {
> > +               if (clkt->div =3D=3D div) {
> > +                       div_found =3D true;
> > +                       break;
> > +               }
> > +       }
> > +
> > +       if (!div_found)
> > +               return -EINVAL;
> > +
> > +       shift =3D ddiv.shift;
> > +       val =3D readl(priv->base + ddiv.offset) | DDIV_DIVCTL_WEN(shift=
);
> > +       val &=3D ~(clk_div_mask(ddiv.width) << shift);
> > +       val |=3D (u32)clkt->val << shift;
>
> No need for the cast.
>
Agreed, I will drop it.

> > +       writel(val, priv->base + ddiv.offset);
> > +
> > +       return 0;
> > +};
> > +
> > +static const struct clk_ops rzv2h_cpg_plldsi_div_ops =3D {
> > +       .recalc_rate =3D rzv2h_cpg_plldsi_div_recalc_rate,
> > +       .determine_rate =3D rzv2h_cpg_plldsi_div_determine_rate,
> > +       .set_rate =3D rzv2h_cpg_plldsi_div_set_rate,
> > +};
>
> > +static long rzv2h_cpg_plldsi_round_rate(struct clk_hw *hw,
> > +                                       unsigned long rate,
> > +                                       unsigned long *parent_rate)
> > +{
> > +       return clamp(rate, 25000000UL, 375000000UL);
>
> This only brings the desired rate into the supported range, but does
> not round it to the nearest rate that is actually supported.
>
Agreed. Actually I'll replace round rate with .determine_rate() for
the next iteration.

> > +}
> > +
> > +static int rzv2h_cpg_pll_set_rate(struct clk_hw *hw,
> > +                                 unsigned long rate,
> > +                                 unsigned long parent_rate)
> > +{
> > +       struct pll_clk *pll_clk =3D to_pll(hw);
> > +       struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> > +       struct rzv2h_plldsi_parameters *dsi_dividers;
> > +       struct pll pll =3D pll_clk->pll;
> > +       u16 offset =3D pll.offset;
> > +       u32 val;
> > +       int ret;
> > +
> > +       /* Put PLL into standby mode */
> > +       writel(CPG_PLL_STBY_RESETB_WEN, priv->base + CPG_PLL_STBY(offse=
t));
> > +       ret =3D readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offs=
et),
> > +                                       val, !(val & CPG_PLL_MON_LOCK),
> > +                                       100, 2000);
> > +       if (ret) {
> > +               dev_err(priv->dev, "Failed to put PLLDSI into standby m=
ode");
> > +               return ret;
> > +       }
> > +
> > +       dsi_dividers =3D &priv->plldsi_div_parameters;
> > +       /* Output clock setting 1 */
> > +       writel((dsi_dividers->k << 16) | (dsi_dividers->m << 6) | (dsi_=
dividers->p),
>
> This is where you want to use FIELD_PREP().
>
Ok, I'll replace it with below:
       writel(FIELD_PREP(CPG_PLL_CLK1_KDIV, (u16)dsi_dividers->k) |
             FIELD_PREP(CPG_PLL_CLK1_MDIV, dsi_dividers->m) |
             FIELD_PREP(CPG_PLL_CLK1_PDIV, dsi_dividers->p),
             priv->base + CPG_PLL_CLK1(offset));

> > +              priv->base + CPG_PLL_CLK1(offset));
> > +
> > +       /* Output clock setting 2 */
> > +       val =3D readl(priv->base + CPG_PLL_CLK2(offset));
> > +       writel((val & ~GENMASK(2, 0)) | dsi_dividers->s,
>
> (val & ~CPG_PLL_CLK2_DIV_S) | FIELD_PREP(...)
>
Agreed, I will replace it with `writel((val & ~CPG_PLL_CLK2_SDIV) |
FIELD_PREP(CPG_PLL_CLK2_SDIV, dsi_dividers->s),`

> > +              priv->base + CPG_PLL_CLK2(offset));
> > +
> > +       /* Put PLL to normal mode */
> > +       writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
> > +              priv->base + CPG_PLL_STBY(offset));
> > +
> > +       /* PLL normal mode transition, output clock stability check */
> > +       ret =3D readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offs=
et),
> > +                                       val, (val & CPG_PLL_MON_LOCK),
> > +                                       100, 2000);
> > +       if (ret) {
> > +               dev_err(priv->dev, "Failed to put PLLDSI into normal mo=
de");
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +};
> > +
> >  static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
> >                                                    unsigned long parent=
_rate)
> >  {
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > @@ -100,6 +100,7 @@ struct smuxed {
> >  #define CPG_CDDIV3             (0x40C)
> >  #define CPG_CDDIV4             (0x410)
> >  #define CPG_CSDIV0             (0x500)
> > +#define CPG_CSDIV1             (0x504)
>
> Unused until [PATCH v5 2/4], so please move it there.
>
I'll move this patch 2/4

> >
> >  #define CDDIV0_DIVCTL1 DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
> >  #define CDDIV0_DIVCTL2 DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
>
> > --- /dev/null
> > +++ b/include/linux/clk/renesas-rzv2h-dsi.h
> > @@ -0,0 +1,211 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Renesas RZ/V2H(P) DSI CPG helper
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
> > +#ifndef __RENESAS_RZV2H_DSI_H__
> > +#define __RENESAS_RZV2H_DSI_H__
> > +
> > +#include <linux/limits.h>
> > +#include <linux/math.h>
> > +#include <linux/math64.h>
> > +#include <linux/units.h>
> > +
> > +#define OSC_CLK_IN_MEGA                (24 * MEGA)
> > +
> > +struct rzv2h_pll_div_limits {
> > +       struct {
> > +               u32 min;
> > +               u32 max;
> > +       } fvco;
> > +
> > +       struct {
> > +               u16 min;
> > +               u16 max;
> > +       } m;
> > +
> > +       struct {
> > +               u8 min;
> > +               u8 max;
> > +       } p;
> > +
> > +       struct {
> > +               u8 min;
> > +               u8 max;
> > +       } s;
> > +
> > +       struct {
> > +               s16 min;
> > +               s16 max;
> > +       } k;
> > +
> > +       struct {
> > +               u8 min;
> > +               u8 max;
> > +       } csdiv;
> > +};
> > +
> > +struct rzv2h_plldsi_parameters {
> > +       u64 freq_millihz;
> > +       s64 error_millihz;
> > +       u16 m;
> > +       s16 k;
> > +       u8 csdiv;
> > +       u8 p;
> > +       u8 s;
> > +};
> > +
> > +#define RZV2H_CPG_PLL_DSI_LIMITS(name)                                =
 \
> > +       static const struct rzv2h_pll_div_limits (name) =3D {          =
   \
> > +               .fvco =3D { .min =3D 1600 * MEGA, .max =3D 3200 * MEGA =
},     \
> > +               .m =3D { .min =3D 64, .max =3D 533 },                  =
       \
> > +               .p =3D { .min =3D 1, .max =3D 4 },                     =
       \
> > +               .s =3D { .min =3D 0, .max =3D 6 },                     =
       \
> > +               .k =3D { .min =3D -32768, .max =3D 32767 },            =
       \
> > +               .csdiv =3D { .min =3D 2, .max =3D 32 },                =
       \
> > +       }                                                              =
 \
> > +
> > +/**
> > + * rzv2h_dsi_get_pll_parameters_values - Finds the best combination of=
 PLL parameters
> > + * and divider value for a given frequency.
> > + *
> > + * @limits: Pointer to the structure containing the limits for the PLL=
 parameters and
> > + * divider values
> > + * @pars: Pointer to the structure where the best calculated PLL param=
eters and divider
> > + * values will be stored
> > + * @freq_millihz: Target output frequency in millihertz
> > + *
> > + * This function calculates the best set of PLL parameters (M, K, P, S=
) and divider
> > + * value (CSDIV) to achieve the desired frequency.
> > + * There is no direct formula to calculate the PLL parameters and the =
divider value,
> > + * as it's an open system of equations, therefore this function uses a=
n iterative
> > + * approach to determine the best solution. The best solution is one t=
hat minimizes
> > + * the error (desired frequency - actual frequency).
> > + *
> > + * Return: true if a valid set of divider values is found, false other=
wise.
> > + */
> > +static __maybe_unused bool
> > +rzv2h_dsi_get_pll_parameters_values(const struct rzv2h_pll_div_limits =
*limits,
> > +                                   struct rzv2h_plldsi_parameters *par=
s,
> > +                                   u64 freq_millihz)
> > +{
> > +       struct rzv2h_plldsi_parameters p, best;
> > +
> > +       /* Initialize best error to maximum possible value */
> > +       best.error_millihz =3D S64_MAX;
> > +
> > +       for (p.csdiv =3D limits->csdiv.min; p.csdiv <=3D limits->csdiv.=
max; p.csdiv +=3D 2) {
> > +               for (p.p =3D limits->p.min; p.p <=3D limits->p.max; p.p=
++) {
> > +                       u32 fref =3D OSC_CLK_IN_MEGA / p.p;
> > +
> > +                       for (p.s =3D limits->s.min; p.s <=3D limits->s.=
max; p.s++) {
> > +                               u16 two_pow_s =3D 1 << p.s;
> > +                               u16 divider =3D two_pow_s * p.csdiv;
>
> No need for two_pow_s.  You can initialize divider =3D p.csdiv << s.min
> at the start of the loop, and multiply by two after each iteration.
>
Agreed, I'll replace it with something like below:

                       for (divider =3D p.csdiv << limits->s.min, p.s =3D
limits->s.min;
                            p.s <=3D limits->s.max; p.s++, divider *=3D 2) =
{

> > +
> > +                               for (p.m =3D limits->m.min; p.m <=3D li=
mits->m.max; p.m++) {
> > +                                       u64 output_m, output_k_range;
> > +                                       s64 pll_k, output_k;
> > +                                       u64 fvco, output;
> > +
> > +                                       /*
> > +                                        * The frequency generated by t=
he combination of the
> > +                                        * PLL + divider is calculated =
as follows:
> > +                                        *
> > +                                        * Freq =3D Ffout / csdiv
> > +                                        *
> > +                                        * With:
> > +                                        * Ffout =3D Ffvco / 2^(pll_s)
> > +                                        * Ffvco =3D (pll_m + (pll_k / =
65536)) * Ffref
> > +                                        * Ffref =3D 24MHz / pll_p
> > +                                        *
> > +                                        * Freq can also be rewritten a=
s:
> > +                                        * Freq =3D Ffvco / (2^(pll_s) =
* csdiv))
> > +                                        *      =3D Ffvco / divider
> > +                                        *      =3D (pll_m * Ffref) / d=
ivider + ((pll_k / 65536) * Ffref) / divider
> > +                                        *      =3D output_m + output_k
> > +                                        *
> > +                                        * Every parameter has been det=
ermined at this point, but pll_k.
> > +                                        * Considering that:
> > +                                        * -32768 <=3D pll_k <=3D 32767
> > +                                        * Then:
> > +                                        * -0.5 <=3D (pll_k / 65536) < =
0.5
> > +                                        * Therefore:
> > +                                        * -Ffref / (2 * divider) <=3D =
output_k < Ffref / (2 * divider)
> > +                                        */
> > +
> > +                                       /* Compute output M component (=
in mHz) */
> > +                                       output_m =3D DIV_ROUND_CLOSEST_=
ULL(p.m * fref * 1000ULL,
>
> "p.m * fref" may overflow =3D> mul_u32_u32(p.m, fref) * MILLI;
>
Agreed, I'll switch to mul_u32_u32().

> > +                                                                      =
  divider);
> > +                                       /* Compute range for output K (=
in mHz) */
> > +                                       output_k_range =3D DIV_ROUND_CL=
OSEST_ULL(fref * 1000ULL,
>
> mul_u32_u32(fref, MILLI)
>
OK.

> > +                                                                      =
        divider * 2);
> > +                                       /*
> > +                                        * No point in continuing if we=
 can't achieve the
> > +                                        * desired frequency
> > +                                        */
> > +                                       if (freq_millihz <  (output_m -=
 output_k_range) ||
> > +                                           freq_millihz >=3D (output_m=
 + output_k_range))
> > +                                               continue;
> > +
> > +                                       /*
> > +                                        * Compute the K component
> > +                                        *
> > +                                        * Since:
> > +                                        * Freq =3D output_m + output_k
> > +                                        * Then:
> > +                                        * output_k =3D Freq - output_m
> > +                                        *          =3D ((pll_k / 65536=
) * Ffref) / divider
> > +                                        * Therefore:
> > +                                        * pll_k =3D (output_k * 65536 =
* divider) / Ffref
> > +                                        */
> > +                                       output_k =3D freq_millihz - out=
put_m;
> > +                                       pll_k =3D div64_s64(output_k * =
65536ULL * divider, fref);
>
> div_s64(), as fref is 32-bit.
>
OK.

> > +                                       pll_k =3D DIV_S64_ROUND_CLOSEST=
(pll_k, 1000);
>
> MILLI
>
OK.

> > +
> > +                                       /* Validate K value within allo=
wed limits */
> > +                                       if (pll_k < limits->k.min || pl=
l_k > limits->k.max)
> > +                                               continue;
> > +
> > +                                       p.k =3D pll_k;
> > +
> > +                                       /* Compute (Ffvco * 65536) */
> > +                                       fvco =3D ((p.m * 65536ULL) + p.=
k) * fref;
>
> mul_u32(p.m * 65536 + p.k, fref)
>
OK, I'll switch to the above.

> I guess the compiler is sufficiently smart to turn that into a shift.
> The alternative would be to use a cast (I try to avoid them) and a shift:
>
> mul_u32((u64)p.m << 16 + p.k, fref)
>
> > +                                       if ((fvco < (limits->fvco.min *=
 65536ULL)) ||
> > +                                           (fvco > (limits->fvco.max *=
 65536ULL)))
>
> mul_u32_u32(..., 65536) for both
>
Agreed.

> > +                                               continue;
> > +
> > +                                       /* PLL_M component of (output *=
 65536 * PLL_P) */
> > +                                       output =3D p.m * 65536ULL * OSC=
_CLK_IN_MEGA;
>
> mul_u32(p.m * 65536, OSC_CLK_IN_MEGA)
>
OK, I'll switch to mul_u32_u32().

> > +                                       /* PLL_K component of (output *=
 65536 * PLL_P) */
> > +                                       output +=3D p.k * OSC_CLK_IN_ME=
GA;
> > +                                       /* Make it in mHz */
> > +                                       output *=3D 1000ULL;
>
> No need for the ULL =3D> MILLI
Agreed, I will drop it.

>
> > +                                       output /=3D 65536ULL * p.p * di=
vider;
>
> mul_u32()
>
> No rounding for the division?
>
Indeed, we missed it. Actually I drop the mul_u32_u32() suggestion
just use the below:

output =3D DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);

Cheers,
Prabhakar
