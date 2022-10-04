Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8805F4BDF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5645C10E1F6;
	Tue,  4 Oct 2022 22:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E754010E1E6;
 Tue,  4 Oct 2022 22:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664922470; x=1696458470;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2kqGdmG6CFUQY0AzruCfAXCQJLuIoGI2E8wkuPUf3LI=;
 b=l254SWCF0SSpoKkVH8k3OA81b/ux7S7r6bnW9QI0bQdaT7RpOBrsWUy+
 WwCFhweE1fHHhgjBsV6Ej9XPA4Xf3xu0V1m8l+7m+9DSZUGdVWI1GdzJ3
 d9Rz0gHNId5SAgW5s4mWDrBQKgWe25wiTeWwIVNZdCLni0zM7yn9c6Ie0
 1uBwmrkL6UzzlLv57/XnAYv5AzW8IowD21fsE9JhRQAB8IrEypd8DTrCs
 JCtOB4dCSFy8CAUwA0STu5uX7fOZB/2pd8uEldEVT2NIywr8jPkyOrJ5q
 I+JZVu7uYOuhHLsjCjRnaYpgfpujip36bdZCGgPzTTJOwi0RwKyygQjs1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="300639991"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; d="scan'208";a="300639991"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 15:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="749555045"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; d="scan'208";a="749555045"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 04 Oct 2022 15:27:49 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 4 Oct 2022 15:27:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 4 Oct 2022 15:27:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 4 Oct 2022 15:27:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 4 Oct 2022 15:27:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8a8xc+bDi8iqi5O4az5NY5U1s66Voxyv+DtJCjtyOyJZO45rWW2DrT+mUV0WGQlduMIdrQoid+g/hNgsJTOHfKKH2pFPjVot+F8CqSLzJDJ8pgzDPTPAsvLFHPAX+5hHhMGIpoz2XBT/Ua3rudqALHR93LAdnWpd+5TUkYIBdbYPtuqtNr5mzwv9x3CfFH2B8i2Dq2olyX2UsKlCZx8lX3WgCiUIks5RnbUo1dxpx2utdp16D6umPJOr8/AJUlPtztWY/AMh/dkGTt9dUUrFdwQOASpL4Vb2ApecOl32dl3o4cK99r//S4XeQjqzROl+NqfJ5Es/7s+nMMIeu+PNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqvAJGQHcggSywLvz6qoN5kLhMdBLAj+6Ro/ALsVJ24=;
 b=M+/XDZFJ60pa8v8ZiIku6RtzUXO3HoxYwTYHh+MGbJZJEK749c+T2xvZ3k6qb4qBpJbBPvHe01dWUK8M7MYwil1IoHCOXiN2ryp5ng6FpU3g2Qo6hpx6lz1Y8Ce5+H4PzjK7aUY5g6jwPv7mGkpxzhdfFNHvJKlHhNTaKr8Tsxac8twAIyA/RNb1jTK0PQdgTveMjkwFBzOti64KuW81ZxCy1J4blXJGgaOc8Y70fA7gpf7z/HqTazqs9VR8l1IgoM2Wgb4CH33JVbeXFOSJg/75Tip362WLQk32d1qrkJKGDE/R837DBEV0KG+O/7E/QAwcnopTLWpuxSXe9HkqIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DS0PR11MB6493.namprd11.prod.outlook.com (2603:10b6:8:c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.35; Tue, 4 Oct
 2022 22:27:46 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 22:27:46 +0000
Message-ID: <d37c4ec8-190d-26b6-c8a9-663adb79c066@intel.com>
Date: Tue, 4 Oct 2022 15:27:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 1/2] drm/i915: Add a wrapper for frequency debugfs
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20221003230408.7313-1-vinay.belgaumkar@intel.com>
 <20221003230408.7313-2-vinay.belgaumkar@intel.com> <87h70kujkd.fsf@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87h70kujkd.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::34) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DS0PR11MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c3ae02-442c-4f5e-6eb8-08daa657a9a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0m6NiBFHuxFlj03aIBkiwQd007dx4hYHp1pQzYq2nhyK7ixz5TBHejlyw7emIMJqCuV/ObajyJ6CswcpLfaBMkoJYbKqfDj/uNb3Na4lt4EqOpD49gewlnuuzIigphL+/SR1GzgbLG2B0KuW3RaOcZ06TZH0JZVpQQ80fp69JvhglfsE3XSIL8aDamylk9BgOMMokEhK930lwexOEntQ3TS832DFIIp5qw4/pRcGQfof7D8Djy0ZpDrrsHmLQ0QFJc5jc0W4BpgIoccL68vh2Mir+CT6RMQWN/p5TLHSlSLi6c6FeEF2oXVQo9ggfeGolJ0fu87dF5sV7GaUZH/Gm4RPebFEQH2J9DsXq9+HOWVStk22fQPTvXvQI7lxODAPvaJCMb3Wfy5mm9FLSrCrIdt7cSsRdJSWQQvHememJbPbzaV6vtPHDCqzC6dSTzTycIXQ+puqX3QCzduvMx1thc9xndfTFke+SwylZZT7x2Dajk5vMKjvhxMBzz1y4dbcBze8A1D2AtRHMN9i+6lQ7G3eiTUge+s5DdxgCGh6Js8xqXtawnpDJ5NbCMwr0h+tFHHex9DILu0v7F3l82f1i5ATW/SwJ1S95SEXM86TkiGqrKACHyS0XJO4+LQ0KXWr510Acdl/bvalDX8sz21RpNGdhWGI7gVeTRCxt604NNIduUmbKLXNUee32RHv6pBmY1FZVy61gbxUh6r7RP2D/uJw3tvUYG7zxXxI9zsIwx9/AA2JLS4CmTJQiWFNad0eR0mmGKV4M86Tosg+UgS7sHyh6JBAl3fPR7zOJTS738o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199015)(2616005)(53546011)(186003)(83380400001)(6512007)(26005)(6506007)(8676002)(316002)(31686004)(478600001)(41300700001)(6486002)(82960400001)(66946007)(5660300002)(30864003)(38100700002)(66476007)(66556008)(2906002)(8936002)(36756003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGtKbk1IM1R6THBlMTZpTnZHRU5pS1IrVTJYY3l4aGs5aUd3bXIrUGM2bmkv?=
 =?utf-8?B?OG80emhtZldYWFJpT2FZbG92SUtEc2dnT3RST0orVEhEeDFJQjR0QlFuQXp3?=
 =?utf-8?B?L3dmSkNCRHNkeFJjWWMyaE1ORENUa3FaYy9xSEkvbDg2QnZjTldxdWkvRWtn?=
 =?utf-8?B?YUNuaEM2VzVJKzc4M04vTGFLWDFYbzU2WE1XR0VVSGh0TkhmbjVYSHJhc0xQ?=
 =?utf-8?B?c0NHZFZZRjdLN1ZCMG9mZStRRGpmWFN1dnhKcWhVaStIY2pzWU5oV1BsejZ6?=
 =?utf-8?B?R25DNnQrQ0xLeWJsN2lZZEVpM2NzMG5KVitFRTQ1WThWb0N1SUtmNWRFdWJ3?=
 =?utf-8?B?dVVMQ0kwbXVRKzIzdzZsZXVlYTI2bS9aaG9jeFl2d1RUazFSS0IrZng0eFJR?=
 =?utf-8?B?MndINkl3LzVxYVowR2N2M0I0SVBFUUN0eEo2ODdjbnZMRFVqTUZjQWorTU1u?=
 =?utf-8?B?NHJKYmZWQmI2cU5ZdVplQkRwaUkwQXpoNnhPYW9ndkxPU1NWRkdJemJBampv?=
 =?utf-8?B?VkU3eC9QcjNnUElMSGJXNG81UHpwQyswNElTc09tMTVpVEtUWWF6cVZTVkIz?=
 =?utf-8?B?bmNXWXlydlZ3WGM1b0RyUlozTDhlS2VlaENpZEE3OUhqSnArd3RodFE2ZDRK?=
 =?utf-8?B?SWNNM2JFTGV3QytWczVKbzVtcWhnRHJSVk9qUVdEK2dNZk9OaDhMeTNac3ho?=
 =?utf-8?B?aXljQnBRbDIrZUJHR1FzenpKMmpseS9zRFhJVXZVcWk0VzVzSHhFcEpRQjNO?=
 =?utf-8?B?clMrdy8wa0ttaDhLYi9OeGlOdDZIdklob0VrL0xlQkk1b2p0d3Q5ZG9UaFBH?=
 =?utf-8?B?TFJ6UXFrZkEyWC81VkpZeHF0bFdZMnVyekRYOGJyRmh1dFRaeWUyOXlmbitR?=
 =?utf-8?B?bHJFQ3p1bTJVOHhLRk9WMmtTYlNHcUk4bUhReGhleFZqSWdWZldnMkhib2I5?=
 =?utf-8?B?L2R3UERseFNiTzgrZEtXOFd6NHB3cFJJaU5yYnRmK05aRmhHcGVnRnh3eks5?=
 =?utf-8?B?SmpINDdSV0pmS2hSSGFzZm9QK2t1eXNWTmN4VVlidURYYW16Q1hocExkVFZr?=
 =?utf-8?B?OU5kR0ZrQlJ1Q3ZmZFVOWHRlTStMR3MwdmQ0eFFocXRBNFBVNVFZTEd0SXBt?=
 =?utf-8?B?WFFmVFBOYlE0UURMeWNnMjA2S1lEWXBNVkcyTXpFN2xNUjd5QkxGVWJwZDZR?=
 =?utf-8?B?YU81R1cwd2hkNElONExoOXpSc3B0cnFSYkg0RysxZGh5amdoSHZ0N1VyNk4v?=
 =?utf-8?B?NHhCRU1WVzZZdWphYjRERzdLSmpMaVI4SXg2TlBLcDBPV1A2WTdGN0ZESTZW?=
 =?utf-8?B?TXBPWWwycUlzeDhkMUtSMDVwbTE2MlUvR0VwUzJ0ZlBRb2JWZGk1a25sYkNL?=
 =?utf-8?B?emlUczh4THRZUzNncTk0VWE2Y1NmRVpnaUk2ZmtPdmcxclRtMUN2NDF6SUVv?=
 =?utf-8?B?cGdmcVpQTkNZdUY5Ylg3VTU3UHpsN2c0Q3pDUXpqSVhnRjdsLzl6YVFIcnVP?=
 =?utf-8?B?cC9wNVJhNTBEWUlCOEtqMzVlVWxwejJ4VHl1ZFFFVGVrL2pWVmMvNnFMY1ps?=
 =?utf-8?B?T2tRUDc1RFdmd1k1bFpaTFBhdGhRanV1VFF2cnJDaVZ0L2xremRqWXBOS29z?=
 =?utf-8?B?NkFWdGpqNDBWVHU1aFVhc0pUVzhIcDZIbGRONmJBVENxbWpZeGsvL0hmVzdv?=
 =?utf-8?B?TlNUN2FsU2VKVk1kc2ZyM1ZXalhxbkRMVW5vQlhvZ0h3SHc1T1BmMmV1b1lI?=
 =?utf-8?B?cmdRK29lQkN1bk9FWVhTbGF0VHZhYU0xMkdld2dha2xCS2tqbm9IZXQ5UGF6?=
 =?utf-8?B?eXlGYW5QcW5oRkpMOU9sL2pIQ2YxWHhESStJaUI2U1NVQWVtRUxWVlVHcmxK?=
 =?utf-8?B?cXJ2US9pNXNFY3RhdUtuZFVkNER1emVQbEdVRW04U0VBc3FPZDB0c3BJYVFR?=
 =?utf-8?B?eGtybEpwR3ZHeGdCOXljcVVlZTdZbVRyWHFqSmNBWG1tL05rOG01Q1hMQVRT?=
 =?utf-8?B?NkhWdUYvNE42RkdUSWl1UDlib1o1Tlc5bys0RWNrL0g1eGp1cVdOTHZ6S2lY?=
 =?utf-8?B?THBjQUIxU1RwOGpHTnd5QVJRaVAvNm1MYWFmUXF5RVR2WnlHUUU3ZG1iZnpY?=
 =?utf-8?B?dWxvRWZNVTFXOVo1U240amJvTFdoc2ZtZkFpa1ZKa1N1UDdBclZEMVRrT2lx?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c3ae02-442c-4f5e-6eb8-08daa657a9a5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 22:27:46.6934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4B/flvitmDNFuhm35SKMIlBqWO3xyj1giPO7YINL/qN/7c1H1W7Vrl4XjQP1cyOFwo0tF9BIAdbjm00HrzTjluDFkx+LYlDSN74RHTB8mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6493
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


On 10/4/2022 12:36 AM, Jani Nikula wrote:
> On Mon, 03 Oct 2022, Vinay Belgaumkar <vinay.belgaumkar@intel.com> wrote:
>> Move it to the RPS source file.
> The idea was that the 1st patch would be non-functional code
> movement. This is still a functional change.
>
> Or you can do the functional changes first, and then move code, as long
> as you don't combine code movement with functional changes.
Yup, will move the SLPC check to the second patch as well.
>
> Please also mark your patch revisions and note the changes. There's no
> indication this series is v2.

ok.

Thanks,

Vinay.

>
> BR,
> Jani.
>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 157 +---------------
>>   drivers/gpu/drm/i915/gt/intel_rps.c           | 169 ++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_rps.h           |   3 +
>>   3 files changed, 173 insertions(+), 156 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
>> index 9fd4d9255a97..4319d6cdafe2 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
>> @@ -344,162 +344,7 @@ void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *p)
>>   		drm_printf(p, "efficient (RPe) frequency: %d MHz\n",
>>   			   intel_gpu_freq(rps, rps->efficient_freq));
>>   	} else if (GRAPHICS_VER(i915) >= 6) {
>> -		u32 rp_state_limits;
>> -		u32 gt_perf_status;
>> -		struct intel_rps_freq_caps caps;
>> -		u32 rpmodectl, rpinclimit, rpdeclimit;
>> -		u32 rpstat, cagf, reqf;
>> -		u32 rpcurupei, rpcurup, rpprevup;
>> -		u32 rpcurdownei, rpcurdown, rpprevdown;
>> -		u32 rpupei, rpupt, rpdownei, rpdownt;
>> -		u32 pm_ier, pm_imr, pm_isr, pm_iir, pm_mask;
>> -
>> -		rp_state_limits = intel_uncore_read(uncore, GEN6_RP_STATE_LIMITS);
>> -		gen6_rps_get_freq_caps(rps, &caps);
>> -		if (IS_GEN9_LP(i915))
>> -			gt_perf_status = intel_uncore_read(uncore, BXT_GT_PERF_STATUS);
>> -		else
>> -			gt_perf_status = intel_uncore_read(uncore, GEN6_GT_PERF_STATUS);
>> -
>> -		/* RPSTAT1 is in the GT power well */
>> -		intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>> -
>> -		reqf = intel_uncore_read(uncore, GEN6_RPNSWREQ);
>> -		if (GRAPHICS_VER(i915) >= 9) {
>> -			reqf >>= 23;
>> -		} else {
>> -			reqf &= ~GEN6_TURBO_DISABLE;
>> -			if (IS_HASWELL(i915) || IS_BROADWELL(i915))
>> -				reqf >>= 24;
>> -			else
>> -				reqf >>= 25;
>> -		}
>> -		reqf = intel_gpu_freq(rps, reqf);
>> -
>> -		rpmodectl = intel_uncore_read(uncore, GEN6_RP_CONTROL);
>> -		rpinclimit = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
>> -		rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
>> -
>> -		rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
>> -		rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
>> -		rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
>> -		rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
>> -		rpcurdownei = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN_EI) & GEN6_CURIAVG_MASK;
>> -		rpcurdown = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN) & GEN6_CURBSYTAVG_MASK;
>> -		rpprevdown = intel_uncore_read(uncore, GEN6_RP_PREV_DOWN) & GEN6_CURBSYTAVG_MASK;
>> -
>> -		rpupei = intel_uncore_read(uncore, GEN6_RP_UP_EI);
>> -		rpupt = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
>> -
>> -		rpdownei = intel_uncore_read(uncore, GEN6_RP_DOWN_EI);
>> -		rpdownt = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
>> -
>> -		cagf = intel_rps_read_actual_frequency(rps);
>> -
>> -		intel_uncore_forcewake_put(uncore, FORCEWAKE_ALL);
>> -
>> -		if (GRAPHICS_VER(i915) >= 11) {
>> -			pm_ier = intel_uncore_read(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE);
>> -			pm_imr = intel_uncore_read(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK);
>> -			/*
>> -			 * The equivalent to the PM ISR & IIR cannot be read
>> -			 * without affecting the current state of the system
>> -			 */
>> -			pm_isr = 0;
>> -			pm_iir = 0;
>> -		} else if (GRAPHICS_VER(i915) >= 8) {
>> -			pm_ier = intel_uncore_read(uncore, GEN8_GT_IER(2));
>> -			pm_imr = intel_uncore_read(uncore, GEN8_GT_IMR(2));
>> -			pm_isr = intel_uncore_read(uncore, GEN8_GT_ISR(2));
>> -			pm_iir = intel_uncore_read(uncore, GEN8_GT_IIR(2));
>> -		} else {
>> -			pm_ier = intel_uncore_read(uncore, GEN6_PMIER);
>> -			pm_imr = intel_uncore_read(uncore, GEN6_PMIMR);
>> -			pm_isr = intel_uncore_read(uncore, GEN6_PMISR);
>> -			pm_iir = intel_uncore_read(uncore, GEN6_PMIIR);
>> -		}
>> -		pm_mask = intel_uncore_read(uncore, GEN6_PMINTRMSK);
>> -
>> -		drm_printf(p, "Video Turbo Mode: %s\n",
>> -			   str_yes_no(rpmodectl & GEN6_RP_MEDIA_TURBO));
>> -		drm_printf(p, "HW control enabled: %s\n",
>> -			   str_yes_no(rpmodectl & GEN6_RP_ENABLE));
>> -		drm_printf(p, "SW control enabled: %s\n",
>> -			   str_yes_no((rpmodectl & GEN6_RP_MEDIA_MODE_MASK) == GEN6_RP_MEDIA_SW_MODE));
>> -
>> -		drm_printf(p, "PM IER=0x%08x IMR=0x%08x, MASK=0x%08x\n",
>> -			   pm_ier, pm_imr, pm_mask);
>> -		if (GRAPHICS_VER(i915) <= 10)
>> -			drm_printf(p, "PM ISR=0x%08x IIR=0x%08x\n",
>> -				   pm_isr, pm_iir);
>> -		drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
>> -			   rps->pm_intrmsk_mbz);
>> -		drm_printf(p, "GT_PERF_STATUS: 0x%08x\n", gt_perf_status);
>> -		drm_printf(p, "Render p-state ratio: %d\n",
>> -			   (gt_perf_status & (GRAPHICS_VER(i915) >= 9 ? 0x1ff00 : 0xff00)) >> 8);
>> -		drm_printf(p, "Render p-state VID: %d\n",
>> -			   gt_perf_status & 0xff);
>> -		drm_printf(p, "Render p-state limit: %d\n",
>> -			   rp_state_limits & 0xff);
>> -		drm_printf(p, "RPSTAT1: 0x%08x\n", rpstat);
>> -		drm_printf(p, "RPMODECTL: 0x%08x\n", rpmodectl);
>> -		drm_printf(p, "RPINCLIMIT: 0x%08x\n", rpinclimit);
>> -		drm_printf(p, "RPDECLIMIT: 0x%08x\n", rpdeclimit);
>> -		drm_printf(p, "RPNSWREQ: %dMHz\n", reqf);
>> -		drm_printf(p, "CAGF: %dMHz\n", cagf);
>> -		drm_printf(p, "RP CUR UP EI: %d (%lldns)\n",
>> -			   rpcurupei,
>> -			   intel_gt_pm_interval_to_ns(gt, rpcurupei));
>> -		drm_printf(p, "RP CUR UP: %d (%lldns)\n",
>> -			   rpcurup, intel_gt_pm_interval_to_ns(gt, rpcurup));
>> -		drm_printf(p, "RP PREV UP: %d (%lldns)\n",
>> -			   rpprevup, intel_gt_pm_interval_to_ns(gt, rpprevup));
>> -		drm_printf(p, "Up threshold: %d%%\n",
>> -			   rps->power.up_threshold);
>> -		drm_printf(p, "RP UP EI: %d (%lldns)\n",
>> -			   rpupei, intel_gt_pm_interval_to_ns(gt, rpupei));
>> -		drm_printf(p, "RP UP THRESHOLD: %d (%lldns)\n",
>> -			   rpupt, intel_gt_pm_interval_to_ns(gt, rpupt));
>> -
>> -		drm_printf(p, "RP CUR DOWN EI: %d (%lldns)\n",
>> -			   rpcurdownei,
>> -			   intel_gt_pm_interval_to_ns(gt, rpcurdownei));
>> -		drm_printf(p, "RP CUR DOWN: %d (%lldns)\n",
>> -			   rpcurdown,
>> -			   intel_gt_pm_interval_to_ns(gt, rpcurdown));
>> -		drm_printf(p, "RP PREV DOWN: %d (%lldns)\n",
>> -			   rpprevdown,
>> -			   intel_gt_pm_interval_to_ns(gt, rpprevdown));
>> -		drm_printf(p, "Down threshold: %d%%\n",
>> -			   rps->power.down_threshold);
>> -		drm_printf(p, "RP DOWN EI: %d (%lldns)\n",
>> -			   rpdownei, intel_gt_pm_interval_to_ns(gt, rpdownei));
>> -		drm_printf(p, "RP DOWN THRESHOLD: %d (%lldns)\n",
>> -			   rpdownt, intel_gt_pm_interval_to_ns(gt, rpdownt));
>> -
>> -		drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
>> -			   intel_gpu_freq(rps, caps.min_freq));
>> -		drm_printf(p, "Nominal (RP1) frequency: %dMHz\n",
>> -			   intel_gpu_freq(rps, caps.rp1_freq));
>> -		drm_printf(p, "Max non-overclocked (RP0) frequency: %dMHz\n",
>> -			   intel_gpu_freq(rps, caps.rp0_freq));
>> -		drm_printf(p, "Max overclocked frequency: %dMHz\n",
>> -			   intel_gpu_freq(rps, rps->max_freq));
>> -
>> -		drm_printf(p, "Current freq: %d MHz\n",
>> -			   intel_gpu_freq(rps, rps->cur_freq));
>> -		drm_printf(p, "Actual freq: %d MHz\n", cagf);
>> -		drm_printf(p, "Idle freq: %d MHz\n",
>> -			   intel_gpu_freq(rps, rps->idle_freq));
>> -		drm_printf(p, "Min freq: %d MHz\n",
>> -			   intel_gpu_freq(rps, rps->min_freq));
>> -		drm_printf(p, "Boost freq: %d MHz\n",
>> -			   intel_gpu_freq(rps, rps->boost_freq));
>> -		drm_printf(p, "Max freq: %d MHz\n",
>> -			   intel_gpu_freq(rps, rps->max_freq));
>> -		drm_printf(p,
>> -			   "efficient (RPe) frequency: %d MHz\n",
>> -			   intel_gpu_freq(rps, rps->efficient_freq));
>> +			gen6_rps_frequency_dump(rps, p);
> The indent is off here.
>
>>   	} else {
>>   		drm_puts(p, "no P-state info available\n");
>>   	}
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index 17b40b625e31..7b0f6b4cfe78 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -2219,6 +2219,175 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps *rps)
>>   		return intel_gpu_freq(rps, rps->min_freq);
>>   }
>>   
>> +static void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
>> +{
>> +	struct intel_gt *gt = rps_to_gt(rps);
>> +	struct drm_i915_private *i915 = gt->i915;
>> +	struct intel_uncore *uncore = gt->uncore;
>> +	struct intel_rps_freq_caps caps;
>> +	u32 rp_state_limits;
>> +	u32 gt_perf_status;
>> +	u32 rpmodectl, rpinclimit, rpdeclimit;
>> +	u32 rpstat, cagf, reqf;
>> +	u32 rpcurupei, rpcurup, rpprevup;
>> +	u32 rpcurdownei, rpcurdown, rpprevdown;
>> +	u32 rpupei, rpupt, rpdownei, rpdownt;
>> +	u32 pm_ier, pm_imr, pm_isr, pm_iir, pm_mask;
>> +
>> +	rp_state_limits = intel_uncore_read(uncore, GEN6_RP_STATE_LIMITS);
>> +	gen6_rps_get_freq_caps(rps, &caps);
>> +	if (IS_GEN9_LP(i915))
>> +		gt_perf_status = intel_uncore_read(uncore, BXT_GT_PERF_STATUS);
>> +	else
>> +		gt_perf_status = intel_uncore_read(uncore, GEN6_GT_PERF_STATUS);
>> +
>> +	/* RPSTAT1 is in the GT power well */
>> +	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>> +
>> +	reqf = intel_uncore_read(uncore, GEN6_RPNSWREQ);
>> +	if (GRAPHICS_VER(i915) >= 9) {
>> +		reqf >>= 23;
>> +	} else {
>> +		reqf &= ~GEN6_TURBO_DISABLE;
>> +		if (IS_HASWELL(i915) || IS_BROADWELL(i915))
>> +			reqf >>= 24;
>> +		else
>> +			reqf >>= 25;
>> +	}
>> +	reqf = intel_gpu_freq(rps, reqf);
>> +
>> +	rpmodectl = intel_uncore_read(uncore, GEN6_RP_CONTROL);
>> +	rpinclimit = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
>> +	rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
>> +
>> +	rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
>> +	rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
>> +	rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
>> +	rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
>> +	rpcurdownei = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN_EI) & GEN6_CURIAVG_MASK;
>> +	rpcurdown = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN) & GEN6_CURBSYTAVG_MASK;
>> +	rpprevdown = intel_uncore_read(uncore, GEN6_RP_PREV_DOWN) & GEN6_CURBSYTAVG_MASK;
>> +
>> +	rpupei = intel_uncore_read(uncore, GEN6_RP_UP_EI);
>> +	rpupt = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
>> +
>> +	rpdownei = intel_uncore_read(uncore, GEN6_RP_DOWN_EI);
>> +	rpdownt = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
>> +
>> +	cagf = intel_rps_read_actual_frequency(rps);
>> +
>> +	intel_uncore_forcewake_put(uncore, FORCEWAKE_ALL);
>> +
>> +	if (GRAPHICS_VER(i915) >= 11) {
>> +		pm_ier = intel_uncore_read(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE);
>> +		pm_imr = intel_uncore_read(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK);
>> +		/*
>> +		 * The equivalent to the PM ISR & IIR cannot be read
>> +		 * without affecting the current state of the system
>> +		 */
>> +		pm_isr = 0;
>> +		pm_iir = 0;
>> +	} else if (GRAPHICS_VER(i915) >= 8) {
>> +		pm_ier = intel_uncore_read(uncore, GEN8_GT_IER(2));
>> +		pm_imr = intel_uncore_read(uncore, GEN8_GT_IMR(2));
>> +		pm_isr = intel_uncore_read(uncore, GEN8_GT_ISR(2));
>> +		pm_iir = intel_uncore_read(uncore, GEN8_GT_IIR(2));
>> +	} else {
>> +		pm_ier = intel_uncore_read(uncore, GEN6_PMIER);
>> +		pm_imr = intel_uncore_read(uncore, GEN6_PMIMR);
>> +		pm_isr = intel_uncore_read(uncore, GEN6_PMISR);
>> +		pm_iir = intel_uncore_read(uncore, GEN6_PMIIR);
>> +	}
>> +	pm_mask = intel_uncore_read(uncore, GEN6_PMINTRMSK);
>> +
>> +	drm_printf(p, "Video Turbo Mode: %s\n",
>> +		   str_yes_no(rpmodectl & GEN6_RP_MEDIA_TURBO));
>> +	drm_printf(p, "HW control enabled: %s\n",
>> +		   str_yes_no(rpmodectl & GEN6_RP_ENABLE));
>> +	drm_printf(p, "SW control enabled: %s\n",
>> +		   str_yes_no((rpmodectl & GEN6_RP_MEDIA_MODE_MASK) == GEN6_RP_MEDIA_SW_MODE));
>> +
>> +	drm_printf(p, "PM IER=0x%08x IMR=0x%08x, MASK=0x%08x\n",
>> +		   pm_ier, pm_imr, pm_mask);
>> +	if (GRAPHICS_VER(i915) <= 10)
>> +		drm_printf(p, "PM ISR=0x%08x IIR=0x%08x\n",
>> +			   pm_isr, pm_iir);
>> +	drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
>> +		   rps->pm_intrmsk_mbz);
>> +	drm_printf(p, "GT_PERF_STATUS: 0x%08x\n", gt_perf_status);
>> +	drm_printf(p, "Render p-state ratio: %d\n",
>> +		   (gt_perf_status & (GRAPHICS_VER(i915) >= 9 ? 0x1ff00 : 0xff00)) >> 8);
>> +	drm_printf(p, "Render p-state VID: %d\n",
>> +		   gt_perf_status & 0xff);
>> +	drm_printf(p, "Render p-state limit: %d\n",
>> +		   rp_state_limits & 0xff);
>> +	drm_printf(p, "RPSTAT1: 0x%08x\n", rpstat);
>> +	drm_printf(p, "RPMODECTL: 0x%08x\n", rpmodectl);
>> +	drm_printf(p, "RPINCLIMIT: 0x%08x\n", rpinclimit);
>> +	drm_printf(p, "RPDECLIMIT: 0x%08x\n", rpdeclimit);
>> +	drm_printf(p, "RPNSWREQ: %dMHz\n", reqf);
>> +	drm_printf(p, "CAGF: %dMHz\n", cagf);
>> +	drm_printf(p, "RP CUR UP EI: %d (%lldns)\n",
>> +		   rpcurupei,
>> +		   intel_gt_pm_interval_to_ns(gt, rpcurupei));
>> +	drm_printf(p, "RP CUR UP: %d (%lldns)\n",
>> +		   rpcurup, intel_gt_pm_interval_to_ns(gt, rpcurup));
>> +	drm_printf(p, "RP PREV UP: %d (%lldns)\n",
>> +		   rpprevup, intel_gt_pm_interval_to_ns(gt, rpprevup));
>> +	drm_printf(p, "Up threshold: %d%%\n",
>> +		   rps->power.up_threshold);
>> +	drm_printf(p, "RP UP EI: %d (%lldns)\n",
>> +		   rpupei, intel_gt_pm_interval_to_ns(gt, rpupei));
>> +	drm_printf(p, "RP UP THRESHOLD: %d (%lldns)\n",
>> +		   rpupt, intel_gt_pm_interval_to_ns(gt, rpupt));
>> +
>> +	drm_printf(p, "RP CUR DOWN EI: %d (%lldns)\n",
>> +		   rpcurdownei,
>> +		   intel_gt_pm_interval_to_ns(gt, rpcurdownei));
>> +	drm_printf(p, "RP CUR DOWN: %d (%lldns)\n",
>> +		   rpcurdown,
>> +		   intel_gt_pm_interval_to_ns(gt, rpcurdown));
>> +	drm_printf(p, "RP PREV DOWN: %d (%lldns)\n",
>> +		   rpprevdown,
>> +		   intel_gt_pm_interval_to_ns(gt, rpprevdown));
>> +	drm_printf(p, "Down threshold: %d%%\n",
>> +		   rps->power.down_threshold);
>> +	drm_printf(p, "RP DOWN EI: %d (%lldns)\n",
>> +		   rpdownei, intel_gt_pm_interval_to_ns(gt, rpdownei));
>> +	drm_printf(p, "RP DOWN THRESHOLD: %d (%lldns)\n",
>> +		   rpdownt, intel_gt_pm_interval_to_ns(gt, rpdownt));
>> +
>> +	drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
>> +		   intel_gpu_freq(rps, caps.min_freq));
>> +	drm_printf(p, "Nominal (RP1) frequency: %dMHz\n",
>> +		   intel_gpu_freq(rps, caps.rp1_freq));
>> +	drm_printf(p, "Max non-overclocked (RP0) frequency: %dMHz\n",
>> +		   intel_gpu_freq(rps, caps.rp0_freq));
>> +	drm_printf(p, "Max overclocked frequency: %dMHz\n",
>> +		   intel_gpu_freq(rps, rps->max_freq));
>> +
>> +	drm_printf(p, "Current freq: %d MHz\n",
>> +		   intel_gpu_freq(rps, rps->cur_freq));
>> +	drm_printf(p, "Actual freq: %d MHz\n", cagf);
>> +	drm_printf(p, "Idle freq: %d MHz\n",
>> +		   intel_gpu_freq(rps, rps->idle_freq));
>> +	drm_printf(p, "Min freq: %d MHz\n",
>> +		   intel_gpu_freq(rps, rps->min_freq));
>> +	drm_printf(p, "Boost freq: %d MHz\n",
>> +		   intel_gpu_freq(rps, rps->boost_freq));
>> +	drm_printf(p, "Max freq: %d MHz\n",
>> +		   intel_gpu_freq(rps, rps->max_freq));
>> +	drm_printf(p,
>> +		   "efficient (RPe) frequency: %d MHz\n",
>> +		   intel_gpu_freq(rps, rps->efficient_freq));
>> +}
>> +
>> +void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
>> +{
>> +	if (!rps_uses_slpc(rps))
>> +		return rps_frequency_dump(rps, p);
>> +}
>> +
>>   static int set_max_freq(struct intel_rps *rps, u32 val)
>>   {
>>   	struct drm_i915_private *i915 = rps_to_i915(rps);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
>> index 4509dfdc52e0..110300dfd438 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
>> @@ -10,6 +10,7 @@
>>   #include "i915_reg_defs.h"
>>   
>>   struct i915_request;
>> +struct drm_printer;
>>   
>>   void intel_rps_init_early(struct intel_rps *rps);
>>   void intel_rps_init(struct intel_rps *rps);
>> @@ -54,6 +55,8 @@ void intel_rps_lower_unslice(struct intel_rps *rps);
>>   u32 intel_rps_read_throttle_reason(struct intel_rps *rps);
>>   bool rps_read_mask_mmio(struct intel_rps *rps, i915_reg_t reg32, u32 mask);
>>   
>> +void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p);
>> +
>>   void gen5_rps_irq_handler(struct intel_rps *rps);
>>   void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
>>   void gen11_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
