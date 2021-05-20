Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D2B38B4F0
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 19:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ABA6E41B;
	Thu, 20 May 2021 17:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91866F4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 17:09:07 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id gb17so8430759ejc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 10:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IQI7eln3t0QEwa+iZ/JmpTSMxbJuRtQkPEsz6TUik54=;
 b=NeTRAYxZIvp3Mn8MY7JbMZqeMBZzj8Ry4xp+W61PdUFP3HiMfscou2DLGD0qHAiNyP
 652FVbwyzXb4ydSxy/uufYNUHdpHMK/nnkjY3cA6Re21CNFKKqjcezKcNYDF3wM/2NW/
 IutjpoZjrC0aaU4bANSJt5acyxdYlbX+Kg6aBP3eUI9OLpwf1lRnVvUOr6EgYlHw6kz8
 lonXrx0nI4UwBbizZALTxlqSJ6GUmhp7cPtyPP28XggN7W9uPMHTafMhdax7T9vjZyAf
 zuGXBqsSAYFxOvIT425shnH+6ug5uisz4qKSZvFBri5FisYdfSoYWs19yKL8MiGinPNl
 6rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IQI7eln3t0QEwa+iZ/JmpTSMxbJuRtQkPEsz6TUik54=;
 b=Wb3HQt9C4ndFzEkmyNJ4ZJG89YGSqlY/ZQ+EEt94PWlkrPle7i7d7Koi+oGLN2OokN
 1zqg5NNmhQsm6GArcmj+PjSOrnPAoCm9Dr4niMUyKHenpeVkTsRqEqTVSDsRl65ddCSD
 35DZBkItJOsU/1984x4+zQ+425ptAH8wi3QBc/xXa3MV1ZaUczDVh+8TP2v2AJO3T9zP
 JSdG9G/R4uoHZJ1A2YCAe6eaOXZTxYwch2RpHZsPsCubzEijlkyFvoOE/qTYjTNbmCKb
 2uFO4d6m27WMG7ROEK0XBan3+2NhtsINXIwNwdqKotwMkeSCmNlXnd40e9np4kdJgOfJ
 ZAXQ==
X-Gm-Message-State: AOAM532KXW0EVWiaC1JrJTwuS5SgfGDDUTO9cxN1lq6Cc2O9pjw5f5nF
 4tA0QKl9VTyS0Z2poaif02iB+mLlMMEWT5yADsa1qQ==
X-Google-Smtp-Source: ABdhPJyJFY+pl1NUB4Az397br6FmOam3xqUVDOVMA0oKhABErOQUkRrMQnUApTbLhv3gcASOjv6u3E94KTyl23U1Urk=
X-Received: by 2002:a17:906:2596:: with SMTP id
 m22mr5775178ejb.175.1621530546332; 
 Thu, 20 May 2021 10:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
 <CAKMK7uHLipx_oH-s5PB6pUUZ_JXCyciaY7sDLfK__-2fvSPCKA@mail.gmail.com>
 <f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com>
 <CAKMK7uHdsGjADQ9zwgrYsuhHdxFGkuH--DdOsaqej6OD1AbX-w@mail.gmail.com>
 <CAOFGe97FDc7Y9APymQQZZMApDXsJkbcS0N5jh+3s-w-Ligipug@mail.gmail.com>
 <14524566-8854-4bc0-9f70-b7219c9fccfc@daenzer.net>
 <CAOFGe96VttW2VzAnx13ZXLBGcEDJMehGuOFifcr+pcbEOa-Brw@mail.gmail.com>
 <6f3e2628-7b39-417c-3bd2-c837c5367458@daenzer.net>
 <CAKMK7uFMQGth19OjWmeNGTeVFoAqxK2tYXYrvme+NuCSNLxLUQ@mail.gmail.com>
 <7cbba7b7-d7e5-9c76-c747-4e39542268a2@daenzer.net>
 <YKZvx0UXYnJrfVw4@phenom.ffwll.local>
In-Reply-To: <YKZvx0UXYnJrfVw4@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 20 May 2021 12:08:54 -0500
Message-ID: <CAOFGe94h=0Bex3WmQ=nBu-epBJZbz+tYWwMwL6qLiuJCY58+Lg@mail.gmail.com>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: Daniel Vetter <daniel@ffwll.ch>
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 9:18 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, May 20, 2021 at 10:13:38AM +0200, Michel D=C3=A4nzer wrote:
> > On 2021-05-20 9:55 a.m., Daniel Vetter wrote:
> > > On Wed, May 19, 2021 at 5:48 PM Michel D=C3=A4nzer <michel@daenzer.ne=
t> wrote:
> > >>
> > >> On 2021-05-19 5:21 p.m., Jason Ekstrand wrote:
> > >>> On Wed, May 19, 2021 at 5:52 AM Michel D=C3=A4nzer <michel@daenzer.=
net> wrote:
> > >>>>
> > >>>> On 2021-05-19 12:06 a.m., Jason Ekstrand wrote:
> > >>>>> On Tue, May 18, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.ch> w=
rote:
> > >>>>>>
> > >>>>>> On Tue, May 18, 2021 at 7:40 PM Christian K=C3=B6nig
> > >>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> > >>>>>>>
> > >>>>>>> Am 18.05.21 um 18:48 schrieb Daniel Vetter:
> > >>>>>>>> On Tue, May 18, 2021 at 2:49 PM Christian K=C3=B6nig
> > >>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> > >>>>>>>>
> > >>>>>>>>> And as long as we are all inside amdgpu we also don't have an=
y oversync,
> > >>>>>>>>> the issue only happens when we share dma-bufs with i915 (rade=
on and
> > >>>>>>>>> AFAIK nouveau does the right thing as well).
> > >>>>>>>> Yeah because then you can't use the amdgpu dma_resv model anym=
ore and
> > >>>>>>>> have to use the one atomic helpers use. Which is also the one =
that
> > >>>>>>>> e.g. Jason is threathening to bake in as uapi with his dma_buf=
 ioctl,
> > >>>>>>>> so as soon as that lands and someone starts using it, somethin=
g has to
> > >>>>>>>> adapt _anytime_ you have a dma-buf hanging around. Not just wh=
en it's
> > >>>>>>>> shared with another device.
> > >>>>>>>
> > >>>>>>> Yeah, and that is exactly the reason why I will NAK this uAPI c=
hange.
> > >>>>>>>
> > >>>>>>> This doesn't works for amdgpu at all for the reasons outlined a=
bove.
> > >>>>>>
> > >>>>>> Uh that's really not how uapi works. "my driver is right, everyo=
ne
> > >>>>>> else is wrong" is not how cross driver contracts are defined. If=
 that
> > >>>>>> means a perf impact until you've fixed your rules, that's on you=
.
> > >>>>>>
> > >>>>>> Also you're a few years too late with nacking this, it's already=
 uapi
> > >>>>>> in the form of the dma-buf poll() support.
> > >>>>>
> > >>>>> ^^  My fancy new ioctl doesn't expose anything that isn't already
> > >>>>> there.  It just lets you take a snap-shot of a wait instead of do=
ing
> > >>>>> an active wait which might end up with more fences added dependin=
g on
> > >>>>> interrupts and retries.  The dma-buf poll waits on all fences for
> > >>>>> POLLOUT and only the exclusive fence for POLLIN.  It's already uA=
PI.
> > >>>>
> > >>>> Note that the dma-buf poll support could be useful to Wayland comp=
ositors for the same purpose as Jason's new ioctl (only using client buffer=
s which have finished drawing for an output frame, to avoid missing a refre=
sh cycle due to client drawing), *if* it didn't work differently with amdgp=
u.
> > >>>>
> > >>>> Am I understanding correctly that Jason's new ioctl would also wor=
k differently with amdgpu as things stand currently? If so, that would be a=
 real bummer and might hinder adoption of the ioctl by Wayland compositors.
> > >>>
> > >>> My new ioctl has identical semantics to poll().  It just lets you t=
ake
> > >>> a snapshot in time to wait on later instead of waiting on whatever
> > >>> happens to be set right now.  IMO, having identical semantics to
> > >>> poll() isn't something we want to change.
> > >>
> > >> Agreed.
> > >>
> > >> I'd argue then that making amdgpu poll semantics match those of othe=
r drivers is a pre-requisite for the new ioctl, otherwise it seems unlikely=
 that the ioctl will be widely adopted.
> > >
> > > This seems backwards, because that means useful improvements in all
> > > other drivers are stalled until amdgpu is fixed.
> > >
> > > I think we need agreement on what the rules are, reasonable plan to
> > > get there, and then that should be enough to unblock work in the wide=
r
> > > community. Holding the community at large hostage because one driver
> > > is different is really not great.
> >
> > I think we're in violent agreement. :) The point I was trying to make i=
s
> > that amdgpu really needs to be fixed to be consistent with other driver=
s
> > ASAP.
>
> It's not that easy at all. I think best case we're looking at about a one
> year plan to get this into shape, taking into account usual release/distr=
o
> update latencies.
>
> Best case.
>
> But also it's not a really big issue, since this shouldn't stop
> compositors from using poll on dma-buf fd or the sync_file stuff from
> Jason: The use-case for this in compositors is to avoid a single client
> stalling the entire desktop. If a driver lies by not setting the exclusiv=
e
> fence when expected, you simply don't get this stall avoidance benefit of
> misbehaving clients. But also this needs a gpu scheduler and higher
> priority for the compositor (or a lot of hw planes so you can composite
> with them alone), so it's all fairly academic issue.

That's not really the use-case.... I mean, that is one potential
use-case.  But the real intention is to provide a mechanism for
allowing explicit sync apps to live in an implicit sync world.  For
instance, with that ioctl, you could write an entirely explicit sync
compositor and just snag sync_files from any dma-bufs you get from
clients that don't support whatever your window system's explicit sync
protocol is.  It only works in the one direction, sadly, but I don't
see a good safe way to make the other direction work without snagging
a fence from the final submit which draws to the image.

--Jason
