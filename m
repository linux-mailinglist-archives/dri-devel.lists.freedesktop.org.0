Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998403BDBA6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 18:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6E16E039;
	Tue,  6 Jul 2021 16:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AAF6E039
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 16:45:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso1897185wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 09:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JtzJXGh4BCcBqQweZkrwmgvWDemrbX/oyYijNogdghU=;
 b=F1eGVLs1twOoxOg62ZGueOsanL7cVCfOOQKUoUIOqnCuicP10BWV3Sz070yXZexsiW
 Coh0fS/ctu7TNQbyqYiDcpugeojNbp6u0iEBnzCpodLtBFAz5AJJBv+YYnc2McM70ILd
 8S99jJoli+xjqskz8w21Ai0KFyDJHRsTVbYlysSuLpQCwA/CqfEx6Xi2xpa71T2J7szr
 qi9VyY3YbmORq30EvJa4Ttr5ifiy3BJhRve9b0EE1g57x/DD93CsG2SInGHd5Y+YNpbJ
 ITWF7TClQDBpavKOVwF2kXQEFgR7jy+C3sxdgoUnONO269RILjdhbTe4HT1+KirWsHGt
 wjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JtzJXGh4BCcBqQweZkrwmgvWDemrbX/oyYijNogdghU=;
 b=Sep0Orkov6YDE8nqwSFCi6VfLFQlXllOaap8+E1XvErW8XgvbxSOy5043YpKGs4ajv
 A1mLOwo6Hv2Mb6dQ7GtEkDypoerXrsqHwuV+50M60MO5Ce6jupkWg6fLDVYZyov1rezy
 0eMWhEOvFd4+4T+vZOCT3Al8VyF3G8ePGNHJBEC6s9NUr3rVgmKhuzw8UW/gLAv9jaPA
 Z3KQ0wQzYshxYAhZ+RC8ro3iHzw4x6V2bRyK5cjw+bO221Duvep8UoEMIExgJiX/dyip
 +6wncvVtPlQwzt4p+Mt6fxIR/NQXuVLKJEdXKjab3muYZu4aHXx2yCk4tABaQST0DcbK
 1fBg==
X-Gm-Message-State: AOAM533MlItV2ONEtJefbvQbFteCtKVe7xFmoSFqe8eHr7RuFW+hJyjZ
 hLhcBreEHLmJnqHgiK35Vzm4r13Zj7Rpzwf7HI/DgQ==
X-Google-Smtp-Source: ABdhPJxRkqr62gZT4G0ZCLJ1FOXDlKbB2N3CZdXs4eM2LXOyB/GwHP7fIJwcJR2x9tH5q6dnKmyURXesrMHuy/w2bi4=
X-Received: by 2002:a05:600c:d0:: with SMTP id
 u16mr21706561wmm.96.1625589915106; 
 Tue, 06 Jul 2021 09:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com>
 <YN9BxNP5IfhbJGGk@pendragon.ideasonboard.com>
 <CAPY8ntDRKcq0V_q04q25_EemsBiT4xHKNv1260Fr8kKGtZDpxw@mail.gmail.com>
 <20210706151320.kwn4dwu6buvy4isa@gilmour>
In-Reply-To: <20210706151320.kwn4dwu6buvy4isa@gilmour>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 6 Jul 2021 17:44:58 +0100
Message-ID: <CAPY8ntDPQg76JTgZ5iJG=m3sWjKMwi-vXUHyAPqS_HGFbGGkkA@mail.gmail.com>
Subject: Re: Questions over DSI within DRM.
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Tue, 6 Jul 2021 at 16:13, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Dave,
>
> On Mon, Jul 05, 2021 at 04:36:25PM +0100, Dave Stevenson wrote:
> > Hi Laurent.
> >
> > Thanks to you, Jani, and Jagan for your replies.
> > I'm replying to Laurent's email as it has the greatest number of
> > discussion points.
> >
> > Noted that NWL DSI and Exynos DSI have undergone the conversion to
> > bridges - hopefully I can take those as vague examples.
> >
> > On Fri, 2 Jul 2021 at 17:42, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Dave,
> > >
> > > (Expanding the CC list a bit)
> > >
> > > On Fri, Jul 02, 2021 at 12:03:31PM +0100, Dave Stevenson wrote:
> > > > Hi All
> > > >
> > > > I'm trying to get DSI devices working reliably on the Raspberry Pi,
> > > > but I'm hitting a number of places where it isn't clear as to the
> > > > expected behaviour within DRM.
> > >
> > > Not a surprise. I dread reading the rest of this e-mail though :-)
> > >
> > > > Power on state. Many devices want the DSI clock and/or data lanes in
> > > > LP-11 state when they are powered up.
> > >
> > > When they are powered up, or when they are enabled ?
> >
> > Generally powered on, so it wants to be in before pre_enable.
> >
> > Taking SN65DSI83 as an example, the datasheet section 7.4.2
> > Initialization Sequence says
> > "After power is applied and stable, the DSI CLK lanes MUST be in HS
> > state and the DSI data lanes MUST be driven to LP11 state"
> >
> > It was discussed when Marek's was developing the merged driver that it
> > seems to be happy to violate this initialisation sequence by starting
> > video on the data lanes before configuring the DSI83, but is that more
> > luck than anything else?
> >
> > Reading the functional spec for Toshiba TC358762 (DSI to DPI bridge
> > used on the Pi 7" DSI panel), it says:
> > "1.HW:  Put  D-PHY  data  lane  0 to  ULPS  state
> >   a)  D-PHY  clock  lane  must  continue  to  supply  clock  for
> > minimum  20  clocks  before put  the  clock  lane  to  idle
> > 2. HW:  Enable  Clock  Lane  and  Data  Lane  0 D-PHYs
> > 3. HW:  Disable  Data  Lane  1 D-PHY
> > 4. HW:  Transition  to  Operation  mode  when  Data  Lane  0 D-PHY  is
> >  not  in  ULPS  state.
> >   a) D-PHY clock lane must supply before Data Lane 0 D-PHY changes to LP state
> >   b) Host must wait minimum 5200 HSBCLK clock for CORE2 Power to be
> > stable before transfer any DSI packets."
> >
> > So there we have a timing constraint from pushing the clock lane into
> > HS before we can do anything else. Quick calcs do appear to say this
> > is around 0.5msecs, so possibly it can be ignored.
> >
> > > > With the normal calling sequence of:
> > > > - panel/bridge pre_enable calls from connector towards the encoder.
> > > > - encoder enable which also enables video.
> > > > - panel/bridge enable calls from encoder to connector.
> > > > there is no point at which the DSI tx is initialised but not
> > > > transmitting video. What DSI states are expected to be adopted at each
> > > > point?
> > >
> > > That's undefined I'm afraid, and it should be documented. The upside is
> > > that you can propose the behaviour that you need :-)
> >
> > Can we reduce it to one behaviour that is valid for all devices? I
> > suspect we need at least some set of options :-/
>
> One thing to consider as well is that we might not be able to even
> implement the proper behavior due to lack of documentation (or just that
> the hardware cannot implement it).
>
> If we multiply the callbacks to accommodate for any panel and downstream
> bridges power sequence, in order to properly support any combination
> then all drivers will need to implement all the hooks properly (and I'm
> guessing we would have some sequence variation too). Chances are we will
> end up with a combinatorial explosion of sequences, and this will be a
> nightmare to test. And that's again assuming that we can implement them
> in the first place.

Both possibly true.
At the moment the biggest hole I see is that there is no chance to set
the initial state of the PHY in any shape or form before also starting
video.

Existing drivers that don't implement the new hook to initialise the
PHY state would still work as they currently do (undefined behaviour).

> > > > On a similar theme, some devices want the clock lane in HS mode early
> > > > so they can use it in place of an external oscillator, but the data
> > > > lanes still in LP-11. There appears to be no way for the
> > > > display/bridge to signal this requirement or it be achieved.
> > >
> > > You're right. A loooong time ago, the omapdrm driver had an internal
> > > infrastructure that didn't use drm_bridge or drm_panel and instead
> > > required omapdrm-specific drivers for those components. It used to model
> > > the display pipeline in a different way than drm_bridge, with the sync
> > > explicitly setting the source state. A DSI sink could thus control its
> > > enable sequence, interleaving programming of the sink with control of
> > > the source.
> > >
> > > Migrating omapdrm to the drm_bridge model took a really large effort,
> > > which makes me believe that transitioning the whole subsystem to
> > > sink-controlled sources would be close to impossible. We could add
> > > DSI-specific operations, or add another enable bridge operation
> > > (post_pre_enable ? :-D). Neither would scale, but it may be enough.
> >
> > I haven't thought it through for all generic cases, but I suspect it's
> > more a pre_pre_enable that is needed to initialise the PHY etc,
> > probably from source to sink.
> > If the panel/bridge can set a flag that can be checked at this point
> > for whether an early clock is required or not, I think that allows us
> > to comply with the requirements for a large number of panels/bridges
> > (LP-11 vs HS config for clock and or data lanes before pre_enable is
> > called).
> >
> > pre_enable retains the current behaviour (initialise the chain from
> > sink to source).
> > enable then actually starts sending video and enabling outputs.
>
> Flags indeed seem like a more contained option. Another one could be to
> have a mipi_dsi_host to (for example) power up the clock lane that would
> be called by default before the bridge's enable, or at the downstream
> bridge driver discretion before that.

Which driver will that call?
An extreme example perhaps, but Toshiba make the TC358860 eDP to DSI
bridge chip[1]. So the encoder will be eDP, but the DSI config needs
to go to that bridge. Does that happen automatically within the
framework? I guess so as the bridge will have called
mipi_dsi_host_register for the DSI sink to attach to.

Perhaps a new mipi_dsi_host function to configure the PHY is the
easier solution. If it can allow the sink to request whatever
combination of states from clock and data lanes that it fancies, then
it can be as explicit as required for the initialisation sequence, and
the host driver does its best to comply with the requests.
I'd have a slight query over when and how the host would drop to ULPS
or power off. It probably shouldn't be in post_disable as the sink
hasn't had a chance to finalise everything in its post_disable.
Perhaps pm_runtime with autosuspend is the right call there?

[1] https://toshiba.semicon-storage.com/ap-en/semiconductor/product/interface-bridge-ics-for-mobile-peripheral-devices/display-interface-bridge-ics/detail.TC358860XBG.html

> > When I discussed this briefly with Maxime there was a suggestion of
> > using pm_runtime to be able to power up the pipeline as a whole. If
> > the bridge driver can use pm_runtime to power up the PHY when
> > required, then that may solve the issue, however I know too little of
> > the details to say whether that is actually practical.
>
> I'm not sure it was about this topic in particular. If I remember well
> our discussion, this was about the vc4 driver that tries to circumvent
> the framework and call the pre_enable and enable hooks itself because it
> wasn't properly powered before and thus any DCS-related call by the
> downstream bridge or panel would end up creating a CPU stall.
>
> I suggested to use runtime_pm in the DCS related calls to make sure the
> device is powered because there's no relation between the state of the
> downstream bridge or panel and whether it can send DCS commands or not.
> For all we know, it could do it at probe time.

pm_runtime is all a bit of a magic black box to me.

We had discussed shifting to using pm_runtime from DCS (and enable)
calls to power up the PHY on demand, and that's what I implemented.
However Laurent flagged up that using
dsi->encoder->crtc->state->adjusted_mode to get the HS clock info
required to send a HS DCS command from that call is deprecated, so how
do we specify the clock rate to use at that point?

> > > > host_transfer calls can supposedly be made at any time, however unless
> > > > MIPI_DSI_MSG_USE_LPM is set in the message then we're meant to send it
> > > > in high speed mode. If this is before a mode has been set, what
> > > > defines the link frequency parameters at this point? Adopting a random
> > > > default sounds like a good way to get undefined behaviour.
> > > >
> > > > DSI burst mode needs to set the DSI link frequency independently of
> > > > the display mode. How is that meant to be configured? I would have
> > > > expected it to come from DT due to link frequency often being chosen
> > > > based on EMC restrictions, but I don't see such a thing in any
> > > > binding.
> > >
> > > Undefined too. DSI support was added to DRM without any design effort,
> > > it's more a hack than a real solution. The issue with devices that can
> > > be controlled over both DSI and I2C is completely unhandled. So far
> > > nobody has really cared about implementing DSI right as far as I can
> > > tell.
> >
> > :-(
> >
> > Thinking aloud, does having the option to set a burst link frequency
> > from DT (or ACPI) have any issue for other platforms?
> > Looking at the handling of MIPI_DSI_MODE_VIDEO_BURST in the various
> > drivers, all except stm/dw_mipi_dsi-stm.c appear to take it as a "use
> > all the defined timings, but drop to LP during blanking" option. The
> > link frequency has therefore remained a property of the
> > display/bridge.
> > dw_mipi_dsi-stm.c cranks the PLL up by 20%, but I haven't followed
> > through the full detail of the parameters it computes from there.
>
> I don't see anything wrong with using link-frequency from the DT to
> setup the burst frequency. It's what v4l2 has been using for a while
> without any known (to me) drawback, and we're using the same of-graph
> bindings, so it shouldn't be too controversial there.

OK, that sounds like a vague plan.

> > DSI and I2C controlled devices is yet another issue that I haven't
> > even looked at.
> > I think it's more that vc4 wants to ignore DSI should the DSI host
> > node be enabled in DT, but there's no panel bound to it. One could say
> > that is a DT error and tough luck, but from a user's perspective that
> > is a bit harsh.
>
> I guess the larger "issue" is that the tree in the DT is done following
> the "control" bus, and Linux likes to tie the life cycle of a given
> device to its parent bus. Both these decisions make sense, but they
> interact in a weird way in some occurrences (like this one, or Allwinner
> has an Ethernet PHY controlled through MMIO which end up in the same
> case).
>
> I wonder if using device links here could help though.

I really don't know about that one.

> > > > As a follow on, bridge devices can support burst mode (eg TI's
> > > > SN65DSI83 that's just been merged), so it needs to know the desired
> > > > panel timings for the output side of the bridge, but the DSI link
> > > > timings to set up the bridge's PLL. What's the correct way for
> > > > signalling that? drm_crtc_state->adjusted_mode vs
> > > > drm_crtc_state->mode? Except mode is userspace's request, not what has
> > > > been validated/updated by the panel/bridge.
> > >
> > > adjusted_mode is also a bit of a hack, it solves very specific issues,
> > > and its design assumes a single encoder in the chain with no extra
> > > bridges. We should instead add modes to the bridge state, and negotiate
> > > modes along the pipeline the same way we negotiate formats.
> >
> > So as I understand it we already have format negotiation between
> > bridges via atomic_get_output_bus_fmts and atomic_get_input_bus_fmts,
> > so is it possible to extend that to modes?
> > Are you thinking bridge state that is owned by the framework, or by
> > the individual bridge drivers?
>
> atomic_check is made for that. I guess we could improve its call
> sequence to each time a mode is modified along the bridge list we
> restart the sequence until all components agree (or reject it entirely
> if they can't), but I don't really see why we would need yet another
> hook.

Why do all nodes in the bridge list need to agree? Adjacent nodes need
to agree, but they then also need to retain that agreed timing
somewhere.

Taking SN65DSI8[3|4|5] as an example, it supports burst mode, and the
DSI frequency and timings are permitted to be different from that
which it uses on the LVDS side. The LVDS panel and LVDS side of DSI83
need to agree over the format, and the DSI host and DSI side of DSI83
need to agree, but they may be two different timings.
Register 0x0B (DSI_CLK_DIVIDER & REFCLK_MULTIPLIER) allows you to
configure the LVDS rate compared to the DSI rate (the driver currently
goes for 1:1), and registers 0x20 to 0x34 allow you to set the number
of active pixel and blanking on the LVDS side (again currently just
copied across).

The way I'm seeing burst mode as having been interpreted at present is
that it's largely just a flag to say "drop to LP mode between lines".
The timing that needs to be passed to the crtc is therefore going to
be based on the DSI link rate (converted to pixels) with increased
blanking periods.

I guess there are similarities with Media Controller and V4L2 here. A
typical chain there could be:
 sensor -> scaler -> crop -> CSI-2 receiver.
The format on each of those links may be different, but the chain as a
whole needs to be valid. Media Controller largely relies on userspace
to configure all links, but with a DRM chain that isn't really an
option as it's expected that the display chain configures itself.

Thanks
  Dave
