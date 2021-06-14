Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7BE3A6BE6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 18:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69A189EB4;
	Mon, 14 Jun 2021 16:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730C789EB4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 16:34:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14907A59;
 Mon, 14 Jun 2021 18:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1623688447;
 bh=UKIwTyD5RcH44bxPzNS7r0HT9vteOXOzJ8qFkIQtlrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tWJfGaquOKakIOjTyuVvmLFHP6Y9tasW6/bd7yc0VEhybPlR9Q6w3zZQ6m/hI0wcf
 3HS0JzRXhxLjtskyt2H+ZQn0oap32Zy61M+ianE0W13IW0QT8j4w+YT7N4+EZ7yLqJ
 xc2H+OI4R2rqRVwuQtBr3B3jncHFTpmV2x2ldP1I=
Date: Mon, 14 Jun 2021 19:33:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
 <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
 <20210614174912.15a49336@eldfell>
 <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
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
 Hyun Kwon <hyun.kwon@xilinx.com>, NXP Linux Team <linux-imx@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Tian Tao <tiantao6@hisilicon.com>,
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

On Mon, Jun 14, 2021 at 04:24:13PM +0100, Liviu Dudau wrote:
> On Mon, Jun 14, 2021 at 05:49:12PM +0300, Pekka Paalanen wrote:
> > On Fri, 11 Jun 2021 13:03:09 +0100
> > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > 
> > > On Fri, Jun 11, 2021 at 08:14:59AM +0000, Simon Ser wrote:
> > > > On Thursday, June 10th, 2021 at 23:00, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >   
> > > > > If there's a strong consensus that we really need this then I'm not
> > > > > going to nack this, but this really needs a pile of acks from
> > > > > compositor folks that they're willing to live with the resulting
> > > > > fallout this will likely bring. Your cc list seems to have an absence
> > > > > of compositor folks, but instead every driver maintainer. That's
> > > > > backwards. We make uapi for userspace, not for kernel driver
> > > > > maintainers!  
> > > > 
> > > > In wlroots we have a policy of only allowing standard KMS properties to
> > > > be used. Any vendor-specific property is going to be less well-defined,
> > > > less widely useful, potentially have more design issues, potentially
> > > > overlap in functionality with other vendor-specific properties, likely
> > > > have some hardware-specific assumptions, etc.
> > > > 
> > > > What matters here is discussing with other driver & user-space folks to
> > > > make sure the new property's design is sound. Designing uAPI is hard.
> > > > 
> > > > If kernel folks are struggling with a user-space implementation, they
> > > > should discuss with user-space folks to see which project would be
> > > > interested. There's a chance a compositor will be interested in the new
> > > > property and will just do the user-space part for you, if not we can
> > > > suggest candidate projects.
> > > > 
> > > > tl;dr strong agree with Daniel here.  
> > > 
> > > I think the assumption you and Daniel are making is that the first implementation of
> > > a new KMS property can be made standard from day one and that it will work for any
> > > late comer driver as is, without having to make changes to its behaviour in a
> > > significant way. In my experience that is not the case.
> > > 
> > > I think we have moved from the times when we were trying to implement in the Linux
> > > world features that were available in the hardware but needed a kernel and userspace
> > > API. The set of properties that exist in KMS cover a lot of needed functionality and
> > > I don't expect to see new properties for stuff that is already supported by hardware.
> > > 
> > > What I'm expected to see in the future is new functionality that gets implemented by
> > > one hardware vendor and the kernel developers trying to enable that for userspace. It
> > > could be that the new property is generic, but there is no way of testing that on
> > > more than one implementation yet, so I'd say we are generous calling it "standard
> > > property". When the second or third hardware vendor comes along and starts supporting
> > > that property with their own set of extra requirements, then we can call it
> > > "standard".
> > 
> > I agree that is a problem with trying to make generic anything. But it
> > does not mean you should not even try. Maybe trying really hard saves a
> > couple revisions.
> 
> Agree.
> 
> > What I think should be planned for is revisions. How to add new
> > properties that do the same thing but better, while documenting that a
> > userspace KMS client can use only one revision at a time. You never
> > remove old revisions, unless maybe with a DRM client cap they
> > could disappear from that file description if that is necessary for
> > seeing the new revision.
> > 
> > While designing this, one also needs to take into account that KMS
> > clients need to be able to save and restore properties *they do not
> > understand*. So exposing two revisions of the same feature
> > simultaneously would break save/restore is that's an error.
> 
> I quite like the idea of having versions for properties.

It's an interesting idea. We'll need to consider bundles of properties
in that case I think, as in a v1 a feature could be implemented by
properties A, B and C, while in v2 C could be replaced by D and E
(beside A and B themselves also being changed in v2).

> > > Then comes the effort cost: would it be easier to start with a vendor
> > > property that only the vendor needs to support (and can submit patches into the
> > > compositors to do so) and when the standard property gets added moves to that, or
> > 
> > But you can't move, you can only add? You can't delete the old property
> > in kernel if it was ever released with a kernel and anyone used it. In
> > the same sentence you also imply that there is a user of it, so
> > removing it will break that user. Then you'll have to track the
> > userspace lifetime to figure out which decade you can try removing it.
> 
> Not that I am supporting the workflow, but I was trying to address the comments that
> vendors are going to push their own userspace implementation for their vendor
> properties. If that is the case, when they switch to the standard ones they can drop
> the support in userspace for their changes. With the implied assumption that you will
> have fewer vendor implementations hence easier to make changes, KMS properties can be
> deleted if you know there is no user of them (e.g. the vendor has upgraded all their
> software to the standard property).
> 
> > > should we start with a generic property that gets implemented by the compositors
> > > (maybe, but then only one vendor supports it) and then later when we actually
> > > standardise the property we will have to carry backwards compatibility code in the
> > > kernel to handle the old behaviour for old userspace? My proposal to Maxime was for
> > > the former option to be reflected in the documentation, but I would like to hear your
> > > thoughts.
> > 
> > You have to carry the backward compatibility in all cases, right?
> > 
> > Userspace OTOH can drop support for older less supported KMS properties
> > while taking advantage of a new revision. Userspace is not required to
> > support old kernels forever.
> > 
> > 
> > Here's a wild counter-proposal off a tangent:
> > 
> > How about we make "implemented in and testable with VKMS" the rule,
> > instead of "is generic" for new properties?
> > 
> > VKMS is what compositors (will) use in CI. I would feel hugely less bad
> > about using a property that only one hardware driver ever implements,
> > if also VKMS implements it in a way that compositor CI can observe it
> > working.
> > 
> > I don't expect this proposal to be accepted, but it's food for thought.
> > The major problem for compositor projects is testing as you usually
> > don't have the hardware, IMO. CI tends to not have any hardware.
> 
> While I don't dislike the proposal (I think it is quite sensible), I am worried that
> for some behaviours VKMS will implement them in a quirky way. To pick (again) the
> example of writeback, real hardware will have a way to tell if the buffer has been
> sent successfully to memory and it might take more than one refresh period, while
> VKMS (if I remember correctly) fakes it and signals the fence at the next vblank. If
> you code your compositor based on VKMS you might get unexpected artifacts on real
> hardware.

I'm also worried about properties that related to hardware processing of
frames, for instance related to colour spaces, or even scaling. VKMS has
a software composer implemented in the kernel, it may get fairly
complicated if we need to implement all kind of processing.

-- 
Regards,

Laurent Pinchart
