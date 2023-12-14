Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC993812CD0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 11:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D1810E0AE;
	Thu, 14 Dec 2023 10:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7C710E0AE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 10:23:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEFd0djGNFBq8koeCJORLRJylM0Lyeh6ANfcWm/6P3Ndh3Xp97kcmtzTB+Hq0DJaLOlHG+w8l4FpZSkopdLASBJb87kvGLRmHH/4A6VgxWPZaGu6oIeKUkMdTZDn94xduErTY8VCEGw0mNEGPoYuGAizXsBcSxwDD3MF0MXIz+6cowD1rg97SSkIFiGFDLcbBkdDK0Yr+8iiY0O4qfulBDiDz/BHqPZC0dGHzGu6754kl3BDMGzVgJQs3lh8L/ZMvhJx0DbN529HOX1K82qEvTctDu5GZHPycKyL5ZEUo+gAvQckqpZTsMTjA7C6YxqADbk9qvmIErom3AHKto/sAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyxpePAZeCdnrVMFQYi5Kg1Y/PRYDQ9g7CwOP9vU6Js=;
 b=V+JW0HWIBplro6OZ0paYoBSQq59owl7WDU2cCxo3yiN7WDFD9WBqAusfNAdHPavW2givwNqnj9ufQ96bp4t0mtglraKB+m5aYut7O2e7Yh/cJhSek6e2jJSrEXYnLrU9C240pSdASNsEqYaaQOvXyDnmlUcZfCPCeCr9cAgog0FOIMWxx4LsbPOmn9nsPsSSbzv4v+DfSDYwSj2ApjHHguqKdh7mfLl0zQyUjy1lBOsUWoz/ty7zbsZWDFEtdGYvtReMksQn8WpQ0nwcKwlPYW+TyP7/Qw9DDHVOf9P16dv0UX9GtS2xeK+KwSJGl4JApz1axfOv16BCJX5qKOCnGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyxpePAZeCdnrVMFQYi5Kg1Y/PRYDQ9g7CwOP9vU6Js=;
 b=tk4DOACW3O/YohY338Tmp96bDKso3mNpAxatlrcKPSYUeIJgC+HAkRyZnigqI6ykf+bRs/W7U0VQItsON3JezD5vxztqwPjwVXJmvYj6SlGvbYzNiORBe8lnbROREplIALUJks1q6wJB7mlyAzYxl3N0m47uR8ogto3S1dl5c2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by SA1PR12MB6871.namprd12.prod.outlook.com (2603:10b6:806:25f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 10:22:58 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::3388:5dcd:ae1f:6411]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::3388:5dcd:ae1f:6411%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 10:22:58 +0000
Message-ID: <15e33301-3438-454e-b0c8-7f402fd25e93@amd.com>
Date: Thu, 14 Dec 2023 11:22:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/8] Improve test coverage of TTM
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>
References: <cover.1701257386.git.karolina.stolarek@intel.com>
 <cf7472e8-d2b9-41cd-90cc-b7a467bf08a0@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cf7472e8-d2b9-41cd-90cc-b7a467bf08a0@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0211.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|SA1PR12MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: b1313a07-9733-41d9-3ca9-08dbfc8e9715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CIic3TIXxx8nEajipTgQiUXGePEbhlQRXp/uCq0bhcCUV3Iu7sX76KrsxyKPKBvMaZ3RApOshSWhU4s2cptRea0474CCOVkOm0Mm1ekiBN6JccChrAZ3e3azMmqD4bIIbQU1fxrd57JwnUWZgzdZ/KRTVF6i99r49v62mIX8GYfmprlUywsXll7sb3iXYrF9OkDg3yj9l7Qn4tJiyOaDukgWruBCPylC5hlcfYPoRE56iW/3mKZsfRDAFaTCjBrECum894x2szyshI6izo6o1Wfw0D8kVT2vwWiHoRJrcsp7fD5kX/5YWqLr4kCZNuJcwlbQqU1ugA5qyevAUVsysU/jVEXLiRjMrndbZsItTIKoLKpdY5vd+Hh+fVWqgog9WBFGt9gc9eWIsWmUlumJA23/P/z+1cq0XXrNDS2O7V3a3sfcXd/lxCuNXd/aoWnc4OG6sOEhTbGpmTVkEvt4ROoVmI9AC7P594+olnfM86VId5xsWUOoeNt4wa7AduUAD0cEhMNsifBbHMViCwtJ49vFszB3CCVvQgoFBzGtT4ez8hy0M+RO5/I4H4gV/JFv5ZoO8fcuBdrcZQKV369cc3y4u4cE5ueQoBN3McS/h/PV3ssp69KiTBF5N4S2PnUeYa70W+VBaLfumaRt2udX7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(38100700002)(26005)(2616005)(83380400001)(36756003)(31696002)(86362001)(31686004)(53546011)(6486002)(478600001)(6512007)(6666004)(6506007)(66946007)(66556008)(6916009)(316002)(66476007)(8676002)(4326008)(8936002)(2906002)(5660300002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmpVSUNuSjNQVnh0VFpUTEZJTUxMK2hGcUZTd05QLy9RTDNxT0t2Q253OXJG?=
 =?utf-8?B?bGVWUVhKdnZJa1A3UHFlS1BDb2JRb21vOVFNb2orU3lSZmxUbWhiSnR2VGxh?=
 =?utf-8?B?NS9kWXNpbE1TenhtYTlBSk5PTXdCWnVST2tLVi9PVHdMUkVjZDlMMlJFNVJr?=
 =?utf-8?B?ckFnaFNtZlZBUHhQT0hOdE9CbFk3dlRKeFlPTm5QcGFJVzZLR0llbituekpM?=
 =?utf-8?B?Z1I0RkljMXVteXk0WmIwVGpDN1cvQlROeGxXUDNuRHVEdlVCMjAwbm1BbDFV?=
 =?utf-8?B?RCtUT2xWZmJaN040TjRiR1lReTJoajNQQkxJWHBWV1ZDYjBIcHNuLzJPUGtl?=
 =?utf-8?B?Zlg4TGpoRHE3cWcvamZXT3c0MmxraEh6SUUrTHliSVp4MGdtd08vU0dRdDRO?=
 =?utf-8?B?M1ZzYW9QUTJ1WXNxa25PZEhCb3BGaTJxZCtxZlNvMmljY0d0OE5QNHBLZ29i?=
 =?utf-8?B?bGZqZmVMRmd3L1VuSUQ5ZjlkQ045ZnA0ODNMc2JFY3J3Q3Z3OXg3OThpQ3I5?=
 =?utf-8?B?Zi92UGtnUVNqMlB3OGZmUXRYSWNmUlFaNmEvaXk2dU1kb3djRkpNcWVnbU9L?=
 =?utf-8?B?VGpHNXZFTm50elR0eW85N29OVldzdi9hb1F2TDAya2hkSWN5Y0hmUUhnNEF6?=
 =?utf-8?B?a3A2YlYwREt1UnpoSURGU0tIVlFwZC9vYzFVMm1pZ1NmczNQc2wrcytNWk5O?=
 =?utf-8?B?ZXd1MmlMQmk2K1FibE1ZdEFETVBwL3ZEYkRMeHpUM1hRZVk1ODcrZHhLMFlT?=
 =?utf-8?B?K3lJL1VFY3N0MmJFRkNCNlJXN3A0S3lyZU90QTRhb2tlS0ppUkJlaDJ2THZH?=
 =?utf-8?B?S2RrUXlBQVdIdGdCM2RDVlVyem81c0YxVUplSFNxaWxra0dSdU1YdEg5L1N0?=
 =?utf-8?B?dkFCbTIzaXRrYVBadjk0cHp4WENxL20zNm82ak9NWXFESldkUktSVU02UzF6?=
 =?utf-8?B?dzc5SjFncTEzTVdGbngySno0dmVQdDE2bE1qdVlBb3JuV2FuengwVkQ2Tm1a?=
 =?utf-8?B?N2RXcWpTV3RMZ2tWd2Y0SldkU3k5TzJnV2hhVWNGQjJyODM2cVQ3MldqN3JK?=
 =?utf-8?B?TWdJc2wzR1VaKzd5anJPbnlIM3F4WCsxQW8rZUZITHg5cUpFc3RNU2R4U05H?=
 =?utf-8?B?NHNhZm9MK1ZJMVJuTVlQd1ZWNy9WRVNad1UxRDlKUXcyQ0t0SUREbnBSWHp2?=
 =?utf-8?B?aWFqdmVPNlliNkVtQzhsc3VjbDR0NjVqcGd1WHpYbmJwTHdQWHFjOWdobk5V?=
 =?utf-8?B?QXJsWjBZNTl1N0p4eTVDdFNFd2RURWp5WGE5ODFGeFZzMW5HcVo0Ty9EMVNs?=
 =?utf-8?B?ZUxPZEN3UGFNNzRZaTZYOHdyM3U2TURBQlltdUNZUFhwYTljb3lkb1RzM3hI?=
 =?utf-8?B?TGdnR3pSbVhnQ2Y2aWEyRzNVRmdvME1yUUU0OUpkeU80U1RPb0tDbWt6RFlJ?=
 =?utf-8?B?eTRhTWI4MkZLNXl6NGEwUS9ad2dWUi9wRjJuWll4OVNjYkFUUlB2SHlQLzV1?=
 =?utf-8?B?TGtUbDdEdldQd3IzeHo2a2NmZ2ZHOVo4L0Q5NkNNa2dHRjdmOWxSNFE4MkZF?=
 =?utf-8?B?SFpRVEMwU2xIUWN5eHRqd2E4Ym5Ta1FyNUx2TmNhbWd4cWhnU2J6TGRUOE1M?=
 =?utf-8?B?MFdVck1rbDdpK0pJL0h6RnFKaTdCVFdsYUN2VFJXL2I2aTJ0eENHRHh3N05Q?=
 =?utf-8?B?T21vZTZ5ZkQrd3BQQVd6S2E4VGZ2TlJMNFA2ZFZlM25vYmloazk1WFk0MjEv?=
 =?utf-8?B?ZjZCSkxiYzU4dFVSUDQxd2pPWFlxZGpXc1I5UDRRWjJ3YjZtTDNCSGlJSUJ2?=
 =?utf-8?B?cXJkT2NBTEhBcjMyRlZkRUFLZ3ptYnIyblg1VTFaU2xsQUk4TGw4bE5NZDZU?=
 =?utf-8?B?bVExTjkyRE5WTlFHcyszS0FYVjV0RW9XZzFKRldYMU5laVltYUJmdnBYQjhI?=
 =?utf-8?B?YVFKYlh6Uks3WGcrcExvZXRjRnQwa2NwU1FXbTh2cUszOHc1K1I2ZmtkeTFz?=
 =?utf-8?B?aThCN0JtR3VKL083TXhZdWp6UThHVHAwT2pEbmhMcVdSOEpnWlFqRmMzblYw?=
 =?utf-8?B?MXRNM0tFVmc1UnoxaG1YSUQwRkcxbW52VXNhYnJSRkRzODB2L05Dd1Q0T25u?=
 =?utf-8?Q?DnrzKafN0V8/PkfyAkCo26ml1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1313a07-9733-41d9-3ca9-08dbfc8e9715
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 10:22:58.5318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMAJb0CJBiN+AKlOVHYh3UvN6gwGwqsNdH+He4//YS0DbIcYmhBrmzc8fqqOY2LK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6871
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 14.12.23 um 09:20 schrieb Karolina Stolarek:
>
> Hi Christian,
>
> On 29.11.2023 13:02, Karolina Stolarek wrote:
>> Karolina Stolarek (8):
>>    drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>>    drm/ttm/tests: Add tests for ttm_tt
>>    drm/ttm/tests: Add tests for ttm_bo functions
> >    drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>
> Would it be possible to get these patches merged? They already have
> r-b's. There are a couple more, but these don't depend on any other
> patch that is pending review, and should be easy to get in.

Sure, just pushed those three to drm-misc-next.

>
> I'm asking for this because I have three final patches ready for
> submission (eviction, ttm_tt_populate, TODO file) and wondered if I
> should submit them as v9, or if I could create a new series. I'd prefer
> creating a new one, this patchset is already big and intimidating :)
> Having said that, thank you for taking your time to review the tests, I
> really appreciate it.

No problem, you are actually helping getting stuff from my way to long 
TODO list.

Regards,
Christian.

>
> All the best,
> Karolina
>
>>    drm/ttm/tests: Use an init function from the helpers lib
>>    drm/ttm/tests: Test simple BO creation and validation
>>    drm/ttm/tests: Add tests with mock resource managers
>>    drm/ttm/tests: Add test cases dependent on fence signaling
>>
>>   drivers/gpu/drm/Kconfig                       |   1 +
>>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   1 +
>>   drivers/gpu/drm/ttm/tests/Makefile            |   5 +
>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 622 ++++++++++++++
>>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 795 ++++++++++++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 109 ++-
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   7 +
>>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 207 +++++
>>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  31 +
>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 282 +++++++
>>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>>   14 files changed, 2401 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>>

