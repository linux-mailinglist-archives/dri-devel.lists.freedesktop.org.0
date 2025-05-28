Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E493AC6B78
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5086010E0B1;
	Wed, 28 May 2025 14:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SPn0NlNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AE910E0B1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 14:13:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so36300005e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748441610; x=1749046410; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/NvBcF4s3yGqfgtLGu/F6IheBb4FWCw8Mlh0+qa7IM=;
 b=SPn0NlNj1bR1/JF5DgIptUtUYbkwfHr4V2qKXljVNVdwYsN/2Vis7FbUYoqKs3Ffqc
 h74vfZLINgELbjfBbOIAAt5IVsMqLylv/HWUYtnByGKEczQb3OXWvn+1AypcI0myFavL
 5t42EM/0x/f0oaw37Vb4lsX6tulOKydqBUvxfrVMnOq3Af/aFa/2eKaN6VPA6jQ2U0QX
 gYPQKu0bPcdArO3wXsscunuf2CMH06PfEP22D4RMgphzT9A8M1DaxcLUBKW71AXqpHRI
 ASkNXCljn3zMq8qZnBjujo+HZtrIA+9TrPNFwahSSVa4HQ2AYhZDX437XZHxivtlUPWB
 6H7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748441610; x=1749046410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/NvBcF4s3yGqfgtLGu/F6IheBb4FWCw8Mlh0+qa7IM=;
 b=tE4gqrnba8CcjnagJY3VjS2r3TXyDCKGDUtzWhNnOQHfRsnzxro28iTL39GwQ9ya/c
 6bB7/58His5iuqLWQyJlChFL/hzIcouGma0oqMOaIkR7jfhm4w7vVcvgoe3dSNV19029
 0dbFPLeLLs2zEZxzt59BzffIHBBzUSp4RdKqRFS5hQ/K+F3qTCD6OztykbQVYO14CPwo
 4wJvlFmoRPMQ+h1gaaV9gtay0TK21qLVKqCBfEBSoVK53zufzuQ3tKxbFJeSontliqS+
 +L0vaanHUy8QUGQ7ytZ+4ogathv2iF/PZJbTZsPSAT9Q2bXHsOIkP2Dr5gM2j3YJL1JS
 uSYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxPNpYt7fdMGTc3O7foWUy2wokMLTqysS1/MUQF7kUdMsv5VRBH5U1PLbkBnUvKyhhL6UMiM+FCl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5NEyfujRtEA3f7CLBTzKCEHm+TBV0SqQgPB++j1LXgi9Ylak0
 GSNe1e7zlkbMu5vkrA/6Id8hsew4s5M2ykoYsDXza6JG/ItsxORnudnIGi6Bv4keblCQsPOn3sB
 5EU8B+0s50sT77fZcRTN+2jf8guVgXW8=
X-Gm-Gg: ASbGncszGK/aoJPJam4+7SdakbXCnuZ7GQc7k/DuYTVq/F6mPT3BkxIwn8SFcgpZLCd
 LfNi4Dtq9Loon7zA3RF2RbxNt7GkbaR4D5K0o5k8B/aYrQO9atdkpHtzgoIMuNhPhY6XUozjVVh
 Ea7I8SKbRahCg1y4CDDznv4Uha+6Vee3XjqOi3TaSgIYlCeI83fnZXStOEe1r6gN3rCA==
X-Google-Smtp-Source: AGHT+IHkpT2ySjMUdtYwChJ0/5/1rzDmtMoM740OXZxSdgP34XADiDvdJ0+rhe/twNar59adXV7Gqw4wW8anaLlVuPA=
X-Received: by 2002:a05:600c:3b17:b0:43c:f1b8:16ad with SMTP id
 5b1f17b1804b1-450787c9705mr26585325e9.30.1748441609568; Wed, 28 May 2025
 07:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU=iuVFo=VJjV7UM-fLTeZk9TwyOJwojOVOSJiniRneHA@mail.gmail.com>
 <CA+V-a8sOGEEajx9TQsVBb+NeFRUx2eSo81ZdRQMsLzd0Eiox2w@mail.gmail.com>
 <CAMuHMdXb5ZCX=U_BR0=AkGtdGkVosty0cGsbKQryTy11Au8H-A@mail.gmail.com>
In-Reply-To: <CAMuHMdXb5ZCX=U_BR0=AkGtdGkVosty0cGsbKQryTy11Au8H-A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 28 May 2025 15:13:02 +0100
X-Gm-Features: AX0GCFv1m8Xej_HgH71EgZ4Kvyv9BeSbuvPePanFkBHFJSxJNoRIerOZEfcK3ek
Message-ID: <CA+V-a8sUyZHGPwUzfUan8tmsF19mB2EPN599Tzu2kaoYxSMaHw@mail.gmail.com>
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

On Wed, May 28, 2025 at 8:09=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 27 May 2025 at 23:51, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Fri, May 23, 2025 at 3:45=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add support for PLLDSI and PLLDSI divider clocks.
> > > >
> > > > Introduce the `renesas-rzv2h-dsi.h` header to centralize and share
> > > > PLLDSI-related data structures, limits, and algorithms between the =
RZ/V2H
> > > > CPG and DSI drivers.
> > > >
> > > > The DSI PLL is functionally similar to the CPG's PLLDSI, but has sl=
ightly
> > > > different parameter limits and omits the programmable divider prese=
nt in
> > > > CPG. To ensure precise frequency calculations-especially for milliH=
z-level
> > > > accuracy needed by the DSI driver-the shared algorithm allows both =
drivers
> > > > to compute PLL parameters consistently using the same logic and inp=
ut
> > > > clock.
> > > >
> > > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
>
> > > > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > > > +                                              struct clk_rate_requ=
est *req)
> > > > +{
> > > > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(=
hw);
> > > > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > > > +       struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->pll=
dsi_div_parameters;
> > > > +       u64 rate_millihz;
> > > > +
> > > > +       /*
> > > > +        * Adjust the requested clock rate (`req->rate`) to ensure =
it falls within
> > > > +        * the supported range of 5.44 MHz to 187.5 MHz.
> > > > +        */
> > > > +       req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> > > > +
> > > > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > > > +       if (rate_millihz =3D=3D dsi_dividers->error_millihz + dsi_d=
ividers->freq_millihz)
> > > > +               goto exit_determine_rate;
> > > > +
> > > > +       if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> > > > +                                                dsi_dividers, rate=
_millihz)) {
> > > > +               dev_err(priv->dev,
> > > > +                       "failed to determine rate for req->rate: %l=
u\n",
> > > > +                       req->rate);
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > > +exit_determine_rate:
> > > > +       req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;
> > >
> > > Shouldn't this also update req->rate with the actual rate?
> > >
> > >     req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_dividers->freq_millihz, M=
ILLI);
> > >
> > Agreed, I will update it.
>
> I think not updating req->rate may cause clk_get_rate() to return
> an incorrect value (can error_millihz > 1000?).  Any chance this fix
> can simplify the clock handling in the DSI driver?
>
Yes, error_millihz can be greater than 1000, as result the DSI driver
does check this (>=3D 500) and proceeds to try the next one.

Cheers,
Prabhaar
