Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AC57CA8D4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 15:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28BC10E0CA;
	Mon, 16 Oct 2023 13:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA8B10E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 13:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpHx5obAPgRbwpBEPeNFeCqxUInEsqS33PDM21ExREphGvKlJnZKw/8OSRStXImudoowd1mZsYUe6d1WlUqxhj2+3+zizpku4Ns/uukCZjvDvrI1PuXsn2MCopOOyNG+PdJ87du8Bug2sgbfcRAqEHgRVtLMH0GqNNq3kv+DQMszrVZJcWg0V7uVTl/Q9MnUwn5u7iJjXxFBCZf26uo3HfUv6mYunzIdpO47PWrbNg2fYoSyws1l4vJeEyird+C1f/QXCsrNI860ZmG084XKpdbxWpdKkutES6PjDbqCowF+dMMCbAN7WgdkU9UaRZPLTPpGXxcBnHMYh+w08HQriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB6SnR0zUOYo8hscAT9itLXoSp3Lx+1wCx2dw5GgnLk=;
 b=h4KmoLCkCLflbYf67fpyBshbgJoOlFXZdx8ziW0mlDTvd6xjPrdTaIXFENMLBuhhURNWIJRYUyHA86Qrk1O2iMHbwriDKMN28kEDGMmt32qxTKPsUESg+7pAsittXoi5nSvLV4pe/x3b6qAmaAbn/pHEA4MNQXjhYs9R0FY/QuqscIm4Ygjjcb/j+pxx+vmqptlXLxoZgw6FbzyGUQuOKYXYvTuPHI0ZjQzv/BzKc8VtDxXIPdk4hBoN8L9IQ+DrBsobCEqjUmR7DkbpMT6fCsquh85JGrlY5jTa+nf5Z0IQEYmBnireGNoCWkQMD2l41kDYz2htf3RXtaXNTkrkqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB6SnR0zUOYo8hscAT9itLXoSp3Lx+1wCx2dw5GgnLk=;
 b=mYf4s3YH/4sdvmbSTngKziXOAZVM/6wBjZMBX1oexi8wYqP7g2pQ6Hvy60k9b2+hsC/p85oPYEKiJaqJyvbvexMeAJkB21knyJIhT1rMWBWPtQIGKyfa621Y3fyOa2d/W/GfN83aH/Ki0NpKkB8MMtF7GMfCht9+Ajd3tEnbIrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by MW4PR12MB7429.namprd12.prod.outlook.com (2603:10b6:303:21b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:08:31 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::d3ca:f4b:2fc2:c75a]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::d3ca:f4b:2fc2:c75a%6]) with mapi id 15.20.6863.043; Mon, 16 Oct 2023
 13:08:31 +0000
Message-ID: <9854008f-6755-4c09-9f23-90fa62911222@amd.com>
Date: Mon, 16 Oct 2023 18:38:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 0/4] Improve test coverage of TTM
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1697445193.git.karolina.stolarek@intel.com>
Content-Language: en-US
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <cover.1697445193.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::9) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|MW4PR12MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b76d28-1bd3-4dff-acaf-08dbce48fea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XSe7VjTYP0MIoFfx+a34DOj/H33n1T5+c0PKlmrthlwf4m8ACPdVMYN3smjVYcXohyvHa3Ov73y/sIrBVCo9xiJhxjSdhRSeNISGh2ym7I7hFo98jTgncf3WpfGYshdTeeFeLf/c0GlHhsghJ722sSsY72USW1j32WLpMOAejL6RZ3GvdC3/ZWxh6T3V2jH2K9TsdNFS/CeOeOJIQDVD3bSQkQ6Ub8DHKJrJMsNRoJDtbDXc+FNTWTxygXKrY1fkUpawdN2hz1geLxP2oFvVfo7HUsEXD26+4PPL0GbeIgL/vza4FNgRtWuYXMq5KS4t958RPDQEUaisHu0sRbaGoddXD2aaN3zOKTXD4Uyu5M5bEfnY7ZGrRzplrR3B1IKeoJnvhe6Cbm1cUa3bVzecGkuluCV2mr8JrQkYizcYwURxQtgi7eH2rbBNNcsd5Poe5gX0XKQiK/8aRGFxH2uNfPeT+EahNd/6IgoQWv0uNzaiBdi+LazLJ/8VyV+7Jh+2sdlIyfV7JWFToV86FGuslZipxf+TngKXwqqSwfzw7L+wSD7xhUo/6WBB1lVfE4G7fDjzM0l9VmcN2ldMVHBgJg/yNEsk4/u1aCkdeAOuMb/as6mgJErqZn1hglXDszJTlQStet+FZv5WtVzmEd7VKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(36756003)(66946007)(316002)(66556008)(54906003)(66476007)(31696002)(38100700002)(5660300002)(8676002)(8936002)(2906002)(4326008)(41300700001)(6512007)(6666004)(53546011)(6506007)(31686004)(2616005)(26005)(83380400001)(478600001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDFpL3lQek52SXpSM25JQUplWll5SjR4cDZrWXBjTVVKWlVRNm5QVDhSZ3dS?=
 =?utf-8?B?bjlXL3crN3l6c2UxbjhIdU9sMzh4ZlUxT25qNVBNeXVESXg3Q0JEVUtZd3p0?=
 =?utf-8?B?SkErVXpHaDlOSGU1VDVkWStKQjNCQ1N1bzJwVnRTK05jYW1PdlhEeGVHL2NG?=
 =?utf-8?B?ZlFmcDUyNDAra0hrV2FuMkNZaVpGZmVDS2hRNzlFSWN3QkY1QXErQmRvVXI0?=
 =?utf-8?B?QTJMaWVyRUsxTnVqMGxqMlR4aXhsMmltWTFybkhOa0R1SEpNeGlZbkdSKzhw?=
 =?utf-8?B?YXpJUFNNWXdhVHpCekxmNWN2TmVSWU9TUDRVYmdNd1FTVXkzcHdqWEgzeXg0?=
 =?utf-8?B?c3FKM1dzcGlDenZtcllOYlBOci90dzdkNmxHMlZlN0NHV0c0eW03UGVBb0Z0?=
 =?utf-8?B?UTQ4ZG1MTkhCZVczOU5ZUkxHYXNQbjl2bHFnSi9PU1ZDbHlIU1o0bWsxbm9v?=
 =?utf-8?B?bk1mQkxLb1NjZFlJZjd6NmR4eWJBTWhWWXAvbXVhRW9XdlFoSzM0bWFiclpI?=
 =?utf-8?B?Wjl2WE4vNmQrWXlXdFRyamh0Z00yc2FmY0dDVS9wdWM2TWVsTnJCZzBCNFE2?=
 =?utf-8?B?a2hIVjFFZG1EamlaRHNHc0IyQkNBQmJCSlRtNTk4MkNzY0k1YmlCeWRKOXdJ?=
 =?utf-8?B?eGwva0dyTU8rR21Tc0dISkphVWFQS3FHZXE0eGVTUDl1a3FhQTMvL2xMa1BL?=
 =?utf-8?B?Q20xK2c4dDhRTG0yQjE2cTBqYmlLNlN4QjdHdmkySkFyYnVjUkJ5cWQ1bFB5?=
 =?utf-8?B?cGgydGNhcU9NTzU0M0hFWHFQTWxZblV1cXN5Z3EzN1dsb1pLT2VVd0pUZHlY?=
 =?utf-8?B?TFBrdE94Uk5sVE9YY2xUNWRFdmlPWnIrRmhwcTF2Y2cxdXdTK2g4a0Q0aXFD?=
 =?utf-8?B?UDZLRXlRZWRxYXphVHNNcm1MMGtoL1ZNbURYcFhHNlpxVWxMSmZxRkE4eTR4?=
 =?utf-8?B?Rm0wZkxzYW9kLzNYQlVGZHlXcUhiS1lVTjZpKzlpZTRWaGFUMjVWMUlDUCtC?=
 =?utf-8?B?TFl4YTc1WEtMQWlGY0xObGt3QmxxREU3bFBrWjE0TkgwNDFHWDk2TDdVNjRt?=
 =?utf-8?B?d01OZkhuMWExYUtXeUJnOElnalNaTnRVRk9SSk15cGtOVUEvNlV1cFA3SDNw?=
 =?utf-8?B?RjhqSGMzaFNsM0FSNWNDWXF1YXlJM1NSUHBsNHcwM01uZmlCa09QcElLbTBE?=
 =?utf-8?B?STJUbmM3Y1F1azAyeVhZMzZJdmFHdWhxei9yaE53V2UvbURuaFFLSWp3OGNY?=
 =?utf-8?B?RGs5WFY0aWxEeGZqcUIza2lBVHIwWEdmclA4VExTM2RPeEFpYTNlT3pXbTJl?=
 =?utf-8?B?d1BTNDgrOWFUNUZkSUdqcXBwRE9DdjI4M3BBL1JtakZSMVJ5SnZKY0NudzZZ?=
 =?utf-8?B?VWZ4bWs2MDhMMCtHT0xTMmlsM1JXN01pa1V2SHpVOVd0N2JVUDVHV1VwM3gz?=
 =?utf-8?B?RWZxNm5tSTcxeklIQ2dvTjEwUFdLR2hrMUNpY0p2TWRFVldtaGZGNWZiVVFj?=
 =?utf-8?B?RjVINkZON3B3TTJ5bFNpVGNLb3VUOGFOK0k2ZUd1MUF0ZWRJQnFIaGg5bTAr?=
 =?utf-8?B?TkRtQnM0cXhSRDRRaGJzSGdvWjZsY0taVGhTdFBUaVI2dExybGVxTzhtMlFu?=
 =?utf-8?B?WGQwenZMWEpBbGx4eUROYW5QRytKVUU1MncwVzM2VjV2ZHZjaFJ6YXZORXp2?=
 =?utf-8?B?dzN3YjRJaEZYdUtOL0RNU0I3TkFSZmxtSmduUGhuL1h1a3duRUR2QVBpeEtj?=
 =?utf-8?B?c3ozRkNxYTV3U2tkS05kcGtpcU1oMWxFMWNXSW1DdGRhd2ljT3lvMi9adytJ?=
 =?utf-8?B?enNicTM4UzJlRi9jeCtFNU5ldGVmTjViMGpTbk15ZWVKbi96QjFIbVhwcFF5?=
 =?utf-8?B?Zmo1bVJoeHpBMlJzMStjbnBCcUVIMmpKSGg1YTNVeGdzdFpoci9WdUN6VUJZ?=
 =?utf-8?B?Q1pjVjZQTExKc2d6N0JZTDdUbzg4RzdndjVabEdZb0FDQ3M1NzFVamgzMFY4?=
 =?utf-8?B?aFh1YUhZc1Qxa2R2d0h5WmpOem1MSXRyRTN4WVVnaHp0dG5aREFGRHVpSmJX?=
 =?utf-8?B?czJPZEtON2JCclB5NmJUY29MdlpDT29RdFA2SHk3cVF4cUtGMHUrVFg0NVpp?=
 =?utf-8?Q?AXHzg2zcp65jizORK1PYX8qub?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b76d28-1bd3-4dff-acaf-08dbce48fea3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:08:31.2614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpTe6n97lyh/+mYuSn5MHKWyvt/Pa0KaRCwkPA7aV07PVNab+yIPGdipQv4BeYG8zbm0SCcQfzLd4CE/uBHJ2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7429
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/16/2023 2:22 PM, Karolina Stolarek wrote:
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
Tested [PATCH v4 0/4] Improve test coverage of TTM patches on AMD 
platform, looks good.

Regards,
S.Amarnath
> Many thanks,
> Karolina
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
> Karolina Stolarek (4):
>    drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>    drm/ttm/tests: Add tests for ttm_tt
>    drm/ttm/tests: Add tests for ttm_bo functions
>    drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>
>   drivers/gpu/drm/ttm/tests/Makefile            |   3 +
>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 ++++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  51 +-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 295 +++++++++
>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>   9 files changed, 1313 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>
