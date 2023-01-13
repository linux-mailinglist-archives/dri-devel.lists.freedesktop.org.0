Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C1166A3D0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 21:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3FC10EAE5;
	Fri, 13 Jan 2023 20:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B392710E029;
 Fri, 13 Jan 2023 20:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqE5Y5ZyQvLjcUVBXQ30FaoZfTHkt/2rdk5g3zlHyEUFUu8KqTNqoaH5vY2PtyhagfJCQ+ZfRdqDWuI4fjJEktafZl8/3h4Nn9y+WzIuxEibpEx1d8hVW9ZEcPpVK62bAlFFhajt0on/8ptTtrIoGWzL5/xX5vHXwZYCqhnUK2E9ELr15JUxXiuXSgmx3+ypCJmYBXI7JTVNnDFzoPPoSM/PYbaxjL+9uw45grUQg/i+JQEouIvro6QU5L4TL1x3mhleqjLkae5HqD8STpfslUwOz9rwvVfAgMxQyRJ0rgmC09ZxWzCqwhTEiFm94tCbVnG6HQrN3xBPE1tMGWWnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DX5ujdR10a7APdUIs3vmWgzOXoXJqLENVfb/C/xLxj4=;
 b=EeB18gHXJWDkOXI263n7CeMvSoPy1rh8oaVcliaJ8Cxw8zcTU1U5wbOiHKP5lzC6Xp7Giq4XpiVoEyGxbVq+eXaRuesk6dLmOp7JiUrTUfY2z3u3eAmLv1bNcexLPnHRIFH7CiiR4q8oZpcS1zRvb33exspq24cd5+CkvDwOkWOE9snROct7L2uA371zKWTkGqw6S+dWe2TW+opwkHG6N3GiWlQXUpGQyiRmatZOvUHWTGXv/J7pCnvxJ4McEv6aD1mDxDfIf2m+jONzg5Rkq3K2kNHalpLQSaY5oPRF4oTa9OJcds7HgQvwLDAHjQy3otkm1hllF84OU/Drm5s9Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX5ujdR10a7APdUIs3vmWgzOXoXJqLENVfb/C/xLxj4=;
 b=HSTh296/mKaPGHF77SJnkyqLLEdn1nyZ30k2bM9XAMl4YYNhlFU7OiaT7dP68oKGG5Nb8IlIwFTMAcx90VjgTzT3wkR21dMTVblk6VHvtW9a7gqHTIkyAUA4LTassMg/G8XAkwiSD7VtX+FDUu/L2oqtilArgmEkVV8AZwpwKUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2602.namprd12.prod.outlook.com (2603:10b6:5:4a::11) by
 IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Fri, 13 Jan 2023 20:02:45 +0000
Received: from DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b]) by DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 20:02:44 +0000
Message-ID: <254dab41-aa4f-8013-b8d8-41aeac0b96f8@amd.com>
Date: Fri, 13 Jan 2023 14:02:41 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 5/6] drm/amdgpu: update mappings not managed by KFD
Content-Language: en-US
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-6-Felix.Kuehling@amd.com>
From: "Chen, Xiaogang" <xiaogang.chen@amd.com>
In-Reply-To: <20230112013157.750568-6-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR16CA0009.namprd16.prod.outlook.com
 (2603:10b6:610:50::19) To DM6PR12MB2602.namprd12.prod.outlook.com
 (2603:10b6:5:4a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2602:EE_|IA1PR12MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: 959851f8-cb3f-4443-867c-08daf5a122a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D/TwdtCF/8/gjTKYhqzV2zTcPQnbhaTMbR4JMyzXP6/+Oh/UgpRWat4sgq+Qyn9Fh2hesX4g4lpoGk+cIa/3JEN9b05kh6vhqddx9cx5x4o+F/kLtMq5Dfa86a0DePhLxi5CTooR57NSWH9En43xVQJWEgb8jDpNcW9bwDBe6oV9MDIXrVJ6Tnn65yT5Sa0jLLz9+t2MhvpKTmQ85r0SaCy0nlWfxKmk/ShGPdCSI9c9tTIUUde8se0FGLJIma0A3Py8XslUUTrFmq7SgefHxSs3dOvCJ8MQ3rwre/hlVjwpto4enXEu0cDOs04rv+2l1wOmQbYWO0Tdv4vtkE3Cm1D9Lu1dYmvczqawBZwoO5xSOANuqcn9Z/1ilUyoxlc4rxORGGUgnMqLXwB7IoxKfPaQxXOjqvnKXczEANGIZ5QgyrAyyDw3o51b2MoSCH7n+tO9FVwK2MLLv6pYKhgKNEZTFkXoHLY3frismTGYAj43EIvb3T5CuZ1y1ByCLI3pWGpgUnwqG8lh5OOE8uft0bmkRk9kSfRTo/60iybQKFGbduNF8tzx9Q3NZUN6hWlHKWR2g+Lfheb3v8NwSlSBKEq4tEoyXJt8do+RZDoBs4C5aqRQV/kYmnxgF6/39s5ghS7hztaCebOMCFPrp10ZyaeCWKvrLo3vy+nhiBmVLNPokK8vAvfoeIey2AXOalpqxd5LIBO/X0d9/63iUEM0EbB8DXxrMtpsc1x/4SljJwE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2602.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199015)(66556008)(41300700001)(36756003)(8676002)(2616005)(66946007)(316002)(66476007)(31696002)(86362001)(450100002)(38100700002)(8936002)(83380400001)(4326008)(5660300002)(2906002)(6506007)(15650500001)(53546011)(31686004)(6486002)(186003)(478600001)(26005)(6666004)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3ZZeHdwcXErNHA4TlMzMnpkdkl0MTE2dHQ2dlVHOUNJbzI1ZVRIU2hROVJD?=
 =?utf-8?B?YWRTSUpONkxadVJVZFVaWWNTMkxidk8vSDRGRTNsaXRNbkRpbkx6TW9mMGl5?=
 =?utf-8?B?OWNXM0ZpdUVodGVhcUZpYzJGTzhmcTExUTRmU2U3VVpqektkbFZocmZ5M25K?=
 =?utf-8?B?d28wcHVFUFJEYnNmU3J4M1V1RFN5N2wyV3BTV2ljVkRiRmZDcmkyU0RCVC9k?=
 =?utf-8?B?TnB4WHlMM3F1bUQxZjhGOXNiT1U0MmZIUVZUTkMrTlk1cXBhejlKSWQvTWlM?=
 =?utf-8?B?Nkxpb0lPQ3VqNzhleDFEc0pvSENCUEREY1hVSWZQaW4yMHcvRWJNTWFRV05M?=
 =?utf-8?B?TWljNHRia293K0d6SGFkUWJ6Z0VDN3kxbyttRXBnWVhiTlgvN2JEdVVpYTg4?=
 =?utf-8?B?cmJlcWdkYnpKMzN4YjNJY0tzWE93QnoycDRXL2JkWkRGRVB3eW9BQXBsTUlv?=
 =?utf-8?B?MU1raVZhZjVpaVcyVkVyZjB0SU5vbDVUMzNRRFNJN3V4UndVWFhhemxMcjhx?=
 =?utf-8?B?cnA1ZkpsOTNNNGU0N2MvYnRMTnhJSENtWDFHU1NxUWRnNXFqTzVuankxczBC?=
 =?utf-8?B?d3hEZHRrSWRYWEt3RjF4MnVjajNGUC8rT1V6T25kNHNlMFh5Wlltcm0wZzIx?=
 =?utf-8?B?ZU5RT0o4NGtRaFFYRnh6RU5mUTJDalJ5MGRBcG9hUkdCRVJleDVhQmFHYkRi?=
 =?utf-8?B?ZUxtUEpEYmxOY2drZXYvMzBUV2RwSEhLa081a083Nms4MEJqQVFEbDYxdjVw?=
 =?utf-8?B?dWE0UW95V0pWVng5TWxYV0dMR1pnR29PWTJxS3lQRmthUzkzaGxYRFVsbEs3?=
 =?utf-8?B?ZTNicG1zRXJIdGh0aHRUd2ZLa1B6dHN5VG1nalpidWdXMXZBL0ZPbXIvUGI1?=
 =?utf-8?B?UjcrRkFySmlwODZwVUlXN0o0b0grTEdOOHhTRFdmK0VHOEkyeklRWXNjeXlB?=
 =?utf-8?B?SGhMeWUrMTdZemFJV0JBdEJKaGVJYUl1V3FXQkFhN3dWcWVFb0NyT01WVitp?=
 =?utf-8?B?alk4MEdQejRLQVp5VjJDWHU3VS9DeGpQeW9xVDlyZ2xwNldMM0dieXdudDBQ?=
 =?utf-8?B?a2FlMFlUeVF0Yy9tWXZzUXpVekU5NGlwNDhiellYUlQrWmYxTC9qK2ZJS3Rz?=
 =?utf-8?B?ZDV0TVZza3NPVVBRSlhJTWhtUXhKbUpPRi9aQzRqamhic0tnaVFNMG9JR0Yy?=
 =?utf-8?B?Y1M3NkFqY1BtMXFpeWVHOVZHZVM1bTNjRnUzeHZRSFZqTzJoaEVJR0xjUy9V?=
 =?utf-8?B?aVI1Z0QycTdZV3pwRFlPMC9teEJoR2JsZDluQlJGTnNDcjVKNU8xb0xVWXhK?=
 =?utf-8?B?ZDRoNHJ5aXBWQUtkWUthN0V2YUJWeitVK3VPQWNkczFnZkVGcGE5WHlzbS9r?=
 =?utf-8?B?UGpEd2ZOZjJTVWtUK1JrWHFiUEswV2VTVm0wT2hMNWZIcm9iVWFJWFlwQnB4?=
 =?utf-8?B?cDQzdEFSSEVGbTdDWnRzV2VhR3lVVUZQb01lN2hWMkhuL2RLVmNTNkI3WjhQ?=
 =?utf-8?B?UW4vMW40UUFFdUVsRm5NbC9XaHFJOFl0bUk5VW85TEZhaTl0TW1oZE1tMXlt?=
 =?utf-8?B?QWlKMGQrSWFqSGQrUjFCd1JWSkN6aHF3WFZYNXBKcExDdFJCNDI5enptQnRk?=
 =?utf-8?B?ZVRRRDdNYm5KZEF5dVUwczZJOCtYS2tZcVg3U0JxZ0JPM0dBeWVzWSt1UzUy?=
 =?utf-8?B?NHNEdFkrTWhrYVlxbzZqbHYwbzJCelUxcG14Vm9WVGQ5aGhENTJYMGFyeU9Q?=
 =?utf-8?B?SFYrNGhPcUJUMmZ1MzdaM2FCbUxCc2J6N0NWVkRkMlVrZHRDUExSTFd0aHpz?=
 =?utf-8?B?bnQ1N2k5YVVHZDgxMUNjR2RXbG5yWnpEc1Vyckl2bUZoczIxYnZXMUVvMGUw?=
 =?utf-8?B?VTBJYk1uQVdCT1U1WkNpRmtka2dkSFBPV09TU2dDV3FMd1JKUVBPcVpVSWFD?=
 =?utf-8?B?T3VhbzZqWHN6V3JhM1BWRVVoWmViUmI2dURCd1hETXJ2c3o1NHVvMHQzREJ6?=
 =?utf-8?B?bzcvMjVvbzNGTGl4WjNSTFJ2OGxQTDZHUmVQV1FQcWRKTG5rNXdzTWN2YkN5?=
 =?utf-8?B?MW8wOXEvY2s1UU9GVlF2STVsL0hucW5UQitYUGNHbnZTMFB2QnNQSG55NTlt?=
 =?utf-8?Q?mBdI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959851f8-cb3f-4443-867c-08daf5a122a6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2602.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 20:02:44.8568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dus1hJh2qk4MSoS5xrPoHU7GJ4pCs5ePWjwxc8osUcKtN3SN3kTHoVcW1exw/m3M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6604
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Xiaogang Chen <Xiaoganng.Chen@amd.com>

Regards

Xiaogang

On 1/11/2023 7:31 PM, Felix Kuehling wrote:
> When restoring after an eviction, use amdgpu_vm_handle_moved to update
> BO VA mappings in KFD VMs that are not managed through the KFD API. This
> should allow using the render node API to create more flexible memory
> mappings in KFD VMs.
>
> v2: Sync with pd fence after all page table updates
> v3: Update comments, remove TODOs that are no longer applicable
>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 28 +++++++++++++++----
>   1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 79213f476493..df08e84f01d7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -2728,12 +2728,6 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>   	if (ret)
>   		goto validate_map_fail;
>   
> -	ret = process_sync_pds_resv(process_info, &sync_obj);
> -	if (ret) {
> -		pr_debug("Memory eviction: Failed to sync to PD BO moving fence. Try again\n");
> -		goto validate_map_fail;
> -	}
> -
>   	/* Validate BOs and map them to GPUVM (update VM page tables). */
>   	list_for_each_entry(mem, &process_info->kfd_bo_list,
>   			    validate_list.head) {
> @@ -2781,6 +2775,19 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>   	if (failed_size)
>   		pr_debug("0x%lx/0x%lx in system\n", failed_size, total_size);
>   
> +	/* Update mappings not managed by KFD */
> +	list_for_each_entry(peer_vm, &process_info->vm_list_head,
> +			vm_list_node) {
> +		struct amdgpu_device *adev = amdgpu_ttm_adev(
> +			peer_vm->root.bo->tbo.bdev);
> +
> +		ret = amdgpu_vm_handle_moved(adev, peer_vm, &ctx.ticket);
> +		if (ret) {
> +			pr_debug("Memory eviction: handle moved failed. Try again\n");
> +			goto validate_map_fail;
> +		}
> +	}
> +
>   	/* Update page directories */
>   	ret = process_update_pds(process_info, &sync_obj);
>   	if (ret) {
> @@ -2788,6 +2795,15 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>   		goto validate_map_fail;
>   	}
>   
> +	/* Sync with fences on all the page tables. They implicitly depend on any
> +	 * move fences from amdgpu_vm_handle_moved above.
> +	 */
> +	ret = process_sync_pds_resv(process_info, &sync_obj);
> +	if (ret) {
> +		pr_debug("Memory eviction: Failed to sync to PD BO moving fence. Try again\n");
> +		goto validate_map_fail;
> +	}
> +
>   	/* Wait for validate and PT updates to finish */
>   	amdgpu_sync_wait(&sync_obj, false);
>   
