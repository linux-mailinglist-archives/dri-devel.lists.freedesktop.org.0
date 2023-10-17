Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2FE7CC1B4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 13:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E011C10E2C7;
	Tue, 17 Oct 2023 11:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E5010E2C7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 11:23:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edbFGVNprCSKgkw6bP9kbRndyhdGTrCSizaNQVB2jEon11jF7XDJA0ePvydbTQK1FP8e/25gRlyDeFqofzJkdvGvMjIYWvDeiuTsq27eUomkdbFQPGY1XIVyo7cFk1b6tpcnZTbI3RBVZ0/eAWHeLJGmPTOCbOTDnewdNt2yAjXayEWucKgm5e/iDzJl1SfxnWFV2S4Qv2a1SXYDB2VbxQ1sqc44mZPHeCP8XwtFINOYAr0wPcJ2pQCwzyk8JUtFlL17mNICXLY7Enlufc0q9BuBG7ZT88UNOq+qNU/MX8cUDcRqk8sb2xatlUu1XHJmZAqLB2GrDZDbEKHyGF4BzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSycxYysGCxo4XfbAt1LjDZV7b9o2DuTIbSAZe4CQy0=;
 b=jurIiTvkihdH3NJP2HYKvaRrtRa7kmsaGanGmb3GwnUS/FZfmplZVCkLOZv2K2Gk9xn5ijO6z5C9CO+o2NocVxo9UQMhfZ3Tg2LFUd+JJIS7L6Y5BLZJjXVJ/lgt9CPeSVoe5UCmfu6HiQuOvSjYqFVzu8J3b/EE8UQWSbL4PJQFf71RgX2slvOeyvafXMgi5bBBrm9+F9LZdZcOIrgThWPydIewOh7SBeiDYJ3sDxrx7WyFEKqAxvB7qhL5S6tZh+pfqLRSZYebesl8i1N7Ba68koU+ZwjFE5TvWBLbcAuc2B/81LOVM6J+slvqILnhdvN2QYogrq5uB9q8EaPktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSycxYysGCxo4XfbAt1LjDZV7b9o2DuTIbSAZe4CQy0=;
 b=1c7WQOKY7A1cg4UyhjFZyOuJK6vHmMo0pWqrojeGndjrVAdrqUkNiBzy1W7xpvnoBwuyovLnVG2mKkwOSj6It1SRxg0DlrscoBGtFc02UEQdYECkPvmULDoIcrvIyb8E2wTjRVBBxIt7kD3eIvbfiynyC+lrI0nVZ6wRecIDd8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by CH2PR12MB5003.namprd12.prod.outlook.com (2603:10b6:610:68::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 11:23:04 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::d3ca:f4b:2fc2:c75a]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::d3ca:f4b:2fc2:c75a%6]) with mapi id 15.20.6863.043; Tue, 17 Oct 2023
 11:23:03 +0000
Message-ID: <eb349ffd-eda1-0f15-3803-2cfe5c01f2a0@amd.com>
Date: Tue, 17 Oct 2023 16:52:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 0/4] Improve test coverage of TTM
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>
References: <cover.1697445193.git.karolina.stolarek@intel.com>
 <9854008f-6755-4c09-9f23-90fa62911222@amd.com>
 <c9d088c2-341a-b315-a15b-8b8c0d487548@intel.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <c9d088c2-341a-b315-a15b-8b8c0d487548@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::9) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|CH2PR12MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: ec09cac8-985c-4792-96ec-08dbcf036d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XeH0tirmPi2S4EdEyr3rtSzoRtRo1wlowSTgouaq7ZXn/PqtQD3NNnDnicnUoJiR10Ic8ldWpmYEuSbU46Urosds7u0DFX1jur2Wsu+nWEPoRxS2BaUMgk9SgtcuG1W3qm7q3O6kX4heqgpG0J0LCba/xkKjaU+vmoZIjJKGdGFw+hBGv50ycccGWtPvkgVm/eBRDGlzBhzSy4PPNjxi5N308tEJqVCd0PEBP2gU9XJ1ZwBATzrnvnifWjlKBJG5eZRMJAVr5LoDJRbJD//LIX1YHag4BfWYkzkRrcdQptKmFA58gKQrEpaVcb9lrYSJVMhPWOh88yt4/v5did5rI++ai7uAbUNP5v2fyKdJFjflAOYu0b2jT2J+PV4bVeluaHRUYw3GTTWATXFz+tap+hpSLI4eXCjnl7AfNhGbTUQ4ACz9mrFYw5Tv6WCI3cGMVmoc4QYjJqHShpuAilnfVJ4KSpsKBYbSVKuyTSqsAqUI9bqomaStA6I8OSjyTKQoj9aIfcH3huXPYkH7zysS7hP0swpU++HcxijUD+0Ak2QqTH+L0JT3a8WKpROFdKMb8z9CPE7X0667WKGhp9+h9rzOmWlah7jC9l7hV9ZG55iB/PYWos7C104Un6qntTwKuRcZtWGCVJNZELCoFhSnDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(316002)(66946007)(54906003)(6916009)(66476007)(31696002)(2906002)(66556008)(5660300002)(41300700001)(8676002)(8936002)(4326008)(36756003)(2616005)(31686004)(38100700002)(478600001)(6506007)(53546011)(6512007)(6666004)(6486002)(26005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXcvN0dUcHZ4RGNMTThJV3ZTODc1Mkk1UFB5Ri9mMC91UG1VNEZOalRqd3lJ?=
 =?utf-8?B?d04yWnArVFROT0NCSCtzWnJNY3o5dDFZbUhBZ1pXR25jWlpBaW1OSDZOUGpx?=
 =?utf-8?B?TkZQOUNOQktJbUw1S3FDREVHTzBLc08yNGZkdTRhV05FSi9zcnNoSDYwcDRa?=
 =?utf-8?B?ZU02RnR3cFJremVUdWRoQU11UzhpR2FFZGVvNDZHMXg2MnYreFpBemxKa0hi?=
 =?utf-8?B?Ym52eXp0V3ByQXIwbHh4SmltaExFMUZaSDlNWG9EWC8vRHZ6OXBIWm16NUJh?=
 =?utf-8?B?ZVZBTitVQlVjTFB3dUNhZzZyQ3kwRGxzdFlJRjM4WGc2NXVjR2tUSkQvQ3Rk?=
 =?utf-8?B?ejB4bW9kek94UlhxOHROOVBFUjFlWXVtcUZuK0FrN0xZdVdRUW9OT2FFTjN4?=
 =?utf-8?B?dTg1cmlEb1grTjlWaTcvbGxyeGhNd3h2N0RDeEhLV3JqR2ZNQ1JwVm9keGR5?=
 =?utf-8?B?OVM3MWIxQVR5WngySUQ0cUkvbHdOeGtMZVZmY2RhcHRVcTlvZmh2a2oxemND?=
 =?utf-8?B?REI2NnZBNzdibVpkTWlQeEhQZndNZ2pjazFYeWxoeW1FVUNtenVDeGRRanpH?=
 =?utf-8?B?NG5vNUs2aXIrNWFOdTZCd2twWndLVDFPcExJK0hEejAzNXgvS0tDMHBybXkv?=
 =?utf-8?B?TDZJTmkyelZ3VTdNZTF2QkprRUVkV0RhNHlsWTkweFF4RlJPNjNvRHVINnlQ?=
 =?utf-8?B?NUlKcjY0dmtGcUd6aTE3c1I2N2R1TzFPSFgweUE5TG52MmhGc3AxRjBaSXQ4?=
 =?utf-8?B?aWwrL0hWZExhY09kaGZnc3l4UWdMS1JoZUpCdGVFRU1aVGFkMHl1TUFnUDlG?=
 =?utf-8?B?QytwNjRrY2drUXk1d3dJaTZaOTR6RW52TThYMWxEc01aczZJVkwwZmM5a1or?=
 =?utf-8?B?UEtXdnBrQVBLYUtTQzVlUnBEelh3UWxMVk5WdVUxOGhwT0VWK1NYTEVpR0hN?=
 =?utf-8?B?TUFxcEJ2Ry9DMGpZYzhQVThKTWx4S0F6SHVMQWNJQzlGWXhUazl2QkphVEdu?=
 =?utf-8?B?R1hIcTN5aEYxSnNTaGhrUnNWL3JvWi9wRm9DaXh0S0U2WVNsUGxqaHB3MitS?=
 =?utf-8?B?UkFuZFE0bDZqNng5bjlQc0xTMHZLeWNrN2Uxd3p3R1RsWVFiUEdVazFjWmNt?=
 =?utf-8?B?QVBGU2tlWEJ5MEJBdDIvdUR0NStNbUdMblQ1OHdIK2h0VW9weC9lVVNxY3dp?=
 =?utf-8?B?NjVoNUp4ellsYmQrWFdTWTcycWQwb2FCa3krOXM1OUszMUlGM3luamxYVHB1?=
 =?utf-8?B?TGc0WEdsc2U4UEJQWGNaaUdMNERkd0UxQklJSHFPMXFGVU1jL1BEVU1mSWIz?=
 =?utf-8?B?S1JVemFDMUtVeEVMNzJkOFVQWTExVmpicVhMUkZ4UWR5ek1EZkFvUTA5cExh?=
 =?utf-8?B?T2ZsdGtQVHZhOXRsaDFUQVYvN3VocEhlNWk3bGMxWnZhT2UwV2swRFBPdC9o?=
 =?utf-8?B?bWhWUVIzeW82Nnh1aUpNVjVjOWJEM0haTEN6VmZNbGRuTHRrZE9oVUlnSWVa?=
 =?utf-8?B?QlRLamNsNVpONXMwTFh2Y1puQUQxYkVjQWN3ZGNMb1JaWVNRTElBNHRuM21W?=
 =?utf-8?B?TitUQXZCaHcvUzR3TmJURmNlRUsrQ2NQSElzRTRSVisrdWVYWUFxUW00b1JJ?=
 =?utf-8?B?Q1BIdU55bU5MbWJ3TmZoN0dHalZleFp6UjVsNFNqNDBXcnBTNzVqQXo0OE9u?=
 =?utf-8?B?VitTS1ErRlBKY1hJeWt1Sk9NaHM1N0Vma3FYZkpqT1RkWjZLd2FldFJkdWFm?=
 =?utf-8?B?bWxvRU1lb0ttTWhLcy9IejArSUJOZG1wdG9EemVHT1FRSkJ4eW85bmJWTmdj?=
 =?utf-8?B?cmlKaVNIWnNFaE1lVXd4MmhWU1crU1gycFFwMGdQMk0vcVh4amxyVXkrV08r?=
 =?utf-8?B?dElnYlNLSVUyUkdmVWlOVkxkTWdQcUEvUEF1ejl6a3JhakJiek1HSWFiSGdt?=
 =?utf-8?B?aEpUT0tpZGNTVEVQQ1dkL3NyaGVrQjNQQUdGQjJDeDlHS29Wd1BZWDczeGQw?=
 =?utf-8?B?QzVic3VsT1J5ODlsOHFUMUNxcmpabk83YW5NMlZaeXlsbzQ1QWxjWjh5azUy?=
 =?utf-8?B?aGhmeVc1VllNcDBlU2U1aGJoUFNOOVJPUlRWcVhRVmI4eUdlRDdUNUFmb2ZK?=
 =?utf-8?Q?j9VLGmvZ2fvZbFA5uICvmamtE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec09cac8-985c-4792-96ec-08dbcf036d9e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 11:23:03.7697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2loP0bID1hv7L9gj2AU74mNxiDfAPyadf8iT//Jrv12Sjl4ZDoLkt3U5ZAZMGWC8QePfjeWoGQChGK7gxbT8Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5003
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/17/2023 4:35 PM, Karolina Stolarek wrote:
> Hi Amaranath,
>
> On 16.10.2023 15:08, Somalapuram, Amaranath wrote:
>>
>> On 10/16/2023 2:22 PM, Karolina Stolarek wrote:
>>> Add tests for building blocks of the TTM subsystem, such as 
>>> ttm_resource,
>>> ttm_resource_manager, ttm_tt and ttm_buffer_object. This series covers
>>> basic functions such as initialization, allocation and clean-up of each
>>> struct. Testing of ttm_buffer_object also includes locking and 
>>> unlocking
>>> the object for validation, with special scenarios such as an 
>>> interrupted
>>> wait or deadlock.
>>>
>>> Some of the test cases check the bulk move mechanism and how it 
>>> interacts
>>> with pinned buffers. This is to be seen if we want to add dedicated 
>>> testing
>>> for bulk move or not. The resource allocation subtests use 
>>> ttm_sys_manager
>>> for now. Resources that don't use system memory will be indirectly 
>>> tested
>>> via tests for ttm_bo_validate()/ttm_bo_init_validate(), using a mock
>>> resource manager.
>>>
>>> Use kunit_tool script to manually run all the tests:
>>>
>>> $ ./tools/testing/kunit/kunit.py run 
>>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>>
>>> To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, and
>>> then CONFIG_DRM_TTM_KUNIT_TEST.
>> Tested [PATCH v4 0/4] Improve test coverage of TTM patches on AMD 
>> platform, looks good.
>
> Many thanks for taking a look.
>
> Do I understand correctly that your Tested-by would apply to all the 
> patches here?
>
Yes, I have tested all the 4 patches together.

Regards,
S.Amarnath
> All the best,
> Karolina
>
>>
>> Regards,
>> S.Amarnath
>>> Many thanks,
>>> Karolina
>>>
>>> v5:
>>>    - Actually use the page_flags parameter in ttm_tt_simple_create()
>>>
>>> v4:
>>>    - First unreserve the object before calling ww_acquire_fini() in
>>>      ttm_bo_reserve_double_resv subtest
>>>    - Silence lockdep in ttm_bo_reserve_deadlock subtest (open to 
>>> suggestions
>>>      how to fix it in a different way)
>>>    - Use a genuine GEM object in ttm_buffer_object instead of an 
>>> empty one
>>>
>>> v3:
>>>    - Instead of modifying the main TTM Makefile, use
>>>      EXPORT_SYMBOL_FOR_TESTS_ONLY() macro for symbols that are 
>>> tested but
>>>      not widely exported. Thanks to this change, TTM tests can be built
>>>      as modules, even when non-exported functions are used
>>>    - Change the description of a patch that fixes 
>>> ttm_pool_pre_populated()
>>>
>>> v2:
>>>    - Remove Makefile for KUnit tests and move the definitions to the
>>>      TTM's one
>>>    - Switch on CONFIG_DRM_TTM_KUNIT_TEST=m so the tests and TTM module
>>>      are built as one. This allows building the tests as a module, even
>>>      if it uses functions that are not exported
>>>    - Fix ttm_pool_pre_populated(); a wrong flag was passed to
>>>      ttm_tt_kunit_init() function
>>>
>>> Karolina Stolarek (4):
>>>    drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>>>    drm/ttm/tests: Add tests for ttm_tt
>>>    drm/ttm/tests: Add tests for ttm_bo functions
>>>    drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>>>
>>>   drivers/gpu/drm/ttm/tests/Makefile            |   3 +
>>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 
>>> ++++++++++++++++++
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  51 +-
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
>>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++
>>>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 295 +++++++++
>>>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>>>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>>>   9 files changed, 1313 insertions(+), 3 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>>>
