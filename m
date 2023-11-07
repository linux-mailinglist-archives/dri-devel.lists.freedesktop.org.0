Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9307E37F1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 10:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4ED10E12E;
	Tue,  7 Nov 2023 09:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E068F10E12E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 09:35:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTktqRt1FSCps2aTLB1cX+Zzjsf72gjRbS0KNyDqDVdg1gvih9xmaIQOxoR0geoS+906qKdvVPzb24cWkXtCMn0pC0ea/FiRYhkLrgYUr2NJmqWNwe7F0hwDEGFOzroUnWdQxbknFJMy1THftP3Aim6p7Egagwxlmr9T6qD2nHDCTmeHKNx6mLMDsSalOoX6kp3rCAApzewBCoDn0UFGIglmHQpgZw2g/evwx+as1pucWckVD4rBbi/ZuqNdN1/FKsG6kaZ84ADUsMuEufbnswFCEZPHAsGUjIPJ7i/9zQrceSRtV493AyuK+Kjh+3d1n4H+5XU7wk32NRbmLh4Z1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3Y3eM0DoS3B7SAwT/UeA0x2MekzTBwfeSpajKiv5bk=;
 b=CZw+Ylw1ee02Qe2iKLi9XQJmzBBEwjE/TM4P6zqJmjkoGiK3VuXvKSUh2PDrb6DB/kxZp/B+AxJKDrd6XBwfzQrxcmGJ8KEWGpKdDIaPbmuBovewJEvIWxL9z1btBVEZzAIampvel7f1gX1Zcb9S5Rrd1yBoErLtK3vatLEyPEyhAQMDZMQvBKK69ZJGfrUWmv697OlCCaDMxpzox2bB4aB4lspQAh6QvAmzNd4iFsjw5QYxEJcs0MX6VEPeC6UMh8N1hSRoun1HMWtKCmLCBVo0xzy2051Dp7T2vhsb6OdWcTukFzAzFbZYe7URiwl7SCTOO6C70T5M8EJ1r+r93Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3Y3eM0DoS3B7SAwT/UeA0x2MekzTBwfeSpajKiv5bk=;
 b=3zEUxVz3L2fEiZLkpYMucHRD7H5Ics9t1CuHoIA2Ra/nWnhvXTI6obRg4hHVLbEvOKDHTnYIZTp+ZkX/XAw5DDuMi9UANhb/OS02529SKCQt0332bhZxfJMqq6fWW8PLy1x9ltEU8BT652puBMHLkkTewwGK2VMjgMbTYR5GQ5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB8606.namprd12.prod.outlook.com (2603:10b6:510:1ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 09:35:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 09:35:04 +0000
Message-ID: <727ee5c8-f6ed-416c-8561-1c2eb43a7192@amd.com>
Date: Tue, 7 Nov 2023 10:34:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/ttm/tests: Add tests for ttm_resource and
 ttm_sys_man
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1697445193.git.karolina.stolarek@intel.com>
 <eee845622930bbd02ded1b9c39531bfb86af690e.1697445193.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <eee845622930bbd02ded1b9c39531bfb86af690e.1697445193.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5551f2-42f2-480e-760c-08dbdf74d1bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DsuG7M1ublQT3biH2UJveShZ7BoT7QLslTadXQMISanqo0QaLA9Js+cspM38uMy0GtMZJ3RntLG/VWw2M9gZg0fjvtEJqmsfVZcRryx2SWaEnkR5VmSxyc8BFIIbO+EDPvJvn6qupexdoZvv9XgADdx/RbGgNz9gAtRnWE6JMkQFNM0VMthjv/50NUv3OICK23Vyqi/goS0tzcv8tdhuBZUjedVe9ZOh2sFjvN8F1QcEItFtS3ZFOY4nAhUEr5woWAH039Icv5PsG9gTeHTEkzz613idICicMnb+8s/rWCSyrQTumo9+CcRoXvV6W68AGYKd/XH+TIJanYBmaLqGFnjIbAO80WYKGeDUYcIehXeUM0o/oUlGFJHJNz0Ce0Aml3687pKvzXq1wSQWbMlwy0iSjn0/a/6LCg2OPhBcF5fyeT5ubQ/GIdwMxFq+62iAV4YLxvP334L8mhDiMClGYDMJWjkZujM2OXrfz/LvhRZU99rikH0lUkxe9RSAOGXdjT9PIIAjOw/jsMwL83cAOYlJv3Eaf4Svu0nY/LsFbAggizYcdiirhWKaIEhKDFlTlH1ijDejEcQS/h5dfFhouCvqi+KB3CQzJgyXYGwVPHi1o2BnhzXJNQ2vn65uWGN8X2J3ctTDmTbC46WAxW4JPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(41300700001)(478600001)(6512007)(6506007)(2616005)(6486002)(6666004)(83380400001)(8676002)(8936002)(4326008)(316002)(2906002)(30864003)(5660300002)(66476007)(26005)(66556008)(66946007)(38100700002)(31686004)(86362001)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3lKRlpvZ3RSZ3NxUUJLTURjZ2x1bVlmcWFtZkhpKy85dVk5SmNMd3p5aXpK?=
 =?utf-8?B?dTFwckVCUWUxOGFRZk14UDlLT3FRMURTWVFhWk1PQmg1WGs4OXdreUNDc3BF?=
 =?utf-8?B?M0hRcDc5Ym1ubkV4WllqZlBodnZOQzZjWnJhRksrZGZWUEtvWXA3RHhKWUw2?=
 =?utf-8?B?ZSttUEtldjZYUURKQVJWcDE1MnF5WWhXMzRZYmtENXdtZEFLVE5Ybkp3Zjlz?=
 =?utf-8?B?MmpPL205VGlqTWxEZ2FoRXRyamRDYWJtVUhxdFFtTjBKc0o2aDhWVHJkL29D?=
 =?utf-8?B?NmZNZGR3dWhXTWpZN0lyR1BXS3hJM0M0MkFyVGtXZ0JRcnozUzJHMlpsNEk3?=
 =?utf-8?B?djlSS3lvdE9JRGZPMjcxbVE1Sk52U0VoMXhhNllGNXpZOFZ2UmdEajl3b1c0?=
 =?utf-8?B?MnU4RHN1K1pHTjczOSt1MFlzL1Rld0Y1SmowTlRKMGFoOW90Qk1BNDZ0bTh2?=
 =?utf-8?B?YkdoUFVqZHM4TlF0aU51MGc2d2M3N3ZFVS95dHRvaHFYSFN1citsbUZvQjFi?=
 =?utf-8?B?a1F4cHlSOXE5M2JUa0NHY2ZOVzZkZmVjb0pGbUIycERmYVVuQ3BVUWc1em5L?=
 =?utf-8?B?djFtMDB6NERaTWF0MFBGNHpxZkxrOHc1bVZ1bHMvelpjUFh2YjVtSlBEWk52?=
 =?utf-8?B?NDlCY3NnUFRwZ3hENlpueFBrMWdzcTJNOEs5M1V1QWU1MExTdTEvVVlRZ1Rz?=
 =?utf-8?B?bzRqZWpmbExyS2FCSHg4cGtta3NxVDl1ZVlteVBxTWFKeWNOVUVCWHVUMGZj?=
 =?utf-8?B?V2E1eEhqekRFcUFGQkZrVE9xTldTd1FFWVpWbzJuY21QTWxRV1BZRTVpQURa?=
 =?utf-8?B?NVo0QTdtRkMwTC8zSVhxNnRWRmNFeWdldDloUFhjY1JYejBBbzdBQ1VPSW1G?=
 =?utf-8?B?OGR0VTVMdnI1ZU5pZEF2bFFqZGVuQzBMMGJ6eXdDWUd5Rmt1S092VkVlL0Jj?=
 =?utf-8?B?dnVOVWFPdkxQVkYvUFNGSUt3N0FZVmdncCsxWXZmc3J5cWdIVnR4UlRZZ1NM?=
 =?utf-8?B?NWhiemJwc213SStURGN3c1BTb1lCTWZmd29IYWtsSzlpcURzZzdlS3RrSERM?=
 =?utf-8?B?RDVVcjVSTDR3cG5tYkkraG15TXdUZk5nL3lKSmRBbFdrdXBaaHRBcFdzY1ZH?=
 =?utf-8?B?dGZrUVdZdDJSQlM4NHEvZkRtTWd1bkNLODRJQVU3RUp1eFZmMEhyYTFFcEY0?=
 =?utf-8?B?Rzd1di91L2dRTG5CQ1VQR3VmYzEwZW1OWjEvQjh6RFBnV2pPS252bUFTRVA4?=
 =?utf-8?B?Vk55d2hiQjNwcVlZZU1nT01tNFdPYVc0RzBMcStWWVMwWEtRLzk1SDhvL3J0?=
 =?utf-8?B?THlSZlRlY0ZVT21BU29BdnNvUm1ybkdpWWd5TDBCNmpkVVpCQ0lUVkJETjN4?=
 =?utf-8?B?dzdBNEJHU1RRcUVaSkRxVnZtc0NWMm9hRzltOU5HNXYyY0xVUkcrODk1LzFY?=
 =?utf-8?B?RU1jd25zMkhVZSt1cGltVHVHbHB5VGhheDFJL2N5RVJYaWE1bDA4VlcyeUFs?=
 =?utf-8?B?VGYzaHVhaFRnaWk0cEhHc1FLSTI1ZFVaWEE3RjlGZmlVcHRqNWxxMFZpUFlB?=
 =?utf-8?B?dWZvV0RWL2pHc0JZdzZCV1doYytyd3hON3JiVUZUQUZGUHNNU0JVTGt5TFh5?=
 =?utf-8?B?ZnJ4ZExSYlptVGpIVFBCMHU0TDhMblRqUzloZEgyWS81RSt2amR2cERXclBt?=
 =?utf-8?B?MkFsVDBPK201UDFjS3J1TEJGMWY2QnRGb0pLU0hQTnBxb2VGaGorM2IrYUFG?=
 =?utf-8?B?ZzdWaG1lSmFsK01PZk1BV0hRM0lCODNDd1M1a2hwcmpvbDVxZUE1ZEVXRFBN?=
 =?utf-8?B?TXFIM1RWV1QzU08xQkZPR2k1dUVHMHo3ZjJPMkh3WnBxVS96ZlpGODRKekJR?=
 =?utf-8?B?OTlWRUZCQm5nR0E2UFhSWUJuNGpqR096Qk9MNXlGaGh1clIySmpublVUaGRP?=
 =?utf-8?B?bEh1aHBGOFB3MnFBL0R3dTNLM09nQVkrbWJJK3Njb3BRZnVNMk5EdWMvbTdL?=
 =?utf-8?B?NXlQd0NDeWpjaHd5eXRuTndLYzR5eS83d1Z2V08xdGJoRUtTRmtNRTBGWHpt?=
 =?utf-8?B?VEk3NkZPMXdQZ3o0cEhjd2JxZk1LbytYNW1QYWIrYUxLUGlZQWpYWi96cGhM?=
 =?utf-8?Q?I2VPAy6ClCrH8hhSuOUevk5ZK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5551f2-42f2-480e-760c-08dbdf74d1bb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 09:35:03.3197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOixuloTV5Mpk1wlay7bTjkC+mgh1LqqQMT12PcdpyzTa0cZvpEZYZsqxmZQnnnM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8606
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
> Test initialization of ttm_resource using different memory domains.
> Add tests for a system memory manager and functions that can be
> tested without a fully-featured resource manager. Update
> ttm_bo_kunit_init() to initialize BO's kref and a genuine GEM drm
> object. Export ttm_resource_alloc for test purposes only.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  25 +-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++++++++++
>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>   5 files changed, 367 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> index ec87c4fc1ad5..c92fe2052ef6 100644
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -3,4 +3,5 @@
>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>           ttm_device_test.o \
>           ttm_pool_test.o \
> +        ttm_resource_test.o \
>           ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index 81661d8827aa..c605f010ea08 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -29,19 +29,42 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>   					    struct ttm_test_devices *devs,
>   					    size_t size)
>   {
> -	struct drm_gem_object gem_obj = { .size = size };
> +	struct drm_gem_object gem_obj = { };
>   	struct ttm_buffer_object *bo;
> +	int err;
>   
>   	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, bo);
>   
>   	bo->base = gem_obj;
> +	err = drm_gem_object_init(devs->drm, &bo->base, size);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
>   	bo->bdev = devs->ttm_dev;
> +	kref_init(&bo->kref);
>   
>   	return bo;
>   }
>   EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
>   
> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
> +				       uint32_t mem_type, uint32_t flags,
> +				       size_t size)
> +{
> +	struct ttm_place *place;
> +
> +	place = kunit_kzalloc(test, sizeof(*place), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, place);
> +
> +	place->mem_type = mem_type;
> +	place->flags = flags;
> +	place->fpfn = size >> PAGE_SHIFT;
> +	place->lpfn = place->fpfn + (size >> PAGE_SHIFT);

What should that be good for here? Just to test fpfn and lpfn functionality?

If yes then I think that would be better in the test case and not the 
helper.

Apart from that looks good of hand.

Regards,
Christian.

> +
> +	return place;
> +}
> +EXPORT_SYMBOL_GPL(ttm_place_kunit_init);
> +
>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
>   {
>   	struct ttm_test_devices *devs;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index e261e3660d0b..f38140f93c05 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -8,6 +8,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/ttm/ttm_device.h>
>   #include <drm/ttm/ttm_bo.h>
> +#include <drm/ttm/ttm_placement.h>
>   
>   #include <drm/drm_kunit_helpers.h>
>   #include <kunit/test.h>
> @@ -28,6 +29,9 @@ int ttm_device_kunit_init(struct ttm_test_devices *priv,
>   struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>   					    struct ttm_test_devices *devs,
>   					    size_t size);
> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
> +				       uint32_t mem_type, uint32_t flags,
> +				       size_t size);
>   
>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
>   struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> new file mode 100644
> index 000000000000..851cdc43dc37
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <drm/ttm/ttm_resource.h>
> +
> +#include "ttm_kunit_helpers.h"
> +
> +#define RES_SIZE		SZ_4K
> +#define TTM_PRIV_DUMMY_REG	(TTM_NUM_MEM_TYPES - 1)
> +
> +struct ttm_resource_test_case {
> +	const char *description;
> +	uint32_t mem_type;
> +	uint32_t flags;
> +};
> +
> +struct ttm_resource_test_priv {
> +	struct ttm_test_devices *devs;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +};
> +
> +static const struct ttm_resource_manager_func ttm_resource_manager_mock_funcs = { };
> +
> +static int ttm_resource_test_init(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv;
> +
> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	priv->devs = ttm_test_devices_all(test);
> +	KUNIT_ASSERT_NOT_NULL(test, priv->devs);
> +
> +	test->priv = priv;
> +
> +	return 0;
> +}
> +
> +static void ttm_resource_test_fini(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +
> +	ttm_test_devices_put(test, priv->devs);
> +}
> +
> +static void ttm_init_test_mocks(struct kunit *test,
> +				struct ttm_resource_test_priv *priv,
> +				uint32_t mem_type, uint32_t flags)
> +{
> +	size_t size = RES_SIZE;
> +
> +	/* Make sure we have what we need for a good BO mock */
> +	KUNIT_ASSERT_NOT_NULL(test, priv->devs->ttm_dev);
> +
> +	priv->bo = ttm_bo_kunit_init(test, priv->devs, size);
> +	priv->place = ttm_place_kunit_init(test, mem_type, flags, size);
> +}
> +
> +static void ttm_init_test_manager(struct kunit *test,
> +				  struct ttm_resource_test_priv *priv,
> +				  uint32_t mem_type)
> +{
> +	struct ttm_device *ttm_dev = priv->devs->ttm_dev;
> +	struct ttm_resource_manager *man;
> +	size_t size = SZ_16K;
> +
> +	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, man);
> +
> +	man->use_tt = false;
> +	man->func = &ttm_resource_manager_mock_funcs;
> +
> +	ttm_resource_manager_init(man, ttm_dev, size);
> +	ttm_set_driver_manager(ttm_dev, mem_type, man);
> +	ttm_resource_manager_set_used(man, true);
> +}
> +
> +static const struct ttm_resource_test_case ttm_resource_cases[] = {
> +	{
> +		.description = "Init resource in TTM_PL_SYSTEM",
> +		.mem_type = TTM_PL_SYSTEM,
> +	},
> +	{
> +		.description = "Init resource in TTM_PL_VRAM",
> +		.mem_type = TTM_PL_VRAM,
> +	},
> +	{
> +		.description = "Init resource in a private placement",
> +		.mem_type = TTM_PRIV_DUMMY_REG,
> +	},
> +	{
> +		.description = "Init resource in TTM_PL_SYSTEM, set placement flags",
> +		.mem_type = TTM_PL_SYSTEM,
> +		.flags = TTM_PL_FLAG_TOPDOWN,
> +	},
> +};
> +
> +static void ttm_resource_case_desc(const struct ttm_resource_test_case *t, char *desc)
> +{
> +	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(ttm_resource, ttm_resource_cases, ttm_resource_case_desc);
> +
> +static void ttm_resource_init_basic(struct kunit *test)
> +{
> +	const struct ttm_resource_test_case *params = test->param_value;
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource *res;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +	uint64_t expected_usage;
> +
> +	ttm_init_test_mocks(test, priv, params->mem_type, params->flags);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	if (params->mem_type > TTM_PL_SYSTEM)
> +		ttm_init_test_manager(test, priv, params->mem_type);
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
> +	expected_usage = man->usage + RES_SIZE;
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
> +
> +	ttm_resource_init(bo, place, res);
> +
> +	KUNIT_ASSERT_EQ(test, res->start, 0);
> +	KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
> +	KUNIT_ASSERT_EQ(test, res->mem_type, place->mem_type);
> +	KUNIT_ASSERT_EQ(test, res->placement, place->flags);
> +	KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
> +
> +	KUNIT_ASSERT_NULL(test, res->bus.addr);
> +	KUNIT_ASSERT_EQ(test, res->bus.offset, 0);
> +	KUNIT_ASSERT_FALSE(test, res->bus.is_iomem);
> +	KUNIT_ASSERT_EQ(test, res->bus.caching, ttm_cached);
> +	KUNIT_ASSERT_EQ(test, man->usage, expected_usage);
> +
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo->priority]));
> +
> +	ttm_resource_fini(man, res);
> +}
> +
> +static void ttm_resource_init_pinned(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource *res;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +
> +	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	ttm_bo_pin(bo);
> +	ttm_resource_init(bo, place, res);
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
> +
> +	ttm_bo_unpin(bo);
> +	ttm_resource_fini(man, res);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
> +}
> +
> +static void ttm_resource_fini_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource *res;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +
> +	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +	ttm_resource_init(bo, place, res);
> +	ttm_resource_fini(man, res);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
> +	KUNIT_ASSERT_EQ(test, man->usage, 0);
> +}
> +
> +static void ttm_resource_manager_init_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource_manager *man;
> +	size_t size = SZ_16K;
> +
> +	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, man);
> +
> +	ttm_resource_manager_init(man, priv->devs->ttm_dev, size);
> +
> +	KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
> +	KUNIT_ASSERT_EQ(test, man->size, size);
> +	KUNIT_ASSERT_EQ(test, man->usage, 0);
> +	KUNIT_ASSERT_NULL(test, man->move);
> +	KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
> +
> +	for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
> +		KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
> +}
> +
> +static void ttm_resource_manager_usage_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource *res;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +	uint64_t actual_usage;
> +
> +	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, TTM_PL_FLAG_TOPDOWN);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
> +
> +	ttm_resource_init(bo, place, res);
> +	actual_usage = ttm_resource_manager_usage(man);
> +
> +	KUNIT_ASSERT_EQ(test, actual_usage, RES_SIZE);
> +
> +	ttm_resource_fini(man, res);
> +}
> +
> +static void ttm_resource_manager_set_used_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource_manager *man;
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, TTM_PL_SYSTEM);
> +	KUNIT_ASSERT_TRUE(test, man->use_type);
> +
> +	ttm_resource_manager_set_used(man, false);
> +	KUNIT_ASSERT_FALSE(test, man->use_type);
> +}
> +
> +static void ttm_sys_man_alloc_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource_manager *man;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource *res;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	int ret;
> +
> +	ttm_init_test_mocks(test, priv, mem_type, 0);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
> +	ret = man->func->alloc(man, bo, place, &res);
> +
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
> +	KUNIT_ASSERT_EQ(test, res->mem_type, mem_type);
> +	KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
> +
> +	ttm_resource_fini(man, res);
> +}
> +
> +static void ttm_sys_man_free_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource_manager *man;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource *res;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +
> +	ttm_init_test_mocks(test, priv, mem_type, 0);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +	ttm_resource_alloc(bo, place, &res);
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
> +	man->func->free(man, res);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
> +	KUNIT_ASSERT_EQ(test, man->usage, 0);
> +}
> +
> +static struct kunit_case ttm_resource_test_cases[] = {
> +	KUNIT_CASE_PARAM(ttm_resource_init_basic, ttm_resource_gen_params),
> +	KUNIT_CASE(ttm_resource_init_pinned),
> +	KUNIT_CASE(ttm_resource_fini_basic),
> +	KUNIT_CASE(ttm_resource_manager_init_basic),
> +	KUNIT_CASE(ttm_resource_manager_usage_basic),
> +	KUNIT_CASE(ttm_resource_manager_set_used_basic),
> +	KUNIT_CASE(ttm_sys_man_alloc_basic),
> +	KUNIT_CASE(ttm_sys_man_free_basic),
> +	{}
> +};
> +
> +static struct kunit_suite ttm_resource_test_suite = {
> +	.name = "ttm_resource",
> +	.init = ttm_resource_test_init,
> +	.exit = ttm_resource_test_fini,
> +	.test_cases = ttm_resource_test_cases,
> +};
> +
> +kunit_test_suites(&ttm_resource_test_suite);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 46ff9c75bb12..02b96d23fdb9 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -30,6 +30,8 @@
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/ttm/ttm_resource.h>
>   
> +#include <drm/drm_util.h>
> +
>   /**
>    * ttm_lru_bulk_move_init - initialize a bulk move structure
>    * @bulk: the structure to init
> @@ -240,6 +242,7 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   	spin_unlock(&bo->bdev->lru_lock);
>   	return 0;
>   }
> +EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_resource_alloc);
>   
>   void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
>   {

