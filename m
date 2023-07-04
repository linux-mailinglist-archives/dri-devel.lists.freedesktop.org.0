Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A7B746A42
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BD610E297;
	Tue,  4 Jul 2023 07:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B6E10E294
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:01:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CObCPd0DrnI0DlPwieIBqOvFAr3Jksoola8yA3s7JUpZXFlIB1ki4c1u3CPen4m/uC58ryhuFAE/KXR6/5q+Onlefu82dqQb1bJXDxMMOETNqkfiF/DrNj1PPuHQTwGXuiiOW5TtbyYw4V5oxtwImPPKJ2LHyKH+L/DzWJ/ggyOSPo4n3fKeNxV7yteQ05X72vBvfzvjo1oRZZcCtHz2K0RuirLfjbbajSu0aK1/KPINtdFYi6JSQVSo/qoDCoOr0fdPOf6iYe9sh2VzS2xcUpLzp6dzfGgwuVyGBp1q2Ssl6HlNRybLctw1y9MVNAdrthBYhA8y/t7akj1YMzgJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuVzBjMGFt8biceMtZW65pQWuLSPRrq3p4czU9BQjqw=;
 b=ZJrX2+DvluLeYNGV7hr/uxxGYHrl5GHHKE+8hnvAGuM/FJWA14MVKh6C0iZnuqcCsOv0QXmBW2w5nZfSohvfYdy2E5qquyEw2WaG41WUwT+yW/sBPSHGkBmOIbW3Ntxi+6JHzcL99YadnB3ZlkXJQ5QBzs9uuuPvOl+faVjrIg63ZF2BL8yK0htsbq0WMWnEXDzkU1ZTd8E9fDUZ2dvqcwF3AYMCdIrnK2EN6LHkna8HyrZOyrn2ce7a8hOzcnKPwEKKwOFqxgoMUCCFEiDM1QTQgWXitB+ggc/2AgJ3Nj8CDWzhy6pNkqLLCZjIH7K+rfuLdTDkAw/M0UM/FE7COg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuVzBjMGFt8biceMtZW65pQWuLSPRrq3p4czU9BQjqw=;
 b=sNxx0B0j1wdrEAOXA8JJdWHkbqtcfrbdej8mOQFpEQV7iQbURGtLq/NGsB97WK07ldp/YRq0oEtCvfjbUuqD3SZC0Pk1QAwqD9fr5xvJh9y549OyUx3lJ93Crmid8rcH3VmVhI61XIS4cKas7CM8zpdyYD6LnRofKkktPP9i8l4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 07:01:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 07:01:35 +0000
Message-ID: <21035a4e-daad-3928-1535-3d58bc82564b@amd.com>
Date: Tue, 4 Jul 2023 09:01:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC v3 3/3] drm/ttm/tests: Add tests for ttm_pool
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1688131205.git.karolina.stolarek@intel.com>
 <1726d758b3f7e5ee10b168102d5e207479324442.1688131205.git.karolina.stolarek@intel.com>
 <7f761d03-6387-afc7-989a-9dc791fe04ed@amd.com>
 <13fb6ee2-d157-7e1e-90ae-b1828e5a2745@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <13fb6ee2-d157-7e1e-90ae-b1828e5a2745@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: 8069735c-5543-48d7-0286-08db7c5c817c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d1DCKCc6QgEG0Qhbo6rh4QqYDypXbQSL5Ri+hY6i9OG6vjM7+ZK2Yd6+Xgf+J838WT4x3PCZlPgquXM1J4cffEINLU7WVU8cQBK1jHDNf2p+Xv4OKNT64sr/m8XE67vKuWs7tQEDzVBRaIwloR16dOw82jmy4ofs3+Qpb9gzYDi4fc3mC7+DRf9OyuSDwtK3a4rxDxHn1Hz1lMj+aWWXTydiywIwkwPkJrmocA06jhqXYc/Ne8Ms1PeFV/zZEPjThPemVVstbbyLlzn/DjxzDvF3NkJ0mYtERB+2iqNmuXlQUQKQZCY+5ls8ArXHbQ8vsowIt341QYU8VSP4ojVz9t8O7dHIvvgT9StlQtB6w5ni4yeD5WqLIH+HgKVdQCcQkBaj/Pdj5+ZQhGN49zh23OU5VTjQ5YeKX37Jk7SPMVAgrrNcK83Q6BizRjoJsJImffbDflzPi7t0e9ivK5PBiNsFTFJ6Q8Ny1moD1xsNmyMrtydog5qGypMdHtf4HEXuCW9UoXHaVXGtoIQ7aPnAOMC5o+Rmlj5103tWK9Vd1A+jAZuo4mqtuJqoQdWWrhnfvg+W50mtpTEkVpFPMzcAakvmKTCBqEKvRY2xXbgk6rXzfQcyF9J4ZrwQBU/5GM/Fc6k+bPnBytXDGiP2xHPTeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(30864003)(2906002)(41300700001)(5660300002)(8676002)(8936002)(36756003)(86362001)(31696002)(186003)(2616005)(478600001)(31686004)(6512007)(6506007)(6666004)(6486002)(316002)(66476007)(4326008)(66946007)(66556008)(53546011)(54906003)(38100700002)(66574015)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGk4U1VuRXRHeCtsN3hFckRnOEJBamRYcmNjcmNEck1HTkNMUkhHRjBJWjlO?=
 =?utf-8?B?KzQyRzVTZFpPTHdFZGRYSlo4ZENoLzNyVXlDUTN2MWZlWldMak83TXA2VFM5?=
 =?utf-8?B?ZjlhR0pVVkEyQ1BFdTRMUS8xOFJ4S0QzeVJhbDZhMmgyakxaK25oRlYxa0Jm?=
 =?utf-8?B?ZktLc0x2cEYvcThJSTJqT0FTSC9iUXJzOW1yZ0tQRm9EMU1RQVZiOVc4WlQ5?=
 =?utf-8?B?UlI4dkp5RHpmWnhkbXJjaHBSbkNrNFJsTjdUWWxFd2w2ZzRjeFQzMi9zUHJw?=
 =?utf-8?B?QWtsL1NpcnZuaDRMWlA4TlRmRDE4VzlGa0tkL0oyTkNvUWFpNmY3N2hKUkpk?=
 =?utf-8?B?ZjBEV0tCazIwaDExUk1YU2JSRldwczRMenNtVmVrVjNuZzZjVmZFK0VFRDcw?=
 =?utf-8?B?NFFzN3lJN0VYK2UxdFlGa3ZQOU4xTFEva2N0a3NYYWJIM3VDbzFma0pMdTYx?=
 =?utf-8?B?WDNzZmVSS2FPR1FRUEdIbXlDOWtpS0VPMmZzcnJnSjBhWVprV21rZCtoTWZx?=
 =?utf-8?B?ZTFOOTJaaVpSemZGQ1oyRGVhRmx4Zm04ejcvYXo0L0w5a29FZk5PS2xlUjdp?=
 =?utf-8?B?MVZ4N1JuMUtsTWY4dHZpWklLckExWDdoNmN6c21CUWcwNzdpaDljNEp2c3Uw?=
 =?utf-8?B?bzQrN29najB5NTNJZk4zL0lZMzBsSkw2WU95SHBjS2hESWIxWFJ6TmxscGYv?=
 =?utf-8?B?U0RIRCtObXJuM0pGVHh3NkFTdlJEamF3d0tJemhnOTRXanVvU0ZEaWpwTmhG?=
 =?utf-8?B?QkFTbjRRMVBzL25sY3BBaTQzQVhoaDFVZmk4Rks2NWpKRURtajNvS3UyUUlB?=
 =?utf-8?B?MFlZa2tnNkpzMHJtZnVSTTd4YUJ5RCtsMUFYb2FKR091WHphVlE5dkVyczBy?=
 =?utf-8?B?Vkp1clU4Q1lHVEZlUHhiZ3AzRFdCL1U4ZVJRNEs0U0hBdkZmM1RYVENRcE9J?=
 =?utf-8?B?MGV1cHFJeTFHZTBVNldGZ2FSOHBNWkFqcjVYTGVIcjBqUThOb1hOM1lTT1BV?=
 =?utf-8?B?NFBpTElvblFXeVlHWWNLZWRQTldBSTFMRnBtVGdwUVJ0c0lKa0VPTGlCakxN?=
 =?utf-8?B?K2dQVlU0NnkveUJjclpoYWdvOWUxbE1PZUU0UU5mekFsWjkwL3FiWTIzOXQy?=
 =?utf-8?B?QktyeXhnRnJ2RGhsS2h5dnBrdXhEUFZuT0tnUVRYeWIrRERqaE4zdlAvTkEw?=
 =?utf-8?B?WFkvNGtZWUszQXJ1VjV4ZXRJcjVkd1NCaG5tSWpOMU54bXp4RnRhTkQzWTkv?=
 =?utf-8?B?YlArWlgwNVBubG5WTkFJT3FVYzE4cjZjRmtUNlIzRWZ2TGVZeDhPaGVXNlpB?=
 =?utf-8?B?dzJySWxTUTU3K1dVaXphaWVDRVdoa0dqQWVUMFdkWU5PRFJSdU9MUzhUdVpw?=
 =?utf-8?B?SmdDUnRNRmNwQjJNSmNMZkNkK0x1LzVJUmF6dTlQbHlxYStoMWdHOFAweGZ1?=
 =?utf-8?B?N2ovNzNTT2Q1aElxcmlxaEZZV3BlVEJBdnIzMU1KQ3VDWjVKU2puUjlvbGhG?=
 =?utf-8?B?NldZWmc3STNkMGsxdXAyOHg1S1FGSzZDalNaOXNtcGtJbnJ3Y25yQ1BUS05x?=
 =?utf-8?B?SzVNVXFXZC9FcjU0dmRCVU4ybHFwTGxBTGMxSUY2ZzYyT011TElmSmZUQW9P?=
 =?utf-8?B?L0c0OS9PK2N5TGpYN1g3TExsbzFLdTc2WHhVT1JQWlY3Z2xjei83eWxDcWJN?=
 =?utf-8?B?S2lkMWR6VGJxZHE1TURFelJ4THNOZ3pUcGpBWjF1NVloZ1RhZUJBb0QwQTRQ?=
 =?utf-8?B?c2pOc3dHa0FrdThraHROZkxzQ0dOWW9OTlVXRlNFRkFVM3RFdkRWTE5MR3p2?=
 =?utf-8?B?MCt5Q0pSS1JBZ2o0cTRjY0Z1R2J0UVFNRVMvSHAySWVPWmhCQlpoa0VYbzQv?=
 =?utf-8?B?TDI4cTRjZFZmampWUzl6S0tpcndvcVZzWjRUMDZqV2NNQ2twRTI0cExwOGRj?=
 =?utf-8?B?dERtRnJqQ2ZtN3cwMWg4ZGlkR3BId21hRW55UjRKVVErZnlKeUFZQTdpMnBs?=
 =?utf-8?B?Wk81RjdoTVV2VnhIWThzbnI3Y0Zsa0FQTXZIMDBrV1dJU0sxd2Rpd2YvUFQ3?=
 =?utf-8?B?c3BOTVVRT2hhbGp3QTh3WEVCNTVLSnJ1U0RlaDZ5YjF6dHlMUlVmQ1R3RjRj?=
 =?utf-8?B?elZPK2o5bG9qTVRteHhIZk9aejlCS3ZFOWFCbXlJMnlMempWYkJpdkRSM2ta?=
 =?utf-8?Q?hC8pFv6TpGh8eMSgWXfrme8veGwQq5WtSNPa7hb1Ndyr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8069735c-5543-48d7-0286-08db7c5c817c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 07:01:35.5773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBXCLA1c8HGvmF4wIRkN3x/Mpjj/mp6CxqBuysx2P7cOZFd9cL252MZ2s3Enc9/M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168
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

Am 04.07.23 um 08:35 schrieb Karolina Stolarek:
> On 3.07.2023 13:21, Christian König wrote:
>>
>>
>> Am 03.07.23 um 09:58 schrieb Karolina Stolarek:
>>> Add KUnit tests that exercise page allocation using page pools
>>> and freeing pages, either by returning them to the pool or
>>> freeing them. Add a basic test for ttm_pool cleanup. Introduce
>>> helpers to create a dummy ttm_buffer_object.
>>>
>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>> ---
>>>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  15 +
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 405 
>>> ++++++++++++++++++
>>>   4 files changed, 425 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>>
>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>> index 7917805f37af..ec87c4fc1ad5 100644
>>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>>> @@ -2,4 +2,5 @@
>>>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>>           ttm_device_test.o \
>>> +        ttm_pool_test.o \
>>>           ttm_kunit_helpers.o
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>> index 428a8a4ac9dc..9384679fccb0 100644
>>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>> @@ -26,6 +26,21 @@ int ttm_kunit_helper_init_device(struct kunit *test,
>>>   }
>>>   EXPORT_SYMBOL_GPL(ttm_kunit_helper_init_device);
>>> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit 
>>> *test,
>>> +                               size_t size)
>>> +{
>>> +    struct drm_gem_object gem_obj = { .size = size };
>>> +    struct ttm_buffer_object *bo;
>>> +
>>> +    bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, bo);
>>> +
>>> +    bo->base = gem_obj;
>>> +
>>> +    return bo;
>>> +}
>>> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_ttm_bo_init);
>>> +
>>>   int ttm_test_devices_init(struct kunit *test)
>>>   {
>>>       struct ttm_test_devices_priv *priv;
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h 
>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>> index bf0b1000a8ee..41ad38dd34e5 100644
>>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>> @@ -7,6 +7,7 @@
>>>   #include <drm/drm_drv.h>
>>>   #include <drm/ttm/ttm_device.h>
>>> +#include <drm/ttm/ttm_bo.h>
>>>   #include <drm/drm_kunit_helpers.h>
>>>   #include <kunit/test.h>
>>> @@ -23,6 +24,9 @@ int ttm_kunit_helper_init_device(struct kunit *test,
>>>                     bool use_dma_alloc,
>>>                     bool use_dma32);
>>> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit 
>>> *test,
>>> +                               size_t size);
>>> +
>>>   int ttm_test_devices_init(struct kunit *test);
>>>   void ttm_test_devices_fini(struct kunit *test);
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c 
>>> b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>> new file mode 100644
>>> index 000000000000..85806f72df22
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>> @@ -0,0 +1,405 @@
>>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +#include <linux/mm.h>
>>> +
>>> +#include <drm/ttm/ttm_tt.h>
>>> +#include <drm/ttm/ttm_pool.h>
>>> +
>>> +#include "ttm_kunit_helpers.h"
>>> +
>>> +struct ttm_pool_test_case {
>>> +    const char *description;
>>> +    unsigned int order;
>>> +    bool use_dma_alloc;
>>> +};
>>> +
>>> +static struct ttm_operation_ctx simple_ctx = {
>>> +    .interruptible = true,
>>> +    .no_wait_gpu = false,
>>> +};
>>> +
>>> +static struct ttm_tt *mock_ttm_tt_init(struct kunit *test,
>>> +                       uint32_t page_flags,
>>> +                       enum ttm_caching caching,
>>> +                       size_t size)
>>> +{
>>> +    struct ttm_tt *tt;
>>> +    struct ttm_buffer_object *bo;
>>> +    int err;
>>> +
>>> +    bo = ttm_kunit_helper_ttm_bo_init(test, size);
>>> +    KUNIT_ASSERT_NOT_NULL(test, bo);
>>> +
>>> +    tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>> +
>>> +    err = ttm_tt_init(tt, bo, page_flags, caching, 0);
>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>> +
>>> +    /* We don't need this BO later, release it */
>>> +    ttm_bo_put(bo);
>>
>> That won't work. A BO must always outlive the TT object allocated for 
>> it. >
>> Otherwise you can get crashes during TT release.
>
> OK, I can keep it around, probably as an another test->priv member.
>
> I thought that for these mocks it should be fine -- 
> ttm_tt_init_fields() only takes the scatter list from BO which is not 
> in use (as for now, at least) and in ttm_tt_fini() we don't even touch 
> that field.

Yeah, it might work for the mock test. But this is not how the interface 
is supposed to be used.

The lifetime of the TT object is tied to the one of the BO, e.g. when 
the BO is destroyed and has a TT object associated with it that object 
is destroyed as well.

Regards,
Christian.

>
> All the best,
> Karolina
>
>>
>> Regards,
>> Christian.
>>
>>> +
>>> +    return tt;
>>> +}
>>> +
>>> +static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
>>> +                           size_t size,
>>> +                           enum ttm_caching caching)
>>> +{
>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>> +    struct ttm_pool *pool;
>>> +    struct ttm_tt *tt;
>>> +    int err;
>>> +    unsigned long order = __fls(size / PAGE_SIZE);
>>> +
>>> +    tt = mock_ttm_tt_init(test, order, caching, size);
>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>> +
>>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>>> +
>>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
>>> +
>>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>> +
>>> +    ttm_pool_free(pool, tt);
>>> +    ttm_tt_fini(tt);
>>> +
>>> +    return pool;
>>> +}
>>> +
>>> +static const struct ttm_pool_test_case ttm_pool_basic_cases[] = {
>>> +    {
>>> +        .description = "One page",
>>> +        .order = 0,
>>> +    },
>>> +    {
>>> +        .description = "More than one page",
>>> +        .order = 2,
>>> +    },
>>> +    {
>>> +        .description = "Above the allocation limit",
>>> +        .order = MAX_ORDER + 1,
>>> +    },
>>> +    {
>>> +        .description = "One page, with coherent DMA mappings enabled",
>>> +        .order = 0,
>>> +        .use_dma_alloc = true,
>>> +    },
>>> +    {
>>> +        .description = "Above the allocation limit, with coherent 
>>> DMA mappings enabled",
>>> +        .order = MAX_ORDER + 1,
>>> +        .use_dma_alloc = true,
>>> +    },
>>> +};
>>> +
>>> +static void ttm_pool_alloc_case_desc(const struct 
>>> ttm_pool_test_case *t,
>>> +                     char *desc)
>>> +{
>>> +    strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
>>> +}
>>> +
>>> +KUNIT_ARRAY_PARAM(ttm_pool_alloc_basic, ttm_pool_basic_cases,
>>> +          ttm_pool_alloc_case_desc);
>>> +
>>> +static void ttm_pool_alloc_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>> +    const struct ttm_pool_test_case *params = test->param_value;
>>> +    struct ttm_tt *tt;
>>> +    struct ttm_pool *pool;
>>> +    struct page *fst_page, *last_page;
>>> +    int err;
>>> +    enum ttm_caching caching = ttm_uncached;
>>> +    unsigned int expected_num_pages = 1 << params->order;
>>> +    size_t size = expected_num_pages * PAGE_SIZE;
>>> +
>>> +    tt = mock_ttm_tt_init(test, 0, caching, size);
>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>> +
>>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, 
>>> params->use_dma_alloc,
>>> +              false);
>>> +
>>> +    KUNIT_ASSERT_PTR_EQ(test, pool->dev, priv->dev);
>>> +    KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
>>> +    KUNIT_ASSERT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
>>> +
>>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>> +    KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
>>> +
>>> +    fst_page = tt->pages[0];
>>> +    last_page = tt->pages[tt->num_pages - 1];
>>> +
>>> +    if (params->order <= MAX_ORDER) {
>>> +        if (params->use_dma_alloc) {
>>> +            KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
>>> +            KUNIT_ASSERT_NOT_NULL(test, (void *)last_page->private);
>>> +        } else {
>>> +            KUNIT_ASSERT_EQ(test, fst_page->private, params->order);
>>> +        }
>>> +    } else {
>>> +        if (params->use_dma_alloc) {
>>> +            KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
>>> +            KUNIT_ASSERT_NULL(test, (void *)last_page->private);
>>> +        } else {
>>> +            /*
>>> +             * We expect to alloc one big block, followed by
>>> +             * order 0 blocks
>>> +             */
>>> +            KUNIT_ASSERT_EQ(test, fst_page->private,
>>> +                    min_t(unsigned int, MAX_ORDER,
>>> +                          params->order));
>>> +            KUNIT_ASSERT_EQ(test, last_page->private, 0);
>>> +        }
>>> +    }
>>> +
>>> +    ttm_pool_free(pool, tt);
>>> +    ttm_tt_fini(tt);
>>> +    ttm_pool_fini(pool);
>>> +}
>>> +
>>> +static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
>>> +{
>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>> +    const struct ttm_pool_test_case *params = test->param_value;
>>> +    struct ttm_tt *tt;
>>> +    struct ttm_pool *pool;
>>> +    struct ttm_buffer_object *bo;
>>> +    dma_addr_t dma1, dma2;
>>> +    int err;
>>> +    enum ttm_caching caching = ttm_uncached;
>>> +    unsigned int expected_num_pages = 1 << params->order;
>>> +    size_t size = expected_num_pages * PAGE_SIZE;
>>> +
>>> +    tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>> +
>>> +    bo = ttm_kunit_helper_ttm_bo_init(test, size);
>>> +    KUNIT_ASSERT_NOT_NULL(test, bo);
>>> +
>>> +    err = ttm_sg_tt_init(tt, bo, 0, caching);
>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>> +
>>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>>> +
>>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
>>> +
>>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>> +    KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
>>> +
>>> +    dma1 = tt->dma_address[0];
>>> +    dma2 = tt->dma_address[tt->num_pages - 1];
>>> +
>>> +    KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>>> +    KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>>> +
>>> +    ttm_pool_free(pool, tt);
>>> +    ttm_tt_fini(tt);
>>> +    ttm_pool_fini(pool);
>>> +}
>>> +
>>> +static void ttm_pool_alloc_order_caching_match(struct kunit *test)
>>> +{
>>> +    struct ttm_tt *tt;
>>> +    struct ttm_pool *pool;
>>> +    struct ttm_pool_type *pt;
>>> +    enum ttm_caching caching = ttm_uncached;
>>> +    unsigned int order = 0;
>>> +    size_t size = PAGE_SIZE;
>>> +    int err;
>>> +
>>> +    pool = ttm_pool_pre_populated(test, size, caching);
>>> +
>>> +    pt = &pool->caching[caching].orders[order];
>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
>>> +
>>> +    tt = mock_ttm_tt_init(test, 0, caching, size);
>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>> +
>>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
>>> +
>>> +    ttm_pool_free(pool, tt);
>>> +    ttm_tt_fini(tt);
>>> +    ttm_pool_fini(pool);
>>> +}
>>> +
>>> +static void ttm_pool_alloc_caching_mismatch(struct kunit *test)
>>> +{
>>> +    struct ttm_tt *tt;
>>> +    struct ttm_pool *pool;
>>> +    struct ttm_pool_type *pt_pool, *pt_tt;
>>> +    int err;
>>> +    enum ttm_caching tt_caching = ttm_uncached;
>>> +    enum ttm_caching pool_caching = ttm_cached;
>>> +    size_t size = PAGE_SIZE;
>>> +    unsigned int order = 0;
>>> +
>>> +    pool = ttm_pool_pre_populated(test, size, pool_caching);
>>> +
>>> +    pt_pool = &pool->caching[pool_caching].orders[order];
>>> +    pt_tt = &pool->caching[tt_caching].orders[order];
>>> +
>>> +    tt = mock_ttm_tt_init(test, 0, tt_caching, size);
>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>> +
>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
>>> +
>>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>> +
>>> +    ttm_pool_free(pool, tt);
>>> +    ttm_tt_fini(tt);
>>> +
>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
>>> +
>>> +    ttm_pool_fini(pool);
>>> +}
>>> +
>>> +static void ttm_pool_alloc_order_mismatch(struct kunit *test)
>>> +{
>>> +    struct ttm_tt *tt;
>>> +    struct ttm_pool *pool;
>>> +    struct ttm_pool_type *pt_pool, *pt_tt;
>>> +    int err;
>>> +    enum ttm_caching caching = ttm_uncached;
>>> +    unsigned int order = 2;
>>> +    size_t fst_size = (1 << order) * PAGE_SIZE;
>>> +    size_t snd_size = PAGE_SIZE;
>>> +
>>> +    pool = ttm_pool_pre_populated(test, fst_size, caching);
>>> +
>>> +    pt_pool = &pool->caching[caching].orders[order];
>>> +    pt_tt = &pool->caching[caching].orders[0];
>>> +
>>> +    tt = mock_ttm_tt_init(test, 0, caching, snd_size);
>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>> +
>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
>>> +
>>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>> +
>>> +    ttm_pool_free(pool, tt);
>>> +    ttm_tt_fini(tt);
>>> +
>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
>>> +
>>> +    ttm_pool_fini(pool);
>>> +}
>>> +
>>> +static void ttm_pool_free_dma_alloc(struct kunit *test)
>>> +{
>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>> +    struct ttm_tt *tt;
>>> +    struct ttm_pool *pool;
>>> +    struct ttm_pool_type *pt;
>>> +    enum ttm_caching caching = ttm_uncached;
>>> +    unsigned int order = 2;
>>> +    size_t size = (1 << order) * PAGE_SIZE;
>>> +
>>> +    tt = mock_ttm_tt_init(test, 0, caching, size);
>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>> +
>>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>>> +
>>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
>>> +    ttm_pool_alloc(pool, tt, &simple_ctx);
>>> +
>>> +    pt = &pool->caching[caching].orders[order];
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
>>> +
>>> +    ttm_pool_free(pool, tt);
>>> +    ttm_tt_fini(tt);
>>> +
>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
>>> +
>>> +    ttm_pool_fini(pool);
>>> +}
>>> +
>>> +static void ttm_pool_free_no_dma_alloc(struct kunit *test)
>>> +{
>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>> +    struct ttm_tt *tt;
>>> +    struct ttm_pool *pool;
>>> +    struct ttm_pool_type *pt;
>>> +    enum ttm_caching caching = ttm_uncached;
>>> +    unsigned int order = 2;
>>> +    size_t size = (1 << order) * PAGE_SIZE;
>>> +
>>> +    tt = mock_ttm_tt_init(test, 0, caching, size);
>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>> +
>>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>>> +
>>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, false, false);
>>> +    ttm_pool_alloc(pool, tt, &simple_ctx);
>>> +
>>> +    pt = &pool->caching[caching].orders[order];
>>> +    KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
>>> +
>>> +    ttm_pool_free(pool, tt);
>>> +    ttm_tt_fini(tt);
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
>>> +
>>> +    ttm_pool_fini(pool);
>>> +}
>>> +
>>> +static void ttm_pool_fini_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_pool *pool;
>>> +    struct ttm_pool_type *pt;
>>> +    enum ttm_caching caching = ttm_uncached;
>>> +    unsigned int order = 0;
>>> +    size_t size = PAGE_SIZE;
>>> +
>>> +    pool = ttm_pool_pre_populated(test, size, caching);
>>> +    pt = &pool->caching[caching].orders[order];
>>> +
>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
>>> +
>>> +    ttm_pool_fini(pool);
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
>>> +}
>>> +
>>> +static struct kunit_case ttm_pool_test_cases[] = {
>>> +    KUNIT_CASE_PARAM(ttm_pool_alloc_basic, 
>>> ttm_pool_alloc_basic_gen_params),
>>> +    KUNIT_CASE_PARAM(ttm_pool_alloc_basic_dma_addr,
>>> +             ttm_pool_alloc_basic_gen_params),
>>> +    KUNIT_CASE(ttm_pool_alloc_order_caching_match),
>>> +    KUNIT_CASE(ttm_pool_alloc_caching_mismatch),
>>> +    KUNIT_CASE(ttm_pool_alloc_order_mismatch),
>>> +    KUNIT_CASE(ttm_pool_free_dma_alloc),
>>> +    KUNIT_CASE(ttm_pool_free_no_dma_alloc),
>>> +    KUNIT_CASE(ttm_pool_fini_basic),
>>> +    {}
>>> +};
>>> +
>>> +static struct kunit_suite ttm_pool_test_suite = {
>>> +    .name = "ttm_pool",
>>> +    .init = ttm_test_devices_init,
>>> +    .exit = ttm_test_devices_fini,
>>> +    .test_cases = ttm_pool_test_cases,
>>> +};
>>> +
>>> +kunit_test_suites(&ttm_pool_test_suite);
>>> +
>>> +MODULE_LICENSE("GPL");
>>

