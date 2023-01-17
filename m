Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7D866DDBA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 13:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A434810E2E4;
	Tue, 17 Jan 2023 12:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A502510E1A4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 12:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673958954; x=1705494954;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UrZQQxELZNb7lz2ZOTd2cqprvuDaxhW4x2Gu4xwEkuA=;
 b=QH3MidZfIi0nIlCckl3Ab1BmTZL6AyT4uMccSAJrBb63odsaJuJOGJjl
 gbIytSt1F55pBjggEx20M/kVeomqVaujsMk+FWof0KpGLsXmvQG4VkhUt
 yejhQq6CoNUPUQvdFl1BFwBcnkiczyqTFvRbNkWULoD9qXjrYVNHAqSog
 jCgWbgk4e9JWlVXWDcNxQ+nXWDZTDaUgSOTVGDr7eJBSce9ao2Vm97dJF
 LzsuH65APFOr4qw+y2vgW3TbH0mBrEMAzVi1ao7VQafaTOb1QBSkv3L+d
 wtheQsxO/5lcXa4hr4Fqt69EtAryx2a2+X47HndymmRB0QhOUFYFcDr7b A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="325958828"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="325958828"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:35:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="691570027"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="691570027"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.45.93])
 ([10.249.45.93])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:35:53 -0800
Message-ID: <bfe991fb-c457-a291-898a-cfbe7f1b4aa2@linux.intel.com>
Date: Tue, 17 Jan 2023 13:35:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/ttm: fix some minor kerneldoc issues
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230117123345.387078-1-christian.koenig@amd.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230117123345.387078-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 1/17/2023 1:33 PM, Christian König wrote:
> Pointed out by the kernel test robot while merging ttm_bo_api.h and
> ttm_bo_driver.h.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index d33bff038d3a..77b50875b99f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -127,9 +127,8 @@ EXPORT_SYMBOL(ttm_move_memcpy);
>    * ttm_bo_move_memcpy
>    *
>    * @bo: A pointer to a struct ttm_buffer_object.
> - * @interruptible: Sleep interruptible if waiting.
> - * @no_wait_gpu: Return immediately if the GPU is busy.
> - * @new_mem: struct ttm_resource indicating where to move.
> + * @ctx: operation context
> + * @dst_mem: struct ttm_resource indicating where to move.
>    *
>    * Fallback move function for a mappable buffer object in mappable memory.
>    * The function will, if successful,
> @@ -281,8 +280,8 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>   /**
>    * ttm_io_prot
>    *
> - * bo: ttm buffer object
> - * res: ttm resource object
> + * @bo: ttm buffer object
> + * @res: ttm resource object
>    * @tmp: Page protection flag for a normal, cached mapping.
>    *
>    * Utility function that returns the pgprot_t that should be used for
> @@ -621,7 +620,7 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
>   }
>   
>   /**
> - * ttm_bo_move_accel_cleanup.
> + * ttm_bo_move_accel_cleanup - cleanup helper for hw copies
>    *
>    * @bo: A pointer to a struct ttm_buffer_object.
>    * @fence: A fence object that signals when moving is complete.
> @@ -665,7 +664,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>   EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
>   
>   /**
> - * ttm_bo_move_sync_cleanup.
> + * ttm_bo_move_sync_cleanup - cleanup by waiting for the move to finish
>    *
>    * @bo: A pointer to a struct ttm_buffer_object.
>    * @new_mem: struct ttm_resource indicating where to move.
