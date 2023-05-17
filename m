Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ED6705D87
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 04:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6365110E38E;
	Wed, 17 May 2023 02:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629D510E38E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 02:55:33 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-64ab2a37812so9958166b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 19:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684292132; x=1686884132;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMclfiyGo0qMnOEsUXx6eVybC9kQxJH7wp/u50FaUx8=;
 b=Yn0BnxDZ0zaDQueocMV3NBj+K2Seb7mJCi3qIT5OJO3pMtumpwRD/p9iVrNdpUl/bb
 ESckLUrRIwmX8IHeE4NClmcy500ZzX/XVCC5ZWtoAiPSUzTRAvMd9k7VFMwJsohV8wdM
 Ozpd51FIuOmGcNpzLMnohfq+EdFPkoemzGF3pT1Nyy8GaJtkei4yUmsZx/2olmd6mIcc
 oWeKt9tvWNYuXsv7RkaO3vI+xcXN+mtQxXiLbC8aqP1Ap+Ay2YZIuLmUh3bBsBeuc1Et
 EN3zzSUqIwzDLjFnjBoJJi/0KZTaTCizcCsv0O4KLCWzVs9IRH8PIqh8uL3wEeUGEJrc
 LONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684292132; x=1686884132;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jMclfiyGo0qMnOEsUXx6eVybC9kQxJH7wp/u50FaUx8=;
 b=NzjQzoGRjI2fCAvz4WuHNj+2ZdLBQAuYrUN2UR+2YV9kgLUKVkEAgaogN1TilmKTpn
 Z728cWjp74mBOFNpgtte24004siUmFFkQ9HJrzrSVOlq7Ozm8W1ic+h3ZYYL9TlMD+qD
 rx5RioDEPYmfJwX+UFwdtYUnYuTg/gyHZgrZUpH+MHqF/o1BrHgdX3tTUEeJZJhtWegp
 dS6ZGX0udAm1XVsfO8YJHPo2KoPVw6cse0LXpJHJ2jg0iVBatwLAjgTlB6GM+VASbek5
 Fojjsk22G5qU54JHlv0wIBNUuDFZ8ccp7aZlsIPDal2mvAyUT2SmUcxoykw2r6lPd5Re
 fQAQ==
X-Gm-Message-State: AC+VfDyrCzmRGjMzh9mNevnQ9YPCuxEACWnxF5E4Zm3sh9vPswShMIGM
 kU1+lMFnXw7RyNs4XWWE5Pb6M+abzHw9jfn9HZpg82BV3XI=
X-Google-Smtp-Source: ACHHUZ45UOXr3NZOxad66JB/0zbsfWFh/S4VbTo38RTehwxLZsxSN31juSyIHYGpDexXKnpqRGfeTD1Bwk9cYubX3BQ=
X-Received: by 2002:a17:903:41c8:b0:1ac:6fc3:6beb with SMTP id
 u8-20020a17090341c800b001ac6fc36bebmr994634ple.9.1684292131687; Tue, 16 May
 2023 19:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-6-aford173@gmail.com>
In-Reply-To: <20230515235713.232939-6-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 16 May 2023 21:55:19 -0500
Message-ID: <CAHCN7xL8qkCgXEE3nZvmwbWGO5GtF+37eOVYq63djGOHDaSdmA@mail.gmail.com>
Subject: Re: [PATCH V6 5/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
To: dri-devel@lists.freedesktop.org
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, Michael Walle <michael@walle.cc>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 6:57=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The DPHY timings are currently hard coded. Since the input
> clock can be variable, the phy timings need to be variable
> too.  To facilitate this, we need to cache the hs_clock
> based on what is generated from the PLL.
>
> The phy_mipi_dphy_get_default_config_for_hsclk function
> configures the DPHY timings in pico-seconds, and a small macro
> converts those timings into clock cycles based on the hs_clk.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 57 +++++++++++++++++++++++----
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 51 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 08266303c261..3944b7cfbbdf 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -218,6 +218,8 @@
>
>  #define OLD_SCLK_MIPI_CLK_NAME         "pll_clk"
>
> +#define PS_TO_CYCLE(ps, hz) DIV64_U64_ROUND_CLOSEST(((ps) * (hz)), 10000=
00000000ULL)
> +
>  static const char *const clk_names[5] =3D {
>         "bus_clk",
>         "sclk_mipi",
> @@ -651,6 +653,8 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>                 reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
>         } while ((reg & DSIM_PLL_STABLE) =3D=3D 0);
>
> +       dsi->hs_clock =3D fout;
> +
>         return fout;
>  }
>
> @@ -698,13 +702,46 @@ static void samsung_dsim_set_phy_ctrl(struct samsun=
g_dsim *dsi)
>         const struct samsung_dsim_driver_data *driver_data =3D dsi->drive=
r_data;
>         const unsigned int *reg_values =3D driver_data->reg_values;
>         u32 reg;
> +       struct phy_configure_opts_mipi_dphy cfg;
> +       int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
> +       int hs_exit, hs_prepare, hs_zero, hs_trail;
> +       unsigned long long byte_clock =3D dsi->hs_clock / 8;
>
>         if (driver_data->has_freqband)
>                 return;
>
> +       phy_mipi_dphy_get_default_config_for_hsclk(dsi->hs_clock,
> +                                                  dsi->lanes, &cfg);
> +
> +       /*
> +        * TODO:
> +        * The tech reference manual for i.MX8M Mini/Nano/Plus
> +        * doesn't state what the definition of the PHYTIMING
> +        * bits are beyond their address and bit position.
> +        * After reviewing NXP's downstream code, it appears
> +        * that the various PHYTIMING registers take the number
> +        * of cycles and use various dividers on them.  This
> +        * calculation does not result in an exact match to the
> +        * downstream code, but it is very close, and it appears
> +        * to sync at a variety of resolutions. If someone
> +        * can get a more accurate mathematical equation needed
> +        * for these registers, this should be updated.
> +        */

Marek Szyprowski -

I was curious to know if you have any opinion on this TODO note and/or
if you have any stuff you can share about how the values of the
following variables are configured?
> +
> +       lpx =3D PS_TO_CYCLE(cfg.lpx, byte_clock);
> +       hs_exit =3D PS_TO_CYCLE(cfg.hs_exit, byte_clock);
> +       clk_prepare =3D PS_TO_CYCLE(cfg.clk_prepare, byte_clock);
> +       clk_zero =3D PS_TO_CYCLE(cfg.clk_zero, byte_clock);
> +       clk_post =3D PS_TO_CYCLE(cfg.clk_post, byte_clock);
> +       clk_trail =3D PS_TO_CYCLE(cfg.clk_trail, byte_clock);
> +       hs_prepare =3D PS_TO_CYCLE(cfg.hs_prepare, byte_clock);
> +       hs_zero =3D PS_TO_CYCLE(cfg.hs_zero, byte_clock);
> +       hs_trail =3D PS_TO_CYCLE(cfg.hs_trail, byte_clock);
> +

These 'work' but they don't exactly match the NXP reference code, but
they're not significantly different.  The NXP reference manual doesn't
describe how these registers are set, they only publish the register
and bits used.  Since you work for Samsung, I was hoping you might
have inside information to know if this is a reasonable approach.

thanks

adam

>         /* B D-PHY: D-PHY Master & Slave Analog Block control */
>         reg =3D reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_L=
P] |
>                 reg_values[PHYCTRL_SLEW_UP];
> +
>         samsung_dsim_write(dsi, DSIM_PHYCTRL_REG, reg);
>
>         /*
> @@ -712,7 +749,9 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_=
dsim *dsi)
>          * T HS-EXIT: Time that the transmitter drives LP-11 following a =
HS
>          *      burst
>          */
> -       reg =3D reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT]=
;
> +
> +       reg  =3D DSIM_PHYTIMING_LPX(lpx) | DSIM_PHYTIMING_HS_EXIT(hs_exit=
);
> +
>         samsung_dsim_write(dsi, DSIM_PHYTIMING_REG, reg);
>
>         /*
> @@ -728,10 +767,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsun=
g_dsim *dsi)
>          * T CLK-TRAIL: Time that the transmitter drives the HS-0 state a=
fter
>          *      the last payload clock bit of a HS transmission burst
>          */
> -       reg =3D reg_values[PHYTIMING_CLK_PREPARE] |
> -               reg_values[PHYTIMING_CLK_ZERO] |
> -               reg_values[PHYTIMING_CLK_POST] |
> -               reg_values[PHYTIMING_CLK_TRAIL];
> +
> +       reg =3D DSIM_PHYTIMING1_CLK_PREPARE(clk_prepare)  |
> +             DSIM_PHYTIMING1_CLK_ZERO(clk_zero)        |
> +             DSIM_PHYTIMING1_CLK_POST(clk_post)        |
> +             DSIM_PHYTIMING1_CLK_TRAIL(clk_trail);
>
>         samsung_dsim_write(dsi, DSIM_PHYTIMING1_REG, reg);
>
> @@ -744,8 +784,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsung=
_dsim *dsi)
>          * T HS-TRAIL: Time that the transmitter drives the flipped diffe=
rential
>          *      state after last payload data bit of a HS transmission bu=
rst
>          */
> -       reg =3D reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_H=
S_ZERO] |
> -               reg_values[PHYTIMING_HS_TRAIL];
> +
> +       reg =3D DSIM_PHYTIMING2_HS_PREPARE(hs_prepare) |
> +             DSIM_PHYTIMING2_HS_ZERO(hs_zero) |
> +             DSIM_PHYTIMING2_HS_TRAIL(hs_trail);
> +
>         samsung_dsim_write(dsi, DSIM_PHYTIMING2_REG, reg);
>  }
>
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index a1a5b2b89a7a..d9d431e3b65a 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -93,6 +93,7 @@ struct samsung_dsim {
>
>         u32 pll_clk_rate;
>         u32 burst_clk_rate;
> +       u32 hs_clock;
>         u32 esc_clk_rate;
>         u32 lanes;
>         u32 mode_flags;
> --
> 2.39.2
>
