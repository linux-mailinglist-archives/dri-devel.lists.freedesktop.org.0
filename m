Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658796EC93C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 11:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C7D10E445;
	Mon, 24 Apr 2023 09:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3447D10E445
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 09:44:38 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-77858d8dcb5so18074291241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 02:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682329476; x=1684921476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oTxpHjr8qRFerRfaYzDOmmuREr8kbeLzaVtarBDLBrw=;
 b=deKwGL9LfdZ2tk/YMv4EWSMf7P7BT0N86B8M7CwO7S2Dp77DVqaeWjtS87mOBjS/pM
 y84HzzAJPKDn5U3QLAv3wOgEoERxUBMELZmy6YRhHL+hRsJHbA5rKAYf+r0ZsbyfM0fd
 0SkELDkRu26liNOuO7jKVkGWXP8WGBMF/4qGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682329476; x=1684921476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oTxpHjr8qRFerRfaYzDOmmuREr8kbeLzaVtarBDLBrw=;
 b=cllY5x0HIFlNcclZwWnmQkNeSt6IoAeG1o3IPFp4UuMMKd49arCZqc74I4JcQCO0sU
 pm/upfl0XFKhn8ZGTR/e6ZOvpAJlw9bVTOz1adV/nAk9OKd3HIs3tL9otW4RdpLuvgfB
 EcLt8ul9oGVvLMMp+kQn+APKgtUsQMW2uyJPo5wtwoUW8LXTjRSMCpr1DciBgGsSugzj
 w0uZ+7jMPahwtk60xk/WmAF0Z0Ag2jyRZErehlNkCa0GYwmAoaMf6dQgleJ99aCfWduo
 0aYjyyWbD8NPV06VNQQHCZ7JYedHKimIGN8EkyCYeJwDe0lSt2R+0hnBMVbjYoOSBne8
 SBAQ==
X-Gm-Message-State: AAQBX9dPheSdFSAht9Hw3Mv175GcDHfgJgF7LnbtxSFFbgZ2qHnzeiCA
 LsgfOrvCJOdAULQOyZUzFTAgBdTcfkhJNklKeK28YA==
X-Google-Smtp-Source: AKy350a9Uwy9V2mnk44/H2mySSYL9FvQsp3jy4z4WTKLjjGSFeBKkEY8TkLAjCTiWIh8tD1KAPSsbOOhn0eU0kh7Xus=
X-Received: by 2002:a1f:5c92:0:b0:440:4946:fac with SMTP id
 q140-20020a1f5c92000000b0044049460facmr4069055vkb.4.1682329476005; Mon, 24
 Apr 2023 02:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230423121232.1345909-1-aford173@gmail.com>
 <20230423121232.1345909-5-aford173@gmail.com>
 <CAGXv+5GHcigEahCp+UefxR+AboF7i-kYJjiNftz8fPDLAZVMow@mail.gmail.com>
 <CAHCN7x+i41UkpdqLbK8s+OJmS=ExsctZwZL0YAQAic=N6kCbAw@mail.gmail.com>
In-Reply-To: <CAHCN7x+i41UkpdqLbK8s+OJmS=ExsctZwZL0YAQAic=N6kCbAw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Apr 2023 17:44:25 +0800
Message-ID: <CAGXv+5H34ojUAPWWpF+-=XpdF6Jj_Q7nqiPg3TEKVNXu4F6JAQ@mail.gmail.com>
Subject: Re: [PATCH V2 4/6] drm: bridge: samsung-dsim: Dynamically configure
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
 dario.binacchi@amarulasolutions.com, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 5:31=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Mon, Apr 24, 2023 at 1:12=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Sun, Apr 23, 2023 at 8:13=E2=80=AFPM Adam Ford <aford173@gmail.com> =
wrote:
> > >
> > > The DPHY timings are currently hard coded. Since the input
> > > clock can be variable, the phy timings need to be variable
> > > too.  Add an additional variable to the driver data to enable
> > > this feature to prevent breaking boards that don't support it.
> > >
> > > The phy_mipi_dphy_get_default_config function configures the
> > > DPHY timings in pico-seconds, and a small macro converts those
> > > timings into clock cycles based on the pixel clock rate.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > ---
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 79 +++++++++++++++++++++++--=
--
> > >  include/drm/bridge/samsung-dsim.h     |  1 +
> > >  2 files changed, 70 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/=
bridge/samsung-dsim.c
> > > index 5b6e7825b92f..f165483d5044 100644
> > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > @@ -18,9 +18,7 @@
> > >  #include <linux/media-bus-format.h>
> > >  #include <linux/of_device.h>
> > >  #include <linux/phy/phy.h>
> > > -
> > >  #include <video/mipi_display.h>
> > > -
> > >  #include <drm/bridge/samsung-dsim.h>
> > >  #include <drm/drm_panel.h>
> > >  #include <drm/drm_print.h>
> > > @@ -218,6 +216,8 @@
> > >
> > >  #define OLD_SCLK_MIPI_CLK_NAME         "pll_clk"
> > >
> > > +#define PS_TO_CYCLE(PS, MHz) DIV64_U64_ROUND_CLOSEST(((PS) * (MHz)),=
 1000000000000ULL)
> > > +
> > >  static const char *const clk_names[5] =3D {
> > >         "bus_clk",
> > >         "sclk_mipi",
> > > @@ -487,6 +487,7 @@ static const struct samsung_dsim_driver_data imx8=
mm_dsi_driver_data =3D {
> > >         .m_min =3D 64,
> > >         .m_max =3D 1023,
> > >         .vco_min =3D 1050,
> > > +       .dynamic_dphy =3D 1,
> > >  };
> > >
> > >  static const struct samsung_dsim_driver_data *
> > > @@ -698,13 +699,50 @@ static void samsung_dsim_set_phy_ctrl(struct sa=
msung_dsim *dsi)
> > >         const struct samsung_dsim_driver_data *driver_data =3D dsi->d=
river_data;
> > >         const unsigned int *reg_values =3D driver_data->reg_values;
> > >         u32 reg;
> > > +       struct drm_display_mode *m =3D &dsi->mode;
> > > +       int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > > +       struct phy_configure_opts_mipi_dphy cfg;
> > > +       int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
> > > +       int hs_exit, hs_prepare, hs_zero, hs_trail;
> > > +       unsigned long long clock_in_hz =3D m->clock * 1000;
> > >
> > >         if (driver_data->has_freqband)
> > >                 return;
> > >
> > > +       /* The dynamic_phy has the ability to adjust PHY Timing setti=
ngs */
> > > +       if (driver_data->dynamic_dphy) {
> > > +               phy_mipi_dphy_get_default_config(clock_in_hz, bpp, ds=
i->lanes, &cfg);
> >
> > This requires adding "select GENERIC_PHY_MIPI_DPHY" to DRM_SAMSUNG_DSIM=
,
> > otherwise with CONFIG_DRM_SAMSUNG_DSIM=3Dm:
> >
> > ERROR: modpost: "phy_mipi_dphy_get_default_config"
> > [drivers/gpu/drm/bridge/samsung-dsim.ko] undefined!
> > make[5]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
> > make[4]: *** [Makefile:1978: modpost] Error 2
> > make[3]: *** [Makefile:357: __build_one_by_one] Error 2
> >
> > I'm sure there'll be a similar error if CONFIG_DRM_SAMSUNG_DSIM=3Dy.
>
> That's interesting, I didn't come across that.
> What did you use for a starting point when you applied the patches?
> I want to see if I can replicate it.

next-20230421. My config is pretty much tailored to the Hummingbird Pulse.
Device drivers for other hardware or things that I can't enable are all
disabled. For example I don't have PHY_MIXEL_MIPI_DPHY enabled.

Maybe you have some other bridge or phy that selects it enabled?

ChenYu
