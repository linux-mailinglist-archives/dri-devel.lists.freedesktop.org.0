Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83CF3DB08A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 03:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF9D6EEA3;
	Fri, 30 Jul 2021 01:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C11B6EEA3;
 Fri, 30 Jul 2021 01:12:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="276784605"
X-IronPort-AV: E=Sophos;i="5.84,280,1620716400"; d="scan'208";a="276784605"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 18:12:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,280,1620716400"; d="scan'208";a="465278033"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 29 Jul 2021 18:12:33 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 18:12:32 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 18:12:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 29 Jul 2021 18:12:32 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 29 Jul 2021 18:12:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Loh4G4xoUP7H2gIZ4+ixSJK8Itg/Ow3OYbh++d41IIGRswQmz7NHMQX1l6lPui1UBIe1NbeP87Fu/etLoKqKPznLu/AahW/ESNqvSBxysnzOxz9G8+Jj4VUTV3Cq0ogkk9zZNMpFrKQDyNjkamDQtnJS4ARrjaozk7K1a9C/zhmJE+WJEZ2ukDa1IxPcearqvfTk81tTtU0RCevuE/Apg+dDXkVe+xuo8kOTmpKYiL7keKn6mY+usvSq+xG0gwtr3oniLQyuRZQdnvFHAjyAgndOTXV8yCLiL5yQXpsE8knlfGgMow7ygJJFeQhxafGoc3FyzUS8iJ+sl7cYjNk4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0VW4nZsQIv0ZLHtRwWqBPUwyplmD+3r6YCtLhQKXgs=;
 b=ZnaO63rd5e99bF8JCPwytpdiapfL4yNrh36bRsdrderwjTxzmZKwkblpaIFu6FPC4eSxsRPVEySdApmH3h5/hSemIyWCLmHKKwUHOlg/0hYyH4ZtSZJXfDWJdW0CRnTDxNcwiuIhcl3E67MFxlRsi5J9zJj5PW8jv7Wr1OSRlgGyTsFuM9yshCvKzO0KI9yyPpamsn4irvO19wLTxel1veAHtIeVAFtvCfk//znpmbXP7L5ljpyw4+2CsdOC6j32edLLdg/99HlVYtyRejfQBLVnJ2Cy7DszW0wumdytYFTovjo74AaAzaa3xligCu4LPBcVwaeMilmZO1AMMYM+bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0VW4nZsQIv0ZLHtRwWqBPUwyplmD+3r6YCtLhQKXgs=;
 b=YZkQtc/tf0J2AmTzmPDme2DdPISrdvOrJNAKUBHfkdlA38nEVQ5iaNX+47+eagyfXFmFtq6H4KvnaRGftp7DgwqNCiowdhKDmqrK4Q4UccPWXJfiqq4ZKUuR3/F98vNf4qikPPvISwo2hocA4qeGaBbUcCOuvSogkkzxNuSDj8U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5650.namprd11.prod.outlook.com (2603:10b6:5:35a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Fri, 30 Jul
 2021 01:12:30 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 01:12:30 +0000
Subject: Re: [Intel-gfx] [PATCH 13/14] drm/i915/guc/slpc: Add SLPC selftest
To: Matthew Brost <matthew.brost@intel.com>
References: <20210728211144.15322-1-vinay.belgaumkar@intel.com>
 <20210728211144.15322-14-vinay.belgaumkar@intel.com>
 <20210729234051.GA58031@DUT151-ICLU.fm.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <b9d90524-5d45-1a76-8e9a-31d60ee764cb@intel.com>
Date: Thu, 29 Jul 2021 18:12:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210729234051.GA58031@DUT151-ICLU.fm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0031.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::44) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BYAPR07CA0031.namprd07.prod.outlook.com (2603:10b6:a02:bc::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Fri, 30 Jul 2021 01:12:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63d583d6-4f27-4c3f-8702-08d952f71a55
X-MS-TrafficTypeDiagnostic: CO6PR11MB5650:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB565013D62BC2CE2497DAC78585EC9@CO6PR11MB5650.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q4CDcWtR4W2wh6fK74cuKOGtmhY8fBe+Y8aa7vFWbDiDh1XhtBJ5rCf0kd6JapKEHLJdQz4IS7ZCvkpp+20QzJSwJk8tiy780cyMs9jXgsY73bPqiGJIp62YepPH8GOW5U9AItqXgJyIhAlDnHSxPt/HFxbcOoSQfrf50Kj8rzenGc+nDwv7KeijaiHs7cqs96rwzZij9FyqZpRo7z2nSW2sFJdBZ5boMyEOyqw6g/fsSkBE/WWybRG8BiGypORsfi4VSbWvfBkLZLr7y9Ct/f2SHbvaTCLHmvD+ls8ManD7XyIKyFkp5z0fTSU928EGScDEYoLVPOF73Ab8LEcYY4ZyIGmPw/WI+eu50OjU7u2Jknt/evqIpHrPnPfZHIndcawrb1vEYqSY2MISAwmRlkG3FGMRdmTQWGLwlapJvFj2twF056Xk+cJS/Gu8byG1zWLK/1TKuTgdvoswyBjNO5foEjfCz5pVsd+XHdOjVauORGlwDm9+kvv4LThXWxlSAPna1K/i5hqy2wvLMhEhIShOk5314LkKjp+2VporPFJlVxwUzJ638xCxnAVRmi2EoYqpjjnUxJEKjdQMOgazyyieZkSHnT1gRocLB4fswmVPMF4TGHEAMjk1Lxq246c1Djj2lk5u7KAZgf2/E9kGAHS0rrev7x+0oeA3m5TUUUjpI/5zn89dC8OTLPJttAlGF1OpsMXAwi3oOUjqmpu3YACOnCeuvVlB3s5gwIW4dp1wNQReaxEDDk51wjvfrys2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(66946007)(450100002)(30864003)(66476007)(26005)(66556008)(31696002)(5660300002)(31686004)(6862004)(316002)(53546011)(37006003)(6486002)(186003)(36756003)(4326008)(38100700002)(8676002)(83380400001)(86362001)(2906002)(956004)(966005)(2616005)(8936002)(478600001)(16576012)(6636002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHlRa3hPVWEyUS9KRWhXVEZKY01NQ1hoUHMrT0w1OUo1dmtZZ3RoOGV2QmZ0?=
 =?utf-8?B?N1pTeTJDZ2lGZHlXNENxMFdvOWZVOWF5N3lLSG02NXBWV0tMakovbEhOSUZm?=
 =?utf-8?B?STFlSms0NmtvMUxqa2hHS09BRWxGVjg4MEx4aGdic0g0c0FsQU9ETWp5dS9v?=
 =?utf-8?B?RDcwK05yOTgwUFRTMkYyV3lwOWM2T25ZT0d1NExMbjF4S0tabFVFZXR3ZEZE?=
 =?utf-8?B?WG1hdEJWSGJsSHJBQlhRMndCRjVlM3JTZjRGd2N0SHBBekw4NjVrQkk5dWlS?=
 =?utf-8?B?VTZZaHhEUlFud2t2dmd4TEIzWHUvYTFYMU9TTHA4K2VsR2xlVHVkbng5d3Yx?=
 =?utf-8?B?RlF5TFhaOGpMT1JKazNzaS9wZFMxa09JdktkRVh1OFYzbVBBdkwzbHJaaU42?=
 =?utf-8?B?SUV0N3NhQmo1L1R0U2RlTkFTbFcvMjJRRzNWcWFGSUUycnhBbHdYTGxvS1JJ?=
 =?utf-8?B?U0hLcDJHL2R4NUpTeURxUWxiMDVHdWVzcUZ6MTdoZTFxM0FnSHp2VjFsckli?=
 =?utf-8?B?TEJRbm1DSmRBYy9qU2NGN0V1QUllckwyUkE4Q285Zm5tVTEvaXQ2amdwMm1O?=
 =?utf-8?B?SjFVdzJpVStSOWc0MW82R1FmRTVNbG5reWwzNG9BMlN2N3RNMGlqQ2NPOXJh?=
 =?utf-8?B?TkFxandrUGVBL0VMdHVaRDVIQ1B2ZlhEcm5BSnVwcklYenduNGFRdGNMcXRm?=
 =?utf-8?B?TTFnSTZMQXowazRZL3pPbU5EdGt4aGJRMTloMGdaRWFPODBjckQ2MGhEWWgz?=
 =?utf-8?B?alZmRUYyc21Lbk0xSXdabzFRUUdIVXJuK25qR1dIRWIyQzZOQ3YwbWp3SGFl?=
 =?utf-8?B?L3A2R2RybXh5ZTk2UWl0TVorTHdLY21SaUFYVWNvVUxlYWN0ZXkzUE5zR0lR?=
 =?utf-8?B?TXFpWng3S3h0UmpTOVhYaGdrSkJjSkpDY0lRRERoNmJDd0NNeVdWQjhXdFNi?=
 =?utf-8?B?WGZqQjE3UVNwQUIyTXRyKzZKd25RZUkwbENLQi9DMDNkSlpqYWR0M3FVekNG?=
 =?utf-8?B?QUpaTXNGelRJUjk5UDFZMnZRM1JNUkVESzhqcW1jL1E1MThCMkRObmxIdkV5?=
 =?utf-8?B?Q3JzNlJnbitDZkhOSy9yM1ZSWjh2OUN1THluc2JIWkRIZVBCZGJ0K2NiV2pC?=
 =?utf-8?B?QnhZNFJ2Y2t1S2tUdmh2eWszZXBkSVVVakIxL3VDblNoeHRlSkwwTlZmakYv?=
 =?utf-8?B?MkJ3MTdHcm1YWXV2RTR2eEEwTEFoVFdyUFZyY2V1YjNldGtueElwdGlrcEI3?=
 =?utf-8?B?UStYb3l6eHVZejlOMDFLM0lTRkZORTJzaG1BdFBqbW1lL2sySmRHMUFSUVpY?=
 =?utf-8?B?T0N1ak1mcGlTb0RObVBwVEY0NGpKR09JUjh6VWprMjBJWTZHejhNbVQvWlB5?=
 =?utf-8?B?M0ErQlQveWdzc29BNm9UaUMxRTQrNTJDSXBJTTZtWDZXNURHc2oxYkVqRFdV?=
 =?utf-8?B?Y0NwckVITDAxeVFCVmZzNFllTDNSZEFYOXdxTjVDWEZRRGtGWE1NWFk0Z0FJ?=
 =?utf-8?B?RkNNM25qYmNLaTJBbjZ6a29Jb1FiaUorQUhtYyswNUJFVUZJSyt2ZjYzN2c5?=
 =?utf-8?B?TEcxd2lHbS85YVNidThXZkRoUWQ5ZkVQUlFkelpSa2JDSGJoM2FYWC83QnRr?=
 =?utf-8?B?MjRkV3g1dFhkYkM5bVlXM3NWelNwMkwzdzB6ZE5UTkpWUHZHcmQ1dTNGTFFK?=
 =?utf-8?B?MFlESEl1VjR3Mkk3blNUbDdRMlRhRWdpMkJJTW44TlhTbG84MWJrelp4aE83?=
 =?utf-8?Q?lkBXE01lonCV+CEghrMik3/4k3s+Hrchom+ipA+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d583d6-4f27-4c3f-8702-08d952f71a55
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 01:12:30.3570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmbkNhg/+nq2s6lJIcyDLcn/MiFCVwWhlDKjTNuPTqLGZwHzyAmvVU18S4NXjJPolYXFiJJtb2VjA6HJIli0YMOtFr3Ftj2aqgEZFRz1Vxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5650
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/29/2021 4:40 PM, Matthew Brost wrote:
> On Wed, Jul 28, 2021 at 02:11:43PM -0700, Vinay Belgaumkar wrote:
>> Tests that exercise the SLPC get/set frequency interfaces.
>>
>> Clamp_max will set max frequency to multiple levels and check
>> that SLPC requests frequency lower than or equal to it.
>>
>> Clamp_min will set min frequency to different levels and check
>> if SLPC requests are higher or equal to those levels.
>>
>> v2: Address review comments (Michal W)
>> v3: Checkpatch() corrections
>> v4: Remove unnecessary header file (Matthew Brost)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> Overall looks but need to address the checkpatch warnings, have question
> / nit below.
> 
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c           |   1 +
>>   drivers/gpu/drm/i915/gt/selftest_slpc.c       | 309 ++++++++++++++++++
>>   .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>>   3 files changed, 311 insertions(+)
>>   create mode 100644 drivers/gpu/drm/i915/gt/selftest_slpc.c
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index 49db8ed9f80d..7a2aa0031cf6 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -2330,4 +2330,5 @@ EXPORT_SYMBOL_GPL(i915_gpu_turbo_disable);
>>   
>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>   #include "selftest_rps.c"
>> +#include "selftest_slpc.c"
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> new file mode 100644
>> index 000000000000..119d012d1e1e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> @@ -0,0 +1,309 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#define NUM_STEPS 5
>> +#define H2G_DELAY 50000
>> +#define delay_for_h2g() usleep_range(H2G_DELAY, H2G_DELAY + 10000)
>> +
>> +static int slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>> +{
>> +	int ret;
>> +
>> +	ret = intel_guc_slpc_set_min_freq(slpc, freq);
>> +	if (ret)
>> +		pr_err("Could not set min frequency to [%u]\n", freq);
>> +	else /* Delay to ensure h2g completes */
>> +		delay_for_h2g();
>> +
>> +	return ret;
>> +}
>> +
>> +static int slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 freq)
>> +{
>> +	int ret;
>> +
>> +	ret = intel_guc_slpc_set_max_freq(slpc, freq);
>> +	if (ret)
>> +		pr_err("Could not set maximum frequency [%u]\n",
>> +			freq);
>> +	else /* Delay to ensure h2g completes */
>> +		delay_for_h2g();
>> +
>> +	return ret;
>> +}
>> +
>> +int live_slpc_clamp_min(void *arg)
>> +{
>> +	struct drm_i915_private *i915 = arg;
>> +	struct intel_gt *gt = &i915->gt;
>> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
>> +	struct intel_rps *rps = &gt->rps;
>> +	struct intel_engine_cs *engine;
>> +	enum intel_engine_id id;
>> +	struct igt_spinner spin;
>> +	u32 slpc_min_freq, slpc_max_freq;
>> +	int err = 0;
>> +
>> +	if (!intel_uc_uses_guc_slpc(&gt->uc))
>> +		return 0;
>> +
>> +	if (igt_spinner_init(&spin, gt))
>> +		return -ENOMEM;
>> +
>> +	if (intel_guc_slpc_get_max_freq(slpc, &slpc_max_freq)) {
>> +		pr_err("Could not get SLPC max freq\n");
>> +		return -EIO;
>> +	}
>> +
>> +	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq)) {
>> +		pr_err("Could not get SLPC min freq\n");
>> +		return -EIO;
>> +	}
>> +
>> +	if (slpc_min_freq == slpc_max_freq) {
>> +		pr_err("Min/Max are fused to the same value\n");
>> +		return -EINVAL;
>> +	}
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
>> +		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
>> +		max_act_freq = slpc_min_freq;
>> +		for (min_freq = slpc_min_freq; min_freq < slpc_max_freq;
>> +					min_freq += step) {
>> +			err = slpc_set_min_freq(slpc, min_freq);
>> +			if (err)
>> +				break;
>> +
>> +			st_engine_heartbeat_disable(engine);
>> +
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
>> +			 * requested frequency if necessary.
>> +			 */
>> +			delay_for_h2g();
>> +
>> +			req_freq = intel_rps_read_punit_req_frequency(rps);
>> +
>> +			/* GuC requests freq in multiples of 50/3 MHz */
> 
> Where is this magic value (50/3) derived from? Is it subject to change
> on future platforms / GuC firmwares?
> 
> Regardless of the answers above, use a define for this too.

Sure. It's defined in i915_reg.h, will use that. It has remained this
way since Gen9+.

Thanks,
Vinay.
> 
> Matt
> 
>> +			if (req_freq < (min_freq - 50/3)) {
>> +				pr_err("SWReq is %d, should be at least %d\n", req_freq,
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
>> +		pr_info("Max actual frequency for %s was %d\n",
>> +				engine->name, max_act_freq);
>> +
>> +		/* Actual frequency should rise above min */
>> +		if (max_act_freq == slpc_min_freq) {
>> +			pr_err("Actual freq did not rise above min\n");
>> +			err = -EINVAL;
>> +		}
>> +
>> +		if (err)
>> +			break;
>> +	}
>> +
>> +	/* Restore min/max frequencies */
>> +	slpc_set_max_freq(slpc, slpc_max_freq);
>> +	slpc_set_min_freq(slpc, slpc_min_freq);
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
>> +		pr_err("Could not get SLPC max freq\n");
>> +		return -EIO;
>> +	}
>> +
>> +	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq)) {
>> +		pr_err("Could not get SLPC min freq\n");
>> +		return -EIO;
>> +	}
>> +
>> +	if (slpc_min_freq == slpc_max_freq) {
>> +		pr_err("Min/Max are fused to the same value\n");
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
>> +		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
>> +		max_act_freq = slpc_min_freq;
>> +		for (max_freq = slpc_max_freq; max_freq > slpc_min_freq;
>> +					max_freq -= step) {
>> +			err = slpc_set_max_freq(slpc, max_freq);
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
>> +				pr_err("SWReq is %d, should be at most %d\n", req_freq,
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
>> +		pr_info("Max actual frequency for %s was %d\n",
>> +				engine->name, max_act_freq);
>> +
>> +		/* Actual frequency should rise above min */
>> +		if (max_act_freq == slpc_min_freq) {
>> +			pr_err("Actual freq did not rise above min\n");
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
>> +	slpc_set_max_freq(slpc, slpc_max_freq);
>> +	slpc_set_min_freq(slpc, slpc_min_freq);
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
>> -- 
>> 2.25.0
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
