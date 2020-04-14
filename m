Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFD11A7ECE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 15:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BEA6E0F0;
	Tue, 14 Apr 2020 13:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1398689DBC;
 Tue, 14 Apr 2020 13:50:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x4so13057554wmj.1;
 Tue, 14 Apr 2020 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XR6wXNItEYNWu6o1RZxk9MH20aHAx2gBzummh9jAxy4=;
 b=ZrpzyggDbOUgs2Vgs3Y6ZtNLBDX/4xYt+cQgeSVGNVIDl/di2F5DvK8yArZ92Z4MQQ
 cGGXfCSSQvk+GXf6GXxu4B6N63LxxmRg9KgQ2O08nEz4ThJbIRf/VqXwKgtFKp2zhWrk
 f0sV1TzSB0zu57pnSjWxQh+hchbAXt/6fsuAP9iI+6qPgJNqiLZGkJLztyDHiW3dqNI/
 NyCXODjBwwzNFcdv59tOT/4PQOr0wIKEk4XISFv2o1i4cjdwDNny0w4HVet4dkAnpWqQ
 RcOQ7w5emujykLdANHBPsDtIreQUkkeA/V3hUrr5irJPkZpCXGlO4Ed3WeMMpv/mJXyG
 26cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XR6wXNItEYNWu6o1RZxk9MH20aHAx2gBzummh9jAxy4=;
 b=LaGB7gMcGvR0BsZ0TNU0BI+ZgQvEHCGfjSMnkmJzHpSOpaUN1Jm2MewfgiIxlhHyGt
 uz+arP6kCkjfSMK8ejIvlAM1KOhCIqyrozrLHbn9dRqmDnYVzxbs3+lxkNULLZiZEEMi
 QNGEHLF9QAPaRl0e2hcgCFvCk+MiivnfsLzRFVW+ZnvQAoA9287x+36FWMiwlgJRj1uY
 ApQvn16XYVNjY/pDPYtMyLS3KY64kxw4gJwiXMs9OBfdzYveiokx33UL8xh6NyAcYNhD
 Rj0tZDZS/fgwLfjF27rxrWaiMe6jVf3nI7n0WAwKt1P3WO1UgsIA5KJk1xA/i1TrvZLF
 206w==
X-Gm-Message-State: AGi0Pubb52Q2ry35vaZ8lhnt1i24WIrXANV4gdPGHesWSKc3Eupk6Wdp
 TzMh6w84FeaAf5p6cA8A5wqfKkT+sMUK9RhomtiSyQBfKVVCWQ==
X-Google-Smtp-Source: APiQypJ/MIb8WScQ8OMCaoQIIUZSWESIr/e/wptylz7IRNlW+x9Eqtr/+JcBFI1U3aLByWYhQA7DCphcxSKw3tp3EQI=
X-Received: by 2002:a1c:9a87:: with SMTP id
 c129mr22431150wme.149.1586872255522; 
 Tue, 14 Apr 2020 06:50:55 -0700 (PDT)
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
In-Reply-To: <CAKMK7uHwX9NbGb1ptnP=CAwxDayfM_z9kvFMMb=YiH+ynjNqKQ@mail.gmail.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Tue, 14 Apr 2020 09:50:44 -0400
Message-ID: <CAOWid-dJckd8kV57MKNA_W83SN4OHnOGPURL7oOm-SqoYRLX=w@mail.gmail.com>
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

Hi Daniel,

I appreciate many of your review so far and I much prefer keeping
things technical but that is very difficult to do when I get Intel
developers calling my implementation "most AMD-specific solution
possible" and objecting to an implementation because their hardware
cannot support it.  Can you help me with a more charitable
interpretation of what has been happening?

Perhaps the following questions can help keep the discussion technical:
1)  Is it possible to implement non-work-conserving distribution of
GPU without spatial sharing?  (If yes, I'd love to hear a suggestion,
if not...question 2.)
2)  If spatial sharing is required to support GPU HPC use cases, what
would you implement if you have the hardware support today?

Regards,
Kenny

On Tue, Apr 14, 2020 at 9:26 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Apr 14, 2020 at 3:14 PM Kenny Ho <y2kenny@gmail.com> wrote:
> >
> > Ok.  I was hoping you can clarify the contradiction between the
> > existance of the spec below and your "not something any other gpu can
> > reasonably support" statement.  I mean, OneAPI is Intel's spec and
> > doesn't that at least make SubDevice support "reasonable" for one more
> > vendor?
> >
> > Partisanship aside, as a drm co-maintainer, do you really not see the
> > need for non-work-conserving way of distributing GPU as a resource?
> > You recognized the latencies involved (although that's really just
> > part of the story... time sharing is never going to be good enough
> > even if your switching cost is zero.)  As a drm co-maintainer, are you
> > suggesting GPU has no place in the HPC use case?
>
>  So I did chat with people and my understanding for how this subdevice
> stuff works is roughly, from least to most fine grained support:
> - Not possible at all, hw doesn't have any such support
> - The hw is actually not a single gpu, but a bunch of chips behind a
> magic bridge/interconnect, and there's a scheduler load-balancing
> stuff and you can't actually run on all "cores" in parallel with one
> compute/3d job. So subdevices just give you some of these cores, but
> from client api pov they're exactly as powerful as the full device. So
> this kinda works like assigning an entire NUMA node, including all the
> cpu cores and memory bandwidth and everything.
> - Hw has multiple "engines" which share resources (like compute cores
> or whatever) behind the scenes. There's no control over how this
> sharing works really, and whether you have guarantees about minimal
> execution resources or not. This kinda works like hyperthreading.
> - Then finally we have the CU mask thing amdgpu has. Which works like
> what you're proposing, works on amd.
>
> So this isn't something that I think we should standardize in a
> resource management framework like cgroups. Because it's a complete
> mess. Note that _all_ the above things (including the "no subdevices"
> one) are valid implementations of "subdevices" in the various specs.
>
> Now on your question on "why was this added to various standards?"
> because opencl has that too (and the rocm thing, and everything else
> it seems). What I heard is that a few people pushed really hard, and
> no one objected hard enough (because not having subdevices is a
> standards compliant implementation), so that's why it happened. Just
> because it's in various standards doesn't mean that a) it's actually
> standardized in a useful fashion and b) something we should just
> blindly adopt.
>
> Also like where exactly did you understand that I'm against gpus in
> HPC uses cases. Approaching this in a slightly less tribal way would
> really, really help to get something landed (which I'd like to see
> happen, personally). Always spinning this as an Intel vs AMD thing
> like you do here with every reply really doesn't help moving this in.
>
> So yeah stricter isolation is something customers want, it's just not
> something we can really give out right now at a level below the
> device.
> -Daniel
>
> >
> > Regards,
> > Kenny
> >
> > On Tue, Apr 14, 2020 at 8:52 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Apr 14, 2020 at 2:47 PM Kenny Ho <y2kenny@gmail.com> wrote:
> > > > On Tue, Apr 14, 2020 at 8:20 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > My understanding from talking with a few other folks is that
> > > > > the cpumask-style CU-weight thing is not something any other gpu can
> > > > > reasonably support (and we have about 6+ of those in-tree)
> > > >
> > > > How does Intel plan to support the SubDevice API as described in your
> > > > own spec here:
> > > > https://spec.oneapi.com/versions/0.7/oneL0/core/INTRO.html#subdevice-support
> > >
> > > I can't talk about whether future products might or might not support
> > > stuff and in what form exactly they might support stuff or not support
> > > stuff. Or why exactly that's even in the spec there or not.
> > >
> > > Geez
> > > -Daniel
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
