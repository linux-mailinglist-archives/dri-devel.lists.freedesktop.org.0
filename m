Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C8E3D0648
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 03:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8D26E1CE;
	Wed, 21 Jul 2021 01:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3646E1CE;
 Wed, 21 Jul 2021 01:06:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="211411965"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="211411965"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 18:06:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="462231417"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 20 Jul 2021 18:06:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 20 Jul 2021 18:06:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 18:06:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 18:06:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7UWfCUvPacnTKhumtNPG+hsENKN9MM2VwnzrDwIIaFQocWdeIjdkp/IZUHO/m+P/RiVJpbfB6FQI7SQ+aSgjdiUUT7f2FQFegEvnap0P+cvOStosZqSuPDfAX/G9KtO0JGVCKcSRTEmQrFZ2Lne26zd9pslQzFDeqknweBxkd+mnpHmTW46BrlxbdOfqfOAsDbwwCfgF+5sZuD980M3ntaY19O5A+egEuLMAzeTxR7ZZ24dZ3qelJ6/ELwZxweqYFsAFdtgW8wN6x5h+2gNA22LP+vEjHDSaGC3iSS7Q/mOqcV4n2EMiXJ15QUjyoPKOtfD+kz6jdUXzFytSqgTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjWx+7E/xLvTzfBj2/x/FpEmJVcGy1TPSHf4ODPxv/c=;
 b=j2JP+H+e+5JsO73t0iTNo16HfEV67asbqbQ4fsWnEEdEARYbBWNWb8kNX9Rh6P9w3fHl0rV4WGv+8bV1MC7cmKeKUKt0f7Ex6wA3ZyniTbwkoA+RBltjD/TNFLIWm7kjOK3a+DHg4Mm9mLKvg9thqTr1R1RxQa9gTBxmy7yE6pCTVpLvzd7v9IQxYKvIsT3m1vysklImCWr3LxLzp3hBplmp1CrXTSUDORGeZEZdhJHhZ6Yn6VuRwpWcHIgBTPX5pNn7qtnL69XVHyh7ZBI5mMOKQ0+bPhR33jogAs+RzuFQ8rJt5zpSJ53MwklAHeivf7XI63UAFoD69ratRETYmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjWx+7E/xLvTzfBj2/x/FpEmJVcGy1TPSHf4ODPxv/c=;
 b=Ye+FK1m49wGWPnqyT/E7uRPVEU1U/sqF11Jr9nLtYtm3nQfIF0aUfAMyljC7MYD/MRteBx2jh8gfgDroGhanZWmiyzIy9F0HNq6ipIYKNBITuCK0a27zszsdsyu3Okxrscv+k1z2ngIzIPUqk0QDUTPaYM4RXrj+EiW+wyrEdBQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5571.namprd11.prod.outlook.com (2603:10b6:5:35f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 01:06:52 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%8]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 01:06:52 +0000
Subject: Re: [PATCH 15/16] drm/i915/guc/slpc: slpc selftest
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-16-vinay.belgaumkar@intel.com>
 <6b181891-b36d-2cf0-6282-0941d2b872b1@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <35a43f9e-d110-889e-b0f3-aba89df573db@intel.com>
Date: Tue, 20 Jul 2021 18:06:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <6b181891-b36d-2cf0-6282-0941d2b872b1@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0064.namprd02.prod.outlook.com
 (2603:10b6:a03:54::41) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BYAPR02CA0064.namprd02.prod.outlook.com (2603:10b6:a03:54::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 21 Jul 2021 01:06:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b27cceaf-49be-4148-da47-08d94be3d365
X-MS-TrafficTypeDiagnostic: CO6PR11MB5571:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB55710F7F6C8D55DEBDA6157685E39@CO6PR11MB5571.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jexMD43m6D1u1M96umLz8nT1Y95y0tLEKw4u2cqZnjvRGVx7bpnf6/t0Lfs4+374gZLdGRKGdNKEagRmf2n3GVgPM2szDtle36VUwjchoFZPy2xPxiiFe5y7WTdKOcQ1FYYClkRe/nrLbfrRqCQiLz3sIk0wkEfChBXDJJ++mOhhdqEIS+DaS8lJvLdLi9My0tSJYI94Io9Da/8L4LCYIKhbFAYS83OzsDAXod3FZuRvAxbJtjLUoJiSPxKxxzLad0BW8QJjZaR4kC2xnWk/alhgcxh2IeOu9oza0AlNqcxyYoiVEv/NtqgSbr6iPr833FwxTafyaFzK8QUSfBY5dOWoATFhYIoCc5gG+DonHyeds59+c9yedxC9wHgBjrQbfCSftS/6gFERWK38XXIGYp2b3YXBeJLhtUmtL4I5iI1Ohurm7e5Qsg56LxXk5vzrUp7VMgA84WXJ/OwGbVtKFwjMLd1Dz4stHl02bZqSpOEvsS0ByOf32SmTLe/lRtuHtadQHzgQR8vhaeITzG2kSDtmrKqESqM/g9I0s3+a4cC+7TbrH66H8xxoBYIDhdTmnUUM8lpksMIa4OUhKE8y8wKt/sZu/jUFcK7JiIYpC+NiikM6NmZ5GfaOUZZjG//hOyOdlL+kVNI3m9zY2gFCxWC74rvtHhraUO8WbHAIyvG6BgWDF9+JVGvaQwt+8yKHJsLAN5yq1M/J1qtPw3xi0QZKqXQhDFOEFg/JoSZqJSzFtw1cef3sBgB6WbjxNRoA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(31696002)(478600001)(450100002)(6486002)(83380400001)(6666004)(53546011)(38100700002)(31686004)(36756003)(26005)(186003)(66476007)(86362001)(2616005)(8936002)(2906002)(5660300002)(8676002)(66946007)(30864003)(956004)(66556008)(316002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2txQWV0dzA1d1ljV2puY0hoV2xWSDJhY0Q2bGFHZVZ0clNTTGp2bWN1QTlu?=
 =?utf-8?B?cWprSmdkclpRWGVWYldCRjhBaUZObWd6a0ttL2srOFpRVWI3VjJBWkVvY21w?=
 =?utf-8?B?RE1XWk50UG9Ca1piZW1vL0xUL09LVVFvUERST1F0NnhRSG9rV3NjMkRISU9H?=
 =?utf-8?B?T2xyU09pUW9aK1RaZkJOZm9nN1RtRXY2RjFQbFlpUjlQeWVqTm50OHlTK09Y?=
 =?utf-8?B?c2ordkwrb211RFdmalFWOXRVdWR1ZCs4WEIvQlpvK1MvejNGcjZGKzhzRksw?=
 =?utf-8?B?SFhpYjByVGlpNUwxa3JtOURBWXUyYXhCMUs5Q1VRM1ExUHVjcUxpSWdubVN6?=
 =?utf-8?B?OFptMUVnQXZPNldXNUpEL0U4MGhhTWl0YmRDRXA2bE9SM3QxRm8xYm9rQjZD?=
 =?utf-8?B?eUd1QXRSd2hiSVdvN0NPVGtiZnc5RUtuaWJJclNXN0dqMGtPdjB2eFA1eCt6?=
 =?utf-8?B?UW5yOUdRMThWbTE1SUdDbWUyUkZJbjlvYnpuYXdTeEFPWk1vQlBDdW9jUTZ6?=
 =?utf-8?B?K1JnWkxmckltdEhDcFZWM0FtK1AySWkzbkZkS3FUemhEL3ZMLzFRWm51T29F?=
 =?utf-8?B?L1BKSGdTSitoR3lWU2pWaUNwNXJ2VEdxZzVrQ2FzZEVkZDFnOW94SGJWSWo1?=
 =?utf-8?B?ZmJ0UkZFS2pnU3ZJMEtqWDR3elo0NHRoVFV1WFFzMGhmcDByZ0lpWW00Nm81?=
 =?utf-8?B?S2pWd3d0MHRLZlBpWkRBRmVIV3dPdnlmd0ZZM1N4R0pmU3Vhd3VZZFE0T3gy?=
 =?utf-8?B?SnFzbnIrM0h6dXFaTkdHYzQyVkJBSWU3dktpTFN4ZFZHNityZExlUHE2MFh1?=
 =?utf-8?B?V2dPU3ZFWUozaWdXNUhKNFVrSFBmVEdEYjFXTkgwc0V1aDhqSVFCZy9tSjR4?=
 =?utf-8?B?ZE1vaElJWVJsSGJEMVJmRmhGbnlIWFdqV3NPT1NEUHZodEMyKzhFT2RvdUE5?=
 =?utf-8?B?dHp6cEtSQ3V4bWhDTC9PNUZxQ3hRUTdiTnJXQ05MUVgwcG5JMHplT1R3OHVO?=
 =?utf-8?B?SFdoY0s5eDRkODJraTJjQlJkZkNQeFZpM3Qrb0RKd2FDdllBUENxTk5NM25y?=
 =?utf-8?B?aCtGOExQOFNLUG10L2dpUmZ4MnNlbUJFVkxudjMwWVVzRS9sdFVnTW02RDZQ?=
 =?utf-8?B?NkZIc3FLQU9PeS96ZHZxY2pwdnYxYk1SUTN4bjBnL2NtNXVuSFdjbFNTUG5D?=
 =?utf-8?B?Uk1JRk51YXlsUTFhb1dUakNmNnVyN284eFlDdHg5UGI3ems4dXpmTEJ0dzNs?=
 =?utf-8?B?WWhoU2l5bzVFZU5rd3NzZjBzRm1YclNabWxlRTNRbjlmYTQ1alZwcEhXNDVo?=
 =?utf-8?B?VS82MS9hLzFKWFc5c3RMeGFLVno5UjFjK01LdmZDYUJ5K3RrSkJZSTJlZ1pV?=
 =?utf-8?B?aVd2L00venNUcTBJcVhqMHlmYzdROGk2WXFXSjZXbjFqZmpqR2dqNzVHN0VD?=
 =?utf-8?B?OHd1TXJwZENCZWtDMmhlc3VsNHduUUVHU1B6ZHQvakFIaDVUVlplTE5nQ09X?=
 =?utf-8?B?ZEg5T0ZNNkR1RHl3cGM2WXJ5eGluOG84a1N5blNTWU0xdkZrcC9teHZyMlpr?=
 =?utf-8?B?aytocEJKRmFHZFIwaEo2dDZra1lhM1pGZWtZQWRnRkt6STJiYXBpZFpxUHdh?=
 =?utf-8?B?dWhYY1ZLVEtOcWRXNldPUmVsd2p6L1ZHclQ2ZE9QNUVUMWZ4WmtZY0NMazdn?=
 =?utf-8?B?WDdKTW1lTUtRNHcvbFNiR2RFRUtPWUl1bUg1bGZvNHBOQkZQaFJzUFJGd1Yz?=
 =?utf-8?Q?houpFUI8MF3u2PPlBY/4JXg9YALc+LU3FJrcM/f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b27cceaf-49be-4148-da47-08d94be3d365
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 01:06:52.7117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP+K3sApl6bhFORylmAciomHWuT6Nti0+IDURGTUbh+dpmnfJSDwzFVguBn85YNS+Tta0ah8XX0FkeClfIa1+h6T+Rty0Pj6oTN8i2764i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5571
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/10/2021 11:29 AM, Michal Wajdeczko wrote:
> 
> 
> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
>> Tests that exercise the slpc get/set frequency interfaces.
>>
>> Clamp_max will set max frequency to multiple levels and check
>> that slpc requests frequency lower than or equal to it.
>>
>> Clamp_min will set min frequency to different levels and check
>> if slpc requests are higher or equal to those levels.
> 
> 2x s/slpc/SLPC

Done.

> 
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c           |   1 +
>>   drivers/gpu/drm/i915/gt/selftest_slpc.c       | 333 ++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/selftest_slpc.h       |  12 +
>>   .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>>   4 files changed, 347 insertions(+)
>>   create mode 100644 drivers/gpu/drm/i915/gt/selftest_slpc.c
>>   create mode 100644 drivers/gpu/drm/i915/gt/selftest_slpc.h
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index 88ffc5d90730..16ac2e840881 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -2288,4 +2288,5 @@ EXPORT_SYMBOL_GPL(i915_gpu_turbo_disable);
>>   
>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>   #include "selftest_rps.c"
>> +#include "selftest_slpc.c"
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> new file mode 100644
>> index 000000000000..f440c1cb2afa
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> @@ -0,0 +1,333 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2020 Intel Corporation
> 
> 2021

Done.

> 
>> + */
>> +#include "selftest_slpc.h"
>> +#include "selftest_rps.h"
>> +
>> +#include <linux/pm_qos.h>
>> +#include <linux/sort.h>
> 
> system headers should go first

Cleaned up and removed the unwanted headers.

> 
>> +
>> +#include "intel_engine_heartbeat.h"
>> +#include "intel_engine_pm.h"
>> +#include "intel_gpu_commands.h"
>> +#include "intel_gt_clock_utils.h"
>> +#include "intel_gt_pm.h"
>> +#include "intel_rc6.h"
>> +#include "selftest_engine_heartbeat.h"
>> +#include "intel_rps.h"
>> +#include "selftests/igt_flush_test.h"
>> +#include "selftests/igt_spinner.h"
> 
> wrong order ?

Removed all includes, since these are already included in 
selftest_rps.c. This gets included in intel_rps.c while compiling the 
slpc selftest.

> 
>> +
>> +#define NUM_STEPS 5
>> +#define H2G_DELAY 50000
>> +#define delay_for_h2g() usleep_range(H2G_DELAY, H2G_DELAY + 10000)
>> +
>> +static int set_min_freq(struct intel_guc_slpc *slpc, int freq)
>> +{
>> +	int ret;
> 
> add empty line

done.

> 
>> +	ret = intel_guc_slpc_set_min_freq(slpc, freq);
>> +	if (ret) {
>> +		pr_err("Could not set min frequency to [%d]\n", freq);
>> +		return ret;
>> +	} else {
>> +		/* Delay to ensure h2g completes */
>> +		delay_for_h2g();
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int set_max_freq(struct intel_guc_slpc *slpc, int freq)
>> +{
>> +	int ret;
> 
> add empty line

done.

> 
>> +	ret = intel_guc_slpc_set_max_freq(slpc, freq);
>> +	if (ret) {
>> +		pr_err("Could not set maximum frequency [%d]\n",
>> +			freq);
>> +		return ret;
>> +	} else {
>> +		/* Delay to ensure h2g completes */
>> +		delay_for_h2g();
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +int live_slpc_clamp_min(void *arg)
>> +{
>> +	struct drm_i915_private *i915 = arg;
>> +	struct intel_gt *gt = &i915->gt;
>> +	struct intel_guc_slpc *slpc;
>> +	struct intel_rps *rps;
>> +	struct intel_engine_cs *engine;
>> +	enum intel_engine_id id;
>> +	struct igt_spinner spin;
>> +	int err = 0;
> 
> usually "err" is last decl

ok.

> 
>> +	u32 slpc_min_freq, slpc_max_freq;
>> +
>> +
> 
> too many empty lines

removed.

> 
>> +	slpc = &gt->uc.guc.slpc;
>> +	rps = &gt->rps;
> 
> could be initialized in decl above

ok.

> 
>> +
>> +	if (!intel_uc_uses_guc_slpc(&gt->uc))
>> +		return 0;
>> +
>> +	if (igt_spinner_init(&spin, gt))
>> +		return -ENOMEM;
>> +
>> +	if (intel_guc_slpc_get_max_freq(slpc, &slpc_max_freq)) {
>> +		pr_err("Could not get SLPC max freq");
>> +		return -EIO;
>> +	}
>> +
>> +	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq)) {
>> +		pr_err("Could not get SLPC min freq");
>> +		return -EIO;
>> +	}
>> +
>> +	if (slpc_min_freq == slpc_max_freq) {
>> +		pr_err("Min/Max are fused to the same value");
>> +		return -EINVAL;
>> +	}
> 
> 3x missing \n

done.

> 
>> +
>> +	intel_gt_pm_wait_for_idle(gt);
>> +	intel_gt_pm_get(gt);
>> +	for_each_engine(engine, gt, id) {
>> +		struct i915_request *rq;
>> +		u32 step, min_freq, req_freq;
>> +		u32 act_freq, max_act_freq;
>> +
>> +		if (!intel_engine_can_store_dword(engine))
>> +			continue;
>> +
>> +		/* Go from min to max in 5 steps */
>> +		step = (slpc_max_freq - slpc_min_freq)/NUM_STEPS;
> 
> add spaces ") / NUM"

ok.

> 
>> +		max_act_freq = slpc_min_freq;
>> +		for (min_freq = slpc_min_freq; min_freq < slpc_max_freq; min_freq+=step)
> 
> add spaces " += "

ok.

> 
>> +		{
>> +			err = set_min_freq(slpc, min_freq);
>> +			if (err)
>> +				break;
>> +
>> +			st_engine_heartbeat_disable(engine);
>> +
>> +
> 
> keep only one empty line

ok.

> 
>> +			rq = igt_spinner_create_request(&spin,
>> +					engine->kernel_context,
>> +					MI_NOOP);
>> +			if (IS_ERR(rq)) {
>> +				err = PTR_ERR(rq);
>> +				st_engine_heartbeat_enable(engine);
>> +				break;
>> +			}
>> +
>> +			i915_request_add(rq);
>> +
>> +			if (!igt_wait_for_spinner(&spin, rq)) {
>> +				pr_err("%s: Spinner did not start\n",
>> +					engine->name);
>> +				igt_spinner_end(&spin);
>> +				st_engine_heartbeat_enable(engine);
>> +				intel_gt_set_wedged(engine->gt);
>> +				err = -EIO;
>> +				break;
>> +			}
>> +
>> +			/* Wait for GuC to detect business and raise
>> +			 * requested frequency if necessary */
>> +			delay_for_h2g();
>> +
>> +			req_freq = intel_rps_read_punit_req_frequency(rps);
>> +
>> +			/* GuC requests freq in multiples of 50/3 MHz */
>> +			if (req_freq < (min_freq - 50/3)) {
>> +				pr_err("SWReq is %d, should be at least %d", req_freq,
>> +					min_freq - 50/3);
>> +				igt_spinner_end(&spin);
>> +				st_engine_heartbeat_enable(engine);
>> +				err = -EINVAL;
>> +				break;
>> +			}
>> +
>> +			act_freq =  intel_rps_read_actual_frequency(rps);
>> +			if (act_freq > max_act_freq)
>> +				max_act_freq = act_freq;
>> +
>> +			igt_spinner_end(&spin);
>> +			st_engine_heartbeat_enable(engine);
>> +		}
>> +
>> +		pr_info("Max actual frequency for %s was %d",
>> +				engine->name, max_act_freq);
>> +
>> +		/* Actual frequency should rise above min */
>> +		if (max_act_freq == slpc_min_freq) {
>> +			pr_err("Actual freq did not rise above min");
>> +			err = -EINVAL;
>> +		}
> 
> 2x missing \n
> 
> and few more below

added.

> 
>> +
>> +		if (err)
>> +			break;
>> +	}
>> +
>> +	/* Restore min/max frequencies */
>> +	set_max_freq(slpc, slpc_max_freq);
>> +	set_min_freq(slpc, slpc_min_freq);
>> +
>> +	if (igt_flush_test(gt->i915))
>> +		err = -EIO;
>> +
>> +	intel_gt_pm_put(gt);
>> +	igt_spinner_fini(&spin);
>> +	intel_gt_pm_wait_for_idle(gt);
>> +
>> +	return err;
>> +}
>> +
>> +int live_slpc_clamp_max(void *arg)
>> +{
>> +	struct drm_i915_private *i915 = arg;
>> +	struct intel_gt *gt = &i915->gt;
>> +	struct intel_guc_slpc *slpc;
>> +	struct intel_rps *rps;
>> +	struct intel_engine_cs *engine;
>> +	enum intel_engine_id id;
>> +	struct igt_spinner spin;
>> +	int err = 0;
>> +	u32 slpc_min_freq, slpc_max_freq;
>> +
>> +	slpc = &gt->uc.guc.slpc;
>> +	rps = &gt->rps;
>> +
>> +	if (!intel_uc_uses_guc_slpc(&gt->uc))
>> +		return 0;
>> +
>> +	if (igt_spinner_init(&spin, gt))
>> +		return -ENOMEM;
>> +
>> +	if (intel_guc_slpc_get_max_freq(slpc, &slpc_max_freq)) {
>> +		pr_err("Could not get SLPC max freq");
>> +		return -EIO;
>> +	}
>> +
>> +	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq)) {
>> +		pr_err("Could not get SLPC min freq");
>> +		return -EIO;
>> +	}
>> +
>> +	if (slpc_min_freq == slpc_max_freq) {
>> +		pr_err("Min/Max are fused to the same value");
>> +		return -EINVAL;
>> +	}
>> +
>> +	intel_gt_pm_wait_for_idle(gt);
>> +	intel_gt_pm_get(gt);
>> +	for_each_engine(engine, gt, id) {
>> +		struct i915_request *rq;
>> +		u32 max_freq, req_freq;
>> +		u32 act_freq, max_act_freq;
>> +		u32 step;
>> +
>> +		if (!intel_engine_can_store_dword(engine))
>> +			continue;
>> +
>> +		/* Go from max to min in 5 steps */
>> +		step = (slpc_max_freq - slpc_min_freq)/NUM_STEPS;
>> +		max_act_freq = slpc_min_freq;
>> +		for (max_freq = slpc_max_freq; max_freq > slpc_min_freq; max_freq-=step)
>> +		{
>> +			err = set_max_freq(slpc, max_freq);
>> +			if (err)
>> +				break;
>> +
>> +			st_engine_heartbeat_disable(engine);
>> +
>> +			rq = igt_spinner_create_request(&spin,
>> +						engine->kernel_context,
>> +						MI_NOOP);
>> +			if (IS_ERR(rq)) {
>> +				st_engine_heartbeat_enable(engine);
>> +				err = PTR_ERR(rq);
>> +				break;
>> +			}
>> +
>> +			i915_request_add(rq);
>> +
>> +			if (!igt_wait_for_spinner(&spin, rq)) {
>> +				pr_err("%s: SLPC spinner did not start\n",
>> +				       engine->name);
>> +				igt_spinner_end(&spin);
>> +				st_engine_heartbeat_enable(engine);
>> +				intel_gt_set_wedged(engine->gt);
>> +				err = -EIO;
>> +				break;
>> +			}
>> +
>> +			delay_for_h2g();
>> +
>> +			/* Verify that SWREQ indeed was set to specific value */
>> +			req_freq = intel_rps_read_punit_req_frequency(rps);
>> +
>> +			/* GuC requests freq in multiples of 50/3 MHz */
>> +			if (req_freq > (max_freq + 50/3)) {
>> +				pr_err("SWReq is %d, should be at most %d", req_freq,
>> +					max_freq + 50/3);
>> +				igt_spinner_end(&spin);
>> +				st_engine_heartbeat_enable(engine);
>> +				err = -EINVAL;
>> +				break;
>> +			}
>> +
>> +			act_freq =  intel_rps_read_actual_frequency(rps);
>> +			if (act_freq > max_act_freq)
>> +				max_act_freq = act_freq;
>> +
>> +			st_engine_heartbeat_enable(engine);
>> +			igt_spinner_end(&spin);
>> +
>> +			if (err)
>> +				break;
>> +		}
>> +
>> +		pr_info("Max actual frequency for %s was %d",
>> +				engine->name, max_act_freq);
>> +
>> +		/* Actual frequency should rise above min */
>> +		if (max_act_freq == slpc_min_freq) {
>> +			pr_err("Actual freq did not rise above min");
>> +			err = -EINVAL;
>> +		}
>> +
>> +		if (igt_flush_test(gt->i915)) {
>> +			err = -EIO;
>> +			break;
>> +		}
>> +
>> +		if (err)
>> +			break;
>> +	}
>> +
>> +	/* Restore min/max freq */
>> +	set_max_freq(slpc, slpc_max_freq);
>> +	set_min_freq(slpc, slpc_min_freq);
>> +
>> +	intel_gt_pm_put(gt);
>> +	igt_spinner_fini(&spin);
>> +	intel_gt_pm_wait_for_idle(gt);
>> +
>> +	return err;
>> +}
>> +
>> +int intel_slpc_live_selftests(struct drm_i915_private *i915)
>> +{
>> +	static const struct i915_subtest tests[] = {
>> +		SUBTEST(live_slpc_clamp_max),
>> +		SUBTEST(live_slpc_clamp_min),
>> +	};
>> +
>> +	if (intel_gt_is_wedged(&i915->gt))
>> +		return 0;
>> +
>> +	return i915_live_subtests(tests, i915);
>> +}
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.h b/drivers/gpu/drm/i915/gt/selftest_slpc.h
>> new file mode 100644
>> index 000000000000..8dfb40916a8c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2020 Intel Corporation
> 
> 2021

done.
Thanks,
Vinay.
> 
> Michal
> 
>> + */
>> +
>> +#ifndef SELFTEST_SLPC_H
>> +#define SELFTEST_SLPC_H
>> +
>> +int live_slpc_clamp_max(void *arg);
>> +int live_slpc_clamp_min(void *arg);
>> +
>> +#endif /* SELFTEST_SLPC_H */
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
>> index e2fd1b61af71..1746a56dda06 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
>> +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
>> @@ -47,5 +47,6 @@ selftest(hangcheck, intel_hangcheck_live_selftests)
>>   selftest(execlists, intel_execlists_live_selftests)
>>   selftest(ring_submission, intel_ring_submission_live_selftests)
>>   selftest(perf, i915_perf_live_selftests)
>> +selftest(slpc, intel_slpc_live_selftests)
>>   /* Here be dragons: keep last to run last! */
>>   selftest(late_gt_pm, intel_gt_pm_late_selftests)
>>
