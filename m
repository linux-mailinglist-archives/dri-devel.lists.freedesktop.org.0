Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC37A9359A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 11:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D360610EB6E;
	Fri, 18 Apr 2025 09:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cLpiG6bb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D8110E209
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 09:51:57 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso11802185e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 02:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744969916; x=1745574716; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LTriGcJf1+d2mqFYAg9DFYbIx+5WzZgXxQPOJC5ixQk=;
 b=cLpiG6bbTugtzCIZRkv6LlowVUd0mDfTwzdSnHjB1AcfuW9jRz+ETwEdTFiXekGTAK
 QK6hD1StHYrcqGnVgI4VM6J2BPPlqjglwDuG2MVNlgX810491jTOZhOOh+ACLHcrNLN0
 fhsSD7yCe6CvjzKwtCNqTfry+/e0MpCH73WfKD3+icaMMuHxh/hXPlQ9ZcoByB/wy3Zn
 DWjzYbeya55M9YeV5Taus73YTn9U1hRRggZiK/du0rgrEpN4s4Z9LfVqpsi1d27YfEJG
 8kudvt72QrKSQkKOWDs6+0pybW/bNuN5tkquxTj6qazH4ahofTO60yuh8iWqsJ60jBWv
 4tpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744969916; x=1745574716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LTriGcJf1+d2mqFYAg9DFYbIx+5WzZgXxQPOJC5ixQk=;
 b=Y0dZtmJf5yQ11qR2NEirKCCTspn+CB9HOZRPNAP9C/yS3SogCGCY9rkN2tIYYULCGO
 Q3TrbKmJmy/SdZdiVFeSlmE4lh++R8M1mcV1alXR277kwC7Y65bmWLYVM00S2gQKsCaX
 zO4eYFk531YMAPF4c5gFUETZaisDQ5mU0+vcUatT4Tjsl7TEP3BGUPnOg5TkP9snKtm1
 MrBRcQWzSKLz4r93K7xxtkk9jmwDIoxZaFa33bMmSABJAcRu75EO4K0AG4q5rxcQA8gE
 qUSjN0Vlrl0xgI5FfjdUE3KDro7azDRDvkf+DZ4PNV42fklZ1keuCYsGyqa8ZmpUj/xG
 wS/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3xhcvxliXm72R+Ek9tPssnA1q+44FbYcigXMLH/OVynEs3akqt8PXcZ0+ji6oNa6KoRxZw0jqjIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJa9Y1gD3PmDyy410uGv/CEmdlQ/x22luDe8lTa5b+0Jp1oXHi
 08QJnNaFqUBwcHGDoE46Vd1+0RkWqA4VAGkeop9FouK3xKm4U6yMDU2YRe+QW1fKIDXjBXGpK1w
 ykyMlkHTYxHESoF3F772wa2vMq8o=
X-Gm-Gg: ASbGncvP8FhO3WXSnVOxrZJetDIrBDmz8F8HgTKEGilPQsaBxWFKMvMfHQEjMaYD4Is
 VF66cwz6ALElVih4arXwUjVb0HQblW+yNHNG6h1Coo1O/rY2HmxOF8J/mF6sm8d7i+oN2XIGC4i
 YCEX4cYn3NR1J6y7KpC6G7G08QxBFOL2TwNRGdNsr2aHQR8fQcNeXC3hTp/ho2G2Kwxw==
X-Google-Smtp-Source: AGHT+IH+R0wDsPZxpttzWIBTizKL16OUAhkIs8Ybf3Z1XefroUvyq7u8MBaLKEnIreBCTXJI7j1Hi4bmT3L3IR1EI3Q=
X-Received: by 2002:a05:6000:40ce:b0:39e:cbd2:9211 with SMTP id
 ffacd0b85a97d-39efbaf70b4mr1420004f8f.55.1744969915990; Fri, 18 Apr 2025
 02:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW9WhKeMyKfdiLWmLC8mabNe-4ROW5uCZhx6z503GE0Ug@mail.gmail.com>
In-Reply-To: <CAMuHMdW9WhKeMyKfdiLWmLC8mabNe-4ROW5uCZhx6z503GE0Ug@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Apr 2025 10:51:29 +0100
X-Gm-Features: ATxdqUGJ33rQ0RpZLlTvPOwYpzkjsOoa22XiNfmq9rKmqKxtHcumo8VUIXPTNAE
Message-ID: <CA+V-a8tCtVQA3DnzKMy+4gZDwZqhg29E0H+7cS0YojFkQ2Os_g@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, Apr 15, 2025 at 4:57=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and PLLDSI divider clocks.
> >
> > The `renesas-rzv2h-dsi.h` header file is added to share the PLL divider
> > algorithm between the CPG and DSI drivers.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
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
> > +
> > +       /*
> > +        * Adjust the requested clock rate (`req->rate`) to ensure it f=
alls within
> > +        * the supported range of 5.44 MHz to 187.5 MHz.
> > +        */
> > +       req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> > +
> > +       rate_mhz =3D req->rate * MILLI * 1ULL;
>
> The first multiplication overflows on 32-bit systems.
> Probably you wanted to use mul_u32_u32() instead?
>
Ok, I'll switch to mul_u32_u32() .

> More review later, I fell too deep in the wrong rabbit hole ("mhz !=3D
> megaHertz"), again...
>
After fixing the review comments on this I'll send out a v3 with this
change, so that its easier to review.

> > --- /dev/null
> > +++ b/include/linux/clk/renesas-rzv2h-dsi.h
> > @@ -0,0 +1,207 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Renesas RZ/V2H(P) DSI CPG helper
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
> > +
> > +#include <linux/limits.h>
> > +#include <linux/math.h>
> > +#include <linux/math64.h>
> > +#include <linux/units.h>
> > +
> > +#define OSC_CLK_IN_MEGA                (24 * MEGA)
> > +
> > +struct rzv2h_plldsi_div_limits {
> > +       struct {
> > +               u64 min;
> > +               u64 max;
>
> u32 should be sufficient?
>
Agreed.

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
> > +       u64 freq_mhz;
> > +       s64 error_mhz;
> > +       u16 m;
> > +       s16 k;
> > +       u8 csdiv;
> > +       u8 p;
> > +       u8 s;
> > +};
> > +
> > +#define RZV2H_CPG_PLL_DSI_LIMITS(name)                                =
 \
> > +       static const struct rzv2h_plldsi_div_limits (name) =3D {       =
   \
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
> > +               .fvco =3D { .min =3D 1600 * MEGA, .max =3D 3200 * MEGA =
}      \
>
> Please initialize the members in declaration order.
>
Ok.

Cheers,
Prabhakar
