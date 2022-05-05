Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161C851B9C7
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A7210ED53;
	Thu,  5 May 2022 08:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5D910ED53;
 Thu,  5 May 2022 08:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651737844; x=1683273844;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xIFhMS0JWwkZqThgEBS87SBcnDOGXyXsrRVOeuA152Y=;
 b=Ok3SPMdsASv5H3kmiUQNPstfGzn8DAFAZrv8QaFZJXdj5t6qeE9Y6mZK
 Yi2UyUucZp1wKb4ojCvJ3tCUcdAS7b+z3ZZ9qPijSmIALHHYF3SkRMEbx
 Lqdc+OI97tRtGowx160xzyN1CJ0dWRNL+3LSrd1gp7BlWZKe/p7GHuYvO
 Qz2xDQRl9mla1rsfIy3rf3jHbIyGVMUFovQih8ovHzxraxeJ9KjUjruSc
 7xwNSp6vprZjXAT++0oD6srGLjs/CrtRX+9mNeRBgLlBMZ68kqZ6BkGUw
 5edmz/H9IG/gJCBRUEqWOmnQCNmi0l2BLvACDh0/FnQqdX8MjqLqULdas Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="268186510"
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="268186510"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 01:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="599945328"
Received: from gaia.fi.intel.com ([10.237.72.183])
 by orsmga001.jf.intel.com with ESMTP; 05 May 2022 01:04:01 -0700
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
 id 544C85C3767; Thu,  5 May 2022 11:02:40 +0300 (EEST)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915: Don't use DRM_DEBUG_WARN_ON for ring
 unexpectedly not idle
In-Reply-To: <20220504120715.911045-2-tvrtko.ursulin@linux.intel.com>
References: <20220504120715.911045-1-tvrtko.ursulin@linux.intel.com>
 <20220504120715.911045-2-tvrtko.ursulin@linux.intel.com>
Date: Thu, 05 May 2022 11:02:40 +0300
Message-ID: <87a6bw9zkv.fsf@gaia.fi.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> writes:

> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> DRM_DEBUG_WARN_ON should only be used when we are certain CI is guaranteed
> to exercise a certain code path, so in case of values coming from MMIO
> reads we cannot be sure CI will have all the possible SKUs and parts, or
> that it will catch all possible error conditions. Use drm_warn instead.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_ring_submission.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 5423bfd301ad..f8f279a195c0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -117,7 +117,9 @@ static void flush_cs_tlb(struct intel_engine_cs *engine)
>  		return;
>  
>  	/* ring should be idle before issuing a sync flush*/
> -	GEM_DEBUG_WARN_ON((ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
> +	if ((ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0)
> +		drm_warn(&engine->i915->drm, "%s not idle before sync flush!\n",
> +			 engine->name);
>  
>  	ENGINE_WRITE_FW(engine, RING_INSTPM,
>  			_MASKED_BIT_ENABLE(INSTPM_TLB_INVALIDATE |
> -- 
> 2.32.0
