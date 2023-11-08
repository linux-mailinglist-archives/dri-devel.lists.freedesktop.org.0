Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A167E59A1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E22410E799;
	Wed,  8 Nov 2023 15:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6191210E799
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 15:01:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQYA28FVZXjeZcMr9yWbFIWaYckGTxozusejmH/hrB1rxfrV2d4JqksehB5VCDHtWFMZrIF+YLOPWvF1xnSGTHjZRP28bPSLje/aLRBr3TtAPe2owYOs0+yAWrQY6RE0ZcMfr0j8+9dSre86HumhqZ0scbqHOzJ3Kf6CtVffPzoBufKL0l3RTePzKsMyk3aWK6wk5KiLxYRtSEGcMG+TW+NvgK49rgn7wHRBcpjFg7fGrmiJcJRvjVl07gCuU/9AuMFlQfzTuzltnXNDoON+tZ6J41sOR0lZn0IpjRWf/N/c3J19sIQskT3nzQWO10EsMorr5oIHJxrKplfJA9/CfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpQkvnklHFK5mWWW7uM/yz6MTvQVEsf9V/yVZjBy5hA=;
 b=ZSNIY3AtkfZ+vpoqBIxnBAXYFSLC2xsQ7BerjY05q6fGZcBiY9Dh5vLoSpk6Z8utON7Ul1f0qK+HkJsf5alIU3dv8rQ6DMktMt0Q88nkZTga/0R3i1SNoQ/Dc7k7wkOWqQR0Vv+04veD+e3e1Iof1FCVBsqFjm3KnUZvq3CstaOfQpf2I1xQXjTPgxj85MIdmyll9rStckq3TB4u8tawVuZR9Uh7vMTyOosPeyRAOezzfFDskuguEZ75C6Wki5Ym2quuP+843vFH1NNWSAj9y0tBPAjS9GO6xYeEJY1rJs8NoG3rAvFo6C3AJKIx8qxYuIJUWmM2IAvqEO0fgWlDQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpQkvnklHFK5mWWW7uM/yz6MTvQVEsf9V/yVZjBy5hA=;
 b=4LTXoKg0TDwGC4WvNAU1pXRVVHPDW0/T9Df7uSxPOnHYrWJIKZ9vBKxd2yzlls+aa+FW0ShJKIhPcqvq4agpNSTecOQxLGPDMD324qWaxFvAqCUdq7fBdX3fvI0nM9Xrx6d+OW8cnwXZUk6x4VZ7Us/WQwrEl/mrd6lwHTUS5ZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM3PR12MB9436.namprd12.prod.outlook.com (2603:10b6:8:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 15:01:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 15:01:34 +0000
Message-ID: <cb14b615-a53e-4f0e-83e5-48cf57e17717@amd.com>
Date: Wed, 8 Nov 2023 16:01:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] Improve test coverage of TTM
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>
References: <cover.1699445194.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cover.1699445194.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0448.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM3PR12MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: 3538d441-0b95-4b54-8d5b-08dbe06b98f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 96A3ozZKBMGTsftcPuEbDT5Cklp++7g7LKQxe51Q/KpzSzbwsrYZ/K8kT5PhOpxUjYBuY/L7hriLAJFH9GkfqVDErxyj70hw3LM4oajtknv+kvVeI80sKeDAHUz7ZvFCJrnStgudRazdizthW6QC8V2T06DudTchepQHxW1g1Nc0Brp/9wa26nO3e6jeIODV176XYqrib8uUbgNtgVWrE2P/0fOEObukBAjK7DHnJluFD07ccG8xpkBRr8J7e4qF9YZuVIc+fG5VyK+QbJhrrrLdNwk4bCxqRK65KToPRizvQg4JUSdL7IP+bE8XXTNFEv3K6hVwyu3X2ZbydC/CtBEN6JOMe8n0q3hPBKlQuAgPSOKdSiTF633Zo+JpdFjQrvg2YYJujI1x7UJuIIrToWCz4/DOFxMTS8i0I6zAAhvnl4o5ATo3UiaeLhP+Mfak0r29NoYU+rMMzHaDpTxkv9NyIawYs4g20E4Zj0O+7vxG5sFyim7S+wNfJ/sUw8gLb2qJzLnsIb3c2dhca8etVIwpRsl6q1regMiKzYk+uIo3mm0rkqQcsQy5ek4Th8B2GAAQ2rHyvZbdkq55E5JkoS7qABMBizBZIbQyNG2tMGPCJ6O+VxOuWv7ixWGPRMDMgbcaMF9BiRS5eXI+vrkzAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(83380400001)(8936002)(36756003)(31696002)(41300700001)(86362001)(4326008)(2906002)(8676002)(38100700002)(6506007)(6486002)(6666004)(478600001)(6916009)(316002)(5660300002)(54906003)(66556008)(26005)(66476007)(66946007)(6512007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a21ST0tEM3drczlCQjJmUUFnTzdhWFVHWFVUaGZwL1FmT2Y5dW9QK0lBbjdw?=
 =?utf-8?B?dE1Na0NaQldIdXArV3lkUVBWNTB0WmpoR2xOSEkvWUFURTdBSVVDRlpybmNK?=
 =?utf-8?B?dWFzQTNsbjZGQzJVVFdMbjVKSmdob2diMVdxazhzUXVXTTJma0tpYk1GUjEz?=
 =?utf-8?B?NWtodDEzR3NvaDZ4OW4yckF3dG82OVF6YzBldEhESVFwRm1ONkJiSUVzc3hO?=
 =?utf-8?B?U3pEZHhmM0NVOFFhcGFDR2FhQkxTOHZjdWFvZDhIaDBWcmFLZXRaWHEyeUpu?=
 =?utf-8?B?enhNZ1lPZjN4cjBSWjFNTk1WVlhoRnMzZzZ3d1BlUGFDYXZFL0JpaHY2djNh?=
 =?utf-8?B?MUVXOU15RFA0dms2ZUZjSGtGOFN5cUlnb0JQQ1B4TkgrcjZDZWd6bVpETGRm?=
 =?utf-8?B?MFYwY3FoTXZubGtESmhLZG84U2RDeXZ3RXpqVmdobFNvR2E4QzJHQVhMYjEx?=
 =?utf-8?B?K05FS215c0pMcEVPZ3NwMHdzSjhWY2FBMGUwaVBlU2xwamtzL1Y3UFJNWXNM?=
 =?utf-8?B?ZElybk1pdjZpVG5kc3hqWFZsVDR1ZmcyL0x3VUx5bytVY0J3K0dURVVtbGhB?=
 =?utf-8?B?U0dPMHlYQVhUOUZGbEU5aElmWmFnTTBqYVJyMDVPb2l3MlBXelNTZWhkTlBT?=
 =?utf-8?B?eEV3dmpKbkZBeHU3dm9KOW80R0NYVXgzU0RFVVYwalFMMHRrbXhSa1ZGZThB?=
 =?utf-8?B?MGg2THdOL3NzdVVjZ3ZjN0hPUmtHQW9YcDlWT1pyRklhOVdYKzFURjJ3WGd2?=
 =?utf-8?B?bmZFYTNUTnN6Vnpsc2JEK2tRQzJLQUg4dHo1MEhGa015NzlCSWF6b0RIbmVC?=
 =?utf-8?B?em1XMXd4L1pmV1Bqekg3UXhES2JMM3ZxYkZ3YU1Fb25Rb1I3dEZmZHkzZ3NT?=
 =?utf-8?B?OXl4NEhVWjNqWmo2YlNHWWNyZmpFdVBjK1o0NkZxT01LSmJXREExS1FaWVNz?=
 =?utf-8?B?Yk0xWjh6cnIvYWhjYjRJOVQxUFJHdnoxSkorbHNLcENaWVhUZ3dTdDVzdTg3?=
 =?utf-8?B?QXUyTnNkb3ovUzlwL1Q2MTRXRy9lT0NTcDZFL2xjUlA2S1ptRzVmN0RrT0J6?=
 =?utf-8?B?S0Z2bzhOcGZPOFR3Ri8yb0xSVDdMaGJIMjZVd3h3RERYMEpGRWVZK0k2TXY0?=
 =?utf-8?B?MTJTVjFNNXRjTWFtSm5NWGRmSXBaQ1dCT0JSdVlFMXZHVWdCSDBneFFFSzNO?=
 =?utf-8?B?YkJCY2g1YXVWclpUL05BZjZVOUNVYndYTStuYnBhT0w4WWlvMmxzZ21UTVZM?=
 =?utf-8?B?cVloN0Z1bVR5dG5RVDk4UFRvSW5UNmIyM3JTb1RRcVNLcTB0Y2dyUU5WSDhG?=
 =?utf-8?B?b2RJRVRNZHYrb3RWaDZmTnJiT0FWWURVUGt4SGRwUGhYSnVxb3RTZXh1czMz?=
 =?utf-8?B?MGFveDFkK1prYXM5RlF5ckhQdkhhNFAzL3haMDVsd1ozU09yczlTQ25oeEVM?=
 =?utf-8?B?ZEZUVlhIMjhvWGhqV3lTMTd1RzdGWEs3a3JWNjBjWXFhK2VBWk9lTi9STDRj?=
 =?utf-8?B?Mm5oWm9oTFlUQW1rY01Tazh0d1h1YWNuWGQ4ZzJJWFltb1ZPb3NSeHVnTEsv?=
 =?utf-8?B?MVBHTjd2MUIyM3ZTc0RDMWZCbThTZlpoZm9LNzY3OW14cWR3WUtBTDRLTklr?=
 =?utf-8?B?eFpMRGF5YTFNNy8rUjJSaU5XN1dEUHJyMC9GdXB3MlNyWitmUmVnekw2Q0hV?=
 =?utf-8?B?dlUwWC9HczBLRjFDWk9mQmNZVWF6OEVYM3VlTjdnS2FnSUlnbEtIemp4Z0RG?=
 =?utf-8?B?b0V3N0xaQlhxR3R3NGZtM0ZrSTd0WWJPODg2eVo2RE95ZjVHc0oycnVJWThr?=
 =?utf-8?B?OHdIcDBLdFYzWTNRM1QxVC9CSSs5THowSUV1MFN4OGZ6SXk0UXZYK2VZWDF5?=
 =?utf-8?B?YWFVMVJFMG8zNUFVOXF5RjhKRWp0OGtldGxkckJpTHpSRlQrS1ExblM1bktP?=
 =?utf-8?B?bUdDRjU1bFVqeXBnYjVzaUp0UDFHZnNjU2Fnbkl5SjFDMi9NaEpOSkQ0akls?=
 =?utf-8?B?MUZJQ1N1RHJYM3BvT3VQMVozWS9YMTlJTndHOGJvUWQ2M2VrcXdYWE8zamp2?=
 =?utf-8?B?ZEY1WmZBcTFPNERRd2xsdHd1eW8zUmpMMHpMZTdGVDlpOGZtMEM0QWRyckRQ?=
 =?utf-8?Q?ZkkY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3538d441-0b95-4b54-8d5b-08dbe06b98f7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 15:01:33.7523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFFmcf0o9hBESlCacrQxRMihLIkQuBRuuVxiPPPuDQiWxFXe2LpyALaQwSwJ1mba
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9436
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
Cc: "Somalapuram, Amaranath" <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.11.23 um 14:56 schrieb Karolina Stolarek:
> Add tests for building blocks of the TTM subsystem, such as ttm_resource,
> ttm_resource_manager, ttm_tt and ttm_buffer_object. This series covers
> basic functions such as initialization, allocation and clean-up of each
> struct. Testing of ttm_buffer_object also includes locking and unlocking
> the object for validation, with special scenarios such as an interrupted
> wait or deadlock.
>
> Some of the test cases check the bulk move mechanism and how it interacts
> with pinned buffers. This is to be seen if we want to add dedicated testing
> for bulk move or not. The resource allocation subtests use ttm_sys_manager
> for now. Resources that don't use system memory will be indirectly tested
> via tests for ttm_bo_validate()/ttm_bo_init_validate(), using a mock
> resource manager.
>
> Use kunit_tool script to manually run all the tests:
>
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests
>
> To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, and
> then CONFIG_DRM_TTM_KUNIT_TEST.

Well, you have a tendency to keep us busy :)

Please keep Amar looped in those patches. I will try to review them when 
I have time, but he can give you at least some tested-by tags on AMD hw.

Thanks,
Christian.

>
> Many thanks,
> Karolina
>
> v6:
>    - Include tests for ttm_bo_init_reserved() and ttm_bo_validate(), with
>      a mock resource manager (patches 6-8; no eviction testing)
>    - Add ttm_test_devices_all_init() helper to also init ttm_device instance
>    - Remove fpfn and lpfn from ttm_place_kunit_init() helper -- these fields
>      are neither used nor tested
>
> v5:
>    - Actually use the page_flags parameter in ttm_tt_simple_create()
>
> v4:
>    - First unreserve the object before calling ww_acquire_fini() in
>      ttm_bo_reserve_double_resv subtest
>    - Silence lockdep in ttm_bo_reserve_deadlock subtest (open to suggestions
>      how to fix it in a different way)
>    - Use a genuine GEM object in ttm_buffer_object instead of an empty one
>
> v3:
>    - Instead of modifying the main TTM Makefile, use
>      EXPORT_SYMBOL_FOR_TESTS_ONLY() macro for symbols that are tested but
>      not widely exported. Thanks to this change, TTM tests can be built
>      as modules, even when non-exported functions are used
>    - Change the description of a patch that fixes ttm_pool_pre_populated()
>
> v2:
>    - Remove Makefile for KUnit tests and move the definitions to the
>      TTM's one
>    - Switch on CONFIG_DRM_TTM_KUNIT_TEST=m so the tests and TTM module
>      are built as one. This allows building the tests as a module, even
>      if it uses functions that are not exported
>    - Fix ttm_pool_pre_populated(); a wrong flag was passed to
>      ttm_tt_kunit_init() function
>
> Karolina Stolarek (8):
>    drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>    drm/ttm/tests: Add tests for ttm_tt
>    drm/ttm/tests: Add tests for ttm_bo functions
>    drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>    drm/ttm/tests: Use an init function from the helpers lib
>    drm/ttm/tests: Test simple BO creation and validation
>    drm/ttm/tests: Add tests with mock resource managers
>    drm/ttm/tests: Add test cases dependent on fence signaling
>
>   drivers/gpu/drm/Kconfig                       |   1 +
>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   1 +
>   drivers/gpu/drm/ttm/tests/Makefile            |   5 +
>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 ++++++++++++++
>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 792 ++++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 110 ++-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   8 +
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 194 +++++
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  30 +
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++
>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 282 +++++++
>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>   14 files changed, 2383 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>

