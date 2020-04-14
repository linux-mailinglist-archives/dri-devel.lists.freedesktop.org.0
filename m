Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DF81A7DE0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 15:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B00890DD;
	Tue, 14 Apr 2020 13:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE015890DD
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 13:26:57 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id i27so9818909ota.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 06:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vttyhGrzxuKI6QXI/Be/PhEKNLAwpqtiJqUkLtNjOM4=;
 b=E0d1SuZ8xp8i65GKs1dBe3V5l+bY7GbupAlkvpC2iC3cJC2CEe0L1kIK97Ihu2tk46
 6bXfqJBc/M8SeRVuvvYG1vbLvlbvOBbhFO9fy5HGfJ+y7/sbJyTIWm+iqk53rCXmcHuh
 6CfnjqjqcRcWdwe40DGrQSwLHoB2xKhEfrWnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vttyhGrzxuKI6QXI/Be/PhEKNLAwpqtiJqUkLtNjOM4=;
 b=GNIczi+5Uw9R3rVqHtoMWAxb1tbIWPDtLU2bGuXo0jTD3D5u4VwNFDVOORJ+Wd5JOU
 3XSv+uLql5GfqbrRyh1/X5S96943eancc3uK3jJKSDl6ovrrAYrgEldrNdREuwXfaSMk
 0F/7xwQiL6ULNo+4grM3gQW19hXDKFpM9tikeh9UajHhwtkiaUCh/ABJAT99WPzFaapg
 XkXbfV2V4SPxMrrG+zKfXoN9DJc9tHnej5CmDuhFfbWhfCBoQlHlh4Zwujk8Em1rSzwa
 VbCL/tI/D59jbbBC8u/XSk6mDYnqnlFCXbLA3I6okb5MTKUN1Tv0LvX9XyIUpIGHE0lP
 9Rtw==
X-Gm-Message-State: AGi0Puax7C2gR3PsYPcxvPDdPzj4D7gLVnXS0Mkn3c2Uvq5eApFSRf97
 U0oCBKae08E08um7doChpfViploxf65x4ZckYLyEng==
X-Google-Smtp-Source: APiQypJiXAzdub2RgbqKGj9pM6Et9xcY9jq6+3GZTrNuGtEg8J38Nl44RqTCbi6uzvN5cMEdHu+jUsxGVWxXmH2j+jo=
X-Received: by 2002:a05:6820:221:: with SMTP id
 j1mr18562452oob.12.1586870817181; 
 Tue, 14 Apr 2020 06:26:57 -0700 (PDT)
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
In-Reply-To: <CAOWid-fwEOk+4CvUAumo=byWpq4vVUoCiwW1N6F-0aEd6G7d4A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 14 Apr 2020 15:26:45 +0200
Message-ID: <CAKMK7uHwX9NbGb1ptnP=CAwxDayfM_z9kvFMMb=YiH+ynjNqKQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
To: Kenny Ho <y2kenny@gmail.com>
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

On Tue, Apr 14, 2020 at 3:14 PM Kenny Ho <y2kenny@gmail.com> wrote:
>
> Ok.  I was hoping you can clarify the contradiction between the
> existance of the spec below and your "not something any other gpu can
> reasonably support" statement.  I mean, OneAPI is Intel's spec and
> doesn't that at least make SubDevice support "reasonable" for one more
> vendor?
>
> Partisanship aside, as a drm co-maintainer, do you really not see the
> need for non-work-conserving way of distributing GPU as a resource?
> You recognized the latencies involved (although that's really just
> part of the story... time sharing is never going to be good enough
> even if your switching cost is zero.)  As a drm co-maintainer, are you
> suggesting GPU has no place in the HPC use case?

 So I did chat with people and my understanding for how this subdevice
stuff works is roughly, from least to most fine grained support:
- Not possible at all, hw doesn't have any such support
- The hw is actually not a single gpu, but a bunch of chips behind a
magic bridge/interconnect, and there's a scheduler load-balancing
stuff and you can't actually run on all "cores" in parallel with one
compute/3d job. So subdevices just give you some of these cores, but
from client api pov they're exactly as powerful as the full device. So
this kinda works like assigning an entire NUMA node, including all the
cpu cores and memory bandwidth and everything.
- Hw has multiple "engines" which share resources (like compute cores
or whatever) behind the scenes. There's no control over how this
sharing works really, and whether you have guarantees about minimal
execution resources or not. This kinda works like hyperthreading.
- Then finally we have the CU mask thing amdgpu has. Which works like
what you're proposing, works on amd.

So this isn't something that I think we should standardize in a
resource management framework like cgroups. Because it's a complete
mess. Note that _all_ the above things (including the "no subdevices"
one) are valid implementations of "subdevices" in the various specs.

Now on your question on "why was this added to various standards?"
because opencl has that too (and the rocm thing, and everything else
it seems). What I heard is that a few people pushed really hard, and
no one objected hard enough (because not having subdevices is a
standards compliant implementation), so that's why it happened. Just
because it's in various standards doesn't mean that a) it's actually
standardized in a useful fashion and b) something we should just
blindly adopt.

Also like where exactly did you understand that I'm against gpus in
HPC uses cases. Approaching this in a slightly less tribal way would
really, really help to get something landed (which I'd like to see
happen, personally). Always spinning this as an Intel vs AMD thing
like you do here with every reply really doesn't help moving this in.

So yeah stricter isolation is something customers want, it's just not
something we can really give out right now at a level below the
device.
-Daniel

>
> Regards,
> Kenny
>
> On Tue, Apr 14, 2020 at 8:52 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Apr 14, 2020 at 2:47 PM Kenny Ho <y2kenny@gmail.com> wrote:
> > > On Tue, Apr 14, 2020 at 8:20 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > My understanding from talking with a few other folks is that
> > > > the cpumask-style CU-weight thing is not something any other gpu can
> > > > reasonably support (and we have about 6+ of those in-tree)
> > >
> > > How does Intel plan to support the SubDevice API as described in your
> > > own spec here:
> > > https://spec.oneapi.com/versions/0.7/oneL0/core/INTRO.html#subdevice-support
> >
> > I can't talk about whether future products might or might not support
> > stuff and in what form exactly they might support stuff or not support
> > stuff. Or why exactly that's even in the spec there or not.
> >
> > Geez
> > -Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
