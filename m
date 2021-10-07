Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A91425323
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 14:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D226F45A;
	Thu,  7 Oct 2021 12:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A54E6F45A;
 Thu,  7 Oct 2021 12:33:45 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k7so18480669wrd.13;
 Thu, 07 Oct 2021 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pZ07eGpWJ0hQn3/cWkaB0IeqVUc4BwuUIeY0U15+mN0=;
 b=nEvFA2+NzNcr9G91D5EW1/fXoyRI39D4XMDUz9KC7Eky7ZfBKiDPlzSqjtLvoshtvY
 fXwO6KfKb1ua5DH1d63qT/pItwgYrM8byhlD4gWBL49w2K6joYwcl5JrJuKNW9lDsXrl
 glsGO7bi11LAud3TlvXjyGhXuGe16jThhijzsQM0LFTEQ6MIj+w+zEFBR5/YEBfAzQQ2
 KVTGLQTDoPn+83adllGVhXd+UlYZOEzCHjch6BMn3+0m2lGfTfqpv9Sny9iIj5x8/ezy
 gVSlbQ+5zC4avKg0hXirVU9wp/22TQeDhOkflfVRZONVUtpeAcA9rDKGW/YLG8VFy21u
 3kTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pZ07eGpWJ0hQn3/cWkaB0IeqVUc4BwuUIeY0U15+mN0=;
 b=6rjIYDbbrjOjIjbF/bJbzxXMgi5BisFURy3G67xhBili95S2OCq8X9VTIIlL+nMsHy
 3j26ygjR94MkNROZ1qG7SXOpOSzOzxdonD1SaeGyftJ6LDiLCwAIDMaRstSbFPRSvzrT
 Hwij8tXOVNnJgtae3ZHSbCthWK2aaIPy16dgVJA9N9DpZWs96xuqiXGMVO1Q1c2dABPc
 McIFTFfVFMDhVJTFhltpHzp/+PrGLk78bvsPMNhmQOUZxtWDFyd460NGKxqb/4xbZdMA
 J3fZdCCQ2CUGW56ybnNWhbop0hzkLTlMNvqnJuv2v453bnhKDc5+PMQvgXOr2djSf4fa
 G5gg==
X-Gm-Message-State: AOAM531vIMA1td62L/DvD0c6y6ZC+tVh8atpBERYu09pxJo9wXp/ffso
 PgR65ylTPH6ebAIWyQTzFJc=
X-Google-Smtp-Source: ABdhPJxUTgYbe+40w8j81FZNn37AkG06UIzWcsswY9XuuwGE+Y7u2XiyjJnIqdbfU34SDcJ1qI2zCg==
X-Received: by 2002:a7b:cf24:: with SMTP id m4mr16291322wmg.133.1633610024028; 
 Thu, 07 Oct 2021 05:33:44 -0700 (PDT)
Received: from [192.168.0.14]
 (095160158079.dynamic-2-waw-k-4-2-0.vectranet.pl. [95.160.158.79])
 by smtp.gmail.com with ESMTPSA id k8sm1636306wmr.32.2021.10.07.05.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 05:33:43 -0700 (PDT)
Subject: Re: [PATCH v2 00/34] component: Make into an aggregate bus
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>, Chen-Yu Tsai <wens@csie.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
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
 Liviu Dudau <liviu.dudau@arm.com>, Lucas Stach <l.stach@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Paul Cercueil <paul@crapouillou.net>, Philipp Zabel
 <p.zabel@pengutronix.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Russell King <rmk+kernel@arm.linux.org.uk>, Sandy Huang
 <hjc@rock-chips.com>, Saravana Kannan <saravanak@google.com>,
 Sebastian Reichel <sre@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Takashi Iwai <tiwai@suse.com>, Tian Tao <tiantao6@hisilicon.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Tomi Valkeinen <tomba@kernel.org>,
 Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Yong Wu <yong.wu@mediatek.com>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <CAHp75VdLg-rBjCDGEwgkY6QDbFGW0of4SjSmp08FXXRN_raQtQ@mail.gmail.com>
From: Andrzej Hajda <andrzej.hajda@gmail.com>
Message-ID: <3acc1195-379d-c767-c124-7912ad792d6d@gmail.com>
Date: Thu, 7 Oct 2021 14:33:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdLg-rBjCDGEwgkY6QDbFGW0of4SjSmp08FXXRN_raQtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 07.10.2021 13:22, Andy Shevchenko wrote:
> 
> 
> On Wednesday, October 6, 2021, Stephen Boyd <swboyd@chromium.org 
> <mailto:swboyd@chromium.org>> wrote:
> 
>     This series is from discussion we had on reordering the device lists for
>     drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
>     the aggregate device onto and then we probe the aggregate device once
>     all the components are probed and call component_add(). The probe/remove
>     hooks are where the bind/unbind calls go, and then a shutdown hook is
>     added that can be used to shutdown the drm display pipeline at the right
>     time.
> 
>     This works for me on my sc7180 board. I no longer get a warning from i2c
>     at shutdown that we're trying to make an i2c transaction after the i2c
>     bus has been shutdown. There's more work to do on the msm drm driver to
>     extract component device resources like clks, regulators, etc. out of
>     the component bind function into the driver probe but I wanted to move
>     everything over now in other component drivers before tackling that
>     problem.
> 
>     I'll definitely be sending a v3 so this is partially a request for
>     testing to shake out any more problems. Tested-by tags would be
>     appreciated,
>     and Acked-by/Reviewed-by tags too. I sent this to gregkh which may be
>     incorrect but I don't know what better tree to send it all through.
>     Maybe drm?
> 
>     I'll be faster at resending this next time, sorry for the long delay!
> 
> 
> Yet another avoidance of mathematically proven device dependency graph...
> 
> 
> Can we actually find and ask a mathematician to look into the problem 
> and suggest real solution instead of all these ugly hacks: deferred 
> probe (ugliest hack, how it even came into kernel?), component 
> framework, custom approaches on how to see if devices are in the system 
> (ASoC hack).

Master of Science in Math is OK? :)
The solution is simple - topological sort - this is what PM device list 
does, but it is possible only if there are no circular dependencies.

And in this case we have circular dependency.
In such case the solution in case of initialization is to split it to 
two phases - probe/bind (component framework), probe/attach (DSI bus) 
and it works. But PM still relies on topological sort. To make PM 
working with circular deps you can try to extend PM somehow (maybe 
replace list of devices with list of pairs (device, phase) ??? ), or to 
add notifiers to frameworks allowing providers to informs its consumers 
about state change. The latter approach I have advertised several times, 
even on OSS.

[1]: https://static.sched.com/hosted_files/osseu18/0f/deferred_problem.pdf
[2]: https://lwn.net/Articles/625454/


Regards
Andrzej


> 
>     Changes since v1
>     (https://lore.kernel.org/r/20210520002519.3538432-1-swboyd@chromium.org
>     <https://lore.kernel.org/r/20210520002519.3538432-1-swboyd@chromium.org>):
>       - Use devlink to connect components to the aggregate device
>       - Don't set the registering device as a parent of the aggregate device
>       - New patch for bind_component/unbind_component ops that takes the
>         aggregate device
>       - Convert all drivers in the tree to use the aggregate driver approach
>       - Allow one aggregate driver to be used for multiple aggregate devices
> 
>     [1]
>     https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.org
>     <https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.org>
> 
>     Stephen Boyd (34):
>        component: Introduce struct aggregate_device
>        component: Introduce the aggregate bus_type
>        component: Move struct aggregate_device out to header file
>        drm/msm: Migrate to aggregate driver
>        component: Add {bind,unbind}_component() ops that take aggregate
>          device
>        drm/of: Add a drm_of_aggregate_probe() API
>        drm/komeda: Migrate to aggregate driver
>        drm/arm/hdlcd: Migrate to aggregate driver
>        drm/malidp: Migrate to aggregate driver
>        drm/armada: Migrate to aggregate driver
>        drm/etnaviv: Migrate to aggregate driver
>        drm/kirin: Migrate to aggregate driver
>        drm/exynos: Migrate to aggregate driver
>        drm/imx: Migrate to aggregate driver
>        drm/ingenic: Migrate to aggregate driver
>        drm/mcde: Migrate to aggregate driver
>        drm/mediatek: Migrate to aggregate driver
>        drm/meson: Migrate to aggregate driver
>        drm/omap: Migrate to aggregate driver
>        drm/rockchip: Migrate to aggregate driver
>        drm/sti: Migrate to aggregate driver
>        drm/sun4i: Migrate to aggregate driver
>        drm/tilcdc: Migrate to aggregate driver
>        drm/vc4: Migrate to aggregate driver
>        drm/zte: Migrate to aggregate driver
>        iommu/mtk: Migrate to aggregate driver
>        mei: Migrate to aggregate driver
>        power: supply: ab8500: Migrate to aggregate driver
>        fbdev: omap2: Migrate to aggregate driver
>        sound: hdac: Migrate to aggregate driver
>        ASoC: codecs: wcd938x: Migrate to aggregate driver
>        component: Get rid of drm_of_component_probe()
>        component: Remove component_master_ops and friends
>        component: Remove all references to 'master'
> 
>     Cc: Arnd Bergmann <arnd@arndb.de <mailto:arnd@arndb.de>>
>     Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org
>     <mailto:benjamin.gaignard@linaro.org>>
>     Cc: Chen Feng <puck.chen@hisilicon.com <mailto:puck.chen@hisilicon.com>>
>     Cc: Chen-Yu Tsai <wens@csie.org <mailto:wens@csie.org>>
>     Cc: Christian Gmeiner <christian.gmeiner@gmail.com
>     <mailto:christian.gmeiner@gmail.com>>
>     Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org
>     <mailto:chunkuang.hu@kernel.org>>
>     Cc: Daniel Vetter <daniel.vetter@ffwll.ch
>     <mailto:daniel.vetter@ffwll.ch>>
>     Cc: Emma Anholt <emma@anholt.net <mailto:emma@anholt.net>>
>     Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org
>     <mailto:gregkh@linuxfoundation.org>>
>     Cc: "Heiko Stübner" <heiko@sntech.de <mailto:heiko@sntech.de>>
>     Cc: Inki Dae <inki.dae@samsung.com <mailto:inki.dae@samsung.com>>
>     Cc: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com
>     <mailto:james.qian.wang@arm.com>>
>     Cc: Jaroslav Kysela <perex@perex.cz <mailto:perex@perex.cz>>
>     Cc: Joerg Roedel <joro@8bytes.org <mailto:joro@8bytes.org>>
>     Cc: John Stultz <john.stultz@linaro.org <mailto:john.stultz@linaro.org>>
>     Cc: Joonyoung Shim <jy0922.shim@samsung.com
>     <mailto:jy0922.shim@samsung.com>>
>     Cc: Jyri Sarha <jyri.sarha@iki.fi <mailto:jyri.sarha@iki.fi>>
>     Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com
>     <mailto:kai.vehmanen@linux.intel.com>>
>     Cc: Kyungmin Park <kyungmin.park@samsung.com
>     <mailto:kyungmin.park@samsung.com>>
>     Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com
>     <mailto:laurent.pinchart@ideasonboard.com>>
>     Cc: <linux-fbdev@vger.kernel.org <mailto:linux-fbdev@vger.kernel.org>>
>     Cc: <linux-omap@vger.kernel.org <mailto:linux-omap@vger.kernel.org>>
>     Cc: <linux-pm@vger.kernel.org <mailto:linux-pm@vger.kernel.org>>
>     Cc: Liviu Dudau <liviu.dudau@arm.com <mailto:liviu.dudau@arm.com>>
>     Cc: Lucas Stach <l.stach@pengutronix.de <mailto:l.stach@pengutronix.de>>
>     Cc: Mark Brown <broonie@kernel.org <mailto:broonie@kernel.org>>
>     Cc: Maxime Ripard <mripard@kernel.org <mailto:mripard@kernel.org>>
>     Cc: Neil Armstrong <narmstrong@baylibre.com
>     <mailto:narmstrong@baylibre.com>>
>     Cc: Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>>
>     Cc: Philipp Zabel <p.zabel@pengutronix.de
>     <mailto:p.zabel@pengutronix.de>>
>     Cc: "Rafael J. Wysocki" <rafael@kernel.org <mailto:rafael@kernel.org>>
>     Cc: Rob Clark <robdclark@gmail.com <mailto:robdclark@gmail.com>>
>     Cc: Russell King <linux@armlinux.org.uk <mailto:linux@armlinux.org.uk>>
>     Cc: Russell King <linux+etnaviv@armlinux.org.uk
>     <mailto:linux+etnaviv@armlinux.org.uk>>
>     Cc: Russell King <rmk+kernel@arm.linux.org.uk
>     <mailto:rmk+kernel@arm.linux.org.uk>>
>     Cc: Sandy Huang <hjc@rock-chips.com <mailto:hjc@rock-chips.com>>
>     Cc: Saravana Kannan <saravanak@google.com <mailto:saravanak@google.com>>
>     Cc: Sebastian Reichel <sre@kernel.org <mailto:sre@kernel.org>>
>     Cc: Seung-Woo Kim <sw0312.kim@samsung.com
>     <mailto:sw0312.kim@samsung.com>>
>     Cc: Takashi Iwai <tiwai@suse.com <mailto:tiwai@suse.com>>
>     Cc: Tian Tao <tiantao6@hisilicon.com <mailto:tiantao6@hisilicon.com>>
>     Cc: Tomas Winkler <tomas.winkler@intel.com
>     <mailto:tomas.winkler@intel.com>>
>     Cc: Tomi Valkeinen <tomba@kernel.org <mailto:tomba@kernel.org>>
>     Cc: Will Deacon <will@kernel.org <mailto:will@kernel.org>>
>     Cc: Xinliang Liu <xinliang.liu@linaro.org
>     <mailto:xinliang.liu@linaro.org>>
>     Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com
>     <mailto:kong.kongxinwei@hisilicon.com>>
>     Cc: Yong Wu <yong.wu@mediatek.com <mailto:yong.wu@mediatek.com>>
> 
>       drivers/base/component.c                      | 555 +++++++++++-------
>       .../gpu/drm/arm/display/komeda/komeda_drv.c   |  20 +-
>       drivers/gpu/drm/arm/hdlcd_drv.c               |  21 +-
>       drivers/gpu/drm/arm/malidp_drv.c              |  21 +-
>       drivers/gpu/drm/armada/armada_drv.c           |  23 +-
>       drivers/gpu/drm/drm_drv.c                     |   2 +-
>       drivers/gpu/drm/drm_of.c                      |  20 +-
>       drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  20 +-
>       drivers/gpu/drm/exynos/exynos_drm_drv.c       |  21 +-
>       .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  20 +-
>       drivers/gpu/drm/imx/imx-drm-core.c            |  20 +-
>       drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  24 +-
>       drivers/gpu/drm/mcde/mcde_drv.c               |  23 +-
>       drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  20 +-
>       drivers/gpu/drm/meson/meson_drv.c             |  21 +-
>       drivers/gpu/drm/msm/msm_drv.c                 |  46 +-
>       drivers/gpu/drm/omapdrm/dss/dss.c             |  17 +-
>       drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  20 +-
>       drivers/gpu/drm/sti/sti_drv.c                 |  20 +-
>       drivers/gpu/drm/sun4i/sun4i_drv.c             |  26 +-
>       drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  28 +-
>       drivers/gpu/drm/vc4/vc4_drv.c                 |  20 +-
>       drivers/gpu/drm/zte/zx_drm_drv.c              |  20 +-
>       drivers/iommu/mtk_iommu.c                     |  14 +-
>       drivers/iommu/mtk_iommu.h                     |   6 +-
>       drivers/iommu/mtk_iommu_v1.c                  |  14 +-
>       drivers/misc/mei/hdcp/mei_hdcp.c              |  22 +-
>       drivers/power/supply/ab8500_charger.c         |  22 +-
>       drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  20 +-
>       include/drm/drm_of.h                          |   9 +-
>       include/linux/component.h                     |  92 ++-
>       sound/hda/hdac_component.c                    |  21 +-
>       sound/soc/codecs/wcd938x.c                    |  20 +-
>       33 files changed, 780 insertions(+), 488 deletions(-)
> 
> 
>     base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
>     -- 
>     https://chromeos.dev <https://chromeos.dev>
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

