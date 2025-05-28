Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25838AC663A
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4685F10E5CD;
	Wed, 28 May 2025 09:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="etNAu3+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538D110E16C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:48:47 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so38247715e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748425726; x=1749030526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YejcQjvowFFKkqN+UPoZNPAf32M6HyCXABg2+FNPRa0=;
 b=etNAu3+A/rMe1vgCki4ur/41OqxovDJ0dVcIaIYQc0anT+p3PrAhHZCHBAbaFijbLE
 FAgT4sFSg0tXVlooQd1BIW9FC4mLk8a6U5ovRJlytASpKt+yioM+GOiQk4ohv3WeOO7Z
 fXYy1x+YQ1lE5O4W929JpiOu1WnO2dtUI2vkHquywDP6sznmLGU8WWP5tYwcytcK2LSW
 IWZWxwR3zDXBuFUOMdygxGmzT1EAFtNqiTHqZMCDHiYb2/3gvIWd/Yp3TVVSoEEwNFky
 AsJpLSIGW4A+xF+4qEF7v3c0izRfxi3sPNcQjJ5To8/g5HahZkRGnrPiIJpK0E6CNm6E
 bcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748425726; x=1749030526;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YejcQjvowFFKkqN+UPoZNPAf32M6HyCXABg2+FNPRa0=;
 b=IasnrYDcixssgzF2qF7m2eDEsa+wysOOSegp7ddaOFOl9ay1lh1lIEGnvydtqLS+UX
 PIFI3Chc9hHtdO94f0UfrBNIRn5BA6R9AavbJM0ZY83XJGna8Oekwg4qCjTD5WiJ4H4M
 gz3VOzlMtrKpUPknD9oCxp+d8+py8kN3bEXB1L/1+spynp2zh2YzQs+ZlUNfT3iVYEhY
 rCBjg2tuxfcCm5ydSPZO2WPfA5L0t3h0PdFSxA0fM6HEkKGwgot/Hdz30mabEtnDi6ui
 nTo9UxXdKM8J5YMNS/Zs5LBds+e3dFgbvMxJ08ablMTRZfpOdvjs4FVZOx2KRPlgPYzS
 oYFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWit8+Lkl8j08GnkdMzBJvLFhdN5fwZxLNRYmarYmPQ8gGygC+2Yf5ETnTkMgcFtyCOleQsSr5UVc8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj9MO3lXd+XMTnQuny727Gbn51jBA7QlTMgmwQMYix6R9PbUBP
 gi9r66xA62MkRe91/EpsNzxPBYL/4LkKlA1f9w6o2p5go/023GVCNfgdSvON9j8V7a7SLPDjYLE
 VY2Ef91spTHhxZcYGVSjqSUXlOz3Odj1mNRULdrs=
X-Gm-Gg: ASbGncvGyXtTKHcGFAxoHLHsnETrs2jwj3Wfi4d8VjSEoOQdfRrksqoCL3SziQS/iDE
 8QlronG8dzzUvmADVWFVZh/TpH8KlibW5U14Siu8JBbhKGnyBLan1YXaJIeuRcYiHxPWTShE8rn
 SkauO4d3pGaMOpe27FkTpZnjPiEP8wjwWKJ/KmcRppXlPv/lbCqXw7n+L8FdzTwAx5lQ==
X-Google-Smtp-Source: AGHT+IFOU92ZFS2S3O0R5SwadRfYVFCtrH9pyzPNYTlNPomarpL8i1KADqoaf8Wf35yeCGDtsi5p0K+tgRPxmCxDFK4=
X-Received: by 2002:a05:600c:6089:b0:444:c28f:e81a with SMTP id
 5b1f17b1804b1-44c94c246b9mr146760025e9.27.1748425726021; Wed, 28 May 2025
 02:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX5_P4R43HOPuZc3JSAOQ5O2xOBDVhVVg1SxU1ucPdbPA@mail.gmail.com>
In-Reply-To: <CAMuHMdX5_P4R43HOPuZc3JSAOQ5O2xOBDVhVVg1SxU1ucPdbPA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 28 May 2025 10:48:20 +0100
X-Gm-Features: AX0GCFvgbR9aYLSei5CukQRvloak3Q9KnXFyd1nNDHatfD-viQKLYa05qK7GLSE
Message-ID: <CA+V-a8sde6Zaz3Z2uDt3OGZ52UBJfR3vQMs4-ZUusDu=oNwFhg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
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

On Fri, May 23, 2025 at 4:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar, Fabrizio,
>
> On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DSI support for Renesas RZ/V2H(P) SoC.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2022 Renesas Electronics Corporation
> >   */
> >  #include <linux/clk.h>
> > +#include <linux/clk/renesas-rzv2h-dsi.h>
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> >  #include <linux/iopoll.h>
> > @@ -30,6 +31,9 @@
> >
> >  #define RZ_MIPI_DSI_FEATURE_16BPP      BIT(0)
> >
> > +#define RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA       (80 * MEGA)
> > +#define RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA       (1500 * MEGA)
>
> RZV2H_MIPI_DPHY_FOUT_M{IN,AX}_IN_MHZ?
>
Ok, I'll rename them as above.

> > +
> >  struct rzg2l_mipi_dsi;
> >
> >  struct rzg2l_mipi_dsi_hw_info {
> > @@ -40,6 +44,7 @@ struct rzg2l_mipi_dsi_hw_info {
> >                               u64 *hsfreq_millihz);
> >         unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
> >                                             unsigned long mode_freq);
> > +       const struct rzv2h_pll_div_limits *cpg_dsi_limits;
> >         u32 phy_reg_offset;
> >         u32 link_reg_offset;
> >         unsigned long max_dclk;
> > @@ -47,6 +52,11 @@ struct rzg2l_mipi_dsi_hw_info {
> >         u8 features;
> >  };
> >
> > +struct rzv2h_dsi_mode_calc {
> > +       unsigned long mode_freq;
> > +       u64 mode_freq_hz;
>
> Interesting... I guess mode_freq is not in Hz?
>
Actually it is int Hz, I will make it unsigned long.

> > +};
> > +
> >  struct rzg2l_mipi_dsi {
> >         struct device *dev;
> >         void __iomem *mmio;
>
> > +static u16 rzv2h_dphy_find_ulpsexit(unsigned long freq)
> > +{
> > +       static const unsigned long hsfreq[] =3D {
> > +               1953125UL,
> > +               3906250UL,
> > +               7812500UL,
> > +               15625000UL,
> > +       };
> > +       static const u16 ulpsexit[] =3D {49, 98, 195, 391};
> > +       unsigned int i;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(hsfreq); i++) {
> > +               if (freq <=3D hsfreq[i])
> > +                       break;
> > +       }
> > +
> > +       if (i =3D=3D ARRAY_SIZE(hsfreq))
> > +               i -=3D 1;
>
> i--
>
OK.

> > +
> > +       return ulpsexit[i];
> > +}
> > +
> > +static u16 rzv2h_dphy_find_timings_val(unsigned long freq, u8 index)
> > +{
> > +       const struct rzv2h_mipi_dsi_timings *timings;
> > +       u16 i;
> > +
> > +       timings =3D &rzv2h_dsi_timings_tables[index];
> > +       for (i =3D 0; i < timings->len; i++) {
> > +               unsigned long hsfreq =3D timings->hsfreq[i] * 10000000U=
L;
>
> (I wanted to say "MEGA", but then I noticed the 7th zero ;-)
>
> 10 * MEGA?
>
Agreed, I will update it as above.

> > +
> > +               if (freq <=3D hsfreq)
> > +                       break;
> > +       }
> > +
> > +       if (i =3D=3D timings->len)
> > +               i -=3D 1;
>
> i--
>
> > +
> > +       return timings->start_index + i;
> > +};
> > +
> >  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 r=
eg, u32 data)
> >  {
> >         iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
> > @@ -308,6 +479,158 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi=
_dsi *dsi, unsigned long mode_f
> >         return 0;
> >  }
> >
> > +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *d=
si,
> > +                                             unsigned long mode_freq)
> > +{
> > +       struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_pa=
rameters;
> > +       u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
> > +       struct rzv2h_plldsi_parameters cpg_dsi_parameters;
> > +       unsigned int bpp, i;
> > +
> > +       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +
> > +       for (i =3D 0; i < 10; i +=3D 1) {
> > +               unsigned long hsfreq;
> > +               bool parameters_found;
> > +
> > +               mode_freq_hz =3D mode_freq * MILLI + i;
>
> KILO?
>
OK, as mode_freq_hz is in Hz I'll make it unsigned long.

> And I guess you want to use mul_u32_u32(), as mode_freq_hz is u64?
>
and use mul_u32_u32() below...
> > +               mode_freq_millihz =3D mode_freq_hz * MILLI * 1ULL;
>
> Why * 1ULL?
>
Agreed, not needed, I will use mul_u32_u32() here.

> > +               parameters_found =3D rzv2h_dsi_get_pll_parameters_value=
s(dsi->info->cpg_dsi_limits,
> > +                                                                      =
&cpg_dsi_parameters,
> > +                                                                      =
mode_freq_millihz);
> > +               if (!parameters_found)
> > +                       continue;
> > +
> > +               hsfreq_millihz =3D DIV_ROUND_CLOSEST_ULL(cpg_dsi_parame=
ters.freq_millihz * bpp,
> > +                                                      dsi->lanes);
> > +               parameters_found =3D rzv2h_dsi_get_pll_parameters_value=
s(&rzv2h_plldsi_div_limits,
> > +                                                                      =
dsi_parameters,
> > +                                                                      =
hsfreq_millihz);
> > +               if (!parameters_found)
> > +                       continue;
> > +
> > +               if (abs(dsi_parameters->error_millihz) >=3D 500)
> > +                       continue;
> > +
> > +               hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI)=
;
> > +               if (hsfreq >=3D RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA &&
> > +                   hsfreq <=3D RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA) {
> > +                       dsi->mode_calc.mode_freq_hz =3D mode_freq_hz;
> > +                       dsi->mode_calc.mode_freq =3D mode_freq;
> > +                       return MODE_OK;
> > +               }
> > +       }
> > +
> > +       return MODE_CLOCK_RANGE;
> > +}
>
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> > @@ -40,6 +40,39 @@
> >  #define DSIDPHYTIM3_THS_TRAIL(x)       ((x) << 8)
> >  #define DSIDPHYTIM3_THS_ZERO(x)                ((x) << 0)
> >
> > +/* RZ/V2H DPHY Registers */
> > +#define PLLENR                         0x000
> > +#define PLLENR_PLLEN                   BIT(0)
> > +
> > +#define PHYRSTR                                0x004
> > +#define PHYRSTR_PHYMRSTN               BIT(0)
> > +
> > +#define PLLCLKSET0R                    0x010
> > +#define PLLCLKSET0R_PLL_S(x)           ((x) << 0)
>
>  #define PLLCLKSET0R_PLL_S GENMASK(2, 0)
>
> and after that you can use FIELD_PREP(PLLCLKSET0R_PLL_S, x) in the code.
> More opportunities for masks below...
>
Thanks, I will make use of GENMASK/FIELD_PREP macros.

Cheers,
Prabhakar
