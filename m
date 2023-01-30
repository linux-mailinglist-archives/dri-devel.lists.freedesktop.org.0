Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A6C680D4A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284EF10E22E;
	Mon, 30 Jan 2023 12:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6451710E21E;
 Mon, 30 Jan 2023 12:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675080804; x=1706616804;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tNVkOXyZyHkJcoBLdVco3QBeYlIFqM9MFf/z4eejfR4=;
 b=bbgXNl/yOBPSh1yXdnp7h52LrQb6MtUTIiGxJiPlr25tVHzdXzM4ZMiL
 PAOdFY6ve6vtRoosNluiP6WhhmKeilJ12nxU7cyokgYnM/DyCF2snVt0j
 GgmiRlR8yvrkUyanoRY+RJ0fVgtMgRl/LpJ8QHORaVFTL6bXrWV2JSy50
 hRTY8k3Qypol7o2jgG/d5KoQOF7LunCdWNo+pupcqQkbSePZP2tBopuzS
 T8wZeJFmhmqtWAqRosGgFTwNAiyKeP1+tTmChWzJOqdtJmwYVsZw81vAO
 nM2AW5KQgPeMZrtPaqUREfDmX9QjSuhgABjPzuLWGsQIaf8xF19Df00S6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="307191798"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="307191798"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 04:13:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="614009582"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="614009582"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.209.222])
 ([10.251.209.222])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 04:13:22 -0800
Message-ID: <1a7c5c7b-4180-1a43-874f-c5a48c387304@linux.intel.com>
Date: Mon, 30 Jan 2023 13:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/6] drm/ttm: stop allocating dummy resources during BO
 creation
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230130120636.63765-1-matthew.auld@intel.com>
 <20230130120636.63765-4-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230130120636.63765-4-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/30/2023 1:06 PM, Matthew Auld wrote:
> From: Christian König <christian.koenig@amd.com>
>
> That should not be necessary any more when drivers should at least be
> able to handle the move without a resource.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 7 -------
>   1 file changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 773080f48864..169818b32be2 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -952,7 +952,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>   			 struct sg_table *sg, struct dma_resv *resv,
>   			 void (*destroy) (struct ttm_buffer_object *))
>   {
> -	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
>   	int ret;
>   
>   	kref_init(&bo->kref);
> @@ -969,12 +968,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>   		bo->base.resv = &bo->base._resv;
>   	atomic_inc(&ttm_glob.bo_count);
>   
> -	ret = ttm_resource_alloc(bo, &sys_mem, &bo->resource);
> -	if (unlikely(ret)) {
> -		ttm_bo_put(bo);
> -		return ret;
> -	}
> -
>   	/*
>   	 * For ttm_bo_type_device buffers, allocate
>   	 * address space from the device.
