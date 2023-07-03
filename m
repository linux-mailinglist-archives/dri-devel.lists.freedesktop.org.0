Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40093745AE9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 13:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A483010E0D9;
	Mon,  3 Jul 2023 11:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC34610E060
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 11:21:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTP7+kyoZmgcJBikTbMq0nSaev7osQOdVomSvhiyTUzCbyjpRrGNnQJgI8KJ8ods0pvfLd6EWWP53tD4RdFjipFkbEj9RmVu/aq66hM/KXUPBJr5XkS/VO0FhFPYbLDbPTuIUkQwH0bjw7o1S/GA9ej7mAdK0jkD8occljzYlBBUlWFRp1oyTZvFg7/xf6lF2fVhCYLprrxAF6ETwJY5STuk+UmUK6I/29X43FZjNij3ZaSSeiQvX+3i8l1sypronroJDV+5/vHvcXa7EqCzDBsG37+YrFcQUDo1k8S6KhVgyrLp9D8u6JakkCALv6aFVH1JL/GzhvTLpYLtIF4Shg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuOK+JFwEVjOhzO5z5HZMQt22xzJIuCzMgpJG0ZtsHU=;
 b=bxqpY02FfcaLaZgK4aLaO7BOW7XL7Sn76gmvOgazvgqu5Xu26xLHFWez0qt83ba4uU3Ow5gO8XzXQpZnWpbhzTc8vfsKTW5P/tHfnQ6VCWUHJzZfX8fO/zZkkdYZKNJWmlS49Q23q4jesjKLzBtFa5kLNfL1wXIENtEAEY8JR4yA3OWangGSASov5xBYU+4I5umw00HCtz2rnIX12Rcjz/ZfNxfzbm2fHRfrY4hGJJ6FYHHk79oYZm/ntBEvOQh63sptk8X89MR4QkW8JTr2z9ymV8r76JKG0zwWON6SzT9FKcX98Ej8NGhl91j/TTccfYjM4FKOTTh/mDq0lGxblw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuOK+JFwEVjOhzO5z5HZMQt22xzJIuCzMgpJG0ZtsHU=;
 b=uErP1j8JrSv9277VEiPoytY4+0BzPcgprBoDT7ULC1+aTqplvvjbYEwGzsJWBgplvV7SscRx9+X6bUvfuIVHLK0u8R2NP/RXp3WUh7XZgumOEeIIadUWRf2pn2wwdmSHnDeSTG0jq3tC10I48XjKO0YvOtcKexFlosvtXzEfNDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB8888.namprd12.prod.outlook.com (2603:10b6:806:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 11:21:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 11:21:48 +0000
Message-ID: <7f761d03-6387-afc7-989a-9dc791fe04ed@amd.com>
Date: Mon, 3 Jul 2023 13:21:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC v3 3/3] drm/ttm/tests: Add tests for ttm_pool
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1688131205.git.karolina.stolarek@intel.com>
 <1726d758b3f7e5ee10b168102d5e207479324442.1688131205.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <1726d758b3f7e5ee10b168102d5e207479324442.1688131205.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e8be299-2176-439b-b987-08db7bb7b0d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DwU0/zqQtrVp/5W0wRp+bFdJe9XeafbNNGTgaVOH/h1eqxJfwblMq1UhqVxE9U8VcA7hBcH++oy0SknOlQmgIVFHELAwFqokxcegMZ/Yywwsr4LD/lnYfla3zblS1gdxIIa13bPFrtYBpiWu2B0kOVuGZeuZcJtmcDU2NmWW3ImZvYxzpbdHdiS0bAWMsbZG9NiS0/XwuQGSj0KJISExrYDHndk698S5Cw4VIRV3iuh1+nngZpDlf32Ga/iC/eLcUBq1p0WGRy9Y63LjXxqWmB7SsM8jURv/UGYCB/zoDrjtpvQa8+sNbT5zrwRZe18dNsZ00wPz+EFvHmyxoYb1nlwHiK1b45MFgo/1TENrXEZWtv2nV/t1TLNu/8i5M3hwEbmVWhgKEocV8c3HRWQRauPpCL/HlyUTfrZr9FPJUypcR+Au9xQy4KE1kVopLGSxB+zIUlKoNGreToI+Wf+674REiHGaso60IzW1MWQZqwf2QN6IkrQnTZrII/PPxj68MdBI4zPPdyMpkC4iBOVymhnGqnMA/3vTOlJycmUniBpqNSXLXgluz+DhMKWKvjIVUtGgU850XhjTZPyNQY8x3anfwupf1XiFmEh9KOSW3wZgN0foPoPHacoYNiSEbj/JVR0wXlnV/ixY9gaPVnylRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199021)(30864003)(2906002)(41300700001)(5660300002)(8936002)(8676002)(36756003)(86362001)(31696002)(186003)(2616005)(31686004)(478600001)(6512007)(6506007)(6666004)(6486002)(316002)(4326008)(66476007)(66556008)(66946007)(38100700002)(54906003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjlxOXV2aGdvMk9DeGtKNjRFSE93cUVFbTFDdkxhSUkxQ1c4bVNBRTBZME5i?=
 =?utf-8?B?d2xaem1CWmhBbFl4cnlSK2loaS9GWGk0M0JQTVc5bWc1MnUzajd6QmlSRHdC?=
 =?utf-8?B?d21OZ3oweVMrQk9TMUNuUm1yZnJzaFdhOHY3SDRWOUVmb0ltMEZ6TGdUUEtJ?=
 =?utf-8?B?SUtFOEtIU0pYWDVCWGpWYWx2SWl0REc0Smllcjk2eHd5RzFxanQ1MnRuTnVv?=
 =?utf-8?B?dG9yK2dTUjNWcDJvYjl1a3hGTjl4MWtvQ3FBQ3RTa1FPK2NRZVd6bTRHMzJ6?=
 =?utf-8?B?UkoyV2JOeHJldWhYSE9TL1pMdGtabTdCRTBHaXF0QVpDVW9ZODFjQnM2VDBK?=
 =?utf-8?B?NW00c2dJVGFoZUJ1bGlzQlhsT2xFVm1CVHN0aDJITGRzZWJsZTZrOTFoczdl?=
 =?utf-8?B?Q0d1RjkwTWcrcFRqaTRLWU5ZcmhROXdQTHRSNDVNNGFTd3A0WjdQbjVPMzI1?=
 =?utf-8?B?QTFTTitxWmFXSUNhVXlmU3dURWszNG5LWVR3Tk1meE1RK3RvbGJ3b2RjSUZz?=
 =?utf-8?B?NUY0NDJiYkFCVGlpY3RPL1JzZXRhL0RyaGR1aU1RNVAwcE0wcEdEWER1UkNa?=
 =?utf-8?B?U0JtMUpCY0NQNEJXQ2pmS0ZEeWorRG4wZmJiUDcrdDQ0MEw0SU9pUlp4K3R5?=
 =?utf-8?B?Qm5CTkxuMmRIbHErdGVmZ2wyYzg4TkFrb1hxeDBYUjZLbittVVV2RkdJeEFa?=
 =?utf-8?B?eXlhOFVGd0tielllQkl2MTQyVll2ajhEdmc5V1U5UDhhM0l1VFhTa1krWHdT?=
 =?utf-8?B?R0hyL2hCa1NWeXFYTHAyYTZzUEZVeHVsQmVtRXVoeEtIS3FDbjlWNWxEUTlJ?=
 =?utf-8?B?VzlmNld4YlNWODBjbUFwSVp4dmRIeDhvLzltYmp2NDVBdi9ENGtKalUzTTRq?=
 =?utf-8?B?R0x5YUJHZkZGOElPQlJsWmpHVVdwMllMV0Zkam9TeTdYVW1ZMXpudVBBRnJJ?=
 =?utf-8?B?akMzYmJWUnJGNFovdE5Fazg0VXByajJucjJUWjlYVjBqNHhLS2J4RmtoQ25Y?=
 =?utf-8?B?S2o0RWtBZVhWeUZDNlI1VlZrMC9pQlFYQ2dBbW1zdHM2a1pPTmpDNXU0cTVq?=
 =?utf-8?B?Z3NwTXM2WGdEU1BWYkQyWDd6RjBOUVNmSHFmcytIVUtudXMxZitqZ2R1YXZ5?=
 =?utf-8?B?ZEl4bjIvWlNHczNRZ3RNeEY3OWxIY1UwR3hWbElMQXNBMjlaejZZUC92NHRq?=
 =?utf-8?B?WFlxNE8rTkJKMjVUa2hGWjJjbHB6WXpGam9YNVhmM2RFMDJsZ1N5dklvTS96?=
 =?utf-8?B?TjFudXVLd1ZyaE1LQzN6cWx5MFVla1RiMlU1cEVVTjFYdFZJclZrWXZCcnhQ?=
 =?utf-8?B?aWl0cHBUSWcybDhhVkcrbVc5S1VQZ1c4NzQ3cTE2bDVtOUJDaHBYTUIvcWIy?=
 =?utf-8?B?TVlpaDB2S043cHhHWWxSaThZWW1obFZDSjhod0dBRkJqRmFqMng3aHV0dlZv?=
 =?utf-8?B?UlNnTit6NElObUZ1NkVIMk1VVjBHd3BlTzZRUnhNSElnRElOQ08zOWZlSTV4?=
 =?utf-8?B?Vnl1YlJtckJqWVNFYlBoMDYvQnR4ZHl3Y3Q1Z3RVWnJmSFpOYkdCNDdoRXpZ?=
 =?utf-8?B?VzBzMVE5K1h1R2NlWnVjdUFUZTE3V0NucS9kV1A5UVBDU01hOXJTT3BSa0J6?=
 =?utf-8?B?ZVhTTHJsWWpadlVUWkptdi9teVBuZE5lVUVaVVd0b2pyTFNQTU9VdTA0NjhR?=
 =?utf-8?B?RDZ3UUsxalduN3dxeGZRMXVJekpoY1JHTVhjZ1ZPSTlFaGJlWHdLQ0Jub2gw?=
 =?utf-8?B?Z2wway9MSFdGME5OVjMxQXowenkvV2dYaklCalBkbGtCc1RCU0xRRC9UV1Jl?=
 =?utf-8?B?VkkyVXp2R29EdmlzZ0VGMDd1V2xoSVdkNHNZamdra1E3WDNOU3hoVGZ1NC9u?=
 =?utf-8?B?QmZ4UzZBYjVRUXdIbEtVNHNseGpQZU5kZ0dxTlBya3lBNnlING5NcFlIL0ZD?=
 =?utf-8?B?Y0pDSnZkS3FHL2xqTW5zdVo5RytBMG9kaGx0MkhmWWNzaDN0M2p1ZlNZWjNH?=
 =?utf-8?B?SG00eEhHZ01POVVOUmpJbHlqYTRhVWFBbTJwYnpDelRkY2FsaEZPd1hsNHAx?=
 =?utf-8?B?OXY1OG0rU3I5bFBjSmcyblhJbHYrNkFENnVZQ01nSUdIcTN2MnJKNGFPS0c4?=
 =?utf-8?B?OVFDRFE3b3lySDUxM2k0S21HVzNJSmNrVVBpTjRiTjBxWFlJbWQwOFkrK0M2?=
 =?utf-8?Q?rDqSdzyCuD9GUki2uakDK1rbsoyRWun6HQpA00jI9N9A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8be299-2176-439b-b987-08db7bb7b0d8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 11:21:48.1736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oFFab+wCDaaiQ6Ei6FsjX7O0zOjp5BEGgMYhAn5MpH7HKRx1fR4yAPNCHHklW2U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8888
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Shuah Khan <shuah@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 03.07.23 um 09:58 schrieb Karolina Stolarek:
> Add KUnit tests that exercise page allocation using page pools
> and freeing pages, either by returning them to the pool or
> freeing them. Add a basic test for ttm_pool cleanup. Introduce
> helpers to create a dummy ttm_buffer_object.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  15 +
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 405 ++++++++++++++++++
>   4 files changed, 425 insertions(+)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> index 7917805f37af..ec87c4fc1ad5 100644
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -2,4 +2,5 @@
>   
>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>           ttm_device_test.o \
> +        ttm_pool_test.o \
>           ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index 428a8a4ac9dc..9384679fccb0 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -26,6 +26,21 @@ int ttm_kunit_helper_init_device(struct kunit *test,
>   }
>   EXPORT_SYMBOL_GPL(ttm_kunit_helper_init_device);
>   
> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit *test,
> +						       size_t size)
> +{
> +	struct drm_gem_object gem_obj = { .size = size };
> +	struct ttm_buffer_object *bo;
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	bo->base = gem_obj;
> +
> +	return bo;
> +}
> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_ttm_bo_init);
> +
>   int ttm_test_devices_init(struct kunit *test)
>   {
>   	struct ttm_test_devices_priv *priv;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index bf0b1000a8ee..41ad38dd34e5 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -7,6 +7,7 @@
>   
>   #include <drm/drm_drv.h>
>   #include <drm/ttm/ttm_device.h>
> +#include <drm/ttm/ttm_bo.h>
>   
>   #include <drm/drm_kunit_helpers.h>
>   #include <kunit/test.h>
> @@ -23,6 +24,9 @@ int ttm_kunit_helper_init_device(struct kunit *test,
>   				  bool use_dma_alloc,
>   				  bool use_dma32);
>   
> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit *test,
> +						       size_t size);
> +
>   int ttm_test_devices_init(struct kunit *test);
>   void ttm_test_devices_fini(struct kunit *test);
>   
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> new file mode 100644
> index 000000000000..85806f72df22
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> @@ -0,0 +1,405 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <linux/mm.h>
> +
> +#include <drm/ttm/ttm_tt.h>
> +#include <drm/ttm/ttm_pool.h>
> +
> +#include "ttm_kunit_helpers.h"
> +
> +struct ttm_pool_test_case {
> +	const char *description;
> +	unsigned int order;
> +	bool use_dma_alloc;
> +};
> +
> +static struct ttm_operation_ctx simple_ctx = {
> +	.interruptible = true,
> +	.no_wait_gpu = false,
> +};
> +
> +static struct ttm_tt *mock_ttm_tt_init(struct kunit *test,
> +				       uint32_t page_flags,
> +				       enum ttm_caching caching,
> +				       size_t size)
> +{
> +	struct ttm_tt *tt;
> +	struct ttm_buffer_object *bo;
> +	int err;
> +
> +	bo = ttm_kunit_helper_ttm_bo_init(test, size);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	err = ttm_tt_init(tt, bo, page_flags, caching, 0);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	/* We don't need this BO later, release it */
> +	ttm_bo_put(bo);

That won't work. A BO must always outlive the TT object allocated for it.

Otherwise you can get crashes during TT release.

Regards,
Christian.

> +
> +	return tt;
> +}
> +
> +static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
> +					       size_t size,
> +					       enum ttm_caching caching)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct ttm_pool *pool;
> +	struct ttm_tt *tt;
> +	int err;
> +	unsigned long order = __fls(size / PAGE_SIZE);
> +
> +	tt = mock_ttm_tt_init(test, order, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	return pool;
> +}
> +
> +static const struct ttm_pool_test_case ttm_pool_basic_cases[] = {
> +	{
> +		.description = "One page",
> +		.order = 0,
> +	},
> +	{
> +		.description = "More than one page",
> +		.order = 2,
> +	},
> +	{
> +		.description = "Above the allocation limit",
> +		.order = MAX_ORDER + 1,
> +	},
> +	{
> +		.description = "One page, with coherent DMA mappings enabled",
> +		.order = 0,
> +		.use_dma_alloc = true,
> +	},
> +	{
> +		.description = "Above the allocation limit, with coherent DMA mappings enabled",
> +		.order = MAX_ORDER + 1,
> +		.use_dma_alloc = true,
> +	},
> +};
> +
> +static void ttm_pool_alloc_case_desc(const struct ttm_pool_test_case *t,
> +				     char *desc)
> +{
> +	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(ttm_pool_alloc_basic, ttm_pool_basic_cases,
> +		  ttm_pool_alloc_case_desc);
> +
> +static void ttm_pool_alloc_basic(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	const struct ttm_pool_test_case *params = test->param_value;
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct page *fst_page, *last_page;
> +	int err;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int expected_num_pages = 1 << params->order;
> +	size_t size = expected_num_pages * PAGE_SIZE;
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, params->use_dma_alloc,
> +		      false);
> +
> +	KUNIT_ASSERT_PTR_EQ(test, pool->dev, priv->dev);
> +	KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
> +	KUNIT_ASSERT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
> +
> +	fst_page = tt->pages[0];
> +	last_page = tt->pages[tt->num_pages - 1];
> +
> +	if (params->order <= MAX_ORDER) {
> +		if (params->use_dma_alloc) {
> +			KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
> +			KUNIT_ASSERT_NOT_NULL(test, (void *)last_page->private);
> +		} else {
> +			KUNIT_ASSERT_EQ(test, fst_page->private, params->order);
> +		}
> +	} else {
> +		if (params->use_dma_alloc) {
> +			KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
> +			KUNIT_ASSERT_NULL(test, (void *)last_page->private);
> +		} else {
> +			/*
> +			 * We expect to alloc one big block, followed by
> +			 * order 0 blocks
> +			 */
> +			KUNIT_ASSERT_EQ(test, fst_page->private,
> +					min_t(unsigned int, MAX_ORDER,
> +					      params->order));
> +			KUNIT_ASSERT_EQ(test, last_page->private, 0);
> +		}
> +	}
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	const struct ttm_pool_test_case *params = test->param_value;
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_buffer_object *bo;
> +	dma_addr_t dma1, dma2;
> +	int err;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int expected_num_pages = 1 << params->order;
> +	size_t size = expected_num_pages * PAGE_SIZE;
> +
> +	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	bo = ttm_kunit_helper_ttm_bo_init(test, size);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	err = ttm_sg_tt_init(tt, bo, 0, caching);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
> +
> +	dma1 = tt->dma_address[0];
> +	dma2 = tt->dma_address[tt->num_pages - 1];
> +
> +	KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
> +	KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_alloc_order_caching_match(struct kunit *test)
> +{
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 0;
> +	size_t size = PAGE_SIZE;
> +	int err;
> +
> +	pool = ttm_pool_pre_populated(test, size, caching);
> +
> +	pt = &pool->caching[caching].orders[order];
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_alloc_caching_mismatch(struct kunit *test)
> +{
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt_pool, *pt_tt;
> +	int err;
> +	enum ttm_caching tt_caching = ttm_uncached;
> +	enum ttm_caching pool_caching = ttm_cached;
> +	size_t size = PAGE_SIZE;
> +	unsigned int order = 0;
> +
> +	pool = ttm_pool_pre_populated(test, size, pool_caching);
> +
> +	pt_pool = &pool->caching[pool_caching].orders[order];
> +	pt_tt = &pool->caching[tt_caching].orders[order];
> +
> +	tt = mock_ttm_tt_init(test, 0, tt_caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
> +
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_alloc_order_mismatch(struct kunit *test)
> +{
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt_pool, *pt_tt;
> +	int err;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 2;
> +	size_t fst_size = (1 << order) * PAGE_SIZE;
> +	size_t snd_size = PAGE_SIZE;
> +
> +	pool = ttm_pool_pre_populated(test, fst_size, caching);
> +
> +	pt_pool = &pool->caching[caching].orders[order];
> +	pt_tt = &pool->caching[caching].orders[0];
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, snd_size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
> +
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_free_dma_alloc(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 2;
> +	size_t size = (1 << order) * PAGE_SIZE;
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
> +	ttm_pool_alloc(pool, tt, &simple_ctx);
> +
> +	pt = &pool->caching[caching].orders[order];
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
> +
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_free_no_dma_alloc(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 2;
> +	size_t size = (1 << order) * PAGE_SIZE;
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, false, false);
> +	ttm_pool_alloc(pool, tt, &simple_ctx);
> +
> +	pt = &pool->caching[caching].orders[order];
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
> +
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_fini_basic(struct kunit *test)
> +{
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 0;
> +	size_t size = PAGE_SIZE;
> +
> +	pool = ttm_pool_pre_populated(test, size, caching);
> +	pt = &pool->caching[caching].orders[order];
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
> +
> +	ttm_pool_fini(pool);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
> +}
> +
> +static struct kunit_case ttm_pool_test_cases[] = {
> +	KUNIT_CASE_PARAM(ttm_pool_alloc_basic, ttm_pool_alloc_basic_gen_params),
> +	KUNIT_CASE_PARAM(ttm_pool_alloc_basic_dma_addr,
> +			 ttm_pool_alloc_basic_gen_params),
> +	KUNIT_CASE(ttm_pool_alloc_order_caching_match),
> +	KUNIT_CASE(ttm_pool_alloc_caching_mismatch),
> +	KUNIT_CASE(ttm_pool_alloc_order_mismatch),
> +	KUNIT_CASE(ttm_pool_free_dma_alloc),
> +	KUNIT_CASE(ttm_pool_free_no_dma_alloc),
> +	KUNIT_CASE(ttm_pool_fini_basic),
> +	{}
> +};
> +
> +static struct kunit_suite ttm_pool_test_suite = {
> +	.name = "ttm_pool",
> +	.init = ttm_test_devices_init,
> +	.exit = ttm_test_devices_fini,
> +	.test_cases = ttm_pool_test_cases,
> +};
> +
> +kunit_test_suites(&ttm_pool_test_suite);
> +
> +MODULE_LICENSE("GPL");

