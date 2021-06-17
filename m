Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636FE3AB15E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 12:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E22E6E0FE;
	Thu, 17 Jun 2021 10:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686A96E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 10:30:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB289E7B;
 Thu, 17 Jun 2021 12:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1623925810;
 bh=coFIJKff4NSbExdgbwn6JmkoZpDOVtB4duNvu5LFPCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vx82oNrRDr2BVy/QcNJUcTQFlBoyO8kMH3Axvfsiby8kZfsjle5qXR/IhJSWqcTL4
 dUUQkYTKR/e8eCJAp6ZRgGD3HeUCouc9CqxE5Vl4GWZ2+UtC936hYdX4fZ3sgL38vB
 95Wd16fN0BTzTcNurGJEVbGr6zmhxBF/CRNi2RSE=
Date: Thu, 17 Jun 2021 13:29:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YMskHF8Bo/z3kqxf@pendragon.ideasonboard.com>
References: <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
 <20210614174912.15a49336@eldfell>
 <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
 <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
 <20210615100335.0b8f96d5@eldfell>
 <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
 <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
 <20210615131656.2ecefdc4@eldfell>
 <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
 <20210617102701.28f820b2@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210617102701.28f820b2@eldfell>
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
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
 Melissa Wen <melissa.srw@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
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
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Chen Feng <puck.chen@hisilicon.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Tian Tao <tiantao6@hisilicon.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Roland Scheidegger <sroland@vmware.com>,
 Shawn Guo <shawnguo@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Yannick Fertr e <yannick.fertre@foss.st.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Qiang Yu <yuq825@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On Thu, Jun 17, 2021 at 10:27:01AM +0300, Pekka Paalanen wrote:
> On Thu, 17 Jun 2021 00:05:24 +0300 Laurent Pinchart wrote:
> > On Tue, Jun 15, 2021 at 01:16:56PM +0300, Pekka Paalanen wrote:
> > > On Tue, 15 Jun 2021 12:45:57 +0300 Laurent Pinchart wrote:  
> > > > On Tue, Jun 15, 2021 at 07:15:18AM +0000, Simon Ser wrote:  
> > > > > On Tuesday, June 15th, 2021 at 09:03, Pekka Paalanen wrote:
> > > > >     
> > > > > > indeed it will, but what else could one do to test userspace KMS
> > > > > > clients in generic CI where all you can have is virtual hardware? Maybe
> > > > > > in the long run VKMS needs to loop back to a userspace daemon that
> > > > > > implements all the complex processing and returns the writeback result
> > > > > > via VKMS again? That daemon would then need a single upstream, like the
> > > > > > kernel, where it is maintained and correctness verified.    
> > > > > 
> > > > > The complex processing must be implemented even without write-back, because
> > > > > user-space can ask for CRCs of the CRTC.
> > > > >     
> > > > > > Or an LD_PRELOAD that hijacks all KMS ioctls and implements virtual
> > > > > > stuff in userspace? Didn't someone already have something like that?
> > > > > > It would need to be lifted to be a required part of kernel UAPI
> > > > > > submissions, I suppose like IGT is nowadays.    
> > > > > 
> > > > > FWIW, I have a mock libdrm [1] for libliftoff. This is nowhere near a full
> > > > > software implementation with write-back connectors, but allows to expose
> > > > > virtual planes and check atomic commits in CI.
> > > > > 
> > > > > [1]: https://github.com/emersion/libliftoff/blob/master/test/libdrm_mock.c
> > > > >     
> > > > > > For compositor developers like me knowing the exact formulas would be a huge
> > > > > > benefit as it would allow me to use KMS to off-load precision-sensitive
> > > > > > operations (e.g.  professional color management). Otherwise, compositors
> > > > > > probably need a switch: "high quality color management? Then do not use KMS
> > > > > > features."    
> > > > > 
> > > > > I think for alpha blending there are already rounding issues depending on the
> > > > > hardware. I wouldn't keep my hopes up for any guarantee that all hw uses the
> > > > > exact same formulae for color management stuff.    
> > > > 
> > > > Good, because otherwise you would be very quickly disappointed :-)
> > > > 
> > > > For scaling we would also need to replicate the exact same filter taps,
> > > > which are often not documented.  
> > > 
> > > That is where the documented tolerances come into play.  
> > 
> > This is something I've experimented with a while ago, when developing
> > automated tests for the rcar-du driver. When playing with different
> > input images we had to constantly increases tolerances, up to a point
> > where the tests started to miss real problems :-(
> 
> What should we infer from that? That the hardware is broken and
> exposing those KMS properties is a false promise?

No, just that the scaler doesn't document the internal hardware
implementation (number of taps in the filters, coefficients, rounding,
...). That's the rule, not the exception, and it doesn't prevent correct
operation, images get scaled in a reproducible way (the same input
produces the same output).

> If a driver on certain hardware cannot correctly implement a KMS
> property over the full domain of the input space, should that driver
> then simply not expose the KMS property at all?

The properties involved here would the the SRC and CRTC rectangles for
the planes. They don't document pixel-perfect scaling :-)

> But I would assume that the vendor still wants to expose the features
> in upstream kernels, yet they cannot use the standard KMS properties
> for that. Should the driver then expose vendor-specific properties with
> the disclaimer that the result is not always what one would expect, so
> that userspace written and tested explicitly for that hardware can
> still work?
> 
> That is, a sufficient justification for a vendor-specific KMS property
> would be that a standard property already exists, but the hardware is
> too buggy to make it work. IOW, give up trying to make sense.

It's not just about buggy hardware, it's also about implementation
specificities, such as rounding, filters, order of operations in the
color management pipeline (it's relatively easy when you only have two
LUTs and a CCM matrix, but if you through 3D LUTs and other tonemapping
features in the mix, not all hardware will implement the same pipeline),
or various types of image compression (this device implements a
"near-lossless" compression scheme that reduces the memory bandwidth by
50% for instance).

> I would like to move towards a direction where *hardware* design and
> testing is eventually guided by Linux KMS property definitions and
> their tests. If we could have a rule that if a driver cannot correctly
> implement a property then it must not expose the property, maybe in the
> long term that might start having an effect?

I didn't even know a 3D LUT existed before getting the datasheet for
this device. It's a long shot before the community will acquire enough
knowledge to guide hardware design, especially if you consider the
feature of tomorrow's devices that nobody knows about yet. A worthwhile
goal, but not something we can fully achieve, and not in a short time
frame.

> My underlying assumption is that generic userspace will not use
> vendor-specific properties.

I expect some amount of device-specific code in userspace, yes. 

There are usually large variations in how the hardware exposes access to
a given feature, which leads to code having to convert the standard API
parameters to hardware parameters. To a large extend this can be done in
drivers, but for some more complex features, it may put too much burden
on the kernel. There's a reason mesa is a userspace stack :-)

> Or, since we have atomic commits with TEST_ONLY, should it be driver's
> responsibility to carefully inspect the full state and reject the
> commit if the hardware is incapable of implementing it correctly?
> Vendor-specific userspace would know to avoid failing configurations to
> begin with. I suppose that might put an endless whack-a-mole game on
> drivers though.

-- 
Regards,

Laurent Pinchart
