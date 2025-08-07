Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E20EB1DCDE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 20:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E6810E037;
	Thu,  7 Aug 2025 18:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RtuOsl8h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF20310E037
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 18:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754590031; x=1786126031;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xHKkV4DD2DuoLr05gEBrQk1TLxEWU/M1iyMdw4ivK30=;
 b=RtuOsl8hlcA2ieJK0xNjBSZT1UZMmjng4AOjK1iXohL7bpCD678KCaXn
 MX1uLZ8Pxf64rsJsesx/yvNg/BYn5gXmBNZ4rjka4xtjbXbC3OJBXENcr
 jmAnYf/mIPVchhzqpvxGLEh1GnOyX/yYV1RcDwm3XK0yx6mlj0bhUifGu
 rACwzQieCMTQL+HTlMzTE+zWypIN2Yp0ON4zAiqmeiOmyn8r5EvaD4KNO
 v/Y+NpV2N+14uP+nQjmPK9YZdfNfK/lpl2ctZYj0lscumM18OZ0wrKUcO
 jYtmhEdA+ncZbeZ5Zfk9r8VvccsRQbDFxrG3GfsvlzY68Db6rSNsB/RMy Q==;
X-CSE-ConnectionGUID: OwhvwdyBTZSIJm/btp3etw==
X-CSE-MsgGUID: sqyo3EqeRp+3dcg7gJoZIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79489024"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="79489024"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 11:07:10 -0700
X-CSE-ConnectionGUID: hanbwvowSUi97SDYIz70dA==
X-CSE-MsgGUID: Bkhc8bHqTnm6cysL/dVeCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="169338011"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.96])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 11:07:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Qianfeng Rong <rongqianfeng@vivo.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>
Cc: willy@infradead.org
Subject: Re: [PATCH v2 2/2] drm/i915: remove redundant __GFP_NOWARN
In-Reply-To: <20250807143919.575439-3-rongqianfeng@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250807143919.575439-1-rongqianfeng@vivo.com>
 <20250807143919.575439-3-rongqianfeng@vivo.com>
Date: Thu, 07 Aug 2025 21:07:03 +0300
Message-ID: <0a744ae4266a0e240a8d6e4c3a1ab4998b7404e8@intel.com>
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
> GFP_NOWAIT already includes __GFP_NOWARN, so let's remove the redundant
> __GFP_NOWARN.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 4 ++--
>  drivers/gpu/drm/i915/i915_active.c               | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
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
