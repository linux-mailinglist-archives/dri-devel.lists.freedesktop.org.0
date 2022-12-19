Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9C0650EC8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 16:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B38A10E031;
	Mon, 19 Dec 2022 15:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E503010E031;
 Mon, 19 Dec 2022 15:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671464476; x=1703000476;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=M43VCwFsvaofhuWrvSAK6h0xV1dINtxPa089sIJDKsM=;
 b=QnSVpbccIF6CEX4/ms+cign3CsbP/N4UXn5eD3zQIqf2Xgz9Bnzp6zav
 K5JyvzdsH12rJ1etetFHQ18JzbZij5mH6Lw8jLMxrI11IShT5mza4G67j
 QG1wBqn4qyO78mMYLRzJvQqonJrKsDqoXWYHjn3iyGSPGZIDjMEQbKCqL
 uydHfLvDmYJ4EHDyjcNfZmeKP6nleYIKO9yX8CSQwO1MWgTP0KA8lpMo0
 yweOtHkknRvTJvCJqevTekyKsmM8jE6MANcSxSYJ6BORPxbnbxTEuE37g
 ByylUfv8SqzGUMROd+VLP8Wt9WqIgYCi6g1uF/gxevaYZNrS7z5WrohRr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="383720117"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="383720117"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 07:40:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="628335587"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="628335587"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.16.42])
 ([10.213.16.42])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 07:40:46 -0800
Message-ID: <06fe5ccf-b55a-59ff-3eeb-f190a6e2b933@intel.com>
Date: Mon, 19 Dec 2022 16:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915: Do not cover all future
 platforms in TLB invalidation
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221219101316.168129-1-tvrtko.ursulin@linux.intel.com>
 <20221219101316.168129-2-tvrtko.ursulin@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221219101316.168129-2-tvrtko.ursulin@linux.intel.com>
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19.12.2022 11:13, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Revert to the original explicit approach and document the reasoning
> behind it.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 7eeee5a7cb33..854841a731cb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1070,7 +1070,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>   	unsigned int num = 0;
>   	unsigned long flags;
>   
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +	/*
> +	 * New platforms should not be added with catch-all-newer (>=)
> +	 * condition so that any later platform added triggers the below warning
> +	 * and in turn mandates a human cross-check of whether the invalidation
> +	 * flows have compatible semantics.
> +	 *
> +	 * For instance with the 11.00 -> 12.00 transition three out of five
> +	 * respective engine registers were moved to masked type. Then after the
> +	 * 12.00 -> 12.50 transition multi cast handling is required too.
> +	 */
> +
> +	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50)) {
>   		regs = NULL;
>   		num = ARRAY_SIZE(xehp_regs);
>   	} else if (GRAPHICS_VER(i915) == 12) {

