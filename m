Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2667E389F2C
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 09:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88E96F37F;
	Thu, 20 May 2021 07:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026AE6F37F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 07:55:30 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so14092145otp.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 00:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7VsX7/Yz8gqq5F5QEcaTsRmC1RVegDqVZLxieNcvL5Y=;
 b=a/Tz6gVwAOCMl1U31XbJwz20OWk9IAZsktmDv5Gj+dqcefIzeuJ3KSa4mgmQRQVlwq
 oCvt2Jry/uKyMhMHZYbCvoeG2kyr0iFlZeMUTSpCI/++fyCiAuXYZQzUBeCzoGYwtIdi
 GWXzAaG8gTPNTJTRaxDqPyBImkKyRVb0pOlfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7VsX7/Yz8gqq5F5QEcaTsRmC1RVegDqVZLxieNcvL5Y=;
 b=G4YKi3BK4DKCBNBRWkPdYuSTt9KSizUdJ8y/fCUIr9EEAf0dc5vDyZf4n4SV0lw9b0
 7WoN6cr7XVNe07OB1Lw2UvYZEOCgSF2szXOi/7eGDm04HCtosxTFxnrrXs0q0mfmTB2D
 GTou/YeZmXtOyV7uIHrFBbkdlL3FJ608/Ox04ndI2pL+Dw0u2C2w1pN/IQ6DVO86i/5S
 Ycvfa9kRI9uJX/6cB5qLF6j8iZLXuEHpQL5Fp0mSbJl/CFF99BndM20IMyPqO14ggvBw
 KNRb4jktLCZW/D4V8NChTkYIGg4VAtGJwClYNZMuMuYcVkevSDlH3eTjcLNCGHN+Gpix
 lSDw==
X-Gm-Message-State: AOAM533LiEH/eohIj7A5FWKiRYBO4QjCjB/KnksKHbsyxCoATGsQSxoS
 EfC/0TbytZLFMwZ1b0UfqW7PFZv8ySnyqNDRZiz/+w==
X-Google-Smtp-Source: ABdhPJw5oxqOn0U5fVq3qtSCcJm4kDUr02ifSMeE3D/j/nbnWJxtqoD/DWDHCg+55DhKPZAvCoXZl4teZNeKUdtM1sI=
X-Received: by 2002:a9d:4101:: with SMTP id o1mr2915523ote.281.1621497330332; 
 Thu, 20 May 2021 00:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
 <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
 <CAOFGe960UMe4=Xxcoha9R2Y74ma3Pp4Z0DF6PM+SJ2sjq2DBXg@mail.gmail.com>
 <CAKMK7uGtTT+59hRi3PB1WHPES3YJAPYBvbT74vo9PApNE0i7MQ@mail.gmail.com>
 <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
 <CAKMK7uHLipx_oH-s5PB6pUUZ_JXCyciaY7sDLfK__-2fvSPCKA@mail.gmail.com>
 <f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com>
 <CAKMK7uHdsGjADQ9zwgrYsuhHdxFGkuH--DdOsaqej6OD1AbX-w@mail.gmail.com>
 <CAOFGe97FDc7Y9APymQQZZMApDXsJkbcS0N5jh+3s-w-Ligipug@mail.gmail.com>
 <14524566-8854-4bc0-9f70-b7219c9fccfc@daenzer.net>
 <CAOFGe96VttW2VzAnx13ZXLBGcEDJMehGuOFifcr+pcbEOa-Brw@mail.gmail.com>
 <6f3e2628-7b39-417c-3bd2-c837c5367458@daenzer.net>
In-Reply-To: <6f3e2628-7b39-417c-3bd2-c837c5367458@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 20 May 2021 09:55:19 +0200
Message-ID: <CAKMK7uFMQGth19OjWmeNGTeVFoAqxK2tYXYrvme+NuCSNLxLUQ@mail.gmail.com>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 5:48 PM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:
>
> On 2021-05-19 5:21 p.m., Jason Ekstrand wrote:
> > On Wed, May 19, 2021 at 5:52 AM Michel D=C3=A4nzer <michel@daenzer.net>=
 wrote:
> >>
> >> On 2021-05-19 12:06 a.m., Jason Ekstrand wrote:
> >>> On Tue, May 18, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.ch> wrote=
:
> >>>>
> >>>> On Tue, May 18, 2021 at 7:40 PM Christian K=C3=B6nig
> >>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>>
> >>>>> Am 18.05.21 um 18:48 schrieb Daniel Vetter:
> >>>>>> On Tue, May 18, 2021 at 2:49 PM Christian K=C3=B6nig
> >>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>>>
> >>>>>>> And as long as we are all inside amdgpu we also don't have any ov=
ersync,
> >>>>>>> the issue only happens when we share dma-bufs with i915 (radeon a=
nd
> >>>>>>> AFAIK nouveau does the right thing as well).
> >>>>>> Yeah because then you can't use the amdgpu dma_resv model anymore =
and
> >>>>>> have to use the one atomic helpers use. Which is also the one that
> >>>>>> e.g. Jason is threathening to bake in as uapi with his dma_buf ioc=
tl,
> >>>>>> so as soon as that lands and someone starts using it, something ha=
s to
> >>>>>> adapt _anytime_ you have a dma-buf hanging around. Not just when i=
t's
> >>>>>> shared with another device.
> >>>>>
> >>>>> Yeah, and that is exactly the reason why I will NAK this uAPI chang=
e.
> >>>>>
> >>>>> This doesn't works for amdgpu at all for the reasons outlined above=
.
> >>>>
> >>>> Uh that's really not how uapi works. "my driver is right, everyone
> >>>> else is wrong" is not how cross driver contracts are defined. If tha=
t
> >>>> means a perf impact until you've fixed your rules, that's on you.
> >>>>
> >>>> Also you're a few years too late with nacking this, it's already uap=
i
> >>>> in the form of the dma-buf poll() support.
> >>>
> >>> ^^  My fancy new ioctl doesn't expose anything that isn't already
> >>> there.  It just lets you take a snap-shot of a wait instead of doing
> >>> an active wait which might end up with more fences added depending on
> >>> interrupts and retries.  The dma-buf poll waits on all fences for
> >>> POLLOUT and only the exclusive fence for POLLIN.  It's already uAPI.
> >>
> >> Note that the dma-buf poll support could be useful to Wayland composit=
ors for the same purpose as Jason's new ioctl (only using client buffers wh=
ich have finished drawing for an output frame, to avoid missing a refresh c=
ycle due to client drawing), *if* it didn't work differently with amdgpu.
> >>
> >> Am I understanding correctly that Jason's new ioctl would also work di=
fferently with amdgpu as things stand currently? If so, that would be a rea=
l bummer and might hinder adoption of the ioctl by Wayland compositors.
> >
> > My new ioctl has identical semantics to poll().  It just lets you take
> > a snapshot in time to wait on later instead of waiting on whatever
> > happens to be set right now.  IMO, having identical semantics to
> > poll() isn't something we want to change.
>
> Agreed.
>
> I'd argue then that making amdgpu poll semantics match those of other dri=
vers is a pre-requisite for the new ioctl, otherwise it seems unlikely that=
 the ioctl will be widely adopted.

This seems backwards, because that means useful improvements in all
other drivers are stalled until amdgpu is fixed.

I think we need agreement on what the rules are, reasonable plan to
get there, and then that should be enough to unblock work in the wider
community. Holding the community at large hostage because one driver
is different is really not great.

I've just finished the subsystem review of everything, and thus far
only found some minor bugs without practical significance. I'll fix
those and then send out a series.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
