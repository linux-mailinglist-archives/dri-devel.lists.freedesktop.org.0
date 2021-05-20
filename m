Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DCF38B18B
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 16:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33576E2D8;
	Thu, 20 May 2021 14:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CEA897F0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 14:18:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d11so17834041wrw.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6cjqDgsjlb939a5FXNuoX938nrSVIobNIUSNGLgi4Ek=;
 b=JK/jDT+GAtvKHGz/8weLBxkyH+AlV/BH1HpLgwxjTjEHNsmozM1Itet5YlUn4hq4wE
 0IMNkT2yLQAGEiZDEiRJDSPY1OZFuH2PlaO0qVRm86O04mjOWM0C6WvdsSMFPkqLHKPQ
 gcUq2F8QtAo9vcWJ5OEurycPvHabW0S7OwJUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6cjqDgsjlb939a5FXNuoX938nrSVIobNIUSNGLgi4Ek=;
 b=ZPoHwoNCqDlTwWMlXx+oOwCiqwoPAH3+YR52mHgsUheiadvXNa/pn2CnnPxZzmS+qk
 DSEz4tP7feMYlYQQk3Q0aCnqLWsy8CjKt0TtUYRdK1469mQvBn08kLrbyYmp6GUhrlwB
 MtrPwCrhNaNCMSxWLYMmr0WY5T+vO6H11yJI7MUHbtbSQB/MGN3nOGki5bBH86xPrWNQ
 VvbNlKeIn1KUG7h+HGhUxU/wWTfu8NRf/yDs0YWeAvQQrVjtz7u9vG8x9tnO4L1WXjkq
 Kk7mSq+tsKT1TS+3J5m6fkchZn8v8Ai33Bp343+ZCeOkU3wQpGJ4lypQtt8YU1zFbBHU
 a6Rg==
X-Gm-Message-State: AOAM532sfCH1ztGmmIb0h5QNLhuALqgQ63f9cQTONCFua4dzoUkL9VO1
 4LZRgug5B/oxVgdzznqJTCw0/A==
X-Google-Smtp-Source: ABdhPJzUy9ly8p+SLiavJ9BKitIr/u1yhyT0YsuMn67VcX04qwQ3j5s9wv1SqM2pmt52VJ2SM9FgGw==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr4528664wrp.172.1621520329643; 
 Thu, 20 May 2021 07:18:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g128sm2855701wme.0.2021.05.20.07.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 07:18:49 -0700 (PDT)
Date: Thu, 20 May 2021 16:18:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
Message-ID: <YKZvx0UXYnJrfVw4@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cbba7b7-d7e5-9c76-c747-4e39542268a2@daenzer.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 10:13:38AM +0200, Michel Dänzer wrote:
> On 2021-05-20 9:55 a.m., Daniel Vetter wrote:
> > On Wed, May 19, 2021 at 5:48 PM Michel Dänzer <michel@daenzer.net> wrote:
> >>
> >> On 2021-05-19 5:21 p.m., Jason Ekstrand wrote:
> >>> On Wed, May 19, 2021 at 5:52 AM Michel Dänzer <michel@daenzer.net> wrote:
> >>>>
> >>>> On 2021-05-19 12:06 a.m., Jason Ekstrand wrote:
> >>>>> On Tue, May 18, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>>>>>
> >>>>>> On Tue, May 18, 2021 at 7:40 PM Christian König
> >>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>>>>
> >>>>>>> Am 18.05.21 um 18:48 schrieb Daniel Vetter:
> >>>>>>>> On Tue, May 18, 2021 at 2:49 PM Christian König
> >>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>>>>>
> >>>>>>>>> And as long as we are all inside amdgpu we also don't have any oversync,
> >>>>>>>>> the issue only happens when we share dma-bufs with i915 (radeon and
> >>>>>>>>> AFAIK nouveau does the right thing as well).
> >>>>>>>> Yeah because then you can't use the amdgpu dma_resv model anymore and
> >>>>>>>> have to use the one atomic helpers use. Which is also the one that
> >>>>>>>> e.g. Jason is threathening to bake in as uapi with his dma_buf ioctl,
> >>>>>>>> so as soon as that lands and someone starts using it, something has to
> >>>>>>>> adapt _anytime_ you have a dma-buf hanging around. Not just when it's
> >>>>>>>> shared with another device.
> >>>>>>>
> >>>>>>> Yeah, and that is exactly the reason why I will NAK this uAPI change.
> >>>>>>>
> >>>>>>> This doesn't works for amdgpu at all for the reasons outlined above.
> >>>>>>
> >>>>>> Uh that's really not how uapi works. "my driver is right, everyone
> >>>>>> else is wrong" is not how cross driver contracts are defined. If that
> >>>>>> means a perf impact until you've fixed your rules, that's on you.
> >>>>>>
> >>>>>> Also you're a few years too late with nacking this, it's already uapi
> >>>>>> in the form of the dma-buf poll() support.
> >>>>>
> >>>>> ^^  My fancy new ioctl doesn't expose anything that isn't already
> >>>>> there.  It just lets you take a snap-shot of a wait instead of doing
> >>>>> an active wait which might end up with more fences added depending on
> >>>>> interrupts and retries.  The dma-buf poll waits on all fences for
> >>>>> POLLOUT and only the exclusive fence for POLLIN.  It's already uAPI.
> >>>>
> >>>> Note that the dma-buf poll support could be useful to Wayland compositors for the same purpose as Jason's new ioctl (only using client buffers which have finished drawing for an output frame, to avoid missing a refresh cycle due to client drawing), *if* it didn't work differently with amdgpu.
> >>>>
> >>>> Am I understanding correctly that Jason's new ioctl would also work differently with amdgpu as things stand currently? If so, that would be a real bummer and might hinder adoption of the ioctl by Wayland compositors.
> >>>
> >>> My new ioctl has identical semantics to poll().  It just lets you take
> >>> a snapshot in time to wait on later instead of waiting on whatever
> >>> happens to be set right now.  IMO, having identical semantics to
> >>> poll() isn't something we want to change.
> >>
> >> Agreed.
> >>
> >> I'd argue then that making amdgpu poll semantics match those of other drivers is a pre-requisite for the new ioctl, otherwise it seems unlikely that the ioctl will be widely adopted.
> > 
> > This seems backwards, because that means useful improvements in all
> > other drivers are stalled until amdgpu is fixed.
> > 
> > I think we need agreement on what the rules are, reasonable plan to
> > get there, and then that should be enough to unblock work in the wider
> > community. Holding the community at large hostage because one driver
> > is different is really not great.
> 
> I think we're in violent agreement. :) The point I was trying to make is
> that amdgpu really needs to be fixed to be consistent with other drivers
> ASAP.

It's not that easy at all. I think best case we're looking at about a one
year plan to get this into shape, taking into account usual release/distro
update latencies.

Best case.

But also it's not a really big issue, since this shouldn't stop
compositors from using poll on dma-buf fd or the sync_file stuff from
Jason: The use-case for this in compositors is to avoid a single client
stalling the entire desktop. If a driver lies by not setting the exclusive
fence when expected, you simply don't get this stall avoidance benefit of
misbehaving clients. But also this needs a gpu scheduler and higher
priority for the compositor (or a lot of hw planes so you can composite
with them alone), so it's all fairly academic issue.

Iow amdgpu being different on these wont cause any actual issues I think.

The only case that does break is when the compositor does an mmap on the
dma-buf fd and relies on poll to indicate when the rendering is done. Not
even sure amdgpu supports mmap on dma-buf or not. That's the only case I
could think of which would result in actual corruption anywhere, and not
just stalls when no one expects them.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
