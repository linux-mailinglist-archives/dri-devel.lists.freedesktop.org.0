Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6818F5E5E98
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 11:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DCC10E419;
	Thu, 22 Sep 2022 09:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7CC10E0EC;
 Thu, 22 Sep 2022 09:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663838938; x=1695374938;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u/sOsCR4pGPIoMQ/lEeKkPMpFIuunyCMlFL5T5UxEe4=;
 b=jz6Imz4sG1uBnEqW4aq2lwfnX3AjPqAiNFz7P73XYTwDQmjIKIv5fza2
 jYo77KoVunGGFx1194ECSeP77e7kkGhn2qQvXyEaPV10GF8Y1dXLvrfiV
 TCHFo0FDnOgGcPoU47zWPLgp2cbMP5j4+pcbCCTvuWrxCvcEVW0UOhKcV
 L6dUzdmhROWAoTgIRKk8R3SPlDPdnYjrsdZVnbcwPFJ5drhjmLV5TKKK/
 TYfD4SWWCfr4sYe0KrLJ5BODXJphbS3MGWQtzYKthDruZGiMfHYxg8wDj
 T5BW9pBBtJL0FBD5+XCNPZVzwAH6HC2sFVoctfG8aPqDmlKIG2hJ+IaUL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="301658866"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="301658866"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 02:28:58 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="619725613"
Received: from emurphy-mobl.ger.corp.intel.com (HELO [10.213.205.83])
 ([10.213.205.83])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 02:28:57 -0700
Message-ID: <5a176438-606f-6df9-c923-3d129a3ac276@linux.intel.com>
Date: Thu, 22 Sep 2022 10:28:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Remove unused function parameter
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220922044311.7361-1-niranjana.vishwanathapura@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220922044311.7361-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/09/2022 05:43, Niranjana Vishwanathapura wrote:
> The function parameter 'exclude' in funciton
> i915_sw_fence_await_reservation() is not used.
> Remove it.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_atomic_plane.c | 5 ++---
>   drivers/gpu/drm/i915/gem/i915_gem_clflush.c       | 2 +-
>   drivers/gpu/drm/i915/i915_sw_fence.c              | 1 -
>   drivers/gpu/drm/i915/i915_sw_fence.h              | 1 -
>   4 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index aaa6708256d5..ecb8d71d36c0 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -1005,7 +1005,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>   		 */
>   		if (intel_crtc_needs_modeset(crtc_state)) {
>   			ret = i915_sw_fence_await_reservation(&state->commit_ready,
> -							      old_obj->base.resv, NULL,
> +							      old_obj->base.resv,
>   							      false, 0,
>   							      GFP_KERNEL);
>   			if (ret < 0)
> @@ -1039,8 +1039,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>   		struct dma_fence *fence;
>   
>   		ret = i915_sw_fence_await_reservation(&state->commit_ready,
> -						      obj->base.resv, NULL,
> -						      false,
> +						      obj->base.resv, false,
>   						      i915_fence_timeout(dev_priv),
>   						      GFP_KERNEL);
>   		if (ret < 0)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> index 0512afdd20d8..b3b398fe689c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> @@ -113,7 +113,7 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
>   		clflush = clflush_work_create(obj);
>   	if (clflush) {
>   		i915_sw_fence_await_reservation(&clflush->base.chain,
> -						obj->base.resv, NULL, true,
> +						obj->base.resv, true,
>   						i915_fence_timeout(i915),
>   						I915_FENCE_GFP);
>   		dma_resv_add_fence(obj->base.resv, &clflush->base.dma,
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index 6fc0d1b89690..cc2a8821d22a 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -571,7 +571,6 @@ int __i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>   
>   int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>   				    struct dma_resv *resv,
> -				    const struct dma_fence_ops *exclude,
>   				    bool write,
>   				    unsigned long timeout,
>   				    gfp_t gfp)
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
> index 619fc5a22f0c..f752bfc7c6e1 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.h
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.h
> @@ -91,7 +91,6 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>   
>   int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>   				    struct dma_resv *resv,
> -				    const struct dma_fence_ops *exclude,
>   				    bool write,
>   				    unsigned long timeout,
>   				    gfp_t gfp);

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
