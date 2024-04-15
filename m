Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335378A4E90
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22B81121B9;
	Mon, 15 Apr 2024 12:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ktp+ynex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AFE1121B9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:10:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9bSb8r/Q4NgwJipY+7lnk+94DP6YWiZI0f7mbJDYRdglU06IC3dQCxy0C9wpTZ7vz1J9KonZKGrmiA78bh+WgA9WkfD9rMN/OhU2LTN/+gMtnxpJ3pU81IY6vbh7SfJEwtEqIHQLnTsGo6s5vcJvK22yXFdgtnP8ilTm8N8IyKabPxDI4UXrsag1razU/AbpOtYbGvm6zGihYTcQhtj0aB9cUdUptwZTUmZhQ+BPnQ7jtj8joC/R8l5hr96H/lmkLLbEVN5RUNFJuxbRJsbLokEaN6ROk9OQ7xA9qj9n1wrz6GwfirOf9RJanYXPnvuyTmfnNaRUoTx/SSLsiTxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLU5ZVE/tJipdKKyBzxyvgv/1wUt4uWypDLxe2KpqvA=;
 b=Kskh66qgo8VkZ3UzErWjlA4yKBLjL303R1Y+RAtXLORo1UtQJQZnX8fLPz31IR/N3YuiCvEw+yyy5YVXsgYXmrGQGLW5eb38Un7em9uvi49pekUXCOPVpsZojKypixerNCdsCeAIR1YDvI5Pymw8mbuuiW9vBZM4kng7MElyunJazt8X7csOlpahwz5uo/efQPoULFetwoOs25h4zybOh/c5PrO/VCiQcC9bgVZCXItZKMRBX2+Le5O+TyaFLMcV4Av2c8x5h37F3DN+Uh+gZTifQsZyMhzeBVZMJUkYgTYzp/5bQ73teFoj7cmr2BVdrefUJezEFcqDRifdUkQ4BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLU5ZVE/tJipdKKyBzxyvgv/1wUt4uWypDLxe2KpqvA=;
 b=ktp+ynexek2vzNQcIVbBKvFa6fQayFDJdBFCrNUtgSJEh6g9B+jlDgVdI8m6KlZ2AkZDljXD2FIxTNv9BmwWnDaaPudb7+JRc69uN1Cdq0sWmzH8JMSN2PSBgS37B0F0RfMxLmDkybs21nsZ5gqR2u9iB706pcz0toHIJRtuJPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by CH2PR12MB4280.namprd12.prod.outlook.com (2603:10b6:610:ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 15 Apr
 2024 12:10:16 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df%7]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 12:10:16 +0000
Message-ID: <8ab51b6a-c23f-7581-27c9-bff5a6f26bf6@amd.com>
Date: Mon, 15 Apr 2024 17:40:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 4/9] drm/ttm/tests: Add tests with mock resource
 managers
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <bb45017745c8aba53e7b36aad47e66c4843771e3.1711117249.git.karolina.stolarek@intel.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <bb45017745c8aba53e7b36aad47e66c4843771e3.1711117249.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::9) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|CH2PR12MB4280:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4f10d4-fc7a-4c29-46cf-08dc5d450272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sVvdZkMi6ZvyqB1BUH8s/W9wp6VrtFPVqxuSpw57YcNhSo5/XZzZHgTW7CSOxvbZz9oCPxbUMNLccZaZEnmlT+I77II9+in7YtkbKjXecbcbkRsWOrMSzMw6q+ncE2fQ4NF3ZVhpCaxyaIdPAkK+L2igjeFYs7ISoJx2TCGDPr2zk+TWu7Yj1xPwpRvSqrg8eGgUVMc/aKburnF0HuOGKRikRlnjvzpnFo6MIhHmNfDVSuYUsdoJH2EyNPEMHs8WvMVxBralEz0uBDuTot1jub256uc8I5L6nOP/LRyLw/s7uAWpVeGPL5KljpV4L4zJz5JMGM5RlhcSSOrw1eP4CNs0ObL9xV7ULsiBUJAG333WACCbVA+I1nm12WZCmY1dGy1v8WnbVtXuMFB0smXvUdt2dUZ3wfYnsO8823nM4dIA8k2QYIVM0sXaUnatu/Vsj8A0YmDO+bRaocECMGyQ/ZFLeMauHNq8SZ8CQ1NTSS6A3noeDvDfs4aj6DQg/QcJPt/ARfocvEtQGalBi8yenByKQEqXGudE2nkvK+2KWjJklIoJV9quWmz61ElglTzCxO0QTL2FIAFKgg7snRloumtD2Mw+0NntljQ6n8NJmONqUvsyGCzqX0SFIFgsUpMz6QnWoWcQNT2q8etqIvYuLzdSJVO5bO9wCIVAGEnSi1c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzI3emZPVUM0WkZ3ZUpuZkhDcXRmVWRFM3NQblU1Rm5qeWQ4MkVOYjRSanZK?=
 =?utf-8?B?ekNKbGg0bko5RUZGblVzRUpJaWdUeXZ4RFlIRUNxSVFWUXMrNGtWUDc3bGg3?=
 =?utf-8?B?NUFRdEZrZUtvOGhIWFVFTlR5RnVxa1hGdmsvZHN2bDFwTXVqK0ZUeEx3QlFu?=
 =?utf-8?B?WFpiMEdhTytRWmdiNmI2dUdTc0ZSM2ZVNGNTUFVQYlYyQzNJbzRkbGdETURC?=
 =?utf-8?B?Ukpuck1ldDV0T0hRbE91NklvdUFHc3JTMFEyVkwwZkFkOUtYcXB5Tm5DTVJD?=
 =?utf-8?B?c3JuSmpkUUF1MCtwelUvRnNacFpKQ0dwTXZPRHA5THI3OEY0N1RCMVZwT3A3?=
 =?utf-8?B?L0VvK2p1b3BIcUJDZ2xCRUNpZGF3OXNnVlE1bk9nOTNHL0ZUS0Mzd1hKN0xs?=
 =?utf-8?B?NkduSzVKM0NucmRacEoxRFZ4dGllUTB2RDVkeWZyN0dqKytJTTZ4UEFSWU5W?=
 =?utf-8?B?VVVOdHhUeXRHUm1qdWRsamNrTmZYWmVDQ3NCUTlVMEdMcHMvbTRxUlppL3Ir?=
 =?utf-8?B?Qm9QdFQwV2FkUEVxbXNOZzlsMTBOYkNBK1JRdjZhSEVQNWdXTUlDM2puOXIx?=
 =?utf-8?B?UWZiVWtIODRtcmhYRVVlYVdyUmo1Y3RsN2M2RkVtbkE5bGFyQy9lVzFFS2wz?=
 =?utf-8?B?RVhRZjZDZmZleGozZ1FTT0s4ckg5Mm9uWkZpWitSY0creW5YQURXWmVjaXhM?=
 =?utf-8?B?OGw3N28vc2c5amVlYnhPWUN3a3JBN2d5aEJib3U2NGtvcmhCUGZLMS9FYzR4?=
 =?utf-8?B?NEhrM21qRHdjVEp6cDJtQTMzL243TjJYcjV3VlhrMjZHNFpoNDI5ZUl1Q1p2?=
 =?utf-8?B?RjZ0cnVkeEdIUGxWM1lVSWVZdDhLem5sMzRHb2t4cXI0d1I4TEVzbjZBZ05X?=
 =?utf-8?B?SXI2T3gwQXp4Sk54cytiM2FLOXdaRkRaZGRTMXlDTGx3NFBXMituREJBRW91?=
 =?utf-8?B?STFHOVd2c2hCcTZUTlREdWh5NVE2TUIwMWNuQWFKclpwTzV3cDg1aUFjVjF0?=
 =?utf-8?B?WitPbk9nNkc5aXQxUEZHMTc5cE0rYU5MSDNISWEwL2ZtZ0U0YUdaOGVMRzJi?=
 =?utf-8?B?bVFFUmhDVUhid0wrWVhxVlNOSDFaWmlocWV5Q3MyV2xuc1JwT2lrWk5ZeFZQ?=
 =?utf-8?B?TnFwSVRkeHVmb25tYzMzeUVqdnYrZk1aTjV0cVp0bkdDdWE0eEVLVFJoQXhB?=
 =?utf-8?B?SmRyMnc0aWhrNjdTbDc1TG9Yb1NKMThJNG1ta2d6UGl1MFVpQytQb2RJZjV0?=
 =?utf-8?B?akNuQ1JibkFXZ25aZ053bE12R29zbFhvcXR5ZG9BZUQxVUV6aUlFbGd6UUNI?=
 =?utf-8?B?dnNvMmcxK2xjN3B4U1dsVmZHaGdEeVVvTlMvQUpJMmo0NHJyZTF0VHlBQlNB?=
 =?utf-8?B?cjBCSVFYeEdQMndnREZnbUhQZndzS3pxckxyVEVNMkEwNkxoRTBiNWE2ZXZP?=
 =?utf-8?B?bnFqNCtNSUsreUUwOHFvcUo1ZnZzM1pWMlRtWlBDRjYvUFRmVUlMbWd6S09w?=
 =?utf-8?B?Yi8ybDFVOXhRRjNBZFRlaTRrRlJ0MDFwdDNhQnJXQkhXbjBBbjVBWTl1RWNt?=
 =?utf-8?B?aWZIYk4rVDlWTDJpdzJjK0JxV2c4TVdocElIZDhhaXV6SmMyOUh2aURPY0Ru?=
 =?utf-8?B?UDRncEl1UThzZ2FXYjY3YUJleHRBVm9ndThuVW14WWRZTjVMQzFRbG44NjNl?=
 =?utf-8?B?VmRFaEZYQjRDM2dZOXNYK1RwV2JUQUd4cGxpc2loQndhc2tUNlcxb2FaVmNs?=
 =?utf-8?B?L1p0RGNza0VXVUpZRTdicy9lMEFUWWk2YTVlbmpQN1FRdTZhNCtLU2dvR2xF?=
 =?utf-8?B?MC9NR3BUdSs5QVdoUnhBOEFVWlRnUWR1Q2lBSnlHYkI0ZGxIOW1pYWRiV0h1?=
 =?utf-8?B?czFPNFRXMnRYVmRWcWVuMXNHbS9FSWoydldWN3VHTk1xNEZlQXFlSzhYWGNH?=
 =?utf-8?B?Y2RYYVpQVmJlWjd2TXpMZk5TSWdNZWVkWm9BVk5iUThuZCtEUWVrK2NKN1Av?=
 =?utf-8?B?ZFZXME9VUGx4SWREeW1CcEVLamtCL2YxODBtVlJqZ1hCc2RmQ2F0S1FueUtC?=
 =?utf-8?B?NXloV2VpQWdmbm1yQmlWRmxxb0s3QUtibzVEaDl6bi9LNDVvYm04LytYMzRq?=
 =?utf-8?Q?PsdI/itxNolw7SHFvrAR7WaBd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4f10d4-fc7a-4c29-46cf-08dc5d450272
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 12:10:15.8884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1KN7u2toU7lEPX7/P9UUsAYRJYjMXfd3eaP/apVlhgOthTY8CcltHvgUEL92XdTgf5QSnP+wDakUH1TSUO3Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4280
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


On 3/22/2024 7:59 PM, Karolina Stolarek wrote:
> Add mock resource manager to test ttm_bo_validate() with non-system
> placements. Update KConfig entry to enable DRM Buddy allocator, used
> by the mock manager. Update move function to do more than just assign
> a resource.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   drivers/gpu/drm/Kconfig                       |   1 +
>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   1 +
>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 276 ++++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  39 ++-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   2 +
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 207 +++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  31 ++
>   8 files changed, 556 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 91776996ada4..9fb6eb785bf9 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -200,6 +200,7 @@ config DRM_TTM_KUNIT_TEST
>           default n
>           depends on DRM && KUNIT && MMU && (UML || COMPILE_TEST)
>           select DRM_TTM
> +        select DRM_BUDDY
>           select DRM_EXPORT_FOR_TESTS if m
>           select DRM_KUNIT_TEST_HELPERS
>           default KUNIT_ALL_TESTS
> diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig b/drivers/gpu/drm/ttm/tests/.kunitconfig
> index 75fdce0cd98e..9228ce9b913c 100644
> --- a/drivers/gpu/drm/ttm/tests/.kunitconfig
> +++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
> @@ -2,3 +2,4 @@ CONFIG_KUNIT=y
>   CONFIG_DRM=y
>   CONFIG_DRM_KUNIT_TEST_HELPERS=y
>   CONFIG_DRM_TTM_KUNIT_TEST=y
> +CONFIG_DRM_BUDDY=y
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> index 2e5ed63fb414..f3149de77541 100644
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -7,4 +7,5 @@ obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>           ttm_tt_test.o \
>           ttm_bo_test.o \
>           ttm_bo_validate_test.o \
> +        ttm_mock_manager.o \
>           ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 8229bb31d747..7070b5d16c10 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -8,12 +8,15 @@
>   #include <drm/ttm/ttm_tt.h>
>   
>   #include "ttm_kunit_helpers.h"
> +#include "ttm_mock_manager.h"
>   
>   #define BO_SIZE		SZ_4K
> +#define MANAGER_SIZE	SZ_1M
>   
>   struct ttm_bo_validate_test_case {
>   	const char *description;
>   	enum ttm_bo_type bo_type;
> +	uint32_t mem_type;
>   	bool with_ttm;
>   };
>   
> @@ -102,6 +105,49 @@ static void ttm_bo_init_reserved_sys_man(struct kunit *test)
>   	ttm_bo_put(bo);
>   }
>   
> +static void ttm_bo_init_reserved_mock_man(struct kunit *test)
> +{
> +	const struct ttm_bo_validate_test_case *params = test->param_value;
> +	enum ttm_bo_type bo_type = params->bo_type;
> +	struct ttm_test_devices *priv = test->priv;
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	struct ttm_operation_ctx ctx = { };
> +	struct ttm_placement *placement;
> +	uint32_t mem_type = TTM_PL_VRAM;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	int err;
> +
> +	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
> +				   PAGE_SIZE, &ctx, NULL, NULL,
> +				   &dummy_ttm_bo_destroy);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_EQ(test, kref_read(&bo->kref), 1);
> +	KUNIT_EXPECT_PTR_EQ(test, bo->bdev, priv->ttm_dev);
> +	KUNIT_EXPECT_EQ(test, bo->type, bo_type);
> +	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
> +
> +	if (bo_type != ttm_bo_type_kernel)
> +		KUNIT_EXPECT_TRUE(test,
> +				  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
> +
> +	ttm_resource_free(bo, &bo->resource);
> +	ttm_bo_put(bo);
> +	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> +}
> +
>   static void ttm_bo_init_reserved_resv(struct kunit *test)
>   {
>   	enum ttm_bo_type bo_type = ttm_bo_type_device;
> @@ -136,6 +182,51 @@ static void ttm_bo_init_reserved_resv(struct kunit *test)
>   	ttm_bo_put(bo);
>   }
>   
> +static void ttm_bo_validate_basic(struct kunit *test)
> +{
> +	const struct ttm_bo_validate_test_case *params = test->param_value;
> +	uint32_t fst_mem = TTM_PL_SYSTEM, snd_mem = TTM_PL_VRAM;
> +	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
> +	struct ttm_placement *fst_placement, *snd_placement;
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_place *fst_place, *snd_place;
> +	uint32_t size = ALIGN(SZ_8K, PAGE_SIZE);
> +	struct ttm_buffer_object *bo;
> +	int err;
> +
> +	ttm_mock_manager_init(priv->ttm_dev, snd_mem, MANAGER_SIZE);
> +
> +	fst_place = ttm_place_kunit_init(test, fst_mem, 0);
> +	fst_placement = ttm_placement_kunit_init(test, fst_place, 1);
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, params->bo_type,
> +				   fst_placement, PAGE_SIZE, &ctx_init, NULL,
> +				   NULL, &dummy_ttm_bo_destroy);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	snd_place = ttm_place_kunit_init(test, snd_mem, DRM_BUDDY_TOPDOWN_ALLOCATION);
> +	snd_placement = ttm_placement_kunit_init(test, snd_place, 1);
> +
> +	err = ttm_bo_validate(bo, snd_placement, &ctx_val);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, bo->base.size);
> +	KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
> +	KUNIT_EXPECT_TRUE(test, ttm_tt_is_populated(bo->ttm));
> +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
> +	KUNIT_EXPECT_EQ(test, bo->resource->placement,
> +			DRM_BUDDY_TOPDOWN_ALLOCATION);
> +
> +	ttm_bo_put(bo);
> +	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);

ttm_mock_manager_fini for fst_mem is missing ?

Regards,
S.Amarnath

> +}
> +
>   static void ttm_bo_validate_invalid_placement(struct kunit *test)
>   {
>   	enum ttm_bo_type bo_type = ttm_bo_type_device;
> @@ -162,6 +253,36 @@ static void ttm_bo_validate_invalid_placement(struct kunit *test)
>   	ttm_bo_put(bo);
>   }
>   
> +static void ttm_bo_validate_failed_alloc(struct kunit *test)
> +{
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	struct ttm_test_devices *priv = test->priv;
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	struct ttm_operation_ctx ctx = { };
> +	struct ttm_placement *placement;
> +	uint32_t mem_type = TTM_PL_VRAM;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	int err;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, size);
> +	bo->type = bo_type;
> +
> +	ttm_bad_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1);
> +
> +	ttm_bo_reserve(bo, false, false, NULL);
> +	err = ttm_bo_validate(bo, placement, &ctx);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
> +
> +	ttm_bo_put(bo);
> +	ttm_bad_manager_fini(priv->ttm_dev, mem_type);
> +}
> +
>   static void ttm_bo_validate_pinned(struct kunit *test)
>   {
>   	enum ttm_bo_type bo_type = ttm_bo_type_device;
> @@ -187,11 +308,166 @@ static void ttm_bo_validate_pinned(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, err, -EINVAL);
>   }
>   
> +static const struct ttm_bo_validate_test_case ttm_mem_type_cases[] = {
> +	{
> +		.description = "System manager",
> +		.mem_type = TTM_PL_SYSTEM,
> +	},
> +	{
> +		.description = "VRAM manager",
> +		.mem_type = TTM_PL_SYSTEM,
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM(ttm_bo_validate_mem, ttm_mem_type_cases,
> +		  ttm_bo_validate_case_desc);
> +
> +static void ttm_bo_validate_same_placement(struct kunit *test)
> +{
> +	const struct ttm_bo_validate_test_case *params = test->param_value;
> +	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
> +	struct ttm_test_devices *priv = test->priv;
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	struct ttm_placement *placement;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	int err;
> +
> +	place = ttm_place_kunit_init(test, params->mem_type, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1);
> +
> +	if (params->mem_type != TTM_PL_SYSTEM)
> +		ttm_mock_manager_init(priv->ttm_dev, params->mem_type, MANAGER_SIZE);
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, params->bo_type,
> +				   placement, PAGE_SIZE, &ctx_init, NULL,
> +				   NULL, &dummy_ttm_bo_destroy);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	err = ttm_bo_validate(bo, placement, &ctx_val);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, 0);
> +
> +	if (params->mem_type != TTM_PL_SYSTEM)
> +		ttm_mock_manager_fini(priv->ttm_dev, params->mem_type);
> +
> +	ttm_bo_put(bo);
> +}
> +
> +static void ttm_bo_validate_busy_placement(struct kunit *test)
> +{
> +	uint32_t fst_mem = TTM_PL_VRAM, snd_mem = TTM_PL_VRAM + 1;
> +	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
> +	struct ttm_placement *placement_init, *placement_val;
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	struct ttm_test_devices *priv = test->priv;
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	struct ttm_place *init_place, places[2];
> +	struct ttm_resource_manager *man;
> +	struct ttm_buffer_object *bo;
> +	int err;
> +
> +	ttm_bad_manager_init(priv->ttm_dev, fst_mem, MANAGER_SIZE);
> +	ttm_mock_manager_init(priv->ttm_dev, snd_mem, MANAGER_SIZE);
> +
> +	init_place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
> +	placement_init = ttm_placement_kunit_init(test, init_place, 1);
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement_init,
> +				   PAGE_SIZE, &ctx_init, NULL, NULL,
> +				   &dummy_ttm_bo_destroy);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	places[0] = (struct ttm_place){ .mem_type = fst_mem, .flags = TTM_PL_FLAG_DESIRED };
> +	places[1] = (struct ttm_place){ .mem_type = snd_mem, .flags = TTM_PL_FLAG_FALLBACK };
> +	placement_val = ttm_placement_kunit_init(test, places, 2);
> +
> +	err = ttm_bo_validate(bo, placement_val, &ctx_val);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	man = ttm_manager_type(priv->ttm_dev, snd_mem);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, bo->base.size);
> +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo->priority]));
> +
> +	ttm_bo_put(bo);
> +	ttm_bad_manager_fini(priv->ttm_dev, fst_mem);
> +	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
> +}
> +
> +static void ttm_bo_validate_multihop(struct kunit *test)
> +{
> +	const struct ttm_bo_validate_test_case *params = test->param_value;
> +	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
> +	struct ttm_placement *placement_init, *placement_val;
> +	uint32_t fst_mem = TTM_PL_VRAM, tmp_mem = TTM_PL_TT,
> +		 final_mem = TTM_PL_MULTIHOP;
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_place *fst_place, *final_place;
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	struct ttm_buffer_object *bo;
> +	int err;
> +
> +	ttm_mock_manager_init(priv->ttm_dev, fst_mem, MANAGER_SIZE);
> +	ttm_mock_manager_init(priv->ttm_dev, tmp_mem, MANAGER_SIZE);
> +	ttm_mock_manager_init(priv->ttm_dev, final_mem, MANAGER_SIZE);
> +
> +	fst_place = ttm_place_kunit_init(test, fst_mem, 0);
> +	placement_init = ttm_placement_kunit_init(test, fst_place, 1);
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, params->bo_type,
> +				   placement_init, PAGE_SIZE, &ctx_init, NULL,
> +				   NULL, &dummy_ttm_bo_destroy);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	final_place = ttm_place_kunit_init(test, final_mem, 0);
> +	placement_val = ttm_placement_kunit_init(test, final_place, 1);
> +
> +	err = ttm_bo_validate(bo, placement_val, &ctx_val);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2);
> +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, final_mem);
> +
> +	ttm_bo_put(bo);
> +
> +	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
> +	ttm_mock_manager_fini(priv->ttm_dev, tmp_mem);
> +	ttm_mock_manager_fini(priv->ttm_dev, final_mem);
> +}
> +
>   static struct kunit_case ttm_bo_validate_test_cases[] = {
>   	KUNIT_CASE_PARAM(ttm_bo_init_reserved_sys_man, ttm_bo_types_gen_params),
> +	KUNIT_CASE_PARAM(ttm_bo_init_reserved_mock_man, ttm_bo_types_gen_params),
>   	KUNIT_CASE(ttm_bo_init_reserved_resv),
> +	KUNIT_CASE_PARAM(ttm_bo_validate_basic, ttm_bo_types_gen_params),
>   	KUNIT_CASE(ttm_bo_validate_invalid_placement),
> +	KUNIT_CASE_PARAM(ttm_bo_validate_same_placement,
> +			 ttm_bo_validate_mem_gen_params),
> +	KUNIT_CASE(ttm_bo_validate_failed_alloc),
>   	KUNIT_CASE(ttm_bo_validate_pinned),
> +	KUNIT_CASE(ttm_bo_validate_busy_placement),
> +	KUNIT_CASE_PARAM(ttm_bo_validate_multihop, ttm_bo_types_gen_params),
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index c75de24de783..83a942919cc8 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -27,8 +27,43 @@ static int mock_move(struct ttm_buffer_object *bo, bool evict,
>   		     struct ttm_resource *new_mem,
>   		     struct ttm_place *hop)
>   {
> -	bo->resource = new_mem;
> -	return 0;
> +	struct ttm_resource *old_mem = bo->resource;
> +	int ret;
> +
> +	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM && !bo->ttm)) {
> +		ttm_bo_move_null(bo, new_mem);
> +		return 0;
> +	}
> +
> +	/* Dummy multihop */
> +	if (bo->resource->mem_type == TTM_PL_VRAM &&
> +	    new_mem->mem_type == TTM_PL_MULTIHOP) {
> +		hop->mem_type = TTM_PL_TT;
> +		hop->flags = TTM_PL_FLAG_TEMPORARY;
> +		hop->fpfn = 0;
> +		hop->lpfn = 0;
> +		return -EMULTIHOP;
> +	}
> +
> +	if (old_mem->mem_type == TTM_PL_SYSTEM &&
> +	    new_mem->mem_type == TTM_PL_TT) {
> +		ttm_bo_move_null(bo, new_mem);
> +		return 0;
> +	}
> +
> +	if (old_mem->mem_type == TTM_PL_TT &&
> +	    new_mem->mem_type == TTM_PL_SYSTEM) {
> +		ret = ttm_bo_wait_ctx(bo, ctx);
> +
> +		if (ret)
> +			return ret;
> +
> +		ttm_resource_free(bo, &bo->resource);
> +		ttm_bo_assign_mem(bo, new_mem);
> +		return 0;
> +	}
> +
> +	return ttm_bo_move_memcpy(bo, ctx, new_mem);
>   }
>   
>   struct ttm_device_funcs ttm_dev_funcs = {
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index 3e5fe272c54c..a8977eb606e5 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -13,6 +13,8 @@
>   #include <drm/drm_kunit_helpers.h>
>   #include <kunit/test.h>
>   
> +#define TTM_PL_MULTIHOP (TTM_PL_PRIV + 1)
> +
>   extern struct ttm_device_funcs ttm_dev_funcs;
>   
>   struct ttm_test_devices {
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
> new file mode 100644
> index 000000000000..21636b96ac38
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <drm/ttm/ttm_resource.h>
> +#include <drm/ttm/ttm_device.h>
> +#include <drm/ttm/ttm_placement.h>
> +
> +#include "ttm_mock_manager.h"
> +
> +static inline struct ttm_mock_manager *
> +to_mock_mgr(struct ttm_resource_manager *man)
> +{
> +	return container_of(man, struct ttm_mock_manager, man);
> +}
> +
> +static inline struct ttm_mock_resource *
> +to_mock_mgr_resource(struct ttm_resource *res)
> +{
> +	return container_of(res, struct ttm_mock_resource, base);
> +}
> +
> +static int ttm_mock_manager_alloc(struct ttm_resource_manager *man,
> +				  struct ttm_buffer_object *bo,
> +				  const struct ttm_place *place,
> +				  struct ttm_resource **res)
> +{
> +	struct ttm_mock_manager *manager = to_mock_mgr(man);
> +	struct ttm_mock_resource *mock_res;
> +	struct drm_buddy *mm = &manager->mm;
> +	uint64_t lpfn, fpfn, alloc_size;
> +	int err;
> +
> +	mock_res = kzalloc(sizeof(*mock_res), GFP_KERNEL);
> +
> +	if (!mock_res)
> +		return -ENOMEM;
> +
> +	fpfn = 0;
> +	lpfn = man->size;
> +
> +	ttm_resource_init(bo, place, &mock_res->base);
> +	INIT_LIST_HEAD(&mock_res->blocks);
> +
> +	if (place->flags & TTM_PL_FLAG_TOPDOWN)
> +		mock_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
> +
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
> +		mock_res->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
> +
> +	alloc_size = (uint64_t)mock_res->base.size;
> +	mutex_lock(&manager->lock);
> +	err = drm_buddy_alloc_blocks(mm, fpfn, lpfn, alloc_size,
> +				     manager->default_page_size,
> +				     &mock_res->blocks,
> +				     mock_res->flags);
> +
> +	if (err)
> +		goto error_free_blocks;
> +	mutex_unlock(&manager->lock);
> +
> +	*res = &mock_res->base;
> +	return 0;
> +
> +error_free_blocks:
> +	drm_buddy_free_list(mm, &mock_res->blocks);
> +	ttm_resource_fini(man, &mock_res->base);
> +	mutex_unlock(&manager->lock);
> +
> +	return err;
> +}
> +
> +static void ttm_mock_manager_free(struct ttm_resource_manager *man,
> +				  struct ttm_resource *res)
> +{
> +	struct ttm_mock_manager *manager = to_mock_mgr(man);
> +	struct ttm_mock_resource *mock_res = to_mock_mgr_resource(res);
> +	struct drm_buddy *mm = &manager->mm;
> +
> +	mutex_lock(&manager->lock);
> +	drm_buddy_free_list(mm, &mock_res->blocks);
> +	mutex_unlock(&manager->lock);
> +
> +	ttm_resource_fini(man, res);
> +	kfree(mock_res);
> +}
> +
> +static const struct ttm_resource_manager_func ttm_mock_manager_funcs = {
> +	.alloc = ttm_mock_manager_alloc,
> +	.free = ttm_mock_manager_free,
> +};
> +
> +int ttm_mock_manager_init(struct ttm_device *bdev, uint32_t mem_type, uint32_t size)
> +{
> +	struct ttm_mock_manager *manager;
> +	struct ttm_resource_manager *base;
> +	int err;
> +
> +	manager = kzalloc(sizeof(*manager), GFP_KERNEL);
> +	if (!manager)
> +		return -ENOMEM;
> +
> +	mutex_init(&manager->lock);
> +
> +	err = drm_buddy_init(&manager->mm, size, PAGE_SIZE);
> +
> +	if (err) {
> +		kfree(manager);
> +		return err;
> +	}
> +
> +	manager->default_page_size = PAGE_SIZE;
> +	base = &manager->man;
> +	base->func = &ttm_mock_manager_funcs;
> +	base->use_tt = true;
> +
> +	ttm_resource_manager_init(base, bdev, size);
> +	ttm_set_driver_manager(bdev, mem_type, base);
> +	ttm_resource_manager_set_used(base, true);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ttm_mock_manager_init);
> +
> +void ttm_mock_manager_fini(struct ttm_device *bdev, uint32_t mem_type)
> +{
> +	struct ttm_resource_manager *man;
> +	struct ttm_mock_manager *mock_man;
> +	int err;
> +
> +	man = ttm_manager_type(bdev, mem_type);
> +	mock_man = to_mock_mgr(man);
> +
> +	err = ttm_resource_manager_evict_all(bdev, man);
> +	if (err)
> +		return;
> +
> +	ttm_resource_manager_set_used(man, false);
> +
> +	mutex_lock(&mock_man->lock);
> +	drm_buddy_fini(&mock_man->mm);
> +	mutex_unlock(&mock_man->lock);
> +
> +	ttm_set_driver_manager(bdev, mem_type, NULL);
> +}
> +EXPORT_SYMBOL_GPL(ttm_mock_manager_fini);
> +
> +static int ttm_bad_manager_alloc(struct ttm_resource_manager *man,
> +				 struct ttm_buffer_object *bo,
> +				 const struct ttm_place *place,
> +				 struct ttm_resource **res)
> +{
> +	return -ENOSPC;
> +}
> +
> +static void ttm_bad_manager_free(struct ttm_resource_manager *man,
> +				 struct ttm_resource *res)
> +{
> +}
> +
> +static bool ttm_bad_manager_compatible(struct ttm_resource_manager *man,
> +				       struct ttm_resource *res,
> +				       const struct ttm_place *place,
> +				       size_t size)
> +{
> +	return true;
> +}
> +
> +static const struct ttm_resource_manager_func ttm_bad_manager_funcs = {
> +	.alloc = ttm_bad_manager_alloc,
> +	.free = ttm_bad_manager_free,
> +	.compatible = ttm_bad_manager_compatible
> +};
> +
> +int ttm_bad_manager_init(struct ttm_device *bdev, uint32_t mem_type,
> +			 uint32_t size)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	man = kzalloc(sizeof(*man), GFP_KERNEL);
> +	if (!man)
> +		return -ENOMEM;
> +
> +	man->func = &ttm_bad_manager_funcs;
> +
> +	ttm_resource_manager_init(man, bdev, size);
> +	ttm_set_driver_manager(bdev, mem_type, man);
> +	ttm_resource_manager_set_used(man, true);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ttm_bad_manager_init);
> +
> +void ttm_bad_manager_fini(struct ttm_device *bdev, uint32_t mem_type)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	man = ttm_manager_type(bdev, mem_type);
> +
> +	ttm_resource_manager_set_used(man, false);
> +	ttm_set_driver_manager(bdev, mem_type, NULL);
> +
> +	kfree(man);
> +}
> +EXPORT_SYMBOL_GPL(ttm_bad_manager_fini);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
> new file mode 100644
> index 000000000000..d2db9de9d876
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef TTM_MOCK_MANAGER_H
> +#define TTM_MOCK_MANAGER_H
> +
> +#include <drm/drm_buddy.h>
> +
> +struct ttm_mock_manager {
> +	struct ttm_resource_manager man;
> +	struct drm_buddy mm;
> +	uint64_t default_page_size;
> +	/* protects allocations of mock buffer objects */
> +	struct mutex lock;
> +};
> +
> +struct ttm_mock_resource {
> +	struct ttm_resource base;
> +	struct list_head blocks;
> +	unsigned long flags;
> +};
> +
> +int ttm_mock_manager_init(struct ttm_device *bdev, uint32_t mem_type,
> +			  uint32_t size);
> +int ttm_bad_manager_init(struct ttm_device *bdev, uint32_t mem_type,
> +			 uint32_t size);
> +void ttm_mock_manager_fini(struct ttm_device *bdev, uint32_t mem_type);
> +void ttm_bad_manager_fini(struct ttm_device *bdev, uint32_t mem_type);
> +
> +#endif // TTM_MOCK_MANAGER_H
