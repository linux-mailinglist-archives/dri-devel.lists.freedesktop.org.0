Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E036EA46
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0808D6EE8B;
	Thu, 29 Apr 2021 12:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035056EE8A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:24:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id s82so681184wmf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 05:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3hc6uEGTnvscovaCyFmmUmQM7FTozteQycPx1kiW+TU=;
 b=Gqe2HAhCmZc5/DU2NTOOjskNJD8VYZZj5RDXAcq+5Kws1tA0MkSn0/2Um5UViaFlql
 oC/MVJB0yQkIToOA0TPrcl3sFSYUWqeqVzRFySoKXfTmLcfoKIyxLxWqju1j6Fb7CaeD
 Gljt+GkS3sYkmkyNT0n0q14ohQoa109T6HTlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3hc6uEGTnvscovaCyFmmUmQM7FTozteQycPx1kiW+TU=;
 b=rFgE79gye51ij/xWdBfqpifIJXP+MlScaaykVCocElmK7149Sxbeppa1O74cO/wO1F
 M+247VW+c6L3vyVa1vncj5kJRPUOKgi6XRCV6z+cR4iHg//XhoDVIQAG6uFh6YHJH2PA
 N10soGlWi1z46aprw7PQQtr+0T+nswMV9Wra5ZyqoxLJ64ShULjaoFHA3oAJ87W+dv/7
 2b2uCTCtOsoGQ1hk6tU0Bz9YeaKafT0pLgF/AsQYckWhMEl/tHzs7oPaXLslnYtX+1vV
 c0QSIw1zmZT1WsdIGU2u9I8JmkedvRdLmXG4PFMUZvxzvu50g+Vg0yhSMLX2GNILuGeL
 c/0g==
X-Gm-Message-State: AOAM5319pKBIYjoRFT3xxpwdQNJ0uPrJzxeWdAPyLuLDySRNLngc4F41
 XDdXEpwaUgrFJiFVUYaEIgQ4iA==
X-Google-Smtp-Source: ABdhPJy7S6efVyVgqz22yXAonn290dXZ5VncFfAarZWA/iV0LJIrrrRk9bq9KoBuw6+z/afWKX1MTg==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr10126301wmc.88.1619699096609; 
 Thu, 29 Apr 2021 05:24:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a9sm3704474wmj.1.2021.04.29.05.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:24:56 -0700 (PDT)
Date: Thu, 29 Apr 2021 14:24:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 08/21] drm/i915/gem: Disallow bonding of
 virtual engines
Message-ID: <YIqllu5RxC1di+yq@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-9-jason@jlekstrand.net>
 <5d32114c-ff06-7ad3-3deb-b843ede7c89d@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d32114c-ff06-7ad3-3deb-b843ede7c89d@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 04:51:19PM +0100, Tvrtko Ursulin wrote:
> 
> On 23/04/2021 23:31, Jason Ekstrand wrote:
> > This adds a bunch of complexity which the media driver has never
> > actually used.  The media driver does technically bond a balanced engine
> > to another engine but the balanced engine only has one engine in the
> > sibling set.  This doesn't actually result in a virtual engine.
> 
> For historical reference, this is not because uapi was over-engineered but
> because certain SKUs never materialized.

Jason said that for SKU with lots of media engines media-driver sets up a
set of ctx in userspace with all the pairings (and I guess then load
balances in userspace or something like that). Tony Ye also seems to have
confirmed that. So I'm not clear on which SKU this is?

Or maybe the real deal is only future platforms, and there we have GuC
scheduler backend.

Not against adding a bit more context to the commit message, but we need
to make sure what we put there is actually correct. Maybe best to ask
Tony/Carl as part of getting an ack from them.
-Daniel

> 
> Regards,
> 
> Tvrtko
> 
> > Unless some userspace badly wants it, there's no good reason to support
> > this case.  This makes I915_CONTEXT_ENGINES_EXT_BOND a total no-op.  We
> > leave the validation code in place in case we ever decide we want to do
> > something interesting with the bonding information.
> > 
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  18 +-
> >   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 +-
> >   drivers/gpu/drm/i915/gt/intel_engine_types.h  |   7 -
> >   .../drm/i915/gt/intel_execlists_submission.c  | 100 --------
> >   .../drm/i915/gt/intel_execlists_submission.h  |   4 -
> >   drivers/gpu/drm/i915/gt/selftest_execlists.c  | 229 ------------------
> >   6 files changed, 7 insertions(+), 353 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index e8179918fa306..5f8d0faf783aa 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -1553,6 +1553,12 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
> >   	}
> >   	virtual = set->engines->engines[idx]->engine;
> > +	if (intel_engine_is_virtual(virtual)) {
> > +		drm_dbg(&i915->drm,
> > +			"Bonding with virtual engines not allowed\n");
> > +		return -EINVAL;
> > +	}
> > +
> >   	err = check_user_mbz(&ext->flags);
> >   	if (err)
> >   		return err;
> > @@ -1593,18 +1599,6 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
> >   				n, ci.engine_class, ci.engine_instance);
> >   			return -EINVAL;
> >   		}
> > -
> > -		/*
> > -		 * A non-virtual engine has no siblings to choose between; and
> > -		 * a submit fence will always be directed to the one engine.
> > -		 */
> > -		if (intel_engine_is_virtual(virtual)) {
> > -			err = intel_virtual_engine_attach_bond(virtual,
> > -							       master,
> > -							       bond);
> > -			if (err)
> > -				return err;
> > -		}
> >   	}
> >   	return 0;
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > index d640bba6ad9ab..efb2fa3522a42 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > @@ -3474,7 +3474,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >   		if (args->flags & I915_EXEC_FENCE_SUBMIT)
> >   			err = i915_request_await_execution(eb.request,
> >   							   in_fence,
> > -							   eb.engine->bond_execute);
> > +							   NULL);
> >   		else
> >   			err = i915_request_await_dma_fence(eb.request,
> >   							   in_fence);
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > index 883bafc449024..68cfe5080325c 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > @@ -446,13 +446,6 @@ struct intel_engine_cs {
> >   	 */
> >   	void		(*submit_request)(struct i915_request *rq);
> > -	/*
> > -	 * Called on signaling of a SUBMIT_FENCE, passing along the signaling
> > -	 * request down to the bonded pairs.
> > -	 */
> > -	void            (*bond_execute)(struct i915_request *rq,
> > -					struct dma_fence *signal);
> > -
> >   	/*
> >   	 * Call when the priority on a request has changed and it and its
> >   	 * dependencies may need rescheduling. Note the request itself may
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > index de124870af44d..b6e2b59f133b7 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -181,18 +181,6 @@ struct virtual_engine {
> >   		int prio;
> >   	} nodes[I915_NUM_ENGINES];
> > -	/*
> > -	 * Keep track of bonded pairs -- restrictions upon on our selection
> > -	 * of physical engines any particular request may be submitted to.
> > -	 * If we receive a submit-fence from a master engine, we will only
> > -	 * use one of sibling_mask physical engines.
> > -	 */
> > -	struct ve_bond {
> > -		const struct intel_engine_cs *master;
> > -		intel_engine_mask_t sibling_mask;
> > -	} *bonds;
> > -	unsigned int num_bonds;
> > -
> >   	/* And finally, which physical engines this virtual engine maps onto. */
> >   	unsigned int num_siblings;
> >   	struct intel_engine_cs *siblings[];
> > @@ -3307,7 +3295,6 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
> >   	intel_breadcrumbs_free(ve->base.breadcrumbs);
> >   	intel_engine_free_request_pool(&ve->base);
> > -	kfree(ve->bonds);
> >   	kfree(ve);
> >   }
> > @@ -3560,42 +3547,6 @@ static void virtual_submit_request(struct i915_request *rq)
> >   	spin_unlock_irqrestore(&ve->base.active.lock, flags);
> >   }
> > -static struct ve_bond *
> > -virtual_find_bond(struct virtual_engine *ve,
> > -		  const struct intel_engine_cs *master)
> > -{
> > -	int i;
> > -
> > -	for (i = 0; i < ve->num_bonds; i++) {
> > -		if (ve->bonds[i].master == master)
> > -			return &ve->bonds[i];
> > -	}
> > -
> > -	return NULL;
> > -}
> > -
> > -static void
> > -virtual_bond_execute(struct i915_request *rq, struct dma_fence *signal)
> > -{
> > -	struct virtual_engine *ve = to_virtual_engine(rq->engine);
> > -	intel_engine_mask_t allowed, exec;
> > -	struct ve_bond *bond;
> > -
> > -	allowed = ~to_request(signal)->engine->mask;
> > -
> > -	bond = virtual_find_bond(ve, to_request(signal)->engine);
> > -	if (bond)
> > -		allowed &= bond->sibling_mask;
> > -
> > -	/* Restrict the bonded request to run on only the available engines */
> > -	exec = READ_ONCE(rq->execution_mask);
> > -	while (!try_cmpxchg(&rq->execution_mask, &exec, exec & allowed))
> > -		;
> > -
> > -	/* Prevent the master from being re-run on the bonded engines */
> > -	to_request(signal)->execution_mask &= ~allowed;
> > -}
> > -
> >   struct intel_context *
> >   intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> >   			       unsigned int count)
> > @@ -3649,7 +3600,6 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> >   	ve->base.schedule = i915_schedule;
> >   	ve->base.submit_request = virtual_submit_request;
> > -	ve->base.bond_execute = virtual_bond_execute;
> >   	INIT_LIST_HEAD(virtual_queue(ve));
> >   	ve->base.execlists.queue_priority_hint = INT_MIN;
> > @@ -3747,59 +3697,9 @@ intel_execlists_clone_virtual(struct intel_engine_cs *src)
> >   	if (IS_ERR(dst))
> >   		return dst;
> > -	if (se->num_bonds) {
> > -		struct virtual_engine *de = to_virtual_engine(dst->engine);
> > -
> > -		de->bonds = kmemdup(se->bonds,
> > -				    sizeof(*se->bonds) * se->num_bonds,
> > -				    GFP_KERNEL);
> > -		if (!de->bonds) {
> > -			intel_context_put(dst);
> > -			return ERR_PTR(-ENOMEM);
> > -		}
> > -
> > -		de->num_bonds = se->num_bonds;
> > -	}
> > -
> >   	return dst;
> >   }
> > -int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
> > -				     const struct intel_engine_cs *master,
> > -				     const struct intel_engine_cs *sibling)
> > -{
> > -	struct virtual_engine *ve = to_virtual_engine(engine);
> > -	struct ve_bond *bond;
> > -	int n;
> > -
> > -	/* Sanity check the sibling is part of the virtual engine */
> > -	for (n = 0; n < ve->num_siblings; n++)
> > -		if (sibling == ve->siblings[n])
> > -			break;
> > -	if (n == ve->num_siblings)
> > -		return -EINVAL;
> > -
> > -	bond = virtual_find_bond(ve, master);
> > -	if (bond) {
> > -		bond->sibling_mask |= sibling->mask;
> > -		return 0;
> > -	}
> > -
> > -	bond = krealloc(ve->bonds,
> > -			sizeof(*bond) * (ve->num_bonds + 1),
> > -			GFP_KERNEL);
> > -	if (!bond)
> > -		return -ENOMEM;
> > -
> > -	bond[ve->num_bonds].master = master;
> > -	bond[ve->num_bonds].sibling_mask = sibling->mask;
> > -
> > -	ve->bonds = bond;
> > -	ve->num_bonds++;
> > -
> > -	return 0;
> > -}
> > -
> >   void intel_execlists_show_requests(struct intel_engine_cs *engine,
> >   				   struct drm_printer *m,
> >   				   void (*show_request)(struct drm_printer *m,
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> > index fd61dae820e9e..80cec37a56ba9 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> > @@ -39,10 +39,6 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> >   struct intel_context *
> >   intel_execlists_clone_virtual(struct intel_engine_cs *src);
> > -int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
> > -				     const struct intel_engine_cs *master,
> > -				     const struct intel_engine_cs *sibling);
> > -
> >   bool
> >   intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > index 1081cd36a2bd3..f03446d587160 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > @@ -4311,234 +4311,6 @@ static int live_virtual_preserved(void *arg)
> >   	return 0;
> >   }
> > -static int bond_virtual_engine(struct intel_gt *gt,
> > -			       unsigned int class,
> > -			       struct intel_engine_cs **siblings,
> > -			       unsigned int nsibling,
> > -			       unsigned int flags)
> > -#define BOND_SCHEDULE BIT(0)
> > -{
> > -	struct intel_engine_cs *master;
> > -	struct i915_request *rq[16];
> > -	enum intel_engine_id id;
> > -	struct igt_spinner spin;
> > -	unsigned long n;
> > -	int err;
> > -
> > -	/*
> > -	 * A set of bonded requests is intended to be run concurrently
> > -	 * across a number of engines. We use one request per-engine
> > -	 * and a magic fence to schedule each of the bonded requests
> > -	 * at the same time. A consequence of our current scheduler is that
> > -	 * we only move requests to the HW ready queue when the request
> > -	 * becomes ready, that is when all of its prerequisite fences have
> > -	 * been signaled. As one of those fences is the master submit fence,
> > -	 * there is a delay on all secondary fences as the HW may be
> > -	 * currently busy. Equally, as all the requests are independent,
> > -	 * they may have other fences that delay individual request
> > -	 * submission to HW. Ergo, we do not guarantee that all requests are
> > -	 * immediately submitted to HW at the same time, just that if the
> > -	 * rules are abided by, they are ready at the same time as the
> > -	 * first is submitted. Userspace can embed semaphores in its batch
> > -	 * to ensure parallel execution of its phases as it requires.
> > -	 * Though naturally it gets requested that perhaps the scheduler should
> > -	 * take care of parallel execution, even across preemption events on
> > -	 * different HW. (The proper answer is of course "lalalala".)
> > -	 *
> > -	 * With the submit-fence, we have identified three possible phases
> > -	 * of synchronisation depending on the master fence: queued (not
> > -	 * ready), executing, and signaled. The first two are quite simple
> > -	 * and checked below. However, the signaled master fence handling is
> > -	 * contentious. Currently we do not distinguish between a signaled
> > -	 * fence and an expired fence, as once signaled it does not convey
> > -	 * any information about the previous execution. It may even be freed
> > -	 * and hence checking later it may not exist at all. Ergo we currently
> > -	 * do not apply the bonding constraint for an already signaled fence,
> > -	 * as our expectation is that it should not constrain the secondaries
> > -	 * and is outside of the scope of the bonded request API (i.e. all
> > -	 * userspace requests are meant to be running in parallel). As
> > -	 * it imposes no constraint, and is effectively a no-op, we do not
> > -	 * check below as normal execution flows are checked extensively above.
> > -	 *
> > -	 * XXX Is the degenerate handling of signaled submit fences the
> > -	 * expected behaviour for userpace?
> > -	 */
> > -
> > -	GEM_BUG_ON(nsibling >= ARRAY_SIZE(rq) - 1);
> > -
> > -	if (igt_spinner_init(&spin, gt))
> > -		return -ENOMEM;
> > -
> > -	err = 0;
> > -	rq[0] = ERR_PTR(-ENOMEM);
> > -	for_each_engine(master, gt, id) {
> > -		struct i915_sw_fence fence = {};
> > -		struct intel_context *ce;
> > -
> > -		if (master->class == class)
> > -			continue;
> > -
> > -		ce = intel_context_create(master);
> > -		if (IS_ERR(ce)) {
> > -			err = PTR_ERR(ce);
> > -			goto out;
> > -		}
> > -
> > -		memset_p((void *)rq, ERR_PTR(-EINVAL), ARRAY_SIZE(rq));
> > -
> > -		rq[0] = igt_spinner_create_request(&spin, ce, MI_NOOP);
> > -		intel_context_put(ce);
> > -		if (IS_ERR(rq[0])) {
> > -			err = PTR_ERR(rq[0]);
> > -			goto out;
> > -		}
> > -		i915_request_get(rq[0]);
> > -
> > -		if (flags & BOND_SCHEDULE) {
> > -			onstack_fence_init(&fence);
> > -			err = i915_sw_fence_await_sw_fence_gfp(&rq[0]->submit,
> > -							       &fence,
> > -							       GFP_KERNEL);
> > -		}
> > -
> > -		i915_request_add(rq[0]);
> > -		if (err < 0)
> > -			goto out;
> > -
> > -		if (!(flags & BOND_SCHEDULE) &&
> > -		    !igt_wait_for_spinner(&spin, rq[0])) {
> > -			err = -EIO;
> > -			goto out;
> > -		}
> > -
> > -		for (n = 0; n < nsibling; n++) {
> > -			struct intel_context *ve;
> > -
> > -			ve = intel_execlists_create_virtual(siblings, nsibling);
> > -			if (IS_ERR(ve)) {
> > -				err = PTR_ERR(ve);
> > -				onstack_fence_fini(&fence);
> > -				goto out;
> > -			}
> > -
> > -			err = intel_virtual_engine_attach_bond(ve->engine,
> > -							       master,
> > -							       siblings[n]);
> > -			if (err) {
> > -				intel_context_put(ve);
> > -				onstack_fence_fini(&fence);
> > -				goto out;
> > -			}
> > -
> > -			err = intel_context_pin(ve);
> > -			intel_context_put(ve);
> > -			if (err) {
> > -				onstack_fence_fini(&fence);
> > -				goto out;
> > -			}
> > -
> > -			rq[n + 1] = i915_request_create(ve);
> > -			intel_context_unpin(ve);
> > -			if (IS_ERR(rq[n + 1])) {
> > -				err = PTR_ERR(rq[n + 1]);
> > -				onstack_fence_fini(&fence);
> > -				goto out;
> > -			}
> > -			i915_request_get(rq[n + 1]);
> > -
> > -			err = i915_request_await_execution(rq[n + 1],
> > -							   &rq[0]->fence,
> > -							   ve->engine->bond_execute);
> > -			i915_request_add(rq[n + 1]);
> > -			if (err < 0) {
> > -				onstack_fence_fini(&fence);
> > -				goto out;
> > -			}
> > -		}
> > -		onstack_fence_fini(&fence);
> > -		intel_engine_flush_submission(master);
> > -		igt_spinner_end(&spin);
> > -
> > -		if (i915_request_wait(rq[0], 0, HZ / 10) < 0) {
> > -			pr_err("Master request did not execute (on %s)!\n",
> > -			       rq[0]->engine->name);
> > -			err = -EIO;
> > -			goto out;
> > -		}
> > -
> > -		for (n = 0; n < nsibling; n++) {
> > -			if (i915_request_wait(rq[n + 1], 0,
> > -					      MAX_SCHEDULE_TIMEOUT) < 0) {
> > -				err = -EIO;
> > -				goto out;
> > -			}
> > -
> > -			if (rq[n + 1]->engine != siblings[n]) {
> > -				pr_err("Bonded request did not execute on target engine: expected %s, used %s; master was %s\n",
> > -				       siblings[n]->name,
> > -				       rq[n + 1]->engine->name,
> > -				       rq[0]->engine->name);
> > -				err = -EINVAL;
> > -				goto out;
> > -			}
> > -		}
> > -
> > -		for (n = 0; !IS_ERR(rq[n]); n++)
> > -			i915_request_put(rq[n]);
> > -		rq[0] = ERR_PTR(-ENOMEM);
> > -	}
> > -
> > -out:
> > -	for (n = 0; !IS_ERR(rq[n]); n++)
> > -		i915_request_put(rq[n]);
> > -	if (igt_flush_test(gt->i915))
> > -		err = -EIO;
> > -
> > -	igt_spinner_fini(&spin);
> > -	return err;
> > -}
> > -
> > -static int live_virtual_bond(void *arg)
> > -{
> > -	static const struct phase {
> > -		const char *name;
> > -		unsigned int flags;
> > -	} phases[] = {
> > -		{ "", 0 },
> > -		{ "schedule", BOND_SCHEDULE },
> > -		{ },
> > -	};
> > -	struct intel_gt *gt = arg;
> > -	struct intel_engine_cs *siblings[MAX_ENGINE_INSTANCE + 1];
> > -	unsigned int class;
> > -	int err;
> > -
> > -	if (intel_uc_uses_guc_submission(&gt->uc))
> > -		return 0;
> > -
> > -	for (class = 0; class <= MAX_ENGINE_CLASS; class++) {
> > -		const struct phase *p;
> > -		int nsibling;
> > -
> > -		nsibling = select_siblings(gt, class, siblings);
> > -		if (nsibling < 2)
> > -			continue;
> > -
> > -		for (p = phases; p->name; p++) {
> > -			err = bond_virtual_engine(gt,
> > -						  class, siblings, nsibling,
> > -						  p->flags);
> > -			if (err) {
> > -				pr_err("%s(%s): failed class=%d, nsibling=%d, err=%d\n",
> > -				       __func__, p->name, class, nsibling, err);
> > -				return err;
> > -			}
> > -		}
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >   static int reset_virtual_engine(struct intel_gt *gt,
> >   				struct intel_engine_cs **siblings,
> >   				unsigned int nsibling)
> > @@ -4712,7 +4484,6 @@ int intel_execlists_live_selftests(struct drm_i915_private *i915)
> >   		SUBTEST(live_virtual_mask),
> >   		SUBTEST(live_virtual_preserved),
> >   		SUBTEST(live_virtual_slice),
> > -		SUBTEST(live_virtual_bond),
> >   		SUBTEST(live_virtual_reset),
> >   	};
> > 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
