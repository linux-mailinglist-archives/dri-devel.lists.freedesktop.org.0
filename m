Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0192C777124
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69D610E4C7;
	Thu, 10 Aug 2023 07:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711F210E4C8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 07:19:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAD2KwaIWVUDnGinOIoy+FJrvIXvH4rni4yE1Ibq90mcVATF+Tc1tbtoa28ISn/9kkq3+//KFj7yRgAoaJl2tKjYJv/cMYiOznIXzUYB9/bOe58jYOIBCMrPr/yXJPXmwiaKL8c3eTrIN5mX6N+04vdQLc8fswvUXIxXJwP4O8F3yMb/YjFNxd/f7phlsZ7iAaEeaSqVA0mWOZZHy5v+icD2LiWKLpw5YYtaphrLfYji/B3b0BNxGtAkgnya7EMTzrMl/SBQ6NPvNR/WsEyAESWuog4zy+lTND3HO5XG58cK9d2VF2xSADcEypNdWZT5uzGro5VwFs4kRFYxG9uWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TeGde9RHqTPobr1asl/G4cZRkT0gZHHls9Pp4y3yVo=;
 b=lqs55htp3hwVcmeZRIE4Mqa8UzHU4imqf9pY1tpni5gsJVJWQBBUjmDlRv/OEp6oB8Ch+EY7bOu2BbJ4G0dxn8cit5h2s2vtUcedLOuQlVgdpmQKA4b/JKAIQUSux9Nx9Y6jnh2UvA2fmRM/z+LAH2+n4uIUDE6g7+jKsJFjnQYhvT3HZHhVMv4EEjPACNJcR2BZ2bIEBsBB+33B4TXa1tF0iyMVEY4fSe620ddjfVU6Ka9mx2wsT4U86EFYDFYBL76HGstu1IQKeuDc55kHHwKi7pK3rueERCgpkCFRJihxuqOftfGO69WPNFxD++KQ04eV1cjInSs2EH6pBaz78Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TeGde9RHqTPobr1asl/G4cZRkT0gZHHls9Pp4y3yVo=;
 b=lzWoUiqoB01qQh1AClJG8E2+FpYErn4i+XXOon8tHuirn9W168u7UC4Y3EPiVIqXh/TIvkB7l/w26j0Q0mIzsNQQRnuJLdtuclfAj3dfoVEpC/sNQu+mb4ILdGjhCCNFudJJGujftkfo+uyiCjb4OyzPbBHjZL4pIOXKzQ6PFUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6171.namprd12.prod.outlook.com (2603:10b6:a03:45a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:19:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.028; Thu, 10 Aug 2023
 07:19:14 +0000
Message-ID: <2362eb30-7582-ac82-f0b3-23db5ee19717@amd.com>
Date: Thu, 10 Aug 2023 09:19:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC v6 0/3] Introduce KUnit tests for TTM subsystem
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1691487006.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cover.1691487006.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be7a9de-fd7e-4c03-ac4c-08db997219f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: blOSSqI7aGWvIUvjqj0WvzqOxb6j3WeoF2Rpy/OdQQLNJ+1h0X2yA7dALPOJbsgUNswGFxjEbCg/STx5Qs3l9A6fZOrLc3W6jzJvSzwhuIiP0aOpbTr5BWHf/pkDG+oad+io3mwEekfOOaxfPD/IjFwAVom3f4uGbu+o84E2+cu/qQnqTRbTWNuwj+Tp+9u0FfVPJjvGTjL3PjhkE3aiIcqlH8vEtBbD9AWuqD6tBg0szw0IOdg/SdP9r/8mQbxKwU5fkYCJ1SVsixrW/H5r+p215rZJ6auR4NfHGoeA2fu/pcL/tH6Ft0iQp7nqfS7CL10e/ZOhkcNyc6nMU6iaK678b1DecXMDP+Sm9rO62Z6pDudkCUHgYzf+Z1wkL6l6klw58edDA74LTugB1yLzN9rsqVpCoN+oxmG/4g/Z7qDlUUCnNC1ZeVb5EtXIxgZNkBeNEhVWxbgRBneohdfuaoPF2qy9fiCuIS5Yba8ZxJI7uNYf1n80A2UG+i4B0t+Q0E/2TuWUHMRZ+SzBfXuF0/qMfOPA6HkQwUFTroLMKH7PTyAf7pLabLEs7D3bb/n3JGoefhfulqImVcKPWLGygjGvrNb+s8Qjj2f2diS+lIYrzIiX0rRbf++ty0IND6MNmTrjGM5Y0cer69ZMu1lVrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(186006)(451199021)(1800799006)(36756003)(31696002)(86362001)(2906002)(6506007)(83380400001)(2616005)(478600001)(31686004)(54906003)(8676002)(966005)(6486002)(6512007)(6666004)(8936002)(66476007)(66556008)(5660300002)(66946007)(41300700001)(316002)(4326008)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkNTay93YU1SNmFUZk1xdHRwWXV1NnVWRU5seVZ2ZC9RY0xOeXdGdzdOR1Rk?=
 =?utf-8?B?Mno2RWs4MmQwR0g3QjdtaTdCREt2c2UrUTE3c3ZlU0NoeGZXZDl4aFBnRUN1?=
 =?utf-8?B?WlBBN1VYd3c1NlVjTnN2dXUzSDdZQjhMUEh3ZTJmbmZEMDdzRTg3eTQ5UHli?=
 =?utf-8?B?d3c3SUdpVlFPOENCa2FZdXBpSHcveEpkcHE5eFhJWCtVcG9PU3BuQkh0cmF3?=
 =?utf-8?B?dmZKM3dKVDlsb3RSaHVpd0xMRFlnZmZubE9HOG5pMis4bVZqaU1kdmswWFFw?=
 =?utf-8?B?dExCSzBBR2tsdzBIMVNsL1BEUVdIclRIS0xsLytta2Ztb0c1WjR4K0trb1hK?=
 =?utf-8?B?U1dDWkwyYzBTdGs5SmZ2T2U2MzZ2T29aaWdRWXl3U2didmt4dXVlQnh3K2hk?=
 =?utf-8?B?WFpOdnhCRG83RFJyeitYK1YxaWhlaFhCQXg5SXB0ZlJrOHFWTzhqcWVQOEd4?=
 =?utf-8?B?aE1UY29jb1N1WitIUzBkRDEwcDBHbVZkcEltSG1oL1RQeElBMWZpYzMzYkJ2?=
 =?utf-8?B?YjJYaTFkOVplWlgxSzFNbGhOWFJXazN6T3dacTk0Z0x6aU9pSDhickZLdmxV?=
 =?utf-8?B?MjJ4cXErUjJPSGJseEpOZ3ZNejlJaXVmY1Qva1VTQ3VJR2dFZWF2SDBQaXFj?=
 =?utf-8?B?ZXRMbGJZZFcvTnpEb21SOU9tVGFJbGdVSXhzdHl0UHJvb1BIRXIrRk16Nkxh?=
 =?utf-8?B?clJGOWRKczRiNUovZXRRdEdkdm9WRUgySHVKSFJuc042RU1OTkV1a1NKYUR6?=
 =?utf-8?B?Q01tbldjSEZhM0Z4ZFpyZWxRTXFNU29mVzVOcHB0cFpiOVA4SlhkSzJiWGUv?=
 =?utf-8?B?MjU2SHlhd0RLVVZraEVMMjNPMUZRcmpBd1ZndHc3eHBUYllVajhsK1R3L1Ix?=
 =?utf-8?B?elljTG5RYmYzc1pRQmh0bXgyK1RzWVV0eldIU1NyZnpKSldpbzZMcWIwVXRE?=
 =?utf-8?B?VVo4amxWL1NlMmVxb1BBN1B1N0I5RW5WYjFQaDZaZWo1TUROSUlQRUZTK1pS?=
 =?utf-8?B?WFdlUWhGRFh2eUczWmFzZkkvVVdodStpYlNHYnhZT1NZbE9HTThqZGF2d2ZI?=
 =?utf-8?B?R3IwRVdLdWtBN09RRW9JbXJ6b2hHYzV2Z0hnbmZLT0UwcVRCRWlRMk9vK3A2?=
 =?utf-8?B?ZHQ4MHhtV1JmR0tqL01HRXB3ZTZ5aGptbUJta01PaWdhakdsSU80SU1DRG8y?=
 =?utf-8?B?WGE0eUpjTEZ5ZVp1VTZXM1RTUjhpVXYvb0dpQTJpb0MxdHk3WnFZcWFTUHov?=
 =?utf-8?B?U3B3NTRzZlBnVVgzYnRuTjh5NVRlUk1oOGc3aFYxNk5vWmdiUCs0RXhqSVRy?=
 =?utf-8?B?a3J1VFAyR016SkpNOUxNalY3bzFCS2REWHBQUEJSd0pNV1pUTnJ0ZU1LdDlt?=
 =?utf-8?B?Si9mdTE2b2hwQmgxYnNVZGJ6N3l0ODA0eVJSM0tENCtTSlJVVkNGZUZjQXlj?=
 =?utf-8?B?Vm95cXZudktXVmNGdWFjUFRjR2tNemhZSFlwanVXQnViUWZGaEt3c2lUeWFQ?=
 =?utf-8?B?YmtHK3BZWGR6OUhMRnBoZkx2MGU2MElvdmx0YWowWjVFNUFwa1pSL1JGeTNQ?=
 =?utf-8?B?V3lOMk1OUUhENUJsREoyWTNTdEEvNE1mNm9ybFBtM2xpcDNud1M5dXJXU25O?=
 =?utf-8?B?UkJLVW9ReFRDakMzZUZmN3pZNVpVaUZsZnRPT0k1V0t5ZDZqeUt2cnd4SHE5?=
 =?utf-8?B?bjNsVXZrUGhIb2l6MW1SUFROT2FoRXFiWUFBZm0vaHVpWHR3dmhaN0JLR3dp?=
 =?utf-8?B?VlJzaHgwMzBNR2VsLzI2c3d4Y2JxVXNyeHVpY0hyb2NJektCY1VOa2twalQz?=
 =?utf-8?B?aEwvQk44NWpOTERwbkV0WW92ei83U3JvZjIzU1J6WnhLckZzbXFOZUJpdHZK?=
 =?utf-8?B?NWgvM3ViQ0plbWZZVER5dDcvM05hWlFLanFNR2oyWnF1d24xNk1ydUtKSGg0?=
 =?utf-8?B?bmU3NWFCTTNZWGduUm4xdjc0YXBKUWJaV2NYdUtteUlBaTRGRERxQmk4SHEx?=
 =?utf-8?B?eTZDMW50em40WGMwUEI2d09KSUlhbkcrN2dNbmlwY2FsNE8vdWFEVW04aXZR?=
 =?utf-8?B?RnZHdml4d1QzcFJBVTNOK01oOS9DTmpLTjVUS2c4YzUyNDdEY1JhbHczeGww?=
 =?utf-8?B?MkZOZy91TUE1OUtiQVVXZzJTUkRQMFQ4YnlOWkE5c0w4WWFrVEhRcm53RkFj?=
 =?utf-8?Q?NHXLcjnyanSi1Pa18mzBxq+kSG6HI5Ooxf8v9O7oQ+Gz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be7a9de-fd7e-4c03-ac4c-08db997219f1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:19:14.5901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cgjpc2iju9F1VoUpDqOpS88yPlZmqsrmY7OEYCP5XGW/6p/2kxric9FnK4xLxwTZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6171
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

Am 08.08.23 um 11:51 schrieb Karolina Stolarek:
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

Couldn't find time for further testing, so I just reviewed and pushed 
this to drm-misc-next.

Thanks,
Christian.

>
> Many thanks,
> Karolina
>
> v6:
>    - Rebase the series on the top of drm-misc-next (Christian)
>    - Remove drm_dev_put() call from ttm_test_devices_put, the drm device is
>      already freed in drm_kunit_helper_free_device()
>    - Remove an unnecessary priv assignment in ttm_test_devices_all()
>    - Delete ttm_bo_put() from ttm_pool_test_fini() (as for now, we don't count
>      krefs for dummy BOs)
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
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 113 +++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  41 ++
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 437 ++++++++++++++++++
>   8 files changed, 829 insertions(+)
>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>

