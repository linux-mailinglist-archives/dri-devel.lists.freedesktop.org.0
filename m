Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948F1ADADBC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 12:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1678D10E32B;
	Mon, 16 Jun 2025 10:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZUJDNnn+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4701510E32B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 10:48:31 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so26735715e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 03:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750070910; x=1750675710; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w1RZoaBd7s53Gl4EEOyB88bEuvLGxVXm4s1GPYIyQz4=;
 b=ZUJDNnn+EYXazosHyJNZXqR4+G8eo45vj5nl0IX1huWXcPszlSHW9EPO9nr91o6geg
 Ox75Y7fHUK3Le9OzF1ofprlB50SpN5O0JRKekIORpBt/Ki9XXKk4G0Sh+AjuJwQy/oIF
 MdaAUsXL8LCv3cKLuuHxUtNkvlSuj8WAOOn7Le5EebuJqdFBjHBjJacPWoVgyBKjyhii
 YDwQB/f3ZZ58t16xYr6KAZ1dEKApvUGcJAiU6SkWDtonmFR0VJ/99VAMK4vgFY5h3m3Z
 iMM2l1AOz8bLzG9CvbJlzB3cztnKy+cW1dcfXSvOzlFY8rKcxhVptdgS60EoTD87fW/b
 ni1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750070910; x=1750675710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w1RZoaBd7s53Gl4EEOyB88bEuvLGxVXm4s1GPYIyQz4=;
 b=LgK3tsd8mkavDK51rHISqcLn857eKXMPG01F93ZCqCQloWZNox2JTtoHCAKo1F6Wgn
 MpfqMsyQP2J7h1R2Cw5bz5oTFqV5G+J4zG6Ii2a3rIdSaYGsK4a09B/z9Z3vpT1o7sTU
 XSvMeQxKA/7ZL+Giz3OUI/XzBpaep/Jc5S1ryKJlSKrfiVf42ZipkyuPGWsRzI4B16iL
 e3I8TEdLDuPSKY1cFJXjA8uVx1pbuGqwShQo74RCmyxECCyXpHT8dhJRgJwDJXFEPToF
 p8VtH1T/lzyjxCZh0p88onpN6rVO8cpSpGUlJMquMC4ChAHtBDiVO+qAS23YIVew5DuU
 C3nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVFtcdAUWEu8IT57ltcrLSSFb1piUrKfLC/a2tkQKb2J/ObOmwxDgVDY+t4RHeIFCEprqA9Wr8JgI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9SA3dgEz2NruK+YxHOakfGMqawCR3WJYHEIbV73hd6BVMLq9t
 NdASF9uN+QewczfAECV5CPrbtLHN5MkhTItG4er51b9ntUch3F51/q6/kduVaKLsO52NkQItUpA
 sLIOOTLw1nSp2DCv+4A/fBdghq+J9tl0=
X-Gm-Gg: ASbGncs8XHoJsq0FcH/mqkQKjPZCTZxSQw11YteHn7oc4XHIBftgJk3/BVTE4FJ9rCe
 WGaA3/PpHvEQ7pZ7Kik/IIipoOiTL6ePWIHM6x6MSFcfovVS5PWASRbVnBnrY89HsIfrOstHAvR
 XTgf9i9OW5E0G2LdDTT0gKoywiXHjQwemngw9YzmuI5S+Phuer5RcS
X-Google-Smtp-Source: AGHT+IHcaplUPGix4GRlSL0W5Y/N0Lt6acvjpm0+HqL8j14FYOo7Lfk9Q2H+n0iMYgc/RHSXREVhO7cCwWXNoFyP7QY=
X-Received: by 2002:a05:600c:4e02:b0:453:c39:d0c2 with SMTP id
 5b1f17b1804b1-4533cab541amr75662465e9.24.1750070909375; Mon, 16 Jun 2025
 03:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A62FDF84C5F2C1240BBF8677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346A62FDF84C5F2C1240BBF8677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Jun 2025 11:48:03 +0100
X-Gm-Features: AX0GCFubtUqu3fATVHFAzwxeT_PzWF71UNeBGrXqzwID3Wlx7D2bVaFvFl7UOIk
Message-ID: <CA+V-a8sZfTgOENXfR2NnykgjGHd+2-vS9Jk-dNLWTVQyAGbQTw@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Biju,

Thank you for the review.

On Fri, Jun 13, 2025 at 7:17=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 May 2025 18:19
> > Subject: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support for =
RZ/V2H(P) SoC
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DSI support for Renesas RZ/V2H(P) SoC.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v5->v6:
> > - Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
> >   PHYTCLKSETR_* and PHYTHSSETR_* macros.
> > - Replaced 10000000UL with 10 * MEGA
> > - Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
> > - Replaced `i -=3D 1;` with `i--;`
> > - Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
> >   RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
> >   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
> >   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.
> >
> > v4->v5:
> > - No changes
> >
> > v3->v4
> > - In rzv2h_dphy_find_ulpsexit() made the array static const.
> >
> > v2->v3:
> > - Simplifed V2H DSI timings array to save space
> > - Switched to use fsleep() instead of udelay()
> >
> > v1->v2:
> > - Dropped unused macros
> > - Added missing LPCLK flag to rzv2h info
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 345 ++++++++++++++++++
> >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
> >  2 files changed, 379 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-
> > du/rzg2l_mipi_dsi.c
> > index a31f9b6aa920..ea554ced6713 100644
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
<snip>
> > +
> > +static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned l=
ong mode_freq,
> > +                             u64 *hsfreq_millihz)
> > +{
> > +     struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_para=
meters;
> > +     unsigned long status;
> > +
> > +     if (dsi->mode_calc.mode_freq_khz !=3D mode_freq) {
> > +             status =3D rzv2h_dphy_mode_clk_check(dsi, mode_freq);
> > +             if (status !=3D MODE_OK) {
> > +                     dev_err(dsi->dev, "No PLL parameters found for mo=
de clk %lu\n",
> > +                             mode_freq);
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +
> > +     clk_set_rate(dsi->vclk, dsi->mode_calc.mode_freq_hz);
>
> Not sure, Can we use the DSI divider required based on the data rate (vcl=
k, bpp and numlanes) here
>
> and then the set parent clk of PLLDSI as well here (dsi->vclk * the divid=
er value) ??
>
> 24MHZ->PLL DSI->DSI DIVIDER->VCLOCK
>
> Maybe then the clock framework has all the information for setting PLL_DS=
I and DSI_DIVIDER clks??
>
Can you please elaborate here with a detailed example.

Cheers,
Prabhakar
