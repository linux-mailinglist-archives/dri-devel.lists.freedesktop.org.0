Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8AE4F88AF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 22:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18A510E66D;
	Thu,  7 Apr 2022 20:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0905B10E66D;
 Thu,  7 Apr 2022 20:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649364548; x=1680900548;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=A5ty1OhmQGLxKl2eRf22bf/JvMNT+XfpEIZ7fIlRVq8=;
 b=VEoiT+0KgAGUceVZye9tBU7AaKLgukpyFQ7Qu2v8WW9wAJhcoSYCbN1f
 HofrfxOIRhPhTkKVi+2djfbPPg0yfo9vMiGYXOwy5pu62fh1PcbpgE0TN
 9ZfVjEenGMPvtSRC2pBQhPMfBRYAWARhlwDdSB0fYagIm2y7uqKyPKq4F
 A/HPRZ4RI/xIFC0kLTK/0zfhvdnz/iicjU4FtaBC82miZyhrRDrfQmHbF
 ZHFcVi7sjdsr4zeaNxYNjRfb97VXKTyGsTM5TzNHxJlaCpZ7Z29u82vnc
 vrmMljT10oWcXntH+XxE8ghv1U76WamWHkmMiKT/Nh8yOPOpP47H8ICIK A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261432275"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="261432275"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 13:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="588971883"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 07 Apr 2022 13:49:07 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Apr 2022 13:49:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Apr 2022 13:49:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Apr 2022 13:49:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TY9ylSP7sRTd6R8v1napY+RDVEkzZry4Edw2a/rV9cNyNlxLwudMnpw5X+7LX5fpqaLhS9tvGWmGQ5VC4JvNIt6D5MZ3ttkEoZMqujDOIVxKJ2SC0oLDPDTzDXcWHaL56u14ftiNlOwlUWUus2qmEPqw2uFC8JmTEVsSmlPj4ksN6X0VAtALgvfgDNnTsPU1KOnk+AoTekb0jR9phrj9dH3gyGYWcJC0li9wRuNISYWd40dpz995Ma2vzXlrcc3XaNGfonJII0P69aKcOTQxA36hmNaRAzvhoZM3e6ltQZerso3XIPygz7lvqJsSjfzZ8IN3drSRvou7Ce964Qtvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plS1V2bmbUPZ31rWuAeUJPQ3w+kSfvkFAQcrMmHh8kw=;
 b=Kw9Th/wy5GyrQOg6uBLdgaQxUoqyiZ1OuDh5GGAh48F3LohZa3UKWCilt4fdt0GshGnW+xGtaIcSHA/r1MNytJX0lE+JsNlDqtgCWQXOpfjAKfKq2hrJHIzpaGebmqEP8Lhi31ogXOmqG1z2K/H7M3+fXZZu9JIr1tYOQxD07c9e2kYgOzTXoEJCZwzGDAk6yNpDu8edbRmoHci/VRV2Zy7y6ePnbRMqdbpA8pnFqdhaZN5S8kTm7wqRgxk3Hm7RvyAPA2krPu1RzCaXAS1fzAvXcoiicUao4Uxkt+Bgtcc0pBhDsnGY7RP51nhtSanwrvcsok8PcH5Cd2vHUwjCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 20:49:04 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::21e6:3fe8:e859:75b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::21e6:3fe8:e859:75b5%7]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 20:49:04 +0000
Message-ID: <006e88f8-38c5-3cda-0c89-cb97fa0cd817@intel.com>
Date: Thu, 7 Apr 2022 13:49:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/uc: Use platform specific
 defaults for GuC/HuC enabling
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
References: <20210603164812.19045-1-matthew.brost@intel.com>
 <20210603164812.19045-2-matthew.brost@intel.com>
 <062c1a4b-f35d-6ecf-14a0-b41b438d3464@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <062c1a4b-f35d-6ecf-14a0-b41b438d3464@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab54e593-b260-4d1c-f9bb-08da18d80d3e
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB15846D25E5A4265E0C54EE9CBDE69@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w0Wa2F0gZOeIHvo9jU70LdSDexIA9d1XPgz218DW/eT+i2u2xgyw6ikrFwNJOTc85C0DB0TM03ti6d+vbTSrcCWppt9IT8Wez8piQ44i3DmJyvFimq0y4nL3c+B9devBjE6VP5zzHFFagCvaRksNBDUh0RHnFis69/WayYsZZQwlOzNEGtvk1te4M5FglZ1t9RltgZsT0TCk4sKGc2S44qVhlXa28l+TCVOMDl9NTzvVt3J1T8U/HJrdeZD/LGj2m/pSl38DPFWGVrt/lq7GrKu6zxDRJ423kqEFHNjM6cd980Fnbp8BEW6thg2iHfOah1Jp+KkUECyVaexufjyCD/Al/DQKWBMHsAsE/RjX/M8WCZapXgcv9amIzODjrN56UH4wWenaZcKtR/0G9nn77c1gdH4HhRibcjZv/2mx0yLMAjudvNqxKyOA7ZADxiwRzVGUewhiK2/A4NglSRYww0LQFzxAwQ3RUUo8Yi2MYeAtO6btMS4KiSAU1RCEIcefOiXdwgkfpwJ5L+JowabZr0m2YY4XEOOLsswgDozzo+t19XrWjPfeNOu4Gp/Qcx8o6lo6RVt1oc9LC9WqqzO+/PwY5/7snLLhNnKoWytJ0h0Z1bDZeFI9akG9GqlPRopZxwcPhJ552BF6E6vXIRYkSkWAm8DDd2g0BMkLWRukcsu2mpnj2BBuAznZ9l46Mx5q3crUjEsmkzP8x/JvLnHCkbqbce/R/6MkH49gNDWBTQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(86362001)(82960400001)(66476007)(38100700002)(5660300002)(6486002)(66556008)(36756003)(508600001)(8676002)(8936002)(110136005)(6636002)(66946007)(316002)(186003)(26005)(31686004)(83380400001)(2616005)(53546011)(6666004)(6512007)(6506007)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wi82TE5PUi9jZ3o5QWx3S0g5c04vQmVQd0w2Mmp0Zm1MZ2o5cWRwN2p4eVVw?=
 =?utf-8?B?ZEd5ZGYrOGdRU01GMWZ0Zkp0WkRJQng3STV6aTlkZnJvWkZFQzU3bWc2RkUr?=
 =?utf-8?B?ZHdZRnpRT3dZZ3NKZGRIdHhrSlprdDl6KzhTanJNWStVMER5WFhuRVZ0bkxw?=
 =?utf-8?B?RENDdlAwcVpDN0QrcnFSNjZ6Y1Avb285Y0xsOUdrOTNpUmx2VkowVDE2QzJP?=
 =?utf-8?B?RlBsMkhtR3V3dnkyMXBDaGQ2TVlVZVFOTTh1VCtmWmpOZDNQQUxXWHh4dno4?=
 =?utf-8?B?cEIyL2RHSFlvRDZLUzEyZU1HVTJkdlNVY1ZYVWRPRHFzU2p3L0t3cXpoRCtp?=
 =?utf-8?B?VWxHUnZJWnRJS2hVeFRXR3FRdHNQL0k3Z2RDUEpGRmdPOUlUYmV5dmpaejRC?=
 =?utf-8?B?Mk4xZGVvT3BQVkVxN0ViYXZXajBIdldrUE1hZGJLZXRyNlUwcDFROXBrblBF?=
 =?utf-8?B?UytEUm9aTXlIS0gzd282WDRZVHpYL1RkbkwzRTN0MTJLN0oyUG5xSitGRkNj?=
 =?utf-8?B?UHdqZDNiMC9tQUk1dkVGNzZGR0RwWkVJc1lmVm04QWN3dk42MlkxY0E5Uit4?=
 =?utf-8?B?YzdHWllxaUViVm55eGJwcnB0RzA4ZE9VeWhXc0c1S3R1UUJORDRXNlgrSG5y?=
 =?utf-8?B?bnQxc2ZoeExTVEdGaEgwWjhteHRLZWV5WHlqbzFzVkRDVXhSS2hrNjAyRUNH?=
 =?utf-8?B?dUVHd2tNSjZXb1U5RkhVNGE4WjJrU3NrQXdWWHNQVDM3bHN4cmozTlY2bFdn?=
 =?utf-8?B?aXBKWExxWnFHRTh2Njl3MGgvM2x0MXUwNU5NU2xzbGJVRksrMDlIN01FTi85?=
 =?utf-8?B?aTRsUjFVT1g1UEhWNXJ3ZEdMK0JPZkZxUHJGdGs0Rm15VE1FTVhVTlhFemh2?=
 =?utf-8?B?MFdkMmF4djJUbmw3QWp4ZFkzcFdrcTFBTDNoZkYvVWFTekNqYkZJSzRnZnBG?=
 =?utf-8?B?cmZTNk9EbmxEbEFLSVpqRGdUYTkveDJvclZpUHB3WHc4RXNuN1haaTdncXo5?=
 =?utf-8?B?K3c4SktyZ1laeWR1azc5S2hJaTBWYm9vK29mVHh1ODJWUDJONUJwMUp2bWM0?=
 =?utf-8?B?VmdhbTErQnFaVGVTcWI4Q284L05RS2FqTkJqa3V2WEM4TmtxOGlaN2xCRzFz?=
 =?utf-8?B?M2FGdkt2RGlrS0VmTWdRbkFZQnM3SVlNR0lqVERWVU5yUkYyZ3lZTW81SmRz?=
 =?utf-8?B?OTlGcExVT0hoTElyQWJqOGQ5Q2IwcUdweWVBYk1SREFPVUtzMjl3dWV0Z3hW?=
 =?utf-8?B?NFYyUStpaUtvM05PelpsL1dFalR4Y3NBNVNld1hzRVZXNTBpb1BTVFJZVlhF?=
 =?utf-8?B?dzI3ME4xV0lycUF5QWxhNDcxeU9LVURJQlgvTHlKQ3hNMXNsa0NCaXZGOXRR?=
 =?utf-8?B?L3Q5UFBzQm1VRktjTURDN2l5NzhuVUkxNExXSVlXWHJhK1BKU1NLM09Nc3p5?=
 =?utf-8?B?VTA0RFNxRjJYWVF3MzVhMWx2UmpHTlJnc3ZEVHhiL1REcVJLa3JYYkI5dnUx?=
 =?utf-8?B?cENCYnkwc3lkdEhFNjlJODNINU9hcldQcnA2RnFWUldBNXd5S1RtTjB0YTVy?=
 =?utf-8?B?bnhqOFg5TUhPSHVndWRQekdkQWc3VGlWUUpPbDFVMmJlWGJtVG95cVNZNUtk?=
 =?utf-8?B?TU55djN5UW1qbTl4ckh0eHdKSUlvV29Sa29vOE92bkU4MkI2NENOdkVvUlhw?=
 =?utf-8?B?ekhxMGZURlNNU1B1ei8rVnl2Ri9qRkkxRHQyREZtUU9KL0RhL2dRT3NYbFBF?=
 =?utf-8?B?d3hzTDVrQTVONWIvOGdzWVVOL2lPaGwyWlErSWg0V3VscnM0b3RXRVM2M1Z0?=
 =?utf-8?B?cXdub290RVE2NjdZS2dWeUZZQVJpQmhFVXF6cC9yenRHQkFYc1l6YTdDTmhn?=
 =?utf-8?B?OG5IeFA1dDFVZFRodFQxSUV6SVVZS2RJOWRDV01RajBIUUxpMXNRd3hIMERW?=
 =?utf-8?B?cnIzb3l2R3ZUSElFWllveU8raFFTQXAyYk5tTjUybTc5MlV4YWM3TzRyNE5a?=
 =?utf-8?B?azZjYTA2bUVYd3M1RDNOcGFSakxKMlRiUTNuT2ZSQzBLaGRyOWxYRCs5U1d5?=
 =?utf-8?B?b3RPYjlnbE5sL2d4dXBqZzh5SUc4eUk4bjNncUxDN0xNSTB1OGlZMnRkSldl?=
 =?utf-8?B?dnlaZm9VUGt6bzIzR1BCcE94WFpSV1FpT2JBOFUrdkRjcjlPUDl0blIyUThl?=
 =?utf-8?B?T2xZbjdLN0duZ2RCN0lwRm5XM0NxaS85b0JneU9Oaittd09JUk5HWUI4QzJl?=
 =?utf-8?B?cXQvR0xEejlOR2Fuc0UrRnRzaUoyS0U1UWZwRncwLzQ2TS9WOUM5OGh2Mzhm?=
 =?utf-8?B?MSttMTgxUVZpd01hcXYxbWtXWTJhbzVOQ3M5TzBIOEpZQVdPclNJTDE2U2FY?=
 =?utf-8?Q?8bRMs/tRRkitz5iU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab54e593-b260-4d1c-f9bb-08da18d80d3e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 20:49:04.2611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGpXK37aYX72xO096jUnUgKVvz/Tj/El7e/hn+ONkUV/XjzI//ZQWDMAM0KGojE80HTHQ6UI7bma3zCOkcUPwu7+2e8Bq+YhEVXd2R4O/aM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
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

On 4/7/2022 08:49, Tvrtko Ursulin wrote:
> On 03/06/2021 17:48, Matthew Brost wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The meaning of 'default' for the enable_guc module parameter has been
>> updated to accurately reflect what is supported on current platforms.
>> So start using the defaults instead of forcing everything off.
>> Although, note that right now, the default is for everything to be off
>> anyway. So this is not a change for current platforms.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_params.c | 2 +-
>>   drivers/gpu/drm/i915/i915_params.h | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_params.c 
>> b/drivers/gpu/drm/i915/i915_params.c
>> index 0320878d96b0..e07f4cfea63a 100644
>> --- a/drivers/gpu/drm/i915/i915_params.c
>> +++ b/drivers/gpu/drm/i915/i915_params.c
>> @@ -160,7 +160,7 @@ i915_param_named_unsafe(edp_vswing, int, 0400,
>>   i915_param_named_unsafe(enable_guc, int, 0400,
>>       "Enable GuC load for GuC submission and/or HuC load. "
>>       "Required functionality can be selected using bitmask values. "
>> -    "(-1=auto, 0=disable [default], 1=GuC submission, 2=HuC load)");
>> +    "(-1=auto [default], 0=disable, 1=GuC submission, 2=HuC load)");
>>     i915_param_named(guc_log_level, int, 0400,
>>       "GuC firmware logging level. Requires GuC to be loaded. "
>> diff --git a/drivers/gpu/drm/i915/i915_params.h 
>> b/drivers/gpu/drm/i915/i915_params.h
>> index 4a114a5ad000..f27eceb82c0f 100644
>> --- a/drivers/gpu/drm/i915/i915_params.h
>> +++ b/drivers/gpu/drm/i915/i915_params.h
>> @@ -59,7 +59,7 @@ struct drm_printer;
>>       param(int, disable_power_well, -1, 0400) \
>>       param(int, enable_ips, 1, 0600) \
>>       param(int, invert_brightness, 0, 0600) \
>> -    param(int, enable_guc, 0, 0400) \
>> +    param(int, enable_guc, -1, 0400) \
>>       param(int, guc_log_level, -1, 0400) \
>>       param(char *, guc_firmware_path, NULL, 0400) \
>>       param(char *, huc_firmware_path, NULL, 0400) \
>
> What is the BKM to use this with multi-GPU setups? Specifically I have 
> a TGL+DG1 laptop (off the shelf) and want to have GuC with DG1 only. 
> If I pass i915.enable_guc=3 it seems it wants to enable it for TGL as 
> well and wedges the GPU if it can't?
>
I don't think there is one.

Module parameters are driver global and therefore apply to all cards in 
the system, both discrete and integrated. The '-1' default can and does 
have different meanings for each card. So in the TGL+DG1 case, TGL 
should default to execlist and DG1 should already be defaulting to GuC. 
So the -1 setting should do what you want. But if you did need to 
override for one specific card only then I think you would need to do 
that with a code change and rebuild.

John.


> Regards,
>
> Tvrtko

