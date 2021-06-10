Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E633A312E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C496EDA9;
	Thu, 10 Jun 2021 16:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27736EDA9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:44:25 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l2so3075762wrw.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 09:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5oXqzULfzVfNu9rGNogvAVeBQfdv4az1Q1edG/oN7+E=;
 b=OB9PXc8nc5G7PZdV69TBGYzSgyE0VeRoNnFBLej6T60vV4Xp7oS8SRC7ltDSUhDbzI
 0S+jAPlVkrtkEzgPXF+dp/RQxXgFeB6O8lb53RLg3mby64bk45HWsYQd6BZS4RZG3aXM
 bdXcP52igNyOZx3HLBbz9buLTMUw8VqlPgA1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5oXqzULfzVfNu9rGNogvAVeBQfdv4az1Q1edG/oN7+E=;
 b=r9MxOmyg7MXtHEVHXkdZw0BcdjTd//SY4AK30TwRljXJMx4IgfExa8Trvngo/LxwoI
 /AePLS58m3nZwGI7Dza3ujmIuDOcdlmr6fy5WMby+v4H4BDrME5sWUstCMlmrVETyg98
 mS06l+3ZafSobZxzVVzKRReWL4Em/3F5ljGqs+5uxw48416RMuJhoQOcZFG9V1+BGefZ
 Xsx4Yp0EJc+VBAZBlgUQhsSOqhwhUhaY+K21L9uEdjEnoeAM6tiJeaRAQyNkMp+iIeLF
 VfuByoaSOdl6Pz8PPXrz8nIRIPpAGvSimkgz41S6pjkf26KznjRYAB+wg+uy4ACoHWUV
 BcXQ==
X-Gm-Message-State: AOAM533z7T0KH8Rd3rXYjOpxf+YlJHRZO5lakJQ8xhbyYjSsfjk4d+rh
 ETELgvygBbKfz3IFLbnmWiJqcA==
X-Google-Smtp-Source: ABdhPJw0j/uZeVlSWWrgYU5GKQM1Mp6Hp0MmE7LUtgxUwDnhL+GUBeoLU8T+MqFchbNUBsSDp0QcnA==
X-Received: by 2002:adf:b648:: with SMTP id i8mr6504856wre.425.1623343464309; 
 Thu, 10 Jun 2021 09:44:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z12sm4308505wmc.5.2021.06.10.09.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 09:44:23 -0700 (PDT)
Date: Thu, 10 Jun 2021 18:44:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 16/31] drm/i915/gem: Add an intermediate
 proto_context struct (v4)
Message-ID: <YMJBZXGL3spPGcJa@phenom.ffwll.local>
References: <20210609043613.102962-1-jason@jlekstrand.net>
 <20210609043613.102962-17-jason@jlekstrand.net>
 <YMCl71qtWsp3bQ3A@phenom.ffwll.local>
 <CAOFGe96bOaJ5EtPEaX=-xht0rYVnJKb6AdBGrpDZb0Q4bcR_tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOFGe96bOaJ5EtPEaX=-xht0rYVnJKb6AdBGrpDZb0Q4bcR_tQ@mail.gmail.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 11:00:26AM -0500, Jason Ekstrand wrote:
> On Wed, Jun 9, 2021 at 6:28 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Jun 08, 2021 at 11:35:58PM -0500, Jason Ekstrand wrote:
> > > The current context uAPI allows for two methods of setting context
> > > parameters: SET_CONTEXT_PARAM and CONTEXT_CREATE_EXT_SETPARAM.  The
> > > former is allowed to be called at any time while the later happens as
> > > part of GEM_CONTEXT_CREATE.  Currently, everything settable via one is
> > > settable via the other.  While some params are fairly simple and setting
> > > them on a live context is harmless such the context priority, others are
> > > far trickier such as the VM or the set of engines.  In order to swap out
> > > the VM, for instance, we have to delay until all current in-flight work
> > > is complete, swap in the new VM, and then continue.  This leads to a
> > > plethora of potential race conditions we'd really rather avoid.
> > >
> > > Unfortunately, both methods of setting the VM and the engine set are in
> > > active use today so we can't simply disallow setting the VM or engine
> > > set vial SET_CONTEXT_PARAM.  In order to work around this wart, this
> > > commit adds a proto-context struct which contains all the context create
> > > parameters.
> > >
> > > v2 (Daniel Vetter):
> > >  - Better commit message
> > >  - Use __set/clear_bit instead of set/clear_bit because there's no race
> > >    and we don't need the atomics
> > >
> > > v3 (Daniel Vetter):
> > >  - Use manual bitops and BIT() instead of __set_bit
> > >
> > > v4 (Daniel Vetter):
> > >  - Add a changelog to the commit message
> > >  - Better hyperlinking in docs
> > >  - Create the default PPGTT in i915_gem_create_context
> > >
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 124 +++++++++++++++---
> > >  .../gpu/drm/i915/gem/i915_gem_context_types.h |  22 ++++
> > >  .../gpu/drm/i915/gem/selftests/mock_context.c |  16 ++-
> > >  3 files changed, 145 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > index f9a6eac78c0ae..b5d8c1ff5d7b3 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > @@ -191,6 +191,83 @@ static int validate_priority(struct drm_i915_private *i915,
> > >       return 0;
> > >  }
> > >
> > > +static void proto_context_close(struct i915_gem_proto_context *pc)
> > > +{
> > > +     if (pc->vm)
> > > +             i915_vm_put(pc->vm);
> > > +     kfree(pc);
> > > +}
> > > +
> > > +static int proto_context_set_persistence(struct drm_i915_private *i915,
> > > +                                      struct i915_gem_proto_context *pc,
> > > +                                      bool persist)
> > > +{
> > > +     if (persist) {
> > > +             /*
> > > +              * Only contexts that are short-lived [that will expire or be
> > > +              * reset] are allowed to survive past termination. We require
> > > +              * hangcheck to ensure that the persistent requests are healthy.
> > > +              */
> > > +             if (!i915->params.enable_hangcheck)
> > > +                     return -EINVAL;
> > > +
> > > +             pc->user_flags |= BIT(UCONTEXT_PERSISTENCE);
> > > +     } else {
> > > +             /* To cancel a context we use "preempt-to-idle" */
> > > +             if (!(i915->caps.scheduler & I915_SCHEDULER_CAP_PREEMPTION))
> > > +                     return -ENODEV;
> > > +
> > > +             /*
> > > +              * If the cancel fails, we then need to reset, cleanly!
> > > +              *
> > > +              * If the per-engine reset fails, all hope is lost! We resort
> > > +              * to a full GPU reset in that unlikely case, but realistically
> > > +              * if the engine could not reset, the full reset does not fare
> > > +              * much better. The damage has been done.
> > > +              *
> > > +              * However, if we cannot reset an engine by itself, we cannot
> > > +              * cleanup a hanging persistent context without causing
> > > +              * colateral damage, and we should not pretend we can by
> > > +              * exposing the interface.
> > > +              */
> > > +             if (!intel_has_reset_engine(&i915->gt))
> > > +                     return -ENODEV;
> > > +
> > > +             pc->user_flags &= ~BIT(UCONTEXT_PERSISTENCE);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static struct i915_gem_proto_context *
> > > +proto_context_create(struct drm_i915_private *i915, unsigned int flags)
> > > +{
> > > +     struct i915_gem_proto_context *pc, *err;
> > > +
> > > +     pc = kzalloc(sizeof(*pc), GFP_KERNEL);
> > > +     if (!pc)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     pc->user_flags = BIT(UCONTEXT_BANNABLE) |
> > > +                      BIT(UCONTEXT_RECOVERABLE);
> > > +     proto_context_set_persistence(i915, pc, true);
> >
> > I think we're down to the bikeshed here that I think should be open-coded
> > for clarity of what exactly is going on. But maybe better in a distinct
> > patch.
> 
> Nope.  I just failed at rebasing. :-)  I put it in the 2nd big
> proto-ctx patch instead of this one.  Should be fixed now.

Ah found it, and looks correct.
> 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

So r-b should hold once you've moved the hunk.
-Daniel

> 
> Thanks!
> 
> > > +     pc->sched.priority = I915_PRIORITY_NORMAL;
> > > +
> > > +     if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> > > +             if (!HAS_EXECLISTS(i915)) {
> > > +                     err = ERR_PTR(-EINVAL);
> > > +                     goto proto_close;
> > > +             }
> > > +             pc->single_timeline = true;
> > > +     }
> > > +
> > > +     return pc;
> > > +
> > > +proto_close:
> > > +     proto_context_close(pc);
> > > +     return err;
> > > +}
> > > +
> > >  static struct i915_address_space *
> > >  context_get_vm_rcu(struct i915_gem_context *ctx)
> > >  {
> > > @@ -660,7 +737,8 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
> > >  }
> > >
> > >  static struct i915_gem_context *
> > > -__create_context(struct drm_i915_private *i915)
> > > +__create_context(struct drm_i915_private *i915,
> > > +              const struct i915_gem_proto_context *pc)
> > >  {
> > >       struct i915_gem_context *ctx;
> > >       struct i915_gem_engines *e;
> > > @@ -673,7 +751,7 @@ __create_context(struct drm_i915_private *i915)
> > >
> > >       kref_init(&ctx->ref);
> > >       ctx->i915 = i915;
> > > -     ctx->sched.priority = I915_PRIORITY_NORMAL;
> > > +     ctx->sched = pc->sched;
> > >       mutex_init(&ctx->mutex);
> > >       INIT_LIST_HEAD(&ctx->link);
> > >
> > > @@ -696,9 +774,7 @@ __create_context(struct drm_i915_private *i915)
> > >        * is no remap info, it will be a NOP. */
> > >       ctx->remap_slice = ALL_L3_SLICES(i915);
> > >
> > > -     i915_gem_context_set_bannable(ctx);
> > > -     i915_gem_context_set_recoverable(ctx);
> > > -     __context_set_persistence(ctx, true /* cgroup hook? */);
> > > +     ctx->user_flags = pc->user_flags;
> > >
> > >       for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
> > >               ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
> > > @@ -786,20 +862,22 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
> > >  }
> > >
> > >  static struct i915_gem_context *
> > > -i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> > > +i915_gem_create_context(struct drm_i915_private *i915,
> > > +                     const struct i915_gem_proto_context *pc)
> > >  {
> > >       struct i915_gem_context *ctx;
> > >       int ret;
> > >
> > > -     if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
> > > -         !HAS_EXECLISTS(i915))
> > > -             return ERR_PTR(-EINVAL);
> > > -
> > > -     ctx = __create_context(i915);
> > > +     ctx = __create_context(i915, pc);
> > >       if (IS_ERR(ctx))
> > >               return ctx;
> > >
> > > -     if (HAS_FULL_PPGTT(i915)) {
> > > +     if (pc->vm) {
> > > +             /* __assign_ppgtt() requires this mutex to be held */
> > > +             mutex_lock(&ctx->mutex);
> > > +             __assign_ppgtt(ctx, pc->vm);
> > > +             mutex_unlock(&ctx->mutex);
> > > +     } else if (HAS_FULL_PPGTT(i915)) {
> > >               struct i915_ppgtt *ppgtt;
> > >
> > >               ppgtt = i915_ppgtt_create(&i915->gt);
> > > @@ -810,14 +888,16 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> > >                       return ERR_CAST(ppgtt);
> > >               }
> > >
> > > +             /* __assign_ppgtt() requires this mutex to be held */
> > >               mutex_lock(&ctx->mutex);
> > >               __assign_ppgtt(ctx, &ppgtt->vm);
> > >               mutex_unlock(&ctx->mutex);
> > >
> > > +             /* __assign_ppgtt() takes another reference for us */
> > >               i915_vm_put(&ppgtt->vm);
> > >       }
> > >
> > > -     if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> > > +     if (pc->single_timeline) {
> > >               ret = drm_syncobj_create(&ctx->syncobj,
> > >                                        DRM_SYNCOBJ_CREATE_SIGNALED,
> > >                                        NULL);
> > > @@ -883,6 +963,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
> > >                         struct drm_file *file)
> > >  {
> > >       struct drm_i915_file_private *file_priv = file->driver_priv;
> > > +     struct i915_gem_proto_context *pc;
> > >       struct i915_gem_context *ctx;
> > >       int err;
> > >       u32 id;
> > > @@ -892,7 +973,14 @@ int i915_gem_context_open(struct drm_i915_private *i915,
> > >       /* 0 reserved for invalid/unassigned ppgtt */
> > >       xa_init_flags(&file_priv->vm_xa, XA_FLAGS_ALLOC1);
> > >
> > > -     ctx = i915_gem_create_context(i915, 0);
> > > +     pc = proto_context_create(i915, 0);
> > > +     if (IS_ERR(pc)) {
> > > +             err = PTR_ERR(pc);
> > > +             goto err;
> > > +     }
> > > +
> > > +     ctx = i915_gem_create_context(i915, pc);
> > > +     proto_context_close(pc);
> > >       if (IS_ERR(ctx)) {
> > >               err = PTR_ERR(ctx);
> > >               goto err;
> > > @@ -1884,6 +1972,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
> > >  {
> > >       struct drm_i915_private *i915 = to_i915(dev);
> > >       struct drm_i915_gem_context_create_ext *args = data;
> > > +     struct i915_gem_proto_context *pc;
> > >       struct create_ext ext_data;
> > >       int ret;
> > >       u32 id;
> > > @@ -1906,7 +1995,12 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
> > >               return -EIO;
> > >       }
> > >
> > > -     ext_data.ctx = i915_gem_create_context(i915, args->flags);
> > > +     pc = proto_context_create(i915, args->flags);
> > > +     if (IS_ERR(pc))
> > > +             return PTR_ERR(pc);
> > > +
> > > +     ext_data.ctx = i915_gem_create_context(i915, pc);
> > > +     proto_context_close(pc);
> > >       if (IS_ERR(ext_data.ctx))
> > >               return PTR_ERR(ext_data.ctx);
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > index 5f0673a2129f9..e0bdf3e298a6a 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > @@ -66,6 +66,28 @@ struct i915_gem_engines_iter {
> > >       const struct i915_gem_engines *engines;
> > >  };
> > >
> > > +/**
> > > + * struct i915_gem_proto_context - prototype context
> > > + *
> > > + * The struct i915_gem_proto_context represents the creation parameters for
> > > + * a struct i915_gem_context.  This is used to gather parameters provided
> > > + * either through creation flags or via SET_CONTEXT_PARAM so that, when we
> > > + * create the final i915_gem_context, those parameters can be immutable.
> > > + */
> > > +struct i915_gem_proto_context {
> > > +     /** @vm: See &i915_gem_context.vm */
> > > +     struct i915_address_space *vm;
> > > +
> > > +     /** @user_flags: See &i915_gem_context.user_flags */
> > > +     unsigned long user_flags;
> > > +
> > > +     /** @sched: See &i915_gem_context.sched */
> > > +     struct i915_sched_attr sched;
> > > +
> > > +     /** @single_timeline: See See &i915_gem_context.syncobj */
> > > +     bool single_timeline;
> > > +};
> > > +
> > >  /**
> > >   * struct i915_gem_context - client state
> > >   *
> > > diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > > index 51b5a3421b400..e0f512ef7f3c6 100644
> > > --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > > +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > > @@ -80,11 +80,17 @@ void mock_init_contexts(struct drm_i915_private *i915)
> > >  struct i915_gem_context *
> > >  live_context(struct drm_i915_private *i915, struct file *file)
> > >  {
> > > +     struct i915_gem_proto_context *pc;
> > >       struct i915_gem_context *ctx;
> > >       int err;
> > >       u32 id;
> > >
> > > -     ctx = i915_gem_create_context(i915, 0);
> > > +     pc = proto_context_create(i915, 0);
> > > +     if (IS_ERR(pc))
> > > +             return ERR_CAST(pc);
> > > +
> > > +     ctx = i915_gem_create_context(i915, pc);
> > > +     proto_context_close(pc);
> > >       if (IS_ERR(ctx))
> > >               return ctx;
> > >
> > > @@ -142,8 +148,14 @@ struct i915_gem_context *
> > >  kernel_context(struct drm_i915_private *i915)
> > >  {
> > >       struct i915_gem_context *ctx;
> > > +     struct i915_gem_proto_context *pc;
> > > +
> > > +     pc = proto_context_create(i915, 0);
> > > +     if (IS_ERR(pc))
> > > +             return ERR_CAST(pc);
> > >
> > > -     ctx = i915_gem_create_context(i915, 0);
> > > +     ctx = i915_gem_create_context(i915, pc);
> > > +     proto_context_close(pc);
> > >       if (IS_ERR(ctx))
> > >               return ctx;
> > >
> > > --
> > > 2.31.1
> > >
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
