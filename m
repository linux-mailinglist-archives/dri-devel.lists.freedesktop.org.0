Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 236F176E230
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 09:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E520810E5B5;
	Thu,  3 Aug 2023 07:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF3D10E5B5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 07:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgXnwVUVB/gzzxyyReF5HfjHT2daaiy9do9lHGhKJ1cMTox1ewzU/rT5RCvl6D1nAg3MhGi4mnjuHPfdyiGADpTUfvqjnio/ZmVU6hwwb/7O+2tTUOruPVmNTFRlFCW5Vsf/f06z+6nAUOocsq5d+2KgrA/2ULRAa9GdmJ25cD6y9fiXxl6KPzjAIp7nGVdOVbLTEsF2AXXvrg69dMnzc8jax0ATK7JJE4abMU0SbvdxXSdvixUxHsp04smUs/nRNarikyuhZWiM6ZE86gQElqwbgEjPfcvFIjA8jJvzOfwzENGVCKTW/+S6VOoSoMd0PbrGO/KLW0LRYmf7BzKUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=270urVJKH8hjIw/plGXj5hyNkFfJckTce/7QS5FOjQ4=;
 b=YB//FPYGhWYhbJrDRJOmR8NfXMxych/NpZimJ4pkSw3A6EVMeidLoWiPuvSplh0x7/HGMP9tTIrHQflJxJ400R/9pHwerbYc6HsOKfI5ZajnLzLdEbjcy01Yvv9uvwrUBxzOPuIA80ck2Ub/FAxaqwdUuPMWTl4CnpidlOasO7+Ijyf83+lpkQSEik4SnS7v9bUR2KFsovOz0dz104Q0K8eL/BR8m2Xm4tKYEHUTTruLT3Z3JgE0d5F6Lqpt4scELXwF+pG0PH7VSWlq6GTWDrm5zWTNc/xhGr+EB3wVdk/Wi1oJLjlSQ/2RuhQ4pTS15Go2rCZ/i8jG9FoMgRtF4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=270urVJKH8hjIw/plGXj5hyNkFfJckTce/7QS5FOjQ4=;
 b=GaaDiPtEQ9VG9a0hyQyDyTBTK8cjHhgVRR3qg5mQmz8mVOBn7bCByfh7zICXUkRO3VjcOKmNktkHmx27lOmglWaZK0fFme3uytRRG+0/qDV9LVz0zHXt1Cibfmria/91cfrr1BYqJKNP71Jn6bJpeevwo0dz7HpNwJ3ZW6mCEbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW6PR12MB8952.namprd12.prod.outlook.com (2603:10b6:303:246::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 07:56:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 07:56:20 +0000
Message-ID: <c22c2984-70fc-be19-fd7a-a99e06003ec5@amd.com>
Date: Thu, 3 Aug 2023 09:56:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC v5 0/3] Introduce KUnit tests for TTM subsystem
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1689343130.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cover.1689343130.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW6PR12MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dfaf94a-181e-406b-5c27-08db93f71fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Zmj1o2Usj6qufSgghLV1szSGU1oE+iCK35VttEKNrlGyYJuz/xrhE3/+ThcYjEYcczf94GC7qTaiMKeIr2SvFy9Psi9cSJWZh5EsGWSxe5piw9z5zLHKIQTXn85C57jZ4D2O/+22HMFuQNvGJET/WyRnu24EJ//lSRuvoPJ+5NcP511f7fpmQFUVEIWzKuoLDebjzQBB0N/1WBFoI4lgleESCyrJoMwDFF7DMcDKC0mJY6CVmHUngC8GXG4XJwVS9iu9xaU8Iv7pbovvVOaXLUADyHKXD7lKl9R5bDc14cXkPjJPw0ynNosddhZTD6GEw6FWMMybJGG8u2BLlpuficxt7oIY6354uTHWoPf+47r5sf4Ws69EGQOCtJoPPfCOKgkvE4gIRhN6XxPAoSLmfm+kZIuWOvNN6hdE5/SfmvsInEXpra0RrsmSRdT7XTOCa6RNM+XmUF9ntChxKtIMw0a4bRohZE5+KI+kUc3iMuHXbsyDfGdjHBYnZ4L582tE/Yh0DvKQcm/uQIEVzwkt9puqPvYwaPjcx+jKWz1RiPDOn0MuHYE7RrAR4ogPOIw9GK57pcdlPkemcd9bQrLTyXA0o7E6a0nvX8ndB65UCHst2YfTtvQ2GM8i90d1M6dJs0nlV11KJUzjFE0ujqSDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(66574015)(2616005)(6506007)(83380400001)(186003)(316002)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(41300700001)(8676002)(8936002)(6486002)(6666004)(966005)(6512007)(54906003)(478600001)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzdMRHZVNlhmYTArZk1kb2xEQ0RFaHIwWmt1ZXVkUjJSblBDeGRzY0xQcURk?=
 =?utf-8?B?eDhudW4zOEZlbTFtM1U4YTFDZndObDVzb094OVM2MVVXdzRkR0tZQllNblc4?=
 =?utf-8?B?TFJqTVdaMlpwTE9vR3B0RUxWTFVuKzdURlhITmNVSVJnR0lyRDN4bGVTNGFM?=
 =?utf-8?B?ZXlENFFSNFZLOUN5WGdZaWpDaXhCMlJLbVNpc25TUTYvTHhvQ0s1VlZpU2xp?=
 =?utf-8?B?Zml1VmNSSU02dFBaSWlWK0Z2dUROQ1FkN2V1SlNXRFh4UHlUUk1hUUN1SWZU?=
 =?utf-8?B?YXdidU1xUnZDMElzNzlZRW9NSkgzN2hkZzRFbm9OSHl1bUNKRC9RUVFRZ1V1?=
 =?utf-8?B?UTlRclZyK1VjcUxjbGM1YXFPMkVMTU1TMVRIS1VmazNyYWpzZmI5RkhtKyty?=
 =?utf-8?B?MUttTkNrLzN0TDc4K1kxUjMyMi9NSlNjYXVabGRNaExGUldURklhRjN0b1V1?=
 =?utf-8?B?eXBqaHQwc2IwRm9YODFjV2IvNEdSK1dVOVA0cUk5NDd6bzdFRnU5cWZ1ajk1?=
 =?utf-8?B?b1kzSjRUM2oxRXFEN3R0RVVTTGxyYlBiV0hIZWx0OGZUUFJwUTVUQ3Y5U2VW?=
 =?utf-8?B?TVlFTkVmTTg4M1hCS1NUem1UNTVuRytCdVJ3YzBQVmhQdzlIVTZacUtybjlM?=
 =?utf-8?B?OUdmRmlxekJSRnd4ZXFEYzFxY2hoWG40SW9kNG0wNlpqbURsMFNWNC9BZS9W?=
 =?utf-8?B?RmNIbjZiSWFxb3NIT1hVMjg1Sk9GUjROb3YxZ3lycjViVk1XM0FCOENmelJF?=
 =?utf-8?B?YlUybTVzc0lPS1gxbnhjYmhuczh0b1RrZ2VBQzYxVWoxbU40b3ZOazFCZm4y?=
 =?utf-8?B?ZnFiRk9qY1NSK3NLclVXUW9ydnBnQ3dTQ1U2MzcyZE5NWTFuTDJDUnErb2la?=
 =?utf-8?B?NTIyeXB5N3BKTWxwNHY1ZGdYMSsxVFBNSUxCV0RUWExwTVJId1pwdjlpQXhT?=
 =?utf-8?B?QUV4VFFCdkJGRkZTOGZJdEI0S1gxTmNCWTUxRG96a1NDU1pEczZzejZGRGlP?=
 =?utf-8?B?b0ZmOCtpSzhEYTZqOFVtV2pyTXdjd0F3R3gxcmtCRkxWT2x2aXg1dVllNGxw?=
 =?utf-8?B?NW1qeThLRlJwZ2dXTE5kQlpteXV0bHc3ZEZuMUZEWHo5bi83bWhBTzFtNU5j?=
 =?utf-8?B?SWVrVFRXTjcxR2ZxL214TUhpOFJaU0dsR3UvYUFoWlJqM0NVQWNJdlMzeVRn?=
 =?utf-8?B?bHpMQ0t2RnVpYWR3M1FFVi8rZFpQb1VPVFJkWUM3MmRyS0xYVmw5Yzg1SXJ6?=
 =?utf-8?B?LzNtVFlIczBFaXJjYlhFK2NUSk1qWkMrMjgvbzZ5MGVqMG1kaDNROEhzakFE?=
 =?utf-8?B?VHdOUVVMalR5SWlEVkMvSDZzWnVldGw2VStSVFFqSUtibjd2ZnpsdHM0QWdR?=
 =?utf-8?B?Rkk3WVZzbUJwSWYybmUvUlVjaUprVTh6Qy82UTFJL3RPK0VNMy9rRmRobE9S?=
 =?utf-8?B?WFl6L0xtd0lDTnpRWjhydHZFRE5TUlNmN1ZleHlPMk1jQVFYdHBaZncweDNz?=
 =?utf-8?B?QkhhUU83RVptaGc5d3BJMk1UZ2N3OUlSMlFycnRjVHFHWGFDa1pQR0JZUWtZ?=
 =?utf-8?B?SmFhTTc4MzI0MStWNjNidTU5OHBzWnVDbzJ1b2RqbENRazhlaCtVQ3AweXVM?=
 =?utf-8?B?eG1HWlkzQzUyenprY3JobGkzUzd1R2U1Z2x6TFdqZm10QlZ2TXNkc2FSVDV2?=
 =?utf-8?B?VmlNcmtNNEdnamlWRVJYNU9sWjNSblM3NkhHdHBCcUFoWktta0paZ1FrTHdu?=
 =?utf-8?B?UUVscU1vQjNDRGlvdDhETDFpdnJDemlIU245dm5kQW1QQ0dXaTVwWHlzdUlM?=
 =?utf-8?B?QjRqTTVLZzIyS3JReTVJOXNWQkdHaU1kRGNpMVZ3WlRYVzNnZ0xoQ2dBZ3l3?=
 =?utf-8?B?WEkvYnZyUDhLdDZLSWp3TmxublA4UmN5dTQrZElDM0hwWXpQcERKQkRoKzNV?=
 =?utf-8?B?bGQwSDFtTkpXSjgrTFRhS3Fqb3NFWnpNRXQ5c1FWSEdyeUxjSmhuTWNyYzBv?=
 =?utf-8?B?dkNKT0tHc0pKNFM0eVlxQWtKVFFyS1BCbmhhcEQ2STNlbGVuNkpWdXBhY04r?=
 =?utf-8?B?M2VVN0tIRHpQbHdzQkZFbXIzRmw3VUN1d0JjcUhuVlUycVg0YjB1VnoxZ20z?=
 =?utf-8?B?Uk9YN2VDbUpEamlYUWRvVFRuU1B2SmVLYWoxbUx6ZnNJSk1JVmtwQlVoOHlx?=
 =?utf-8?Q?GvKT1OeT5Ygq70LrFYp0IOYGGHkD7bcHuPd9vXSMwJrB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfaf94a-181e-406b-5c27-08db93f71fae
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 07:56:20.4041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nG3l2EuOy41maCmB1BD7LEGwvVZb8AmZVTrLEJ3eEgCoGnybWMa912M+SX2oF45
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8952
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

Feel free to add Reviewed-by: Christian König <christian.koenig@amd.com> 
to the whole series and push to drm-misc-next.

Thanks,
Christian.

Am 14.07.23 um 16:10 schrieb Karolina Stolarek:
> This series introduces KUnit[1] tests for TTM (Translation Table Manager)
> subsystem, a memory manager used by graphics drivers to create and manage
> memory buffers across different memory domains, such as system memory
> or VRAM.
>
> Unit tests implemented here cover two data structures:
>    - ttm_device -- referred as a buffer object device, which stores
>      resource managers and page pools
>    - ttm_pool -- a struct of pools (ttm_pool_type) of different page
>      orders and caching attributes, with pages that can be reused on
>      the next buffer allocation
>
> Use kunit_tool script to manually run the tests:
>
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests
>
> To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, and then
> CONFIG_DRM_TTM_KUNIT_TEST.
>
> As for now, tests are architecture-agnostic (i.e. KUnit runner uses UML
> kernel), which means that we have limited coverage in some places. For
> example, we can't fully test the initialization of global page pools,
> such as global_write_combined. It is to be decided if we want to stick
> to UML or use CONFIG_X86 (at least to some extent).
>
> These patches are just a beginning of the work to improve the test
> coverage of TTM. Feel free to suggest changes, test cases or priorities.
>
> Many thanks,
> Karolina
>
> v5:
>    - Drop unnecessary brackets in 2/3
>    - Rebase KConfig file on the top of drm-tip
>
> v4:
>    - Test helpers have been changed to make the creation of init/fini
>      functions for each test suite easier:
>      + Decouple device creation from test initialization by adding
>        helpers that initialize ttm_test_devices, a struct which stores
>        DRM/TTM devices, and can be used in test-specific init/finis
>        (see ttm_pool_tests.c for an example)
>      + Introduce generic init/fini functions for tests that only need
>        devices
>      + Add ttm_device field to ttm_test_devices (previously
>        ttm_test_devices_priv)
>    - Make TTM buffer object outlive its TT (Christian)
>    - Add a dedicated struct for ttm_pool_test (struct ttm_pool_test_priv)
>    - Rename functions and structs:
>      + struct ttm_test_devices_priv   --> struct ttm_test_devices
>      + ttm_kunit_helper_init_device() --> ttm_device_kunit_init()
>      + ttm_kunit_helper_ttm_bo_init() --> ttm_bo_kunit_init()
>    - Split ttm_kunit_helper_init() into full config (with ttm_device
>      init) and basic (init only with device/drm_device) initialization
>      functions
>
> v3:
>    - Rename ttm_kunit_helper_alloc_device() to ttm_kunit_helper_init_device()
>      (Christian)
>    - Don't leak a full-blown drm_gem_object in ttm_kunit_helper_ttm_bo_init().
>      (Christian). Create a small mock object just to get ttm_tt_init_fields()
>      to init the right number of pages
>    - As a follow up to the change above, delete ttm_kunit_helper_ttm_bo_fini()
>      and just use ttm_bo_put()
>
> v2:
>    - Add missing symbol exports in ttm_kunit_helpers.c
>    - Update helpers include to fix compilation issues (didn't catch it as
>      KUnit tests weren't enabled in the kernel I tested, an oversight
>      on my part)
>    - Add checks for ttm_pool fields in ttm_pool_alloc_basic(), including the
>      one for NUMA node id
>    - Rebase the changes on the top of drm-tip
>
> --------------------------------
> [1] - https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html
>
> Karolina Stolarek (3):
>    drm/ttm: Introduce KUnit test
>    drm/ttm/tests: Add tests for ttm_device
>    drm/ttm/tests: Add tests for ttm_pool
>
>   drivers/gpu/drm/Kconfig                       |  15 +
>   drivers/gpu/drm/ttm/Makefile                  |   1 +
>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   4 +
>   drivers/gpu/drm/ttm/tests/Makefile            |   6 +
>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 212 +++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 115 +++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  41 ++
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 441 ++++++++++++++++++
>   8 files changed, 835 insertions(+)
>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>

