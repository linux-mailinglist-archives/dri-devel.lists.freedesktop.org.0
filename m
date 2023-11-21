Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7BA7F30BC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 15:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E5810E4CA;
	Tue, 21 Nov 2023 14:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5E810E4C1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 14:29:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g59LSHwVWmutJPa6uE0bdelHFbNia5nKdn/PV8Ew0oZglOiduP/yiuHMoAPWg3hyRLC+RudcGrGoy/R63X6hJ1774F2yXKYrNnwdWrAUbI/LkEASfq56e+JVbC/UuELPdGHVL6K9z/k2kA7dX/UqbFqdMPaajvSIqZjKqS+OnZ8T8K91/vR0DDL9uLGIGsoNm12NnVgLJKqJ7gGrEY1Hlabfr0VqY2POzKPKGQoJ13CYK9AYeoQBn2h4UQp/ZJ6DkgefcfG9xPvJqshl5MaKX6aAifdqtMe2P1Ng2IqmbfUtQZ0Gv7PURkIS0/Xw8llCPwhVuq5JjuErqylMlOn3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYCZgrN5b/lzF1nzaK6IR0mYasFBA7hFgeCIooJIka0=;
 b=OKaJhSFAmIT/GCGo3rN6Ib7KCqh0Mst4tXBPrpyzJhnZ7G6YC9SmexU2jpsuTtRvXiZUbq6Z0eNB+QCb1k8DFHIv1zjrsEqsL9FwrpJhwMetQiD5aCejWP3VXQoEpAzfZyGAJrXPI2pfEPSe22jruphz0Duyh5Es3W/4PLEB6hXCG/sI8QKX+Dr2zlqLtqXF2O9F6xozpxhclJc69tR/I1hvCMUuI+PtK5ym2rwgTSjPVR79x5IXmTYxx/KwaOK+gjXQB2AiyiLZAf/1U93n3R9pObh6UpRnO5cpEjt6nQXWOr2yAIW0O8jvcIyzij7SlaokYr8K+drJUZcmdn8j4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYCZgrN5b/lzF1nzaK6IR0mYasFBA7hFgeCIooJIka0=;
 b=Ngljon1NSMKLYbqJnPryZvVrLyPLsOYT8lZPc18WM0u+4gu8IDtIFcCTVQ4rCebekcoasO1TGOjJWckQyyCv5XXiYAxhcq3NdqM93ufRHs4z169xJHRtwLk43kLC7Q9qocWbD3HxAzOWD9AsW34+Xxx2EYtpHmhCM2wtgkNKVG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 14:29:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 14:29:43 +0000
Message-ID: <767a8420-d2e4-43f9-87ee-1c32382d7e0b@amd.com>
Date: Tue, 21 Nov 2023 15:29:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] drm/ttm/tests: Add tests for ttm_bo functions
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1700207346.git.karolina.stolarek@intel.com>
 <61e723d67ebf8eaec226eea176fa19da1994a3b7.1700207346.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <61e723d67ebf8eaec226eea176fa19da1994a3b7.1700207346.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4096:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ad5c94-e18d-4a58-d487-08dbea9e4d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r176TdSNA8dlb5OrPdh38MzKXC6XQkWpya/9zUM+zDjP4aNA2MGu2CgaPD693ogaGubZEWX2uEZMHUMwtgBhKArEiZFiZRBP2VLRzFKITz2Ft8CslcdYI4Ff9J8yB5Sdc5mqRzyP/VizGVl8SCApHOYZrHoBUbKEKDiW2wkL5foDTYB0dJEW7FaQd3VveB+Plp+AjGeiXRB1O7LL4WA95VHc1ZgYoo4oRXupbzCT3ebxxhBybySdSj8DwT6rbGophe8VpqqppH5TVNi+vCaG+oMcCgQCcrdgth9f5JU0t1QJ0aid3acgYPHp5mdnBJMPjmV8cOrg1vQLyIvHJM7rPF9iAqH0cD6b7kp7r8bYBla3wZApmap50ovr1Q2ixKSC+Y0tTfzHPGmju/CC17k4HAjA3vgacPPDT3Hre/NGKQYO8fl9SkFL2G2S1pFJBvIlZUZjl2CR5sOiYflWokpDW6bo9tYBKnrcZBnkLmtla4O+01kRvkDkpccxLMQTyLDnSzmMLlIcY+F5vLPwchKsivQRp9Xoj39Wko26pm2GuD+EIr3oyUwuCmgkkkKLACN0fhayO73vGWtfg2MPdqVkK5Z8K6UC88oRlh/fwyJze9k2z4K+iM1/EjTwXAUBtWdl8JPGBKxPKW5/1W68nb4ok6SYYn1cUJXKULIsE2RBNyNS+1aCvQ7h/kTzKaGy2eCI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(41300700001)(36756003)(86362001)(5660300002)(30864003)(31696002)(2906002)(6512007)(31686004)(6486002)(478600001)(6506007)(6666004)(83380400001)(8936002)(66946007)(38100700002)(8676002)(316002)(4326008)(54906003)(66556008)(66476007)(2616005)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0JXU0tZM080SlRuL2tDcUtXblNCYmJlYXlONHZGU08rUzRmYjlvMkdLdmZH?=
 =?utf-8?B?UHN6UVZ4V3NiV2RvU0Z5Z0h3cUN3UG1XTENmdllyMkljNEs5eG8zajVuTm14?=
 =?utf-8?B?WWNNckxxRkRsek1xWHcwa1JWREwzdXE3QjhoVUI0WVdpa3NGU21nTFpkeUkv?=
 =?utf-8?B?OE9qek1MWlFxcWQzRWxmSEVNZ21FaWdna0NoYktFRlJZSGJseGRCbnNmSE5w?=
 =?utf-8?B?NUVXM3VkTlFkMk1pUE04czZCYlFWMStZNEt5Lzh2MUsyTnh1M205WVJhbXly?=
 =?utf-8?B?WWZMeTEycXFkczN5clFNZXZodytjUFp6NmYrMFVVUkNSNUwxWXN6WHZHT1VR?=
 =?utf-8?B?SWgzY09zdGdEWFVtbmJxNTlOWFh0TUcxZWladGJmZmdseExOVllINlo2T3dE?=
 =?utf-8?B?d1ZHa3RuaTdyU2Z3OURES3NRbk50R1h6cEpHVzh1Q21uN1A1bW9LeDdJcDVX?=
 =?utf-8?B?NkJacmxJU2JhUXo2eVRGWWtlSnNlRUtsTHBFNGdaWVg2UE0yN2FNWmIxRVdi?=
 =?utf-8?B?THRjNFhKbHBNN0pHQURick0yblFJTHRUeXZzaXF6L1NpNS9Ha2J4TlViZ0tQ?=
 =?utf-8?B?R2d4NzdENmhUemxvNlZjdGxka1NBU21GcXd5VThnR0FremNpdEYxWXJiN21w?=
 =?utf-8?B?NDlmTTAzNnpqN0U4Vk1YWkszc0lOZ0ZocnYrMGZXOTBuMzBKMVM1ek8rRHh2?=
 =?utf-8?B?ZVRicmpTaVRKV3VteUNjb3JKOE9jSW1HNnQ3eHR2N05vOWEzSkZ1TGtVakJu?=
 =?utf-8?B?MHpZQ0xjTDVaOWc3UTRmVXhuSVh5dmtSWWJBL2c5QUdnKzJ6bndCRXN5Q0p2?=
 =?utf-8?B?VDk4c2FrTzFSc1lsRWdPV00wVkJwelROM3VVS2tHWTA1TXdtajlINUQvbzF6?=
 =?utf-8?B?T0ZSWTVjZ2Y5cjhGZkZWd2dLRlpMUXptTGExamRWTXFta1Z4TXpKZzdJcHYy?=
 =?utf-8?B?VHV3VHBmNGhEeXpib2xrU2FWUk9DWjlLNGQ5b0o3Zm00U3hVSVN5V0s0ejJj?=
 =?utf-8?B?NEpRbVdPT2N2eCs0MTVRNUhPekRRcnhRSG5EU3NSWFhTY09zL1ZBYXh6ZjRU?=
 =?utf-8?B?OGFFY2hZQW53ZkRiMmpTWk5FUzlWdnJNTTZ0Q2dHWnJRNmtSMW55R2FkZ09X?=
 =?utf-8?B?RDhwTThtMVNleHRSRm1PZFp0YVRFV3Y5L0pGcVprYVp5MFhJd2JDT0szWDhy?=
 =?utf-8?B?RzFsaVQzRldmMUE2MlA2S3dnaGV6R3ZBQ1M5VndNcEtjV3ZVNVJQS2draEVF?=
 =?utf-8?B?TVIvMm5sMThSdlZHaTA1cVJhWmZpZTNRWDN2T2twZ2VWa0FKS0JDSE5uMDdJ?=
 =?utf-8?B?YWd5Q0xYZkFGaUozN3BPajVqdjhORWN4NXJlVHFIYzdNM01JdnkyMEJkQUlP?=
 =?utf-8?B?bUlvSXhjNklZOHN1YTl1U21abFl3TW8rTmRKQ1pBMXoxeE5pdThHaDNDei9R?=
 =?utf-8?B?ZUF1OGhkVXc4aDA2Mjk1ajN1VFBWaFhLK3JiUzNZOERoV1NhMmpiejh0Qk5N?=
 =?utf-8?B?MWZ0S0Nwdnp6SkdVQi90NHdkOU5YMTlWRW1EK0MyNGFPNHBjWTNvVDlzcms3?=
 =?utf-8?B?NFN5VXdzL1QrbU1iMnRQeGZqQlN5Zm9IUWpmVVNDZnpORnBobVFTV3FqQ2FD?=
 =?utf-8?B?dE5OcmliNWlOTkd3eUViUjh6S0taUE42M21DUzJWNkgwaXlubWxvTWQvT1l2?=
 =?utf-8?B?RDJOM1FvK3dqRlZ5VXlEelk5Q1pQV05GME8zSmFkcmJJRW50SUlsU1dUeE8v?=
 =?utf-8?B?ZHJxSXpQS3loYWNveGpyV0tmVGlTN0JaM09pbVZlNWlJWFNWZkcyZ3EyaHo1?=
 =?utf-8?B?UXlDdFZCVjJLSVZFQXB2UXJiTkRLbjA5TzRVU0c3NnpkeFIyQm1Od0svVnJt?=
 =?utf-8?B?TkIzVjdsemdtZ3RXSmVYSjhIc1B3TWVkc05Oc2dFam96b2xobUs1UjV0dCtG?=
 =?utf-8?B?QUIxTm80Z2hOMzU2YlljcVk3SFllVHh6K0w2Q2t3dktNRit5Q3NUdTdnTGpx?=
 =?utf-8?B?TVl6SGtlVDNtSE5hcjUxUmVPaTdRb0Z5NVhhK1ZHemhWSjMwaHZFOWVzR2FF?=
 =?utf-8?B?RVdmTVpENExxWmNBc3B4NHB2V1hZa1FSWWhjRk9GMFBYeUFsUVp3YTlyZUV4?=
 =?utf-8?Q?oUNzLtaIgjbda42C+UQ6lMWH6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ad5c94-e18d-4a58-d487-08dbea9e4d79
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 14:29:43.0399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QCtsjJdf4ihDxsmqEz4r6n/NdyRsqFQHyu/dkxcIvFqCMH/EpTbUcVcyDRxfjgS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.11.23 um 09:49 schrieb Karolina Stolarek:
> Test reservation and release of TTM buffer objects. Add tests to check
> pin and unpin operations.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Tested-by: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>

 From the TTM side it looks good, but I can't judge if the lockdep hack 
in the deadlock test is valid or not.

Feel free to add Acked-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

> ---
>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 ++++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |   6 +
>   3 files changed, 626 insertions(+)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> index f570530bbb60..468535f7eed2 100644
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>           ttm_pool_test.o \
>           ttm_resource_test.o \
>           ttm_tt_test.o \
> +        ttm_bo_test.o \
>           ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> new file mode 100644
> index 000000000000..71bca47205ed
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -0,0 +1,619 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <linux/dma-resv.h>
> +#include <linux/kthread.h>
> +#include <linux/delay.h>
> +#include <linux/timer.h>
> +#include <linux/jiffies.h>
> +#include <linux/mutex.h>
> +#include <linux/ww_mutex.h>
> +
> +#include <drm/ttm/ttm_resource.h>
> +#include <drm/ttm/ttm_placement.h>
> +#include <drm/ttm/ttm_tt.h>
> +
> +#include "ttm_kunit_helpers.h"
> +
> +#define BO_SIZE		SZ_8K
> +
> +struct ttm_bo_test_case {
> +	const char *description;
> +	bool interruptible;
> +	bool no_wait;
> +};
> +
> +static const struct ttm_bo_test_case ttm_bo_reserved_cases[] = {
> +	{
> +		.description = "Cannot be interrupted and sleeps",
> +		.interruptible = false,
> +		.no_wait = false,
> +	},
> +	{
> +		.description = "Cannot be interrupted, locks straight away",
> +		.interruptible = false,
> +		.no_wait = true,
> +	},
> +	{
> +		.description = "Can be interrupted, sleeps",
> +		.interruptible = true,
> +		.no_wait = false,
> +	},
> +};
> +
> +static void ttm_bo_init_case_desc(const struct ttm_bo_test_case *t,
> +				  char *desc)
> +{
> +	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(ttm_bo_reserve, ttm_bo_reserved_cases, ttm_bo_init_case_desc);
> +
> +static void ttm_bo_reserve_optimistic_no_ticket(struct kunit *test)
> +{
> +	const struct ttm_bo_test_case *params = test->param_value;
> +	struct ttm_buffer_object *bo;
> +	int err;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	err = ttm_bo_reserve(bo, params->interruptible, params->no_wait, NULL);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	dma_resv_unlock(bo->base.resv);
> +}
> +
> +static void ttm_bo_reserve_locked_no_sleep(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	bool interruptible = false;
> +	bool no_wait = true;
> +	int err;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	/* Let's lock it beforehand */
> +	dma_resv_lock(bo->base.resv, NULL);
> +
> +	err = ttm_bo_reserve(bo, interruptible, no_wait, NULL);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_ASSERT_EQ(test, err, -EBUSY);
> +}
> +
> +static void ttm_bo_reserve_no_wait_ticket(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	struct ww_acquire_ctx ctx;
> +	bool interruptible = false;
> +	bool no_wait = true;
> +	int err;
> +
> +	ww_acquire_init(&ctx, &reservation_ww_class);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
> +	KUNIT_ASSERT_EQ(test, err, -EBUSY);
> +
> +	ww_acquire_fini(&ctx);
> +}
> +
> +static void ttm_bo_reserve_double_resv(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	struct ww_acquire_ctx ctx;
> +	bool interruptible = false;
> +	bool no_wait = false;
> +	int err;
> +
> +	ww_acquire_init(&ctx, &reservation_ww_class);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
> +
> +	dma_resv_unlock(bo->base.resv);
> +	ww_acquire_fini(&ctx);
> +
> +	KUNIT_ASSERT_EQ(test, err, -EALREADY);
> +}
> +
> +/*
> + * A test case heavily inspired by ww_test_edeadlk_normal(). Checks
> + * if -EDEADLK is properly propagated by ttm_bo_reserve()
> + */
> +static void ttm_bo_reserve_deadlock(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo1, *bo2;
> +	struct ww_acquire_ctx ctx1, ctx2;
> +	bool interruptible = false;
> +	bool no_wait = false;
> +	int err;
> +
> +	bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	ww_acquire_init(&ctx1, &reservation_ww_class);
> +	mutex_lock(&bo2->base.resv->lock.base);
> +
> +	/* The deadlock will be caught by WW mutex, don't warn about it */
> +	lock_release(&bo2->base.resv->lock.base.dep_map, 1);
> +
> +	bo2->base.resv->lock.ctx = &ctx2;
> +	ctx2 = ctx1;
> +	ctx2.stamp--; /* Make the context holding the lock younger */
> +
> +	err = ttm_bo_reserve(bo1, interruptible, no_wait, &ctx1);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	err = ttm_bo_reserve(bo2, interruptible, no_wait, &ctx1);
> +	KUNIT_ASSERT_EQ(test, err, -EDEADLK);
> +
> +	dma_resv_unlock(bo1->base.resv);
> +	ww_acquire_fini(&ctx1);
> +}
> +
> +#if IS_BUILTIN(CONFIG_DRM_TTM_KUNIT_TEST)
> +struct signal_timer {
> +	struct timer_list timer;
> +	struct ww_acquire_ctx *ctx;
> +};
> +
> +static void signal_for_ttm_bo_reserve(struct timer_list *t)
> +{
> +	struct signal_timer *s_timer = from_timer(s_timer, t, timer);
> +	struct task_struct *task = s_timer->ctx->task;
> +
> +	do_send_sig_info(SIGTERM, SEND_SIG_PRIV, task, PIDTYPE_PID);
> +}
> +
> +static int threaded_ttm_bo_reserve(void *arg)
> +{
> +	struct ttm_buffer_object *bo = arg;
> +	struct signal_timer s_timer;
> +	struct ww_acquire_ctx ctx;
> +	bool interruptible = true;
> +	bool no_wait = false;
> +	int err;
> +
> +	ww_acquire_init(&ctx, &reservation_ww_class);
> +
> +	/* Prepare a signal that will interrupt the reservation attempt */
> +	timer_setup_on_stack(&s_timer.timer, &signal_for_ttm_bo_reserve, 0);
> +	s_timer.ctx = &ctx;
> +
> +	mod_timer(&s_timer.timer, msecs_to_jiffies(100));
> +
> +	err = ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
> +
> +	timer_delete_sync(&s_timer.timer);
> +	destroy_timer_on_stack(&s_timer.timer);
> +
> +	ww_acquire_fini(&ctx);
> +
> +	return err;
> +}
> +
> +static void ttm_bo_reserve_interrupted(struct kunit *test)
> +{
> +	struct ttm_buffer_object *bo;
> +	struct task_struct *task;
> +	int err;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	task = kthread_create(threaded_ttm_bo_reserve, bo, "ttm-bo-reserve");
> +
> +	if (IS_ERR(task))
> +		KUNIT_FAIL(test, "Couldn't create ttm bo reserve task\n");
> +
> +	/* Take a lock so the threaded reserve has to wait */
> +	mutex_lock(&bo->base.resv->lock.base);
> +
> +	wake_up_process(task);
> +	msleep(20);
> +	err = kthread_stop(task);
> +
> +	mutex_unlock(&bo->base.resv->lock.base);
> +
> +	KUNIT_ASSERT_EQ(test, err, -ERESTARTSYS);
> +}
> +#endif /* IS_BUILTIN(CONFIG_DRM_TTM_KUNIT_TEST) */
> +
> +static void ttm_bo_unreserve_basic(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_device *ttm_dev;
> +	struct ttm_resource *res1, *res2;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +	unsigned int bo_prio = TTM_MAX_BO_PRIORITY - 1;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	int err;
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	priv->ttm_dev = ttm_dev;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo->priority = bo_prio;
> +
> +	err = ttm_resource_alloc(bo, place, &res1);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	bo->resource = res1;
> +
> +	/* Add a dummy resource to populate LRU */
> +	ttm_resource_alloc(bo, place, &res2);
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	ttm_bo_unreserve(bo);
> +
> +	man = ttm_manager_type(priv->ttm_dev, mem_type);
> +	KUNIT_ASSERT_EQ(test,
> +			list_is_last(&res1->lru, &man->lru[bo->priority]), 1);
> +
> +	ttm_resource_free(bo, &res2);
> +	ttm_resource_free(bo, &res1);
> +}
> +
> +static void ttm_bo_unreserve_pinned(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_device *ttm_dev;
> +	struct ttm_resource *res1, *res2;
> +	struct ttm_place *place;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	int err;
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	priv->ttm_dev = ttm_dev;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	ttm_bo_pin(bo);
> +
> +	err = ttm_resource_alloc(bo, place, &res1);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	bo->resource = res1;
> +
> +	/* Add a dummy resource to the pinned list */
> +	err = ttm_resource_alloc(bo, place, &res2);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	KUNIT_ASSERT_EQ(test,
> +			list_is_last(&res2->lru, &priv->ttm_dev->pinned), 1);
> +
> +	ttm_bo_unreserve(bo);
> +	KUNIT_ASSERT_EQ(test,
> +			list_is_last(&res1->lru, &priv->ttm_dev->pinned), 1);
> +
> +	ttm_resource_free(bo, &res1);
> +	ttm_resource_free(bo, &res2);
> +}
> +
> +static void ttm_bo_unreserve_bulk(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_lru_bulk_move lru_bulk_move;
> +	struct ttm_lru_bulk_move_pos *pos;
> +	struct ttm_buffer_object *bo1, *bo2;
> +	struct ttm_resource *res1, *res2;
> +	struct ttm_device *ttm_dev;
> +	struct ttm_place *place;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	unsigned int bo_priority = 0;
> +	int err;
> +
> +	ttm_lru_bulk_move_init(&lru_bulk_move);
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	priv->ttm_dev = ttm_dev;
> +
> +	bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	dma_resv_lock(bo1->base.resv, NULL);
> +	ttm_bo_set_bulk_move(bo1, &lru_bulk_move);
> +	dma_resv_unlock(bo1->base.resv);
> +
> +	err = ttm_resource_alloc(bo1, place, &res1);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	bo1->resource = res1;
> +
> +	dma_resv_lock(bo2->base.resv, NULL);
> +	ttm_bo_set_bulk_move(bo2, &lru_bulk_move);
> +	dma_resv_unlock(bo2->base.resv);
> +
> +	err = ttm_resource_alloc(bo2, place, &res2);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	bo2->resource = res2;
> +
> +	ttm_bo_reserve(bo1, false, false, NULL);
> +	ttm_bo_unreserve(bo1);
> +
> +	pos = &lru_bulk_move.pos[mem_type][bo_priority];
> +	KUNIT_ASSERT_PTR_EQ(test, res1, pos->last);
> +
> +	ttm_resource_free(bo1, &res1);
> +	ttm_resource_free(bo2, &res2);
> +}
> +
> +static void ttm_bo_put_basic(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_resource *res;
> +	struct ttm_device *ttm_dev;
> +	struct ttm_place *place;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	int err;
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	priv->ttm_dev = ttm_dev;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo->type = ttm_bo_type_device;
> +
> +	err = ttm_resource_alloc(bo, place, &res);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	bo->resource = res;
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	err = ttm_tt_create(bo, false);
> +	dma_resv_unlock(bo->base.resv);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	ttm_bo_put(bo);
> +}
> +
> +static const char *mock_name(struct dma_fence *f)
> +{
> +	return "kunit-ttm-bo-put";
> +}
> +
> +static const struct dma_fence_ops mock_fence_ops = {
> +	.get_driver_name = mock_name,
> +	.get_timeline_name = mock_name,
> +};
> +
> +static void ttm_bo_put_shared_resv(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct dma_resv *external_resv;
> +	struct dma_fence *fence;
> +	/* A dummy DMA fence lock */
> +	spinlock_t fence_lock;
> +	struct ttm_device *ttm_dev;
> +	int err;
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	priv->ttm_dev = ttm_dev;
> +
> +	external_resv = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, external_resv);
> +
> +	dma_resv_init(external_resv);
> +
> +	fence = kunit_kzalloc(test, sizeof(*fence), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, fence);
> +
> +	spin_lock_init(&fence_lock);
> +	dma_fence_init(fence, &mock_fence_ops, &fence_lock, 0, 0);
> +
> +	dma_resv_lock(external_resv, NULL);
> +	dma_resv_reserve_fences(external_resv, 1);
> +	dma_resv_add_fence(external_resv, fence, DMA_RESV_USAGE_BOOKKEEP);
> +	dma_resv_unlock(external_resv);
> +
> +	dma_fence_signal(fence);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo->type = ttm_bo_type_device;
> +	bo->base.resv = external_resv;
> +
> +	ttm_bo_put(bo);
> +}
> +
> +static void ttm_bo_pin_basic(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_device *ttm_dev;
> +	unsigned int no_pins = 3;
> +	int err;
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	priv->ttm_dev = ttm_dev;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	for (int i = 0; i < no_pins; i++) {
> +		dma_resv_lock(bo->base.resv, NULL);
> +		ttm_bo_pin(bo);
> +		dma_resv_unlock(bo->base.resv);
> +	}
> +
> +	KUNIT_ASSERT_EQ(test, bo->pin_count, no_pins);
> +}
> +
> +static void ttm_bo_pin_unpin_resource(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_lru_bulk_move lru_bulk_move;
> +	struct ttm_lru_bulk_move_pos *pos;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_resource *res;
> +	struct ttm_device *ttm_dev;
> +	struct ttm_place *place;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	unsigned int bo_priority = 0;
> +	int err;
> +
> +	ttm_lru_bulk_move_init(&lru_bulk_move);
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	priv->ttm_dev = ttm_dev;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	err = ttm_resource_alloc(bo, place, &res);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	bo->resource = res;
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	ttm_bo_set_bulk_move(bo, &lru_bulk_move);
> +	ttm_bo_pin(bo);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	pos = &lru_bulk_move.pos[mem_type][bo_priority];
> +
> +	KUNIT_ASSERT_EQ(test, bo->pin_count, 1);
> +	KUNIT_ASSERT_NULL(test, pos->first);
> +	KUNIT_ASSERT_NULL(test, pos->last);
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	ttm_bo_unpin(bo);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_ASSERT_PTR_EQ(test, res, pos->last);
> +	KUNIT_ASSERT_EQ(test, bo->pin_count, 0);
> +
> +	ttm_resource_free(bo, &res);
> +}
> +
> +static void ttm_bo_multiple_pin_one_unpin(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_lru_bulk_move lru_bulk_move;
> +	struct ttm_lru_bulk_move_pos *pos;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_resource *res;
> +	struct ttm_device *ttm_dev;
> +	struct ttm_place *place;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	unsigned int bo_priority = 0;
> +	int err;
> +
> +	ttm_lru_bulk_move_init(&lru_bulk_move);
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	priv->ttm_dev = ttm_dev;
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +
> +	err = ttm_resource_alloc(bo, place, &res);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	bo->resource = res;
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	ttm_bo_set_bulk_move(bo, &lru_bulk_move);
> +
> +	/* Multiple pins */
> +	ttm_bo_pin(bo);
> +	ttm_bo_pin(bo);
> +
> +	dma_resv_unlock(bo->base.resv);
> +
> +	pos = &lru_bulk_move.pos[mem_type][bo_priority];
> +
> +	KUNIT_ASSERT_EQ(test, bo->pin_count, 2);
> +	KUNIT_ASSERT_NULL(test, pos->first);
> +	KUNIT_ASSERT_NULL(test, pos->last);
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	ttm_bo_unpin(bo);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_ASSERT_EQ(test, bo->pin_count, 1);
> +	KUNIT_ASSERT_NULL(test, pos->first);
> +	KUNIT_ASSERT_NULL(test, pos->last);
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	ttm_bo_unpin(bo);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	ttm_resource_free(bo, &res);
> +}
> +
> +static struct kunit_case ttm_bo_test_cases[] = {
> +	KUNIT_CASE_PARAM(ttm_bo_reserve_optimistic_no_ticket,
> +			 ttm_bo_reserve_gen_params),
> +	KUNIT_CASE(ttm_bo_reserve_locked_no_sleep),
> +	KUNIT_CASE(ttm_bo_reserve_no_wait_ticket),
> +	KUNIT_CASE(ttm_bo_reserve_double_resv),
> +#if IS_BUILTIN(CONFIG_DRM_TTM_KUNIT_TEST)
> +	KUNIT_CASE(ttm_bo_reserve_interrupted),
> +#endif
> +	KUNIT_CASE(ttm_bo_reserve_deadlock),
> +	KUNIT_CASE(ttm_bo_unreserve_basic),
> +	KUNIT_CASE(ttm_bo_unreserve_pinned),
> +	KUNIT_CASE(ttm_bo_unreserve_bulk),
> +	KUNIT_CASE(ttm_bo_put_basic),
> +	KUNIT_CASE(ttm_bo_put_shared_resv),
> +	KUNIT_CASE(ttm_bo_pin_basic),
> +	KUNIT_CASE(ttm_bo_pin_unpin_resource),
> +	KUNIT_CASE(ttm_bo_multiple_pin_one_unpin),
> +	{}
> +};
> +
> +static struct kunit_suite ttm_bo_test_suite = {
> +	.name = "ttm_bo",
> +	.init = ttm_test_devices_init,
> +	.exit = ttm_test_devices_fini,
> +	.test_cases = ttm_bo_test_cases,
> +};
> +
> +kunit_test_suites(&ttm_bo_test_suite);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index ba4e5c689164..7b7c1fa805fc 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -22,6 +22,10 @@ static void ttm_tt_simple_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>   	kfree(ttm);
>   }
>   
> +static void dummy_ttm_bo_destroy(struct ttm_buffer_object *bo)
> +{
> +}
> +
>   struct ttm_device_funcs ttm_dev_funcs = {
>   	.ttm_tt_create = ttm_tt_simple_create,
>   	.ttm_tt_destroy = ttm_tt_simple_destroy,
> @@ -61,6 +65,8 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   
>   	bo->bdev = devs->ttm_dev;
> +	bo->destroy = dummy_ttm_bo_destroy;
> +
>   	kref_init(&bo->kref);
>   
>   	return bo;

