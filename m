Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA73704658
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8041F10E30B;
	Tue, 16 May 2023 07:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDEA10E15F;
 Mon, 15 May 2023 07:51:36 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9659443fb56so1940914966b.2; 
 Mon, 15 May 2023 00:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684137094; x=1686729094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cfDqT6X1hpnQXZe1MRUmzHPyHIv4YDADYndQ1imD+oM=;
 b=QEzBGKrSjRdyzYe6ieOdJODPeNUdYdnBUcfXpn0/moCF5bU4GDKao8GZRQQbw0ScSj
 hEalhWz2jHazrnbym08knKa0kriRSwPike6V7qFdb0SYkq5ZdsbY7DsO7FPGWFcQZc4I
 yx7v9MO0EFs1BsS1BzlrMU/49f38+CFEbN6cwavsTi/YNhpLd6/f7T/SGEGYx3nr8Hyq
 96GIg2iw6p9BedFsBmDM+AKZnAYeClMxXQ4dl34JgRS9vWkoZvXTodDnKACwzKvENSpl
 oGu3By0XqyO1n0TJjlvlzyTkzr2Q3JL9FS6JcHCYIaNwZPRY3PgIiLlR3XqzyirohV+9
 19TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684137094; x=1686729094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cfDqT6X1hpnQXZe1MRUmzHPyHIv4YDADYndQ1imD+oM=;
 b=dazo6CPwxuBxz2bUJxhE5lU01GVbkDiERxwjjUIih3rmYo1f5hsa3YmPeJm72RGjMT
 DPkcH/fiRCWHzaGcDevSptkCukZkxLHhL7d1Zy5Z6uHAKu13BzDMXSSWK56H9w/vWZXB
 MKxKU3bA3EM5ibZveQxu/qgbXd1Cc7QJoh/sDvsVoxDDX8+ZIkBlwdcK3aHQm0C4i5ZR
 RqXiFVZxr4EipgtOAyJBF4JcNWTr6qVsbDsCBe9aLHdN9/4spy1lSq1D1vCJLtzYoOzT
 kNuk7S00KZHkPByoTP+VfuegCZJQm18/Z1wWx8bTqo9aDdh4KS/dsWygyO/CBbfXclE0
 oy1w==
X-Gm-Message-State: AC+VfDyY82OX6GUSwkiSGQxJq5TdZ6SpO1oPXaoyH3yFh49Gq/hbKoFn
 SqLn0YgrWxDcC+Ltiz/cwbJTYBoqdPxrZfn0gxI=
X-Google-Smtp-Source: ACHHUZ73K81XIZGLByuufDfxqMz465SRmfWrwBUtXlzEFG2IITIGcj/PIpOa0fmbOAVOCPKBAxevZY68jzd4AtlbsQg=
X-Received: by 2002:a17:907:7211:b0:96b:4ed5:a1c9 with SMTP id
 dr17-20020a170907721100b0096b4ed5a1c9mr1098991ejc.51.1684137093827; Mon, 15
 May 2023 00:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 15 May 2023 16:50:57 +0900
Message-ID: <CAAQKjZP5jhwFg9sNndpa6_7G6HoV76heQbt=knoOEZZskexrhg@mail.gmail.com>
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback returning
 void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 16 May 2023 07:27:39 +0000
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Joel@pengutronix.de,
 Robert Foss <rfoss@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, Miaoqian Lin <linmq006@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Rahul T R <r-ravikumar@ti.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alain Volmat <alain.volmat@foss.st.com>, linux-mips@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, John Stultz <jstultz@google.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Yuan Can <yuancan@huawei.com>, Michal Simek <michal.simek@xilinx.com>,
 linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>,
 nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Guo Zhengkui <guozhengkui@vivo.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Liu Shixin <liushixin2@huawei.com>, Tomi Valkeinen <tomba@kernel.org>,
 Deepak R Varma <drv@mailo.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 James@pengutronix.de, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, Jayshri Pawar <jpawar@cadence.com>,
 Jonas Karlman <jonas@kwiboo.se>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

2023=EB=85=84 5=EC=9B=94 8=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 1:32, Uw=
e Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:
>
> Hello,
>
> this patch series adapts the platform drivers below drivers/gpu/drm
> to use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because

First of all, I apologize for the delay in providing my review comments.

Not related to this patch but seems that the "remove_new" callback
naming implicitly implies that there is no need to return anything
since its return type is void. To help users understand the intended
behavior based on the callback name, how about considering a modified
naming convention like "remove_no_return" or something similar?

The relevant patch has already been merged as outlined below,
author Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> 2022-12-09
16:09:14 +0100
committer Greg Kroah-Hartman <gregkh@linuxfoundation.org> 2023-01-17
19:04:17 +0100
commit 5c5a7680e67ba6fbbb5f4d79fa41485450c1985c (patch)
tree 0b6dbc003a6bb4a3f7fb084d31326bbfa3ba3f7c
parent 7bbb89b420d9e290cb34864832de8fcdf2c140dc (diff)
download linux-5c5a7680e67ba6fbbb5f4d79fa41485450c1985c.tar.gz
platform: Provide a remove callback that returns no value

Maybe a trivial thing but how about renaming it? I think the postfix,
'new', is a very generic word. I think you could introduce another
patch for it if you think it's reasonable.

Thanks,
Inki Dae

> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak.
>
> By changing the remove callback to return void driver authors cannot
> reasonably (but wrongly) assume any more that there happens some kind of
> cleanup later.
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (53):
>   drm/komeda: Convert to platform remove callback returning void
>   drm/arm/hdlcd: Convert to platform remove callback returning void
>   drm/arm/malidp: Convert to platform remove callback returning void
>   drm/armada: Convert to platform remove callback returning void
>   drm/aspeed: Convert to platform remove callback returning void
>   drm/atmel-hlcdc: Convert to platform remove callback returning void
>   drm/bridge: cdns-dsi: Convert to platform remove callback returning
>     void
>   drm/bridge: display-connector: Convert to platform remove callback
>     returning void
>   drm/bridge: fsl-ldb: Convert to platform remove callback returning
>     void
>   drm/imx/imx8*: Convert to platform remove callback returning void
>   drm/bridge: lvds-codec: Convert to platform remove callback returning
>     void
>   drm/bridge: nwl-dsi: Convert to platform remove callback returning
>     void
>   drm/bridge: simple-bridge: Convert to platform remove callback
>     returning void
>   drm/bridge: synopsys: Convert to platform remove callback returning
>     void
>   drm/bridge: thc63lvd1024: Convert to platform remove callback
>     returning void
>   drm/bridge: tfp410: Convert to platform remove callback returning void
>   drm/etnaviv: Convert to platform remove callback returning void
>   drm/exynos: Convert to platform remove callback returning void
>   drm/fsl-dcu: Convert to platform remove callback returning void
>   drm/hisilicon: Convert to platform remove callback returning void
>   drm/imx/dcss: Convert to platform remove callback returning void
>   drm/imx/ipuv3: Convert to platform remove callback returning void
>   drm/ingenic: Convert to platform remove callback returning void
>   drm/kmb: Convert to platform remove callback returning void
>   drm/lima: Convert to platform remove callback returning void
>   drm/logicvc: Convert to platform remove callback returning void
>   drm/mcde: Convert to platform remove callback returning void
>   drm/mediatek: Convert to platform remove callback returning void
>   drm/mediatek: Convert to platform remove callback returning void
>   drm/meson: Convert to platform remove callback returning void
>   drm/msm: Convert to platform remove callback returning void
>   drm/mxsfb: Convert to platform remove callback returning void
>   drm/nouveau: Convert to platform remove callback returning void
>   drm/omap: Convert to platform remove callback returning void
>   drm/panel: Convert to platform remove callback returning void
>   drm/panfrost: Convert to platform remove callback returning void
>   drm/rcar-du: Convert to platform remove callback returning void
>   drm/rockchip: Convert to platform remove callback returning void
>   drm/shmobile: Convert to platform remove callback returning void
>   drm/sprd: Convert to platform remove callback returning void
>   drm/sti: Convert to platform remove callback returning void
>   drm/stm: Convert to platform remove callback returning void
>   drm/sun4i: Convert to platform remove callback returning void
>   drm/tegra: Convert to platform remove callback returning void
>   drm/tests: helpers: Convert to platform remove callback returning void
>   drm/tidss: Convert to platform remove callback returning void
>   drm/tilcdc: Convert to platform remove callback returning void
>   drm/tiny: Convert to platform remove callback returning void
>   drm/tiny: Convert to platform remove callback returning void
>   drm/tve200: Convert to platform remove callback returning void
>   drm/v3d: Convert to platform remove callback returning void
>   drm/vc4: Convert to platform remove callback returning void
>   drm/xlnx/zynqmp_dpsub: Convert to platform remove callback returning
>     void
>
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c     | 5 ++---
>  drivers/gpu/drm/arm/hdlcd_drv.c                     | 5 ++---
>  drivers/gpu/drm/arm/malidp_drv.c                    | 5 ++---
>  drivers/gpu/drm/armada/armada_crtc.c                | 5 ++---
>  drivers/gpu/drm/armada/armada_drv.c                 | 5 ++---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c             | 6 ++----
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c        | 6 ++----
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c      | 6 ++----
>  drivers/gpu/drm/bridge/display-connector.c          | 6 ++----
>  drivers/gpu/drm/bridge/fsl-ldb.c                    | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c         | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c        | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        | 6 ++----
>  drivers/gpu/drm/bridge/lvds-codec.c                 | 6 ++----
>  drivers/gpu/drm/bridge/nwl-dsi.c                    | 5 ++---
>  drivers/gpu/drm/bridge/simple-bridge.c              | 6 ++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 6 ++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c       | 6 ++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c  | 6 ++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 6 ++----
>  drivers/gpu/drm/bridge/thc63lvd1024.c               | 6 ++----
>  drivers/gpu/drm/bridge/ti-tfp410.c                  | 6 ++----
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c               | 6 ++----
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c               | 5 ++---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c       | 6 ++----
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c          | 6 ++----
>  drivers/gpu/drm/exynos/exynos_dp.c                  | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_drv.c             | 5 ++---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c             | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c            | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c            | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c             | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c             | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_mic.c             | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c         | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c          | 6 ++----
>  drivers/gpu/drm/exynos/exynos_hdmi.c                | 6 ++----
>  drivers/gpu/drm/exynos/exynos_mixer.c               | 6 ++----
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c           | 6 ++----
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c        | 6 ++----
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c     | 5 ++---
>  drivers/gpu/drm/imx/dcss/dcss-drv.c                 | 6 ++----
>  drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c             | 6 ++----
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c            | 5 ++---
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c                 | 5 ++---
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c                 | 5 ++---
>  drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c              | 5 ++---
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c        | 6 ++----
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c           | 6 ++----
>  drivers/gpu/drm/ingenic/ingenic-ipu.c               | 5 ++---
>  drivers/gpu/drm/kmb/kmb_drv.c                       | 5 ++---
>  drivers/gpu/drm/lima/lima_drv.c                     | 5 ++---
>  drivers/gpu/drm/logicvc/logicvc_drm.c               | 6 ++----
>  drivers/gpu/drm/mcde/mcde_drv.c                     | 6 ++----
>  drivers/gpu/drm/mcde/mcde_dsi.c                     | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_cec.c                  | 5 ++---
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c             | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c           | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_disp_color.c           | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c           | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c           | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c             | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c            | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_dp.c                   | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_dpi.c                  | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c              | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_dsi.c                  | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                 | 5 ++---
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c             | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c             | 5 ++---
>  drivers/gpu/drm/meson/meson_drv.c                   | 6 ++----
>  drivers/gpu/drm/meson/meson_dw_hdmi.c               | 6 ++----
>  drivers/gpu/drm/msm/adreno/adreno_device.c          | 5 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c             | 6 ++----
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c            | 6 ++----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c            | 5 ++---
>  drivers/gpu/drm/msm/dp/dp_display.c                 | 6 ++----
>  drivers/gpu/drm/msm/dsi/dsi.c                       | 6 ++----
>  drivers/gpu/drm/msm/hdmi/hdmi.c                     | 6 ++----
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c                 | 6 ++----
>  drivers/gpu/drm/msm/msm_drv.c                       | 6 ++----
>  drivers/gpu/drm/msm/msm_mdss.c                      | 6 ++----
>  drivers/gpu/drm/mxsfb/lcdif_drv.c                   | 6 ++----
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c                   | 6 ++----
>  drivers/gpu/drm/nouveau/nouveau_platform.c          | 5 ++---
>  drivers/gpu/drm/omapdrm/dss/dispc.c                 | 5 ++---
>  drivers/gpu/drm/omapdrm/dss/dsi.c                   | 6 ++----
>  drivers/gpu/drm/omapdrm/dss/dss.c                   | 6 ++----
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                 | 5 ++---
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                 | 5 ++---
>  drivers/gpu/drm/omapdrm/dss/venc.c                  | 5 ++---
>  drivers/gpu/drm/omapdrm/omap_dmm_tiler.c            | 9 +++------
>  drivers/gpu/drm/omapdrm/omap_drv.c                  | 6 ++----
>  drivers/gpu/drm/panel/panel-lvds.c                  | 6 ++----
>  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c         | 6 ++----
>  drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c     | 6 ++----
>  drivers/gpu/drm/panel/panel-simple.c                | 6 ++----
>  drivers/gpu/drm/panfrost/panfrost_drv.c             | 5 ++---
>  drivers/gpu/drm/rcar-du/rcar_cmm.c                  | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c               | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c              | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                 | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c             | 6 ++----
>  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c            | 6 ++----
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c     | 6 ++----
>  drivers/gpu/drm/rockchip/cdn-dp-core.c              | 6 ++----
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c     | 6 ++----
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c         | 6 ++----
>  drivers/gpu/drm/rockchip/inno_hdmi.c                | 6 ++----
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c              | 6 ++----
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c         | 6 ++----
>  drivers/gpu/drm/rockchip/rockchip_lvds.c            | 6 ++----
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c        | 6 ++----
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c         | 6 ++----
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c            | 6 ++----
>  drivers/gpu/drm/sprd/sprd_dpu.c                     | 6 ++----
>  drivers/gpu/drm/sprd/sprd_drm.c                     | 5 ++---
>  drivers/gpu/drm/sprd/sprd_dsi.c                     | 6 ++----
>  drivers/gpu/drm/sti/sti_compositor.c                | 5 ++---
>  drivers/gpu/drm/sti/sti_drv.c                       | 6 ++----
>  drivers/gpu/drm/sti/sti_dvo.c                       | 5 ++---
>  drivers/gpu/drm/sti/sti_hda.c                       | 5 ++---
>  drivers/gpu/drm/sti/sti_hdmi.c                      | 6 ++----
>  drivers/gpu/drm/sti/sti_hqvdp.c                     | 5 ++---
>  drivers/gpu/drm/sti/sti_tvout.c                     | 5 ++---
>  drivers/gpu/drm/stm/drv.c                           | 6 ++----
>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c               | 6 ++----
>  drivers/gpu/drm/sun4i/sun4i_backend.c               | 6 ++----
>  drivers/gpu/drm/sun4i/sun4i_drv.c                   | 6 ++----
>  drivers/gpu/drm/sun4i/sun4i_frontend.c              | 6 ++----
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c              | 6 ++----
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                  | 6 ++----
>  drivers/gpu/drm/sun4i/sun4i_tv.c                    | 6 ++----
>  drivers/gpu/drm/sun4i/sun6i_drc.c                   | 6 ++----
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c              | 6 ++----
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c               | 6 ++----
>  drivers/gpu/drm/sun4i/sun8i_mixer.c                 | 6 ++----
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c              | 6 ++----
>  drivers/gpu/drm/tegra/dpaux.c                       | 6 ++----
>  drivers/gpu/drm/tests/drm_kunit_helpers.c           | 5 ++---
>  drivers/gpu/drm/tidss/tidss_drv.c                   | 6 ++----
>  drivers/gpu/drm/tilcdc/tilcdc_panel.c               | 6 ++----
>  drivers/gpu/drm/tiny/arcpgu.c                       | 6 ++----
>  drivers/gpu/drm/tiny/ofdrm.c                        | 6 ++----
>  drivers/gpu/drm/tiny/simpledrm.c                    | 6 ++----
>  drivers/gpu/drm/tve200/tve200_drv.c                 | 6 ++----
>  drivers/gpu/drm/v3d/v3d_drv.c                       | 6 ++----
>  drivers/gpu/drm/vc4/vc4_crtc.c                      | 5 ++---
>  drivers/gpu/drm/vc4/vc4_dpi.c                       | 5 ++---
>  drivers/gpu/drm/vc4/vc4_drv.c                       | 6 ++----
>  drivers/gpu/drm/vc4/vc4_dsi.c                       | 6 ++----
>  drivers/gpu/drm/vc4/vc4_hdmi.c                      | 5 ++---
>  drivers/gpu/drm/vc4/vc4_hvs.c                       | 5 ++---
>  drivers/gpu/drm/vc4/vc4_txp.c                       | 5 ++---
>  drivers/gpu/drm/vc4/vc4_v3d.c                       | 5 ++---
>  drivers/gpu/drm/vc4/vc4_vec.c                       | 5 ++---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c                 | 6 ++----
>  159 files changed, 319 insertions(+), 597 deletions(-)
>
>
> base-commit: 457391b0380335d5e9a5babdec90ac53928b23b4
> --
> 2.39.2
>
