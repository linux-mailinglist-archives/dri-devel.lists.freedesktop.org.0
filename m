Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABEA63A106
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 07:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ADE10E1BA;
	Mon, 28 Nov 2022 06:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D13B10E1B9;
 Mon, 28 Nov 2022 06:00:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPcyUBeNlqBfwMgyYTjy55VzBFRc5lhe7/DR3Uzadr5A+zvLawMLWk9D/iLlkB2FnrZl0AK2K7gUaqVWLog1rMcqS7RsnsJkadprtofMABs+rj/CiC/AEKYaGim16IEp2j2IQqyKycUS24jAv7iS1O5Hfg2ZT/uOXcnqikZLrzMef42L/HmBvU1NMpw5DB0sagF8D7EwSu3SiGFBsQK3tk1olqwYZIw8kmByH3fMa5chtNwSFiI37Otc/hd+EGpDm74KNOOAYjVc6VGMmb/04GEG8g20NTX608NH9YQWA5gbhvXqtx0R8c0vJMLTmONRWgMC8zxUbxXUQf5hmOiS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEpFdPw2AZdhxASAebMCEVOxDkDse2FMdQdrF0u/qS4=;
 b=FzHdeIJhG0cZ2NtOa2aRA8K/ScDVXBl/c9ATzlAKjQZoDq6cRGpXF5pqZAwu4q2p7nZt+vMrfZfT8synSIIHxDDoKZcvsl4FWYl0ra7wCVyeCihK5APtN0hRtE/7sWjRqXNRmkte3+sq+4PdqdAcyINp8ScVgYFwkWkO4UVAp1KU8jI1SlMozDAz1/+L8EJGTQ+Fpg2APyB2JvsBxqnqBmBAtzpqQiDxvGPT/jL9+tZKcECUUPnY4f+K8/WdWQnwG6kbmLWwQS8yOiGqoDqVCZktQ/SqwgL228WGH/ZfWwx9uemLUKJAbjBKjUxfLLzJvZwVsFjTywvw7YC0ncIDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEpFdPw2AZdhxASAebMCEVOxDkDse2FMdQdrF0u/qS4=;
 b=AwCHM/nBnjlvxvEyASG0GkhsM2o+qYvNdYySdZjxIgE+lanXLi0hjgApZfUXlcBiTWumIKjuB/4BbvVNtXSXIajHP+NYj/DzsrDKoHVmEqbHZbEfEFpOAk74WOgip1cqJJP0WKlbJzpDvoivK6JsmxGwnowVfNvwQnUFiPxllLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by IA0PR12MB7554.namprd12.prod.outlook.com (2603:10b6:208:43e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Mon, 28 Nov
 2022 06:00:49 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6755:9455:2407:ea3e]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6755:9455:2407:ea3e%9]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 06:00:48 +0000
Content-Type: multipart/alternative;
 boundary="------------I44YoslAfZn9aEs9tqioAB2Q"
Message-ID: <d696b7cb-000a-c9b6-cf8d-8052b5047bf6@amd.com>
Date: Mon, 28 Nov 2022 11:30:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/9] drm/amdgpu: generally allow over-commit during BO
 allocation
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221125102137.1801-1-christian.koenig@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20221125102137.1801-1-christian.koenig@amd.com>
X-ClientProxiedBy: PN2PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::16) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|IA0PR12MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: ef427c48-5582-48d4-d47a-08dad105e511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0DP1kG65wbDsPWjfXAu0Koi+MiqJGJUAeZKYvQdYTWYe3agNn1zg7yekluHB/y2lUiKiB2sAZwX+mGCOMnjeTW6+sMeoAYFSLw/d2BmOEQuy+bDsvkxa49Z2uZZk1llM/gP7u+M8X944Dp4nzeNsMH+l4TsCmR7Y/BCbhczhtS+yZZfG/e4DNYtExw7i10UNFddxBebppbidvIKq5GF4GPIHVwvb5vDZdu6fzEpZDqiBSntsN0dbtQ/OdgWW+zy/w641yRKz8ri2zPk+JC+HMK1XZiuDqXtFUj1TeYI42qf9+iZxNwljzVBF7PsvcfynHEE0EPuU3t6uVjcg2hdoI8zHxP2ZlzINnkMktpoXVogoCkybwy+ZYEfwo2EdIiOncTHu+pLYS9epSTyqdHNkP+IRj9paB6BhXT8OKrdlw+AmWpAAsHI4yltkBgZX4m7K2r0xBZSALmKluK0YUFeoHgR0wIgyRgU24uBxGh0/Pzn9tAe7Wgsg119ZgdLRVBb4Iws2/LWUVR2aFRnkmkWH85J5JvnYb/0nBzpF1uh/p/hjMRwA5uuDK+H0T5c5UaxtLVqmAbHDf/JhkWxeJbD+ESINkMZCWY13KiG+rr9FAOgzNWgAHorF37LYkIRBTY7iCK4MpLZzd+hZfOVyloYmBYYh6gKLfZm/V76J3n83vu6aT7uPK2GXuP9dfEydHNnFCi+rbarVMa4pjxD1YspKPrXPXb0r0E618+XgvPW31vE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(36756003)(53546011)(6512007)(478600001)(26005)(6486002)(38100700002)(33964004)(66476007)(41300700001)(66556008)(8676002)(66946007)(86362001)(31696002)(316002)(110136005)(5660300002)(8936002)(186003)(66574015)(6666004)(2616005)(6506007)(31686004)(83380400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDZHVWJlYVFkS1JsYXRFSkJBdWE2WjQrcml0S2U3ZXYra0VYbHBKSnArRXly?=
 =?utf-8?B?UGtCSEdkSCtwbi9iRmxlYkZVZ25RNHd0VFZsZnorM2d0YUJnN3Z6RmNmYzBU?=
 =?utf-8?B?Mk0rQU5xWjBDVlFvVzVEL1BwU3pFRVA2RmltYWZaUUNqdWl1bGxoK3lGNjAv?=
 =?utf-8?B?QzVwcjlHVEhRR1IydFpxMlRoeVc4cmNsZGxIdVpqQlZyS3JNOUlYNGdCSmM2?=
 =?utf-8?B?THppTkhCYmozM3lsdGFPT3VMMU1Ic3QwNzl2KzFna0dENFYweHFOdEJScDMr?=
 =?utf-8?B?QjJPOVBFUDQxTFNPTnNJUWV3bGcrUVZGOTVyaVdJaVl5NEFydW4zM1dFWFpp?=
 =?utf-8?B?WGtlK3pYR1FWYXRVRXVmbXNwcWZ3UUp4MDVEb2VzaloxYno1WW5DL0IzVkxD?=
 =?utf-8?B?bzRkMFF0SEpobkhwWnRpSCtlRTI5bGY5TWl6cnhQRnNURG5wcm5qeWtCbDE4?=
 =?utf-8?B?dHhhb3R1OG5vWEdRcTJVT0xDTEtUeExZbEhXZUNaMzFCNWNnSitxMGdSYW1n?=
 =?utf-8?B?YzA1Q3ZnQm1ldmdBakxENHhLRi9VU2pwWm9FM0Z2czJlQzJPVXh0QWxqUTRF?=
 =?utf-8?B?bDNiU1lCUzVtT013em1mNWdGUDFZWW1TT2loK0lqbTJMWCtqV3lWYXhjK2Nm?=
 =?utf-8?B?czJ3ZU0rTS9ZY2U4eGphUVBGZ3E0RmQxdWprVmVUMEZ0eVRObEgwZENUa3Vp?=
 =?utf-8?B?V0Joa0ExS2NPYnNEVG5DdER5YjdjQUVpRmJkWlhka0ExN3IvL3g0NTVxaUZP?=
 =?utf-8?B?OHNzdG9IbHJjWWtoUUpmdVlyWUZHMFY2Vnc1L1ZQOWxIV0FhNUk2M0M4bXY4?=
 =?utf-8?B?Zm1mUlZsQW93eDRybWR4WGZDZGkyM2dzbk1Vb0Ftd09sL2pIWUxjZFBwK1Ri?=
 =?utf-8?B?NjdYbjdYQzAyWkw2TUxFMEtLdlFzNWxDZ2gxdCtyKzBRRGNNQ1crNW5RNVF2?=
 =?utf-8?B?dTFRNDZGVDdkZnhtK0tjR1hPRUJKY0RNVmhGaUFJVWFzeEx4RmRQK2hoUlhj?=
 =?utf-8?B?ME5kLzllNXFYM281dHY1Q21EMGtJK3puam96cUNKRHAvQkZBdzROelljdVB1?=
 =?utf-8?B?N1BPS0ZlOWU0ZHJRaFprVm50VDZJZU5tRnYwVDBsdWdRWUQxTDJYZFl5ak5Q?=
 =?utf-8?B?b2c3MUM2REorM2tDS3l6N1ZFYXdnOEpNblR1a2xBaStFb2xqRmQ1SUsvQklj?=
 =?utf-8?B?bmh2YStKL2FaWHBuby91WitvbS9OTkZXc3g5STRydEZ5WWZLeGNiR0lSZERZ?=
 =?utf-8?B?QTZnanI1TWZ4bGRUOTliWTgvbEl0RENmL3R1aWdRQllKbW1VWloxb2VleS9q?=
 =?utf-8?B?SGlUVkordzJDTXg2TmhtR1NGM0J1bFZQbERrK2xLb0luVzZ6VTg0TktxRnJ2?=
 =?utf-8?B?T1I5eHJWNVpxcjhocTZPOVJzRW84NTNkZTN5c3BXYlgvdnBBRjFqNlVzOUJ0?=
 =?utf-8?B?ZUZxWml3TndBTXhLWThmZ2hYSlhvbXFkSHpsM0hIN1d4QjNweDhZVFNsd2Fq?=
 =?utf-8?B?ZXp6N2hTa2FQODlHSDhwNGVIdXVjcTdva0wwOXlid3g1OHU3U3JkZVJONlpk?=
 =?utf-8?B?RHB2aCtJUlpyekJnNVFHdURrUkZxVWRWR0lLNDJIc1BXWXRlZllUVDViam55?=
 =?utf-8?B?dXVEK2RoOHQvcFlIa1VXRC9XSHdqakJUYjIvbVB2bTZoL1BJenNFKzlnd0JF?=
 =?utf-8?B?RXhCSVNYa1hQWUpZU3FYZ05rbFkxNHVKTGQwUCtoT0l4VE5rbjNJQTRIOFNH?=
 =?utf-8?B?cjBCS2Ric2Z4MXp3bGVwS1hnVVE2MTBtakRra1ZQZGtxanRWeWNiR0RXNGdQ?=
 =?utf-8?B?bmZaWW90WW1Ma3NpVWNwZVBCTjBxTTJaTHc5bTVGZXpkR0NKM1ZqKzkwbzJK?=
 =?utf-8?B?ZjZaRFBZSEZocXpaMDNQcnVMZDVVZ2RrZ1llZHRndy90Z281QUJETFAxMjJU?=
 =?utf-8?B?MUgyREFWcWdJbFE5amxGSm1UU2JTSnQ4c3RzK0QzWkNqS2srNW5IdEkrSUY4?=
 =?utf-8?B?VzloNTFtWTdPaTVzeGVXRmxWRG1mNTQvUkxJMnY3NkZuVnJjN1dSNkZwN0Q4?=
 =?utf-8?B?QkdkNHlpVkYwOFhJU0lCdDlBU1JRbTRTVkpaRWpDcnA2K1dxbnRyMExRTG9I?=
 =?utf-8?Q?aqt42ORWW16Di4n7Ti4D56FRv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef427c48-5582-48d4-d47a-08dad105e511
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 06:00:48.8118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ke+DkTzv+eoKbt1BxXkth68JLb3y/8S1/i4Y3KWfElmWuxb2DV+gQyjpya5X9ifzMavtVloFO+0Zp8luscgJ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7554
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

--------------I44YoslAfZn9aEs9tqioAB2Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christian,

Looks good to me.
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
for the series.

Regards,
Arun.

On 11/25/2022 3:51 PM, Christian König wrote:
> We already fallback to a dummy BO with no backing store when we
> allocate GDS,GWS and OA resources and to GTT when we allocate VRAM.
>
> Drop all those workarounds and generalize this for GTT as well. This
> fixes ENOMEM issues with runaway applications which try to allocate/free
> GTT in a loop and are otherwise only limited by the CPU speed.
>
> The CS will wait for the cleanup of freed up BOs to satisfy the
> various domain specific limits and so effectively throttle those
> buggy applications down to a sane allocation behavior again.
>
> Signed-off-by: Christian König<christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 16 +++-------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  6 +-----
>   2 files changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index a0780a4e3e61..62e98f1ad770 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -113,7 +113,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>   	bp.resv = resv;
>   	bp.preferred_domain = initial_domain;
>   	bp.flags = flags;
> -	bp.domain = initial_domain;
> +	bp.domain = initial_domain | AMDGPU_GEM_DOMAIN_CPU;
>   	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
>   
>   	r = amdgpu_bo_create_user(adev, &bp, &ubo);
> @@ -332,20 +332,10 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
>   	}
>   
>   	initial_domain = (u32)(0xffffffff & args->in.domains);
> -retry:
>   	r = amdgpu_gem_object_create(adev, size, args->in.alignment,
> -				     initial_domain,
> -				     flags, ttm_bo_type_device, resv, &gobj);
> +				     initial_domain, flags, ttm_bo_type_device,
> +				     resv, &gobj);
>   	if (r && r != -ERESTARTSYS) {
> -		if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
> -			flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> -			goto retry;
> -		}
> -
> -		if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
> -			initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
> -			goto retry;
> -		}
>   		DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %d)\n",
>   				size, initial_domain, args->in.alignment, r);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 974e85d8b6cc..919bbea2e3ac 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -581,11 +581,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   		bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>   
>   	bo->tbo.bdev = &adev->mman.bdev;
> -	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
> -			  AMDGPU_GEM_DOMAIN_GDS))
> -		amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
> -	else
> -		amdgpu_bo_placement_from_domain(bo, bp->domain);
> +	amdgpu_bo_placement_from_domain(bo, bp->domain);
>   	if (bp->type == ttm_bo_type_kernel)
>   		bo->tbo.priority = 1;
>   

--------------I44YoslAfZn9aEs9tqioAB2Q
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Christian,<br>
    <br>
    Looks good to me.<br>
    Reviewed-by:
    Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;<br>
    for the series.<br>
    <br>
    Regards,<br>
    Arun.<br>
    <br>
    <div class="moz-cite-prefix">On 11/25/2022 3:51 PM, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221125102137.1801-1-christian.koenig@amd.com">
      <pre class="moz-quote-pre" wrap="">We already fallback to a dummy BO with no backing store when we
allocate GDS,GWS and OA resources and to GTT when we allocate VRAM.

Drop all those workarounds and generalize this for GTT as well. This
fixes ENOMEM issues with runaway applications which try to allocate/free
GTT in a loop and are otherwise only limited by the CPU speed.

The CS will wait for the cleanup of freed up BOs to satisfy the
various domain specific limits and so effectively throttle those
buggy applications down to a sane allocation behavior again.

Signed-off-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 16 +++-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  6 +-----
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index a0780a4e3e61..62e98f1ad770 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -113,7 +113,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 	bp.resv = resv;
 	bp.preferred_domain = initial_domain;
 	bp.flags = flags;
-	bp.domain = initial_domain;
+	bp.domain = initial_domain | AMDGPU_GEM_DOMAIN_CPU;
 	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
 
 	r = amdgpu_bo_create_user(adev, &amp;bp, &amp;ubo);
@@ -332,20 +332,10 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	initial_domain = (u32)(0xffffffff &amp; args-&gt;in.domains);
-retry:
 	r = amdgpu_gem_object_create(adev, size, args-&gt;in.alignment,
-				     initial_domain,
-				     flags, ttm_bo_type_device, resv, &amp;gobj);
+				     initial_domain, flags, ttm_bo_type_device,
+				     resv, &amp;gobj);
 	if (r &amp;&amp; r != -ERESTARTSYS) {
-		if (flags &amp; AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
-			flags &amp;= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
-			goto retry;
-		}
-
-		if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
-			initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
-			goto retry;
-		}
 		DRM_DEBUG(&quot;Failed to allocate GEM object (%llu, %d, %llu, %d)\n&quot;,
 				size, initial_domain, args-&gt;in.alignment, r);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 974e85d8b6cc..919bbea2e3ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -581,11 +581,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 		bo-&gt;flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
 
 	bo-&gt;tbo.bdev = &amp;adev-&gt;mman.bdev;
-	if (bp-&gt;domain &amp; (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
-			  AMDGPU_GEM_DOMAIN_GDS))
-		amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
-	else
-		amdgpu_bo_placement_from_domain(bo, bp-&gt;domain);
+	amdgpu_bo_placement_from_domain(bo, bp-&gt;domain);
 	if (bp-&gt;type == ttm_bo_type_kernel)
 		bo-&gt;tbo.priority = 1;
 
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------I44YoslAfZn9aEs9tqioAB2Q--
