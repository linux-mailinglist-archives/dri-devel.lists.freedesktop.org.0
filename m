Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2265B3A4316
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 15:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC996E821;
	Fri, 11 Jun 2021 13:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B09CA6E821
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 13:34:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3B06D6E;
 Fri, 11 Jun 2021 06:34:19 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E50B3F93E;
 Fri, 11 Jun 2021 06:34:19 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 1DEA4684F49; Fri, 11 Jun 2021 14:34:18 +0100 (BST)
Date: Fri, 11 Jun 2021 14:34:18 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Alyssa Rosenzweig <alyssa@collabora.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210611133418.mwjabkd4zzcgekti@e110455-lin.cambridge.arm.com>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
 <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
 <YMNdZCkyaVoH+WAd@maud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YMNdZCkyaVoH+WAd@maud>
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Edmund Dea <edmund.j.dea@intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
 Melissa Wen <melissa.srw@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 Jonathan Corbet <corbet@lwn.net>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@linux.ie>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Noralf Tr??nnes <noralf@tronnes.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, NXP Linux Team <linux-imx@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Roland Scheidegger <sroland@vmware.com>,
 Shawn Guo <shawnguo@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Huang Rui <ray.huang@amd.com>,
 Yannick Fertr e <yannick.fertre@foss.st.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Qiang Yu <yuq825@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Christian K??nig <christian.koenig@amd.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 08:56:04AM -0400, Alyssa Rosenzweig wrote:
> > What I'm expected to see in the future is new functionality that gets implemented by
> > one hardware vendor and the kernel developers trying to enable that for userspace. It
> > could be that the new property is generic, but there is no way of testing that on
> > more than one implementation yet, so I'd say we are generous calling it "standard
> > property". When the second or third hardware vendor comes along and starts supporting
> > that property with their own set of extra requirements, then we can call it
> > "standard". Then comes the effort cost: would it be easier to start with a vendor
> > property that only the vendor needs to support (and can submit patches into the
> > compositors to do so) and when the standard property gets added moves to that, or
> > should we start with a generic property that gets implemented by the compositors
> > (maybe, but then only one vendor supports it) and then later when we actually
> > standardise the property we will have to carry backwards compatibility code in the
> > kernel to handle the old behaviour for old userspace? My proposal to Maxime was for
> > the former option to be reflected in the documentation, but I would like to hear your
> > thoughts.
> 
> Just my 2c - if the mainline kernel isn't willing to commit to a feature
> for upstream userspace to use, why does that feature belong in the
> kernel at all? I don't see much value in exposing hardware for the sake
> of exposing it when, practically, Linux userspace /can't/ use it as-is.
> 
> Might these vendor properties be used on downstream Android userspaces?
> That's not generally an upstream goal to support.

I think the assumption is that we are willing to commit to supporting a feature for
userspace, just that (I personally) lack the confidence that I will be getting the
feature right on the first attempt and using only one vendor hardware. And that
supporting potential mistakes I might've made in the first version is harder if the
feature was deemed "standard".

I'm talking from my experience with the writeback connector. We almost committed the
feature twice before more people chipped in and asked us for changes, but that was lucky.

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
