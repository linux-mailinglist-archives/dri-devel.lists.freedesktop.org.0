Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D12B1D9B9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 16:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1724510E862;
	Thu,  7 Aug 2025 14:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCS2ok+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA77210E860;
 Thu,  7 Aug 2025 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754575995; x=1786111995;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=bZ6zqZxBaJLy3mVc+Rv1x9Ea4DTHTJK1PABAxuWa7UY=;
 b=RCS2ok+CWBD5jpT9lzAl4YMt8PPavEFYf4ZdfyLSpZP86S0SHgo3hUun
 /NVBEQrGkj3mjTFVapgkeJKSFovbshg5yOCojeEgOpazcY9DP/zxhg/TP
 KqiDo79P0q4uazadwhM0o+B6iQ9PKdMeXqlmO6OeAo0DyD6FvcJdmY5gO
 fWifkTIpeqmEQIOWz9Sruz4vcJWVMWvTSsL77wmhFoSABaYVhSc21HdAf
 w0ngFPbY53rbWSyVjk4487po9zpIj/Cu+9pXcgb/W1QBE3rjJa25xs21k
 AVOFkZJqM75Aq/TJmTwAIqUFKsoEpe8XduvsQXe2EpmcUnYiH1FdIIGxa g==;
X-CSE-ConnectionGUID: OGvwZk9sRrOBS2Q//8GMSQ==
X-CSE-MsgGUID: mmUWCxDwRamgiWu0takyAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60756591"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="60756591"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 07:13:15 -0700
X-CSE-ConnectionGUID: 8HckyPSMRPm6/2el+fYjhA==
X-CSE-MsgGUID: O0Cth4ajRg+d+h2Bflkv9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="170452436"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.96])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 07:13:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Qianfeng Rong
 <rongqianfeng@vivo.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm: Remove redundant __GFP_NOWARN
In-Reply-To: <20250807134639.555274-1-rongqianfeng@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250807134639.555274-1-rongqianfeng@vivo.com>
Date: Thu, 07 Aug 2025 17:13:07 +0300
Message-ID: <69a17c463c6351b4e0ee03445f59b2d245e85e97@intel.com>
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

On Thu, 07 Aug 2025, Qianfeng Rong <rongqianfeng@vivo.com> wrote:
> Commit 16f5dfbc851b ("gfp: include __GFP_NOWARN in GFP_NOWAIT")
> made GFP_NOWAIT implicitly include __GFP_NOWARN.
>
> Therefore, explicit __GFP_NOWARN combined with GFP_NOWAIT
> (e.g., `GFP_NOWAIT | __GFP_NOWARN`) is now redundant. Let's clean
> up these redundant flags across subsystems.
>
> No functional changes.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/drm_modeset_lock.c               | 4 ++--

Please separate the drm core changes...

>  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 4 ++--
>  drivers/gpu/drm/i915/i915_active.c               | 2 +-

...from the i915 driver changes.

Thanks,
Jani.

>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
> index beb91a13a312..58eac20a8138 100644
> --- a/drivers/gpu/drm/drm_modeset_lock.c
> +++ b/drivers/gpu/drm/drm_modeset_lock.c
> @@ -88,7 +88,7 @@ static noinline depot_stack_handle_t __drm_stack_depot_save(void)
>  
>  	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
>  
> -	return stack_depot_save(entries, n, GFP_NOWAIT | __GFP_NOWARN);
> +	return stack_depot_save(entries, n, GFP_NOWAIT);
>  }
>  
>  static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
> @@ -98,7 +98,7 @@ static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
>  	unsigned int nr_entries;
>  	char *buf;
>  
> -	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
> +	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT);
>  	if (!buf)
>  		return;
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index 8d4bb95f8424..22432912db2e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -220,7 +220,7 @@ static void heartbeat(struct work_struct *wrk)
>  		goto out;
>  	}
>  
> -	rq = heartbeat_create(ce, GFP_NOWAIT | __GFP_NOWARN);
> +	rq = heartbeat_create(ce, GFP_NOWAIT);
>  	if (IS_ERR(rq))
>  		goto unlock;
>  
> @@ -282,7 +282,7 @@ static int __intel_engine_pulse(struct intel_engine_cs *engine)
>  	GEM_BUG_ON(!intel_engine_has_preemption(engine));
>  	GEM_BUG_ON(!intel_engine_pm_is_awake(engine));
>  
> -	rq = heartbeat_create(ce, GFP_NOWAIT | __GFP_NOWARN);
> +	rq = heartbeat_create(ce, GFP_NOWAIT);
>  	if (IS_ERR(rq))
>  		return PTR_ERR(rq);
>  
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index 0dbc4e289300..402043cd84d5 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -727,7 +727,7 @@ int i915_request_await_active(struct i915_request *rq,
>  static int sw_await_fence(void *arg, struct dma_fence *fence)
>  {
>  	return i915_sw_fence_await_dma_fence(arg, fence, 0,
> -					     GFP_NOWAIT | __GFP_NOWARN);
> +					     GFP_NOWAIT);
>  }
>  
>  int i915_sw_fence_await_active(struct i915_sw_fence *fence,

-- 
Jani Nikula, Intel
