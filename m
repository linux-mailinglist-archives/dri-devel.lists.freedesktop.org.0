Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80275345C53
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 11:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7225C6E89C;
	Tue, 23 Mar 2021 10:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7266E89C;
 Tue, 23 Mar 2021 10:54:41 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id i9so13775352qka.2;
 Tue, 23 Mar 2021 03:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5kjihG+b4s1T5q2tdzUkV4HTZAWZrXhR7FhIZLxHxfs=;
 b=WR8BAVNoMVVsACLG/N3J4MMAp5VZ1pgRGLNW5Um19kdO6kj2rVIPnbqjotLnjox7+1
 ShqmghGgQtGQ6vf80fhg6q+4p5pbjC4QeTkiVcK38dcuDRCmXrHgvREQ9s5Uh+omtpaP
 UDHF+uWrQBwarOPC97PStkPBcZOfJI++l2rdO0jqOwYcCwYva03tFWugBq2BGb6cSHh0
 2ps82yl+wYlH+c05DmQWLoFrgvOvrggI3Iim4UPPdgEji0ZZbdFO5FjG1Jgdc0OfZEjX
 BaEw/iXieov4b1zkGSPRaAZNDeLlYWIKpstMe0z7oOf1v03/UQuxRlnnvZWK1C4a5CVa
 Xf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5kjihG+b4s1T5q2tdzUkV4HTZAWZrXhR7FhIZLxHxfs=;
 b=MgNnE8qmlRNBXcILyzJxCJpJuHVcRYoq0CPEjeAnjpQ9oEcIqxo9kYB02P5DoVNsWT
 EXLkd48GwTfkvSscuKWna6D98N0HEvoU4kNnUXERz0xuaLOYSgARYJN34/x9GesHrBSC
 mxFLCmdwtZAOch6oVs/PGBfzC+HMjfdKTkqDuDkjhZepaqzfR2YURxBTbIT57F/MLlAk
 7si6t7Ea9GpMYfUUw02oLv9MHvnJ29nSnKxSs+Y3s2VAypF6Aa1H7GsZ/Qf6YEV5xTbp
 RqpTkxUk8tzfYTwSJQ6vd9+Fx6S7ekQcy4/5TK1E70AcBKwxJEvhH33X+2b0QRcG8/z7
 L4qA==
X-Gm-Message-State: AOAM531SGCkL9PsUU0o5ckpfELVXu+l3q/bJjv6dz7XJv4pGoc3U+Vp0
 CXPXnHkV/GrU2n3S6KY1O68pjsgT2X1/UOm8tm4=
X-Google-Smtp-Source: ABdhPJwQZV9TjSQdBYwv2rC52sxlUFM6chvNb0kifoA1GC9zomSNdo2ocz5g94QKik5nBJtv/1+4wxIbYEnSf9xjJ8U=
X-Received: by 2002:a37:58c5:: with SMTP id m188mr4538933qkb.327.1616496880280; 
 Tue, 23 Mar 2021 03:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210318170419.2107512-5-tvrtko.ursulin@linux.intel.com>
 <20210322132937.2165901-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210322132937.2165901-1-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 23 Mar 2021 10:54:13 +0000
Message-ID: <CAM0jSHM=o3pdsuSTd2hFh6mRqCiJVPhXgjRMLLGT=N8Q+SAWwQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 4/6] drm/i915: Request watchdog
 infrastructure
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Mar 2021 at 13:29, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Prepares the plumbing for setting request/fence expiration time. All code
> is put in place but is never activeted due yet missing ability to actually

                 activated

> configure the timer.
>
> Outline of the basic operation:
>
> A timer is started when request is ready for execution. If the request
> completes (retires) before the timer fires, timer is cancelled and nothing
> further happens.
>
> If the timer fires request is added to a lockless list and worker queued.
> Purpose of this is twofold: a) It allows request cancellation from a more
> friendly context and b) coalesces multiple expirations into a single event
> of consuming the list.
>
> Worker locklessly consumes the list of expired requests and cancels them
> all using previous added i915_request_cancel().
>
> Associated timeout value is stored in rq->context.watchdog.timeout_us.
>
> v2:
>  * Log expiration.
>
> v3:
>  * Include more information about user timeline in the log message.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/i915/gt/intel_context_types.h |  4 ++
>  .../drm/i915/gt/intel_execlists_submission.h  |  2 +
>  drivers/gpu/drm/i915/gt/intel_gt.c            |  3 +
>  drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +
>  drivers/gpu/drm/i915/gt/intel_gt_requests.c   | 28 ++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_types.h      |  7 +++
>  drivers/gpu/drm/i915/i915_request.c           | 56 +++++++++++++++++++
>  drivers/gpu/drm/i915/i915_request.h           |  8 +++
>  8 files changed, 110 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 0ea18c9e2aca..65a5730a4f5b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -99,6 +99,10 @@ struct intel_context {
>  #define CONTEXT_FORCE_SINGLE_SUBMISSION        7
>  #define CONTEXT_NOPREEMPT              8
>
> +       struct {
> +               u64 timeout_us;
> +       } watchdog;
> +
>         u32 *lrc_reg_state;
>         union {
>                 struct {
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> index f7bd3fccfee8..4ca9b475e252 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> @@ -6,6 +6,7 @@
>  #ifndef __INTEL_EXECLISTS_SUBMISSION_H__
>  #define __INTEL_EXECLISTS_SUBMISSION_H__
>
> +#include <linux/llist.h>
>  #include <linux/types.h>
>
>  struct drm_printer;
> @@ -13,6 +14,7 @@ struct drm_printer;
>  struct i915_request;
>  struct intel_context;
>  struct intel_engine_cs;
> +struct intel_gt;
>
>  enum {
>         INTEL_CONTEXT_SCHEDULE_IN = 0,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index ca76f93bc03d..8d77dcbad059 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -31,6 +31,9 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
>         INIT_LIST_HEAD(&gt->closed_vma);
>         spin_lock_init(&gt->closed_lock);
>
> +       init_llist_head(&gt->watchdog.list);
> +       INIT_WORK(&gt->watchdog.work, intel_gt_watchdog_work);
> +
>         intel_gt_init_buffer_pool(gt);
>         intel_gt_init_reset(gt);
>         intel_gt_init_requests(gt);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index a17bd8b3195f..7ec395cace69 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -78,4 +78,6 @@ static inline bool intel_gt_is_wedged(const struct intel_gt *gt)
>  void intel_gt_info_print(const struct intel_gt_info *info,
>                          struct drm_printer *p);
>
> +void intel_gt_watchdog_work(struct work_struct *work);
> +
>  #endif /* __INTEL_GT_H__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> index 36ec97f79174..fbfd19b2e5f2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -8,6 +8,7 @@
>  #include "i915_drv.h" /* for_each_engine() */
>  #include "i915_request.h"
>  #include "intel_engine_heartbeat.h"
> +#include "intel_execlists_submission.h"
>  #include "intel_gt.h"
>  #include "intel_gt_pm.h"
>  #include "intel_gt_requests.h"
> @@ -242,4 +243,31 @@ void intel_gt_fini_requests(struct intel_gt *gt)
>  {
>         /* Wait until the work is marked as finished before unloading! */
>         cancel_delayed_work_sync(&gt->requests.retire_work);
> +
> +       flush_work(&gt->watchdog.work);
> +}
> +
> +void intel_gt_watchdog_work(struct work_struct *work)
> +{
> +       struct intel_gt *gt =
> +               container_of(work, typeof(*gt), watchdog.work);
> +       struct i915_request *rq, *rn;
> +       struct llist_node *first;
> +
> +       first = llist_del_all(&gt->watchdog.list);
> +       if (!first)
> +               return;
> +
> +       llist_for_each_entry_safe(rq, rn, first, watchdog.link) {
> +               if (!i915_request_completed(rq)) {
> +                       struct dma_fence *f = &rq->fence;
> +
> +                       pr_notice("Fence expiration time out i915-%s:%s:%llx!\n",
> +                                 f->ops->get_driver_name(f),
> +                                 f->ops->get_timeline_name(f),
> +                                 f->seqno);
> +                       i915_request_cancel(rq, -EINTR);
> +               }
> +               i915_request_put(rq);
> +       }
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 626af37c7790..d70ebcc6f19f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -8,10 +8,12 @@
>
>  #include <linux/ktime.h>
>  #include <linux/list.h>
> +#include <linux/llist.h>
>  #include <linux/mutex.h>
>  #include <linux/notifier.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> +#include <linux/workqueue.h>
>
>  #include "uc/intel_uc.h"
>
> @@ -62,6 +64,11 @@ struct intel_gt {
>                 struct delayed_work retire_work;
>         } requests;
>
> +       struct {
> +               struct llist_head list;
> +               struct work_struct work;
> +       } watchdog;
> +
>         struct intel_wakeref wakeref;
>         atomic_t user_wakeref;
>
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index b4511ac05e9a..9dd5e588b0a4 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -277,6 +277,57 @@ static void remove_from_engine(struct i915_request *rq)
>         __notify_execute_cb_imm(rq);
>  }
>
> +static void __rq_init_watchdog(struct i915_request *rq)
> +{
> +       rq->watchdog.timer.function = NULL;
> +}
> +
> +static enum hrtimer_restart __rq_watchdog_expired(struct hrtimer *hrtimer)
> +{
> +       struct i915_request *rq =
> +               container_of(hrtimer, struct i915_request, watchdog.timer);
> +       struct intel_gt *gt = rq->engine->gt;
> +
> +       if (!i915_request_completed(rq)) {
> +               if (llist_add(&rq->watchdog.link, &gt->watchdog.list))
> +                       schedule_work(&gt->watchdog.work);
> +       } else {
> +               i915_request_put(rq);
> +       }
> +
> +       return HRTIMER_NORESTART;
> +}
> +
> +static void __rq_arm_watchdog(struct i915_request *rq)
> +{
> +       struct i915_request_watchdog *wdg = &rq->watchdog;
> +       struct intel_context *ce = rq->context;
> +
> +       if (!ce->watchdog.timeout_us)
> +               return;
> +
> +       hrtimer_init(&wdg->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +       wdg->timer.function = __rq_watchdog_expired;
> +       hrtimer_start_range_ns(&wdg->timer,
> +                              ns_to_ktime(ce->watchdog.timeout_us *
> +                                          NSEC_PER_USEC),
> +                               /*
> +                                * FIXME check if it gives the "not sooner"
> +                                * guarantee or slack is both ways
> +                                */

It looks like the slack/fuzziness just delays the timer, in case it
can coalesce multiple timer events. So shouldn't be sooner I think?

> +                               NSEC_PER_MSEC,

Formatting.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
