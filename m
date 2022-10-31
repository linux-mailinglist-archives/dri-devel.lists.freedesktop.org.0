Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA13613B95
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 17:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7C310E2F9;
	Mon, 31 Oct 2022 16:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA66A10E2F9;
 Mon, 31 Oct 2022 16:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667234620; x=1698770620;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4XezzCdHh5aBH5rEdRzSFyJ+K4JhNBU10ELt+fR7sRI=;
 b=kPuNc+cjTRQa9cviZfrwg5SNkzPAhPElqoLtLhg60ExUK4kzlcSvQAZv
 E1LsmcqnU787KvnVDPlo/oKw2h3I0k8Z+TNun5ImyNEdnlmyMhw13ATTi
 6QOQucQ8sf1K6b2VWh8dIaIXiQsxMaC50dj5Ck2Ny0OS66HvsowPuFFwz
 eknYe4BT7BvjLo90RpfowHLNu/3j6n46yEL7C9ETnPPJiD6qfMPyRBjxg
 ClwSmN1YscLG+vXAUeNRcrtxnAVH1EswIwuCjRPCdIxYYyAx5ux/IsWgq
 uyO3N5sXOrubjIeKGNfYAQb1ckiTIZLLU6Z+VBfPoYD5zJRwYI3i1qJmU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="335607478"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="335607478"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 09:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="776199202"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="776199202"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2022 09:43:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 09:43:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 31 Oct 2022 09:43:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 31 Oct 2022 09:43:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjOJBPHC4b8nZhE7gwR0nMUhSbNS5CjdOLasXFiKcmgNLa9fUJCol6zNhM9taVlyv66gq5EmE5UrxW/zeqa50nLxW5zReawGirI38uULGhp6H+8yiBQDk7yMKqserWjEqLYEGLgPrVWSMgiKLnqy2xpP/PyYFb/2bdnvB9a/GOnfUQSWOu5/lhPYZOuFSp+YQCKdQhLPUgpgUSA8S3I9K3VCBPfojDHgmaDtd+yPzZpP9M4vmBSws9SPtqeEsgvToxgYat1hOy9NN9lLOsC08rbG8f7qwrmZYBRzNpbmDGRKKNYYcsdDF2lEb58/XAJNIAi9bK/YqU1HGU4ZW0Ji1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzubqOQc/glm9G8/ZcOm2q8DxgPt8lAjr3hblzNZpr8=;
 b=ZiBcEVbMVxjDwD2Yjbt5z15m4LbF40Wop2FytTTnj6rlFhk+38YvmJVFiymkoldX0N2kfXUeOOrovzeDkuN/44w4cus6ycvmHn5h8SGhsVmT0/wbbtwE90PtuFQW1/CG/vjvmSvPS420SK1OlO8oEmjdwA7s2kCj8HjfNKC9J/5XIhA51gCDx4ye/e3kmgaTow7Gk1gj7NFFuFbyW25y0B77XLgdEABJT9div3flPBIfbhmSVLS8owNHytCflQ1GgoJE7BTU6w37anNaC+POrQQgNGb/Vy9cXredpVKNoTEwl3AqzD8g5tc6b1esPQRypVE/7EN1v/AC4JEQyzEZ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.15; Mon, 31 Oct 2022 16:43:36 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%5]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 16:43:36 +0000
Message-ID: <d9b96da5-0995-1c11-5484-fb2518b4a563@intel.com>
Date: Mon, 31 Oct 2022 09:43:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/5] drm/i915/mtl: add initial definitions for GSC CS
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-2-daniele.ceraolospurio@intel.com>
 <Y1/3QfxBQt5Hs0m0@mdroper-desk1.amr.corp.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <Y1/3QfxBQt5Hs0m0@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::40) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA1PR11MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: d57790dd-1c8a-44f5-0523-08dabb5f0e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1kjazKR+AtnTv+aCzy+w1WR4G4dSMKXGYss6tVkvlFuWhIopr0G5Wg8vOqlQm8tyaxeKHKt65SeCqR9ZG7s9O/jV6cbGJ+eRK9kxNubqMlBmcWcR/+6ae7vaqp7oPMM9zZ1THTdNPBny0+ToHjCaZNTcFhGMDbJOlZYmzp1cQfktBxcZp6aWwlHIKwS8G3znq8Sy3BoYnkgo3uyZ9/Leg0syeup1RsxVy2GYXN9QYn6P16T4lEffZgRxKmJsv2JVVx+XRbfbjv+QJfmH4F4MrahYozZHRZKZ9CaTWqLBFaUUl4Ns+vDy6gQj9k/gW9dJeorzZIjbSETcHJcBbOybAintVCkRouVpuY0j2ecpo3OtDPUpAI7QzCmMclS7272VVLCqBc+xNYdjHzO90MBrtm/nhmHrUU++LgCx1ysLk2vZjFK+/reH2sBKQegmNkyvnLTjTTgn5oP8mxxvl2zvjYwKm/K7ie1Zpv+nNh+YvPj+9+R113KSbGNLtfkVf2U5FfJ9ZEcR8OAPrsl7n7PdzXKz1sQEQRpbt/qLQmSoNTLF7x8+pAnMCLdu5TG47aj6y5KMKJN2GjXig2ysF4ivhQhq7i3ryPpDGikJdlgVsLqzcGWwbG0SrOd6VPTQKsKURwUuXgPGrd0U0zo22zEcg38PZWETr3XrXta+0rOqk8ldu3tTn4BoIPe7uRCdgyhWZUy8qXZXVaFAuQ9h5B3OoCKDvjGj07VzmIKvIRvIDTHpo0ylLXHjD2anZ4Ti0UYq4ZMVmhs9IfpyoIt5dYpibNDTPQCt9IFIrP4yCaf0Ctw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199015)(31686004)(66899015)(478600001)(186003)(8676002)(83380400001)(8936002)(6862004)(66476007)(2906002)(2616005)(41300700001)(6636002)(4326008)(66946007)(450100002)(31696002)(6506007)(66556008)(82960400001)(6666004)(26005)(53546011)(316002)(36756003)(6512007)(37006003)(6486002)(86362001)(5660300002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2ljOTlGcFRpMTZiOFNyRGVxdTM3dEFwL0thZnh2dU5JUmNXQ2wxT0ZtZXRs?=
 =?utf-8?B?WnFBdGtQV0JNbnNwR0JjOWVHeDhlOEw0UWM5VGZubmZ4aUREb0NlbW1jMUtW?=
 =?utf-8?B?RGlYbk9Ib1k5TnNGY2pMWVVWWk54cGxtTVQweGhkRkEveTI3a0RDLzAyY01t?=
 =?utf-8?B?WmhnVVNyelVTV24ySW1WTWZDV2Z6bEpRcUQxYjhDYllnV3dkQmlCSERmSTM2?=
 =?utf-8?B?WjA5RmRwSmNucEpaYVk4S1NNM1NIZHBPVVBKeThDVmp4eVNzeGxxNThUZ3JG?=
 =?utf-8?B?VjRZYk5FNjR2aC8yTURBL1pISXVtKytYaEVUL3lNZFRuYzJ3WWxOOGFaNEtv?=
 =?utf-8?B?ZzdQYk9zajJEMm9OYW5Td294RWtVc0dVSExYVCsyOFBDK2VmYnI3ejNRVEZw?=
 =?utf-8?B?ODVzeFVDWjl5bDh2cmxsRGZoQ0thK3l4a1Jrc0k2WSt3N0xic1N5UDRERE5D?=
 =?utf-8?B?TVNtRFZybkd4NFI1VDMxb1FhQnRseUIxVGZmd0F6NTVtZVpOWExDc1dVcmlE?=
 =?utf-8?B?eWVQVzg5dnNuMWN5RWZUUGNoR2p2WEdmbHFuaUM1SC8yNUtRMk1VMkh0SVdW?=
 =?utf-8?B?Vjc0K3NBV1FTWkc0cjF6U25lZUp5RjlBTndBbW1MTi9DNGMxbWJtR3dFOTlp?=
 =?utf-8?B?bnlRVmg4Sk1BeFQyS0Q4S0s5ZGJiQUF1T3hwNmk3ZFN1RUxMYmtPZ0Z0Q2FO?=
 =?utf-8?B?UDFhMHJ3cWNiTFkxWm1NUE95Qkt1dndrQjFSMmJzMU5HdUcrd1huV3ZRaG14?=
 =?utf-8?B?QWhPRlc0WFJLRThjQUo2dWFQdEM1UTdxYkd3UThWL2t0ajNpL3FCK3Q0NG1V?=
 =?utf-8?B?V1JjeStVNWl5SDBIUk85L2hVVUFLQm1sNE90ckpyTGU1Mzk5UzNIZWlhVmV1?=
 =?utf-8?B?YjRLTFZERmdEWmJVMlJhYkRLaitOZjlVYTh2aWRueXJISEhYWEhJYmdtajFi?=
 =?utf-8?B?WXRVSmNxeWoyMFRmOXRSTlpnUHJocEQ3eVY1NmFvdHIvbDJTZXl3aUQ3SVVp?=
 =?utf-8?B?VlRoZVovUmxCanhMV1lDUlhjRGxxZWN6cGJwdmVFMHB6NDNnbDJHOVJrc0VV?=
 =?utf-8?B?SU9iWGxCd21UWUlHMkJFKzdiOC94dlR1R0lORUZDcXl1ZURkWkZDcWd1L0p4?=
 =?utf-8?B?ZW5WdDkxVzNRbXJrclJVUkpMVDZWY2M4clFyK0hHMkplbDludS9VRkJ3QW9J?=
 =?utf-8?B?VTc3QjFSSkVsMlJSSEd6eHBseDN4Z1hvdVljRmNURGJUSUxtYXZ4S1dkb2dR?=
 =?utf-8?B?emRkRng4ZHNFMldMNFlCemdCSkM3akpONzUvTlRWTDF3TGUxZzNxdEJlZ0RE?=
 =?utf-8?B?SzZVMGJsa09wUllSVEdYc3RDelg5RWFNZFpUVWdWdUNHZUhzZjd0aklLSGtm?=
 =?utf-8?B?bnBzSTV6N1RReitVWmFmTy9xczAxK3J6WDhIbTVETHJEL0VtNUNjemtkL080?=
 =?utf-8?B?djNzRzcxZXZ0Q29xcFJtY2JJTHdhcmRIVFR0ZnEwbmRIOEpLWDhOWnVDQUZT?=
 =?utf-8?B?dU9ySE12eUlwQXRsakJpZ1Bsa29TQ2pLMVlNZHVVb3N5M3VGQU5vTjF4cWdv?=
 =?utf-8?B?OTFDUGgyOHU0SFVid2ROUWR3bFZscjF6L09YVXdWR3ZDTE1KajAyMHY2RUpF?=
 =?utf-8?B?NVVDc01NNWdyRHFCMExZSnBlWVVXMnZLMGhJdVd3UEZ0RTZBWjlwemhnb2ty?=
 =?utf-8?B?dFEyRDdhc0dZYkM2T1lqTDhxRnJpSUVFdm85eFQvM3NwZzlHRTBHaStEY090?=
 =?utf-8?B?dGhaUVRZZkMyRjc1MmV3c0ZsRVFoQW9aMmEyL3g5c1p0bE43N2hFcktTN05x?=
 =?utf-8?B?anJKaUZGekZ4ZVpSdTdUYjRZcys0VHdoaWZyQXRFTWdOSnhSQmRPSis2dEdk?=
 =?utf-8?B?a2ZIZGh1VFM5V01sQTAxYldHS3BkbmJqUGxBQjVtTWtyYnMzL2lld1dQcitm?=
 =?utf-8?B?VHQrNkZIRzFUckZkWlhiUlRXYSt5bmtEYStwZEVrazN3YmhTM3h4NVRabmRU?=
 =?utf-8?B?VnBndXhSNUd6ZnhQSEJjRFd2RGY5UVdJRmJVMXJ5RjY5dFNxakdNcGoxRU9i?=
 =?utf-8?B?aS91dm1iZ2VqUm5rQlJFdHJ5ME9IVTNPTWtUbXJlaXdNSzhlaWsvdkRMZmZt?=
 =?utf-8?B?TmhmKzlFaFRQcVFSbGZPd0RxcFRYQm9PY3F5VWpiMGJiTWJSVlpRbEZES0tl?=
 =?utf-8?Q?PV3Y8Gey7BKX6eA90t22mzI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d57790dd-1c8a-44f5-0523-08dabb5f0e2e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 16:43:36.1780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hK8JYBxsQDfUkrHn5ARSceYF7+3SfoN3g1ULb97xsH7/o8/t+bZuMCGGoDDe6RqjVDtR3vJLjJEMRsDUHmOEx3oPc3pPYCi/sc4jrJCwiLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344
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



On 10/31/2022 9:26 AM, Matt Roper wrote:
> On Thu, Oct 27, 2022 at 03:15:50PM -0700, Daniele Ceraolo Spurio wrote:
>> Starting on MTL, the GSC is no longer managed with direct MMIO access,
>> but we instead have a dedicated command streamer for it. As a first step
>> for adding support for this CS, add the required definitions.
>> Note that, although it is now a CS, the GSC retains its old
>> class:instance value (OTHER_CLASS instance 6)
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
> Now that we have an OTHER_CLASS engine, I think we also need to deal
> with the class -> reg mapping table in mmio_invalidate_full().  I think
> the register we want is 0xCF04?

I missed that. Looks like the the situation is a bit more complex than 
just adding the new register, because on pre-MTL platforms CF04 is the 
compute class invalidation register. On MTL as you said CF04 is marked 
as the GSC CS invalidation register, but I can't find the compute one. 
Do you know if it re-uses the render one or something like that?
Given that there seem to be non-GSC related changes as well, IMO this 
should probably be a separate patch to specifically handle the TLB inval 
changes on MTL.

Daniele

>
> Matt
>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 8 ++++++++
>>   drivers/gpu/drm/i915/gt/intel_engine_types.h | 1 +
>>   drivers/gpu/drm/i915/gt/intel_engine_user.c  | 1 +
>>   drivers/gpu/drm/i915/i915_reg.h              | 1 +
>>   4 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 3b7d750ad054..e0fbfac03979 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -244,6 +244,13 @@ static const struct engine_info intel_engines[] = {
>>   			{ .graphics_ver = 12, .base = GEN12_COMPUTE3_RING_BASE }
>>   		}
>>   	},
>> +	[GSC0] = {
>> +		.class = OTHER_CLASS,
>> +		.instance = OTHER_GSC_INSTANCE,
>> +		.mmio_bases = {
>> +			{ .graphics_ver = 12, .base = MTL_GSC_RING_BASE }
>> +		}
>> +	},
>>   };
>>   
>>   /**
>> @@ -324,6 +331,7 @@ u32 intel_engine_context_size(struct intel_gt *gt, u8 class)
>>   	case VIDEO_DECODE_CLASS:
>>   	case VIDEO_ENHANCEMENT_CLASS:
>>   	case COPY_ENGINE_CLASS:
>> +	case OTHER_CLASS:
>>   		if (GRAPHICS_VER(gt->i915) < 8)
>>   			return 0;
>>   		return GEN8_LR_CONTEXT_OTHER_SIZE;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> index 6b5d4ea22b67..4fd54fb8810f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> @@ -136,6 +136,7 @@ enum intel_engine_id {
>>   	CCS2,
>>   	CCS3,
>>   #define _CCS(n) (CCS0 + (n))
>> +	GSC0,
>>   	I915_NUM_ENGINES
>>   #define INVALID_ENGINE ((enum intel_engine_id)-1)
>>   };
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> index 46a174f8aa00..79312b734690 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> @@ -140,6 +140,7 @@ const char *intel_engine_class_repr(u8 class)
>>   		[COPY_ENGINE_CLASS] = "bcs",
>>   		[VIDEO_DECODE_CLASS] = "vcs",
>>   		[VIDEO_ENHANCEMENT_CLASS] = "vecs",
>> +		[OTHER_CLASS] = "other",
>>   		[COMPUTE_CLASS] = "ccs",
>>   	};
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 1c0da50c0dc7..d056c3117ef2 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -970,6 +970,7 @@
>>   #define GEN11_VEBOX2_RING_BASE		0x1d8000
>>   #define XEHP_VEBOX3_RING_BASE		0x1e8000
>>   #define XEHP_VEBOX4_RING_BASE		0x1f8000
>> +#define MTL_GSC_RING_BASE		0x11a000
>>   #define GEN12_COMPUTE0_RING_BASE	0x1a000
>>   #define GEN12_COMPUTE1_RING_BASE	0x1c000
>>   #define GEN12_COMPUTE2_RING_BASE	0x1e000
>> -- 
>> 2.37.3
>>

