Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC9774EF3F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 14:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B834310E382;
	Tue, 11 Jul 2023 12:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E74F10E382
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 12:46:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWfhbbxNPgSgIt4A/f0CHZsnFSiHWSbkAsBxlLWLn6FDcZpKGsOu+hoxTmrPMADy2oyjrSCuaqwKZjNv7AX0hgGFtjdwM0UYsdQp0outb8rJsdNgfwc2QTX6kI9SEjgt7dXptuCVP5aJYMTrV+v7TZXrCAs4BSg3M86CGO2ljBlL1xP0riCiiKdotRon64MInHX/z3JyAOPEKOBuSAMKPvP1/52+eAmKIq6yRBEc4qORPLDsALBUNx4QuZVaTMbbg5vMmT7Kg9PzzX2X1CnuqCmOsVmdUoCaBaCRHp/Ne9ijYqkx4kYTt0J4ZfH4Gb6+m/pAV564Z1mc+4dPxF7WXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2KFcnx/7cp/qaIvnWmZItXb/A/SrXv2kN29UnvmHEU=;
 b=JPBiy9Gp/348GtgAxcz/DOVmuehSjnqeQ+r9qM46bzMmpmMph5Z/ZvOyNU6C5lyhGiAiWoK67xRGc5nRkqx2luK/RehsylmS/n8W0VYlKDYLzq4Hhou5yRXikdUqmUv/WRyAyYEr/EMzSnxz211eikStnk6E4GvxR1a+rYU2xhQM9Y6mUOrwFCwTg2hgnJMI1m7YQiAW32EzTiNEffidWeat5AN6hbZqqV3MM5MARYq6wOKre8GMDPmEYuNTy4J76cp4B6Yji0PizfvKKXEfonKSu8rw6AZlkE7XgEGDzJF6WmSJtlZlMGrXbkbpTaB/TumjCDtaIt7XIFywCW1J0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2KFcnx/7cp/qaIvnWmZItXb/A/SrXv2kN29UnvmHEU=;
 b=g+ZRRhAP++QPWm21fPZ0XhnnDNDHIcepa4AtMYvAUYwwuL0tXgRDDFNCFv5kBH92YbLaLS1f0zQ2CbuKbPYXVorpwZoXAQD+LfksAvzHr1bxDcTQe2v2oc9Ru4+dVPpkDNuQGkLTgwD+lSezgtBQeXqYONC/Hx+LVDvyAn02/cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB8166.namprd12.prod.outlook.com (2603:10b6:a03:4e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Tue, 11 Jul
 2023 12:46:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.017; Tue, 11 Jul 2023
 12:46:00 +0000
Message-ID: <873d2643-db7d-bc80-b210-549355e8c7b0@amd.com>
Date: Tue, 11 Jul 2023 14:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC v4 2/3] drm/ttm/tests: Add tests for ttm_device
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1689060814.git.karolina.stolarek@intel.com>
 <e5f75f4b093af650103efe3008f395c3dc7b505d.1689060814.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e5f75f4b093af650103efe3008f395c3dc7b505d.1689060814.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 71dab66b-b752-41d3-1570-08db820cc73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9H6VHkCHrm/hhYWFhR19nM1yDo54YLrIVh1+W0DZy+r05fbsBX94baUHV6Z1psmkYRnGstqy/9zuJuGsRQERy6xSBBAZ3OLoCzBXt/XWQHiSas9zsY4L48XOPuxuePL7bj1FvRtCWled/9UFVFepdCmviWhNbqPLHhU6ejpb9Ue/2FX5icW0qPq46aMXofE76WHNOakghsNwMq4qiQhVwcSXRBVbMxQZLwDKNTy0byUYS93UNZknWshOFYUzu2CRQCQfq9Bca+q1vtp4A/bkz0TvBp3cV5E1mUBsDkdT5D+63zsGQiIcgoyY4JfKRR5UhmQGtYT/Ovool5WsgRrSdVq9pLTBXoFi8kyBvmtJExSZoAavqi0kSRfOZhF+nFOVXe+8J8tzddxbG+rZ0MT3OlA8pm7XWcH6cIyu9hl4BaoGgy5QKrjf3wKNLxV5LFTd3ZhqDviLTxcVfgadp1eBfgjt5XWShF+QO8dfgF4Bwtzgg6ZulG8keRW2aiaYbkyjTh9jSsD5QYXeOntOc9kW6Xeyp46G/UvOrWGC+1E2M6AkzSVPeTnv+1mYxHclAwgCNCRW5A3ijASXzbg8XY0QEGY97KFQ2NdcQ1fb+8dw98izrioUn6lSb4aeA8UBqTURWwRMT86xErvJOZdnEhNhOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(6486002)(4326008)(66946007)(66476007)(66556008)(478600001)(6666004)(6506007)(38100700002)(54906003)(31696002)(41300700001)(6512007)(31686004)(316002)(8936002)(8676002)(86362001)(5660300002)(186003)(83380400001)(2616005)(2906002)(36756003)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUdBdWVSeXErS21UQlIwVmpiQytUUWJvbWIxVXJvMFluOW1KditVeW5ZNnNG?=
 =?utf-8?B?WFZ3N3lkZ2dWamhzcGExUlN5V1V4TThqNmN6dnpQTmFnbkJBdXRnQW0yVnRZ?=
 =?utf-8?B?KzBNc1FGQWdEa1ZlRGhQY1J4THRzMEtueWVwWjczWlRWalhwTy9SQjQzb0Fv?=
 =?utf-8?B?YUxITC9vUHlMUGdTalcrQUFTYjlZbTNrSk1nUzIxWUZLZDRTTnlpMUozanc2?=
 =?utf-8?B?blYreGU5Tk5YVWRXZTVxOUxJR0JvZGRLTm10YlpjaXdPTWxxRzlZMVRmTWhM?=
 =?utf-8?B?M3MxVEVPakFmeExqNUdUUDMxem41amFvc0xUaEZiNFIxOTFYbG9oWW1nS251?=
 =?utf-8?B?Y3N1eXVCQVpnbVE4TmszQnNCbHU5cG0yQ0ZDUzdEVnR6ck1ScWNDejdDQjRM?=
 =?utf-8?B?QU5YOG1DTzdxQ05vRTMvY0xFRXY5elNsTXZGb3pUdEhwSEkwaUYrMWpwN0V4?=
 =?utf-8?B?OVMyWjVyQjg1ZW55WXJrUU1va095L1NoM2hDcVdaZnBnOFFmYXRRUzEzaXkv?=
 =?utf-8?B?T0dUYU9qZ0lTQzZ0RkRMNG1rVGZ4R3BHU2lUN2VnSUVFR0VVMXp1K2xJUE5Z?=
 =?utf-8?B?ZzFmbmRwQVNOZ3JZTjY5MUM2RjBaWXJ2eGtKQWZDdjlNdjZjZ1phbmFqNGdY?=
 =?utf-8?B?UTl1bWE2U25VaHd1dEhVazNaeEdpc3ZtYlExS0VLOGF6SEFhZmFKUko3MEww?=
 =?utf-8?B?aVFzQ3R2Q0djcmVxMlVTSU5UcFZPbWFZeTlmbWZyT2xNM3kva1ZvQjgyOEtn?=
 =?utf-8?B?a0pORlQwZHJUcEczdU1hYjVUa0ZyS0pQdGcwUkxjTm5Xa3NCN24xUWs3YjNv?=
 =?utf-8?B?WWN2Ukd3WWZnZy9yK2liam1JWGJBYkdmelRmemd0STVWS2ZJUlRIYy9SZTN0?=
 =?utf-8?B?RGN1NVhJZFB1RDF1MEN3NkFDaVdoUk9lZ0RyQkZPbXNSZ0g5T1daY2E2NW95?=
 =?utf-8?B?Nm9NK1dDWnhHcDN0VGVTQk1Ya3JSNmxvemlHV09Ta3FDaW51dzJ4YWk0bmh6?=
 =?utf-8?B?UzBYYVYzQVArMytRL2RId1poZlNjOUtRQnpSSVlZZllYcGZ6ZUs5QUE5ME0w?=
 =?utf-8?B?WEFhcjF5M2dsQUVGbVBkZUpyL1JlZ05JYWFxYlUrWXk5eW02SFI4SUZCQXli?=
 =?utf-8?B?SVlwaWxBUmZoT3lRb1pIWHZuUnp1cVB0VjhVUC9mOXFPMVBRRlgwV3BteDFw?=
 =?utf-8?B?eVNRZVZYd2JuTDVwOXpYQ1NNOWpHcG1FM2VYNDExdWVtNmt2STlZUnlXVVha?=
 =?utf-8?B?UUFpSk16aUZNYmZvVXBRZUNuQ3FaNTdCamRidVJZMnNmSml6T2ZrMEo4WHRS?=
 =?utf-8?B?ZE04V2RJV3RzOFhRSGR5emFyeW9kdWZyODdIblAzRzA3dlpCSEsvTmxnZit2?=
 =?utf-8?B?YlZTV29FWDh2TWNjcmliSlc1eStONlhCS0dWdWpIaXFyYnk1MmxrVC9WMjA2?=
 =?utf-8?B?bWNZa1FBa3RYbkxVTGhwSzlUbTNvelpxMzBvSkpWY1JxTzVCeUd3aWhnTXpV?=
 =?utf-8?B?amNFR2pCNHk0M2RHakhxdjhMVE1lTTJGbEhZWUk1b2NCcllWTC85cStHaVRW?=
 =?utf-8?B?ajZNaHI5SGUrK1pXRDVtdFVYMmJyd1pmSzRMS3ltNTRFZmxNcWJiaUg0QUFM?=
 =?utf-8?B?VGorSWlGaFRFZ01SNTZZeTJnUWtBVjNyaDZQRndvRm5KbXR0NmZwZVZRdWNk?=
 =?utf-8?B?ejYrTUI1Y2x2dW1MK2JpMjl6NTA0bzhMWis5UzMrK0FSa3VTYmFYQUNQNndx?=
 =?utf-8?B?VUpMYVBGNjZYZytiR1NaUVg5THhsb3Q4VjAycjlkWlB6OHdzeFR4S2ZHRXhN?=
 =?utf-8?B?UGhFWjNGQUJRQ2hJQlFFemFwT1Nkc1FIWGlueFVFY1dyM1RhM2IzVjlXR2dZ?=
 =?utf-8?B?VzR3bGRvQ0p4VlYzd2NaM0ZCTTF4VVZKbW40eStvbEdzc3Yya1U0dFJnbndz?=
 =?utf-8?B?cEl5cndFa3ovemNiYkU5L0hrTkg5TG5FRDMyS1g3emhHQzFER0Z6UmQ0WitJ?=
 =?utf-8?B?RGVTU1Eva2F6OVU0a0NCa3UrcWVEeUcxd2lzUGNpWm52SldjRTZlOEc2dTJX?=
 =?utf-8?B?UURTMFZ5bTBWY1hFQWI0TGlRWXRLemIyTDlOV2lQVVplbU4yb3ZyaXFKcmRZ?=
 =?utf-8?B?dGFUM2gwZHgyL2RKTVFXR0kvaVhEQ093bVNFUTNhbVFPOHA4aFFyOS9BMDU2?=
 =?utf-8?Q?HIFSqPOprWQqcN2bd3SbD7bqQ9+R2yNBZpCRF5RlaUdc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71dab66b-b752-41d3-1570-08db820cc73f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 12:45:59.9295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lk/YGWqAV6n8jpaQRhmdioGaJPi5c5iATVWtt5QYGb4XJgYu9fPU0Im+l7d0UvAI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8166
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
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 11.07.23 um 12:34 schrieb Karolina Stolarek:
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
> index 76d927d07501..f8c867836acf 100644
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
>   	struct ttm_test_devices *priv = test->priv;
> @@ -37,8 +44,160 @@ static void ttm_device_init_basic(struct kunit *test)
>   	ttm_device_fini(ttm_dev);
>   }
>   
> +static void ttm_device_init_multiple(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_device *ttm_devs;
> +	unsigned int i, num_dev = 3;
> +	int err;
> +
> +	ttm_devs = kunit_kcalloc(test, num_dev, sizeof(*ttm_devs), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_devs);
> +
> +	for (i = 0; i < num_dev; i++) {
> +		err = ttm_device_kunit_init(priv, &ttm_devs[i], false, false);
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
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_device *ttm_dev;
> +	struct ttm_resource_manager *man;
> +	int err;
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
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
> +	struct ttm_test_devices *priv = test->priv;
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
> +	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
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
> +	struct ttm_test_devices *priv = test->priv;
> +	const struct ttm_device_test_case *params = test->param_value;
> +	struct ttm_device *ttm_dev;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type pt;
> +	int err;
> +
> +	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> +	err = ttm_device_kunit_init(priv, ttm_dev,
> +				    params->use_dma_alloc,
> +				    params->use_dma32);
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

Please drop the extra {} here.

Apart from that the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>

Regards,
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

