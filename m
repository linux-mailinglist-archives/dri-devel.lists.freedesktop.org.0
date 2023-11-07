Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3C67E385D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 11:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D97210E505;
	Tue,  7 Nov 2023 10:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2076.outbound.protection.outlook.com [40.107.96.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4F610E503
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 10:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqlAQJvlh/Nct0A/YWnBcFCUz+3TBqZxwqOSQyjBhW1CKON+FZWc2d/LTRaLujkOhAoCdFtdpwjBv1jDdN6RC/nAyhvLI1Dn6a4mA9dSP2igD1xzg9IO39bWHTE/bDGCuOJaE7qUcTfpHt8Jo6iPv4Wpcdeh5Rr6P/0ey+T/Crrc8SPQ9iScdGmIeoNJ576BhK3L4RP2qwbDIc7y6/G23gCqaeyVEZ6lJTKlnS/85exoSOHCpnbUCltO38EX77TIWGaOqmpC6HYzg3zU6D6GtOgC4/fpvDLGwgq7CnMhhZV5qSu3Lyr14a35/rugjH2vjUvphkdaDhm3Fvx06rVz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltAHdOMXEAXnPajG721VQ0FKurivPZk6jTVWUF36Mgg=;
 b=HCoDaA04ErUM3GSDwB8XCoX5pC+nbxxAlNiPrKYLNi4R2iNQSOaN7M3bij4W/Yu/8kRY9cIOSfiMizR66VrZstrnDQ78+piXJBWgIr7cMN/JhhR8e97pGhWGPkQMhf32eB8LZRlkuhZxO9XZI4a+77UTv/JP+NdVRyZQZbXb42ZnSRfjIMdgxg3/UB6C3KNYN5iFzxYdApNzSqUX5f+8RBUpHAvMf51BN7KFnXAQd2p2aMglO+A2Wkn1OwGOFKCKga9M2SVuv6j7D5nWNhQdWO6Bp2TDsf5OqtWGxvE7CgWNupoiUScpJk/eVP3LRk+c115J++PAaSPl+2oW3QmAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltAHdOMXEAXnPajG721VQ0FKurivPZk6jTVWUF36Mgg=;
 b=woC2Hea6XtVzIo2tLAswXvs3W5VjMw80tHtArnSg/B7xsB6Xq8A2KQm7l3z4Uh+0iqwtNQnpeLFYqzU9Dx4f1LD20d9ebQGmAns3CwhsWMHyKB5Oj8aPBhJI1UgDlrFfa1Nm+PJ8MV5PFkDNdrUpe8c5Acgz2ncE9Mebex4nON4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5077.namprd12.prod.outlook.com (2603:10b6:208:310::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 10:00:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 10:00:16 +0000
Message-ID: <782522e7-f710-46d7-aac3-ddb5b6322035@amd.com>
Date: Tue, 7 Nov 2023 11:00:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/ttm/tests: Add tests for ttm_tt
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1697445193.git.karolina.stolarek@intel.com>
 <9d2a1ec9688d7be40e6a774171a63f561651a13e.1697445193.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9d2a1ec9688d7be40e6a774171a63f561651a13e.1697445193.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5077:EE_
X-MS-Office365-Filtering-Correlation-Id: bf46966d-4b4d-4e5a-e11c-08dbdf785742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7XH/obiLyDEUwDG1UFdR+NjeBJt4ii5FJhKD17GF9z17TghGs1wC5Tnx0hUzpVPv4BJI62+ozQ/umWVeJZttj5qKkQWi7pOw1CYCHTVUDPbckZjFqNk/xyCd0dbcGCovOwdQTFaZCoWLPagrG2IQnF3IM8K4ryA7Nel8vs0LqzeWT1E3DlnNmXmEdt8OJHgmEzeqBVFrejy2OcpD1K+1/zNNgQwoVRqo4sNmsWhgYZpyz706zPIyvZQkWTGqJAamd/nhFGUFTfvlpmk4e/Nh5wLv/fJKfowcx3kJAGFcO1GUz4LpagdGOwGxjq9Tkp9figgRvC48CXAgIs4G7xrLjaUh64AVFJLh43CYw7Jr31+0Edz2VR7jNrgebvTrbuornTEAaWWq20iRe7Dn8saGTBw169/z5e7boaEPL1oDVsvjnF3RVOgcmjQKh4rzbj2tlXVY4wotwkAVidIWXmSBwyE2DYumJvGMieyhECQHlLqXn8RAW42Vs2/m9GGCLt14SOZzy5Yq0BSkxggNHE1SKQrnCi54EglK3sf5G6bOlX6t6eIRm8/zp+mZV3FP/mgWxKih3lyIqaHbAozDu9nmDCEK7WNErbbumrMD/JrFtiPcsXf0hTE5q+VVz3RsLkdM5uYCnIkiJWCoemesGRCOEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(376002)(366004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(31686004)(478600001)(6666004)(6486002)(36756003)(31696002)(86362001)(38100700002)(83380400001)(6512007)(66574015)(41300700001)(2616005)(66946007)(66476007)(66556008)(6506007)(26005)(5660300002)(316002)(30864003)(4326008)(2906002)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0Fqelp2RHNBV1dDT0VuTm44TWdGcnhFam1rOEpTUUZvYkpNSFhkbzMxanA5?=
 =?utf-8?B?TkNmNFZLbFNNMU5VZmZBN09TR1NodE4zaDJVOGNQYVhCYisrSkVpM2FOd2Zn?=
 =?utf-8?B?Q1U2SWFHRUNob2l3dW42K0ZkMFRlKy9qUWR4YjJMSXBISGNUL2VhWkV5MmJj?=
 =?utf-8?B?WDk4bUZ4MWdMRmRmSGJPRHVFdXNIL2JsZzR1aHJsWkNBeEpUY1k5MjZ6dEpU?=
 =?utf-8?B?Qy9STVY4N3NmM2lVRTZ0TUhSTHY2ZFFmY2plczVDYlZsV2R2elFLcmZ1YVBo?=
 =?utf-8?B?SGRBUHFMTTJXV2tXTTNFQnQ0STVIZnpUVzVzS2R3WVBxaDlKakIyTjF0eUJI?=
 =?utf-8?B?K2xZbXVUVWxVeWZzWkdVMXVTNkRITHBNaVNDMnJDRVRiVG93VWRaaWIvSFRB?=
 =?utf-8?B?R1AvRUFOMVFobFBTdGdkMXcybUQxZURmb0VCb2hEdjlqVVJQaUN0UlluZEp1?=
 =?utf-8?B?c05ZQ09sTnlvY1BGRXUwWEtSWVZDNzMvZnlSU21wVkpCVkJ0cUdSMXRiajZi?=
 =?utf-8?B?THpMdzZhWWk1SFE2dWFJZEV2bmpIdUlOYnV6OFh6Y1lzeFNjUkNGUmgxY3pv?=
 =?utf-8?B?cmUyZU96cXNvcFJLaGNGc3g4TytlZUQzeDVUV1p2Ym9ZN0x3K0dKcjQ0eXRR?=
 =?utf-8?B?SUhpNXRWem1pQ3NRTGwyZFMzQkFwMFpJdFBuKzM5TElGSkpGNEtKM01ESC9Q?=
 =?utf-8?B?aW5rVEhmNW8wd254eTE4Wmp3aVlCQXJ6N0lwNFlZbkxqRDJJT055OVFMQy9J?=
 =?utf-8?B?YUNPL1Qrc3BYODVZZmVzUkZ3WUdQNWR1dVF3cjlPMnhXK2h2aVd6cU9zRHk3?=
 =?utf-8?B?cGZYOStvTzJ6TlRYR253elRRQ0N6V21iemtxdGtxazJzSHU2QWNaV0NQbmpM?=
 =?utf-8?B?WGcxeG54Z1J4Yk03dm9XTnFGU255MENNNkdMTGQ0cmhnTnd4WWY1Z0pIenBN?=
 =?utf-8?B?R2RVVVZubHp6ZkNyRWovZEY2eE1PUE5HMzVCdEduZjNRc29zN3JoUDFNR2VV?=
 =?utf-8?B?SlgyNXI5aEIxVFIweFVNa3F6elI5eERlSGNzeUlwckdBUVpqS2t5UFljNjBS?=
 =?utf-8?B?WWkvNW5Pa3ZjVWZTYzYzN1V6WXVERE5Lc2tCTjJYVStoZ0dKcmJxOHNTRjRH?=
 =?utf-8?B?ZXdMR05iakRHbW5hbjJHL2YvMlVFWXB2QldFakVGV3FBdEg0eTV2eFpQSlNp?=
 =?utf-8?B?YW5JUFB1a3dDZkgwZS94K1Z1N1BZdEJucmdxRldVclhZREFQRENxUzRYSEEz?=
 =?utf-8?B?M0drR2xnRGxsa0JCMXdST1hONUthM2hsQ3FjTDVJM25VWll5ak94QXhYWGVz?=
 =?utf-8?B?SkJicTdhQzdJRmRLT3dFVGhubTYrTHkvYkFGUUVLaW9BY2hCZVVOWUxUZ2tz?=
 =?utf-8?B?bENvQVZucHRZVWFpTm9NejBFQ2MyMzZZUW1SNVArNG9uOThGR1kwOHhDb2No?=
 =?utf-8?B?bzNQOWxvWm9hZkRjdmlqdkUxVjBENDBRU1FYU0lmczNsUTRvSUxtZHAwalor?=
 =?utf-8?B?NExPOFkwbHgwYUl1VGhmU3RpNmNiM2FJam1hWEZwM1VvQnFvRGo0Z2dHRktW?=
 =?utf-8?B?OC8zRUxjVGZCTFZaak15MkY1clFiOUR1MitySEoyc2hXMUJRMkFmU2dPekNn?=
 =?utf-8?B?b1VBdzRWMzJ2QUNob3A1bTRveGZ3WDFEYzltdzJQSWJBU2pyQ2NQU29MMVhG?=
 =?utf-8?B?TU1Pd0V2WldaMmhPdUY0eDgrSkxZOEVXMGNBV2hmcTNKRXhORnZNUldENHk4?=
 =?utf-8?B?UnM5ZllxZXZhcHVwQk5qZXVnNThUcVRhUmJFaUloK3YrM1JzZm9LQUdXSU0x?=
 =?utf-8?B?VTl2VXdEakVwbUZUdXc4Ullndjh2K3MwMUZWWWJXMHRmcVVaSXBJNkdOQzZw?=
 =?utf-8?B?OHgzVk1odHFrdXdGaGVUKy9wUmZKZ012d09abFlHd2p3VnQ3cGRqenNXa1ZV?=
 =?utf-8?B?WXBFRTYvNnJHdFRxYTNUWDZUZ1gvYkZrRUllblhkcGNiN3FYZTYwVHdEQ21X?=
 =?utf-8?B?Y2pBSnlGQTJtQ3poZEMrTk0wNlFFYUY5bjJFUWhnYTBxQ1NDNnhXcXZxR2hm?=
 =?utf-8?B?OWR5bHhzNnRnbWxjQkNHaHdTNnU5SmZGcHVyTUJzZElJVU5UR01RYmFwUm9s?=
 =?utf-8?Q?dhdbJlPo+M4BelwT1rpWsamO8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf46966d-4b4d-4e5a-e11c-08dbdf785742
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 10:00:15.8509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32m2fjnaVSewy2ZYsoIizSEpCuViXC3bdDEa9xDXWMrFSRGNwU3aykNqs5HmgwRX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5077
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.10.23 um 10:52 schrieb Karolina Stolarek:
> Test initialization, creation and destruction of ttm_tt instances.
> Export ttm_tt_destroy and ttm_tt_create symbols for testing purposes.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>

At least of hand I can't see anything obviously wrong, but I also 
haven't spend to much time on reading though this.

Feel free to add Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  20 ++
>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 295 ++++++++++++++++++
>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>   4 files changed, 319 insertions(+)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> index c92fe2052ef6..f570530bbb60 100644
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -4,4 +4,5 @@ obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>           ttm_device_test.o \
>           ttm_pool_test.o \
>           ttm_resource_test.o \
> +        ttm_tt_test.o \
>           ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index c605f010ea08..5aa9d1d2fca3 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -2,9 +2,29 @@
>   /*
>    * Copyright © 2023 Intel Corporation
>    */
> +#include <drm/ttm/ttm_tt.h>
> +
>   #include "ttm_kunit_helpers.h"
>   
> +static struct ttm_tt *ttm_tt_simple_create(struct ttm_buffer_object *bo,
> +					   uint32_t page_flags)
> +{
> +	struct ttm_tt *tt;
> +
> +	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
> +	ttm_tt_init(tt, bo, page_flags, ttm_cached, 0);
> +
> +	return tt;
> +}
> +
> +static void ttm_tt_simple_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
> +{
> +	kfree(ttm);
> +}
> +
>   struct ttm_device_funcs ttm_dev_funcs = {
> +	.ttm_tt_create = ttm_tt_simple_create,
> +	.ttm_tt_destroy = ttm_tt_simple_destroy,
>   };
>   EXPORT_SYMBOL_GPL(ttm_dev_funcs);
>   
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> new file mode 100644
> index 000000000000..4f5fc4d460b4
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <linux/shmem_fs.h>
> +#include <drm/ttm/ttm_tt.h>
> +
> +#include "ttm_kunit_helpers.h"
> +
> +#define BO_SIZE		SZ_4K
> +
> +struct ttm_tt_test_case {
> +	const char *description;
> +	uint32_t size;
> +	uint32_t extra_pages_num;
> +};
> +
> +static int ttm_tt_test_init(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv;
> +
> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	priv = ttm_test_devices_all(test);
> +	test->priv = priv;
> +
> +	return 0;
> +}
> +
> +static const struct ttm_tt_test_case ttm_tt_init_basic_cases[] = {
> +	{
> +		.description = "Page-aligned size",
> +		.size = SZ_4K,
> +	},
> +	{
> +		.description = "Extra pages requested",
> +		.size = SZ_4K,
> +		.extra_pages_num = 1,
> +	},
> +};
> +
> +static void ttm_tt_init_case_desc(const struct ttm_tt_test_case *t,
> +				  char *desc)
> +{
> +	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(ttm_tt_init_basic, ttm_tt_init_basic_cases,
> +		  ttm_tt_init_case_desc);
> +
> +static void ttm_tt_init_basic(struct kunit *test)
> +{
> +	const struct ttm_tt_test_case *params = test->param_value;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_tt *tt;
> +	uint32_t page_flags = TTM_TT_FLAG_ZERO_ALLOC;
> +	enum ttm_caching caching = ttm_cached;
> +	uint32_t extra_pages = params->extra_pages_num;
> +	int num_pages = params->size >> PAGE_SHIFT;
> +	int err;
> +
> +	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, params->size);
> +
> +	err = ttm_tt_init(tt, bo, page_flags, caching, extra_pages);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	KUNIT_ASSERT_EQ(test, tt->num_pages, num_pages + extra_pages);
> +
> +	KUNIT_ASSERT_EQ(test, tt->page_flags, page_flags);
> +	KUNIT_ASSERT_EQ(test, tt->caching, caching);
> +
> +	KUNIT_ASSERT_NULL(test, tt->dma_address);
> +	KUNIT_ASSERT_NULL(test, tt->swap_storage);
> +}
> +
> +static void ttm_tt_init_misaligned(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	struct ttm_tt *tt;
> +	enum ttm_caching caching = ttm_cached;
> +	uint32_t size = SZ_8K;
> +	int num_pages = (size + SZ_4K) >> PAGE_SHIFT;
> +	int err;
> +
> +	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, size);
> +
> +	/* Make the object size misaligned */
> +	bo->base.size += 1;
> +
> +	err = ttm_tt_init(tt, bo, 0, caching, 0);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	KUNIT_ASSERT_EQ(test, tt->num_pages, num_pages);
> +}
> +
> +static void ttm_tt_fini_basic(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	struct ttm_tt *tt;
> +	enum ttm_caching caching = ttm_cached;
> +	int err;
> +
> +	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	err = ttm_tt_init(tt, bo, 0, caching, 0);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, tt->pages);
> +
> +	ttm_tt_fini(tt);
> +	KUNIT_ASSERT_NULL(test, tt->pages);
> +}
> +
> +static void ttm_tt_fini_sg(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	struct ttm_tt *tt;
> +	enum ttm_caching caching = ttm_cached;
> +	int err;
> +
> +	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	err = ttm_sg_tt_init(tt, bo, 0, caching);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, tt->dma_address);
> +
> +	ttm_tt_fini(tt);
> +	KUNIT_ASSERT_NULL(test, tt->dma_address);
> +}
> +
> +static void ttm_tt_fini_shmem(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	struct ttm_tt *tt;
> +	struct file *shmem;
> +	enum ttm_caching caching = ttm_cached;
> +	int err;
> +
> +	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	err = ttm_tt_init(tt, bo, 0, caching, 0);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	shmem = shmem_file_setup("ttm swap", BO_SIZE, 0);
> +	tt->swap_storage = shmem;
> +
> +	ttm_tt_fini(tt);
> +	KUNIT_ASSERT_NULL(test, tt->swap_storage);
> +}
> +
> +static void ttm_tt_create_basic(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	int err;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo->type = ttm_bo_type_device;
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	err = ttm_tt_create(bo, false);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
> +
> +	/* Free manually, as it was allocated outside of KUnit */
> +	kfree(bo->ttm);
> +}
> +
> +static void ttm_tt_create_invalid_bo_type(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	int err;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo->type = ttm_bo_type_sg + 1;
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	err = ttm_tt_create(bo, false);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, -EINVAL);
> +	KUNIT_EXPECT_NULL(test, bo->ttm);
> +}
> +
> +static void ttm_tt_create_ttm_exists(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	struct ttm_tt *tt;
> +	enum ttm_caching caching = ttm_cached;
> +	int err;
> +
> +	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	err = ttm_tt_init(tt, bo, 0, caching, 0);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	bo->ttm = tt;
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	err = ttm_tt_create(bo, false);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	/* Expect to keep the previous TTM */
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	KUNIT_ASSERT_PTR_EQ(test, tt, bo->ttm);
> +}
> +
> +static struct ttm_tt *ttm_tt_null_create(struct ttm_buffer_object *bo,
> +					 uint32_t page_flags)
> +{
> +	return NULL;
> +}
> +
> +struct ttm_device_funcs ttm_dev_empty_funcs = {
> +	.ttm_tt_create = ttm_tt_null_create,
> +};
> +
> +static void ttm_tt_create_failed(struct kunit *test)
> +{
> +	const struct ttm_test_devices *devs = test->priv;
> +	struct ttm_buffer_object *bo;
> +	int err;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	/* Update ttm_device_funcs so we don't alloc ttm_tt */
> +	devs->ttm_dev->funcs = &ttm_dev_empty_funcs;
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	err = ttm_tt_create(bo, false);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_ASSERT_EQ(test, err, -ENOMEM);
> +}
> +
> +static void ttm_tt_destroy_basic(struct kunit *test)
> +{
> +	const struct ttm_test_devices *devs = test->priv;
> +	struct ttm_buffer_object *bo;
> +	int err;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	err = ttm_tt_create(bo, false);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, bo->ttm);
> +
> +	ttm_tt_destroy(devs->ttm_dev, bo->ttm);
> +}
> +
> +static struct kunit_case ttm_tt_test_cases[] = {
> +	KUNIT_CASE_PARAM(ttm_tt_init_basic, ttm_tt_init_basic_gen_params),
> +	KUNIT_CASE(ttm_tt_init_misaligned),
> +	KUNIT_CASE(ttm_tt_fini_basic),
> +	KUNIT_CASE(ttm_tt_fini_sg),
> +	KUNIT_CASE(ttm_tt_fini_shmem),
> +	KUNIT_CASE(ttm_tt_create_basic),
> +	KUNIT_CASE(ttm_tt_create_invalid_bo_type),
> +	KUNIT_CASE(ttm_tt_create_ttm_exists),
> +	KUNIT_CASE(ttm_tt_create_failed),
> +	KUNIT_CASE(ttm_tt_destroy_basic),
> +	{}
> +};
> +
> +static struct kunit_suite ttm_tt_test_suite = {
> +	.name = "ttm_tt",
> +	.init = ttm_tt_test_init,
> +	.exit = ttm_test_devices_fini,
> +	.test_cases = ttm_tt_test_cases,
> +};
> +
> +kunit_test_suites(&ttm_tt_test_suite);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index e0a77671edd6..d978dc539a9b 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -36,6 +36,7 @@
>   #include <linux/file.h>
>   #include <linux/module.h>
>   #include <drm/drm_cache.h>
> +#include <drm/drm_util.h>
>   #include <drm/ttm/ttm_bo.h>
>   #include <drm/ttm/ttm_tt.h>
>   
> @@ -91,6 +92,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_create);
>   
>   /*
>    * Allocates storage for pointers to the pages that back the ttm.
> @@ -129,6 +131,7 @@ void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>   {
>   	bdev->funcs->ttm_tt_destroy(bdev, ttm);
>   }
> +EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_destroy);
>   
>   static void ttm_tt_init_fields(struct ttm_tt *ttm,
>   			       struct ttm_buffer_object *bo,

