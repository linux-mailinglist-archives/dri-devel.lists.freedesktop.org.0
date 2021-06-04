Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A3339BF2F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 19:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C4B6F88C;
	Fri,  4 Jun 2021 17:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B2C6F888
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 17:59:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c5so10103072wrq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 10:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Re/Xyf+iY9DUJLPX9PqiA/+dtoiYMDvI4J16ARI4DV8=;
 b=fNEC1mxTW60Re7s3LONtOadZEHIkf5bwV/PpP6EWFpk7HQ+MCFoURkGL+KWj85blTn
 lKTYocNouWz3eoCBGcWfhvzJOWMTeeAjcugEOQ0e4yAdrNxmwqMi4y3DdiUIV6I7SuFn
 pSiL/HyYelsZUO8mRHT+3SPzqPNV1riQAfbfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Re/Xyf+iY9DUJLPX9PqiA/+dtoiYMDvI4J16ARI4DV8=;
 b=E9dA9LaYP12/IsEQ7Y12nwScOr6VELV8xyQja0i41sSBR7kYroQ2Bp+Xvip+HlRjEW
 r563dCaOFZ/e5V4vIpAiZH6VWdMOqncnowHOtABRNkyhJsOrvH5PtInphszB61gVG2D0
 Bd+rRIDPqBiiaeK6YYSPJ2ubwfW3G75/iz+AsI9PUaFXsNdE4TMUOSnPMYt79zpu3QtH
 W6hLNnF5oeQil+BMFFjp+7pFlLZk4sLMSg8+RQ3WQvB2jdvvjCDeNm1qnfI7xu/19sx5
 gklKmpXtrnHShD2US8DGycB4LTsaWeHenxmn+vyUaMNfWZU1Hl/9ei/RoKBsC/DoRb30
 Ui3w==
X-Gm-Message-State: AOAM532CGSXcdNnctAD/702phNpG2cj8lHub+RY3Do3/QfQbpFTdIAUi
 F1K1o0ZhOlN35c/xnrKkyE+8+g==
X-Google-Smtp-Source: ABdhPJzA0d9SpfNsLd1j+KUDQe8DIwXCpUbWPsdWysTVdm9ZbH/dlsGxEjT0Cpi7fPuhyCzgkYVzzg==
X-Received: by 2002:adf:cf07:: with SMTP id o7mr5127273wrj.399.1622829547482; 
 Fri, 04 Jun 2021 10:59:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm7168981wrn.38.2021.06.04.10.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 10:59:07 -0700 (PDT)
Date: Fri, 4 Jun 2021 19:59:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 2/2] drm/doc/rfc: i915 new parallel
 submission uAPI plan
Message-ID: <YLpp6e8XlWvIZ0Y9@phenom.ffwll.local>
References: <20210526233357.9165-1-matthew.brost@intel.com>
 <20210526233357.9165-3-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210526233357.9165-3-matthew.brost@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 carl.zhang@intel.com, jason.ekstrand@intel.com, daniel.vetter@intel.com,
 mesa-dev@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 04:33:57PM -0700, Matthew Brost wrote:
> Add entry for i915 new parallel submission uAPI plan.
> 
> v2:
>  (Daniel Vetter):
>   - Expand logical order explaination
>   - Add dummy header
>   - Only allow N BBs in execbuf IOCTL
>   - Configure parallel submission per slot not per gem context
> v3:
>  (Marcin Ślusarz):
>   - Lot's of typos / bad english fixed
>  (Tvrtko Ursulin):
>   - Consistent pseudo code, clean up wording in descriptions
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> CC: Carl Zhang <carl.zhang@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  Documentation/gpu/rfc/i915_parallel_execbuf.h | 145 ++++++++++++++++++
>  Documentation/gpu/rfc/i915_scheduler.rst      |  55 ++++++-
>  2 files changed, 198 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
> 
> diff --git a/Documentation/gpu/rfc/i915_parallel_execbuf.h b/Documentation/gpu/rfc/i915_parallel_execbuf.h
> new file mode 100644
> index 000000000000..20de206e3ab4
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_parallel_execbuf.h
> @@ -0,0 +1,145 @@
> +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
> +
> +/*
> + * i915_context_engines_parallel_submit:

So the idea is to make these kerneldoc and pull them into the rfc section.
Then when we merge, move them to the real uapi section, like what Matt has
done for lmem.

> + *
> + * Setup a slot in the context engine map to allow multiple BBs to be submitted
> + * in a single execbuf IOCTL. Those BBs will then be scheduled to run on the GPU
> + * in parallel. Multiple hardware contexts are created internally in the i915
> + * run these BBs. Once a slot is configured for N BBs only N BBs can be
> + * submitted in each execbuf IOCTL and this is implicit behavior e.g. The user
> + * doesn't tell the execbuf IOCTL there are N BBs, the execbuf IOCTL know how
> + * many BBs there are based on the slots configuration. The N BBs are the last N
> + * buffer objects for first N if I915_EXEC_BATCH_FIRST is set.

s/for/or/

> + *
> + * There are two currently defined ways to control the placement of the
> + * hardware contexts on physical engines: default behavior (no flags) and
> + * I915_PARALLEL_IMPLICIT_BONDS (a flag). More flags may be added the in the
> + * future as new hardware / use cases arise. Details of how to use this
> + * interface above the flags field in this structure.
> + *
> + * Returns -EINVAL if hardware context placement configuration is invalid or if
> + * the placement configuration isn't supported on the platform / submission
> + * interface.
> + * Returns -ENODEV if extension isn't supported on the platform / submission
> + * inteface.
> + */
> +struct i915_context_engines_parallel_submit {
> +	struct i915_user_extension base;
> +
> +	__u16 engine_index;	/* slot for parallel engine */

Kernel doc here for the inline comments too.

> +	__u16 width;		/* number of contexts per parallel engine */
> +	__u16 num_siblings;	/* number of siblings per context */
> +	__u16 mbz16;
> +/*
> + * Default placement behavior (currently unsupported):
> + *
> + * Allow BBs to be placed on any available engine instance. In this case each
> + * context's engine mask indicates where that context can be placed. It is
> + * implied in this mode that all contexts have mutual exclusive placement.
> + * e.g. If one context is running CSX[0] no other contexts can run on CSX[0]).
> + *
> + * Example 1 pseudo code:
> + * CSX,Y[N] = generic engine class X or Y, logical instance N
> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + * set_engines(INVALID)
> + * set_parallel(engine_index=0, width=2, num_siblings=2,
> + *		engines=CSX[0],CSX[1],CSY[0],CSY[1])
> + *
> + * Results in the following valid placements:
> + * CSX[0], CSY[0]
> + * CSX[0], CSY[1]
> + * CSX[1], CSY[0]
> + * CSX[1], CSY[1]
> + *
> + * This can also be thought of as 2 virtual engines described by 2-D array in
> + * the engines the field:
> + * VE[0] = CSX[0], CSX[1]
> + * VE[1] = CSY[0], CSY[1]
> + *
> + * Example 2 pseudo code:
> + * CSX[Y] = generic engine of same class X, logical instance N
> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + * set_engines(INVALID)
> + * set_parallel(engine_index=0, width=2, num_siblings=3,
> + *		engines=CSX[0],CSX[1],CSX[2],CSX[0],CSX[1],CSX[2])
> + *
> + * Results in the following valid placements:
> + * CSX[0], CSX[1]
> + * CSX[0], CSX[2]
> + * CSX[1], CSX[0]
> + * CSX[1], CSX[2]
> + * CSX[2], CSX[0]
> + * CSX[2], CSX[1]
> + *
> + * This can also be thought of as 2 virtual engines described by 2-D array in
> + * the engines the field:
> + * VE[0] = CSX[0], CSX[1], CSX[2]
> + * VE[1] = CSX[0], CSX[1], CSX[2]
> +
> + * This enables a use case where all engines are created equally, we don't care
> + * where they are scheduled, we just want a certain number of resources, for
> + * those resources to be scheduled in parallel, and possibly across multiple
> + * engine classes.
> + */
> +
> +/*

Would be good to also move this into the kerneldoc (maybe add labelled
list for flags or so) so it shows up in the render output.

> + * I915_PARALLEL_IMPLICIT_BONDS - Create implicit bonds between each context.
> + * Each context must have the same number of sibling and bonds are implicitly
> + * created between each set of siblings.
> + *
> + * Example 1 pseudo code:
> + * CSX[N] = generic engine of same class X, logical instance N
> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + * set_engines(INVALID)
> + * set_parallel(engine_index=0, width=2, num_siblings=1,
> + *		engines=CSX[0],CSX[1], flags=I915_PARALLEL_IMPLICIT_BONDS)
> + *
> + * Results in the following valid placements:
> + * CSX[0], CSX[1]
> + *
> + * Example 2 pseudo code:
> + * CSX[N] = generic engine of same class X, logical instance N
> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + * set_engines(INVALID)
> + * set_parallel(engine_index=0, width=2, num_siblings=2,
> + *		engines=CSX[0],CSX[2],CSX[1],CSX[3],
> + *		flags=I915_PARALLEL_IMPLICIT_BONDS)
> + *
> + * Results in the following valid placements:
> + * CSX[0], CSX[1]
> + * CSX[2], CSX[3]
> + *
> + * This can also be thought of as 2 virtual engines described by 2-D array in
> + * the engines the field with bonds placed between each index of the virtual
> + * engines. e.g. CSX[0] is bonded to CSX[1], CSX[2] is bonded to CSX[3].
> + * VE[0] = CSX[0], CSX[2]
> + * VE[1] = CSX[1], CSX[3]
> + *
> + * This enables a use case where all engines are not equal and certain placement
> + * rules are required (i.e. split-frame requires all contexts to be placed in a
> + * logically contiguous order on the VCS engines on gen11+ platforms). This use
> + * case (logically contiguous placement, within a single engine class) is
> + * supported when using GuC submission. Execlist mode could support all possible
> + * bonding configurations but currently doesn't support this extension.
> + */
> +#define I915_PARALLEL_IMPLICIT_BONDS			(1 << 0)
> +/*
> + * Do not allow BBs to be preempted mid BB rather insert coordinated preemption
> + * points on all hardware contexts between each set of BBs. An example use case
> + * of this feature is split-frame on gen11+ hardware.
> + */
> +#define I915_PARALLEL_NO_PREEMPT_MID_BATCH		(1 << 1)

So I get the history now behind this, but I think specifying flags for the
only behaviour you can get and the only behaviour that userspace asks for
is silly.

I think we should just move the actual behaviour spec into the kerneldoc,
as in "this is the bonding you get" and "due to hw/fw limitations these
workloads will be non-preemptable" and call it a day. Trying to guess
future needs and specifying them, without knowing those future needs
precisely, much less having an implementation, just never works out
really.

I discussed this a bit with Jason, and he's suggested this makes sense as
a engine flag, but definitely not on the parallel extension. But since we
don't have a need for picking a non-default value just extra work.

> +#define __I915_PARALLEL_UNKNOWN_FLAGS	(-(I915_PARALLEL_NO_PREEMPT_MID_BATCH << 1))
> +	__u64 flags;		/* all undefined flags must be zero */
> +	__u64 mbz64[3];		/* reserved for future use; must be zero */
> +
> +	/*
> +	 * 2-D array of engines
> +	 *
> +	 * width (i) * num_siblings (j) in length
> +	 * index = j + i * num_siblings
> +	 */
> +	struct i915_engine_class_instance engines[0];
> +} __attribute__ ((packed));
> +
> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
> index 7faa46cde088..0254c04d34be 100644
> --- a/Documentation/gpu/rfc/i915_scheduler.rst
> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> @@ -23,7 +23,7 @@ i915 with the DRM scheduler is:
>  	  severe design issues in general, which is why we want to retire it no
>  	  matter what
>  	* New uAPI adds I915_CONTEXT_ENGINES_EXT_PARALLEL context setup step
> -	  which configures a slot with N contexts 
> +	  which configures a slot with N contexts
>  	* After I915_CONTEXT_ENGINES_EXT_PARALLEL a user can submit N batches to
>  	  a slot in a single execbuf IOCTL and the batches run on the GPU in
>  	  paralllel
> @@ -82,4 +82,55 @@ https://spec.oneapi.com/level-zero/latest/core/api.html#ze-command-queue-priorit
>  
>  New parallel submission uAPI
>  ============================
> -Details to come in a following patch.
> +The existing bonding uAPI is completely broken with GuC submission because
> +whether a submission is a single context submit or parallel submit isn't known
> +until execbuf time activated via the I915_SUBMIT_FENCE. To submit multiple
> +contexts in parallel with the GuC the context must be explicitly registered with
> +N contexts and all N contexts must be submitted in a single command to the GuC.
> +The GuC interfaces do not support dynamically changing between N contexts as the
> +bonding uAPI does. Hence the need for a new parallel submission interface. Also
> +the legacy bonding uAPI is quite confusing and not intuitive at all.

We should add here that "Furthermore I915_SUBMIT_FENCE is by design a
future fence, so not really something we should continue to support."

> +
> +The new parallel submission uAPI consists of 3 parts:
> +
> +* Export engines logical mapping
> +* A 'set_parallel' extension to configure contexts for parallel
> +  submission
> +* Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> +
> +Export engines logical mapping
> +------------------------------
> +Certain use cases require BBs to be placed on engine instances in logical order
> +(e.g. split-frame on gen11+). The logical mapping of engine instances can change
> +based on fusing. Rather than making UMDs be aware of fusing, simply expose the
> +logical mapping with the existing query engine info IOCTL. Also the GuC
> +submission interface currently only supports submitting multiple contexts to
> +engines in logical order which is a new requirement compared to execlists.
> +Lastly, all current platforms have at most 2 engine instances and the logical
> +order is the same as uAPI order. This will change on platforms with more than 2
> +engine instances.
> +
> +A single bit will be added to drm_i915_engine_info.flags indicating that the
> +logical instance has been returned and a new field,
> +drm_i915_engine_info.logical_instance, returns the logical instance.
> +
> +A 'set_parallel' extension to configure contexts for parallel submission
> +------------------------------------------------------------------------
> +The 'set_parallel' extension configures a slot for parallel submission of N BBs.
> +It is setup step that should be called before using any of the contexts. See

		s/should/must/

We've made it a CTX_CREATE_EXT extension, so really you don't have a
choice anymore :-)

> +I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE or I915_CONTEXT_ENGINES_EXT_BOND for
> +similar existing examples. Once a slot is configured for parallel submission the
> +execbuf2 IOCTL can be called submitting N BBs in a single IOCTL. Initially only
> +support GuC submission. Execlist support can be added later if needed.
> +
> +Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
> +i915_context_engines_parallel_submit to the uAPI to implement this extension.
> +
> +Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> +-------------------------------------------------------------------
> +Contexts that have been configured with the 'set_parallel' extension are allowed
> +to submit N BBs in a single execbuf2 IOCTL. The BBs are either the last N
> +objects in the drm_i915_gem_exec_object2 list or the first N if
> +I915_EXEC_BATCH_FIRST is set. The number of BBs is implict based on the slot
> +submitted and how it has been configured by 'set_parallel' or other extensions.
> +No uAPI changes are required to execbuf2 IOCTL.

Addd here the kerneldoc include for your header.

Aside from the comments by and large this looks good. The main interface
at least is clear and warts-free.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -- 
> 2.28.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
