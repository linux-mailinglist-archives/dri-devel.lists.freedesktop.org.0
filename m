Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCC939C04F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 21:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416FB6F8C6;
	Fri,  4 Jun 2021 19:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1006F8C6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 19:18:10 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id g38so15113499ybi.12
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 12:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=utoxe70LwB4tDSTGUuda4Vq5sgknScWrNBtTuTqT4Q4=;
 b=1mbohYvLC+pa8PlN96kc7EkCMNY8HauRKjn8zeH98jUXADtRh7zM3o1zSQgTG1BhCL
 Pss4KrSo7F+U3pg8NheiBXF3lDi7k+dX7st/EnXBIJzq30VL6+IwjSQ1LqBb7Ei24V9U
 ZSSVAE9Pl/25YCLtCLmloUtOYZniSl60/tcPAt87h6sjSZQsIzEbGo98Mb+V64Ar0GPY
 RxuCaTIZQv/lKv5txs1Pj55ux2Bupxex9AAK2jXSRt2Otqq7tGpZWsTOQNJ6IaOZk17S
 PXpSfsGxOFwXH6X9IoYnBY042tIsSVQxaB6iDd9O9QXG3XaUJUTtgCjQ8Ge+U75jE1gk
 Og/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=utoxe70LwB4tDSTGUuda4Vq5sgknScWrNBtTuTqT4Q4=;
 b=okkq9q9bdSg2jDeeEuEmiv26a0ZsH77TWHGRnmXBajb/YqwhrEJFglog0On4cGqYW5
 9azsl6A/QDNuU3fnGNkmJDRnBjTzdV7mZWPc7qmzHimKydQkwZnC9/NGJhtcy6hh6rW/
 2Om6EMvlal4Cl/NPVzQTd8xWu0oITM+O0+qcBKRtENekhrmgGGo1eGYjblsldJZSGpgi
 xUER0TB1Hi6RFBceghOJ7cywwQXuyrfoIpWKnBdK2Z6rxfLcHiRVJzbPeGhgwsOp7VDa
 7mCC9KBG1UVusHFZZTDm25qUPnxcFB2KMafK9/gZ7jt8i3WCzdLjpWSf3kK+nHtjjJ1G
 iOoQ==
X-Gm-Message-State: AOAM5303lezHEiZMZAIwGytcpMdEy6ti67IseaRXQc+P8IELb7lH4Aa8
 bc+rU9FVYZpahfbh98Q7v2jYCI80I/RjEQY55x4Bhg==
X-Google-Smtp-Source: ABdhPJx/yjaeN20DIDloNueLAG6wKA5eXlp0NFgDfeyKHsrxsTkX5vvxX6vIWS9RjltUw+jLqq/E4aTZc6B6sOWSOgE=
X-Received: by 2002:a5b:392:: with SMTP id k18mr7720231ybp.180.1622834289456; 
 Fri, 04 Jun 2021 12:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210603212722.59719-1-matthew.brost@intel.com>
 <20210603212722.59719-8-matthew.brost@intel.com>
In-Reply-To: <20210603212722.59719-8-matthew.brost@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 4 Jun 2021 14:17:58 -0500
Message-ID: <CAOFGe966f+M+RECs-v-eVa9PWqCJcY0H2O-3d8hB3_Y0e47LdQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 7/9] drm/i915: Update i915_scheduler to
 operate on i915_sched_engine
To: Matthew Brost <matthew.brost@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 4:09 PM Matthew Brost <matthew.brost@intel.com> wrot=
e:
>
> Rather passing around an intel_engine_cs in the scheduling code, pass
> around a i915_sched_engine.

=F0=9F=91=8D

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  .../drm/i915/gt/intel_execlists_submission.c  | 11 +++--
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
>  drivers/gpu/drm/i915/i915_scheduler.c         | 46 +++++++++----------
>  drivers/gpu/drm/i915/i915_scheduler.h         |  2 +-
>  4 files changed, 32 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drive=
rs/gpu/drm/i915/gt/intel_execlists_submission.c
> index 3fac17103837..7240c153be35 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -382,7 +382,8 @@ __unwind_incomplete_requests(struct intel_engine_cs *=
engine)
>                 GEM_BUG_ON(rq_prio(rq) =3D=3D I915_PRIORITY_INVALID);
>                 if (rq_prio(rq) !=3D prio) {
>                         prio =3D rq_prio(rq);
> -                       pl =3D i915_sched_lookup_priolist(engine, prio);
> +                       pl =3D i915_sched_lookup_priolist(engine->sched_e=
ngine,
> +                                                       prio);
>                 }
>                 GEM_BUG_ON(i915_sched_engine_is_empty(engine->sched_engin=
e));
>
> @@ -1096,7 +1097,8 @@ static void defer_active(struct intel_engine_cs *en=
gine)
>         if (!rq)
>                 return;
>
> -       defer_request(rq, i915_sched_lookup_priolist(engine, rq_prio(rq))=
);
> +       defer_request(rq, i915_sched_lookup_priolist(engine->sched_engine=
,
> +                                                    rq_prio(rq)));
>  }
>
>  static bool
> @@ -2083,7 +2085,7 @@ static void __execlists_unhold(struct i915_request =
*rq)
>
>                 i915_request_clear_hold(rq);
>                 list_move_tail(&rq->sched.link,
> -                              i915_sched_lookup_priolist(rq->engine,
> +                              i915_sched_lookup_priolist(rq->engine->sch=
ed_engine,
>                                                           rq_prio(rq)));
>                 set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
>
> @@ -2452,7 +2454,8 @@ static void queue_request(struct intel_engine_cs *e=
ngine,
>  {
>         GEM_BUG_ON(!list_empty(&rq->sched.link));
>         list_add_tail(&rq->sched.link,
> -                     i915_sched_lookup_priolist(engine, rq_prio(rq)));
> +                     i915_sched_lookup_priolist(engine->sched_engine,
> +                                                rq_prio(rq)));
>         set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
>  }
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/=
gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 4c5bbec0775d..7ed21670ef14 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -529,7 +529,7 @@ static inline void queue_request(struct intel_engine_=
cs *engine,
>  {
>         GEM_BUG_ON(!list_empty(&rq->sched.link));
>         list_add_tail(&rq->sched.link,
> -                     i915_sched_lookup_priolist(engine, prio));
> +                     i915_sched_lookup_priolist(engine->sched_engine, pr=
io));
>         set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
>  }
>
> diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915=
/i915_scheduler.c
> index 035b88f2e4aa..3d36e4447b5d 100644
> --- a/drivers/gpu/drm/i915/i915_scheduler.c
> +++ b/drivers/gpu/drm/i915/i915_scheduler.c
> @@ -61,14 +61,13 @@ static void assert_priolists(struct i915_sched_engine=
 * const sched_engine)
>  }
>
>  struct list_head *
> -i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio)
> +i915_sched_lookup_priolist(struct i915_sched_engine *sched_engine, int p=
rio)
>  {
> -       struct i915_sched_engine * const sched_engine =3D engine->sched_e=
ngine;
>         struct i915_priolist *p;
>         struct rb_node **parent, *rb;
>         bool first =3D true;
>
> -       lockdep_assert_held(&engine->sched_engine->lock);
> +       lockdep_assert_held(&sched_engine->lock);
>         assert_priolists(sched_engine);
>
>         if (unlikely(sched_engine->no_priolist))
> @@ -130,13 +129,13 @@ struct sched_cache {
>         struct list_head *priolist;
>  };
>
> -static struct intel_engine_cs *
> -sched_lock_engine(const struct i915_sched_node *node,
> -                 struct intel_engine_cs *locked,
> +static struct i915_sched_engine *
> +lock_sched_engine(struct i915_sched_node *node,
> +                 struct i915_sched_engine *locked,
>                   struct sched_cache *cache)
>  {
>         const struct i915_request *rq =3D node_to_request(node);
> -       struct intel_engine_cs *engine;
> +       struct i915_sched_engine *sched_engine;
>
>         GEM_BUG_ON(!locked);
>
> @@ -146,14 +145,14 @@ sched_lock_engine(const struct i915_sched_node *nod=
e,
>          * engine lock. The simple ploy we use is to take the lock then
>          * check that the rq still belongs to the newly locked engine.
>          */
> -       while (locked !=3D (engine =3D READ_ONCE(rq->engine))) {
> -               spin_unlock(&locked->sched_engine->lock);
> +       while (locked !=3D (sched_engine =3D rq->engine->sched_engine)) {

You lost the READ_ONCE here.  Based on the comment above, that may
matter.  I guess it depends on what all barriers spin_lock() implies.

Assuming that's all good,

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

> +               spin_unlock(&locked->lock);
>                 memset(cache, 0, sizeof(*cache));
> -               spin_lock(&engine->sched_engine->lock);
> -               locked =3D engine;
> +               spin_lock(&sched_engine->lock);
> +               locked =3D sched_engine;
>         }
>
> -       GEM_BUG_ON(locked !=3D engine);
> +       GEM_BUG_ON(locked !=3D sched_engine);
>         return locked;
>  }
>
> @@ -161,7 +160,7 @@ static void __i915_schedule(struct i915_sched_node *n=
ode,
>                             const struct i915_sched_attr *attr)
>  {
>         const int prio =3D max(attr->priority, node->attr.priority);
> -       struct intel_engine_cs *engine;
> +       struct i915_sched_engine *sched_engine;
>         struct i915_dependency *dep, *p;
>         struct i915_dependency stack;
>         struct sched_cache cache;
> @@ -236,23 +235,24 @@ static void __i915_schedule(struct i915_sched_node =
*node,
>         }
>
>         memset(&cache, 0, sizeof(cache));
> -       engine =3D node_to_request(node)->engine;
> -       spin_lock(&engine->sched_engine->lock);
> +       sched_engine =3D node_to_request(node)->engine->sched_engine;
> +       spin_lock(&sched_engine->lock);
>
>         /* Fifo and depth-first replacement ensure our deps execute befor=
e us */
> -       engine =3D sched_lock_engine(node, engine, &cache);
> +       sched_engine =3D lock_sched_engine(node, sched_engine, &cache);
>         list_for_each_entry_safe_reverse(dep, p, &dfs, dfs_link) {
>                 INIT_LIST_HEAD(&dep->dfs_link);
>
>                 node =3D dep->signaler;
> -               engine =3D sched_lock_engine(node, engine, &cache);
> -               lockdep_assert_held(&engine->sched_engine->lock);
> +               sched_engine =3D lock_sched_engine(node, sched_engine, &c=
ache);
> +               lockdep_assert_held(&sched_engine->lock);
>
>                 /* Recheck after acquiring the engine->timeline.lock */
>                 if (prio <=3D node->attr.priority || node_signaled(node))
>                         continue;
>
> -               GEM_BUG_ON(node_to_request(node)->engine !=3D engine);
> +               GEM_BUG_ON(node_to_request(node)->engine->sched_engine !=
=3D
> +                          sched_engine);
>
>                 WRITE_ONCE(node->attr.priority, prio);
>
> @@ -270,17 +270,17 @@ static void __i915_schedule(struct i915_sched_node =
*node,
>                 if (i915_request_in_priority_queue(node_to_request(node))=
) {
>                         if (!cache.priolist)
>                                 cache.priolist =3D
> -                                       i915_sched_lookup_priolist(engine=
,
> +                                       i915_sched_lookup_priolist(sched_=
engine,
>                                                                    prio);
>                         list_move_tail(&node->link, cache.priolist);
>                 }
>
>                 /* Defer (tasklet) submission until after all of our upda=
tes. */
> -               if (engine->sched_engine->kick_backend)
> -                       engine->sched_engine->kick_backend(node_to_reques=
t(node), prio);
> +               if (sched_engine->kick_backend)
> +                       sched_engine->kick_backend(node_to_request(node),=
 prio);
>         }
>
> -       spin_unlock(&engine->sched_engine->lock);
> +       spin_unlock(&sched_engine->lock);
>  }
>
>  void i915_schedule(struct i915_request *rq, const struct i915_sched_attr=
 *attr)
> diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915=
/i915_scheduler.h
> index 713c38c99de9..0014745bda30 100644
> --- a/drivers/gpu/drm/i915/i915_scheduler.h
> +++ b/drivers/gpu/drm/i915/i915_scheduler.h
> @@ -39,7 +39,7 @@ void i915_schedule(struct i915_request *request,
>                    const struct i915_sched_attr *attr);
>
>  struct list_head *
> -i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio);
> +i915_sched_lookup_priolist(struct i915_sched_engine *sched_engine, int p=
rio);
>
>  void __i915_priolist_free(struct i915_priolist *p);
>  static inline void i915_priolist_free(struct i915_priolist *p)
> --
> 2.28.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
