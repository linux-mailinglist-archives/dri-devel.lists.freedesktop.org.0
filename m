Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C90AAC62A1
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 09:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E8110E593;
	Wed, 28 May 2025 07:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4002310E596
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 07:09:38 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-52d9a275c27so2596049e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 00:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748416176; x=1749020976;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRJM+2U0wpi1bojafvsrSUpFWh6L8i7gfnVXkXPRlF4=;
 b=DHAvvw86o2dUe9xAeofn6XyIwacxET3D+ZekyxIIFnMnaPs/syoEla5Z2qHdJJmX9X
 ecKifulrn9S1bGaJFPbqIYo2TP+kRrriDCKRRQOSFHbKHhElKdCAx6szXcMHOkX66luf
 vGgaBcjdP86FLFfFaXMy49dUW0kvdGS//wlpw2y321gSQczYP1lNTl3sJvp/pbAw1Vvc
 FWJDgqiafrv2n2qnpA4cjT0G5OosHlZaLIoBZSYVH6290Ws7qhd160zx9XUfOVizm1rk
 Ub+3un99wXzQZ15Ck+CLPEcey7RUHiKg3P95nQHMnkuDnJvFig6ols9pLCKjRMfmiO4d
 9VSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRBpe9J7ny5Mld1/OWK5KmshuQYyXN9drvdEjzj9zFlIblzPv+iGImGxZYimKod8ntFwjqjiL8AE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/U6s08EqfWz6BFte31tntaL/qnZz0rYv3w0CnNwFo/a4CtK7H
 zHf2xzrAj5MLz+hnpclaxM1S571pIuZ7G/P+Y6bILr/BrqJKauR9KT4eikqNuNAn
X-Gm-Gg: ASbGncswZchNm/V0f9aoFx+yHwjqKTX6fN/99/qcnTk4HucIqDeRTJYhPosA0rr56aY
 Li3wJ6YcAMQGkpf/SEqvREr64ulsrlKaWg3GrZgG86agHPam937MyLRNGVnUds4yfIwiD8a/aWu
 VGY3bQypz//5L4toxCS6Bxk7xny4lnnig5w0CjarSX6Dd9JiBuUdaDuNuQWqUMJvgNKAq+T+I4e
 M+Cdx6MjMoAHPipWaBE2g7WZVzDcU/J1lYBmWnBIOryU3PJv2dXy0VIh3TJDob6+Pp1NIjkg0WN
 6IrtUvNdwUxKtSjUZXLKPYRrzLJFmhfGMZDZwIOr7T8I/R9cxhyT1iqXCfAadgwlRQ0ie0la35V
 I3nUU7AXYofYaMg==
X-Google-Smtp-Source: AGHT+IH9fQTg9AsufzYm0e3QH3ExOM7RswwJOR2aKsoPA3Ow4e6juhGm5o4r/RKKtMgP/az4KhZJNg==
X-Received: by 2002:a05:6122:4286:b0:52c:5590:72c9 with SMTP id
 71dfb90a1353d-52f2c4fc15bmr12794633e0c.5.1748416176163; 
 Wed, 28 May 2025 00:09:36 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53066973c31sm471229e0c.43.2025.05.28.00.09.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 00:09:36 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-4df9961f319so2664721137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 00:09:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSgvvKjjDKYk0Yav+FfvQelBJwRJXEuLZb1N31yMC67BhoMn9Cha738KLazUCC5528nzoepxtmCQQ=@lists.freedesktop.org
X-Received: by 2002:a05:6102:32d3:b0:4e2:8b49:9f96 with SMTP id
 ada2fe7eead31-4e42409f765mr12510096137.6.1748416164708; Wed, 28 May 2025
 00:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU=iuVFo=VJjV7UM-fLTeZk9TwyOJwojOVOSJiniRneHA@mail.gmail.com>
 <CA+V-a8sOGEEajx9TQsVBb+NeFRUx2eSo81ZdRQMsLzd0Eiox2w@mail.gmail.com>
In-Reply-To: <CA+V-a8sOGEEajx9TQsVBb+NeFRUx2eSo81ZdRQMsLzd0Eiox2w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 09:09:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXb5ZCX=U_BR0=AkGtdGkVosty0cGsbKQryTy11Au8H-A@mail.gmail.com>
X-Gm-Features: AX0GCFtIRfcujL8IE6N7nJft0aU4E80YnjwTZhfb-bY3ejhxAX3pIJektgtGLNo
Message-ID: <CAMuHMdXb5ZCX=U_BR0=AkGtdGkVosty0cGsbKQryTy11Au8H-A@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Tue, 27 May 2025 at 23:51, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Fri, May 23, 2025 at 3:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add support for PLLDSI and PLLDSI divider clocks.
> > >
> > > Introduce the `renesas-rzv2h-dsi.h` header to centralize and share
> > > PLLDSI-related data structures, limits, and algorithms between the RZ=
/V2H
> > > CPG and DSI drivers.
> > >
> > > The DSI PLL is functionally similar to the CPG's PLLDSI, but has slig=
htly
> > > different parameter limits and omits the programmable divider present=
 in
> > > CPG. To ensure precise frequency calculations-especially for milliHz-=
level
> > > accuracy needed by the DSI driver-the shared algorithm allows both dr=
ivers
> > > to compute PLL parameters consistently using the same logic and input
> > > clock.
> > >
> > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>

> > > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > > +                                              struct clk_rate_reques=
t *req)
> > > +{
> > > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw=
);
> > > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > > +       struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->pllds=
i_div_parameters;
> > > +       u64 rate_millihz;
> > > +
> > > +       /*
> > > +        * Adjust the requested clock rate (`req->rate`) to ensure it=
 falls within
> > > +        * the supported range of 5.44 MHz to 187.5 MHz.
> > > +        */
> > > +       req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> > > +
> > > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > > +       if (rate_millihz =3D=3D dsi_dividers->error_millihz + dsi_div=
iders->freq_millihz)
> > > +               goto exit_determine_rate;
> > > +
> > > +       if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> > > +                                                dsi_dividers, rate_m=
illihz)) {
> > > +               dev_err(priv->dev,
> > > +                       "failed to determine rate for req->rate: %lu\=
n",
> > > +                       req->rate);
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +exit_determine_rate:
> > > +       req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;
> >
> > Shouldn't this also update req->rate with the actual rate?
> >
> >     req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_dividers->freq_millihz, MIL=
LI);
> >
> Agreed, I will update it.

I think not updating req->rate may cause clk_get_rate() to return
an incorrect value (can error_millihz > 1000?).  Any chance this fix
can simplify the clock handling in the DSI driver?

> > Would it help the DSI driver if this clock would provide a
> > .recalc_accuracy() callback that takes into account the difference
> > between req->rate and dsi_dividers->freq_millihz?
> > Or would that be considered abuse of the accuracy concept?
> >
> Our understanding is that this describes how precisely a clock keeps
> time. A clock with 1 ppb accuracy will gain or lose one second in
> approximately 31.5 million seconds (1 year). In our case the meaning
> is completely different.

Yeah, I know...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
