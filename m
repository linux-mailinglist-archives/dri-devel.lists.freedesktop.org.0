Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BFD37A969
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18326EA50;
	Tue, 11 May 2021 14:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D136EA48
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 14:34:18 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v5so12077085edc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jFVe0PqnZy5E/rjk7vhI0wrNiAOLqvBg5Gnqo1Mxs2Y=;
 b=RmdqXP0JIDEKYnD/rhNHXZD87LDia2ThxA/cTQArnielc7nNnMuHYvu3y8RFaq5vdv
 L274JZj0rpPYyxfnl50CLfh7DWa2YWhVxNoDoKaBlpLTaiXFFA/T2GVrohDP9ywvhA7P
 aIwgFVxzj8vzDa81r7J6IF1OxXs9rvURq6/MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jFVe0PqnZy5E/rjk7vhI0wrNiAOLqvBg5Gnqo1Mxs2Y=;
 b=UR2yHl+s7LNP0eK9cc0m0Q70u+2WYZjox9ELad3apFMYRNf+AgJGu1FodAoGWOjOyl
 fSJ3+F/VLVnvFFqfJP077Sbs0rx+fkjHMXFz1/DDleQ1zl/07zl+LutUfp6/ZWe6DuRT
 rROj7MGIaUaYHOgiz+0+Nuc9uPEcqGKKjQFsdAhQBfT8V836IGnma2t2YwYjqOWSzAMx
 65XpnEdu6R9/VEVOzFjE0k6x7gE4LmQ7UA7fH5Hctii+USjJkiGiwzQooNlaRYrz4K0G
 NiZNhl8jfj83pJrFp4KnNuULfUlLcr9cpIPx0UTj6Nhswl7SdNBJ1gRZj6WYRt9xUcsx
 8XAg==
X-Gm-Message-State: AOAM530kQ6SyDFDbfF8bFV/XZ/0MThIGZgfZDmPBYCxmli8TpK4N4Pzx
 aQz4CTYJSaTnbQ6OgVpnp52h5Q==
X-Google-Smtp-Source: ABdhPJxe8zmLderduPMf5NkvHBa6Eim0Jt1LXR3V1rlkoMMhqPS0w2cyHOUw1GXBuvfVVOmFdyivSg==
X-Received: by 2002:a05:6402:1115:: with SMTP id
 u21mr36523342edv.383.1620743657190; 
 Tue, 11 May 2021 07:34:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y8sm2572450edo.90.2021.05.11.07.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 07:34:16 -0700 (PDT)
Date: Tue, 11 May 2021 16:34:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 1/5] drm/doc/rfc: i915 GuC submission /
 DRM scheduler integration plan
Message-ID: <YJqV5rzTCRNKwPf1@phenom.ffwll.local>
References: <20210506173049.72503-1-matthew.brost@intel.com>
 <20210506173049.72503-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210506173049.72503-2-matthew.brost@intel.com>
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 carl.zhang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 10:30:45AM -0700, Matthew Brost wrote:
> Add entry for i915 GuC submission / DRM scheduler integration plan.
> Follow up patch with details of new parallel submission uAPI to come.
> 
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Would be good to Cc: some drm/scheduler folks here for the next round:

$ scripts/get_maintainer.pl -f -- drivers/gpu/drm/scheduler/

says we have maybe the following missing:

"Christian König" <christian.koenig@amd.com>
Luben Tuikov <luben.tuikov@amd.com>
Alex Deucher <alexander.deucher@amd.com>
Steven Price <steven.price@arm.com>

Lee Jones did a ton of warning fixes over the entire tree, so doesn't care
about drm/scheduler design directly.

> ---
>  Documentation/gpu/rfc/i915_scheduler.rst | 70 ++++++++++++++++++++++++
>  Documentation/gpu/rfc/index.rst          |  4 ++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst
> 
> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
> new file mode 100644
> index 000000000000..fa6780a11c86
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> @@ -0,0 +1,70 @@
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
> +	  functional and not regress execlists
> +	* Update IGTs / selftests as needed to work with GuC submission
> +	* Enable CI on supported platforms for a baseline
> +	* Rework / get CI heathly for GuC submission in place as needed
> +* Merge new parallel submission uAPI
> +	* Bonding uAPI completely incompatible with GuC submission

Maybe clarify that this isn't the only issue with the bonding uapi, so
perhaps add "Plus it has severe design issues in general, which is why we
want to retire it no matter what". Or something like that. Not sure we
should go into full details here, maybe as part of the next patch about
parallel submit and all that.

> +	* New uAPI adds I915_CONTEXT_ENGINES_EXT_PARALLEL context setup step
> +	  which configures contexts N wide
> +	* After I915_CONTEXT_ENGINES_EXT_PARALLEL a user can submit N batches to
> +	  a context in a single execbuf IOCTL and the batches run on the GPU in
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

Maybe a few words on what this does and why we care? Just so drm/scheduler
people know what's coming.

> +	* Remove in-order completion assumptions from DRM scheduler

I think it'd be good to put a few words here why we need this. We want to
use drm scheduler for dependencies, but rely on the hw/fw scheduler (or
well backend for execlist) to handle preemption, round-robin and that kind
of stuff. Hence we want to have all runnable requests in the backend
(excluding backpressure and stuff like that), and they can complete
out-of-order.

Maybe also highlight this one in the commit message to get drm/scheduler
folks' attention on this and the previous one for discussion.

> +	* Pull out i915 priority levels and use DRM priority levels
> +	* Optimize DRM scheduler as needed

Again if we have some items here (one that was discussed was direct
submit/retire for lower latency iirc?) might be good to list this here.

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

Please Cc: mesa and get an ack from Jason Ekstrand or Ken Graunke on this,
just to be sure.

> +
> +New parallel submission uAPI
> +============================
> +Details to come in a following patch.
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> index a8621f7dab8b..018a8bf317a6 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -15,3 +15,7 @@ host such documentation:
>  
>  * Once the code has landed move all the documentation to the right places in
>    the main core, helper or driver sections.
> +
> +.. toctree::
> +
> +    i915_scheduler.rst

Aside from the comments I think this is what we're aiming for wrt rfc
patches, so lgtm overall.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
