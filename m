Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06A17708B2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 21:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7955B10E101;
	Fri,  4 Aug 2023 19:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D58A10E101;
 Fri,  4 Aug 2023 19:11:44 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-56c9237e0ffso413802eaf.0; 
 Fri, 04 Aug 2023 12:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691176303; x=1691781103;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Likl/wmNltRCx4Z5AmSbso+EzPXp1NYDaU89+duyULE=;
 b=lhSEt4BN7WU8EPsn70bEdnBdMljSxw+NZeGs1pRci/pU5eT05z06efAitgIyIf9X/t
 KOWdFg4rgA/RomwPPB9z1tXAa8fPzJnbjOlfKO0JNvNcVvro/RsjlaEGM7F5WNcfr9r0
 sR63cxY7HQ8SQ/vT4c4312v2EMNVgLaEclClNZiy5WIAgC8/1OIVhNxw7SQWljDH3zfh
 4Q4L0gG9rYEs7AKP/VIfJLkjYa5mruwvIo2H2nSNaE/QlW9l26yHUQLv1QFtPuoHgMnW
 rKoP2a56JC/hfAe4PmetMVupgVaPy3EvrA6NRKw1QP6cuvUdNi4bs+dYL9Uc2j/6fxo8
 ZyLQ==
X-Gm-Message-State: ABy/qLa6T1bR/DSDfP9+W++I5KaQLUGIFC5or124RWJBEHm7t2Nrhg6p
 B7NedLXRJKEcqgVW09Pp3yx32OXXbxKrjn845hc=
X-Google-Smtp-Source: APBJJlGk+AISnYEy1dGjMCO+0pFAv8CkSrhaf8I63rcdSlId+mnKaGTnj57Q8F/PvVW53kqOlto83jWG9OHVcmVBhuo=
X-Received: by 2002:a05:6820:2108:b0:56c:5e21:c72d with SMTP id
 cd8-20020a056820210800b0056c5e21c72dmr17705314oob.1.1691176303513; Fri, 04
 Aug 2023 12:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230803220202.78036-1-robdclark@gmail.com>
 <20230803220202.78036-4-robdclark@gmail.com>
 <CAJZ5v0jV+Da+kw5JuGAhuGA6QJKmteCfnjGCk8DrNOe8Gvdg5w@mail.gmail.com>
 <CAF6AEGvPjvTmK5NE1zkXSrSThpPNWCimUoQS-oBTDdUtEGKp4A@mail.gmail.com>
In-Reply-To: <CAF6AEGvPjvTmK5NE1zkXSrSThpPNWCimUoQS-oBTDdUtEGKp4A@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 4 Aug 2023 21:11:32 +0200
Message-ID: <CAJZ5v0hGX_b1yPTrs=3Jyhm8hcFBprvVLgngK+oAFr_66jvytg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] PM / QoS: Fix constraints alloc vs reclaim locking
To: Rob Clark <robdclark@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000d3141a06021daaed"
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
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 "open list:HIBERNATION \(aka Software Suspend,
 aka swsusp\)" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000d3141a06021daaed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 8:38=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> On Fri, Aug 4, 2023 at 10:07=E2=80=AFAM Rafael J. Wysocki <rafael@kernel.=
org> wrote:
> >
> > On Fri, Aug 4, 2023 at 12:02=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > In the process of adding lockdep annotation for drm GPU scheduler's
> > > job_run() to detect potential deadlock against shrinker/reclaim, I hi=
t
> > > this lockdep splat:
> > >
> > >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > >    WARNING: possible circular locking dependency detected
> > >    6.2.0-rc8-debug+ #558 Tainted: G        W
> > >    ------------------------------------------------------
> > >    ring0/125 is trying to acquire lock:
> > >    ffffffd6d6ce0f28 (dev_pm_qos_mtx){+.+.}-{3:3}, at: dev_pm_qos_upda=
te_request+0x38/0x68
> > >
> > >    but task is already holding lock:
> > >    ffffff8087239208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu_subm=
it+0xec/0x178
> > >
> > >    which lock already depends on the new lock.
> > >
> > >    the existing dependency chain (in reverse order) is:
> > >
> > >    -> #4 (&gpu->active_lock){+.+.}-{3:3}:
> > >           __mutex_lock+0xcc/0x3c8
> > >           mutex_lock_nested+0x30/0x44
> > >           msm_gpu_submit+0xec/0x178
> > >           msm_job_run+0x78/0x150
> > >           drm_sched_main+0x290/0x370
> > >           kthread+0xf0/0x100
> > >           ret_from_fork+0x10/0x20
> > >
> > >    -> #3 (dma_fence_map){++++}-{0:0}:
> > >           __dma_fence_might_wait+0x74/0xc0
> > >           dma_resv_lockdep+0x1f4/0x2f4
> > >           do_one_initcall+0x104/0x2bc
> > >           kernel_init_freeable+0x344/0x34c
> > >           kernel_init+0x30/0x134
> > >           ret_from_fork+0x10/0x20
> > >
> > >    -> #2 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
> > >           fs_reclaim_acquire+0x80/0xa8
> > >           slab_pre_alloc_hook.constprop.0+0x40/0x25c
> > >           __kmem_cache_alloc_node+0x60/0x1cc
> > >           __kmalloc+0xd8/0x100
> > >           topology_parse_cpu_capacity+0x8c/0x178
> > >           get_cpu_for_node+0x88/0xc4
> > >           parse_cluster+0x1b0/0x28c
> > >           parse_cluster+0x8c/0x28c
> > >           init_cpu_topology+0x168/0x188
> > >           smp_prepare_cpus+0x24/0xf8
> > >           kernel_init_freeable+0x18c/0x34c
> > >           kernel_init+0x30/0x134
> > >           ret_from_fork+0x10/0x20
> > >
> > >    -> #1 (fs_reclaim){+.+.}-{0:0}:
> > >           __fs_reclaim_acquire+0x3c/0x48
> > >           fs_reclaim_acquire+0x54/0xa8
> > >           slab_pre_alloc_hook.constprop.0+0x40/0x25c
> > >           __kmem_cache_alloc_node+0x60/0x1cc
> > >           kmalloc_trace+0x50/0xa8
> > >           dev_pm_qos_constraints_allocate+0x38/0x100
> > >           __dev_pm_qos_add_request+0xb0/0x1e8
> > >           dev_pm_qos_add_request+0x58/0x80
> > >           dev_pm_qos_expose_latency_limit+0x60/0x13c
> > >           register_cpu+0x12c/0x130
> > >           topology_init+0xac/0xbc
> > >           do_one_initcall+0x104/0x2bc
> > >           kernel_init_freeable+0x344/0x34c
> > >           kernel_init+0x30/0x134
> > >           ret_from_fork+0x10/0x20
> > >
> > >    -> #0 (dev_pm_qos_mtx){+.+.}-{3:3}:
> > >           __lock_acquire+0xe00/0x1060
> > >           lock_acquire+0x1e0/0x2f8
> > >           __mutex_lock+0xcc/0x3c8
> > >           mutex_lock_nested+0x30/0x44
> > >           dev_pm_qos_update_request+0x38/0x68
> > >           msm_devfreq_boost+0x40/0x70
> > >           msm_devfreq_active+0xc0/0xf0
> > >           msm_gpu_submit+0x10c/0x178
> > >           msm_job_run+0x78/0x150
> > >           drm_sched_main+0x290/0x370
> > >           kthread+0xf0/0x100
> > >           ret_from_fork+0x10/0x20
> > >
> > >    other info that might help us debug this:
> > >
> > >    Chain exists of:
> > >      dev_pm_qos_mtx --> dma_fence_map --> &gpu->active_lock
> > >
> > >     Possible unsafe locking scenario:
> > >
> > >           CPU0                    CPU1
> > >           ----                    ----
> > >      lock(&gpu->active_lock);
> > >                                   lock(dma_fence_map);
> > >                                   lock(&gpu->active_lock);
> > >      lock(dev_pm_qos_mtx);
> > >
> > >     *** DEADLOCK ***
> > >
> > >    3 locks held by ring0/123:
> > >     #0: ffffff8087251170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0x=
64/0x150
> > >     #1: ffffffd00b0e57e8 (dma_fence_map){++++}-{0:0}, at: msm_job_run=
+0x68/0x150
> > >     #2: ffffff8087251208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu=
_submit+0xec/0x178
> > >
> > >    stack backtrace:
> > >    CPU: 6 PID: 123 Comm: ring0 Not tainted 6.2.0-rc8-debug+ #559
> > >    Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
> > >    Call trace:
> > >     dump_backtrace.part.0+0xb4/0xf8
> > >     show_stack+0x20/0x38
> > >     dump_stack_lvl+0x9c/0xd0
> > >     dump_stack+0x18/0x34
> > >     print_circular_bug+0x1b4/0x1f0
> > >     check_noncircular+0x78/0xac
> > >     __lock_acquire+0xe00/0x1060
> > >     lock_acquire+0x1e0/0x2f8
> > >     __mutex_lock+0xcc/0x3c8
> > >     mutex_lock_nested+0x30/0x44
> > >     dev_pm_qos_update_request+0x38/0x68
> > >     msm_devfreq_boost+0x40/0x70
> > >     msm_devfreq_active+0xc0/0xf0
> > >     msm_gpu_submit+0x10c/0x178
> > >     msm_job_run+0x78/0x150
> > >     drm_sched_main+0x290/0x370
> > >     kthread+0xf0/0x100
> > >     ret_from_fork+0x10/0x20
> > >
> > > The issue is that dev_pm_qos_mtx is held in the runpm suspend/resume =
(or
> > > freq change) path, but it is also held across allocations that could
> > > recurse into shrinker.
> > >
> > > Solve this by changing dev_pm_qos_constraints_allocate() into a funct=
ion
> > > that can be called unconditionally before the device qos object is
> > > needed and before aquiring dev_pm_qos_mtx.  This way the allocations =
can
> > > be done without holding the mutex.  In the case that we raced with
> > > another thread to allocate the qos object, detect this *after* acquir=
ing
> > > the dev_pm_qos_mtx and simply free the redundant allocations.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/base/power/qos.c | 60 +++++++++++++++++++++++++++-----------=
--
> > >  1 file changed, 41 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
> > > index 8e93167f1783..f3e0c6b65635 100644
> > > --- a/drivers/base/power/qos.c
> > > +++ b/drivers/base/power/qos.c
> > > @@ -185,18 +185,24 @@ static int apply_constraint(struct dev_pm_qos_r=
equest *req,
> > >  }
> > >
> > >  /*
> > > - * dev_pm_qos_constraints_allocate
> > > + * dev_pm_qos_constraints_ensure_allocated
> > >   * @dev: device to allocate data for
> > >   *
> > > - * Called at the first call to add_request, for constraint data allo=
cation
> > > - * Must be called with the dev_pm_qos_mtx mutex held
> > > + * Called to ensure that devices qos is allocated, before acquiring
> > > + * dev_pm_qos_mtx.
> > >   */
> > > -static int dev_pm_qos_constraints_allocate(struct device *dev)
> > > +static int dev_pm_qos_constraints_ensure_allocated(struct device *de=
v)
> > >  {
> > >         struct dev_pm_qos *qos;
> > >         struct pm_qos_constraints *c;
> > >         struct blocking_notifier_head *n;
> > >
> > > +       if (!dev)
> > > +               return -ENODEV;
> > > +
> > > +       if (!IS_ERR_OR_NULL(dev->power.qos))
> > > +               return 0;
> > > +
> > >         qos =3D kzalloc(sizeof(*qos), GFP_KERNEL);
> > >         if (!qos)
> > >                 return -ENOMEM;
> > > @@ -227,10 +233,26 @@ static int dev_pm_qos_constraints_allocate(stru=
ct device *dev)
> > >
> > >         INIT_LIST_HEAD(&qos->flags.list);
> > >
> > > +       mutex_lock(&dev_pm_qos_mtx);
> > > +
> > > +       if (!IS_ERR_OR_NULL(dev->power.qos)) {
> > > +               /*
> > > +                * We have raced with another task to create the qos.
> > > +                * No biggie, just free the resources we've allocated
> > > +                * outside of dev_pm_qos_mtx and move on with life.
> > > +                */
> > > +               kfree(n);
> > > +               kfree(qos);
> > > +               goto unlock;
> > > +       }
> > > +
> > >         spin_lock_irq(&dev->power.lock);
> > >         dev->power.qos =3D qos;
> > >         spin_unlock_irq(&dev->power.lock);
> > >
> > > +unlock:
> > > +       mutex_unlock(&dev_pm_qos_mtx);
> > > +
> > >         return 0;
> > >  }
> > >
> > > @@ -331,17 +353,15 @@ static int __dev_pm_qos_add_request(struct devi=
ce *dev,
> > >  {
> > >         int ret =3D 0;
> > >
> > > -       if (!dev || !req || dev_pm_qos_invalid_req_type(dev, type))
> > > +       if (!req || dev_pm_qos_invalid_req_type(dev, type))
> > >                 return -EINVAL;
> > >
> > >         if (WARN(dev_pm_qos_request_active(req),
> > >                  "%s() called for already added request\n", __func__)=
)
> > >                 return -EINVAL;
> > >
> > > -       if (IS_ERR(dev->power.qos))
> > > +       if (IS_ERR_OR_NULL(dev->power.qos))
> > >                 ret =3D -ENODEV;
> > > -       else if (!dev->power.qos)
> > > -               ret =3D dev_pm_qos_constraints_allocate(dev);
> > >
> > >         trace_dev_pm_qos_add_request(dev_name(dev), type, value);
> > >         if (ret)
> > > @@ -390,6 +410,10 @@ int dev_pm_qos_add_request(struct device *dev, s=
truct dev_pm_qos_request *req,
> > >  {
> > >         int ret;
> > >
> > > +       ret =3D dev_pm_qos_constraints_ensure_allocated(dev);
> > > +       if (ret)
> > > +               return ret;
> > > +
> >
> > It is a bit unfortunate that the mutex is dropped and then immediately
> > re-acquired again.  I don't think that this is strictly necessary.
>
> We could have dev_pm_qos_constraints_ensure_allocated() return with
> the lock held in the success case if we had to.. but that seems a bit
> funny looking.  And the dev_pm_qos_update_user_latency_tolerance()
> path would need to shuffle slightly to move the kzalloc out of the
> lock.

Well, what about something like this (modulo whitespace damage by
GMail), attached for completeness:

---
 drivers/base/power/qos.c |   37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

Index: linux-pm/drivers/base/power/qos.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-pm.orig/drivers/base/power/qos.c
+++ linux-pm/drivers/base/power/qos.c
@@ -186,26 +186,21 @@ static int apply_constraint(struct dev_p

 /*
  * dev_pm_qos_constraints_allocate
- * @dev: device to allocate data for
  *
  * Called at the first call to add_request, for constraint data allocation
  * Must be called with the dev_pm_qos_mtx mutex held
  */
-static int dev_pm_qos_constraints_allocate(struct device *dev)
+static struct dev_pm_qos *dev_pm_qos_constraints_allocate(void)
 {
     struct dev_pm_qos *qos;
     struct pm_qos_constraints *c;
     struct blocking_notifier_head *n;

-    qos =3D kzalloc(sizeof(*qos), GFP_KERNEL);
+    qos =3D kzalloc(sizeof(*qos) + kzalloc(3 * sizeof(*n), GFP_KERNEL);
     if (!qos)
-        return -ENOMEM;
+        return NULL;

-    n =3D kzalloc(3 * sizeof(*n), GFP_KERNEL);
-    if (!n) {
-        kfree(qos);
-        return -ENOMEM;
-    }
+    n =3D (struct blocking_notifier_head *)(qos + 1);

     c =3D &qos->resume_latency;
     plist_head_init(&c->list);
@@ -227,6 +222,20 @@ static int dev_pm_qos_constraints_alloca

     INIT_LIST_HEAD(&qos->flags.list);

+    return qos;
+}
+
+static int dev_pm_qos_constraints_add(struct device *dev,
+                       struct dev_pm_qos *qos)
+{
+    if (!qos)
+        return -ENOMEM;
+
+    if (!IS_ERR_OR_NULL(dev->power.qos)) {
+        kfree(qos);
+        return -ENODEV;
+    }
+
     spin_lock_irq(&dev->power.lock);
     dev->power.qos =3D qos;
     spin_unlock_irq(&dev->power.lock);
@@ -326,6 +335,7 @@ static bool dev_pm_qos_invalid_req_type(
 }

 static int __dev_pm_qos_add_request(struct device *dev,
+                    struct dev_pm_qos *qos,
                     struct dev_pm_qos_request *req,
                     enum dev_pm_qos_req_type type, s32 value)
 {
@@ -340,8 +350,10 @@ static int __dev_pm_qos_add_request(stru

     if (IS_ERR(dev->power.qos))
         ret =3D -ENODEV;
-    else if (!dev->power.qos)
-        ret =3D dev_pm_qos_constraints_allocate(dev);
+    else if (dev->power.qos)
+        kfree(qos);
+    else
+        ret =3D dev_pm_qos_constraints_add(dev);

     trace_dev_pm_qos_add_request(dev_name(dev), type, value);
     if (ret)
@@ -388,10 +400,11 @@ static int __dev_pm_qos_add_request(stru
 int dev_pm_qos_add_request(struct device *dev, struct dev_pm_qos_request *=
req,
                enum dev_pm_qos_req_type type, s32 value)
 {
+    struct dev_pm_qos *qos =3D dev_pm_qos_constraints_allocate();
     int ret;

     mutex_lock(&dev_pm_qos_mtx);
-    ret =3D __dev_pm_qos_add_request(dev, req, type, value);
+    ret =3D __dev_pm_qos_add_request(dev, qos, req, type, value);
     mutex_unlock(&dev_pm_qos_mtx);
     return ret;
 }

--000000000000d3141a06021daaed
Content-Type: text/x-patch; charset="US-ASCII"; name="pm-qos-rfc-change.patch"
Content-Disposition: attachment; filename="pm-qos-rfc-change.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lkwynmwh0>
X-Attachment-Id: f_lkwynmwh0

LS0tCiBkcml2ZXJzL2Jhc2UvcG93ZXIvcW9zLmMgfCAgIDM3ICsrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkKCkluZGV4OiBsaW51eC1wbS9kcml2ZXJzL2Jhc2UvcG93ZXIvcW9zLmMKPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQotLS0gbGludXgtcG0ub3JpZy9kcml2ZXJzL2Jhc2UvcG93ZXIvcW9zLmMKKysrIGxp
bnV4LXBtL2RyaXZlcnMvYmFzZS9wb3dlci9xb3MuYwpAQCAtMTg2LDI2ICsxODYsMjEgQEAgc3Rh
dGljIGludCBhcHBseV9jb25zdHJhaW50KHN0cnVjdCBkZXZfcAogCiAvKgogICogZGV2X3BtX3Fv
c19jb25zdHJhaW50c19hbGxvY2F0ZQotICogQGRldjogZGV2aWNlIHRvIGFsbG9jYXRlIGRhdGEg
Zm9yCiAgKgogICogQ2FsbGVkIGF0IHRoZSBmaXJzdCBjYWxsIHRvIGFkZF9yZXF1ZXN0LCBmb3Ig
Y29uc3RyYWludCBkYXRhIGFsbG9jYXRpb24KICAqIE11c3QgYmUgY2FsbGVkIHdpdGggdGhlIGRl
dl9wbV9xb3NfbXR4IG11dGV4IGhlbGQKICAqLwotc3RhdGljIGludCBkZXZfcG1fcW9zX2NvbnN0
cmFpbnRzX2FsbG9jYXRlKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyBzdHJ1Y3QgZGV2X3Bt
X3FvcyAqZGV2X3BtX3Fvc19jb25zdHJhaW50c19hbGxvY2F0ZSh2b2lkKQogewogCXN0cnVjdCBk
ZXZfcG1fcW9zICpxb3M7CiAJc3RydWN0IHBtX3Fvc19jb25zdHJhaW50cyAqYzsKIAlzdHJ1Y3Qg
YmxvY2tpbmdfbm90aWZpZXJfaGVhZCAqbjsKIAotCXFvcyA9IGt6YWxsb2Moc2l6ZW9mKCpxb3Mp
LCBHRlBfS0VSTkVMKTsKKwlxb3MgPSBremFsbG9jKHNpemVvZigqcW9zKSArIGt6YWxsb2MoMyAq
IHNpemVvZigqbiksIEdGUF9LRVJORUwpOwogCWlmICghcW9zKQotCQlyZXR1cm4gLUVOT01FTTsK
KwkJcmV0dXJuIE5VTEw7CiAKLQluID0ga3phbGxvYygzICogc2l6ZW9mKCpuKSwgR0ZQX0tFUk5F
TCk7Ci0JaWYgKCFuKSB7Ci0JCWtmcmVlKHFvcyk7Ci0JCXJldHVybiAtRU5PTUVNOwotCX0KKwlu
ID0gKHN0cnVjdCBibG9ja2luZ19ub3RpZmllcl9oZWFkICopKHFvcyArIDEpOwogCiAJYyA9ICZx
b3MtPnJlc3VtZV9sYXRlbmN5OwogCXBsaXN0X2hlYWRfaW5pdCgmYy0+bGlzdCk7CkBAIC0yMjcs
NiArMjIyLDIwIEBAIHN0YXRpYyBpbnQgZGV2X3BtX3Fvc19jb25zdHJhaW50c19hbGxvY2EKIAog
CUlOSVRfTElTVF9IRUFEKCZxb3MtPmZsYWdzLmxpc3QpOwogCisJcmV0dXJuIHFvczsKK30KKwor
c3RhdGljIGludCBkZXZfcG1fcW9zX2NvbnN0cmFpbnRzX2FkZChzdHJ1Y3QgZGV2aWNlICpkZXYs
CisJCQkJICAgICAgIHN0cnVjdCBkZXZfcG1fcW9zICpxb3MpCit7CisJaWYgKCFxb3MpCisJCXJl
dHVybiAtRU5PTUVNOworCisJaWYgKCFJU19FUlJfT1JfTlVMTChkZXYtPnBvd2VyLnFvcykpIHsK
KwkJa2ZyZWUocW9zKTsKKwkJcmV0dXJuIC1FTk9ERVY7CisJfQorCiAJc3Bpbl9sb2NrX2lycSgm
ZGV2LT5wb3dlci5sb2NrKTsKIAlkZXYtPnBvd2VyLnFvcyA9IHFvczsKIAlzcGluX3VubG9ja19p
cnEoJmRldi0+cG93ZXIubG9jayk7CkBAIC0zMjYsNiArMzM1LDcgQEAgc3RhdGljIGJvb2wgZGV2
X3BtX3Fvc19pbnZhbGlkX3JlcV90eXBlKAogfQogCiBzdGF0aWMgaW50IF9fZGV2X3BtX3Fvc19h
ZGRfcmVxdWVzdChzdHJ1Y3QgZGV2aWNlICpkZXYsCisJCQkJICAgIHN0cnVjdCBkZXZfcG1fcW9z
ICpxb3MsCiAJCQkJICAgIHN0cnVjdCBkZXZfcG1fcW9zX3JlcXVlc3QgKnJlcSwKIAkJCQkgICAg
ZW51bSBkZXZfcG1fcW9zX3JlcV90eXBlIHR5cGUsIHMzMiB2YWx1ZSkKIHsKQEAgLTM0MCw4ICsz
NTAsMTAgQEAgc3RhdGljIGludCBfX2Rldl9wbV9xb3NfYWRkX3JlcXVlc3Qoc3RydQogCiAJaWYg
KElTX0VSUihkZXYtPnBvd2VyLnFvcykpCiAJCXJldCA9IC1FTk9ERVY7Ci0JZWxzZSBpZiAoIWRl
di0+cG93ZXIucW9zKQotCQlyZXQgPSBkZXZfcG1fcW9zX2NvbnN0cmFpbnRzX2FsbG9jYXRlKGRl
dik7CisJZWxzZSBpZiAoZGV2LT5wb3dlci5xb3MpCisJCWtmcmVlKHFvcyk7CisJZWxzZQorCQly
ZXQgPSBkZXZfcG1fcW9zX2NvbnN0cmFpbnRzX2FkZChkZXYpOwogCiAJdHJhY2VfZGV2X3BtX3Fv
c19hZGRfcmVxdWVzdChkZXZfbmFtZShkZXYpLCB0eXBlLCB2YWx1ZSk7CiAJaWYgKHJldCkKQEAg
LTM4OCwxMCArNDAwLDExIEBAIHN0YXRpYyBpbnQgX19kZXZfcG1fcW9zX2FkZF9yZXF1ZXN0KHN0
cnUKIGludCBkZXZfcG1fcW9zX2FkZF9yZXF1ZXN0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IGRldl9wbV9xb3NfcmVxdWVzdCAqcmVxLAogCQkJICAgZW51bSBkZXZfcG1fcW9zX3JlcV90eXBl
IHR5cGUsIHMzMiB2YWx1ZSkKIHsKKwlzdHJ1Y3QgZGV2X3BtX3FvcyAqcW9zID0gZGV2X3BtX3Fv
c19jb25zdHJhaW50c19hbGxvY2F0ZSgpOwogCWludCByZXQ7CiAKIAltdXRleF9sb2NrKCZkZXZf
cG1fcW9zX210eCk7Ci0JcmV0ID0gX19kZXZfcG1fcW9zX2FkZF9yZXF1ZXN0KGRldiwgcmVxLCB0
eXBlLCB2YWx1ZSk7CisJcmV0ID0gX19kZXZfcG1fcW9zX2FkZF9yZXF1ZXN0KGRldiwgcW9zLCBy
ZXEsIHR5cGUsIHZhbHVlKTsKIAltdXRleF91bmxvY2soJmRldl9wbV9xb3NfbXR4KTsKIAlyZXR1
cm4gcmV0OwogfQo=
--000000000000d3141a06021daaed--
