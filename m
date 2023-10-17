Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE05D7CC21D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 13:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAA210E2CD;
	Tue, 17 Oct 2023 11:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE1E10E2CA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 11:57:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1E8ulbD+nPEytSdQUV7eLBdd9vCEk6e2WTNFsIWZaQNSdvzcxf5sAv2VTWW8gR7UloHzKXQpujhNG8DbzgQYZs+H0Ra9e32OjsM7vMXzz5mJJmcFF7irIe9Kpjnrva4y9o9PKIQv3lpbv3F1iaWxD7qzdiuuEW9alwhpdhxd5b3xdcnqs0qeGNNWrg8XYj/1v/9nahP8G5rOJ7+R4zYEMPFFLoPqd7AZSITIAUFBz3Fk6Rk206Bji+5gqboIQiQPn5V2ChgtsSv/aSqKuSrNDCmJxFxC1s0fbvULuTSvxKtxLJ7QSbvy5Qj5G/v+TlN7K6/FhokRKmvP2ydGF+uPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFQGs+ySPaSVOofHMXQ4MbFRCxm6Eot6jHrnrSC5DIU=;
 b=MYF9gZrRtocXnNunvjDLm9JJiPoFlF3T9tiO9jlTtWBRMi10ivOuDMGKlmfxm8i6aMwXLsS/okStzbK6hCIT0iQQ3FX/u1UwCQ79FNI06OB45GXEcGD8bW0we14jAxT5ByWWfkdxq2jp5obnv+2MXemP+C5BVJJZ0Q2aMx/eZY2FAWKFh+zRtSbTwJFT149uNcZ+DnhgSHVt+nry6Fq5eohWU6bWnD3nYJn5GGDQRYqggWq7I5HaqJMb7LdU84cg6is2z0+MPKuquB0lwMLhxElNPPJbuUmB1mwI6OgychdxjuMZI/c0roS4Kvvt3EloZHlK5EAz5Qhk5xKnXXahaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFQGs+ySPaSVOofHMXQ4MbFRCxm6Eot6jHrnrSC5DIU=;
 b=SBG2tWhgqlj2RrhKsWP6WwZNuV8v1CAZw95zEGfE3HKaOuOP83SkqB/OJAER5ZX4KRH1Y2tG8W3/PFVH6VGq+1/wqbsZiydibtAq58vSQ6Tvno8z0Dujg0tkj8VHxB5wJrIvNhWIEsKF/PdMqJGGZvAnAp+uPdyaJIOjCHreD2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB9222.namprd12.prod.outlook.com (2603:10b6:510:2ef::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 17 Oct
 2023 11:57:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 11:57:26 +0000
Message-ID: <c2fd2bb8-7c98-4012-bc63-2e143abf4f65@amd.com>
Date: Tue, 17 Oct 2023 13:57:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] Improve test coverage of TTM
Content-Language: en-US
To: "Somalapuram, Amaranath" <asomalap@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
References: <cover.1697445193.git.karolina.stolarek@intel.com>
 <9854008f-6755-4c09-9f23-90fa62911222@amd.com>
 <c9d088c2-341a-b315-a15b-8b8c0d487548@intel.com>
 <eb349ffd-eda1-0f15-3803-2cfe5c01f2a0@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <eb349ffd-eda1-0f15-3803-2cfe5c01f2a0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: 804c6d65-9390-4974-09bc-08dbcf083b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dNtlYG1/qhfeQzZFBPk1A91qvLi5g9yVev3F5zYbVzdDMuoNATX99pQFfpFLK/GS0cgj8RFgjlnB0+Sg4TEC+SgXvRZCs8qNwJ3AYcY1D6QH28ROEukZNV6bLR1nk/LM8nVnQ4Nylwtq0hZcqJSXvidMK/ILTuXqSvmrh4BGAWXwA4shOZnOFVSLvc8TAYhpqyv77cIgT7xV9EcIVS4eK+jAaMNzCjgYKsoY8xUG81TWIaSi66u1HH30EEXZ4SDconz6YY73FFK229wsRqjMkk5ASyq/+50IQnYbPlpGvGHzOeYH//pjDdsrtOIrHorcLQ+bVwFF5zGg0BUK84D4p8hJZdngfBJk7ikEjBbWuI0BBYRBaI+pmHGr8PpWWlMZ2CSZJrrqgLW4dLcR/HuiWhcCNKX8vRbs1DJi/yGzP2yUVINDYf0CrIWRyC1oFI1huoHVntHEWaarL/sWrSZyb8HNTQF3MAe3rt/bXPjH4hpw9akYw0zoCurENDuX5aHkLr05IduZd9h2tirMWR1pdFbst9MZkQDu6hDJjgC1XeM0PQc3L/jOEAr0jvGqe3k71t35dGylvOolF08rfVTUFT/k/xoSTySCLe9cSCG0ZO4L0UeJDQpR3q2XalIquvEMsRX01NuAM9jCADwAQt7iBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(26005)(86362001)(6512007)(31696002)(2906002)(478600001)(36756003)(83380400001)(53546011)(38100700002)(6506007)(6486002)(4326008)(5660300002)(41300700001)(66946007)(66556008)(110136005)(2616005)(316002)(8676002)(31686004)(8936002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTRvSWR5dysrU2s3N2ZDS2huekNnb0J3bWpMM0hYejJnSkhZbkZSaUpWT0o1?=
 =?utf-8?B?RjJIZDJhTGR6cnpGK0JsNVZSZGxSTHNlbUpYTUE5SWVnN2pVbFl0eDhLM0JY?=
 =?utf-8?B?Q1JUUExENjI1c29NVS92a3B4UG9FUVN1blpHcnVOZFR6VldrSm9FTmt4STA1?=
 =?utf-8?B?WGJ1NTR6RThGMjF3amF1UWowNlEwZjFsRUFPeTJ0bkhIenBLRUw2Tk5Kald6?=
 =?utf-8?B?Y0Rsc012QnZPUG40TE5OSXNTOW5yYXg2T0hOMWdZK1RBSXFNU0UrS2U2R0Qv?=
 =?utf-8?B?eWFjVTZqZjFMaHhJK1NlaWxhVzZvTENUZFQ4WVBpSnlhdWcwTElValRZRFNv?=
 =?utf-8?B?d3BxNVhpTVo3YkVRcHM4T0c2T2NtVEE2MlZRYklvYk5XeGYrY3FrMGE1NU5J?=
 =?utf-8?B?OXU2aVlmT0xvZ1lUNGxGMnY1TXl1RGNVWXdPWDVxT3RyelhuaTNpUFBMZW01?=
 =?utf-8?B?aHlvUmRCMk9iVUw3aWRWcTlhTDFJSjFwZWVhbXFINUZzUllGc2d6aFM5YWln?=
 =?utf-8?B?Z1ltVEtIRVJLWXVyOXozYmZBTFZYRUFPUTErT242YUlLUmFNNHNBdFFhT0Vk?=
 =?utf-8?B?WWVmTDg4TjBJUjhudzVyaWpuY0dudkRXVnppaHVHQWJtcWZhSjhZTWxRWFA1?=
 =?utf-8?B?RFBVOVlBdXo2ZDd1K1Fud2NqNGlBbFRZUVp2bzZ1bFoxOEJNeUFuVDROR1I1?=
 =?utf-8?B?QTA5dnVtNzU5L0tJUGl3SnNDazBIS0x6MFdyUGlQdkVMeUU3V01POUg4OTVw?=
 =?utf-8?B?YnozeUR6dU52bnFRMmVZa2xHR3hMd1dCNUFHMUIrdUluWExVZlc4TXZyQWV4?=
 =?utf-8?B?U0dsWU9xd2NieEsvanFVTUg3ZVM0c1hJZU5qK0ZUekZLVGRKZk1qVjhydEZQ?=
 =?utf-8?B?Q0Yxdi9DMkkzczRvblgwZ2M1cTIyZmVGZUdOdXJCd1FiVHAySkh1ZDdHeENM?=
 =?utf-8?B?RkMybkVMc2REc29ZQXdoeWF5bWE2QW5lUGlPQ1lnODdkMDBuT3FlVzJwZHNZ?=
 =?utf-8?B?T09WbGQ3V2FUempGd3lQSTNQYmZsaEJiWFV1TjVJbGZzSzZhdnpTYStFZllm?=
 =?utf-8?B?Vk15azdURnY0dW9nRGQzYU1aOFZ5NFRHbEJJQ3JtdGFQZ2QrMy9KSFFjVVhY?=
 =?utf-8?B?SFFDWVUwdmlvTFh6K3VoL0VDa2M0VVFnSEhNU1lzTWJNM1NzM2FSQWthZHFH?=
 =?utf-8?B?R29XQS9qRm1DRFJ6cGVWaVdjeTZxVDRYRzY5U2tMK3RudnFqL2NiSll1cFAv?=
 =?utf-8?B?S211cmNTd0sxWUV1VGtRV3ZlSmY1aFpRano2RVVYRVRjU2xyMXJ3UlFZRlJh?=
 =?utf-8?B?VXd5N3ZkVGpTMXArVUVOSzZlVldBQ0g0MXhla1Q1TFk4RFZySUYxeU5ldFJj?=
 =?utf-8?B?aTZiTFFGeDNZanJMU2lJQUNaK0FQSmRCNjU4ZEdoR0lwWEVQdUlzdE9hT0Nn?=
 =?utf-8?B?YVlPZWJSdEpqTFNvcXpPT2c1Q2FBU0c2enZmOCt4TGV6Q2ZwSjAwN081VjND?=
 =?utf-8?B?Ylc1NjdLTHQrTEdvc0tpZXNrZ2N2NXRLOXhVRmhtbUtFYlJ5M3hCNUFvSFlD?=
 =?utf-8?B?c1FoZzNBaHlqL2VpWktyRGtuSDl0eTJZUFFZbjRWaFBtS0wzYjBCdUZycCtk?=
 =?utf-8?B?OEVMS0YwaURCUk1Qckx2MmEvSmNZNzJyaEJxb215Z2VmOXJDRUMzSGpuTTJP?=
 =?utf-8?B?QXhsOVY1RVlBWjFZekxIMVpNOUgyY0crS0FDK3dZbVplS2poMUVuVDl0Z0hi?=
 =?utf-8?B?bnkvSnNkaU9GWC91ZEFvR0NMQjNIeUNobWNjNENTanVaVmhsekxIdGxKdnl1?=
 =?utf-8?B?a1YwQWJpdUNtWjZqZzNWUXY2ZktzbUF6dFV1QmFmZ3p1ekxPOStyWk5mcXZT?=
 =?utf-8?B?c0g5WTFCT0RxZEZOSUpzWVN3WDdZZkZsaDNEY1NXTFdFaHhhRHlURXdYaEVK?=
 =?utf-8?B?S2NQYjZwUnVWYm9tdDlGYlpvT2xsMmduVUpNd1BBTklvWHZXNnlKZkdnWHJM?=
 =?utf-8?B?dnNtUVgyQ3lnMlFtdW9SdEVWcUU2TGVRUU5sa1BBUDZVeENVc3ZPL1dYQ3l3?=
 =?utf-8?B?aGtGY1pMMytTWEVEVlBaNWFvZXU4NVRyV0JTUmI2NkJWZ1UrK2F3Sko4a2h4?=
 =?utf-8?Q?WH1dr5jpWkekkpynlyxAW/AGh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804c6d65-9390-4974-09bc-08dbcf083b06
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 11:57:26.0783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xAkArtNtdkBmFtc4QdZec/6TGl04uhQ1J0hLbshPMndq1Ar/dBnzDsGiD2mCgdf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9222
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 17.10.23 um 13:22 schrieb Somalapuram, Amaranath:
>
> On 10/17/2023 4:35 PM, Karolina Stolarek wrote:
>> Hi Amaranath,
>>
>> On 16.10.2023 15:08, Somalapuram, Amaranath wrote:
>>>
>>> On 10/16/2023 2:22 PM, Karolina Stolarek wrote:
>>>> Add tests for building blocks of the TTM subsystem, such as 
>>>> ttm_resource,
>>>> ttm_resource_manager, ttm_tt and ttm_buffer_object. This series covers
>>>> basic functions such as initialization, allocation and clean-up of 
>>>> each
>>>> struct. Testing of ttm_buffer_object also includes locking and 
>>>> unlocking
>>>> the object for validation, with special scenarios such as an 
>>>> interrupted
>>>> wait or deadlock.
>>>>
>>>> Some of the test cases check the bulk move mechanism and how it 
>>>> interacts
>>>> with pinned buffers. This is to be seen if we want to add dedicated 
>>>> testing
>>>> for bulk move or not. The resource allocation subtests use 
>>>> ttm_sys_manager
>>>> for now. Resources that don't use system memory will be indirectly 
>>>> tested
>>>> via tests for ttm_bo_validate()/ttm_bo_init_validate(), using a mock
>>>> resource manager.
>>>>
>>>> Use kunit_tool script to manually run all the tests:
>>>>
>>>> $ ./tools/testing/kunit/kunit.py run 
>>>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>>>
>>>> To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, and
>>>> then CONFIG_DRM_TTM_KUNIT_TEST.
>>> Tested [PATCH v4 0/4] Improve test coverage of TTM patches on AMD 
>>> platform, looks good.
>>
>> Many thanks for taking a look.
>>
>> Do I understand correctly that your Tested-by would apply to all the 
>> patches here?
>>
> Yes, I have tested all the 4 patches together.

No time for an in deep review, but I'm going to pick this up and push it 
to drm-misc-next.

Thanks,
Christian.

>
> Regards,
> S.Amarnath
>> All the best,
>> Karolina
>>
>>>
>>> Regards,
>>> S.Amarnath
>>>> Many thanks,
>>>> Karolina
>>>>
>>>> v5:
>>>>    - Actually use the page_flags parameter in ttm_tt_simple_create()
>>>>
>>>> v4:
>>>>    - First unreserve the object before calling ww_acquire_fini() in
>>>>      ttm_bo_reserve_double_resv subtest
>>>>    - Silence lockdep in ttm_bo_reserve_deadlock subtest (open to 
>>>> suggestions
>>>>      how to fix it in a different way)
>>>>    - Use a genuine GEM object in ttm_buffer_object instead of an 
>>>> empty one
>>>>
>>>> v3:
>>>>    - Instead of modifying the main TTM Makefile, use
>>>>      EXPORT_SYMBOL_FOR_TESTS_ONLY() macro for symbols that are 
>>>> tested but
>>>>      not widely exported. Thanks to this change, TTM tests can be 
>>>> built
>>>>      as modules, even when non-exported functions are used
>>>>    - Change the description of a patch that fixes 
>>>> ttm_pool_pre_populated()
>>>>
>>>> v2:
>>>>    - Remove Makefile for KUnit tests and move the definitions to the
>>>>      TTM's one
>>>>    - Switch on CONFIG_DRM_TTM_KUNIT_TEST=m so the tests and TTM module
>>>>      are built as one. This allows building the tests as a module, 
>>>> even
>>>>      if it uses functions that are not exported
>>>>    - Fix ttm_pool_pre_populated(); a wrong flag was passed to
>>>>      ttm_tt_kunit_init() function
>>>>
>>>> Karolina Stolarek (4):
>>>>    drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>>>>    drm/ttm/tests: Add tests for ttm_tt
>>>>    drm/ttm/tests: Add tests for ttm_bo functions
>>>>    drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>>>>
>>>>   drivers/gpu/drm/ttm/tests/Makefile            |   3 +
>>>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 
>>>> ++++++++++++++++++
>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  51 +-
>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
>>>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++
>>>>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 295 +++++++++
>>>>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>>>>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>>>>   9 files changed, 1313 insertions(+), 3 deletions(-)
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>>>>

