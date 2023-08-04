Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E3E7709D9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 22:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3DD10E11A;
	Fri,  4 Aug 2023 20:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1256010E11A;
 Fri,  4 Aug 2023 20:38:10 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5230df1ce4fso3024083a12.1; 
 Fri, 04 Aug 2023 13:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691181489; x=1691786289;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3aJr1DfKMMBQUOKhu33Mo0LDkE3eXabrg+lOA+fKqKs=;
 b=rUvaFvHfKFHzPdg1EVuqpwYVWrUd5PlnE0vAYKnhGYawKR8R4KajYz0JslcpY6FJa8
 Ip+XG1FAng1AuppY6QAmF7RIqd6lLKAF51WOFsgsCAmOPtpjZhx9gPVzC+WYOtkgmcwx
 OTROITILoThCImMi63sAqVYJVawO0wIYkqYpV2YK9SR4WVWYowgmKpOYPp8a7nqS8g9e
 /+Sac0FpJSoLrvsc5qm8gPJEJvTFFf3N25YwvtyoNnTaSDXUmxKYg4X61hXIWDvzxku4
 tqfKpj6oJ55IJdT5QDzRHk4lGC19LrQ7M9Q4yUenIgbcgUCqq9D21wK0yx2YSGq6mQPh
 ha0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691181489; x=1691786289;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3aJr1DfKMMBQUOKhu33Mo0LDkE3eXabrg+lOA+fKqKs=;
 b=hWB5Q7aKwF6jh85e2HXMJZOVMB7tbxZxKXvtbLS25lziWhONxEIYB5S+42llB8qJFv
 4/Tw2uJTN3CbkEw6WdSM7cGCU/uWhlhEHhoO+QfDZ5aeEYByZ78JGm6LfIdxLGWet2KB
 BZ/1cUyJCpsbW7uDFiNcRpgJeK4LFyE3tPlWu06P4M0Tu0i6nGY8jKB0vFNnnvZmZmvx
 fHtC96W7ByS7I3b/Gss0imyb2lTV0TomWIu7NN8Kb2iepzt30tjrfLUcqSZHmS2pntOt
 nQkT8MbaVfz3Is44EIDv2mcdn62ytQV85qOaiZ8ftWD5XgtORJckA77Ot+GnciddedZD
 Sjbg==
X-Gm-Message-State: AOJu0YwiHdf/aJwrpo3MyKI/Ybn84AMl9J2XlAYF4A/udCuYgF1ioEXd
 0bKUSI8SOZwSmd6/WEO312IIiOSk7viAhY0Yhuc=
X-Google-Smtp-Source: AGHT+IHYNbh7inDkYnyGM+q1lMYqvf/7tZK21k5Kkt1lXiBD1iA4kLYHtIND+wqo9ZFkKxzgLP8KPUP9SGUsYFoZlec=
X-Received: by 2002:aa7:c943:0:b0:522:b929:9f01 with SMTP id
 h3-20020aa7c943000000b00522b9299f01mr2302364edt.9.1691181489092; Fri, 04 Aug
 2023 13:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230803220202.78036-1-robdclark@gmail.com>
 <20230803220202.78036-4-robdclark@gmail.com>
 <CAJZ5v0jV+Da+kw5JuGAhuGA6QJKmteCfnjGCk8DrNOe8Gvdg5w@mail.gmail.com>
 <CAF6AEGvPjvTmK5NE1zkXSrSThpPNWCimUoQS-oBTDdUtEGKp4A@mail.gmail.com>
 <CAJZ5v0hGX_b1yPTrs=3Jyhm8hcFBprvVLgngK+oAFr_66jvytg@mail.gmail.com>
In-Reply-To: <CAJZ5v0hGX_b1yPTrs=3Jyhm8hcFBprvVLgngK+oAFr_66jvytg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 4 Aug 2023 13:37:56 -0700
Message-ID: <CAF6AEGtKmueSYXjrgapit-0Dot1q-P1dkT8Zs+cXtbHeAnpjAA@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] PM / QoS: Fix constraints alloc vs reclaim locking
To: "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 "open list:HIBERNATION \(aka Software Suspend,
 aka swsusp\)" <linux-pm@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 12:11=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Fri, Aug 4, 2023 at 8:38=E2=80=AFPM Rob Clark <robdclark@gmail.com> wr=
ote:
> >
> > On Fri, Aug 4, 2023 at 10:07=E2=80=AFAM Rafael J. Wysocki <rafael@kerne=
l.org> wrote:
> > >
> > > On Fri, Aug 4, 2023 at 12:02=E2=80=AFAM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > In the process of adding lockdep annotation for drm GPU scheduler's
> > > > job_run() to detect potential deadlock against shrinker/reclaim, I =
hit
> > > > this lockdep splat:
> > > >
> > > >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > >    WARNING: possible circular locking dependency detected
> > > >    6.2.0-rc8-debug+ #558 Tainted: G        W
> > > >    ------------------------------------------------------
> > > >    ring0/125 is trying to acquire lock:
> > > >    ffffffd6d6ce0f28 (dev_pm_qos_mtx){+.+.}-{3:3}, at: dev_pm_qos_up=
date_request+0x38/0x68
> > > >
> > > >    but task is already holding lock:
> > > >    ffffff8087239208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu_su=
bmit+0xec/0x178
> > > >
> > > >    which lock already depends on the new lock.
> > > >
> > > >    the existing dependency chain (in reverse order) is:
> > > >
> > > >    -> #4 (&gpu->active_lock){+.+.}-{3:3}:
> > > >           __mutex_lock+0xcc/0x3c8
> > > >           mutex_lock_nested+0x30/0x44
> > > >           msm_gpu_submit+0xec/0x178
> > > >           msm_job_run+0x78/0x150
> > > >           drm_sched_main+0x290/0x370
> > > >           kthread+0xf0/0x100
> > > >           ret_from_fork+0x10/0x20
> > > >
> > > >    -> #3 (dma_fence_map){++++}-{0:0}:
> > > >           __dma_fence_might_wait+0x74/0xc0
> > > >           dma_resv_lockdep+0x1f4/0x2f4
> > > >           do_one_initcall+0x104/0x2bc
> > > >           kernel_init_freeable+0x344/0x34c
> > > >           kernel_init+0x30/0x134
> > > >           ret_from_fork+0x10/0x20
> > > >
> > > >    -> #2 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
> > > >           fs_reclaim_acquire+0x80/0xa8
> > > >           slab_pre_alloc_hook.constprop.0+0x40/0x25c
> > > >           __kmem_cache_alloc_node+0x60/0x1cc
> > > >           __kmalloc+0xd8/0x100
> > > >           topology_parse_cpu_capacity+0x8c/0x178
> > > >           get_cpu_for_node+0x88/0xc4
> > > >           parse_cluster+0x1b0/0x28c
> > > >           parse_cluster+0x8c/0x28c
> > > >           init_cpu_topology+0x168/0x188
> > > >           smp_prepare_cpus+0x24/0xf8
> > > >           kernel_init_freeable+0x18c/0x34c
> > > >           kernel_init+0x30/0x134
> > > >           ret_from_fork+0x10/0x20
> > > >
> > > >    -> #1 (fs_reclaim){+.+.}-{0:0}:
> > > >           __fs_reclaim_acquire+0x3c/0x48
> > > >           fs_reclaim_acquire+0x54/0xa8
> > > >           slab_pre_alloc_hook.constprop.0+0x40/0x25c
> > > >           __kmem_cache_alloc_node+0x60/0x1cc
> > > >           kmalloc_trace+0x50/0xa8
> > > >           dev_pm_qos_constraints_allocate+0x38/0x100
> > > >           __dev_pm_qos_add_request+0xb0/0x1e8
> > > >           dev_pm_qos_add_request+0x58/0x80
> > > >           dev_pm_qos_expose_latency_limit+0x60/0x13c
> > > >           register_cpu+0x12c/0x130
> > > >           topology_init+0xac/0xbc
> > > >           do_one_initcall+0x104/0x2bc
> > > >           kernel_init_freeable+0x344/0x34c
> > > >           kernel_init+0x30/0x134
> > > >           ret_from_fork+0x10/0x20
> > > >
> > > >    -> #0 (dev_pm_qos_mtx){+.+.}-{3:3}:
> > > >           __lock_acquire+0xe00/0x1060
> > > >           lock_acquire+0x1e0/0x2f8
> > > >           __mutex_lock+0xcc/0x3c8
> > > >           mutex_lock_nested+0x30/0x44
> > > >           dev_pm_qos_update_request+0x38/0x68
> > > >           msm_devfreq_boost+0x40/0x70
> > > >           msm_devfreq_active+0xc0/0xf0
> > > >           msm_gpu_submit+0x10c/0x178
> > > >           msm_job_run+0x78/0x150
> > > >           drm_sched_main+0x290/0x370
> > > >           kthread+0xf0/0x100
> > > >           ret_from_fork+0x10/0x20
> > > >
> > > >    other info that might help us debug this:
> > > >
> > > >    Chain exists of:
> > > >      dev_pm_qos_mtx --> dma_fence_map --> &gpu->active_lock
> > > >
> > > >     Possible unsafe locking scenario:
> > > >
> > > >           CPU0                    CPU1
> > > >           ----                    ----
> > > >      lock(&gpu->active_lock);
> > > >                                   lock(dma_fence_map);
> > > >                                   lock(&gpu->active_lock);
> > > >      lock(dev_pm_qos_mtx);
> > > >
> > > >     *** DEADLOCK ***
> > > >
> > > >    3 locks held by ring0/123:
> > > >     #0: ffffff8087251170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+=
0x64/0x150
> > > >     #1: ffffffd00b0e57e8 (dma_fence_map){++++}-{0:0}, at: msm_job_r=
un+0x68/0x150
> > > >     #2: ffffff8087251208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_g=
pu_submit+0xec/0x178
> > > >
> > > >    stack backtrace:
> > > >    CPU: 6 PID: 123 Comm: ring0 Not tainted 6.2.0-rc8-debug+ #559
> > > >    Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
> > > >    Call trace:
> > > >     dump_backtrace.part.0+0xb4/0xf8
> > > >     show_stack+0x20/0x38
> > > >     dump_stack_lvl+0x9c/0xd0
> > > >     dump_stack+0x18/0x34
> > > >     print_circular_bug+0x1b4/0x1f0
> > > >     check_noncircular+0x78/0xac
> > > >     __lock_acquire+0xe00/0x1060
> > > >     lock_acquire+0x1e0/0x2f8
> > > >     __mutex_lock+0xcc/0x3c8
> > > >     mutex_lock_nested+0x30/0x44
> > > >     dev_pm_qos_update_request+0x38/0x68
> > > >     msm_devfreq_boost+0x40/0x70
> > > >     msm_devfreq_active+0xc0/0xf0
> > > >     msm_gpu_submit+0x10c/0x178
> > > >     msm_job_run+0x78/0x150
> > > >     drm_sched_main+0x290/0x370
> > > >     kthread+0xf0/0x100
> > > >     ret_from_fork+0x10/0x20
> > > >
> > > > The issue is that dev_pm_qos_mtx is held in the runpm suspend/resum=
e (or
> > > > freq change) path, but it is also held across allocations that coul=
d
> > > > recurse into shrinker.
> > > >
> > > > Solve this by changing dev_pm_qos_constraints_allocate() into a fun=
ction
> > > > that can be called unconditionally before the device qos object is
> > > > needed and before aquiring dev_pm_qos_mtx.  This way the allocation=
s can
> > > > be done without holding the mutex.  In the case that we raced with
> > > > another thread to allocate the qos object, detect this *after* acqu=
iring
> > > > the dev_pm_qos_mtx and simply free the redundant allocations.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  drivers/base/power/qos.c | 60 +++++++++++++++++++++++++++---------=
----
> > > >  1 file changed, 41 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
> > > > index 8e93167f1783..f3e0c6b65635 100644
> > > > --- a/drivers/base/power/qos.c
> > > > +++ b/drivers/base/power/qos.c
> > > > @@ -185,18 +185,24 @@ static int apply_constraint(struct dev_pm_qos=
_request *req,
> > > >  }
> > > >
> > > >  /*
> > > > - * dev_pm_qos_constraints_allocate
> > > > + * dev_pm_qos_constraints_ensure_allocated
> > > >   * @dev: device to allocate data for
> > > >   *
> > > > - * Called at the first call to add_request, for constraint data al=
location
> > > > - * Must be called with the dev_pm_qos_mtx mutex held
> > > > + * Called to ensure that devices qos is allocated, before acquirin=
g
> > > > + * dev_pm_qos_mtx.
> > > >   */
> > > > -static int dev_pm_qos_constraints_allocate(struct device *dev)
> > > > +static int dev_pm_qos_constraints_ensure_allocated(struct device *=
dev)
> > > >  {
> > > >         struct dev_pm_qos *qos;
> > > >         struct pm_qos_constraints *c;
> > > >         struct blocking_notifier_head *n;
> > > >
> > > > +       if (!dev)
> > > > +               return -ENODEV;
> > > > +
> > > > +       if (!IS_ERR_OR_NULL(dev->power.qos))
> > > > +               return 0;
> > > > +
> > > >         qos =3D kzalloc(sizeof(*qos), GFP_KERNEL);
> > > >         if (!qos)
> > > >                 return -ENOMEM;
> > > > @@ -227,10 +233,26 @@ static int dev_pm_qos_constraints_allocate(st=
ruct device *dev)
> > > >
> > > >         INIT_LIST_HEAD(&qos->flags.list);
> > > >
> > > > +       mutex_lock(&dev_pm_qos_mtx);
> > > > +
> > > > +       if (!IS_ERR_OR_NULL(dev->power.qos)) {
> > > > +               /*
> > > > +                * We have raced with another task to create the qo=
s.
> > > > +                * No biggie, just free the resources we've allocat=
ed
> > > > +                * outside of dev_pm_qos_mtx and move on with life.
> > > > +                */
> > > > +               kfree(n);
> > > > +               kfree(qos);
> > > > +               goto unlock;
> > > > +       }
> > > > +
> > > >         spin_lock_irq(&dev->power.lock);
> > > >         dev->power.qos =3D qos;
> > > >         spin_unlock_irq(&dev->power.lock);
> > > >
> > > > +unlock:
> > > > +       mutex_unlock(&dev_pm_qos_mtx);
> > > > +
> > > >         return 0;
> > > >  }
> > > >
> > > > @@ -331,17 +353,15 @@ static int __dev_pm_qos_add_request(struct de=
vice *dev,
> > > >  {
> > > >         int ret =3D 0;
> > > >
> > > > -       if (!dev || !req || dev_pm_qos_invalid_req_type(dev, type))
> > > > +       if (!req || dev_pm_qos_invalid_req_type(dev, type))
> > > >                 return -EINVAL;
> > > >
> > > >         if (WARN(dev_pm_qos_request_active(req),
> > > >                  "%s() called for already added request\n", __func_=
_))
> > > >                 return -EINVAL;
> > > >
> > > > -       if (IS_ERR(dev->power.qos))
> > > > +       if (IS_ERR_OR_NULL(dev->power.qos))
> > > >                 ret =3D -ENODEV;
> > > > -       else if (!dev->power.qos)
> > > > -               ret =3D dev_pm_qos_constraints_allocate(dev);
> > > >
> > > >         trace_dev_pm_qos_add_request(dev_name(dev), type, value);
> > > >         if (ret)
> > > > @@ -390,6 +410,10 @@ int dev_pm_qos_add_request(struct device *dev,=
 struct dev_pm_qos_request *req,
> > > >  {
> > > >         int ret;
> > > >
> > > > +       ret =3D dev_pm_qos_constraints_ensure_allocated(dev);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > >
> > > It is a bit unfortunate that the mutex is dropped and then immediatel=
y
> > > re-acquired again.  I don't think that this is strictly necessary.
> >
> > We could have dev_pm_qos_constraints_ensure_allocated() return with
> > the lock held in the success case if we had to.. but that seems a bit
> > funny looking.  And the dev_pm_qos_update_user_latency_tolerance()
> > path would need to shuffle slightly to move the kzalloc out of the
> > lock.
>
> Well, what about something like this (modulo whitespace damage by
> GMail), attached for completeness:
>

There is one other path to handle, and some small details, but I think
the approach could work.. let's see..

BR,
-R

> ---
>  drivers/base/power/qos.c |   37 +++++++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 12 deletions(-)
>
> Index: linux-pm/drivers/base/power/qos.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-pm.orig/drivers/base/power/qos.c
> +++ linux-pm/drivers/base/power/qos.c
> @@ -186,26 +186,21 @@ static int apply_constraint(struct dev_p
>
>  /*
>   * dev_pm_qos_constraints_allocate
> - * @dev: device to allocate data for
>   *
>   * Called at the first call to add_request, for constraint data allocati=
on
>   * Must be called with the dev_pm_qos_mtx mutex held
>   */
> -static int dev_pm_qos_constraints_allocate(struct device *dev)
> +static struct dev_pm_qos *dev_pm_qos_constraints_allocate(void)
>  {
>      struct dev_pm_qos *qos;
>      struct pm_qos_constraints *c;
>      struct blocking_notifier_head *n;
>
> -    qos =3D kzalloc(sizeof(*qos), GFP_KERNEL);
> +    qos =3D kzalloc(sizeof(*qos) + kzalloc(3 * sizeof(*n), GFP_KERNEL);
>      if (!qos)
> -        return -ENOMEM;
> +        return NULL;
>
> -    n =3D kzalloc(3 * sizeof(*n), GFP_KERNEL);
> -    if (!n) {
> -        kfree(qos);
> -        return -ENOMEM;
> -    }
> +    n =3D (struct blocking_notifier_head *)(qos + 1);
>
>      c =3D &qos->resume_latency;
>      plist_head_init(&c->list);
> @@ -227,6 +222,20 @@ static int dev_pm_qos_constraints_alloca
>
>      INIT_LIST_HEAD(&qos->flags.list);
>
> +    return qos;
> +}
> +
> +static int dev_pm_qos_constraints_add(struct device *dev,
> +                       struct dev_pm_qos *qos)
> +{
> +    if (!qos)
> +        return -ENOMEM;
> +
> +    if (!IS_ERR_OR_NULL(dev->power.qos)) {
> +        kfree(qos);
> +        return -ENODEV;
> +    }
> +
>      spin_lock_irq(&dev->power.lock);
>      dev->power.qos =3D qos;
>      spin_unlock_irq(&dev->power.lock);
> @@ -326,6 +335,7 @@ static bool dev_pm_qos_invalid_req_type(
>  }
>
>  static int __dev_pm_qos_add_request(struct device *dev,
> +                    struct dev_pm_qos *qos,
>                      struct dev_pm_qos_request *req,
>                      enum dev_pm_qos_req_type type, s32 value)
>  {
> @@ -340,8 +350,10 @@ static int __dev_pm_qos_add_request(stru
>
>      if (IS_ERR(dev->power.qos))
>          ret =3D -ENODEV;
> -    else if (!dev->power.qos)
> -        ret =3D dev_pm_qos_constraints_allocate(dev);
> +    else if (dev->power.qos)
> +        kfree(qos);
> +    else
> +        ret =3D dev_pm_qos_constraints_add(dev);
>
>      trace_dev_pm_qos_add_request(dev_name(dev), type, value);
>      if (ret)
> @@ -388,10 +400,11 @@ static int __dev_pm_qos_add_request(stru
>  int dev_pm_qos_add_request(struct device *dev, struct dev_pm_qos_request=
 *req,
>                 enum dev_pm_qos_req_type type, s32 value)
>  {
> +    struct dev_pm_qos *qos =3D dev_pm_qos_constraints_allocate();
>      int ret;
>
>      mutex_lock(&dev_pm_qos_mtx);
> -    ret =3D __dev_pm_qos_add_request(dev, req, type, value);
> +    ret =3D __dev_pm_qos_add_request(dev, qos, req, type, value);
>      mutex_unlock(&dev_pm_qos_mtx);
>      return ret;
>  }
