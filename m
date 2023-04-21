Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235476EADFB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 17:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD2310EE4A;
	Fri, 21 Apr 2023 15:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CC310E19F;
 Fri, 21 Apr 2023 15:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682090778; x=1713626778;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2ObTtvdcT0eFGY9iXcg/B15jYNp9y7zjc8a22FR+Wkk=;
 b=GLBliB+jmzRH1Vt45LaDgncrM30ZdWafNXBRNaHeY9ecK5/3dWgxY6ij
 9jIwFQHB4C70kf2xMg9fyQ3KCQnuOP6aSRY0fCikIcgwYBbyO76+xAUGX
 WSnSkrKp5nvl3sJbo1fbqZA7kYyu4y5y2nCkRVx3BQ4iBxpJYw1RQUO1P
 6Fbp0/tVH69QWUZgUG99Z+qdqWMEeeIYXlm3Hrp07WQ/b8UM+Iv+i/Md/
 Imtn+JR0DFjZRT3ZEF5o7SIS/2zt2UIIE/VVH4SV/jPiaaOntHRg6J3FK
 XAEV6Hf8olZAADDSulzJuVBR/J3Y1yEAB3fLA+0RP5tOyitPi11JFYaJ7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="408954934"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="408954934"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 08:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="866729561"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="866729561"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.8.140])
 ([10.213.8.140])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 08:26:15 -0700
Message-ID: <1de72f99-b013-8247-72ed-1db903ec9b8d@intel.com>
Date: Fri, 21 Apr 2023 17:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/i915_drv: Use proper parameter
 naming in for_each_gt()
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
References: <20230421134654.273182-1-andi.shyti@linux.intel.com>
 <20230421134654.273182-2-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230421134654.273182-2-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.04.2023 15:46, Andi Shyti wrote:
> for_each_gt() loops through engines in the GT, not in dev_priv.
> Because it's misleading, call it "gt__" instead of "dev_priv__".
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

With fixes mentioned by Rodrigo.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/i915_drv.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index fe7eeafe9cff6..c16f8a3cd914f 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -381,11 +381,11 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
>   }
>   
>   /* Simple iterator over all initialised engines */
> -#define for_each_engine(engine__, dev_priv__, id__) \
> +#define for_each_engine(engine__, gt__, id__) \
>   	for ((id__) = 0; \
>   	     (id__) < I915_NUM_ENGINES; \
>   	     (id__)++) \
> -		for_each_if ((engine__) = (dev_priv__)->engine[(id__)])
> +		for_each_if ((engine__) = (gt__)->engine[(id__)])
>   
>   /* Iterator over subset of engines selected by mask */
>   #define for_each_engine_masked(engine__, gt__, mask__, tmp__) \

