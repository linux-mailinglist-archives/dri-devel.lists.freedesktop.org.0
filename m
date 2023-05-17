Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16DF70669B
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 13:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0059010E3EF;
	Wed, 17 May 2023 11:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5121F10E3EF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 11:28:05 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-ba8374001abso781194276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 04:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684322883; x=1686914883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3o2tVJQBKqbYOhLGPD0uYl/0T73lg7VFfZy9i2I0OMY=;
 b=oqT/+gSqpHczmyKhxBcrWwriOapQ7izKdPneKcvVuY+gcz4PUY3eB9dPNj0ZRml9ku
 NN/tDywHPagraF2TSqg8TBauWdnBhJYR0TiMPnvhCAZOCENkd13b7LgoofwCeOvCceHU
 BRWj5EJ/F0fd1LvOn01GKFTO0980EW7ZqjHnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684322883; x=1686914883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3o2tVJQBKqbYOhLGPD0uYl/0T73lg7VFfZy9i2I0OMY=;
 b=kNQAOQHF0vsLBaK4S3yrbJiW7tiMWY3thcEUhsqW2PUu2vp02FDqguRaiJ/lh3VXKG
 XpPZJ+yjsxq23T9AcO3zmMaaIANmuC+cqTRAf2g061pfGJq5EJZ6CnLW3U6rSsivgIq9
 ZEnBSgrq/BK+CJ93EAcfPEarf9QXl2mznxHUI8n/BcOILVdSlUtb4XRSVviJhW/E683N
 PigtMSalXVt8JkurMDEtF9vmbD5CAL0Mmm45kR5i3wB9O2/a0hzmH5YsdgNSqNZu1GgJ
 ZDLJWDmoETmhqZn03zWpyAtly+UjRzPFYJwSQQyiRJRtEiEpwPgACF7au9hNMWhWpdbO
 /cgg==
X-Gm-Message-State: AC+VfDzypXTY/CRe+pxaJe/Z/i0pwnQQxLDcaBWX9KwCkMZvyEt5MsY8
 7eynrTK4R66oy8uUZDpGDud/uo0LKT/bDCLhdKvdhA==
X-Google-Smtp-Source: ACHHUZ7sGRYmO33b0LkOTVUhtAasTyty5M2n2uUDIOaIyi6jR9/74q1G9xE1qRJwROFi+UbBSOdupdd/Sn7v5WG2zsU=
X-Received: by 2002:a0d:d895:0:b0:561:9800:81f4 with SMTP id
 a143-20020a0dd895000000b00561980081f4mr3239721ywe.50.1684322883168; Wed, 17
 May 2023 04:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-6-aford173@gmail.com>
In-Reply-To: <20230515235713.232939-6-aford173@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 17 May 2023 16:57:50 +0530
Message-ID: <CAMty3ZBk-Zg-RFZv1Owo5aE9C8VpFXq45nLE-mBVSc=2o=iq4w@mail.gmail.com>
Subject: Re: [PATCH V6 5/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
To: Adam Ford <aford173@gmail.com>
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
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 5:27=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
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

Does it mean, Applications Processor Reference Manual? better add it
clear reference.

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

I think we can do some kind of negotiation has done similar in bsp by
taking inputs from bit_clk  and PLL_1432X table. Did you try this? we
thought this approach while writing dsim to support dynamic dphy.

Thanks,
Jagan.
