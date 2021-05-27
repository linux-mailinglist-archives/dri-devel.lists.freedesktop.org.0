Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE4E392B6E
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFB16EDE4;
	Thu, 27 May 2021 10:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBDB6EC6A;
 Thu, 27 May 2021 10:06:42 +0000 (UTC)
IronPort-SDR: w+XplF6wTmRQ8LzcD2k7BRd9cRzPtGapdITgTHgUB3wgNIFxLcWpyj0yjsw8Y0PJDXuhIi4TXT
 njObIOnMKX4Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="183032794"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="183032794"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 03:06:42 -0700
IronPort-SDR: 48GBcqqqT2nbP52op4rKXRLE2kKCMC9pCwxTeKxTq7efC8gCyBtfIHw0YmIFvH12pOvFuD39ry
 jyvbk3DVqR8g==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="547742390"
Received: from amoses-mobl1.ger.corp.intel.com (HELO [10.213.211.53])
 ([10.213.211.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 03:06:40 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 1/2] drm/doc/rfc: i915 GuC submission /
 DRM scheduler
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210526233357.9165-1-matthew.brost@intel.com>
 <20210526233357.9165-2-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <5a4ae6d0-cb47-fb8a-1f07-4f22f64cb919@linux.intel.com>
Date: Thu, 27 May 2021 11:06:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526233357.9165-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: jason.ekstrand@intel.com, mesa-dev@lists.freedesktop.org,
 christian.koenig@amd.com, daniel.vetter@intel.com, carl.zhang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/05/2021 00:33, Matthew Brost wrote:
> Add entry for i915 GuC submission / DRM scheduler integration plan.
> Follow up patch with details of new parallel submission uAPI to come.
> 
> v2:
>   (Daniel Vetter)
>    - Expand explaination of why bonding isn't supported for GuC
>      submission
>    - CC some of the DRM scheduler maintainers
>    - Add priority inheritance / boosting use case
>    - Add reasoning for removing in order assumptions
>   (Daniel Stone)
>    - Add links to priority spec

Where will the outstanding items like, from the top of my head only, 
error capture and open source logging tool be tracked? I thought here 
but maybe not.

Regards,

Tvrtko

> Cc: Christian König <christian.koenig@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   Documentation/gpu/rfc/i915_scheduler.rst | 85 ++++++++++++++++++++++++
>   Documentation/gpu/rfc/index.rst          |  4 ++
>   2 files changed, 89 insertions(+)
>   create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst
> 
> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
> new file mode 100644
> index 000000000000..7faa46cde088
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> @@ -0,0 +1,85 @@
> +=========================================
> +I915 GuC Submission/DRM Scheduler Section
> +=========================================
> +
> +Upstream plan
> +=============
> +For upstream the overall plan for landing GuC submission and integrating the
> +i915 with the DRM scheduler is:
> +
> +* Merge basic GuC submission
> +	* Basic submission support for all gen11+ platforms
> +	* Not enabled by default on any current platforms but can be enabled via
> +	  modparam enable_guc
> +	* Lots of rework will need to be done to integrate with DRM scheduler so
> +	  no need to nit pick everything in the code, it just should be
> +	  functional, no major coding style / layering errors, and not regress
> +	  execlists
> +	* Update IGTs / selftests as needed to work with GuC submission
> +	* Enable CI on supported platforms for a baseline
> +	* Rework / get CI heathly for GuC submission in place as needed
> +* Merge new parallel submission uAPI
> +	* Bonding uAPI completely incompatible with GuC submission, plus it has
> +	  severe design issues in general, which is why we want to retire it no
> +	  matter what
> +	* New uAPI adds I915_CONTEXT_ENGINES_EXT_PARALLEL context setup step
> +	  which configures a slot with N contexts
> +	* After I915_CONTEXT_ENGINES_EXT_PARALLEL a user can submit N batches to
> +	  a slot in a single execbuf IOCTL and the batches run on the GPU in
> +	  paralllel
> +	* Initially only for GuC submission but execlists can be supported if
> +	  needed
> +* Convert the i915 to use the DRM scheduler
> +	* GuC submission backend fully integrated with DRM scheduler
> +		* All request queues removed from backend (e.g. all backpressure
> +		  handled in DRM scheduler)
> +		* Resets / cancels hook in DRM scheduler
> +		* Watchdog hooks into DRM scheduler
> +		* Lots of complexity of the GuC backend can be pulled out once
> +		  integrated with DRM scheduler (e.g. state machine gets
> +		  simplier, locking gets simplier, etc...)
> +	* Execlist backend will do the minimum required to hook in the DRM
> +	  scheduler so it can live next to the fully integrated GuC backend
> +		* Legacy interface
> +		* Features like timeslicing / preemption / virtual engines would
> +		  be difficult to integrate with the DRM scheduler and these
> +		  features are not required for GuC submission as the GuC does
> +		  these things for us
> +		* ROI low on fully integrating into DRM scheduler
> +		* Fully integrating would add lots of complexity to DRM
> +		  scheduler
> +	* Port i915 priority inheritance / boosting feature in DRM scheduler
> +		* Used for i915 page flip, may be useful to other DRM drivers as
> +		  well
> +		* Will be an optional feature in the DRM scheduler
> +	* Remove in-order completion assumptions from DRM scheduler
> +		* Even when using the DRM scheduler the backends will handle
> +		  preemption, timeslicing, etc... so it is possible for jobs to
> +		  finish out of order
> +	* Pull out i915 priority levels and use DRM priority levels
> +	* Optimize DRM scheduler as needed
> +
> +New uAPI for basic GuC submission
> +=================================
> +No major changes are required to the uAPI for basic GuC submission. The only
> +change is a new scheduler attribute: I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP.
> +This attribute indicates the 2k i915 user priority levels are statically mapped
> +into 3 levels as follows:
> +
> +* -1k to -1 Low priority
> +* 0 Medium priority
> +* 1 to 1k High priority
> +
> +This is needed because the GuC only has 4 priority bands. The highest priority
> +band is reserved with the kernel. This aligns with the DRM scheduler priority
> +levels too.
> +
> +Spec references:
> +----------------
> +https://www.khronos.org/registry/EGL/extensions/IMG/EGL_IMG_context_priority.txt
> +https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/chap5.html#devsandqueues-priority
> +https://spec.oneapi.com/level-zero/latest/core/api.html#ze-command-queue-priority-t
> +
> +New parallel submission uAPI
> +============================
> +Details to come in a following patch.
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> index 05670442ca1b..91e93a705230 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -19,3 +19,7 @@ host such documentation:
>   .. toctree::
>   
>       i915_gem_lmem.rst
> +
> +.. toctree::
> +
> +    i915_scheduler.rst
> 
