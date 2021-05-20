Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3308138B7BE
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F012A6F544;
	Thu, 20 May 2021 19:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4346F540
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 19:45:03 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id u133so9860703wmg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3z3F5uN524/Pef3m06UtZNTyI8e8ZcpGhR/27fbU3KY=;
 b=euavBjs4Q1xtKrIQr3MKo7Iz4s7+89FmGjgFvCgDUjr0sLCqPyETUxpmS1T9UuiT8k
 c08pTV+Na3YoAk1t6H8SaHhN0yibdPOujdQ+fhCAH9/wLuF1tLKTwjoDJli688pw+ybG
 RU9bNbgvOhWkiuDYQQlqste9FBDzkGa1s5H/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3z3F5uN524/Pef3m06UtZNTyI8e8ZcpGhR/27fbU3KY=;
 b=BqMQpSNGBj0FrPl1jEVa7M0GtF1O7Jdi6TdjAVnvTvTcbrOU82fDLaVNH71NdiQcb5
 px9gHjmed6c8zydNwZ8b+wdUEstosmRvgmfMV4pzR+tPVPvmbPCm1IzjDG67gfXutgFS
 PRJnpPVdWfYVGLr6Se87lyEe/LEH1qfl8Ao1NZoml0/RoIQI7bNR1KzdA95XsAWPTE6M
 p3bExVjDfHnaXXzLyGXY/Q5LUSRsGJYLgUbptA/LmeijCeYho5e7S1Ymh10Abp2NiQBf
 +ijLYl/RjJgJpOqCWFg0f936MceKTx61PluqHXh7Ygs6FhAjAPBVz6EC0SfN2oNxCz4/
 l8og==
X-Gm-Message-State: AOAM530d+nIEjC9lqLY+wo+9SMwLCU7+h0I+3ruTtC7QVU1VOLm+MVIp
 xPT6yqxA2VBFFsJvgV2SNeUnDw==
X-Google-Smtp-Source: ABdhPJxmTEC0CsOTsHkPdtJA0/cPDRRLysQ4sVimaQdSbNUY/WfHND5NPzqkRShNQ00SGJTwVHi+6w==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr2944537wmc.41.1621539901907; 
 Thu, 20 May 2021 12:45:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s5sm4098951wrw.95.2021.05.20.12.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 12:45:01 -0700 (PDT)
Date: Thu, 20 May 2021 21:44:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC 2/2] drm/doc/rfc: i915 new parallel submission
 uAPI plan
Message-ID: <YKa8O449UWDyS5JJ@phenom.ffwll.local>
References: <20210518235830.133834-1-matthew.brost@intel.com>
 <20210518235830.133834-3-matthew.brost@intel.com>
 <YKTyDNyVgmR3z1H5@phenom.ffwll.local>
 <20210519171157.GA5202@sdutt-i7>
 <CAKMK7uG1qCcpwBFaUf06daY6gnxmNbNcZbBX+Yxb64qZkBMF8g@mail.gmail.com>
 <20210520151059.GA3416@sdutt-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520151059.GA3416@sdutt-i7>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, karl@freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 08:10:59AM -0700, Matthew Brost wrote:
> On Thu, May 20, 2021 at 11:54:25AM +0200, Daniel Vetter wrote:
> > On Wed, May 19, 2021 at 7:19 PM Matthew Brost <matthew.brost@intel.com> wrote:
> > >
> > > On Wed, May 19, 2021 at 01:10:04PM +0200, Daniel Vetter wrote:
> > > > On Tue, May 18, 2021 at 04:58:30PM -0700, Matthew Brost wrote:
> > > > > Add entry fpr i915 new parallel submission uAPI plan.
> > > > >
> > > > > v2:
> > > > >  (Daniel Vetter):
> > > > >   - Expand logical order explaination
> > > > >   - Add dummy header
> > > > >   - Only allow N BBs in execbuf IOCTL
> > > > >   - Configure parallel submission per slot not per gem context
> > > > >
> > > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > Cc: Tony Ye <tony.ye@intel.com>
> > > > > CC: Carl Zhang <carl.zhang@intel.com>
> > > > > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > > > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >  Documentation/gpu/rfc/i915_parallel_execbuf.h | 144 ++++++++++++++++++
> > > > >  Documentation/gpu/rfc/i915_scheduler.rst      |  53 ++++++-
> > > > >  2 files changed, 196 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
> > > > >
> > > > > diff --git a/Documentation/gpu/rfc/i915_parallel_execbuf.h b/Documentation/gpu/rfc/i915_parallel_execbuf.h
> > > > > new file mode 100644
> > > > > index 000000000000..8c64b983ccad
> > > > > --- /dev/null
> > > > > +++ b/Documentation/gpu/rfc/i915_parallel_execbuf.h
> > > > > @@ -0,0 +1,144 @@
> > > > > +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
> > > > > +
> > > > > +/*
> > > > > + * i915_context_engines_parallel_submit:
> > > > > + *
> > > > > + * Setup a slot to allow multiple BBs to be submitted in a single execbuf IOCTL.
> > > > > + * Those BBs will then be scheduled to run on the GPU in parallel. Multiple
> > > > > + * hardware contexts are created internally in the i915 run these BBs. Once a
> > > > > + * slot is configured for N BBs only N BBs can be submitted in each execbuf
> > > > > + * IOCTL and this is implict behavior (e.g. the user doesn't tell the execbuf
> > > > > + * IOCTL there are N BBs, the execbuf IOCTL know how many BBs there are based on
> > > > > + * the slots configuration).
> > > > > + *
> > > > > + * Their are two currently defined ways to control the placement of the
> > > > > + * hardware contexts on physical engines: default behavior (no flags) and
> > > > > + * I915_PARALLEL_IMPLICT_BONDS (a flag). More flags may be added the in the
> > > > > + * future as new hardware / use cases arise. Details of how to use this
> > > > > + * interface below above the flags.
> > > > > + *
> > > > > + * Returns -EINVAL if hardware context placement configuration invalid or if the
> > > > > + * placement configuration isn't supported on the platform / submission
> > > > > + * interface.
> > > > > + * Returns -ENODEV if extension isn't supported on the platform / submission
> > > > > + * inteface.
> > > > > + */
> > > > > +struct i915_context_engines_parallel_submit {
> > > > > +   struct i915_user_extension base;
> > > > > +
> > > > > +   __u16 engine_index;     /* slot for parallel engine */
> > > > > +   __u16 width;            /* number of contexts per parallel engine */
> > > > > +   __u16 num_siblings;     /* number of siblings per context */
> > > > > +   __u16 mbz16;
> > > >
> > > > Ok the big picture looks reasonable now, the flags still confuse me.
> > > >
> > >
> > > Yea, it is a bit confusing.
> > >
> > > > > +/*
> > > > > + * Default placement behvavior (currently unsupported):
> > > > > + *
> > > > > + * Rather than restricting parallel submission to a single class with a
> > > > > + * logically contiguous placement (I915_PARALLEL_IMPLICT_BONDS), add a mode that
> > > > > + * enables parallel submission across multiple engine classes. In this case each
> > > > > + * context's logical engine mask indicates where that context can placed. It is
> > > > > + * implied in this mode that all contexts have mutual exclusive placement (e.g.
> > > > > + * if one context is running CS0 no other contexts can run on CS0).
> > > > > + *
> > > > > + * Example 1 pseudo code:
> > > > > + * CSX[Y] = engine class X, logical instance Y
> > > > > + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> > > > > + * set_engines(INVALID)
> > > > > + * set_parallel(engine_index=0, width=2, num_siblings=2,
> > > > > + *         engines=CS0[0],CS0[1],CS1[0],CS1[1])
> > > > > + *
> > > > > + * Results in the following valid placements:
> > > > > + * CS0[0], CS1[0]
> > > > > + * CS0[0], CS1[1]
> > > > > + * CS0[1], CS1[0]
> > > > > + * CS0[1], CS1[1]
> > > > > + *
> > > > > + * This can also be though of as 2 virtual engines:
> > > > > + * VE[0] = CS0[0], CS0[1]
> > > > > + * VE[1] = CS1[0], CS1[1]
> > > > > + *
> > > > > + * Example 2 pseudo code:
> > > > > + * CS[X] = generic engine of same class, logical instance X
> > > > > + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> > > > > + * set_engines(INVALID)
> > > > > + * set_parallel(engine_index=0, width=2, num_siblings=3,
> > > > > + *         engines=CS[0],CS[1],CS[2],CS[0],CS[1],CS[2])
> > > > > + *
> > > > > + * Results in the following valid placements:
> > > > > + * CS[0], CS[1]
> > > > > + * CS[0], CS[2]
> > > > > + * CS[1], CS[0]
> > > > > + * CS[1], CS[2]
> > > > > + * CS[2], CS[0]
> > > > > + * CS[2], CS[1]
> > > > > + *
> > > > > + *
> > > > > + * This can also be though of as 2 virtual engines:
> > > > > + * VE[0] = CS[0], CS[1], CS[2]
> > > > > + * VE[1] = CS[0], CS[1], CS[2]
> > > > > +
> > > > > + * This enables a use case where all engines are created equally, we don't care
> > > > > + * where they are scheduled, we just want a certain number of resources, for
> > > > > + * those resources to be scheduled in parallel, and possibly across multiple
> > > > > + * engine classes.
> > > > > + */
> > > >
> > > > So I don't really get what this does compared to setting the flag below.
> > > > Is this just about running the batchbuffers the wrong way round, i.e. if
> > > > you have (simplest case)
> > > >
> > > > width=2, num_sibglings=1, engines=CS[0], CS[1]
> > > >
> > > > Then both
> > > > CS[0], CS[1]
> > > > and
> > > > CS[1], CS[0]
> > > > are possible options for running 2 batches? Iow, the backend is allowed to
> > > > run the batchbuffers the wrong way round, which gains us nothing, since we
> > > > assume the batches take equally long and engines interchangeable. There is
> > > > no scheduling scenario where this additional flexibility can help.
> > > >
> > > > Also we don't have flags to select the only available and then specify an
> > > > entire pipe dream about what the non-flag mode does, without an
> > > > implementation. What is this about?
> > > >
> > > > If it's just "because bonded allowed this" then I think we should just
> > > > unceremonously ditch this. Bummer for the nice kerenldoc you wrote, but
> > > > welp.
> > > >
> > >
> > > High level the flags came out of internal discussions how this interface
> > > should look. The default placement behavior is theoretically possible
> > > with execlists but has no use cases. The GuC supports / current use
> > > cases are a subset of what is possible with I915_PARALLEL_IMPLICT_BONDS.
> > >
> > > Argued about for months and this is where we landed. At the end of the
> > > day I think we needed to show that this interface supports more
> > > placement rules than what the GuC supports / current use cases to future
> > > proof this interface.
> > >
> > > For what is it worth it seems kinda backwards that we landed on the
> > > default behavior not being supported in our current stack / HW.
> > 
> > Yeah I think that should be inverted, doesn't make sense.
> > 
> > What I still don't get (and I've read Tvrtko's reply with the example)
> > is what exactly is the difference between implicit and not implicit
> > mode? Can you do a single example where the only difference is whether
> > this flag is set, and then explain with that what are the actual
> > differences in scheduling options that the backend is allowed to pick
> > for the set of N patches?
> > 
> > I'm feeling a bit dense, but I'm really not seeing what's even going on here :-(
> > 
> > > > > +
> > > > > +/*
> > > > > + * I915_PARALLEL_IMPLICT_BONDS - Create implict bonds between each context.
> > > > > + * Each context must have the same number sibling and bonds are implictly create
> > > > > + * of the siblings.
> > > > > + *
> > > > > + * All of the below examples are in logical space.
> > > > > + *
> > > > > + * Example 1 pseudo code:
> > > > > + * CS[X] = generic engine of same class, logical instance X
> > > > > + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> > > > > + * set_engines(INVALID)
> > > > > + * set_parallel(engine_index=0, width=2, num_siblings=1,
> > > > > + *         engines=CS[0],CS[1], flags=I915_PARALLEL_IMPLICT_BONDS)
> > > > > + *
> > > > > + * Results in the following valid placements:
> > > > > + * CS[0], CS[1]
> > > > > + *
> > > > > + * Example 2 pseudo code:
> > > > > + * CS[X] = generic engine of same class, logical instance X
> > > > > + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> > > > > + * set_engines(INVALID)
> > > > > + * set_parallel(engine_index=0, width=2, num_siblings=2,
> > > > > + *         engines=CS[0],CS[2],CS[1],CS[3], flags=I915_PARALLEL_IMPLICT_BONDS)
> > > > > + *
> > > > > + * Results in the following valid placements:
> > > > > + * CS[0], CS[1]
> > > > > + * CS[2], CS[3]
> > > > > + *
> > > > > + * This can also be though of as 2 virtual engines:
> > > > > + * VE[0] = CS[0], CS[2]
> > > > > + * VE[1] = CS[1], CS[3]
> > > > > + *
> > > > > + * This enables a use case where all engines are not equal and certain placement
> > > > > + * rules are required (i.e. split-frame requires all contexts to be placed in a
> > > > > + * logically contiguous order on the VCS engines on gen11+ platforms). This use
> > > > > + * case (logically contiguous placement, within a single engine class) is
> > > > > + * supported when using GuC submission. Execlist mode could support all possible
> > > > > + * bonding configurations but currently doesn't support this extension.
> > > > > + */
> > > > > +#define I915_PARALLEL_IMPLICT_BONDS                        (1<<0)
> > > >
> > > > Does this map to intel_context_set_nopreempt(), so we could implement it
> > > > also in execlist?
> > > >
> > >
> > > intel_context_set_nopreempt is preempt is part of how this would be
> > > implemented for execlists. For GuC submission there is a algorithm
> > > between the i915 and GuC that inserts same preemption points between
> > > each set of N batches. I believe the rules are if context 1 can
> > > preempted the rest of the contexts (2 - N) can safely be preempted. A go
> > > / join algorithm, implemented with semaphores, around the batches
> > > makes sure the i915 adheres to these rules.
> > >
> > > > Also is this just an artifact of the implementation, or is this somehow
> > > > required functionality for userspace, i.e. the workload fails if e.g. GuC
> > > > decides to preempt all LRC of a parallel virtual engine? Of course just
> > > > preempting one is a bit a bug (but execlist I think happily does that).
> > > >
> > >
> > > I think it is part of the implementation / HW limitations. Basically if
> > > N batches are running in parallel if one of the batches gets preempted
> > > it can hang all the other batches even if it gets restarted. Again the
> > > idea behind this is only preempt any of these contexts between each set
> > > of N batches. The GuC has no concept of batches only contexts hence the
> > > aforementioned algorithm to insert same preemption points between each
> > > set of batches.
> > 
> > Well backend preempting one but not the other is a bug. I don't think
> > we need to talk about bugs :-)
> >
> 
> I think it is more that backend can't preempt each context atomically as these
> are running on independent engines. Let say the backend tries to preempt 2
> engines at the same time and only 1 responds, now we are broken with certain
> batches. With the algorithm implmented between the i915 and the Guc the GuC will
> try to preempt the first context if that works, all the other contexts can be
> preempted.

Ah right, we might have a workload with long non-preemptible sections, but
I guess the MI_SEMAPHORE_WAIT can always preempt. So if GuC just tries on
one of these, it will result in tears.

> > Now wrt a preempt mode in context creation, I think that makes sense.
> > I'm just wondering whether this is correct here in the parallel
> > submission (and why), or is it just an implementation artifact
> > (current backends are buggy if we'd allow them to preempt) or what's
> > going on.
> >
> > If this is just a case of "this is how current backends work,
> > userspace doesn't actually care whether we allow preempt or not" then
> > I think we should just document the behavior and that's it. Adding
> > uapi for an option for which there's not even an implementation isn't
> > great.
> > 
> 
> I don't think it is a case of 'this is how current backends work...', I think
> user space knows if it is ok for 1 of the batches to preempted and not the
> others without breaking the batches.

Yeah this makes more sense as an explanation: Currently the backend (guc
or execlist) figure out whether something can be preempted by just trying.
Since we're dealing with N contexts that's a suboptimal approach, and we
need a flag that indicates whether it's worth it or not.

So makes sense to me to have this. I guess userspace does actually need
both modes for now, depending upon what it's doing?
-Daniel

> 
> Matt
> 
> > But if we can actually choose, and userspace wants to, then I'm all
> > fine with this. And we can always move this to a more generic place if
> > other engines need preempt control later on too.
> > 
> > Cheers, Daniel
> > 
> > 
> > > Matt
> > >
> > > > Cheers, Daniel
> > > >
> > > > > +/*
> > > > > + * Do not allow BBs to be preempted mid BB rather insert coordinated preemption
> > > > > + * points on all hardware contexts between each set of BBs. An example use case
> > > > > + * of this feature is split-frame on gen11+ hardware. When using this feature a
> > > > > + * BB must be submitted on each hardware context in the parallel gem context.
> > > > > + * The execbuf2 IOCTL enforces the user adheres to policy.
> > > > > + */
> > > > > +#define I915_PARALLEL_NO_PREEMPT_MID_BATCH         (1<<1)
> > > > > +#define __I915_PARALLEL_UNKNOWN_FLAGS      (-(I915_PARALLEL_NO_PREEMPT_MID_BATCH << 1))
> > > > > +   __u64 flags;            /* all undefined flags must be zero */
> > > > > +   __u64 mbz64[3];         /* reserved for future use; must be zero */
> > > > > +
> > > > > +   /*
> > > > > +    * width (i) * num_siblings (j) in length
> > > > > +    * index = j + i * num_siblings
> > > > > +    */
> > > > > +   struct i915_engine_class_instance engines[0];
> > > > > +} __attribute__ ((packed));
> > > > > +
> > > > > diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
> > > > > index 7faa46cde088..64c539486ee4 100644
> > > > > --- a/Documentation/gpu/rfc/i915_scheduler.rst
> > > > > +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> > > > > @@ -82,4 +82,55 @@ https://spec.oneapi.com/level-zero/latest/core/api.html#ze-command-queue-priorit
> > > > >
> > > > >  New parallel submission uAPI
> > > > >  ============================
> > > > > -Details to come in a following patch.
> > > > > +The existing bonding uAPI is completely broken with GuC submission because
> > > > > +whether a submission is a single context submit or parallel submit isn't known
> > > > > +until execbuf time activated via the I915_SUBMIT_FENCE. To submit multiple
> > > > > +contexts in parallel with the GuC the context must be explictly registered with
> > > > > +N contexts and all N contexts must be submitted in a single command to the GuC.
> > > > > +These interfaces doesn't support dynamically changing between N contexts as the
> > > > > +bonding uAPI does. Hence the need for a new parallel submission interface. Also
> > > > > +the legacy bonding uAPI is quite confusing and not intuitive at all.
> > > > > +
> > > > > +The new parallel submission uAPI consists of 3 parts:
> > > > > +
> > > > > +* Export engines logical mapping
> > > > > +* A 'set_parallel' extension to configure contexts for parallel
> > > > > +  submission
> > > > > +* Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> > > > > +
> > > > > +Export engines logical mapping
> > > > > +------------------------------
> > > > > +Certain use cases require BBs to be placed on engine instances in logical order
> > > > > +(e.g. split-frame on gen11+). The logical mapping of engine instances can change
> > > > > +based on fusing. Rather than making UMDs be aware of fusing, simply expose the
> > > > > +logical mapping with the existing query engine info IOCTL. Also the GuC
> > > > > +submission interface currently only supports submitting multiple contexts to
> > > > > +engines in logical order which is a new requirement compared to execlists.
> > > > > +Lastly, all current platforms have at most 2 instances and the logical order is
> > > > > +the same a uABI order. This will change on platforms with more than 2 instances.
> > > > > +
> > > > > +A single bit will be added to drm_i915_engine_info.flags indicating that the
> > > > > +logical instance has been returned and a new field,
> > > > > +drm_i915_engine_info.logical_instance, returns the logical instance.
> > > > > +
> > > > > +A 'set_parallel' extension to configure contexts for parallel submission
> > > > > +------------------------------------------------------------------------
> > > > > +The 'set_parallel' extension configures a slot for parallel submission of N BBs.
> > > > > +It is setup step that should be called before using any of the contexts. See
> > > > > +I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE or I915_CONTEXT_ENGINES_EXT_BOND for
> > > > > +similar existing examples. Once a slot is configured for parallel submission the
> > > > > +execbuf2 IOCTL can be called submiting N BBs in a single IOCTL. Initially only
> > > > > +support GuC submission. Execlist support can be added later if needed.
> > > > > +
> > > > > +Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
> > > > > +i915_context_engines_parallel_submit to the uAPI to implement this extension.
> > > > > +
> > > > > +Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> > > > > +-------------------------------------------------------------------
> > > > > +Contexts that have been configured with the 'set_parallel' extension are allowed
> > > > > +to submit N BBs in a single execbuf2 IOCTL. The BBs are either the last N
> > > > > +objects in the drm_i915_gem_exec_object2 list or the first N if
> > > > > +I915_EXEC_BATCH_FIRST is set. The number of BBs is implict based on the slot
> > > > > +submitted and how it has been configured by 'set_parallel' or other extensions.
> > > > > +No uAPI changes in the execbuf IOCTL but worth mentioning the new behavior of
> > > > > +the IOCTL.
> > > > > --
> > > > > 2.28.0
> > > > >
> > > > > _______________________________________________
> > > > > Intel-gfx mailing list
> > > > > Intel-gfx@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > 
> > 
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
