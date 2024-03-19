Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C73387FF10
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 14:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7BB10E417;
	Tue, 19 Mar 2024 13:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ynfx99qq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2139.outbound.protection.outlook.com [40.107.244.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0740B10E417;
 Tue, 19 Mar 2024 13:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2h2MDqSMEjtczAiI4tCabZ/LA8473qmNOYJmMZLpTwcShDZVgUW/meXgIh2mDgM7DnleYrOJe59M2OTQd6O8Yi2hRzmWb8RNEk6JQwRF3M0iKYTX+Zj/iW0Q8LYzf4WnesWtx7KA6QFeRra2tIjneXGLPP0zzh1Xk/jv3B5mStmcQzOi0wADwenvcjRFMo4AxCeHKQMSR94Vdk+UmWf8JcjBIKjCD8srM+5QGcQU16mOVRj9AXs5V7YKd3/mJuooXOIwNvRf5dVvTzphMJDlcXa1B+G8y9DwIag1N+7jgJ2+NzFOb2hXRRYHnuIP3mf7ngdBOIcv+0w9j3PLuQVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUI5/lizfRzWZxgYj2wsnoPVd87wmt6A77ec09sw9S8=;
 b=Ea3Mg8lorkHw8L8Oy2s/nPgKOz5sjTTmeja1ED2nfTscgx9nOCOlOMf325Xt6YoSyatJ3AOZ7UkjkbWdaBZj6HdZnzfUVcELGBl5ukk8RmoM+Zc4eOxgpdMTmc2tyHUayL3BMNzvaE2dPPdgzVpxQG6aI1TEc9gSOseMb4e176qdIW/IY5SDkzj2qVZypuARpTD1Y/CKkWuv4mNLCceRWYhDTIFq+6idVToW3aPOMXHirXPi3IzYWNZ8yqQvYS1yzxMchY/8R8BDwrdXDZymwecRQFFW7+KjUGrOoBop8GsExFT54EKob67PUIdE/Y6+RHXdIVHoePCko4VEDeB9Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUI5/lizfRzWZxgYj2wsnoPVd87wmt6A77ec09sw9S8=;
 b=ynfx99qqp0ZDC2eMgu8IOFknbe7tyWIVysKQsuEpi5UeymQyzcHIz4EzBJF8RCodzsGj7BwZR68xsfw/bwSI6wZ8fQ1Gi7t3YHuCyUlPwJLkf7Y7958qO8W2dAktOjuUsgW+mTBpRiXQp65D7PcWWfNQy2noxTeSmncuxtDca60=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7292.namprd12.prod.outlook.com (2603:10b6:930:53::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 13:47:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 13:47:39 +0000
Message-ID: <9c362ae3-b9e3-40ac-b8e4-382aeb287b45@amd.com>
Date: Tue, 19 Mar 2024 14:47:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, matthew.auld@intel.com,
 mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
 <20240318214058.2014-2-Arunpravin.PaneerSelvam@amd.com>
 <b1fc43cf-699f-496d-a239-11a5b288292b@gmail.com>
 <3ecac135-62ae-460d-b268-dde9f1860d14@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3ecac135-62ae-460d-b268-dde9f1860d14@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7292:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hN5Sds4tsfOMc2xUSM7CzjsW01HancgWclqI64Z70Nt2SbQKXmsOGSVzMUe2GaW87b26CTubDayImvBgo3FGnJovSnfQuuQcuz1hRVaKVugTtO45587gp7uZakBIjkkxfSwgbnpRnm0LS9vsZz8vrHtpSD8Tpx9H/ZYNSnjHGUC3khreJT3SR5dHvHI3C30R3b6Brf/YEause/H7bWtmc17I4hA5ae5CZRvJsyxfvqIO3EBjzoY22JKY4qswGMn8hOgzQmxHwm6DM9hbp9p7FMO9sVfXUZKjmSXbvCysh2SgwT+NZkqUXnR3tO6/3OMcXNQD0898ByCxmgK+Lwr8rdqhxDqwVX1SXEAHT4PiyimGn2EDov0Gq7d2Xlfwt+4g+g+tIBSWj8yOEuIanTK5/H60HELhQ4jl5/sbj3H6qsoITAMDCH75I3meeu4FDGeTgdKhGFHlEO5xUWuVXHAVTL/DsiG3eZGnSnNu+86U7DUGNAAPofg9ItfPkxpD2FTcxz9f5CHcuPHUJ3+Z7QIKLf5c4DoNTzXuxepkO9gXUa6YeeBNJ+avnXTxndnoBetYnm9FjWFawz1Wz2CL6oy9uNAfHgkD/GJArNWU583Ug7vfvjoJtZ9L3I+iqMJpxWRMUoA8QYrLpR29X4ND3gU1aoIeFMjNosq2f5GfVDrli+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1J6c0NQak5BT3NWd3lkb0JpNXcwUFdLZlpYVEw3NlZuNDdVWmNkZHoraGlX?=
 =?utf-8?B?MWdpbDVGWEo1Z01YM2NaN1J3ZngwNXd1dU4xWWl2ZENYVDhiVlRRWTNEanRG?=
 =?utf-8?B?OENiRm1OcC9YbjZiRE1CbGdIRWY3V2FkYWhZUWpFbUx0dTVyeWpIYTQxOHgz?=
 =?utf-8?B?MkdFWjZBbThRaG9OTEVkNHRGMmpGNHpWc0FZaFNOcE94NVYxWHhHc21HNWxM?=
 =?utf-8?B?Vkg3QXBmRzVYRVRUMVNtMjJFMExEaTR3QUEyQ2h5d3N5MVgvVVBMdUUvRExS?=
 =?utf-8?B?RVVVeDJFYkoxWWtmTWkzczcyQ2V4QzM5Tkxha3NRL1hLMVgxc01vaGtBMlU3?=
 =?utf-8?B?QTg4Z3ZtQmI2REhQT2FTOUwyd0FTNUwxWnhRS0kwVlBNNnR0S2dQMkcwbi9h?=
 =?utf-8?B?Z3BJSUd0eUpDTWNiU1Z2anFic1F0ZW1MSXhmOS81c2dieWRITlF3R21TVk5u?=
 =?utf-8?B?d216WCtTcTRPVm9qT00xbE1oTEtHdWJTbFRBeDMrcmFOWVhzbTBpUktzZ3lY?=
 =?utf-8?B?QzlqeGZsa1NoQVh0SmFhMWNSNzYrbTBxdFVFVFdicjhKclVXQnNFbFlZZEV3?=
 =?utf-8?B?TDZ0S0Q0cnNhUlVVbkFjYW9IMFhOV0lUbXQwZFhEOEx3Sy9uSUFqenFKWEUv?=
 =?utf-8?B?VHpaTUVTTkI2eU1rb3hqU2tPVllaTC9SK1Q5aUZjdlhmNWs0TkpUV0lINnFR?=
 =?utf-8?B?V2FaNGdrRWpVeUl6ZzNUQUhDa1NHdm13dWhDMUZYTE1Ec1dDMEZ2ZlZBZU5m?=
 =?utf-8?B?SktncUtlYTk3czA2clg5bm1IL0ticGg0dGVtY0twQXAwa3FJSG5KRlgwcGhE?=
 =?utf-8?B?QXM1T0phN1ZUSS9jSUIvMlhMdkE0VG8wMGdTYWtPREpaSTcwRHZKRDdhZk1I?=
 =?utf-8?B?dmFBWjNCY0VFWUgvN2E3T1YvcStFMytDcHJwYmIzTDFnSGJGMFlscEdYSEd1?=
 =?utf-8?B?a2lta3RvMCtnN1RBRXhQc3JEOXladVhPQ0lvcUFFbEtrQ1ZhbG9mUm5jRnRT?=
 =?utf-8?B?YmNINHBnV2g2QVluUEEyMURRdkdkRExlMEd2TUdVNzEvYkgzQnA1NitwaUFD?=
 =?utf-8?B?WENha1JjYTBFbXU0czNvTFhFL29ydXJKTEdKRndJTXlxTkg3dmJZQUszVjB5?=
 =?utf-8?B?elNtckxrb1RCR0pkZitIakQra05HWGlwSXorSm9NRXBKMnk4c24zOXRYN0Ry?=
 =?utf-8?B?YjB3RU5GaVcyd2R6YXJWMGx6VUh5eVpMZHN2a3NtRUVsVlFjU0x0TmdsMStK?=
 =?utf-8?B?ZC9MbElXeEtOUzljVm8vbE9RSnZlWTNlMjFOelR1MytLOUlPdThPaDJUZ3A3?=
 =?utf-8?B?d3RiQ1JpWnJBOGIzUmI0YUY3YVdHK0pkdjEzTE0yRGw4SS9zQzhuK0M1K053?=
 =?utf-8?B?NDZybXFacWk3VDQySmxYZGdlYlRsdXNQdlNXaVN3SmFza1c5SU5IbEJ5V1Uw?=
 =?utf-8?B?bUpMWFBaVHorVEluTlVUejdSaWxYQ3lIRFduRVFvSWZVK2Zaamdpc2lsVWVH?=
 =?utf-8?B?bUQzNTB4UGVIUjRnMHRzMUhvbHA2dk40Q3JHNVFsNEduV2NjKzFvK0tteGlT?=
 =?utf-8?B?NmdjUDQ3UExmR2tGRmt1Q3FWNEMrUnU3WXBYVkhOQjUwUTcvYWc3RlpFUjBv?=
 =?utf-8?B?RkphOEJlZmRuY0xCWitDcUR6R3JYQlM0SFRVcHZNNjQzTGlCTzZHZHl0VjZn?=
 =?utf-8?B?YVRpb3ZBK1gwc0RSQ3FsK1BsdWNycXFQUGIrbCtEQUN6SmpIbFJ5dEJVYnYv?=
 =?utf-8?B?bTRXMGc2bWlDUnFXRk9BTzdBdnk1N2luWHFWTTZGNHJ6a2FIcXBFT2tDT3pp?=
 =?utf-8?B?NUZyd2RyM3N1MlZ3NXAwc3cxR0xOMFRyOGtMbUdBUkV2QlhKblpkZFBsNENj?=
 =?utf-8?B?UzBmclpDMXo0eWtMeW9RdVBvOHkvS2NVeERULzQ1bzFiU1J0NnpHZXBXaUVU?=
 =?utf-8?B?UkxDL0VENUJ0Mmg1MHBnYmpHU3FpamsyUktiSEU4ZEo0d1dSV0ZIcHV5VkZF?=
 =?utf-8?B?NXBQT3lGZTAzQk9SNjNVQzdmeWhzeGtvcVVIandqb0VTV2orS0VtY3k0UzBn?=
 =?utf-8?B?VnVkUm1VamU4dWFZaXlmWVdaTlR0TE85L3AyTHVWOTcybDkxb2YvZU9aMHhR?=
 =?utf-8?Q?xOS4frRpvNzusS8qpaYFVIQa5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab7ea54-cb1b-4c60-8700-08dc481b24b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 13:47:39.8346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3Zyg7N+nk0ZT//fMrCotbaDggbfAl30ejGpl7sX8c1AfZtEbQaNtVbdnfjm4hSn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7292
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

Am 19.03.24 um 12:41 schrieb Paneer Selvam, Arunpravin:
> Hi Christian,
>
> On 3/19/2024 3:58 PM, Christian König wrote:
>>
>>
>> Am 18.03.24 um 22:40 schrieb Arunpravin Paneer Selvam:
>>> Add clear page support in vram memory region.
>>>
>>> v1(Christian):
>>>    - Dont handle clear page as TTM flag since when moving the BO back
>>>      in from GTT again we don't need that.
>>>    - Make a specialized version of amdgpu_fill_buffer() which only
>>>      clears the VRAM areas which are not already cleared
>>>    - Drop the TTM_PL_FLAG_WIPE_ON_RELEASE check in
>>>      amdgpu_object.c
>>>
>>> v2:
>>>    - Modify the function name amdgpu_ttm_* (Alex)
>>>    - Drop the delayed parameter (Christian)
>>>    - handle amdgpu_res_cleared(&cursor) just above the size
>>>      calculation (Christian)
>>>    - Use AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE for clearing the 
>>> buffers
>>>      in the free path to properly wait for fences etc.. (Christian)
>>>
>>> v3(Christian):
>>>    - Remove buffer clear code in VRAM manager instead change the
>>>      AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set
>>>      the DRM_BUDDY_CLEARED flag.
>>>    - Remove ! from amdgpu_res_cleared(&cursor) check.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
>>
>> Just a few nit picks below, but in general already looks good to me.
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 22 ++++---
>>>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 61 
>>> ++++++++++++++++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
>>>   6 files changed, 111 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> index 8bc79924d171..c92d92b28a57 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -39,6 +39,7 @@
>>>   #include "amdgpu.h"
>>>   #include "amdgpu_trace.h"
>>>   #include "amdgpu_amdkfd.h"
>>> +#include "amdgpu_vram_mgr.h"
>>>     /**
>>>    * DOC: amdgpu_object
>>> @@ -601,8 +602,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>>       if (!amdgpu_bo_support_uswc(bo->flags))
>>>           bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
>>>   -    if (adev->ras_enabled)
>>> -        bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>> +    bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>>         bo->tbo.bdev = &adev->mman.bdev;
>>>       if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
>>> @@ -632,15 +632,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>>         if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>>>           bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>>> -        struct dma_fence *fence;
>>> +        struct dma_fence *fence = NULL;
>>>   -        r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, 
>>> true);
>>> +        r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
>>>           if (unlikely(r))
>>>               goto fail_unreserve;
>>>   -        dma_resv_add_fence(bo->tbo.base.resv, fence,
>>> -                   DMA_RESV_USAGE_KERNEL);
>>> -        dma_fence_put(fence);
>>> +        if (fence) {
>>> +            dma_resv_add_fence(bo->tbo.base.resv, fence,
>>> +                       DMA_RESV_USAGE_KERNEL);
>>> +            dma_fence_put(fence);
>>> +        }
>>>       }
>>>       if (!bp->resv)
>>>           amdgpu_bo_unreserve(bo);
>>> @@ -1365,8 +1367,12 @@ void amdgpu_bo_release_notify(struct 
>>> ttm_buffer_object *bo)
>>>       if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
>>>           return;
>>>   -    r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, 
>>> &fence, true);
>>> +    r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
>>>       if (!WARN_ON(r)) {
>>> +        struct amdgpu_vram_mgr_resource *vres;
>>> +
>>> +        vres = to_amdgpu_vram_mgr_resource(bo->resource);
>>> +        vres->flags |= DRM_BUDDY_CLEARED;
>>
>> Those lines should probably be in the VRAM manager.
> This flag is set based on the amdgpu_fill_buffer() function return 
> value, can we move the amdgpu_fill_buffer() function call and
> DRM_BUDDY_CLEARED flag set lines to amdgpu_vram_mgr_del() in VRAM 
> manager and does it require to wipe the VRAM buffers here as well
> without setting the DRM_BUDDY_CLEARED.

No that won't work. The call to amdgpu_fill_buffer() *must* be here 
because that here is called before the resource is actually freed.

Only setting the vres->flags should probably be moved into 
amdgpu_vram_mgr.c.

So instead of calling that manually here just make a function for it to 
keep the code related to the buddy allocator in one place.

Regards,
Christian.

>>
>>>           amdgpu_bo_fence(abo, fence, false);
>>>           dma_fence_put(fence);
>>>       }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>>> index 381101d2bf05..50fcd86e1033 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>>> @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct 
>>> amdgpu_res_cursor *cur, uint64_t size)
>>>       }
>>>   }
>>>   +/**
>>> + * amdgpu_res_cleared - check if blocks are cleared
>>> + *
>>> + * @cur: the cursor to extract the block
>>> + *
>>> + * Check if the @cur block is cleared
>>> + */
>>> +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
>>> +{
>>> +    struct drm_buddy_block *block;
>>> +
>>> +    switch (cur->mem_type) {
>>> +    case TTM_PL_VRAM:
>>> +        block = cur->node;
>>> +
>>> +        if (!amdgpu_vram_mgr_is_cleared(block))
>>> +            return false;
>>> +        break;
>>> +    default:
>>> +        return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index 8722beba494e..bcbffe909b47 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -378,11 +378,15 @@ static int amdgpu_move_blit(struct 
>>> ttm_buffer_object *bo,
>>>           (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>>>           struct dma_fence *wipe_fence = NULL;
>>>   -        r = amdgpu_fill_buffer(abo, AMDGPU_POISON, NULL, 
>>> &wipe_fence,
>>> -                    false);
>>> +        r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
>>> +                       false);
>>>           if (r) {
>>>               goto error;
>>>           } else if (wipe_fence) {
>>> +            struct amdgpu_vram_mgr_resource *vres;
>>> +
>>> +            vres = to_amdgpu_vram_mgr_resource(bo->resource);
>>> +            vres->flags |= DRM_BUDDY_CLEARED;
> Does it require to set the DRM_BUDDY_CLEARED flag as we are not 
> freeing the VRAM buffers?
>>>               dma_fence_put(fence);
>>>               fence = wipe_fence;
>>>           }
>>> @@ -2214,6 +2218,59 @@ static int amdgpu_ttm_fill_mem(struct 
>>> amdgpu_ring *ring, uint32_t src_data,
>>>       return 0;
>>>   }
>>
>> Some kerneldoc here what the function does would ne nice to have.
>>
>>> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>> +                struct dma_resv *resv,
>>> +                struct dma_fence **fence)
>>> +{
>>> +    struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>> +    struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>> +    struct amdgpu_res_cursor cursor;
>>> +    struct dma_fence *f = NULL;
>>
>> It might be cleaner to just use the stub fence here (see 
>> dma_fence_get_stub()).
>>
>> This would avoid to local variable init in the caller and the if 
>> which checks if the function returned a fence or not.
>>
>>> +    u64 addr;
>>> +    int r;
>>> +
>>> +    if (!adev->mman.buffer_funcs_enabled)
>>> +        return -EINVAL;
>>> +
>>> +    amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), 
>>> &cursor);
>>> +
>>> +    mutex_lock(&adev->mman.gtt_window_lock);
>>> +    while (cursor.remaining) {
>>> +        struct dma_fence *next = NULL;
>>> +        u64 size;
>>> +
>>> +        if (amdgpu_res_cleared(&cursor)) {
>>> +            amdgpu_res_next(&cursor, cursor.size);
>>> +            continue;
>>> +        }
>>> +
>>> +        /* Never clear more than 256MiB at once to avoid timeouts */
>>> +        size = min(cursor.size, 256ULL << 20);
>>> +
>>> +        r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
>>> +                      1, ring, false, &size, &addr);
>>> +        if (r)
>>> +            goto err;
>>> +
>>> +        r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
>>> +                    &next, true, true);
>>> +        if (r)
>>> +            goto err;
>>> +
>>> +        dma_fence_put(f);
>>> +        f = next;
>>> +
>>> +        amdgpu_res_next(&cursor, size);
>>> +    }
>>> +err:
>>> +    mutex_unlock(&adev->mman.gtt_window_lock);
>>> +    if (fence)
>>
>> Just make fence a mandatory parameter and drop the if and the get/put 
>> dance.
>>
>>> +        *fence = dma_fence_get(f);
>>> +    dma_fence_put(f);
>>> +
>>> +    return r;
>>> +}
>>> +
>>>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>               uint32_t src_data,
>>>               struct dma_resv *resv,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> index 65ec82141a8e..b404d89d52e5 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> @@ -38,8 +38,6 @@
>>>   #define AMDGPU_GTT_MAX_TRANSFER_SIZE    512
>>>   #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS    2
>>>   -#define AMDGPU_POISON    0xd0bed0be
>>> -
>>>   extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>>>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>>>   @@ -155,6 +153,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct 
>>> amdgpu_device *adev,
>>>                      uint64_t size, bool tmz,
>>>                      struct dma_resv *resv,
>>>                      struct dma_fence **f);
>>> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>> +                struct dma_resv *resv,
>>> +                struct dma_fence **fence);
>>>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>               uint32_t src_data,
>>>               struct dma_resv *resv,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> index c0c851409241..e494f5bf136a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> @@ -450,6 +450,7 @@ static int amdgpu_vram_mgr_new(struct 
>>> ttm_resource_manager *man,
>>>   {
>>>       struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>>>       struct amdgpu_device *adev = to_amdgpu_device(mgr);
>>> +    struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>>>       u64 vis_usage = 0, max_bytes, min_block_size;
>>>       struct amdgpu_vram_mgr_resource *vres;
>>>       u64 size, remaining_size, lpfn, fpfn;
>>> @@ -501,6 +502,9 @@ static int amdgpu_vram_mgr_new(struct 
>>> ttm_resource_manager *man,
>>>       if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>>>           vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>>>   +    if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
>>> +        vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
>>> +
>>
>> Mhm, you should probably *not* store this flags in the vres structure.
>>
>> As soon as the BO is used the VRAM wouldn't be cleared any more.
>>
>> Regards,
>> Christian.
>>
>>>       if (fpfn || lpfn != mgr->mm.size)
>>>           /* Allocate blocks in desired range */
>>>           vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>> @@ -604,7 +608,7 @@ static void amdgpu_vram_mgr_del(struct 
>>> ttm_resource_manager *man,
>>>         amdgpu_vram_mgr_do_reserve(man);
>>>   -    drm_buddy_free_list(mm, &vres->blocks, 0);
>>> +    drm_buddy_free_list(mm, &vres->blocks, vres->flags);
>>>       mutex_unlock(&mgr->lock);
>>>         atomic64_sub(vis_usage, &mgr->vis_usage);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>> index 0e04e42cf809..8478522d7366 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>> @@ -53,6 +53,11 @@ static inline u64 
>>> amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>>>       return (u64)PAGE_SIZE << drm_buddy_block_order(block);
>>>   }
>>>   +static inline bool amdgpu_vram_mgr_is_cleared(struct 
>>> drm_buddy_block *block)
>>> +{
>>> +    return drm_buddy_block_is_clear(block);
>>> +}
>>> +
>>>   static inline struct amdgpu_vram_mgr_resource *
>>>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>>   {
>>
>

