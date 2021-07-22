Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B0A3D209C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221CE6EB34;
	Thu, 22 Jul 2021 09:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236296EB2C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 09:15:40 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so1111163wmh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t2sqSgHMv5pZXj+4Xgga/Ht4CAYg011YBMc2kdS7vKE=;
 b=R11rA1a4/m5oCBc1FWoHbl4IVYQX4cU1kzor0zyd82Em9JboMdaAMIAOGacgCvkuZQ
 EFfIzBwnkWBowFGwENZg3pJj1tRSdCOzLUsB9+z++hRx7UxlzAUxfBaloxKuK1wjjlgk
 2lLd5MAcPXmXldXp+cYViYQ6Ovzyl/WwRl+EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t2sqSgHMv5pZXj+4Xgga/Ht4CAYg011YBMc2kdS7vKE=;
 b=LtgJjWT4rAVWHnTV13eAWK/XgTMkqZ7RNsIWn+Z3rprEpZjMEpqyK+XbLDgE4CawoV
 vgxodAq5J331re8o79GxWd3h68OOOtEG1Mg55+l2d3ujGP5FiXjEiPuXY/uyhYX88en0
 hCEm1v7/aRG9GdA5fm3hf2o8n9YRiFI3rkyQA7i7HSYMR0vqxWOV581K5p2xw+k0feLo
 6CqhJBxpUM44VS+PETERujOfDYyMCyuBmijW0+h/eklc+/IM+Nk+pxKRmMqvRqS4Z4ni
 gTg70l/ziJfgLfcCV1N/3bCVx1eM0P4A0CdCnN6wFbZUqJPiP2fajTUAgnA/pvq5fuqx
 eO7g==
X-Gm-Message-State: AOAM532rJHw7iRzRevPP+OiGN3coxyiEnoLtysxNp2LyYgAo1xrscNg3
 boXVZnWLgjeG7hQhTJbmw96vzPi0p1SAbA==
X-Google-Smtp-Source: ABdhPJypNhNF7ewilSptp36qW//99u0G+kS50Kc1K6Ez+Lfkimt1YZK24lUP8NqJ4M601LPDh3/sxw==
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr3611190wmq.77.1626945338644; 
 Thu, 22 Jul 2021 02:15:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b8sm2090020wmb.20.2021.07.22.02.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 02:15:38 -0700 (PDT)
Date: Thu, 22 Jul 2021 11:15:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH] drm/i915: Ditch i915 globals shrink infrastructure
Message-ID: <YPk3OCMrhg7UlU6T@phenom.ffwll.local>
References: <20210721183229.4136488-1-daniel.vetter@ffwll.ch>
 <CAOFGe97MQZ0JSNfq4eJs2rN3rRhGadaRUh3=_2Oy=Kaq7V2suw@mail.gmail.com>
 <CAKMK7uFysP6a8zAPUa9ux1ahz7pzyNFj9u_VXx7bwG=BbGH9ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFysP6a8zAPUa9ux1ahz7pzyNFj9u_VXx7bwG=BbGH9ww@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 10:24:01PM +0200, Daniel Vetter wrote:
> On Wed, Jul 21, 2021 at 10:17 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > On Wed, Jul 21, 2021 at 1:32 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > This essentially reverts
> > >
> > > commit 84a1074920523430f9dc30ff907f4801b4820072
> > > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > > Date:   Wed Jan 24 11:36:08 2018 +0000
> > >
> > >     drm/i915: Shrink the GEM kmem_caches upon idling
> > >
> > > mm/vmscan.c:do_shrink_slab() is a thing, if there's an issue with it
> > > then we need to fix that there, not hand-roll our own slab shrinking
> > > code in i915.
> > >
> > > Noticed while reviewing a patch set from Jason to fix up some issues
> > > in our i915_init() and i915_exit() module load/cleanup code. Now that
> > > i915_globals.c isn't any different than normal init/exit functions, we
> > > should convert them over to one unified table and remove
> > > i915_globals.[hc] entirely.
> >
> > Mind throwing in a comment somewhere about how i915 is one of only two
> > users of kmem_cache_shrink() in the entire kernel?  That also seems to
> > be pretty good evidence that it's not useful.
> 
> I missed one, there's also on in kunit (I think just got in, it's from
> this year at least per commit). That one seems actually legit, it's a
> selftest for some statistics around slabs I think, so has a legit
> reason to carefully control the state and trim anything that just
> hangs around.
> 
> I'll add something and push when CI approves.
> 
> > Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> >
> > Feel free to land at-will and I'll deal with merge conflicts on my end.
> 
> I think if we can land this, then yours, then I type the conversion to
> explicit init/exit and we're done.

CI approved, merged as discussed. I'll look at your series now.
-Daniel

> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_context.c |  6 --
> > >  drivers/gpu/drm/i915/gem/i915_gem_object.c  |  6 --
> > >  drivers/gpu/drm/i915/gt/intel_context.c     |  6 --
> > >  drivers/gpu/drm/i915/gt/intel_gt_pm.c       |  4 -
> > >  drivers/gpu/drm/i915/i915_active.c          |  6 --
> > >  drivers/gpu/drm/i915/i915_globals.c         | 95 ---------------------
> > >  drivers/gpu/drm/i915/i915_globals.h         |  3 -
> > >  drivers/gpu/drm/i915/i915_request.c         |  7 --
> > >  drivers/gpu/drm/i915/i915_scheduler.c       |  7 --
> > >  drivers/gpu/drm/i915/i915_vma.c             |  6 --
> > >  10 files changed, 146 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > index 7d6f52d8a801..bf2a2319353a 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > @@ -2280,18 +2280,12 @@ i915_gem_engines_iter_next(struct i915_gem_engines_iter *it)
> > >  #include "selftests/i915_gem_context.c"
> > >  #endif
> > >
> > > -static void i915_global_gem_context_shrink(void)
> > > -{
> > > -       kmem_cache_shrink(global.slab_luts);
> > > -}
> > > -
> > >  static void i915_global_gem_context_exit(void)
> > >  {
> > >         kmem_cache_destroy(global.slab_luts);
> > >  }
> > >
> > >  static struct i915_global_gem_context global = { {
> > > -       .shrink = i915_global_gem_context_shrink,
> > >         .exit = i915_global_gem_context_exit,
> > >  } };
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > > index 9da7b288b7ed..5c21cff33199 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > > @@ -664,18 +664,12 @@ void i915_gem_init__objects(struct drm_i915_private *i915)
> > >         INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
> > >  }
> > >
> > > -static void i915_global_objects_shrink(void)
> > > -{
> > > -       kmem_cache_shrink(global.slab_objects);
> > > -}
> > > -
> > >  static void i915_global_objects_exit(void)
> > >  {
> > >         kmem_cache_destroy(global.slab_objects);
> > >  }
> > >
> > >  static struct i915_global_object global = { {
> > > -       .shrink = i915_global_objects_shrink,
> > >         .exit = i915_global_objects_exit,
> > >  } };
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > > index bd63813c8a80..c1338441cc1d 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > > @@ -398,18 +398,12 @@ void intel_context_fini(struct intel_context *ce)
> > >         i915_active_fini(&ce->active);
> > >  }
> > >
> > > -static void i915_global_context_shrink(void)
> > > -{
> > > -       kmem_cache_shrink(global.slab_ce);
> > > -}
> > > -
> > >  static void i915_global_context_exit(void)
> > >  {
> > >         kmem_cache_destroy(global.slab_ce);
> > >  }
> > >
> > >  static struct i915_global_context global = { {
> > > -       .shrink = i915_global_context_shrink,
> > >         .exit = i915_global_context_exit,
> > >  } };
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > > index aef3084e8b16..d86825437516 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > > @@ -67,8 +67,6 @@ static int __gt_unpark(struct intel_wakeref *wf)
> > >
> > >         GT_TRACE(gt, "\n");
> > >
> > > -       i915_globals_unpark();
> > > -
> > >         /*
> > >          * It seems that the DMC likes to transition between the DC states a lot
> > >          * when there are no connected displays (no active power domains) during
> > > @@ -116,8 +114,6 @@ static int __gt_park(struct intel_wakeref *wf)
> > >         GEM_BUG_ON(!wakeref);
> > >         intel_display_power_put_async(i915, POWER_DOMAIN_GT_IRQ, wakeref);
> > >
> > > -       i915_globals_park();
> > > -
> > >         return 0;
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> > > index b1aa1c482c32..91723123ae9f 100644
> > > --- a/drivers/gpu/drm/i915/i915_active.c
> > > +++ b/drivers/gpu/drm/i915/i915_active.c
> > > @@ -1176,18 +1176,12 @@ struct i915_active *i915_active_create(void)
> > >  #include "selftests/i915_active.c"
> > >  #endif
> > >
> > > -static void i915_global_active_shrink(void)
> > > -{
> > > -       kmem_cache_shrink(global.slab_cache);
> > > -}
> > > -
> > >  static void i915_global_active_exit(void)
> > >  {
> > >         kmem_cache_destroy(global.slab_cache);
> > >  }
> > >
> > >  static struct i915_global_active global = { {
> > > -       .shrink = i915_global_active_shrink,
> > >         .exit = i915_global_active_exit,
> > >  } };
> > >
> > > diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> > > index 77f1911c463b..7fe2e503897b 100644
> > > --- a/drivers/gpu/drm/i915/i915_globals.c
> > > +++ b/drivers/gpu/drm/i915/i915_globals.c
> > > @@ -17,61 +17,8 @@
> > >
> > >  static LIST_HEAD(globals);
> > >
> > > -static atomic_t active;
> > > -static atomic_t epoch;
> > > -static struct park_work {
> > > -       struct delayed_work work;
> > > -       struct rcu_head rcu;
> > > -       unsigned long flags;
> > > -#define PENDING 0
> > > -       int epoch;
> > > -} park;
> > > -
> > > -static void i915_globals_shrink(void)
> > > -{
> > > -       struct i915_global *global;
> > > -
> > > -       /*
> > > -        * kmem_cache_shrink() discards empty slabs and reorders partially
> > > -        * filled slabs to prioritise allocating from the mostly full slabs,
> > > -        * with the aim of reducing fragmentation.
> > > -        */
> > > -       list_for_each_entry(global, &globals, link)
> > > -               global->shrink();
> > > -}
> > > -
> > > -static void __i915_globals_grace(struct rcu_head *rcu)
> > > -{
> > > -       /* Ratelimit parking as shrinking is quite slow */
> > > -       schedule_delayed_work(&park.work, round_jiffies_up_relative(2 * HZ));
> > > -}
> > > -
> > > -static void __i915_globals_queue_rcu(void)
> > > -{
> > > -       park.epoch = atomic_inc_return(&epoch);
> > > -       if (!atomic_read(&active)) {
> > > -               init_rcu_head(&park.rcu);
> > > -               call_rcu(&park.rcu, __i915_globals_grace);
> > > -       }
> > > -}
> > > -
> > > -static void __i915_globals_park(struct work_struct *work)
> > > -{
> > > -       destroy_rcu_head(&park.rcu);
> > > -
> > > -       /* Confirm nothing woke up in the last grace period */
> > > -       if (park.epoch != atomic_read(&epoch)) {
> > > -               __i915_globals_queue_rcu();
> > > -               return;
> > > -       }
> > > -
> > > -       clear_bit(PENDING, &park.flags);
> > > -       i915_globals_shrink();
> > > -}
> > > -
> > >  void __init i915_global_register(struct i915_global *global)
> > >  {
> > > -       GEM_BUG_ON(!global->shrink);
> > >         GEM_BUG_ON(!global->exit);
> > >
> > >         list_add_tail(&global->link, &globals);
> > > @@ -109,52 +56,10 @@ int __init i915_globals_init(void)
> > >                 }
> > >         }
> > >
> > > -       INIT_DELAYED_WORK(&park.work, __i915_globals_park);
> > >         return 0;
> > >  }
> > >
> > > -void i915_globals_park(void)
> > > -{
> > > -       /*
> > > -        * Defer shrinking the global slab caches (and other work) until
> > > -        * after a RCU grace period has completed with no activity. This
> > > -        * is to try and reduce the latency impact on the consumers caused
> > > -        * by us shrinking the caches the same time as they are trying to
> > > -        * allocate, with the assumption being that if we idle long enough
> > > -        * for an RCU grace period to elapse since the last use, it is likely
> > > -        * to be longer until we need the caches again.
> > > -        */
> > > -       if (!atomic_dec_and_test(&active))
> > > -               return;
> > > -
> > > -       /* Queue cleanup after the next RCU grace period has freed slabs */
> > > -       if (!test_and_set_bit(PENDING, &park.flags))
> > > -               __i915_globals_queue_rcu();
> > > -}
> > > -
> > > -void i915_globals_unpark(void)
> > > -{
> > > -       atomic_inc(&epoch);
> > > -       atomic_inc(&active);
> > > -}
> > > -
> > > -static void __exit __i915_globals_flush(void)
> > > -{
> > > -       atomic_inc(&active); /* skip shrinking */
> > > -
> > > -       rcu_barrier(); /* wait for the work to be queued */
> > > -       flush_delayed_work(&park.work);
> > > -
> > > -       atomic_dec(&active);
> > > -}
> > > -
> > >  void __exit i915_globals_exit(void)
> > >  {
> > > -       GEM_BUG_ON(atomic_read(&active));
> > > -
> > > -       __i915_globals_flush();
> > >         __i915_globals_cleanup();
> > > -
> > > -       /* And ensure that our DESTROY_BY_RCU slabs are truly destroyed */
> > > -       rcu_barrier();
> > >  }
> > > diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
> > > index 2d199f411a4a..9e6b4fd07528 100644
> > > --- a/drivers/gpu/drm/i915/i915_globals.h
> > > +++ b/drivers/gpu/drm/i915/i915_globals.h
> > > @@ -14,15 +14,12 @@ typedef void (*i915_global_func_t)(void);
> > >  struct i915_global {
> > >         struct list_head link;
> > >
> > > -       i915_global_func_t shrink;
> > >         i915_global_func_t exit;
> > >  };
> > >
> > >  void i915_global_register(struct i915_global *global);
> > >
> > >  int i915_globals_init(void);
> > > -void i915_globals_park(void);
> > > -void i915_globals_unpark(void);
> > >  void i915_globals_exit(void);
> > >
> > >  /* constructors */
> > > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > > index 09ebea9a0090..d3de9f60e03a 100644
> > > --- a/drivers/gpu/drm/i915/i915_request.c
> > > +++ b/drivers/gpu/drm/i915/i915_request.c
> > > @@ -2077,12 +2077,6 @@ void i915_request_show(struct drm_printer *m,
> > >  #include "selftests/i915_request.c"
> > >  #endif
> > >
> > > -static void i915_global_request_shrink(void)
> > > -{
> > > -       kmem_cache_shrink(global.slab_execute_cbs);
> > > -       kmem_cache_shrink(global.slab_requests);
> > > -}
> > > -
> > >  static void i915_global_request_exit(void)
> > >  {
> > >         kmem_cache_destroy(global.slab_execute_cbs);
> > > @@ -2090,7 +2084,6 @@ static void i915_global_request_exit(void)
> > >  }
> > >
> > >  static struct i915_global_request global = { {
> > > -       .shrink = i915_global_request_shrink,
> > >         .exit = i915_global_request_exit,
> > >  } };
> > >
> > > diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
> > > index 3a58a9130309..561c649e59f7 100644
> > > --- a/drivers/gpu/drm/i915/i915_scheduler.c
> > > +++ b/drivers/gpu/drm/i915/i915_scheduler.c
> > > @@ -475,12 +475,6 @@ i915_sched_engine_create(unsigned int subclass)
> > >         return sched_engine;
> > >  }
> > >
> > > -static void i915_global_scheduler_shrink(void)
> > > -{
> > > -       kmem_cache_shrink(global.slab_dependencies);
> > > -       kmem_cache_shrink(global.slab_priorities);
> > > -}
> > > -
> > >  static void i915_global_scheduler_exit(void)
> > >  {
> > >         kmem_cache_destroy(global.slab_dependencies);
> > > @@ -488,7 +482,6 @@ static void i915_global_scheduler_exit(void)
> > >  }
> > >
> > >  static struct i915_global_scheduler global = { {
> > > -       .shrink = i915_global_scheduler_shrink,
> > >         .exit = i915_global_scheduler_exit,
> > >  } };
> > >
> > > diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> > > index 5b9dce0f443b..09a7c47926f7 100644
> > > --- a/drivers/gpu/drm/i915/i915_vma.c
> > > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > > @@ -1414,18 +1414,12 @@ void i915_vma_make_purgeable(struct i915_vma *vma)
> > >  #include "selftests/i915_vma.c"
> > >  #endif
> > >
> > > -static void i915_global_vma_shrink(void)
> > > -{
> > > -       kmem_cache_shrink(global.slab_vmas);
> > > -}
> > > -
> > >  static void i915_global_vma_exit(void)
> > >  {
> > >         kmem_cache_destroy(global.slab_vmas);
> > >  }
> > >
> > >  static struct i915_global_vma global = { {
> > > -       .shrink = i915_global_vma_shrink,
> > >         .exit = i915_global_vma_exit,
> > >  } };
> > >
> > > --
> > > 2.32.0
> > >
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
