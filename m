Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A010873A0DE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 14:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A217510E554;
	Thu, 22 Jun 2023 12:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ABD10E554;
 Thu, 22 Jun 2023 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687436871; x=1718972871;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pfaUwp3jPfq/eqSLrL/9k2ZrInzHiK5VmCRjRSJN8ew=;
 b=HHxONji7kWHWFiSCrz7f3iHILIbJ/u/ylReI551hZyzMViqtBbgw7CZN
 56AEzyf+QLXur9xJfwQyX/0yOUZ90Pa5XbBiylMoqcf8iNLObxRb/QvfY
 1wojlym7nNUIL/+ciGBnl4ffrmSxX9UHpHonB7dnzucGdHBilSZQhR67/
 T3tnFGtboHP9WbmG0CYvOnV6U8bXFQ70aQ4jNennSjsAsvf7ujVQr6kjz
 mwVsMG4+PGMeZzLHLaMLhBr27vnlk97NIVXG1TlTeAMPHgGeAQwG7JR1E
 I35nTt51zsquaxsmtAdIyjL73kyrNV74QPNofyvY4wOJfDh2Vx0lg3Yur A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340809706"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="340809706"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 05:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804764533"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="804764533"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.46.93])
 ([10.249.46.93])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 05:27:49 -0700
Message-ID: <c55fe986-80e5-2dde-1e0a-4f998717cfe5@linux.intel.com>
Date: Thu, 22 Jun 2023 14:27:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/i915/gt: Remove incorrect hard coded cache coherrency
 setting
Content-Language: en-US
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230616221110.1045918-1-zhanjun.dong@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230616221110.1045918-1-zhanjun.dong@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhanjun,


please restart the CI, https://patchwork.freedesktop.org/series/119485/

It seems to be stuck.



On 6/17/2023 12:11 AM, Zhanjun Dong wrote:
> The previouse i915_gem_object_create_internal already set it with proper
> value before function return. This hard coded setting is incorrect for
> platforms like MTL, thus need to be removed.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_timeline.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
> index b9640212d659..693d18e14b00 100644
> --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
> @@ -26,8 +26,6 @@ static struct i915_vma *hwsp_alloc(struct intel_gt *gt)
>   	if (IS_ERR(obj))
>   		return ERR_CAST(obj);
>   
> -	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
> -
>   	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>   	if (IS_ERR(vma))
>   		i915_gem_object_put(obj);
