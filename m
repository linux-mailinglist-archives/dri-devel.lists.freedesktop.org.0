Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B3F39BFA2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 20:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2636F899;
	Fri,  4 Jun 2021 18:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1D86F897
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 18:31:54 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id b13so14979840ybk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 11:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=72ds9/XQMWTp9NqjcEMsN1fK43XfOFqWDvWzjSJ7jys=;
 b=BHlUQYapK9VASu5c9kuFeSknwmDTQINEOff/7qre8G1DRD+bNAqxG7Vd3K1OAbslfF
 3bxSesjrH4NdZFy+FnZ7+4L6+AltXbv8jpQ3skqY3+rODqkRQH7M1VOb7YkciZEGpR6M
 n5Q2E0SAHDIR4cNogJxeaSH4OVqJOBvh4TvjHCYpjfzUCU1XP6eloL4soyX7CwODvdS7
 wXOtTl/WatcPYF78WS9cNHkIAbC3ZYaYMrkt9cpiqc7GB4nAaS1zROjvxb6eGyPA9MxS
 hO3Mv/dXk9aaznnlRwQKktxcfTr8xLOsvX2/7rp2NjsfQYXUPABikIEmntWuY4kKdns3
 UqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=72ds9/XQMWTp9NqjcEMsN1fK43XfOFqWDvWzjSJ7jys=;
 b=oD3tisO4yQ5Nd8t7mjaKYNBdH/5QEC1Y8FgzZ5bCtsJ6xNGlCkBuHbqrdbtzkRUDMp
 bKWpbqpoFJt9jpI6gOW53xD0/iV7p0G0ju7djDyrjt5qS/+vSSNsjhZVPX2v3bZgTnRV
 mO385h5KcKXv/2iiNQMgS02ed5g3+x+Yhl9+CY80L33nRL8LzawuLUo6WmXHGNi0VM2f
 um5uc5rPNLM+REqC3ryvUHn7PAwDTpDJpdcqU4aC+cNdXAxN2ejEXWLcS6eT2CCvIvYF
 Aymp/Ln/4fwonFyu6mtzsM1jevBcDYeZlMtzYcHrAGGXnjSXkI0gYPwngYXo2I3R/L8Q
 Kfkg==
X-Gm-Message-State: AOAM5339PpphDMR1FKM5Nw/wx70GVKnx1cFdUpfqD6334sBhR2ZmzbM2
 W7eWO3XY4imo0TOh/il/XUq4ooZyah9oHoT+FX3bf97eu+hw7Q==
X-Google-Smtp-Source: ABdhPJzGqVcj8ezF2JzuacdpLarjAVQnu5e6NCCLljz7V9jYrbvVzh/cX51DFezor2Izq+qKJ1wdF20m0hKUIBhUqzw=
X-Received: by 2002:a25:81c5:: with SMTP id n5mr7283571ybm.323.1622831513109; 
 Fri, 04 Jun 2021 11:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210603212722.59719-1-matthew.brost@intel.com>
 <20210603212722.59719-4-matthew.brost@intel.com>
In-Reply-To: <20210603212722.59719-4-matthew.brost@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 4 Jun 2021 13:31:42 -0500
Message-ID: <CAOFGe95CkXy03G5oDEHBLHB2XNbLc2K_Uxx-rdW=Cg9RsKrYWA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/9] drm/i915: Add
 i915_sched_engine_reset_on_empty function
To: Matthew Brost <matthew.brost@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 4:09 PM Matthew Brost <matthew.brost@intel.com> wrote:
>
> Rather than touching schedule state in the generic PM code, reset the
> priolist allocation when empty in the submission code. Add a wrapper
> function to do this and update the backends to call it in the correct
> place.

Seems reasonable, I think.  I'm by no means an expert but

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

anyway.  My one suggestion would be to tweak the commit message to
talk about the functional change rather than the helper.  Something
like

drm/i915: Reset sched_engine.no_priolist immediately after dequeue

Typically patches which say "add a helper function" don't come with a
non-trivial functional change.

--Jason


> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c            | 2 --
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 1 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    | 2 ++
>  drivers/gpu/drm/i915/i915_scheduler.h                | 7 +++++++
>  4 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index b6a00dd72808..1f07ac4e0672 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -280,8 +280,6 @@ static int __engine_park(struct intel_wakeref *wf)
>         if (engine->park)
>                 engine->park(engine);
>
> -       engine->sched_engine->no_priolist = false;
> -
>         /* While gt calls i915_vma_parked(), we have to break the lock cycle */
>         intel_gt_pm_put_async(engine->gt);
>         return 0;
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 2326a73af6d3..609753b5401a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -1553,6 +1553,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
>          * interrupt for secondary ports).
>          */
>         sched_engine->queue_priority_hint = queue_prio(sched_engine);
> +       i915_sched_engine_reset_on_empty(sched_engine);
>         spin_unlock(&engine->active.lock);
>
>         /*
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 5d00f2e3c1de..f4a6fbfaf82e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -263,6 +263,8 @@ static void guc_submission_tasklet(struct tasklet_struct *t)
>
>         __guc_dequeue(engine);
>
> +       i915_sched_engine_reset_on_empty(engine->sched_engine);
> +
>         spin_unlock_irqrestore(&engine->active.lock, flags);
>  }
>
> diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
> index 5bec7b3b8456..713c38c99de9 100644
> --- a/drivers/gpu/drm/i915/i915_scheduler.h
> +++ b/drivers/gpu/drm/i915/i915_scheduler.h
> @@ -72,6 +72,13 @@ i915_sched_engine_is_empty(struct i915_sched_engine *sched_engine)
>         return RB_EMPTY_ROOT(&sched_engine->queue.rb_root);
>  }
>
> +static inline void
> +i915_sched_engine_reset_on_empty(struct i915_sched_engine *sched_engine)
> +{
> +       if (i915_sched_engine_is_empty(sched_engine))
> +               sched_engine->no_priolist = false;
> +}
> +
>  void i915_request_show_with_schedule(struct drm_printer *m,
>                                      const struct i915_request *rq,
>                                      const char *prefix,
> --
> 2.28.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
