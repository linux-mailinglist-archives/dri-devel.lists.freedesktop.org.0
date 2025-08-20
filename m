Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5DAB2E735
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 23:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EC910E364;
	Wed, 20 Aug 2025 21:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KJL5BGn0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8320210E364
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 21:10:39 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45a1b004a31so2096425e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755724238; x=1756329038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zhfVPOqQ7qiTgD9cHx5brMif8atNPzf9ZTrTf/HRcG0=;
 b=KJL5BGn0tR9tMjqPHJPXoxrQqGGFVxylV2/53CjSSX+e42bWYHNaUDd3Asx3Nlk3oD
 4t9CNdKzCXsg8hJh2dwhdW89DDeAj8g/DkY9yZaigrIFOsPSunKlaMAwU+sKuHXRNSOI
 7EOJuYFrQ/vEY+ri2ED5mV0C60ZUItvyrVn7joWkqCO7bsi+JGLM0wl/blIojilzM0cd
 LVPHfKQij0rOyqm8ShdPXHtXXcmhGO7nMwwV8tZxEfqm+PSBo6QxJA6TWWb0YCd7t9pH
 3eJWga/mfry1Ula7GyENoNFh9xqadUwcV8KOosZCshZUiZhxR043iEtLslm6+ySgkj2c
 LbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755724238; x=1756329038;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zhfVPOqQ7qiTgD9cHx5brMif8atNPzf9ZTrTf/HRcG0=;
 b=cWN0jAYODTEgLW1HJjBy5AWMVPUw5QNsL35k3e0fRcFqk2xTUkcI0pzPEg8VeJppRk
 ZmJzsTGuOQAmQomwhowOFEkj24aiBWS4xPYQWOOg9zuD5+hUGtBViQOTR49W3vWF407m
 zIFNTIpqJlHaUmEhcS5s09YZ2YmuNauqnPTUuVQ9bFyJtP/UVgihg4DbNE0n959hdwvd
 mxOrh7Lms9sct5bQFhV5+7yHM1lA0mzqIi0pdWeFEKeybetH1fv4VyW5ZWp/UzlBPAix
 B8wqJjOB1ojaussHYmMuKefAwYhSABWUmZhtcQX6ocX5f5GBHjxrlAThCMKeLGfZgKDe
 gE6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0+OV/zVNLzWyLIRdP7ngiqL6QOgNao8nR3VOjJnXspnibiIWiJRufKXjd4bvWetxkbMebF8kSvfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD4WZRQ0sY3HsF/YfSumb0SbFDz49yGwR5gcn9INZyev0+FuS+
 GpkTXIIbT5lao7qHznVpLjAvTbVKffQQUkW94jg6ZUkHFFK57Rl6mAPVl/f+p/N6ipkb8LzI7og
 CoDhtQCeAFOtgDqdMu75Kp8AuQ+wrMDM=
X-Gm-Gg: ASbGncso3Gw8bgHRajOFX09+pUmzcBbdFW/WeE5y25gAngp5d79Dz0lCWl9FGoMZCYG
 13GHHsCUX9OYF7M/sM7e2ixzkPUbDxjmHzmoJ1LnDpLrBdqQB//zwpJ1Yu8k2cQ9fQjqDFRnzkA
 b2ya5+7jjJEgEs7ZV4r2pXQcBXQbEXX0/s/IarmzrEI7AdBIf65pdUF13ChOaFmcVsJK+nAtGVC
 eIq9+XGqWdmkZGxNkOIVFcFS2Zd8/XwCkMUKjMHh3hakJX1Dz1eagSF+47z
X-Google-Smtp-Source: AGHT+IFI/Nnb06sqTePoFm77dEgYckmzlnneC0ypZniz+1v8wwnLkz4GDtRyYURGqAq2iKi4RHM5Hp4u3AVwBZvEW0M=
X-Received: by 2002:a5d:584c:0:b0:3b7:8832:fdcc with SMTP id
 ffacd0b85a97d-3c496da958cmr199184f8f.38.1755724237825; Wed, 20 Aug 2025
 14:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWj=W17j9WHhTR1gH9MZ_fcxve_dOi6eMiL62xphXG+GQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWj=W17j9WHhTR1gH9MZ_fcxve_dOi6eMiL62xphXG+GQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 20 Aug 2025 22:10:11 +0100
X-Gm-Features: Ac12FXxwXYixCbHbInjPUHZeiQbzGNTBadmyQ9W-O0ENxXQq3rvL1U61uQYPnUs
Message-ID: <CA+V-a8vzb=Hin3B2S1zpgMUctyvuwHaqKgotNYm71G=FOvHqXA@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
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

On Tue, Aug 19, 2025 at 2:14=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 28 Jul 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrot=
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
> > ---
> > v6->v7:
> > - Made struct rzv2h_pll_limits more modular also added Ffout limits
> > - Made the alogirithm modular and also added apis based on the
> >   needs for lvds and dpi
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +static struct rzv2h_pll_dsi_info *rzv2h_get_pll_dsi_info(struct clk_hw=
 *pll_dsi,
> > +                                                        struct rzv2h_c=
pg_priv *priv)
> > +{
> > +       struct pll_clk *pll_clk =3D to_pll(pll_dsi);
> > +
> > +       return &priv->pll_dsi_info[pll_clk->pll.instance];
> > +}
>
> This (very simple helper) is used twice, while there are two (almost
> three) other locations where it is open-coded.  Perhaps just open-code
> it everywhere?
>
Sure, I will open code it.

> > @@ -246,7 +526,8 @@ static const struct clk_ops rzv2h_cpg_pll_ops =3D {
> >  static struct clk * __init
> >  rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
> >                            struct rzv2h_cpg_priv *priv,
> > -                          const struct clk_ops *ops)
> > +                          const struct clk_ops *ops,
> > +                          bool is_plldsi)
>
> No need for this parameter...
>
> >  {
> >         struct device *dev =3D priv->dev;
> >         struct clk_init_data init;
> > @@ -263,6 +544,10 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_c=
lk *core,
> >         if (!pll_clk)
> >                 return ERR_PTR(-ENOMEM);
> >
> > +       if (is_plldsi)
>
> ... as you can just test "core->type =3D=3D CLK_TYPE_PLLDSI" here.
>
Agreed, thanks for the pointer.

Cheers,
Prabhakar

> > +               priv->pll_dsi_info[core->cfg.pll.instance].pll_dsi_limi=
ts =3D
> > +                       core->cfg.pll.limits;
> > +
> >         parent_name =3D __clk_get_name(parent);
> >         init.name =3D core->name;
> >         init.ops =3D ops;
>
> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
