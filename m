Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80C5008BB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 10:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69C310F24F;
	Thu, 14 Apr 2022 08:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2F410F24F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 08:50:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3680332021A2;
 Thu, 14 Apr 2022 04:50:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 14 Apr 2022 04:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1649926223; x=1650012623; bh=4Y+8/2uD1Y
 tYRl+58dKMeVsJagqKJpfyVF7oil0g2YM=; b=SIkFmEG2CQVxGeY3OoI6O16PQc
 pVwOq1jTuora+mm5Cc4C4rPGWXY7/XnWlNioZOgqdRvIoHSYLaPzn0R38uiQg4aL
 wGGFfBGntaedbGtAw/waKBCiTUxCe9Mto5bkr+lFY3/XUOiR7mKxXJlh9ju70Mb+
 m75jiY/V9U26EYxqGASyNudaKa9lUibShk/9Vd+dvI5qyocH9BVmM6YL/eK9CxRQ
 srJDD/iAl4cq8WkIizOU6oFxvvZr8xwYW79tb2LkI6/b1p0SUEDp6FWUtakGFq1G
 R/YlVUGLU2i0Suy/6vr+2n+ka/F79eC4IgO8gBwlQ4MqJ5i2AGfyoOFSyttw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1649926223; x=
 1650012623; bh=4Y+8/2uD1YtYRl+58dKMeVsJagqKJpfyVF7oil0g2YM=; b=e
 tNZjnTjsC7yx0JTglNtx8nwQkzOrAWUqObC+QkCI7GIYXICPps0bnR6BRJcLh5wF
 zbFrkqVvUHeAP8lX55sH9RqLf12BFRYjAZU2/1clnyxZwRvqbXxbO/2kQ+05yQak
 Sq8GqcmrH6jMH4XbpCT6HN9/7WOnpn0NOsHtHNDWPgLYzW6WqEoxvgglnKyAC12H
 QVefW0vj3AKnwGNWBRC/jUX/GUMfZGy9NxLBwUZ4xGjzQbuJ03K/rLefL7Pst1it
 lDGj/jphdhnqJr/Z2JfeLQhR3XSj1roxfgbjGRYHJ0T98B0VF60f+FnvjUYj+yH1
 noD0kWjsOvxTQBGt7dQMg==
X-ME-Sender: <xms:TeBXYtz_JlfVXijmwS4yt0sOM2r6-86aLydLQjCf3Kg1tLweRWYy8A>
 <xme:TeBXYtS0QBT_C_yF8lySF6C0I3W4ZEzl18gFun7rDpVmRXkvlPxPxhr_u7CruTvKe
 9mRtBgMmqSx7BFXiFc>
X-ME-Received: <xmr:TeBXYnXO00Rrao8VhUuiq8ZCmT_CrkiDUT1pV4Dp5Nvb1umBszlVCLMpIf52eio6FqSixpaHtQNPiYvogeYIzLGjlY3jILfv4ojFfOI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelfedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TeBXYvhxa6jAGwWMpR119D-jocIBvJfm8X9DG9OHHgErt0vXlfQxrw>
 <xmx:TeBXYvAaCJvbtlFPVc7hickbCnX4bhmhXHSAWDHTQTOj2oUx0pwyvw>
 <xmx:TeBXYoK0zcBnh4dmjhEugNIGumHwDI9-9_KHgtrhiVhtcbeeDubgAg>
 <xmx:T-BXYhw4RflmNs4IxO-QU7iGCtafpljCvnVFg6t3Iy9MgSBqXlyVuw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Apr 2022 04:50:20 -0400 (EDT)
Date: Thu, 14 Apr 2022 10:50:18 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 00/16] drm/rockchip: Rockchip EBC ("E-Book
 Controller") display driver
Message-ID: <20220414085018.ayjvscgdkoen5nw5@houat>
References: <20220413221916.50995-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3cdzwf66iytxiuuf"
Content-Disposition: inline
In-Reply-To: <20220413221916.50995-1-samuel@sholland.org>
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
Cc: David Airlie <airlied@linux.ie>, =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Andreas Kemnade <andreas@kemnade.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Alistair Francis <alistair@alistair23.me>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3cdzwf66iytxiuuf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2022 at 05:19:00PM -0500, Samuel Holland wrote:
> This series adds a DRM driver for the electrophoretic display controller
> found in a few different Rockchip SoCs, specifically the RK3566/RK3568
> variant[0] used by the PineNote tablet[1].
>=20
> This is my first real involvement with the DRM subsystem, so please let
> me know where I am misunderstanding things.
>=20
> This is now the second SoC-integrated EPD controller with a DRM driver
> submission -- the first one being the i.MX6 EPDC[2]. I want to thank
> Andreas for sending that series, and for his advice while writing this
> driver.
>=20
> One goal I have with sending this series is to discuss how to support
> EPDs more generally within the DRM subsystem, so the interfaces with
> panels and PMICs and waveform LUTs can be controller-independent.
>=20
> My understanding is that the i.MX6 EPDC series is at least partly based
> on the downstream vendor driver. This driver is a clean-sheet design for
> hardware with different (read: fewer) capabilities, so we took some
> different design paths, but we ran into many of the same sharp edges.
>=20
> Here are some of the areas I would like input on:
>=20
> Panel Lifecycle
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Panels use prepare/unprepare callbacks for their power supply. EPDs
> should only be powered up when the display contents are changed. Should
> the controller call both drm_panel_(un)prepare during each atomic update
> when the framebuffer is dirty?
>=20
> Similarly, panel enable/disable callbacks are tied to backlight state.
> For an EPD, it makes sense to have the backlight enabled while the panel
> is powered down (because the contents are static). Is it acceptable to
> call drm_panel_{en,dis}able while the panel is not prepared?
>=20
> With panel_bridge, the "normal" callback ordering is enforced, and tied
> to the atomic state, so neither of these is possible.
>=20
> As a result, neither the backlight nor the voltage regulators are tied
> to the panel. The panel's regulators are consumed by the EBC itself.

At least to manage the power state, that looks fairly similar to what we
have already to enter / exit from panel self refresh, so maybe we can
leverage that infrastructure?

And thus we would have something like enabling the backlight when we
prepare the panel, but only enable / disable the regulator when we exit
/ enter PSR mode?

Would that make sense?

> Panel Timing Parameters
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> EPDs have more timing parameters than LCDs, and there are several
> different ways of labeling these parameters. See for example the timing
> diagrams on pp. 2237-2239 of the RK3568 TRM[0], the descriptions in the
> ED103TC2 panel datasheet[3], and the submitted EPDC bindings[2].
>=20
> Both the EPDC and EBC vendor drivers put all of the timing parameters in
> the controller's OF node. There is no panel device/node.
>=20
> I was able to squeeze everything needed for my specific case into a
> struct drm_display_mode (see patches 5 and 14), but I don't know if this
> is an acceptable use of those fields, or if will work with other
> controllers. Is adding more fields to drm_display_mode an option?
>=20
> See also the discussion of "dumb" LCD TCONs below.

Reading that datasheet and patch series, it's not clear to me whether
it's just a set of generic parameters for E-ink display, or if it's some
hardware specific representation of those timings.

Generally speaking, drm_display_mode is an approximation of what the
timings are. The exact clock rate for example will be widely different
between RGB, HDMI or MIPI-DSI (with or without burst). I think that as
long as you can derive a drm_display_mode from those parameters, and can
infer those parameters from a drm_display_mode, you can definitely reuse
it.

> Panel Connector Type / Media Bus Format
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The EBC supports either an 8-bit or 16-bit wide data bus, where each
> pair of data lines represents the source driver polarity (positive,
> negative, or neutral) for a pixel.
>=20
> The only effect of the data bus width is the number of pixels that are
> transferred per clock cycle. It has no impact on the number of possible
> grayscale levels.
>=20
> How does that translate to DRM_MODE_CONNECTOR_* or MEDIA_BUS_FMT_*?

We'll probably want a separate connector mode, but you could add a
parameter on the OF-graph endpoint to set the media bus format.

> Panel Reflection
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The ED103TC2 panel scans from right to left. Currently, there is no API
> or OF property to represent this. I can add something similar to
> drm_panel_orientation.

Yeah, leveraging DRM_MODE_REFLECT_X into something similar to
drm_panel_orientation makes sense

> Should this be exposed to userspace? It is acceptable for the kernel
> driver to flip the image when blitting from the framebuffer?

I'm not sure about whether or not we should expose it to userspace. I'd
say yes, but I'll leave it to others :)

> CRTC "active" and "enabled" states
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> What do these states mean in the context of an EPD? Currently, the
> driver ignores "active" and clears the screen to solid white when the
> CRTC is disabled.
>=20
> The vendor drivers can switch to a user-provided image when the CRTC is
> disabled. Is this something that can/should be supported upstream? If
> so, how? Would userspace provide the image to the kernel, or just tell
> the kernel not to clear the screen?

I think the semantics are that whenever the CRTC is disabled, the panel
is expected to be blank.

Leaving an image on after it's been disabled would have a bunch of
side-effects we probably don't want. For example, let's assume we have
that support, an application sets a "disabled image" and quits. Should
we leave the content on? If so, for how long exactly?

Either way, this is likely to be doable with PSR as well, so I think
it's a bit out of scope of this series for now.

> VBLANK Events and Asynchronous Commits
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> When should the VBLANK event complete? When the pixels have been blitted
> to the kernel's shadow buffer? When the first frame of the waveform is
> sent to the panel? When the last frame is sent to the panel?
>=20
> Currently, the driver is taking the first option, letting
> drm_atomic_helper_fake_vblank() send the VBLANK event without waiting on
> the refresh thread. This is the only way I was able to get good
> performance with existing userspace.

I've been having the same kind of discussions in private lately, so I'm
interested by the answer as well :)

It would be worth looking into the SPI/I2C panels for this, since it's
basically the same case.

> Waveform Loading
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Waveform files are calibrated for each batch of panels. So while a
> single waveform file may be "good enough" for all panels of a certain
> model, the correctly-calibrated file will have better image quality.
>=20
> I don't know of a good way to choose the calibrated file. Even the
> board's compatible string may not be specific enough, if the board is
> manufactured with multiple batches of panels.
>=20
> Maybe the filename should just be the panel compatible, and the user is
> responsible for putting the right file there? In that case, how should I
> get the compatible string from the panel_bridge? Traverse the OF graph
> myself?

It's not really clear to me what panel_bridge has to do with it? I'm
assuming that file has to be uploaded some way or another to the
encoder?

If so, yeah, you should just follow through the OF-graph and use the
panel compatible. We have a similar case already with panel-mipi-dbi
(even though it's standalone)

> There is also the issue that different controllers need the waveform
> data in different formats. ".wbf" appears to be the format provided by
> PVI/eInk, the panel manufacturer. The Rockchip EBC hardware expects a
> single waveform in a flat array, so the driver has to extract/decompress
> that from the .wbf file (this is done in patch 1). On the other hand,
> the i.MX EPDC expects a ".wrf" file containing multiple waveforms[8].
>=20
> I propose that the waveform file on disk should always be what was
> shipped with the panel -- the .wbf file -- and any extracting or
> reformatting is done in the kernel.

Any kind of parsing in the kernel from a file you have no control over
always irks me :)

Why and how are those files different in the first place?

> Waveform Selection From Userspace
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> EPDs use different waveforms for different purposes: high-quality
> grayscale vs. monochrome text vs. dithered monochrome video. How can
> userspace select which waveform to use? Should this be a plane property?
>
> It is also likely that userspace will want to use different waveforms at
> the same time for different parts of the screen, for example a fast
> monochrome waveform for the drawing area of a note-taking app, but a
> grayscale waveform for surrounding UI and window manager.
>=20
> I believe the i.MX6 EPDC supports multiple planes, each with their own
> waveform choice. That seems like a good abstraction,

I agree

> but the EBC only supports one plane in hardware. So using this
> abstraction with the EBC would require blending pixels and doing
> waveform lookups in software.

Not really? You'd have a single plane available, with only one waveform
pick for that plane?

> Blitting/Blending in Software
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> There are multiple layers to this topic (pun slightly intended):
>  1) Today's userspace does not expect a grayscale framebuffer.
>     Currently, the driver advertises XRGB8888 and converts to Y4
>     in software. This seems to match other drivers (e.g. repaper).
>
>  2) Ignoring what userspace "wants", the closest existing format is
>     DRM_FORMAT_R8. Geert sent a series[4] adding DRM_FORMAT_R1 through
>     DRM_FORMAT_R4 (patch 9), which I believe are the "correct" formats
>     to use.
>=20
>  3) The RK356x SoCs have an "RGA" hardware block that can do the
>     RGB-to-grayscale conversion, and also RGB-to-dithered-monochrome
>     which is needed for animation/video. Currently this is exposed with
>     a V4L2 platform driver. Can this be inserted into the pipeline in a
>     way that is transparent to userspace? Or must some userspace library
>     be responsible for setting up the RGA =3D> EBC pipeline?

I'm very interested in this answer as well :)

I think the current consensus is that it's up to userspace to set this
up though.

>  4) Supporting multiple planes (for multiple concurrent waveforms)
>     implies blending in software. Is that acceptable?
>=20
>  5) Thoughts on SIMD-optimized blitting and waveform lookup functions?
>=20
>  5) Currently the driver uses kmalloc() and dma_sync_single_for_device()
>     for its buffers, because it needs both fast reads and fast writes to
>     several of them. Maybe cma_alloc() or dma_alloc_from_contiguous()
>     would be more appropriate, but I don't see any drivers using those
>     directly.

cma_alloc isn't meant to be used directly by drivers anyway, one of the
main reason being that CMA might not be available (or desirable) in the
first place on the platform the code will run.

The most common option would be dma_alloc_coherent. It often means that
the buffer will be mapped non-cacheable, so it kills the access
performances. So it completely depends on your access patterns whether
it makes sense in your driver or not. kmalloc + dma_sync_single or
dma_map_single is also a valid option.

> EPDs connected to "dumb" LCD TCONs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This topic is mostly related to my first patch. Some boards exist that
> hook up an EPD to a normal LCD TCON, not a dedicated EPD controller. For
> example, there's the reMarkable 2[5] and some PocketBook models[6][7].
>=20
> I have some concerns about this:
>  1) If we put EPD panel timings in panel drivers (e.g. panel-simple),
>     can the same timings work with LCD TCONs and EPD controllers?

I'll think we'll need a separate panel driver for this anyway

>     For example: one cycle of the 16-bit data bus is "one pixel" to an
>     LCD controller, but is "8 pixels" to an EPD controller. So there is
>     a factor-of-8 difference in horizontal resolution depending on your
>     perspective. Should we have the "number of pixel clock cycles" or
>     "number of pixels" in .hdisplay/.htotal in the panel timings?
>=20
>     Patch 14 adds a panel with "number of pixels" horizontal resolution,
>     so the correct resolution is reported to userspace, but the existing
>     eink_vb3300_kca_timing in panel-simple.c appears to use "number of
>     pixel clocks" for its horizontal resolution. This makes the panel
>     timing definitions incompatible across controllers.
>=20
>  2) Using fbdev/fbcon with an EPD hooked up to an LCD TCON will have
>     unintended consequences, and possibly damage the panel. Currently,
>     there is no way to mark the framebuffer as expecting "source driver
>     polarity waveforms" and not pixel data. Is there a specific
>     DRM_FORMAT_* we should use for these cases to prevent accidental use
>     by userspace?
>=20
>     Or should we disallow this entirely, and have some wrapper layer to
>     do the waveform lookups in kernelspace?
>=20
>     I like the wrapper layer idea because it allows normal userspace and
>     fbcon to work. It would not be much new code, especially since this
>     driver already supports doing the whole pipeline in software. So
>     that's why I wrote a separate helper library; I hope this code can
>     be reused.

If exposing the panel as a KMS connector can damage the display, I don't
think we should expose it at all. Even a property or something won't
work, because older applications won't know about that property and will
try to use it anyway.

So whatever the solution is, it can't be "you have to know that this
device is special, or else...". The default, trivial, case where an
application just comes up and tries to display something should somewhat
work (even if it might be a bit absurd, like ignoring non_desktop)

Maxime

--3cdzwf66iytxiuuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlfgSgAKCRDj7w1vZxhR
xdhbAQDVkafK4wDsEuAHd71/DbRRF+PtVnfeho42KWv9fkF4kAD/SpcQgdAiCgmq
gaYbMgDMtjsJPiJelmJkMJUi5um01Ak=
=pyuo
-----END PGP SIGNATURE-----

--3cdzwf66iytxiuuf--
