Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED3F36DEE3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 20:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF4A6E160;
	Wed, 28 Apr 2021 18:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F281E6E2D7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 18:17:40 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id i24so15816063edy.8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 11:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qXGgj5lnHFjK6TXrYjHFZUnUV54cZL4ncGnwIDFndHE=;
 b=1TjROn9ZFJxr8LVShtpH9Kqaxt/a++J0BuGgZoXMVHvCizbqlm087r3VBTbLSSQKcb
 NP/24xbNCfxGKK+Xq/XrUTTit/xenURVNQIKcNsWY2XZawuiaDI3ehYQpqj5yrXiTMWh
 ybAM0z9xn5SZmjOFz0rY+5nccAxycdFX5MhWmsVFsEO0Vds7KDXLtKBRwsOc2uw0oDM2
 Ud9i68cIuqHt/UVkMxMvvNOlEmuw2VoYgZN9/Kt4/olJjYkFCgeTeJIKVjyDmyaIE0Wy
 3PUScgehzxe7ks5nKW64jmfwlP7td5cQ++OK4xljoyMG6CGc7UVNs/DzTKvMaaDa0V54
 u5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qXGgj5lnHFjK6TXrYjHFZUnUV54cZL4ncGnwIDFndHE=;
 b=j7jjQETzXKjMD8JSUQJizKPMVmVnIQ/k5PVVUm/1ucoSQ4qda/LggG+c4sozAcZria
 EnNdJ3tLrz4/xFXWI0r+ZjKencaD8btM8hXGzaBSYDAGPsgdS/xz9NzY9OQhxKNrzPL+
 zkGalbCqrgpgasSwhx1iqej03OIPm0CXfdqgj1Ez3zNcUVzR61UC5RgSt89cYE3y+q0d
 t+KJ4vx6YWVFTt8xxyqrkATi6rNU/OSVQ8XKpHnAHEm05tZK85X2iy1gIjAjffSAXTEM
 gEpukDwCOhlxljqBM3rmDlJUnB5kVOM4ps4v8m1iv8WVd2ZMFErWdXcgd7Uwe7ArWvDf
 PWcw==
X-Gm-Message-State: AOAM531kUqQBBjvr8mV4JClV10Felup6atAUzhSKLYbWzkInV3Lw/g0l
 lzUXLv5AHe2H4ns8ro+74of48kJHp7xk2nHDvheDZQ==
X-Google-Smtp-Source: ABdhPJzXxhqc3arz/DxGBy++JQ5HzVs/ONZzBMqudVGC8B/3GmfTBBvkok4HYz3om+rdS3wGOWL2Vl7lemTIxeQZzFw=
X-Received: by 2002:aa7:dd01:: with SMTP id i1mr12388582edv.232.1619633859325; 
 Wed, 28 Apr 2021 11:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-9-jason@jlekstrand.net>
 <CAOFGe958Y6eq1qcPPS-h8Swca8kMy39Vp-gGv6irXdS_8xje5w@mail.gmail.com>
 <YIk1YEXjvaDN+feW@phenom.ffwll.local>
 <CAOFGe97PUT8Ns0bVhHi6D+21yA3=v0QkhdmmKBm=dCn4CizwiA@mail.gmail.com>
 <20210428171853.GA3260@sdutt-i7>
 <CAOFGe96Qy8hXsJCemgDJtZYCbwqxvUS4j-SEKKnLQjE6dmRP2w@mail.gmail.com>
 <20210428175525.GA7224@sdutt-i7>
In-Reply-To: <20210428175525.GA7224@sdutt-i7>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 28 Apr 2021 13:17:27 -0500
Message-ID: <CAOFGe96i7GPvQ8yDreTGF-K5pr_GRNkofQhH7W6Wxr-F8qmxrQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 08/21] drm/i915/gem: Disallow bonding of
 virtual engines
To: Matthew Brost <matthew.brost@intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 1:02 PM Matthew Brost <matthew.brost@intel.com> wrote:
>
> On Wed, Apr 28, 2021 at 12:46:07PM -0500, Jason Ekstrand wrote:
> > On Wed, Apr 28, 2021 at 12:26 PM Matthew Brost <matthew.brost@intel.com> wrote:
> > >
> > > On Wed, Apr 28, 2021 at 12:18:29PM -0500, Jason Ekstrand wrote:
> > > > On Wed, Apr 28, 2021 at 5:13 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Tue, Apr 27, 2021 at 08:51:08AM -0500, Jason Ekstrand wrote:
> > > > > > On Fri, Apr 23, 2021 at 5:31 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > > > > >
> > > > > > > This adds a bunch of complexity which the media driver has never
> > > > > > > actually used.  The media driver does technically bond a balanced engine
> > > > > > > to another engine but the balanced engine only has one engine in the
> > > > > > > sibling set.  This doesn't actually result in a virtual engine.
> > > > > > >
> > > > > > > Unless some userspace badly wants it, there's no good reason to support
> > > > > > > this case.  This makes I915_CONTEXT_ENGINES_EXT_BOND a total no-op.  We
> > > > > > > leave the validation code in place in case we ever decide we want to do
> > > > > > > something interesting with the bonding information.
> > > > > > >
> > > > > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/i915/gem/i915_gem_context.c   |  18 +-
> > > > > > >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 +-
> > > > > > >  drivers/gpu/drm/i915/gt/intel_engine_types.h  |   7 -
> > > > > > >  .../drm/i915/gt/intel_execlists_submission.c  | 100 --------
> > > > > > >  .../drm/i915/gt/intel_execlists_submission.h  |   4 -
> > > > > > >  drivers/gpu/drm/i915/gt/selftest_execlists.c  | 229 ------------------
> > > > > > >  6 files changed, 7 insertions(+), 353 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > > > index e8179918fa306..5f8d0faf783aa 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > > > @@ -1553,6 +1553,12 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
> > > > > > >         }
> > > > > > >         virtual = set->engines->engines[idx]->engine;
> > > > > > >
> > > > > > > +       if (intel_engine_is_virtual(virtual)) {
> > > > > > > +               drm_dbg(&i915->drm,
> > > > > > > +                       "Bonding with virtual engines not allowed\n");
> > > > > > > +               return -EINVAL;
> > > > > > > +       }
> > > > > > > +
> > > > > > >         err = check_user_mbz(&ext->flags);
> > > > > > >         if (err)
> > > > > > >                 return err;
> > > > > > > @@ -1593,18 +1599,6 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
> > > > > > >                                 n, ci.engine_class, ci.engine_instance);
> > > > > > >                         return -EINVAL;
> > > > > > >                 }
> > > > > > > -
> > > > > > > -               /*
> > > > > > > -                * A non-virtual engine has no siblings to choose between; and
> > > > > > > -                * a submit fence will always be directed to the one engine.
> > > > > > > -                */
> > > > > > > -               if (intel_engine_is_virtual(virtual)) {
> > > > > > > -                       err = intel_virtual_engine_attach_bond(virtual,
> > > > > > > -                                                              master,
> > > > > > > -                                                              bond);
> > > > > > > -                       if (err)
> > > > > > > -                               return err;
> > > > > > > -               }
> > > > > > >         }
> > > > > > >
> > > > > > >         return 0;
> > > > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > > > index d640bba6ad9ab..efb2fa3522a42 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > > > @@ -3474,7 +3474,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> > > > > > >                 if (args->flags & I915_EXEC_FENCE_SUBMIT)
> > > > > > >                         err = i915_request_await_execution(eb.request,
> > > > > > >                                                            in_fence,
> > > > > > > -                                                          eb.engine->bond_execute);
> > > > > > > +                                                          NULL);
> > > > > > >                 else
> > > > > > >                         err = i915_request_await_dma_fence(eb.request,
> > > > > > >                                                            in_fence);
> > > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > > > > > index 883bafc449024..68cfe5080325c 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > > > > > @@ -446,13 +446,6 @@ struct intel_engine_cs {
> > > > > > >          */
> > > > > > >         void            (*submit_request)(struct i915_request *rq);
> > > > > > >
> > > > > > > -       /*
> > > > > > > -        * Called on signaling of a SUBMIT_FENCE, passing along the signaling
> > > > > > > -        * request down to the bonded pairs.
> > > > > > > -        */
> > > > > > > -       void            (*bond_execute)(struct i915_request *rq,
> > > > > > > -                                       struct dma_fence *signal);
> > > > > > > -
> > > > > > >         /*
> > > > > > >          * Call when the priority on a request has changed and it and its
> > > > > > >          * dependencies may need rescheduling. Note the request itself may
> > > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > > > > > index de124870af44d..b6e2b59f133b7 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > > > > > @@ -181,18 +181,6 @@ struct virtual_engine {
> > > > > > >                 int prio;
> > > > > > >         } nodes[I915_NUM_ENGINES];
> > > > > > >
> > > > > > > -       /*
> > > > > > > -        * Keep track of bonded pairs -- restrictions upon on our selection
> > > > > > > -        * of physical engines any particular request may be submitted to.
> > > > > > > -        * If we receive a submit-fence from a master engine, we will only
> > > > > > > -        * use one of sibling_mask physical engines.
> > > > > > > -        */
> > > > > > > -       struct ve_bond {
> > > > > > > -               const struct intel_engine_cs *master;
> > > > > > > -               intel_engine_mask_t sibling_mask;
> > > > > > > -       } *bonds;
> > > > > > > -       unsigned int num_bonds;
> > > > > > > -
> > > > > > >         /* And finally, which physical engines this virtual engine maps onto. */
> > > > > > >         unsigned int num_siblings;
> > > > > > >         struct intel_engine_cs *siblings[];
> > > > > > > @@ -3307,7 +3295,6 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
> > > > > > >         intel_breadcrumbs_free(ve->base.breadcrumbs);
> > > > > > >         intel_engine_free_request_pool(&ve->base);
> > > > > > >
> > > > > > > -       kfree(ve->bonds);
> > > > > > >         kfree(ve);
> > > > > > >  }
> > > > > > >
> > > > > > > @@ -3560,42 +3547,6 @@ static void virtual_submit_request(struct i915_request *rq)
> > > > > > >         spin_unlock_irqrestore(&ve->base.active.lock, flags);
> > > > > > >  }
> > > > > > >
> > > > > > > -static struct ve_bond *
> > > > > > > -virtual_find_bond(struct virtual_engine *ve,
> > > > > > > -                 const struct intel_engine_cs *master)
> > > > > > > -{
> > > > > > > -       int i;
> > > > > > > -
> > > > > > > -       for (i = 0; i < ve->num_bonds; i++) {
> > > > > > > -               if (ve->bonds[i].master == master)
> > > > > > > -                       return &ve->bonds[i];
> > > > > > > -       }
> > > > > > > -
> > > > > > > -       return NULL;
> > > > > > > -}
> > > > > > > -
> > > > > > > -static void
> > > > > > > -virtual_bond_execute(struct i915_request *rq, struct dma_fence *signal)
> > > > > > > -{
> > > > > > > -       struct virtual_engine *ve = to_virtual_engine(rq->engine);
> > > > > > > -       intel_engine_mask_t allowed, exec;
> > > > > > > -       struct ve_bond *bond;
> > > > > > > -
> > > > > > > -       allowed = ~to_request(signal)->engine->mask;
> > > > > > > -
> > > > > > > -       bond = virtual_find_bond(ve, to_request(signal)->engine);
> > > > > > > -       if (bond)
> > > > > > > -               allowed &= bond->sibling_mask;
> > > > > > > -
> > > > > > > -       /* Restrict the bonded request to run on only the available engines */
> > > > > > > -       exec = READ_ONCE(rq->execution_mask);
> > > > > > > -       while (!try_cmpxchg(&rq->execution_mask, &exec, exec & allowed))
> > > > > > > -               ;
> > > > > > > -
> > > > > > > -       /* Prevent the master from being re-run on the bonded engines */
> > > > > > > -       to_request(signal)->execution_mask &= ~allowed;
> > > > > >
> > > > > > I sent a v2 of this patch because it turns out I deleted a bit too
> > > > > > much code.  This function in particular, has to stay, unfortunately.
> > > > > > When a batch is submitted with a SUBMIT_FENCE, this is used to push
> > > > > > the work onto a different engine than than the one it's supposed to
> > > > > > run in parallel with.  This means we can't dead-code this function or
> > > > > > the bond_execution function pointer and related stuff.
> > > > >
> > > > > Uh that's disappointing, since if I understand your point correctly, the
> > > > > sibling engines should all be singletons, not load balancing virtual ones.
> > > > > So there really should not be any need to pick the right one at execution
> > > > > time.
> > > >
> > > > The media driver itself seems to work fine if I delete all the code.
> > > > It's just an IGT testcase that blows up.  I'll do more digging to see
> > > > if I can better isolate why.
> > > >
> > >
> > > Jumping on here mid-thread. For what is is worth to make execlists work
> > > with the upcoming parallel submission extension I leveraged some of the
> > > existing bonding code so I wouldn't be too eager to delete this code
> > > until that lands.
> >
> > Mind being a bit more specific about that?  The motivation for this
> > patch is that the current bonding handling and uAPI is, well, very odd
> > and confusing IMO.  It doesn't let you create sets of bonded engines.
> > Instead you create engines and then bond them together after the fact.
> > I didn't want to blindly duplicate those oddities with the proto-ctx
> > stuff unless they were useful.  With parallel submit, I would expect
> > we want a more explicit API where you specify a set of engine
> > class/instance pairs to bond together into a single engine similar to
> > how the current balancing API works.
> >
> > Of course, that's all focused on the API and not the internals.  But,
> > again, I'm not sure how we want things to look internally.  What we've
> > got now doesn't seem great for the GuC submission model but I'm very
> > much not the expert there.  I don't want to be working at cross
> > purposes to you and I'm happy to leave bits if you think they're
> > useful.  But I thought I was clearing things away so that you can put
> > in what you actually want for GuC/parallel submit.
> >
>
> Removing all the UAPI things are fine but I wouldn't delete some of the
> internal stuff (e.g. intel_virtual_engine_attach_bond, bond
> intel_context_ops, the hook for a submit fence, etc...) as that will
> still likely be used for the new parallel submission interface with
> execlists. As you say the new UAPI wont allow crazy configurations,
> only simple ones.

I'm fine with leaving some of the internal bits for a little while if
it makes pulling the GuC scheduler in easier.  I'm just a bit
skeptical of why you'd care about SUBMIT_FENCE. :-)  Daniel, any
thoughts?

--Jason

> Matt
>
> > --Jason
> >
> > > Matt
> > >
> > > > --Jason
> > > >
> > > > > At least my understanding is that we're only limiting the engine set
> > > > > further, so if both signaller and signalled request can only run on
> > > > > singletons (which must be distinct, or the bonded parameter validation is
> > > > > busted) there's really nothing to do here.
> > > > >
> > > > > Also this is the locking code that freaks me out about the current bonded
> > > > > execlist code ...
> > > > >
> > > > > Dazzled and confused.
> > > > > -Daniel
> > > > >
> > > > > >
> > > > > > --Jason
> > > > > >
> > > > > >
> > > > > > > -}
> > > > > > > -
> > > > > > >  struct intel_context *
> > > > > > >  intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> > > > > > >                                unsigned int count)
> > > > > > > @@ -3649,7 +3600,6 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> > > > > > >
> > > > > > >         ve->base.schedule = i915_schedule;
> > > > > > >         ve->base.submit_request = virtual_submit_request;
> > > > > > > -       ve->base.bond_execute = virtual_bond_execute;
> > > > > > >
> > > > > > >         INIT_LIST_HEAD(virtual_queue(ve));
> > > > > > >         ve->base.execlists.queue_priority_hint = INT_MIN;
> > > > > > > @@ -3747,59 +3697,9 @@ intel_execlists_clone_virtual(struct intel_engine_cs *src)
> > > > > > >         if (IS_ERR(dst))
> > > > > > >                 return dst;
> > > > > > >
> > > > > > > -       if (se->num_bonds) {
> > > > > > > -               struct virtual_engine *de = to_virtual_engine(dst->engine);
> > > > > > > -
> > > > > > > -               de->bonds = kmemdup(se->bonds,
> > > > > > > -                                   sizeof(*se->bonds) * se->num_bonds,
> > > > > > > -                                   GFP_KERNEL);
> > > > > > > -               if (!de->bonds) {
> > > > > > > -                       intel_context_put(dst);
> > > > > > > -                       return ERR_PTR(-ENOMEM);
> > > > > > > -               }
> > > > > > > -
> > > > > > > -               de->num_bonds = se->num_bonds;
> > > > > > > -       }
> > > > > > > -
> > > > > > >         return dst;
> > > > > > >  }
> > > > > > >
> > > > > > > -int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
> > > > > > > -                                    const struct intel_engine_cs *master,
> > > > > > > -                                    const struct intel_engine_cs *sibling)
> > > > > > > -{
> > > > > > > -       struct virtual_engine *ve = to_virtual_engine(engine);
> > > > > > > -       struct ve_bond *bond;
> > > > > > > -       int n;
> > > > > > > -
> > > > > > > -       /* Sanity check the sibling is part of the virtual engine */
> > > > > > > -       for (n = 0; n < ve->num_siblings; n++)
> > > > > > > -               if (sibling == ve->siblings[n])
> > > > > > > -                       break;
> > > > > > > -       if (n == ve->num_siblings)
> > > > > > > -               return -EINVAL;
> > > > > > > -
> > > > > > > -       bond = virtual_find_bond(ve, master);
> > > > > > > -       if (bond) {
> > > > > > > -               bond->sibling_mask |= sibling->mask;
> > > > > > > -               return 0;
> > > > > > > -       }
> > > > > > > -
> > > > > > > -       bond = krealloc(ve->bonds,
> > > > > > > -                       sizeof(*bond) * (ve->num_bonds + 1),
> > > > > > > -                       GFP_KERNEL);
> > > > > > > -       if (!bond)
> > > > > > > -               return -ENOMEM;
> > > > > > > -
> > > > > > > -       bond[ve->num_bonds].master = master;
> > > > > > > -       bond[ve->num_bonds].sibling_mask = sibling->mask;
> > > > > > > -
> > > > > > > -       ve->bonds = bond;
> > > > > > > -       ve->num_bonds++;
> > > > > > > -
> > > > > > > -       return 0;
> > > > > > > -}
> > > > > > > -
> > > > > > >  void intel_execlists_show_requests(struct intel_engine_cs *engine,
> > > > > > >                                    struct drm_printer *m,
> > > > > > >                                    void (*show_request)(struct drm_printer *m,
> > > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> > > > > > > index fd61dae820e9e..80cec37a56ba9 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> > > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> > > > > > > @@ -39,10 +39,6 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> > > > > > >  struct intel_context *
> > > > > > >  intel_execlists_clone_virtual(struct intel_engine_cs *src);
> > > > > > >
> > > > > > > -int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
> > > > > > > -                                    const struct intel_engine_cs *master,
> > > > > > > -                                    const struct intel_engine_cs *sibling);
> > > > > > > -
> > > > > > >  bool
> > > > > > >  intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > > > > > > index 1081cd36a2bd3..f03446d587160 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > > > > > > +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > > > > > > @@ -4311,234 +4311,6 @@ static int live_virtual_preserved(void *arg)
> > > > > > >         return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > -static int bond_virtual_engine(struct intel_gt *gt,
> > > > > > > -                              unsigned int class,
> > > > > > > -                              struct intel_engine_cs **siblings,
> > > > > > > -                              unsigned int nsibling,
> > > > > > > -                              unsigned int flags)
> > > > > > > -#define BOND_SCHEDULE BIT(0)
> > > > > > > -{
> > > > > > > -       struct intel_engine_cs *master;
> > > > > > > -       struct i915_request *rq[16];
> > > > > > > -       enum intel_engine_id id;
> > > > > > > -       struct igt_spinner spin;
> > > > > > > -       unsigned long n;
> > > > > > > -       int err;
> > > > > > > -
> > > > > > > -       /*
> > > > > > > -        * A set of bonded requests is intended to be run concurrently
> > > > > > > -        * across a number of engines. We use one request per-engine
> > > > > > > -        * and a magic fence to schedule each of the bonded requests
> > > > > > > -        * at the same time. A consequence of our current scheduler is that
> > > > > > > -        * we only move requests to the HW ready queue when the request
> > > > > > > -        * becomes ready, that is when all of its prerequisite fences have
> > > > > > > -        * been signaled. As one of those fences is the master submit fence,
> > > > > > > -        * there is a delay on all secondary fences as the HW may be
> > > > > > > -        * currently busy. Equally, as all the requests are independent,
> > > > > > > -        * they may have other fences that delay individual request
> > > > > > > -        * submission to HW. Ergo, we do not guarantee that all requests are
> > > > > > > -        * immediately submitted to HW at the same time, just that if the
> > > > > > > -        * rules are abided by, they are ready at the same time as the
> > > > > > > -        * first is submitted. Userspace can embed semaphores in its batch
> > > > > > > -        * to ensure parallel execution of its phases as it requires.
> > > > > > > -        * Though naturally it gets requested that perhaps the scheduler should
> > > > > > > -        * take care of parallel execution, even across preemption events on
> > > > > > > -        * different HW. (The proper answer is of course "lalalala".)
> > > > > > > -        *
> > > > > > > -        * With the submit-fence, we have identified three possible phases
> > > > > > > -        * of synchronisation depending on the master fence: queued (not
> > > > > > > -        * ready), executing, and signaled. The first two are quite simple
> > > > > > > -        * and checked below. However, the signaled master fence handling is
> > > > > > > -        * contentious. Currently we do not distinguish between a signaled
> > > > > > > -        * fence and an expired fence, as once signaled it does not convey
> > > > > > > -        * any information about the previous execution. It may even be freed
> > > > > > > -        * and hence checking later it may not exist at all. Ergo we currently
> > > > > > > -        * do not apply the bonding constraint for an already signaled fence,
> > > > > > > -        * as our expectation is that it should not constrain the secondaries
> > > > > > > -        * and is outside of the scope of the bonded request API (i.e. all
> > > > > > > -        * userspace requests are meant to be running in parallel). As
> > > > > > > -        * it imposes no constraint, and is effectively a no-op, we do not
> > > > > > > -        * check below as normal execution flows are checked extensively above.
> > > > > > > -        *
> > > > > > > -        * XXX Is the degenerate handling of signaled submit fences the
> > > > > > > -        * expected behaviour for userpace?
> > > > > > > -        */
> > > > > > > -
> > > > > > > -       GEM_BUG_ON(nsibling >= ARRAY_SIZE(rq) - 1);
> > > > > > > -
> > > > > > > -       if (igt_spinner_init(&spin, gt))
> > > > > > > -               return -ENOMEM;
> > > > > > > -
> > > > > > > -       err = 0;
> > > > > > > -       rq[0] = ERR_PTR(-ENOMEM);
> > > > > > > -       for_each_engine(master, gt, id) {
> > > > > > > -               struct i915_sw_fence fence = {};
> > > > > > > -               struct intel_context *ce;
> > > > > > > -
> > > > > > > -               if (master->class == class)
> > > > > > > -                       continue;
> > > > > > > -
> > > > > > > -               ce = intel_context_create(master);
> > > > > > > -               if (IS_ERR(ce)) {
> > > > > > > -                       err = PTR_ERR(ce);
> > > > > > > -                       goto out;
> > > > > > > -               }
> > > > > > > -
> > > > > > > -               memset_p((void *)rq, ERR_PTR(-EINVAL), ARRAY_SIZE(rq));
> > > > > > > -
> > > > > > > -               rq[0] = igt_spinner_create_request(&spin, ce, MI_NOOP);
> > > > > > > -               intel_context_put(ce);
> > > > > > > -               if (IS_ERR(rq[0])) {
> > > > > > > -                       err = PTR_ERR(rq[0]);
> > > > > > > -                       goto out;
> > > > > > > -               }
> > > > > > > -               i915_request_get(rq[0]);
> > > > > > > -
> > > > > > > -               if (flags & BOND_SCHEDULE) {
> > > > > > > -                       onstack_fence_init(&fence);
> > > > > > > -                       err = i915_sw_fence_await_sw_fence_gfp(&rq[0]->submit,
> > > > > > > -                                                              &fence,
> > > > > > > -                                                              GFP_KERNEL);
> > > > > > > -               }
> > > > > > > -
> > > > > > > -               i915_request_add(rq[0]);
> > > > > > > -               if (err < 0)
> > > > > > > -                       goto out;
> > > > > > > -
> > > > > > > -               if (!(flags & BOND_SCHEDULE) &&
> > > > > > > -                   !igt_wait_for_spinner(&spin, rq[0])) {
> > > > > > > -                       err = -EIO;
> > > > > > > -                       goto out;
> > > > > > > -               }
> > > > > > > -
> > > > > > > -               for (n = 0; n < nsibling; n++) {
> > > > > > > -                       struct intel_context *ve;
> > > > > > > -
> > > > > > > -                       ve = intel_execlists_create_virtual(siblings, nsibling);
> > > > > > > -                       if (IS_ERR(ve)) {
> > > > > > > -                               err = PTR_ERR(ve);
> > > > > > > -                               onstack_fence_fini(&fence);
> > > > > > > -                               goto out;
> > > > > > > -                       }
> > > > > > > -
> > > > > > > -                       err = intel_virtual_engine_attach_bond(ve->engine,
> > > > > > > -                                                              master,
> > > > > > > -                                                              siblings[n]);
> > > > > > > -                       if (err) {
> > > > > > > -                               intel_context_put(ve);
> > > > > > > -                               onstack_fence_fini(&fence);
> > > > > > > -                               goto out;
> > > > > > > -                       }
> > > > > > > -
> > > > > > > -                       err = intel_context_pin(ve);
> > > > > > > -                       intel_context_put(ve);
> > > > > > > -                       if (err) {
> > > > > > > -                               onstack_fence_fini(&fence);
> > > > > > > -                               goto out;
> > > > > > > -                       }
> > > > > > > -
> > > > > > > -                       rq[n + 1] = i915_request_create(ve);
> > > > > > > -                       intel_context_unpin(ve);
> > > > > > > -                       if (IS_ERR(rq[n + 1])) {
> > > > > > > -                               err = PTR_ERR(rq[n + 1]);
> > > > > > > -                               onstack_fence_fini(&fence);
> > > > > > > -                               goto out;
> > > > > > > -                       }
> > > > > > > -                       i915_request_get(rq[n + 1]);
> > > > > > > -
> > > > > > > -                       err = i915_request_await_execution(rq[n + 1],
> > > > > > > -                                                          &rq[0]->fence,
> > > > > > > -                                                          ve->engine->bond_execute);
> > > > > > > -                       i915_request_add(rq[n + 1]);
> > > > > > > -                       if (err < 0) {
> > > > > > > -                               onstack_fence_fini(&fence);
> > > > > > > -                               goto out;
> > > > > > > -                       }
> > > > > > > -               }
> > > > > > > -               onstack_fence_fini(&fence);
> > > > > > > -               intel_engine_flush_submission(master);
> > > > > > > -               igt_spinner_end(&spin);
> > > > > > > -
> > > > > > > -               if (i915_request_wait(rq[0], 0, HZ / 10) < 0) {
> > > > > > > -                       pr_err("Master request did not execute (on %s)!\n",
> > > > > > > -                              rq[0]->engine->name);
> > > > > > > -                       err = -EIO;
> > > > > > > -                       goto out;
> > > > > > > -               }
> > > > > > > -
> > > > > > > -               for (n = 0; n < nsibling; n++) {
> > > > > > > -                       if (i915_request_wait(rq[n + 1], 0,
> > > > > > > -                                             MAX_SCHEDULE_TIMEOUT) < 0) {
> > > > > > > -                               err = -EIO;
> > > > > > > -                               goto out;
> > > > > > > -                       }
> > > > > > > -
> > > > > > > -                       if (rq[n + 1]->engine != siblings[n]) {
> > > > > > > -                               pr_err("Bonded request did not execute on target engine: expected %s, used %s; master was %s\n",
> > > > > > > -                                      siblings[n]->name,
> > > > > > > -                                      rq[n + 1]->engine->name,
> > > > > > > -                                      rq[0]->engine->name);
> > > > > > > -                               err = -EINVAL;
> > > > > > > -                               goto out;
> > > > > > > -                       }
> > > > > > > -               }
> > > > > > > -
> > > > > > > -               for (n = 0; !IS_ERR(rq[n]); n++)
> > > > > > > -                       i915_request_put(rq[n]);
> > > > > > > -               rq[0] = ERR_PTR(-ENOMEM);
> > > > > > > -       }
> > > > > > > -
> > > > > > > -out:
> > > > > > > -       for (n = 0; !IS_ERR(rq[n]); n++)
> > > > > > > -               i915_request_put(rq[n]);
> > > > > > > -       if (igt_flush_test(gt->i915))
> > > > > > > -               err = -EIO;
> > > > > > > -
> > > > > > > -       igt_spinner_fini(&spin);
> > > > > > > -       return err;
> > > > > > > -}
> > > > > > > -
> > > > > > > -static int live_virtual_bond(void *arg)
> > > > > > > -{
> > > > > > > -       static const struct phase {
> > > > > > > -               const char *name;
> > > > > > > -               unsigned int flags;
> > > > > > > -       } phases[] = {
> > > > > > > -               { "", 0 },
> > > > > > > -               { "schedule", BOND_SCHEDULE },
> > > > > > > -               { },
> > > > > > > -       };
> > > > > > > -       struct intel_gt *gt = arg;
> > > > > > > -       struct intel_engine_cs *siblings[MAX_ENGINE_INSTANCE + 1];
> > > > > > > -       unsigned int class;
> > > > > > > -       int err;
> > > > > > > -
> > > > > > > -       if (intel_uc_uses_guc_submission(&gt->uc))
> > > > > > > -               return 0;
> > > > > > > -
> > > > > > > -       for (class = 0; class <= MAX_ENGINE_CLASS; class++) {
> > > > > > > -               const struct phase *p;
> > > > > > > -               int nsibling;
> > > > > > > -
> > > > > > > -               nsibling = select_siblings(gt, class, siblings);
> > > > > > > -               if (nsibling < 2)
> > > > > > > -                       continue;
> > > > > > > -
> > > > > > > -               for (p = phases; p->name; p++) {
> > > > > > > -                       err = bond_virtual_engine(gt,
> > > > > > > -                                                 class, siblings, nsibling,
> > > > > > > -                                                 p->flags);
> > > > > > > -                       if (err) {
> > > > > > > -                               pr_err("%s(%s): failed class=%d, nsibling=%d, err=%d\n",
> > > > > > > -                                      __func__, p->name, class, nsibling, err);
> > > > > > > -                               return err;
> > > > > > > -                       }
> > > > > > > -               }
> > > > > > > -       }
> > > > > > > -
> > > > > > > -       return 0;
> > > > > > > -}
> > > > > > > -
> > > > > > >  static int reset_virtual_engine(struct intel_gt *gt,
> > > > > > >                                 struct intel_engine_cs **siblings,
> > > > > > >                                 unsigned int nsibling)
> > > > > > > @@ -4712,7 +4484,6 @@ int intel_execlists_live_selftests(struct drm_i915_private *i915)
> > > > > > >                 SUBTEST(live_virtual_mask),
> > > > > > >                 SUBTEST(live_virtual_preserved),
> > > > > > >                 SUBTEST(live_virtual_slice),
> > > > > > > -               SUBTEST(live_virtual_bond),
> > > > > > >                 SUBTEST(live_virtual_reset),
> > > > > > >         };
> > > > > > >
> > > > > > > --
> > > > > > > 2.31.1
> > > > > > >
> > > > > > _______________________________________________
> > > > > > dri-devel mailing list
> > > > > > dri-devel@lists.freedesktop.org
> > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > > > _______________________________________________
> > > > Intel-gfx mailing list
> > > > Intel-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
