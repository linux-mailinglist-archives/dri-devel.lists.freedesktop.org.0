Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CC5ADAE33
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 13:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EA610E33C;
	Mon, 16 Jun 2025 11:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eRkALfR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E2F10E33C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 11:21:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so26929365e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 04:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750072880; x=1750677680; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HH/XG6DTsco8TheFYVMqA8WWvPjyKgOz5uHAKCaL2jQ=;
 b=eRkALfR6T9+LJDr5SY4/38QkUYdyR4U6IbtgrOQovhj0h0AllAOlg4tGrmmMIe/Xjl
 fCYAIqEnnECvoQZZVVzS9cmxlGK5SgUxMebXaqMlN1ow6sXtikLymbokBkzeIEgXuM7d
 vStL4ckDXNT6odh76R4aykU2JdeeJXWyrGWEmrS5f7SNGU8rzGFUuEC00EG7ryaA96pI
 woEvBjRTI4ZAJFiok8KFd5ssUElfb0BkRnf3HazVHOUioXGGN8/IVkC3k2qs5NiQfRqA
 /n04W/LPCzsJRcr2cjl8UrAvwb1zJ778l9gonfQiCZmMxmlx4X0Gyk4b1YqtRvZFQ+kl
 ValA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750072880; x=1750677680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HH/XG6DTsco8TheFYVMqA8WWvPjyKgOz5uHAKCaL2jQ=;
 b=mNqb+z7gGcxELa8qZmW9fsH+NEosEGrwCMY3ubK7+B+yFZobwK72MkoCXEJ0blG0GK
 HDkimq6AN5nzh51VgKgXjDH9asiAZ3qc0BmNetcX/mtSUzz5hkMpc3yXw7AoVCUCFOOS
 1XWEm/7pxPC4TeMJS3uhTg512G4xn1TJm9xUYXcngsAs24rQqfCDT8dS0lP5gpmPYvqP
 1ZrQ9hsk+ialz8de2TQTHbrBtpds/aN+VnLHSGWT0LNxx+pJ3rLt60xbn+Zog+ogH9My
 9rN8PhO9lylJeYdzbAH+ZSRLG4xznobUOf9WSlvpmYrFDWa/iwFR3LjIsPmhEvKmNYuy
 V4Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0O+5irGTv4LFiv8VpEaEyXUGgzYwfE9+Jgy1AnOirSV+l+CpBv2wYSnEedwPB1eM5abmvJA/j++o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVhUYtWUtHu4/FOWnxfied5MYZNDoJRQVEVi9+DZQQXtvAnisn
 Uyuy9jBuV/xygEgpPPeC04pGV2IMu+R6A/cnswcwVxi2qQ6r/aHK2098YdyKQDTPt5ltFI/yXjU
 p78n/kq+XIWOdxzRiu1iJ0cC1HqjJmwg=
X-Gm-Gg: ASbGnctdMwkbfXmigzqDWixpVy4Ut8tqLdawgE8SHsi7Ol3jk4lsvRyT6Vpe9S4Or2d
 f6FHwBElq20r6eEaUCMhjudbJaUC2aZDc/1pI+7EnhT1Yttv6j313WLQSacyC+osdVwew44JYCo
 72TvJnxCiG4lpMrTEFRFVclc75purl0xC+j/FCaV9+ag==
X-Google-Smtp-Source: AGHT+IFQFbpkJW8fhrHvXulTMgusuzcINLRFAAfYmf5HJpOcM0iLUansHMeU1JtnA7xzSFm6QhKrX41V1m0Oq6cxIQk=
X-Received: by 2002:a05:600c:1c0a:b0:451:e394:8920 with SMTP id
 5b1f17b1804b1-4533cab8564mr76816335e9.27.1750072879570; Mon, 16 Jun 2025
 04:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A62FDF84C5F2C1240BBF8677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sZfTgOENXfR2NnykgjGHd+2-vS9Jk-dNLWTVQyAGbQTw@mail.gmail.com>
 <TYCPR01MB11332F40696148C7216866D3B8670A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11332F40696148C7216866D3B8670A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Jun 2025 12:20:53 +0100
X-Gm-Features: AX0GCFtgrcxJq-tg2C4PkYvICy9lU_woFiUNZXsfPzvEdHMwe4O6KkHnXumJ2Xc
Message-ID: <CA+V-a8tKm4yjEG_ZbajXcgTdOB=GxqA=kt63svJ4ZF609tXHDA@mail.gmail.com>
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

On Mon, Jun 16, 2025 at 11:54=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
>
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Monday, June 16, 2025 11:48 AM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>; Andrzej Hajda
> > <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>;
> > Robert Foss <rfoss@kernel.org>; laurent.pinchart
> > <laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>;
> > Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>=
;
> > Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.co=
m>;
> > Simona Vetter <simona@ffwll.ch>; Rob Herring <robh@kernel.org>; Krzyszt=
of
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> > <sboyd@kernel.org>; Magnus Damm <magnus.damm@gmail.com>; dri-
> > devel@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-
> > clk@vger.kernel.org; Fabrizio Castro <fabrizio.castro.jz@renesas.com>;
> > Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support =
for
> > RZ/V2H(P) SoC
> >
> > Hi Biju,
> >
> > Thank you for the review.
> >
> > On Fri, Jun 13, 2025 at 7:17=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com>
> > wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > > -----Original Message-----
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: 30 May 2025 18:19
> > > > Subject: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support
> > > > for RZ/V2H(P) SoC
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add DSI support for Renesas RZ/V2H(P) SoC.
> > > >
> > > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > Signed-off-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v5->v6:
> > > > - Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
> > > >   PHYTCLKSETR_* and PHYTHSSETR_* macros.
> > > > - Replaced 10000000UL with 10 * MEGA
> > > > - Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
> > > > - Replaced `i -=3D 1;` with `i--;`
> > > > - Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
> > > >   RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
> > > >   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
> > > >   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.
> > > >
> > > > v4->v5:
> > > > - No changes
> > > >
> > > > v3->v4
> > > > - In rzv2h_dphy_find_ulpsexit() made the array static const.
> > > >
> > > > v2->v3:
> > > > - Simplifed V2H DSI timings array to save space
> > > > - Switched to use fsleep() instead of udelay()
> > > >
> > > > v1->v2:
> > > > - Dropped unused macros
> > > > - Added missing LPCLK flag to rzv2h info
> > > > ---
> > > >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 345
> > ++++++++++++++++++
> > > >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
> > > >  2 files changed, 379 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > b/drivers/gpu/drm/renesas/rz- du/rzg2l_mipi_dsi.c index
> > > > a31f9b6aa920..ea554ced6713 100644
> > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > @@ -5,6 +5,7 @@
> > > >   * Copyright (C) 2022 Renesas Electronics Corporation
> > > >   */
> > > >  #include <linux/clk.h>
> > > > +#include <linux/clk/renesas-rzv2h-dsi.h>
> > > >  #include <linux/delay.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/iopoll.h>
> > <snip>
> > > > +
> > > > +static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsign=
ed
> > long mode_freq,
> > > > +                             u64 *hsfreq_millihz) {
> > > > +     struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi-
> > >dsi_parameters;
> > > > +     unsigned long status;
> > > > +
> > > > +     if (dsi->mode_calc.mode_freq_khz !=3D mode_freq) {
> > > > +             status =3D rzv2h_dphy_mode_clk_check(dsi, mode_freq);
> > > > +             if (status !=3D MODE_OK) {
> > > > +                     dev_err(dsi->dev, "No PLL parameters found fo=
r
> > mode clk %lu\n",
> > > > +                             mode_freq);
> > > > +                     return -EINVAL;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     clk_set_rate(dsi->vclk, dsi->mode_calc.mode_freq_hz);
> > >
> > > Not sure, Can we use the DSI divider required based on the data rate
> > > (vclk, bpp and numlanes) here
> > >
> > > and then the set parent clk of PLLDSI as well here (dsi->vclk * the
> > divider value) ??
> > >
> > > 24MHZ->PLL DSI->DSI DIVIDER->VCLOCK
> > >
> > > Maybe then the clock framework has all the information for setting
> > PLL_DSI and DSI_DIVIDER clks??
> > >
> > Can you please elaborate here with a detailed example.
>
> There will be determine_clk followed by set_clock for setting new rate fo=
r PLL DSI(dsi->vclk * the divider value)
> For eg:  vclk_max =3D 187.5 MHz, DSI Divider required =3D 16
> Then set PLL_DSI =3D 187.5 * 16 MHz using clk_set.
>
You mean to use `clk_set_rate(dsi->vclk, (clk_get_rate(dsi->vclk) *
dsi_divider));` ?

Cheers,
Prabhakar
