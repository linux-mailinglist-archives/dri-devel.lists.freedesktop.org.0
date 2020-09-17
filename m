Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03626D580
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6878B6EB0E;
	Thu, 17 Sep 2020 08:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F416EB0E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 08:01:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDuPiCYyH+xxYneJoP4fvw06R4Oiz+M9OWtewSogLv/UvXsp5JE4QQ7ugJMVwNV8eaVJjIfdQdhRb6nPOmv5AzBNdryOsQqKPf2wvgdWpnTXP6sYKv8PNDoRq9N8qVwB7xuCT6W2hGditww8cCEhJaYiKsp/Y4aIqjNMV85oDgUzaRR/Cw/9iOFCOQIRHhgR1hWEdB0yUCIXkqNcLdCXibuGtW4HPdAam7Gk15wPG8HIWNZXfU0F7Bufe4q4PP+zmG8ZYmXx0pxs9zu2C0FqAiUxuHkeK/o9g0KCruEU1yRtqRCfvJSTnekggwWZxI7H4TSOw05/Eh9gIP2+zSdEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWOkyt/ZjZ1L6UdrtL2kEL7yCv2zyvQHJED61vWy1n4=;
 b=UNFKoaoRiu1VMN0GitPsVxJS7oNATAlQOykwOSIllYU6eeKYhpNmxGHdNA1VSDGgMHb19HRZUrBAjkDiOtB8x+ueorphE20FaMESdZlCp+PPMySIfBXmzCRD9W+YLZBSlPeptdY41X6iKdt0xf+jzL6lWLshXZqg6xfXDskzQ0KObuvwwMX/HRElQgMFf9UvFdyPAN/OcV/J0ePb8J/iVtQQECbVrV05D46NmupPKs3KUXcRy/k3RZ7Y7UYYKl7TSGEIl6GQK+1A5Ma2acVSHlQ9mwmTZquDZ0XlR47NlkaMjiZkXd8aEjyWQemNR5R1FXqdKpEHvnNs2nJQ9h3cNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWOkyt/ZjZ1L6UdrtL2kEL7yCv2zyvQHJED61vWy1n4=;
 b=Cy9IpTAElYXU7zzdeXNc564d+UTxaQKH7+K+Jd1IkheunGVCW28p3iTRN0lmkjCbJRS7HtUhCxxG/9pAUqFsc7bz24NCnsRkyjEaYK0kKJQ48V9svK9QDnJ6k/B2rAKDFQCJye1TXE2z8s/AcujujY9jbpjUs/M9c8Zgu3PMvQs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 17 Sep
 2020 08:01:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 08:01:48 +0000
Subject: Re: [PATCH 1/2] drm/ttm: drop special pipeline accel cleanup function.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200917064132.148521-1-airlied@gmail.com>
 <20200917064132.148521-2-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0ba686b4-6775-9957-29c4-2f5d1c21afd1@amd.com>
Date: Thu, 17 Sep 2020 10:01:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200917064132.148521-2-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0034.eurprd04.prod.outlook.com
 (2603:10a6:208:122::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:208:122::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend
 Transport; Thu, 17 Sep 2020 08:01:47 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a7d9dc57-7014-4f1a-b5aa-08d85adfed8c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4239FACBFA9C2A9CCA984FE2833E0@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AYYZySASlvS5jhL0xk+tEqitfji0VP1QI3I7PPQciOMx0GMObkzxPJav0Z98FOFM8//MmB4bgTiFN1NZtULRSkkKQgsJkwhvi67toW0FBsLNkgpHtU4QfC+Ok7ORghevH/d1M7HnXtQQv4E0EuRqk2vZ8GhbUo5uzw8fPUnrwrgXKSu4wjvJ/44P+HZikYNx8h7e145LCkwZW1rYOZQQPGDe/dLOHjko23z5nrfk+O9nHis24f7NnTdFsfo6beA143iarvgTJ7B+YlfwelKMucJCG+BHQ60xGCjgbGwY2GXm3BvAG1RUkj5xkD5xM0ODu2yicZoHUGfrVOjnJ0Tj6DUkIL2lPIVdPo+yPPKDDJpfsN1Bf6d+biOv7iX8GFRN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(66556008)(6486002)(5660300002)(66476007)(83380400001)(186003)(316002)(52116002)(86362001)(478600001)(16526019)(31696002)(8676002)(8936002)(2906002)(31686004)(2616005)(36756003)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 8k4jelAJhYwDwOCH6ADoTOGazj6UCprt9DoEgwCO1QqU7gxPlI++1nwT2DfnfYC98u2QVVzNvX1H4qXh4tg6+rgneW7WhVZF5mWd82oJQhQZHoDVy4ejrld0WfWLdrhMatenXczHEkcYh45VVzfVCHpIpqomyiDr6T5M2vyEEDJctP9qiuBWEE5iZLOyZXGMB4R1hSy2TAmIR73m6TKCxw0xlMfMsVNckuGiyDR2BNJLcIy3qAP+OnWJIfnueL3Qe6YEfL1pGH9lOAaH8G1Mg9LYyMAhzoWDcPIoUxsN5jUCjWSbhsRRrdp4aa43uPNDszo8RM6dO1uvre5QqCFrqO1yvNkmb9J+Foy+Fn/yM7Ce/O0ZHX867YUJYJr6foDxgyTMv/SMp4zRCmoY86+Lnb7fPayp/a2bWczLFKPgPSdAqVauufth0MVBnYFydgM00aNdJaV4wrhM8xtk7vYH+QjM/RKHFsoU6Ajtg6j+CZoKgNQfnZaC99cBdLtrIhYRKdmHzUxHV4Gm5C0s9IAwlxBCw5dCXK67OHRzm2kOkKUjDJshlQcFo7o7CwOWrImas4tRyzsHxGoO1rjdX/pW29RXJAwjwm6VI67jWuPn3RtEamvu4ZybMoMMnYQ3k9xzwdEGkLbqfBRKQNAGJ2uVs+8itpYiygJV7dSbGN9dGvmMpvpcUr6PDPrkO+XtOT8ogZLGH3Ec4PoXDDLPGt1fxw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d9dc57-7014-4f1a-b5aa-08d85adfed8c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 08:01:48.4892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/NSL4g1+Tuqt7kGn6b/hbFzc3wiqoEH1cTtov0Y8QmAIP4CYG6jEcPdvZ1F/Sj8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.09.20 um 08:41 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> The two accel cleanup paths were mostly the same once refactored.
>
> Just pass a bool to say if the evictions are to be pipelined.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  5 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.c    |  2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c     |  2 +-
>   drivers/gpu/drm/ttm/ttm_bo_util.c       | 89 +++++++++----------------
>   include/drm/ttm/ttm_bo_driver.h         | 17 +----
>   5 files changed, 37 insertions(+), 78 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index a57aaf666340..1ea58ce7c559 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -499,10 +499,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   	}
>   
>   	/* Always block for VM page tables before committing the new location */
> -	if (bo->type == ttm_bo_type_kernel)
> -		r = ttm_bo_move_accel_cleanup(bo, fence, true, new_mem);
> -	else
> -		r = ttm_bo_pipeline_move(bo, fence, evict, new_mem);
> +	r = ttm_bo_move_accel_cleanup(bo, fence, true, bo->type != ttm_bo_type_kernel, new_mem);

You are now passing evict as always true here. I would keep the if instead.

Apart from that looks good to me,
Christian.

>   	dma_fence_put(fence);
>   	return r;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 56f974c28eb5..2ee75646ad6f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -824,7 +824,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
>   			if (ret == 0) {
>   				ret = ttm_bo_move_accel_cleanup(bo,
>   								&fence->base,
> -								evict,
> +								evict, false,
>   								new_reg);
>   				nouveau_fence_unref(&fence);
>   			}
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 99d9ca1087b7..36150b7f31a9 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -200,7 +200,7 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
>   	if (IS_ERR(fence))
>   		return PTR_ERR(fence);
>   
> -	r = ttm_bo_move_accel_cleanup(bo, &fence->base, evict, new_mem);
> +	r = ttm_bo_move_accel_cleanup(bo, &fence->base, evict, false, new_mem);
>   	radeon_fence_unref(&fence);
>   	return r;
>   }
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 502d334786d2..777f843cdb98 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -581,81 +581,56 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
>   	return 0;
>   }
>   
> -int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
> -			      struct dma_fence *fence,
> -			      bool evict,
> -			      struct ttm_resource *new_mem)
> +static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
> +				       struct dma_fence *fence)
>   {
>   	struct ttm_bo_device *bdev = bo->bdev;
> -	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
> -	int ret;
> +	struct ttm_resource_manager *from = ttm_manager_type(bdev, bo->mem.mem_type);
>   
> -	dma_resv_add_excl_fence(bo->base.resv, fence);
> -	if (evict)
> -		ret = ttm_bo_wait_free_node(bo, man->use_tt);
> -	else
> -		ret = ttm_bo_move_to_ghost(bo, fence, man->use_tt);
> -	if (ret)
> -		return ret;
> +	/**
> +	 * BO doesn't have a TTM we need to bind/unbind. Just remember
> +	 * this eviction and free up the allocation
> +	 */
> +	spin_lock(&from->move_lock);
> +	if (!from->move || dma_fence_is_later(fence, from->move)) {
> +		dma_fence_put(from->move);
> +		from->move = dma_fence_get(fence);
> +	}
> +	spin_unlock(&from->move_lock);
>   
> -	ttm_bo_assign_mem(bo, new_mem);
> +	ttm_bo_free_old_node(bo);
>   
> -	return 0;
> +	dma_fence_put(bo->moving);
> +	bo->moving = dma_fence_get(fence);
>   }
> -EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
>   
> -int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
> -			 struct dma_fence *fence, bool evict,
> -			 struct ttm_resource *new_mem)
> +int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
> +			      struct dma_fence *fence,
> +			      bool evict,
> +			      bool pipeline,
> +			      struct ttm_resource *new_mem)
>   {
>   	struct ttm_bo_device *bdev = bo->bdev;
> -
>   	struct ttm_resource_manager *from = ttm_manager_type(bdev, bo->mem.mem_type);
> -	struct ttm_resource_manager *to = ttm_manager_type(bdev, new_mem->mem_type);
> -
> -	int ret;
> +	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
> +	int ret = 0;
>   
>   	dma_resv_add_excl_fence(bo->base.resv, fence);
> +	if (!evict)
> +		ret = ttm_bo_move_to_ghost(bo, fence, man->use_tt);
> +	else if (!from->use_tt && pipeline)
> +		ttm_bo_move_pipeline_evict(bo, fence);
> +	else
> +		ret = ttm_bo_wait_free_node(bo, man->use_tt);
>   
> -	if (!evict) {
> -		ret = ttm_bo_move_to_ghost(bo, fence, to->use_tt);
> -		if (ret)
> -			return ret;
> -	} else if (!from->use_tt) {
> -
> -		/**
> -		 * BO doesn't have a TTM we need to bind/unbind. Just remember
> -		 * this eviction and free up the allocation
> -		 */
> -
> -		spin_lock(&from->move_lock);
> -		if (!from->move || dma_fence_is_later(fence, from->move)) {
> -			dma_fence_put(from->move);
> -			from->move = dma_fence_get(fence);
> -		}
> -		spin_unlock(&from->move_lock);
> -
> -		ttm_bo_free_old_node(bo);
> -
> -		dma_fence_put(bo->moving);
> -		bo->moving = dma_fence_get(fence);
> -
> -	} else {
> -		/**
> -		 * Last resort, wait for the move to be completed.
> -		 *
> -		 * Should never happen in pratice.
> -		 */
> -		ret = ttm_bo_wait_free_node(bo, to->use_tt);
> -		if (ret)
> -			return ret;
> -	}
> +	if (ret)
> +		return ret;
>   
>   	ttm_bo_assign_mem(bo, new_mem);
>   
>   	return 0;
>   }
> -EXPORT_SYMBOL(ttm_bo_pipeline_move);
> +EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
>   
>   int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>   {
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 25cc932d63f1..864afa8f6f18 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -642,6 +642,7 @@ void ttm_bo_free_old_node(struct ttm_buffer_object *bo);
>    * @bo: A pointer to a struct ttm_buffer_object.
>    * @fence: A fence object that signals when moving is complete.
>    * @evict: This is an evict move. Don't return until the buffer is idle.
> + * @pipeline: evictions are to be pipelined.
>    * @new_mem: struct ttm_resource indicating where to move.
>    *
>    * Accelerated move function to be called when an accelerated move
> @@ -653,23 +654,9 @@ void ttm_bo_free_old_node(struct ttm_buffer_object *bo);
>    */
>   int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>   			      struct dma_fence *fence, bool evict,
> +			      bool pipeline,
>   			      struct ttm_resource *new_mem);
>   
> -/**
> - * ttm_bo_pipeline_move.
> - *
> - * @bo: A pointer to a struct ttm_buffer_object.
> - * @fence: A fence object that signals when moving is complete.
> - * @evict: This is an evict move. Don't return until the buffer is idle.
> - * @new_mem: struct ttm_resource indicating where to move.
> - *
> - * Function for pipelining accelerated moves. Either free the memory
> - * immediately or hang it on a temporary buffer object.
> - */
> -int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
> -			 struct dma_fence *fence, bool evict,
> -			 struct ttm_resource *new_mem);
> -
>   /**
>    * ttm_bo_pipeline_gutting.
>    *

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
