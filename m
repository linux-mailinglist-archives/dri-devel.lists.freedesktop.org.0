Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EC87A5FC9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 12:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3A910E387;
	Tue, 19 Sep 2023 10:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DC610E283
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 10:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695119942; x=1726655942;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bH+gRALbvjNxK6US9i6gr72krE9OqVS3txDIewBGm/8=;
 b=OOcgTzh3x9NfZ8MDGsSHlfu39XtaqpBIwioHZALFdYoLfCwV77hExBiq
 kL1wpoKjlTOSvuaZ2WKbgDEILsphXq/tbziOdRFifzkf4goZO7N/BHB/h
 lDUV8+Yq8V5iWOAyNyiGZFzOLAGYeN0xGLRGPy2hc1wB2KNEqObNC4CDX
 pJIttXm8x1N5qPomwpF6dCSqqJvwM6lhrycQmNMFOjGWPG54VttKK+adp
 PFETF+5SeU6xZj3RXyy0mLmXF7k20av6i9fl71l/WgmUTqaPXArrvXk8q
 EThLyzskE9tkRkn+x03MtXvZX3VqUqadK44jLubiI5mYkIotXBVZMUKsm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="379809255"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="379809255"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="739636844"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="739636844"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 03:39:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 03:39:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 03:39:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 03:39:00 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 03:39:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KF3nuKWaWOyXwEz2/ZVivO0tFCmaf4bv5dZxK8wxBYNghRCozogERdUAc0M4QnbNomUQOPgxxpxfcw8kCxxoZAAtiHpAGgj+RlaoXVIy5e+tv7qnQS9Xz7Lzobr1vJqZV4r/lHD2e0VBsa5Nxbzw65HN3nl/W6jBP/Y3n9ATSFNbGO1dYF8VsRPRfjEbSerwHa1JL2Pq+IuP5mygJ14lLSd/Env0/5e/IVD6yhDShM1YFidMRhp7iB8w/noIkvLlp4WLjvEtv/LjkJ8JtMB/5FpDZ4YSgojuT8rnRMFuidtjYTTSJW+0+RGLuj2r9hjX2upVEmq3zaIbhlcTLFkhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vy+lrzx2L9aKeH/wSJ25xVCcEEMFiNiFsLYMXlOgIp0=;
 b=OI4j0fjGuNPIRuEoNl+ZZ/zk2i+TSqCpS4QtS10d2n9eY5BFqSrszJTbs6a0pbrBsi0cnAqiQUUasiA0vqGt+Se94DNfZRIAZbdXA382BNWJMi9w7wThF97aMYW+7bBga2vSBsP/O9BNwxblVLVb6PlfTealSm+LsbiWm38Cm1ZVNkfY8OEbFvq67iFmVperM2H1AvfoKkO71LU4sQjNmn7k7O0YOWn3fUTo85VrvFkLfKUCQtDwTGEJk2RyV9W0cMygr100XjUn7tFFwFTFcf33ahP2ZtCSgo38t0wIMGEPiSY95ceqFQyAP+ZXbh1OTnR5b+OYxoZA/vEZOgxW3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 10:38:47 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d%5]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 10:38:46 +0000
Message-ID: <10d2c418-5774-b0c1-4e37-e563adccf09e@intel.com>
Date: Tue, 19 Sep 2023 12:38:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/4] drm/ttm/tests: Add tests for ttm_resource and
 ttm_sys_man
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1694517411.git.karolina.stolarek@intel.com>
 <97d52e1c257f91c7d0ff53a764fe1e590c070691.1694517411.git.karolina.stolarek@intel.com>
 <c4e66bca-a8e8-da53-1a96-7dbdd8a6d5bf@amd.com>
 <b662f3ae-037d-ffee-9aae-6c51c5d4f587@intel.com>
 <f1cdb895-95fe-98a2-7541-3624a840525c@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <f1cdb895-95fe-98a2-7541-3624a840525c@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::7) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|SJ2PR11MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ce5d59-95ed-4898-6bde-08dbb8fc9a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RfnhE/T9s6cI8iiZZE8eW4RFIx3wg5dGK8kQGj0F7cMRmD+fv7m4yjykzSTEcMNuPtPLYxS8iuGE/P0jI94V0qRo8WgLxG/bzc92edE0LBxhfIBj41e2bodMzmE0dHFoLAiBKNHU/oT6TmjKeJp6vWCBx4qmxO0LKBTypx0JzmgedCNzNPcvJ6XfepbKO2cldUxKUwmwy7C6HsQI7BXLQ4syrYPFU3dPbylvl30pFutOu+GzZ+obWIO3nqW/cqqY6+s+JW6jq1zgwMMZ80qzn0m0n+AY4QKo2jgxDmkGZTx49z7zdNgLTMtuoka1plOp/mUrMeF2vnC6NZ73FFC/A1e3e1XEhnKmx/+zgiERXrEwzwBIj1C6MgYQPwugl2hJjgXGkmtkp8lEyfwie4bqa2nZwuESlaa4Hz4TiqzDhHm3bYuvEnDjstRe0LBF2VbLSStrmRh1pk/+GnNUpaEmA1yzs/tw8GEVkxpDMuwjuMfnUIbPCfF5punUypd3GHyQvpOX6ia6j9Bfqiq6pXmv/C2hEyhThMnoH/deqS92yTXZaHFYGtAxZClPLQqEQO7hw1aq0RfInuk+XssRjEPYYD5vHs0KT9XL//JNl5HP2QHxxMiJQfMuYVDoQkOveBuMARoiEbo666LzTRJA1m7PtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(1800799009)(186009)(451199024)(6512007)(4326008)(36916002)(53546011)(6486002)(6506007)(66574015)(26005)(2616005)(8936002)(8676002)(83380400001)(82960400001)(2906002)(36756003)(41300700001)(66476007)(86362001)(66946007)(66556008)(316002)(31686004)(38100700002)(31696002)(30864003)(44832011)(6666004)(5660300002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDRlUW8xRXNaaWw2NG0wU0hqKzRhZFNnb1FKSkJTQy8wVS9SWHdNbTRkUlFy?=
 =?utf-8?B?SkUrNHloKzdYMVMzenhib083NTUwaFgrcXp4eTBkSWZpNG5ObE1DQmpFMm9Z?=
 =?utf-8?B?K3p4YnlPa2djTVYrdzllRVRpQzR6WUxacjRaRnIvNHZKVDZaNG9VYnZJaU82?=
 =?utf-8?B?dXk2VEZnVERQaU9aSmR1V2pwNkordEFqVzdPTm8yTWFGeUZKVFM1dG1zajdD?=
 =?utf-8?B?OEhLNFMxTGRvWEw1bzNPc2hFeU81Z2xnYkFwZ0hLTTZ6UGFhcmNsSVlsN0ZM?=
 =?utf-8?B?T3NoaC9oQnd2MERBaS9lTzJXaXZrTEQvTkNYMENLM1p5UXBDd2hQRmRxOWM3?=
 =?utf-8?B?cjJ5WVJpRTI3Zlk5d1hvTEVTMEVLY096UXJRc1VxeDFqNXhYZlVPNHJ5cm8y?=
 =?utf-8?B?NTB2eXNDa0luSmxDNHh0M0dOWEVuQ0JVYjFSMUdkNlV2WG9sbVBnWFFrdHlh?=
 =?utf-8?B?SGNjN0xJQ2NjQm5lMDN6YXhCZ2NPTmhqUm81c1hFY0l2d3d0S1BXYSs4aUk0?=
 =?utf-8?B?dS9DVUV4Ny9ib25ubVdYbS92bVpsQXJqUis3ZDdFWlcxTEFxK3BGVE80WWox?=
 =?utf-8?B?WGdmOEFKL0JkYW5jODdqNCtYT1ZhNkJQNkx5MGtadmVlajQwdmVpcGliR3FK?=
 =?utf-8?B?V2lOZVdtdE1tenFyUkRHVkFVZ1B6WEZJdnQxVGpMZ09TRDBjYU9wSmxQSXMy?=
 =?utf-8?B?cytFSlZSZEk1a1Z1UUh0ZUZmVEdCUGJ0ZEVtQ0JpQnNUWURPbEN3cWp5alJh?=
 =?utf-8?B?V2pjd0l2SzUwYjRyZ1F5ZHpBU284OVB0MW9ZUFk5U3ZtM1F3OE9MVU9QY202?=
 =?utf-8?B?c251Nk1RMWRwdXBNUUErdE9VaWp5Mit2eHJML3dHaEUzRGR0M0F3R0xYUnNx?=
 =?utf-8?B?NmpkU0Y4ekNQdXJBYnRtaUpGWFN5NStJRUtKRmVYVWhEVUlQaGt1SW5SMHRz?=
 =?utf-8?B?TFVOTmpwNTkyaE01eUQxSGVMYzhiRFJQK2xseTlRdnJWZmh1UkFySnNlMkwv?=
 =?utf-8?B?R21aelByM0R5cFdBNm1wYU5qTmpxRHVTbW1oK3JaUXNnalNhYkFlZCtsSW1s?=
 =?utf-8?B?bTlRdytEVktFdW9BOHVIdjUzVzV3ZXRQNmZFZUI5TkE5QWdYTERpV1NLOE96?=
 =?utf-8?B?ckdlNFc1V3BXbUl3UWwwak43c01DQ0NIOEJZZitRTVVqY254aE1HMFExa2s3?=
 =?utf-8?B?TGp1Z3BTNXNQMm0yODJZUGRMaHlneHVocG1NbzI3WkhPWW10Vmx3RmRlRWlt?=
 =?utf-8?B?dkgvV2J1eUswWVk4Wms5ZG1KUko1UEdJV2E3b2w3aitudnloNElheFBHdkpm?=
 =?utf-8?B?MEYvbWN2NXhaR0xuMmlZdnNzU2pDQ0tKWk5lNjhsUURodnh0Wm9welExcXdJ?=
 =?utf-8?B?dzBlaCtFMUdmbmkyZnNGT0laTXNCRGovUDRJd3R3Y2RDK0Z1UE4rVDBOZjY5?=
 =?utf-8?B?UUsvMUppbUV2U0RvYm5kVHpLa08ySXRMYzBpaEkzVmlVR29lM2ZZc2tWTTRP?=
 =?utf-8?B?Q1B3SXdrdW4rUC9QVFYxVG1saTJVYU1EVm5TdDBCbHV5SWxHQWNHS0gwRXd4?=
 =?utf-8?B?RDZnaDlsZk5xMEk3SkhScnBTdThLWVV4YjQ2RkFsdEJzbnQvcnU1c3FWbTF2?=
 =?utf-8?B?M0ZtM3JSb21wdnFNTkk2YWlSZ3RBbTRFWWozc2hpU3FXS3RYUGZiZ0U1a0lm?=
 =?utf-8?B?SmhvYnE2emJpR0VNVGtpNWtoK2lZRUI4cTk4UHNSV1JpTS85S0t3cSt6Y2Yx?=
 =?utf-8?B?cWhzZTl6eittUkc1eGJDNkpmTUFCWkpaU0wySm1xZlVmbWlBQ0dhVUhuK0xO?=
 =?utf-8?B?bWFYUmhxcUoxTnBrbFFxNEN1MTZra2F5dW42bFY4c2tOZWtNSDBJK09nRHpq?=
 =?utf-8?B?bnJkekVidGR4UnlWenlBQlVaOU9OcHEyQ0V4TXRVYU5RLzg2VXlMSENVZEg1?=
 =?utf-8?B?Rmo2c2pVanRGWnJVMGQzaVJRam92R29Ma1U4V0tqSGtyMTJQWEpOUm9vRkox?=
 =?utf-8?B?S1dhaW5YdHZ6Q2hrbHNaWDNaU3ZPcTlwd3YzaGtEbEs1MFc3N0tvTFJQM0dk?=
 =?utf-8?B?M0NTcDVjSTl1Vm1iMG9KRVFmcnNTUXJsalpzdWF3ei9qZko0VUcrK0tRSTNj?=
 =?utf-8?B?c1B6SE1id200WVpRaGhOZWFLMzZsRTM4UUF1T0FCQlhTMExaK1BwNVg1QTVp?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ce5d59-95ed-4898-6bde-08dbb8fc9a39
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 10:38:46.3301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMIY2lBY/6ADRhdu2RpY5s/KATQGysy/t9jWVueA3VfHS78GYL/JC9q1RxLzk6hiP2Lom6YEVgCNMvg5ezUyP95TWL1pKf94RAr3uZ7oTf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7617
X-OriginatorOrg: intel.com
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.09.2023 14:45, Christian König wrote:
> Am 18.09.23 um 13:48 schrieb Karolina Stolarek:
>> On 12.09.2023 14:54, Christian König wrote:
>>> Am 12.09.23 um 13:49 schrieb Karolina Stolarek:
>>>> Test initialization of ttm_resource using different memory domains.
>>>> Add tests for a system memory manager and functions that can be
>>>> tested without a fully-featured resource manager. Update
>>>> ttm_bo_kunit_init() to initialize BO's kref and reservation object.
>>>> Export ttm_resource_alloc symbol for test purposes only.
>>>>
>>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  23 ++
>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 
>>>> ++++++++++++++++++
>>>>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>>>>   5 files changed, 366 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>>> index ec87c4fc1ad5..c92fe2052ef6 100644
>>>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>>>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>>>> @@ -3,4 +3,5 @@
>>>>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>>>           ttm_device_test.o \
>>>>           ttm_pool_test.o \
>>>> +        ttm_resource_test.o \
>>>>           ttm_kunit_helpers.o
>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>> index 81661d8827aa..eccc59b981f8 100644
>>>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>> @@ -38,10 +38,33 @@ struct ttm_buffer_object 
>>>> *ttm_bo_kunit_init(struct kunit *test,
>>>>       bo->base = gem_obj;
>>>>       bo->bdev = devs->ttm_dev;
>>>> +    kref_init(&bo->kref);
>>>> +
>>>> +    dma_resv_init(&bo->base._resv);
>>>> +    bo->base.resv = &bo->base._resv;
>>>> +
>>>
>>> I'm really wondering if we shouldn't now initialize the GEM object 
>>> properly?
>>>
>>> That would also initialize the reservation object if I remember 
>>> correctly.
>>
>> Do you mean by using drm_gem_object_init()?
> 
> I think drm_gem_private_object_init is the right function for this, but 
> not 100% sure.
> 
>>
>>>
>>> The solution with EXPORT_SYMBOL_FOR_TESTS_ONLY looks really nice I 
>>> think and apart from that I can't see anything obviously wrong 
>>> either, but I only skimmed over the code.
>>
>> I'm also glad with EXPORT_SYMBOL_FOR_TESTS_ONLY solution, it's much 
>> better now. Right, you can take a closer look at the next version. 
>> I'll try to get an actual GEM object here, if you think that's feasible.
> 
> I can't promise it, but going to take a look when I have time.

I understand. I'm still looking at this, because I found lockdep 
warnings in ttm_bo_reserve_deadlock and ttm_bo_reserve_double_resv. Be 
cautious when reviewing my code, I left some traps there...

The good news is that "real" GEM objects work fine in the tests and I 
found a way to keep the misaligned test case for ttm_tt_init.

Many thanks,
Karolina

> 
> Regards,
> Christian.
> 
>>
>> All the best,
>> Karolina
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>       return bo;
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
>>>> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
>>>> +                       uint32_t mem_type, uint32_t flags,
>>>> +                       size_t size)
>>>> +{
>>>> +    struct ttm_place *place;
>>>> +
>>>> +    place = kunit_kzalloc(test, sizeof(*place), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, place);
>>>> +
>>>> +    place->mem_type = mem_type;
>>>> +    place->flags = flags;
>>>> +    place->fpfn = size >> PAGE_SHIFT;
>>>> +    place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
>>>> +
>>>> +    return place;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(ttm_place_kunit_init);
>>>> +
>>>>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
>>>>   {
>>>>       struct ttm_test_devices *devs;
>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h 
>>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>> index e261e3660d0b..f38140f93c05 100644
>>>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>> @@ -8,6 +8,7 @@
>>>>   #include <drm/drm_drv.h>
>>>>   #include <drm/ttm/ttm_device.h>
>>>>   #include <drm/ttm/ttm_bo.h>
>>>> +#include <drm/ttm/ttm_placement.h>
>>>>   #include <drm/drm_kunit_helpers.h>
>>>>   #include <kunit/test.h>
>>>> @@ -28,6 +29,9 @@ int ttm_device_kunit_init(struct ttm_test_devices 
>>>> *priv,
>>>>   struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>>>>                           struct ttm_test_devices *devs,
>>>>                           size_t size);
>>>> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
>>>> +                       uint32_t mem_type, uint32_t flags,
>>>> +                       size_t size);
>>>>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
>>>>   struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);
>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c 
>>>> b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>> new file mode 100644
>>>> index 000000000000..851cdc43dc37
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>> @@ -0,0 +1,335 @@
>>>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +#include <drm/ttm/ttm_resource.h>
>>>> +
>>>> +#include "ttm_kunit_helpers.h"
>>>> +
>>>> +#define RES_SIZE        SZ_4K
>>>> +#define TTM_PRIV_DUMMY_REG    (TTM_NUM_MEM_TYPES - 1)
>>>> +
>>>> +struct ttm_resource_test_case {
>>>> +    const char *description;
>>>> +    uint32_t mem_type;
>>>> +    uint32_t flags;
>>>> +};
>>>> +
>>>> +struct ttm_resource_test_priv {
>>>> +    struct ttm_test_devices *devs;
>>>> +    struct ttm_buffer_object *bo;
>>>> +    struct ttm_place *place;
>>>> +};
>>>> +
>>>> +static const struct ttm_resource_manager_func 
>>>> ttm_resource_manager_mock_funcs = { };
>>>> +
>>>> +static int ttm_resource_test_init(struct kunit *test)
>>>> +{
>>>> +    struct ttm_resource_test_priv *priv;
>>>> +
>>>> +    priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, priv);
>>>> +
>>>> +    priv->devs = ttm_test_devices_all(test);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, priv->devs);
>>>> +
>>>> +    test->priv = priv;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void ttm_resource_test_fini(struct kunit *test)
>>>> +{
>>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>>> +
>>>> +    ttm_test_devices_put(test, priv->devs);
>>>> +}
>>>> +
>>>> +static void ttm_init_test_mocks(struct kunit *test,
>>>> +                struct ttm_resource_test_priv *priv,
>>>> +                uint32_t mem_type, uint32_t flags)
>>>> +{
>>>> +    size_t size = RES_SIZE;
>>>> +
>>>> +    /* Make sure we have what we need for a good BO mock */
>>>> +    KUNIT_ASSERT_NOT_NULL(test, priv->devs->ttm_dev);
>>>> +
>>>> +    priv->bo = ttm_bo_kunit_init(test, priv->devs, size);
>>>> +    priv->place = ttm_place_kunit_init(test, mem_type, flags, size);
>>>> +}
>>>> +
>>>> +static void ttm_init_test_manager(struct kunit *test,
>>>> +                  struct ttm_resource_test_priv *priv,
>>>> +                  uint32_t mem_type)
>>>> +{
>>>> +    struct ttm_device *ttm_dev = priv->devs->ttm_dev;
>>>> +    struct ttm_resource_manager *man;
>>>> +    size_t size = SZ_16K;
>>>> +
>>>> +    man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, man);
>>>> +
>>>> +    man->use_tt = false;
>>>> +    man->func = &ttm_resource_manager_mock_funcs;
>>>> +
>>>> +    ttm_resource_manager_init(man, ttm_dev, size);
>>>> +    ttm_set_driver_manager(ttm_dev, mem_type, man);
>>>> +    ttm_resource_manager_set_used(man, true);
>>>> +}
>>>> +
>>>> +static const struct ttm_resource_test_case ttm_resource_cases[] = {
>>>> +    {
>>>> +        .description = "Init resource in TTM_PL_SYSTEM",
>>>> +        .mem_type = TTM_PL_SYSTEM,
>>>> +    },
>>>> +    {
>>>> +        .description = "Init resource in TTM_PL_VRAM",
>>>> +        .mem_type = TTM_PL_VRAM,
>>>> +    },
>>>> +    {
>>>> +        .description = "Init resource in a private placement",
>>>> +        .mem_type = TTM_PRIV_DUMMY_REG,
>>>> +    },
>>>> +    {
>>>> +        .description = "Init resource in TTM_PL_SYSTEM, set 
>>>> placement flags",
>>>> +        .mem_type = TTM_PL_SYSTEM,
>>>> +        .flags = TTM_PL_FLAG_TOPDOWN,
>>>> +    },
>>>> +};
>>>> +
>>>> +static void ttm_resource_case_desc(const struct 
>>>> ttm_resource_test_case *t, char *desc)
>>>> +{
>>>> +    strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
>>>> +}
>>>> +
>>>> +KUNIT_ARRAY_PARAM(ttm_resource, ttm_resource_cases, 
>>>> ttm_resource_case_desc);
>>>> +
>>>> +static void ttm_resource_init_basic(struct kunit *test)
>>>> +{
>>>> +    const struct ttm_resource_test_case *params = test->param_value;
>>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>>> +    struct ttm_resource *res;
>>>> +    struct ttm_buffer_object *bo;
>>>> +    struct ttm_place *place;
>>>> +    struct ttm_resource_manager *man;
>>>> +    uint64_t expected_usage;
>>>> +
>>>> +    ttm_init_test_mocks(test, priv, params->mem_type, params->flags);
>>>> +    bo = priv->bo;
>>>> +    place = priv->place;
>>>> +
>>>> +    if (params->mem_type > TTM_PL_SYSTEM)
>>>> +        ttm_init_test_manager(test, priv, params->mem_type);
>>>> +
>>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>>> +
>>>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>>>> +    expected_usage = man->usage + RES_SIZE;
>>>> +
>>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
>>>> +
>>>> +    ttm_resource_init(bo, place, res);
>>>> +
>>>> +    KUNIT_ASSERT_EQ(test, res->start, 0);
>>>> +    KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
>>>> +    KUNIT_ASSERT_EQ(test, res->mem_type, place->mem_type);
>>>> +    KUNIT_ASSERT_EQ(test, res->placement, place->flags);
>>>> +    KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
>>>> +
>>>> +    KUNIT_ASSERT_NULL(test, res->bus.addr);
>>>> +    KUNIT_ASSERT_EQ(test, res->bus.offset, 0);
>>>> +    KUNIT_ASSERT_FALSE(test, res->bus.is_iomem);
>>>> +    KUNIT_ASSERT_EQ(test, res->bus.caching, ttm_cached);
>>>> +    KUNIT_ASSERT_EQ(test, man->usage, expected_usage);
>>>> +
>>>> +    KUNIT_ASSERT_TRUE(test, 
>>>> list_is_singular(&man->lru[bo->priority]));
>>>> +
>>>> +    ttm_resource_fini(man, res);
>>>> +}
>>>> +
>>>> +static void ttm_resource_init_pinned(struct kunit *test)
>>>> +{
>>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>>> +    struct ttm_resource *res;
>>>> +    struct ttm_buffer_object *bo;
>>>> +    struct ttm_place *place;
>>>> +    struct ttm_resource_manager *man;
>>>> +
>>>> +    ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
>>>> +    bo = priv->bo;
>>>> +    place = priv->place;
>>>> +
>>>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>>>> +
>>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
>>>> +
>>>> +    dma_resv_lock(bo->base.resv, NULL);
>>>> +    ttm_bo_pin(bo);
>>>> +    ttm_resource_init(bo, place, res);
>>>> +    KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
>>>> +
>>>> +    ttm_bo_unpin(bo);
>>>> +    ttm_resource_fini(man, res);
>>>> +    dma_resv_unlock(bo->base.resv);
>>>> +
>>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
>>>> +}
>>>> +
>>>> +static void ttm_resource_fini_basic(struct kunit *test)
>>>> +{
>>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>>> +    struct ttm_resource *res;
>>>> +    struct ttm_buffer_object *bo;
>>>> +    struct ttm_place *place;
>>>> +    struct ttm_resource_manager *man;
>>>> +
>>>> +    ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
>>>> +    bo = priv->bo;
>>>> +    place = priv->place;
>>>> +
>>>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>>>> +
>>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>>> +
>>>> +    ttm_resource_init(bo, place, res);
>>>> +    ttm_resource_fini(man, res);
>>>> +
>>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
>>>> +    KUNIT_ASSERT_EQ(test, man->usage, 0);
>>>> +}
>>>> +
>>>> +static void ttm_resource_manager_init_basic(struct kunit *test)
>>>> +{
>>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>>> +    struct ttm_resource_manager *man;
>>>> +    size_t size = SZ_16K;
>>>> +
>>>> +    man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, man);
>>>> +
>>>> +    ttm_resource_manager_init(man, priv->devs->ttm_dev, size);
>>>> +
>>>> +    KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
>>>> +    KUNIT_ASSERT_EQ(test, man->size, size);
>>>> +    KUNIT_ASSERT_EQ(test, man->usage, 0);
>>>> +    KUNIT_ASSERT_NULL(test, man->move);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
>>>> +
>>>> +    for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>>>> +        KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
>>>> +}
>>>> +
>>>> +static void ttm_resource_manager_usage_basic(struct kunit *test)
>>>> +{
>>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>>> +    struct ttm_resource *res;
>>>> +    struct ttm_buffer_object *bo;
>>>> +    struct ttm_place *place;
>>>> +    struct ttm_resource_manager *man;
>>>> +    uint64_t actual_usage;
>>>> +
>>>> +    ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 
>>>> TTM_PL_FLAG_TOPDOWN);
>>>> +    bo = priv->bo;
>>>> +    place = priv->place;
>>>> +
>>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>>> +
>>>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>>>> +
>>>> +    ttm_resource_init(bo, place, res);
>>>> +    actual_usage = ttm_resource_manager_usage(man);
>>>> +
>>>> +    KUNIT_ASSERT_EQ(test, actual_usage, RES_SIZE);
>>>> +
>>>> +    ttm_resource_fini(man, res);
>>>> +}
>>>> +
>>>> +static void ttm_resource_manager_set_used_basic(struct kunit *test)
>>>> +{
>>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>>> +    struct ttm_resource_manager *man;
>>>> +
>>>> +    man = ttm_manager_type(priv->devs->ttm_dev, TTM_PL_SYSTEM);
>>>> +    KUNIT_ASSERT_TRUE(test, man->use_type);
>>>> +
>>>> +    ttm_resource_manager_set_used(man, false);
>>>> +    KUNIT_ASSERT_FALSE(test, man->use_type);
>>>> +}
>>>> +
>>>> +static void ttm_sys_man_alloc_basic(struct kunit *test)
>>>> +{
>>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>>> +    struct ttm_resource_manager *man;
>>>> +    struct ttm_buffer_object *bo;
>>>> +    struct ttm_place *place;
>>>> +    struct ttm_resource *res;
>>>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>>>> +    int ret;
>>>> +
>>>> +    ttm_init_test_mocks(test, priv, mem_type, 0);
>>>> +    bo = priv->bo;
>>>> +    place = priv->place;
>>>> +
>>>> +    man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
>>>> +    ret = man->func->alloc(man, bo, place, &res);
>>>> +
>>>> +    KUNIT_ASSERT_EQ(test, ret, 0);
>>>> +    KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
>>>> +    KUNIT_ASSERT_EQ(test, res->mem_type, mem_type);
>>>> +    KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
>>>> +
>>>> +    ttm_resource_fini(man, res);
>>>> +}
>>>> +
>>>> +static void ttm_sys_man_free_basic(struct kunit *test)
>>>> +{
>>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>>> +    struct ttm_resource_manager *man;
>>>> +    struct ttm_buffer_object *bo;
>>>> +    struct ttm_place *place;
>>>> +    struct ttm_resource *res;
>>>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>>>> +
>>>> +    ttm_init_test_mocks(test, priv, mem_type, 0);
>>>> +    bo = priv->bo;
>>>> +    place = priv->place;
>>>> +
>>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>>> +
>>>> +    ttm_resource_alloc(bo, place, &res);
>>>> +
>>>> +    man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
>>>> +    man->func->free(man, res);
>>>> +
>>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
>>>> +    KUNIT_ASSERT_EQ(test, man->usage, 0);
>>>> +}
>>>> +
>>>> +static struct kunit_case ttm_resource_test_cases[] = {
>>>> +    KUNIT_CASE_PARAM(ttm_resource_init_basic, 
>>>> ttm_resource_gen_params),
>>>> +    KUNIT_CASE(ttm_resource_init_pinned),
>>>> +    KUNIT_CASE(ttm_resource_fini_basic),
>>>> +    KUNIT_CASE(ttm_resource_manager_init_basic),
>>>> +    KUNIT_CASE(ttm_resource_manager_usage_basic),
>>>> +    KUNIT_CASE(ttm_resource_manager_set_used_basic),
>>>> +    KUNIT_CASE(ttm_sys_man_alloc_basic),
>>>> +    KUNIT_CASE(ttm_sys_man_free_basic),
>>>> +    {}
>>>> +};
>>>> +
>>>> +static struct kunit_suite ttm_resource_test_suite = {
>>>> +    .name = "ttm_resource",
>>>> +    .init = ttm_resource_test_init,
>>>> +    .exit = ttm_resource_test_fini,
>>>> +    .test_cases = ttm_resource_test_cases,
>>>> +};
>>>> +
>>>> +kunit_test_suites(&ttm_resource_test_suite);
>>>> +
>>>> +MODULE_LICENSE("GPL");
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c 
>>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> index 46ff9c75bb12..02b96d23fdb9 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> @@ -30,6 +30,8 @@
>>>>   #include <drm/ttm/ttm_placement.h>
>>>>   #include <drm/ttm/ttm_resource.h>
>>>> +#include <drm/drm_util.h>
>>>> +
>>>>   /**
>>>>    * ttm_lru_bulk_move_init - initialize a bulk move structure
>>>>    * @bulk: the structure to init
>>>> @@ -240,6 +242,7 @@ int ttm_resource_alloc(struct ttm_buffer_object 
>>>> *bo,
>>>>       spin_unlock(&bo->bdev->lru_lock);
>>>>       return 0;
>>>>   }
>>>> +EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_resource_alloc);
>>>>   void ttm_resource_free(struct ttm_buffer_object *bo, struct 
>>>> ttm_resource **res)
>>>>   {
>>>
> 
