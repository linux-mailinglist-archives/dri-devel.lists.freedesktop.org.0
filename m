Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD636EE57
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 18:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138D56F3D8;
	Thu, 29 Apr 2021 16:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E68E6F3D8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 16:44:55 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id u21so100897174ejo.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 09:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BGV47WTM/j8WfTmpHYDxeyV3Z4HDjbm+WVzMAp7srWw=;
 b=BqcC0bUIvXJIhvxziJncdqxQnv+5tPiH1r8rUF6+ajR4zTASu4A+HmSNkkosHnH5Su
 e77uiTsEuKhG/KVs4c6BwQrMAVwMSlhDMfQRUKBbHlAI6gWeaIX94vpE0BRd2+KqcJUv
 GdLoGfkM7eVQfeZeEy9IuDWeL/mqNk44M/+Y5G2WrmfxhUrw5EgnhGpXadJ3BEGso21Q
 16cfd9ePRRoDJjMkn6rDY//64fDc9wSOnObJcGGc/u03xVYWL013I/4eLEvpaSUlWW5H
 VIj0H1+vJmZYou11lA/j9P+28BZOGEaPTDL3dXaWeEiq3CgIld2QGaw6weqdBsgaC+Ly
 kq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BGV47WTM/j8WfTmpHYDxeyV3Z4HDjbm+WVzMAp7srWw=;
 b=hoKDJFWhwLgi3gI8tqIdiCee/OXAw2Jd03b2onBS7RLrOSBvYpqCHgbtyDLLDcskGj
 Al0yjX19zZVae4VrrAWWZ1WI9c+V0iI3t0AretpEBecPFS2RNYZSS2nSDYsRA0biIns4
 WcNa4KuBd+PjFO6AxqTqwaaleR1bybMvKBHRovD4MhwCjFSBJdX6iQHQBZ1VYOHLCW2P
 ERmqTfg84OMta16xSJVNraAPUvsvHCZFxIhQJgH9VZuuMdhETd6bmpYHl09lroi11EjG
 qnZrn0Chfa0E8JZJVK79fpb8hsBLxkE/0cKwXpLhVP4cjQfN2xQiBDnTzM3qjU7JM8Rw
 IOpg==
X-Gm-Message-State: AOAM533TYCCQ+xbbRjlqywWyK1uCA89Diyk6a05pyyydEYhI08lfYacC
 Mhyq0d9rgt9J7DM7DipWk+UvBxDiNsyh7MtqC3Pi28hvBuw=
X-Google-Smtp-Source: ABdhPJy+hAUou88jccUhWRsB6pKK1TgHoWynWQBwT1jQXDy681WwBe+vK+Q18x6HkER9Ltvvy5/3u1hJ4Cc/LoQhIQw=
X-Received: by 2002:a17:906:5a96:: with SMTP id
 l22mr817239ejq.450.1619714693869; 
 Thu, 29 Apr 2021 09:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-14-jason@jlekstrand.net>
 <YIqufo0AsyRndhav@phenom.ffwll.local>
In-Reply-To: <YIqufo0AsyRndhav@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 29 Apr 2021 11:44:42 -0500
Message-ID: <CAOFGe94qNkG-8bUSMB0PudXQcs7C22mQqZR=NoPtSG6EHh0rpQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 13/21] drm/i915/gem: Add an intermediate
 proto_context struct
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

On Thu, Apr 29, 2021 at 8:02 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> The commit introducing a new data structure really should have a solid
> intro in the commit message about. Please cover
>
> - that ctx really should be immutable, safe for exceptions like priority
>
> - that unfortunately we butchered the uapi with setparam and sharing
>   setparams between create_ext and setparam
>
> - and how exactly proto ctx fixes this (with stuff like locking design
>   used)
>
> Maybe also dupe the kerneldoc into here for completeness.
> On Fri, Apr 23, 2021 at 05:31:23PM -0500, Jason Ekstrand wrote:
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 143 ++++++++++++++----
> >  .../gpu/drm/i915/gem/i915_gem_context_types.h |  21 +++
> >  .../gpu/drm/i915/gem/selftests/mock_context.c |  16 +-
>
> I'm wondering whether in the end we should split out the proto_ctx into
> its own file, with the struct private only to itself. But I guess
> impossible during the transition, and also maybe afterwards?
>
> >  3 files changed, 150 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index e5efd22c89ba2..3e883daab93bf 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -191,6 +191,95 @@ static int validate_priority(struct drm_i915_private *i915,
> >       return 0;
> >  }
> >
> > +static void proto_context_close(struct i915_gem_proto_context *pc)
> > +{
> > +     if (pc->vm)
> > +             i915_vm_put(pc->vm);
> > +     kfree(pc);
> > +}
> > +
> > +static int proto_context_set_persistence(struct drm_i915_private *i915,
> > +                                      struct i915_gem_proto_context *pc,
> > +                                      bool persist)
> > +{
> > +     if (test_bit(UCONTEXT_PERSISTENCE, &pc->user_flags) == persist)
> > +             return 0;
>
> We have compilers to optimize this kind of stuff, pls remove :-)
> Especially with the non-atomic bitops there's no point.

I thought at one point that this did have a purpose.  However, now
that I look at it harder, I'm pretty sure it doesn't.  Will drop.

> > +
> > +     if (persist) {
> > +             /*
> > +              * Only contexts that are short-lived [that will expire or be
> > +              * reset] are allowed to survive past termination. We require
> > +              * hangcheck to ensure that the persistent requests are healthy.
> > +              */
> > +             if (!i915->params.enable_hangcheck)
> > +                     return -EINVAL;
> > +
> > +             set_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);
>
> It's a bit entetaining, but the bitops in the kernel are atomic. Which is
> hella confusing here.
>
> I think open coding is the standard for truly normal bitops.

There's __set_bit if you'd rather I use that.

> > +     } else {
> > +             /* To cancel a context we use "preempt-to-idle" */
> > +             if (!(i915->caps.scheduler & I915_SCHEDULER_CAP_PREEMPTION))
> > +                     return -ENODEV;
> > +
> > +             /*
> > +              * If the cancel fails, we then need to reset, cleanly!
> > +              *
> > +              * If the per-engine reset fails, all hope is lost! We resort
> > +              * to a full GPU reset in that unlikely case, but realistically
> > +              * if the engine could not reset, the full reset does not fare
> > +              * much better. The damage has been done.
> > +              *
> > +              * However, if we cannot reset an engine by itself, we cannot
> > +              * cleanup a hanging persistent context without causing
> > +              * colateral damage, and we should not pretend we can by
> > +              * exposing the interface.
> > +              */
> > +             if (!intel_has_reset_engine(&i915->gt))
> > +                     return -ENODEV;
> > +
> > +             clear_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);
>
> Same here.
>
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static struct i915_gem_proto_context *
> > +proto_context_create(struct drm_i915_private *i915, unsigned int flags)
> > +{
> > +     struct i915_gem_proto_context *pc;
> > +
> > +     if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
> > +         !HAS_EXECLISTS(i915))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     pc = kzalloc(sizeof(*pc), GFP_KERNEL);
> > +     if (!pc)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     if (HAS_FULL_PPGTT(i915)) {
> > +             struct i915_ppgtt *ppgtt;
> > +
> > +             ppgtt = i915_ppgtt_create(&i915->gt);
> > +             if (IS_ERR(ppgtt)) {
> > +                     drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
> > +                             PTR_ERR(ppgtt));
> > +                     proto_context_close(pc);
> > +                     return ERR_CAST(ppgtt);
> > +             }
> > +             pc->vm = &ppgtt->vm;
> > +     }
> > +
> > +     pc->user_flags = 0;
> > +     set_bit(UCONTEXT_BANNABLE, &pc->user_flags);
> > +     set_bit(UCONTEXT_RECOVERABLE, &pc->user_flags);
>
> Same about atomic bitops here.

Changed to just initialize to BANNABLE | RECOVERABLE.

> > +     proto_context_set_persistence(i915, pc, true);
> > +     pc->sched.priority = I915_PRIORITY_NORMAL;
> > +
> > +     if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE)
> > +             pc->single_timeline = true;
>
> bit a bikeshed, but I'd put the error checking in here too and deal with
> the unwind pain with the usual goto proto_close. That should also make the
> ppgtt unwind path a bit clearer because it sticks out in the standard way.

Sure.  Can do.

> > +
> > +     return pc;
> > +}
> > +
> >  static struct i915_address_space *
> >  context_get_vm_rcu(struct i915_gem_context *ctx)
> >  {
> > @@ -660,7 +749,8 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
> >  }
> >
> >  static struct i915_gem_context *
> > -__create_context(struct drm_i915_private *i915)
> > +__create_context(struct drm_i915_private *i915,
> > +              const struct i915_gem_proto_context *pc)
> >  {
> >       struct i915_gem_context *ctx;
> >       struct i915_gem_engines *e;
> > @@ -673,7 +763,7 @@ __create_context(struct drm_i915_private *i915)
> >
> >       kref_init(&ctx->ref);
> >       ctx->i915 = i915;
> > -     ctx->sched.priority = I915_PRIORITY_NORMAL;
> > +     ctx->sched = pc->sched;
> >       mutex_init(&ctx->mutex);
> >       INIT_LIST_HEAD(&ctx->link);
> >
> > @@ -696,9 +786,7 @@ __create_context(struct drm_i915_private *i915)
> >        * is no remap info, it will be a NOP. */
> >       ctx->remap_slice = ALL_L3_SLICES(i915);
> >
> > -     i915_gem_context_set_bannable(ctx);
> > -     i915_gem_context_set_recoverable(ctx);
> > -     __context_set_persistence(ctx, true /* cgroup hook? */);
> > +     ctx->user_flags = pc->user_flags;
> >
> >       for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
> >               ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
> > @@ -786,38 +874,23 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
> >  }
> >
> >  static struct i915_gem_context *
> > -i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> > +i915_gem_create_context(struct drm_i915_private *i915,
> > +                     const struct i915_gem_proto_context *pc)
> >  {
> >       struct i915_gem_context *ctx;
> >       int ret;
> >
> > -     if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
> > -         !HAS_EXECLISTS(i915))
> > -             return ERR_PTR(-EINVAL);
> > -
> > -     ctx = __create_context(i915);
> > +     ctx = __create_context(i915, pc);
> >       if (IS_ERR(ctx))
> >               return ctx;
> >
> > -     if (HAS_FULL_PPGTT(i915)) {
> > -             struct i915_ppgtt *ppgtt;
> > -
> > -             ppgtt = i915_ppgtt_create(&i915->gt);
> > -             if (IS_ERR(ppgtt)) {
> > -                     drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
> > -                             PTR_ERR(ppgtt));
> > -                     context_close(ctx);
> > -                     return ERR_CAST(ppgtt);
> > -             }
> > -
> > +     if (pc->vm) {
> >               mutex_lock(&ctx->mutex);
>
> I guess this dies later, but this mutex_lock here is superflous since
> right now no one else can get at our ctx struct. And nothing in
> __assign_ppgtt checks for us holding the lock.
>
> But fine if it only gets remove in the vm immutable patch.

Yeah, I think it gets dropped in the immutable patch.  I just didn't
want to perturb things more than necessary in this one.

> > -             __assign_ppgtt(ctx, &ppgtt->vm);
> > +             __assign_ppgtt(ctx, pc->vm);
> >               mutex_unlock(&ctx->mutex);
> > -
> > -             i915_vm_put(&ppgtt->vm);
> >       }
> >
> > -     if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> > +     if (pc->single_timeline) {
> >               ret = drm_syncobj_create(&ctx->syncobj,
> >                                        DRM_SYNCOBJ_CREATE_SIGNALED,
> >                                        NULL);
> > @@ -883,6 +956,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
> >                         struct drm_file *file)
> >  {
> >       struct drm_i915_file_private *file_priv = file->driver_priv;
> > +     struct i915_gem_proto_context *pc;
> >       struct i915_gem_context *ctx;
> >       int err;
> >       u32 id;
> > @@ -892,7 +966,14 @@ int i915_gem_context_open(struct drm_i915_private *i915,
> >       /* 0 reserved for invalid/unassigned ppgtt */
> >       xa_init_flags(&file_priv->vm_xa, XA_FLAGS_ALLOC1);
> >
> > -     ctx = i915_gem_create_context(i915, 0);
> > +     pc = proto_context_create(i915, 0);
> > +     if (IS_ERR(pc)) {
> > +             err = PTR_ERR(pc);
> > +             goto err;
> > +     }
> > +
> > +     ctx = i915_gem_create_context(i915, pc);
> > +     proto_context_close(pc);
> >       if (IS_ERR(ctx)) {
> >               err = PTR_ERR(ctx);
> >               goto err;
> > @@ -1884,6 +1965,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
> >  {
> >       struct drm_i915_private *i915 = to_i915(dev);
> >       struct drm_i915_gem_context_create_ext *args = data;
> > +     struct i915_gem_proto_context *pc;
> >       struct create_ext ext_data;
> >       int ret;
> >       u32 id;
> > @@ -1906,7 +1988,12 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
> >               return -EIO;
> >       }
> >
> > -     ext_data.ctx = i915_gem_create_context(i915, args->flags);
> > +     pc = proto_context_create(i915, args->flags);
> > +     if (IS_ERR(pc))
> > +             return PTR_ERR(pc);
> > +
> > +     ext_data.ctx = i915_gem_create_context(i915, pc);
> > +     proto_context_close(pc);
> >       if (IS_ERR(ext_data.ctx))
> >               return PTR_ERR(ext_data.ctx);
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > index df76767f0c41b..a42c429f94577 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > @@ -46,6 +46,27 @@ struct i915_gem_engines_iter {
> >       const struct i915_gem_engines *engines;
> >  };
> >
> > +/**
> > + * struct i915_gem_proto_context - prototype context
> > + *
> > + * The struct i915_gem_proto_context represents the creation parameters for
> > + * an i915_gem_context.  This is used to gather parameters provided either
> > + * through creation flags or via SET_CONTEXT_PARAM so that, when we create
> > + * the final i915_gem_context, those parameters can be immutable.
>
> The patch that puts them on an xa should explain how the locking here
> works, even if it's rather trivial.
>
> > + */
> > +struct i915_gem_proto_context {
> > +     /** @vm: See i915_gem_context::vm */
> > +     struct i915_address_space *vm;
> > +
> > +     /** @user_flags: See i915_gem_context::user_flags */
> > +     unsigned long user_flags;
> > +
> > +     /** @sched: See i915_gem_context::sched */
> > +     struct i915_sched_attr sched;
> > +
>
> To avoid the kerneldoc warning point at your emulated syncobj here.

Done.

> Also this file isn't included in the i915 context docs (why would it, the
> docs have been left dead for years after all :-/). Please fix that in a
> prep patch.

Will do.

--Jason

> > +     bool single_timeline;
> > +};
> > +
> >  /**
> >   * struct i915_gem_context - client state
> >   *
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > index 51b5a3421b400..e0f512ef7f3c6 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > @@ -80,11 +80,17 @@ void mock_init_contexts(struct drm_i915_private *i915)
> >  struct i915_gem_context *
> >  live_context(struct drm_i915_private *i915, struct file *file)
> >  {
> > +     struct i915_gem_proto_context *pc;
> >       struct i915_gem_context *ctx;
> >       int err;
> >       u32 id;
> >
> > -     ctx = i915_gem_create_context(i915, 0);
> > +     pc = proto_context_create(i915, 0);
> > +     if (IS_ERR(pc))
> > +             return ERR_CAST(pc);
> > +
> > +     ctx = i915_gem_create_context(i915, pc);
> > +     proto_context_close(pc);
> >       if (IS_ERR(ctx))
> >               return ctx;
> >
> > @@ -142,8 +148,14 @@ struct i915_gem_context *
> >  kernel_context(struct drm_i915_private *i915)
> >  {
> >       struct i915_gem_context *ctx;
> > +     struct i915_gem_proto_context *pc;
> > +
> > +     pc = proto_context_create(i915, 0);
> > +     if (IS_ERR(pc))
> > +             return ERR_CAST(pc);
> >
> > -     ctx = i915_gem_create_context(i915, 0);
> > +     ctx = i915_gem_create_context(i915, pc);
> > +     proto_context_close(pc);
> >       if (IS_ERR(ctx))
> >               return ctx;
>
> With all comments addressed: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> >
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
