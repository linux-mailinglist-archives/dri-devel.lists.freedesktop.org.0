Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FCB3BBA7A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 11:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D534989708;
	Mon,  5 Jul 2021 09:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A7A89708
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 09:48:46 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ga42so10965305ejc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jul 2021 02:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TJ7HpIk2V5j2KuxO7NmzK/6ELi7PWx7Rm1DMoQjSS/M=;
 b=mca4ogmUdOhsaJT3NGuNT+L6fN4tw+MEYv4vnWJbSks8ya3074svQo+vZ5rKSQUZhg
 6wjwMUECd0VM/uL/z/PF+KBJKVE4aFat+mTO2hm8tIOEz856YVO9xPzha8n9/UWl+IvD
 V5h72qdAZYwShd+lyf4ZnqnIM7Xj5zzfa5q3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TJ7HpIk2V5j2KuxO7NmzK/6ELi7PWx7Rm1DMoQjSS/M=;
 b=APXTSoSmMKTG7xehM2JxlX3fTLp2AjYW+l42928ipOFQ5mYKOdtO1iJPlzaUarojlV
 AexW1WgV5l9Ba06JlQ8KtATPNJW/dJ19D8/yHuiq/Qnjl5sUvHEucvL3OUnaf9izcfdx
 9sZAB+ZehoBxt6cUa2EPwJE2lLs7uL2zn5kZi6qJjQ7Kes+A3p2DQH1oCY6+TwvtQgo3
 kmo0SOLSqJXoxQub1v6i0rpD7XVE/q9+U3eP7lnuBtsHZGp46kn5ALExJNwFt6iPUIzZ
 MfYpYkg907vaeb/fYONvawyWD6eSS0tm50jmNT8xvY0wNMUEnrI2dwV+6uEZIjBZCYVW
 rqIw==
X-Gm-Message-State: AOAM531FasYLP2IZc7BCudi9da1VxGOOPWeSlskYj9OMnTOrz1F1RacX
 cRtV3U94DlraNTf7qSa1T8tsWv9W/k0KpPG3rFY32g==
X-Google-Smtp-Source: ABdhPJwC2vjSFzO1MxFuWJO+hQIaPiMEkPma+sJFqTP7fDBvclaZG7aUuNCcRqiDQ1zLdoGLFtN4fZXcj8KBqW4ti+Y=
X-Received: by 2002:a17:906:498b:: with SMTP id
 p11mr12736396eju.295.1625478525586; 
 Mon, 05 Jul 2021 02:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com>
 <YN9BxNP5IfhbJGGk@pendragon.ideasonboard.com>
In-Reply-To: <YN9BxNP5IfhbJGGk@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 5 Jul 2021 15:18:34 +0530
Message-ID: <CAMty3ZAYWDD4zZ5Ofd2gyzegWMC37es-5sYRo+hV8eoj7Cvq8w@mail.gmail.com>
Subject: Re: Questions over DSI within DRM.
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

On Fri, Jul 2, 2021 at 10:12 PM Laurent Pinchart
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
>
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
>
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
>
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
>
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
>
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

Just to add further on this with some example, thought it might help.

NWL DSI initially started with encoder and eventually become bridge
driven in mainline.
https://lore.kernel.org/lkml/13373313.BzCyiC4ED7@jernej-laptop/t/

Exynos DSI becoming Samsung MIPI DSIM bridge
https://patchwork.kernel.org/project/dri-devel/cover/20210704090230.26489-1-jagan@amarulasolutions.com/

Thanks,
Jagan.
