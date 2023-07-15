Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E458755C90
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 09:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709D010E1EB;
	Mon, 17 Jul 2023 07:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1270B10E154
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 20:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=JxBhhYK0Y5VT2HXGIOu9TJojogxR36dmFxRFhj6IWCk=;
 b=EVElt5TCflzYgiRrmN27f0ZK5MwnAlXBDddOCHg6/OVohDn42qAtgNTo5OfcLdzxWG2SRBFfTehox
 xNOBoSfNDJzs3G7hNViFJKi/eWgcZSc8XjfH227Fu8qgxnV8T/L9k2kbIA0TZQokuWJ+ry5L7uGt3S
 eDRotSkr5oRNdgzxdg7YaiwxS1dKxGLKWYbj3gEJyCEtA+CikK6SwC793O4AA7oPFy3WliBjXaujiN
 jIW5IRtD7dVIQTKWn5fuE38KmwgPMYpkppyDRBcw0Lj664vpEaR8bSW8fFgvBrj4JprqbJ9guXY0Cs
 zK0jiHS5+p6sj2f0nA1gLqEzVUOMj3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=JxBhhYK0Y5VT2HXGIOu9TJojogxR36dmFxRFhj6IWCk=;
 b=Z/37LrNNgkFmoRmOnuPWeSyBJ3zkNDMuzDj4yl37D//Yx8vlrZ1t4ZtvhEx9F98EMcvKO2OmDB7Cz
 mpB1B+iCw==
X-HalOne-ID: da40b60a-234c-11ee-b5d0-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id da40b60a-234c-11ee-b5d0-99461c6a3fe8;
 Sat, 15 Jul 2023 20:19:11 +0000 (UTC)
Date: Sat, 15 Jul 2023 22:19:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm: Explicitly include correct DT includes
Message-ID: <20230715201908.GA321950@ravnborg.org>
References: <20230714174545.4056287-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714174545.4056287-1-robh@kernel.org>
X-Mailman-Approved-At: Mon, 17 Jul 2023 07:17:38 +0000
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
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, etnaviv@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Ondrej Jirman <megi@xff.cz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Icenowy Zheng <icenowy@aosc.io>, freedreno@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>, lima@lists.freedesktop.org,
 Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Liu Ying <victor.liu@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Fri, Jul 14, 2023 at 11:45:34AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
