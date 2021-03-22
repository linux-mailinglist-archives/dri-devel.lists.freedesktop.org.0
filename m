Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666143446C7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535EE6E4B1;
	Mon, 22 Mar 2021 14:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444AE6E4B1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:09:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b9so17049896wrt.8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1+7gGTOg0eRQSXxaHSmxD50U7ShUgZIdex74yaasWuI=;
 b=UL/OLiUnbO/Li1PYFmozXZL1iz1v1ksWxlfrTH6JfKXCSKb1x2ulrxvj3qYFj11aw1
 qik2ZSWp4CLpetZeMnh7mlItddubOavPs+j/8JVflKYuivfiPnic3ycvj8V49HJ9KstB
 +XfbH1IeuJlGl9GClbHnWbtlCmeEmPPUulMdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1+7gGTOg0eRQSXxaHSmxD50U7ShUgZIdex74yaasWuI=;
 b=Op2pbaoOQmeBKWwQlQPOUqUNj3H8ISKfbl+AnikrH6Wmjcftk44xKskRhBW03KfOZe
 A+BaZN4wW3cCtKo1f0dLDtXxMOIMJVSt4jihJ9kEb4hSRoSTLYwvId8EkgswSqmRE39k
 LSaN9Zum+Ffntbwi/8G1dbG5RENag3CgHoQDuGwDALkcX+2GiDBdwPy11o+Ddcup4U2Z
 uM5LLe9CFXih60Snag/mKecqCA7sfuKGli+KJBMx8d5J0BeaLrVmgBBas6Wn+393NJQV
 B/3vAZqFtMvvcUcCWSTDidj9C/ESKqba/5oeDtg04yn8bhShJggYwYeRoI5RWJ90eS1g
 ZvsQ==
X-Gm-Message-State: AOAM5310WjCWPAaKMyO52Mnyv3TgBPk3e3wYSa99voYDVIYnfyImsaxX
 16AqPLl1oUT2l56WeZxNaMQBVkKHCha+iu0S
X-Google-Smtp-Source: ABdhPJxw8DjCdcqsVNGQLS2lata99dL3dyTcNXwWNbRUBL3I0jobChXGMEzKwoJpOyMCv2XdABHRlw==
X-Received: by 2002:a1c:9d51:: with SMTP id g78mr58153wme.5.1616422187900;
 Mon, 22 Mar 2021 07:09:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v13sm22756133wrt.45.2021.03.22.07.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:09:46 -0700 (PDT)
Date: Mon, 22 Mar 2021 15:09:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: Drop the CONTEXT_CLONE API
Message-ID: <YFilKSbKYd+0HbCn@phenom.ffwll.local>
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-4-jason@jlekstrand.net>
 <7918db68-835c-b416-6187-1e62892ce5ed@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7918db68-835c-b416-6187-1e62892ce5ed@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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

On Mon, Mar 22, 2021 at 11:22:01AM +0000, Tvrtko Ursulin wrote:
> 
> On 19/03/2021 22:38, Jason Ekstrand wrote:
> > This API allows one context to grab bits out of another context upon
> > creation.  It can be used as a short-cut for setparam(getparam()) for
> > things like I915_CONTEXT_PARAM_VM.  However, it's never been used by any
> > real userspace.  It's used by a few IGT tests and that's it.  Since it
> > doesn't add any real value (most of the stuff you can CLONE you can copy
> > in other ways), drop it.
> 
> No complaints to remove if it ended up unused outside IGT. Latter is a _big_
> problem though, since it is much more that a few IGT tests. So I really
> think there really needs to be an evaluation and a plan for that (we don't
> want to lose 50% of the coverage over night).
> 
> > There is one thing that this API allows you to clone which you cannot
> > clone via getparam/setparam: timelines.  However, timelines are an
> > implementation detail of i915 and not really something that needs to be
> 
> Not really true timelines are i915 implementation detail. They are in fact a
> dma-fence context:seqno concept, nothing more that than. I think you are
> probably confusing struct intel_timeline with the timeline wording in the
> uapi. Former is i915 implementation detail, but context:seqno are truly
> userspace timelines.

I think you're both saying the same thing and talking a bit past each
another.

Yes the timeline is just a string of dma_fence, that's correct. Now
usually if you submit batches with execbuf, we have 3 ways to synchronize
concurrent submission: implicit sync, sync_file and drm_syncob. They all
map to different needs in different protocols/render apis.

Now in one additional case the kernel makes sure that batchbuffers are
ordered, and that's when you submit them to the same hw ctx. Because
there's only 1 hw context and you really can't have batchbuffers run on
that single hw context out of order. That's what the timeline object we
talk about here is. But that largely is an internal implementation detail,
which happens to also use most/all the same infrastructure as the
dma_fence uapi pieces above.

Now the internal implementation detail leaking here is that we exposed
this to userspace, without there being any need for this. What Jason
implements with syncobj in the next patch is essentially what userspace
should have been using for cross-engine sync. media userspace doesn't care
about interop with winsys/client apis, so they equally could have used
implicit sync or sync_file here (which I think is the solution now for the
new uapi prepped internally), since they all are about equally powerful
for stringing batchbuffers together.

So I do think the assessment is accurate, albeit a bit on the terse side.
Maybe we could quote just the entire thing here in the commit message.
-Danile

> 
> But again, no objection to removing unused uapi in principle. Narrative has
> to be accurate and test coverage not lost though.
> 
> Regards,
> 
> Tvrtko
> 
> > exposed to userspace.  Also, sharing timelines between contexts isn't
> > obviously useful and supporting it has the potential to complicate i915
> > internally.  It also doesn't add any functionality that the client can't
> > get in other ways.  If a client really wants a shared timeline, they can
> > use a syncobj and set it as an in and out fence on every submit.
> > 
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c | 199 +-------------------
> >   include/uapi/drm/i915_drm.h                 |  16 +-
> >   2 files changed, 6 insertions(+), 209 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index d28ac79de7573..f88bac19333ec 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -1983,207 +1983,14 @@ static int create_setparam(struct i915_user_extension __user *ext, void *data)
> >   	return ctx_setparam(arg->fpriv, arg->ctx, &local.param);
> >   }
> > -static int clone_engines(struct i915_gem_context *dst,
> > -			 struct i915_gem_context *src)
> > +static int invalid_ext(struct i915_user_extension __user *ext, void *data)
> >   {
> > -	struct i915_gem_engines *clone, *e;
> > -	bool user_engines;
> > -	unsigned long n;
> > -
> > -	e = __context_engines_await(src, &user_engines);
> > -	if (!e)
> > -		return -ENOENT;
> > -
> > -	clone = alloc_engines(e->num_engines);
> > -	if (!clone)
> > -		goto err_unlock;
> > -
> > -	for (n = 0; n < e->num_engines; n++) {
> > -		struct intel_engine_cs *engine;
> > -
> > -		if (!e->engines[n]) {
> > -			clone->engines[n] = NULL;
> > -			continue;
> > -		}
> > -		engine = e->engines[n]->engine;
> > -
> > -		/*
> > -		 * Virtual engines are singletons; they can only exist
> > -		 * inside a single context, because they embed their
> > -		 * HW context... As each virtual context implies a single
> > -		 * timeline (each engine can only dequeue a single request
> > -		 * at any time), it would be surprising for two contexts
> > -		 * to use the same engine. So let's create a copy of
> > -		 * the virtual engine instead.
> > -		 */
> > -		if (intel_engine_is_virtual(engine))
> > -			clone->engines[n] =
> > -				intel_execlists_clone_virtual(engine);
> > -		else
> > -			clone->engines[n] = intel_context_create(engine);
> > -		if (IS_ERR_OR_NULL(clone->engines[n])) {
> > -			__free_engines(clone, n);
> > -			goto err_unlock;
> > -		}
> > -
> > -		intel_context_set_gem(clone->engines[n], dst);
> > -	}
> > -	clone->num_engines = n;
> > -	i915_sw_fence_complete(&e->fence);
> > -
> > -	/* Serialised by constructor */
> > -	engines_idle_release(dst, rcu_replace_pointer(dst->engines, clone, 1));
> > -	if (user_engines)
> > -		i915_gem_context_set_user_engines(dst);
> > -	else
> > -		i915_gem_context_clear_user_engines(dst);
> > -	return 0;
> > -
> > -err_unlock:
> > -	i915_sw_fence_complete(&e->fence);
> > -	return -ENOMEM;
> > -}
> > -
> > -static int clone_flags(struct i915_gem_context *dst,
> > -		       struct i915_gem_context *src)
> > -{
> > -	dst->user_flags = src->user_flags;
> > -	return 0;
> > -}
> > -
> > -static int clone_schedattr(struct i915_gem_context *dst,
> > -			   struct i915_gem_context *src)
> > -{
> > -	dst->sched = src->sched;
> > -	return 0;
> > -}
> > -
> > -static int clone_sseu(struct i915_gem_context *dst,
> > -		      struct i915_gem_context *src)
> > -{
> > -	struct i915_gem_engines *e = i915_gem_context_lock_engines(src);
> > -	struct i915_gem_engines *clone;
> > -	unsigned long n;
> > -	int err;
> > -
> > -	/* no locking required; sole access under constructor*/
> > -	clone = __context_engines_static(dst);
> > -	if (e->num_engines != clone->num_engines) {
> > -		err = -EINVAL;
> > -		goto unlock;
> > -	}
> > -
> > -	for (n = 0; n < e->num_engines; n++) {
> > -		struct intel_context *ce = e->engines[n];
> > -
> > -		if (clone->engines[n]->engine->class != ce->engine->class) {
> > -			/* Must have compatible engine maps! */
> > -			err = -EINVAL;
> > -			goto unlock;
> > -		}
> > -
> > -		/* serialises with set_sseu */
> > -		err = intel_context_lock_pinned(ce);
> > -		if (err)
> > -			goto unlock;
> > -
> > -		clone->engines[n]->sseu = ce->sseu;
> > -		intel_context_unlock_pinned(ce);
> > -	}
> > -
> > -	err = 0;
> > -unlock:
> > -	i915_gem_context_unlock_engines(src);
> > -	return err;
> > -}
> > -
> > -static int clone_timeline(struct i915_gem_context *dst,
> > -			  struct i915_gem_context *src)
> > -{
> > -	if (src->timeline)
> > -		__assign_timeline(dst, src->timeline);
> > -
> > -	return 0;
> > -}
> > -
> > -static int clone_vm(struct i915_gem_context *dst,
> > -		    struct i915_gem_context *src)
> > -{
> > -	struct i915_address_space *vm;
> > -	int err = 0;
> > -
> > -	if (!rcu_access_pointer(src->vm))
> > -		return 0;
> > -
> > -	rcu_read_lock();
> > -	vm = context_get_vm_rcu(src);
> > -	rcu_read_unlock();
> > -
> > -	if (!mutex_lock_interruptible(&dst->mutex)) {
> > -		__assign_ppgtt(dst, vm);
> > -		mutex_unlock(&dst->mutex);
> > -	} else {
> > -		err = -EINTR;
> > -	}
> > -
> > -	i915_vm_put(vm);
> > -	return err;
> > -}
> > -
> > -static int create_clone(struct i915_user_extension __user *ext, void *data)
> > -{
> > -	static int (* const fn[])(struct i915_gem_context *dst,
> > -				  struct i915_gem_context *src) = {
> > -#define MAP(x, y) [ilog2(I915_CONTEXT_CLONE_##x)] = y
> > -		MAP(ENGINES, clone_engines),
> > -		MAP(FLAGS, clone_flags),
> > -		MAP(SCHEDATTR, clone_schedattr),
> > -		MAP(SSEU, clone_sseu),
> > -		MAP(TIMELINE, clone_timeline),
> > -		MAP(VM, clone_vm),
> > -#undef MAP
> > -	};
> > -	struct drm_i915_gem_context_create_ext_clone local;
> > -	const struct create_ext *arg = data;
> > -	struct i915_gem_context *dst = arg->ctx;
> > -	struct i915_gem_context *src;
> > -	int err, bit;
> > -
> > -	if (copy_from_user(&local, ext, sizeof(local)))
> > -		return -EFAULT;
> > -
> > -	BUILD_BUG_ON(GENMASK(BITS_PER_TYPE(local.flags) - 1, ARRAY_SIZE(fn)) !=
> > -		     I915_CONTEXT_CLONE_UNKNOWN);
> > -
> > -	if (local.flags & I915_CONTEXT_CLONE_UNKNOWN)
> > -		return -EINVAL;
> > -
> > -	if (local.rsvd)
> > -		return -EINVAL;
> > -
> > -	rcu_read_lock();
> > -	src = __i915_gem_context_lookup_rcu(arg->fpriv, local.clone_id);
> > -	rcu_read_unlock();
> > -	if (!src)
> > -		return -ENOENT;
> > -
> > -	GEM_BUG_ON(src == dst);
> > -
> > -	for (bit = 0; bit < ARRAY_SIZE(fn); bit++) {
> > -		if (!(local.flags & BIT(bit)))
> > -			continue;
> > -
> > -		err = fn[bit](dst, src);
> > -		if (err)
> > -			return err;
> > -	}
> > -
> > -	return 0;
> > +	return -EINVAL;
> >   }
> >   static const i915_user_extension_fn create_extensions[] = {
> >   	[I915_CONTEXT_CREATE_EXT_SETPARAM] = create_setparam,
> > -	[I915_CONTEXT_CREATE_EXT_CLONE] = create_clone,
> > +	[I915_CONTEXT_CREATE_EXT_CLONE] = invalid_ext,
> >   };
> >   static bool client_is_banned(struct drm_i915_file_private *file_priv)
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index 4c4b9254def1b..33ef78cb1deb7 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -1841,20 +1841,10 @@ struct drm_i915_gem_context_create_ext_setparam {
> >   	struct drm_i915_gem_context_param param;
> >   };
> > -struct drm_i915_gem_context_create_ext_clone {
> > +/* This API has been removed.  On the off chance someone somewhere has
> > + * attempted to use it, never re-use this extension number.
> > + */
> >   #define I915_CONTEXT_CREATE_EXT_CLONE 1
> > -	struct i915_user_extension base;
> > -	__u32 clone_id;
> > -	__u32 flags;
> > -#define I915_CONTEXT_CLONE_ENGINES	(1u << 0)
> > -#define I915_CONTEXT_CLONE_FLAGS	(1u << 1)
> > -#define I915_CONTEXT_CLONE_SCHEDATTR	(1u << 2)
> > -#define I915_CONTEXT_CLONE_SSEU		(1u << 3)
> > -#define I915_CONTEXT_CLONE_TIMELINE	(1u << 4)
> > -#define I915_CONTEXT_CLONE_VM		(1u << 5)
> > -#define I915_CONTEXT_CLONE_UNKNOWN -(I915_CONTEXT_CLONE_VM << 1)
> > -	__u64 rsvd;
> > -};
> >   struct drm_i915_gem_context_destroy {
> >   	__u32 ctx_id;
> > 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
