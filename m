Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC213A3DDF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 10:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF4F6EE48;
	Fri, 11 Jun 2021 08:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0406EE48
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 08:15:06 +0000 (UTC)
Date: Fri, 11 Jun 2021 08:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623399303;
 bh=LXrQUMsq4zcmYpPR/J5q0e+ciaGERkxMWGdrR9hM6tk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=kVMSxOyOs8TOhI8W65hcCQhveG8YX+BcfbWqtHQTA73WRuOo230rSfTwC184RAX9p
 ndnBnNK/H4eAkIMrlzQPnkP/EgFrbrt7kFTjGo9Buod5H8wcOa4hkuBe2Jwk+2x84z
 yX7gNwq2695WOS2KKv1ddsmiHvX9wgaySUjwTGvPh1/s8gVaYFPpNXGNShPcoAYSc+
 XRagAqfd946FnrUjFpVmYXPC8sn2/Jw5otjsajpEp636FKgGJa5UG6KJdeYghJxN6y
 hMe4/eH8auB3L4I/pA+6+oAdTmXcIt8MQFlTZX+KFSdo9Wt1PeHyNph6RSBeLWYs0O
 UWGinWICE8EtA==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
In-Reply-To: <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Edmund Dea <edmund.j.dea@intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Melissa Wen <melissa.srw@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Steven Price <steven.price@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Qiang Yu <yuq825@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Ben Skeggs <bskeggs@redhat.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Roland Scheidegger <sroland@vmware.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 Paul Cercueil <paul@crapouillou.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Huang Rui <ray.huang@amd.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Robert Foss <robert.foss@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, June 10th, 2021 at 23:00, Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:

> If there's a strong consensus that we really need this then I'm not
> going to nack this, but this really needs a pile of acks from
> compositor folks that they're willing to live with the resulting
> fallout this will likely bring. Your cc list seems to have an absence
> of compositor folks, but instead every driver maintainer. That's
> backwards. We make uapi for userspace, not for kernel driver
> maintainers!

In wlroots we have a policy of only allowing standard KMS properties to
be used. Any vendor-specific property is going to be less well-defined,
less widely useful, potentially have more design issues, potentially
overlap in functionality with other vendor-specific properties, likely
have some hardware-specific assumptions, etc.

What matters here is discussing with other driver & user-space folks to
make sure the new property's design is sound. Designing uAPI is hard.

If kernel folks are struggling with a user-space implementation, they
should discuss with user-space folks to see which project would be
interested. There's a chance a compositor will be interested in the new
property and will just do the user-space part for you, if not we can
suggest candidate projects.

tl;dr strong agree with Daniel here.
