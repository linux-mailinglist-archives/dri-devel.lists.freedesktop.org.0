Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A075E3AC845
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 11:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE046E9CB;
	Fri, 18 Jun 2021 09:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB876E9CB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 09:59:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 223743E5;
 Fri, 18 Jun 2021 11:59:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624010352;
 bh=iiRT0PXW8Hdm55U2gJmg9vXi2YbZjOmAqg2jdbVkZ3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JpuR1ryzSJzYamcTRjTXUlnDjmaW0LPW74NIQQ+tzVR2MGyhINGEwnZecf3SoR/3k
 mBgrdCA3yAFzAquu8roYKYLAxq2oN138xFRE2sPu4TLyvoSKSWokxS9+BEMrokOiRy
 YfAMViaE3/BbZ7pHQ9wq4HQzwQPPeWC6oYpbrvZk=
Date: Fri, 18 Jun 2021 12:58:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YMxuWZWpmggDtvT9@pendragon.ideasonboard.com>
References: <20210615100335.0b8f96d5@eldfell>
 <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
 <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
 <20210615131656.2ecefdc4@eldfell>
 <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
 <20210617102701.28f820b2@eldfell>
 <YMskHF8Bo/z3kqxf@pendragon.ideasonboard.com>
 <20210617143311.19896458@eldfell>
 <YMtQClnvjGNDhn9q@pendragon.ideasonboard.com>
 <20210618115152.79af3537@erebos>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618115152.79af3537@erebos>
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

On Fri, Jun 18, 2021 at 11:55:38AM +0300, Pekka Paalanen wrote:
> On Thu, 17 Jun 2021 16:37:14 +0300 Laurent Pinchart wrote:
> > On Thu, Jun 17, 2021 at 02:33:11PM +0300, Pekka Paalanen wrote:
> > > On Thu, 17 Jun 2021 13:29:48 +0300 Laurent Pinchart wrote:  
> > > > On Thu, Jun 17, 2021 at 10:27:01AM +0300, Pekka Paalanen wrote:  
> > > > > On Thu, 17 Jun 2021 00:05:24 +0300 Laurent Pinchart wrote:    
> > > > > > On Tue, Jun 15, 2021 at 01:16:56PM +0300, Pekka Paalanen wrote:    
> 
> ...
> 
> > > > > > > That is where the documented tolerances come into play.      
> > > > > > 
> > > > > > This is something I've experimented with a while ago, when developing
> > > > > > automated tests for the rcar-du driver. When playing with different
> > > > > > input images we had to constantly increases tolerances, up to a point
> > > > > > where the tests started to miss real problems :-(    
> > > > > 
> > > > > What should we infer from that? That the hardware is broken and
> > > > > exposing those KMS properties is a false promise?    
> > > > 
> > > > No, just that the scaler doesn't document the internal hardware
> > > > implementation (number of taps in the filters, coefficients, rounding,
> > > > ...). That's the rule, not the exception, and it doesn't prevent correct
> > > > operation, images get scaled in a reproducible way (the same input
> > > > produces the same output).
> > > >   
> > > > > If a driver on certain hardware cannot correctly implement a KMS
> > > > > property over the full domain of the input space, should that driver
> > > > > then simply not expose the KMS property at all?    
> > > > 
> > > > The properties involved here would the the SRC and CRTC rectangles for
> > > > the planes. They don't document pixel-perfect scaling :-)
> > > >   
> > > > > But I would assume that the vendor still wants to expose the features
> > > > > in upstream kernels, yet they cannot use the standard KMS properties
> > > > > for that. Should the driver then expose vendor-specific properties with
> > > > > the disclaimer that the result is not always what one would expect, so
> > > > > that userspace written and tested explicitly for that hardware can
> > > > > still work?
> > > > > 
> > > > > That is, a sufficient justification for a vendor-specific KMS property
> > > > > would be that a standard property already exists, but the hardware is
> > > > > too buggy to make it work. IOW, give up trying to make sense.    
> > > > 
> > > > It's not just about buggy hardware, it's also about implementation
> > > > specificities, such as rounding, filters, order of operations in the
> > > > color management pipeline (it's relatively easy when you only have two
> > > > LUTs and a CCM matrix, but if you through 3D LUTs and other tonemapping
> > > > features in the mix, not all hardware will implement the same pipeline),
> > > > or various types of image compression (this device implements a
> > > > "near-lossless" compression scheme that reduces the memory bandwidth by
> > > > 50% for instance).  
> > > 
> > > Rounding shouldn't result in needing wide tolerances.
> > > 
> > > Filters are more difficult, but at least we can factor them out when
> > > testing other things. Filters could be tested in isolation with some
> > > image difference metrics rather than per-pixel independent comparisons.  
> > 
> > The metrics I was using had both a tolerance on the pixel value and on
> > the number of pixels accepted outside of the value tolerance. I'm sure
> > we can improve it (perhaps taking locality into account), but that's
> > heuristics, and keeping heuristics working across a wide variety of use
> > cases is hard.
> 
> Hi Laurent,
> 
> I was thinking of using a more, um, scientific error measures, e.g.
> sum or squared errors (SSE) or average SSE over the whole
> re-scaled/filtered image result, ignoring pixels outside of that.

There are quite a few matching algorithms implement in imagemagick, we
have tried them all, and they all suffered for the issue I initially
described; we had to push the thresholds high enough to avoid false
positives, and we then saw false negatives.

> What one normally uses when matching images in computer vision, for
> example. Could even add a threshold such that simple rounding-level
> errors would not even register in SSE. I'm sure there is plenty of
> literature on that, but it may be behind a paywall like IEEE.
> 
> SSE may or may not need to computed from light-linear pixel values,
> too. If one wanted to go even further, I'm sure there are computational
> models about human color and brightness difference sensitivity that
> could be used to weigh the errors.

This isn't about human perception, but about the ability to check if the
driver correctly configures the device :-) For driver testing, I don't
care if the colours look right or not if userspace misconfigures the
colour pipeline. What I need is to catch regressions when my driver
messes up the hardware configuration. This particular device processes
the images in stripes, and it's very easy for a stripe to be one pixel
off (or actually a fraction of a pixel when the scaler is involved).

Testing if a device correctly implements colour processing is of course
also useful, but is a distinct goal. Both need to be considered, when
stating requirements such as fully documented properties with a VKMS
software implementation and pixel-perfect tests in IGT.

> > The filter I mentioned, by the way, is the scaler filter. Out of
> > curiosity, do any of the devices you work on document with pixel-perfect
> > precision how the hardware scaler is implemented ?
> 
> I don't work on drivers, so wouldn't even look for hardware docs. I go
> by what KMS UAPI documents because that is the API I work with and
> nothing else. And yes, I ignore all the scaling filter issues for now.
> 
> Because I don't have a way to get feedback (writeback connectors maybe
> not existing and not hooked up in Weston quite yet), testing
> scaling/filtering precision has not been on-topic yet. Right now I'm
> interested in color correctness rather than geometrical filtering. For
> traditional color management, the expected pixel values are quite
> precise.
> 
> > > The order of operations in the color management pipeline is very
> > > important. We can't work with "whatever". All the variability in
> > > hardware is exactly why I have been calling out for defined abstract
> > > color pipeline in the DRM UAPI docs, so that drivers would know which
> > > properties to map to their elements, so that userspace can have any
> > > possibility of using them correctly. If the hardware has a block
> > > that doesn't fit in the abstract pipeline, you get to add things to the
> > > abstract pipeline, or invent a whole another abstract pipeline and
> > > document that.  
> > 
> > One very typical difference between devices is the order of the
> > processing blocks. By modelling the KMS pipeline as degamma -> ccm ->
> > gamma, we can accommodate hardware that have any combination of
> > [1-2] * 1D LUTs + 1 * CCM. Now, throw one 3D LUT into the mix, at
> 
> But you cannot represent pipelines like
> 1D LUT -> 1D LUT -> CCM
> because the abstract pipeline just doesn't have the elements for that.
> OTOH, maybe that ordering does not even make sense to have in hardware?
> So maybe not all combinations are actually needed.

If userspace wanted such a pipeline (I'm not sure why it would), then it
could just combine the two LUTs in one.

> > different points in the pipeline depending on the device, and it will
> > start getting complicated, even if the use case is quite simple and
> > common. This is getting a bit out of topic, but how would you solve this
> > one in particular ?
> 
> By defining all the points in the abstract color pipeline where a 3D
> LUT could exist. Then each point would probably need its own KMS
> property.

And when we'll add the next object ? This can't scale I'm afraid. You'll
have a spec that tells you that things can be in any order, and may well
be able to expose the order to userspace, but you won't be able to
implement a generic userspace that makes use of it.

BTW, if we want to expose a finer-grained topology of processing blocks,
I'd recommend looking at the Media Controller API, it was designed just
for that purpose.

> We already have the KMS pipeline exactly as degamma -> ctm -> gamma and
> drivers need to respect that order.
> 
> If the combinatorial explosion gets out of hand, maybe we need a KMS
> property to switch to whole another abstract pipeline which defines a
> different ordering on the same and/or different KMS properties.
> 
> From what I've learnt recently, if you have a 3D LUT, you want a 1D LUT
> on each side of it for memory vs. precision optimization. And after the
> degamma -> ctm -> gamma pipeline you may want one more ctm for
> RGB-to-YCbCr conversion. So I have hope that the abstract pipeline with
> all actually implemented hardware features might not go totally out of
> hand.

On the output of the CRTC, I have, in this order

- RGB to YUV conversion (can only use presets for BT.601 and BT.709, with
  limited or full range)
- 3D LUT
- 1D LUT
- YUV to RGB conversion (presets only)

The RGB to YUV and YUV to RGB conversions can be bypassed. That's it.

There's also a histogram engine, to allow implementation of dynamic
gamma correction. This would require userspace to read the histogram
data for every frame, and update the LUTs accordingly.

> > > Lossy compression needs its own KMS properties to ensure it can be
> > > disabled when necessary. Near-lossless is not lossless, if a difference
> > > can be measured. The driver or hardware cannot guess if the end user is
> > > ok with "near-lossless" or not, so you have to be conservative and
> > > assume not ok, offering an opt-in for lossy.  
> > 
> > Sure, but what would be the barrier to entry for such a property that
> > would enable the compression (it could actually be a pixel format
> > modifier) ? Would it only need to be documented ? Would we need a
> > software implementation in VKMS and/or in IGT ? The compression
> > algorithm is proprietary and not documented, so the latter can't be
> > done.
> 
> Good questions. Shows that the idea of strictly requiring a VKMS
> implementation won't fly, which is what I expected.
> 
> Saying it could be a pixel format modifier is a really good point. A
> modifier cannot be the only thing to control it. Userspace does not
> decode modifiers, so it cannot filter it out when it wants lossless
> pixels. There must be something else to control it.

The hardware implementation is such that the decompression is
implemented ahead of the display DMA engine, which means that it depends
on how the framebuffer memory is mapped. The display controller itself
isn't aware of the compression. The driver needs to map framebuffers to
the device through a specific memory window to decompress them.

> As a userspace dev, I would be ok with documenting a KMS property as
> "improves blah blah, but also does significant violence to your
> pixels", so I would know that this is something I need to consider.
> 
> You could argue that all KMS properties do violence to pixels, but
> that's not a useful definition. It would just mean that in some use
> cases I would never off-load anything to KMS. Depending on the use case
> that might still be true even if the errors were limited to reasonable
> rounding errors. I need an idea of how much error does KMS processing
> do, and ultimately I expect compositors to also need a last resort
> button for "do not trust KMS processing at all" which then makes the
> display server always use the exact same simplest possible KMS
> configuration and let the end user deal with the KMS errors via
> color-profiling his monitor.

I really think we'll end up needing device-specific userspace
components. Given the example above, with histogram calculation and
dynamic gamma correction, there's no way we'll be able to have a single
userspace implementation that would support these kind of features for
all devices. It doesn't have to be solved now, but we probably want to
start thinking about an API to plug device-specific components in
compositors. This is the kind of problem that the libcamera project is
tackling on the camera side, I believe a similar approach will be needed
for displays too.

> It's quite a different thing to have color processing elements in an
> unexpected order in the pipeline than it is to have a scaling filter
> doing slightly unknown operations.

That I agree with, those are two different issues. We all have our cross
to bear :-)

> > > ...
> > >   
> > > > > My underlying assumption is that generic userspace will not use
> > > > > vendor-specific properties.    
> > > > 
> > > > I expect some amount of device-specific code in userspace, yes.   
> > > 
> > > If we had a reliable way to test device-specific code without the
> > > hardware and automatically in CI, then maybe.
> > >   
> > > > There are usually large variations in how the hardware exposes access to
> > > > a given feature, which leads to code having to convert the standard API
> > > > parameters to hardware parameters. To a large extend this can be done in
> > > > drivers, but for some more complex features, it may put too much burden
> > > > on the kernel. There's a reason mesa is a userspace stack :-)  
> > > 
> > > If we get a Khronos standardised 2D composition API... oh wait.
> > > 
> > > Nothing wrong with userspace libraries, but it does mean that driver
> > > developers need to contribute to them, like they do to Mesa. Is there
> > > any of that going on for KMS?  
> > 
> > Not that I'm aware of, but I think that's a direction we can consider
> > seriously.
> 
> That would be awesome if the API is generic.
> 
> > > In the mean time, DRM UAPI basically must define a 2D composition API,
> > > or the new KMS properties will not see use outside of vendor trees.

-- 
Regards,

Laurent Pinchart
