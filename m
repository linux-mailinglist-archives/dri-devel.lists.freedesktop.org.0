Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F53EF0C6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 19:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837D76E202;
	Tue, 17 Aug 2021 17:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4D56E202
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 17:20:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x10so23426296wrt.8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vPcW8PVPJT19OPvg7H6OsnarR+yBlfAiVXGFRAFEDX4=;
 b=lsGln9MuT3/qg9/Y1LBRPhXluyULhY/skkISubLBfrVYWF3uWYPnJ1VdLiweVhJd9I
 i9otmvXnBcNRlq4v57cnPuyGlDey7Jx2o0xsoKeepYep6Kfr1gabLev0ctbvJMhhgPy4
 lsJWyPimk9eXfzHKqIGKOh/Mrqmcdnm0W0KWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vPcW8PVPJT19OPvg7H6OsnarR+yBlfAiVXGFRAFEDX4=;
 b=j0n/1q6gD16bOozEDM0iblbRucIqi6K81nFS5fiZJXcP4FRRnfIyqupgonh0S+nNHj
 DZEsvYpW33AJw3S6FkLdK4aCmVoYF53r60kPO6XopmzWwJUobVDPf9YTrr8LAerhSNEy
 Y83r7gUsP6Ra/LXmbg4vmceUsiRkYe4PRAkh0LCMMqa6oMaSQpLteGDhGa/E9keC1/F6
 968ilH3fcivk3AdY2yj+BKFBJQiz39owh3X7g6wFdyQZhJOEyItkJBnhOP8Pha1exVUC
 Trhzq/Hw90nlyPcSvjmlliUtFxjFt0gVU/9eZhgPhCoqlDydAiP35xr6lk3+11Xz9cev
 XbNw==
X-Gm-Message-State: AOAM533CyO4daXI4bvSZd/vov3nd/wJbzmO30uN5M51x4Cxq9sVPZ9yS
 RkY9sQuWxEcQH0ieQiG0NDPYgA==
X-Google-Smtp-Source: ABdhPJxFnUVVdpYfzHrds59/SgFfmQJqD7sfWBwerzfOUwujAC1DKW7lE+xQOcPTJYCEJITUntMeWw==
X-Received: by 2002:a05:6000:9:: with SMTP id h9mr5828530wrx.396.1629220832191; 
 Tue, 17 Aug 2021 10:20:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w1sm2628396wmc.19.2021.08.17.10.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 10:20:31 -0700 (PDT)
Date: Tue, 17 Aug 2021 19:20:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
Subject: Re: [PATCH 22/22] drm/i915/guc: Add GuC kernel doc
Message-ID: <YRvv3Sbihp5ogz2u@phenom.ffwll.local>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-23-matthew.brost@intel.com>
 <YRuZbTJmeUAElOZj@phenom.ffwll.local>
 <20210817163647.GA30445@jons-linux-dev-box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817163647.GA30445@jons-linux-dev-box>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Tue, Aug 17, 2021 at 09:36:49AM -0700, Matthew Brost wrote:
> On Tue, Aug 17, 2021 at 01:11:41PM +0200, Daniel Vetter wrote:
> > On Mon, Aug 16, 2021 at 06:51:39AM -0700, Matthew Brost wrote:
> > > Add GuC kernel doc for all structures added thus far for GuC submission
> > > and update the main GuC submission section with the new interface
> > > details.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > There's quite a bit more, e.g. intel_guc_ct, which has it's own world of
> > locking design that also doesn't feel too consistent.
> >
> 
> That is a different layer than GuC submission so I don't we should
> mention anything about that layer here. Didn't really write that layer
> and it super painful to touch that code so I'm going to stay out of any
> rework you think we need to do there. 

Well there's three locks there plus it leaks out (you have your
outstanding_submission_g2h atomic_t which is very closed tied to well,
outstanding guc transmissions), so I guess I need someone else for that?

> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_context_types.h |  42 +++++---
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  19 +++-
> > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 101 ++++++++++++++----
> > >  drivers/gpu/drm/i915/i915_request.h           |  18 ++--
> > >  4 files changed, 131 insertions(+), 49 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > index f6989e6807f7..75d609a1bc33 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > @@ -156,44 +156,56 @@ struct intel_context {
> > >  	u8 wa_bb_page; /* if set, page num reserved for context workarounds */
> > >  
> > >  	struct {
> > > -		/** lock: protects everything in guc_state */
> > > +		/** @lock: protects everything in guc_state */
> > >  		spinlock_t lock;
> > >  		/**
> > > -		 * sched_state: scheduling state of this context using GuC
> > > +		 * @sched_state: scheduling state of this context using GuC
> > >  		 * submission
> > >  		 */
> > >  		u32 sched_state;
> > >  		/*
> > > -		 * fences: maintains of list of requests that have a submit
> > > -		 * fence related to GuC submission
> > > +		 * @fences: maintains a list of requests are currently being
> > > +		 * fenced until a GuC operation completes
> > >  		 */
> > >  		struct list_head fences;
> > > -		/* GuC context blocked fence */
> > > +		/**
> > > +		 * @blocked_fence: fence used to signal when the blocking of a
> > > +		 * contexts submissions is complete.
> > > +		 */
> > >  		struct i915_sw_fence blocked_fence;
> > > -		/* GuC committed requests */
> > > +		/** @number_committed_requests: number of committed requests */
> > >  		int number_committed_requests;
> > >  	} guc_state;
> > >  
> > >  	struct {
> > > -		/** lock: protects everything in guc_active */
> > > +		/** @lock: protects everything in guc_active */
> > >  		spinlock_t lock;
> > 
> > Why do we have two locks spinlocks to protect guc context state?
> > 
> > I do understand the need for a spinlock (at least for now) because of how
> > i915-scheduler runs in tasklet context. But beyond that we really
> > shouldn't need more than two locks to protect context state. You still
> > have an entire pile here, plus some atomics, plus more.
> >
> 
> Yea I actually thought about this after I sent to out, guc_active &
> guc_state should be combined into a single lock. Originally I had two
> different locks because of old hierarchy this is no longer needed. Can
> fix.
>  
> > And this is on a single context, where concurrently submitting stuff
> > really isn't a thing. I'd expect actual benchmarking would show a perf
> > hit, since all these locks and atomics aren't free. This is at least the
> > case with execbuf and the various i915_vma locks we currently have.
> > 
> > What I expect intel_context locking to be is roughly:
> > 
> > - One lock to protect all intel_context state. This probably should be a
> >   dma_resv_lock for a few reasons, least so we can pin state objects
> >   underneath that lock.
> > 
> > - A separate lock if there's anything you need to coordinate with the
> >   backend scheduler while that's running, to avoid dma_fence inversions.
> >   Right now this separate lock might need to be a spinlock because our
> >   scheduler runs in tasklets, and that might mean we need both a mutex and
> >   a spinlock here.
> >
> > Anything that goes beyond that is premature optimization and kills us code
> > complexity vise. I'd be _extremely_ surprised if an IA core cannot keep up
> > with GuC, and therefore anything that goes beyond "one lock per object",
> > plus/minus execution context issues like the above tasklet issue, is
> > likely just going to slow everything down.
> 
> If I combine the above spin lock, isn't that basically what we have one
> lock for the context state as it relates to GuC submission?
> 
> Also thinking when we move to DRM scheduler we likely can get rid of all
> the atomic contexts in the GuC submission backend.
> 
> > 
> > > -		/** requests: active requests on this context */
> > > +		/** @requests: list of active requests on this context */
> > >  		struct list_head requests;
> > > -		/*
> > > -		 * GuC priority management
> > > -		 */
> > > +		/** @guc_prio: the contexts current guc priority */
> > >  		u8 guc_prio;
> > > +		/**
> > > +		 * @guc_prio_count: a counter of the number requests inflight in
> > > +		 * each priority bucket
> > > +		 */
> > >  		u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
> > >  	} guc_active;
> > >  
> > > -	/* GuC LRC descriptor ID */
> > > +	/**
> > > +	 * @guc_id: unique handle which is used to communicate information with
> > > +	 * the GuC about this context, protected by guc->contexts_lock
> > > +	 */
> > >  	u16 guc_id;
> > >  
> > > -	/* GuC LRC descriptor reference count */
> > > +	/**
> > > +	 * @guc_id_ref: the number of references to the guc_id, when
> > > +	 * transitioning in and out of zero protected by guc->contexts_lock
> > > +	 */
> > >  	atomic_t guc_id_ref;
> > 
> > All this guc_id related stuff (including the guc->context_lookup xarray I
> > guess) also has quite a pile of atomics and locks.
> >
> > >  
> > > -	/*
> > > -	 * GuC ID link - in list when unpinned but guc_id still valid in GuC
> > > +	/**
> > > +	 * @guc_id_link: in guc->guc_id_list when the guc_id has no refs but is
> > > +	 * still valid, protected by guc->contexts_lock
> > >  	 */
> > >  	struct list_head guc_id_link;
> > >  
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > index 2e27fe59786b..c0b3fdb601f0 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > @@ -41,6 +41,10 @@ struct intel_guc {
> > >  	spinlock_t irq_lock;
> > >  	unsigned int msg_enabled_mask;
> > >  
> > > +	/**
> > > +	 * @outstanding_submission_g2h: number of outstanding G2H related to GuC
> > > +	 * submission, used to determine if the GT is idle
> > > +	 */
> > >  	atomic_t outstanding_submission_g2h;
> > 
> > atomic_t is good for statistcs, but not for code flow control. If you use
> > if for that you either need a lot of barriers and comments, which means
> > there needs to be some real perf numbers showing that this is required in
> > a workload we care about.
> 
> This is kinda stat too, it is connected to debugfs and typically is
> non-zero if something has gone horribly wrong (e.g. you lose a G2H).
> Confused about the flow control comment, this basically it just sayings
> the GT isn't idle if the GuC is processing messages and we expect a G2H
> response. A counter here makes sense to me and don't see why we'd need
> barriorr for this.

Yeah but if you actually use it in the code (which I thought you do), and
not just for debugfs stats, then you have control flow that depends upon
this counter. Which means you need memory barriers, or that stuff will be
unordered against other code that's running.

> > Or you stuff this into a related lock. E.g. from high-level view stuff
> > this into intel_guc_ct (which also has definitely way more locks than it
> > needs) could make sense?
> > 
> 
> I had it in that layer at one point but got push back, thus it lives
> here now. The way it is used now it probably makes sense to keep it
> here.

Hm can you dig out that push back? Often when locking rolls in it makes it
pretty clear that the layering needs to be rethought. Not changing that
code because it's written already or something like that, and then working
that suboptimal locking in your area isn't great. Minimally we need a plan
(like we have one for drm/scheduler for the frontend stuff) and someone
who'll do it.
-Daniel

> 
> > >  
> > >  	struct {
> > > @@ -49,12 +53,16 @@ struct intel_guc {
> > >  		void (*disable)(struct intel_guc *guc);
> > >  	} interrupts;
> > >  
> > > -	/*
> > > -	 * contexts_lock protects the pool of free guc ids and a linked list of
> > > -	 * guc ids available to be stolen
> > > +	/**
> > > +	 * @contexts_lock: protects guc_ids, guc_id_list, ce->guc_id, and
> > > +	 * ce->guc_id_ref when transitioning in and out of zero
> > >  	 */
> > >  	spinlock_t contexts_lock;
> > > +	/** @guc_ids: used to allocate new guc_ids */
> > >  	struct ida guc_ids;
> > > +	/**
> > > +	 * @guc_id_list: list of intel_context with valid guc_ids but no refs
> > > +	 */
> > >  	struct list_head guc_id_list;
> > >  
> > >  	bool submission_supported;
> > > @@ -70,7 +78,10 @@ struct intel_guc {
> > >  	struct i915_vma *lrc_desc_pool;
> > >  	void *lrc_desc_pool_vaddr;
> > >  
> > > -	/* guc_id to intel_context lookup */
> > > +	/**
> > > +	 * @context_lookup: used to intel_context from guc_id, if a context is
> > > +	 * present in this structure it is registered with the GuC
> > > +	 */
> > >  	struct xarray context_lookup;
> > >  
> > >  	/* Control params for fw initialization */
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index eb06a4c7534e..18ef363c6e5d 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -28,21 +28,6 @@
> > >  /**
> > >   * DOC: GuC-based command submission
> > >   *
> > > - * IMPORTANT NOTE: GuC submission is currently not supported in i915. The GuC
> > > - * firmware is moving to an updated submission interface and we plan to
> > > - * turn submission back on when that lands. The below documentation (and related
> > > - * code) matches the old submission model and will be updated as part of the
> > > - * upgrade to the new flow.
> > > - *
> > > - * GuC stage descriptor:
> > > - * During initialization, the driver allocates a static pool of 1024 such
> > > - * descriptors, and shares them with the GuC. Currently, we only use one
> > > - * descriptor. This stage descriptor lets the GuC know about the workqueue and
> > > - * process descriptor. Theoretically, it also lets the GuC know about our HW
> > > - * contexts (context ID, etc...), but we actually employ a kind of submission
> > > - * where the GuC uses the LRCA sent via the work item instead. This is called
> > > - * a "proxy" submission.
> > > - *
> > >   * The Scratch registers:
> > >   * There are 16 MMIO-based registers start from 0xC180. The kernel driver writes
> > >   * a value to the action register (SOFT_SCRATCH_0) along with any data. It then
> > > @@ -51,14 +36,86 @@
> > >   * processes the request. The kernel driver polls waiting for this update and
> > >   * then proceeds.
> > >   *
> > > - * Work Items:
> > > - * There are several types of work items that the host may place into a
> > > - * workqueue, each with its own requirements and limitations. Currently only
> > > - * WQ_TYPE_INORDER is needed to support legacy submission via GuC, which
> > > - * represents in-order queue. The kernel driver packs ring tail pointer and an
> > > - * ELSP context descriptor dword into Work Item.
> > > - * See guc_add_request()
> > > + * Command Transport buffers (CTBs):
> > > + * Covered in detail in other sections but CTBs (host-to-guc, H2G, guc-to-host
> > > + * G2H) are a message interface between the i915 and GuC used to controls
> > > + * submissions.
> > > + *
> > > + * Context registration:
> > > + * Before a context can be submitted it must be registered with the GuC via a
> > > + * H2G. A unique guc_id is associated with each context. The context is either
> > > + * registered at request creation time (normal operation) or at submission time
> > > + * (abnormal operation, e.g. after a reset).
> > > + *
> > > + * Context submission:
> > > + * The i915 updates the LRC tail value in memory. Either a schedule enable H2G
> > > + * or context submit H2G is used to submit a context.
> > > + *
> > > + * Context unpin:
> > > + * To unpin a context a H2G is used to disable scheduling and when the
> > > + * corresponding G2H returns indicating the scheduling disable operation has
> > > + * completed it is safe to unpin the context. While a disable is in flight it
> > > + * isn't safe to resubmit the context so a fence is used to stall all future
> > > + * requests until the G2H is returned.
> > > + *
> > > + * Context deregistration:
> > > + * Before a context can be destroyed or we steal its guc_id we must deregister
> > > + * the context with the GuC via H2G. If stealing the guc_id it isn't safe to
> > > + * submit anything to this guc_id until the deregister completes so a fence is
> > > + * used to stall all requests associated with this guc_ids until the
> > > + * corresponding G2H returns indicating the guc_id has been deregistered.
> > > + *
> > > + * guc_ids:
> > > + * Unique number associated with private GuC context data passed in during
> > > + * context registration / submission / deregistration. 64k available. Simple ida
> > > + * is used for allocation.
> > > + *
> > > + * Stealing guc_ids:
> > > + * If no guc_ids are available they can be stolen from another context at
> > > + * request creation time if that context is unpinned. If a guc_id can't be found
> > > + * we punt this problem to the user as we believe this is near impossible to hit
> > > + * during normal use cases.
> > > + *
> > > + * Locking:
> > > + * In the GuC submission code we have 4 basic spin locks which protect
> > > + * everything. Details about each below.
> > > + *
> > > + * sched_engine->lock
> > > + * This is the submission lock for all contexts that share a i915 schedule
> > > + * engine (sched_engine), thus only 1 context which share a sched_engine can be
> > > + * submitting at a time. Currently only 1 sched_engine used for all of GuC
> > > + * submission but that could change in the future.
> > 
> > There's at least 3 more spinlocks for intel_guc_ct ...
> > 
> 
> Different layer that I'd like to stay out of.
> 
> > > + *
> > > + * guc->contexts_lock
> > > + * Protects guc_id allocation. Global lock i.e. Only 1 context that uses GuC
> > > + * submission can hold this at a time.
> > 
> > Plus you forgot the spinlock of the xarrray, which is also used in the
> > code with this patch set, not just internally in the xarray, so we have to
> > think about that one too.
> >
> > Iow still way too many locks.
> >
> 
> Well we can delete one pretty easily, that's something, right?
> 
> > > + *
> > > + * ce->guc_state.lock
> > > + * Protects everything under ce->guc_state. Ensures that a context is in the
> > > + * correct state before issuing a H2G. e.g. We don't issue a schedule disable
> > > + * on disabled context (bad idea), we don't issue schedule enable when a
> > > + * schedule disable is inflight, etc... Lock individual to each context.
> > > + *
> > > + * ce->guc_active.lock
> > > + * Protects everything under ce->guc_active which is the current requests
> > > + * inflight on the context / priority management. Lock individual to each
> > > + * context.
> > > + *
> > > + * Lock ordering rules:
> > > + * sched_engine->lock -> ce->guc_active.lock
> > > + * sched_engine->lock -> ce->guc_state.lock
> > > + * guc->contexts_lock -> ce->guc_state.lock
> > >   *
> > > + * Reset races:
> > > + * When a GPU full reset is triggered it is assumed that some G2H responses to
> > > + * a H2G can be lost as the GuC is likely toast. Losing these G2H can prove to
> > > + * fatal as we do certain operations upon receiving a G2H (e.g. destroy
> > > + * contexts, release guc_ids, etc...). Luckly when this occurs we can scrub
> > > + * context state and cleanup appropriately, however this is quite racey. To
> > > + * avoid races the rules are check for submission being disabled (i.e. check for
> > > + * mid reset) with the appropriate lock being held. If submission is disabled
> > > + * don't send the H2G or update the context state. The reset code must disable
> > > + * submission and grab all these locks before scrubbing for the missing G2H.
> > 
> > Can we make this all a lot less racy? Instead of a huge state machinery
> > can't we just do all that under a context look, i.e.
> > 
> 
> Well can't sleep inside the context lock so confused by this suggestion.
> 
> > 1. take context lock
> > 2. send guc message that is tricky, like register or deregister or
> > whatever
> 
> A schedule enable is tricky too and that can be sent from the submission
> path.
> 
> > 3. wait for that reply, our context is blocked anyway, no harm holding a
> 
> We don't need to block while a schedule enable is in flight. Also we
> only block the submissions while the other messages are in flight, we
> are allowed continuing working on the context (e.g. we can generate a
> prep another request while the operation is inflight).
> 
> > lock, other contexts can keep processing
> > 4. the lower-level guc_ct code guarantees that we either get the reply, or
> 
> Again don't really want to touch the guc_ct code.
> 
> > a -ERESET or whatever indicating that we raced with a reset, in which case
> > we can just restart whatever it is we wanted to do (or for deregister, do
> > nothing since the guc reset has solved that problem)
> 
> You'd still have to have a list of waiters which get woke on a reset
> too. Not all the convinced this would simplier that checking if a reset
> is in flight within a lock.
> 
> > 5. unlock
> > 
> > Massively lockless state machines are cool, but also very hard to maintain
> > and keep correct.
> 
> Not saying we can't try to make this simplier over time but a huge
> structural change at this point is way more likely to break things than
> cleaning up what we have in place.
> 
> Matt
> 
> > -Daniel
> > 
> > >   */
> > >  
> > >  /* GuC Virtual Engine */
> > > diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> > > index d818cfbfc41d..177eaf55adff 100644
> > > --- a/drivers/gpu/drm/i915/i915_request.h
> > > +++ b/drivers/gpu/drm/i915/i915_request.h
> > > @@ -290,18 +290,20 @@ struct i915_request {
> > >  		struct hrtimer timer;
> > >  	} watchdog;
> > >  
> > > -	/*
> > > -	 * Requests may need to be stalled when using GuC submission waiting for
> > > -	 * certain GuC operations to complete. If that is the case, stalled
> > > -	 * requests are added to a per context list of stalled requests. The
> > > -	 * below list_head is the link in that list.
> > > +	/**
> > > +	 * @guc_fence_link: Requests may need to be stalled when using GuC
> > > +	 * submission waiting for certain GuC operations to complete. If that is
> > > +	 * the case, stalled requests are added to a per context list of stalled
> > > +	 * requests. The below list_head is the link in that list. Protected by
> > > +	 * ce->guc_state.lock.
> > >  	 */
> > >  	struct list_head guc_fence_link;
> > >  
> > >  	/**
> > > -	 * Priority level while the request is inflight. Differs from i915
> > > -	 * scheduler priority. See comment above
> > > -	 * I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP for details.
> > > +	 * @guc_prio: Priority level while the request is inflight. Differs from
> > > +	 * i915 scheduler priority. See comment above
> > > +	 * I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP for details. Protected by
> > > +	 * ce->guc_active.lock.
> > >  	 */
> > >  #define	GUC_PRIO_INIT	0xff
> > >  #define	GUC_PRIO_FINI	0xfe
> > > -- 
> > > 2.32.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
