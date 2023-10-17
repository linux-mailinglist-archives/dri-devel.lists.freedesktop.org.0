Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710877CC2AB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 14:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B866810E2D2;
	Tue, 17 Oct 2023 12:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEE310E2D2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 12:11:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsQfGnYcKFXNrsn3jEn/GEukfikOlACd+mjygvscYs2/CC8P4H1KRW0iqC5Ci+QYYq3/ilDBXRWsx95vmszXtVtpCe3TOSIHaUuGrB9UUPVFXwo9Od03+Xq8rHZXpcdmf3LLKpj3PvffIyQnMFvssMMrGuvtdOWqiIQ7AltneTuNNmvdUmHVVOX1MDGJ++dbHsXUW+3o/8A8Uxw2+IpvNFMM/zGcF9wTRbH1OFew7InOTBkJ2AQyF6Cbehr//92vfwGkO3idaYkvtnbtuu3H4zIYYsJZ3X97/pbKznCjJ7VmxSmJlzokXIl8MoHN3KQyJG+76OM/ReEiQpZYKr8T/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+KG3OIK6u70rYo2sauknf7EAVzelPr4Gy3+R+yx32A=;
 b=DR78L7YVr7611qzv3O/mgaY8mpZtZSgJsZ15nQqKj4KCnBOk1KIW9e1AEl0xwxSqvYk2EQ+sGEtNS3MbQQlmP4pCf+acsudyK38zFpMNjQybkCZOR1Rfz76+/pTjArKxtelH8hbZNG1Q2Pbqo3kg7hxcW4HLRawNaXm+QHADKTebOLRlTeufeqqL/ChcyF7f/dFv72rNO3qNKNT4nV3ZLjZBB1IRilXsuz2vb4T6EhN2cDY916Q76KoHV48LewdJ08XMelQnWGctwi9vIxydr7a094ZbinY63cC8gV9HdEQGEs8hhzlcK5oJTk87NTDlnIx2uB84j+pYbmbbsro7Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+KG3OIK6u70rYo2sauknf7EAVzelPr4Gy3+R+yx32A=;
 b=Ta082WAtaFiGdx121GXFNcyu9RsBcd8qmbR9yRsckHbDpnFEeSQAhAQa1Eh0HMbpORKq2NRNPEemRmO04IkVp1acsGp0ei7hN4DoDA/Bfi799NnjjNbdwt4SSeG4vnIheGqxSYMzg6NrTD2bzon/zZ0RfPVyWxjKCbTBX9uhCxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB8068.namprd12.prod.outlook.com (2603:10b6:930:75::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 12:11:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 12:11:02 +0000
Message-ID: <179d176b-47c0-4cb6-b14c-17528024cfc5@amd.com>
Date: Tue, 17 Oct 2023 14:10:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] Improve test coverage of TTM
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>
References: <cover.1697445193.git.karolina.stolarek@intel.com>
 <9854008f-6755-4c09-9f23-90fa62911222@amd.com>
 <c9d088c2-341a-b315-a15b-8b8c0d487548@intel.com>
 <eb349ffd-eda1-0f15-3803-2cfe5c01f2a0@amd.com>
 <c2fd2bb8-7c98-4012-bc63-2e143abf4f65@amd.com>
 <09724727-b5a8-2e67-0ce6-cc301d95e4dc@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <09724727-b5a8-2e67-0ce6-cc301d95e4dc@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: befb35d4-9640-4e4c-453a-08dbcf0a2163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EkgYqRSvyHnU4800tl7schd0rHgxEU8Tx612BRbknoj6UmbxDPrYFeEVfL1Gg/ZucmUa4Ht54MMaT9VSou9YsENMRHEh/bTQBKPfsyYqDFDRSOJ9PzyA4yUMzFAeIYTfQG+LkYpx3SeXV8g3rlCMvrgK9dSGTAVyF4BUoLTIhRmQ9NhZNF9qWcBBA17Qjx2tpD8j4iwF+KbqWN93g/6J82aA2L9onuqWTu7WVwEk51NU67m20iPm3YqCGLeeqSewc8B+DSfV96VgX0uJaYT3gS+hzyWdAcOuinzIsT4RsgeL2iuYozn54E/AfXD88Ev0ft0qQyZTrqjRm4X5Vsmc/b0Cos43OjvJWeqqehFCnTSmq6vRftUZaTc2IoN/YPcRiN83wRgv+VPWVMtNGpaue0FTMmI35ELGqGovNslV0X4I7kpAVSpqoULNP/6j3NfEP3NZ1y370TB2qSM+mTWWIVAlFFffNl5COYLf+3wTTv7mCaqGwzf1kNw+kkZg+r6xidmkGkrIOohVXDYRdqHbL4BIZ5ZTwiVani9D12SmxACVo0ah9ii8Uk7EIn/v9ZH8/aNrpxXMpA6zanqdrCgC4Wj9yZ7JGg3e5se9rLpI5c0o4qYdt2I2YCMb8FJWUtNcqwrcqssHRXKyVQrjHlec6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6666004)(6486002)(66946007)(8936002)(38100700002)(6916009)(54906003)(66556008)(316002)(66476007)(2616005)(6506007)(53546011)(26005)(478600001)(8676002)(66574015)(6512007)(4326008)(2906002)(83380400001)(5660300002)(36756003)(86362001)(31696002)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE9rRHBaS0hDcU9XUmpEcTNyRGhNWmlaOVRDQTVRRTRnOEJiQWJzdDJvWmJm?=
 =?utf-8?B?OG1qKzkrMGI0VFFNa1M0SWNoTXlkY0NXUDN3Zmp0UWlTbjlDSjVKbVk0c2Ux?=
 =?utf-8?B?SGNRcjV1NlpHQmZEWnRwOTIxTEtlSEtZNWxMTXkwQUhEdXprbk03a3hwQXUw?=
 =?utf-8?B?Z3U0T1BtWWZFVVZPRyt1Y2NqelpNajJQQnRvZTFQYVBLbG1JMXZIbTZ3dFNO?=
 =?utf-8?B?WXBYSEZkTXRzS0s4bU96NTltTW9EUURWMzhZcFE4QzBzbitLY0lxUVRybklS?=
 =?utf-8?B?cG01ZlNiUXkwU3ExTnFLSW9sK3Q5QXI4Y1VoWHhxNFUxQU0yV2FweE5Dem9o?=
 =?utf-8?B?U3YwNlBSZzFoaTZrSkxhemlGZ0E4VXJ4MHk1SW02QW5MVnNJOGQrdjNzK05Q?=
 =?utf-8?B?Q25oakJ1TXhmMmVSNXNpSnVDM3BZTDQ5Y1NpeGF2VjIvR1l5Vzd6ck50L1Qw?=
 =?utf-8?B?c2ZSUXJacExoSFdodURYYWV4RXVBRklmcDd3c1lxNUU2MzVmWGNSUzJlZG5N?=
 =?utf-8?B?ZjlRdUFuNmlYYStRdU9UdHFMRlZvMkl2aVVaSFFVUVFnalBTZnlWU1lyOVgy?=
 =?utf-8?B?Y09FbGpNd2lRK3g3bHBXaXNXb3ozazhiUDRWZXYrZnIwaDV4U3VtQmUrMVUr?=
 =?utf-8?B?cEJHQUhORDY1ZHdSTHRYZWFRb3dyTDB3YVpRaGF3TXpqTENrTkVEMVhqNVNP?=
 =?utf-8?B?eWVVaHoweDRLMjJON2krUXZoMDdONThCdUdUZnRkMk1LVit1ZnMvYVB4N2t3?=
 =?utf-8?B?QmtIZHRuZll6WTJGdzFKQi9wL1NvQU4rcUVHN0pzNmFJbWF5UEpNS3RQV0Js?=
 =?utf-8?B?VTJiZFRKTWlXL0dOa2lwc00yN0M1ZHA3TklIVmlwZVpoVUZ0ZkhnTnJiNndF?=
 =?utf-8?B?bTNXTUVSRmhuY0RqV01CczRrWGRMZlJBbWNlTHZYeGI4bHFWS0IwV0Exa2Nt?=
 =?utf-8?B?WDA1VitwczFzQU96Q20ySGNMWEc3Mk5YbnJLZXNRTHBBb1l1dk5jZ3FjMGFs?=
 =?utf-8?B?VTgwTUhpM2dzRkdzOHNyYkNJdmhhUjMwc0hHb0tHSmZjUUt4N05KZHg4MW10?=
 =?utf-8?B?YXpmTFlvVExuQ0QySHJ6cHJicTRvVzEycFl5NFE5eU52RWt4c1ZVTjNZMTRr?=
 =?utf-8?B?Z05TU2ZvRGUyTFN6N2NTNE1sbHNEVU5lZTlqYmJTU2t4QUZuR09RMEtUZVR3?=
 =?utf-8?B?aHFCMEtaUzZFSVlwZVhwTXNWK0dnVFVwVXdEaVVja0hnWmJqMmFFVXZQbmpB?=
 =?utf-8?B?ZTNnVGdzTDFOU1BUVllCcDJZUm5HU1FGZFlET0NWK1VJNkMvc1VhbXN6a0R4?=
 =?utf-8?B?WlVXWHg0NEN2Q1M0K0lYUkRhS3crNnFwcEhXbU05RXN1V1cxQ0NHL0R5S1Qw?=
 =?utf-8?B?V1gybmduRTBQMmQ5UkFqeWNWTXRGT0Mzc3BoaFllVURMYXZEMGVud3pVT1hy?=
 =?utf-8?B?UkhuU2w4UGF5S0QzdXorbHNydzdyQTJjUW1ZOVA3M0Q4Y1RBU1FkQkZkNXEw?=
 =?utf-8?B?S3JXZzJ1Wkgxc2NvQXZVZU4yVnR3Q2ZCQXRCb0owOGw2Vlg4Zm1CVUpicS9W?=
 =?utf-8?B?VUl5dDlsbW9WMmhNb1F1RXdST1ZLeEsvUllzbldscXlHZml3Qkh6M0VPbW1Z?=
 =?utf-8?B?ajBHVGQ0K2dOREdZUWdTeHlKRUU1MXNCZlR3OVdrdWRJb3F5YjNvRFZaUzRm?=
 =?utf-8?B?NjRHRmxkYThIcnFUeHovdTdrTWY2Q1NDeWR2Nk5PeWpxVzkxU0o2WkVmZ3Er?=
 =?utf-8?B?Rzl3R0RtdlpwUmFSdUZtZGU3VnhWNGFiL1FWK014ajFqWUkvZHRuN01NWWVE?=
 =?utf-8?B?TWIrM29QMXlQMm1ReEk4eC9jNjJ0VWpWMFlXWElsRU5MZk1ZUERzL1VKNnZJ?=
 =?utf-8?B?VUtXRGdsZzc2OEptZTcyWE9xbkJwU0NaaCs4THZPYjdoZVdOdVB2NkJsSUkw?=
 =?utf-8?B?aXBKLzlzZ2Zza1l4MUc3ak5TMDhOaCsveEJ6QUZvdDl1Q0ZsSEI0YlloTnhk?=
 =?utf-8?B?eTM0K1BhQURSbE5ZQVBVRjJnOU5DWTl4SDRpY2VIbHM3Q2REOFVOb2o4KzNz?=
 =?utf-8?B?cHJvcjNCaFFBUHF5bnhrcXY4aVpMS0YrQ3Q1dkhRbk5XWEp6YTFMNTdZSUda?=
 =?utf-8?Q?sG6symjfwexbiT6oFO2pqa+P5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: befb35d4-9640-4e4c-453a-08dbcf0a2163
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 12:11:02.1210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lL0ZDKCOFUgyI8zsy7bEXq9zEFSdaG6mevycpOH3zX+Rl5xZVsAP8QHbR05n+mqn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8068
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
 dri-devel@lists.freedesktop.org, "Somalapuram, Amaranath" <asomalap@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.10.23 um 14:06 schrieb Karolina Stolarek:
> On 17.10.2023 13:57, Christian König wrote:
>>
>>
>> Am 17.10.23 um 13:22 schrieb Somalapuram, Amaranath:
>>>
>>> On 10/17/2023 4:35 PM, Karolina Stolarek wrote:
>>>> Hi Amaranath,
>>>>
>>>> On 16.10.2023 15:08, Somalapuram, Amaranath wrote:
>>>>>
>>>>> On 10/16/2023 2:22 PM, Karolina Stolarek wrote:
>>>>>> Add tests for building blocks of the TTM subsystem, such as 
>>>>>> ttm_resource,
>>>>>> ttm_resource_manager, ttm_tt and ttm_buffer_object. This series 
>>>>>> covers
>>>>>> basic functions such as initialization, allocation and clean-up 
>>>>>> of each
>>>>>> struct. Testing of ttm_buffer_object also includes locking and 
>>>>>> unlocking
>>>>>> the object for validation, with special scenarios such as an 
>>>>>> interrupted
>>>>>> wait or deadlock.
>>>>>>
>>>>>> Some of the test cases check the bulk move mechanism and how it 
>>>>>> interacts
>>>>>> with pinned buffers. This is to be seen if we want to add 
>>>>>> dedicated testing
>>>>>> for bulk move or not. The resource allocation subtests use 
>>>>>> ttm_sys_manager
>>>>>> for now. Resources that don't use system memory will be 
>>>>>> indirectly tested
>>>>>> via tests for ttm_bo_validate()/ttm_bo_init_validate(), using a mock
>>>>>> resource manager.
>>>>>>
>>>>>> Use kunit_tool script to manually run all the tests:
>>>>>>
>>>>>> $ ./tools/testing/kunit/kunit.py run 
>>>>>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>>>>>
>>>>>> To build a kernel with TTM KUnit tests, first enable 
>>>>>> CONFIG_KUNIT, and
>>>>>> then CONFIG_DRM_TTM_KUNIT_TEST.
>>>>> Tested [PATCH v4 0/4] Improve test coverage of TTM patches on AMD 
>>>>> platform, looks good.
>>>>
>>>> Many thanks for taking a look.
>>>>
>>>> Do I understand correctly that your Tested-by would apply to all 
>>>> the patches here?
>>>>
>>> Yes, I have tested all the 4 patches together.
>>
>> No time for an in deep review, but I'm going to pick this up and push 
>> it to drm-misc-next.
>
> Oh! Could you at least take a look at ttm_bo_reserve_deadlock and/or 
> interrupted subtests? I'm not 100% sure if my solution is right.

Than this will have to wait till next week when I have some more time.

Christian.

>
> Many thanks,
> Karolina
>
>>
>> Thanks,
>> Christian.
>>
>>>
>>> Regards,
>>> S.Amarnath
>>>> All the best,
>>>> Karolina
>>>>
>>>>>
>>>>> Regards,
>>>>> S.Amarnath
>>>>>> Many thanks,
>>>>>> Karolina
>>>>>>
>>>>>> v5:
>>>>>>    - Actually use the page_flags parameter in ttm_tt_simple_create()
>>>>>>
>>>>>> v4:
>>>>>>    - First unreserve the object before calling ww_acquire_fini() in
>>>>>>      ttm_bo_reserve_double_resv subtest
>>>>>>    - Silence lockdep in ttm_bo_reserve_deadlock subtest (open to 
>>>>>> suggestions
>>>>>>      how to fix it in a different way)
>>>>>>    - Use a genuine GEM object in ttm_buffer_object instead of an 
>>>>>> empty one
>>>>>>
>>>>>> v3:
>>>>>>    - Instead of modifying the main TTM Makefile, use
>>>>>>      EXPORT_SYMBOL_FOR_TESTS_ONLY() macro for symbols that are 
>>>>>> tested but
>>>>>>      not widely exported. Thanks to this change, TTM tests can be 
>>>>>> built
>>>>>>      as modules, even when non-exported functions are used
>>>>>>    - Change the description of a patch that fixes 
>>>>>> ttm_pool_pre_populated()
>>>>>>
>>>>>> v2:
>>>>>>    - Remove Makefile for KUnit tests and move the definitions to the
>>>>>>      TTM's one
>>>>>>    - Switch on CONFIG_DRM_TTM_KUNIT_TEST=m so the tests and TTM 
>>>>>> module
>>>>>>      are built as one. This allows building the tests as a 
>>>>>> module, even
>>>>>>      if it uses functions that are not exported
>>>>>>    - Fix ttm_pool_pre_populated(); a wrong flag was passed to
>>>>>>      ttm_tt_kunit_init() function
>>>>>>
>>>>>> Karolina Stolarek (4):
>>>>>>    drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>>>>>>    drm/ttm/tests: Add tests for ttm_tt
>>>>>>    drm/ttm/tests: Add tests for ttm_bo functions
>>>>>>    drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>>>>>>
>>>>>>   drivers/gpu/drm/ttm/tests/Makefile            |   3 +
>>>>>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 
>>>>>> ++++++++++++++++++
>>>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  51 +-
>>>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>>>>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
>>>>>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++
>>>>>>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 295 +++++++++
>>>>>>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>>>>>>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>>>>>>   9 files changed, 1313 insertions(+), 3 deletions(-)
>>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>>>>>>
>>

