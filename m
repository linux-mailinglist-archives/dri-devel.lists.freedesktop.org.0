Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36EE36C76B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 15:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6F46E96D;
	Tue, 27 Apr 2021 13:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D506E223
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 13:58:25 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d11so1731117wrw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 06:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c4kHCgADw9/V4yrRzuQ0+Ij5cNraprJgEFznbVuWcZc=;
 b=QSMg73tVgEsdukrtrMAeXuFPdqVkOdX/Frfp211aKo8ENi/TmMyGOMMWiSaTMeY2Nb
 q3+fCgaaELmQmBYFn2g4NeV3gH0BePsM/+kJbPW2V1pQzvS7P/E1W09rI6RwAYd1Xe4c
 uZvWEbjyD7zJ8Gx6r7zLEiAh9i0s8u03bYQJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c4kHCgADw9/V4yrRzuQ0+Ij5cNraprJgEFznbVuWcZc=;
 b=qSzcVj3Nt5YmIX7P9S20yZOXZidunyQTTbXptMR8peLQIzZRVlQE84w+YxY2MT7mR2
 6PAk6L8LyC31FoJk4Jm72Ci+26A4NG8bDq3dP/gwca1uZVOVz8S16B0GEqLrsOIiW3IO
 cfpfOmoHIeKNMV0XqDygOfoeXpXFsH5mRq3RmVikXMDFndaShwHyA+WpQZLweIPuYMQi
 o4Iyp2C1/EGCDYyvVwpLK4iTlyPShtZIuM6IrNDi8869tg/n0fl4AQSGsXQ5VujOwFVs
 fBMZ0DL0iW21pVLWfeAPn5WyWGeSgQKJxO3OUSX+pJpUuteDQj1tdy+OwiXLg7TGYPEH
 sQjw==
X-Gm-Message-State: AOAM533kFd5zFbV/876NVnIS+sLe0g05b4rp7FYyP48b81tvrves0Cds
 Il7arkeUBWfFA0GUpcK8ZRaEHgNJq5JZUg==
X-Google-Smtp-Source: ABdhPJzCNhkx0qlPkbjc0RVoHVW0wInWBgFmvZpcgqW9momGwXz/88SHVcJZz8bu4NouguRqg5F12Q==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr29479270wrq.193.1619531904385; 
 Tue, 27 Apr 2021 06:58:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q5sm2836232wmj.20.2021.04.27.06.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 06:58:23 -0700 (PDT)
Date: Tue, 27 Apr 2021 15:58:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 08/20] drm/i915/gem: Disallow bonding of
 virtual engines (v2)
Message-ID: <YIgYfhALb1vydpF/@phenom.ffwll.local>
References: <20210423223131.879208-9-jason@jlekstrand.net>
 <20210426234330.1213373-1-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426234330.1213373-1-jason@jlekstrand.net>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 06:43:30PM -0500, Jason Ekstrand wrote:
> This adds a bunch of complexity which the media driver has never
> actually used.  The media driver does technically bond a balanced engine
> to another engine but the balanced engine only has one engine in the
> sibling set.  This doesn't actually result in a virtual engine.

Have you tripled checked this by running media stack with bonding? Also
this needs acks from media side, pls Cc Carl&Tony.

I think you should also explain a bit more indetail why exactly the bonded
submit thing is a no-op and what the implications are, since it took me a
while to get that. Plus you missed the entire SUBMIT_FENCE entertainment,
so obviously this isn't very obvious :-)
 
> Unless some userspace badly wants it, there's no good reason to support
> this case.  This makes I915_CONTEXT_ENGINES_EXT_BOND a total no-op.  We
> leave the validation code in place in case we ever decide we want to do
> something interesting with the bonding information.
> 
> v2 (Jason Ekstrand):
>  - Don't delete quite as much code.  Some of it was necessary.

Please explain the details here, after all this is rather tricky ...

> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

So this just stops the uapi and immediate things. But since I've looked
around in how this works I think it'd be worth it to throw a backend
cleanup task on top. Not the entire thing, but just the most egregious
detail:

One thing the submit fence does, aside from holding up the subsequent
batches until the first one is scheduled, is limit the set of engines to
the right pair - which we know once the engine is selected for the first
batch. That's done with some lockless trickery in the await fence callback
(iirc, would need to double-check) with cmpxchg. If we can delete that in
a follow-up, assuming it's really not pulling in an entire string of
things, I think that would be rather nice clarification on what's possible
or not possible wrt execlist backend scheduling.

I'd like to do this now because unlike all the rcu stuff it's a lot harder
to find it again and realize it's all dead code now. With the rcu/locking
stuff I'm much less worried about leaving complexity behind that we don't
realize isn't needed anymore.

Also we really need to make sure we can get away with this before we
commit to anything I think ...

Code itself looks reasonable, but I'll wait for r-b stamping until the
commit message is more polished.
-Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   |  18 +-
>  .../drm/i915/gt/intel_execlists_submission.c  |  83 -------
>  .../drm/i915/gt/intel_execlists_submission.h  |   4 -
>  drivers/gpu/drm/i915/gt/selftest_execlists.c  | 229 ------------------
>  4 files changed, 6 insertions(+), 328 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index e8179918fa306..5f8d0faf783aa 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1553,6 +1553,12 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
>  	}
>  	virtual = set->engines->engines[idx]->engine;
>  
> +	if (intel_engine_is_virtual(virtual)) {
> +		drm_dbg(&i915->drm,
> +			"Bonding with virtual engines not allowed\n");
> +		return -EINVAL;
> +	}
> +
>  	err = check_user_mbz(&ext->flags);
>  	if (err)
>  		return err;
> @@ -1593,18 +1599,6 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
>  				n, ci.engine_class, ci.engine_instance);
>  			return -EINVAL;
>  		}
> -
> -		/*
> -		 * A non-virtual engine has no siblings to choose between; and
> -		 * a submit fence will always be directed to the one engine.
> -		 */
> -		if (intel_engine_is_virtual(virtual)) {
> -			err = intel_virtual_engine_attach_bond(virtual,
> -							       master,
> -							       bond);
> -			if (err)
> -				return err;
> -		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index de124870af44d..a6204c60b59cb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -181,18 +181,6 @@ struct virtual_engine {
>  		int prio;
>  	} nodes[I915_NUM_ENGINES];
>  
> -	/*
> -	 * Keep track of bonded pairs -- restrictions upon on our selection
> -	 * of physical engines any particular request may be submitted to.
> -	 * If we receive a submit-fence from a master engine, we will only
> -	 * use one of sibling_mask physical engines.
> -	 */
> -	struct ve_bond {
> -		const struct intel_engine_cs *master;
> -		intel_engine_mask_t sibling_mask;
> -	} *bonds;
> -	unsigned int num_bonds;
> -
>  	/* And finally, which physical engines this virtual engine maps onto. */
>  	unsigned int num_siblings;
>  	struct intel_engine_cs *siblings[];
> @@ -3307,7 +3295,6 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
>  	intel_breadcrumbs_free(ve->base.breadcrumbs);
>  	intel_engine_free_request_pool(&ve->base);
>  
> -	kfree(ve->bonds);
>  	kfree(ve);
>  }
>  
> @@ -3560,33 +3547,13 @@ static void virtual_submit_request(struct i915_request *rq)
>  	spin_unlock_irqrestore(&ve->base.active.lock, flags);
>  }
>  
> -static struct ve_bond *
> -virtual_find_bond(struct virtual_engine *ve,
> -		  const struct intel_engine_cs *master)
> -{
> -	int i;
> -
> -	for (i = 0; i < ve->num_bonds; i++) {
> -		if (ve->bonds[i].master == master)
> -			return &ve->bonds[i];
> -	}
> -
> -	return NULL;
> -}
> -
>  static void
>  virtual_bond_execute(struct i915_request *rq, struct dma_fence *signal)
>  {
> -	struct virtual_engine *ve = to_virtual_engine(rq->engine);
>  	intel_engine_mask_t allowed, exec;
> -	struct ve_bond *bond;
>  
>  	allowed = ~to_request(signal)->engine->mask;
>  
> -	bond = virtual_find_bond(ve, to_request(signal)->engine);
> -	if (bond)
> -		allowed &= bond->sibling_mask;
> -
>  	/* Restrict the bonded request to run on only the available engines */
>  	exec = READ_ONCE(rq->execution_mask);
>  	while (!try_cmpxchg(&rq->execution_mask, &exec, exec & allowed))
> @@ -3747,59 +3714,9 @@ intel_execlists_clone_virtual(struct intel_engine_cs *src)
>  	if (IS_ERR(dst))
>  		return dst;
>  
> -	if (se->num_bonds) {
> -		struct virtual_engine *de = to_virtual_engine(dst->engine);
> -
> -		de->bonds = kmemdup(se->bonds,
> -				    sizeof(*se->bonds) * se->num_bonds,
> -				    GFP_KERNEL);
> -		if (!de->bonds) {
> -			intel_context_put(dst);
> -			return ERR_PTR(-ENOMEM);
> -		}
> -
> -		de->num_bonds = se->num_bonds;
> -	}
> -
>  	return dst;
>  }
>  
> -int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
> -				     const struct intel_engine_cs *master,
> -				     const struct intel_engine_cs *sibling)
> -{
> -	struct virtual_engine *ve = to_virtual_engine(engine);
> -	struct ve_bond *bond;
> -	int n;
> -
> -	/* Sanity check the sibling is part of the virtual engine */
> -	for (n = 0; n < ve->num_siblings; n++)
> -		if (sibling == ve->siblings[n])
> -			break;
> -	if (n == ve->num_siblings)
> -		return -EINVAL;
> -
> -	bond = virtual_find_bond(ve, master);
> -	if (bond) {
> -		bond->sibling_mask |= sibling->mask;
> -		return 0;
> -	}
> -
> -	bond = krealloc(ve->bonds,
> -			sizeof(*bond) * (ve->num_bonds + 1),
> -			GFP_KERNEL);
> -	if (!bond)
> -		return -ENOMEM;
> -
> -	bond[ve->num_bonds].master = master;
> -	bond[ve->num_bonds].sibling_mask = sibling->mask;
> -
> -	ve->bonds = bond;
> -	ve->num_bonds++;
> -
> -	return 0;
> -}
> -
>  void intel_execlists_show_requests(struct intel_engine_cs *engine,
>  				   struct drm_printer *m,
>  				   void (*show_request)(struct drm_printer *m,
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> index fd61dae820e9e..80cec37a56ba9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> @@ -39,10 +39,6 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
>  struct intel_context *
>  intel_execlists_clone_virtual(struct intel_engine_cs *src);
>  
> -int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
> -				     const struct intel_engine_cs *master,
> -				     const struct intel_engine_cs *sibling);
> -
>  bool
>  intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
>  
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index 1081cd36a2bd3..f03446d587160 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -4311,234 +4311,6 @@ static int live_virtual_preserved(void *arg)
>  	return 0;
>  }
>  
> -static int bond_virtual_engine(struct intel_gt *gt,
> -			       unsigned int class,
> -			       struct intel_engine_cs **siblings,
> -			       unsigned int nsibling,
> -			       unsigned int flags)
> -#define BOND_SCHEDULE BIT(0)
> -{
> -	struct intel_engine_cs *master;
> -	struct i915_request *rq[16];
> -	enum intel_engine_id id;
> -	struct igt_spinner spin;
> -	unsigned long n;
> -	int err;
> -
> -	/*
> -	 * A set of bonded requests is intended to be run concurrently
> -	 * across a number of engines. We use one request per-engine
> -	 * and a magic fence to schedule each of the bonded requests
> -	 * at the same time. A consequence of our current scheduler is that
> -	 * we only move requests to the HW ready queue when the request
> -	 * becomes ready, that is when all of its prerequisite fences have
> -	 * been signaled. As one of those fences is the master submit fence,
> -	 * there is a delay on all secondary fences as the HW may be
> -	 * currently busy. Equally, as all the requests are independent,
> -	 * they may have other fences that delay individual request
> -	 * submission to HW. Ergo, we do not guarantee that all requests are
> -	 * immediately submitted to HW at the same time, just that if the
> -	 * rules are abided by, they are ready at the same time as the
> -	 * first is submitted. Userspace can embed semaphores in its batch
> -	 * to ensure parallel execution of its phases as it requires.
> -	 * Though naturally it gets requested that perhaps the scheduler should
> -	 * take care of parallel execution, even across preemption events on
> -	 * different HW. (The proper answer is of course "lalalala".)
> -	 *
> -	 * With the submit-fence, we have identified three possible phases
> -	 * of synchronisation depending on the master fence: queued (not
> -	 * ready), executing, and signaled. The first two are quite simple
> -	 * and checked below. However, the signaled master fence handling is
> -	 * contentious. Currently we do not distinguish between a signaled
> -	 * fence and an expired fence, as once signaled it does not convey
> -	 * any information about the previous execution. It may even be freed
> -	 * and hence checking later it may not exist at all. Ergo we currently
> -	 * do not apply the bonding constraint for an already signaled fence,
> -	 * as our expectation is that it should not constrain the secondaries
> -	 * and is outside of the scope of the bonded request API (i.e. all
> -	 * userspace requests are meant to be running in parallel). As
> -	 * it imposes no constraint, and is effectively a no-op, we do not
> -	 * check below as normal execution flows are checked extensively above.
> -	 *
> -	 * XXX Is the degenerate handling of signaled submit fences the
> -	 * expected behaviour for userpace?
> -	 */
> -
> -	GEM_BUG_ON(nsibling >= ARRAY_SIZE(rq) - 1);
> -
> -	if (igt_spinner_init(&spin, gt))
> -		return -ENOMEM;
> -
> -	err = 0;
> -	rq[0] = ERR_PTR(-ENOMEM);
> -	for_each_engine(master, gt, id) {
> -		struct i915_sw_fence fence = {};
> -		struct intel_context *ce;
> -
> -		if (master->class == class)
> -			continue;
> -
> -		ce = intel_context_create(master);
> -		if (IS_ERR(ce)) {
> -			err = PTR_ERR(ce);
> -			goto out;
> -		}
> -
> -		memset_p((void *)rq, ERR_PTR(-EINVAL), ARRAY_SIZE(rq));
> -
> -		rq[0] = igt_spinner_create_request(&spin, ce, MI_NOOP);
> -		intel_context_put(ce);
> -		if (IS_ERR(rq[0])) {
> -			err = PTR_ERR(rq[0]);
> -			goto out;
> -		}
> -		i915_request_get(rq[0]);
> -
> -		if (flags & BOND_SCHEDULE) {
> -			onstack_fence_init(&fence);
> -			err = i915_sw_fence_await_sw_fence_gfp(&rq[0]->submit,
> -							       &fence,
> -							       GFP_KERNEL);
> -		}
> -
> -		i915_request_add(rq[0]);
> -		if (err < 0)
> -			goto out;
> -
> -		if (!(flags & BOND_SCHEDULE) &&
> -		    !igt_wait_for_spinner(&spin, rq[0])) {
> -			err = -EIO;
> -			goto out;
> -		}
> -
> -		for (n = 0; n < nsibling; n++) {
> -			struct intel_context *ve;
> -
> -			ve = intel_execlists_create_virtual(siblings, nsibling);
> -			if (IS_ERR(ve)) {
> -				err = PTR_ERR(ve);
> -				onstack_fence_fini(&fence);
> -				goto out;
> -			}
> -
> -			err = intel_virtual_engine_attach_bond(ve->engine,
> -							       master,
> -							       siblings[n]);
> -			if (err) {
> -				intel_context_put(ve);
> -				onstack_fence_fini(&fence);
> -				goto out;
> -			}
> -
> -			err = intel_context_pin(ve);
> -			intel_context_put(ve);
> -			if (err) {
> -				onstack_fence_fini(&fence);
> -				goto out;
> -			}
> -
> -			rq[n + 1] = i915_request_create(ve);
> -			intel_context_unpin(ve);
> -			if (IS_ERR(rq[n + 1])) {
> -				err = PTR_ERR(rq[n + 1]);
> -				onstack_fence_fini(&fence);
> -				goto out;
> -			}
> -			i915_request_get(rq[n + 1]);
> -
> -			err = i915_request_await_execution(rq[n + 1],
> -							   &rq[0]->fence,
> -							   ve->engine->bond_execute);
> -			i915_request_add(rq[n + 1]);
> -			if (err < 0) {
> -				onstack_fence_fini(&fence);
> -				goto out;
> -			}
> -		}
> -		onstack_fence_fini(&fence);
> -		intel_engine_flush_submission(master);
> -		igt_spinner_end(&spin);
> -
> -		if (i915_request_wait(rq[0], 0, HZ / 10) < 0) {
> -			pr_err("Master request did not execute (on %s)!\n",
> -			       rq[0]->engine->name);
> -			err = -EIO;
> -			goto out;
> -		}
> -
> -		for (n = 0; n < nsibling; n++) {
> -			if (i915_request_wait(rq[n + 1], 0,
> -					      MAX_SCHEDULE_TIMEOUT) < 0) {
> -				err = -EIO;
> -				goto out;
> -			}
> -
> -			if (rq[n + 1]->engine != siblings[n]) {
> -				pr_err("Bonded request did not execute on target engine: expected %s, used %s; master was %s\n",
> -				       siblings[n]->name,
> -				       rq[n + 1]->engine->name,
> -				       rq[0]->engine->name);
> -				err = -EINVAL;
> -				goto out;
> -			}
> -		}
> -
> -		for (n = 0; !IS_ERR(rq[n]); n++)
> -			i915_request_put(rq[n]);
> -		rq[0] = ERR_PTR(-ENOMEM);
> -	}
> -
> -out:
> -	for (n = 0; !IS_ERR(rq[n]); n++)
> -		i915_request_put(rq[n]);
> -	if (igt_flush_test(gt->i915))
> -		err = -EIO;
> -
> -	igt_spinner_fini(&spin);
> -	return err;
> -}
> -
> -static int live_virtual_bond(void *arg)
> -{
> -	static const struct phase {
> -		const char *name;
> -		unsigned int flags;
> -	} phases[] = {
> -		{ "", 0 },
> -		{ "schedule", BOND_SCHEDULE },
> -		{ },
> -	};
> -	struct intel_gt *gt = arg;
> -	struct intel_engine_cs *siblings[MAX_ENGINE_INSTANCE + 1];
> -	unsigned int class;
> -	int err;
> -
> -	if (intel_uc_uses_guc_submission(&gt->uc))
> -		return 0;
> -
> -	for (class = 0; class <= MAX_ENGINE_CLASS; class++) {
> -		const struct phase *p;
> -		int nsibling;
> -
> -		nsibling = select_siblings(gt, class, siblings);
> -		if (nsibling < 2)
> -			continue;
> -
> -		for (p = phases; p->name; p++) {
> -			err = bond_virtual_engine(gt,
> -						  class, siblings, nsibling,
> -						  p->flags);
> -			if (err) {
> -				pr_err("%s(%s): failed class=%d, nsibling=%d, err=%d\n",
> -				       __func__, p->name, class, nsibling, err);
> -				return err;
> -			}
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>  static int reset_virtual_engine(struct intel_gt *gt,
>  				struct intel_engine_cs **siblings,
>  				unsigned int nsibling)
> @@ -4712,7 +4484,6 @@ int intel_execlists_live_selftests(struct drm_i915_private *i915)
>  		SUBTEST(live_virtual_mask),
>  		SUBTEST(live_virtual_preserved),
>  		SUBTEST(live_virtual_slice),
> -		SUBTEST(live_virtual_bond),
>  		SUBTEST(live_virtual_reset),
>  	};
>  
> -- 
> 2.31.1
> 
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
