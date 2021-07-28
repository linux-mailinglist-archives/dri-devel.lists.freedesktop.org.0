Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE0D3D91E6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 17:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E8E6E185;
	Wed, 28 Jul 2021 15:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645F76E185;
 Wed, 28 Jul 2021 15:29:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="209576343"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="209576343"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 08:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="580848084"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2021 08:29:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 28 Jul 2021 08:29:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 28 Jul 2021 08:29:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 28 Jul 2021 08:29:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 28 Jul 2021 08:29:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8gunJdR3yIbk0ZRo629VzJwXtNqGBDUHrgTQnBCi06hottCdi5ID3laDegwYckOJTzY00wvXWGR2wfsoE6zZ78mJdd+vUKu1+HTHA4/yrJlbIoNE4LCw1XXAXpkmEMvs4dK/K3ZVOBZc9mdZ9s7anso8n0ge8pNSuklcSlOxV1RPx7H448PFxniLSrQs5JbNbt2QEJZYkMS0jeX6vqfDUjd54QuO0mEJ7vBP7nMBg3MwiaUyCM4ctILECVcJcuDCGPAVUL2FgW4gZ7gugSf7tPb1kwBtaR6W+1W58RM3SD/mm6Wm6mUny0VY9tkUjYDMmwTx1HRHC8bqz3Ec6YVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IepjtHdKgwOqX2B9P/1teYg+ssoLssxJmjGldNS/F4Y=;
 b=dC6dDReBFMGtQD772894oCukqxJnXw9CnDHW2AUzlo1askjvv2/RlZ2YBi/8VgC3QQQ/dJ5fvbEH88cTRhO3QhjAr1gGcdZVHgRq/G+YKvPcJMY9Jke93dqd4eWvUkkkuriLGQaQJes0IiuUOHuId3SE/bCrZzbCPV753tU8mHeSIcw+Z7uY2U95pDG5J1HlffZc/tmOnqIBMlp5uv+eSa3Ds47Ym9+y8jLF9TaNBX8jTtgdqut4NCGz20XyDOkky37+nNs9sVMjcxJC4dE5hiJiJr2IleCrPHpVQNCinde6UOfv1w8qZeI8ZXKQNKcYVIoScM/zPFXs84QtlEqF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IepjtHdKgwOqX2B9P/1teYg+ssoLssxJmjGldNS/F4Y=;
 b=cGmhInjkkftqdFZ9jgV1KfgAy5e6AD3nhUaa10e4lQFuFUQBADuG/MdQKlrsfPL+DXMdOCyREaIyHMl7T6VlQOVRBsqVt8v8kz8JzclIb/U+he06hJg8UrA6BVwacVMxOjcICgk0MB5urhLTaEIIICl0XKS80dIIUIlbqDDMXpA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5668.namprd11.prod.outlook.com (2603:10b6:5:355::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 15:29:20 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4373.019; Wed, 28 Jul 2021
 15:29:20 +0000
Subject: Re: [PATCH 13/15] drm/i915/guc/slpc: Sysfs hooks for SLPC
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-14-vinay.belgaumkar@intel.com>
 <e8d838e6-9d90-0099-8fe3-666875af21ce@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <66681a07-bf24-614e-94eb-d0103ecf4f29@intel.com>
Date: Wed, 28 Jul 2021 08:29:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <e8d838e6-9d90-0099-8fe3-666875af21ce@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0057.namprd08.prod.outlook.com
 (2603:10b6:a03:117::34) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BYAPR08CA0057.namprd08.prod.outlook.com (2603:10b6:a03:117::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19 via Frontend
 Transport; Wed, 28 Jul 2021 15:29:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63a39aec-de19-43e1-cdbd-08d951dc781b
X-MS-TrafficTypeDiagnostic: CO6PR11MB5668:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB56684C205656784027C9C90E85EA9@CO6PR11MB5668.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OiiqQjiYW+TcxcPW6pRLM1ryVmhIbcNRAPJ1MFcLc9ICjG57AZ2HDpw3/04zlO4RmeDq550GYgwPsQ/EivhDReSotI6nVRIqZ/1O9hh6KbqZO1qnC2RnxT1J0PBQ3mi0n6XQTr0pNq5JQ2aIti9CpwVd1gIMgNPS/wob4H/ZmrHrPJWCfWH3aMTzwT8posX2exLzdA9en1IFsC3A8wAS6emLvg5RsAGcPZ3OT6ai9oBHjh2loNtFhvBnS9IATJvZOkktEZ+RX/J68C0XyF6HsFnQUyz8SzL03hFrpfzTtukvF4HexhkqVeqUGiG4oQC3wESgUazmqTLCEhTrfQe4whxQHG6lGwmxt0MguTByn7jvFj417ZBh+B8dpuWZXNmSFFaALIdWykuS8/6QhRgBECjVSmdw0w5nKHQo2W+i2meIAkadpH3xG95ZXOyhDsXNJhpp8TYAWFoTT/Tqjtot+Pu3rDDjZKc1D+Xv8fl7d0HOnCiR9Km4g2lhq1ehbJXY9EdZn9bXZazRWnHjNy27wCBIBhdp86PW+Wb/aXlUc/XLO/gvSar8HNV97NZBq8+whyIxXbvL97/b/4/5eRT5/8ugWDTDMGA635bUcQxLLnyRuqyGgRx367y294OJO3ONxXiM2AZItYJCYita5XlEqxKHFzMytL0TiZiaWwWa3BGwUcUPJOR0mElcadlipWI1AfUBNPEjtynUq/Sc/W9KsiEEoS3dXmuBCpvW2oYWQCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(38100700002)(66556008)(956004)(30864003)(54906003)(83380400001)(316002)(66946007)(6666004)(31696002)(478600001)(4326008)(2616005)(6486002)(26005)(8936002)(5660300002)(53546011)(2906002)(8676002)(16576012)(36756003)(31686004)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWtCMG9oYjVnVTRjaUdIcFY2NlMrZi9yRUpkSjZ4WXh3NEpxa1VOSk5OMU5k?=
 =?utf-8?B?NXloLzhqYUhMT05VMHp6aEQyUllhSnRaNUVxYzdTZXBSUWdmTXl1bGpvbVov?=
 =?utf-8?B?eWM2elNGa3pHdVFjRzI5S0NiVVFrVlNlL3JFY0lnU0Iyc2hzWnhuUnZGTW1P?=
 =?utf-8?B?THZMTHlWbEJTcUIzZDg2UzgvbnJRRVhTU01jVGpxRTZlK2ZWU0hyUXE0VTky?=
 =?utf-8?B?VXMrc21iSGlWdkVxTFJhUlRrQmgyempsZjBrN3JpWkFra2Q3cERwZFVaMHBM?=
 =?utf-8?B?d3NzdHdIRjA0SWg1b3dxMW5KUWx6WDhrTFI4bmF4TU14R2FXS0taZFdFOXB3?=
 =?utf-8?B?dy9DUkpSQm5rYXRYK1BpNXhnVklMQTA3dkRqdGJTSWJmeUl3dVFxQjE1bEYr?=
 =?utf-8?B?anRjYTRaK3NFS3k4QWozYjBIT2ZxZEZuUWZUdEdPaFdKVHQ0Zk5uNVNuZThF?=
 =?utf-8?B?RzFDT214dzdKVk1yODFPNWk4cEVqaXlhUm9OcDF3S0dOSnVZS1BnTXBsVlV2?=
 =?utf-8?B?OWhZZmpjUUVwVm5GTE1DMjRQL3R6UWU2Zkk0RFZCMURCcitCRE9TdnJkd3Uv?=
 =?utf-8?B?UDFTSjR5K2dCaU1iS05DeUdaU3o2QlNjbFpMWjBudWVBWTRxaU5XaVZqa21h?=
 =?utf-8?B?Mk1XcXF1REx1bWIyZDRJRS80NXIxbTNKQmtHRE1UbUY2VDF6YXNZVmduNDg4?=
 =?utf-8?B?c2Z5V0g5NTFmUDRYYmJDRmFkcXZDZW41cE1OSXdXSHZGRmh1UmFDYkJUT0U1?=
 =?utf-8?B?eFM5UStNTm9zMnJudEhKdFBTY0JGTk5rMDdKaStzSmRlbnVWRm1GSEdzMFdX?=
 =?utf-8?B?NExxM2dVekVmWGZJYTZBQUpRa0pkM1JNcC9vT1MvQmdQVjFjOU1jUTJ6aSto?=
 =?utf-8?B?VEdtazV1NmVxR3RiY25QOUp4dEhNU2dLQklUZmdOa2JneUtOYi9TV05ua1dr?=
 =?utf-8?B?N1pQSWhzN2dLaU1zL3V1Tmd2bGo2c3NOcmdPVEhTMkdvcXN1UFd1M0F1c0pp?=
 =?utf-8?B?d3Q2d3JwMnl2SzE3Y0h5NHgzM1M4SHZSaGk4WmtMTGU1L3RPNFZtZUdHNXNN?=
 =?utf-8?B?Q0ZKUEhTSmFFRDBNRFI0TDlqcXd4a3N4clloeUxwRllCYzR6ajhFR0xDSTls?=
 =?utf-8?B?NzJ4U3ptK3pvZkN5VCs0L1ZwTUZuUHFQcG5Ra0xDQWZvdXdaMUYxRjZnQVBL?=
 =?utf-8?B?MWFyd2lydytZV2JWUnJTTG83a1ZDQUw0ei9hS0IrVk5Wc1FjRWkzQTBySGc4?=
 =?utf-8?B?RUNOelMzUy9CLzEvak1WY0tvK3BtN2FtWHZHREpRSE9SeVpIaEJIOUxpNXdp?=
 =?utf-8?B?dDhhaDJMbjFrbFZJa0psb0R2YlV6ekl1Znc5dk9tMzdEenJxUVlLM0NRbDg3?=
 =?utf-8?B?RDVBR2YyVFZPcHB6TzMwSzFnQWVyRGFJcnlKcnFWZ0pvc3EycnMwQTNManpo?=
 =?utf-8?B?RjVXTzBYNCtmak5hVHhmdEIyaTFDd0JGY2JJdkFkVk80NDV4VHFrTm1UYjlD?=
 =?utf-8?B?UDB0bHppeUlVWFFRZHRXWCtCbk9LdVJqeWNHdFFqSEErVEN1OWFZZFVzUFVJ?=
 =?utf-8?B?b01nYXhPV3JqUjZUVTVzV0M0SCs2NjZFRU0vUll0a0VjNUNBMU1ScnRZMmly?=
 =?utf-8?B?Q1dqT2tLb0d4OGxMcGV4VkFZSUF3R25rUVowcHMxWXY1VUhVNVZLU0xScFl5?=
 =?utf-8?B?ODR1QmJlbnNQNDNqTlcvZk9UcFhNd1VabWhHZGMxdHIzTE03TGVETzRNcTdi?=
 =?utf-8?Q?rwj7V5RpklXJEgy8bO+4fO3ni+2BtjathPmTGCt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a39aec-de19-43e1-cdbd-08d951dc781b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 15:29:20.1509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hG4SrjhMZaP7bO9u/hafJJD/wzYTMwaHOoVZqaCoPp9pBSocqyKgjzhjWT0nEPEwkmNXIdwyzER2mJwE/7+qWXWj36HjEHsxx9mjlnqmamI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5668
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/27/2021 9:59 AM, Michal Wajdeczko wrote:
> 
> 
> On 26.07.2021 21:07, Vinay Belgaumkar wrote:
>> Update the get/set min/max freq hooks to work for
>> SLPC case as well. Consolidate helpers for requested/min/max
>> frequency get/set to intel_rps where the proper action can
>> be taken depending on whether SLPC is enabled.
>>
>> v2: Add wrappers for getting rp0/1/n frequencies, update
>> softlimits in set min/max SLPC functions. Also check for
>> boundary conditions before setting them.
>>
>> v3: Address review comments (Michal W)
>>
>> Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c         | 165 ++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_rps.h         |  11 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c |  14 ++
>>   drivers/gpu/drm/i915/i915_pmu.c             |   2 +-
>>   drivers/gpu/drm/i915/i915_reg.h             |   2 +
>>   drivers/gpu/drm/i915/i915_sysfs.c           |  77 ++-------
>>   6 files changed, 207 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index e858eeb2c59d..48d4147165a9 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -37,6 +37,13 @@ static struct intel_uncore *rps_to_uncore(struct intel_rps *rps)
>>   	return rps_to_gt(rps)->uncore;
>>   }
>>   
>> +static struct intel_guc_slpc *rps_to_slpc(struct intel_rps *rps)
>> +{
>> +	struct intel_gt *gt = rps_to_gt(rps);
>> +
>> +	return &gt->uc.guc.slpc;
>> +}
>> +
>>   static bool rps_uses_slpc(struct intel_rps *rps)
>>   {
>>   	struct intel_gt *gt = rps_to_gt(rps);
>> @@ -1960,6 +1967,164 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
>>   	return freq;
>>   }
>>   
>> +u32 intel_rps_read_punit_req(struct intel_rps *rps)
>> +{
>> +	struct intel_uncore *uncore = rps_to_uncore(rps);
>> +
>> +	return intel_uncore_read(uncore, GEN6_RPNSWREQ);
>> +}
>> +
>> +u32 intel_rps_get_req(struct intel_rps *rps, u32 pureq)
> 
> hmm, "rps" looks to be not needed here
> btw, shouldn't this function be static ?

sure.

> 
>> +{
>> +	u32 req = pureq >> GEN9_SW_REQ_UNSLICE_RATIO_SHIFT;
>> +
>> +	return req;
>> +}
>> +
>> +u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps)
>> +{
>> +	u32 freq = intel_rps_get_req(rps, intel_rps_read_punit_req(rps));
>> +
>> +	return intel_gpu_freq(rps, freq);
>> +}
>> +
>> +u32 intel_rps_get_requested_frequency(struct intel_rps *rps)
>> +{
>> +	if (rps_uses_slpc(rps))
>> +		return intel_rps_read_punit_req_frequency(rps);
>> +	else
>> +		return intel_gpu_freq(rps, rps->cur_freq);
>> +}
>> +
>> +u32 intel_rps_get_max_frequency(struct intel_rps *rps)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return slpc->max_freq_softlimit;
>> +	else
>> +		return intel_gpu_freq(rps, rps->max_freq_softlimit);
>> +}
>> +
>> +u32 intel_rps_get_rp0_frequency(struct intel_rps *rps)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return slpc->rp0_freq;
>> +	else
>> +		return intel_gpu_freq(rps, rps->rp0_freq);
>> +}
>> +
>> +u32 intel_rps_get_rp1_frequency(struct intel_rps *rps)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return slpc->rp1_freq;
>> +	else
>> +		return intel_gpu_freq(rps, rps->rp1_freq);
>> +}
>> +
>> +u32 intel_rps_get_rpn_frequency(struct intel_rps *rps)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return slpc->min_freq;
>> +	else
>> +		return intel_gpu_freq(rps, rps->min_freq);
>> +}
>> +
>> +int intel_rps_set_max_frequency(struct intel_rps *rps, u32 val)
>> +{
>> +	struct drm_i915_private *i915 = rps_to_i915(rps);
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +	int ret = 0;
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return intel_guc_slpc_set_max_freq(slpc, val);
> 
> few above functions are implemented as nice dispatcher
> 
> 	if (rps_uses_slpc(rps))
> 		return ... slpc stuff;
> 	else
> 		return ... gpu stuff;
> 
> can we have something similar here ?
> likely just putting below code into helper will do the trick

ok.

> 
>> +
>> +	mutex_lock(&rps->lock);
>> +
>> +	val = intel_freq_opcode(rps, val);
>> +	if (val < rps->min_freq ||
>> +	    val > rps->max_freq ||
>> +	    val < rps->min_freq_softlimit) {
>> +		ret = -EINVAL;
>> +		goto unlock;
>> +	}
>> +
>> +	if (val > rps->rp0_freq)
>> +		drm_dbg(&i915->drm, "User requested overclocking to %d\n",
>> +			  intel_gpu_freq(rps, val));
>> +
>> +	rps->max_freq_softlimit = val;
>> +
>> +	val = clamp_t(int, rps->cur_freq,
>> +		      rps->min_freq_softlimit,
>> +		      rps->max_freq_softlimit);
>> +
>> +	/*
>> +	 * We still need *_set_rps to process the new max_delay and
>> +	 * update the interrupt limits and PMINTRMSK even though
>> +	 * frequency request may be unchanged.
>> +	 */
>> +	intel_rps_set(rps, val);
>> +
>> +unlock:
>> +	mutex_unlock(&rps->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +u32 intel_rps_get_min_frequency(struct intel_rps *rps)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return slpc->min_freq_softlimit;
>> +	else
>> +		return intel_gpu_freq(rps, rps->min_freq_softlimit);
>> +}
>> +
>> +int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +	int ret = 0;
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return intel_guc_slpc_set_min_freq(slpc, val);
>> +
>> +	mutex_lock(&rps->lock);
>> +
>> +	val = intel_freq_opcode(rps, val);
>> +	if (val < rps->min_freq ||
>> +	    val > rps->max_freq ||
>> +	    val > rps->max_freq_softlimit) {
>> +		ret = -EINVAL;
>> +		goto unlock;
>> +	}
>> +
>> +	rps->min_freq_softlimit = val;
>> +
>> +	val = clamp_t(int, rps->cur_freq,
>> +		      rps->min_freq_softlimit,
>> +		      rps->max_freq_softlimit);
>> +
>> +	/*
>> +	 * We still need *_set_rps to process the new min_delay and
>> +	 * update the interrupt limits and PMINTRMSK even though
>> +	 * frequency request may be unchanged.
>> +	 */
>> +	intel_rps_set(rps, val);
>> +
>> +unlock:
>> +	mutex_unlock(&rps->lock);
>> +
>> +	return ret;
>> +}
>> +
>>   /* External interface for intel_ips.ko */
>>   
>>   static struct drm_i915_private __rcu *ips_mchdev;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
>> index 1d2cfc98b510..6a66690dfb0f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
>> @@ -31,6 +31,17 @@ int intel_gpu_freq(struct intel_rps *rps, int val);
>>   int intel_freq_opcode(struct intel_rps *rps, int val);
>>   u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat1);
>>   u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
>> +u32 intel_rps_get_requested_frequency(struct intel_rps *rps);
>> +u32 intel_rps_get_min_frequency(struct intel_rps *rps);
>> +int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val);
>> +u32 intel_rps_get_max_frequency(struct intel_rps *rps);
>> +int intel_rps_set_max_frequency(struct intel_rps *rps, u32 val);
>> +u32 intel_rps_get_rp0_frequency(struct intel_rps *rps);
>> +u32 intel_rps_get_rp1_frequency(struct intel_rps *rps);
>> +u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
>> +u32 intel_rps_read_punit_req(struct intel_rps *rps);
>> +u32 intel_rps_get_req(struct intel_rps *rps, u32 pureq);
>> +u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
>>   
>>   void gen5_rps_irq_handler(struct intel_rps *rps);
>>   void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index a98cbf274862..03861eb913d1 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -316,6 +316,11 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>>   	intel_wakeref_t wakeref;
>>   	int ret;
>>   
>> +	if ((val < slpc->min_freq) ||
>> +	    (val > slpc->rp0_freq) ||
>> +	    (val < slpc->min_freq_softlimit))
>> +		return -EINVAL;
> 
> shouldn't this be part of the earlier patch ?

Sure.

> 
>> +
>>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>   		ret = slpc_set_param(slpc,
>>   			       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
>> @@ -328,6 +333,8 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>>   		}
>>   	}
>>   
>> +	slpc->max_freq_softlimit = val;
> 
> why in this patch?

moved to previous patch.

> 
>> +
>>   	return ret;
>>   }
>>   
>> @@ -375,6 +382,11 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>>   	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	intel_wakeref_t wakeref;
>>   
>> +	if ((val < slpc->min_freq) ||
>> +	    (val > slpc->rp0_freq) ||
>> +	    (val > slpc->max_freq_softlimit))
>> +		return -EINVAL;
> 
> same here

ok.
> 
>> +
>>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>   		ret = slpc_set_param(slpc,
>>   			       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> @@ -387,6 +399,8 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>>   		}
>>   	}
>>   
>> +	slpc->min_freq_softlimit = val;
>> +
>>   	return ret;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>> index eca92076f31d..0b488d49694c 100644
>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>> @@ -407,7 +407,7 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>>   
>>   	if (pmu->enable & config_mask(I915_PMU_REQUESTED_FREQUENCY)) {
>>   		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_REQ],
>> -				intel_gpu_freq(rps, rps->cur_freq),
>> +				intel_rps_get_requested_frequency(rps),
>>   				period_ns / 1000);
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index f3a445f79a36..b4527ca027e3 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -9229,6 +9229,8 @@ enum {
>>   #define   GEN9_FREQUENCY(x)			((x) << 23)
>>   #define   GEN6_OFFSET(x)			((x) << 19)
>>   #define   GEN6_AGGRESSIVE_TURBO			(0 << 15)
>> +#define   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT 	23
>> +
>>   #define GEN6_RC_VIDEO_FREQ			_MMIO(0xA00C)
>>   #define GEN6_RC_CONTROL				_MMIO(0xA090)
>>   #define   GEN6_RC_CTL_RC6pp_ENABLE		(1 << 16)
>> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
>> index 873bf996ceb5..346646a0b43b 100644
>> --- a/drivers/gpu/drm/i915/i915_sysfs.c
>> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
>> @@ -272,7 +272,7 @@ static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
>>   	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
>>   	struct intel_rps *rps = &i915->gt.rps;
>>   
>> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->cur_freq));
>> +	return sysfs_emit(buf, "%d\n", intel_rps_get_requested_frequency(rps));
>>   }
>>   
>>   static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
>> @@ -326,9 +326,10 @@ static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
>>   static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
>>   {
>>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>> -	struct intel_rps *rps = &dev_priv->gt.rps;
>> +	struct intel_gt *gt = &dev_priv->gt;
> 
> while here, maybe worth to s/dev_priv/i915
> same below

ok.

Thanks,
Vinay.
> 
> Michal
> 
>> +	struct intel_rps *rps = &gt->rps;
>>   
>> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->max_freq_softlimit));
>> +	return sysfs_emit(buf, "%d\n", intel_rps_get_max_frequency(rps));
>>   }
>>   
>>   static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>> @@ -336,7 +337,8 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>>   				     const char *buf, size_t count)
>>   {
>>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>> -	struct intel_rps *rps = &dev_priv->gt.rps;
>> +	struct intel_gt *gt = &dev_priv->gt;
>> +	struct intel_rps *rps = &gt->rps;
>>   	ssize_t ret;
>>   	u32 val;
>>   
>> @@ -344,35 +346,7 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>>   	if (ret)
>>   		return ret;
>>   
>> -	mutex_lock(&rps->lock);
>> -
>> -	val = intel_freq_opcode(rps, val);
>> -	if (val < rps->min_freq ||
>> -	    val > rps->max_freq ||
>> -	    val < rps->min_freq_softlimit) {
>> -		ret = -EINVAL;
>> -		goto unlock;
>> -	}
>> -
>> -	if (val > rps->rp0_freq)
>> -		DRM_DEBUG("User requested overclocking to %d\n",
>> -			  intel_gpu_freq(rps, val));
>> -
>> -	rps->max_freq_softlimit = val;
>> -
>> -	val = clamp_t(int, rps->cur_freq,
>> -		      rps->min_freq_softlimit,
>> -		      rps->max_freq_softlimit);
>> -
>> -	/*
>> -	 * We still need *_set_rps to process the new max_delay and
>> -	 * update the interrupt limits and PMINTRMSK even though
>> -	 * frequency request may be unchanged.
>> -	 */
>> -	intel_rps_set(rps, val);
>> -
>> -unlock:
>> -	mutex_unlock(&rps->lock);
>> +	ret = intel_rps_set_max_frequency(rps, val);
>>   
>>   	return ret ?: count;
>>   }
>> @@ -380,9 +354,10 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>>   static ssize_t gt_min_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
>>   {
>>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>> -	struct intel_rps *rps = &dev_priv->gt.rps;
>> +	struct intel_gt *gt = &dev_priv->gt;
>> +	struct intel_rps *rps = &gt->rps;
>>   
>> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->min_freq_softlimit));
>> +	return sysfs_emit(buf, "%d\n", intel_rps_get_min_frequency(rps));
>>   }
>>   
>>   static ssize_t gt_min_freq_mhz_store(struct device *kdev,
>> @@ -398,31 +373,7 @@ static ssize_t gt_min_freq_mhz_store(struct device *kdev,
>>   	if (ret)
>>   		return ret;
>>   
>> -	mutex_lock(&rps->lock);
>> -
>> -	val = intel_freq_opcode(rps, val);
>> -	if (val < rps->min_freq ||
>> -	    val > rps->max_freq ||
>> -	    val > rps->max_freq_softlimit) {
>> -		ret = -EINVAL;
>> -		goto unlock;
>> -	}
>> -
>> -	rps->min_freq_softlimit = val;
>> -
>> -	val = clamp_t(int, rps->cur_freq,
>> -		      rps->min_freq_softlimit,
>> -		      rps->max_freq_softlimit);
>> -
>> -	/*
>> -	 * We still need *_set_rps to process the new min_delay and
>> -	 * update the interrupt limits and PMINTRMSK even though
>> -	 * frequency request may be unchanged.
>> -	 */
>> -	intel_rps_set(rps, val);
>> -
>> -unlock:
>> -	mutex_unlock(&rps->lock);
>> +	ret = intel_rps_set_min_frequency(rps, val);
>>   
>>   	return ret ?: count;
>>   }
>> @@ -448,11 +399,11 @@ static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr
>>   	u32 val;
>>   
>>   	if (attr == &dev_attr_gt_RP0_freq_mhz)
>> -		val = intel_gpu_freq(rps, rps->rp0_freq);
>> +		val = intel_rps_get_rp0_frequency(rps);
>>   	else if (attr == &dev_attr_gt_RP1_freq_mhz)
>> -		val = intel_gpu_freq(rps, rps->rp1_freq);
>> +		val = intel_rps_get_rp1_frequency(rps);
>>   	else if (attr == &dev_attr_gt_RPn_freq_mhz)
>> -		val = intel_gpu_freq(rps, rps->min_freq);
>> +		val = intel_rps_get_rpn_frequency(rps);
>>   	else
>>   		BUG();
>>   
>>
