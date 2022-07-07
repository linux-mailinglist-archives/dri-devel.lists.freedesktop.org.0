Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5D156A00C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BE511A58C;
	Thu,  7 Jul 2022 10:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2068.outbound.protection.outlook.com [40.107.96.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A72711A58C;
 Thu,  7 Jul 2022 10:35:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWvTAdnVqwEMRgTalaiLJFiGH95g+jPKMb3yJwqzkcVf3CddSS7qZqR8IkjdqQmQv+BsqNIGLeCppU5+OS9Dx02qs53kHVbB+Yg0G1/0AkWkLGJExSJrXM9K+Rgl+adUBT49IlZRPkkYAWJq5iBIIQN2ypvKAxMQHpKtygxrsDzcFJQw8vCyuXWXxKsE98a4P3M/iMYA1R/gkgbZ2Q6hvPuxxUa/OCnrcG8nllixszFd+YQyNa5xSVlO8i2kbCrNa0FnG5SBe69QRpizroyD5K/Z5u97idJLthNXm0l1ND94cg/R/VoOERVtlqPLLocpQDGtQU4VEc26uX4WpQ/nDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhxDd4ssRu8sMFUh2tBQ2Y2P+oQX5S/4dE4dHKhcSso=;
 b=g5NMvVWPEZAIabdtOxAuXX+QMgJBe2dCyAJL7/q5910awrXYiOBt5xAMUyS+gZBKmKDy1dUJkJJ05y1KfstPr9o6eSSXAUO6jq06S9RU45cIjY8OIZVAlQGQBK54zOqGW5vKlRCkno8DAmEMQUNllpJKe/hbKsR8GmcJuCmTtRf8OhwL4QJtuaMYtvGRkhJxFfPThGVA5T9y+tE0tmKT8ea9ml7UrslRaKO96AhGh4ET9l8gbzsk7Cicuo5aLudNoBz6mUq1QctaS9ikFmVzqR4cMXABuySE2ZScfAUKeoIDsQ0oKa8JxtWQO+QpQL2OfmXMw5EUcED5muPo+X+Khg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhxDd4ssRu8sMFUh2tBQ2Y2P+oQX5S/4dE4dHKhcSso=;
 b=lmR79BLp+z+KCIlA3pfdTCLNIkvTpuB77PomjNGV9JXbrHRzepoOxRgR1X66+Lg8orJb4uyJALb2kEqKe8rf+mxPH/NtJdrqn9QiygG/QBBxvirL3CZPzQVd4B3nKjXV5OWbuu7mJduD4WxAq5crnJZNuNIqOV+StIAyyWoM3dQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR1201MB0070.namprd12.prod.outlook.com (2603:10b6:910:18::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 10:35:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 10:35:27 +0000
Message-ID: <a8fa9afc-8133-4374-5d85-96f2d16ac7a2@amd.com>
Date: Thu, 7 Jul 2022 12:35:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] drm/ttm: rename and cleanup ttm_bo_init_reserved
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220707102453.3633-1-christian.koenig@amd.com>
 <20220707102453.3633-2-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220707102453.3633-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0085.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::30) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fadd3054-0b5a-4501-0827-08da60046838
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0070:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CvZ4LIFytpvgCnTymFdVzrVS3kjldm/ATUyY7tBsE9uPbncTqWNN3u8ao+C/tHzEEPaPVpah6utv1uKqzSeljssnDYDAst0OzZ2xQA6P7+LCYtjcLKtVs6mAusbyAD+HtzDK26e7WKvHEgCxB78EvzVacM25GlNbZl1FdgjuF1vgytcMKANI/vEHTfT+cRwOwikFHpTAhQFYTlvNWmPmSEOH859BE8brmRvhkn4kIflnL/LFDdHXlpFyoFG/UCLanAbJkGwNtaDih4XoONVQ3nrBqLS1GEWzi/Me6ujWBmYu+vAfbIeu2sjEl8gzROKcQwuvBjnmItYEA80VgY82vjhEUiTwvs7F1I8E3btILu5zHKVWzVMaN6f3Z2mKfGwC2X+BQyOCUd4e2dTudCYeBVmxB5SBLa61huTII5IOESsMYqCz+wg1xlv+Oaak7BNcYK5mBkKYuiPGcxt0NK5H/hUM0H9or8koPJlH9DGwxPPAAPg4JRs4zMS0IAmcw9PYAqMU5JV13MKUX0uFiCmk0bFqh4A5K3PjrdDFsxxZ5nShNMPNp6PdvK0PkaI0BnXStBGSjXOQWKGFMGUTdew05sWMxesZ6Oaxk7/9W5ra6Peka4bqmNHqGzTjFa2kws9xtWjRB00J4zSW2+6wZbbxQ9SMQQK4VVzulUSF0FmD11yqbl/48CkO3ErPisvPU9pn7ZJa1v637uPU+L93T4S/MUhmTMNV3KAqUo0Bxvk3x1VhtuAs+czgSnr/3euhEOIcYLniawie3qv7MH0pORB3Bi0okygB2Zz3AbvZF2WKvHKthT48/QHQE6upEe6fAGYPMGpAj+dhScUKhsocgbExUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(31696002)(66556008)(8676002)(41300700001)(66946007)(86362001)(6506007)(2906002)(6666004)(66476007)(26005)(8936002)(83380400001)(5660300002)(186003)(6512007)(66574015)(478600001)(30864003)(31686004)(38100700002)(316002)(2616005)(6486002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0RxQXp6MG5ZNm8vZ0t5QjhnMW4rUnlpQlRTUSt0UU1EN2Z4dTlqK05qb1pi?=
 =?utf-8?B?cDgvUzVuSkMydTFTQkJpbkt2aTRvV1htdTJWKzNlVnNYUVJqNDYyK2VYK3FQ?=
 =?utf-8?B?TW81WTNsUGJLNHpMQnc4bWRsVUUvSlU0MHh6cTh4MjMyU3o4Tm9DTFdjVCts?=
 =?utf-8?B?Qk93bmxYRDZHSXdlTnViZjIzRVg4elFLR3RqVmpIV1FETVFFem5henRxRnh4?=
 =?utf-8?B?b2I2RnkraXhFRDRmOWdiQTl1b3VoNEl0M29VazRXM1U2dGIwbDZoVWZNWEQz?=
 =?utf-8?B?WVlPaUhsdDdvNG9KUTN3TG5Pdm9EazltSkFQRzZQMjZaWHRqanoxb0VQcUQ4?=
 =?utf-8?B?TDVHTG0xdkNQQmRQZWd1VXUzN2JIdy91eGUwdmlURUhWaWQ5RFAxRWZqVXZX?=
 =?utf-8?B?aGhwSkdmMzFFQ0FVNThKOUhiUjE1S1ZLbFI4SVVoMmFzQXFKWEZnNjNCN09O?=
 =?utf-8?B?TzFZOFIxc1J6MnJpUnp5LzJjNFRRZGRMRDJsK1g5MFg3ZGlCeDkwL0lpVTVi?=
 =?utf-8?B?c20rTjNVM0JFNHBhb1RWZVgvUTFUS0NjQXdQalpicmI4YU1IQ0V1RktMTHpr?=
 =?utf-8?B?SzkyWGowYWdaRExMWEszTStscDdnUUJqSnlaRldzK2pNMldDSzJzU2ZLUzdk?=
 =?utf-8?B?WEpUSVBsc1d6TjJaTStUS0NPK3dNQ0hQUjhFQWpaOUpBL3pIWDZKbGFiT3A5?=
 =?utf-8?B?Y05uZDkvS28vZHo1ZVI4d3lUK01BTUJucXAwdm9QcXkrRnBNV2xIZzlOazVJ?=
 =?utf-8?B?WlUrelpFSkgvQllaQ1ZqMGRiOVNhK3ZNVWJIZS9XM1ZOUm1yck82VWhyTGt1?=
 =?utf-8?B?eG82U2VFaDZ0ZFg1d0lxbW9EeDBhVnZNM0Q3RVVZaGVmaTllM0FkSUl5VTR1?=
 =?utf-8?B?V1lKcHBVTlB0L04rbnZaYjJEODE1RjE1Q3ZmdUVnZXpGSWhRWTR1V0ZQVzh4?=
 =?utf-8?B?dzQ1U0NUS3lmNjdLZ2UxZW9pM0ZOemNUcFBYQ3p5SktNTkxkV1RPbTI2c2tn?=
 =?utf-8?B?OWJvanVLSzZWTHo0ZXBkYm1wSmF3MEZQYmsxTUFkMU5sa0xDejdRbHk2Tk5u?=
 =?utf-8?B?ZEx3NGRTa1phMmsyanJ3eCtSdlVUNnVza3RIcThId0IzQXhSMk5WZnlZLzNO?=
 =?utf-8?B?RWdKSzNOeWlHVVMxYVJrVW1wNXhtVERqR3orY2wrc0NlcFZFTWE5UUhQT0Nq?=
 =?utf-8?B?c0F0YkxSUVZlbWlYMFM2QWdIU0JsYUJBWG1laEpnQ3Y5VEhvZ09Gd3FibHg4?=
 =?utf-8?B?L3RodWM1TmZLQzR0TlYzZ3ZQQ1laSUcveUNSQ1hMclIza0wvZEdvUFRQc2pN?=
 =?utf-8?B?SCtzcnhDN3FzZmtyVjFwWFM0ZjhmM3lxSGI0V0x5RGZweHVRS2RUY3p0VUQ0?=
 =?utf-8?B?aDNPNXJ4bWRDbEVmcnVnTkJndG91ZGZQS2VLaWFKdUhmSVdTeXZ3ZGxBR2tB?=
 =?utf-8?B?K0szU0hLWmR3dUpDUis2MXRYUHozRkJGZDFZcTZHeTVJOU1EQVpRQ1pUd1kr?=
 =?utf-8?B?dG1la1RJNElMZUZYRzdDMktMTkNoKzNjeG1xdnloc2hpTjkwRmFDeSs0eVlY?=
 =?utf-8?B?N0M4bkVvTFJzWVhLcWVQbHdPMC9wMTRtUCtxN2lnUWNtclhsMERJNU05Tjhn?=
 =?utf-8?B?WWZMdFJQd3ZQcGVHc2R5TGZibDNrQ3FrVzV5QjlVcjRJeFZ2RmNIUDRpU3dj?=
 =?utf-8?B?a2l5U0RaUVVmRzFiQWxWSlMwOFZTRWEzNXNOcmdYR3RkQ2FVS29YaXZlQlhW?=
 =?utf-8?B?SXZmZkFhMWRaSXJsZ0RPVjBRTGEwQ25OTG5sTDBWUmtqSmZIcit0SlpBc1No?=
 =?utf-8?B?MnJRdGFtTTN1QXZYSzU2NHBJaUlTbkIwMWVZeSs0ekVvSjdLYTJOZVUxbEVz?=
 =?utf-8?B?M3pUN0RlbEwvVWpTNnk3WGQ3UGJBUDVRcEw2VWxWUlk0eEQ3am96TnkrVEdZ?=
 =?utf-8?B?SURMcVlobGZkRWIxblZucE1HL3NWSldrVWZsbEs0dTRRYytMVXVNTzhuaDZu?=
 =?utf-8?B?ZkI5ZWE3b3lJS3hSUFd1WWJwL3QwZ1lPVFpsQ1ZobE1GMlArVkwyOE1SdTRq?=
 =?utf-8?B?OXlCQm5LVlJua21USk1FeWRhNTVNcnJzSyt2dkluOFhtcks4UjhwZEh6UmJR?=
 =?utf-8?Q?+TiaMOd4TE9Dk/hryxvRNrKEp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fadd3054-0b5a-4501-0827-08da60046838
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 10:35:27.3328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxQ12xy92LB+spIfYVwyCg5hZcy8X7jyaqozk0a0XNfGZYG/GlILNpGnekLzbtLX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0070
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

Am 07.07.22 um 12:24 schrieb Christian König:
> Rename ttm_bo_init_reserved to ttm_bo_init_validate since that better

Ah, crap. Here is a typo, that should read "Rename ttm_bo_init to 
ttm_bo_init_validate"....

Please ignore during review,
Christian.

> matches what the function is actually doing.
>
> Remove the unused size parameter, move the function's kerneldoc to the
> implementation and cleanup the whole error handling.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |   2 +-
>   drivers/gpu/drm/drm_gem_vram_helper.c      |   6 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |   5 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.c       |   6 +-
>   drivers/gpu/drm/qxl/qxl_object.c           |   2 +-
>   drivers/gpu/drm/radeon/radeon_object.c     |   6 +-
>   drivers/gpu/drm/ttm/ttm_bo.c               | 147 +++++++++++++++------
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |  12 +-
>   include/drm/ttm/ttm_bo_api.h               |  93 ++-----------
>   9 files changed, 129 insertions(+), 150 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 2c82b1d5a0d7..d9cfe259f2a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -591,7 +591,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   	if (!bp->destroy)
>   		bp->destroy = &amdgpu_bo_destroy;
>   
> -	r = ttm_bo_init_reserved(&adev->mman.bdev, &bo->tbo, size, bp->type,
> +	r = ttm_bo_init_reserved(&adev->mman.bdev, &bo->tbo, bp->type,
>   				 &bo->placement, page_align, &ctx,  NULL,
>   				 bp->resv, bp->destroy);
>   	if (unlikely(r != 0))
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index d607043716d3..125160b534be 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -226,9 +226,9 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>   	 * A failing ttm_bo_init will call ttm_buffer_object_destroy
>   	 * to release gbo->bo.base and kfree gbo.
>   	 */
> -	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
> -			  &gbo->placement, pg_align, false, NULL, NULL,
> -			  ttm_buffer_object_destroy);
> +	ret = ttm_bo_init_validate(bdev, &gbo->bo, ttm_bo_type_device,
> +				   &gbo->placement, pg_align, false, NULL, NULL,
> +				   ttm_buffer_object_destroy);
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 4c25d9b2f138..70e2ed4e99df 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1229,9 +1229,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>   	 * Similarly, in delayed_destroy, we can't call ttm_bo_put()
>   	 * until successful initialization.
>   	 */
> -	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), size,
> -				   bo_type, &i915_sys_placement,
> -				   page_size >> PAGE_SHIFT,
> +	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), bo_type,
> +				   &i915_sys_placement, page_size >> PAGE_SHIFT,
>   				   &ctx, NULL, NULL, i915_ttm_bo_destroy);
>   	if (ret)
>   		return i915_ttm_err_to_gem(ret);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 05076e530e7d..92cd19021084 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -307,9 +307,9 @@ nouveau_bo_init(struct nouveau_bo *nvbo, u64 size, int align, u32 domain,
>   	nouveau_bo_placement_set(nvbo, domain, 0);
>   	INIT_LIST_HEAD(&nvbo->io_reserve_lru);
>   
> -	ret = ttm_bo_init(nvbo->bo.bdev, &nvbo->bo, size, type,
> -			  &nvbo->placement, align >> PAGE_SHIFT, false, sg,
> -			  robj, nouveau_bo_del_ttm);
> +	ret = ttm_bo_init_validate(nvbo->bo.bdev, &nvbo->bo, type,
> +				   &nvbo->placement, align >> PAGE_SHIFT, false,
> +				   sg, robj, nouveau_bo_del_ttm);
>   	if (ret) {
>   		/* ttm will call nouveau_bo_del_ttm if it fails.. */
>   		return ret;
> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
> index b42a657e4c2f..695d9308d1f0 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -141,7 +141,7 @@ int qxl_bo_create(struct qxl_device *qdev, unsigned long size,
>   	qxl_ttm_placement_from_domain(bo, domain);
>   
>   	bo->tbo.priority = priority;
> -	r = ttm_bo_init_reserved(&qdev->mman.bdev, &bo->tbo, size, type,
> +	r = ttm_bo_init_reserved(&qdev->mman.bdev, &bo->tbo, type,
>   				 &bo->placement, 0, &ctx, NULL, NULL,
>   				 &qxl_ttm_bo_destroy);
>   	if (unlikely(r != 0)) {
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index 6c4a6802ca96..00c33b24d5d3 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -202,9 +202,9 @@ int radeon_bo_create(struct radeon_device *rdev,
>   	radeon_ttm_placement_from_domain(bo, domain);
>   	/* Kernel allocation are uninterruptible */
>   	down_read(&rdev->pm.mclk_lock);
> -	r = ttm_bo_init(&rdev->mman.bdev, &bo->tbo, size, type,
> -			&bo->placement, page_align, !kernel, sg, resv,
> -			&radeon_ttm_bo_destroy);
> +	r = ttm_bo_init_validate(&rdev->mman.bdev, &bo->tbo, type,
> +				 &bo->placement, page_align, !kernel, sg, resv,
> +				 &radeon_ttm_bo_destroy);
>   	up_read(&rdev->pm.mclk_lock);
>   	if (unlikely(r != 0)) {
>   		return r;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 0e210df65c30..984535d6a2d0 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -921,36 +921,61 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>   }
>   EXPORT_SYMBOL(ttm_bo_validate);
>   
> -int ttm_bo_init_reserved(struct ttm_device *bdev,
> -			 struct ttm_buffer_object *bo,
> -			 size_t size,
> -			 enum ttm_bo_type type,
> -			 struct ttm_placement *placement,
> -			 uint32_t page_alignment,
> -			 struct ttm_operation_ctx *ctx,
> -			 struct sg_table *sg,
> -			 struct dma_resv *resv,
> +/**
> + * ttm_bo_init_validate
> + *
> + * @bdev: Pointer to a ttm_device struct.
> + * @bo: Pointer to a ttm_buffer_object to be initialized.
> + * @type: Requested type of buffer object.
> + * @placement: Initial placement for buffer object.
> + * @alignment: Data alignment in pages.
> + * @ctx: TTM operation context for memory allocation.
> + * @sg: Scatter-gather table.
> + * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
> + * @destroy: Destroy function. Use NULL for kfree().
> + *
> + * This function initializes a pre-allocated struct ttm_buffer_object.
> + * As this object may be part of a larger structure, this function,
> + * together with the @destroy function, enables driver-specific objects
> + * derived from a ttm_buffer_object.
> + *
> + * On successful return, the caller owns an object kref to @bo. The kref and
> + * list_kref are usually set to 1, but note that in some situations, other
> + * tasks may already be holding references to @bo as well.
> + * Furthermore, if resv == NULL, the buffer's reservation lock will be held,
> + * and it is the caller's responsibility to call ttm_bo_unreserve.
> + *
> + * If a failure occurs, the function will call the @destroy function. Thus,
> + * after a failure, dereferencing @bo is illegal and will likely cause memory
> + * corruption.
> + *
> + * Returns
> + * -ENOMEM: Out of memory.
> + * -EINVAL: Invalid placement flags.
> + * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resources.
> + */
> +int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
> +			 enum ttm_bo_type type, struct ttm_placement *placement,
> +			 uint32_t alignment, struct ttm_operation_ctx *ctx,
> +			 struct sg_table *sg, struct dma_resv *resv,
>   			 void (*destroy) (struct ttm_buffer_object *))
>   {
>   	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
> -	bool locked;
>   	int ret;
>   
> -	bo->destroy = destroy;
>   	kref_init(&bo->kref);
>   	INIT_LIST_HEAD(&bo->ddestroy);
>   	bo->bdev = bdev;
>   	bo->type = type;
> -	bo->page_alignment = page_alignment;
> +	bo->page_alignment = alignment;
> +	bo->destroy = destroy;
>   	bo->pin_count = 0;
>   	bo->sg = sg;
>   	bo->bulk_move = NULL;
> -	if (resv) {
> +	if (resv)
>   		bo->base.resv = resv;
> -		dma_resv_assert_held(bo->base.resv);
> -	} else {
> +	else
>   		bo->base.resv = &bo->base._resv;
> -	}
>   	atomic_inc(&ttm_glob.bo_count);
>   
>   	ret = ttm_resource_alloc(bo, &sys_mem, &bo->resource);
> @@ -963,50 +988,84 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>   	 * For ttm_bo_type_device buffers, allocate
>   	 * address space from the device.
>   	 */
> -	if (bo->type == ttm_bo_type_device ||
> -	    bo->type == ttm_bo_type_sg)
> +	if (bo->type == ttm_bo_type_device || bo->type == ttm_bo_type_sg) {
>   		ret = drm_vma_offset_add(bdev->vma_manager, &bo->base.vma_node,
> -					 bo->resource->num_pages);
> +					 PFN_UP(bo->base.size));
> +		if (ret)
> +			goto err_put;
> +	}
>   
>   	/* passed reservation objects should already be locked,
>   	 * since otherwise lockdep will be angered in radeon.
>   	 */
> -	if (!resv) {
> -		locked = dma_resv_trylock(bo->base.resv);
> -		WARN_ON(!locked);
> -	}
> +	if (!resv)
> +		WARN_ON(!dma_resv_trylock(bo->base.resv));
> +	else
> +		dma_resv_assert_held(resv);
>   
> -	if (likely(!ret))
> -		ret = ttm_bo_validate(bo, placement, ctx);
> +	ret = ttm_bo_validate(bo, placement, ctx);
> +	if (unlikely(ret))
> +		goto err_unlock;
>   
> -	if (unlikely(ret)) {
> -		if (!resv)
> -			ttm_bo_unreserve(bo);
> +	return 0;
>   
> -		ttm_bo_put(bo);
> -		return ret;
> -	}
> +err_unlock:
> +	if (!resv)
> +		dma_resv_unlock(bo->base.resv);
>   
> +err_put:
> +	ttm_bo_put(bo);
>   	return ret;
>   }
>   EXPORT_SYMBOL(ttm_bo_init_reserved);
>   
> -int ttm_bo_init(struct ttm_device *bdev,
> -		struct ttm_buffer_object *bo,
> -		size_t size,
> -		enum ttm_bo_type type,
> -		struct ttm_placement *placement,
> -		uint32_t page_alignment,
> -		bool interruptible,
> -		struct sg_table *sg,
> -		struct dma_resv *resv,
> -		void (*destroy) (struct ttm_buffer_object *))
> +/**
> + * ttm_bo_init_validate
> + *
> + * @bdev: Pointer to a ttm_device struct.
> + * @bo: Pointer to a ttm_buffer_object to be initialized.
> + * @type: Requested type of buffer object.
> + * @placement: Initial placement for buffer object.
> + * @alignment: Data alignment in pages.
> + * @interruptible: If needing to sleep to wait for GPU resources,
> + * sleep interruptible.
> + * pinned in physical memory. If this behaviour is not desired, this member
> + * holds a pointer to a persistent shmem object. Typically, this would
> + * point to the shmem object backing a GEM object if TTM is used to back a
> + * GEM user interface.
> + * @sg: Scatter-gather table.
> + * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
> + * @destroy: Destroy function. Use NULL for kfree().
> + *
> + * This function initializes a pre-allocated struct ttm_buffer_object.
> + * As this object may be part of a larger structure, this function,
> + * together with the @destroy function,
> + * enables driver-specific objects derived from a ttm_buffer_object.
> + *
> + * On successful return, the caller owns an object kref to @bo. The kref and
> + * list_kref are usually set to 1, but note that in some situations, other
> + * tasks may already be holding references to @bo as well.
> + *
> + * If a failure occurs, the function will call the @destroy function, Thus,
> + * after a failure, dereferencing @bo is illegal and will likely cause memory
> + * corruption.
> + *
> + * Returns
> + * -ENOMEM: Out of memory.
> + * -EINVAL: Invalid placement flags.
> + * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resources.
> + */
> +int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
> +			 enum ttm_bo_type type, struct ttm_placement *placement,
> +			 uint32_t alignment, bool interruptible,
> +			 struct sg_table *sg, struct dma_resv *resv,
> +			 void (*destroy) (struct ttm_buffer_object *))
>   {
>   	struct ttm_operation_ctx ctx = { interruptible, false };
>   	int ret;
>   
> -	ret = ttm_bo_init_reserved(bdev, bo, size, type, placement,
> -				   page_alignment, &ctx, sg, resv, destroy);
> +	ret = ttm_bo_init_reserved(bdev, bo, type, placement, alignment, &ctx,
> +				   sg, resv, destroy);
>   	if (ret)
>   		return ret;
>   
> @@ -1015,7 +1074,7 @@ int ttm_bo_init(struct ttm_device *bdev,
>   
>   	return 0;
>   }
> -EXPORT_SYMBOL(ttm_bo_init);
> +EXPORT_SYMBOL(ttm_bo_init_validate);
>   
>   /*
>    * buffer object vm functions.
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index 85a66014c2b6..eb2fd7694cd1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -429,9 +429,9 @@ int vmw_bo_create_kernel(struct vmw_private *dev_priv, unsigned long size,
>   
>   	drm_gem_private_object_init(vdev, &bo->base, size);
>   
> -	ret = ttm_bo_init_reserved(&dev_priv->bdev, bo, size,
> -				   ttm_bo_type_kernel, placement, 0,
> -				   &ctx, NULL, NULL, vmw_bo_default_destroy);
> +	ret = ttm_bo_init_reserved(&dev_priv->bdev, bo, ttm_bo_type_kernel,
> +				   placement, 0, &ctx, NULL, NULL,
> +				   vmw_bo_default_destroy);
>   	if (unlikely(ret))
>   		goto error_free;
>   
> @@ -512,10 +512,8 @@ int vmw_bo_init(struct vmw_private *dev_priv,
>   	size = ALIGN(size, PAGE_SIZE);
>   	drm_gem_private_object_init(vdev, &vmw_bo->base.base, size);
>   
> -	ret = ttm_bo_init_reserved(bdev, &vmw_bo->base, size,
> -				   ttm_bo_type_device,
> -				   placement,
> -				   0, &ctx, NULL, NULL, bo_free);
> +	ret = ttm_bo_init_reserved(bdev, &vmw_bo->base, ttm_bo_type_device,
> +				   placement, 0, &ctx, NULL, NULL, bo_free);
>   	if (unlikely(ret)) {
>   		return ret;
>   	}
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 2d524f8b0802..44a538ee5e2a 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -317,93 +317,16 @@ void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resched);
>   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   			      const struct ttm_place *place);
>   
> -/**
> - * ttm_bo_init_reserved
> - *
> - * @bdev: Pointer to a ttm_device struct.
> - * @bo: Pointer to a ttm_buffer_object to be initialized.
> - * @size: Requested size of buffer object.
> - * @type: Requested type of buffer object.
> - * @placement: Initial placement for buffer object.
> - * @page_alignment: Data alignment in pages.
> - * @ctx: TTM operation context for memory allocation.
> - * @sg: Scatter-gather table.
> - * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
> - * @destroy: Destroy function. Use NULL for kfree().
> - *
> - * This function initializes a pre-allocated struct ttm_buffer_object.
> - * As this object may be part of a larger structure, this function,
> - * together with the @destroy function,
> - * enables driver-specific objects derived from a ttm_buffer_object.
> - *
> - * On successful return, the caller owns an object kref to @bo. The kref and
> - * list_kref are usually set to 1, but note that in some situations, other
> - * tasks may already be holding references to @bo as well.
> - * Furthermore, if resv == NULL, the buffer's reservation lock will be held,
> - * and it is the caller's responsibility to call ttm_bo_unreserve.
> - *
> - * If a failure occurs, the function will call the @destroy function, or
> - * kfree() if @destroy is NULL. Thus, after a failure, dereferencing @bo is
> - * illegal and will likely cause memory corruption.
> - *
> - * Returns
> - * -ENOMEM: Out of memory.
> - * -EINVAL: Invalid placement flags.
> - * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resources.
> - */
> -
> -int ttm_bo_init_reserved(struct ttm_device *bdev,
> -			 struct ttm_buffer_object *bo,
> -			 size_t size, enum ttm_bo_type type,
> -			 struct ttm_placement *placement,
> -			 uint32_t page_alignment,
> -			 struct ttm_operation_ctx *ctx,
> +int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
> +			 enum ttm_bo_type type, struct ttm_placement *placement,
> +			 uint32_t alignment, struct ttm_operation_ctx *ctx,
> +			 struct sg_table *sg, struct dma_resv *resv,
> +			 void (*destroy) (struct ttm_buffer_object *));
> +int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
> +			 enum ttm_bo_type type, struct ttm_placement *placement,
> +			 uint32_t alignment, bool interruptible,
>   			 struct sg_table *sg, struct dma_resv *resv,
>   			 void (*destroy) (struct ttm_buffer_object *));
> -
> -/**
> - * ttm_bo_init
> - *
> - * @bdev: Pointer to a ttm_device struct.
> - * @bo: Pointer to a ttm_buffer_object to be initialized.
> - * @size: Requested size of buffer object.
> - * @type: Requested type of buffer object.
> - * @placement: Initial placement for buffer object.
> - * @page_alignment: Data alignment in pages.
> - * @interruptible: If needing to sleep to wait for GPU resources,
> - * sleep interruptible.
> - * pinned in physical memory. If this behaviour is not desired, this member
> - * holds a pointer to a persistent shmem object. Typically, this would
> - * point to the shmem object backing a GEM object if TTM is used to back a
> - * GEM user interface.
> - * @sg: Scatter-gather table.
> - * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
> - * @destroy: Destroy function. Use NULL for kfree().
> - *
> - * This function initializes a pre-allocated struct ttm_buffer_object.
> - * As this object may be part of a larger structure, this function,
> - * together with the @destroy function,
> - * enables driver-specific objects derived from a ttm_buffer_object.
> - *
> - * On successful return, the caller owns an object kref to @bo. The kref and
> - * list_kref are usually set to 1, but note that in some situations, other
> - * tasks may already be holding references to @bo as well.
> - *
> - * If a failure occurs, the function will call the @destroy function, or
> - * kfree() if @destroy is NULL. Thus, after a failure, dereferencing @bo is
> - * illegal and will likely cause memory corruption.
> - *
> - * Returns
> - * -ENOMEM: Out of memory.
> - * -EINVAL: Invalid placement flags.
> - * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resources.
> - */
> -int ttm_bo_init(struct ttm_device *bdev, struct ttm_buffer_object *bo,
> -		size_t size, enum ttm_bo_type type,
> -		struct ttm_placement *placement,
> -		uint32_t page_alignment, bool interrubtible,
> -		struct sg_table *sg, struct dma_resv *resv,
> -		void (*destroy) (struct ttm_buffer_object *));
>   
>   /**
>    * ttm_kmap_obj_virtual

