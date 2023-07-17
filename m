Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F2A75754E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 09:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486A010E2D9;
	Tue, 18 Jul 2023 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B8810E26C;
 Mon, 17 Jul 2023 14:27:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 404EA61129;
 Mon, 17 Jul 2023 14:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0D6C433B6;
 Mon, 17 Jul 2023 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689604065;
 bh=rkLKjJGA9W9V1hgJstWBCmZrxpmjuvUsbHV5ieMMp8c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tbqM5G1Bre2zBYNYlSaGpYvtGMUIHymVMKeK/TzG0KjBzCmaAHwEaXmM+fnWr8QHf
 A5IwGR12akMgYWcxzwUULBkB0mekTRl4kMKQRSfx+pzkXO2wU5OR+OPuWWdNpyb/9Y
 27H/XVZnsbuLv2tvpMFxcyKcBrfhw24Ct3Dtn6k2jIwf9fiUxfMZRE5qGgbeygcQZ2
 vy5S/pTq31758S5Um6WTDPfgsWL212q22eKGrybewvdX7t97Q3XcLfmDw1+8j8e8ow
 KnsnOeGJcjyYNIZVOv3JTTaB9YED46K0NRnfA2+aAkAVdCs2rPfSquk+go0eGVrLFe
 3iKfcFajgoGdg==
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-317009c0f9aso1243516f8f.0; 
 Mon, 17 Jul 2023 07:27:45 -0700 (PDT)
X-Gm-Message-State: ABy/qLbQRa6/HHEoT9rlRYrWrwROOOpSRuHecjG/I8O28uVvMdxxvWEV
 hS3M0K39nuM2WtPkLf8xDQkYKEkn5ATwEerEog==
X-Google-Smtp-Source: APBJJlFSY1EKmbumZhe1Fkfe0qsodiNyBdGN/d2gmlGF1ZwWgImoQ1RpodF7t1ooNJHJiRju6eg8DIGKKeloqUgo0eo=
X-Received: by 2002:a2e:8945:0:b0:2b9:48f1:b195 with SMTP id
 b5-20020a2e8945000000b002b948f1b195mr576527ljk.44.1689604043579; Mon, 17 Jul
 2023 07:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174545.4056287-1-robh@kernel.org>
 <114500369.nniJfEyVGO@phil>
In-Reply-To: <114500369.nniJfEyVGO@phil>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 08:27:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
Message-ID: <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
Subject: Re: [PATCH] drm: Explicitly include correct DT includes
To: Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 18 Jul 2023 07:28:04 +0000
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
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, etnaviv@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Ondrej Jirman <megi@xff.cz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Icenowy Zheng <icenowy@aosc.io>, freedreno@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>, lima@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Liu Ying <victor.liu@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Alain Volmat <alain.volmat@foss.st.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-rpi-kernel@lists.infradead.org,
 Tian Tao <tiantao6@hisilicon.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Orson Zhai <orsonzhai@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, xen-devel@lists.xenproject.org,
 Tomi Valkeinen <tomba@kernel.org>, linux-sunxi@lists.linux.dev,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 John Stultz <jstultz@google.com>, Shawn Guo <shawnguo@kernel.org>,
 Ondrej Jirman <megous@megous.com>, linux-stm32@st-md-mailman.stormreply.com,
 Emma Anholt <emma@anholt.net>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Paul Cercueil <paul@crapouillou.net>,
 Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org,
 Artur Weber <aweber.kernel@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Purism Kernel Team <kernel@puri.sm>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 16, 2023 at 3:26=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> Am Freitag, 14. Juli 2023, 19:45:34 CEST schrieb Rob Herring:
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
>
> [...]
>
> > diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/=
gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > index 917e79951aac..2744d8f4a6fa 100644
> > --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > @@ -12,7 +12,9 @@
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
>
> I'm not sure if I'm just misreading something, but in all other places
> of_device.h gets removed while here is stays as an include. Is this
> correct this way?

Yes, because of_match_device() is used.

Rob
