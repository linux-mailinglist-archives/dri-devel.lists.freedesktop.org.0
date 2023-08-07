Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4916C7728A6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 17:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A71410E1F7;
	Mon,  7 Aug 2023 15:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338E710E1F8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 15:06:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2diagJQb9tZUeUX6fp13tmDjyQxKOUjOpS2tniqF4zlQCxPxP6f+QrnwjYs2hU6zx6W/m/AXf1pGqW7wvogd/npmR+RNUifo7eeyAa5WdHiZcedxZF1XZ/wRt+s7ofRMhRyePwPnACEDxmfdUzvuXJLenG2UL7ieg9xLNraAS/zk+4MlOD9Zd3jGcMpRZAsWpkj/ed1jPOMT5i+VXqVB/JXbYfpkt75zdLoDrOJPpfS8IYvwTy9O9Ia9jeMcdmy35AM290CK/2ZqGDCHFd1CZNYn1X9XglvgKcEBtJgyuuCvVzMAltysn81k4L0WRkkvi0vreykFJ/WH2KXysH/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZb1fwa+Uxxl7dTlBvsQ3wn3EvcLmPL+tCnlS0hzLJg=;
 b=NIFWO2AFc7T3jm4w4vBUsxSydIQHneNz/0T0wUFvDgWcQqSB4O9rDmTukH9+V+Ei03dBJGk64cTrF+bSLxcqEVoGfsvoOXJbvNNu2K2daCU1lbAvzXQctdQx4ne6+mWfRhyFY+OY0pqFBsgrR9Niy5vmeQZiE9+QLgSkhjygB2uaPf8ov2uPtbShzbxBSD4QbbptVCl0tfVpuAJXphKTUZaW+gcH5iRgyEvlerKcANYmJVipPwf4anFIXqUaJAWifolLMHj8Dq8aL3BwWGWx86TlA+SiyRgjFT2+60ira14OlBaoWAH27YekMtu2CAI9rs+a3uxtAQza/O8J4JRmaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZb1fwa+Uxxl7dTlBvsQ3wn3EvcLmPL+tCnlS0hzLJg=;
 b=E/knLCq2D0e+LrZudKXKGotXGQIVpJiJF+MZpIQAmBIe6K4wyULDeQ4T7aFr60f94vXVFIMyJMT0RnflnRM2Q9tPndGipteNmzgSuDzCIsBVJtPLkbMJSjsOlDkeAzTQPEusAzFHFdxYglCm3J1pUWViH6g7lG5ekXe4pUB1RHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CYXPR12MB9388.namprd12.prod.outlook.com (2603:10b6:930:e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 15:06:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 15:06:33 +0000
Message-ID: <406ed60b-6c78-fa2c-0e85-ed171f5babbd@amd.com>
Date: Mon, 7 Aug 2023 17:06:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC v5 0/3] Introduce KUnit tests for TTM subsystem
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1689343130.git.karolina.stolarek@intel.com>
 <c22c2984-70fc-be19-fd7a-a99e06003ec5@amd.com>
 <47890cdd-1ab8-49c5-be64-5927d5640c21@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <47890cdd-1ab8-49c5-be64-5927d5640c21@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CYXPR12MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 2173f036-7db4-4785-587c-08db9757e315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iYCveDey4cZaJ0TOLNq4Ah6A7okWKtYXWUyDD6CTisGeR/mp7q8EmpNN6yQXKhnjXshFrOdSEOl6u/eRS56lqDaLTDh+2ao8vGGOtE98sR4hLwbQDAK4+E7m12Xr5hg2/H+oKj9RHqCKTwX393R7Zsdb2I9gjXRJY/79K+OHDGLMNHYuS2yU0T+a014tPOfl4M6R/6qsQW6KLxZCifcqLQ3EOJA2BH7/pmB3m/F3U234TEa3mSINvztX+lbTbfSWewX14qI+CAlztjo2CR6f7apFUHpGPQt23dD8SCUU8jLlvaKN2Yf2WkVJWJ3f7ng2UMbPHAeku6h3K4zWQ/KQ6YRcRIBiN41+ZNIuCUtKGr1JTfWDiXekHO3gCjEElOEXkTwNyEYysudyolcq238fnR5+VPr9C4JKYbUyAjvBOIjOuBOdqtDuisfEcK4t1HVzHqNfJ0K2Pt//18X6xmKRwuDctDXcSYJIgQbJRb260ifGXgCv9XOncT0M9a317LR1pi5rNPqZh3h/1iLDktd+mwer1ZPX8Gj7tAuAziOPD7vyGNn8rxGEyHQQY2vTRWMrEFyj/mRvhb3PYqV/uOCbw80bJtDNyqyEJd3RbIT/HvOtv1z1N3Va1NyVEX1Ru4BzJAMGX2fYTVVeQReldCzVrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(1800799003)(186006)(2906002)(36756003)(83380400001)(5660300002)(66574015)(2616005)(54906003)(38100700002)(6486002)(66476007)(66556008)(66946007)(966005)(6512007)(4326008)(316002)(31686004)(41300700001)(86362001)(31696002)(8936002)(8676002)(6506007)(478600001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnZIem15d3lqbkJYeFp6NzNlbUNOaUFiY3hsc3huNEV1ZGxjRERDbU9scGFJ?=
 =?utf-8?B?TEZ6aW1CeHBYaC84UUVZTVZ1b2VJYWdCaG1ZZElWcS9BVFMvNTlQeUZrM3FH?=
 =?utf-8?B?Vml0K29xakd0UEpZcHBCcnYvRVZOQi9iVkJ2Y2pzSkdCM01oenVTcEowL2lZ?=
 =?utf-8?B?OUJwQ2RsSlFVa0lqRlVvMXlzSEVxMWR6YjJwMmNMT1cyRWpYcVVmZVJhanQ0?=
 =?utf-8?B?V3BFZEVPN0I5cDB2dzgvV2JrZDFCa2VyL3RpU2EwMW5tdzBEaVZXd3BsYkk0?=
 =?utf-8?B?cmx5MnNPU2ZkcDBpbDRRczNCdWhyR0htcndtd3FQbDhaUEdaVDJDZFVVVXUy?=
 =?utf-8?B?UE5CbFpwQUtxaC9uU0YxbXFSOU1hMktPMU9qUXVlN0JhaStZMzB2RkpEN3gx?=
 =?utf-8?B?YW9INXQrZWlBcTRxS1RzTUs4RHpIeVJNM2lhU29BeTRPb1lPdFVKRVljZ2xR?=
 =?utf-8?B?T3BzZUE3WklHcGxvVHR4TS9aL2RYZ25wZUJHYUJuekM5d0VXRW1JNi8yR3Y3?=
 =?utf-8?B?Yk9YbmlJR2RiaG5FR1B6OSt3VW9tZGsrL3dQRHBnc1pwcWlWMm5SOTdHa2hO?=
 =?utf-8?B?b1hLZHJ2ZXFzRW05ZDdCM3o3SnlUcE9XY1h2YzVoWjZqUm5yNXFsc2c4WmVs?=
 =?utf-8?B?WWNCaEl3YWZDaDM2ZDB2U0N4bnBTc3haeGZoUGcwSUEyVjhmR3FYTlh3S2tT?=
 =?utf-8?B?aWpVc01FdVhDUngzYnZjQVNwV0QyT2RiZ1p1TEZQYlIzNmdXa1RrcFFYcVQ5?=
 =?utf-8?B?QXY4anNJMzNEZ3BPSTJVYmJFd1lpMGhOTG1HS2lacHZLRXFEZWRxVmpTTFVY?=
 =?utf-8?B?Uk1KYXBwYWJjNXpNaGRSd3pSM1RRREowQUJaYmNFSjBPNzJ1akwySHNnd0pl?=
 =?utf-8?B?YjhORnhrZVBwcUNZS3lVTllYNzFOZGRSQUhwcG5TVW82UDA1bmU0YmhkVFRa?=
 =?utf-8?B?TnJoRFo3dDhOMXBuZ2FCRGoyTjk0UmFtTHNvOVpLcGRudXBXa2VkVnpxS1Rk?=
 =?utf-8?B?MThLRHJaeEIxOWp2NncyL0lyYjZNYktYK01vMVVLKzlVTXBMUGZ3MjV1cGlP?=
 =?utf-8?B?Y2ZXNmx3ckJuMHhoRTVabGJ3TXJJSEdGd2UwUG92VlNhZG9ENjRGWlhaT2Rl?=
 =?utf-8?B?L2gxNEdIemJ5QWFqUWltaWg0Zm5EdTF3YXhCa295Q0FaeTRlclhncTFyOTRK?=
 =?utf-8?B?UlozME43VndjVkdnRmZwUTFyL0czQUtQc2FlOTh6TWx4Y0kvMDZFRUNqbDdn?=
 =?utf-8?B?WkJGNC9VUlNJWENpZTBsRjIzU0dXUSt1RXNaZW1Cam5ydXh2b0p3YUd1bjNv?=
 =?utf-8?B?M1doRFNEYkoza0h2NGZKZ1pWT2w4WHlieU1kc3k3ZVdkVmw2RERRaUJwSEhS?=
 =?utf-8?B?SGlaRkh0RE4rLzR5TUxzMGY0YTJoTGVqRFdVcXdQMUh6TGFTRlMrTzlseDlD?=
 =?utf-8?B?WTduSy9zaStvWU9ETy9kNGVvbk11T3pQNUloL1dzelpzUXB6VXdmYityOEdx?=
 =?utf-8?B?eDdaeE92WGlLRVZzVlVoRTk3WHAxSW45MUQxbTlNcHNJc1Rsa2lEUTd4VEhN?=
 =?utf-8?B?cjdBbkVNZ0Vjb2hNNFRIWUFTRkczeUg5VThzQmFzUlRmNysrSVpWTFlGdzRj?=
 =?utf-8?B?MGVGNXd2ekdWSG50K0d6c29vNVh1MGZMdGgzQkFQd3NwUFNkMmhEdFlEYU1r?=
 =?utf-8?B?cVptWW0vSGxTWWhVN0s4QzRKSHF6MEg1aTFKSUZJTHRJTFZmVldVTm9lTk9R?=
 =?utf-8?B?bEVNV2FnNFRRa01DdEt4bGltYStJOEJtWUlodkczdEw0VDFHN0ZBdXpWQTZ1?=
 =?utf-8?B?K0g0T21FQThBMFRYYUlUcUxPcnBCeFp2VzBPZXF4SGtzdURleUk4MmRCS2xy?=
 =?utf-8?B?czY1Z2lPQ0ZyOTBtOCsraHhtcDNpbFBWanBLbzVaTWtFYUxnL2ttRlRaUkxB?=
 =?utf-8?B?dFYxVjN5QlQ2RStUeUlxU1ZjTjhJa2VyU2drNGo4RWp1a2hudThTdEI4ME9z?=
 =?utf-8?B?NGU3YzNrczRTOW1ZM2hEeHdjQWIwYWhINFh5V3VITVRnamtXY08zVi9RQjJG?=
 =?utf-8?B?dEt3SlI3a0NtVGtaWlZUb2w1dlVpd3hYTG5HbkZvQ003WkJua0llVkxLdXNL?=
 =?utf-8?B?OHhjQnRTOVloM3NuZnNNbFFvdi80amFWcERDOVBtRlNjZXJ5U05YZmpsSHIz?=
 =?utf-8?Q?QfxpH/hTZBFvQW2eFoneHrtkDI6Wz5qLNYLRoy+5nzkU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2173f036-7db4-4785-587c-08db9757e315
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 15:06:33.3989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EU5c3WdKUeyvUuOZ6i6rXYe470ARmHKlQ7GYnFP/Ino1ogn7EnYUxrMfjf95XIL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9388
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

Am 07.08.23 um 14:21 schrieb Karolina Stolarek:
> Hi Christian,
>
> On 3.08.2023 09:56, Christian König wrote:
>> Feel free to add Reviewed-by: Christian König 
>> <christian.koenig@amd.com> to the whole series and push to 
>> drm-misc-next.
>
> Thanks for reviewing the patches while I was away.
>
> I don't have commit rights to push it to drm-misc-next, so I'll go and 
> find someone to help me out. Still, I was thinking if I should send v6 
> of the series. I fixed a couple of small issues while working on new 
> tests, like UAF warnings from my kunit helpers when running kunit.py 
> with --raw_output option, but I can include them as a separate patch 
> in the new series. What's your preference?

Please send out the series once more based on current drm-misc-next and 
I can push it later today or tomorrow.

Regards,
Christian.

>
> All the best,
> Karolina
>
>>
>> Thanks,
>> Christian.
>>
>> Am 14.07.23 um 16:10 schrieb Karolina Stolarek:
>>> This series introduces KUnit[1] tests for TTM (Translation Table 
>>> Manager)
>>> subsystem, a memory manager used by graphics drivers to create and 
>>> manage
>>> memory buffers across different memory domains, such as system memory
>>> or VRAM.
>>>
>>> Unit tests implemented here cover two data structures:
>>>    - ttm_device -- referred as a buffer object device, which stores
>>>      resource managers and page pools
>>>    - ttm_pool -- a struct of pools (ttm_pool_type) of different page
>>>      orders and caching attributes, with pages that can be reused on
>>>      the next buffer allocation
>>>
>>> Use kunit_tool script to manually run the tests:
>>>
>>> $ ./tools/testing/kunit/kunit.py run 
>>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>>
>>> To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, 
>>> and then
>>> CONFIG_DRM_TTM_KUNIT_TEST.
>>>
>>> As for now, tests are architecture-agnostic (i.e. KUnit runner uses UML
>>> kernel), which means that we have limited coverage in some places. For
>>> example, we can't fully test the initialization of global page pools,
>>> such as global_write_combined. It is to be decided if we want to stick
>>> to UML or use CONFIG_X86 (at least to some extent).
>>>
>>> These patches are just a beginning of the work to improve the test
>>> coverage of TTM. Feel free to suggest changes, test cases or 
>>> priorities.
>>>
>>> Many thanks,
>>> Karolina
>>>
>>> v5:
>>>    - Drop unnecessary brackets in 2/3
>>>    - Rebase KConfig file on the top of drm-tip
>>>
>>> v4:
>>>    - Test helpers have been changed to make the creation of init/fini
>>>      functions for each test suite easier:
>>>      + Decouple device creation from test initialization by adding
>>>        helpers that initialize ttm_test_devices, a struct which stores
>>>        DRM/TTM devices, and can be used in test-specific init/finis
>>>        (see ttm_pool_tests.c for an example)
>>>      + Introduce generic init/fini functions for tests that only need
>>>        devices
>>>      + Add ttm_device field to ttm_test_devices (previously
>>>        ttm_test_devices_priv)
>>>    - Make TTM buffer object outlive its TT (Christian)
>>>    - Add a dedicated struct for ttm_pool_test (struct 
>>> ttm_pool_test_priv)
>>>    - Rename functions and structs:
>>>      + struct ttm_test_devices_priv   --> struct ttm_test_devices
>>>      + ttm_kunit_helper_init_device() --> ttm_device_kunit_init()
>>>      + ttm_kunit_helper_ttm_bo_init() --> ttm_bo_kunit_init()
>>>    - Split ttm_kunit_helper_init() into full config (with ttm_device
>>>      init) and basic (init only with device/drm_device) initialization
>>>      functions
>>>
>>> v3:
>>>    - Rename ttm_kunit_helper_alloc_device() to 
>>> ttm_kunit_helper_init_device()
>>>      (Christian)
>>>    - Don't leak a full-blown drm_gem_object in 
>>> ttm_kunit_helper_ttm_bo_init().
>>>      (Christian). Create a small mock object just to get 
>>> ttm_tt_init_fields()
>>>      to init the right number of pages
>>>    - As a follow up to the change above, delete 
>>> ttm_kunit_helper_ttm_bo_fini()
>>>      and just use ttm_bo_put()
>>>
>>> v2:
>>>    - Add missing symbol exports in ttm_kunit_helpers.c
>>>    - Update helpers include to fix compilation issues (didn't catch 
>>> it as
>>>      KUnit tests weren't enabled in the kernel I tested, an oversight
>>>      on my part)
>>>    - Add checks for ttm_pool fields in ttm_pool_alloc_basic(), 
>>> including the
>>>      one for NUMA node id
>>>    - Rebase the changes on the top of drm-tip
>>>
>>> --------------------------------
>>> [1] - https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html
>>>
>>> Karolina Stolarek (3):
>>>    drm/ttm: Introduce KUnit test
>>>    drm/ttm/tests: Add tests for ttm_device
>>>    drm/ttm/tests: Add tests for ttm_pool
>>>
>>>   drivers/gpu/drm/Kconfig                       |  15 +
>>>   drivers/gpu/drm/ttm/Makefile                  |   1 +
>>>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   4 +
>>>   drivers/gpu/drm/ttm/tests/Makefile            |   6 +
>>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 212 +++++++++
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 115 +++++
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  41 ++
>>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 441 
>>> ++++++++++++++++++
>>>   8 files changed, 835 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>>
>>

