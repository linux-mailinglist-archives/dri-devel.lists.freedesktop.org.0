Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BE380A026
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 11:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C57710EA5D;
	Fri,  8 Dec 2023 10:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A57910EA55;
 Fri,  8 Dec 2023 10:00:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUPbc5HKzjJ3MaehPO+daIWJtqv8+kacX4OCBom7UTg1v/xZneuoIvf2mFI5b87WSW5yNlzXSDk87Vfb0n2+NR2V/IdG9h4JuQ5lfsec6xjuF2v7JLYlgOAENGqzvSygEyZ8oPh7OE3GD59+H5qtKftbJe+rkJCFkJE9bjyhgpOZo6FBxI1qjB7TSkVkBhbpgwZZdJyenPajWc8udT3ZoYS9go5MnZMCW9v5YLIRR1Bck6l/Qijb01u15Di2lAvZPrpeuKjIv4X97eXbh7DlPiTSjZXvrM7FBZQj5zEd3ChOHAzZxNWxBNgPaGFYaKPqIwuzpWlGToCYyJ/S7M32KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4PMG0hTUOZOm2u+nSpuFzH0iVuI5i6FoAUYggyCUAA=;
 b=GznWF3pLWT94b1IykIEkUk8h2VhKINnVnGyAdjlTHfb+vfjWAnVKdoOnWhmSDB8TBpU1v0Z703H86MNtadmAeKqAPWXHOhbTegqZK/SA46gUVeqpRvxrlzZ2Kk/0S5D1cl9IaKZ45yU65BOfcqTtHu5gcAmGOM8f/5jFEKyzciu9+Mn1+gD7oEuy/9XAtPBSj8+0Quho1o8018LygkYj11khVqUEkAog49UZuStSnxKMEi7VcX9MndxV9DBq5fjWxmf94WHrhPwmrrx6iHRky24yhRrHtO5PM+bVAJGFr/Dv5U14iSooAZ3ANFoI5PdNVkmBYMiPY6XtODrj+yLICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4PMG0hTUOZOm2u+nSpuFzH0iVuI5i6FoAUYggyCUAA=;
 b=nf//Tq71eJx0XB2WmX3WwwA0QJYzADmRJGrfysDY/NB7X543WVBC6GgJl83lz6lqWye3Jh6TCSqFuYCpik9MMSRT+vA0O8o5oI7qeASd0hQZlt3bN/4L3PO+kS8vkcLBL+hpK7+v7j1swSn9bEPDaBPVauhgUxE5kddx6iTO5Mg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN6PR12MB8515.namprd12.prod.outlook.com (2603:10b6:208:470::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 10:00:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 10:00:56 +0000
Message-ID: <d30b7992-5c39-49f5-889c-c31d4994a5c3@amd.com>
Date: Fri, 8 Dec 2023 11:00:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
 <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN6PR12MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd29625-8427-469f-67f5-08dbf7d4923f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 98jemNCkV2/Jc7yNdww5eCPIT7RrypH7yYx4M7a36Y+WK/AfXTQ5+LUNasI1TKtjB7XNVNfe+x9w/YhgOxbElOmo1F1AoszlhEqmhk00KSrnVmKur61+3R9JJKThu+QINk2YeUUEv6kBU7EDhrtOx7VftRR4daUFwENcZEKojWNMzIY0WsRizcQyKgSvrYhovNGYt+WTk0MIAmHZJjUSRg5IyEoR8/TLsFVjK4t/LO+uu/QiDLu2I+TtTkt0Q6VSEK8r/SZUWTfBo4Cru/aiC1pwwmamPxfWrlCLhdbJ7BdPqSUPyGKj2yvETYjMPWkobjKV7YvK9HIDY1cgF0kJBrOfv4yqrECqxofZDtvirZcMagyyhtSrK9Kd0Lt42tsqEsXrQJGdXbX/CtkjRPEm42szIeDdC992Ud1Vx566nZ+kG4NFMASXUiMp7OLUQb0mKtnypyPdPucuYfAC5/vLS2GawoI/Te4BbNU7Eqbc72w2PYiqwKuL4u5RvkFMNGFxrkVf5SYkBFlz63IpTBdyreNamvSiW8Q4IwYYA4jvHNdPYyTgG+uqW3Oc+YJN8SBglsWbVZ8nlkfiltiVY5tSVC11G1qzc+UFx1GiNv/sEr9+oQJDdnwdshXQU/JKSgCmnhsF6FnA7Ub5Deuz2Z89RQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(39860400002)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6506007)(6666004)(2616005)(38100700002)(26005)(41300700001)(6512007)(83380400001)(66946007)(66556008)(66476007)(316002)(6486002)(478600001)(31686004)(86362001)(2906002)(5660300002)(4326008)(31696002)(8936002)(8676002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGM1UkdnNE5adUxYeE9YT3Vud25qUnZCMUlnWWY4czBUL2Q4V2M4WVdTckhR?=
 =?utf-8?B?Z3FFbnV3bkdBK0l2MFhuL0FJNXVxeDJRUHZrZXlseHdXZmhyekI2UHVZL3h0?=
 =?utf-8?B?aG56bTVOWGUxZGNjSGFzUjEyRlprSitEaW9rNVpSUXBaWUxWcUZ5cy9WaTBl?=
 =?utf-8?B?SUNDNGx3Nm14aFljTHVPVVNhdTgwS1c5WUdqVllsWnRLeU5WRThkbDUxYVl1?=
 =?utf-8?B?QVY5cFRrRzkvZFNLajU3Rlc3TjZ2ZXZ1ZW95MTdSYWs5TzcvcmpJYWhwR3c2?=
 =?utf-8?B?SFN4Z0xuSnA4QjJKSFgvaUI4T3JDY3AxeTZKTDl3UExkM2pwb240VENwL2NB?=
 =?utf-8?B?MGttM3UyaE1NS3JLUTNNU0IvOVh5VlVPQ2RacERwWFVBZVVwc3pPV2NzVi9X?=
 =?utf-8?B?NGVJK045L0hBR0FoTytOSTVNL1pUNE9FL3RzVm1uZjR3SE5Lc0xxeWV3YXl4?=
 =?utf-8?B?YmZwSi82andDSXYzT3A2Wk5MY3V0WVNMQStuMDZtc0dyMTFHS1Nwd25RaXpM?=
 =?utf-8?B?QzVOaFJQL3hrT0h2M0wza05kNkRBbWhsZ1U0NGp1bUVkY2JLN1RaUms3aVJO?=
 =?utf-8?B?ZnJsaEpjMkZsWHJzT3N5QWNkeHJTTDBGR09UakN0dXFwTUVYQlo3M2FubVdJ?=
 =?utf-8?B?VWlBd0RmQkR5SjVubWt6b1cwVVJHQWdydk9KSzRwSENER1FxRDVFVlBqSHpF?=
 =?utf-8?B?NGwrcW1HUzBVM2V3eUg3VWw5S3JVNUdpTk1DUFhRNEVGNy90UVhLZmdGN0dJ?=
 =?utf-8?B?bGlvaU10cld3MDdNODNLck04bzFKZk1GREdHdmVQTjA5Z0VUVk55UTFiYk9z?=
 =?utf-8?B?a2JpR245MmNvSnJCbHgvS2hnaUxsRExCdExHY1NlYW1LYkUweE53L1NoT0ZZ?=
 =?utf-8?B?TWl3WFlxa2MyYVJlZkpsMmlta0lKbHdEL0ZOMTZ2dnBPRHgxdVRyRUk2NlNX?=
 =?utf-8?B?ZkcvdEVJcTFubW9RbmYvTzkydHp5NDI2NGJFSHorMnFURHhjY1lGSlRnYU9x?=
 =?utf-8?B?ME1zYzRIWGV5SWNackl6UGNvSks4S3lETnVYRjl3TWNDVlpjcjdMR28reE42?=
 =?utf-8?B?Sk8xMlVXZVdkVkRnc2ozWnFJUlJiOXloN1RYalBpNXdtU0xIZFhtSlNvUU4r?=
 =?utf-8?B?S0dWMzRRRHUySGRqSkgyYTVRSU5WVUtva1N1Q1I4WjFmWVExaUdFYWQzTFJQ?=
 =?utf-8?B?bzQrY29ycnZKRmd0TFFveXhrK21XMHJvbDJDcHptYWQzMWRwdXR6N1ZzdUlT?=
 =?utf-8?B?eXZ5a3c0cW1KU1BSWjJqZGZlU2doMlJBRGJEaWUrazhwRHNlNjM5a3VVZ29B?=
 =?utf-8?B?d0RDN1JUOWxlN0dxWDE2Z2lHeTVsT3BtejExdUdnUVRGb3kxQjhOaTZCOVlt?=
 =?utf-8?B?a0t3ZDJiZUc2UEc1UmRSVlE0S3JzM1JFb1U3UHZUU0YxdXJyUFdCMjk5ajJC?=
 =?utf-8?B?OC82Z04wNVVnUDQreVA3cmFENXowcDE1R29ocGhnWUwxSHczYjQ0MGx6MTY2?=
 =?utf-8?B?VkhOS3Fkb1pmNjNFTTF6UGE2TnlFdHpQTUpiRWJOZ3lBSXFReFMxWHJxNXBL?=
 =?utf-8?B?amwrSDFmY1R4Zmk5ZUNuTVYwN2k2dVl4eC9FZVJTdFpvU0JaSG5jQTlIRnUr?=
 =?utf-8?B?aU1ldkZZZmM3Z21TcXRadmZmSjZtVGlwUkZhN2JaNEc1Y3ErazBJcG5yQjFk?=
 =?utf-8?B?WmxNM2E1NmNWeWMxTjk4VFNUWC9iWjJLSmQ4akFkVmRQOVM4ZGZZYkZkMDlZ?=
 =?utf-8?B?ckVjZ0RHTkxQanNTUUt4Y1FianFVT3p1c0ZjSHE5TjNEWVdCVGxCcFVNKzdZ?=
 =?utf-8?B?d2liT0dsZ1ltb2t0bzBzMEpnT3pkRVZzR1RHSkx6RlBuSnRLWlZTdzcvM0pi?=
 =?utf-8?B?Nkdob0NoRUQ0dnBjcDNyczA3dm1oNThzY2h4MCtLU2FHangwTmFzRVRoNE1Z?=
 =?utf-8?B?M0RjWjg2cXZTNDJyekd1bDk5eUdSbGlIRlRZR3RwQTBtbXFSUW9NV3FFZEF2?=
 =?utf-8?B?elhxZUJsS3pkUU0wVkxERlhScU1DVXJTcTVSY0xMYTBoL3FYNHVZTEd0MDVp?=
 =?utf-8?B?ZFB4enZoZFJqb2FhOTMrOG0yYmJiOTZVZ1ZFbDJVckZkZUwxUG9RUXRsUFhi?=
 =?utf-8?Q?JhZU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd29625-8427-469f-67f5-08dbf7d4923f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 10:00:56.8737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uODBXDBihmEfAjeKDCatScHHx+DmDi4bgI6JX7iMaCtQjV+mSofYF7tL7X9fFV0o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8515
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.12.23 um 16:11 schrieb Arunpravin Paneer Selvam:
> Add clear page support in vram memory region.

The first patch looks good, but this here needs quite some work.

>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 13 +++--
>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 50 +++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  4 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 14 +++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
>   6 files changed, 105 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index cef920a93924..bc4ea87f8b5e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -39,6 +39,7 @@
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
> +#include "amdgpu_vram_mgr.h"
>   
>   /**
>    * DOC: amdgpu_object
> @@ -629,15 +630,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   
>   	if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>   	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
> -		struct dma_fence *fence;
> +		struct dma_fence *fence = NULL;
>   
> -		r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, true);
> +		r = amdgpu_clear_buffer(bo, bo->tbo.base.resv, &fence, true);
>   		if (unlikely(r))
>   			goto fail_unreserve;
>   
> -		dma_resv_add_fence(bo->tbo.base.resv, fence,
> -				   DMA_RESV_USAGE_KERNEL);
> -		dma_fence_put(fence);
> +		if (fence) {
> +			dma_resv_add_fence(bo->tbo.base.resv, fence,
> +					   DMA_RESV_USAGE_KERNEL);
> +			dma_fence_put(fence);
> +		}
>   	}
>   	if (!bp->resv)
>   		amdgpu_bo_unreserve(bo);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index 381101d2bf05..50fcd86e1033 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   	}
>   }
>   
> +/**
> + * amdgpu_res_cleared - check if blocks are cleared
> + *
> + * @cur: the cursor to extract the block
> + *
> + * Check if the @cur block is cleared
> + */
> +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
> +{
> +	struct drm_buddy_block *block;
> +
> +	switch (cur->mem_type) {
> +	case TTM_PL_VRAM:
> +		block = cur->node;
> +
> +		if (!amdgpu_vram_mgr_is_cleared(block))
> +			return false;
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 05991c5c8ddb..6d7514e8f40c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2222,6 +2222,56 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>   	return 0;
>   }
>   
> +int amdgpu_clear_buffer(struct amdgpu_bo *bo,
> +			struct dma_resv *resv,
> +			struct dma_fence **fence,
> +			bool delayed)

Drop the delayed parameter, that doesn't make any sense here.

And as Alex said please use an amdgpu_ttm_ prefix for the function name.

> +{
> +	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_res_cursor cursor;
> +	struct dma_fence *f = NULL;
> +	u64 addr;
> +	int r;
> +
> +	if (!adev->mman.buffer_funcs_enabled)
> +		return -EINVAL;
> +
> +	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
> +
> +	mutex_lock(&adev->mman.gtt_window_lock);
> +	while (cursor.remaining) {
> +		struct dma_fence *next = NULL;
> +		u64 size;
> +
> +		/* Never clear more than 256MiB at once to avoid timeouts */
> +		size = min(cursor.size, 256ULL << 20);
> +
> +		if (!amdgpu_res_cleared(&cursor)) {

This needs to come before the min(cursor.size....) directly above. I 
suggest a handling like this:

if (amdgpu_res_cleared(&cursor)) {
	amdgpu_res_next(&cursor, cursor.size);
	continue;
}

size = min(....

> +			r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
> +						  1, ring, false, &size, &addr);
> +			if (r)
> +				goto err;
> +
> +			r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
> +						&next, true, delayed);
> +			if (r)
> +				goto err;
> +		}
> +		dma_fence_put(f);
> +		f = next;
> +
> +		amdgpu_res_next(&cursor, size);
> +	}
> +err:
> +	mutex_unlock(&adev->mman.gtt_window_lock);
> +	if (fence)
> +		*fence = dma_fence_get(f);
> +	dma_fence_put(f);
> +
> +	return r;
> +}
> +
>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   			uint32_t src_data,
>   			struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 65ec82141a8e..838251166883 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -155,6 +155,10 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>   			       uint64_t size, bool tmz,
>   			       struct dma_resv *resv,
>   			       struct dma_fence **f);
> +int amdgpu_clear_buffer(struct amdgpu_bo *bo,
> +			struct dma_resv *resv,
> +			struct dma_fence **fence,
> +			bool delayed);
>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   			uint32_t src_data,
>   			struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index d0e199cc8f17..ff74c324b5b5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -435,6 +435,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   {
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> +	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>   	u64 vis_usage = 0, max_bytes, min_block_size;
>   	struct amdgpu_vram_mgr_resource *vres;
>   	u64 size, remaining_size, lpfn, fpfn;
> @@ -486,6 +487,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>   		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>   
> +	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
> +		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> +
>   	if (fpfn || lpfn != mgr->mm.size)
>   		/* Allocate blocks in desired range */
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> @@ -579,7 +583,9 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   	struct amdgpu_vram_mgr_resource *vres = to_amdgpu_vram_mgr_resource(res);
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> +	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(res->bo);
>   	struct drm_buddy *mm = &mgr->mm;
> +	struct dma_fence *fence = NULL;
>   	struct drm_buddy_block *block;
>   	uint64_t vis_usage = 0;
>   
> @@ -589,7 +595,13 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   
>   	amdgpu_vram_mgr_do_reserve(man);
>   
> -	drm_buddy_free_list(mm, &vres->blocks, 0);
> +	/* Clear all the blocks in free path */
> +	if (!amdgpu_fill_buffer(bo, 0, NULL, &fence, true)) {
> +		vres->flags |= DRM_BUDDY_CLEARED;
> +		dma_fence_put(fence);
> +	}
> +

That's a pretty clear no-go. This is the backend and CS is done from the 
front end. E.g. can't properly wait for the fence for example.

Instead use the AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE flag for this.

IIRC we already always set this flag when ras is enabled, just make it 
mandatory for now.

> +	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
>   	mutex_unlock(&mgr->lock);
>   
>   	atomic64_sub(vis_usage, &mgr->vis_usage);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> index 0e04e42cf809..8478522d7366 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -53,6 +53,11 @@ static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>   	return (u64)PAGE_SIZE << drm_buddy_block_order(block);
>   }
>   
> +static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block *block)
> +{
> +	return drm_buddy_block_is_clear(block);
> +}
> +

You also need a functionality which resets all cleared blocks to 
uncleared after suspend/resume.

No idea how to do this, maybe Alex knows of hand.

Regards,
Christian.

>   static inline struct amdgpu_vram_mgr_resource *
>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>   {

