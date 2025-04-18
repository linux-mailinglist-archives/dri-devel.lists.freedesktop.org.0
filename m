Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA431A93538
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 11:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4772210E0C4;
	Fri, 18 Apr 2025 09:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fVmj2iv0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A40310E0C4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 09:25:26 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so1714009f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744968325; x=1745573125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ru8onjs2vA9wbQ6U9ijtqxZCeRCXBcS/TEII6kWNB80=;
 b=fVmj2iv0sjed3ZuAqbk1lShQoKfGYE3E8ZOCSlc2LOxAtapbTDE+4Q0ho8cgywJapD
 YH4f6kJ2JnG/lpJd0urwEZtclCnEnhUtXuuMGGgu6iAGQ9wiugxA3aoLpDjN26f9mP2q
 tmAp17aCpSfFZOfLMF23nELYPT9cAJoTf34yLKJzQGjcmHmrMIb6jHKP3j1GijnexMHW
 mXQKj8haICJXAbgfZgC1RCKZTH1NUUsmSX7laTGxMJdQewn1qyDZ/FHwao56nnuqYlVp
 vt6/nWXMn42Wtv/BplLRVv23AxBUCBnJEBCojoFcWnVNYJ/YXsxo1UNyfmijL8bD3uQD
 WvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744968325; x=1745573125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ru8onjs2vA9wbQ6U9ijtqxZCeRCXBcS/TEII6kWNB80=;
 b=l+XTCqRWSkjLAcMGm6PAV7FObPSW4mUXn3ERKtobZkRKDKJ23A9/e5b4O8aiiU/KgX
 4TIQF7HnF6hDUNbNr2siE8PAI5guINSmSiZPokjUS/Xy8foFLmtfUyGTgx8C8uIL3Jr4
 407Q5MT5zF1wqjjf1/AhDyrNLK9/EBBhkoVuc2eTBym5V8jnmEmjF4udI/RXt+a9ER92
 692kolL78zXOh75iwJ3qSwtHL8bC9WR4mUIRDOArgQdJKfqnnAedZu9xAR+faFOals6r
 OXP4qetiPOze7s5axWan+96oRDiNvGTAGahPmCSkOgSMRDjJUVre0xBH9xvZb8Qi/qBw
 Z1rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/f6aErecnRKD5y0yChACe4MHZiS54hVMkEYUWdyvJxvypGMIpba/QNG4DVpa10XAtB3IfSglvBQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNc5DTSSt3qvOI1BKMxnzkD6MDZCial2YppT9t17/QqvyenUH0
 mJOLahzokOFPDTIRZ0EsIZPKQ+54dSPYmd7nLA48OesiNQE/MJaxorcjXsH0xsOGk6eC6tXMiJB
 Oj9i4jH3nr/koaj9TZ+0awP9LbA4=
X-Gm-Gg: ASbGncuSKYxVPHyyoK0AnMUfZbGJ/ohtR6lQ6kEb1rgaXnGCjw5Uo0eXwWE0NBr/v0D
 E7rGwzxiyiJ0/X+1/uihFEfoaSHAAEqoyLaXtkhxf757eiSb6yskL25dcZcKKyJ14sSF3WNOTTr
 eyQvugAaZBygkEJ/bikt24p4lov6gJSaDoVUhNSzaxaYzwAy8Qpc8HDhw=
X-Google-Smtp-Source: AGHT+IH0qSvrHScgR4lG75AuUAfHNpEPP8lgwlRNxIlqlQoo56MY4sC7wLg2Fx7Y+DZ78hkePrCQGl88RDeO2O1xHsw=
X-Received: by 2002:a05:6000:184c:b0:391:212:459a with SMTP id
 ffacd0b85a97d-39efba51004mr1549587f8f.22.1744968324569; Fri, 18 Apr 2025
 02:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113462CC30072B670E23EC7F586B12@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113462CC30072B670E23EC7F586B12@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Apr 2025 10:24:57 +0100
X-Gm-Features: ATxdqUG3yKSPnhy_5J46cUVHR0vKRn90G69VnbupY7p7sMlImgxmyKc6brWa1_M
Message-ID: <CA+V-a8vsxe-ubtcEFfpXs4xR++DPnY8-NRxT-4sDvai9vkFHvA@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
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

On Sat, Apr 12, 2025 at 9:01=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 08 April 2025 21:09
> > Subject: [PATCH v2 15/15] drm: renesas: rz-du: mipi_dsi: Add support fo=
r RZ/V2H(P) SoC
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DSI support for Renesas RZ/V2H(P) SoC.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Dropped unused macros
> > - Added missing LPCLK flag to rzvv2h info
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 451 ++++++++++++++++++
> >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
> >  2 files changed, 485 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-
> > du/rzg2l_mipi_dsi.c
> > index 6c6bc59eabbc..e260e2ed03c1 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2022 Renesas Electronics Corporation
> >   */
> >  #include <linux/clk.h>
> > +#include <linux/clk/renesas-rzv2h-dsi.h>
>
> This patch has hard dependency on clk driver.
>
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> >  #include <linux/iopoll.h>
> > @@ -32,6 +33,9 @@
> >  #define RZ_MIPI_DSI_FEATURE_16BPP    BIT(1)
> >  #define RZ_MIPI_DSI_FEATURE_LPCLK    BIT(2)
> >
> > +#define RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA     (80 * MEGA)
> > +#define RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA     (1500 * MEGA)
> > +
> >  struct rzg2l_mipi_dsi;
> >
> >  struct rzg2l_mipi_dsi_hw_info {
> > @@ -42,6 +46,7 @@ struct rzg2l_mipi_dsi_hw_info {
> >                             unsigned long long *hsfreq_mhz);
> >       unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
> >                                           unsigned long mode_freq);
> > +     const struct rzv2h_plldsi_div_limits *cpg_dsi_limits;
> >       u32 phy_reg_offset;
> >       u32 link_reg_offset;
> >       unsigned long max_dclk;
> > @@ -49,6 +54,11 @@ struct rzg2l_mipi_dsi_hw_info {
> >       u8 features;
> >  };
> >
> > +struct rzv2h_dsi_mode_calc {
> > +     unsigned long mode_freq;
> > +     unsigned long long mode_freq_hz;
> > +};
> > +
> >  struct rzg2l_mipi_dsi {
> >       struct device *dev;
> >       void __iomem *mmio;
> > @@ -70,6 +80,18 @@ struct rzg2l_mipi_dsi {
> >       unsigned int num_data_lanes;
> >       unsigned int lanes;
> >       unsigned long mode_flags;
> > +
> > +     struct rzv2h_dsi_mode_calc mode_calc;
> > +     struct rzv2h_plldsi_parameters dsi_parameters; };
> > +
> > +static const struct rzv2h_plldsi_div_limits rzv2h_plldsi_div_limits =
=3D {
> > +     .m =3D { .min =3D 64, .max =3D 1023 },
> > +     .p =3D { .min =3D 1, .max =3D 4 },
> > +     .s =3D { .min =3D 0, .max =3D 5 },
> > +     .k =3D { .min =3D -32768, .max =3D 32767 },
> > +     .csdiv =3D { .min =3D 1, .max =3D 1 },
> > +     .fvco =3D { .min =3D 1050 * MEGA, .max =3D 2100 * MEGA }
> >  };
> >
> >  static inline struct rzg2l_mipi_dsi *
> > @@ -186,6 +208,249 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_=
mipi_dsi_global_timings[] =3D {
> >       },
> >  };
> >
> > +struct rzv2h_mipi_dsi_timings {
> > +     unsigned long hsfreq;
> > +     u16 value;
> > +};
> > +
> > +static const struct rzv2h_mipi_dsi_timings TCLKPRPRCTL[] =3D {
> > +     {150000000UL, 0},
> > +     {260000000UL, 1},
> > +     {370000000UL, 2},
> > +     {470000000UL, 3},
> > +     {580000000UL, 4},
> > +     {690000000UL, 5},
> > +     {790000000UL, 6},
> > +     {900000000UL, 7},
> > +     {1010000000UL, 8},
> > +     {1110000000UL, 9},
> > +     {1220000000UL, 10},
> > +     {1330000000UL, 11},
> > +     {1430000000UL, 12},
> > +     {1500000000UL, 13},
> > +};
>
> Not sure, Is it right approach to optimize this table as the second entry=
 is sequential
> with a fixed number for all tables except last one?
>
Agreed, I'll simplify this.

> 28 bytes can be saved, if we use a variable holding start_index.
>
> > +
> > +static const struct rzv2h_mipi_dsi_timings TCLKZEROCTL[] =3D {
> > +     {90000000UL, 2},
> > +     {110000000UL, 3},
> > +     {130000000UL, 4},
> > +     {150000000UL, 5},
> > +     {180000000UL, 6},
> > +     {210000000UL, 7},
> > +     {230000000UL, 8},
> > +     {240000000UL, 9},
> > +     {250000000UL, 10},
> > +     {270000000UL, 11},
> > +     {290000000UL, 12},
> > +     {310000000UL, 13},
> > +     {340000000UL, 14},
> > +     {360000000UL, 15},
> > +     {380000000UL, 16},
> > +     {410000000UL, 17},
> > +     {430000000UL, 18},
> > +     {450000000UL, 19},
> > +     {470000000UL, 20},
> > +     {500000000UL, 21},
> > +     {520000000UL, 22},
> > +     {540000000UL, 23},
> > +     {570000000UL, 24},
> > +     {590000000UL, 25},
> > +     {610000000UL, 26},
> > +     {630000000UL, 27},
> > +     {660000000UL, 28},
> > +     {680000000UL, 29},
> > +     {700000000UL, 30},
> > +     {730000000UL, 31},
> > +     {750000000UL, 32},
> > +     {770000000UL, 33},
> > +     {790000000UL, 34},
> > +     {820000000UL, 35},
> > +     {840000000UL, 36},
> > +     {860000000UL, 37},
> > +     {890000000UL, 38},
> > +     {910000000UL, 39},
> > +     {930000000UL, 40},
> > +     {950000000UL, 41},
> > +     {980000000UL, 42},
> > +     {1000000000UL, 43},
> > +     {1020000000UL, 44},
> > +     {1050000000UL, 45},
> > +     {1070000000UL, 46},
> > +     {1090000000UL, 47},
> > +     {1110000000UL, 48},
> > +     {1140000000UL, 49},
> > +     {1160000000UL, 50},
> > +     {1180000000UL, 51},
> > +     {1210000000UL, 52},
> > +     {1230000000UL, 53},
> > +     {1250000000UL, 54},
> > +     {1270000000UL, 55},
> > +     {1300000000UL, 56},
> > +     {1320000000UL, 57},
> > +     {1340000000UL, 58},
> > +     {1370000000UL, 59},
> > +     {1390000000UL, 60},
> > +     {1410000000UL, 61},
> > +     {1430000000UL, 62},
> > +     {1460000000UL, 63},
> > +     {1480000000UL, 64},
> > +     {1500000000UL, 65},
>
> Same. Here 128 bytes
>
> > +};
> > +
> > +static const struct rzv2h_mipi_dsi_timings TCLKPOSTCTL[] =3D {
> > +     {80000000UL, 6},
> > +     {210000000UL, 7},
> > +     {340000000UL, 8},
> > +     {480000000UL, 9},
> > +     {610000000UL, 10},
> > +     {740000000UL, 11},
> > +     {880000000UL, 12},
> > +     {1010000000UL, 13},
> > +     {1140000000UL, 14},
> > +     {1280000000UL, 15},
> > +     {1410000000UL, 16},
> > +     {1500000000UL, 17},
>
> Same. Here 24 bytes
>
> > +};
> > +
> > +static const struct rzv2h_mipi_dsi_timings TCLKTRAILCTL[] =3D {
> > +     {140000000UL, 1},
> > +     {250000000UL, 2},
> > +     {370000000UL, 3},
> > +     {480000000UL, 4},
> > +     {590000000UL, 5},
> > +     {710000000UL, 6},
> > +     {820000000UL, 7},
> > +     {940000000UL, 8},
> > +     {1050000000UL, 9},
> > +     {1170000000UL, 10},
> > +     {1280000000UL, 11},
> > +     {1390000000UL, 12},
> > +     {1500000000UL, 13},
> Same. Here 26 bytes
>
> > +};
> > +
> > +static const struct rzv2h_mipi_dsi_timings THSPRPRCTL[] =3D {
> > +     {110000000UL, 0},
> > +     {190000000UL, 1},
> > +     {290000000UL, 2},
> > +     {400000000UL, 3},
> > +     {500000000UL, 4},
> > +     {610000000UL, 5},
> > +     {720000000UL, 6},
> > +     {820000000UL, 7},
> > +     {930000000UL, 8},
> > +     {1030000000UL, 9},
> > +     {1140000000UL, 10},
> > +     {1250000000UL, 11},
> > +     {1350000000UL, 12},
> > +     {1460000000UL, 13},
> > +     {1500000000UL, 14},
>
> Same. Here 30 bytes
>
> > +};
> > +
> > +static const struct rzv2h_mipi_dsi_timings THSZEROCTL[] =3D {
> > +     {180000000UL, 0},
> > +     {240000000UL, 1},
> > +     {290000000UL, 2},
> > +     {350000000UL, 3},
> > +     {400000000UL, 4},
> > +     {460000000UL, 5},
> > +     {510000000UL, 6},
> > +     {570000000UL, 7},
> > +     {620000000UL, 8},
> > +     {680000000UL, 9},
> > +     {730000000UL, 10},
> > +     {790000000UL, 11},
> > +     {840000000UL, 12},
> > +     {900000000UL, 13},
> > +     {950000000UL, 14},
> > +     {1010000000UL, 15},
> > +     {1060000000UL, 16},
> > +     {1120000000UL, 17},
> > +     {1170000000UL, 18},
> > +     {1230000000UL, 19},
> > +     {1280000000UL, 20},
> > +     {1340000000UL, 21},
> > +     {1390000000UL, 22},
> > +     {1450000000UL, 23},
> > +     {1500000000UL, 24},
>
> Same. Here 50 bytes.
>
> > +};
> > +
> > +static const struct rzv2h_mipi_dsi_timings THSTRAILCTL[] =3D {
> > +     {100000000UL, 3},
> > +     {210000000UL, 4},
> > +     {320000000UL, 5},
> > +     {420000000UL, 6},
> > +     {530000000UL, 7},
> > +     {640000000UL, 8},
> > +     {750000000UL, 9},
> > +     {850000000UL, 10},
> > +     {960000000UL, 11},
> > +     {1070000000UL, 12},
> > +     {1180000000UL, 13},
> > +     {1280000000UL, 14},
> > +     {1390000000UL, 15},
> > +     {1500000000UL, 16},
>
> Same. Here 28 bytes?
>
> > +};
> > +
> > +static const struct rzv2h_mipi_dsi_timings TLPXCTL[] =3D {
> > +     {130000000UL, 0},
> > +     {260000000UL, 1},
> > +     {390000000UL, 2},
> > +     {530000000UL, 3},
> > +     {660000000UL, 4},
> > +     {790000000UL, 5},
> > +     {930000000UL, 6},
> > +     {1060000000UL, 7},
> > +     {1190000000UL, 8},
> > +     {1330000000UL, 9},
> > +     {1460000000UL, 10},
> > +     {1500000000UL, 11},
>
> Same. Here 24 bytes
>
> > +};
> > +
> > +static const struct rzv2h_mipi_dsi_timings THSEXITCTL[] =3D {
> > +     {150000000UL, 1},
> > +     {230000000UL, 2},
> > +     {310000000UL, 3},
> > +     {390000000UL, 4},
> > +     {470000000UL, 5},
> > +     {550000000UL, 6},
> > +     {630000000UL, 7},
> > +     {710000000UL, 8},
> > +     {790000000UL, 9},
> > +     {870000000UL, 10},
> > +     {950000000UL, 11},
> > +     {1030000000UL, 12},
> > +     {1110000000UL, 13},
> > +     {1190000000UL, 14},
> > +     {1270000000UL, 15},
> > +     {1350000000UL, 16},
> > +     {1430000000UL, 17},
> > +     {1500000000UL, 18},
>
> Same. Here 36 bytes.
>
> > +};
> > +
> > +static const struct rzv2h_mipi_dsi_timings ULPSEXIT[] =3D {
> > +     {1953125UL, 49},
> > +     {3906250UL, 98},
> > +     {7812500UL, 195},
> > +     {15625000UL, 391},
>
> Here we have problem as it is non-sequential and only has 4 entries?
>
> Since it is ULPS EXIT Counter values compared to DPHY timings
> This can have its own structure?
>
Agreed as this will have a separate function of its own no need for a
new struct, I'll have something like below:

static u16 rzv2h_dphy_find_ulpsexit(unsigned long freq)
{
    const unsigned long hsfreq[] =3D {
        1953125UL,
        3906250UL,
        7812500UL,
        15625000UL,
    };
    const u16 ulpsexit[] =3D {49, 98, 195, 391};
    unsigned int i;

    for (i =3D 0; i < ARRAY_SIZE(hsfreq); i++) {
        if (freq <=3D hsfreq[i])
            break;
    }

    if (i =3D=3D ARRAY_SIZE(hsfreq))
        i -=3D 1;

    return ulpsexit[i];
}

> > +};
> > +
> > +static int rzv2h_dphy_find_timings_val(unsigned long freq,
> > +                                    const struct rzv2h_mipi_dsi_timing=
s timings[],
> > +                                    unsigned int size)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < size; i++) {
> > +             if (freq <=3D timings[i].hsfreq)
> > +                     break;
> > +     }
> > +
> > +     if (i =3D=3D size)
> > +             i -=3D 1;
> > +
> > +     return timings[i].value;
>
> This will be then start_index + i for all DPHY timing parmeter table.
>
Agreed.

> And
>
> Maybe use another function to find ULPS EXIT Counter values??
>
>
> > +};
> > +
> >  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 r=
eg, u32 data)  {
> >       iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg); @@ =
-307,6 +572,168 @@ static int
> > rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
> >       return 0;
> >  }
> >
> > +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *d=
si,
> > +                                           unsigned long mode_freq)
> > +{
> > +     struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_para=
meters;
> > +     unsigned long long hsfreq_mhz, mode_freq_hz, mode_freq_mhz;
> > +     struct rzv2h_plldsi_parameters cpg_dsi_parameters;
> > +     unsigned int bpp, i;
> > +
> > +     bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +
> > +     for (i =3D 0; i < 10; i +=3D 1) {
> > +             unsigned long hsfreq;
> > +             bool parameters_found;
> > +
> > +             mode_freq_hz =3D mode_freq * KILO + i;
> > +             mode_freq_mhz =3D mode_freq_hz * KILO * 1ULL;
> > +             parameters_found =3D rzv2h_dsi_get_pll_parameters_values(=
dsi->info->cpg_dsi_limits,
> > +                                                                    &c=
pg_dsi_parameters,
> > +                                                                    mo=
de_freq_mhz);
> > +             if (!parameters_found)
> > +                     continue;
> > +
> > +             hsfreq_mhz =3D DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.f=
req_mhz * bpp, dsi->lanes);
> > +             parameters_found =3D rzv2h_dsi_get_pll_parameters_values(=
&rzv2h_plldsi_div_limits,
> > +                                                                    ds=
i_parameters,
> > +                                                                    hs=
freq_mhz);
> > +             if (!parameters_found)
> > +                     continue;
> > +
> > +             if (abs(dsi_parameters->error_mhz) >=3D 500)
> > +                     continue;
> > +
> > +             hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
> > +             if (hsfreq >=3D RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA &&
> > +                 hsfreq <=3D RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA) {
> > +                     dsi->mode_calc.mode_freq_hz =3D mode_freq_hz;
> > +                     dsi->mode_calc.mode_freq =3D mode_freq;
> > +                     return MODE_OK;
> > +             }
> > +     }
> > +
> > +     return MODE_CLOCK_RANGE;
> > +}
> > +
> > +static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned l=
ong mode_freq,
> > +                             unsigned long long *hsfreq_mhz)
> > +{
> > +     struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_para=
meters;
> > +     unsigned long status;
> > +
> > +     if (dsi->mode_calc.mode_freq !=3D mode_freq) {
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
> > +     *hsfreq_mhz =3D dsi_parameters->freq_mhz;
> > +
> > +     return 0;
> > +}
> > +
> > +static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> > +                                 unsigned long long hsfreq_mhz)
> > +{
> > +     struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_para=
meters;
> > +     unsigned long lpclk_rate =3D clk_get_rate(dsi->lpclk);
> > +     u32 phytclksetr, phythssetr, phytlpxsetr, phycr;
> > +     struct rzg2l_mipi_dsi_timings dphy_timings;
> > +     unsigned long long hsfreq;
> > +     u32 ulpsexit;
> > +
> > +     hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
> > +
> > +     if (dsi_parameters->freq_mhz =3D=3D hsfreq_mhz)
> > +             goto parameters_found;
> > +
> > +     if (rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi_div_limits,
> > +                                             dsi_parameters, hsfreq_mh=
z))
> > +             goto parameters_found;
> > +
> > +     dev_err(dsi->dev, "No PLL parameters found for HSFREQ %lluHz\n", =
hsfreq);
> > +     return -EINVAL;
> > +
> > +parameters_found:
> > +     dphy_timings.tclk_trail =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, TCLKTRAILCTL,
> > +                                         ARRAY_SIZE(TCLKTRAILCTL));
> > +     dphy_timings.tclk_post =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, TCLKPOSTCTL,
> > +                                         ARRAY_SIZE(TCLKPOSTCTL));
> > +     dphy_timings.tclk_zero =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, TCLKZEROCTL,
> > +                                         ARRAY_SIZE(TCLKZEROCTL));
> > +     dphy_timings.tclk_prepare =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, TCLKPRPRCTL,
> > +                                         ARRAY_SIZE(TCLKPRPRCTL));
> > +     dphy_timings.ths_exit =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, THSEXITCTL,
> > +                                         ARRAY_SIZE(THSEXITCTL));
> > +     dphy_timings.ths_trail =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, THSTRAILCTL,
> > +                                         ARRAY_SIZE(THSTRAILCTL));
> > +     dphy_timings.ths_zero =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, THSZEROCTL,
> > +                                         ARRAY_SIZE(THSZEROCTL));
> > +     dphy_timings.ths_prepare =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, THSPRPRCTL,
> > +                                         ARRAY_SIZE(THSPRPRCTL));
> > +     dphy_timings.tlpx =3D
> > +             rzv2h_dphy_find_timings_val(hsfreq, TLPXCTL,
> > +                                         ARRAY_SIZE(TLPXCTL));
> > +     ulpsexit =3D
> > +             rzv2h_dphy_find_timings_val(lpclk_rate, ULPSEXIT,
> > +                                         ARRAY_SIZE(ULPSEXIT));
> > +
> > +     phytclksetr =3D PHYTCLKSETR_TCLKTRAILCTL(dphy_timings.tclk_trail)=
 |
> > +                   PHYTCLKSETR_TCLKPOSTCTL(dphy_timings.tclk_post) |
> > +                   PHYTCLKSETR_TCLKZEROCTL(dphy_timings.tclk_zero) |
> > +                   PHYTCLKSETR_TCLKPRPRCTL(dphy_timings.tclk_prepare);
> > +     phythssetr =3D PHYTHSSETR_THSEXITCTL(dphy_timings.ths_exit) |
> > +                  PHYTHSSETR_THSTRAILCTL(dphy_timings.ths_trail) |
> > +                  PHYTHSSETR_THSZEROCTL(dphy_timings.ths_zero) |
> > +                  PHYTHSSETR_THSPRPRCTL(dphy_timings.ths_prepare);
> > +     phytlpxsetr =3D rzg2l_mipi_dsi_phy_read(dsi, PHYTLPXSETR) & ~GENM=
ASK(7, 0);
> > +     phytlpxsetr |=3D PHYTLPXSETR_TLPXCTL(dphy_timings.tlpx);
> > +     phycr =3D rzg2l_mipi_dsi_phy_read(dsi, PHYCR) & ~GENMASK(9, 0);
> > +     phycr |=3D PHYCR_ULPSEXIT(ulpsexit);
> > +
> > +     /* Setting all D-PHY Timings Registers */
> > +     rzg2l_mipi_dsi_phy_write(dsi, PHYTCLKSETR, phytclksetr);
> > +     rzg2l_mipi_dsi_phy_write(dsi, PHYTHSSETR, phythssetr);
> > +     rzg2l_mipi_dsi_phy_write(dsi, PHYTLPXSETR, phytlpxsetr);
> > +     rzg2l_mipi_dsi_phy_write(dsi, PHYCR, phycr);
> > +
> > +     rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET0R,
> > +                              PLLCLKSET0R_PLL_S(dsi_parameters->s) |
> > +                              PLLCLKSET0R_PLL_P(dsi_parameters->p) |
> > +                              PLLCLKSET0R_PLL_M(dsi_parameters->m));
> > +     rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R, PLLCLKSET1R_PLL_K(dsi_=
parameters->k));
> > +     udelay(20);
> > +
> > +     rzg2l_mipi_dsi_phy_write(dsi, PLLENR, PLLENR_PLLEN);
> > +     udelay(500);
>
> Checkpatch warnings, maybe use fsleep()?
>
> CHECK: usleep_range is preferred over udelay; see function description of=
 usleep_range() and udelay().
> #475: FILE: drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:718:
> +       udelay(20);
> CHECK: usleep_range is preferred over udelay; see function description of=
 usleep_range() and udelay().
> #478: FILE: drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:721:
> +       udelay(500);
> CHECK: usleep_range is preferred over udelay; see function description of=
 usleep_range() and udelay().
> #485: FILE: drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:728:
> +       udelay(220);
>
Ok, I will switch to fsleep().

Cheers,
Prabhakar
