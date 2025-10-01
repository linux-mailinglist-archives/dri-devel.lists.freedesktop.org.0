Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435BDBAFDB2
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 11:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917F210E30B;
	Wed,  1 Oct 2025 09:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TPP4PdEg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B3C10E30B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 09:29:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-46e4473d7f6so34321995e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 02:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759310971; x=1759915771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2WKLYLKrfpejFEaruF+EeGPfFEMHs6sMpTeLbEZAdC4=;
 b=TPP4PdEg92Ns9qIhmMCjPvPnw/ZFb7DgPm20e7awJ9iI9cr5wz1aOxkwEiv/FkMK92
 xcuIlwd65G0nsdvviwjEPTv3sLtwkPzw02YQ7+kHRUOyBrDfr55qsqIeiId8F0O5HZH3
 8HNNi+EU8J/ckYsoR9nBXGmKzh41RFUbAZE8F8zT1YLhPLMoQFnpV5/o6o6VrTtj6U5Y
 NSpkypmRpG9dgJmISGofbDIyA3w0yZLKAYKsBHxeIDKXKUl3pZ/JV79hBz9TeLsivrmg
 KKQ/JlmXgTXUOqtZkdc1Wpzhe5xfBM2WDeXrw0x1FYeiQ3u5Rfz02Rbc0kgUG+mVYAfA
 PMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759310971; x=1759915771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2WKLYLKrfpejFEaruF+EeGPfFEMHs6sMpTeLbEZAdC4=;
 b=GMmsKEgjERyzFRA802W45NYLstx13onU0XVcSVYW5maYgEU00GOnacGqI2NGzbl7qT
 2K1tTXfdOYeRDcWgW8+jQdu44TfwZMOkXeEtoRokqdlmqfaHRS8xue3t5KGlU//hRMR2
 jAal4ISu+OPrmINBvH2oEpSLkm2sWohCTYKS7BNryEwwP1k2J+YO9PRctexcy87jikuR
 AdPew6i4LwrKlgYWDHBIhPQaAZkl74ChEVIUysBQoF3K4gFDQL2mKNKJl3bDi94PmwoM
 MCJYz9jUkYRBXNj1Rm8WwvjQDQ4RXrHXmEOi52YErswX+kZ0tIGxdx9CgM+eQ9s4LvQ0
 MPmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq27LiG4/q7xbVNhBFQ1On6z3Lw8I6N092Lizm384EVkx4NkdXm0y3Pxx/4uCagBnUeno4LFlKEAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTe16fXQumqlFCqXUnecg6IqnQ9BNc1R4BTdh2CTMmQjtwdklF
 CvzT7nTxHRgaQhXyf4C5NNY9AkbYdr1I/SmClYRutKd92cIZaJ53bt2lD2hqV1JUM8yRORSxtgW
 OE/NrVjz9BHmVXegILaUnX3Fx2W/eDog=
X-Gm-Gg: ASbGncvfbws5gkerDfpBQaShY/gR/ARorlsqCkes74PbMdVULu1IBbPi1L+38N3EO//
 cilRjPRQvmO0B0h1kkepuR+1SUhrNVbkQv+mjIAdEv18jfRYL4JKA0kF9VpTPdnGISfWp1Gn870
 ouX0Du8vW3HRG5XM2RFroKvqWYIk12lPZyv/7+8psvdy/EFZ4f1eZK7oCJwavIwTmLdgdjx1hnZ
 +9RSaA3R+NVE6qa97enhn6J2VuyGCcV
X-Google-Smtp-Source: AGHT+IFHnGmRHmJr+YpPGsnnoZoqfJyt9jk/+n5kLjP1CHOy6XhDxWRnAYIfrfCsIi4lEcHTSz6IGQr7yPIPxN5B9f4=
X-Received: by 2002:a05:600c:1f96:b0:46e:27f7:80ce with SMTP id
 5b1f17b1804b1-46e612be465mr23677905e9.23.1759310970863; Wed, 01 Oct 2025
 02:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUacF5UfiLTXuWOXAZZvEJ-St5+awkWML_HDp9b38=sXw@mail.gmail.com>
In-Reply-To: <CAMuHMdUacF5UfiLTXuWOXAZZvEJ-St5+awkWML_HDp9b38=sXw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 1 Oct 2025 10:29:03 +0100
X-Gm-Features: AS18NWBlqD2UHra31fOQuHsSKmsMOeniTxCTqefAG_2I-HhVlcZOHoipA4udDNA
Message-ID: <CA+V-a8sr3aMAnf5-RihtCSBFj6f-FYMoM6+NHWrE5A6FVc-zjQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
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

On Wed, Sep 24, 2025 at 2:05=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 3 Sept 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and PLLDSI divider clocks.
> >
> > Introduce the `renesas-rzv2h-cpg-pll.h` header to centralize and share
> > PLLDSI related data structures, limits, and algorithms between the
> > RZ/V2H(P) CPG and DSI drivers.
> >
> > The DSI PLL is functionally similar to the CPG's PLLDSI, but has slight=
ly
> > different parameter limits and omits the programmable divider present i=
n
> > CPG. To ensure precise frequency calculations, especially for milliHz-l=
evel
> > accuracy needed by the DSI driver, the shared algorithm allows both dri=
vers
> > to compute PLL parameters consistently using the same logic and input
> > clock.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > +                                              struct clk_rate_request =
*req)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct pll_clk *pll_clk =3D to_pll(clk_hw_get_parent(hw));
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct rzv2h_pll_div_pars *dsi_params;
> > +       struct rzv2h_pll_dsi_info *dsi_info;
> > +       u64 rate_millihz;
> > +
> > +       dsi_info =3D &priv->pll_dsi_info[pll_clk->pll.instance];
> > +       dsi_params =3D &dsi_info->pll_dsi_parameters;
> > +
> > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > +       if (rate_millihz =3D=3D dsi_params->div.error_millihz + dsi_par=
ams->div.freq_millihz)
> > +               goto exit_determine_rate;
> > +
> > +       if (!rzv2h_get_pll_dtable_pars(dsi_info->pll_dsi_limits, dsi_pa=
rams, dsi_div->dtable,
> > +                                      rate_millihz)) {
> > +               dev_err(priv->dev,
> > +                       "failed to determine rate for req->rate: %lu\n"=
,
> > +                       req->rate);
> > +               return -EINVAL;
> > +       }
> > +
> > +exit_determine_rate:
> > +       req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millih=
z, MILLI);
> > +       req->best_parent_rate =3D req->rate * dsi_params->div.divider_v=
alue;
> > +       dsi_info->req_pll_dsi_rate =3D req->best_parent_rate;
> > +
> > +       return 0;
> > +};
>
> Unneeded semicolon (there are three more below).
I will fix that.

Cheers,
Prabhakar
