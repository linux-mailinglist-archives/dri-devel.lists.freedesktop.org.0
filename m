Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F1F7EF3B5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 14:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF34510E75E;
	Fri, 17 Nov 2023 13:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26A910E75D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 13:31:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANHIkQwzafrzndWXa/7STl9sJrOJpBxFeQwW25G1/xZ9+4YvW/rnbAsnmtBlwLtMgmUxzVuWmOMKoVq3DNREbi9BFpTNSRn/df8dAaqktFESNan0uugNUvC6Ih2Ypn5SvsPGj9ax36qLSQx77JBnJjeXGOywSSgL7hTkQDTwnfgV6/+E95OuZ9vaJCLwryatMQ5ssA656BnPMSZWnD2IBpH5Y8SLzgxsrvRjldxZ4frIWT6htwNqollZZKuHSp4tHBc2qBOAp/qZIX39Y81P49huOhUeneceg71ezYCL91TduEQzRPctXqkf91yIWiAVbOZHjeb99WLx8Dcrip0wBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vbblw8cQ9dmE7TdLWJ3nAfcP/zVmWEO3ZVCTj4JmmY4=;
 b=Qvos5ut48/UnetKpaFG885Q49p/0j/XQztWGRhIpiE7+NbrlRmQVL20rj+vdi1w3hPn4ck7DrS//hdfpzX6iZFNm4JBzg+SYGE10Jo5B84+gD83/FKKbxIBHdR+U17LltQxitrvcBuHdHvwqxnakf87M71si6CU5gk00NCWsjf6h3yExbkQfnTrLk66cd0FqKhBpoZYXUWjtxyGTiwWEwmgHHgn6p1VgtghdeW3lGne+GmOcpAkRQo4p/fBz1vEjdmNuGL2M9LTHCTPMBdXwbuIIm4yL9TGBoy2XbdV5PAZrwsv1G9Rh26cTAG2iac7K09Sqm2cblqqaK334LngHAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vbblw8cQ9dmE7TdLWJ3nAfcP/zVmWEO3ZVCTj4JmmY4=;
 b=v4zYM1Z8KhfCrrDtxL6HZgIoQzMKCya8Hhcw/aYvlyk8TsZ5KCZphdEwKUEfP6b0z3s0Mv182E3mOgWC1SXpK98ZdLh7ai5yomcKRSxuv0M7hhRw7DyYuCprWy3j62YqaysDYKRGrS6jUreUFdMx9Qi13xtLHpPdq+MH3cyzK4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6255.namprd12.prod.outlook.com (2603:10b6:8:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 13:31:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 13:31:04 +0000
Message-ID: <a9118f8e-782c-4259-8487-7ccc8cae0a3a@amd.com>
Date: Fri, 17 Nov 2023 14:31:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] Improve test coverage of TTM
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org,
 "Somalapuram, Amaranath" <Amaranath.Somalapuram@amd.com>
References: <cover.1700207346.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cover.1700207346.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: c4366968-0981-4f1d-00d1-08dbe77172bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UGhmg4waGyeSZqJlNV+Rzp3g5OQC6g05Hmcyav75JWv9dWnt8b+N3O7Pa4Zv0rViDFZc4kG7AsqQw3TaEkcdB6HRNYl3BfIyCN75GlM8Oe+24cvuDYriICGTK6yKAAvBF2lG0jS+CNId+VK/1qQjJvbSRf/FDc/OVud+y/C/Ntl8vJkXR9rZGJ6o4dlkpM+BB1oudaBcH078cFv+/FQAgEpDQAIC4cP4koCoLNW9K27NuceQn021j7a1TW4TURhE/r8jjCwNvz+rOxrOfnZHgVOloHjJNt19RcoJHfVDfqyj0hxpqjKCNiAvNsQXEo1tRPOP8l1yAfxpWdG70HS5Z8M10FS8gK7TuzWhbOOoAgR7IFooIl9xmjMv9WWn2knQPFxVJrSjM0RIyAfa29UrDqAj7WoL0oMpPDuoVR02dGPBsE7yaVdzXMqnhWaZd9rle6+02lxasni4CBr90Ofzr/CB17N/hhw8EeSSGeocJ6mTdD1DBDemTMc1pd05GYz+mXkX08+LMVuZco3BoawhdTo70cThtQHpsQs4NyvHjsN4jhl3jLooOErXvjwtpVgRy2as08PSHh2wpmTAlyTcx/GLlK9eHDd7b1ERn6XslcVa+x4leGwkf5Lb5fxSurAFXRNK5gIfnG4XaCwSOCEe+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(39860400002)(376002)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(8936002)(8676002)(4326008)(31696002)(2616005)(86362001)(5660300002)(66476007)(316002)(66556008)(54906003)(6636002)(6506007)(6666004)(478600001)(41300700001)(38100700002)(6486002)(6512007)(36756003)(26005)(66946007)(2906002)(31686004)(110136005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MklMSjJJNUZNaUZhZHJSTnE2L0ZJNS9ta3hIUkVyeUl1Z21wTi9qbm03MVl4?=
 =?utf-8?B?WE9VSVdSRzhuVkJ4QUNwT25jNTB1OGR5TUZMN3huNHVlU0hwMGxvL2Z5NVdZ?=
 =?utf-8?B?elRNQTBxUld6VVB0QUg0ZUFaQVJFR3hySTNuN2M0THJmcDhVbVZDNlRKdlVJ?=
 =?utf-8?B?a2c3VnZuKzlaNmxFa1pWU0FTZ2wwbzJDTFNwMHl5TWdJS1c1U0lMYnNtb2hZ?=
 =?utf-8?B?b29uSXBwTEhFbkV1dUl2eG1hWXdKUUZqQ0wwekU0aXo5YlRpWHpoMXdlTEJZ?=
 =?utf-8?B?blIwNURxSkoydGlPTmtnNFpjNWJXelNtL2NFb3JIeloxdGhoeVVqQWVKbzBk?=
 =?utf-8?B?eFQ1VEpKSU5LTWdaL2VGTUY5WHh4M2IyMjBTcXBUbjR2T1JPM0tyMm82Y2Rk?=
 =?utf-8?B?MEVJL2FtWkpTeG9tYUFXSTZEM2t4YVY0RXRMU3BKb3FaVmJhbWNNRjE4L1hq?=
 =?utf-8?B?SGR2ZTRLQkdsblFvcHV4MEc1OG94ejZ0QVR6bmFUMTVFVGtyMFJWK1ZrUzgr?=
 =?utf-8?B?cFVkQjA3Qmx1ai92UXpEZWRmRVNsN29Oc1pCd3pWTkM0VUhmdEUzY3o1TWJ6?=
 =?utf-8?B?MnlqNVBvUDROOUxVMFMycGpKODc2bUhxUUoyeExZdGRaQW9JYTA1MG5PUnhJ?=
 =?utf-8?B?VTRhWmFpNloxNzAxV0NmT003V3FqOVIwK2NkcS81ZjdsVWQ3RkNlWjl0YTcx?=
 =?utf-8?B?VHpXK3VweWtWK3RKUVJKdkxHOVhqYmp0RnViT0gwMHFjTkI5TFQ1eUF0cUlk?=
 =?utf-8?B?RHZFK1M5b0ZPbVVCVktXTzJkZ2Y0UWhFOGlVZDB0Tk42NW5IOGhDUmE5Rno0?=
 =?utf-8?B?eUc4ekFaVWltSWdxRG92Um5JTzRxVzJReXkzMGc5MktNUDUzZkdkR3hnM1ZF?=
 =?utf-8?B?SmVtZEpXdytHTitWcTBNdko1OHNVTUt0NFczQVRUdVhQVzZhS1RVWDRlOEk0?=
 =?utf-8?B?TThWTDBudXBBcXE3KzNaR3dZKzR4MUdrejU5OFFoV1czcVQwQktBQjZXeng1?=
 =?utf-8?B?VDZubDhPTFBhTERNTjZaYmg1R2l0VWpsb0tZa0psZzVxaFBMYUZORHREZ2Ri?=
 =?utf-8?B?SjFqcEZZUDkrUWhKRGZsMHVIelpyTUxFaFc0MjBYRHF3ZGRhMTZnMkJXNXNz?=
 =?utf-8?B?eHBWbEFzMFA0RWhQbGdiem5uRHhCNm0yeXRRY2E4TTdBRGFmMDByV0E1WFNq?=
 =?utf-8?B?dU05d2QzRHVQQ3VaNlg3Uk1YSUd1N1dRRWtPRzcwWGF6MmNDWXg0LzA4ZjJt?=
 =?utf-8?B?ZVNSSyt1dFFIQjA1RXVqaFJ5QWN3KzYydUpPU0NycklUbnlFNnYyV1ZPd1U4?=
 =?utf-8?B?RG1ZMUN5SUptYWw4ZmV2R201b05JOFRzQXIxUjBKR0phd0ZUdEt3T3Z3YVJs?=
 =?utf-8?B?dWRKSGQvdzdLVzZNaWJCVm9XWldBRE1xSlpXbE92Y3ozMWoyTTB5dFpyNnI3?=
 =?utf-8?B?M3VGWG85cjcxYlFvY2lqdUNiSHA3ZGl3UWExYnl2SjhyYTlqKzRhZUwrKzhy?=
 =?utf-8?B?Ly9Xc1VEaWVKOWN0RnhiU3Z5RndnVGhHeklqZ0kyRGF3b2lQQ3hldklXRTF5?=
 =?utf-8?B?MWhvYzVSQzlxOCtoZk4vK1NMZW5SNy9BM0t6eCswM3R3WDN6OGVpNDFHSkIx?=
 =?utf-8?B?UUxmTUJOenJsVXVrVEQzRXZlWjdvd3hVekxWajdPSlJiRktrbmNhZDVKeHlR?=
 =?utf-8?B?Q3VMaWJySlZMTm5xUEpjQzM3WExCdTRnUmh2bHc1eU1OcURGN0RMVDJlYzFX?=
 =?utf-8?B?Y0MzTURPQkR2STFPRldaWlJpMldiNm5OMndFQU81Qzg4VHplMEdGNWVaT2ZC?=
 =?utf-8?B?WmZwMlN3Y01uMXBreWZIN0xNVXVhZG5HUTk0eUJkczBkMklQOHg3aHFGNUUy?=
 =?utf-8?B?a0NVcllvdnpOZGk1RkhvZUFNQWYxUnk4N0NGbFdiNEN2NWZUL0thOUNidnox?=
 =?utf-8?B?bnliMVU5RWtxelNYQjM5M3RxTDI4Rm1XNE83bk1qVTBKQ1pwNVcrMCtmNEt2?=
 =?utf-8?B?N0tYQ3UvbHQ1NkpHZHB4UFByMFVBM1krMVE4RFZKOVJrZFhFci9qbTQ0cnh2?=
 =?utf-8?B?NTJGMWdQN1JVZUQ5b2tJS1E0cWdCZFFXUHIzU2hLdTYraFBCZ0x3MlBWT1li?=
 =?utf-8?Q?vyBQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4366968-0981-4f1d-00d1-08dbe77172bc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 13:31:04.6886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6CPZ5C0Qm2fRVAE8eN1M63Dg/CnNJ23vK1n4Fb/tTcRAG/eNTwXWRo41wWaTihs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6255
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No idea how you managed to do this, but now Amar is CCed on the patches 
he already tested and *not* CCed on the new ones and the cover letter :)

@Amar can you pick up the latest patches from the mailing list and give 
them another round of testing?

I will try to find time to give that some review.

Thanks,
Christian.

Am 17.11.23 um 09:49 schrieb Karolina Stolarek:
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
>
> Many thanks,
> Karolina
>
> v7:
>   - Drop size argument from ttm_place_kunit_init(), it's no longer needed
>   - Delete a TODO comment from ttm_bo_validate_tests.c
>   - First evict BOs before calling ttm_resource_manager_set_used() in
>     ttm_mock_manager_fini()
>   - Stop calling ttm_resource_manager_cleanup() as a part of the mock manager
>     fini sequence. It frees a move fence that is allocated via KUnit allocator,
>     which gets freed again as a part of the test cleanup
>   - Set use_tt to true in mock manager and stop passing in the flag for it
>   - Make ttm_dev_empty_funcs static
>     (drivers/gpu/drm/ttm/tests/ttm_tt_test.c:232:25: sparse: sparse:
>     symbol 'ttm_dev_empty_funcs' was not declared. Should it be static?)
>   - Cast bo->base.resv->fences to a generic pointer before it's checked by
>     KUnit (drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:98:9:
>     sparse: sparse: incompatible types in comparison expression (different
>     base types))
>   - Clean up mock managers in ttm_bo_validate_move_fence_not_signaled subtest
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
>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 795 ++++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 109 ++-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   7 +
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 206 +++++
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  31 +
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++
>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 282 +++++++
>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>   14 files changed, 2397 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>

