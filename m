Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8903F6EC96B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 11:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5734310E465;
	Mon, 24 Apr 2023 09:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB6B10E45E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 09:51:11 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2472a3bfd23so2953458a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 02:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682329871; x=1684921871;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/O13qopzmctziSNmxMv34ISA8PP1ZG4FW+wAiHL6n9E=;
 b=V1aR6gDAMmcxrTIA8ogOfMbqJNLv/BXqvdVYJe21RUSFwHJNtwzTlzopNjgWiGgmZO
 ldZ2DP+dRFqymcX2cbrl+tGA/zMcBS/vpHHOjxIkTY2BsVJ1/T28nhNVYm/t0CrGo7tv
 FQdqjR37c8dGiseMYjQQq20IepxdZf7kgJA6SxkTQ3fgqlsY/xrQaK6rBx7XIqSJwBWo
 eB3Dt+6TdNs6aMmrH4P4Mk+CZtNdH2eVvsNQm+fR7JigSsG1WXH3Or+jGGICvmqP+Qtt
 fsi4YsrhqhHPZXf6U9WmDfIRgG/WFrcrDfeOtWninuHk6w/fbUVmynXtoIXhuPRQJqDb
 jiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682329871; x=1684921871;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/O13qopzmctziSNmxMv34ISA8PP1ZG4FW+wAiHL6n9E=;
 b=IDQUmwQXQxrhpGfoIrw39aLU0HBUk2RBtxcuXQiKGb5b77fXF7v1hQ1nsTqwIXLxvs
 MfwRCHki/84VUA6pbE60abWtrjs+ySIoT6m05JAjbQ5j9mz3bv/zYhOuaginf49L1F7I
 fJeLHWymWZqPTSOgG96hg5YYkbYJFQT7vg259RwHE9wrSNDWDmI34oud2B1TAGqk/hcc
 1eZW7IXLWcHz+aoz3UweFbrP6/l/oGvz38dyJ7WpZDe3m3tRjx4hiHzYx8uDgw9wyF8B
 G7grVbaMwFLMAwgxJK8Ch4BwypVRa4ha6jlQcoq3Bo+Ai6JjnBpx2sFpmula3j2MYKCy
 rqOQ==
X-Gm-Message-State: AAQBX9e8n7E8Mt8XSZId1Vmwfdg7YeZn10NrX9x7o9bEzSDjzWXDFKm2
 +dryPosnruYCsSnhYjQa3ZLjV6KXih4wSNPXSw4=
X-Google-Smtp-Source: AKy350ZGvywolBBm9ifg1befPUZP6EICM2majGckkZ7j0nuV2k/il+WaFmAMnEEMN7PLLlTTeQPp7r3R+StDku/lscA=
X-Received: by 2002:a17:90a:bb0f:b0:246:63c8:6abf with SMTP id
 u15-20020a17090abb0f00b0024663c86abfmr13792609pjr.20.1682329870678; Mon, 24
 Apr 2023 02:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230423121232.1345909-1-aford173@gmail.com>
 <20230423121232.1345909-5-aford173@gmail.com>
 <CAGXv+5GHcigEahCp+UefxR+AboF7i-kYJjiNftz8fPDLAZVMow@mail.gmail.com>
 <CAHCN7x+i41UkpdqLbK8s+OJmS=ExsctZwZL0YAQAic=N6kCbAw@mail.gmail.com>
 <CGME20230424094440eucas1p1ca3d678493aef1d6a893abdfcaf01584@eucas1p1.samsung.com>
 <CAGXv+5H34ojUAPWWpF+-=XpdF6Jj_Q7nqiPg3TEKVNXu4F6JAQ@mail.gmail.com>
 <ceee0290-211b-a675-2ba5-9342ee27fc49@samsung.com>
In-Reply-To: <ceee0290-211b-a675-2ba5-9342ee27fc49@samsung.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 24 Apr 2023 04:50:59 -0500
Message-ID: <CAHCN7x+koEFVoTOvY16DXYmSE_7+GrYkAk5mnZ02MX9gRmD=DQ@mail.gmail.com>
Subject: Re: [PATCH V2 4/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 dario.binacchi@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 4:47=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 24.04.2023 11:44, Chen-Yu Tsai wrote:
> > On Mon, Apr 24, 2023 at 5:31=E2=80=AFPM Adam Ford <aford173@gmail.com> =
wrote:
> >> On Mon, Apr 24, 2023 at 1:12=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.o=
rg> wrote:
> >>> On Sun, Apr 23, 2023 at 8:13=E2=80=AFPM Adam Ford <aford173@gmail.com=
> wrote:
> >>>> The DPHY timings are currently hard coded. Since the input
> >>>> clock can be variable, the phy timings need to be variable
> >>>> too.  Add an additional variable to the driver data to enable
> >>>> this feature to prevent breaking boards that don't support it.
> >>>>
> >>>> The phy_mipi_dphy_get_default_config function configures the
> >>>> DPHY timings in pico-seconds, and a small macro converts those
> >>>> timings into clock cycles based on the pixel clock rate.
> >>>>
> >>>> Signed-off-by: Adam Ford <aford173@gmail.com>
> >>>> ---
> >>>>   drivers/gpu/drm/bridge/samsung-dsim.c | 79 +++++++++++++++++++++++=
----
> >>>>   include/drm/bridge/samsung-dsim.h     |  1 +
> >>>>   2 files changed, 70 insertions(+), 10 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm=
/bridge/samsung-dsim.c
> >>>> index 5b6e7825b92f..f165483d5044 100644
> >>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>> @@ -18,9 +18,7 @@
> >>>>   #include <linux/media-bus-format.h>
> >>>>   #include <linux/of_device.h>
> >>>>   #include <linux/phy/phy.h>
> >>>> -
> >>>>   #include <video/mipi_display.h>
> >>>> -
> >>>>   #include <drm/bridge/samsung-dsim.h>
> >>>>   #include <drm/drm_panel.h>
> >>>>   #include <drm/drm_print.h>
> >>>> @@ -218,6 +216,8 @@
> >>>>
> >>>>   #define OLD_SCLK_MIPI_CLK_NAME         "pll_clk"
> >>>>
> >>>> +#define PS_TO_CYCLE(PS, MHz) DIV64_U64_ROUND_CLOSEST(((PS) * (MHz))=
, 1000000000000ULL)
> >>>> +
> >>>>   static const char *const clk_names[5] =3D {
> >>>>          "bus_clk",
> >>>>          "sclk_mipi",
> >>>> @@ -487,6 +487,7 @@ static const struct samsung_dsim_driver_data imx=
8mm_dsi_driver_data =3D {
> >>>>          .m_min =3D 64,
> >>>>          .m_max =3D 1023,
> >>>>          .vco_min =3D 1050,
> >>>> +       .dynamic_dphy =3D 1,
> >>>>   };
> >>>>
> >>>>   static const struct samsung_dsim_driver_data *
> >>>> @@ -698,13 +699,50 @@ static void samsung_dsim_set_phy_ctrl(struct s=
amsung_dsim *dsi)
> >>>>          const struct samsung_dsim_driver_data *driver_data =3D dsi-=
>driver_data;
> >>>>          const unsigned int *reg_values =3D driver_data->reg_values;
> >>>>          u32 reg;
> >>>> +       struct drm_display_mode *m =3D &dsi->mode;
> >>>> +       int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> >>>> +       struct phy_configure_opts_mipi_dphy cfg;
> >>>> +       int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
> >>>> +       int hs_exit, hs_prepare, hs_zero, hs_trail;
> >>>> +       unsigned long long clock_in_hz =3D m->clock * 1000;
> >>>>
> >>>>          if (driver_data->has_freqband)
> >>>>                  return;
> >>>>
> >>>> +       /* The dynamic_phy has the ability to adjust PHY Timing sett=
ings */
> >>>> +       if (driver_data->dynamic_dphy) {
> >>>> +               phy_mipi_dphy_get_default_config(clock_in_hz, bpp, d=
si->lanes, &cfg);
> >>> This requires adding "select GENERIC_PHY_MIPI_DPHY" to DRM_SAMSUNG_DS=
IM,
> >>> otherwise with CONFIG_DRM_SAMSUNG_DSIM=3Dm:
> >>>
> >>> ERROR: modpost: "phy_mipi_dphy_get_default_config"
> >>> [drivers/gpu/drm/bridge/samsung-dsim.ko] undefined!
> >>> make[5]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
> >>> make[4]: *** [Makefile:1978: modpost] Error 2
> >>> make[3]: *** [Makefile:357: __build_one_by_one] Error 2
> >>>
> >>> I'm sure there'll be a similar error if CONFIG_DRM_SAMSUNG_DSIM=3Dy.
> >> That's interesting, I didn't come across that.
> >> What did you use for a starting point when you applied the patches?
> >> I want to see if I can replicate it.
> > next-20230421. My config is pretty much tailored to the Hummingbird Pul=
se.
> > Device drivers for other hardware or things that I can't enable are all
> > disabled. For example I don't have PHY_MIXEL_MIPI_DPHY enabled.
> >
> > Maybe you have some other bridge or phy that selects it enabled?
>
>
> I've observed similar issue while building exynos_defconfig for arm 32bit=
.

Thanks to both of you for the head's up.  I'll add a patch to update
Kconfig to explicitly select that when I do V3.  I was just using the
base arm64 'defconfig' option without any customization.

adam
>
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
