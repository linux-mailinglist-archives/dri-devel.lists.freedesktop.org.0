Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6203A3170
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8896EDB4;
	Thu, 10 Jun 2021 16:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1A36EDB4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:53:59 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id q21so249998ybg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 09:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+XrzVYbfStIfdeR++GkOZhKElGv/rXjhxdSRc9lmJjk=;
 b=QW/wyWOvmdrjREKo7RLvA8MnII1OBEnHvb9jnrGkiXjopISsQ57FV/tfuYPD9ahCwe
 AxOkZcYXGTnP8NYuBD3DNzBOnVyeDvu80XFjmKUSJqZVn+wqU9G01MaUaLYdCj7/NTtX
 s2mIU55rUIw1L1r0AfJsDxzyvZsOH34Blt5LaGBl0rqldKN4d76l5n+cdUSRBIuLZgKm
 xdallmuK1IPVIxhUshKd0yMM732hDW6qbuzsXCYNuh1WzjQ7iAmFI0W3ysy8K/YMwIz2
 LLOpxqketLfy9ny2wR7bgQYb8V4t6d1I8Ka8cbtYQ/XzI9oiDD85M9cx8aZTysZW0S+3
 VLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+XrzVYbfStIfdeR++GkOZhKElGv/rXjhxdSRc9lmJjk=;
 b=V16v9Bc4lbJFz5WRe76YJiV4mPRCD9qnMo+lT5pSgy2Jflex5wt4pfgJJ6UB6Vm1f+
 gRs92RpQhrTe81hBt5gOrgpQJWIH3PYuSlLjqlniIzEUeVYYooVzRmKKMwymCL1z9M1B
 FSlrcCfMzTCjQrjjIl9RavTWNb5zIv7daAgZLWqsMbUfMe7130hoXFcJGDE6M96xeI7N
 Xtw9l+1RWIk6aGpqtcHk4LgYUxwPrl8/sjGFwD9jls/Ai0xh+FzejIooklEE4VE//LBs
 Rh57PKw5Nk/XzCq+KLof4rW6oOEtZR4C7b3KIaFTPsgomPnYSUQc4gwu2xXKbWaZ8qxH
 ovWA==
X-Gm-Message-State: AOAM533ZmARUtsKXBJIWtolap0vEEaKU2CjQjU0umxZ2jEgtuemGxVio
 3M8+vdTAZTvoS/nPiF76jJebpG00OHQ1uDNBiQND6w==
X-Google-Smtp-Source: ABdhPJyEn9LLv2ZgAtqA4Cfr0BXpIleDU4W2bVvCuHiD9iWdRNkfv4Cwy/muBZgWFyFn345DmVMixZ7+jaoXmo7aFpY=
X-Received: by 2002:a5b:392:: with SMTP id k18mr9166769ybp.180.1623344039030; 
 Thu, 10 Jun 2021 09:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210609043613.102962-1-jason@jlekstrand.net>
 <20210609043613.102962-17-jason@jlekstrand.net>
 <YMCl71qtWsp3bQ3A@phenom.ffwll.local>
 <CAOFGe96bOaJ5EtPEaX=-xht0rYVnJKb6AdBGrpDZb0Q4bcR_tQ@mail.gmail.com>
 <YMJBZXGL3spPGcJa@phenom.ffwll.local>
In-Reply-To: <YMJBZXGL3spPGcJa@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 10 Jun 2021 11:53:48 -0500
Message-ID: <CAOFGe95osa5vC3UQU6Rhchg7korhfXv0jYsTL0x5gD_-OWeEBA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 16/31] drm/i915/gem: Add an intermediate
 proto_context struct (v4)
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 11:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 09, 2021 at 11:00:26AM -0500, Jason Ekstrand wrote:
> > On Wed, Jun 9, 2021 at 6:28 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Jun 08, 2021 at 11:35:58PM -0500, Jason Ekstrand wrote:
> > > > The current context uAPI allows for two methods of setting context
> > > > parameters: SET_CONTEXT_PARAM and CONTEXT_CREATE_EXT_SETPARAM.  The
> > > > former is allowed to be called at any time while the later happens as
> > > > part of GEM_CONTEXT_CREATE.  Currently, everything settable via one is
> > > > settable via the other.  While some params are fairly simple and setting
> > > > them on a live context is harmless such the context priority, others are
> > > > far trickier such as the VM or the set of engines.  In order to swap out
> > > > the VM, for instance, we have to delay until all current in-flight work
> > > > is complete, swap in the new VM, and then continue.  This leads to a
> > > > plethora of potential race conditions we'd really rather avoid.
> > > >
> > > > Unfortunately, both methods of setting the VM and the engine set are in
> > > > active use today so we can't simply disallow setting the VM or engine
> > > > set vial SET_CONTEXT_PARAM.  In order to work around this wart, this
> > > > commit adds a proto-context struct which contains all the context create
> > > > parameters.
> > > >
> > > > v2 (Daniel Vetter):
> > > >  - Better commit message
> > > >  - Use __set/clear_bit instead of set/clear_bit because there's no race
> > > >    and we don't need the atomics
> > > >
> > > > v3 (Daniel Vetter):
> > > >  - Use manual bitops and BIT() instead of __set_bit
> > > >
> > > > v4 (Daniel Vetter):
> > > >  - Add a changelog to the commit message
> > > >  - Better hyperlinking in docs
> > > >  - Create the default PPGTT in i915_gem_create_context
> > > >
> > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > ---
> > > >  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 124 +++++++++++++++---
> > > >  .../gpu/drm/i915/gem/i915_gem_context_types.h |  22 ++++
> > > >  .../gpu/drm/i915/gem/selftests/mock_context.c |  16 ++-
> > > >  3 files changed, 145 insertions(+), 17 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > index f9a6eac78c0ae..b5d8c1ff5d7b3 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > @@ -191,6 +191,83 @@ static int validate_priority(struct drm_i915_private *i915,
> > > >       return 0;
> > > >  }
> > > >
> > > > +static void proto_context_close(struct i915_gem_proto_context *pc)
> > > > +{
> > > > +     if (pc->vm)
> > > > +             i915_vm_put(pc->vm);
> > > > +     kfree(pc);
> > > > +}
> > > > +
> > > > +static int proto_context_set_persistence(struct drm_i915_private *i915,
> > > > +                                      struct i915_gem_proto_context *pc,
> > > > +                                      bool persist)
> > > > +{
> > > > +     if (persist) {
> > > > +             /*
> > > > +              * Only contexts that are short-lived [that will expire or be
> > > > +              * reset] are allowed to survive past termination. We require
> > > > +              * hangcheck to ensure that the persistent requests are healthy.
> > > > +              */
> > > > +             if (!i915->params.enable_hangcheck)
> > > > +                     return -EINVAL;
> > > > +
> > > > +             pc->user_flags |= BIT(UCONTEXT_PERSISTENCE);
> > > > +     } else {
> > > > +             /* To cancel a context we use "preempt-to-idle" */
> > > > +             if (!(i915->caps.scheduler & I915_SCHEDULER_CAP_PREEMPTION))
> > > > +                     return -ENODEV;
> > > > +
> > > > +             /*
> > > > +              * If the cancel fails, we then need to reset, cleanly!
> > > > +              *
> > > > +              * If the per-engine reset fails, all hope is lost! We resort
> > > > +              * to a full GPU reset in that unlikely case, but realistically
> > > > +              * if the engine could not reset, the full reset does not fare
> > > > +              * much better. The damage has been done.
> > > > +              *
> > > > +              * However, if we cannot reset an engine by itself, we cannot
> > > > +              * cleanup a hanging persistent context without causing
> > > > +              * colateral damage, and we should not pretend we can by
> > > > +              * exposing the interface.
> > > > +              */
> > > > +             if (!intel_has_reset_engine(&i915->gt))
> > > > +                     return -ENODEV;
> > > > +
> > > > +             pc->user_flags &= ~BIT(UCONTEXT_PERSISTENCE);
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static struct i915_gem_proto_context *
> > > > +proto_context_create(struct drm_i915_private *i915, unsigned int flags)
> > > > +{
> > > > +     struct i915_gem_proto_context *pc, *err;
> > > > +
> > > > +     pc = kzalloc(sizeof(*pc), GFP_KERNEL);
> > > > +     if (!pc)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     pc->user_flags = BIT(UCONTEXT_BANNABLE) |
> > > > +                      BIT(UCONTEXT_RECOVERABLE);
> > > > +     proto_context_set_persistence(i915, pc, true);
> > >
> > > I think we're down to the bikeshed here that I think should be open-coded
> > > for clarity of what exactly is going on. But maybe better in a distinct
> > > patch.
> >
> > Nope.  I just failed at rebasing. :-)  I put it in the 2nd big
> > proto-ctx patch instead of this one.  Should be fixed now.
>
> Ah found it, and looks correct.
> >
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> So r-b should hold once you've moved the hunk.

v5 has been posted and has the hunk moved.  I left your RB

--Jason

> -Daniel
>
> >
> > Thanks!
> >
> > > > +     pc->sched.priority = I915_PRIORITY_NORMAL;
> > > > +
> > > > +     if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> > > > +             if (!HAS_EXECLISTS(i915)) {
> > > > +                     err = ERR_PTR(-EINVAL);
> > > > +                     goto proto_close;
> > > > +             }
> > > > +             pc->single_timeline = true;
> > > > +     }
> > > > +
> > > > +     return pc;
> > > > +
> > > > +proto_close:
> > > > +     proto_context_close(pc);
> > > > +     return err;
> > > > +}
> > > > +
> > > >  static struct i915_address_space *
> > > >  context_get_vm_rcu(struct i915_gem_context *ctx)
> > > >  {
> > > > @@ -660,7 +737,8 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
> > > >  }
> > > >
> > > >  static struct i915_gem_context *
> > > > -__create_context(struct drm_i915_private *i915)
> > > > +__create_context(struct drm_i915_private *i915,
> > > > +              const struct i915_gem_proto_context *pc)
> > > >  {
> > > >       struct i915_gem_context *ctx;
> > > >       struct i915_gem_engines *e;
> > > > @@ -673,7 +751,7 @@ __create_context(struct drm_i915_private *i915)
> > > >
> > > >       kref_init(&ctx->ref);
> > > >       ctx->i915 = i915;
> > > > -     ctx->sched.priority = I915_PRIORITY_NORMAL;
> > > > +     ctx->sched = pc->sched;
> > > >       mutex_init(&ctx->mutex);
> > > >       INIT_LIST_HEAD(&ctx->link);
> > > >
> > > > @@ -696,9 +774,7 @@ __create_context(struct drm_i915_private *i915)
> > > >        * is no remap info, it will be a NOP. */
> > > >       ctx->remap_slice = ALL_L3_SLICES(i915);
> > > >
> > > > -     i915_gem_context_set_bannable(ctx);
> > > > -     i915_gem_context_set_recoverable(ctx);
> > > > -     __context_set_persistence(ctx, true /* cgroup hook? */);
> > > > +     ctx->user_flags = pc->user_flags;
> > > >
> > > >       for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
> > > >               ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
> > > > @@ -786,20 +862,22 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
> > > >  }
> > > >
> > > >  static struct i915_gem_context *
> > > > -i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> > > > +i915_gem_create_context(struct drm_i915_private *i915,
> > > > +                     const struct i915_gem_proto_context *pc)
> > > >  {
> > > >       struct i915_gem_context *ctx;
> > > >       int ret;
> > > >
> > > > -     if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
> > > > -         !HAS_EXECLISTS(i915))
> > > > -             return ERR_PTR(-EINVAL);
> > > > -
> > > > -     ctx = __create_context(i915);
> > > > +     ctx = __create_context(i915, pc);
> > > >       if (IS_ERR(ctx))
> > > >               return ctx;
> > > >
> > > > -     if (HAS_FULL_PPGTT(i915)) {
> > > > +     if (pc->vm) {
> > > > +             /* __assign_ppgtt() requires this mutex to be held */
> > > > +             mutex_lock(&ctx->mutex);
> > > > +             __assign_ppgtt(ctx, pc->vm);
> > > > +             mutex_unlock(&ctx->mutex);
> > > > +     } else if (HAS_FULL_PPGTT(i915)) {
> > > >               struct i915_ppgtt *ppgtt;
> > > >
> > > >               ppgtt = i915_ppgtt_create(&i915->gt);
> > > > @@ -810,14 +888,16 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> > > >                       return ERR_CAST(ppgtt);
> > > >               }
> > > >
> > > > +             /* __assign_ppgtt() requires this mutex to be held */
> > > >               mutex_lock(&ctx->mutex);
> > > >               __assign_ppgtt(ctx, &ppgtt->vm);
> > > >               mutex_unlock(&ctx->mutex);
> > > >
> > > > +             /* __assign_ppgtt() takes another reference for us */
> > > >               i915_vm_put(&ppgtt->vm);
> > > >       }
> > > >
> > > > -     if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> > > > +     if (pc->single_timeline) {
> > > >               ret = drm_syncobj_create(&ctx->syncobj,
> > > >                                        DRM_SYNCOBJ_CREATE_SIGNALED,
> > > >                                        NULL);
> > > > @@ -883,6 +963,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
> > > >                         struct drm_file *file)
> > > >  {
> > > >       struct drm_i915_file_private *file_priv = file->driver_priv;
> > > > +     struct i915_gem_proto_context *pc;
> > > >       struct i915_gem_context *ctx;
> > > >       int err;
> > > >       u32 id;
> > > > @@ -892,7 +973,14 @@ int i915_gem_context_open(struct drm_i915_private *i915,
> > > >       /* 0 reserved for invalid/unassigned ppgtt */
> > > >       xa_init_flags(&file_priv->vm_xa, XA_FLAGS_ALLOC1);
> > > >
> > > > -     ctx = i915_gem_create_context(i915, 0);
> > > > +     pc = proto_context_create(i915, 0);
> > > > +     if (IS_ERR(pc)) {
> > > > +             err = PTR_ERR(pc);
> > > > +             goto err;
> > > > +     }
> > > > +
> > > > +     ctx = i915_gem_create_context(i915, pc);
> > > > +     proto_context_close(pc);
> > > >       if (IS_ERR(ctx)) {
> > > >               err = PTR_ERR(ctx);
> > > >               goto err;
> > > > @@ -1884,6 +1972,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
> > > >  {
> > > >       struct drm_i915_private *i915 = to_i915(dev);
> > > >       struct drm_i915_gem_context_create_ext *args = data;
> > > > +     struct i915_gem_proto_context *pc;
> > > >       struct create_ext ext_data;
> > > >       int ret;
> > > >       u32 id;
> > > > @@ -1906,7 +1995,12 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
> > > >               return -EIO;
> > > >       }
> > > >
> > > > -     ext_data.ctx = i915_gem_create_context(i915, args->flags);
> > > > +     pc = proto_context_create(i915, args->flags);
> > > > +     if (IS_ERR(pc))
> > > > +             return PTR_ERR(pc);
> > > > +
> > > > +     ext_data.ctx = i915_gem_create_context(i915, pc);
> > > > +     proto_context_close(pc);
> > > >       if (IS_ERR(ext_data.ctx))
> > > >               return PTR_ERR(ext_data.ctx);
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > index 5f0673a2129f9..e0bdf3e298a6a 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > @@ -66,6 +66,28 @@ struct i915_gem_engines_iter {
> > > >       const struct i915_gem_engines *engines;
> > > >  };
> > > >
> > > > +/**
> > > > + * struct i915_gem_proto_context - prototype context
> > > > + *
> > > > + * The struct i915_gem_proto_context represents the creation parameters for
> > > > + * a struct i915_gem_context.  This is used to gather parameters provided
> > > > + * either through creation flags or via SET_CONTEXT_PARAM so that, when we
> > > > + * create the final i915_gem_context, those parameters can be immutable.
> > > > + */
> > > > +struct i915_gem_proto_context {
> > > > +     /** @vm: See &i915_gem_context.vm */
> > > > +     struct i915_address_space *vm;
> > > > +
> > > > +     /** @user_flags: See &i915_gem_context.user_flags */
> > > > +     unsigned long user_flags;
> > > > +
> > > > +     /** @sched: See &i915_gem_context.sched */
> > > > +     struct i915_sched_attr sched;
> > > > +
> > > > +     /** @single_timeline: See See &i915_gem_context.syncobj */
> > > > +     bool single_timeline;
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct i915_gem_context - client state
> > > >   *
> > > > diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > > > index 51b5a3421b400..e0f512ef7f3c6 100644
> > > > --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > > > +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > > > @@ -80,11 +80,17 @@ void mock_init_contexts(struct drm_i915_private *i915)
> > > >  struct i915_gem_context *
> > > >  live_context(struct drm_i915_private *i915, struct file *file)
> > > >  {
> > > > +     struct i915_gem_proto_context *pc;
> > > >       struct i915_gem_context *ctx;
> > > >       int err;
> > > >       u32 id;
> > > >
> > > > -     ctx = i915_gem_create_context(i915, 0);
> > > > +     pc = proto_context_create(i915, 0);
> > > > +     if (IS_ERR(pc))
> > > > +             return ERR_CAST(pc);
> > > > +
> > > > +     ctx = i915_gem_create_context(i915, pc);
> > > > +     proto_context_close(pc);
> > > >       if (IS_ERR(ctx))
> > > >               return ctx;
> > > >
> > > > @@ -142,8 +148,14 @@ struct i915_gem_context *
> > > >  kernel_context(struct drm_i915_private *i915)
> > > >  {
> > > >       struct i915_gem_context *ctx;
> > > > +     struct i915_gem_proto_context *pc;
> > > > +
> > > > +     pc = proto_context_create(i915, 0);
> > > > +     if (IS_ERR(pc))
> > > > +             return ERR_CAST(pc);
> > > >
> > > > -     ctx = i915_gem_create_context(i915, 0);
> > > > +     ctx = i915_gem_create_context(i915, pc);
> > > > +     proto_context_close(pc);
> > > >       if (IS_ERR(ctx))
> > > >               return ctx;
> > > >
> > > > --
> > > > 2.31.1
> > > >
> > > > _______________________________________________
> > > > Intel-gfx mailing list
> > > > Intel-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
