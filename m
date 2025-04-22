Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CE1A961BE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC95310E521;
	Tue, 22 Apr 2025 08:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bWY6EAlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0296710E521
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 08:33:03 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-39ee5ac4321so5161639f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 01:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745310781; x=1745915581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ZrrpM7xmaXFZQ+/SXFVYsimm2TyRYqB/Z0dg/A+VpU=;
 b=bWY6EAlgs1XLBa/v2Gv5g6B1MFL43q15T5YjUC8MsIhgDgLe/lk2yTRXTHsIWnHUjR
 mv30jH4aWLqw8Tk+buZPqGaC1Hr1D1/tCpAhAgWcfdpaFp6ubqQyG339EUnZsgp8SWym
 MvKaJRAbLUbOcevT+MD4RfH+NY1M1ZPpMDjLkglsquvEl8VnnPIpesmcGf6NC+cW+kM6
 hY8+4LMke3ksYRf+89VuYIjfXwNT0jwum6ezS1asJLa28wJok6SgRur2p1egnHae5oG+
 pRBqHDyqMS2l+80w5odMIeBkwGgfONWRV6kLTLFTV0P038bpFnJh7CXkU4zHQ24pNDTB
 7Ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745310781; x=1745915581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ZrrpM7xmaXFZQ+/SXFVYsimm2TyRYqB/Z0dg/A+VpU=;
 b=lxyUZ5xuxRkWPLr+R6k5pP+lYXz/wke5PIPh3m01MOcUUp1Y2j44zJJxId5KtiuQyx
 k5S+CK4n6QLASSNiCvp/zxxwVYsYinb9gn8PCrBuAcsXTkZMBxvAVC4qgFXBhfHNSWtJ
 Qkld2BOsYpecjg6woKsqwffZAM/5TiwlRx63aOqynkML/WGS3vpKJz7tMUlOImgetDXb
 0MG91rlEJdUa3kDnLcvoYVljPRnMc1o7HwhVLz/X8eY4xLBdWErJ2cCeTRpVPAmjDca7
 /8mTmeAKufPM0mlqPsAIwGcu2DWi9ULjDvh9HDFeuO3MwnsB8c5usTsbDXyXp2ja+93Q
 zmtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI78VrHUsmuAV0mM65XgtfOJLzBtFtPp5/GK1nB/Y2cl26q2TgtGyE+Q0Iqlbhp2zcU4HosZxGoCU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN9IyiH3DfF+VKhJk7seJN+lVzeOzBtEX/A+aa0n3VRcxW7Cwd
 W0AEK51dTAUWnA8BlpjjhQMUtR6SdIxCSC5eTySC4/KilHCpVUXPiSFTkAG1X1C8Tx1lDgO3klz
 pBhRFpR/6wVukOdESylTqTxW96lM=
X-Gm-Gg: ASbGnct1yBvvpmrAw4RJyIItdLIeIkRVkzbBQ919Xt9FQEGzy8zMEkDRBhuy6gCJSI4
 ELCrbWfpCpbRgHEeUB+LOquOMPnDgkjqjQV2KdWjA50NRyys/aMSR/D94fp7JUKukXlvQtQ+A/y
 Jr/bXe64Oa7rhMimyyv44tUA==
X-Google-Smtp-Source: AGHT+IEXOe6suiljYgzibwSICtoy2N7LW7RDRaL42CSjqJljavFvoroFeiYFJ76gWjGbmigKz6X5Cr7/yBkTmQ0eASU=
X-Received: by 2002:a5d:6d81:0:b0:391:2e31:c7e1 with SMTP id
 ffacd0b85a97d-39efba2cb05mr8325459f8f.4.1745310781278; Tue, 22 Apr 2025
 01:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250418184658.456398-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113469966D8B9B58EE4E2D88B86BE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113469966D8B9B58EE4E2D88B86BE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 22 Apr 2025 09:32:35 +0100
X-Gm-Features: ATxdqUFRgp4IF189KWfub3eewi-n5UlmDRcR_Er9P2ARmB-V2ohPlk40gW-sZrA
Message-ID: <CA+V-a8vMLUnZiJZjj0mu_DGSmZ5F_a0_U_SpmEaVxqL+ZqGrOA@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] drm: renesas: rz-du: mipi_dsi: Add support for
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
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

On Sat, Apr 19, 2025 at 8:28=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 18 April 2025 19:47
> > Subject: [PATCH v3 15/15] drm: renesas: rz-du: mipi_dsi: Add support fo=
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
> > v2->v3:
> > - Simplifed V2H DSI timings array to save space
> > - Switched to use fsleep() instead of udelay()
> >
> > v1->v2:
> > - Dropped unused macros
> > - Added missing LPCLK flag to rzvv2h info
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 344 ++++++++++++++++++
> >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
> >  2 files changed, 378 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-
> > du/rzg2l_mipi_dsi.c
> > index 133a8f306d47..a957b6c5f28d 100644
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
> >                             u64 *hsfreq_millihz);
> >       unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
> >                                           unsigned long mode_freq);
> > +     const struct rzv2h_pll_div_limits *cpg_dsi_limits;
> >       u32 phy_reg_offset;
> >       u32 link_reg_offset;
> >       unsigned long max_dclk;
> > @@ -49,6 +54,11 @@ struct rzg2l_mipi_dsi_hw_info {
> >       u8 features;
> >  };
> >
> > +struct rzv2h_dsi_mode_calc {
> > +     unsigned long mode_freq;
> > +     u64 mode_freq_hz;
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
> > +static const struct rzv2h_pll_div_limits rzv2h_plldsi_div_limits =3D {
> > +     .fvco =3D { .min =3D 1050 * MEGA, .max =3D 2100 * MEGA },
> > +     .m =3D { .min =3D 64, .max =3D 1023 },
> > +     .p =3D { .min =3D 1, .max =3D 4 },
> > +     .s =3D { .min =3D 0, .max =3D 5 },
> > +     .k =3D { .min =3D -32768, .max =3D 32767 },
> > +     .csdiv =3D { .min =3D 1, .max =3D 1 },
> >  };
> >
> >  static inline struct rzg2l_mipi_dsi *
> > @@ -186,6 +208,155 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_=
mipi_dsi_global_timings[] =3D {
> >       },
> >  };
> >
> > +struct rzv2h_mipi_dsi_timings {
> > +     const u8 *hsfreq;
> > +     u8 len;
> > +     u8 start_index;
> > +};
> > +
> > +enum {
> > +     TCLKPRPRCTL,
> > +     TCLKZEROCTL,
> > +     TCLKPOSTCTL,
> > +     TCLKTRAILCTL,
> > +     THSPRPRCTL,
> > +     THSZEROCTL,
> > +     THSTRAILCTL,
> > +     TLPXCTL,
> > +     THSEXITCTL,
> > +};
> > +
> > +static const u8 tclkprprctl[] =3D {
> > +     15, 26, 37, 47, 58, 69, 79, 90, 101, 111, 122, 133, 143, 150, };
> > +
> > +static const u8 tclkzeroctl[] =3D {
> > +     9, 11, 13, 15, 18, 21, 23, 24, 25, 27, 29, 31, 34, 36, 38,
> > +     41, 43, 45, 47, 50, 52, 54, 57, 59, 61, 63, 66, 68, 70, 73,
> > +     75, 77, 79, 82, 84, 86, 89, 91, 93, 95, 98, 100, 102, 105,
> > +     107, 109, 111, 114, 116, 118, 121, 123, 125, 127, 130, 132,
> > +     134, 137, 139, 141, 143, 146, 148, 150, };
> > +
> > +static const u8 tclkpostctl[] =3D {
> > +     8, 21, 34, 48, 61, 74, 88, 101, 114, 128, 141, 150, };
> > +
> > +static const u8 tclktrailctl[] =3D {
> > +     14, 25, 37, 48, 59, 71, 82, 94, 105, 117, 128, 139, 150, };
> > +
> > +static const u8 thsprprctl[] =3D {
> > +     11, 19, 29, 40, 50, 61, 72, 82, 93, 103, 114, 125, 135, 146, 150,=
 };
> > +
> > +static const u8 thszeroctl[] =3D {
> > +     18, 24, 29, 35, 40, 46, 51, 57, 62, 68, 73, 79, 84, 90,
> > +     95, 101, 106, 112, 117, 123, 128, 134, 139, 145, 150, };
> > +
> > +static const u8 thstrailctl[] =3D {
> > +     10, 21, 32, 42, 53, 64, 75, 85, 96, 107, 118, 128, 139, 150, };
> > +
> > +static const u8 tlpxctl[] =3D {
> > +     13, 26, 39, 53, 66, 79, 93, 106, 119, 133, 146, 150,
> > +};
> > +
> > +static const u8 thsexitctl[] =3D {
> > +     15, 23, 31, 39, 47, 55, 63, 71, 79, 87,
> > +     95, 103, 111, 119, 127, 135, 143, 150, };
> > +
> > +static const struct rzv2h_mipi_dsi_timings rzv2h_dsi_timings_tables[] =
=3D {
> > +     [TCLKPRPRCTL] =3D {
> > +             .hsfreq =3D tclkprprctl,
> > +             .len =3D ARRAY_SIZE(tclkprprctl),
> > +             .start_index =3D 0,
> > +     },
> > +     [TCLKZEROCTL] =3D {
> > +             .hsfreq =3D tclkzeroctl,
> > +             .len =3D ARRAY_SIZE(tclkzeroctl),
> > +             .start_index =3D 2,
> > +     },
> > +     [TCLKPOSTCTL] =3D {
> > +             .hsfreq =3D tclkpostctl,
> > +             .len =3D ARRAY_SIZE(tclkpostctl),
> > +             .start_index =3D 6,
> > +     },
> > +     [TCLKTRAILCTL] =3D {
> > +             .hsfreq =3D tclktrailctl,
> > +             .len =3D ARRAY_SIZE(tclktrailctl),
> > +             .start_index =3D 1,
> > +     },
> > +     [THSPRPRCTL] =3D {
> > +             .hsfreq =3D thsprprctl,
> > +             .len =3D ARRAY_SIZE(thsprprctl),
> > +             .start_index =3D 0,
> > +     },
> > +     [THSZEROCTL] =3D {
> > +             .hsfreq =3D thszeroctl,
> > +             .len =3D ARRAY_SIZE(thszeroctl),
> > +             .start_index =3D 0,
> > +     },
> > +     [THSTRAILCTL] =3D {
> > +             .hsfreq =3D thstrailctl,
> > +             .len =3D ARRAY_SIZE(thstrailctl),
> > +             .start_index =3D 3,
> > +     },
> > +     [TLPXCTL] =3D {
> > +             .hsfreq =3D tlpxctl,
> > +             .len =3D ARRAY_SIZE(tlpxctl),
> > +             .start_index =3D 0,
> > +     },
> > +     [THSEXITCTL] =3D {
> > +             .hsfreq =3D thsexitctl,
> > +             .len =3D ARRAY_SIZE(thsexitctl),
> > +             .start_index =3D 1,
> > +     },
> > +};
> > +
> > +static u16 rzv2h_dphy_find_ulpsexit(unsigned long freq) {
> > +     const unsigned long hsfreq[] =3D {
>
> Please don't populate the read-only const array offsets on the stack
> but instead make it static, see [1] and [2]
>
Ok, I'll make it static in the next version.

> [1]
> https://lkml.iu.edu/2201.1/00608.html
> [2]
> https://patchwork.ozlabs.org/project/intel-wired-lan/patch/20250317144606=
.478431-1-colin.i.king@gmail.com/
>
Cheers,
Prabhakar
