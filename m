Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6ED389274
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 17:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FA96EDF4;
	Wed, 19 May 2021 15:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B266EDF4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 15:21:52 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id a25so15802120edr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 08:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WA9qUoEBtVJsSKCDyoyq7382SpsW/20hQVldJ/7BtjA=;
 b=lJO6FtIMwBIsId6pGxGOKybO14svkp2qQEXNPqHKUhNInXZBFlhnfhfHoqjmE/6wlI
 AmmYjAf7xqcoL7Fh9le1tn7OQvyzU+m/rKLcSgqUYE6U0o8qCSYCxAZcX5AX+kQkrXQh
 ELOFis5/y4miNV6dH2cOe0+0dXyuY9gMko5Eyn4p6RxavW/vHXl8uPOuwU3wGdJihdMy
 2M3nC0F6DiwFlDVScdU2VpEP3Z4+Qbj1xIYAJfTd6wXPxLB0+QaqGPseSEhPnjodZJ1L
 unLXGdlwWjf3IZmNgF+KmEcHKtC5bF1PJZSJ5mJEoYW2cgS0mEK9CNXWcemrieNpWPsJ
 LW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WA9qUoEBtVJsSKCDyoyq7382SpsW/20hQVldJ/7BtjA=;
 b=C6AtpBdjEl0KiyYRYFn30wmQPy5DmTUrKRP/0W6s2CzuwIOf+ujop0iJeCjc9jM41m
 OmBmS9RsA7AYqAcNwHeRBisTdeidzBLFfkqji3wcMtJIT8kmA1a2rITUVPZbE8ONRT/T
 F2Ypiw+MLM4HMS49qR+zF7JVD8+yc8nzQ823AjeVVfJmE6LdYhoi7QiadD/tAcA2Idx+
 rFV5CN8n/QkJTwHXZcHAOX3pxj7FTy8mixDJJe9lB/yH11URxGxBF/+hhcoaolBNhcYi
 Vo6qf7SkoLW796h16tBVsmvSIWQ3XKJWGPJtoAPrfC+2MJL1WAY5ViGZjWThJXDLg+T8
 siHA==
X-Gm-Message-State: AOAM533eAmQHKbCmrq459h4vxYQWfvzeZWX4gIm57Fk4PLmW0WA+REmt
 i+QD6aqyAapeM1QrK3S3RgO1b6EpPIUqVnLbI9ttig==
X-Google-Smtp-Source: ABdhPJzZDU9fo9UgdKEp/g6+yKErjdnaaHCHRCl5FwP646Eu7psLZJ7F298i7dQuLNjWIbip6h5ATmnc/4nYvQpX5sE=
X-Received: by 2002:aa7:db93:: with SMTP id u19mr15068398edt.227.1621437710623; 
 Wed, 19 May 2021 08:21:50 -0700 (PDT)
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
In-Reply-To: <14524566-8854-4bc0-9f70-b7219c9fccfc@daenzer.net>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 19 May 2021 10:21:39 -0500
Message-ID: <CAOFGe96VttW2VzAnx13ZXLBGcEDJMehGuOFifcr+pcbEOa-Brw@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 5:52 AM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:
>
> On 2021-05-19 12:06 a.m., Jason Ekstrand wrote:
> > On Tue, May 18, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Tue, May 18, 2021 at 7:40 PM Christian K=C3=B6nig
> >> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>
> >>> Am 18.05.21 um 18:48 schrieb Daniel Vetter:
> >>>> On Tue, May 18, 2021 at 2:49 PM Christian K=C3=B6nig
> >>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>
> >>>>> And as long as we are all inside amdgpu we also don't have any over=
sync,
> >>>>> the issue only happens when we share dma-bufs with i915 (radeon and
> >>>>> AFAIK nouveau does the right thing as well).
> >>>> Yeah because then you can't use the amdgpu dma_resv model anymore an=
d
> >>>> have to use the one atomic helpers use. Which is also the one that
> >>>> e.g. Jason is threathening to bake in as uapi with his dma_buf ioctl=
,
> >>>> so as soon as that lands and someone starts using it, something has =
to
> >>>> adapt _anytime_ you have a dma-buf hanging around. Not just when it'=
s
> >>>> shared with another device.
> >>>
> >>> Yeah, and that is exactly the reason why I will NAK this uAPI change.
> >>>
> >>> This doesn't works for amdgpu at all for the reasons outlined above.
> >>
> >> Uh that's really not how uapi works. "my driver is right, everyone
> >> else is wrong" is not how cross driver contracts are defined. If that
> >> means a perf impact until you've fixed your rules, that's on you.
> >>
> >> Also you're a few years too late with nacking this, it's already uapi
> >> in the form of the dma-buf poll() support.
> >
> > ^^  My fancy new ioctl doesn't expose anything that isn't already
> > there.  It just lets you take a snap-shot of a wait instead of doing
> > an active wait which might end up with more fences added depending on
> > interrupts and retries.  The dma-buf poll waits on all fences for
> > POLLOUT and only the exclusive fence for POLLIN.  It's already uAPI.
>
> Note that the dma-buf poll support could be useful to Wayland compositors=
 for the same purpose as Jason's new ioctl (only using client buffers which=
 have finished drawing for an output frame, to avoid missing a refresh cycl=
e due to client drawing), *if* it didn't work differently with amdgpu.
>
> Am I understanding correctly that Jason's new ioctl would also work diffe=
rently with amdgpu as things stand currently? If so, that would be a real b=
ummer and might hinder adoption of the ioctl by Wayland compositors.

My new ioctl has identical semantics to poll().  It just lets you take
a snapshot in time to wait on later instead of waiting on whatever
happens to be set right now.  IMO, having identical semantics to
poll() isn't something we want to change.

--Jason
