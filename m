Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C4C345D24
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7FA6E8C1;
	Tue, 23 Mar 2021 11:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD986E8C1;
 Tue, 23 Mar 2021 11:40:47 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id g24so14600826qts.6;
 Tue, 23 Mar 2021 04:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hjoUEjiPs4obZpnFDYX88/a+N8y4v+2RtSYCal3LPRs=;
 b=dCRh/OLWY5x/I7JLl2BAmB/SCbMtTKYgdZYw37L7aF7ChaagGNYmv8NMMI30I0ucO8
 9qJZgGyrT6J6Ou7oq/GfzIcSE65NOXLyou9yySzuR2DwBZLkrhuizXcBa8ZpogOgQKc/
 3/eU7KzT/rk+r10ScsuXbB/KyI3UI/Org6S0I2csFoYdTtTYrIn+ZE/Raix32fR9tbGY
 VZd/LXP3zAUpTdrOpU5o+dZt5+yiuOHZyYrKxCtpBbGRgMFGXgf2hhttkgGRLMeiZlSe
 30aJ75KdL4xmTQbymiFdIodhGvjYaEmIsfhrqLmDikst/uQh/gB+ibCwCVHQYV5Ids2C
 kGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hjoUEjiPs4obZpnFDYX88/a+N8y4v+2RtSYCal3LPRs=;
 b=qH41HAIdeR7pwxzUOmwr/6Q0HoeWUH+r/q0qOx7ZL7W96fm38AzvVrXr/sxUeCdwIC
 u0IqPjWLfSymvRJQ36G1mCyM872qFhzdtFAYGiNrqNvrF4XK+VCiCYUOhS9uNU1SWVUq
 3GGQ2mh41ozHuK39o1xi55dqCtlxVqUoff8D9bRsoDC3qpvmFM9c/t6t47tfR3QEU8Ob
 FSSwxz40l3L1xhiEXOsR0bXSpEBzEJpkZGbzr+p/8yhmTHti2mgzwhz+buyicIBD98yG
 wIG2sBKPVxpvvsW42IifHjBhIOluv74/s1JBp1zC3yfnSBKcrLvDhZRI53JKyRR13hAJ
 ZoDg==
X-Gm-Message-State: AOAM530iLj1+miSV9dlUcTDkTOBP8NItLkoWt4noC+HFhYaSw68Mi9lI
 i8DbozhkH88OgjJKYWzq08jPIh13GGDIMDI4VJU=
X-Google-Smtp-Source: ABdhPJyVvpEd6NHLzPTLCVl4KHDldTvOTeMGAGZRFZI/+GyB8FuE4v/E62vnthLfgwLS9lW/BET+4rjra1Q7TLmr3nc=
X-Received: by 2002:ac8:5510:: with SMTP id j16mr3817886qtq.339.1616499646089; 
 Tue, 23 Mar 2021 04:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210318170419.2107512-5-tvrtko.ursulin@linux.intel.com>
 <20210322132937.2165901-1-tvrtko.ursulin@linux.intel.com>
 <CAM0jSHM=o3pdsuSTd2hFh6mRqCiJVPhXgjRMLLGT=N8Q+SAWwQ@mail.gmail.com>
 <a5feaa5f-3086-952d-8edf-c66c18ce95b7@linux.intel.com>
In-Reply-To: <a5feaa5f-3086-952d-8edf-c66c18ce95b7@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 23 Mar 2021 11:40:19 +0000
Message-ID: <CAM0jSHNYR+j9SmQ68QkWk92XWv89o4O1GA00L0dMdSTBoK0Rcw@mail.gmail.com>
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

On Tue, 23 Mar 2021 at 11:09, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 23/03/2021 10:54, Matthew Auld wrote:
> > On Mon, 22 Mar 2021 at 13:29, Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> Prepares the plumbing for setting request/fence expiration time. All code
> >> is put in place but is never activeted due yet missing ability to actually
> >
> >                   activated
> >
> >> configure the timer.
> >>
> >> Outline of the basic operation:
> >>
> >> A timer is started when request is ready for execution. If the request
> >> completes (retires) before the timer fires, timer is cancelled and nothing
> >> further happens.
> >>
> >> If the timer fires request is added to a lockless list and worker queued.
> >> Purpose of this is twofold: a) It allows request cancellation from a more
> >> friendly context and b) coalesces multiple expirations into a single event
> >> of consuming the list.
> >>
> >> Worker locklessly consumes the list of expired requests and cancels them
> >> all using previous added i915_request_cancel().
> >>
> >> Associated timeout value is stored in rq->context.watchdog.timeout_us.
> >>
> >> v2:
> >>   * Log expiration.
> >>
> >> v3:
> >>   * Include more information about user timeline in the log message.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> ---
> >>   drivers/gpu/drm/i915/gt/intel_context_types.h |  4 ++
> >>   .../drm/i915/gt/intel_execlists_submission.h  |  2 +
> >>   drivers/gpu/drm/i915/gt/intel_gt.c            |  3 +
> >>   drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +
> >>   drivers/gpu/drm/i915/gt/intel_gt_requests.c   | 28 ++++++++++
> >>   drivers/gpu/drm/i915/gt/intel_gt_types.h      |  7 +++
> >>   drivers/gpu/drm/i915/i915_request.c           | 56 +++++++++++++++++++
> >>   drivers/gpu/drm/i915/i915_request.h           |  8 +++
> >>   8 files changed, 110 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> >> index 0ea18c9e2aca..65a5730a4f5b 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> >> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> >> @@ -99,6 +99,10 @@ struct intel_context {
> >>   #define CONTEXT_FORCE_SINGLE_SUBMISSION        7
> >>   #define CONTEXT_NOPREEMPT              8
> >>
> >> +       struct {
> >> +               u64 timeout_us;
> >> +       } watchdog;
> >> +
> >>          u32 *lrc_reg_state;
> >>          union {
> >>                  struct {
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> >> index f7bd3fccfee8..4ca9b475e252 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> >> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> >> @@ -6,6 +6,7 @@
> >>   #ifndef __INTEL_EXECLISTS_SUBMISSION_H__
> >>   #define __INTEL_EXECLISTS_SUBMISSION_H__
> >>
> >> +#include <linux/llist.h>
> >>   #include <linux/types.h>
> >>
> >>   struct drm_printer;
> >> @@ -13,6 +14,7 @@ struct drm_printer;
> >>   struct i915_request;
> >>   struct intel_context;
> >>   struct intel_engine_cs;
> >> +struct intel_gt;
> >>
> >>   enum {
> >>          INTEL_CONTEXT_SCHEDULE_IN = 0,
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> >> index ca76f93bc03d..8d77dcbad059 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> >> @@ -31,6 +31,9 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
> >>          INIT_LIST_HEAD(&gt->closed_vma);
> >>          spin_lock_init(&gt->closed_lock);
> >>
> >> +       init_llist_head(&gt->watchdog.list);
> >> +       INIT_WORK(&gt->watchdog.work, intel_gt_watchdog_work);
> >> +
> >>          intel_gt_init_buffer_pool(gt);
> >>          intel_gt_init_reset(gt);
> >>          intel_gt_init_requests(gt);
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> >> index a17bd8b3195f..7ec395cace69 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> >> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> >> @@ -78,4 +78,6 @@ static inline bool intel_gt_is_wedged(const struct intel_gt *gt)
> >>   void intel_gt_info_print(const struct intel_gt_info *info,
> >>                           struct drm_printer *p);
> >>
> >> +void intel_gt_watchdog_work(struct work_struct *work);
> >> +
> >>   #endif /* __INTEL_GT_H__ */
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> >> index 36ec97f79174..fbfd19b2e5f2 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> >> @@ -8,6 +8,7 @@
> >>   #include "i915_drv.h" /* for_each_engine() */
> >>   #include "i915_request.h"
> >>   #include "intel_engine_heartbeat.h"
> >> +#include "intel_execlists_submission.h"
> >>   #include "intel_gt.h"
> >>   #include "intel_gt_pm.h"
> >>   #include "intel_gt_requests.h"
> >> @@ -242,4 +243,31 @@ void intel_gt_fini_requests(struct intel_gt *gt)
> >>   {
> >>          /* Wait until the work is marked as finished before unloading! */
> >>          cancel_delayed_work_sync(&gt->requests.retire_work);
> >> +
> >> +       flush_work(&gt->watchdog.work);
> >> +}
> >> +
> >> +void intel_gt_watchdog_work(struct work_struct *work)
> >> +{
> >> +       struct intel_gt *gt =
> >> +               container_of(work, typeof(*gt), watchdog.work);
> >> +       struct i915_request *rq, *rn;
> >> +       struct llist_node *first;
> >> +
> >> +       first = llist_del_all(&gt->watchdog.list);
> >> +       if (!first)
> >> +               return;
> >> +
> >> +       llist_for_each_entry_safe(rq, rn, first, watchdog.link) {
> >> +               if (!i915_request_completed(rq)) {
> >> +                       struct dma_fence *f = &rq->fence;
> >> +
> >> +                       pr_notice("Fence expiration time out i915-%s:%s:%llx!\n",
> >> +                                 f->ops->get_driver_name(f),
> >> +                                 f->ops->get_timeline_name(f),
> >> +                                 f->seqno);
> >> +                       i915_request_cancel(rq, -EINTR);
> >> +               }
> >> +               i915_request_put(rq);
> >> +       }
> >>   }
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> >> index 626af37c7790..d70ebcc6f19f 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> >> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> >> @@ -8,10 +8,12 @@
> >>
> >>   #include <linux/ktime.h>
> >>   #include <linux/list.h>
> >> +#include <linux/llist.h>
> >>   #include <linux/mutex.h>
> >>   #include <linux/notifier.h>
> >>   #include <linux/spinlock.h>
> >>   #include <linux/types.h>
> >> +#include <linux/workqueue.h>
> >>
> >>   #include "uc/intel_uc.h"
> >>
> >> @@ -62,6 +64,11 @@ struct intel_gt {
> >>                  struct delayed_work retire_work;
> >>          } requests;
> >>
> >> +       struct {
> >> +               struct llist_head list;
> >> +               struct work_struct work;
> >> +       } watchdog;
> >> +
> >>          struct intel_wakeref wakeref;
> >>          atomic_t user_wakeref;
> >>
> >> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> >> index b4511ac05e9a..9dd5e588b0a4 100644
> >> --- a/drivers/gpu/drm/i915/i915_request.c
> >> +++ b/drivers/gpu/drm/i915/i915_request.c
> >> @@ -277,6 +277,57 @@ static void remove_from_engine(struct i915_request *rq)
> >>          __notify_execute_cb_imm(rq);
> >>   }
> >>
> >> +static void __rq_init_watchdog(struct i915_request *rq)
> >> +{
> >> +       rq->watchdog.timer.function = NULL;
> >> +}
> >> +
> >> +static enum hrtimer_restart __rq_watchdog_expired(struct hrtimer *hrtimer)
> >> +{
> >> +       struct i915_request *rq =
> >> +               container_of(hrtimer, struct i915_request, watchdog.timer);
> >> +       struct intel_gt *gt = rq->engine->gt;
> >> +
> >> +       if (!i915_request_completed(rq)) {
> >> +               if (llist_add(&rq->watchdog.link, &gt->watchdog.list))
> >> +                       schedule_work(&gt->watchdog.work);
> >> +       } else {
> >> +               i915_request_put(rq);
> >> +       }
> >> +
> >> +       return HRTIMER_NORESTART;
> >> +}
> >> +
> >> +static void __rq_arm_watchdog(struct i915_request *rq)
> >> +{
> >> +       struct i915_request_watchdog *wdg = &rq->watchdog;
> >> +       struct intel_context *ce = rq->context;
> >> +
> >> +       if (!ce->watchdog.timeout_us)
> >> +               return;
> >> +
> >> +       hrtimer_init(&wdg->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> >> +       wdg->timer.function = __rq_watchdog_expired;
> >> +       hrtimer_start_range_ns(&wdg->timer,
> >> +                              ns_to_ktime(ce->watchdog.timeout_us *
> >> +                                          NSEC_PER_USEC),
> >> +                               /*
> >> +                                * FIXME check if it gives the "not sooner"
> >> +                                * guarantee or slack is both ways
> >> +                                */
> >
> > It looks like the slack/fuzziness just delays the timer, in case it
> > can coalesce multiple timer events. So shouldn't be sooner I think?
>
> I couldn't quickly figure it out when I looked at the implementation so
> I left this comment. But it was only relevant at a time I thought we
> would be exposing context param to allow userspace control. With the
> only user being default expiry which is not sensitive to precision or
> accuracy, I simply need to remove this comment.
>
> >
> >> +                               NSEC_PER_MSEC,
> >
> > Formatting.
>
> Which part? I think indentation/alignment is correct.

@@ -311,11 +311,11 @@ static void __rq_arm_watchdog(struct i915_request *rq)
        hrtimer_start_range_ns(&wdg->timer,
                               ns_to_ktime(ce->watchdog.timeout_us *
                                           NSEC_PER_USEC),
-                               /*
-                                * FIXME check if it gives the "not sooner"
-                                * guarantee or slack is both ways
-                                */
-                               NSEC_PER_MSEC,
+                              /*
+                               * FIXME check if it gives the "not sooner"
+                               * guarantee or slack is both ways
+                               */
+                              NSEC_PER_MSEC,
                               HRTIMER_MODE_REL);
        i915_request_get(rq);
 }


>
> >
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >
>
> Thanks,
>
> Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
