Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7B4251EB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 13:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741D86F40E;
	Thu,  7 Oct 2021 11:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727216F40E;
 Thu,  7 Oct 2021 11:22:35 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v18so21803312edc.11;
 Thu, 07 Oct 2021 04:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=k9SJtneK/vSoC9p+OCn7fw6JRlrTPl6hr1zCp8PWYvs=;
 b=dfZu0sRBdSrUsJ2G+GxWpquH+iI/E5ei9nHYhfmy/xrF98sCjW0+HpmEobNtFTomVV
 ytRv2yickootU0IXZXHqti35o5/E1AbzAB/CFzcMbNLRJgjI9onEqEqDNtSUoOjcPZuK
 uVchemRT7ou9elSu5DsR7knuCgXVV59aCkJvvs6gxorX5KbjjB9uIXox8UPqzaKY1P+S
 2digQw20I8ojC0Tp21dP+5M9k48f8LcABBuPz/BbYZyNpRVP0jE1rm1HJ+IEt/PelVV6
 +t8eMIdp8JfQRi7dbXoWLQ/P60hWOK6GCANPIadA+ngYICsDtSTQX55BME4cAC2+KhpZ
 gXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=k9SJtneK/vSoC9p+OCn7fw6JRlrTPl6hr1zCp8PWYvs=;
 b=JPXYIYCdHT+lvjpYe51EHhG5yFqnlu5pBbwBtSa/jbQfQr0W/sXNN/J3jXYVdUNMjv
 c6Tvwpx6R1uXEV/qgr9mUeiR5cw/ugDbM66shH9IWFeWXM7cgSxT/c8c89vqalJmn3PD
 fd4PKNaEnDpEVvqFSVmDp0ucQ2KP7kEGWCspXZQMDHdqqsE7SmbxFA50nZd9KpdEOS4Y
 ycnfzh+FuaKxeaQtjfa6/HSWEBuSoqNydcZ9BqXakmIISEsWjbPUwmvYta36MGU3QuJt
 LSCVnzd1eiB3gwnfbmWEAI8+g59ZFe1yZGNqINYO5gbRHFAIZhxCdcVzrXX8oFktGa3U
 KM2Q==
X-Gm-Message-State: AOAM531Vrci3n1+R2mowIfPbh7ZQToSENaTDAMhKKdSiBmKqLeUmvhAk
 XT19Mt8cMGSW32OPsty/LdcwEW3VQkdofLEGL44=
X-Google-Smtp-Source: ABdhPJyqWCTEHxIIwVyvGSXXLw8RHfe0/eya27e8rPsSC/3JGw9m5zPzlVc6siQjpfJd6fxlhzfETfPr7nFYO6Ae9k4=
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr4936630ejc.69.1633605753847; 
 Thu, 07 Oct 2021 04:22:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:f758:0:0:0:0 with HTTP; Thu, 7 Oct 2021 04:22:32
 -0700 (PDT)
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 7 Oct 2021 14:22:32 +0300
Message-ID: <CAHp75VdLg-rBjCDGEwgkY6QDbFGW0of4SjSmp08FXXRN_raQtQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/34] component: Make into an aggregate bus
To: Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>, 
 Chen-Yu Tsai <wens@csie.org>, Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Inki Dae <inki.dae@samsung.com>, James Qian Wang <james.qian.wang@arm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <joro@8bytes.org>,
 John Stultz <john.stultz@linaro.org>, 
 Joonyoung Shim <jy0922.shim@samsung.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, 
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Mark Brown <broonie@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Paul Cercueil <paul@crapouillou.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Russell King <linux@armlinux.org.uk>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Sandy Huang <hjc@rock-chips.com>, 
 Saravana Kannan <saravanak@google.com>, Sebastian Reichel <sre@kernel.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, Takashi Iwai <tiwai@suse.com>, 
 Tian Tao <tiantao6@hisilicon.com>, Tomas Winkler <tomas.winkler@intel.com>, 
 Tomi Valkeinen <tomba@kernel.org>, Will Deacon <will@kernel.org>, 
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Yong Wu <yong.wu@mediatek.com>
Content-Type: multipart/alternative; boundary="000000000000a9431205cdc17abc"
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

--000000000000a9431205cdc17abc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday, October 6, 2021, Stephen Boyd <swboyd@chromium.org> wrote:

> This series is from discussion we had on reordering the device lists for
> drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
> the aggregate device onto and then we probe the aggregate device once
> all the components are probed and call component_add(). The probe/remove
> hooks are where the bind/unbind calls go, and then a shutdown hook is
> added that can be used to shutdown the drm display pipeline at the right
> time.
>
> This works for me on my sc7180 board. I no longer get a warning from i2c
> at shutdown that we're trying to make an i2c transaction after the i2c
> bus has been shutdown. There's more work to do on the msm drm driver to
> extract component device resources like clks, regulators, etc. out of
> the component bind function into the driver probe but I wanted to move
> everything over now in other component drivers before tackling that
> problem.
>
> I'll definitely be sending a v3 so this is partially a request for
> testing to shake out any more problems. Tested-by tags would be
> appreciated,
> and Acked-by/Reviewed-by tags too. I sent this to gregkh which may be
> incorrect but I don't know what better tree to send it all through.
> Maybe drm?
>
> I'll be faster at resending this next time, sorry for the long delay!
>
>
Yet another avoidance of mathematically proven device dependency graph...


Can we actually find and ask a mathematician to look into the problem and
suggest real solution instead of all these ugly hacks: deferred probe
(ugliest hack, how it even came into kernel?), component framework, custom
approaches on how to see if devices are in the system (ASoC hack).



> Changes since v1 (https://lore.kernel.org/r/20210520002519.3538432-1-
> swboyd@chromium.org):
>  - Use devlink to connect components to the aggregate device
>  - Don't set the registering device as a parent of the aggregate device
>  - New patch for bind_component/unbind_component ops that takes the
>    aggregate device
>  - Convert all drivers in the tree to use the aggregate driver approach
>  - Allow one aggregate driver to be used for multiple aggregate devices
>
> [1] https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.or=
g
>
> Stephen Boyd (34):
>   component: Introduce struct aggregate_device
>   component: Introduce the aggregate bus_type
>   component: Move struct aggregate_device out to header file
>   drm/msm: Migrate to aggregate driver
>   component: Add {bind,unbind}_component() ops that take aggregate
>     device
>   drm/of: Add a drm_of_aggregate_probe() API
>   drm/komeda: Migrate to aggregate driver
>   drm/arm/hdlcd: Migrate to aggregate driver
>   drm/malidp: Migrate to aggregate driver
>   drm/armada: Migrate to aggregate driver
>   drm/etnaviv: Migrate to aggregate driver
>   drm/kirin: Migrate to aggregate driver
>   drm/exynos: Migrate to aggregate driver
>   drm/imx: Migrate to aggregate driver
>   drm/ingenic: Migrate to aggregate driver
>   drm/mcde: Migrate to aggregate driver
>   drm/mediatek: Migrate to aggregate driver
>   drm/meson: Migrate to aggregate driver
>   drm/omap: Migrate to aggregate driver
>   drm/rockchip: Migrate to aggregate driver
>   drm/sti: Migrate to aggregate driver
>   drm/sun4i: Migrate to aggregate driver
>   drm/tilcdc: Migrate to aggregate driver
>   drm/vc4: Migrate to aggregate driver
>   drm/zte: Migrate to aggregate driver
>   iommu/mtk: Migrate to aggregate driver
>   mei: Migrate to aggregate driver
>   power: supply: ab8500: Migrate to aggregate driver
>   fbdev: omap2: Migrate to aggregate driver
>   sound: hdac: Migrate to aggregate driver
>   ASoC: codecs: wcd938x: Migrate to aggregate driver
>   component: Get rid of drm_of_component_probe()
>   component: Remove component_master_ops and friends
>   component: Remove all references to 'master'
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Chen Feng <puck.chen@hisilicon.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: <linux-fbdev@vger.kernel.org>
> Cc: <linux-omap@vger.kernel.org>
> Cc: <linux-pm@vger.kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Tomas Winkler <tomas.winkler@intel.com>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Yong Wu <yong.wu@mediatek.com>
>
>  drivers/base/component.c                      | 555 +++++++++++-------
>  .../gpu/drm/arm/display/komeda/komeda_drv.c   |  20 +-
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  21 +-
>  drivers/gpu/drm/arm/malidp_drv.c              |  21 +-
>  drivers/gpu/drm/armada/armada_drv.c           |  23 +-
>  drivers/gpu/drm/drm_drv.c                     |   2 +-
>  drivers/gpu/drm/drm_of.c                      |  20 +-
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  20 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c       |  21 +-
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  20 +-
>  drivers/gpu/drm/imx/imx-drm-core.c            |  20 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  24 +-
>  drivers/gpu/drm/mcde/mcde_drv.c               |  23 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  20 +-
>  drivers/gpu/drm/meson/meson_drv.c             |  21 +-
>  drivers/gpu/drm/msm/msm_drv.c                 |  46 +-
>  drivers/gpu/drm/omapdrm/dss/dss.c             |  17 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  20 +-
>  drivers/gpu/drm/sti/sti_drv.c                 |  20 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  26 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  28 +-
>  drivers/gpu/drm/vc4/vc4_drv.c                 |  20 +-
>  drivers/gpu/drm/zte/zx_drm_drv.c              |  20 +-
>  drivers/iommu/mtk_iommu.c                     |  14 +-
>  drivers/iommu/mtk_iommu.h                     |   6 +-
>  drivers/iommu/mtk_iommu_v1.c                  |  14 +-
>  drivers/misc/mei/hdcp/mei_hdcp.c              |  22 +-
>  drivers/power/supply/ab8500_charger.c         |  22 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  20 +-
>  include/drm/drm_of.h                          |   9 +-
>  include/linux/component.h                     |  92 ++-
>  sound/hda/hdac_component.c                    |  21 +-
>  sound/soc/codecs/wcd938x.c                    |  20 +-
>  33 files changed, 780 insertions(+), 488 deletions(-)
>
>
> base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
> --
> https://chromeos.dev
>
>

--=20
With Best Regards,
Andy Shevchenko

--000000000000a9431205cdc17abc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, October 6, 2021, Stephen Boyd &lt;<a href=3D"mailto:s=
wboyd@chromium.org">swboyd@chromium.org</a>&gt; wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">This series is from discussion we had on reordering the devic=
e lists for<br>
drm shutdown paths[1]. I&#39;ve introduced an &#39;aggregate&#39; bus that =
we put<br>
the aggregate device onto and then we probe the aggregate device once<br>
all the components are probed and call component_add(). The probe/remove<br=
>
hooks are where the bind/unbind calls go, and then a shutdown hook is<br>
added that can be used to shutdown the drm display pipeline at the right<br=
>
time.<br>
<br>
This works for me on my sc7180 board. I no longer get a warning from i2c<br=
>
at shutdown that we&#39;re trying to make an i2c transaction after the i2c<=
br>
bus has been shutdown. There&#39;s more work to do on the msm drm driver to=
<br>
extract component device resources like clks, regulators, etc. out of<br>
the component bind function into the driver probe but I wanted to move<br>
everything over now in other component drivers before tackling that<br>
problem.<br>
<br>
I&#39;ll definitely be sending a v3 so this is partially a request for<br>
testing to shake out any more problems. Tested-by tags would be appreciated=
,<br>
and Acked-by/Reviewed-by tags too. I sent this to gregkh which may be<br>
incorrect but I don&#39;t know what better tree to send it all through.<br>
Maybe drm?<br>
<br>
I&#39;ll be faster at resending this next time, sorry for the long delay!<b=
r>
<br></blockquote><div><br></div><div>Yet another avoidance of mathematicall=
y proven device dependency graph...</div><div><br></div><div><br></div><div=
>Can we actually find and ask a mathematician to look into the problem and =
suggest real solution instead of all these ugly hacks: deferred probe (ugli=
est hack, how it even came into kernel?), component framework, custom appro=
aches on how to see if devices are in the system (ASoC hack).</div><div><br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Changes since v1 (<a href=3D"https://lore.kernel.org/r/20210520002519.35384=
32-1-swboyd@chromium.org" target=3D"_blank">https://lore.kernel.org/r/<wbr>=
20210520002519.3538432-1-<wbr>swboyd@chromium.org</a>):<br>
=C2=A0- Use devlink to connect components to the aggregate device<br>
=C2=A0- Don&#39;t set the registering device as a parent of the aggregate d=
evice<br>
=C2=A0- New patch for bind_component/unbind_<wbr>component ops that takes t=
he<br>
=C2=A0 =C2=A0aggregate device<br>
=C2=A0- Convert all drivers in the tree to use the aggregate driver approac=
h<br>
=C2=A0- Allow one aggregate driver to be used for multiple aggregate device=
s<br>
<br>
[1] <a href=3D"https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@ch=
romium.org" target=3D"_blank">https://lore.kernel.org/r/<wbr>20210508074118=
.1621729-1-<wbr>swboyd@chromium.org</a><br>
<br>
Stephen Boyd (34):<br>
=C2=A0 component: Introduce struct aggregate_device<br>
=C2=A0 component: Introduce the aggregate bus_type<br>
=C2=A0 component: Move struct aggregate_device out to header file<br>
=C2=A0 drm/msm: Migrate to aggregate driver<br>
=C2=A0 component: Add {bind,unbind}_component() ops that take aggregate<br>
=C2=A0 =C2=A0 device<br>
=C2=A0 drm/of: Add a drm_of_aggregate_probe() API<br>
=C2=A0 drm/komeda: Migrate to aggregate driver<br>
=C2=A0 drm/arm/hdlcd: Migrate to aggregate driver<br>
=C2=A0 drm/malidp: Migrate to aggregate driver<br>
=C2=A0 drm/armada: Migrate to aggregate driver<br>
=C2=A0 drm/etnaviv: Migrate to aggregate driver<br>
=C2=A0 drm/kirin: Migrate to aggregate driver<br>
=C2=A0 drm/exynos: Migrate to aggregate driver<br>
=C2=A0 drm/imx: Migrate to aggregate driver<br>
=C2=A0 drm/ingenic: Migrate to aggregate driver<br>
=C2=A0 drm/mcde: Migrate to aggregate driver<br>
=C2=A0 drm/mediatek: Migrate to aggregate driver<br>
=C2=A0 drm/meson: Migrate to aggregate driver<br>
=C2=A0 drm/omap: Migrate to aggregate driver<br>
=C2=A0 drm/rockchip: Migrate to aggregate driver<br>
=C2=A0 drm/sti: Migrate to aggregate driver<br>
=C2=A0 drm/sun4i: Migrate to aggregate driver<br>
=C2=A0 drm/tilcdc: Migrate to aggregate driver<br>
=C2=A0 drm/vc4: Migrate to aggregate driver<br>
=C2=A0 drm/zte: Migrate to aggregate driver<br>
=C2=A0 iommu/mtk: Migrate to aggregate driver<br>
=C2=A0 mei: Migrate to aggregate driver<br>
=C2=A0 power: supply: ab8500: Migrate to aggregate driver<br>
=C2=A0 fbdev: omap2: Migrate to aggregate driver<br>
=C2=A0 sound: hdac: Migrate to aggregate driver<br>
=C2=A0 ASoC: codecs: wcd938x: Migrate to aggregate driver<br>
=C2=A0 component: Get rid of drm_of_component_probe()<br>
=C2=A0 component: Remove component_master_ops and friends<br>
=C2=A0 component: Remove all references to &#39;master&#39;<br>
<br>
Cc: Arnd Bergmann &lt;<a href=3D"mailto:arnd@arndb.de">arnd@arndb.de</a>&gt=
;<br>
Cc: Benjamin Gaignard &lt;<a href=3D"mailto:benjamin.gaignard@linaro.org">b=
enjamin.gaignard@linaro.org</a>&gt;<br>
Cc: Chen Feng &lt;<a href=3D"mailto:puck.chen@hisilicon.com">puck.chen@hisi=
licon.com</a>&gt;<br>
Cc: Chen-Yu Tsai &lt;<a href=3D"mailto:wens@csie.org">wens@csie.org</a>&gt;=
<br>
Cc: Christian Gmeiner &lt;<a href=3D"mailto:christian.gmeiner@gmail.com">ch=
ristian.gmeiner@gmail.com</a>&gt;<br>
Cc: Chun-Kuang Hu &lt;<a href=3D"mailto:chunkuang.hu@kernel.org">chunkuang.=
hu@kernel.org</a>&gt;<br>
Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch">daniel.vett=
er@ffwll.ch</a>&gt;<br>
Cc: Emma Anholt &lt;<a href=3D"mailto:emma@anholt.net">emma@anholt.net</a>&=
gt;<br>
Cc: Greg Kroah-Hartman &lt;<a href=3D"mailto:gregkh@linuxfoundation.org">gr=
egkh@linuxfoundation.org</a>&gt;<br>
Cc: &quot;Heiko St=C3=BCbner&quot; &lt;<a href=3D"mailto:heiko@sntech.de">h=
eiko@sntech.de</a>&gt;<br>
Cc: Inki Dae &lt;<a href=3D"mailto:inki.dae@samsung.com">inki.dae@samsung.c=
om</a>&gt;<br>
Cc: James Qian Wang (Arm Technology China) &lt;<a href=3D"mailto:james.qian=
.wang@arm.com">james.qian.wang@arm.com</a>&gt;<br>
Cc: Jaroslav Kysela &lt;<a href=3D"mailto:perex@perex.cz">perex@perex.cz</a=
>&gt;<br>
Cc: Joerg Roedel &lt;<a href=3D"mailto:joro@8bytes.org">joro@8bytes.org</a>=
&gt;<br>
Cc: John Stultz &lt;<a href=3D"mailto:john.stultz@linaro.org">john.stultz@l=
inaro.org</a>&gt;<br>
Cc: Joonyoung Shim &lt;<a href=3D"mailto:jy0922.shim@samsung.com">jy0922.sh=
im@samsung.com</a>&gt;<br>
Cc: Jyri Sarha &lt;<a href=3D"mailto:jyri.sarha@iki.fi">jyri.sarha@iki.fi</=
a>&gt;<br>
Cc: Kai Vehmanen &lt;<a href=3D"mailto:kai.vehmanen@linux.intel.com">kai.ve=
hmanen@linux.intel.com</a>&gt;<br>
Cc: Kyungmin Park &lt;<a href=3D"mailto:kyungmin.park@samsung.com">kyungmin=
.park@samsung.com</a>&gt;<br>
Cc: Laurent Pinchart &lt;<a href=3D"mailto:laurent.pinchart@ideasonboard.co=
m">laurent.pinchart@<wbr>ideasonboard.com</a>&gt;<br>
Cc: &lt;<a href=3D"mailto:linux-fbdev@vger.kernel.org">linux-fbdev@vger.ker=
nel.org</a>&gt;<br>
Cc: &lt;<a href=3D"mailto:linux-omap@vger.kernel.org">linux-omap@vger.kerne=
l.org</a>&gt;<br>
Cc: &lt;<a href=3D"mailto:linux-pm@vger.kernel.org">linux-pm@vger.kernel.or=
g</a>&gt;<br>
Cc: Liviu Dudau &lt;<a href=3D"mailto:liviu.dudau@arm.com">liviu.dudau@arm.=
com</a>&gt;<br>
Cc: Lucas Stach &lt;<a href=3D"mailto:l.stach@pengutronix.de">l.stach@pengu=
tronix.de</a>&gt;<br>
Cc: Mark Brown &lt;<a href=3D"mailto:broonie@kernel.org">broonie@kernel.org=
</a>&gt;<br>
Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org">mripard@kernel.=
org</a>&gt;<br>
Cc: Neil Armstrong &lt;<a href=3D"mailto:narmstrong@baylibre.com">narmstron=
g@baylibre.com</a>&gt;<br>
Cc: Paul Cercueil &lt;<a href=3D"mailto:paul@crapouillou.net">paul@crapouil=
lou.net</a>&gt;<br>
Cc: Philipp Zabel &lt;<a href=3D"mailto:p.zabel@pengutronix.de">p.zabel@pen=
gutronix.de</a>&gt;<br>
Cc: &quot;Rafael J. Wysocki&quot; &lt;<a href=3D"mailto:rafael@kernel.org">=
rafael@kernel.org</a>&gt;<br>
Cc: Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com">robdclark@gmail.co=
m</a>&gt;<br>
Cc: Russell King &lt;<a href=3D"mailto:linux@armlinux.org.uk">linux@armlinu=
x.org.uk</a>&gt;<br>
Cc: Russell King &lt;<a href=3D"mailto:linux+etnaviv@armlinux.org.uk">linux=
+etnaviv@armlinux.org.uk</a><wbr>&gt;<br>
Cc: Russell King &lt;<a href=3D"mailto:rmk+kernel@arm.linux.org.uk">rmk+ker=
nel@arm.linux.org.uk</a>&gt;<br>
Cc: Sandy Huang &lt;<a href=3D"mailto:hjc@rock-chips.com">hjc@rock-chips.co=
m</a>&gt;<br>
Cc: Saravana Kannan &lt;<a href=3D"mailto:saravanak@google.com">saravanak@g=
oogle.com</a>&gt;<br>
Cc: Sebastian Reichel &lt;<a href=3D"mailto:sre@kernel.org">sre@kernel.org<=
/a>&gt;<br>
Cc: Seung-Woo Kim &lt;<a href=3D"mailto:sw0312.kim@samsung.com">sw0312.kim@=
samsung.com</a>&gt;<br>
Cc: Takashi Iwai &lt;<a href=3D"mailto:tiwai@suse.com">tiwai@suse.com</a>&g=
t;<br>
Cc: Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.com">tiantao6@hisilic=
on.com</a>&gt;<br>
Cc: Tomas Winkler &lt;<a href=3D"mailto:tomas.winkler@intel.com">tomas.wink=
ler@intel.com</a>&gt;<br>
Cc: Tomi Valkeinen &lt;<a href=3D"mailto:tomba@kernel.org">tomba@kernel.org=
</a>&gt;<br>
Cc: Will Deacon &lt;<a href=3D"mailto:will@kernel.org">will@kernel.org</a>&=
gt;<br>
Cc: Xinliang Liu &lt;<a href=3D"mailto:xinliang.liu@linaro.org">xinliang.li=
u@linaro.org</a>&gt;<br>
Cc: Xinwei Kong &lt;<a href=3D"mailto:kong.kongxinwei@hisilicon.com">kong.k=
ongxinwei@hisilicon.com</a><wbr>&gt;<br>
Cc: Yong Wu &lt;<a href=3D"mailto:yong.wu@mediatek.com">yong.wu@mediatek.co=
m</a>&gt;<br>
<br>
=C2=A0drivers/base/component.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 555 +++++++++++-------<br>
=C2=A0.../gpu/drm/arm/display/<wbr>komeda/komeda_drv.c=C2=A0 =C2=A0|=C2=A0 =
20 +-<br>
=C2=A0drivers/gpu/drm/arm/hdlcd_drv.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 21 +-<br>
=C2=A0drivers/gpu/drm/arm/malidp_<wbr>drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 21 +-<br>
=C2=A0drivers/gpu/drm/armada/armada_<wbr>drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 23 +-<br>
=C2=A0drivers/gpu/drm/drm_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0drivers/gpu/drm/drm_of.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 +-<br>
=C2=A0drivers/gpu/drm/etnaviv/<wbr>etnaviv_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 20 +-<br>
=C2=A0drivers/gpu/drm/exynos/exynos_<wbr>drm_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 21 +-<br>
=C2=A0.../gpu/drm/hisilicon/kirin/<wbr>kirin_drm_drv.c=C2=A0 =C2=A0|=C2=A0 =
20 +-<br>
=C2=A0drivers/gpu/drm/imx/imx-drm-<wbr>core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 20 +-<br>
=C2=A0drivers/gpu/drm/ingenic/<wbr>ingenic-drm-drv.c=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 24 +-<br>
=C2=A0drivers/gpu/drm/mcde/mcde_drv.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 +-<br>
=C2=A0drivers/gpu/drm/mediatek/mtk_<wbr>drm_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 20 +-<br>
=C2=A0drivers/gpu/drm/meson/meson_<wbr>drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 21 +-<br>
=C2=A0drivers/gpu/drm/msm/msm_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 46 +-<br>
=C2=A0drivers/gpu/drm/omapdrm/dss/<wbr>dss.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 17 +-<br>
=C2=A0drivers/gpu/drm/rockchip/<wbr>rockchip_drm_drv.c=C2=A0 =C2=A0|=C2=A0 =
20 +-<br>
=C2=A0drivers/gpu/drm/sti/sti_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +-<br>
=C2=A0drivers/gpu/drm/sun4i/sun4i_<wbr>drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 26 +-<br>
=C2=A0drivers/gpu/drm/tilcdc/tilcdc_<wbr>drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 28 +-<br>
=C2=A0drivers/gpu/drm/vc4/vc4_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +-<br>
=C2=A0drivers/gpu/drm/zte/zx_drm_<wbr>drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 20 +-<br>
=C2=A0drivers/iommu/mtk_iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 +-<br>
=C2=A0drivers/iommu/mtk_iommu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0drivers/iommu/mtk_iommu_v1.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
=C2=A0drivers/misc/mei/hdcp/mei_<wbr>hdcp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 22 +-<br>
=C2=A0drivers/power/supply/ab8500_<wbr>charger.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 22 +-<br>
=C2=A0drivers/video/fbdev/omap2/<wbr>omapfb/dss/dss.c=C2=A0 =C2=A0 |=C2=A0 =
20 +-<br>
=C2=A0include/drm/drm_of.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
=C2=A0include/linux/component.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 92 ++-<br>
=C2=A0sound/hda/hdac_component.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 21 +-<br>
=C2=A0sound/soc/codecs/wcd938x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 +-<br>
=C2=A033 files changed, 780 insertions(+), 488 deletions(-)<br>
<br>
<br>
base-commit: e4e737bb5c170df6135a127739a9e6<wbr>148ee3da82<br>
-- <br>
<a href=3D"https://chromeos.dev" target=3D"_blank">https://chromeos.dev</a>=
<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--000000000000a9431205cdc17abc--
