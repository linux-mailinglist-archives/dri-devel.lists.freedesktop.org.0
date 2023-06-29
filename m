Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D6F742304
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 11:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0BB10E09E;
	Thu, 29 Jun 2023 09:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2055.outbound.protection.outlook.com [40.107.101.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C574F10E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 09:14:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlDTC7v+pNOlpE4uX13LAiHFw+cMeJigNBImXGvL43J4or6Pac0VNRAuoI4JfsckjTE9RF4troAxrSC5eKwtqtsXkZq+Mcy2VMjoieP+1Wz6B/AMzJYkLOBWGzTGLUoEVQ3cq6ZXZdS2CHEJ7M+UpPJWGr4Gbqnr/s2uP/OVGWbr28DbrejP5aJcRudP0ue1WTdGINVHPl0+TZui9tr6wP0KFKYPtN1aFjWGSr7ZjMPymncuoKR6MLJSunel6S2j5b+1go7Xo9fxP5Twjy6/C9Sn8jdQIQsLGT3FQtZoHXon38mjMSzyVPlBD+kk52IpFU+FA4nEsGI+Y5DxdWlp0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOd5WnGmoRjVYBLjUhva4/BtzdZ8cIt5Sd2/p0aMigE=;
 b=QHcXpwvUi0URg+9YoY0zjc2T94d2OWt/Sss278sKqnwYEjMSDyb/H2/sdhTvXmCE6a9a8QiKtaRnYEQztXtvJtBg+xzFPaBJx7pEMBSt9BVOTFSwaa1pZ3IhdPOCTwATC7wCt2nfd09cWVjAJ8QQjyAws+fEjqJeHHTI6G7N1lzcliMNaAXr5HrKnx6ATBHf+nvtCmVF0DRtCfWZOzb20zcaRZQ71WIO4/MPdv5ybF2UQ92K70MaoBavbozef8TOKiTCVRZ0k4L9e6ZgvfP5MqpIFt2j/3rxKLffugDZyf61d5E+nqTMec0Z/1kOTIjcb9hkO0GEQ4guWqfzRx580g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOd5WnGmoRjVYBLjUhva4/BtzdZ8cIt5Sd2/p0aMigE=;
 b=pFqaz16iC8dmKz9buu7/CbJe4LJkjERrOIi+SB4sge5nK/0Lhr5FT/NpPSq7DKKDsmKRum17edWbVfhoyEXpuYtPZHjC+wAH/oieH5XJ1S+tCrt3m49boN28MhO6F6UszwCry+qvR6n8SfUjB/PsEIgHKhwLzqEDaN1ir3rh0HQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB6990.namprd12.prod.outlook.com (2603:10b6:a03:449::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 09:14:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 09:14:41 +0000
Message-ID: <9d3eecae-eaf9-ce70-c253-1ae14619c9d6@amd.com>
Date: Thu, 29 Jun 2023 11:14:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC v2 2/3] drm/ttm/tests: Add tests for ttm_device
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1687779215.git.karolina.stolarek@intel.com>
 <6e0703484cec48f56fb8056b7afefa019ed3d5d3.1687779215.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <6e0703484cec48f56fb8056b7afefa019ed3d5d3.1687779215.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 831941c0-e4c0-4cf8-43a5-08db78814552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8q7J9wuoG0QwZg1jcn1qtPKN3y1Hd01HESCH/JhKyCuRk3DnichM/zFbNo0DEF2uF31N/yIeNSWiEeRzyFGihwY5gf6dU/l0mzFBHzDhKtMqw1wr8sw7BmvAwTMibl/c4xZc8iWz7w14LttdrJEy/e6JKj7dE12pvRAacEvVvzDhbSmdYSBLH0MWz1QC3LBQvqx/2hlUXAVuGVCcDYXEg7ghLMgDHZ6iA5OWDu+ybJYnRB5eNAHK43mjD6MBt5TpIUtBJdWTA4Xge3Sd6EaUcQ0ClSQzdw1FCqgxUdRNuHDqykBxtmcX9Aj0VEVVz0vHlBhriL5VYwVUURhIVL25kL0Eqq1wHk+kWm2U0O2uuaF/OB/glhwGGTYSmKDZoBejgV0vS5/0oFqxI9e+/GyHGW/u+877NTP6xE7p3g/OI1aejsgi4KTF2JqPhaV/OF6YgWbrJEHwBvDPTCEYlYXC9Tsmg6mmDevy0aNURxPtPGy8vR7NIi/idd6PUxMvY/dOtXcDcrN7NU8iNZXOHIpMU6cFELVyHlwMZmeG+1GWKvz+IskwssLIGh0VdGvvv7vGnFrg4rVmmK3wXCexQbw+tyMvPe0MfIjdJF9A5tICxFwPd28K+f+rLfZApVF3rgoCgXvLbj8tQY9DVCwnPP3yzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(5660300002)(31686004)(66946007)(66556008)(4326008)(66476007)(478600001)(36756003)(316002)(8936002)(8676002)(2906002)(6512007)(66574015)(6666004)(54906003)(41300700001)(31696002)(6486002)(186003)(86362001)(6506007)(2616005)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEdmdlFOa2o2OHlINXc5NW1LZEFvdVI1TnNUckkwa01USzlzbkJDNGhxR2ds?=
 =?utf-8?B?SmNaWm1Hc0pUKzUvaERCd0EwUUZIaU9RZkQwVmxLbUc4ek5rUlVuYVp5cWVk?=
 =?utf-8?B?dk4vVlZCaFFsUFVHVWVzZ1FDWVR2UThGZzQrNFI5a3lVTVVZWkVjRllMUVFH?=
 =?utf-8?B?eVZ2MHNpcUxMRGdmUlNEVWN5TVFvM1BjTUlSZWJFSjJDNEs4djVIT1JvTkZF?=
 =?utf-8?B?ZHEzS2M4a1VNaExVYlpiV2JCTis0WHN2U2pzOUxGWGI0cmhZYUgvQlVEbWZr?=
 =?utf-8?B?enR6SFUwdEhWRk95RDEzOWRFWk11amdiZ3BqbisrOGU0eG96cDJiUE1KcXZD?=
 =?utf-8?B?d29raThMOWdwdWUvN21GcWc1ZXNoYVpSamZpTDlEMVc5anM5dHBrcWRtd3Zh?=
 =?utf-8?B?VzBweE15RkZRSjdCamo3ZnJtSXQ3Q21KQXg0Z0lCWWhaN3hJQjUwVS80L3Fv?=
 =?utf-8?B?WllHWmY4dUJyQUNKb0c5cEZqd000czVJNjRubTExbVJxbEdpUEg4VENGeDhv?=
 =?utf-8?B?OFpOSHJyekErUXlsL1pEWU1TK0pyaWJqd0RwWi8yRHZsSm1TcE53R3dUVHBU?=
 =?utf-8?B?dFVYQWlLQ0NiUUpKaWkwR0YzVmF0OVhNMFV3S1ZDNFQyRlpvWXFuU1c3OU9Z?=
 =?utf-8?B?V3hkRFczd2poYTdnZHVLeE5xTFlWWFljYmtKOTVjTkJkSGU0WldndE54ZHk3?=
 =?utf-8?B?M1V1UG5zQmdKODJOQkswTVExR2RWRUpJcm1meHRDSTZLMnVhWktaMk9Qd3dq?=
 =?utf-8?B?dVRwNU0rc3JxRlVjV0ZncXBFc28yZjB1alpXZVFjNERWUXNWS0RTZDkyWjFJ?=
 =?utf-8?B?VEswTk8xVCt1d0VFSXA4SmUwbXQ4OGhsUEVRVDd5YVpaQnlGa2tNT0RaVXRF?=
 =?utf-8?B?UHhCeG1WNG5iYzVtZjhpa3plS2JvdUlhVWFxUXd0bDVsU1Jvc3BTaW4rRTc5?=
 =?utf-8?B?VHBXbThNaFo2N0FxZGtoU2pZRTNKbTd4WEl0S1Uza1VIOHFyV2JhUEJhY2Fi?=
 =?utf-8?B?K1lPdTFMRXV0bXlWYW5pQWc2WlIvRUxqUDFZSXFpbGJUUzk4UngvVGdLazB3?=
 =?utf-8?B?V1E5Zm9JdFVRcGFUTjU3ZzhQQ0hGL3dpN2RuSGFScWZyQTIyY2F0Vi9Ga2RH?=
 =?utf-8?B?V3NybTc1aGY4bHl4RkxsbDZndEZ1SHR0dE5zNjdyUEFMTy8zeXdmTDMvRmZR?=
 =?utf-8?B?aHFIcGRGQ3JlVXBFakF1a2pFYkxFZmFMYkFLZ3BLYlozWHZGQm51MVJVV2JD?=
 =?utf-8?B?b3JydUVzTjVBN0pyTkRjSERwYlI1WHlsQkhoTWxJYmh2OFBWL3NMWVJtS2hX?=
 =?utf-8?B?K0h3b2xlVmdJUW9MYVNFNy92VUhSaDc0clc4Z2lDM0VRL05SamN6MFVCOXJn?=
 =?utf-8?B?dUFsUVIxN2NqTS9vQm56d1lYTkJMNmVwYmQ3SzBqcWt3YWxnSk11ZHdFNmJQ?=
 =?utf-8?B?aWRBRmYyTmRMUmRGdmhTb3RISktLV1gyVGUyRmgxYzN0ZlJVVjBNc0xyVTVk?=
 =?utf-8?B?UnA1d0ZPVVkvc2g5dHRmbklzZG00OHlXRDQ0b3lLOEJ5Tklhc2NYQkpaMDBS?=
 =?utf-8?B?Um5RTm9oQ09MY1RsVHduM1BqSUZobDNFcjhvZzZoVGNLVnk1bmVITHlpSS9E?=
 =?utf-8?B?QzlBd0M2bDVKMzhFZXZlQWRNMk01dkcwZkJ0T1kyRXZNV21DdWtHQnU5b1pN?=
 =?utf-8?B?Q004V2RNU0YvREx1VHRDalMwcnZXUDAzUWR3dVZmOUdIZkhnbEhmOEdRUUN5?=
 =?utf-8?B?dVNQUUNiZWpnWHJDNGVxNDJ4NTF1ZWVHN2xlZUhadzBZd3NFQUdMcmcxenFQ?=
 =?utf-8?B?bitvQXF4d0NXT01Gc0hRR2pZVFFqV2xFY2UyYW5aeUpoN1lMQmprb0czWXhG?=
 =?utf-8?B?dGc5ZXNOQkI0THRsdzZxWi9ZeEZaZ1RQeHIxUzlWVkdJSDlrL0lveERROHZD?=
 =?utf-8?B?NmpUVlhTSnljVGljTksyRjM5RVlpVkFOL3Y2dlR5cUNvdk9wZWczaHM0WjI4?=
 =?utf-8?B?OEVHZ01Ld3ZJLzNqTXN0cFhhbnN5NDhTS1lpd2YxcmMvNnA0MkU4dWRkb1F6?=
 =?utf-8?B?T1JCSVowczBwM2lUSGo1ZEhkSXg4T0tBdERkUmdLTjBSOHkyeGMwcGsvdHc3?=
 =?utf-8?B?Z2QwVi9kVlBZYXdOS0Z4bTU5S2xNN0xQUW81TVVYVXduSDNHZldyZkl4YTdY?=
 =?utf-8?Q?Ncxs9BM1rz4Oz+qfZXVaUFle2uM6/K8Rj2FAO4J/2+zD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831941c0-e4c0-4cf8-43a5-08db78814552
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 09:14:41.3567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqefG4tJoKVWkkQF+HX+0HNTIJjKFRgrjRce1WM/5SgqROd8rRT8IxVEcmVHx6ne
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6990
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



Am 27.06.23 um 10:32 schrieb Karolina Stolarek:
> Test initialization and cleanup of the ttm_device struct, including
> some error paths. Verify the creation of page pools if use_dma_alloc
> param is true.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   drivers/gpu/drm/ttm/tests/ttm_device_test.c | 159 ++++++++++++++++++++
>   1 file changed, 159 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> index 08d7314b1e35..67f7ec347a61 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> @@ -8,6 +8,13 @@
>   
>   #include "ttm_kunit_helpers.h"
>   
> +struct ttm_device_test_case {
> +	const char *description;
> +	bool use_dma_alloc;
> +	bool use_dma32;
> +	bool pools_init_expected;
> +};
> +
>   static void ttm_device_init_basic(struct kunit *test)
>   {
>   	struct ttm_test_devices_priv *priv = test->priv;
> @@ -37,8 +44,160 @@ static void ttm_device_init_basic(struct kunit *test)
>   	ttm_device_fini(ttm_dev);
>   }
>   
> +static void ttm_device_init_multiple(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct ttm_device *ttm_devs;
> +	unsigned int i, num_dev = 3;
> +	int err;
> +
> +	ttm_devs = kunit_kcalloc(test, num_dev, sizeof(*ttm_devs), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_devs);
> +
> +	for (i = 0; i < num_dev; i++) {
> +		err = ttm_kunit_helper_alloc_device(test, &ttm_devs[i],
> +						    false, false);
> +		KUNIT_ASSERT_EQ(test, err, 0);
> +
> +		KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].dev_mapping,
> +				    priv->drm->anon_inode->i_mapping);
> +		KUNIT_ASSERT_NOT_NULL(test, ttm_devs[i].wq);
> +		KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].funcs, &ttm_dev_funcs);
> +		KUNIT_ASSERT_NOT_NULL(test, ttm_devs[i].man_drv[TTM_PL_SYSTEM]);
> +	}
> +
> +	KUNIT_ASSERT_EQ(test, list_count_nodes(&ttm_devs[0].device_list), num_dev);
> +
> +	for (i = 0; i < num_dev; i++)
> +		ttm_device_fini(&ttm_devs[i]);
> +}
> +
> +static void ttm_device_fini_basic(struct kunit *test)
> +{
> +	struct ttm_device *ttm_dev;
> +	struct ttm_resource_manager *man;
> +	int err;
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_kunit_helper_alloc_device(test, ttm_dev, false, false);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	man = ttm_manager_type(ttm_dev, TTM_PL_SYSTEM);
> +	KUNIT_ASSERT_NOT_NULL(test, man);
> +
> +	ttm_device_fini(ttm_dev);
> +
> +	KUNIT_ASSERT_FALSE(test, man->use_type);
> +	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[0]));
> +	KUNIT_ASSERT_NULL(test, ttm_dev->man_drv[TTM_PL_SYSTEM]);
> +}
> +
> +static void ttm_device_init_no_vma_man(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct drm_device *drm = priv->drm;
> +	struct ttm_device *ttm_dev;
> +	struct drm_vma_offset_manager *vma_man;
> +	int err;
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	/* Let's pretend there's no VMA manager allocated */
> +	vma_man = drm->vma_offset_manager;
> +	drm->vma_offset_manager = NULL;
> +
> +	err = ttm_kunit_helper_alloc_device(test, ttm_dev, false, false);
> +	KUNIT_EXPECT_EQ(test, err, -EINVAL);
> +
> +	/* Bring the manager back for a graceful cleanup */
> +	drm->vma_offset_manager = vma_man;
> +}
> +
> +static const struct ttm_device_test_case ttm_device_cases[] = {
> +	{
> +		.description = "No DMA allocations, no DMA32 required",
> +		.use_dma_alloc = false,
> +		.use_dma32 = false,
> +		.pools_init_expected = false,
> +	},
> +	{
> +		.description = "DMA allocations, DMA32 required",
> +		.use_dma_alloc = true,
> +		.use_dma32 = true,
> +		.pools_init_expected = true,
> +	},
> +	{
> +		.description = "No DMA allocations, DMA32 required",
> +		.use_dma_alloc = false,
> +		.use_dma32 = true,
> +		.pools_init_expected = false,
> +	},
> +	{
> +		.description = "DMA allocations, no DMA32 required",
> +		.use_dma_alloc = true,
> +		.use_dma32 = false,
> +		.pools_init_expected = true,
> +	},
> +};
> +
> +static void ttm_device_case_desc(const struct ttm_device_test_case *t, char *desc)
> +{
> +	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(ttm_device, ttm_device_cases, ttm_device_case_desc);
> +
> +static void ttm_device_init_pools(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	const struct ttm_device_test_case *params = test->param_value;
> +	struct ttm_device *ttm_dev;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type pt;
> +	int err;
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_kunit_helper_alloc_device(test, ttm_dev,
> +					    params->use_dma_alloc,
> +					    params->use_dma32);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	pool = &ttm_dev->pool;
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +	KUNIT_EXPECT_PTR_EQ(test, pool->dev, priv->dev);
> +	KUNIT_EXPECT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
> +	KUNIT_EXPECT_EQ(test, pool->use_dma32, params->use_dma32);
> +
> +	if (params->pools_init_expected) {
> +		for (int i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
> +			for (int j = 0; j <= MAX_ORDER; ++j) {
> +				pt = pool->caching[i].orders[j];
> +				KUNIT_EXPECT_PTR_EQ(test, pt.pool, pool);
> +				KUNIT_EXPECT_EQ(test, pt.caching, i);
> +				KUNIT_EXPECT_EQ(test, pt.order, j);
> +
> +				if (params->use_dma_alloc) {
> +					KUNIT_ASSERT_FALSE(test,
> +							   list_empty(&pt.pages));
> +				}

That belongs more into the pools check I think, but not a blocker to 
have it here.

I'm not familiar with some of the KUNIT stuff, but the TTM side looks 
good. Feel free to add Acked-by: Christian König <christian.koenig@amd.com>.

Christian.

> +			}
> +		}
> +	}
> +
> +	ttm_device_fini(ttm_dev);
> +}
> +
>   static struct kunit_case ttm_device_test_cases[] = {
>   	KUNIT_CASE(ttm_device_init_basic),
> +	KUNIT_CASE(ttm_device_init_multiple),
> +	KUNIT_CASE(ttm_device_fini_basic),
> +	KUNIT_CASE(ttm_device_init_no_vma_man),
> +	KUNIT_CASE_PARAM(ttm_device_init_pools, ttm_device_gen_params),
>   	{}
>   };
>   

