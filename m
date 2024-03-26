Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA9688C439
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 14:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A17B10EB52;
	Tue, 26 Mar 2024 13:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2wT8yffN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2093.outbound.protection.outlook.com [40.107.94.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1232D10EB52;
 Tue, 26 Mar 2024 13:59:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdjBv4h5/ZSVmgkg9I8IxjkfC7ZrA2PWjCIqoqItRxa8q/m0htRSSMi6uGIq+76TZqJY3K46qtk0p7jGlhpVs/mI6GH1nQ2k5TzR3wABt5OgbmY//aXNMvMgF9G4L7zbDg0xd0FBvnUdE3+ClDgPWFPHC/xB3n5YIIeII+nfTels2sEym5qkSqa7Mt71f5eETEc4r6d+mdXj3cAFrDsVcASku4LDtODKP7K8k3tEf34JYnwR7D45x0S/WSyCKcAw1PV++NMhnDonrLpyO/ra99v8EwGVQ0l3F6TAxpK9gGstzGlDTMzqOlTlviRUJpFn50G+nglfebNIBpsQWO78cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eTZGNIMIjo8gYPb7ZYu/gHUc5DyQ0Zs9piF4vo+d4o=;
 b=WmtMZJSAOpODwBjGo8T1dZtuG2+ATckTmjc/0MZtdkvzeKQohNJYS7t3TECjaq14zKMdiQ4A0Pt4OgKPlDHnuNyg26ukr+DlqUNy0xiEHp/v24NH78ptMFcvjD781oFhEsz/WUojDTypM7GGcDjJmdaPT4Xhfsthf1RHi3JtWbX1l3NaN5GQZ5kLfYwsbVZTC1883F9ZHox3D8mY+bSm4v0xCbcTjaN91fa2ZYX9Q239lcMkYOSHnwozXS3pQwMTgQ5xkWQtq7aUxLES1Xj1cYtBtyJ5DyNFwCxrowOs8Lpbp4fFp63WlkI33CitzPayONSxWZ4LoORZTIwXWZUZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eTZGNIMIjo8gYPb7ZYu/gHUc5DyQ0Zs9piF4vo+d4o=;
 b=2wT8yffNxvQ8xm04KfEj0CgoKHrMWx9Ocdc0Y2SMnbOPMjobJO1ZqlYKJlBGXjTtjVfqrRlUkDaUgxBb7w4mrEctSZQYCs+gvlehSFLHFFRVQj4GLG+9Yz1/f+DoIdQB/kVff9K9mQfDFUgJ4nAXNrl4qQ0eSqEqveZvjJVIXWk=
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SA1PR12MB6871.namprd12.prod.outlook.com (2603:10b6:806:25f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 13:59:11 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6710:26ed:ab04:558f]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6710:26ed:ab04:558f%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 13:59:11 +0000
Message-ID: <59ec1d92-19d6-4b88-97eb-16e9c3436d6c@amd.com>
Date: Tue, 26 Mar 2024 19:29:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com, matthew.auld@intel.com,
 mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
 <20240318214058.2014-2-Arunpravin.PaneerSelvam@amd.com>
 <CADnq5_OOV49X-ctq-V6B9rGun43_BnWJixkbzAGRO1g0fzACxA@mail.gmail.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <CADnq5_OOV49X-ctq-V6B9rGun43_BnWJixkbzAGRO1g0fzACxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0255.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::18) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SA1PR12MB6871:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6KHi6vHglckfZLp6z3UWvvK4/URuNSA62dP/LcAdf8cVVNMFJGmf/dQIJlHF6inTT62eFa/7W3z8A4bc+5AQ+FBxOqloGdvLKmnEucnRicDQYoRLP9QSewsS4cchSAXR1rbvaab1RQsee4JVzlcjiQmiuitnzQc+9f/QzkPTKV53OWN+2eWo+tham89CioRunxC4L5MqspF0oBSC9TlEYk8TnC5oKUByyLp3xAPwEp+qtlEMa2QCHvbhEKDbyoK9EGgDxwCdzMQyJc9jO44sT8kniC9fQOYoKu8IVFkFqxwzWApNjAg+8R+KGMG27NlaZwa/teCPFPbKqmyXMWE4R5lua0ZkwXwyAUR14XFCg6+ZR9A1o6LHAaWFBQ126okxna63Mu52i9zHduk5wIs0T/kDmvB5MkM2REioeXeRDvQMcR233FrdQFaNA5aa1XsyUa/VWwR4ewFi3/QL0+jwWyxuh9pzjaXRgmkNaVxgXYeTH2aeDyyvSGL5YbSBCSyclMVQ4MTHVeQ86SXYLwQr19jSG6n+r0ad1MpiOqvRRrzFdu7X7NLrtaOVupNVh6EAnEVBtlfPxee0am3TktdsmK/3FOOuMPZv/Pa0CI1vpjFtOgjj1pnFXdzBKXwCKiphtTW2/WxgL7pWdT52R6lChgzP9PT86LgewezrWNSGA6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0hIeTROem1Ha3ZqaHNPWWNFVCtyRU94Mnh3SnZ6VSt3TG03Wnk1N3lSR2Q2?=
 =?utf-8?B?bmswWEVYVUt1K0hJYTFrMmhCeGQzQU5YeVJBN1Z2RmJVWGJvWUNWUVBkdTk1?=
 =?utf-8?B?bmxZMkw1RFRNQjdEanVSMytvQ0VGS2VNSGFoTk1IeE1ESUlrODZRSTc2V0h2?=
 =?utf-8?B?dWthaU0yRXVaN2g3a1JEOURPZ1ZjMXhxbXoyOGtyeHY1c01XSkEwd0xwazF1?=
 =?utf-8?B?KzAxWU9UVzc5TGZQSzZORHN1TkhQcEg0OXNFUzZzYS92ZEMzY25IMnJxUVRL?=
 =?utf-8?B?RjU0RlNxN3BaK0pUSjlnTXVzeUJVNUxjREZ1SXk1VmFwbWg2eHlHUXJXZU9V?=
 =?utf-8?B?bHpRV1RiSnNpVzhGRlpNSTM1VkFxREhzN1pMMkR3dzlJWjRSSmVqWVdJanNQ?=
 =?utf-8?B?VnFabE5jRExxNTNXTGZwNWs4cjhBOStiSkZwZ3hTbWhyeThXR21oVVVWQVJ1?=
 =?utf-8?B?aDM2R2NXazZ2enJJSVVXRkpoUkMzeENMcDdjcjkrUG5BWEptUmgvZnMzYi94?=
 =?utf-8?B?QmZQU05QUVYvQ2hEenpTTlZtYXV5YkFFNTFveUpaT2JCM0Q1Uzk3ZGxGcjFN?=
 =?utf-8?B?SzIyMWo5MndWM3IzKzhiOEhYckk2NnJJeDJvUW5kZ08xWVVpNTB4UHRpaGpM?=
 =?utf-8?B?T2hSM2dSbGpKMVMzaDk2bHBnUytPQWF3NmF3RDRUeDBMMG1jQ0drNk9HWTRU?=
 =?utf-8?B?NXJlUnRPVlVSTFQ0Qmp4bytFdlRlcjhnRUFMdGdxWVNTL0FOa0owemRPZ0ht?=
 =?utf-8?B?T21DV3haL3Z5NVRPdW9oUUlFZ2k1ejEyMUl3SjN4dEtMUUNwNDhXeDNTTTJu?=
 =?utf-8?B?Mm1tajJVYmVNcVZsYzUxdWUwTnUwZFJGQVJoTWN2azVDYVJnQkZQTFNBYkxE?=
 =?utf-8?B?aGVFdW5nWTNxNjN3TloxUi9qUFBuZWwyZUZGWG9UV1hoWTlxZ3lKMUl4S1RH?=
 =?utf-8?B?ZFh5SVl0cUl4b3laRVljTWN2SzJCMDBmOFZ1a0prQTZPc3Vpa2RDTUhTa0g0?=
 =?utf-8?B?ZWdCaEZvajd1aHArMzlHNzZVeWJJcHdxR2JoanpvOGNrb05XOUVacGFLUzNB?=
 =?utf-8?B?SXk4cFBTKzZOdkNXV1VsWE9nVTM4WkdKNllzZjluYWhac0JVZWdDbXZDdUJO?=
 =?utf-8?B?eUozNVFlM2E2K1Yvd2F2ZjV0U0pMWlJBY3dXRzNISVVRQWkwR1BmOHdzVGtP?=
 =?utf-8?B?ang0bDBGTVRDRm5uWFE3ZDREU3Y5U1dxeUxCOVlIdFVtVW95bFMzYWg1UXJR?=
 =?utf-8?B?eXFadXljclRYQnBKVFkxcjdpVVpEQ2Z4VGhuRTlLTXkyalZNTm5mdmJyMmZI?=
 =?utf-8?B?YjVvNTNUdzN5ZUwxZXEyVERWbWZiZDl5cTZYeW5wWEwrSmcxTkJIYjNFY01B?=
 =?utf-8?B?amx2a011dTJyT1BCa2loVXh0bTY2VENVak1FSStRbXp3R0pwMCtCQTQwWW81?=
 =?utf-8?B?anNEVWpwQ3JPYjNWUVgxelMzcDRoNDJqZSticU9LQS9rWWdSL09abmM1akVX?=
 =?utf-8?B?eTAreXBHT1BIQlZ0dko0ZjNuUTN6VkJ0YkN4V2p0M1hsZDFUUUtOVFI1VmtQ?=
 =?utf-8?B?dHlCblFxTnY0VHEzNHcxM3A3OWFRbzU1WVpycFFQbnQzWHhYanp0UUZBYlZx?=
 =?utf-8?B?STVPUkNlZitxamxEN1RQT1VyNGd2N2RFS1U0dklzdUlUNW9wUktqSkQxd0J3?=
 =?utf-8?B?c0xyWit4eHByTjhXS2VNRTh6eDU3NUFwSHFjYzYyUnFUUVhKSlJjd2pvY0Mr?=
 =?utf-8?B?OVc3dHZxRHdHc0JERWhzNnIzRStTT09qaVBCOGJVL0R4WVYxWXpPTWJjYmw5?=
 =?utf-8?B?dzIrQXRZcmtVU1E1Y3FMMHAvcDVSaHRSTVM1cSt1eFhKWnVrYzJEWU1rS1Zo?=
 =?utf-8?B?UWdHejdxYnB5eERoMXZTSFlVWVpJS1pkTjRyRVNtN2dsc3J3dGFGcWIwMk84?=
 =?utf-8?B?bnVBY0hMWXlQamtLOGc5dzdFdWhWcTZYbUxLYy9JcThPaVgxNjIwWkM1SVhN?=
 =?utf-8?B?Q1JwcVdiTFZjMmdsZzNoRnJXTk5FcktDRnc1bVptWWsrZVMydi9xeERMZFRp?=
 =?utf-8?B?eEZUVmNOTVlWYVVNZ01FdXptZTZEQTlGd1UzTkpFR3pod3NQY2VaVjZKeXZJ?=
 =?utf-8?Q?lWUK7pA4fyd0TWYtAVTpg/QkV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92df2d8e-399a-44e1-79ca-08dc4d9ce9a4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 13:59:11.3345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyWYWDktSk+m4BczwQ4kmQgpbQ/9/GZg8DnInO97+O1f2JjAUVq7o2SC42O+TrDit+NJFSN6OQ87rDfOYO6cLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6871
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

Hi Alex,

On 3/26/2024 7:08 PM, Alex Deucher wrote:
> On Mon, Mar 18, 2024 at 5:47 PM Arunpravin Paneer Selvam
> <Arunpravin.PaneerSelvam@amd.com> wrote:
>> Add clear page support in vram memory region.
>>
>> v1(Christian):
>>    - Dont handle clear page as TTM flag since when moving the BO back
>>      in from GTT again we don't need that.
>>    - Make a specialized version of amdgpu_fill_buffer() which only
>>      clears the VRAM areas which are not already cleared
>>    - Drop the TTM_PL_FLAG_WIPE_ON_RELEASE check in
>>      amdgpu_object.c
>>
>> v2:
>>    - Modify the function name amdgpu_ttm_* (Alex)
>>    - Drop the delayed parameter (Christian)
>>    - handle amdgpu_res_cleared(&cursor) just above the size
>>      calculation (Christian)
>>    - Use AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE for clearing the buffers
>>      in the free path to properly wait for fences etc.. (Christian)
>>
>> v3(Christian):
>>    - Remove buffer clear code in VRAM manager instead change the
>>      AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set
>>      the DRM_BUDDY_CLEARED flag.
>>    - Remove ! from amdgpu_res_cleared(&cursor) check.
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 22 ++++---
>>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 61 ++++++++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
>>   6 files changed, 111 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 8bc79924d171..c92d92b28a57 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -39,6 +39,7 @@
>>   #include "amdgpu.h"
>>   #include "amdgpu_trace.h"
>>   #include "amdgpu_amdkfd.h"
>> +#include "amdgpu_vram_mgr.h"
>>
>>   /**
>>    * DOC: amdgpu_object
>> @@ -601,8 +602,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>          if (!amdgpu_bo_support_uswc(bo->flags))
>>                  bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
>>
>> -       if (adev->ras_enabled)
>> -               bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>> +       bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>
>>          bo->tbo.bdev = &adev->mman.bdev;
>>          if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
>> @@ -632,15 +632,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>
>>          if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>>              bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>> -               struct dma_fence *fence;
>> +               struct dma_fence *fence = NULL;
>>
>> -               r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, true);
>> +               r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
>>                  if (unlikely(r))
>>                          goto fail_unreserve;
>>
>> -               dma_resv_add_fence(bo->tbo.base.resv, fence,
>> -                                  DMA_RESV_USAGE_KERNEL);
>> -               dma_fence_put(fence);
>> +               if (fence) {
>> +                       dma_resv_add_fence(bo->tbo.base.resv, fence,
>> +                                          DMA_RESV_USAGE_KERNEL);
>> +                       dma_fence_put(fence);
>> +               }
>>          }
>>          if (!bp->resv)
>>                  amdgpu_bo_unreserve(bo);
>> @@ -1365,8 +1367,12 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>>          if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
>>                  return;
>>
>> -       r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence, true);
>> +       r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
>>          if (!WARN_ON(r)) {
>> +               struct amdgpu_vram_mgr_resource *vres;
>> +
>> +               vres = to_amdgpu_vram_mgr_resource(bo->resource);
>> +               vres->flags |= DRM_BUDDY_CLEARED;
>>                  amdgpu_bo_fence(abo, fence, false);
>>                  dma_fence_put(fence);
>>          }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>> index 381101d2bf05..50fcd86e1033 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>> @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>>          }
>>   }
>>
>> +/**
>> + * amdgpu_res_cleared - check if blocks are cleared
>> + *
>> + * @cur: the cursor to extract the block
>> + *
>> + * Check if the @cur block is cleared
>> + */
>> +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
>> +{
>> +       struct drm_buddy_block *block;
>> +
>> +       switch (cur->mem_type) {
>> +       case TTM_PL_VRAM:
>> +               block = cur->node;
>> +
>> +               if (!amdgpu_vram_mgr_is_cleared(block))
>> +                       return false;
>> +               break;
>> +       default:
>> +               return false;
>> +       }
>> +
>> +       return true;
>> +}
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 8722beba494e..bcbffe909b47 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -378,11 +378,15 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>              (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>>                  struct dma_fence *wipe_fence = NULL;
>>
>> -               r = amdgpu_fill_buffer(abo, AMDGPU_POISON, NULL, &wipe_fence,
>> -                                       false);
>> +               r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
>> +                                      false);
>>                  if (r) {
>>                          goto error;
>>                  } else if (wipe_fence) {
>> +                       struct amdgpu_vram_mgr_resource *vres;
>> +
>> +                       vres = to_amdgpu_vram_mgr_resource(bo->resource);
>> +                       vres->flags |= DRM_BUDDY_CLEARED;
>>                          dma_fence_put(fence);
>>                          fence = wipe_fence;
>>                  }
>> @@ -2214,6 +2218,59 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>>          return 0;
>>   }
>>
>> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>> +                           struct dma_resv *resv,
>> +                           struct dma_fence **fence)
>> +{
>> +       struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>> +       struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>> +       struct amdgpu_res_cursor cursor;
>> +       struct dma_fence *f = NULL;
>> +       u64 addr;
>> +       int r;
>> +
>> +       if (!adev->mman.buffer_funcs_enabled)
>> +               return -EINVAL;
>> +
>> +       amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
>> +
>> +       mutex_lock(&adev->mman.gtt_window_lock);
>> +       while (cursor.remaining) {
>> +               struct dma_fence *next = NULL;
>> +               u64 size;
>> +
>> +               if (amdgpu_res_cleared(&cursor)) {
>> +                       amdgpu_res_next(&cursor, cursor.size);
>> +                       continue;
>> +               }
>> +
>> +               /* Never clear more than 256MiB at once to avoid timeouts */
>> +               size = min(cursor.size, 256ULL << 20);
>> +
>> +               r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
>> +                                         1, ring, false, &size, &addr);
>> +               if (r)
>> +                       goto err;
>> +
>> +               r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
>> +                                       &next, true, true);
>> +               if (r)
>> +                       goto err;
>> +
>> +               dma_fence_put(f);
>> +               f = next;
>> +
>> +               amdgpu_res_next(&cursor, size);
>> +       }
>> +err:
>> +       mutex_unlock(&adev->mman.gtt_window_lock);
>> +       if (fence)
>> +               *fence = dma_fence_get(f);
>> +       dma_fence_put(f);
>> +
>> +       return r;
>> +}
>> +
>>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>                          uint32_t src_data,
>>                          struct dma_resv *resv,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index 65ec82141a8e..b404d89d52e5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -38,8 +38,6 @@
>>   #define AMDGPU_GTT_MAX_TRANSFER_SIZE   512
>>   #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS        2
>>
>> -#define AMDGPU_POISON  0xd0bed0be
>> -
>>   extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>>
>> @@ -155,6 +153,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>                                 uint64_t size, bool tmz,
>>                                 struct dma_resv *resv,
>>                                 struct dma_fence **f);
>> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>> +                           struct dma_resv *resv,
>> +                           struct dma_fence **fence);
>>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>                          uint32_t src_data,
>>                          struct dma_resv *resv,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index c0c851409241..e494f5bf136a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -450,6 +450,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>   {
>>          struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>>          struct amdgpu_device *adev = to_amdgpu_device(mgr);
>> +       struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>>          u64 vis_usage = 0, max_bytes, min_block_size;
>>          struct amdgpu_vram_mgr_resource *vres;
>>          u64 size, remaining_size, lpfn, fpfn;
>> @@ -501,6 +502,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>          if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>>                  vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>>
>> +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
>> +               vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> Is there any reason to not always do this?
Here we are trying to keep a pool of cleared memory which are cleared on 
free path and that can given
to the application which requires a zeroed memory. I think here if we 
set always clear the memory,
we would go over the limit of cleared memory in that particular instance 
and the application should wait until
the hardware clears the memory and this might impact the overall 
performance.

Thanks,
Arun.
>
> Alex
>
>
>> +
>>          if (fpfn || lpfn != mgr->mm.size)
>>                  /* Allocate blocks in desired range */
>>                  vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>> @@ -604,7 +608,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>>
>>          amdgpu_vram_mgr_do_reserve(man);
>>
>> -       drm_buddy_free_list(mm, &vres->blocks, 0);
>> +       drm_buddy_free_list(mm, &vres->blocks, vres->flags);
>>          mutex_unlock(&mgr->lock);
>>
>>          atomic64_sub(vis_usage, &mgr->vis_usage);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> index 0e04e42cf809..8478522d7366 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> @@ -53,6 +53,11 @@ static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>>          return (u64)PAGE_SIZE << drm_buddy_block_order(block);
>>   }
>>
>> +static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block *block)
>> +{
>> +       return drm_buddy_block_is_clear(block);
>> +}
>> +
>>   static inline struct amdgpu_vram_mgr_resource *
>>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>   {
>> --
>> 2.25.1
>>

