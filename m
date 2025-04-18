Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D4EA938AE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 16:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C302410EBAD;
	Fri, 18 Apr 2025 14:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YUpedC5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0F110EBAD
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 14:30:35 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso9251095e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 07:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744986634; x=1745591434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62uDSKULOQW8NIOGli1V4xfgLN9nhpayc/ZbXb4OndY=;
 b=YUpedC5PMROCxBHNo7wgrdAWJuMaaoJbrSTJVbDNYxXHz+XU1WkkanVnAkyjyIjp+D
 8+IH3GK49mQzQuKv7iQ0r1YB7A0FrIwV1dCFH9RpssO/kSDfpREzQKYugVoAex7Fk01w
 nOKQEntM08PF54pvLJ3zNMqmRX3JH2eNRBjXv/J8ZSHK3T7fKuhgSRYsiBAIoM1LrXdq
 aA5LSo2E/sHPrV2zXtmj4fioN5FM3fIyWp/HBL5kQo7NSruxT3jn0bkuecu8IUIn5mdv
 iaedPQADqxiejOLi8eg1Tf1mcYyhQ0Y4t76hcxw8y2SJsTwRblxwYqkdDhe2jZ1+L93c
 K0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744986634; x=1745591434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=62uDSKULOQW8NIOGli1V4xfgLN9nhpayc/ZbXb4OndY=;
 b=a+w1x3yXGj9M+TrTvbNfqVl8LyNN8iec+O2ja2cn2JeTfXYEYnXIAevhZAAN2Fsv0e
 17Ss6EFhKriffDGUnZvjnvBzKfFT3kfOz8gsYSd1Dh8+qi/tY/k4PtzH2CMXxrfKnztC
 NScwFcjTS9VToQEvLaOB9aFLksV0sntZwXFI7fxwliyfBXYYwaWxz/JXoHr2mvlvVSJq
 DMrMtDpTgMBLHq8N1gKSkbN5hFIPI7c/yjd5FPqdXp/asT/ORPLnlZ4W9Vxh1P704Xli
 6EnbmKU/KbDECNMbX3GEEbY0nvE3KWrx8TmWWuGiFuvm8xO0qVopPzQNmjtJlJyQAPrZ
 r2YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKHuW7ilIoNomm0wEJnPiRQJuC4O+76NyVQyh5VXyqRzM2xdWhBqUEdkbdOJ6pKu7EbZSI8swYv+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA5M/0FV6WBQFAbnq9iQXKctgjjMmIZeVgNPaIpucYZXheoWOp
 0ZJBgWqWK1kJY2kIDyQ8Ks1PwD00eFImALKZfGJh5zf01BiQjIO5S8I3dYM7nIhvQ3oelxaryCr
 Z2ZJuAMfQ5nsf5nM/UwfebDP8C2o=
X-Gm-Gg: ASbGncsEOspe1BDQQ3Nk4yBphK72n3H/gChnc69C7nGvRF/USaQAVo7+KC9iCVtuA+S
 mwSx4LKcN7pOqX3nq7du9mMuPvdtBTP4ZizbWd1BnFGCm4Zvr3aD+W08SLoAaXuAOlhVtAjK103
 dISQz3bHMn0msVjV7jFr5E1O6ZgAQk8xaV87+4aPJBb1I2UxRyvjCDM5A=
X-Google-Smtp-Source: AGHT+IF2YDFY26SFz6yJ6te4w1o3CM07r77TE60wclzSHhGI/3BbOPR9AyZkyyT+Ks7mBSB9PgtHJ74qZ3OP8eES/jc=
X-Received: by 2002:a05:6000:40dd:b0:39c:27cc:7ba3 with SMTP id
 ffacd0b85a97d-39efba6d50bmr2513996f8f.33.1744986634020; Fri, 18 Apr 2025
 07:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWj91VbxRbb_pZ23ySbvjzzgfTgy83GXTEtC9CAS=d5Sg@mail.gmail.com>
In-Reply-To: <CAMuHMdWj91VbxRbb_pZ23ySbvjzzgfTgy83GXTEtC9CAS=d5Sg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Apr 2025 15:30:07 +0100
X-Gm-Features: ATxdqUEqe-OZRpZOWalEsUu1IPPnxFVUfBtvGQi_mtWwVxlP_KYiJrsbtYHkusk
Message-ID: <CA+V-a8sbZ95xzhyg51TCzfrX3WrUWZm4DRHy15Uk4n3AFxKUqQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] clk: renesas: r9a09g057: Add clock and reset
 entries for DSI and LCDC
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

On Tue, Apr 15, 2025 at 4:51=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clock and reset entries for the DSI and LCDC peripherals.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - No changes
>
> You did change CSDIV0_DIVCTL2 to the NO_RMW-variant...
>
Ouch missed that.

> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
>
> > @@ -148,6 +182,12 @@ static const struct cpg_core_clk r9a09g057_core_cl=
ks[] __initconst =3D {
> >         DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCT=
L3, smux2_gbe0_rxclk),
> >         DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCT=
L0, smux2_gbe1_txclk),
> >         DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCT=
L1, smux2_gbe1_rxclk),
> > +       DEF_FIXED(".plleth_lpclk_div4", CLK_DIV_PLLETH_LPCLK, CLK_PLLET=
H, 1, 4),
> > +       DEF_CSDIV(".plleth_lpclk", CLK_CSDIV_PLLETH_LPCLK, CLK_DIV_PLLE=
TH_LPCLK,
> > +                 CSDIV0_DIVCTL2, dtable_16_128),
>
> The clock names look strange to me: "plleth_lpclk_div4" sounds like it is
> "plleth_lpclk" divided by four, but that is not the case here.
>
Maybe ".cdiv4_plleth_lpclk" and ".plleth_lpclk_gear"?

> > +
> > +       DEF_PLLDSI_DIV(".plldsi_sdiv2", CLK_PLLDSI_SDIV2, CLK_PLLDSI,
> > +                      CSDIV1_DIVCTL2, dtable_2_32),
> >
> >         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DI=
VCTL1, dtable_2_64),
> >
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
>
> > @@ -117,6 +118,8 @@ struct smuxed {
> >
> >  #define CSDIV0_DIVCTL0 DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
> >  #define CSDIV0_DIVCTL1 DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
> > +#define CSDIV0_DIVCTL2 DDIV_PACK_NO_RMW(CPG_CSDIV0, 8, 2, CSDIV_NO_MON=
)
>
> The documentation says:
>
>     DIVCTL2[3:2] is reserved.
>     When writing, read modify write is needed.
>
> So the NO_RMW-logic seems to be inverted?
>
Yes.

Cheers,
Prabhakar
