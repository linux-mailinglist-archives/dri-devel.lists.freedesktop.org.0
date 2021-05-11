Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB5237A9DA
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5502A6EA5E;
	Tue, 11 May 2021 14:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4319D6EA63
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 14:50:02 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id j10so3131758ejb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kCGQJx42H1WgN/ySIlU//nGhUzi7WBPWtpphgEZTYHI=;
 b=h9Vz7j4xWdM4cXj8B+mf8NLjEXcUPI9A8p0isUJrwzT6jQjSRurgh0dCOwuMLR/UtL
 p328WqgHzCPeVtQp9x0FE9awoVl1+G66yqn/ICmnaK0B8NrtYXjL+/spiN5BZXlX5tmF
 BmErgOs3ZJq18Eo5YJJKA8m+yYsgbZA/23DAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kCGQJx42H1WgN/ySIlU//nGhUzi7WBPWtpphgEZTYHI=;
 b=Rr0F5c87meeJnws5tq9efZnmQg/zwSWcKXjQmD+qXmH0WD1xUEZxLYtSom+nlPghau
 974mCNgd56UGEQbDnV7t4Zbo4+Rmay4FQitTS/6w3Z9qPIlj+fc6rvuT+YJCsRSV5gDY
 gC20BdL9hYykvlDqAEe2CwKgfeizH5AqiVeuhgKsv6nZF+CCbCbaTPv9ByAHc5vT8iYc
 xSJnFKRIwBHRLYPmDTtUu4YDnZ4653zAjXbWSyjfi26GChJgEgXAeZsPIAPrVr4ZhSwK
 3F2npElhnFKR2olORO7mghBxrDJe8siL5EP5RxTd5pJmO+Wmwj8+5/ffiDLbOJA8yIi+
 VVng==
X-Gm-Message-State: AOAM533bEz92SvnSegNtpGmaACoybaPJP+r0Sgekve3k5rmFYbNzPpes
 ChhWlEuw1XuX23YDScPiKNtTKQ==
X-Google-Smtp-Source: ABdhPJyyIk57R5BqSD2IuAfuUt90DyGvatz0SnbD7NKsmFyfjYJoWd0ODJzKF4+rLs1r27w3ftguqw==
X-Received: by 2002:a17:907:3f28:: with SMTP id
 hq40mr31965256ejc.283.1620744600864; 
 Tue, 11 May 2021 07:50:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id nc42sm11430179ejc.103.2021.05.11.07.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 07:49:59 -0700 (PDT)
Date: Tue, 11 May 2021 16:49:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 2/5] drm/doc/rfc: i915 new parallel
 submission uAPI plan
Message-ID: <YJqZlp3C97WRIilE@phenom.ffwll.local>
References: <20210506173049.72503-1-matthew.brost@intel.com>
 <20210506173049.72503-3-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506173049.72503-3-matthew.brost@intel.com>
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

On Thu, May 06, 2021 at 10:30:46AM -0700, Matthew Brost wrote:
> Add entry fpr i915 new parallel submission uAPI plan.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> CC: Carl Zhang <carl.zhang@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  Documentation/gpu/rfc/i915_scheduler.rst | 56 +++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
> index fa6780a11c86..e3455b33edfe 100644
> --- a/Documentation/gpu/rfc/i915_scheduler.rst
> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> @@ -13,7 +13,8 @@ i915 with the DRM scheduler is:
>  	  modparam enable_guc
>  	* Lots of rework will need to be done to integrate with DRM scheduler so
>  	  no need to nit pick everything in the code, it just should be
> -	  functional and not regress execlists
> +	  functional, no major coding style / layering errors, and not regress
> +	  execlists

I guess this hunk should be in the previous patch?

>  	* Update IGTs / selftests as needed to work with GuC submission
>  	* Enable CI on supported platforms for a baseline
>  	* Rework / get CI heathly for GuC submission in place as needed
> @@ -67,4 +68,55 @@ levels too.
>  
>  New parallel submission uAPI
>  ============================
> -Details to come in a following patch.
> +The existing bonding uAPI is completely broken with GuC submission because
> +whether a submission is a single context submit or parallel submit isn't known
> +until execbuf time activated via the I915_SUBMIT_FENCE. To submit multiple
> +contexts in parallel with the GuC the context must be explictly registered with
> +N contexts and all N contexts must be submitted in a single command to the GuC.
> +This interfaces doesn't support dynamically changing between N contexts as the
> +bonding uAPI does. Hence the need for a new parallel submission interface. Also
> +the legacy bonding uAPI is quite confusing and not intuitive at all.

I think you should sit together with Jason on irc or so for a bit and get
an earful of how it's all broken irrespective of GuC submission or not.
Just to hammer in our case :-)

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
> +engines in logical order.

Maybe highlight more that this is a new restriction with GuC compared to
execlist, which is why we need to expose this information to userspace.
Also on the platforms thus far supported in upstream there's at most 2
engines of the same type, so really not an issue.

> +
> +A single bit will be added to drm_i915_engine_info.flags indicating that the
> +logical instance has been returned and a new field,
> +drm_i915_engine_info.logical_instance, returns the logical instance.
> +
> +A 'set_parallel' extension to configure contexts for parallel submission
> +------------------------------------------------------------------------
> +The 'set_parallel' extension configures N contexts for parallel submission. It
> +is setup step that should be called before using any of the contexts. See
> +I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE or I915_CONTEXT_ENGINES_EXT_BOND for
> +similar existing examples. Once the N contexts are configured for parallel
> +submission the execbuf2 IOCTL can be called submiting 1-N BBs in a single IOCTL.
> +Although submitting less than N BBs is allowed it is not recommended as that
> +will likely leave parts of the hardware reserved and idle. Initially only
> +support GuC submission. Execlist support can be added later if needed.

Can we just require that you always submit N batchbuffers, or does this
create a problem for userspace? Allowing things just because is generally
not a good idea with uapi, it's better to limit and then allow when
there's a need.

Ofc if we already have a need then explain why and that's all fine.

Also detailed comments on the kerneldoc I'll do in the next patches.

> +
> +Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
> +i915_context_engines_parallel_submit to the uAPI to implement this extension.
> +
> +Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> +-------------------------------------------------------------------
> +Contexts that have been configured with the 'set_parallel' extension are allowed
> +to submit 1-N BBs in a single execbuf2 IOCTL. The BBs are either the last N
> +objects in the drm_i915_gem_exec_object2 list or the first N if
> +I915_EXEC_BATCH_FIRST is set.
> +
> +Add field 6 bit wide field to drm_i915_gem_exec_object2.flags which indicates
> +the number of BBs - 1 included in the IOCTL.

Hm we have the nice execbuf extension chaining, any reason for not using
that and instead opting for clever field packing?

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
