Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED176883E0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 17:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73BB10E595;
	Thu,  2 Feb 2023 16:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B381A10E1E5;
 Thu,  2 Feb 2023 16:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675354405; x=1706890405;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V0xCUBI6dq7amJ3yogUFQU19VtZbUgW5jy5B3GBbsvQ=;
 b=ZBI6vLEqg+v05ldeeQTy3Sqs6haGUKk4EIhQyTGnNzr4fQPccMIND9Sy
 IprmuNLQRjXL36+TefMlRicDK70EGv1pIO1LE9My9eKwY4btbY1bM+ah7
 i+U6CsmS68rXNpOoJbz9hTcXt2p8pHxvwLLNRYz8dpN0+g2l6Cb/7BUUj
 ULhOZeRkQMIeriVNKq5G6Te7bOIocwRRu+Xu2LyXSDqdBq/0AtsRlN4th
 fOQoYHTEYZyyS5lIGp31rWskJgAdFGphgt/o4NepEZ93YGoioQzIbpcOJ
 DNyH1EEyvhL43ocXYyNq1AkX646TUBgqDAwasQI/OpsA5n3yT0EXognjf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="326179860"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="326179860"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 08:11:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="615339031"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="615339031"
Received: from mrogowsx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.12])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 08:11:54 -0800
Date: Thu, 2 Feb 2023 17:11:52 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v10 18/23] drm/i915/vm_bind: Limit vm_bind mode to
 non-recoverable contexts
Message-ID: <Y9vgyF01CV2ZMEzD@ashyti-mobl2.lan>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
 <20230118071609.17572-19-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118071609.17572-19-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niranjana,

On Tue, Jan 17, 2023 at 11:16:04PM -0800, Niranjana Vishwanathapura wrote:
> Only support vm_bind mode with non-recoverable contexts.
> With new vm_bind mode with eb3 submission path, we need not
> support older recoverable contexts.
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index fb4d2dab5053..9809c58316c2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1617,6 +1617,12 @@ i915_gem_create_context(struct drm_i915_private *i915,
>  	INIT_LIST_HEAD(&ctx->stale.engines);
>  
>  	if (pc->vm) {
> +		/* Only non-recoverable contexts are allowed in vm_bind mode */
> +		if (i915_gem_vm_is_vm_bind_mode(pc->vm) &&
> +		    (pc->user_flags & BIT(UCONTEXT_RECOVERABLE))) {
> +			err = -EINVAL;
> +			goto err_ctx;
> +		}
>  		vm = i915_vm_get(pc->vm);
>  	} else if (HAS_FULL_PPGTT(i915)) {
>  		struct i915_ppgtt *ppgtt;
> -- 
> 2.21.0.rc0.32.g243a4c7e27
