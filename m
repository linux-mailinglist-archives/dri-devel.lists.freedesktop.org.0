Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A97249A23
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 12:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0714B6E20F;
	Wed, 19 Aug 2020 10:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A55D6E20F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 10:21:30 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id i6so17638883edy.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 03:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h6AVtOUwARHRhdJTUOdj1J4qEdgphAeVlE0BK3Yw6sc=;
 b=eZKE64zdcmxvxoKNb1vnTkYbQMwOebf4/SLPWGsfRD8RTcQJwAD7JPbz2b6tLCrSRn
 eBeibWLs5d3XZlXMAoVXm9pRBm70o2M3B5cn9cOVd91E4y/O69nNC+dwfjcLlpaQDp0L
 3VLpGDJOJHAX4OFXlPeyqWzLKGwSXB81Nc0NiRdWLj6f7pMV3GaE5CWL8R3wK2Yk1/Tn
 EuQr4SRxhp3zrrR7+KunAozbC5vM3/FwIjGW+RPE0WwSrtsGb4tK4+smrkO4F+deduJs
 bECHyDGqRzrwcRqS+aU5Y76AA1/tWWXS2yADL6a4BlcUR08gtSHbXIBERVmkikEMhQdO
 F+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h6AVtOUwARHRhdJTUOdj1J4qEdgphAeVlE0BK3Yw6sc=;
 b=V7ASC3aStfL8icFNKK2AhkjaqZ0DZCDDywmFGk0n7DVvc06ylwe+A12wJ9iY23xG9L
 jPJAG800W8llmjjWRKWA3y5trk2mTjFDnnGGUcTJHzkp8emX4/y0XthYquX1Iv8JnP1u
 xFb+o8Psd8yy8jXNQ/l1cHK6UXKlZF3FG5t90PXD3+zCf1LegWFh0xDPT3bmTU2fkfOt
 3caz46b1qJ7msthHL1fz+QeuY2Eh5WOxwDnTHuyBbUe5mN/BHSztrJGaad/R0o/9Cqe4
 +KwW31wvrGkTZVf6mcEcfFiMvxnMG2NclvH18Xnm2bfW+byX+WEiRcMjloQD4sFiG+Ro
 WaCg==
X-Gm-Message-State: AOAM53249E5iljV4zEZ1+mdN45P3jO4amtqESZCR/gUi0schJ/A/fprM
 cp5w1xgwTjjCyu33f9CHA+q9/fHAwdMEWHdSevOSwg==
X-Google-Smtp-Source: ABdhPJyN4o23uCI8u6SMKS3P8aQjCkQzEh1UJEp5kwFmUMHuSZ3fJle2o0YRChz73QIVReoVsx86IA3Tqp34YFqd1EI=
X-Received: by 2002:a50:d655:: with SMTP id c21mr23314447edj.49.1597832489451; 
 Wed, 19 Aug 2020 03:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <1940005.XIBaf5lNV5@jeremy> <7086465.UhkgK7rEtT@jason>
 <32cb6f50-1fe1-1484-0512-04590882d35a@baylibre.com> <3158508.CFMi0AOM4G@jason>
In-Reply-To: <3158508.CFMi0AOM4G@jason>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 19 Aug 2020 07:21:17 -0300
Message-ID: <CAAEAJfBHBqT9Lv5zMaizJLnz=L5+Z3RvYoDf=Ex09_PDSUGe5g@mail.gmail.com>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the
 Ingenic JZ4780)
To: Paul Boddie <paul@boddie.org.uk>, Paul Cercueil <paul@crapouillou.net>,
 hns@goldelico.com
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

First of all, I'd like to thank everyone for the great work
on ingenic-drm. The driver is in very good shape
and a pleasure to work with.

Yesterday, I checked out branch "paulb-jz4780-ci20-hdmi-5.8-rc5",
from git.goldelico.com/letux-kernel.git, rebased it on v5.9-rc1,
and then run weston over HDMI (how often
weston runs on mips, uh? :)

The edid of my monitor is properly read
and modetest reports all modes.

I've only tested the primary plane, for some reason
the overlay is not working as expected, but it must
be probably some minor thing.

As for the bus format, I have just added a skip
for CONNECTOR_HDMIA types in the encoder
atomic check. And then MEDIA_BUS_FMT_RGB888_1X24
is hardcoded if there are no bus formats negotiated.

Paul et al, if you guys can rebase your work on v5.9-rc1
and Cc I will be happy to review and test the patches.

Cheers & thanks again,
Eze




On Tue, 7 Jul 2020 at 04:27, Paul Boddie <paul@boddie.org.uk> wrote:
>
> On Monday, 6 July 2020 14:12:24 CEST Neil Armstrong wrote:
> >
> > On 06/07/2020 01:57, Paul Boddie wrote:
> > >
> > > It also seems to be appropriate to set the input_bus_format on the
> > > platform- specific HDMI driver; otherwise, I doubt that appropriate bus
> > > encodings will be chosen in the Synopsys driver.
> >
> > It does but when not provided, it doesn't use it.
> >
> > It's handled in drm_atomic_bridge_chain_select_bus_fmts() :
> >       if (conn->display_info.num_bus_formats &&
> >                   conn->display_info.bus_formats)
> >               out_bus_fmts[0] = conn->display_info.bus_formats[0];
> >       else
> >               out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
>
> OK. I thought I'd seen this somewhere, but I had started to think that
> input_bus_format would remain initialised (presumably to zero) and this would
> then cause the Synopsys driver to not change the bus format to the actual
> default.
>
> [...]
>
> > > Testing against 5.8-rc3 with the above changes seems to have moved the
> > > needle slightly. Although I still get "Input not supported" from my
> > > monitor, running modetest now gives a different error:
> > >
> > > modetest -D /dev/dri/card0 -M ingenic-drm -s 34@32:1280x1024-60.02
> > >
> > > ...now yields this:
> > >
> > > setting mode 1280x1024-60.02Hz@XR24 on connectors 34, crtc 32
> > > failed to set gamma: Invalid argument
> >
> > This is because you don't provide the gamma setup ioctl, it's not a fatal
> > error at all. It should be warning since it's optional.
> >
> > Did you check all modes ?
>
> I have checked a few more. Currently, testing them is awkward because it
> involves switching my monitor to DVI input, getting "Input Not Supported",
> unplugging the cable, and then the hotplug event has most likely caused a bad
> pointer dereference in ingenic_drm_crtc_atomic_flush and thus a kernel panic.
>
> So, I'll try and fix this panic, which appears to be due to the DRM driver
> accessing a null framebuffer pointer (presumably having been invalidated
> elsewhere upon unplugging), and see if I can't get some more information about
> the state of the peripherals.
>
> Paul
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
