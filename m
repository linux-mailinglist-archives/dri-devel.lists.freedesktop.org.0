Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3714224EE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806A46E321;
	Tue,  5 Oct 2021 11:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F7489C2A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 11:23:22 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m22so31277862wrb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 04:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XmQ3v3DHsT2RhxbIX9cZabB5v9NlOe1vYpLFIfa9nhE=;
 b=tUA7CnfoQUTubI7NvGokKfKvBiVV+QGTiPO8CdIXaLN9P3aaE3Vz7GGQ7XK7SYDmii
 nXg+wkahWTnj7Snl9iGx2e9JMCzVIcpGrHCvlT04GID/RUMHbOYIRUF2ClttczwvOBJK
 WPD9N2bXBdaZjHq2klycw9KhUzPZ+8acLDBNPjfKXo47g4K9GFDfHUeKgDFUSWJdlWsU
 c3cxykYSiaGC3ei0TJSGswkMvDu6stSvuAPFbUUc75x9M0cqOaKRkrPqBMlywodapUuA
 wDFCu4K4426D2vgavACPhHcIOWzWplYyhcCU1l/cmnMuBfKPFCCESZtZnsGp0zVuqlZZ
 +Klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XmQ3v3DHsT2RhxbIX9cZabB5v9NlOe1vYpLFIfa9nhE=;
 b=04AE1alkx3kYtkTxm1DXRi+oFbaClmVVD3FNl+uJmpLwWEk6IxVUdlbO1+IjdOcF9W
 fCLgdSRJPoO7l1blRD0neCa/Bk8SJwJ1zTiXKt1flEES2uEJJo++pNA7NIzc+IRC1eXl
 a9VlaHiQLWr4Zlsi+0pBLJg8X97Cp9Ypo29vXvQejVMohSGCqfeR7iMmItSHZSdL8+5c
 XrV37y1XK1I9phKZRkZ8uIp3AUgwNW+4TwUEZh2p52SfT6K4X/do1/mY5kzvaF1C/4GV
 EW2yR5HS3rfVlMqhGIAeP3wcmyug+7Y8UyVfoqgHyPmwPNTBC5OzLriI0UttPwfU6yuD
 Yc2Q==
X-Gm-Message-State: AOAM533s7pc8gIhnMcBQ11nnSEJZ3flN4LWoqvja3pthAN22jHtsVXT4
 1WenQirZXr0sBfba31ZratrlXgYS2QhJPLB5cs6VbQ==
X-Google-Smtp-Source: ABdhPJwof6or9m/pExrX9zWhKmtbw2HTxrCGCP3jlJ6z0TxvHD41aMtp+J+MJhLg10wrQzQo9UaiyaTqcrec9zp9Ktg=
X-Received: by 2002:adf:aad0:: with SMTP id i16mr20653917wrc.128.1633433001058; 
 Tue, 05 Oct 2021 04:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com>
 <YN9BxNP5IfhbJGGk@pendragon.ideasonboard.com>
 <CAPY8ntDRKcq0V_q04q25_EemsBiT4xHKNv1260Fr8kKGtZDpxw@mail.gmail.com>
 <20210706151320.kwn4dwu6buvy4isa@gilmour>
 <CAPY8ntDPQg76JTgZ5iJG=m3sWjKMwi-vXUHyAPqS_HGFbGGkkA@mail.gmail.com>
 <20210715095022.5plcocz6plxnb3xr@gilmour>
 <YVm7U0q6F8T9K32h@pendragon.ideasonboard.com>
In-Reply-To: <YVm7U0q6F8T9K32h@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 5 Oct 2021 12:23:04 +0100
Message-ID: <CAPY8ntAWqaHH=+cGWcpKypvZfGApE6SQ1p0qFzE9XyyqaaQ1OQ@mail.gmail.com>
Subject: Re: Questions over DSI within DRM.
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

On Sun, 3 Oct 2021 at 15:16, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> Reviving a bit of an old thread.

I'd been looking at reviving this conversation too as I've moved
further on with DSI on the Pi, and converting from an encoder to a
bridge

> On Thu, Jul 15, 2021 at 11:50:22AM +0200, Maxime Ripard wrote:
> > On Tue, Jul 06, 2021 at 05:44:58PM +0100, Dave Stevenson wrote:
> > > On Tue, 6 Jul 2021 at 16:13, Maxime Ripard wrote:
> > > > > > > On a similar theme, some devices want the clock lane in HS mode early
> > > > > > > so they can use it in place of an external oscillator, but the data
> > > > > > > lanes still in LP-11. There appears to be no way for the
> > > > > > > display/bridge to signal this requirement or it be achieved.
> > > > > >
> > > > > > You're right. A loooong time ago, the omapdrm driver had an internal
> > > > > > infrastructure that didn't use drm_bridge or drm_panel and instead
> > > > > > required omapdrm-specific drivers for those components. It used to model
> > > > > > the display pipeline in a different way than drm_bridge, with the sync
> > > > > > explicitly setting the source state. A DSI sink could thus control its
> > > > > > enable sequence, interleaving programming of the sink with control of
> > > > > > the source.
> > > > > >
> > > > > > Migrating omapdrm to the drm_bridge model took a really large effort,
> > > > > > which makes me believe that transitioning the whole subsystem to
> > > > > > sink-controlled sources would be close to impossible. We could add
> > > > > > DSI-specific operations, or add another enable bridge operation
> > > > > > (post_pre_enable ? :-D). Neither would scale, but it may be enough.
> > > > >
> > > > > I haven't thought it through for all generic cases, but I suspect it's
> > > > > more a pre_pre_enable that is needed to initialise the PHY etc,
> > > > > probably from source to sink.
>
> I believe it could be implemented as a pre-pre-enable indeed. It feels
> like a bit of a hack, as the next time we need more fine-grained control
> over the startup sequence, we'll have to add a pre-pre-pre-enable. Given
> that the startup sequence requirements come from the sink device, it
> would make sense to let it explicitly control the initialization,
> instead of driving it from the source. I don't think we'll be able to
> rework the bridge API in that direction though, so I'm fine with a hack.

There are pros and cons to both approaches.
You're in a much better place to make that sort of call than I am, so
I'll take your advice.

Implementing a DSI host op function may mean an update to a number of
existing DSI host drivers, but it would be cleaner. It's also what
Andrzej has suggested.

Thinking it through, a function that requests clock lane frequency and
state (ULPS or LP-11 predominantly), and data lane state (again ULPS
or LP-11) should allow the required behaviour for most of the bridges
I'm aware of. Most want either LP-11, or HS clock at a known
frequency. Giving the option for setting back into ULPS also allows
for power saving/standby mechanisms should the need arise.
Does it need a way to pass back the actual DSI frequency being used,
in a similar vein to mode_fixup? That allows for the bridge to request
the display clock, but the burst mode link frequency to be returned
(I'm assuming that's a property of the DSI host only, and not the
bridge).

I'm having a discussion with someone who wants to run SN65DSI85 in the
two independent LVDS display mode. That requires a DSI HS clock on
DSI-A even if only panel B is active, so with this extra function that
would be achievable as well.

Thoughts?

> > > > > If the panel/bridge can set a flag that can be checked at this point
> > > > > for whether an early clock is required or not, I think that allows us
> > > > > to comply with the requirements for a large number of panels/bridges
> > > > > (LP-11 vs HS config for clock and or data lanes before pre_enable is
> > > > > called).
> > > > >
> > > > > pre_enable retains the current behaviour (initialise the chain from
> > > > > sink to source).
> > > > > enable then actually starts sending video and enabling outputs.
> > > >
> > > > Flags indeed seem like a more contained option. Another one could be to
> > > > have a mipi_dsi_host to (for example) power up the clock lane that would
> > > > be called by default before the bridge's enable, or at the downstream
> > > > bridge driver discretion before that.
> > >
> > > Which driver will that call?
> >
> > The parent DSI Host
> >
> > > An extreme example perhaps, but Toshiba make the TC358860 eDP to DSI
> > > bridge chip[1]. So the encoder will be eDP, but the DSI config needs
> > > to go to that bridge. Does that happen automatically within the
> > > framework? I guess so as the bridge will have called
> > > mipi_dsi_host_register for the DSI sink to attach to.
> >
> > In that case, whatever sink would be connected to the bridge would call
> > the bridge clock enable hook if it needs it in its pre_enable, or it
> > would be called automatically before enable if it doesn't
> >
> > Would that help?
>
> Sounds good to me, in theory at least (let's see what issues we'll run
> into in practice :-)).
>
> Has anyone given it a try, or is planning to ?
>
> > > Perhaps a new mipi_dsi_host function to configure the PHY is the
> > > easier solution. If it can allow the sink to request whatever
> > > combination of states from clock and data lanes that it fancies, then
> > > it can be as explicit as required for the initialisation sequence, and
> > > the host driver does its best to comply with the requests.
> >
> > I don't know, I'm not really fond in general of solutions that try to
> > cover any single case if we don't need it and / or have today an issue
> > with this. I'd rather have something that works for the particular
> > bridge we were discussing, see if it applies to other bridges and modify
> > it if it doesn't until it works for all our cases. Trying to reason in
> > all possible cases tend to lead to solutions that are difficult to
> > maintain and usually over-engineered.
>
> A DSI host clock enable operation or a DSI host PHY configuration
> operation both fit in the same place in the grand scheme of things, so I
> don't mind either. We should be able to easily move from a more specific
> operation to a more generic one if the need arises.
>
> > > I'd have a slight query over when and how the host would drop to ULPS
> > > or power off. It probably shouldn't be in post_disable as the sink
> > > hasn't had a chance to finalise everything in its post_disable.
> > >
> > > Perhaps pm_runtime with autosuspend is the right call there?
> >
> > pm_runtime semantics mean that once the device is suspended, its power
> > domains, regulators, clocks, etc. are all shut down, so it doesn't
> > really fit the low power state expected by DSI
> >
> > > [1] https://toshiba.semicon-storage.com/ap-en/semiconductor/product/interface-bridge-ics-for-mobile-peripheral-devices/display-interface-bridge-ics/detail.TC358860XBG.html
> > >
> > > > > When I discussed this briefly with Maxime there was a suggestion of
> > > > > using pm_runtime to be able to power up the pipeline as a whole. If
> > > > > the bridge driver can use pm_runtime to power up the PHY when
> > > > > required, then that may solve the issue, however I know too little of
> > > > > the details to say whether that is actually practical.
> > > >
> > > > I'm not sure it was about this topic in particular. If I remember well
> > > > our discussion, this was about the vc4 driver that tries to circumvent
> > > > the framework and call the pre_enable and enable hooks itself because it
> > > > wasn't properly powered before and thus any DCS-related call by the
> > > > downstream bridge or panel would end up creating a CPU stall.
> > > >
> > > > I suggested to use runtime_pm in the DCS related calls to make sure the
> > > > device is powered because there's no relation between the state of the
> > > > downstream bridge or panel and whether it can send DCS commands or not.
> > > > For all we know, it could do it at probe time.
> > >
> > > pm_runtime is all a bit of a magic black box to me.
> > >
> > > We had discussed shifting to using pm_runtime from DCS (and enable)
> > > calls to power up the PHY on demand, and that's what I implemented.
> > > However Laurent flagged up that using
> > > dsi->encoder->crtc->state->adjusted_mode to get the HS clock info
> > > required to send a HS DCS command from that call is deprecated, so how
> > > do we specify the clock rate to use at that point?
> >
> > I guess the most sensible would be to have a custom bridge state, and
> > add a pointer to the current bridge state in struct drm_bridge. Then, as
> > long as you have a bridge pointer you have a way to get the current
> > state associated to it, and since we already have atomic_duplicate_state
> > / atomic_destroy_state we can create our own structure around it storing
> > whatever we want.
>
> That's a good point. It would only be needed if we use runtime PM to
> work around the initialization sequence issue, not if we implement a DSI
> host clock enable/disable operation, right ?

Obviously this only works with atomic bridges otherwise you have no
state, but I assume all bridges should be heading that route now.

> > > > > > > host_transfer calls can supposedly be made at any time, however unless
> > > > > > > MIPI_DSI_MSG_USE_LPM is set in the message then we're meant to send it
> > > > > > > in high speed mode. If this is before a mode has been set, what
> > > > > > > defines the link frequency parameters at this point? Adopting a random
> > > > > > > default sounds like a good way to get undefined behaviour.
> > > > > > >
> > > > > > > DSI burst mode needs to set the DSI link frequency independently of
> > > > > > > the display mode. How is that meant to be configured? I would have
> > > > > > > expected it to come from DT due to link frequency often being chosen
> > > > > > > based on EMC restrictions, but I don't see such a thing in any
> > > > > > > binding.
> > > > > >
> > > > > > Undefined too. DSI support was added to DRM without any design effort,
> > > > > > it's more a hack than a real solution. The issue with devices that can
> > > > > > be controlled over both DSI and I2C is completely unhandled. So far
> > > > > > nobody has really cared about implementing DSI right as far as I can
> > > > > > tell.
> > > > >
> > > > > :-(
> > > > >
> > > > > Thinking aloud, does having the option to set a burst link frequency
> > > > > from DT (or ACPI) have any issue for other platforms?
> > > > > Looking at the handling of MIPI_DSI_MODE_VIDEO_BURST in the various
> > > > > drivers, all except stm/dw_mipi_dsi-stm.c appear to take it as a "use
> > > > > all the defined timings, but drop to LP during blanking" option. The
> > > > > link frequency has therefore remained a property of the
> > > > > display/bridge.
> > > > > dw_mipi_dsi-stm.c cranks the PLL up by 20%, but I haven't followed
> > > > > through the full detail of the parameters it computes from there.
> > > >
> > > > I don't see anything wrong with using link-frequency from the DT to
> > > > setup the burst frequency. It's what v4l2 has been using for a while
> > > > without any known (to me) drawback, and we're using the same of-graph
> > > > bindings, so it shouldn't be too controversial there.
>
> How would that frequency we picked in practice ? Do panels typically
> support a range of HS frequencies for DCS HS transfers ?

I was thinking more of bridges where they often run a PLL off the
incoming DSI clock, and then have a FIFO with potentially different
clock rates and timings on input and output. SN65DSI83 supports that,
as do the Toshiba bridge chips I'm currently looking at.
You need to know the DSI link frequency to configure the PLL
correctly, but then the bridge output timing is a different matter.

> > > OK, that sounds like a vague plan.
> > >
> > > > > DSI and I2C controlled devices is yet another issue that I haven't
> > > > > even looked at.
> > > > > I think it's more that vc4 wants to ignore DSI should the DSI host
> > > > > node be enabled in DT, but there's no panel bound to it. One could say
> > > > > that is a DT error and tough luck, but from a user's perspective that
> > > > > is a bit harsh.
> > > >
> > > > I guess the larger "issue" is that the tree in the DT is done following
> > > > the "control" bus, and Linux likes to tie the life cycle of a given
> > > > device to its parent bus. Both these decisions make sense, but they
> > > > interact in a weird way in some occurrences (like this one, or Allwinner
> > > > has an Ethernet PHY controlled through MMIO which end up in the same
> > > > case).
> > > >
> > > > I wonder if using device links here could help though.
> > >
> > > I really don't know about that one.
> >
> > It's a piece of infrastructure that was created at first (I think?) to
> > model the power dependency between devices that don't have a parent /
> > child relationship. For example, if you use DMA, you probably want to
> > keep the IOMMU powered as long as you are, but it is in a completely
> > separate branch of the "device tree" (not one from the DTB, the one that
> > linux DM creates).
> >
> > It was later expanded to also cover probe order and make sure a supplier
> > would probe before its consumer, effectively making EPROBE_DEFER
> > obsolete.
> >
> > The second part is still fairly new, but I think we can solve this by
> > adding a device link between the DSI host and whatever is at the end of
> > the OF-Graph endpoint.
> >
> > > > > > > As a follow on, bridge devices can support burst mode (eg TI's
> > > > > > > SN65DSI83 that's just been merged), so it needs to know the desired
> > > > > > > panel timings for the output side of the bridge, but the DSI link
> > > > > > > timings to set up the bridge's PLL. What's the correct way for
> > > > > > > signalling that? drm_crtc_state->adjusted_mode vs
> > > > > > > drm_crtc_state->mode? Except mode is userspace's request, not what has
> > > > > > > been validated/updated by the panel/bridge.
> > > > > >
> > > > > > adjusted_mode is also a bit of a hack, it solves very specific issues,
> > > > > > and its design assumes a single encoder in the chain with no extra
> > > > > > bridges. We should instead add modes to the bridge state, and negotiate
> > > > > > modes along the pipeline the same way we negotiate formats.
> > > > >
> > > > > So as I understand it we already have format negotiation between
> > > > > bridges via atomic_get_output_bus_fmts and atomic_get_input_bus_fmts,
> > > > > so is it possible to extend that to modes?
> > > > > Are you thinking bridge state that is owned by the framework, or by
> > > > > the individual bridge drivers?
> > > >
> > > > atomic_check is made for that. I guess we could improve its call
> > > > sequence to each time a mode is modified along the bridge list we
> > > > restart the sequence until all components agree (or reject it entirely
> > > > if they can't), but I don't really see why we would need yet another
> > > > hook.
>
> Isn't this what atomic_get_output_bus_fmts() and
> atomic_get_input_bus_fmts() implement ?

Those negotiate a single u32 bus format between nodes, not a complete timing.

> > > Why do all nodes in the bridge list need to agree? Adjacent nodes need
> > > to agree, but they then also need to retain that agreed timing
> > > somewhere.
> >
> > We might have mutually exclusive requirements though? Let's use the
> > example of the VC4 HDMI driver that can't have odd horizontal timings,
> > and assume it's a constraint of our DSI driver instead.
> >
> > Then, we have a DSI->LVDS bridge, a LVDS->RGB bridge and a panel (which
> > is a bit ridiculous, but whatever). If the LVDS->RGB bridge can't have
> > even horizontal timings, then you just can't display it, even though
> > they are not adjacent (unless the bridge in the middle can modify the
> > timings between the input and output, but that's not always possible).
> >
> > Similarly, if for the RGB panel we need to increase a bit some timings
> > to accommodate for a larger pixel clock and end up above what the DSI
> > host can provide, we're also done.
>
> The hard part will be to figure out a good heuristics to perform the
> negotiation without going back and forth (at least not in a way that
> would require too many iterations, and certainly avoiding infinite
> loops). That will be an interesting problem to solve, but maybe we'll be
> lucky and a simple approach will work for the use cases we have to
> support today.

One to kick into the long grass possibly then.

For burst mode and bridges retiming things, generally I think it works
if you consider a single pass through a mode_fixup equivalent starting
at the panel.
The panel advertises what it wants.
The closest bridge (eg DSI83) fixup amends panel's requested mode
based on any constraints that it has, stores a copy, and passes that
down the chain.
The next bridge (eg vc4_dsi) amends the mode based on restrictions it
has (eg burst mode link frequency). That's the end of the chain in
this case, so that's the mode that the crtc needs to be programmed
with.

The modes then need to be passed back up the chain so that eg DSI83
knows the link frequency in use, and can therefore configure the PLL
appropriately.

The bit it would be nice to fix is that burst mode has effectively
increased the horizontal front porch, but that could be fixed within
the bridge so that the panel gets the timing it requested.

> > > Taking SN65DSI8[3|4|5] as an example, it supports burst mode, and the
> > > DSI frequency and timings are permitted to be different from that
> > > which it uses on the LVDS side. The LVDS panel and LVDS side of DSI83
> > > need to agree over the format, and the DSI host and DSI side of DSI83
> > > need to agree, but they may be two different timings.
> > > Register 0x0B (DSI_CLK_DIVIDER & REFCLK_MULTIPLIER) allows you to
> > > configure the LVDS rate compared to the DSI rate (the driver currently
> > > goes for 1:1), and registers 0x20 to 0x34 allow you to set the number
> > > of active pixel and blanking on the LVDS side (again currently just
> > > copied across).
> > >
> > > The way I'm seeing burst mode as having been interpreted at present is
> > > that it's largely just a flag to say "drop to LP mode between lines".
> > > The timing that needs to be passed to the crtc is therefore going to
> > > be based on the DSI link rate (converted to pixels) with increased
> > > blanking periods.
> > >
> > > I guess there are similarities with Media Controller and V4L2 here. A
> > > typical chain there could be:
> > >  sensor -> scaler -> crop -> CSI-2 receiver.
> > > The format on each of those links may be different, but the chain as a
> > > whole needs to be valid. Media Controller largely relies on userspace
> > > to configure all links, but with a DRM chain that isn't really an
> > > option as it's expected that the display chain configures itself.
> >
> > Also, the userspace has no concept of media sub-devices in DRM, so it
> > just sets the mode on the whole DRM/KMS device, unlike what v4l2 does.
> > In v4l2, afaik, if you ended up with the above scenarios it would just
> > be rejected when you set the format on the link, letting the userspace
> > figure it out. We can't really do that here
>
> I wonder how long we'll be able to keep userspace out of the picture to
> configure the internals of the pipeline. I don't want to be the first
> person who will have a use case that requires this.

I suspect none of us want to be the first one to hit this scenario!

As I've just posted on the other thread about SN65DSI83, I've hit a
major stumbling block with the current design where vc4_dsi (and
Exynos) breaks the bridge_chain so that it gets called first and can
do initialisation, and then it calls down the chain.
Having now converted to a DSI bridge driver, it works fine with
connected non-atomic bridges, but fails with atomic bridges.
drm_atomic_add_encoder_bridges adds the state for all the bridges the
framework is aware of. With the split chain it misses adding the state
of our "hidden" bridges, and we can't add the extra state from our
atomic_duplicate_state call as we don't have the state to add to (we
just return our state to be added).
This bumps up the priority for us of finding a suitable solution for
this initialisation issue, so I'll start looking at how feasible a new
DSI host function is.

Thanks
  Dave
