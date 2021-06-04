Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED7D39BEF9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 19:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B943D6F87F;
	Fri,  4 Jun 2021 17:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F516F875
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 17:39:39 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 s70-20020a1ca9490000b02901a589651424so1404048wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 10:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QPXdlhTT0qQvSoe4p6XPs2PPGdg+0rP+jlY4SCyo+eA=;
 b=UvW2eVKTUiR9LRbzkdW5xuSdiXsgcTWwMnkf6v1y8vkRaREIBbjNZXAlulwAx3WP/h
 1nyU1dF2uL4VqDfuNRjEhqrCJRMStgs5qr49u6zD2m2z6doK5Xy8PYFsTXGkoLrkj2tR
 pAopGebd8NcjMBBVrr1bR8OuPAqaB6WU4b3P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QPXdlhTT0qQvSoe4p6XPs2PPGdg+0rP+jlY4SCyo+eA=;
 b=mEEoB17cXgCt7qiFpescTNSdFYj/D7nc7dSLTv9d/PLPbbgH2Z7Dv4qEtIDJFtOS4r
 GBX/a7z94X65mOUuMzUwkesnrICRR8bO1xkcE/dN5uRBgYI14T2szbuNB0P0KsOHDEUA
 DzwMMc0I1pYgDhqgmLTpIFS/US54KBbf7Fw5R3xec4RVIZtcSZm122+8YD4igFtLyIXo
 z4XpaiWdGP+qZ8cwbN15X9dnCb8GMuvj8JTpeVIy+OP/gh/wk5DqSIzvKnKLjkHQVOyK
 oyOiywQ0VaLyknkAwZn7g10BRyKed/A6wYwWfYYxhm5uwrLreYuzyoFW3xPnjjP4FQKl
 RQzg==
X-Gm-Message-State: AOAM533CpSNMB9UwWkKzn83YnqUGHpruaaiz0C5WGEJdEm+EYT0UwYr1
 +S3PRkjf9tQ3L3qXBqxdIrxuLA==
X-Google-Smtp-Source: ABdhPJwAUN9Hz15So4IazjHo2zCMAK/ngIJMxrhZDkABZaW4N0GZ33uMVlRoF7TjxqPTr0kVp7vG8w==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr4747029wmi.101.1622828377500; 
 Fri, 04 Jun 2021 10:39:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 125sm9986205wmb.34.2021.06.04.10.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 10:39:36 -0700 (PDT)
Date: Fri, 4 Jun 2021 19:39:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 1/2] drm/doc/rfc: i915 GuC submission /
 DRM scheduler
Message-ID: <YLplVgu7y8fzaFF0@phenom.ffwll.local>
References: <20210526233357.9165-1-matthew.brost@intel.com>
 <20210526233357.9165-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210526233357.9165-2-matthew.brost@intel.com>
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

On Wed, May 26, 2021 at 04:33:56PM -0700, Matthew Brost wrote:
> Add entry for i915 GuC submission / DRM scheduler integration plan.
> Follow up patch with details of new parallel submission uAPI to come.
> 
> v2:
>  (Daniel Vetter)
>   - Expand explaination of why bonding isn't supported for GuC
>     submission
>   - CC some of the DRM scheduler maintainers
>   - Add priority inheritance / boosting use case
>   - Add reasoning for removing in order assumptions
>  (Daniel Stone)
>   - Add links to priority spec
> 
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

You have a one-line hunk in the next patch that probably should be here.
With that moved.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also did you get an ack from Carl on these?
-Daniel

> ---
>  Documentation/gpu/rfc/i915_scheduler.rst | 85 ++++++++++++++++++++++++
>  Documentation/gpu/rfc/index.rst          |  4 ++
>  2 files changed, 89 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst
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
>  .. toctree::
>  
>      i915_gem_lmem.rst
> +
> +.. toctree::
> +
> +    i915_scheduler.rst
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
