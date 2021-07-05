Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA893BC0DE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 17:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D737489733;
	Mon,  5 Jul 2021 15:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCCB89733
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 15:36:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i8so9688345wrp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jul 2021 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iAR7IbfO/ByOuSAYCAZlXWlTO/uAo5g0ryMzTohqIlw=;
 b=IrzmPVjIBQy5VJONOO4JR2KfNz9bOCVVXmPmuB/N5eSLvTHWkhwm9yiE/odqCAlgpS
 YkKbfUxC6io2EEH0KZY0amRQqNuLLXdlMgQbSI1eQaTGebH/nGgKJdmw6HWbrtvq8kDB
 SDBVgyOpQyJJ335nZT3VaWeGs+Fa6uhSXXSdNN/d2xH5SwOl/KMriqIFnNw9x0THevWy
 6om24hMR14NJWnDQ8cVAMd/FIM4EIcmFa2JO6dG79AXwo9ZAjmg00z14IaOXA6RlkSQA
 Sz/F43Vc8eoGoBdgGfNQthOsspXFcxgTTpJLUzmLU0K1BfhNLj8upOcml3NucRxFh/3o
 9yYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iAR7IbfO/ByOuSAYCAZlXWlTO/uAo5g0ryMzTohqIlw=;
 b=Q6+de6PmvNP2vKDf0JGSglt91twJ1OLgFJB2KzoEvZkQyGv/HBZonnpsZO9X4aERu1
 TZEkvdeUxrtgds7fShEkWyPm8vDwfFRIqjLe19ZOA7pj+pNGFTScvi98puVYkRvLScDp
 x5xGnR2IjkW+9Yvelez44BpXUQxtGoQ72nmgUfY8CFGo0ufnGFg62a+qydnH43ijdn79
 uXiMplj47wIXWUd7kKXvs3sX3jLeZjpEJiGfjkBxavGirc8puLOAF70RMpMREuGNPp5p
 Nf5emhFsGGM403xUqnn1FmZtNw7cUZuHQ/j+V9gyxJMguLadZChn6Vyw/FcK35N4yq1w
 Pk/g==
X-Gm-Message-State: AOAM530eWAt4xIayfPGlo3awhQiFTvH6lB2mpJLwGAJ8me1W25Vl9+0j
 xtdEEUC2HW1YDLimGhh0IMEIDUSbkrp0jpjU2aslyQ==
X-Google-Smtp-Source: ABdhPJxl6FpQUILr1o6o5CBSrn/HkvqCZy1UixrQLZB0tqalSy0xhAhX6LXzEXk8w1zmOsQZi4JE2onBuT3yQDvOcQg=
X-Received: by 2002:a5d:4351:: with SMTP id u17mr16176213wrr.47.1625499401858; 
 Mon, 05 Jul 2021 08:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com>
 <YN9BxNP5IfhbJGGk@pendragon.ideasonboard.com>
In-Reply-To: <YN9BxNP5IfhbJGGk@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 5 Jul 2021 16:36:25 +0100
Message-ID: <CAPY8ntDRKcq0V_q04q25_EemsBiT4xHKNv1260Fr8kKGtZDpxw@mail.gmail.com>
Subject: Re: Questions over DSI within DRM.
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

Thanks to you, Jani, and Jagan for your replies.
I'm replying to Laurent's email as it has the greatest number of
discussion points.

Noted that NWL DSI and Exynos DSI have undergone the conversion to
bridges - hopefully I can take those as vague examples.

On Fri, 2 Jul 2021 at 17:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> (Expanding the CC list a bit)
>
> On Fri, Jul 02, 2021 at 12:03:31PM +0100, Dave Stevenson wrote:
> > Hi All
> >
> > I'm trying to get DSI devices working reliably on the Raspberry Pi,
> > but I'm hitting a number of places where it isn't clear as to the
> > expected behaviour within DRM.
>
> Not a surprise. I dread reading the rest of this e-mail though :-)
>
> > Power on state. Many devices want the DSI clock and/or data lanes in
> > LP-11 state when they are powered up.
>
> When they are powered up, or when they are enabled ?

Generally powered on, so it wants to be in before pre_enable.

Taking SN65DSI83 as an example, the datasheet section 7.4.2
Initialization Sequence says
"After power is applied and stable, the DSI CLK lanes MUST be in HS
state and the DSI data lanes MUST be driven to LP11 state"

It was discussed when Marek's was developing the merged driver that it
seems to be happy to violate this initialisation sequence by starting
video on the data lanes before configuring the DSI83, but is that more
luck than anything else?

Reading the functional spec for Toshiba TC358762 (DSI to DPI bridge
used on the Pi 7" DSI panel), it says:
"1.HW:  Put  D-PHY  data  lane  0 to  ULPS  state
  a)  D-PHY  clock  lane  must  continue  to  supply  clock  for
minimum  20  clocks  before put  the  clock  lane  to  idle
2. HW:  Enable  Clock  Lane  and  Data  Lane  0 D-PHYs
3. HW:  Disable  Data  Lane  1 D-PHY
4. HW:  Transition  to  Operation  mode  when  Data  Lane  0 D-PHY  is
 not  in  ULPS  state.
  a) D-PHY clock lane must supply before Data Lane 0 D-PHY changes to LP state
  b) Host must wait minimum 5200 HSBCLK clock for CORE2 Power to be
stable before transfer any DSI packets."

So there we have a timing constraint from pushing the clock lane into
HS before we can do anything else. Quick calcs do appear to say this
is around 0.5msecs, so possibly it can be ignored.

> > With the normal calling sequence of:
> > - panel/bridge pre_enable calls from connector towards the encoder.
> > - encoder enable which also enables video.
> > - panel/bridge enable calls from encoder to connector.
> > there is no point at which the DSI tx is initialised but not
> > transmitting video. What DSI states are expected to be adopted at each
> > point?
>
> That's undefined I'm afraid, and it should be documented. The upside is
> that you can propose the behaviour that you need :-)

Can we reduce it to one behaviour that is valid for all devices? I
suspect we need at least some set of options :-/

> > On a similar theme, some devices want the clock lane in HS mode early
> > so they can use it in place of an external oscillator, but the data
> > lanes still in LP-11. There appears to be no way for the
> > display/bridge to signal this requirement or it be achieved.
>
> You're right. A loooong time ago, the omapdrm driver had an internal
> infrastructure that didn't use drm_bridge or drm_panel and instead
> required omapdrm-specific drivers for those components. It used to model
> the display pipeline in a different way than drm_bridge, with the sync
> explicitly setting the source state. A DSI sink could thus control its
> enable sequence, interleaving programming of the sink with control of
> the source.
>
> Migrating omapdrm to the drm_bridge model took a really large effort,
> which makes me believe that transitioning the whole subsystem to
> sink-controlled sources would be close to impossible. We could add
> DSI-specific operations, or add another enable bridge operation
> (post_pre_enable ? :-D). Neither would scale, but it may be enough.

I haven't thought it through for all generic cases, but I suspect it's
more a pre_pre_enable that is needed to initialise the PHY etc,
probably from source to sink.
If the panel/bridge can set a flag that can be checked at this point
for whether an early clock is required or not, I think that allows us
to comply with the requirements for a large number of panels/bridges
(LP-11 vs HS config for clock and or data lanes before pre_enable is
called).

pre_enable retains the current behaviour (initialise the chain from
sink to source).
enable then actually starts sending video and enabling outputs.

When I discussed this briefly with Maxime there was a suggestion of
using pm_runtime to be able to power up the pipeline as a whole. If
the bridge driver can use pm_runtime to power up the PHY when
required, then that may solve the issue, however I know too little of
the details to say whether that is actually practical.

> > host_transfer calls can supposedly be made at any time, however unless
> > MIPI_DSI_MSG_USE_LPM is set in the message then we're meant to send it
> > in high speed mode. If this is before a mode has been set, what
> > defines the link frequency parameters at this point? Adopting a random
> > default sounds like a good way to get undefined behaviour.
> >
> > DSI burst mode needs to set the DSI link frequency independently of
> > the display mode. How is that meant to be configured? I would have
> > expected it to come from DT due to link frequency often being chosen
> > based on EMC restrictions, but I don't see such a thing in any
> > binding.
>
> Undefined too. DSI support was added to DRM without any design effort,
> it's more a hack than a real solution. The issue with devices that can
> be controlled over both DSI and I2C is completely unhandled. So far
> nobody has really cared about implementing DSI right as far as I can
> tell.

:-(

Thinking aloud, does having the option to set a burst link frequency
from DT (or ACPI) have any issue for other platforms?
Looking at the handling of MIPI_DSI_MODE_VIDEO_BURST in the various
drivers, all except stm/dw_mipi_dsi-stm.c appear to take it as a "use
all the defined timings, but drop to LP during blanking" option. The
link frequency has therefore remained a property of the
display/bridge.
dw_mipi_dsi-stm.c cranks the PLL up by 20%, but I haven't followed
through the full detail of the parameters it computes from there.

DSI and I2C controlled devices is yet another issue that I haven't
even looked at.
I think it's more that vc4 wants to ignore DSI should the DSI host
node be enabled in DT, but there's no panel bound to it. One could say
that is a DT error and tough luck, but from a user's perspective that
is a bit harsh.

> > As a follow on, bridge devices can support burst mode (eg TI's
> > SN65DSI83 that's just been merged), so it needs to know the desired
> > panel timings for the output side of the bridge, but the DSI link
> > timings to set up the bridge's PLL. What's the correct way for
> > signalling that? drm_crtc_state->adjusted_mode vs
> > drm_crtc_state->mode? Except mode is userspace's request, not what has
> > been validated/updated by the panel/bridge.
>
> adjusted_mode is also a bit of a hack, it solves very specific issues,
> and its design assumes a single encoder in the chain with no extra
> bridges. We should instead add modes to the bridge state, and negotiate
> modes along the pipeline the same way we negotiate formats.

So as I understand it we already have format negotiation between
bridges via atomic_get_output_bus_fmts and atomic_get_input_bus_fmts,
so is it possible to extend that to modes?
Are you thinking bridge state that is owned by the framework, or by
the individual bridge drivers?

> > vc4 has constraints that the DSI host interface is fed off an integer
> > divider from a typically 3GHz clock, so the host interface needs to
> > signal that burst mode is in use even if the panel/bridge doesn't need
> > to run in burst mode. (This does mean that displays that require a
> > very precise link frequency can not be supported).
> > It currently updates the adjusted_mode via drm_encoder_helper_funcs
> > mode_fixup, but is that the correct thing to do, or is there a better
> > solution?
> > I'd have expected the DSI tx to be responsible for configuring burst
> > mode parameters anyway, so the mechanism required would seem to be
> > just the normal approach for adopting burst mode if that is defined.
> >
> > Some DSI host interfaces are implemented as bridges, others are
> > encoders. Pro's and con's of each? I suspect I'm just missing the
> > history here.
>
> It's indeed history. drm_encoder can't go away as it has been erronously
> exposed to userspace, but going forward, everything should be a bridge.
> The drm_encoder will still be required, but should just be a dummy,
> representing the chain of bridges.

Thanks to the links from Jagan I can have a look at what is required
to make that change.
I'm not certain it solves any of my issues at present, but at least
brings it into line with the intended implementation.

> > When it comes to the MIPI_DSI_MODE_* flags, which ones are mutually
> > exclusive, or are assumed based on others? Does a burst mode DSI sink
> > set both MIPI_DSI_MODE_VIDEO and MIPI_DSI_MODE_VIDEO_BURST, or just
> > the latter?
> > Presumably !MIPI_DSI_MODE_VIDEO signals the of use command mode for
> > conveying video. So looking at panel-ilitek-ili9881c where it sets
> > just MIPI_DSI_MODE_VIDEO_SYNC_PULSE means command mode video with sync
> > pulses? That sounds unlikely.
>
> I haven't looked at that, I'm afraid I don't know.

I have a suspicion it's been a bit of a scatter-gun in setting flags,
but it'd be nice to have it written down as to the expected behaviour.

> > I have looked for any information that covers this, but failed to find
> > such, hence calling on all your expertise.
>
> I'm sorry for the lack of solutions to your issues. I can try to help
> solving them though.

Any help would be most gratefully received.
I can attack the Pi specific stuff, and delegate framework sections to
Maxime via our contract with him (sorry Maxime!), but having a clear
statement of how this should be achieved is the bit that I'm afraid I
don't have the patience to bat around ad infinitum.

Thanks again.
  Dave
