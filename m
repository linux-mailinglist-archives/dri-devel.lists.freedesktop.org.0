Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3D1467386
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 09:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C2C73899;
	Fri,  3 Dec 2021 08:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A673E73898
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 08:52:32 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bi37so4874949lfb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 00:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M29xMZWaAkFJs0J9Nh+FM/uaWLKzIbKMv5Zx8EOIj1M=;
 b=BxpWP3/PBinv6gdGo5MlDIlSiW/xCMnMiblRhsY4K5S8aPF15jQr3vOGpvvSuUY0AN
 pBHq88MtFcdIf+ml2qzysnsvB51c0SsItQwIy1eDXPPklwOEF6419QK+FheSmzpHKhuI
 sRA5gb0wvjXkxqeEwQ+zsJzf22D/yqLoQFwfnzvdw6ea70yyOiElAN32hzqbm5cx3cMi
 R27T3+and0maD0FZJ2kSWM/CKGCip8HFMEkxw43LyYtIYdpoobgIqPB7zoXFOviVjOH8
 OWnWP0+zzM7v/mQ1fgXhg6aoZ2W4ukfS5hhlU0Fz9C7r2sku8YXo8tWxzZs5PFfRqGBm
 3S0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M29xMZWaAkFJs0J9Nh+FM/uaWLKzIbKMv5Zx8EOIj1M=;
 b=ONwOsv/+TZ1IHoJPW5rAk8yzBokIXf48SKemm7lj6KlqWHk8eGuf2L0XMQ+k7VeUx8
 1ONbaN0QUcvc/iYruOxN9ms2Idqfm09jFjCvYVg94xlcFi62yXfkdz5pTfytrDXdxMMe
 8wq9XssX0AH4AV0Kjwt17/QIUtcDPsioqhnCuXj3bnPHQjmVw/+aJQtHfiu+a6WOLN0L
 btEzAivc2QK95DYJLbAJxFPWRB+ZQ9W0t5Gc3Zu+l1CjT/YEk9baIzWdLayhdzP6jWx2
 fUqvYC143BuJlT3MT1P7W9MWhe3YpGAJff4MMad6+kO427nhZANujMtatZt87f/LCL5o
 yKdg==
X-Gm-Message-State: AOAM531XnYeHBmCPX9H+j1imLEtd9UsOeghEXJZ6PNiVaqg6//uPtGER
 fXVLgJ+enNSEFvJsuhTvU2Q1yVYticpHz3nrAjI=
X-Google-Smtp-Source: ABdhPJy6idQ6n7qzzBx0W3vays3EfqSpztYx2DIqcOubOPmKnMGJ1IhP/x503DTvYhl+JDhEBL8+oaKX8KCKFgS3nZg=
X-Received: by 2002:ac2:4c50:: with SMTP id o16mr16962319lfk.517.1638521550647; 
 Fri, 03 Dec 2021 00:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20211122093457.2006-1-kevin3.tang@gmail.com>
 <38c61593-b743-bbb6-bc1d-b4f52eda4310@linux.intel.com>
In-Reply-To: <38c61593-b743-bbb6-bc1d-b4f52eda4310@linux.intel.com>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Fri, 3 Dec 2021 16:49:34 +0800
Message-ID: <CAFPSGXajy9-Lj3-n+0KPHSJQQNHY8cDx_=mTx2p3nkh4yoj5Qg@mail.gmail.com>
Subject: Re: [RESEND PATCH v7 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy
 driver
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 pony1.wu@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com, orsonzhai@gmail.com,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maarten Lankhorst <maarten.lankhorst@linux.intel.com> =E4=BA=8E2021=E5=B9=
=B411=E6=9C=8830=E6=97=A5=E5=91=A8=E4=BA=8C 21:20=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On 22-11-2021 10:34, Kevin Tang wrote:
> > Adds dsi host controller support for the Unisoc's display subsystem.
> > Adds dsi phy support for the Unisoc's display subsystem.
> > Only MIPI DSI Displays supported, DP/TV/HMDI will be support
> > in the feature.
> >
> > v1:
> >   - Remove dphy and dsi graph binding, merge the dphy driver into the d=
si.
> >
> > v2:
> >   - Use drm_xxx to replace all DRM_XXX.
> >   - Use kzalloc to replace devm_kzalloc for sprd_dsi structure init.
> >
> > v4:
> >   - Use drmm_helpers to allocate encoder.
> >   - Move allocate encoder and connector to bind function.
> >
> > v5:
> >   - Drop the dsi ip file prefix.
> >   - Fix the checkpatch warnings.
> >   - Add Signed-off-by for dsi&dphy patch.
> >   - Use the mode_flags of mipi_dsi_device to setup crtc DPI and EDPI mo=
de.
> >
> > v6:
> >   - Redesign the way to access the dsi register.
> >   - Reduce the dsi_context member variables.
> >
> > v7:
> >   - Fix codeing style issue by checkpatch.
> >   - Drop the pll registers structure define.
> >   - Use bridge API instead of drm panel API.
> >   - Register mipi_dsi_host on probe phase;
> >   - Remove some unused function.
> > ---
> >  drivers/gpu/drm/sprd/Kconfig         |    1 +
> >  drivers/gpu/drm/sprd/Makefile        |    8 +-
> >  drivers/gpu/drm/sprd/megacores_pll.c |  305 ++++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.c      |   17 +
> >  drivers/gpu/drm/sprd/sprd_drm.c      |    1 +
> >  drivers/gpu/drm/sprd/sprd_drm.h      |    1 +
> >  drivers/gpu/drm/sprd/sprd_dsi.c      | 1075 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dsi.h      |  126 +++
> >  8 files changed, 1532 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h
> >
> > diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfi=
g
> > index 37762c333..3edeaeca0 100644
> > --- a/drivers/gpu/drm/sprd/Kconfig
> > +++ b/drivers/gpu/drm/sprd/Kconfig
> > @@ -5,6 +5,7 @@ config DRM_SPRD
> >       select DRM_GEM_CMA_HELPER
> >       select DRM_KMS_CMA_HELPER
> >       select DRM_KMS_HELPER
> > +     select DRM_MIPI_DSI
> >       select VIDEOMODE_HELPERS
> >       help
> >         Choose this option if you have a Unisoc chipset.
> > diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makef=
ile
> > index ab12b95e6..e82e6a6f8 100644
> > --- a/drivers/gpu/drm/sprd/Makefile
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -1,4 +1,8 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> > -obj-y :=3D sprd_drm.o \
> > -     sprd_dpu.o
> > +sprd-drm-y :=3D sprd_drm.o \
> > +     sprd_dpu.o \
> > +     sprd_dsi.o \
> > +     megacores_pll.o
> > +
> > +obj-$(CONFIG_DRM_SPRD) +=3D sprd-drm.o
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/sprd/megacores_pll.c b/drivers/gpu/drm/spr=
d/megacores_pll.c
> > new file mode 100644
> > index 000000000..3091dfdc1
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/megacores_pll.c
> > @@ -0,0 +1,305 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#include <asm/div64.h>
> > +#include <linux/delay.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/regmap.h>
> > +#include <linux/string.h>
> > +
> > +#include "sprd_dsi.h"
> > +
> > +#define L                                            0
> > +#define H                                            1
> > +#define CLK                                          0
> > +#define DATA                                 1
> > +#define INFINITY                             0xffffffff
> > +#define MIN_OUTPUT_FREQ                      (100)
> > +
> > +#define AVERAGE(a, b) (min(a, b) + abs((b) - (a)) / 2)
> > +
> > +/* sharkle */
> > +#define VCO_BAND_LOW 750
> > +#define VCO_BAND_MID 1100
> > +#define VCO_BAND_HIGH        1500
> > +#define PHY_REF_CLK  26000
> > +
> > +static int dphy_calc_pll_param(struct dphy_pll *pll)
> > +{
> > +     const u32 khz =3D 1000;
> > +     const u32 mhz =3D 1000000;
> > +     const unsigned long long factor =3D 100;
> > +     unsigned long long tmp;
> > +     int i;
> > +
> > +     pll->potential_fvco =3D pll->freq / khz;
> > +     pll->ref_clk =3D PHY_REF_CLK / khz;
> > +
> > +     for (i =3D 0; i < 4; ++i) {
> > +             if (pll->potential_fvco >=3D VCO_BAND_LOW &&
> > +                 pll->potential_fvco <=3D VCO_BAND_HIGH) {
> > +                     pll->fvco =3D pll->potential_fvco;
> > +                     pll->out_sel =3D BIT(i);
> > +                     break;
> > +             }
> > +             pll->potential_fvco <<=3D 1;
> > +     }
> > +     if (pll->fvco =3D=3D 0)
> > +             return -EINVAL;
> > +
> > +     if (pll->fvco >=3D VCO_BAND_LOW && pll->fvco <=3D VCO_BAND_MID) {
> > +             /* vco band control */
> > +             pll->vco_band =3D 0x0;
> > +             /* low pass filter control */
> > +             pll->lpf_sel =3D 1;
> > +     } else if (pll->fvco > VCO_BAND_MID && pll->fvco <=3D VCO_BAND_HI=
GH) {
> > +             pll->vco_band =3D 0x1;
> > +             pll->lpf_sel =3D 0;
> > +     } else {
> > +             return -EINVAL;
> > +     }
> > +
> > +     pll->nint =3D pll->fvco / pll->ref_clk;
> > +     tmp =3D pll->fvco * factor * mhz;
> > +     do_div(tmp, pll->ref_clk);
> > +     tmp =3D tmp - pll->nint * factor * mhz;
> > +     tmp *=3D BIT(20);
> > +     do_div(tmp, 100000000);
> > +     pll->kint =3D (u32)tmp;
> > +     pll->refin =3D 3; /* pre-divider bypass */
> > +     pll->sdm_en =3D true; /* use fraction N PLL */
> > +     pll->fdk_s =3D 0x1; /* fraction */
> > +     pll->cp_s =3D 0x0;
> > +     pll->det_delay =3D 0x1;
> > +
> > +     return 0;
> > +}
> > +
> > +static void dphy_set_pll_reg(struct dphy_pll *pll, struct regmap *regm=
ap)
> > +{
> > +     u8 reg_val[9] =3D {0};
> > +     int i;
> > +
> > +     u8 reg_addr[] =3D {
> > +             0x03, 0x04, 0x06, 0x08, 0x09,
> > +             0x0a, 0x0b, 0x0e, 0x0f
> > +     };
> > +
> > +     reg_val[0] =3D 1 | (1 << 1) |  (pll->lpf_sel << 2);
> > +     reg_val[1] =3D pll->div | (1 << 3) | (pll->cp_s << 5) | (pll->fdk=
_s << 7);
> > +     reg_val[2] =3D pll->nint;
> > +     reg_val[3] =3D pll->vco_band | (pll->sdm_en << 1) | (pll->refin <=
< 2);
> > +     reg_val[4] =3D pll->kint >> 12;
> > +     reg_val[5] =3D pll->kint >> 4;
> > +     reg_val[6] =3D pll->out_sel | ((pll->kint << 4) & 0xf);
> > +     reg_val[7] =3D 1 << 4;
> > +     reg_val[8] =3D pll->det_delay;
> > +
> > +     for (i =3D 0; i < sizeof(reg_addr); ++i) {
> > +             regmap_write(regmap, reg_addr[i], reg_val[i]);
> > +             DRM_DEBUG("%02x: %02x\n", reg_addr[i], reg_val[i]);
> > +     }
> > +}
> > +
> > +int dphy_pll_config(struct dsi_context *ctx)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     struct regmap *regmap =3D ctx->regmap;
> > +     struct dphy_pll *pll =3D &ctx->pll;
> > +     int ret;
> > +
> > +     pll->freq =3D dsi->slave->hs_rate;
> > +
> > +     /* FREQ =3D 26M * (NINT + KINT / 2^20) / out_sel */
> > +     ret =3D dphy_calc_pll_param(pll);
> > +     if (ret) {
> > +             drm_err(dsi->drm, "failed to calculate dphy pll parameter=
s\n");
> > +             return ret;
> > +     }
> > +     dphy_set_pll_reg(pll, regmap);
> > +
> > +     return 0;
> > +}
> > +
> > +static void dphy_set_timing_reg(struct regmap *regmap, int type, u8 va=
l[])
> > +{
> > +     switch (type) {
> > +     case REQUEST_TIME:
> > +             regmap_write(regmap, 0x31, val[CLK]);
> > +             regmap_write(regmap, 0x41, val[DATA]);
> > +             regmap_write(regmap, 0x51, val[DATA]);
> > +             regmap_write(regmap, 0x61, val[DATA]);
> > +             regmap_write(regmap, 0x71, val[DATA]);
> > +
> > +             regmap_write(regmap, 0x90, val[CLK]);
> > +             regmap_write(regmap, 0xa0, val[DATA]);
> > +             regmap_write(regmap, 0xb0, val[DATA]);
> > +             regmap_write(regmap, 0xc0, val[DATA]);
> > +             regmap_write(regmap, 0xd0, val[DATA]);
> > +             break;
> > +     case PREPARE_TIME:
> > +             regmap_write(regmap, 0x32, val[CLK]);
> > +             regmap_write(regmap, 0x42, val[DATA]);
> > +             regmap_write(regmap, 0x52, val[DATA]);
> > +             regmap_write(regmap, 0x62, val[DATA]);
> > +             regmap_write(regmap, 0x72, val[DATA]);
> > +
> > +             regmap_write(regmap, 0x91, val[CLK]);
> > +             regmap_write(regmap, 0xa1, val[DATA]);
> > +             regmap_write(regmap, 0xb1, val[DATA]);
> > +             regmap_write(regmap, 0xc1, val[DATA]);
> > +             regmap_write(regmap, 0xd1, val[DATA]);
> > +             break;
> > +     case ZERO_TIME:
> > +             regmap_write(regmap, 0x33, val[CLK]);
> > +             regmap_write(regmap, 0x43, val[DATA]);
> > +             regmap_write(regmap, 0x53, val[DATA]);
> > +             regmap_write(regmap, 0x63, val[DATA]);
> > +             regmap_write(regmap, 0x73, val[DATA]);
> > +
> > +             regmap_write(regmap, 0x92, val[CLK]);
> > +             regmap_write(regmap, 0xa2, val[DATA]);
> > +             regmap_write(regmap, 0xb2, val[DATA]);
> > +             regmap_write(regmap, 0xc2, val[DATA]);
> > +             regmap_write(regmap, 0xd2, val[DATA]);
> > +             break;
> > +     case TRAIL_TIME:
> > +             regmap_write(regmap, 0x34, val[CLK]);
> > +             regmap_write(regmap, 0x44, val[DATA]);
> > +             regmap_write(regmap, 0x54, val[DATA]);
> > +             regmap_write(regmap, 0x64, val[DATA]);
> > +             regmap_write(regmap, 0x74, val[DATA]);
> > +
> > +             regmap_write(regmap, 0x93, val[CLK]);
> > +             regmap_write(regmap, 0xa3, val[DATA]);
> > +             regmap_write(regmap, 0xb3, val[DATA]);
> > +             regmap_write(regmap, 0xc3, val[DATA]);
> > +             regmap_write(regmap, 0xd3, val[DATA]);
> > +             break;
> > +     case EXIT_TIME:
> > +             regmap_write(regmap, 0x36, val[CLK]);
> > +             regmap_write(regmap, 0x46, val[DATA]);
> > +             regmap_write(regmap, 0x56, val[DATA]);
> > +             regmap_write(regmap, 0x66, val[DATA]);
> > +             regmap_write(regmap, 0x76, val[DATA]);
> > +
> > +             regmap_write(regmap, 0x95, val[CLK]);
> > +             regmap_write(regmap, 0xA5, val[DATA]);
> > +             regmap_write(regmap, 0xB5, val[DATA]);
> > +             regmap_write(regmap, 0xc5, val[DATA]);
> > +             regmap_write(regmap, 0xd5, val[DATA]);
> > +             break;
> > +     case CLKPOST_TIME:
> > +             regmap_write(regmap, 0x35, val[CLK]);
> > +             regmap_write(regmap, 0x94, val[CLK]);
> > +             break;
> > +
> > +     /* the following just use default value */
> > +     case SETTLE_TIME:
> > +             fallthrough;
> > +     case TA_GET:
> > +             fallthrough;
> > +     case TA_GO:
> > +             fallthrough;
> > +     case TA_SURE:
> > +             fallthrough;
> > +     default:
> > +             break;
> > +     }
> > +}
> > +
> > +void dphy_timing_config(struct dsi_context *ctx)
> > +{
> > +     struct regmap *regmap =3D ctx->regmap;
> > +     struct dphy_pll *pll =3D &ctx->pll;
> > +     const u32 factor =3D 2;
> > +     const u32 scale =3D 100;
> > +     u32 t_ui, t_byteck, t_half_byteck;
> > +     u32 range[2], constant;
> > +     u8 val[2];
> > +     u32 tmp =3D 0;
> > +
> > +     /* t_ui: 1 ui, byteck: 8 ui, half byteck: 4 ui */
> > +     t_ui =3D 1000 * scale / (pll->freq / 1000);
> > +     t_byteck =3D t_ui << 3;
> > +     t_half_byteck =3D t_ui << 2;
> > +     constant =3D t_ui << 1;
> > +
> > +     /* REQUEST_TIME: HS T-LPX: LP-01
> > +      * For T-LPX, mipi spec defined min value is 50ns,
> > +      * but maybe it shouldn't be too small, because BTA,
> > +      * LP-10, LP-00, LP-01, all of this is related to T-LPX.
> > +      */
> > +     range[L] =3D 50 * scale;
> > +     range[H] =3D INFINITY;
> > +     val[CLK] =3D DIV_ROUND_UP(range[L] * (factor << 1), t_byteck) - 2=
;
> > +     val[DATA] =3D val[CLK];
> > +     dphy_set_timing_reg(regmap, REQUEST_TIME, val);
> > +
> > +     /* PREPARE_TIME: HS sequence: LP-00 */
> > +     range[L] =3D 38 * scale;
> > +     range[H] =3D 95 * scale;
> > +     tmp =3D AVERAGE(range[L], range[H]);
> > +     val[CLK] =3D DIV_ROUND_UP(AVERAGE(range[L], range[H]), t_half_byt=
eck) - 1;
> > +     range[L] =3D 40 * scale + 4 * t_ui;
> > +     range[H] =3D 85 * scale + 6 * t_ui;
> > +     tmp |=3D AVERAGE(range[L], range[H]) << 16;
> > +     val[DATA] =3D DIV_ROUND_UP(AVERAGE(range[L], range[H]), t_half_by=
teck) - 1;
> > +     dphy_set_timing_reg(regmap, PREPARE_TIME, val);
> > +
> > +     /* ZERO_TIME: HS-ZERO */
> > +     range[L] =3D 300 * scale;
> > +     range[H] =3D INFINITY;
> > +     val[CLK] =3D DIV_ROUND_UP(range[L] * factor + (tmp & 0xffff)
> > +                     - 525 * t_byteck / 100, t_byteck) - 2;
> > +     range[L] =3D 145 * scale + 10 * t_ui;
> > +     val[DATA] =3D DIV_ROUND_UP(range[L] * factor
> > +                     + ((tmp >> 16) & 0xffff) - 525 * t_byteck / 100,
> > +                     t_byteck) - 2;
> > +     dphy_set_timing_reg(regmap, ZERO_TIME, val);
> > +
> > +     /* TRAIL_TIME: HS-TRAIL */
> > +     range[L] =3D 60 * scale;
> > +     range[H] =3D INFINITY;
> > +     val[CLK] =3D DIV_ROUND_UP(range[L] * factor - constant, t_half_by=
teck);
> > +     range[L] =3D max(8 * t_ui, 60 * scale + 4 * t_ui);
> > +     val[DATA] =3D DIV_ROUND_UP(range[L] * 3 / 2 - constant, t_half_by=
teck) - 2;
> > +     dphy_set_timing_reg(regmap, TRAIL_TIME, val);
> > +
> > +     /* EXIT_TIME: */
> > +     range[L] =3D 100 * scale;
> > +     range[H] =3D INFINITY;
> > +     val[CLK] =3D DIV_ROUND_UP(range[L] * factor, t_byteck) - 2;
> > +     val[DATA] =3D val[CLK];
> > +     dphy_set_timing_reg(regmap, EXIT_TIME, val);
> > +
> > +     /* CLKPOST_TIME: */
> > +     range[L] =3D 60 * scale + 52 * t_ui;
> > +     range[H] =3D INFINITY;
> > +     val[CLK] =3D DIV_ROUND_UP(range[L] * factor, t_byteck) - 2;
> > +     val[DATA] =3D val[CLK];
> > +     dphy_set_timing_reg(regmap, CLKPOST_TIME, val);
> > +
> > +     /* SETTLE_TIME:
> > +      * This time is used for receiver. So for transmitter,
> > +      * it can be ignored.
> > +      */
> > +
> > +     /* TA_GO:
> > +      * transmitter drives bridge state(LP-00) before releasing contro=
l,
> > +      * reg 0x1f default value: 0x04, which is good.
> > +      */
> > +
> > +     /* TA_SURE:
> > +      * After LP-10 state and before bridge state(LP-00),
> > +      * reg 0x20 default value: 0x01, which is good.
> > +      */
> > +
> > +     /* TA_GET:
> > +      * receiver drives Bridge state(LP-00) before releasing control
> > +      * reg 0x21 default value: 0x03, which is good.
> > +      */
> > +}
> > diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/spr=
d_dpu.c
> > index 1d10d0998..ce9691f50 100644
> > --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> > @@ -25,6 +25,7 @@
> >
> >  #include "sprd_drm.h"
> >  #include "sprd_dpu.h"
> > +#include "sprd_dsi.h"
> >
> >  /* Global control registers */
> >  #define REG_DPU_CTRL 0x04
> > @@ -618,9 +619,25 @@ static void sprd_crtc_mode_set_nofb(struct drm_crt=
c *crtc)
> >  {
> >       struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> >       struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> > +     struct drm_encoder *encoder;
> > +     struct mipi_dsi_device *slave;
> > +     struct sprd_dsi *dsi;
> >
> >       drm_display_mode_to_videomode(mode, &dpu->ctx.vm);
> >
> > +     drm_for_each_encoder(encoder, crtc->dev) {
> > +             if (encoder->crtc !=3D crtc)
> > +                     continue;
> > +
> > +             dsi =3D encoder_to_dsi(encoder);
> > +             slave =3D dsi->slave;
> > +
> > +             if (slave->mode_flags & MIPI_DSI_MODE_VIDEO)
> > +                     dpu->ctx.if_type =3D SPRD_DPU_IF_DPI;
> > +             else
> > +                     dpu->ctx.if_type =3D SPRD_DPU_IF_EDPI;
> > +     }
> > +
> >       sprd_dpi_init(dpu);
> >  }
> >
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/spr=
d_drm.c
> > index 59b9e54f7..a077e2d4d 100644
> > --- a/drivers/gpu/drm/sprd/sprd_drm.c
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> > @@ -181,6 +181,7 @@ static struct platform_driver sprd_drm_driver =3D {
> >  static struct platform_driver *sprd_drm_drivers[]  =3D {
> >       &sprd_drm_driver,
> >       &sprd_dpu_driver,
> > +     &sprd_dsi_driver,
> >  };
> >
> >  static int __init sprd_drm_init(void)
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/spr=
d_drm.h
> > index 85d4a8b9f..95d1b972f 100644
> > --- a/drivers/gpu/drm/sprd/sprd_drm.h
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> > @@ -14,5 +14,6 @@ struct sprd_drm {
> >  };
> >
> >  extern struct platform_driver sprd_dpu_driver;
> > +extern struct platform_driver sprd_dsi_driver;
> >
> >  #endif /* _SPRD_DRM_H_ */
> > diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/spr=
d_dsi.c
> > new file mode 100644
> > index 000000000..ec8313dff
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dsi.c
> > @@ -0,0 +1,1075 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#include <linux/component.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of_graph.h>
> > +#include <video/mipi_display.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "sprd_drm.h"
> > +#include "sprd_dpu.h"
> > +#include "sprd_dsi.h"
> > +
> > +#define SOFT_RESET 0x04
> > +#define MASK_PROTOCOL_INT 0x0C
> > +#define MASK_INTERNAL_INT 0x14
> > +#define DSI_MODE_CFG 0x18
> > +
> > +#define VIRTUAL_CHANNEL_ID 0x1C
> > +#define GEN_RX_VCID GENMASK(1, 0)
> > +#define VIDEO_PKT_VCID GENMASK(3, 2)
> > +
> > +#define DPI_VIDEO_FORMAT 0x20
> > +#define DPI_VIDEO_MODE_FORMAT GENMASK(5, 0)
> > +#define LOOSELY18_EN BIT(6)
> > +
> > +#define VIDEO_PKT_CONFIG 0x24
> > +#define VIDEO_PKT_SIZE GENMASK(15, 0)
> > +#define VIDEO_LINE_CHUNK_NUM GENMASK(31, 16)
> > +
> > +#define VIDEO_LINE_HBLK_TIME 0x28
> > +#define VIDEO_LINE_HBP_TIME GENMASK(15, 0)
> > +#define VIDEO_LINE_HSA_TIME GENMASK(31, 16)
> > +
> > +#define VIDEO_LINE_TIME 0x2C
> > +
> > +#define VIDEO_VBLK_LINES 0x30
> > +#define VFP_LINES GENMASK(9, 0)
> > +#define VBP_LINES GENMASK(19, 10)
> > +#define VSA_LINES GENMASK(29, 20)
> > +
> > +#define VIDEO_VACTIVE_LINES 0x34
> > +
> > +#define VID_MODE_CFG 0x38
> > +#define VID_MODE_TYPE GENMASK(1, 0)
> > +#define LP_VSA_EN BIT(8)
> > +#define LP_VBP_EN BIT(9)
> > +#define LP_VFP_EN BIT(10)
> > +#define LP_VACT_EN BIT(11)
> > +#define LP_HBP_EN BIT(12)
> > +#define LP_HFP_EN BIT(13)
> > +#define FRAME_BTA_ACK_EN BIT(14)
> > +
> > +#define TIMEOUT_CNT_CLK_CONFIG 0x40
> > +#define HTX_TO_CONFIG 0x44
> > +#define LRX_H_TO_CONFIG 0x48
> > +
> > +#define TX_ESC_CLK_CONFIG 0x5C
> > +
> > +#define CMD_MODE_CFG 0x68
> > +#define TEAR_FX_EN BIT(0)
> > +
> > +#define GEN_HDR 0x6C
> > +#define GEN_DT GENMASK(5, 0)
> > +#define GEN_VC GENMASK(7, 6)
> > +
> > +#define GEN_PLD_DATA 0x70
> > +
> > +#define PHY_CLK_LANE_LP_CTRL 0x74
> > +#define PHY_CLKLANE_TX_REQ_HS BIT(0)
> > +#define AUTO_CLKLANE_CTRL_EN BIT(1)
> > +
> > +#define PHY_INTERFACE_CTRL 0x78
> > +#define RF_PHY_SHUTDOWN BIT(0)
> > +#define RF_PHY_RESET_N BIT(1)
> > +#define RF_PHY_CLK_EN BIT(2)
> > +
> > +#define CMD_MODE_STATUS 0x98
> > +#define GEN_CMD_RDATA_FIFO_EMPTY BIT(1)
> > +#define GEN_CMD_WDATA_FIFO_EMPTY BIT(3)
> > +#define GEN_CMD_CMD_FIFO_EMPTY BIT(5)
> > +#define GEN_CMD_RDCMD_DONE BIT(7)
> > +
> > +#define PHY_STATUS 0x9C
> > +#define PHY_LOCK BIT(1)
> > +
> > +#define PHY_MIN_STOP_TIME 0xA0
> > +#define PHY_LANE_NUM_CONFIG 0xA4
> > +
> > +#define PHY_CLKLANE_TIME_CONFIG 0xA8
> > +#define PHY_CLKLANE_LP_TO_HS_TIME GENMASK(15, 0)
> > +#define PHY_CLKLANE_HS_TO_LP_TIME GENMASK(31, 16)
> > +
> > +#define PHY_DATALANE_TIME_CONFIG 0xAC
> > +#define PHY_DATALANE_LP_TO_HS_TIME GENMASK(15, 0)
> > +#define PHY_DATALANE_HS_TO_LP_TIME GENMASK(31, 16)
> > +
> > +#define MAX_READ_TIME 0xB0
> > +
> > +#define RX_PKT_CHECK_CONFIG 0xB4
> > +#define RX_PKT_ECC_EN BIT(0)
> > +#define RX_PKT_CRC_EN BIT(1)
> > +
> > +#define TA_EN 0xB8
> > +
> > +#define EOTP_EN 0xBC
> > +#define TX_EOTP_EN BIT(0)
> > +#define RX_EOTP_EN BIT(1)
> > +
> > +#define VIDEO_NULLPKT_SIZE 0xC0
> > +#define DCS_WM_PKT_SIZE 0xC4
> > +
> > +#define VIDEO_SIG_DELAY_CONFIG 0xD0
> > +#define VIDEO_SIG_DELAY GENMASK(23, 0)
> > +
> > +#define PHY_TST_CTRL0 0xF0
> > +#define PHY_TESTCLR BIT(0)
> > +#define PHY_TESTCLK BIT(1)
> > +
> > +#define PHY_TST_CTRL1 0xF4
> > +#define PHY_TESTDIN GENMASK(7, 0)
> > +#define PHY_TESTDOUT GENMASK(15, 8)
> > +#define PHY_TESTEN BIT(16)
> > +
> > +#define host_to_dsi(host) \
> > +     container_of(host, struct sprd_dsi, host)
> > +
> > +static inline u32
> > +dsi_reg_rd(struct dsi_context *ctx, u32 offset, u32 mask,
> > +        u32 shift)
> > +{
> > +     return (readl(ctx->base + offset) & mask) >> shift;
> > +}
> > +
> > +static inline void
> > +dsi_reg_wr(struct dsi_context *ctx, u32 offset, u32 mask,
> > +        u32 shift, u32 val)
> > +{
> > +     u32 ret;
> > +
> > +     ret =3D readl(ctx->base + offset);
> > +     ret &=3D ~mask;
> > +     ret |=3D (val << shift) & mask;
> > +     writel(ret, ctx->base + offset);
> > +}
> > +
> > +static inline void
> > +dsi_reg_up(struct dsi_context *ctx, u32 offset, u32 mask,
> > +        u32 val)
> > +{
> > +     u32 ret =3D readl(ctx->base + offset);
> > +
> > +     writel((ret & ~mask) | (val & mask), ctx->base + offset);
> > +}
> > +
> > +static int regmap_tst_io_write(void *context, u32 reg, u32 val)
> > +{
> > +     struct sprd_dsi *dsi =3D context;
> > +     struct dsi_context *ctx =3D &dsi->ctx;
> > +
> > +     if (val > 0xff || reg > 0xff)
> > +             return -EINVAL;
> > +
> > +     drm_dbg(dsi->drm, "reg =3D 0x%02x, val =3D 0x%02x\n", reg, val);
> > +
> > +     dsi_reg_up(ctx, PHY_TST_CTRL1, PHY_TESTEN, PHY_TESTEN);
> > +     dsi_reg_wr(ctx, PHY_TST_CTRL1, PHY_TESTDIN, 0, reg);
> > +     dsi_reg_up(ctx, PHY_TST_CTRL0, PHY_TESTCLK, PHY_TESTCLK);
> > +     dsi_reg_up(ctx, PHY_TST_CTRL0, PHY_TESTCLK, 0);
> > +     dsi_reg_up(ctx, PHY_TST_CTRL1, PHY_TESTEN, 0);
> > +     dsi_reg_wr(ctx, PHY_TST_CTRL1, PHY_TESTDIN, 0, val);
> > +     dsi_reg_up(ctx, PHY_TST_CTRL0, PHY_TESTCLK, PHY_TESTCLK);
> > +     dsi_reg_up(ctx, PHY_TST_CTRL0, PHY_TESTCLK, 0);
> > +
> > +     return 0;
> > +}
> > +
> > +static int regmap_tst_io_read(void *context, u32 reg, u32 *val)
> > +{
> > +     struct sprd_dsi *dsi =3D context;
> > +     struct dsi_context *ctx =3D &dsi->ctx;
> > +     int ret;
> > +
> > +     if (reg > 0xff)
> > +             return -EINVAL;
> > +
> > +     dsi_reg_up(ctx, PHY_TST_CTRL1, PHY_TESTEN, PHY_TESTEN);
> > +     dsi_reg_wr(ctx, PHY_TST_CTRL1, PHY_TESTDIN, 0, reg);
> > +     dsi_reg_up(ctx, PHY_TST_CTRL0, PHY_TESTCLK, PHY_TESTCLK);
> > +     dsi_reg_up(ctx, PHY_TST_CTRL0, PHY_TESTCLK, 0);
> > +     dsi_reg_up(ctx, PHY_TST_CTRL1, PHY_TESTEN, 0);
> > +
> > +     udelay(1);
> > +
> > +     ret =3D dsi_reg_rd(ctx, PHY_TST_CTRL1, PHY_TESTDOUT, 8);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     *val =3D ret;
> > +
> > +     drm_dbg(dsi->drm, "reg =3D 0x%02x, val =3D 0x%02x\n", reg, *val);
> > +     return 0;
> > +}
> > +
> > +static struct regmap_bus regmap_tst_io =3D {
> > +     .reg_write =3D regmap_tst_io_write,
> > +     .reg_read =3D regmap_tst_io_read,
> > +};
> > +
> > +static const struct regmap_config byte_config =3D {
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 8,
> > +};
> > +
> > +static int dphy_wait_pll_locked(struct dsi_context *ctx)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     int i;
> > +
> > +     for (i =3D 0; i < 50000; i++) {
> > +             if (dsi_reg_rd(ctx, PHY_STATUS, PHY_LOCK, 1))
> > +                     return 0;
> > +             udelay(3);
> > +     }
> > +
> > +     drm_err(dsi->drm, "dphy pll can not be locked\n");
> > +     return -ETIMEDOUT;
> > +}
> > +
> > +static int dsi_wait_tx_payload_fifo_empty(struct dsi_context *ctx)
> > +{
> > +     int i;
> > +
> > +     for (i =3D 0; i < 5000; i++) {
> > +             if (dsi_reg_rd(ctx, CMD_MODE_STATUS, GEN_CMD_WDATA_FIFO_E=
MPTY, 3))
> > +                     return 0;
> > +             udelay(1);
> > +     }
> > +
> > +     return -ETIMEDOUT;
> > +}
> > +
> > +static int dsi_wait_tx_cmd_fifo_empty(struct dsi_context *ctx)
> > +{
> > +     int i;
> > +
> > +     for (i =3D 0; i < 5000; i++) {
> > +             if (dsi_reg_rd(ctx, CMD_MODE_STATUS, GEN_CMD_CMD_FIFO_EMP=
TY, 5))
> > +                     return 0;
> > +             udelay(1);
> > +     }
> > +
> > +     return -ETIMEDOUT;
> > +}
> > +
> > +static int dsi_wait_rd_resp_completed(struct dsi_context *ctx)
> > +{
> > +     int i;
> > +
> > +     for (i =3D 0; i < 10000; i++) {
> > +             if (dsi_reg_rd(ctx, CMD_MODE_STATUS, GEN_CMD_RDCMD_DONE, =
7))
> > +                     return 0;
> > +             udelay(10);
> > +     }
> > +
> > +     return -ETIMEDOUT;
> > +}
> > +
> > +static u16 calc_bytes_per_pixel_x100(int coding)
> > +{
> > +     u16 bpp_x100;
> > +
> > +     switch (coding) {
> > +     case COLOR_CODE_16BIT_CONFIG1:
> > +     case COLOR_CODE_16BIT_CONFIG2:
> > +     case COLOR_CODE_16BIT_CONFIG3:
> > +             bpp_x100 =3D 200;
> > +             break;
> > +     case COLOR_CODE_18BIT_CONFIG1:
> > +     case COLOR_CODE_18BIT_CONFIG2:
> > +             bpp_x100 =3D 225;
> > +             break;
> > +     case COLOR_CODE_24BIT:
> > +             bpp_x100 =3D 300;
> > +             break;
> > +     case COLOR_CODE_COMPRESSTION:
> > +             bpp_x100 =3D 100;
> > +             break;
> > +     case COLOR_CODE_20BIT_YCC422_LOOSELY:
> > +             bpp_x100 =3D 250;
> > +             break;
> > +     case COLOR_CODE_24BIT_YCC422:
> > +             bpp_x100 =3D 300;
> > +             break;
> > +     case COLOR_CODE_16BIT_YCC422:
> > +             bpp_x100 =3D 200;
> > +             break;
> > +     case COLOR_CODE_30BIT:
> > +             bpp_x100 =3D 375;
> > +             break;
> > +     case COLOR_CODE_36BIT:
> > +             bpp_x100 =3D 450;
> > +             break;
> > +     case COLOR_CODE_12BIT_YCC420:
> > +             bpp_x100 =3D 150;
> > +             break;
> > +     default:
> > +             DRM_ERROR("invalid color coding");
> > +             bpp_x100 =3D 0;
> > +             break;
> > +     }
> > +
> > +     return bpp_x100;
> > +}
> > +
> > +static u8 calc_video_size_step(int coding)
> > +{
> > +     u8 video_size_step;
> > +
> > +     switch (coding) {
> > +     case COLOR_CODE_16BIT_CONFIG1:
> > +     case COLOR_CODE_16BIT_CONFIG2:
> > +     case COLOR_CODE_16BIT_CONFIG3:
> > +     case COLOR_CODE_18BIT_CONFIG1:
> > +     case COLOR_CODE_18BIT_CONFIG2:
> > +     case COLOR_CODE_24BIT:
> > +     case COLOR_CODE_COMPRESSTION:
> > +             return video_size_step =3D 1;
> > +     case COLOR_CODE_20BIT_YCC422_LOOSELY:
> > +     case COLOR_CODE_24BIT_YCC422:
> > +     case COLOR_CODE_16BIT_YCC422:
> > +     case COLOR_CODE_30BIT:
> > +     case COLOR_CODE_36BIT:
> > +     case COLOR_CODE_12BIT_YCC420:
> > +             return video_size_step =3D 2;
> > +     default:
> > +             DRM_ERROR("invalid color coding");
> > +             return 0;
> > +     }
> > +}
> > +
> > +static u16 round_video_size(int coding, u16 video_size)
> > +{
> > +     switch (coding) {
> > +     case COLOR_CODE_16BIT_YCC422:
> > +     case COLOR_CODE_24BIT_YCC422:
> > +     case COLOR_CODE_20BIT_YCC422_LOOSELY:
> > +     case COLOR_CODE_12BIT_YCC420:
> > +             /* round up active H pixels to a multiple of 2 */
> > +             if ((video_size % 2) !=3D 0)
> > +                     video_size +=3D 1;
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return video_size;
> > +}
> > +
> > +#define SPRD_MIPI_DSI_FMT_DSC 0xff
> > +static u32 fmt_to_coding(u32 fmt)
> > +{
> > +     switch (fmt) {
> > +     case MIPI_DSI_FMT_RGB565:
> > +             return COLOR_CODE_16BIT_CONFIG1;
> > +     case MIPI_DSI_FMT_RGB666:
> > +     case MIPI_DSI_FMT_RGB666_PACKED:
> > +             return COLOR_CODE_18BIT_CONFIG1;
> > +     case MIPI_DSI_FMT_RGB888:
> > +             return COLOR_CODE_24BIT;
> > +     case SPRD_MIPI_DSI_FMT_DSC:
> > +             return COLOR_CODE_COMPRESSTION;
> > +     default:
> > +             DRM_ERROR("Unsupported format (%d)\n", fmt);
> > +             return COLOR_CODE_24BIT;
> > +     }
> > +}
> > +
> > +#define ns_to_cycle(ns, byte_clk) \
> > +     DIV_ROUND_UP((ns) * (byte_clk), 1000000)
> > +
> > +static void sprd_dsi_init(struct dsi_context *ctx)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     u32 byte_clk =3D dsi->slave->hs_rate / 8;
> > +     u16 data_hs2lp, data_lp2hs, clk_hs2lp, clk_lp2hs;
> > +     u16 max_rd_time;
> > +     int div;
> > +
> > +     writel(0, ctx->base + SOFT_RESET);
> > +     writel(0xffffffff, ctx->base + MASK_PROTOCOL_INT);
> > +     writel(0xffffffff, ctx->base + MASK_INTERNAL_INT);
> > +     writel(1, ctx->base + DSI_MODE_CFG);
> > +     dsi_reg_up(ctx, EOTP_EN, RX_EOTP_EN, 0);
> > +     dsi_reg_up(ctx, EOTP_EN, TX_EOTP_EN, 0);
> > +     dsi_reg_up(ctx, RX_PKT_CHECK_CONFIG, RX_PKT_ECC_EN, RX_PKT_ECC_EN=
);
> > +     dsi_reg_up(ctx, RX_PKT_CHECK_CONFIG, RX_PKT_CRC_EN, RX_PKT_CRC_EN=
);
> > +     writel(1, ctx->base + TA_EN);
> > +     dsi_reg_up(ctx, VIRTUAL_CHANNEL_ID, VIDEO_PKT_VCID, 0);
> > +     dsi_reg_up(ctx, VIRTUAL_CHANNEL_ID, GEN_RX_VCID, 0);
> > +
> > +     div =3D DIV_ROUND_UP(byte_clk, dsi->slave->lp_rate);
> > +     writel(div, ctx->base + TX_ESC_CLK_CONFIG);
> > +
> > +     max_rd_time =3D ns_to_cycle(ctx->max_rd_time, byte_clk);
> > +     writel(max_rd_time, ctx->base + MAX_READ_TIME);
> > +
> > +     data_hs2lp =3D ns_to_cycle(ctx->data_hs2lp, byte_clk);
> > +     data_lp2hs =3D ns_to_cycle(ctx->data_lp2hs, byte_clk);
> > +     clk_hs2lp =3D ns_to_cycle(ctx->clk_hs2lp, byte_clk);
> > +     clk_lp2hs =3D ns_to_cycle(ctx->clk_lp2hs, byte_clk);
> > +     dsi_reg_wr(ctx, PHY_DATALANE_TIME_CONFIG,
> > +                PHY_DATALANE_HS_TO_LP_TIME, 16, data_hs2lp);
> > +     dsi_reg_wr(ctx, PHY_DATALANE_TIME_CONFIG,
> > +                PHY_DATALANE_LP_TO_HS_TIME, 0, data_lp2hs);
> > +     dsi_reg_wr(ctx, PHY_CLKLANE_TIME_CONFIG,
> > +                PHY_CLKLANE_HS_TO_LP_TIME, 16, clk_hs2lp);
> > +     dsi_reg_wr(ctx, PHY_CLKLANE_TIME_CONFIG,
> > +                PHY_CLKLANE_LP_TO_HS_TIME, 0, clk_lp2hs);
> > +
> > +     writel(1, ctx->base + SOFT_RESET);
> > +}
> > +
> > +/*
> > + * Free up resources and shutdown host controller and PHY
> > + */
> > +static void sprd_dsi_fini(struct dsi_context *ctx)
> > +{
> > +     writel(0xffffffff, ctx->base + MASK_PROTOCOL_INT);
> > +     writel(0xffffffff, ctx->base + MASK_INTERNAL_INT);
> > +     writel(0, ctx->base + SOFT_RESET);
> > +}
> > +
> > +/*
> > + * If not in burst mode, it will compute the video and null packet siz=
es
> > + * according to necessity.
> > + * Configure timers for data lanes and/or clock lane to return to LP w=
hen
> > + * bandwidth is not filled by data.
> > + */
> > +static int sprd_dsi_dpi_video(struct dsi_context *ctx)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     struct videomode *vm =3D &ctx->vm;
> > +     u32 byte_clk =3D dsi->slave->hs_rate / 8;
> > +     u16 bpp_x100;
> > +     u16 video_size;
> > +     u32 ratio_x1000;
> > +     u16 null_pkt_size =3D 0;
> > +     u8 video_size_step;
> > +     u32 hs_to;
> > +     u32 total_bytes;
> > +     u32 bytes_per_chunk;
> > +     u32 chunks =3D 0;
> > +     u32 bytes_left =3D 0;
> > +     u32 chunk_overhead;
> > +     const u8 pkt_header =3D 6;
> > +     u8 coding;
> > +     int div;
> > +     u16 hline;
> > +     u16 byte_cycle;
> > +
> > +     coding =3D fmt_to_coding(dsi->slave->format);
> > +     video_size =3D round_video_size(coding, vm->hactive);
> > +     bpp_x100 =3D calc_bytes_per_pixel_x100(coding);
> > +     video_size_step =3D calc_video_size_step(coding);
> > +     ratio_x1000 =3D byte_clk * 1000 / (vm->pixelclock / 1000);
> > +     hline =3D vm->hactive + vm->hsync_len + vm->hfront_porch +
> > +             vm->hback_porch;
> > +
> > +     writel(0, ctx->base + SOFT_RESET);
> > +     dsi_reg_wr(ctx, VID_MODE_CFG, FRAME_BTA_ACK_EN, 15, ctx->frame_ac=
k_en);
> > +     dsi_reg_wr(ctx, DPI_VIDEO_FORMAT, DPI_VIDEO_MODE_FORMAT, 0, codin=
g);
> > +     dsi_reg_wr(ctx, VID_MODE_CFG, VID_MODE_TYPE, 0, ctx->burst_mode);
> > +     byte_cycle =3D 95 * hline * ratio_x1000 / 100000;
> > +     dsi_reg_wr(ctx, VIDEO_SIG_DELAY_CONFIG, VIDEO_SIG_DELAY, 0, byte_=
cycle);
> > +     byte_cycle =3D hline * ratio_x1000 / 1000;
> > +     writel(byte_cycle, ctx->base + VIDEO_LINE_TIME);
> > +     byte_cycle =3D vm->hsync_len * ratio_x1000 / 1000;
> > +     dsi_reg_wr(ctx, VIDEO_LINE_HBLK_TIME, VIDEO_LINE_HSA_TIME, 16, by=
te_cycle);
> > +     byte_cycle =3D vm->hback_porch * ratio_x1000 / 1000;
> > +     dsi_reg_wr(ctx, VIDEO_LINE_HBLK_TIME, VIDEO_LINE_HBP_TIME, 0, byt=
e_cycle);
> > +     writel(vm->vactive, ctx->base + VIDEO_VACTIVE_LINES);
> > +     dsi_reg_wr(ctx, VIDEO_VBLK_LINES, VFP_LINES, 0, vm->vfront_porch)=
;
> > +     dsi_reg_wr(ctx, VIDEO_VBLK_LINES, VBP_LINES, 10, vm->vback_porch)=
;
> > +     dsi_reg_wr(ctx, VIDEO_VBLK_LINES, VSA_LINES, 20, vm->vsync_len);
> > +     dsi_reg_up(ctx, VID_MODE_CFG, LP_HBP_EN | LP_HFP_EN | LP_VACT_EN =
|
> > +                     LP_VFP_EN | LP_VBP_EN | LP_VSA_EN, LP_HBP_EN | LP=
_HFP_EN |
> > +                     LP_VACT_EN | LP_VFP_EN | LP_VBP_EN | LP_VSA_EN);
> > +
> > +     hs_to =3D (hline * vm->vactive) + (2 * bpp_x100) / 100;
> > +     for (div =3D 0x80; (div < hs_to) && (div > 2); div--) {
> > +             if ((hs_to % div) =3D=3D 0) {
> > +                     writel(div, ctx->base + TIMEOUT_CNT_CLK_CONFIG);
> > +                     writel(hs_to / div, ctx->base + LRX_H_TO_CONFIG);
> > +                     writel(hs_to / div, ctx->base + HTX_TO_CONFIG);
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (ctx->burst_mode =3D=3D VIDEO_BURST_WITH_SYNC_PULSES) {
> > +             dsi_reg_wr(ctx, VIDEO_PKT_CONFIG, VIDEO_PKT_SIZE, 0, vide=
o_size);
> > +             writel(0, ctx->base + VIDEO_NULLPKT_SIZE);
> > +             dsi_reg_up(ctx, VIDEO_PKT_CONFIG, VIDEO_LINE_CHUNK_NUM, 0=
);
> > +     } else {
> > +             /* non burst transmission */
> > +             null_pkt_size =3D 0;
> > +
> > +             /* bytes to be sent - first as one chunk */
> > +             bytes_per_chunk =3D vm->hactive * bpp_x100 / 100 + pkt_he=
ader;
> > +
> > +             /* hline total bytes from the DPI interface */
> > +             total_bytes =3D (vm->hactive + vm->hfront_porch) *
> > +                             ratio_x1000 / dsi->slave->lanes / 1000;
> > +
> > +             /* check if the pixels actually fit on the DSI link */
> > +             if (total_bytes < bytes_per_chunk) {
> > +                     drm_err(dsi->drm, "current resolution can not be =
set\n");
> > +                     return -EINVAL;
> > +             }
> > +
> > +             chunk_overhead =3D total_bytes - bytes_per_chunk;
> > +
> > +             /* overhead higher than 1 -> enable multi packets */
> > +             if (chunk_overhead > 1) {
> > +                     /* multi packets */
> > +                     for (video_size =3D video_size_step;
> > +                          video_size < vm->hactive;
> > +                          video_size +=3D video_size_step) {
> > +                             if (vm->hactive * 1000 / video_size % 100=
0)
> > +                                     continue;
> > +
> > +                             chunks =3D vm->hactive / video_size;
> > +                             bytes_per_chunk =3D bpp_x100 * video_size=
 / 100
> > +                                               + pkt_header;
> > +                             if (total_bytes >=3D (bytes_per_chunk * c=
hunks)) {
> > +                                     bytes_left =3D total_bytes -
> > +                                                  bytes_per_chunk * ch=
unks;
> > +                                     break;
> > +                             }
> > +                     }
> > +
> > +                     /* prevent overflow (unsigned - unsigned) */
> > +                     if (bytes_left > (pkt_header * chunks)) {
> > +                             null_pkt_size =3D (bytes_left -
> > +                                             pkt_header * chunks) / ch=
unks;
> > +                             /* avoid register overflow */
> > +                             if (null_pkt_size > 1023)
> > +                                     null_pkt_size =3D 1023;
> > +                     }
> > +
> > +             } else {
> > +                     /* single packet */
> > +                     chunks =3D 1;
> > +
> > +                     /* must be a multiple of 4 except 18 loosely */
> > +                     for (video_size =3D vm->hactive;
> > +                         (video_size % video_size_step) !=3D 0;
> > +                          video_size++)
> > +                             ;
> > +             }
> > +
> > +             dsi_reg_wr(ctx, VIDEO_PKT_CONFIG, VIDEO_PKT_SIZE, 0, vide=
o_size);
> > +             writel(null_pkt_size, ctx->base + VIDEO_NULLPKT_SIZE);
> > +             dsi_reg_wr(ctx, VIDEO_PKT_CONFIG, VIDEO_LINE_CHUNK_NUM, 1=
6, chunks);
> > +     }
> > +
> > +     writel(ctx->int0_mask, ctx->base + MASK_PROTOCOL_INT);
> > +     writel(ctx->int1_mask, ctx->base + MASK_INTERNAL_INT);
> > +     writel(1, ctx->base + SOFT_RESET);
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_dsi_edpi_video(struct dsi_context *ctx)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     const u32 fifo_depth =3D 1096;
> > +     const u32 word_length =3D 4;
> > +     u32 hactive =3D ctx->vm.hactive;
> > +     u32 bpp_x100;
> > +     u32 max_fifo_len;
> > +     u8 coding;
> > +
> > +     coding =3D fmt_to_coding(dsi->slave->format);
> > +     bpp_x100 =3D calc_bytes_per_pixel_x100(coding);
> > +     max_fifo_len =3D word_length * fifo_depth * 100 / bpp_x100;
> > +
> > +     writel(0, ctx->base + SOFT_RESET);
> > +     dsi_reg_wr(ctx, DPI_VIDEO_FORMAT, DPI_VIDEO_MODE_FORMAT, 0, codin=
g);
> > +     dsi_reg_wr(ctx, CMD_MODE_CFG, TEAR_FX_EN, 0, ctx->te_ack_en);
> > +
> > +     if (max_fifo_len > hactive)
> > +             writel(hactive, ctx->base + DCS_WM_PKT_SIZE);
> > +     else
> > +             writel(max_fifo_len, ctx->base + DCS_WM_PKT_SIZE);
> > +
> > +     writel(ctx->int0_mask, ctx->base + MASK_PROTOCOL_INT);
> > +     writel(ctx->int1_mask, ctx->base + MASK_INTERNAL_INT);
> > +     writel(1, ctx->base + SOFT_RESET);
> > +}
> > +
> > +/*
> > + * Send a packet on the generic interface,
> > + * this function has an active delay to wait for the buffer to clear.
> > + * The delay is limited to:
> > + * (param_length / 4) x DSIH_FIFO_ACTIVE_WAIT x register access time
> > + * the controller restricts the sending of.
> > + *
> > + * This function will not be able to send Null and Blanking packets du=
e to
> > + * controller restriction
> > + */
> > +static int sprd_dsi_wr_pkt(struct dsi_context *ctx, u8 vc, u8 type,
> > +                        const u8 *param, u16 len)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     u8 wc_lsbyte, wc_msbyte;
> > +     u32 payload;
> > +     int i, j, ret;
> > +
> > +     if (vc > 3)
> > +             return -EINVAL;
> > +
> > +     /* 1st: for long packet, must config payload first */
> > +     ret =3D dsi_wait_tx_payload_fifo_empty(ctx);
> > +     if (ret) {
> > +             drm_err(dsi->drm, "tx payload fifo is not empty\n");
> > +             return ret;
> > +     }
> > +
> > +     if (len > 2) {
> > +             for (i =3D 0, j =3D 0; i < len; i +=3D j) {
> > +                     payload =3D 0;
> > +                     for (j =3D 0; (j < 4) && ((j + i) < (len)); j++)
> > +                             payload |=3D param[i + j] << (j * 8);
> > +
> > +                     writel(payload, ctx->base + GEN_PLD_DATA);
> > +             }
> > +             wc_lsbyte =3D len & 0xff;
> > +             wc_msbyte =3D len >> 8;
> > +     } else {
> > +             wc_lsbyte =3D (len > 0) ? param[0] : 0;
> > +             wc_msbyte =3D (len > 1) ? param[1] : 0;
> > +     }
> > +
> > +     /* 2nd: then set packet header */
> > +     ret =3D dsi_wait_tx_cmd_fifo_empty(ctx);
> > +     if (ret) {
> > +             drm_err(dsi->drm, "tx cmd fifo is not empty\n");
> > +             return ret;
> > +     }
> > +
> > +     writel(type | (vc << 6) | (wc_lsbyte << 8) | (wc_msbyte << 16),
> > +            ctx->base + GEN_HDR);
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * Send READ packet to peripheral using the generic interface,
> > + * this will force command mode and stop video mode (because of BTA).
> > + *
> > + * This function has an active delay to wait for the buffer to clear,
> > + * the delay is limited to 2 x DSIH_FIFO_ACTIVE_WAIT
> > + * (waiting for command buffer, and waiting for receiving)
> > + * @note this function will enable BTA
> > + */
> > +static int sprd_dsi_rd_pkt(struct dsi_context *ctx, u8 vc, u8 type,
> > +                        u8 msb_byte, u8 lsb_byte,
> > +                        u8 *buffer, u8 bytes_to_read)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     int i, ret;
> > +     int count =3D 0;
> > +     u32 temp;
> > +
> > +     if (vc > 3)
> > +             return -EINVAL;
> > +
> > +     /* 1st: send read command to peripheral */
> > +     ret =3D dsi_reg_rd(ctx, CMD_MODE_STATUS, GEN_CMD_CMD_FIFO_EMPTY, =
5);
> > +     if (!ret)
> > +             return -EIO;
> > +
> > +     writel(type | (vc << 6) | (lsb_byte << 8) | (msb_byte << 16),
> > +            ctx->base + GEN_HDR);
> > +
> > +     /* 2nd: wait peripheral response completed */
> > +     ret =3D dsi_wait_rd_resp_completed(ctx);
> > +     if (ret) {
> > +             drm_err(dsi->drm, "wait read response time out\n");
> > +             return ret;
> > +     }
> > +
> > +     /* 3rd: get data from rx payload fifo */
> > +     ret =3D dsi_reg_rd(ctx, CMD_MODE_STATUS, GEN_CMD_RDATA_FIFO_EMPTY=
, 1);
> > +     if (ret) {
> > +             drm_err(dsi->drm, "rx payload fifo empty\n");
> > +             return -EIO;
> > +     }
> > +
> > +     for (i =3D 0; i < 100; i++) {
> > +             temp =3D readl(ctx->base + GEN_PLD_DATA);
> > +
> > +             if (count < bytes_to_read)
> > +                     buffer[count++] =3D temp & 0xff;
> > +             if (count < bytes_to_read)
> > +                     buffer[count++] =3D (temp >> 8) & 0xff;
> > +             if (count < bytes_to_read)
> > +                     buffer[count++] =3D (temp >> 16) & 0xff;
> > +             if (count < bytes_to_read)
> > +                     buffer[count++] =3D (temp >> 24) & 0xff;
> > +
> > +             ret =3D dsi_reg_rd(ctx, CMD_MODE_STATUS, GEN_CMD_RDATA_FI=
FO_EMPTY, 1);
> > +             if (ret)
> > +                     return count;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_dsi_set_work_mode(struct dsi_context *ctx, u8 mode)
> > +{
> > +     if (mode =3D=3D DSI_MODE_CMD)
> > +             writel(1, ctx->base + DSI_MODE_CFG);
> > +     else
> > +             writel(0, ctx->base + DSI_MODE_CFG);
> > +}
> > +
> > +static void sprd_dsi_state_reset(struct dsi_context *ctx)
> > +{
> > +     writel(0, ctx->base + SOFT_RESET);
> > +     udelay(100);
> > +     writel(1, ctx->base + SOFT_RESET);
> > +}
> > +
> > +static int sprd_dphy_init(struct dsi_context *ctx)
> > +{
> > +     struct sprd_dsi *dsi =3D container_of(ctx, struct sprd_dsi, ctx);
> > +     int ret;
> > +
> > +     dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_RESET_N, 0);
> > +     dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_SHUTDOWN, 0);
> > +     dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_CLK_EN, 0);
> > +
> > +     dsi_reg_up(ctx, PHY_TST_CTRL0, PHY_TESTCLR, 0);
> > +     dsi_reg_up(ctx, PHY_TST_CTRL0, PHY_TESTCLR, PHY_TESTCLR);
> > +     dsi_reg_up(ctx, PHY_TST_CTRL0, PHY_TESTCLR, 0);
> > +
> > +     dphy_pll_config(ctx);
> > +     dphy_timing_config(ctx);
> > +
> > +     dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_SHUTDOWN, RF_PHY_SHUTD=
OWN);
> > +     dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_RESET_N, RF_PHY_RESET_=
N);
> > +     writel(0x1C, ctx->base + PHY_MIN_STOP_TIME);
> > +     dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_CLK_EN, RF_PHY_CLK_EN)=
;
> > +     writel(dsi->slave->lanes - 1, ctx->base + PHY_LANE_NUM_CONFIG);
> > +
> > +     ret =3D dphy_wait_pll_locked(ctx);
> > +     if (ret) {
> > +             drm_err(dsi->drm, "dphy initial failed\n");
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_dphy_fini(struct dsi_context *ctx)
> > +{
> > +     dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_RESET_N, 0);
> > +     dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_SHUTDOWN, 0);
> > +     dsi_reg_up(ctx, PHY_INTERFACE_CTRL, RF_PHY_RESET_N, RF_PHY_RESET_=
N);
> > +}
> > +
> > +static void sprd_dsi_encoder_mode_set(struct drm_encoder *encoder,
> > +                                   struct drm_display_mode *mode,
> > +                              struct drm_display_mode *adj_mode)
> > +{
> > +     struct sprd_dsi *dsi =3D encoder_to_dsi(encoder);
> > +
> > +     drm_display_mode_to_videomode(adj_mode, &dsi->ctx.vm);
> > +}
> > +
> > +static void sprd_dsi_encoder_enable(struct drm_encoder *encoder)
> > +{
> > +     struct sprd_dsi *dsi =3D encoder_to_dsi(encoder);
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(encoder->crtc);
> > +     struct dsi_context *ctx =3D &dsi->ctx;
> > +
> > +     if (ctx->enabled) {
> > +             drm_warn(dsi->drm, "dsi is initialized\n");
> > +             return;
> > +     }
> > +
> > +     sprd_dsi_init(ctx);
> > +     if (ctx->work_mode =3D=3D DSI_MODE_VIDEO)
> > +             sprd_dsi_dpi_video(ctx);
> > +     else
> > +             sprd_dsi_edpi_video(ctx);
> > +
> > +     sprd_dphy_init(ctx);
> > +
> > +     sprd_dsi_set_work_mode(ctx, ctx->work_mode);
> > +     sprd_dsi_state_reset(ctx);
> > +
> > +     if (dsi->slave->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
> > +             dsi_reg_up(ctx, PHY_CLK_LANE_LP_CTRL, AUTO_CLKLANE_CTRL_E=
N,
> > +                        AUTO_CLKLANE_CTRL_EN);
> > +     } else {
> > +             dsi_reg_up(ctx, PHY_CLK_LANE_LP_CTRL, RF_PHY_CLK_EN, RF_P=
HY_CLK_EN);
> > +             dsi_reg_up(ctx, PHY_CLK_LANE_LP_CTRL, PHY_CLKLANE_TX_REQ_=
HS,
> > +                        PHY_CLKLANE_TX_REQ_HS);
> > +             dphy_wait_pll_locked(ctx);
> > +     }
> > +
> > +     sprd_dpu_run(dpu);
> > +
> > +     ctx->enabled =3D true;
> > +}
> > +
> > +static void sprd_dsi_encoder_disable(struct drm_encoder *encoder)
> > +{
> > +     struct sprd_dsi *dsi =3D encoder_to_dsi(encoder);
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(encoder->crtc);
> > +     struct dsi_context *ctx =3D &dsi->ctx;
> > +
> > +     if (!ctx->enabled) {
> > +             drm_warn(dsi->drm, "dsi isn't initialized\n");
> > +             return;
> > +     }
> > +
> > +     sprd_dpu_stop(dpu);
> > +     sprd_dphy_fini(ctx);
> > +     sprd_dsi_fini(ctx);
> > +
> > +     ctx->enabled =3D false;
> > +}
> > +
> > +static const struct drm_encoder_helper_funcs sprd_encoder_helper_funcs=
 =3D {
> > +     .mode_set       =3D sprd_dsi_encoder_mode_set,
> > +     .enable         =3D sprd_dsi_encoder_enable,
> > +     .disable        =3D sprd_dsi_encoder_disable
> > +};
> > +
> > +static const struct drm_encoder_funcs sprd_encoder_funcs =3D {
> > +     .destroy =3D drm_encoder_cleanup,
> > +};
> > +
> > +static int sprd_dsi_host_attach(struct mipi_dsi_host *host,
> > +                             struct mipi_dsi_device *slave)
> > +{
> > +     struct sprd_dsi *dsi =3D host_to_dsi(host);
> > +     struct dsi_context *ctx =3D &dsi->ctx;
> > +
> > +     dsi->slave =3D slave;
> > +
> > +     if (slave->mode_flags & MIPI_DSI_MODE_VIDEO)
> > +             ctx->work_mode =3D DSI_MODE_VIDEO;
> > +     else
> > +             ctx->work_mode =3D DSI_MODE_CMD;
> > +
> > +     if (slave->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> > +             ctx->burst_mode =3D VIDEO_BURST_WITH_SYNC_PULSES;
> > +     else if (slave->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> > +             ctx->burst_mode =3D VIDEO_NON_BURST_WITH_SYNC_PULSES;
> > +     else
> > +             ctx->burst_mode =3D VIDEO_NON_BURST_WITH_SYNC_EVENTS;
> > +
> > +     return 0;
> > +}
> > +
> > +static int sprd_dsi_host_detach(struct mipi_dsi_host *host,
> > +                             struct mipi_dsi_device *slave)
> > +{
> > +     /* do nothing */
> > +     return 0;
> > +}
> > +
> > +static ssize_t sprd_dsi_host_transfer(struct mipi_dsi_host *host,
> > +                                   const struct mipi_dsi_msg *msg)
> > +{
> > +     struct sprd_dsi *dsi =3D host_to_dsi(host);
> > +     const u8 *tx_buf =3D msg->tx_buf;
> > +
> > +     if (msg->rx_buf && msg->rx_len) {
> > +             u8 lsb =3D (msg->tx_len > 0) ? tx_buf[0] : 0;
> > +             u8 msb =3D (msg->tx_len > 1) ? tx_buf[1] : 0;
> > +
> > +             return sprd_dsi_rd_pkt(&dsi->ctx, msg->channel, msg->type=
,
> > +                             msb, lsb, msg->rx_buf, msg->rx_len);
> > +     }
> > +
> > +     if (msg->tx_buf && msg->tx_len)
> > +             return sprd_dsi_wr_pkt(&dsi->ctx, msg->channel, msg->type=
,
> > +                                     tx_buf, msg->tx_len);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct mipi_dsi_host_ops sprd_dsi_host_ops =3D {
> > +     .attach =3D sprd_dsi_host_attach,
> > +     .detach =3D sprd_dsi_host_detach,
> > +     .transfer =3D sprd_dsi_host_transfer,
> > +};
> > +
> > +static int sprd_dsi_encoder_init(struct sprd_dsi *dsi,
> > +                              struct device *dev)
> > +{
> > +     struct drm_encoder *encoder =3D &dsi->encoder;
> > +     u32 crtc_mask;
> > +     int ret;
> > +
> > +     crtc_mask =3D drm_of_find_possible_crtcs(dsi->drm, dev->of_node);
> > +     if (!crtc_mask) {
> > +             drm_err(dsi->drm, "failed to find crtc mask\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     drm_dbg(dsi->drm, "find possible crtcs: 0x%08x\n", crtc_mask);
> > +
> > +     encoder->possible_crtcs =3D crtc_mask;
> > +     ret =3D drm_encoder_init(dsi->drm, encoder, &sprd_encoder_funcs,
> > +                            DRM_MODE_ENCODER_DSI, NULL);
> > +     if (ret) {
> > +             drm_err(dsi->drm, "failed to init dsi encoder\n");
> > +             return ret;
> > +     }
> > +
> > +     drm_encoder_helper_add(encoder, &sprd_encoder_helper_funcs);
> > +
> > +     return 0;
> > +}
> > +
> > +static int sprd_dsi_bridge_init(struct sprd_dsi *dsi,
> > +                             struct device *dev)
> > +{
> > +     int ret;
> > +
> > +     dsi->panel_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1=
, 0);
> > +     if (IS_ERR(dsi->panel_bridge))
> > +             return PTR_ERR(dsi->panel_bridge);
> > +
> > +     ret =3D drm_bridge_attach(&dsi->encoder, dsi->panel_bridge, NULL,=
 0);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static int sprd_dsi_context_init(struct sprd_dsi *dsi,
> > +                              struct device *dev)
> > +{
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     struct dsi_context *ctx =3D &dsi->ctx;
> > +     struct resource *res;
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     ctx->base =3D devm_ioremap(dev, res->start, resource_size(res));
> > +     if (!ctx->base) {
> > +             drm_err(dsi->drm, "failed to map dsi host registers\n");
> > +             return -ENXIO;
> > +     }
> > +
> > +     ctx->regmap =3D devm_regmap_init(dev, &regmap_tst_io, dsi, &byte_=
config);
> > +     if (IS_ERR(ctx->regmap)) {
> > +             drm_err(dsi->drm, "dphy regmap init failed\n");
> > +             return PTR_ERR(ctx->regmap);
> > +     }
> > +
> > +     ctx->data_hs2lp =3D 120;
> > +     ctx->data_lp2hs =3D 500;
> > +     ctx->clk_hs2lp =3D 4;
> > +     ctx->clk_lp2hs =3D 15;
> > +     ctx->max_rd_time =3D 6000;
> > +     ctx->int0_mask =3D 0xffffffff;
> > +     ctx->int1_mask =3D 0xffffffff;
> > +     ctx->enabled =3D true;
> > +
> > +     return 0;
> > +}
> > +
> > +static int sprd_dsi_bind(struct device *dev, struct device *master, vo=
id *data)
> > +{
> > +     struct drm_device *drm =3D data;
> > +     struct sprd_dsi *dsi =3D dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     dsi->drm =3D drm;
> > +
> > +     ret =3D sprd_dsi_encoder_init(dsi, dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D sprd_dsi_bridge_init(dsi, dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D sprd_dsi_context_init(dsi, dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_dsi_unbind(struct device *dev,
> > +                         struct device *master, void *data)
> > +{
> > +     struct sprd_dsi *dsi =3D dev_get_drvdata(dev);
> > +
> > +     drm_of_panel_bridge_remove(dev->of_node, 1, 0);
> > +
> > +     drm_encoder_cleanup(&dsi->encoder);
> > +}
> > +
> > +static const struct component_ops dsi_component_ops =3D {
> > +     .bind   =3D sprd_dsi_bind,
> > +     .unbind =3D sprd_dsi_unbind,
> > +};
> > +
> > +static const struct of_device_id dsi_match_table[] =3D {
> > +     { .compatible =3D "sprd,sharkl3-dsi-host" },
> > +     { /* sentinel */ },
> > +};
> > +
> > +static int sprd_dsi_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct sprd_dsi *dsi;
> > +
> > +     dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> > +     if (!dsi)
> > +             return -ENOMEM;
> > +
> > +     dev_set_drvdata(dev, dsi);
> > +
> > +     dsi->host.ops =3D &sprd_dsi_host_ops;
> > +     dsi->host.dev =3D dev;
> > +     mipi_dsi_host_register(&dsi->host);
> > +
> > +     return component_add(&pdev->dev, &dsi_component_ops);
> > +}
> > +
> > +static int sprd_dsi_remove(struct platform_device *pdev)
> > +{
> > +     struct sprd_dsi *dsi =3D dev_get_drvdata(&pdev->dev);
> > +
> > +     component_del(&pdev->dev, &dsi_component_ops);
> > +
> > +     mipi_dsi_host_unregister(&dsi->host);
> > +
> > +     return 0;
> > +}
> > +
> > +struct platform_driver sprd_dsi_driver =3D {
> > +     .probe =3D sprd_dsi_probe,
> > +     .remove =3D sprd_dsi_remove,
> > +     .driver =3D {
> > +             .name =3D "sprd-dsi-drv",
> > +             .of_match_table =3D dsi_match_table,
> > +     },
> > +};
> > +
> > +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> > +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> > +MODULE_DESCRIPTION("Unisoc MIPI DSI HOST Controller Driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/gpu/drm/sprd/sprd_dsi.h b/drivers/gpu/drm/sprd/spr=
d_dsi.h
> > new file mode 100644
> > index 000000000..d858ebb11
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dsi.h
> > @@ -0,0 +1,126 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#ifndef __SPRD_DSI_H__
> > +#define __SPRD_DSI_H__
> > +
> > +#include <linux/of.h>
> > +#include <linux/device.h>
> > +#include <linux/regmap.h>
> > +#include <video/videomode.h>
> > +
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_encoder.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_panel.h>
> > +
> > +#define encoder_to_dsi(encoder) \
> > +     container_of(encoder, struct sprd_dsi, encoder)
> > +
> > +enum dsi_work_mode {
> > +     DSI_MODE_CMD =3D 0,
> > +     DSI_MODE_VIDEO
> > +};
> > +
> > +enum video_burst_mode {
> > +     VIDEO_NON_BURST_WITH_SYNC_PULSES =3D 0,
> > +     VIDEO_NON_BURST_WITH_SYNC_EVENTS,
> > +     VIDEO_BURST_WITH_SYNC_PULSES
> > +};
> > +
> > +enum dsi_color_coding {
> > +     COLOR_CODE_16BIT_CONFIG1 =3D 0,
> > +     COLOR_CODE_16BIT_CONFIG2,
> > +     COLOR_CODE_16BIT_CONFIG3,
> > +     COLOR_CODE_18BIT_CONFIG1,
> > +     COLOR_CODE_18BIT_CONFIG2,
> > +     COLOR_CODE_24BIT,
> > +     COLOR_CODE_20BIT_YCC422_LOOSELY,
> > +     COLOR_CODE_24BIT_YCC422,
> > +     COLOR_CODE_16BIT_YCC422,
> > +     COLOR_CODE_30BIT,
> > +     COLOR_CODE_36BIT,
> > +     COLOR_CODE_12BIT_YCC420,
> > +     COLOR_CODE_COMPRESSTION,
> > +     COLOR_CODE_MAX
> > +};
> > +
> > +enum pll_timing {
> > +     NONE,
> > +     REQUEST_TIME,
> > +     PREPARE_TIME,
> > +     SETTLE_TIME,
> > +     ZERO_TIME,
> > +     TRAIL_TIME,
> > +     EXIT_TIME,
> > +     CLKPOST_TIME,
> > +     TA_GET,
> > +     TA_GO,
> > +     TA_SURE,
> > +     TA_WAIT,
> > +};
> > +
> > +struct dphy_pll {
> > +     u8 refin; /* Pre-divider control signal */
> > +     u8 cp_s; /* 00: SDM_EN=3D1, 10: SDM_EN=3D0 */
> > +     u8 fdk_s; /* PLL mode control: integer or fraction */
> > +     u8 sdm_en;
> > +     u8 div;
> > +     u8 int_n; /* integer N PLL */
> > +     u32 ref_clk; /* dphy reference clock, unit: MHz */
> > +     u32 freq; /* panel config, unit: KHz */
> > +     u32 fvco;
> > +     u32 potential_fvco;
> > +     u32 nint; /* sigma delta modulator NINT control */
> > +     u32 kint; /* sigma delta modulator KINT control */
> > +     u8 lpf_sel; /* low pass filter control */
> > +     u8 out_sel; /* post divider control */
> > +     u8 vco_band; /* vco range */
> > +     u8 det_delay;
> > +};
> > +
> > +struct dsi_context {
> > +     void __iomem *base;
> > +     struct regmap *regmap;
> > +     struct dphy_pll pll;
> > +     struct videomode vm;
> > +     bool enabled;
> > +
> > +     u8 work_mode;
> > +     u8 burst_mode;
> > +     u32 int0_mask;
> > +     u32 int1_mask;
> > +
> > +     /* maximum time (ns) for data lanes from HS to LP */
> > +     u16 data_hs2lp;
> > +     /* maximum time (ns) for data lanes from LP to HS */
> > +     u16 data_lp2hs;
> > +     /* maximum time (ns) for clk lanes from HS to LP */
> > +     u16 clk_hs2lp;
> > +     /* maximum time (ns) for clk lanes from LP to HS */
> > +     u16 clk_lp2hs;
> > +     /* maximum time (ns) for BTA operation - REQUIRED */
> > +     u16 max_rd_time;
> > +     /* enable receiving frame ack packets - for video mode */
> > +     bool frame_ack_en;
> > +     /* enable receiving tear effect ack packets - for cmd mode */
> > +     bool te_ack_en;
> > +};
> > +
> > +struct sprd_dsi {
> > +     struct drm_device *drm;
> > +     struct mipi_dsi_host host;
> > +     struct mipi_dsi_device *slave;
> > +     struct drm_encoder encoder;
> > +     struct drm_bridge *panel_bridge;
> > +     struct dsi_context ctx;
> > +};
> > +
> > +int dphy_pll_config(struct dsi_context *ctx);
> > +void dphy_timing_config(struct dsi_context *ctx);
> > +
> > +#endif /* __SPRD_DSI_H__ */
>
> This patch is missing a signed-off-by?
>
Sorry, i will be fix it on patch v8, thks.
