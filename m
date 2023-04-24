Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F2A6EC8E8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 11:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2515D10E1A5;
	Mon, 24 Apr 2023 09:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E2F10E1A5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 09:31:54 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-51b6d0b9430so3252431a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 02:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682328713; x=1684920713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Z78ZbL7rYjkx0/+3rcZpzhHawSWCnG5EtDRhBCfi9I=;
 b=Mi9VjwpEXfyk+T+Vkspx5kaki3Q2rnb7nHyvn1Bjumgy8JQoLxhqsDtB93hacK2wAv
 /zmvHaJf2xISYe8v/OhPQ9yIv/eYhk5Mp6nMOMLAHR4QFJYUMc/Qnb3iMMZf/FJMtFBW
 pDvmGjEWsA4ofcNd0TyZWWG20ywDz723H5RAegCDnSqlxokmfv2lOZeBwuOrvAN/4jmh
 hKeB0quwA4mb16c53nOboh4A6pRZ+9tn0hSPlGJaiC5rMJzSSIyIESgrYJge1BeRumAJ
 HdbBko2NLrlTMuPSEwCSF9ppbUQ5JNWyDJGKx7CL8+8CTXSvb9s86wvZU3C+2o6mxWYr
 DyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328713; x=1684920713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Z78ZbL7rYjkx0/+3rcZpzhHawSWCnG5EtDRhBCfi9I=;
 b=HKuXY8cUVV1vUMmpTM+BcxrD5HzBVf9ENCa9XD3STYh3kOJdbFGnVY5ajlH30t6g8l
 fUj9Hd2U+6o9KFpKB9tgg8xY8701wDhzyQRwW3jCUBkO+vZwb2T1+mcqsLy0Vm7u1FLa
 e+hLdd5HAKj5ROoC5DyQ4J7mfS7Zs3AnsloAO1+5XXNB2KQeSe/GWFTB1S7Ev5Lkh2+T
 GejKyjJgbVFK/wwbcorc686nM2tJhluR6rg25R/vijkdmDRVFRBUvYuNeYRtc2jCuP6P
 7GnUljemiYAWc6zrVp1mAOuntgu1EAS+t0+7aqKGWL+Zx/nz1HiIWEkhSsBOY9RKqWH7
 aMaA==
X-Gm-Message-State: AAQBX9etAz8S+VGjwi2zt+e+ZVD6M+vrOZv+E3qS15exHwFiGVtlM6p3
 R3PbIP7w6O9535pNu/AZ82Gc3ZSFgRtbPHFIjJI=
X-Google-Smtp-Source: AKy350ZftPvj4F12qklF5KgzFPY1U4e+BGKy1qpefOCRI6++g3dJZyug0ToXW3Cn4qRD5GVIWdEn41yyGw7rS2ii7Y8=
X-Received: by 2002:a17:90a:e7c4:b0:246:bb61:4a5b with SMTP id
 kb4-20020a17090ae7c400b00246bb614a5bmr13166996pjb.8.1682328713092; Mon, 24
 Apr 2023 02:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230423121232.1345909-1-aford173@gmail.com>
 <20230423121232.1345909-5-aford173@gmail.com>
 <CAGXv+5GHcigEahCp+UefxR+AboF7i-kYJjiNftz8fPDLAZVMow@mail.gmail.com>
In-Reply-To: <CAGXv+5GHcigEahCp+UefxR+AboF7i-kYJjiNftz8fPDLAZVMow@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 24 Apr 2023 04:31:45 -0500
Message-ID: <CAHCN7x+i41UkpdqLbK8s+OJmS=ExsctZwZL0YAQAic=N6kCbAw@mail.gmail.com>
Subject: Re: [PATCH V2 4/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
To: Chen-Yu Tsai <wenst@chromium.org>
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
 dario.binacchi@amarulasolutions.com, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 1:12=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Sun, Apr 23, 2023 at 8:13=E2=80=AFPM Adam Ford <aford173@gmail.com> wr=
ote:
> >
> > The DPHY timings are currently hard coded. Since the input
> > clock can be variable, the phy timings need to be variable
> > too.  Add an additional variable to the driver data to enable
> > this feature to prevent breaking boards that don't support it.
> >
> > The phy_mipi_dphy_get_default_config function configures the
> > DPHY timings in pico-seconds, and a small macro converts those
> > timings into clock cycles based on the pixel clock rate.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 79 +++++++++++++++++++++++----
> >  include/drm/bridge/samsung-dsim.h     |  1 +
> >  2 files changed, 70 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index 5b6e7825b92f..f165483d5044 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -18,9 +18,7 @@
> >  #include <linux/media-bus-format.h>
> >  #include <linux/of_device.h>
> >  #include <linux/phy/phy.h>
> > -
> >  #include <video/mipi_display.h>
> > -
> >  #include <drm/bridge/samsung-dsim.h>
> >  #include <drm/drm_panel.h>
> >  #include <drm/drm_print.h>
> > @@ -218,6 +216,8 @@
> >
> >  #define OLD_SCLK_MIPI_CLK_NAME         "pll_clk"
> >
> > +#define PS_TO_CYCLE(PS, MHz) DIV64_U64_ROUND_CLOSEST(((PS) * (MHz)), 1=
000000000000ULL)
> > +
> >  static const char *const clk_names[5] =3D {
> >         "bus_clk",
> >         "sclk_mipi",
> > @@ -487,6 +487,7 @@ static const struct samsung_dsim_driver_data imx8mm=
_dsi_driver_data =3D {
> >         .m_min =3D 64,
> >         .m_max =3D 1023,
> >         .vco_min =3D 1050,
> > +       .dynamic_dphy =3D 1,
> >  };
> >
> >  static const struct samsung_dsim_driver_data *
> > @@ -698,13 +699,50 @@ static void samsung_dsim_set_phy_ctrl(struct sams=
ung_dsim *dsi)
> >         const struct samsung_dsim_driver_data *driver_data =3D dsi->dri=
ver_data;
> >         const unsigned int *reg_values =3D driver_data->reg_values;
> >         u32 reg;
> > +       struct drm_display_mode *m =3D &dsi->mode;
> > +       int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +       struct phy_configure_opts_mipi_dphy cfg;
> > +       int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
> > +       int hs_exit, hs_prepare, hs_zero, hs_trail;
> > +       unsigned long long clock_in_hz =3D m->clock * 1000;
> >
> >         if (driver_data->has_freqband)
> >                 return;
> >
> > +       /* The dynamic_phy has the ability to adjust PHY Timing setting=
s */
> > +       if (driver_data->dynamic_dphy) {
> > +               phy_mipi_dphy_get_default_config(clock_in_hz, bpp, dsi-=
>lanes, &cfg);
>
> This requires adding "select GENERIC_PHY_MIPI_DPHY" to DRM_SAMSUNG_DSIM,
> otherwise with CONFIG_DRM_SAMSUNG_DSIM=3Dm:
>
> ERROR: modpost: "phy_mipi_dphy_get_default_config"
> [drivers/gpu/drm/bridge/samsung-dsim.ko] undefined!
> make[5]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
> make[4]: *** [Makefile:1978: modpost] Error 2
> make[3]: *** [Makefile:357: __build_one_by_one] Error 2
>
> I'm sure there'll be a similar error if CONFIG_DRM_SAMSUNG_DSIM=3Dy.

That's interesting, I didn't come across that.
What did you use for a starting point when you applied the patches?
I want to see if I can replicate it.

adam
>
> > +
> > +               /*
> > +                * TODO:
> > +                * The tech reference manual for i.MX8M Mini/Nano/Plus
> > +                * doesn't state what the definition of the PHYTIMING
> > +                * bits are beyond their address and bit position.
> > +                * After reviewing NXP's downstream code, it appears
> > +                * that the various PHYTIMING registers take the number
> > +                * of cycles and use various dividers on them.  This
> > +                * calculation does not result in an exact match to the
> > +                * downstream code, but it is very close, and it appear=
s
> > +                * to sync at a variety of resolutions. If someone
> > +                * can get a more accurate mathematical equation needed
> > +                * for these registers, this should be updated.
> > +                */
> > +
> > +               lpx =3D PS_TO_CYCLE(cfg.lpx, clock_in_hz);
> > +               hs_exit =3D PS_TO_CYCLE(cfg.hs_exit, clock_in_hz);
> > +               clk_prepare =3D PS_TO_CYCLE(cfg.clk_prepare, clock_in_h=
z);
> > +               clk_zero =3D PS_TO_CYCLE(cfg.clk_zero, clock_in_hz);
> > +               clk_post =3D PS_TO_CYCLE(cfg.clk_post, clock_in_hz);
> > +               clk_trail =3D PS_TO_CYCLE(cfg.clk_trail, clock_in_hz);
> > +               hs_prepare =3D PS_TO_CYCLE(cfg.hs_prepare, clock_in_hz)=
;
> > +               hs_zero =3D PS_TO_CYCLE(cfg.hs_zero, clock_in_hz);
> > +               hs_trail =3D PS_TO_CYCLE(cfg.hs_trail, clock_in_hz);
> > +       }
> > +
> >         /* B D-PHY: D-PHY Master & Slave Analog Block control */
> >         reg =3D reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG=
_LP] |
> >                 reg_values[PHYCTRL_SLEW_UP];
> > +
> >         samsung_dsim_write(dsi, DSIM_PHYCTRL_REG, reg);
> >
> >         /*
> > @@ -712,7 +750,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsu=
ng_dsim *dsi)
> >          * T HS-EXIT: Time that the transmitter drives LP-11 following =
a HS
> >          *      burst
> >          */
> > -       reg =3D reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXI=
T];
> > +       if (driver_data->dynamic_dphy)
> > +               reg  =3D DSIM_PHYTIMING_LPX(lpx) | DSIM_PHYTIMING_HS_EX=
IT(hs_exit);
> > +       else
> > +               reg =3D reg_values[PHYTIMING_LPX] | reg_values[PHYTIMIN=
G_HS_EXIT];
> > +
> >         samsung_dsim_write(dsi, DSIM_PHYTIMING_REG, reg);
> >
> >         /*
> > @@ -728,10 +770,17 @@ static void samsung_dsim_set_phy_ctrl(struct sams=
ung_dsim *dsi)
> >          * T CLK-TRAIL: Time that the transmitter drives the HS-0 state=
 after
> >          *      the last payload clock bit of a HS transmission burst
> >          */
> > -       reg =3D reg_values[PHYTIMING_CLK_PREPARE] |
> > -               reg_values[PHYTIMING_CLK_ZERO] |
> > -               reg_values[PHYTIMING_CLK_POST] |
> > -               reg_values[PHYTIMING_CLK_TRAIL];
> > +       if (driver_data->dynamic_dphy) {
> > +               reg =3D DSIM_PHYTIMING1_CLK_PREPARE(clk_prepare)  |
> > +                     DSIM_PHYTIMING1_CLK_ZERO(clk_zero)        |
> > +                     DSIM_PHYTIMING1_CLK_POST(clk_post)        |
> > +                     DSIM_PHYTIMING1_CLK_TRAIL(clk_trail);
> > +       } else {
> > +               reg =3D reg_values[PHYTIMING_CLK_PREPARE] |
> > +                     reg_values[PHYTIMING_CLK_ZERO] |
> > +                     reg_values[PHYTIMING_CLK_POST] |
> > +                     reg_values[PHYTIMING_CLK_TRAIL];
> > +       }
> >
> >         samsung_dsim_write(dsi, DSIM_PHYTIMING1_REG, reg);
> >
> > @@ -744,8 +793,17 @@ static void samsung_dsim_set_phy_ctrl(struct samsu=
ng_dsim *dsi)
> >          * T HS-TRAIL: Time that the transmitter drives the flipped dif=
ferential
> >          *      state after last payload data bit of a HS transmission =
burst
> >          */
> > -       reg =3D reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING=
_HS_ZERO] |
> > -               reg_values[PHYTIMING_HS_TRAIL];
> > +
> > +       if (driver_data->dynamic_dphy) {
> > +               reg =3D DSIM_PHYTIMING2_HS_PREPARE(hs_prepare) |
> > +                     DSIM_PHYTIMING2_HS_ZERO(hs_zero) |
> > +                     DSIM_PHYTIMING2_HS_TRAIL(hs_trail);
> > +       } else {
> > +               reg =3D reg_values[PHYTIMING_HS_PREPARE] |
> > +                     reg_values[PHYTIMING_HS_ZERO] |
> > +                     reg_values[PHYTIMING_HS_TRAIL];
> > +       }
> > +
> >         samsung_dsim_write(dsi, DSIM_PHYTIMING2_REG, reg);
> >  }
> >
> > @@ -1337,7 +1395,8 @@ static int samsung_dsim_init(struct samsung_dsim =
*dsi)
> >         samsung_dsim_enable_clock(dsi);
> >         if (driver_data->wait_for_reset)
> >                 samsung_dsim_wait_for_reset(dsi);
> > -       samsung_dsim_set_phy_ctrl(dsi);
> > +       if (!driver_data->has_freqband)
> > +               samsung_dsim_set_phy_ctrl(dsi);
> >         samsung_dsim_init_link(dsi);
> >
> >         dsi->state |=3D DSIM_STATE_INITIALIZED;
> > diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/sam=
sung-dsim.h
> > index a088d84579bc..25475d78adb3 100644
> > --- a/include/drm/bridge/samsung-dsim.h
> > +++ b/include/drm/bridge/samsung-dsim.h
> > @@ -62,6 +62,7 @@ struct samsung_dsim_driver_data {
> >         u16 m_min;
> >         u16 m_max;
> >         u64 vco_min;
> > +       bool dynamic_dphy;
> >  };
> >
> >  struct samsung_dsim_host_ops {
> > --
> > 2.39.2
> >
