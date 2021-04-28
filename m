Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C5736DE74
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237EE6EC0F;
	Wed, 28 Apr 2021 17:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BBA6EC11
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 17:38:52 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u3so17172180eja.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 10:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7frRkT4g0r513DI5MuFq7Uk/6YaAtshNCuvs4qXooxE=;
 b=R+2nhzu2rGY8m7SrsZSWxv5DR35RyuXmNq2ZTZYKgKwNNBHLRpx5ZZryUtPEgk18pe
 Hx+oFHH6JCfqvEsvHTb49tc9dh+2nhqXpNlotWH0bKXrVgh+EZNQX61nUHg5L1FDvaBu
 4f5Dcaezd7KPelB1laBlAlv+VLS9Nh6Q1vcWmaHFi8XFUxS+6Uou94Ti+VaCRBug64OM
 L2o1qt5QaTw1htOwJdia5JUZegzLF5jNDFjPwSiTxE8zn0oU1/U6PT4nFQR2T5fruV6E
 55eQir9huCPS+lmXAV4pYxkjtgOoKGcMsMGSgAieUswIKmXM1htDfDmQ3dGMnCTPzwHO
 lkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7frRkT4g0r513DI5MuFq7Uk/6YaAtshNCuvs4qXooxE=;
 b=O+WZOcQHTDQOSTZAdNHn8WP0z1TpYT2aU/oX67lhyGPTup1839m+jNwDXLzRv7Koi1
 Ny2o9saZ8BESUzzSdFkYrZkrPcUiMtkju06fJMUA7bJb9NKInlAcX/752F43JllDWmsv
 HmzsMAGyGGmWAzXc41x5+LqTDKuUTIT7F8lRGwyb4bf6LTgqgKNTKHBKN7BOYGkTJmiC
 B7Ye6bd3Zv9jDQ2c2j65WuL9lfZxFmptNG3k5BnUzK9duA58aoE5A9YAPXbEL3TX7+Bd
 PYz2qNfjQPAhbWMzNp/IDKVjx0J1Fzd1kly4oQ3AjlRIWFyNebaFxtDQycGqSArK8AgQ
 rsmA==
X-Gm-Message-State: AOAM530l23vSAXKagk/G6dcWfoRqpuJhqk7MUEYxrCMYUKkQZ6LoYIcX
 Km0N+yzOH7JmRlpiDDsiFtcxYngsMFI7ebQoQoKl84KcKBE=
X-Google-Smtp-Source: ABdhPJzIzBwAHmGBmQKk1mufQfcj3LMIPT5ok7QffDw3HRlCTNzQSgd8SfmC18gBmDQ1Dm9DA3HCnbzxLQTvuHEE5ek=
X-Received: by 2002:a17:906:dc90:: with SMTP id
 cs16mr29972051ejc.210.1619631531246; 
 Wed, 28 Apr 2021 10:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-6-jason@jlekstrand.net>
 <YIfePDDB9Xuit1i+@phenom.ffwll.local>
In-Reply-To: <YIfePDDB9Xuit1i+@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 28 Apr 2021 12:38:40 -0500
Message-ID: <CAOFGe97tFt3=GTr0kJ7fwRmHVy+N9jUfoQ9HwF+U6fytxbAmNA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 05/21] drm/i915: Drop the CONTEXT_CLONE API
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 4:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Apr 23, 2021 at 05:31:15PM -0500, Jason Ekstrand wrote:
> > This API allows one context to grab bits out of another context upon
> > creation.  It can be used as a short-cut for setparam(getparam()) for
> > things like I915_CONTEXT_PARAM_VM.  However, it's never been used by any
> > real userspace.  It's used by a few IGT tests and that's it.  Since it
> > doesn't add any real value (most of the stuff you can CLONE you can copy
> > in other ways), drop it.
> >
> > There is one thing that this API allows you to clone which you cannot
> > clone via getparam/setparam: timelines.  However, timelines are an
> > implementation detail of i915 and not really something that needs to be
> > exposed to userspace.  Also, sharing timelines between contexts isn't
> > obviously useful and supporting it has the potential to complicate i915
> > internally.  It also doesn't add any functionality that the client can't
> > get in other ways.  If a client really wants a shared timeline, they can
> > use a syncobj and set it as an in and out fence on every submit.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_context.c | 199 +-------------------
> >  include/uapi/drm/i915_drm.h                 |  16 +-
> >  2 files changed, 6 insertions(+), 209 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index 8a77855123cec..2c2fefa912805 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -1958,207 +1958,14 @@ static int create_setparam(struct i915_user_extension __user *ext, void *data)
> >       return ctx_setparam(arg->fpriv, arg->ctx, &local.param);
> >  }
> >
> > -static int clone_engines(struct i915_gem_context *dst,
> > -                      struct i915_gem_context *src)
> > +static int invalid_ext(struct i915_user_extension __user *ext, void *data)
> >  {
> > -     struct i915_gem_engines *clone, *e;
> > -     bool user_engines;
> > -     unsigned long n;
> > -
> > -     e = __context_engines_await(src, &user_engines);
> > -     if (!e)
> > -             return -ENOENT;
> > -
> > -     clone = alloc_engines(e->num_engines);
> > -     if (!clone)
> > -             goto err_unlock;
> > -
> > -     for (n = 0; n < e->num_engines; n++) {
> > -             struct intel_engine_cs *engine;
> > -
> > -             if (!e->engines[n]) {
> > -                     clone->engines[n] = NULL;
> > -                     continue;
> > -             }
> > -             engine = e->engines[n]->engine;
> > -
> > -             /*
> > -              * Virtual engines are singletons; they can only exist
> > -              * inside a single context, because they embed their
> > -              * HW context... As each virtual context implies a single
> > -              * timeline (each engine can only dequeue a single request
> > -              * at any time), it would be surprising for two contexts
> > -              * to use the same engine. So let's create a copy of
> > -              * the virtual engine instead.
> > -              */
> > -             if (intel_engine_is_virtual(engine))
> > -                     clone->engines[n] =
> > -                             intel_execlists_clone_virtual(engine);
>
> You forgot to gc this function here ^^

Done, with pleasure!

> > -             else
> > -                     clone->engines[n] = intel_context_create(engine);
> > -             if (IS_ERR_OR_NULL(clone->engines[n])) {
> > -                     __free_engines(clone, n);
> > -                     goto err_unlock;
> > -             }
> > -
> > -             intel_context_set_gem(clone->engines[n], dst);
>
> Not peeked ahead, but I'm really hoping intel_context_set_gem gets removed
> eventually too ...

I've not gotten rid of it yet but it's on my list of things to clean
up.  The problem is that there are a pile of parameters we want to set
for user engines which we don't set for internal engines:

 - VM
 - priority
 - hangcheck timeout
 - gem_context back-pointer (I'd love to drop this one!)
 - a bunch more when we start shifting more stuff into intel_context

And there are a bunch of places where we create non-user engines.  The
end result being that we have four ugly options:

 1. Set them after the fact as per intel_context_set_gem
 2. Touch all 79 instances of intel_context_create( for each new
create param we add
 3. Add a new struct intel_context_create_args which contains all the
extra stuff and make NULL mean "use the defaults"
 4. Add a new struct i915_gem_engine which is used for client-visible
engines.  When we switch to an engine-based uAPI, this is probably
what would be exposed to userspace.

I'm happy to hear opinions on which of those is the best option. 2. is
clearly a bad idea.


> > -     }
> > -     clone->num_engines = n;
> > -     i915_sw_fence_complete(&e->fence);
> > -
> > -     /* Serialised by constructor */
> > -     engines_idle_release(dst, rcu_replace_pointer(dst->engines, clone, 1));
> > -     if (user_engines)
> > -             i915_gem_context_set_user_engines(dst);
> > -     else
> > -             i915_gem_context_clear_user_engines(dst);
> > -     return 0;
> > -
> > -err_unlock:
> > -     i915_sw_fence_complete(&e->fence);
> > -     return -ENOMEM;
> > -}
> > -
> > -static int clone_flags(struct i915_gem_context *dst,
> > -                    struct i915_gem_context *src)
> > -{
> > -     dst->user_flags = src->user_flags;
> > -     return 0;
> > -}
> > -
> > -static int clone_schedattr(struct i915_gem_context *dst,
> > -                        struct i915_gem_context *src)
> > -{
> > -     dst->sched = src->sched;
> > -     return 0;
> > -}
> > -
> > -static int clone_sseu(struct i915_gem_context *dst,
> > -                   struct i915_gem_context *src)
> > -{
> > -     struct i915_gem_engines *e = i915_gem_context_lock_engines(src);
> > -     struct i915_gem_engines *clone;
> > -     unsigned long n;
> > -     int err;
> > -
> > -     /* no locking required; sole access under constructor*/
> > -     clone = __context_engines_static(dst);
> > -     if (e->num_engines != clone->num_engines) {
> > -             err = -EINVAL;
> > -             goto unlock;
> > -     }
> > -
> > -     for (n = 0; n < e->num_engines; n++) {
> > -             struct intel_context *ce = e->engines[n];
> > -
> > -             if (clone->engines[n]->engine->class != ce->engine->class) {
> > -                     /* Must have compatible engine maps! */
> > -                     err = -EINVAL;
> > -                     goto unlock;
> > -             }
> > -
> > -             /* serialises with set_sseu */
> > -             err = intel_context_lock_pinned(ce);
> > -             if (err)
> > -                     goto unlock;
> > -
> > -             clone->engines[n]->sseu = ce->sseu;
> > -             intel_context_unlock_pinned(ce);
> > -     }
> > -
> > -     err = 0;
> > -unlock:
> > -     i915_gem_context_unlock_engines(src);
> > -     return err;
> > -}
> > -
> > -static int clone_timeline(struct i915_gem_context *dst,
> > -                       struct i915_gem_context *src)
> > -{
> > -     if (src->timeline)
> > -             __assign_timeline(dst, src->timeline);
> > -
> > -     return 0;
> > -}
> > -
> > -static int clone_vm(struct i915_gem_context *dst,
> > -                 struct i915_gem_context *src)
> > -{
> > -     struct i915_address_space *vm;
> > -     int err = 0;
> > -
> > -     if (!rcu_access_pointer(src->vm))
> > -             return 0;
> > -
> > -     rcu_read_lock();
> > -     vm = context_get_vm_rcu(src);
> > -     rcu_read_unlock();
> > -
> > -     if (!mutex_lock_interruptible(&dst->mutex)) {
> > -             __assign_ppgtt(dst, vm);
> > -             mutex_unlock(&dst->mutex);
> > -     } else {
> > -             err = -EINTR;
> > -     }
> > -
> > -     i915_vm_put(vm);
> > -     return err;
> > -}
> > -
> > -static int create_clone(struct i915_user_extension __user *ext, void *data)
> > -{
> > -     static int (* const fn[])(struct i915_gem_context *dst,
> > -                               struct i915_gem_context *src) = {
> > -#define MAP(x, y) [ilog2(I915_CONTEXT_CLONE_##x)] = y
> > -             MAP(ENGINES, clone_engines),
> > -             MAP(FLAGS, clone_flags),
> > -             MAP(SCHEDATTR, clone_schedattr),
> > -             MAP(SSEU, clone_sseu),
> > -             MAP(TIMELINE, clone_timeline),
> > -             MAP(VM, clone_vm),
> > -#undef MAP
> > -     };
> > -     struct drm_i915_gem_context_create_ext_clone local;
> > -     const struct create_ext *arg = data;
> > -     struct i915_gem_context *dst = arg->ctx;
> > -     struct i915_gem_context *src;
> > -     int err, bit;
> > -
> > -     if (copy_from_user(&local, ext, sizeof(local)))
> > -             return -EFAULT;
> > -
> > -     BUILD_BUG_ON(GENMASK(BITS_PER_TYPE(local.flags) - 1, ARRAY_SIZE(fn)) !=
> > -                  I915_CONTEXT_CLONE_UNKNOWN);
> > -
> > -     if (local.flags & I915_CONTEXT_CLONE_UNKNOWN)
> > -             return -EINVAL;
> > -
> > -     if (local.rsvd)
> > -             return -EINVAL;
> > -
> > -     rcu_read_lock();
> > -     src = __i915_gem_context_lookup_rcu(arg->fpriv, local.clone_id);
> > -     rcu_read_unlock();
> > -     if (!src)
> > -             return -ENOENT;
> > -
> > -     GEM_BUG_ON(src == dst);
> > -
> > -     for (bit = 0; bit < ARRAY_SIZE(fn); bit++) {
> > -             if (!(local.flags & BIT(bit)))
> > -                     continue;
> > -
> > -             err = fn[bit](dst, src);
> > -             if (err)
> > -                     return err;
> > -     }
> > -
> > -     return 0;
> > +     return -EINVAL;
> >  }
> >
> >  static const i915_user_extension_fn create_extensions[] = {
> >       [I915_CONTEXT_CREATE_EXT_SETPARAM] = create_setparam,
> > -     [I915_CONTEXT_CREATE_EXT_CLONE] = create_clone,
> > +     [I915_CONTEXT_CREATE_EXT_CLONE] = invalid_ext,
> >  };
> >
> >  static bool client_is_banned(struct drm_i915_file_private *file_priv)
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index a0aaa8298f28d..75a71b6756ed8 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -1887,20 +1887,10 @@ struct drm_i915_gem_context_create_ext_setparam {
> >       struct drm_i915_gem_context_param param;
> >  };
> >
> > -struct drm_i915_gem_context_create_ext_clone {
> > +/* This API has been removed.  On the off chance someone somewhere has
> > + * attempted to use it, never re-use this extension number.
> > + */
> >  #define I915_CONTEXT_CREATE_EXT_CLONE 1
>
> I think we need to put these somewhere else now, here it's just plain
> lost. I think in the kerneldoc for
> drm_i915_gem_context_create_ext_setparam would be best, with the #define
> right above and in the kerneldoc an enumeration of all the values and what
> they're for.

I fully agree it's not great.  But I'm not sure create_ext_setparam
makes sense either.  This is it's own extension that's unrelated to
ext_setparam.

--Jason


> I think I'll need to sign up Matt B or you for doing some kerneldoc polish
> on these so they're all collected together.
> -Daniel
>
> > -     struct i915_user_extension base;
> > -     __u32 clone_id;
> > -     __u32 flags;
> > -#define I915_CONTEXT_CLONE_ENGINES   (1u << 0)
> > -#define I915_CONTEXT_CLONE_FLAGS     (1u << 1)
> > -#define I915_CONTEXT_CLONE_SCHEDATTR (1u << 2)
> > -#define I915_CONTEXT_CLONE_SSEU              (1u << 3)
> > -#define I915_CONTEXT_CLONE_TIMELINE  (1u << 4)
> > -#define I915_CONTEXT_CLONE_VM                (1u << 5)
> > -#define I915_CONTEXT_CLONE_UNKNOWN -(I915_CONTEXT_CLONE_VM << 1)
> > -     __u64 rsvd;
> > -};
> >
> >  struct drm_i915_gem_context_destroy {
> >       __u32 ctx_id;
> > --
> > 2.31.1
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
