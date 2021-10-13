Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D217D42BF5D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 14:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42E16EA38;
	Wed, 13 Oct 2021 12:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130066EA38
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 12:01:14 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r7so7489678wrc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 05:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=83GlrM0GmTfXiyy+tSqTAyPrGLPmHSWe1+2rXA4Jtwg=;
 b=JzKcgamrJMvjEb9yf9kqNBjN8yoQ/7hVrpLAEmNNv6Adu5EPuqA1cwZFRL6a9xG0Aw
 /C6mp1T62+QKote8JAMRyHMVd466/s+PCT+mn0VQ40dCPzroa0aIBo4Yc1gRFyBvWoIJ
 pUnR/dB4iaZyfIuMnNmQJK6XbkP6OZwdxjNpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=83GlrM0GmTfXiyy+tSqTAyPrGLPmHSWe1+2rXA4Jtwg=;
 b=q9UhRIBzK3HyikODeZpk/va5CX3EcUgj2GZuZMQdV+gDCdHblze5iYT9XjmVSB+nvV
 HgSAHYUgS0dDt3Yz2yKEtwJfaQVQffm6qFkt/tVA21ijXkTWsA70yQ/ZDLeqjnMl/PmI
 Qid8sQL55vdMecZX4z+Wr0aHgt1IO5Thx9joazNYyjebgIT0xf93CPnr0utC41Lt/PVo
 4A2yWhRApgCrGsDKXrPXw0bj9trlyEM4ekR3TG5+235m4Eb8E6yWAsBiOM0Gl1qMgZjo
 5dhRzHqsan/r6cNHeUNtZfbNmqaQyQ4cE518bvEWn6MwwPHEMXWGZrr+I/IgiymiNx2P
 nHbw==
X-Gm-Message-State: AOAM530eJ4dbx/81we7u0JVOQSjNiK9QX5pAD59fsL8VluSihI0w+F/1
 5zdv+eijcSI19wleIOhc7m38bA==
X-Google-Smtp-Source: ABdhPJwyqVkRiU4sBXuqn/8zq409gnEYPGHZ6QIzUE+OIcDSLCZPzuQx3kGfMEpu2hWEGCxoJ2eMbA==
X-Received: by 2002:a5d:6d05:: with SMTP id e5mr23777088wrq.300.1634126472394; 
 Wed, 13 Oct 2021 05:01:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s13sm5330785wmc.47.2021.10.13.05.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:01:11 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:01:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [RFC 6/8] drm/i915: Make some recently added vfuncs
 use full scheduling attribute
Message-ID: <YWbKhu0IQ4hsr5w7@phenom.ffwll.local>
Mail-Followup-To: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
 <20211004143650.699120-7-tvrtko.ursulin@linux.intel.com>
 <20211006171228.GA7906@jons-linux-dev-box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006171228.GA7906@jons-linux-dev-box>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 06, 2021 at 10:12:29AM -0700, Matthew Brost wrote:
> On Mon, Oct 04, 2021 at 03:36:48PM +0100, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Code added in 71ed60112d5d ("drm/i915: Add kick_backend function to
> > i915_sched_engine") and ee242ca704d3 ("drm/i915/guc: Implement GuC
> > priority management") introduced some scheduling related vfuncs which
> > take integer request priority as argument.
> > 
> > Make them instead take struct i915_sched_attr, which is the type
> > encapsulating this information, so it probably aligns with the design
> > better. It definitely enables extending the set of scheduling attributes.
> > 
> 
> Understand the motivation here but the i915_scheduler is going to
> disapear when we move to the DRM scheduler or at least its functionality
> of priority inheritance will be pushed into the DRM scheduler. I'd be
> very careful making any changes here as the priority in the DRM
> scheduler is defined as single enum:

Yeah I'm not sure it makes sense to build this and make the conversion to
drm/sched even harder. We've already merged a lot of code with a "we'll
totally convert to drm/sched right after" promise, there's not really room
for more fun like this built on top of i915-scheduler.
-Daniel

> 
> /* These are often used as an (initial) index
>  * to an array, and as such should start at 0.
>  */
> enum drm_sched_priority {
>         DRM_SCHED_PRIORITY_MIN,
>         DRM_SCHED_PRIORITY_NORMAL,
>         DRM_SCHED_PRIORITY_HIGH,
>         DRM_SCHED_PRIORITY_KERNEL,
> 
>         DRM_SCHED_PRIORITY_COUNT,
>         DRM_SCHED_PRIORITY_UNSET = -2
> };
> 
> Adding a field to the i915_sched_attr is fairly easy as we already have
> a structure but changing the DRM scheduler might be a tougher sell.
> Anyway you can make this work without adding the 'nice' field to
> i915_sched_attr? Might be worth exploring so when we move to the DRM
> scheduler this feature drops in a little cleaner.
> 
> Matt
> 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 4 +++-
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    | 3 ++-
> >  drivers/gpu/drm/i915/i915_scheduler.c                | 4 ++--
> >  drivers/gpu/drm/i915/i915_scheduler_types.h          | 4 ++--
> >  4 files changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > index 7147fe80919e..e91d803a6453 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -3216,11 +3216,13 @@ static bool can_preempt(struct intel_engine_cs *engine)
> >  	return engine->class != RENDER_CLASS;
> >  }
> >  
> > -static void kick_execlists(const struct i915_request *rq, int prio)
> > +static void kick_execlists(const struct i915_request *rq,
> > +			   const struct i915_sched_attr *attr)
> >  {
> >  	struct intel_engine_cs *engine = rq->engine;
> >  	struct i915_sched_engine *sched_engine = engine->sched_engine;
> >  	const struct i915_request *inflight;
> > +	const int prio = attr->priority;
> >  
> >  	/*
> >  	 * We only need to kick the tasklet once for the high priority
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index ba0de35f6323..b5883a4365ca 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -2414,9 +2414,10 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
> >  }
> >  
> >  static void guc_bump_inflight_request_prio(struct i915_request *rq,
> > -					   int prio)
> > +					   const struct i915_sched_attr *attr)
> >  {
> >  	struct intel_context *ce = rq->context;
> > +	const int prio = attr->priority;
> >  	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
> >  
> >  	/* Short circuit function */
> > diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
> > index 762127dd56c5..534bab99fcdc 100644
> > --- a/drivers/gpu/drm/i915/i915_scheduler.c
> > +++ b/drivers/gpu/drm/i915/i915_scheduler.c
> > @@ -255,7 +255,7 @@ static void __i915_schedule(struct i915_sched_node *node,
> >  
> >  		/* Must be called before changing the nodes priority */
> >  		if (sched_engine->bump_inflight_request_prio)
> > -			sched_engine->bump_inflight_request_prio(from, prio);
> > +			sched_engine->bump_inflight_request_prio(from, attr);
> >  
> >  		WRITE_ONCE(node->attr.priority, prio);
> >  
> > @@ -280,7 +280,7 @@ static void __i915_schedule(struct i915_sched_node *node,
> >  
> >  		/* Defer (tasklet) submission until after all of our updates. */
> >  		if (sched_engine->kick_backend)
> > -			sched_engine->kick_backend(node_to_request(node), prio);
> > +			sched_engine->kick_backend(node_to_request(node), attr);
> >  	}
> >  
> >  	spin_unlock(&sched_engine->lock);
> > diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
> > index b0a1b58c7893..24b9ac1c2ce2 100644
> > --- a/drivers/gpu/drm/i915/i915_scheduler_types.h
> > +++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
> > @@ -177,13 +177,13 @@ struct i915_sched_engine {
> >  	 * @kick_backend: kick backend after a request's priority has changed
> >  	 */
> >  	void	(*kick_backend)(const struct i915_request *rq,
> > -				int prio);
> > +				const struct i915_sched_attr *attr);
> >  
> >  	/**
> >  	 * @bump_inflight_request_prio: update priority of an inflight request
> >  	 */
> >  	void	(*bump_inflight_request_prio)(struct i915_request *rq,
> > -					      int prio);
> > +					      const struct i915_sched_attr *attr);
> >  
> >  	/**
> >  	 * @retire_inflight_request_prio: indicate request is retired to
> > -- 
> > 2.30.2
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
