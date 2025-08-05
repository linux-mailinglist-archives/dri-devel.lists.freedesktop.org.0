Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC4B1AFD2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 09:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DFC10E253;
	Tue,  5 Aug 2025 07:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehXN1Noy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3954810E253
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 07:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754380336; x=1785916336;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ZxDtzQhbIvVvZp84dwGhfiyrstUOa2vcXtEDlKWH4eo=;
 b=ehXN1Noyl7jv63mkMXsr8mJ8zX0r+gZjkCutjjMg5V9wAm+d8pnhjDU4
 vf34b6mpKW58J0qBErH0PPzMshoE9LWuuepZ964QXqgDJ8VWKxHgb7hQc
 mj3AK30wTD44mjAidm418oTJ0J8l9AnYwRK1iPbN5LoZ23XrVvpJeaTGE
 kA8G19ttpVB4JgtY7A0Aba58ZHzX9ppE6uDsQG3asX3jl/J4ZyVuqSxL/
 NYDjp5T1TSO9XH33l/ZBBJ8UpDCabLUSQ75Hf2nXG1KLR77n6ht0fPIV3
 6mogJ/2JYNLthIsTp0a0qe2YNzo/RNxt4NsZmCV7r4QfgMyzmwxmh8bza Q==;
X-CSE-ConnectionGUID: ddYtRUMVSsym+PxwlHW/Tw==
X-CSE-MsgGUID: h+2xnfzORf2mBWQqCcMpJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56801614"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56801614"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 00:52:16 -0700
X-CSE-ConnectionGUID: WDUPPRAkTOmyB3rkbVWD+w==
X-CSE-MsgGUID: RgDcaYgfQGiVzMQduUd1fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="201590793"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 00:52:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Liao Yuanhong <liaoyuanhong@vivo.com>,
 Nitin Gote <nitin.r.gote@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] drm/i915/gem: Remove goto label that are only used
 once
In-Reply-To: <20250805074645.625911-2-liaoyuanhong@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250805074645.625911-1-liaoyuanhong@vivo.com>
 <20250805074645.625911-2-liaoyuanhong@vivo.com>
Date: Tue, 05 Aug 2025 10:52:09 +0300
Message-ID: <3c436b32da8d76df7eace4dbbde79e808058ad8b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 05 Aug 2025, Liao Yuanhong <liaoyuanhong@vivo.com> wrote:
> Remove unnecessary goto labels to improve code readability. 

Please don't. It's fine as it is.

> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_region.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> index 636768d0f57e..539d1716d454 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> @@ -92,15 +92,13 @@ __i915_gem_object_create_region(struct intel_memory_region *mem,
>  		flags |= I915_BO_ALLOC_PM_EARLY;
>  
>  	err = mem->ops->init_object(mem, obj, offset, size, page_size, flags);
> -	if (err)
> -		goto err_object_free;
> +	if (err) {
> +		i915_gem_object_free(obj);
> +		return ERR_PTR(err);
> +	}
>  
>  	trace_i915_gem_object_create(obj);
>  	return obj;
> -
> -err_object_free:
> -	i915_gem_object_free(obj);
> -	return ERR_PTR(err);
>  }
>  
>  struct drm_i915_gem_object *

-- 
Jani Nikula, Intel
