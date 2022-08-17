Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657E0597971
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 00:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856DF8F2E1;
	Wed, 17 Aug 2022 22:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6D7A5FAF;
 Wed, 17 Aug 2022 22:04:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EN8rsKFEOXVfLpnN7zqKgkJ9Q1ZULSNJaUOeZo9LDABYns28mr7g9gnJr7oTIX/kq2Qx1wVZqoe68RTPXpRER8bkLoY+Wsq1vizhuhRldDA8msoLvFIVbunaciVtQQjitHXIOwSHTkVSdKDH9y1v1HWqEviQt2EGr7FCxW2rIgProhiy6BViJ+ETlOwCBMCinIGIXJ0OtUJ7/szfmo3MB2rtj/CoPo4fNXy+sdJQfJ2h9jLK6PWDs6HLtcjdote8hDP6hpLudEguKmec9Vl7dri/l7oecWMg8xzBp2GdtZeVGMzr3xfPYQuE3e9NMofoGLMy7EFdrxfAfvMeoiJ99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ytZdbrSxur8GeXpnS2eji99R6akxffqYX73Jyqe43g=;
 b=AwrqJKfGjBn2q2Sh2MMNDJ2ueX2Li2G1kuNgnlltk97KlqzKhFa1xSHktt0peM806Pcd5ZCxaP0QSe6Ct1c4awK2j8AGNdDtuaPCabjjQYHlVTiLF196PkPzm6zMbcxy6g/xNRTgk+nnyL+J83b28Z64KRknAhmKfBmRLfZUbJiozhvLA59lt14Bbc8vwAH5YbQi+p+HbmaacmR/95R0Kob78Xs0BX61LEBCjOZAKzvcEpm3rfWzoalmePJ9NHXN0O7zwSrCxYcbopkcE0pFp81/FBWkAYFXb5TJvWnWy6hi/QLGS7Au3nEcanPuyeJCN/2Kh7cZT6GdhlDnwC8GdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ytZdbrSxur8GeXpnS2eji99R6akxffqYX73Jyqe43g=;
 b=ezz3Qi4qpEdqX+Rp9F959TQEWq0xeESvbPwKSbScFQFcsD1mk6rq5110pWfGQHrV1rwP1O6gGr7E35w704fS4kJo0zseNgnPyeQXknS6Rs01DcTc4MabA3W2JF5gsMw3XOHwdMNtapo+4vNfTzQ9zaZ5R5lAVukAKIYKHfem33I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BYAPR12MB2678.namprd12.prod.outlook.com (2603:10b6:a03:71::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 17 Aug
 2022 22:04:50 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115%5]) with mapi id 15.20.5525.019; Wed, 17 Aug 2022
 22:04:50 +0000
Message-ID: <60ac78e0-e65f-89c2-8404-2b65911f3e05@amd.com>
Date: Wed, 17 Aug 2022 18:04:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] drm/ttm: Add usage to ttm_validate_buffer.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
 <20220813012801.1115950-2-bas@basnieuwenhuizen.nl>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220813012801.1115950-2-bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b05de8b8-ba4e-4459-484c-08da809c8188
X-MS-TrafficTypeDiagnostic: BYAPR12MB2678:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gpz2yKQXYk5HWejRKdXjH6S6csPJjPr9Oph4c6dhqJ+il4Kk5Z0ueyL5d+xqUQ6XHtuNTwe9z3ocQdGGVaJgFe5OJgECg+AXfwHY0uvd+V+aKyhgyNu1bY9237CsuGdRN9MGdDwm2RcDSaniyHlYiCX1+6wBboo1lMCGLEA6Z6Kugabi1GNQJ1NxErEnflMESVZIg6NwAliCGUlhWS9471LBLfKbxvji8KKFotQSA0Tw4NF8EWw6UcvetfN6bYzRHKdI+5O0hbqz2w8Mh5oyFXc4lrNit76yf6qqhL0UJwipzQl5eB7JFvyUVT1knDL7kvJp/h7PFsh61qhq+i58G8T0lOU9E16AF1vULQINurGB2DE3/LyhUEVqDFZE0uS0H6HkD8yiZxwt52LevNCvp0XNBSFrXcxzpKJkI4/izj3Ay9ZG08CaK/omq39aZc3GRvMQX4eC7tsRCBFkbQDCOONJAzLZmREGv4fAmSDASIT4QOmfmQCVsBq0HneTb7zkFUFh8r2W/GgJMloyktwayxcboFmj0YvOPdGD6J7NlUYUP9XVvNPZAQbAEcmqzviH75yBHc3Qqtp3y2pQR7v1ByEDaQAtlztbQf2msMeI1HKHICtmv9XAFaP/Etlv9aO0b5kPyNbMezeZugWOgH6aFFeKrvOAqQs9bc8Vp49dkUlHWWBCALuTzvE9lG4k0hiKB33AF83LsOG8MKJpS5Do9ZTw/SxZDMoO/kgm4GR2GEYxMMy7Vqwg8u1G7XWJrpzfIA0QXroW+vrLOCNUDyjAYTxj35f7OTomYLfm6ibHmpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(83380400001)(186003)(38100700002)(5660300002)(8936002)(66946007)(44832011)(30864003)(2616005)(66556008)(4326008)(66476007)(2906002)(41300700001)(6512007)(6486002)(478600001)(26005)(8676002)(316002)(86362001)(31686004)(6506007)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXVTa2JiekVKcUFIcmVjcXdBWGRaamdocGJLNEJiOTZ5SHZPL1VYVWtaaGpj?=
 =?utf-8?B?YWhXY3NoRU5XcWZldzlCY292NTFMWGdwTEROb2gxV2Y5QVVDU0JLcjRNeXVI?=
 =?utf-8?B?dGZUcm93SVNqdW13NmJmZ1Z6S0N3NGU3djE2M2ZqY2pTUU01WWp1YlV4c1E1?=
 =?utf-8?B?S0hHMmEvQWJmM1FvaVZFTFJ4TjNEcGZBV1lwdERkNjVqdDJPeUtCVEZjNlNT?=
 =?utf-8?B?cXJpVHRYNEdNeGhER3ZBVGFZaFNNYW9BN2FQRktkK0xva3ZxaE10WFNPWmdJ?=
 =?utf-8?B?SlhndXVreW4yUG9ldlpxYXkwMTd3dURJbVN1NitobmREdG9neEZqQjJYT1dJ?=
 =?utf-8?B?NTNwTzRPbHdZNHA1LzNNek51U2xTQVhsTFpEcEVPT2lWRVFseUNQZlRuQTQ3?=
 =?utf-8?B?aDBtRlk5eXA5NDgrYmtRZkptSTlIaU5oU1lRRDI4WTI3Nm5hWk9FZjRyTVJq?=
 =?utf-8?B?bXM0MmVSQ1ZZNW9FcDVsVkxja0NRVThtdmZzT2lINXhMQTlXNWR3OEpyVUZt?=
 =?utf-8?B?QU5BbE5SWFBTNURNVDRZMm1JSW45WGV3WVl3N1gxWCt2WWFPVmN0eGFualI4?=
 =?utf-8?B?YzkzQm5aWjYvdERVeGhYMzFLaGpldjdLR1QzOHZySVUxbjFPYWpTem01NU1n?=
 =?utf-8?B?YzFreFVZOEZkbmFXeXpKT0tpUFc0TzFpYXhTenFNY2xpb2RFVnZBODdtSVVK?=
 =?utf-8?B?KzAreTZQSk1zVlFuZXV2VFJnZlg5NGhvcVpKbEc1UEllMmQ2UzFyTUNVWGNO?=
 =?utf-8?B?ZUVvR3h6S3pQMkVSY3NpZjdMUlBuK0J2Z2h6NElPRUlUKzFBdEc0OTVETjFJ?=
 =?utf-8?B?LzdmVng4OGt1MExER0tiM2daVllXSWQ5WFY1RllLV290STN1ZFYyWUNFajdD?=
 =?utf-8?B?aG9qcG9LQU0zRDFmaWhLSjd2WG1rWXZWZWdZaEJVZEM4amo5ZkRYVm5WMmll?=
 =?utf-8?B?b1d3VktVRTZ6Ri9HUVMxOHFvZzh3YnZ2UHRxY2tZV3RIUmlZMTNOa2twR0Nt?=
 =?utf-8?B?VktqOVREYU1kSDRRREFVSzdvTlZlbFcwVXZCOC9DUTRhazQ1Y3EydFphcEpa?=
 =?utf-8?B?bXNQbVoveTRQMTk4Q3ZzVy9wa3Zxbnk1bFlyZlVqaG5ZNDdRQWNySnlxOGxV?=
 =?utf-8?B?M2phS2s1RFljc2VhVlNIMXBYeXRNWjlBOHRUWXlOejhoelJjenQyNTRmVlJD?=
 =?utf-8?B?Z0RUdmJzUFByYTFGQ1V4dDF5OUxpdVhNVWJ4WGRoL0YzNkxvdXV3b2tMcm1F?=
 =?utf-8?B?UGw3M2R6WSttdnhUNW12TW1pSGtrcm5Nb1RFMmVnWC9tRUZmTUJuaVcwUWdK?=
 =?utf-8?B?VENTQnQzcjQ5a0g5eGJZL1FuMy9iWFNiRFp2T0pzbHVnTTdCcGE0eW0reC8r?=
 =?utf-8?B?SDNHZnM0ZnJBdHlhTThiZ29kQXVlZnp6Y3diVnRGVEtlQ1hLZk9VT1E3THE2?=
 =?utf-8?B?YndaM1JOYjdXRGpjcFFpb2tvTjBNQkxETm9WTzdPZWw4azhoMktNWENVWVBw?=
 =?utf-8?B?ZkxXc2ZER0dyL1k4QmZMbjd5dXJpS21nWEF2RnBUcDRaVkVmbXU2bVdtNzRv?=
 =?utf-8?B?VEpsNXMwOFBUMmttVlJKOG9INHZrbU5mY0JpdkgranRab0ZmSHFtYnRUWVRh?=
 =?utf-8?B?ZnBHRFlxWnY4Yklzd3VoYzRKVnRmMjk1dDZtY0praWIzWlA5RnNDYWh6Nksz?=
 =?utf-8?B?VkpFWFhiQTN6eGc1SXhRdDdGQXovUUhiN3Z4b0NET2sxTk9CV2ZVbHE0KzBh?=
 =?utf-8?B?c1Z6dS9IU2xodXYrekxJaExqTGh0aGJPV00vRmU4dTE4WkwzZ1c2TlY1bEo5?=
 =?utf-8?B?WjZKcjNHSWwvQThWMlFaTWsrV2dMZHl0ckROdnh0R2FhZzNXSUFqSU1ON1dC?=
 =?utf-8?B?cEhNSE5ya1hJMm1RMHZoZmVRRXdZMWkrWnVRM1M0R2FvSDFhN1h1RkF3NW5D?=
 =?utf-8?B?MDc1Zy9USlY4U0N5M283TVp4TUpkamNOTzFoMExZdUNIa0dSRUZVbG1rTzIy?=
 =?utf-8?B?SEo3WVhYSFdWcWUyMmxVek1xdUFHR25OUmRUMWRyWDd5Slp5Y3pvSmVYb0xO?=
 =?utf-8?B?WHBIazBCaDVBNmpaeWo3alhCNWcrV3BnbFg4VWJSdVZxUDJKMCtXbFNYeGJJ?=
 =?utf-8?Q?ZXogJXYsK/SG0xApIDQ5VW8Cs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05de8b8-ba4e-4459-484c-08da809c8188
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 22:04:50.4849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hv5knQ35EYyvV0F7ezZgn1lB3gj070xgowRP6ANJLefGODAR+7/y3VKr3nlnlLHylqRfuNe9ESMO5H47r8OtNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2678
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

Am 2022-08-12 um 21:27 schrieb Bas Nieuwenhuizen:
> This way callsites can choose between READ/BOOKKEEP reservations.
>
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 5 +++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           | 9 +++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c          | 1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          | 8 ++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c          | 1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 1 +
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c             | 1 +
>   drivers/gpu/drm/qxl/qxl_release.c                | 1 +
>   drivers/gpu/drm/radeon/radeon_cs.c               | 2 ++
>   drivers/gpu/drm/radeon/radeon_gem.c              | 1 +
>   drivers/gpu/drm/radeon/radeon_vm.c               | 2 ++
>   drivers/gpu/drm/ttm/ttm_execbuf_util.c           | 3 +--
>   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c         | 7 ++++++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_validation.c       | 1 +
>   include/drm/ttm/ttm_execbuf_util.h               | 2 ++
>   15 files changed, 38 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 4608599ba6bb..a6eb7697c936 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -775,6 +775,7 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
>   
>   	INIT_LIST_HEAD(&entry->head);
>   	entry->num_shared = 1;
> +	entry->usage = DMA_RESV_USAGE_READ;

KFD code never calls ttm_eu_fence_buffer_objects. Does it make sense to 
set this field at all in this case?

Furthermore, I remember reviewing an RFC patch series by Christian that 
replaced all the execbuf_util functions with an iterator API. Is 
Christian's work abandoned or still in progress? How will that interact 
with your patch series?

Regards,
   Felix


>   	entry->bo = &bo->tbo;
>   	mutex_lock(&process_info->lock);
>   	if (userptr)
> @@ -919,6 +920,7 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
>   	ctx->kfd_bo.priority = 0;
>   	ctx->kfd_bo.tv.bo = &bo->tbo;
>   	ctx->kfd_bo.tv.num_shared = 1;
> +	ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
>   	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
>   
>   	amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
> @@ -982,6 +984,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
>   	ctx->kfd_bo.priority = 0;
>   	ctx->kfd_bo.tv.bo = &bo->tbo;
>   	ctx->kfd_bo.tv.num_shared = 1;
> +	ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
>   	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
>   
>   	i = 0;
> @@ -2207,6 +2210,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
>   		list_add_tail(&mem->resv_list.head, &resv_list);
>   		mem->resv_list.bo = mem->validate_list.bo;
>   		mem->resv_list.num_shared = mem->validate_list.num_shared;
> +		mem->resv_list.usage = mem->validate_list.usage;
>   	}
>   
>   	/* Reserve all BOs and page tables for validation */
> @@ -2406,6 +2410,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>   		list_add_tail(&mem->resv_list.head, &ctx.list);
>   		mem->resv_list.bo = mem->validate_list.bo;
>   		mem->resv_list.num_shared = mem->validate_list.num_shared;
> +		mem->resv_list.usage = mem->validate_list.usage;
>   	}
>   
>   	ret = ttm_eu_reserve_buffers(&ctx.ticket, &ctx.list,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index d8f1335bc68f..f1ceb25d1b84 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -57,6 +57,7 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
>   	p->uf_entry.tv.bo = &bo->tbo;
>   	/* One for TTM and two for the CS job */
>   	p->uf_entry.tv.num_shared = 3;
> +	p->uf_entry.tv.usage = DMA_RESV_USAGE_READ;
>   
>   	drm_gem_object_put(gobj);
>   
> @@ -522,8 +523,10 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>   	mutex_lock(&p->bo_list->bo_list_mutex);
>   
>   	/* One for TTM and one for the CS job */
> -	amdgpu_bo_list_for_each_entry(e, p->bo_list)
> +	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>   		e->tv.num_shared = 2;
> +		e->tv.usage = DMA_RESV_USAGE_READ;
> +	}
>   
>   	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
>   
> @@ -1282,8 +1285,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>   	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
>   
>   	/* Make sure all BOs are remembered as writers */
> -	amdgpu_bo_list_for_each_entry(e, p->bo_list)
> +	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>   		e->tv.num_shared = 0;
> +		e->tv.usage = DMA_RESV_USAGE_WRITE;
> +	}
>   
>   	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
>   	mutex_unlock(&p->adev->notifier_lock);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> index c6d4d41c4393..24941ed1a5ec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> @@ -75,6 +75,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	INIT_LIST_HEAD(&csa_tv.head);
>   	csa_tv.bo = &bo->tbo;
>   	csa_tv.num_shared = 1;
> +	csa_tv.usage = DMA_RESV_USAGE_READ;
>   
>   	list_add(&csa_tv.head, &list);
>   	amdgpu_vm_get_pd_bo(vm, &list, &pd);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 8ef31d687ef3..f8cf52eb1931 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -208,6 +208,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>   
>   	tv.bo = &bo->tbo;
>   	tv.num_shared = 2;
> +	tv.usage = DMA_RESV_USAGE_READ;
>   	list_add(&tv.head, &list);
>   
>   	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
> @@ -733,10 +734,13 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   			return -ENOENT;
>   		abo = gem_to_amdgpu_bo(gobj);
>   		tv.bo = &abo->tbo;
> -		if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
> +		if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID) {
>   			tv.num_shared = 1;
> -		else
> +			tv.usage = DMA_RESV_USAGE_READ;
> +		} else {
>   			tv.num_shared = 0;
> +			tv.usage = DMA_RESV_USAGE_WRITE;
> +		}
>   		list_add(&tv.head, &list);
>   	} else {
>   		gobj = NULL;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> index 69a70a0aaed9..6b1da37c2280 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> @@ -996,6 +996,7 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
>   
>   	csa_tv.bo = &ctx_data->meta_data_obj->tbo;
>   	csa_tv.num_shared = 1;
> +	csa_tv.usage = DMA_RESV_USAGE_READ;
>   
>   	list_add(&csa_tv.head, &list);
>   	amdgpu_vm_get_pd_bo(vm, &list, &pd);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index dc76d2b3ce52..1b5d2317b987 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -325,6 +325,7 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
>   	entry->tv.bo = &vm->root.bo->tbo;
>   	/* Two for VM updates, one for TTM and one for the CS job */
>   	entry->tv.num_shared = 4;
> +	entry->tv.usage = DMA_RESV_USAGE_READ;
>   	entry->user_pages = NULL;
>   	list_add(&entry->tv.head, validated);
>   }
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 7b332246eda3..83531b00b29d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -1410,6 +1410,7 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
>   
>   		ctx->tv[gpuidx].bo = &vm->root.bo->tbo;
>   		ctx->tv[gpuidx].num_shared = 4;
> +		ctx->tv[gpuidx].usage = DMA_RESV_USAGE_READ;
>   		list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
>   	}
>   
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> index 368d26da0d6a..0c6e45992604 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -184,6 +184,7 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
>   	qxl_bo_ref(bo);
>   	entry->tv.bo = &bo->tbo;
>   	entry->tv.num_shared = 0;
> +	entry->tv.usage = DMA_RESV_USAGE_WRITE;
>   	list_add_tail(&entry->tv.head, &release->bos);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
> index 446f7bae54c4..6cc470dcf177 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -184,6 +184,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
>   
>   		p->relocs[i].tv.bo = &p->relocs[i].robj->tbo;
>   		p->relocs[i].tv.num_shared = !r->write_domain;
> +		p->relocs[i].tv.usage = r->write_domain ? DMA_RESV_USAGE_WRITE :
> +							  DMA_RESV_USAGE_READ;
>   
>   		radeon_cs_buckets_add(&buckets, &p->relocs[i].tv.head,
>   				      priority);
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 8c01a7f0e027..e7abd535bdc2 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -636,6 +636,7 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
>   
>   	tv.bo = &bo_va->bo->tbo;
>   	tv.num_shared = 1;
> +	tv.usage = DMA_RESV_USAGE_READ;
>   	list_add(&tv.head, &list);
>   
>   	vm_bos = radeon_vm_get_bos(rdev, bo_va->vm, &list);
> diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
> index 987cabbf1318..72ff5347b56d 100644
> --- a/drivers/gpu/drm/radeon/radeon_vm.c
> +++ b/drivers/gpu/drm/radeon/radeon_vm.c
> @@ -144,6 +144,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
>   	list[0].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
>   	list[0].tv.bo = &vm->page_directory->tbo;
>   	list[0].tv.num_shared = 1;
> +	list[0].tv.usage = DMA_RESV_USAGE_READ;
>   	list[0].tiling_flags = 0;
>   	list_add(&list[0].tv.head, head);
>   
> @@ -156,6 +157,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
>   		list[idx].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
>   		list[idx].tv.bo = &list[idx].robj->tbo;
>   		list[idx].tv.num_shared = 1;
> +		list[idx].tv.usage = DMA_RESV_USAGE_READ;
>   		list[idx].tiling_flags = 0;
>   		list_add(&list[idx++].tv.head, head);
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> index dbee34a058df..44a6bce66cf7 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -154,8 +154,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
>   	list_for_each_entry(entry, list, head) {
>   		struct ttm_buffer_object *bo = entry->bo;
>   
> -		dma_resv_add_fence(bo->base.resv, fence, entry->num_shared ?
> -				   DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
> +		dma_resv_add_fence(bo->base.resv, fence, entry->usage);
>   		ttm_bo_move_to_lru_tail_unlocked(bo);
>   		dma_resv_unlock(bo->base.resv);
>   	}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index a7d62a4eb47b..0de0365504d6 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -131,6 +131,7 @@ static void vmw_resource_release(struct kref *kref)
>   
>   			val_buf.bo = bo;
>   			val_buf.num_shared = 0;
> +			val_buf.usage = DMA_RESV_USAGE_WRITE;
>   			res->func->unbind(res, false, &val_buf);
>   		}
>   		res->backup_dirty = false;
> @@ -553,6 +554,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
>   	ttm_bo_get(&res->backup->base);
>   	val_buf->bo = &res->backup->base;
>   	val_buf->num_shared = 0;
> +	val_buf->usage = DMA_RESV_USAGE_WRITE;
>   	list_add_tail(&val_buf->head, &val_list);
>   	ret = ttm_eu_reserve_buffers(ticket, &val_list, interruptible, NULL);
>   	if (unlikely(ret != 0))
> @@ -658,6 +660,7 @@ static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
>   
>   	val_buf.bo = NULL;
>   	val_buf.num_shared = 0;
> +	val_buf.usage = DMA_RESV_USAGE_WRITE;
>   	ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf);
>   	if (unlikely(ret != 0))
>   		return ret;
> @@ -709,6 +712,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
>   
>   	val_buf.bo = NULL;
>   	val_buf.num_shared = 0;
> +	val_buf.usage = DMA_RESV_USAGE_WRITE;
>   	if (res->backup)
>   		val_buf.bo = &res->backup->base;
>   	do {
> @@ -777,7 +781,8 @@ void vmw_resource_unbind_list(struct vmw_buffer_object *vbo)
>   {
>   	struct ttm_validate_buffer val_buf = {
>   		.bo = &vbo->base,
> -		.num_shared = 0
> +		.num_shared = 0,
> +		.usage = DMA_RESV_USAGE_WRITE
>   	};
>   
>   	dma_resv_assert_held(vbo->base.base.resv);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> index f46891012be3..913e91962af1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> @@ -289,6 +289,7 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
>   		if (!val_buf->bo)
>   			return -ESRCH;
>   		val_buf->num_shared = 0;
> +		val_buf->usage = DMA_RESV_USAGE_WRITE;
>   		list_add_tail(&val_buf->head, &ctx->bo_list);
>   		bo_node->as_mob = as_mob;
>   		bo_node->cpu_blit = cpu_blit;
> diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
> index a99d7fdf2964..5b65f5e1354a 100644
> --- a/include/drm/ttm/ttm_execbuf_util.h
> +++ b/include/drm/ttm/ttm_execbuf_util.h
> @@ -41,12 +41,14 @@
>    * @head:           list head for thread-private list.
>    * @bo:             refcounted buffer object pointer.
>    * @num_shared:     How many shared fences we want to add.
> + * @usage           dma resv usage of the fences to add.
>    */
>   
>   struct ttm_validate_buffer {
>   	struct list_head head;
>   	struct ttm_buffer_object *bo;
>   	unsigned int num_shared;
> +	enum dma_resv_usage usage;
>   };
>   
>   /**
