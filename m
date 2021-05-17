Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285DD386C3B
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 23:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254926E39B;
	Mon, 17 May 2021 21:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BF36E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 21:24:34 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so6820097otc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oH3TC5arSRaF8BIUZrshZTlog0VnB0gntUMJVypigfs=;
 b=QlV40N7TUAOs+IaxiBtG2dynhiNN5tjMcrB4KWStLHrfT6rF8D6urPDb/mCdYExe0a
 ILKInm+TsP6pUhtSZQuHzJeW+Mn2/u3WVlG5HEo/kcXAa9ba6sVSA0Ssa6dHooMiKsVU
 pmY+uNvFXWeVbdKI3p5q+KkBdWiTvvw+383cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oH3TC5arSRaF8BIUZrshZTlog0VnB0gntUMJVypigfs=;
 b=RYD/LlPCVkpYanrM70SnQF0gMBNM6Y96CIWMWVilYlNou44Im7GMAtZOpiQKYswLWf
 M27bTM6eaUIX1WlSPlY/NSVAEUnhXIaA4ukR/ydBbhJe7ZLmuYk0wBdKc22ia04SqPbQ
 a0c21KM2eo3er3DFf0TrEUVQQjsR/inbjA2Rb919oqBQU1fH1UBIegN83zjAin4OHJiI
 tLFmzFnMLQWkFMJMiwL9glYDFUPdByBgzLhfe52+pKlvKqTHo2KuZJeJ7tPv8YE8rhLX
 0LxUacj3mS1EOEqzptfV9n9tMqibqBRk5yFRpG9u05XUxGBjzDyexdhhE7zEO5gLnRFc
 f90Q==
X-Gm-Message-State: AOAM531sqnChOAP5Hoeu+k1+Ps8JUgUJxDMuGClvz8e+RcWWyZ+0Ftav
 cpdUEx7NryymauC4vOf7n2S+l6mAQBz2lqB0PQt9dg==
X-Google-Smtp-Source: ABdhPJzrwoWiHD2mtk/siqfX//KYKHvA4aU+bJpxgwj9Oy8SYByX/Hk+oEtYAvMYN5Rhize33/aEXzNiNEpmwmVrUeI=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr1248964otq.303.1621286673578; 
 Mon, 17 May 2021 14:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
 <503d101d-7273-757a-2809-e272db93c45d@suse.de>
 <CAPj87rMqYNdHMT5v9fiMuDzcB8462nJuthB9To70JOsORgxk=w@mail.gmail.com>
 <6e26562f-5ccf-9014-c0c4-00241659a95b@suse.de>
In-Reply-To: <6e26562f-5ccf-9014-c0c4-00241659a95b@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 May 2021 23:24:22 +0200
Message-ID: <CAKMK7uH2-4jRNwb9BhU-oxdF6Y4PnmrPq2TFD1dMFmdioX8iOQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 10:10 PM Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>
> Hi
>
> Am 17.05.21 um 21:32 schrieb Daniel Stone:
> > Hi,
> >
> > On Mon, 17 May 2021 at 20:12, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
> >> Am 17.05.21 um 09:40 schrieb Daniel Vetter:
> >>> We have, it's called drivers/gpu. Feel free to rename to drivers/xpu =
or
> >>> think G as in General, not Graphisc.
> >>
> >> I hope this was a joke.
> >>
> >> Just some thoughts:
> >>
> >> AFAICT AI first came as an application of GPUs, but has now
> >> evolved/specialized into something of its own. I can imagine sharing
> >> some code among the various subsystems, say GEM/TTM internals for memo=
ry
> >> management. Besides that there's probably little that can be shared in
> >> the userspace interfaces. A GPU is device that puts an image onto the
> >> screen and an AI accelerator isn't.
> >
> > But it isn't. A GPU is a device that has a kernel-arbitrated MMU
> > hosting kernel-managed buffers, executes user-supplied compiled
> > programs with reference to those buffers and other jobs, and informs
> > the kernel about progress.
> >
> > KMS lies under the same third-level directory, but even when GPU and
> > display are on the same die, they're totally different IP blocks
> > developed on different schedules which are just periodically glued
> > together.
>
> I mentioned this elsewhere: it's not about the chip architecture, it's
> about the UAPI. In the end, the GPU is about displaying things on a
> screen. Even if the rendering and the scanout engines are on different
> IP blocks. (Or different devices.)

Sure, but that's ignoring the reality there there's enormous amounts
of code needed to make this rendering possible. All of which keeps
existing if you take away the display, use your gpu to do compute,
throw out the the raster and texture fetch blocks and rebalance your
compute units to be much faster at the bfloat16 and u8 math (or
whatever it is the NN people love today) than fp32, where traditional
render gpus are kind. At that point you have a NN/AI chip, and like
Daniel Stone says, the difference here is often much smaller than the
difference between drm/lima and drm/amdgpu. Which at least on the 3d
side happen to share large chunks of our stack (more sharing in
userspace than the kernel, but still quite some sharing overall in
concepts and code).

There's overall substantially more code to make this work than the
modeset drivers you think are the corner stone of a gpu driver.

Also if you want to do broad strokes refactoring like pulling the
memory management/command submission stuff out of drm, then the right
thing would be to pull the modeset stuff out and merge it with maybe
v4l. modesetting was a 10 years later addition to drm, this entire
thing started with memory/command submission management.

And a lot of people got rather mad that the drm folks reinvented their
own modeset api and didn't use one of the existing ones. We eclipsed
them by now with atomic support, so somewhat moot point now, but not
when it landed 10 years ago.

> The fact that one can do general purpose computing on a GPU is a
> byproduct of the evolution of graphics hardware. It never was the goal.

I think we've crossed now the point where 50% of gpu sales are
displayless. It stopped being a byproduct long ago and became the main
goal in many areas and markets.

But also the core of drivers/gpu _is_ the memory management stuff.
That's what this subsystem has been doing for 20 years or so by now.
The modeset stuff is a comparitively recent addition (but has grown a
lot thanks to tons of new drivers that landed and fbdev essentially
dying).

> >> Treating both as the same, even if
> >> they share similar chip architectures, seems like a stretch. They migh=
t
> >> evolve in different directions and fit less and less under the same
> >> umbrella.
> >
> > Why not? All we have in common in GPU land right now is MMU + buffer
> > references + job scheduling + synchronisation. None of this has common
> > top-level API, or even a common top-level model. It's not just ISA
> > differences, but we have very old-school devices where the kernel
> > needs to register fill on every job, living next to middle-age devices
> > where the kernel and userspace co-operate to fill a ring buffer,
> > living next to modern devices where userspace does some stuff and then
> > the hardware makes it happen with the bare minimum of kernel
> > awareness.
>
> I see all this as an example why AI should not live under gpu/. There
> are already many generations of GPUs with different feature sets
> supported. Why lump more behind the same abstractions if AI can take a
> fresh start? Why should we care about AI and why should AI care about
> all our legacy.

Fresh start here means "ignore all the lessons learned from 20 years
of accelerator driver hacking" I think.

> We can still share all the internal code if AI needs any of it.
> Meanwhile AI drivers can provide their own UAPIs until a common
> framework emerges.

Again the no 1 lesson of writing accel drivers is that you need the
fully open userspace stack, or it's game over long term. No amount of
"we'll share code later on" will save you from that, because that's
just not going to be an option. There's a few other lessons like you
don't actually want to have a standardized uapi for the accelerator
command submission and memory management, but there are some
standardized approaches that make sense (we've probably tried them
all).

This has nothing to do with how you organize the kernel subsystem, but
all about how you set up the overall driver stack. Of which the
userspace side is the important part.

And back to your point that display is the main reason why drivers/gpu
exists: None of this has anything to do with display, but is exactly
what the render _accelerator_ part of dri-devel has been doing for a
rather long time by now. Which is why other accelarators should
probably do the same thing instead of going "nah we're different,
there's no DP output connected to our accelator".

Cheers, Daniel

PS: Also there are NN chips with DP/HDMI ports thrown in for the lolz.
Turns out that these NN things are pretty useful when building video
processing pipelines.

> Again, just my 2 cents.
>
> Best regards
> Thomas
>
> >
> > Honestly I think there's more difference between lima and amdgpu then
> > there is between amdgpu and current NN/ML devices.
> >
> > Cheers,
> > Daniel
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
