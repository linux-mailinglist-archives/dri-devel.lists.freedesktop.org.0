Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B896BD44B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 16:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126D610ED5B;
	Thu, 16 Mar 2023 15:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B4A10ED0C;
 Thu, 16 Mar 2023 15:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678981688; x=1710517688;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9VAuLmsSM+XqSsPjPfhuhkgSc8kjR0hVX70OV0PuHBs=;
 b=dnLo/MkVoB4Myx6/wiAig7BDcM4cMVPwX6sfAVoXTv+5g/LvutmuqmUj
 ipFD6oPolTvZgBAnAOxqCBSFhqUrCMO1shyGdWWVCGCr9T2LWQpxSO5HI
 VotIIy1lLT4hzHgiwCu5h8iefRMLz+8uaJUDgjwwVXHeTbunR9SnH+41k
 H+9pXTT6ERIVm0pcBHtu4rLwSxmB+z/Q1nZPorVdrBOq5l/YVkvOQ+/+i
 CDU3Gn15hL+QvGhvDDUaYDIWqsbcDTm5aX/iYutUJ4wpAJ8MEuHXc3eyY
 U5UEb16RELTKMFQb2b7n69hiEIayNZ+deNNW0S4PXeG3wSCd7RROC2Z+/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="402918165"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="402918165"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="803802636"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="803802636"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.34.106])
 ([10.252.34.106])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:48:06 -0700
Message-ID: <b94f1474-60ad-518b-dff4-9518746d4213@linux.intel.com>
Date: Thu, 16 Mar 2023 16:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/i915: Simplify vcs/bsc engine selection
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230316142728.1335239-1-tvrtko.ursulin@linux.intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230316142728.1335239-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/16/2023 3:27 PM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> No need to look at the mask of present engines when we already have a
> count stored ever since e2d0ff3525b9 ("drm/i915: Count engine instances
> per uabi class").
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>


Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 9dce2957b4e5..3aeede6aee4d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2449,11 +2449,6 @@ static int eb_submit(struct i915_execbuffer *eb)
>   	return err;
>   }
>   
> -static int num_vcs_engines(struct drm_i915_private *i915)
> -{
> -	return hweight_long(VDBOX_MASK(to_gt(i915)));
> -}
> -
>   /*
>    * Find one BSD ring to dispatch the corresponding BSD command.
>    * The engine index is returned.
> @@ -2467,7 +2462,7 @@ gen8_dispatch_bsd_engine(struct drm_i915_private *dev_priv,
>   	/* Check whether the file_priv has already selected one ring. */
>   	if ((int)file_priv->bsd_engine < 0)
>   		file_priv->bsd_engine =
> -			get_random_u32_below(num_vcs_engines(dev_priv));
> +			get_random_u32_below(dev_priv->engine_uabi_class_count[I915_ENGINE_CLASS_VIDEO]);
>   
>   	return file_priv->bsd_engine;
>   }
> @@ -2655,7 +2650,8 @@ eb_select_legacy_ring(struct i915_execbuffer *eb)
>   		return -1;
>   	}
>   
> -	if (user_ring_id == I915_EXEC_BSD && num_vcs_engines(i915) > 1) {
> +	if (user_ring_id == I915_EXEC_BSD &&
> +	    i915->engine_uabi_class_count[I915_ENGINE_CLASS_VIDEO] > 1) {
>   		unsigned int bsd_idx = args->flags & I915_EXEC_BSD_MASK;
>   
>   		if (bsd_idx == I915_EXEC_BSD_DEFAULT) {
