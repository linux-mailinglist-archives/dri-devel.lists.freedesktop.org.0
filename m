Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD87E700F80
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 22:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036CD10E29E;
	Fri, 12 May 2023 20:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD85610E29E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 20:01:12 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-24dfc3c662eso7113693a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683921671; x=1686513671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7yplfwTnAjJ22mVVSMi+sjEOrdV8REJgqS175ygmB04=;
 b=XYrLQ3AtF9CTcvXNCZr2McUhiCgzvBlvtfKpfEtzCzr7M/9SdlGiwmYFyiMGWmXkLR
 O6yLLKCZUQGF8136SBBcoAin4klJw1LJICoeupy5+3P5kGqp9HBA5TzmymO5Z8XLWvio
 uYh/oI73BViBbBgiUc6U4/F7EQ+4a9dA1L3EWzi1mteNH2cjBeCpft7mIGYndBqSmBGu
 fbuwtFer5utI4YDnx0PeCxSdFxX6npMi0rCg5io9AsJQ9zDlmPMTYhwR1NShxTFUAofd
 q6BDwHneNCKh3S6Iicww8sTL9Rnfd860g7+3bnBScOPUAvUr1uNdNPdXoYrEvCfXon5w
 DBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683921671; x=1686513671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7yplfwTnAjJ22mVVSMi+sjEOrdV8REJgqS175ygmB04=;
 b=C2tP6rat/biJtOjAel635BmMDEWTMod84nSxFPhFr4ykgkXtsp0bXuDq+V8q0xR3Ca
 7GM9JUrfZ7PTffs7Vlx4JBj8//HNXeTtNoQ0irO/8HAwYV6eHn6CpDID0OdCdOvQhUqy
 B76HmHhp0TJE1/pNv3MlFxVRDvnKImDLuqx1yl0qvhZf9fsMBPCuxrhb9WVpBwGSbVfG
 1nuXp+36rtJri01ceUqvvuiVB6WDrK4bw44HUkJmKoCA9iRgQOLpXuaPIsU1nh83Cwn4
 ggXBq941g89v55jtQm0P/3USQLYuLq3fC5+Qwz0GXeZHnRQTqpVG7jpbWL1rkmn+mvsT
 ubNA==
X-Gm-Message-State: AC+VfDzrAKOCgAR4basyHCBP88yozcB2y46gOK6e+w0yu7PaNygznQrq
 ysR1ATxUxn/hTvpIlC4yV/Z2maI0cdbVlNJTXaE=
X-Google-Smtp-Source: ACHHUZ4uwRK+p1Ju+ksKQzDrvaiOl46XqX747j/I3fl7DNUexSPkzR0tCVCrh0AJGvqxDACM537c5EZoUo3D4Zl2cfg=
X-Received: by 2002:a17:90b:38c2:b0:252:8b33:52cc with SMTP id
 nn2-20020a17090b38c200b002528b3352ccmr7274696pjb.16.1683921670658; Fri, 12
 May 2023 13:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230506192453.725621-1-aford173@gmail.com>
 <20230506192453.725621-6-aford173@gmail.com>
 <275064c0e6c814d8e8fda6bcf70d6e8c3bdc3011.camel@pengutronix.de>
In-Reply-To: <275064c0e6c814d8e8fda6bcf70d6e8c3bdc3011.camel@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 12 May 2023 15:00:59 -0500
Message-ID: <CAHCN7xKq_hZXWZVMG0xFK_zGfm18ag48a83BtL5OyE6VJ3FMTA@mail.gmail.com>
Subject: Re: [PATCH V5 5/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
To: Lucas Stach <l.stach@pengutronix.de>
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
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Michael Walle <michael@walle.cc>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 2:37=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de=
> wrote:
>
> Hi Adam,
>
> Am Samstag, dem 06.05.2023 um 14:24 -0500 schrieb Adam Ford:
> > The DPHY timings are currently hard coded. Since the input
> > clock can be variable, the phy timings need to be variable
> > too.  Add an additional variable to the driver data to enable
> > this feature to prevent breaking boards that don't support it.
> >
> > The phy_mipi_dphy_get_default_config function configures the
> > DPHY timings in pico-seconds, and a small macro converts those
> > timings into clock cycles based on the pixel clock rate.
> >
> This week I finally had some time to take a deeper look at this series
> and test it on some of my systems.

Thanks for testing this!
>
> This patch causes issues when the burst clock rate is fixed by
> supplying the DT entry. Instead of describing the issue below, I'm
> attaching the patch that makes things work on my system.

Oops, sorry about that.

>
> I would appreciate if you could test this one on your side. Feel free
> to squash it into yours if you find it working properly.

I reviewed your patch, and it looks like it makes a lot of sense.
If it works, I'll squash them together and add your name to the sign-off.

>
> Also I would almost bet that dynamic_dphy is working on the Exynos
> boards with that fix added. So if anyone with access to those boards
> would like to give it a shot, we may be able to get rid of the
> hardcoded PHY parameters altogether, which would be a nice cleanup.

I wondered the same thing, but I didn't want to create more work for
Marek S and since there was so much churn getting the original driver
ported, I thought it would be the safest thing to try to give the
imx8m m/n/p the features without breaking the Exynos.

Marek S - Do you want me to post this file without the extra checks to
see if it still works with Exynos?

adam
>
> Regards,
> Lucas
>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Tested-by: Michael Walle <michael@walle.cc>
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 74 ++++++++++++++++++++++++---
> >  include/drm/bridge/samsung-dsim.h     |  1 +
> >  2 files changed, 68 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index 08266303c261..d19a5c87b749 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -218,6 +218,8 @@
> >
> >  #define OLD_SCLK_MIPI_CLK_NAME               "pll_clk"
> >
> > +#define PS_TO_CYCLE(ps, hz) DIV64_U64_ROUND_CLOSEST(((ps) * (hz)), 100=
0000000000ULL)
> > +
> >  static const char *const clk_names[5] =3D {
> >       "bus_clk",
> >       "sclk_mipi",
> > @@ -487,6 +489,7 @@ static const struct samsung_dsim_driver_data imx8mm=
_dsi_driver_data =3D {
> >       .m_min =3D 64,
> >       .m_max =3D 1023,
> >       .min_freq =3D 1050,
> > +     .dynamic_dphy =3D 1,
> >  };
> >
> >  static const struct samsung_dsim_driver_data *
> > @@ -698,13 +701,50 @@ static void samsung_dsim_set_phy_ctrl(struct sams=
ung_dsim *dsi)
> >       const struct samsung_dsim_driver_data *driver_data =3D dsi->drive=
r_data;
> >       const unsigned int *reg_values =3D driver_data->reg_values;
> >       u32 reg;
> > +     struct drm_display_mode *m =3D &dsi->mode;
> > +     int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +     struct phy_configure_opts_mipi_dphy cfg;
> > +     int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
> > +     int hs_exit, hs_prepare, hs_zero, hs_trail;
> > +     unsigned long long clock_in_hz =3D m->clock * 1000;
> >
> >       if (driver_data->has_freqband)
> >               return;
> >
> > +     /* The dynamic_phy has the ability to adjust PHY Timing settings =
*/
> > +     if (driver_data->dynamic_dphy) {
> > +             phy_mipi_dphy_get_default_config(clock_in_hz, bpp, dsi->l=
anes, &cfg);
> > +
> > +             /*
> > +              * TODO:
> > +              * The tech reference manual for i.MX8M Mini/Nano/Plus
> > +              * doesn't state what the definition of the PHYTIMING
> > +              * bits are beyond their address and bit position.
> > +              * After reviewing NXP's downstream code, it appears
> > +              * that the various PHYTIMING registers take the number
> > +              * of cycles and use various dividers on them.  This
> > +              * calculation does not result in an exact match to the
> > +              * downstream code, but it is very close, and it appears
> > +              * to sync at a variety of resolutions. If someone
> > +              * can get a more accurate mathematical equation needed
> > +              * for these registers, this should be updated.
> > +              */
> > +
> > +             lpx =3D PS_TO_CYCLE(cfg.lpx, clock_in_hz);
> > +             hs_exit =3D PS_TO_CYCLE(cfg.hs_exit, clock_in_hz);
> > +             clk_prepare =3D PS_TO_CYCLE(cfg.clk_prepare, clock_in_hz)=
;
> > +             clk_zero =3D PS_TO_CYCLE(cfg.clk_zero, clock_in_hz);
> > +             clk_post =3D PS_TO_CYCLE(cfg.clk_post, clock_in_hz);
> > +             clk_trail =3D PS_TO_CYCLE(cfg.clk_trail, clock_in_hz);
> > +             hs_prepare =3D PS_TO_CYCLE(cfg.hs_prepare, clock_in_hz);
> > +             hs_zero =3D PS_TO_CYCLE(cfg.hs_zero, clock_in_hz);
> > +             hs_trail =3D PS_TO_CYCLE(cfg.hs_trail, clock_in_hz);
> > +     }
> > +
> >       /* B D-PHY: D-PHY Master & Slave Analog Block control */
> >       reg =3D reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_L=
P] |
> >               reg_values[PHYCTRL_SLEW_UP];
> > +
> >       samsung_dsim_write(dsi, DSIM_PHYCTRL_REG, reg);
> >
> >       /*
> > @@ -712,7 +752,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsu=
ng_dsim *dsi)
> >        * T HS-EXIT: Time that the transmitter drives LP-11 following a =
HS
> >        *      burst
> >        */
> > -     reg =3D reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT]=
;
> > +     if (driver_data->dynamic_dphy)
> > +             reg  =3D DSIM_PHYTIMING_LPX(lpx) | DSIM_PHYTIMING_HS_EXIT=
(hs_exit);
> > +     else
> > +             reg =3D reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_=
HS_EXIT];
> > +
> >       samsung_dsim_write(dsi, DSIM_PHYTIMING_REG, reg);
> >
> >       /*
> > @@ -728,10 +772,17 @@ static void samsung_dsim_set_phy_ctrl(struct sams=
ung_dsim *dsi)
> >        * T CLK-TRAIL: Time that the transmitter drives the HS-0 state a=
fter
> >        *      the last payload clock bit of a HS transmission burst
> >        */
> > -     reg =3D reg_values[PHYTIMING_CLK_PREPARE] |
> > -             reg_values[PHYTIMING_CLK_ZERO] |
> > -             reg_values[PHYTIMING_CLK_POST] |
> > -             reg_values[PHYTIMING_CLK_TRAIL];
> > +     if (driver_data->dynamic_dphy) {
> > +             reg =3D DSIM_PHYTIMING1_CLK_PREPARE(clk_prepare)  |
> > +                   DSIM_PHYTIMING1_CLK_ZERO(clk_zero)        |
> > +                   DSIM_PHYTIMING1_CLK_POST(clk_post)        |
> > +                   DSIM_PHYTIMING1_CLK_TRAIL(clk_trail);
> > +     } else {
> > +             reg =3D reg_values[PHYTIMING_CLK_PREPARE] |
> > +                   reg_values[PHYTIMING_CLK_ZERO] |
> > +                   reg_values[PHYTIMING_CLK_POST] |
> > +                   reg_values[PHYTIMING_CLK_TRAIL];
> > +     }
> >
> >       samsung_dsim_write(dsi, DSIM_PHYTIMING1_REG, reg);
> >
> > @@ -744,8 +795,17 @@ static void samsung_dsim_set_phy_ctrl(struct samsu=
ng_dsim *dsi)
> >        * T HS-TRAIL: Time that the transmitter drives the flipped diffe=
rential
> >        *      state after last payload data bit of a HS transmission bu=
rst
> >        */
> > -     reg =3D reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_H=
S_ZERO] |
> > -             reg_values[PHYTIMING_HS_TRAIL];
> > +
> > +     if (driver_data->dynamic_dphy) {
> > +             reg =3D DSIM_PHYTIMING2_HS_PREPARE(hs_prepare) |
> > +                   DSIM_PHYTIMING2_HS_ZERO(hs_zero) |
> > +                   DSIM_PHYTIMING2_HS_TRAIL(hs_trail);
> > +     } else {
> > +             reg =3D reg_values[PHYTIMING_HS_PREPARE] |
> > +                   reg_values[PHYTIMING_HS_ZERO] |
> > +                   reg_values[PHYTIMING_HS_TRAIL];
> > +     }
> > +
> >       samsung_dsim_write(dsi, DSIM_PHYTIMING2_REG, reg);
> >  }
> >
> > diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/sam=
sung-dsim.h
> > index a1a5b2b89a7a..76ea8a1720cc 100644
> > --- a/include/drm/bridge/samsung-dsim.h
> > +++ b/include/drm/bridge/samsung-dsim.h
> > @@ -62,6 +62,7 @@ struct samsung_dsim_driver_data {
> >       const unsigned int *reg_values;
> >       u16 m_min;
> >       u16 m_max;
> > +     bool dynamic_dphy;
> >  };
> >
> >  struct samsung_dsim_host_ops {
>
