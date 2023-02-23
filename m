Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4356A0732
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 12:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7695F10EB34;
	Thu, 23 Feb 2023 11:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1DD10EB34;
 Thu, 23 Feb 2023 11:18:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlBQ8VY4+4cRL5JJlmSRoHNW/4sRUodrLlmkRl7eBaUSWQZFhzhDBNvR+Cljr8d28c0CrUsVMOV+KoGr2u+meLhRnQn8Jjx8uYmyau4sVC/ixmtpfdyi+7a3iVVjnZWq4ErIU5Qe+BpSbakEYdti32nWzm0UVNl2MkE4pGLBSJ/0FgpetqLdhUf7uBifln3HQYGfy0xTgrY5+gScW1mLBzyw3u/aNmdDjk57Gv/M8BUdV6qeF4vUTcVGxNqAK53A2gIWykBHyTGySSwB33NtugP0Nxi43UJ4bYCVpeTyQn7eLWWBd3draBXklHAsK2GGWFwB1plyrUbzZA86ANhPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbnUQhOMF04FZqvekF3qkBkFM7m4s6/oNCe0uZCsr6c=;
 b=hd0nwW6iO+8j+4HlW2oqURPOY2Oad8uB7SKbCBwODxtZonOtLgYw32TZdQT+wVIrPXuDNXniimBy6j/++BM0YzQK645/TYcD/2tF4gQnOk22AP4FYe62MN2YN9oQgh/T8FKXZjlpFJyfnMruMeczaKL7ON8W2UY6MKp3r6CH5tgsoEJ/rPe8Ee4jGfi30NlsdiClN6aUWpBeivHgVpGfx3YN8en+oXCiNqr4e2twlvfjUVV8HmQqd6Ezh5KINpKYlMcKZ07V0jW60NKL1i9+MSJcaZR1IutCN8vmaZyJm6t/Ox1oxLiQ+wSR/izEVMPGPFkCKuiA9E5Dktd3jBOYow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbnUQhOMF04FZqvekF3qkBkFM7m4s6/oNCe0uZCsr6c=;
 b=aF74uIa1+8A5cSotg1d7apqL+3kHlmY2kTt3U5z2SMi56dKChqFJZaxHKJUCGmv4gkF2jba9XaBtjDdkea8Q2NuxDTgnDcqiOPSTYshHAaeOEG372isJIajg96FUPYEbJ8ARIRlsZG89J+A+CZ6WDHZXuQQ+Ymulq7ETJgVJUWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7109.namprd12.prod.outlook.com (2603:10b6:510:22f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Thu, 23 Feb
 2023 11:18:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 11:18:07 +0000
Message-ID: <a55d52ea-20b6-9f35-3bb8-13da2f49f4cb@amd.com>
Date: Thu, 23 Feb 2023 12:18:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/radeon: Use the drm suballocation manager
 implementation.
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230223105747.4719-1-thomas.hellstrom@linux.intel.com>
 <20230223105747.4719-4-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230223105747.4719-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cfa3164-d2bf-4970-567f-08db158fa362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bEiSorXjU9hTzODRkpwyRKuTt7tyr3pTsIlSs1VEYpHw2WUPYEfjadKJ5/o0cW5JmtNxZ/7niJ7i9uEFBrga9Z9FsGRPpLGCvh3X0CDIRyj0ZB/sFQIArfHN66JkuP4RbJXf9C/NRPhwmBzwIVRuj5WXboB0GlY77YO1zVaAo5+cc+CehFT93Ui9fWchojmRrOXWmv8DTfrRh6jDYzhjyniEu7NUOZO/b62WeeWqVhDGFU4FOUSfPy1+lkBW4cEjjyZ8mNvS3zj+8u7fQk4mHXIYk0PnnOkUr7APuRqeoHD+Rf7Z3NQvuQalw5Frd+2DwS3XdrA89bbaCpJJaQRaQem5rf9TKORJaRfgFzQDz+Ei6Eeoi699zPSG9xhzm3RWhgRGBabES4k0p3jNvUk0ozyvoZuGd5mQe4RoXmi0mYLvCAwG3Vg+HVAGgAn+JkBLSCfMcTWCTYOuBUV44EEabtv7UOoMSceYfUtz1b5REmJYEzOZ28i2Vb7yMaVyTjjk82ktHrY6O4msHucJid4P+CLay5ntFkR2B6becTPCMyTSTVpodU6Q3mVl12ly/VM1qJmqQdDJ1TupF3YO+BGOBGVJYBMVPlgfVgkA+mqpRPyVVTzHrAcPnK4sVnECKwgo0yjLt6OnbI/Y7NtgXFkLteEWeVH3wHNV4v5JiXulN52wAuhY0NeAV/FTHwVj4+srbiRpbsmqqgmSQ6ey+m3GHzdg20UXyixKbWY8dJvkMf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199018)(2616005)(2906002)(36756003)(66574015)(66946007)(5660300002)(41300700001)(66476007)(4326008)(66556008)(8676002)(8936002)(30864003)(83380400001)(478600001)(186003)(26005)(6512007)(6506007)(38100700002)(31686004)(6486002)(6666004)(31696002)(316002)(86362001)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzRzbUxReFhReHRJa0RidjdkditJQWdkalVGQkRDSktvelU3RW5xM3hhUnNY?=
 =?utf-8?B?ZWdvcnJUNlJGUHRQQUllOXlGVXpvSmM0NnBhakR4VGE2NkxnM1RTdFQzMHdO?=
 =?utf-8?B?VCtTcnkwU2krZ1p2K2krMmZxWU5LVUdqLzVIYkp4VFFReWMwMk9iQmxEUDgw?=
 =?utf-8?B?ajQ1VmRVS2t5ZThSZkoxWjJkK0tkbmQ1ZVhrNnF0NjhlNEFGQ1cwd2kzemw2?=
 =?utf-8?B?NjRxdThjT2VEbzc5ejZoMGIyUW43RUJORGl1c3ZXTUQvc3lJcE1ERW9oRjJU?=
 =?utf-8?B?azN6TmZYc2ZMeVRSOXQ0dVE5cFlMVjlFWDVwcEdpZTlaNTkxa2x1TGYzYnVz?=
 =?utf-8?B?eGRiYjkzeWpZNDB3a1RTM1hnREl1NTRlMmdvbXJGVlovTnJkWGVUVnpLM25Y?=
 =?utf-8?B?WjRIblJ6UCtacmd2aCt3Z2tjL3hDR05qb25JR2JGQWVyTUd6RTVQUUZFZ2x5?=
 =?utf-8?B?YmVYbFdNTTkxRVJkZjkzUVVjS1M1Vi9xMjFaSWkzNHhzN2VZNVJJb3VVNTgy?=
 =?utf-8?B?alpXQ0pnZnJjemRaeWRQYXhsYUtpaURFcTA2eGFyMFBQVkp0aGpSWjRhVnht?=
 =?utf-8?B?eERFRzBIb1pDUGl4aXJuT2J5cGVsSlVsb3RtTjVZbXVSN3dpQVJUZWhFUzBU?=
 =?utf-8?B?Umk0RGlZWE1vbWtLMXJVbGRKWGdwSVB6K3hqUzQ3K3N6SHh2Vk1TL1FYU0ZE?=
 =?utf-8?B?TEQ1N2w1VWpSaHJFMmFnUEtocHlGT2RZaHM5T3BlVjRQOEpkcUlDNm1jcFd3?=
 =?utf-8?B?RzJrNzBFcnBSckp4SFNyWHVJNUwrYUJpQzlmS0VRWEdQT3k5VzdBS2dHdFBm?=
 =?utf-8?B?UG5FSy9XNGRjQUNVcGZmemlFSlBQenJSOElpWlFkVWZ5eGVaUlltSzBMMzJk?=
 =?utf-8?B?cXJsSmJ0M1A1ZEhvOFB3am83a0h4bUN6WjhndjV5dWJCZ1QwOWZha0l4ZUly?=
 =?utf-8?B?UmNqNVliWC96QzRNL2MrQ1FoTmpKZ1hpVFdWV1FqVUUvcnROQWpHVi9TUW9D?=
 =?utf-8?B?dFdjZUFQL3V6YWZYem0rRitrTjNrQzF5aG43dmVqblpFYnYxTXMzdi9HbkJR?=
 =?utf-8?B?K0NNQS9xTDF2RjZLTHlFaDYrcU5Tc21KTzVabHZPTFQwL0VFNENSYUI3d2Vy?=
 =?utf-8?B?NlJ4UU0yUHQ2NEJmeWRoMnFTTXdrZU50OXdUNFJzMnRwMUZRL0dhaHRIQTAw?=
 =?utf-8?B?L0kya3J2NzNiVHBJZE9iZkRrenFKc2t6YjRqdm1TQURlQ2lVazFTSXJRMlpF?=
 =?utf-8?B?NGZQbUp4eS9kRFNDcEVVelR4cHpvVFkwK1UrZ0dwSmV2WDQ2QXA4NHRFK0tU?=
 =?utf-8?B?OVYwMkQvOGJDUzQ2OGxHQyswcGdrMjhxSGFYblNCWFIvQWhqc0hFbStWSjQy?=
 =?utf-8?B?UHRYV0F2aHBqTldUOTlUMHdmdlVYN2VEK1VFQlRuTWdESWtpZmxrZmpFZlRF?=
 =?utf-8?B?dFZQMDF2Y2s4MEFBTUJQSnZscTMzbEJkVUlyUW1CQlBZVzFFL1ZMOWw4M1hp?=
 =?utf-8?B?dndWUDhpZllZSUJMTlpTU013aTFHUTRaUGZEL2M3SHpHK3htcWJqTVdMSzJa?=
 =?utf-8?B?SytPRWhRYUdCYmdNQUZHNjl2NDMrL09vUmJEVENpckFUc1lpRno1S21tYnNY?=
 =?utf-8?B?S0I2UGZHTERNSlNYOUwrNU1ObGFkUVJSU0NIVzFEQSsrWDV3RmdnTHNHeTVL?=
 =?utf-8?B?cDZiYXNkUUFib3VYLzRsTElKMHVhWEV3OVZWVDdkaDdzS2lsNlU2VG9mdURq?=
 =?utf-8?B?Nm9WeWY2Z0tkK21hK1dMWlJpYXg3WmNkd3UrYlVsOERSTHd6LzFWMHpheDR4?=
 =?utf-8?B?YkhSTUFMK0N6aE5GemZIRkpNcUpYT1MvQ3lvbTRQNUh3anc2bXdrY1R6K0dq?=
 =?utf-8?B?b2QxZEVTMWM3azBaM0laZE50N0NSMFRnckFKakltYnBad2hLY25QSzBrWFlR?=
 =?utf-8?B?Zm1ORlAwSEdpeHRVM3h3TTB2N3V4Y2FDNk9Zejk0K043cXlWdlFrbHJTclMx?=
 =?utf-8?B?TFQvL1FpaFRpem1RcW5Nc0lRUnVPTHQ3R1VCZ2FMcVovdEZEdm5FaWFnSnlY?=
 =?utf-8?B?ejFrZ09YeFNOYzhkaThkR3k2cmltaFljUEtaWVRUejk0STV3TFlKOUZSalVF?=
 =?utf-8?Q?wRYHOGc7vCr1ZfxE8t4tmy16H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfa3164-d2bf-4970-567f-08db158fa362
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 11:18:07.2288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B80RvNAN1VIYE1VnuaBw+RiZjkz+lARd2Sy+SLHajwnMzq2s7da/QUskQ/QfPRqX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7109
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.02.23 um 11:57 schrieb Thomas Hellström:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> Use the generic suballocation helper for radeon.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon.h           |  55 +---
>   drivers/gpu/drm/radeon/radeon_ib.c        |  12 +-
>   drivers/gpu/drm/radeon/radeon_object.h    |  25 +-
>   drivers/gpu/drm/radeon/radeon_sa.c        | 316 ++--------------------
>   drivers/gpu/drm/radeon/radeon_semaphore.c |   4 +-
>   5 files changed, 56 insertions(+), 356 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index 57e20780a458..d19a4b1c1a8f 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -79,6 +79,7 @@
>   
>   #include <drm/drm_gem.h>
>   #include <drm/drm_audio_component.h>
> +#include <drm/drm_suballoc.h>
>   
>   #include "radeon_family.h"
>   #include "radeon_mode.h"
> @@ -511,52 +512,12 @@ struct radeon_bo {
>   };
>   #define gem_to_radeon_bo(gobj) container_of((gobj), struct radeon_bo, tbo.base)
>   
> -/* sub-allocation manager, it has to be protected by another lock.
> - * By conception this is an helper for other part of the driver
> - * like the indirect buffer or semaphore, which both have their
> - * locking.
> - *
> - * Principe is simple, we keep a list of sub allocation in offset
> - * order (first entry has offset == 0, last entry has the highest
> - * offset).
> - *
> - * When allocating new object we first check if there is room at
> - * the end total_size - (last_object_offset + last_object_size) >=
> - * alloc_size. If so we allocate new object there.
> - *
> - * When there is not enough room at the end, we start waiting for
> - * each sub object until we reach object_offset+object_size >=
> - * alloc_size, this object then become the sub object we return.
> - *
> - * Alignment can't be bigger than page size.
> - *
> - * Hole are not considered for allocation to keep things simple.
> - * Assumption is that there won't be hole (all object on same
> - * alignment).
> - */
>   struct radeon_sa_manager {
> -	wait_queue_head_t	wq;
> -	struct radeon_bo	*bo;
> -	struct list_head	*hole;
> -	struct list_head	flist[RADEON_NUM_RINGS];
> -	struct list_head	olist;
> -	unsigned		size;
> -	uint64_t		gpu_addr;
> -	void			*cpu_ptr;
> -	uint32_t		domain;
> -	uint32_t		align;
> -};
> -
> -struct radeon_sa_bo;
> -
> -/* sub-allocation buffer */
> -struct radeon_sa_bo {
> -	struct list_head		olist;
> -	struct list_head		flist;
> -	struct radeon_sa_manager	*manager;
> -	unsigned			soffset;
> -	unsigned			eoffset;
> -	struct radeon_fence		*fence;
> +	struct drm_suballoc_manager	base;
> +	struct radeon_bo		*bo;
> +	uint64_t			gpu_addr;
> +	void				*cpu_ptr;
> +	u32 domain;
>   };
>   
>   /*
> @@ -587,7 +548,7 @@ int radeon_mode_dumb_mmap(struct drm_file *filp,
>    * Semaphores.
>    */
>   struct radeon_semaphore {
> -	struct radeon_sa_bo	*sa_bo;
> +	struct drm_suballoc	*sa_bo;
>   	signed			waiters;
>   	uint64_t		gpu_addr;
>   };
> @@ -816,7 +777,7 @@ void radeon_irq_kms_disable_hpd(struct radeon_device *rdev, unsigned hpd_mask);
>    */
>   
>   struct radeon_ib {
> -	struct radeon_sa_bo		*sa_bo;
> +	struct drm_suballoc		*sa_bo;
>   	uint32_t			length_dw;
>   	uint64_t			gpu_addr;
>   	uint32_t			*ptr;
> diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/radeon_ib.c
> index 62b116727b4f..6a45a72488f9 100644
> --- a/drivers/gpu/drm/radeon/radeon_ib.c
> +++ b/drivers/gpu/drm/radeon/radeon_ib.c
> @@ -61,7 +61,7 @@ int radeon_ib_get(struct radeon_device *rdev, int ring,
>   {
>   	int r;
>   
> -	r = radeon_sa_bo_new(rdev, &rdev->ring_tmp_bo, &ib->sa_bo, size, 256);
> +	r = radeon_sa_bo_new(&rdev->ring_tmp_bo, &ib->sa_bo, size, 256);
>   	if (r) {
>   		dev_err(rdev->dev, "failed to get a new IB (%d)\n", r);
>   		return r;
> @@ -77,7 +77,7 @@ int radeon_ib_get(struct radeon_device *rdev, int ring,
>   		/* ib pool is bound at RADEON_VA_IB_OFFSET in virtual address
>   		 * space and soffset is the offset inside the pool bo
>   		 */
> -		ib->gpu_addr = ib->sa_bo->soffset + RADEON_VA_IB_OFFSET;
> +		ib->gpu_addr = drm_suballoc_soffset(ib->sa_bo) + RADEON_VA_IB_OFFSET;
>   	} else {
>   		ib->gpu_addr = radeon_sa_bo_gpu_addr(ib->sa_bo);
>   	}
> @@ -97,7 +97,7 @@ int radeon_ib_get(struct radeon_device *rdev, int ring,
>   void radeon_ib_free(struct radeon_device *rdev, struct radeon_ib *ib)
>   {
>   	radeon_sync_free(rdev, &ib->sync, ib->fence);
> -	radeon_sa_bo_free(rdev, &ib->sa_bo, ib->fence);
> +	radeon_sa_bo_free(&ib->sa_bo, ib->fence);
>   	radeon_fence_unref(&ib->fence);
>   }
>   
> @@ -201,8 +201,7 @@ int radeon_ib_pool_init(struct radeon_device *rdev)
>   
>   	if (rdev->family >= CHIP_BONAIRE) {
>   		r = radeon_sa_bo_manager_init(rdev, &rdev->ring_tmp_bo,
> -					      RADEON_IB_POOL_SIZE*64*1024,
> -					      RADEON_GPU_PAGE_SIZE,
> +					      RADEON_IB_POOL_SIZE*64*1024, 256,
>   					      RADEON_GEM_DOMAIN_GTT,
>   					      RADEON_GEM_GTT_WC);
>   	} else {
> @@ -210,8 +209,7 @@ int radeon_ib_pool_init(struct radeon_device *rdev)
>   		 * to the command stream checking
>   		 */
>   		r = radeon_sa_bo_manager_init(rdev, &rdev->ring_tmp_bo,
> -					      RADEON_IB_POOL_SIZE*64*1024,
> -					      RADEON_GPU_PAGE_SIZE,
> +					      RADEON_IB_POOL_SIZE*64*1024, 256,
>   					      RADEON_GEM_DOMAIN_GTT, 0);
>   	}
>   	if (r) {
> diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
> index 0a6ef49e990a..39cc87a59a9a 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.h
> +++ b/drivers/gpu/drm/radeon/radeon_object.h
> @@ -169,15 +169,22 @@ extern void radeon_bo_fence(struct radeon_bo *bo, struct radeon_fence *fence,
>   /*
>    * sub allocation
>    */
> +static inline struct radeon_sa_manager *
> +to_radeon_sa_manager(struct drm_suballoc_manager *manager)
> +{
> +	return container_of(manager, struct radeon_sa_manager, base);
> +}
>   
> -static inline uint64_t radeon_sa_bo_gpu_addr(struct radeon_sa_bo *sa_bo)
> +static inline uint64_t radeon_sa_bo_gpu_addr(struct drm_suballoc *sa_bo)
>   {
> -	return sa_bo->manager->gpu_addr + sa_bo->soffset;
> +	return to_radeon_sa_manager(sa_bo->manager)->gpu_addr +
> +		drm_suballoc_soffset(sa_bo);
>   }
>   
> -static inline void * radeon_sa_bo_cpu_addr(struct radeon_sa_bo *sa_bo)
> +static inline void *radeon_sa_bo_cpu_addr(struct drm_suballoc *sa_bo)
>   {
> -	return sa_bo->manager->cpu_ptr + sa_bo->soffset;
> +	return to_radeon_sa_manager(sa_bo->manager)->cpu_ptr +
> +		drm_suballoc_soffset(sa_bo);
>   }
>   
>   extern int radeon_sa_bo_manager_init(struct radeon_device *rdev,
> @@ -190,12 +197,10 @@ extern int radeon_sa_bo_manager_start(struct radeon_device *rdev,
>   				      struct radeon_sa_manager *sa_manager);
>   extern int radeon_sa_bo_manager_suspend(struct radeon_device *rdev,
>   					struct radeon_sa_manager *sa_manager);
> -extern int radeon_sa_bo_new(struct radeon_device *rdev,
> -			    struct radeon_sa_manager *sa_manager,
> -			    struct radeon_sa_bo **sa_bo,
> -			    unsigned size, unsigned align);
> -extern void radeon_sa_bo_free(struct radeon_device *rdev,
> -			      struct radeon_sa_bo **sa_bo,
> +extern int radeon_sa_bo_new(struct radeon_sa_manager *sa_manager,
> +			    struct drm_suballoc **sa_bo,
> +			    unsigned int size, unsigned int align);
> +extern void radeon_sa_bo_free(struct drm_suballoc **sa_bo,
>   			      struct radeon_fence *fence);
>   #if defined(CONFIG_DEBUG_FS)
>   extern void radeon_sa_bo_dump_debug_info(struct radeon_sa_manager *sa_manager,
> diff --git a/drivers/gpu/drm/radeon/radeon_sa.c b/drivers/gpu/drm/radeon/radeon_sa.c
> index 0981948bd9ed..c87a57c9c592 100644
> --- a/drivers/gpu/drm/radeon/radeon_sa.c
> +++ b/drivers/gpu/drm/radeon/radeon_sa.c
> @@ -44,53 +44,32 @@
>   
>   #include "radeon.h"
>   
> -static void radeon_sa_bo_remove_locked(struct radeon_sa_bo *sa_bo);
> -static void radeon_sa_bo_try_free(struct radeon_sa_manager *sa_manager);
> -
>   int radeon_sa_bo_manager_init(struct radeon_device *rdev,
>   			      struct radeon_sa_manager *sa_manager,
> -			      unsigned size, u32 align, u32 domain, u32 flags)
> +			      unsigned int size, u32 sa_align, u32 domain,
> +			      u32 flags)
>   {
> -	int i, r;
> -
> -	init_waitqueue_head(&sa_manager->wq);
> -	sa_manager->bo = NULL;
> -	sa_manager->size = size;
> -	sa_manager->domain = domain;
> -	sa_manager->align = align;
> -	sa_manager->hole = &sa_manager->olist;
> -	INIT_LIST_HEAD(&sa_manager->olist);
> -	for (i = 0; i < RADEON_NUM_RINGS; ++i) {
> -		INIT_LIST_HEAD(&sa_manager->flist[i]);
> -	}
> +	int r;
>   
> -	r = radeon_bo_create(rdev, size, align, true,
> +	r = radeon_bo_create(rdev, size, RADEON_GPU_PAGE_SIZE, true,
>   			     domain, flags, NULL, NULL, &sa_manager->bo);
>   	if (r) {
>   		dev_err(rdev->dev, "(%d) failed to allocate bo for manager\n", r);
>   		return r;
>   	}
>   
> +	sa_manager->domain = domain;
> +
> +	drm_suballoc_manager_init(&sa_manager->base, size, sa_align);
> +
>   	return r;
>   }
>   
>   void radeon_sa_bo_manager_fini(struct radeon_device *rdev,
>   			       struct radeon_sa_manager *sa_manager)
>   {
> -	struct radeon_sa_bo *sa_bo, *tmp;
> -
> -	if (!list_empty(&sa_manager->olist)) {
> -		sa_manager->hole = &sa_manager->olist,
> -		radeon_sa_bo_try_free(sa_manager);
> -		if (!list_empty(&sa_manager->olist)) {
> -			dev_err(rdev->dev, "sa_manager is not empty, clearing anyway\n");
> -		}
> -	}
> -	list_for_each_entry_safe(sa_bo, tmp, &sa_manager->olist, olist) {
> -		radeon_sa_bo_remove_locked(sa_bo);
> -	}
> +	drm_suballoc_manager_fini(&sa_manager->base);
>   	radeon_bo_unref(&sa_manager->bo);
> -	sa_manager->size = 0;
>   }
>   
>   int radeon_sa_bo_manager_start(struct radeon_device *rdev,
> @@ -139,260 +118,34 @@ int radeon_sa_bo_manager_suspend(struct radeon_device *rdev,
>   	return r;
>   }
>   
> -static void radeon_sa_bo_remove_locked(struct radeon_sa_bo *sa_bo)
> +int radeon_sa_bo_new(struct radeon_sa_manager *sa_manager,
> +		     struct drm_suballoc **sa_bo,
> +		     unsigned int size, unsigned int align)
>   {
> -	struct radeon_sa_manager *sa_manager = sa_bo->manager;
> -	if (sa_manager->hole == &sa_bo->olist) {
> -		sa_manager->hole = sa_bo->olist.prev;
> -	}
> -	list_del_init(&sa_bo->olist);
> -	list_del_init(&sa_bo->flist);
> -	radeon_fence_unref(&sa_bo->fence);
> -	kfree(sa_bo);
> -}
> -
> -static void radeon_sa_bo_try_free(struct radeon_sa_manager *sa_manager)
> -{
> -	struct radeon_sa_bo *sa_bo, *tmp;
> -
> -	if (sa_manager->hole->next == &sa_manager->olist)
> -		return;
> +	struct drm_suballoc *sa = drm_suballoc_new(&sa_manager->base, size,
> +						   GFP_KERNEL, true, align);
>   
> -	sa_bo = list_entry(sa_manager->hole->next, struct radeon_sa_bo, olist);
> -	list_for_each_entry_safe_from(sa_bo, tmp, &sa_manager->olist, olist) {
> -		if (sa_bo->fence == NULL || !radeon_fence_signaled(sa_bo->fence)) {
> -			return;
> -		}
> -		radeon_sa_bo_remove_locked(sa_bo);
> +	if (IS_ERR(sa)) {
> +		*sa_bo = NULL;
> +		return PTR_ERR(sa);
>   	}
> -}
>   
> -static inline unsigned radeon_sa_bo_hole_soffset(struct radeon_sa_manager *sa_manager)
> -{
> -	struct list_head *hole = sa_manager->hole;
> -
> -	if (hole != &sa_manager->olist) {
> -		return list_entry(hole, struct radeon_sa_bo, olist)->eoffset;
> -	}
> +	*sa_bo = sa;
>   	return 0;
>   }
>   
> -static inline unsigned radeon_sa_bo_hole_eoffset(struct radeon_sa_manager *sa_manager)
> -{
> -	struct list_head *hole = sa_manager->hole;
> -
> -	if (hole->next != &sa_manager->olist) {
> -		return list_entry(hole->next, struct radeon_sa_bo, olist)->soffset;
> -	}
> -	return sa_manager->size;
> -}
> -
> -static bool radeon_sa_bo_try_alloc(struct radeon_sa_manager *sa_manager,
> -				   struct radeon_sa_bo *sa_bo,
> -				   unsigned size, unsigned align)
> -{
> -	unsigned soffset, eoffset, wasted;
> -
> -	soffset = radeon_sa_bo_hole_soffset(sa_manager);
> -	eoffset = radeon_sa_bo_hole_eoffset(sa_manager);
> -	wasted = (align - (soffset % align)) % align;
> -
> -	if ((eoffset - soffset) >= (size + wasted)) {
> -		soffset += wasted;
> -
> -		sa_bo->manager = sa_manager;
> -		sa_bo->soffset = soffset;
> -		sa_bo->eoffset = soffset + size;
> -		list_add(&sa_bo->olist, sa_manager->hole);
> -		INIT_LIST_HEAD(&sa_bo->flist);
> -		sa_manager->hole = &sa_bo->olist;
> -		return true;
> -	}
> -	return false;
> -}
> -
> -/**
> - * radeon_sa_event - Check if we can stop waiting
> - *
> - * @sa_manager: pointer to the sa_manager
> - * @size: number of bytes we want to allocate
> - * @align: alignment we need to match
> - *
> - * Check if either there is a fence we can wait for or
> - * enough free memory to satisfy the allocation directly
> - */
> -static bool radeon_sa_event(struct radeon_sa_manager *sa_manager,
> -			    unsigned size, unsigned align)
> -{
> -	unsigned soffset, eoffset, wasted;
> -	int i;
> -
> -	for (i = 0; i < RADEON_NUM_RINGS; ++i) {
> -		if (!list_empty(&sa_manager->flist[i])) {
> -			return true;
> -		}
> -	}
> -
> -	soffset = radeon_sa_bo_hole_soffset(sa_manager);
> -	eoffset = radeon_sa_bo_hole_eoffset(sa_manager);
> -	wasted = (align - (soffset % align)) % align;
> -
> -	if ((eoffset - soffset) >= (size + wasted)) {
> -		return true;
> -	}
> -
> -	return false;
> -}
> -
> -static bool radeon_sa_bo_next_hole(struct radeon_sa_manager *sa_manager,
> -				   struct radeon_fence **fences,
> -				   unsigned *tries)
> -{
> -	struct radeon_sa_bo *best_bo = NULL;
> -	unsigned i, soffset, best, tmp;
> -
> -	/* if hole points to the end of the buffer */
> -	if (sa_manager->hole->next == &sa_manager->olist) {
> -		/* try again with its beginning */
> -		sa_manager->hole = &sa_manager->olist;
> -		return true;
> -	}
> -
> -	soffset = radeon_sa_bo_hole_soffset(sa_manager);
> -	/* to handle wrap around we add sa_manager->size */
> -	best = sa_manager->size * 2;
> -	/* go over all fence list and try to find the closest sa_bo
> -	 * of the current last
> -	 */
> -	for (i = 0; i < RADEON_NUM_RINGS; ++i) {
> -		struct radeon_sa_bo *sa_bo;
> -
> -		fences[i] = NULL;
> -
> -		if (list_empty(&sa_manager->flist[i])) {
> -			continue;
> -		}
> -
> -		sa_bo = list_first_entry(&sa_manager->flist[i],
> -					 struct radeon_sa_bo, flist);
> -
> -		if (!radeon_fence_signaled(sa_bo->fence)) {
> -			fences[i] = sa_bo->fence;
> -			continue;
> -		}
> -
> -		/* limit the number of tries each ring gets */
> -		if (tries[i] > 2) {
> -			continue;
> -		}
> -
> -		tmp = sa_bo->soffset;
> -		if (tmp < soffset) {
> -			/* wrap around, pretend it's after */
> -			tmp += sa_manager->size;
> -		}
> -		tmp -= soffset;
> -		if (tmp < best) {
> -			/* this sa bo is the closest one */
> -			best = tmp;
> -			best_bo = sa_bo;
> -		}
> -	}
> -
> -	if (best_bo) {
> -		++tries[best_bo->fence->ring];
> -		sa_manager->hole = best_bo->olist.prev;
> -
> -		/* we knew that this one is signaled,
> -		   so it's save to remote it */
> -		radeon_sa_bo_remove_locked(best_bo);
> -		return true;
> -	}
> -	return false;
> -}
> -
> -int radeon_sa_bo_new(struct radeon_device *rdev,
> -		     struct radeon_sa_manager *sa_manager,
> -		     struct radeon_sa_bo **sa_bo,
> -		     unsigned size, unsigned align)
> -{
> -	struct radeon_fence *fences[RADEON_NUM_RINGS];
> -	unsigned tries[RADEON_NUM_RINGS];
> -	int i, r;
> -
> -	BUG_ON(align > sa_manager->align);
> -	BUG_ON(size > sa_manager->size);
> -
> -	*sa_bo = kmalloc(sizeof(struct radeon_sa_bo), GFP_KERNEL);
> -	if ((*sa_bo) == NULL) {
> -		return -ENOMEM;
> -	}
> -	(*sa_bo)->manager = sa_manager;
> -	(*sa_bo)->fence = NULL;
> -	INIT_LIST_HEAD(&(*sa_bo)->olist);
> -	INIT_LIST_HEAD(&(*sa_bo)->flist);
> -
> -	spin_lock(&sa_manager->wq.lock);
> -	do {
> -		for (i = 0; i < RADEON_NUM_RINGS; ++i)
> -			tries[i] = 0;
> -
> -		do {
> -			radeon_sa_bo_try_free(sa_manager);
> -
> -			if (radeon_sa_bo_try_alloc(sa_manager, *sa_bo,
> -						   size, align)) {
> -				spin_unlock(&sa_manager->wq.lock);
> -				return 0;
> -			}
> -
> -			/* see if we can skip over some allocations */
> -		} while (radeon_sa_bo_next_hole(sa_manager, fences, tries));
> -
> -		for (i = 0; i < RADEON_NUM_RINGS; ++i)
> -			radeon_fence_ref(fences[i]);
> -
> -		spin_unlock(&sa_manager->wq.lock);
> -		r = radeon_fence_wait_any(rdev, fences, false);
> -		for (i = 0; i < RADEON_NUM_RINGS; ++i)
> -			radeon_fence_unref(&fences[i]);
> -		spin_lock(&sa_manager->wq.lock);
> -		/* if we have nothing to wait for block */
> -		if (r == -ENOENT) {
> -			r = wait_event_interruptible_locked(
> -				sa_manager->wq,
> -				radeon_sa_event(sa_manager, size, align)
> -			);
> -		}
> -
> -	} while (!r);
> -
> -	spin_unlock(&sa_manager->wq.lock);
> -	kfree(*sa_bo);
> -	*sa_bo = NULL;
> -	return r;
> -}
> -
> -void radeon_sa_bo_free(struct radeon_device *rdev, struct radeon_sa_bo **sa_bo,
> +void radeon_sa_bo_free(struct drm_suballoc **sa_bo,
>   		       struct radeon_fence *fence)
>   {
> -	struct radeon_sa_manager *sa_manager;
> -
>   	if (sa_bo == NULL || *sa_bo == NULL) {
>   		return;
>   	}
>   
> -	sa_manager = (*sa_bo)->manager;
> -	spin_lock(&sa_manager->wq.lock);
> -	if (fence && !radeon_fence_signaled(fence)) {
> -		(*sa_bo)->fence = radeon_fence_ref(fence);
> -		list_add_tail(&(*sa_bo)->flist,
> -			      &sa_manager->flist[fence->ring]);
> -	} else {
> -		radeon_sa_bo_remove_locked(*sa_bo);
> -	}
> -	wake_up_all_locked(&sa_manager->wq);
> -	spin_unlock(&sa_manager->wq.lock);
> +	if (fence)
> +		drm_suballoc_free(*sa_bo, &fence->base);
> +	else
> +		drm_suballoc_free(*sa_bo, NULL);
> +
>   	*sa_bo = NULL;
>   }
>   
> @@ -400,25 +153,8 @@ void radeon_sa_bo_free(struct radeon_device *rdev, struct radeon_sa_bo **sa_bo,
>   void radeon_sa_bo_dump_debug_info(struct radeon_sa_manager *sa_manager,
>   				  struct seq_file *m)
>   {
> -	struct radeon_sa_bo *i;
> +	struct drm_printer p = drm_seq_file_printer(m);
>   
> -	spin_lock(&sa_manager->wq.lock);
> -	list_for_each_entry(i, &sa_manager->olist, olist) {
> -		uint64_t soffset = i->soffset + sa_manager->gpu_addr;
> -		uint64_t eoffset = i->eoffset + sa_manager->gpu_addr;
> -		if (&i->olist == sa_manager->hole) {
> -			seq_printf(m, ">");
> -		} else {
> -			seq_printf(m, " ");
> -		}
> -		seq_printf(m, "[0x%010llx 0x%010llx] size %8lld",
> -			   soffset, eoffset, eoffset - soffset);
> -		if (i->fence) {
> -			seq_printf(m, " protected by 0x%016llx on ring %d",
> -				   i->fence->seq, i->fence->ring);
> -		}
> -		seq_printf(m, "\n");
> -	}
> -	spin_unlock(&sa_manager->wq.lock);
> +	drm_suballoc_dump_debug_info(&sa_manager->base, &p, sa_manager->gpu_addr);
>   }
>   #endif
> diff --git a/drivers/gpu/drm/radeon/radeon_semaphore.c b/drivers/gpu/drm/radeon/radeon_semaphore.c
> index 221e59476f64..1f0a9a4ff5ae 100644
> --- a/drivers/gpu/drm/radeon/radeon_semaphore.c
> +++ b/drivers/gpu/drm/radeon/radeon_semaphore.c
> @@ -40,7 +40,7 @@ int radeon_semaphore_create(struct radeon_device *rdev,
>   	if (*semaphore == NULL) {
>   		return -ENOMEM;
>   	}
> -	r = radeon_sa_bo_new(rdev, &rdev->ring_tmp_bo,
> +	r = radeon_sa_bo_new(&rdev->ring_tmp_bo,
>   			     &(*semaphore)->sa_bo, 8, 8);
>   	if (r) {
>   		kfree(*semaphore);
> @@ -100,7 +100,7 @@ void radeon_semaphore_free(struct radeon_device *rdev,
>   		dev_err(rdev->dev, "semaphore %p has more waiters than signalers,"
>   			" hardware lockup imminent!\n", *semaphore);
>   	}
> -	radeon_sa_bo_free(rdev, &(*semaphore)->sa_bo, fence);
> +	radeon_sa_bo_free(&(*semaphore)->sa_bo, fence);
>   	kfree(*semaphore);
>   	*semaphore = NULL;
>   }

