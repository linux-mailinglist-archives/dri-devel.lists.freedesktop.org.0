Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A451A7FCB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 16:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C164A6E17C;
	Tue, 14 Apr 2020 14:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0538A6E17C;
 Tue, 14 Apr 2020 14:29:37 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k11so13951442wrp.5;
 Tue, 14 Apr 2020 07:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NN/N/vC8yy9yn1dSzJq7yVqBlSa2o6+uOJvDXpLTAQU=;
 b=kd5qfu8YUtzzvDO+htmr4EI98+O8OO7zGM3RPGd2gNW/ICIyQ73uMilQJ4V+vubY+b
 DgX4ujHO4brJz1ZQspIqqP8BW6M1hx0UBPI3IpAKVyOlhdkTXd+KZ0NoTlHZvfmkKInA
 kdrqtVCm9qDKuIK3VwTYrfc+mdHLe3WBVSjR62ulMId/gIwFtT3/OFtAcct19h/9/CND
 KDPCImWv+1J8YMiu25vHssP+R79lHFR1MJAstmHLphbTdC38L4bg5gdN1RvmjAc9y/SQ
 XoLFD6f4b6hnr6ZAarf8MqaJSNIhGllnWgZcafYnMjhvRb9fKcf5fryRxD+Tcu0gj8yt
 HOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NN/N/vC8yy9yn1dSzJq7yVqBlSa2o6+uOJvDXpLTAQU=;
 b=RafvfOhZ7NSI2NXYCDcFp/8iqFFQMMieUoHvWD4pyMXr1+ZSdfNqvYU6v1V6clGorZ
 tARwsiuOjDRl247PdMTGJtHSkyKgPsQtC7XRt+eoLwx3wP+HTN6EdJPC0ovA/A/kxhma
 ke2zPryzicGX7rJa0y4NlWP42JbnB9W7n1optE0XhsaHAdCSyMgZQwk7ESJECZjb792K
 eYDCfziUq9rwKPuitsWOJQyrgwmZbjv+dAzwR9KQ8yc3Vs6FIxZ3Ev15wmuFGnd9havT
 FM8AHZvnEF5sfDz5+EjNsSLvxutMGPUJx95NUsE6BvOS2n0ErCMotWqNoL4ea+MVIsUD
 EaUA==
X-Gm-Message-State: AGi0PuY5bKjDVcBIZf/uVOMCaOhzLuvN48yxMId33mqzKNPHK5McOJr2
 GBUrg25LaVVU0jb0GIYFp7noURzTaqzSb2AkKUs=
X-Google-Smtp-Source: APiQypK7DVeTHvRVNA7KWmL1h/VYKQr9zjeXnI1NBaki6BszL6NTZkquqm2KSKdABHLA0JjFyUi7Zz3UL1kRuKfcT24=
X-Received: by 2002:a5d:50c9:: with SMTP id f9mr5299226wrt.191.1586874575556; 
 Tue, 14 Apr 2020 07:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200226190152.16131-1-Kenny.Ho@amd.com>
 <CAOWid-eyMGZfOyfEQikwCmPnKxx6MnTm17pBvPeNpgKWi0xN-w@mail.gmail.com>
 <20200324184633.GH162390@mtj.duckdns.org>
 <CAOWid-cS-5YkFBLACotkZZCH0RSjHH94_r3VFH8vEPOubzSpPA@mail.gmail.com>
 <20200413191136.GI60335@mtj.duckdns.org>
 <20200414122015.GR3456981@phenom.ffwll.local>
 <CAOWid-f-XWyg0o3znH28xYndZ0OMzWfv3OOuWw08iJDKjrqFGA@mail.gmail.com>
 <CAKMK7uEs5QvUrxKcTFksO30D+x=XJnV+_TA-ebawcihtLqDG0Q@mail.gmail.com>
 <CAOWid-fwEOk+4CvUAumo=byWpq4vVUoCiwW1N6F-0aEd6G7d4A@mail.gmail.com>
 <CAKMK7uHwX9NbGb1ptnP=CAwxDayfM_z9kvFMMb=YiH+ynjNqKQ@mail.gmail.com>
 <CAOWid-dJckd8kV57MKNA_W83SN4OHnOGPURL7oOm-SqoYRLX=w@mail.gmail.com>
 <CAKMK7uGWxE-gDa25mi4EtLqPKZZfacm0VhTem=StHAQABRAkUQ@mail.gmail.com>
In-Reply-To: <CAKMK7uGWxE-gDa25mi4EtLqPKZZfacm0VhTem=StHAQABRAkUQ@mail.gmail.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Tue, 14 Apr 2020 10:29:24 -0400
Message-ID: <CAOWid-eaASFFdA5zLxaLO72OGsUVz_BgM-sGP2OQykXCzizmnw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, dri-devel <dri-devel@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 10:04 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> This has _nothing_ to do with Intel (I think over the past 25 years or
> so intel has implemented all 4 versions of gpu splitting that I
> listed, but not entirely sure).
>
> So again pls less tribal fighting, more collaboration. If you can't do
> that, let's pick nouveau/nvidia as arbitrary neutral ground.

So are you saying Intel has implemented a form of masking before?  I
don't think we need to just pick a vendor as a neutral ground.  The
idea of spatial sharing vs time sharing is not vendor specific... it's
not even GPU specific.  This is why I asked the two questions below.

> > Perhaps the following questions can help keep the discussion technical:
> > 1)  Is it possible to implement non-work-conserving distribution of
> > GPU without spatial sharing?  (If yes, I'd love to hear a suggestion,
> > if not...question 2.)
> > 2)  If spatial sharing is required to support GPU HPC use cases, what
> > would you implement if you have the hardware support today?
>
> The thing we can currently do in upstream (from how I'm understanding
> hw) is assign entire PCI devices to containers, so essentially only
> the entire /dev/dri/* cdev. That works, and it works across all
> drivers we have in upstream right now.
>
> Anything more fine-grained I don't think is currently possible,
> because everyone has a different idea of how to split up gpus. It
> would be nice to have it, but in upstream, cross-vendor, I'm just not
> seeing it happen right now.

I understand the reality, but what would you implement to support the
concept (GPU in HPC, which you said you are not against) if you have
the hw support today?  How would you support low-jitter/low-latency
sharing of a single GPU if you have whatever hardware support you need
today?

Regards,
Kenny


> > On Tue, Apr 14, 2020 at 9:26 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Apr 14, 2020 at 3:14 PM Kenny Ho <y2kenny@gmail.com> wrote:
> > > >
> > > > Ok.  I was hoping you can clarify the contradiction between the
> > > > existance of the spec below and your "not something any other gpu can
> > > > reasonably support" statement.  I mean, OneAPI is Intel's spec and
> > > > doesn't that at least make SubDevice support "reasonable" for one more
> > > > vendor?
> > > >
> > > > Partisanship aside, as a drm co-maintainer, do you really not see the
> > > > need for non-work-conserving way of distributing GPU as a resource?
> > > > You recognized the latencies involved (although that's really just
> > > > part of the story... time sharing is never going to be good enough
> > > > even if your switching cost is zero.)  As a drm co-maintainer, are you
> > > > suggesting GPU has no place in the HPC use case?
> > >
> > >  So I did chat with people and my understanding for how this subdevice
> > > stuff works is roughly, from least to most fine grained support:
> > > - Not possible at all, hw doesn't have any such support
> > > - The hw is actually not a single gpu, but a bunch of chips behind a
> > > magic bridge/interconnect, and there's a scheduler load-balancing
> > > stuff and you can't actually run on all "cores" in parallel with one
> > > compute/3d job. So subdevices just give you some of these cores, but
> > > from client api pov they're exactly as powerful as the full device. So
> > > this kinda works like assigning an entire NUMA node, including all the
> > > cpu cores and memory bandwidth and everything.
> > > - Hw has multiple "engines" which share resources (like compute cores
> > > or whatever) behind the scenes. There's no control over how this
> > > sharing works really, and whether you have guarantees about minimal
> > > execution resources or not. This kinda works like hyperthreading.
> > > - Then finally we have the CU mask thing amdgpu has. Which works like
> > > what you're proposing, works on amd.
> > >
> > > So this isn't something that I think we should standardize in a
> > > resource management framework like cgroups. Because it's a complete
> > > mess. Note that _all_ the above things (including the "no subdevices"
> > > one) are valid implementations of "subdevices" in the various specs.
> > >
> > > Now on your question on "why was this added to various standards?"
> > > because opencl has that too (and the rocm thing, and everything else
> > > it seems). What I heard is that a few people pushed really hard, and
> > > no one objected hard enough (because not having subdevices is a
> > > standards compliant implementation), so that's why it happened. Just
> > > because it's in various standards doesn't mean that a) it's actually
> > > standardized in a useful fashion and b) something we should just
> > > blindly adopt.
> > >
> > > Also like where exactly did you understand that I'm against gpus in
> > > HPC uses cases. Approaching this in a slightly less tribal way would
> > > really, really help to get something landed (which I'd like to see
> > > happen, personally). Always spinning this as an Intel vs AMD thing
> > > like you do here with every reply really doesn't help moving this in.
> > >
> > > So yeah stricter isolation is something customers want, it's just not
> > > something we can really give out right now at a level below the
> > > device.
> > > -Daniel
> > >
> > > >
> > > > Regards,
> > > > Kenny
> > > >
> > > > On Tue, Apr 14, 2020 at 8:52 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Tue, Apr 14, 2020 at 2:47 PM Kenny Ho <y2kenny@gmail.com> wrote:
> > > > > > On Tue, Apr 14, 2020 at 8:20 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > My understanding from talking with a few other folks is that
> > > > > > > the cpumask-style CU-weight thing is not something any other gpu can
> > > > > > > reasonably support (and we have about 6+ of those in-tree)
> > > > > >
> > > > > > How does Intel plan to support the SubDevice API as described in your
> > > > > > own spec here:
> > > > > > https://spec.oneapi.com/versions/0.7/oneL0/core/INTRO.html#subdevice-support
> > > > >
> > > > > I can't talk about whether future products might or might not support
> > > > > stuff and in what form exactly they might support stuff or not support
> > > > > stuff. Or why exactly that's even in the spec there or not.
> > > > >
> > > > > Geez
> > > > > -Daniel
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
