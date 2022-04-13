Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F20A50019C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0934810F131;
	Wed, 13 Apr 2022 22:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048BB10F12E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6EF305C0206;
 Wed, 13 Apr 2022 18:19:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 13 Apr 2022 18:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1649888361; x=1649974761; bh=4F4QQcRRlZ
 YIapkRQlPgm4sk3ZuAy/xWtrj9YKjirkk=; b=bTgG6D3xrOI/dfximJqr+91MVV
 BVDLw0BMyy751BtrVRDifb9KpzEdPdgvvE9fLi/9nP0ktnC0mqh6HsogGGXBUA30
 mNAvztlI6P6pThTXTJKYIKSPuFZAIspnFym6mixQ3sawzFwkes65p015j3qe146k
 8TGJdTF9FHI2Wo3nsyAK5DmgWduk7TaFFWuguTmz8RaMLOWBuDJpCkgcuyfkPTcB
 G9lJ6ze7HL2bZWoxDLTrEfi+ansS5w3x/SHHmhiBqvNSMoNEbUV8tfakdWfxmKWc
 M0FLWcHl9usJ9GFr5wEaTdv91y4o9AStr8wMqo4meI4MGkD8pAWwxHP+6xsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1649888361; x=1649974761; bh=4F4QQcRRlZYIapkRQlPgm4sk3ZuAy/xWtrj
 9YKjirkk=; b=smGwbZcHNNEfrS/26hB4cnIIHyqucdHAzQYPqf9H9wYuC8Sx9bS
 WZr1bMr2BoFR6MF39o8QAgmWJ4KdqRRuOYcdIM5g3y0dqg8GDe62LeYgJHe2Lp9m
 NH7EoRMdAJzGjE0oA3S8MVpBAzMzT11QgEd9StzyMugRDrOnmwZ7bbBV4MA6YI8u
 IXIcIhIocdIhX4KrGVNcbm2EyZ5PMxlDov+ubu2rLTNCEj9KI1zQfhDWxh68HAf2
 nKTokjSkAp9zht9pk7U21BNr9wQ9R6c1S30SqD4gMTK9e/OCdmOdK9FbaKns5szn
 5RLnHTsHGdQWwClZmxyLKAs2BJgkQXsZxtQ==
X-ME-Sender: <xms:ZkxXYnzVoxmfSX2kbH8wxD4vk0H3W69g49j2BB2UO6dxJN8lWztfdg>
 <xme:ZkxXYvRp1boIS5iHfDYSjbvwGcN8wV7Ltw9mL9qbAmXi6KkzGQdWh6pYXGGXvqyr6
 4is5PlBqg-3Dh3oLQ>
X-ME-Received: <xmr:ZkxXYhWtX4auHsGeTEpvl8pWiIoJm-QNvE43jUhoPEg_DyM3Ro_rFzGaAMRaEPEMq-aN1G9zjLJfhx0lXsE9KSTTVeW05KJLnM4Oj9NjQEMnvjr7IYwMlTG0CFjHw8Qnld96QQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepjeettddvfeffudelveegteffieetgfffveevveevvddvgeelieekgedv
 geehleeunecuffhomhgrihhnpehrrggugigrrdgtohhmpdhpihhnvgeigedrohhrghdpkh
 gvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
 hg
X-ME-Proxy: <xmx:ZkxXYhj8fDaZr8o-SjjJxNhQ8ly6kduf5_OyeqwgYC4HusBopFqJIQ>
 <xmx:ZkxXYpCqGPBwebJ_Qk7FAJraWnCbCkCS4DqaCVE_T39lJWPiCRh_sg>
 <xmx:ZkxXYqKbZAEbQ_yEQxlE1BtL_zD53JMEiBdrY5Fa-4KgP_71_IxXTQ>
 <xmx:aUxXYuxjenUhZrV7WTTJJ6yXWcunMDmW65mJx9JzPxDJPjS5Ejfk1g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:17 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 00/16] drm/rockchip: Rockchip EBC ("E-Book Controller")
 display driver
Date: Wed, 13 Apr 2022 17:19:00 -0500
Message-Id: <20220413221916.50995-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ond=C5=99ej=20Jirman?= <x@xff.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Andreas Kemnade <andreas@kemnade.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds a DRM driver for the electrophoretic display controller
found in a few different Rockchip SoCs, specifically the RK3566/RK3568
variant[0] used by the PineNote tablet[1].

This is my first real involvement with the DRM subsystem, so please let
me know where I am misunderstanding things.

This is now the second SoC-integrated EPD controller with a DRM driver
submission -- the first one being the i.MX6 EPDC[2]. I want to thank
Andreas for sending that series, and for his advice while writing this
driver.

One goal I have with sending this series is to discuss how to support
EPDs more generally within the DRM subsystem, so the interfaces with
panels and PMICs and waveform LUTs can be controller-independent.

My understanding is that the i.MX6 EPDC series is at least partly based
on the downstream vendor driver. This driver is a clean-sheet design for
hardware with different (read: fewer) capabilities, so we took some
different design paths, but we ran into many of the same sharp edges.

Here are some of the areas I would like input on:

Panel Lifecycle
===============
Panels use prepare/unprepare callbacks for their power supply. EPDs
should only be powered up when the display contents are changed. Should
the controller call both drm_panel_(un)prepare during each atomic update
when the framebuffer is dirty?

Similarly, panel enable/disable callbacks are tied to backlight state.
For an EPD, it makes sense to have the backlight enabled while the panel
is powered down (because the contents are static). Is it acceptable to
call drm_panel_{en,dis}able while the panel is not prepared?

With panel_bridge, the "normal" callback ordering is enforced, and tied
to the atomic state, so neither of these is possible.

As a result, neither the backlight nor the voltage regulators are tied
to the panel. The panel's regulators are consumed by the EBC itself.

Panel Timing Parameters
=======================
EPDs have more timing parameters than LCDs, and there are several
different ways of labeling these parameters. See for example the timing
diagrams on pp. 2237-2239 of the RK3568 TRM[0], the descriptions in the
ED103TC2 panel datasheet[3], and the submitted EPDC bindings[2].

Both the EPDC and EBC vendor drivers put all of the timing parameters in
the controller's OF node. There is no panel device/node.

I was able to squeeze everything needed for my specific case into a
struct drm_display_mode (see patches 5 and 14), but I don't know if this
is an acceptable use of those fields, or if will work with other
controllers. Is adding more fields to drm_display_mode an option?

See also the discussion of "dumb" LCD TCONs below.

Panel Connector Type / Media Bus Format
=======================================
The EBC supports either an 8-bit or 16-bit wide data bus, where each
pair of data lines represents the source driver polarity (positive,
negative, or neutral) for a pixel.

The only effect of the data bus width is the number of pixels that are
transferred per clock cycle. It has no impact on the number of possible
grayscale levels.

How does that translate to DRM_MODE_CONNECTOR_* or MEDIA_BUS_FMT_*?

Panel Reflection
================
The ED103TC2 panel scans from right to left. Currently, there is no API
or OF property to represent this. I can add something similar to
drm_panel_orientation.

Should this be exposed to userspace? It is acceptable for the kernel
driver to flip the image when blitting from the framebuffer?

CRTC "active" and "enabled" states
==================================
What do these states mean in the context of an EPD? Currently, the
driver ignores "active" and clears the screen to solid white when the
CRTC is disabled.

The vendor drivers can switch to a user-provided image when the CRTC is
disabled. Is this something that can/should be supported upstream? If
so, how? Would userspace provide the image to the kernel, or just tell
the kernel not to clear the screen?

VBLANK Events and Asynchronous Commits
======================================
When should the VBLANK event complete? When the pixels have been blitted
to the kernel's shadow buffer? When the first frame of the waveform is
sent to the panel? When the last frame is sent to the panel?

Currently, the driver is taking the first option, letting
drm_atomic_helper_fake_vblank() send the VBLANK event without waiting on
the refresh thread. This is the only way I was able to get good
performance with existing userspace.

Waveform Loading
================
Waveform files are calibrated for each batch of panels. So while a
single waveform file may be "good enough" for all panels of a certain
model, the correctly-calibrated file will have better image quality.

I don't know of a good way to choose the calibrated file. Even the
board's compatible string may not be specific enough, if the board is
manufactured with multiple batches of panels.

Maybe the filename should just be the panel compatible, and the user is
responsible for putting the right file there? In that case, how should I
get the compatible string from the panel_bridge? Traverse the OF graph
myself?

There is also the issue that different controllers need the waveform
data in different formats. ".wbf" appears to be the format provided by
PVI/eInk, the panel manufacturer. The Rockchip EBC hardware expects a
single waveform in a flat array, so the driver has to extract/decompress
that from the .wbf file (this is done in patch 1). On the other hand,
the i.MX EPDC expects a ".wrf" file containing multiple waveforms[8].

I propose that the waveform file on disk should always be what was
shipped with the panel -- the .wbf file -- and any extracting or
reformatting is done in the kernel.

Waveform Selection From Userspace
=================================
EPDs use different waveforms for different purposes: high-quality
grayscale vs. monochrome text vs. dithered monochrome video. How can
userspace select which waveform to use? Should this be a plane property?

It is also likely that userspace will want to use different waveforms at
the same time for different parts of the screen, for example a fast
monochrome waveform for the drawing area of a note-taking app, but a
grayscale waveform for surrounding UI and window manager.

I believe the i.MX6 EPDC supports multiple planes, each with their own
waveform choice. That seems like a good abstraction, but the EBC only
supports one plane in hardware. So using this abstraction with the EBC
would require blending pixels and doing waveform lookups in software.

Blitting/Blending in Software
=============================
There are multiple layers to this topic (pun slightly intended):
 1) Today's userspace does not expect a grayscale framebuffer.
    Currently, the driver advertises XRGB8888 and converts to Y4
    in software. This seems to match other drivers (e.g. repaper).

 2) Ignoring what userspace "wants", the closest existing format is
    DRM_FORMAT_R8. Geert sent a series[4] adding DRM_FORMAT_R1 through
    DRM_FORMAT_R4 (patch 9), which I believe are the "correct" formats
    to use.

 3) The RK356x SoCs have an "RGA" hardware block that can do the
    RGB-to-grayscale conversion, and also RGB-to-dithered-monochrome
    which is needed for animation/video. Currently this is exposed with
    a V4L2 platform driver. Can this be inserted into the pipeline in a
    way that is transparent to userspace? Or must some userspace library
    be responsible for setting up the RGA => EBC pipeline?

 4) Supporting multiple planes (for multiple concurrent waveforms)
    implies blending in software. Is that acceptable?

 5) Thoughts on SIMD-optimized blitting and waveform lookup functions?

 5) Currently the driver uses kmalloc() and dma_sync_single_for_device()
    for its buffers, because it needs both fast reads and fast writes to
    several of them. Maybe cma_alloc() or dma_alloc_from_contiguous()
    would be more appropriate, but I don't see any drivers using those
    directly.

EPDs connected to "dumb" LCD TCONs
==================================
This topic is mostly related to my first patch. Some boards exist that
hook up an EPD to a normal LCD TCON, not a dedicated EPD controller. For
example, there's the reMarkable 2[5] and some PocketBook models[6][7].

I have some concerns about this:
 1) If we put EPD panel timings in panel drivers (e.g. panel-simple),
    can the same timings work with LCD TCONs and EPD controllers?

    For example: one cycle of the 16-bit data bus is "one pixel" to an
    LCD controller, but is "8 pixels" to an EPD controller. So there is
    a factor-of-8 difference in horizontal resolution depending on your
    perspective. Should we have the "number of pixel clock cycles" or
    "number of pixels" in .hdisplay/.htotal in the panel timings?

    Patch 14 adds a panel with "number of pixels" horizontal resolution,
    so the correct resolution is reported to userspace, but the existing
    eink_vb3300_kca_timing in panel-simple.c appears to use "number of
    pixel clocks" for its horizontal resolution. This makes the panel
    timing definitions incompatible across controllers.

 2) Using fbdev/fbcon with an EPD hooked up to an LCD TCON will have
    unintended consequences, and possibly damage the panel. Currently,
    there is no way to mark the framebuffer as expecting "source driver
    polarity waveforms" and not pixel data. Is there a specific
    DRM_FORMAT_* we should use for these cases to prevent accidental use
    by userspace?

    Or should we disallow this entirely, and have some wrapper layer to
    do the waveform lookups in kernelspace?

    I like the wrapper layer idea because it allows normal userspace and
    fbcon to work. It would not be much new code, especially since this
    driver already supports doing the whole pipeline in software. So
    that's why I wrote a separate helper library; I hope this code can
    be reused.

Thanks for any input!
Samuel

[0]: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part2%20V1.1-20210301.pdf
[1]: https://wiki.pine64.org/wiki/PineNote
[2]: https://lore.kernel.org/lkml/20220206080016.796556-1-andreas@kemnade.info/T/
[3]: https://files.pine64.org/doc/quartz64/Eink%20P-511-828-V1_ED103TC2%20Formal%20Spec%20V1.0_20190514.pdf
[4]: https://lore.kernel.org/lkml/cover.1646683502.git.geert@linux-m68k.org/T/
[5]: https://lore.kernel.org/lkml/20220330094126.30252-1-alistair@alistair23.me/T/
[6]: https://github.com/megous/linux/commits/pb-5.17
[7]: https://github.com/megous/linux/commit/3cdf84388959
[8]: https://github.com/fread-ink/inkwave


Samuel Holland (16):
  drm: Add a helper library for EPD drivers
  dt-bindings: display: rockchip: Add EBC binding
  drm/rockchip: Add EBC platform driver skeleton
  drm/rockchip: ebc: Add DRM driver skeleton
  drm/rockchip: ebc: Add CRTC mode setting
  drm/rockchip: ebc: Add CRTC refresh thread
  drm/rockchip: ebc: Add CRTC buffer management
  drm/rockchip: ebc: Add LUT loading
  drm/rockchip: ebc: Implement global refreshes
  drm/rockchip: ebc: Implement partial refreshes
  drm/rockchip: ebc: Enable diff mode for partial refreshes
  drm/rockchip: ebc: Add support for direct mode
  drm/rockchip: ebc: Add a panel reflection option
  drm/panel-simple: Add eInk ED103TC2
  arm64: dts: rockchip: rk356x: Add EBC node
  [DO NOT MERGE] arm64: dts: rockchip: pinenote: Enable EBC display
    pipeline

 .../display/rockchip/rockchip,rk3568-ebc.yaml |  106 ++
 .../boot/dts/rockchip/rk3566-pinenote.dtsi    |   80 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      |   14 +
 drivers/gpu/drm/Kconfig                       |    6 +
 drivers/gpu/drm/Makefile                      |    4 +-
 drivers/gpu/drm/drm_epd_helper.c              |  663 +++++++
 drivers/gpu/drm/panel/panel-simple.c          |   31 +
 drivers/gpu/drm/rockchip/Kconfig              |   12 +
 drivers/gpu/drm/rockchip/Makefile             |    2 +
 drivers/gpu/drm/rockchip/rockchip_ebc.c       | 1586 +++++++++++++++++
 include/drm/drm_epd_helper.h                  |  104 ++
 11 files changed, 2607 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3568-ebc.yaml
 create mode 100644 drivers/gpu/drm/drm_epd_helper.c
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_ebc.c
 create mode 100644 include/drm/drm_epd_helper.h

-- 
2.35.1

