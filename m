Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1368935C9A0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 17:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F4789BFD;
	Mon, 12 Apr 2021 15:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D3589906;
 Mon, 12 Apr 2021 15:20:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id u20so2517976wmj.0;
 Mon, 12 Apr 2021 08:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=CvbzxVmPS3hVkxLnzRYgOxFAxnXKIGk09rQ9j7ZYOeQ=;
 b=OJLboiBFRTT8GbXnqKZHaxLxk4WyKoLsz33MrdQFiH1KDr6A+S8Fuy0chAzLWGQwdq
 kvcZraotTFlseRMN38Lg0LCLjU7MkSSutGFJ1142JJxGeMJEUiBSKuE7uFSwpT8anmXw
 w9qlKPM8V8UQwkk3LXzQ9jLZD2dh2ZZ6tPzqMSO3c9sChO308y6Gfum4WQqgmNShLHwm
 ZyION5eg4E5dHifid4mBGbgla1fJVQKTMo+I+kD/pehx4R1QiPsSX5Zx4FAWSD8NcMNY
 L1szYZkcJrg8Ov1FoT7zxqBAfJURRiE7JK2cpEy5R+vVY/fG3i4UuJK6FOE5NNTGG2B0
 gPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=CvbzxVmPS3hVkxLnzRYgOxFAxnXKIGk09rQ9j7ZYOeQ=;
 b=LwrV3LOYBQbU69cxfXDtoIwF/7faFzyZKN57ZBM+rF4LrHkGSk2x75pQRAtju2/4Xu
 rGUHJjJEk8KTglqobZjNSLJiS3BQq78FIxqNo8tMnrVWGPNCjnSsrYsx9zj8r4qNJ5S/
 smdo6e5NToGZ+h5JuVWlnw4dkMf5L8cfmC1q+GtlrRjoNGmLY+gLGuGhWnValYCrINMo
 MlP7jDB9Dpdwhr/poBzgvjOOsZJ79qJjjjHk7COklEuoPpdwRJ1mdGFYRdveckovpFON
 NVuLENQopv99Va1wR3WD3XIvH4gx0WIr5IWrzQ4EpvcTs1wgRNzZuiOSJXHRRi1Hgnu1
 /38A==
X-Gm-Message-State: AOAM530YrBm7EgWqaGVOoni2cqXUm4cGvcmLQKy7uO1Vtt7oFPTk/TEs
 JgZi5xZaR0gSopwqWqYIcxKUgG9tuA6TBSUrMjc=
X-Google-Smtp-Source: ABdhPJw3+xfhIiqHzE4sXndlY8DDlfeVvlaNzWB+1RepEbc49byBhz5BmdiPQ8YwLjEM2ImZRZp9YJAO2bJcVfSB+Ms=
X-Received: by 2002:a7b:c012:: with SMTP id c18mr25316690wmb.94.1618240804111; 
 Mon, 12 Apr 2021 08:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210405174532.1441497-1-robdclark@gmail.com>
 <YG7l0LwVQ2s4Y0Sa@phenom.ffwll.local>
 <CAF6AEGsH2gbKv-Q04gRbjz=ue1TF7S_6DXa06bvYPcmYvG684w@mail.gmail.com>
 <YHRZA+WBbWrUdpAV@phenom.ffwll.local>
In-Reply-To: <YHRZA+WBbWrUdpAV@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 12 Apr 2021 08:23:33 -0700
Message-ID: <CAF6AEGv+ewxwtP4PN1G_gjdE0DW_LiukYbZoL-isFsGTRbcbOQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm/msm: Swappable GEM objects
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 7:28 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Apr 08, 2021 at 08:23:42AM -0700, Rob Clark wrote:
> > On Thu, Apr 8, 2021 at 4:15 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, Apr 05, 2021 at 10:45:23AM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > One would normally hope not to be under enough memory pressure to need
> > > > to swap GEM objects to disk backed swap.  But memory backed zram swap
> > > > (as enabled on chromebooks, for example) can actually be quite fast
> > > > and useful on devices with less RAM.  On a 4GB device, opening up ~4
> > > > memory intensive web pages (in separate windows rather than tabs, to try
> > > > and prevent tab discard), I see ~500MB worth of GEM objects, of which
> > > > maybe only 10% are active at any time, and with unpin/evict enabled,
> > > > only about half resident (which is a number that gets much lower if you
> > > > simulate extreme memory pressure).  Assuming a 2:1 compression ratio (I
> > > > see a bit higher in practice, but cannot isolate swapped out GEM pages
> > > > vs other), that is like having an extra 100+MB of RAM, or more under
> > > > higher memory pressure.
> > > >
> > > > Rob Clark (8):
> > > >   drm/msm: ratelimit GEM related WARN_ON()s
> > > >   drm/msm: Reorganize msm_gem_shrinker_scan()
> > > >   drm/msm: Clear msm_obj->sgt in put_pages()
> > > >   drm/msm: Split iova purge and close
> > > >   drm/msm: Add $debugfs/gem stats on resident objects
> > > >   drm/msm: Track potentially evictable objects
> > > >   drm/msm: Small msm_gem_purge() fix
> > > >   drm/msm: Support evicting GEM objects to swap
> > >
> > > Given how much entertainement shrinkers are, should we aim for more common
> > > code here?
> > >
> > > Christian has tons of fun with adding something like this for ttm (well
> > > different shades of grey). i915 is going to adopt ttm, at least for
> > > discrete.
> > >
> > > The locking is also an utter pain, and msm seems to still live a lot in
> > > its own land here. I think as much as possible a standard approach here
> > > would be really good, ideally maybe as building blocks shared between ttm
> > > and gem-shmem drivers ...
> >
> > I don't disagree.. but also replacing the engines on an airplane
> > mid-flight isn't a great option either.. ;-)
> >
> > The hard part (esp. wrt to locking) is tracking the state of a given
> > bo.. ie. is it active, active+purgable, inactive+purgable,
> > inactive+unpinnable, etc.  Currently the shmem helpers don't really
> > provide anything here.  If they did, I suppose they could provide some
> > shrinker helpers as well.  Unfortunately these days I barely have
> > enough time for drm/msm, let alone bolting this onto the shmem
> > helpers.  I would recommend that if someone wanted to do this, that
> > they look at recent drm/msm shrinker patches that I've sent (ie. make
> > shrinker->count() lockless, and drop the locks in shrinker->scan()
> > body.. when the system is under heavy memory pressure, you start
> > getting shrinker called from all the threads so contention for mm_lock
> > can be a really bad problem)
> >
> > (Well, the other potential problem is that drm/msm has a lot of
> > different possible iommu pairings across the generations, so there is
> > some potential here to uncover exciting new bugs.. the locking at
> > least is the same for all the generations and pretty easy to test with
> > and without lockdep with some tests that push essentially all memory
> > into swap)
>
> So what we aimed for with i915 and discrete gpu is to first align on
> locking with dma_resv_lock for all buffer state, plus a bunch of
> lru/allocator locks for lists and stuff.
>
> And then with more aligned locking, figure out how to maybe share more
> code.
>
> The trouble is that right now neither shmem helpers, nor drivers using
> them, are really using dma_resv_lock to protect their per-buffer state.

We are actually already using dma_resv_lock() since a few release
cycles back.. msm_gem_lock() and friends are a wrapper around that
from the migration away from using our own lock).. the mm_lock is
symply protecting the lists, not the objects

> So yeah it's a bit an awkward situation, and I don't know myself really
> how to get out of it. Lack of people with tons of free time doesn't help
> much.
>
> So best case I think is that every time we touch helpers or drivers
> locking in a big way, we check whether it's at least slightly going
> towards dma_resv_lock or not. And at least make sure we're not going
> backwards, and maybe not spin wheels at standstill.
>
> I guess my question is, what would be good to have to make sure we at
> least all agree on the overall direction?

I guess if gem_shmem users aren't already using resv lock, moving in
that directly would be a good idea.  Maybe it would make sense to
build more object state tracking into gem_shmem helpers (ie. so you
can know which buffers are active/purgable/unpinnable/etc without
traversing a list of *all* gem objects).. that seems like pushing it
more in the direction of being ttm-style frameworky compared to the
simple helper API that it is now.  But maybe that is a good thing?

BR,
-R

> -Daniel
>
> >
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > >
> > > >  drivers/gpu/drm/msm/msm_drv.c          |   2 +-
> > > >  drivers/gpu/drm/msm/msm_drv.h          |  13 ++-
> > > >  drivers/gpu/drm/msm/msm_gem.c          | 155 +++++++++++++++++--------
> > > >  drivers/gpu/drm/msm/msm_gem.h          |  68 +++++++++--
> > > >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 129 ++++++++++++--------
> > > >  drivers/gpu/drm/msm/msm_gpu_trace.h    |  13 +++
> > > >  6 files changed, 272 insertions(+), 108 deletions(-)
> > > >
> > > > --
> > > > 2.30.2
> > > >
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
