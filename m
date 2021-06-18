Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6313ACAB5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 14:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9526E9F8;
	Fri, 18 Jun 2021 12:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152BC6E9F8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 12:19:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E60C3F0;
 Fri, 18 Jun 2021 14:19:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624018778;
 bh=HPD5ZoGlWdOIECxj10GgGh2v+JP4odXwRHXa6St/N4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EeUYubsGe4S9W/vAmID3xcMVOplCuiOYs7kvcPteBLS/vAVIJcp08lh3hHw5er+rG
 LLRQldZX+3NaoZb+fy2LdZ1z75uo5VIrPf/4gnAWTQjeWDhoBtIjqbK1EHc+olxNy1
 bGVToRBGVhmHOdKMBHCg6ngvk9XUojenka7SLkkM=
Date: Fri, 18 Jun 2021 15:19:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YMyPQ/gLspPGn/zg@pendragon.ideasonboard.com>
References: <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
 <20210615131656.2ecefdc4@eldfell>
 <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
 <20210617102701.28f820b2@eldfell>
 <YMskHF8Bo/z3kqxf@pendragon.ideasonboard.com>
 <20210617143311.19896458@eldfell>
 <YMtQClnvjGNDhn9q@pendragon.ideasonboard.com>
 <20210618115152.79af3537@erebos>
 <YMxuWZWpmggDtvT9@pendragon.ideasonboard.com>
 <20210618143200.7e145f95@erebos>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618143200.7e145f95@erebos>
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

On Fri, Jun 18, 2021 at 02:32:00PM +0300, Pekka Paalanen wrote:
> On Fri, 18 Jun 2021 12:58:49 +0300 Laurent Pinchart wrote:
> > On Fri, Jun 18, 2021 at 11:55:38AM +0300, Pekka Paalanen wrote:
> > > On Thu, 17 Jun 2021 16:37:14 +0300 Laurent Pinchart wrote:  
> > > > On Thu, Jun 17, 2021 at 02:33:11PM +0300, Pekka Paalanen wrote:  
> > > > > On Thu, 17 Jun 2021 13:29:48 +0300 Laurent Pinchart wrote:    
> > > > > > On Thu, Jun 17, 2021 at 10:27:01AM +0300, Pekka Paalanen wrote:    
> > > > > > > On Thu, 17 Jun 2021 00:05:24 +0300 Laurent Pinchart wrote:      
> > > > > > > > On Tue, Jun 15, 2021 at 01:16:56PM +0300, Pekka Paalanen wrote:      
> 
> ...
> 
> > This isn't about human perception, but about the ability to check if the
> > driver correctly configures the device :-) For driver testing, I don't
> > care if the colours look right or not if userspace misconfigures the
> > colour pipeline. What I need is to catch regressions when my driver
> > messes up the hardware configuration. This particular device processes
> > the images in stripes, and it's very easy for a stripe to be one pixel
> > off (or actually a fraction of a pixel when the scaler is involved).
> > 
> > Testing if a device correctly implements colour processing is of course
> > also useful, but is a distinct goal. Both need to be considered, when
> > stating requirements such as fully documented properties with a VKMS
> > software implementation and pixel-perfect tests in IGT.
> 
> Right. Your driver testing requirements are different. You know how your
> hardware works, so you can build your tests to suit.
> 
> What this thread is about is KMS UAPI, and verifying that a KMS
> implementation matches the KMS UAPI specification. The UAPI
> specification is the only thing I can look at when writing userspace.
> As a userspace and compositor developer, I am specifically concerned
> about how humans will perceive the final image.

Yes, the thread has gone in a few different directions.

> If you use your hardware-specific tests to ensure that your driver
> programs the hardware correctly, and IGT tests ensure that the KMS UAPI
> is implemented to the KMS UAPI spec, then I would hope that everything
> is fine. By reading the KMS UAPI spec I can decide to use or not use
> specific KMS features.
> 
> ...in an ideal world.

I wish I knew where that world was ;-)

I do agree with you though, you need predictability in userspace,
otherwise it's quite useless (or not very useful). This brings back many
memories (so unfortunately not too distant) with cameras. No latter than
yesterday, I heard from a person with lots of involvement in GPU API
design that GPUs seem easy compared to cameras. Hopefully this means
we'll be able to solve this on the display side :-)

> > > > One very typical difference between devices is the order of the
> > > > processing blocks. By modelling the KMS pipeline as degamma -> ccm ->
> > > > gamma, we can accommodate hardware that have any combination of
> > > > [1-2] * 1D LUTs + 1 * CCM. Now, throw one 3D LUT into the mix, at  
> > > 
> > > But you cannot represent pipelines like
> > > 1D LUT -> 1D LUT -> CCM
> > > because the abstract pipeline just doesn't have the elements for that.
> > > OTOH, maybe that ordering does not even make sense to have in hardware?
> > > So maybe not all combinations are actually needed.  
> > 
> > If userspace wanted such a pipeline (I'm not sure why it would), then it
> > could just combine the two LUTs in one.
> 
> Maybe? You can also combine the 1D LUTs into the 3D LUT in the
> middle, too, but the result is not generally the same as using them
> separately when the 3D LUT size is limited.

Yes, my 3D LUT has 17 points, I've heard about LUTs up to 33 points
(with bilinear interpolation), that's quite little if used as a 1D LUT.
There's also the fact that interpolation will result in cross-talk
between the three colour channels.

> > > > different points in the pipeline depending on the device, and it will
> > > > start getting complicated, even if the use case is quite simple and
> > > > common. This is getting a bit out of topic, but how would you solve this
> > > > one in particular ?  
> > > 
> > > By defining all the points in the abstract color pipeline where a 3D
> > > LUT could exist. Then each point would probably need its own KMS
> > > property.  
> > 
> > And when we'll add the next object ? This can't scale I'm afraid. You'll
> > have a spec that tells you that things can be in any order, and may well
> > be able to expose the order to userspace, but you won't be able to
> > implement a generic userspace that makes use of it.
> 
> Are you saying that generic userspace cannot happen? On top of KMS
> UAPI, that is.
> 
> Why would a generic userspace library API be a more feasible effort?

I'll make a parallel with the camera world again, because I think
display hardware is taking a similar path, just later.

We used to have capture devices that offered a fairly high-level
interface at the hardware or firmware level, with a set of features that
were more or less standard. Devices could be exposed with an abstract
model, as done in KMS today, with a set of standardized controls (V4L2
uses the word control when KMS uses property). We had way less automated
testing, and didn't enough attention to consistency of the userspace API
(we're talking about code from the beginning of the century, if not
earlier, the world was different), so different drivers were not
consistent in how the API was implemented (for instance the API didn't
specify gain units, so drivers would use different units), but more or
less, you could write a standard V4L2 application that would work with
most devices, with a few quirks here and there.

Then the world changed. Cameras become more complex, with the raw sensor
and the ISP exposed to Linux in the OMAP3 that Nokia used in the N900
and N9 phones. For a while we tried to stick with V4L2, and implement
ISP control within the kernel, with the help of a userspace daemon
behind the scenes to which the kernel driver called back. The daemon was
required, as control of the camera required complicated computation that
really benefited from floating point math. It was horrible, and the
daemon was closed-source, but from an application point of view, it was
still high-level V4L2 as before. This hit a big wall though, to expose a
high-level API on top of a low-level hardware interface, we had to
bridge the gap in the kernel. This meant hardcoding use cases on the
kernel side, which clearly wouldn't scale, as not everybody had the same
use cases (an industrial vision application and a smartphone camera
application really don't see the world the same way).  We were facing a
dead end.

We then decided to expose a lower-level API from kernel to userspace,
giving userspace the ability to control everything. That's how the Media
Controller API was born (its purpose is to expose the internal topology
of the device as a graph of connected entities, that's about it), as
well as the V4L2 subdev userspace API (in KMS term, that would mean more
or less exposing DRM bridges to userspace, with the ability to control
them individually). This simplified the kernel implementation (no more
hardcoded use cases, no more daemon behind the scenes), but at the same
time resulted in an API that wasn't a good fit for applications to
consume directly. One step closer to the hardware, one step further from
the user. You can think of this as the API exposed by GPU kernel
drivers, it's not enough, a userspace component to translate to a
higher-level API is needed.

This was followed by 10 years of limbo as Nokia pulled the plug from
Linux (and then smartphone) development. Fast forward, at the end of
2018, we created libcamera as the mesa of the camera world to solve this
issue. It offers a standard camera stack with a high-level API, where
device-specific code can be added (and kept to the minimum, as a
centralized framework means we can share code that is common between
devices).

I see lots of parallel with display pipelines getting more complex. It
wouldn't be fair to expose a very low-level API and ask every single
compositor to know about all the devices out there, but at the same
time, we're reaching a level of hardware complexity that I believe makes
it a dead end to try to abstract and standardize everything at the
kernel level. This doesn't mean we should allow all vendors to throw in
any kind of crappy properties or other API extensions, we can still
enforce some ground rules, such as proper documentation, reasonable
effort for standardization, and reference open-source userspace
implementation in a project we would consider to be the equalivant of
mesa for KMS.

> > BTW, if we want to expose a finer-grained topology of processing blocks,
> > I'd recommend looking at the Media Controller API, it was designed just
> > for that purpose.
> 
> Sure. However, right now we have KMS properties instead. Or maybe they
> should just go all unused?
> 
> Maybe the rule should be to not add any more KMS properties and tell
> people to design something completely new based on Media Controller API
> instead?

No, I think that would be too harsh, my point was that if we want to
expose how the building blocks are layed out, the MC API is meant to
expose a graph of connected entities, so it's a good match. Controlling
the device should still go through KMS properties I believe.

> I've never looked at Media Controller API, so I have no idea how it
> would suit display servers.
> 
> I very much think that I cannot use processing blocks exposed by
> KMS if I cannot have guarantees that they work the same across all
> Linux drivers.
>
> > > We already have the KMS pipeline exactly as degamma -> ctm -> gamma and
> > > drivers need to respect that order.
> > > 
> > > If the combinatorial explosion gets out of hand, maybe we need a KMS
> > > property to switch to whole another abstract pipeline which defines a
> > > different ordering on the same and/or different KMS properties.
> > > 
> > > From what I've learnt recently, if you have a 3D LUT, you want a 1D LUT
> > > on each side of it for memory vs. precision optimization. And after the
> > > degamma -> ctm -> gamma pipeline you may want one more ctm for
> > > RGB-to-YCbCr conversion. So I have hope that the abstract pipeline with
> > > all actually implemented hardware features might not go totally out of
> > > hand.  
> > 
> > On the output of the CRTC, I have, in this order
> > 
> > - RGB to YUV conversion (can only use presets for BT.601 and BT.709, with
> >   limited or full range)
> > - 3D LUT
> > - 1D LUT
> > - YUV to RGB conversion (presets only)
> > 
> > The RGB to YUV and YUV to RGB conversions can be bypassed. That's it.
> > 
> > There's also a histogram engine, to allow implementation of dynamic
> > gamma correction. This would require userspace to read the histogram
> > data for every frame, and update the LUTs accordingly.
> 
> Interesting, but almost none of that would be used by the color
> management pipeline model I'm familiar with. I wonder what kind of use
> cases doing LUTs in YUV have been designed for, and *after* blending,
> even.

I'm afraid I can't tell as I don't know. This reaches the limit of my
display colour management knowledge.

> ...
> 
> > I really think we'll end up needing device-specific userspace
> > components. Given the example above, with histogram calculation and
> > dynamic gamma correction, there's no way we'll be able to have a single
> > userspace implementation that would support these kind of features for
> > all devices. It doesn't have to be solved now, but we probably want to
> > start thinking about an API to plug device-specific components in
> > compositors. This is the kind of problem that the libcamera project is
> > tackling on the camera side, I believe a similar approach will be needed
> > for displays too.
> 
> To be able to plug device-specific components in compositors, we need a
> driver-agnostic API through which compositors can use those device
> specific components. Still the same problem, now just in userspace than
> at the UAPI level.

Agreed, it pushes the problem to a different place :-) I however think
it may be easier to solve it in userspace, as it's a better place to
hardcode use cases. A general-purpose compositor may not want to make
use of all hardware features, while a specific-purpose compositor may
want to exercise the hardware features differently. This however opens
the door to introducing badly-designed and un(der-)documented
properties, which is not something I want, so we would still need to set
ground rules, such as documentation and reference implementation in a
given userspace compositor/stack.

On that note, I think we need to do a bit more hand-holding. I'm sitting
on a patch series that is several years old to add 3D LUT support to my
driver, and while I believe I'm quite experienced with KMS development,
adding support for this in a reference compositor in userspace is a
really big task that I don't know how to tackle. I also know very little
about colour management, and have nobody in the team who has that
knowledge and could help me. I'm thus facing a bit of a dead-end, not
because I don't want to spend the time required for this, but because
the bar is so high that I just can't do it. I would expect many
developers to be facing the same challenges. If the community doesn't
make an effort in fostering collaboration between developers (most
kernel developers won't even know who to ask for help if they have to
step out of the kernel to userspace) and providing good documentation,
we'll just scare developers away. It took me weeks to figure out how to
run Weston on this device, as it has no GPU that I can use, and falling
back to a software compositor required finding out that lots of
documentation is outdated and referenced command line options that were
not accurate anymore (or I could mention painfully finding out that an
issue I was blocked with for days was solved by plugging in a USB mouse
to the board, as Weston didn't want to start without an input device).
Another developer from my team tried before me and gave up, thinking it
was impossible. That's the reality that many kernel developers are
facing, the same way I suppose than me saying saying "you just need to
recompile the kernel with this option enabled" is not very helpful for
lots of userspace developers.

-- 
Regards,

Laurent Pinchart
