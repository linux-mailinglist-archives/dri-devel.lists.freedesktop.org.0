Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E520464F2F4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 22:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEA710E632;
	Fri, 16 Dec 2022 21:06:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DDE10E631;
 Fri, 16 Dec 2022 21:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671224790; x=1702760790;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6rFIv0bnxvBZoaD1uwPm9PoR3la5kARLfaP/JLVTl48=;
 b=bjfCmYcJqgR9Gp0On171qgFMpMkMF8QNIq+UX5QDWQfq8fzV5OfxCRCe
 j0sSbP45T1cyJ2N1R6a9CeHsvD1L83hWUGlrSgojkjYPkyre4Cd1rJEJH
 gAKMEJ/CODUSiM0TNiea6aPJkPQRtlOvZ1JEkZgSueNPFjq2iaIupLvW1
 2jre/t9xliAlO0GyUWrRZKwqqr2Ae6SJm2mE/iXG2m92fi8Q4hO+8fw4H
 PZ8UopOioiKOFbA1R/2SwdL8IU9EqJ5xK3MkmYJIueyDHHrjUdWBzn7Zs
 0kMFOtnJre4zopKNCe5NtGxtoyFm4CJ5duXiPpCLpckEEEfRmcsJTZxy+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="381278689"
X-IronPort-AV: E=Sophos;i="5.96,251,1665471600"; d="scan'208";a="381278689"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 13:06:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="643391260"
X-IronPort-AV: E=Sophos;i="5.96,251,1665471600"; d="scan'208";a="643391260"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2022 13:06:29 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 16 Dec 2022 13:06:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 16 Dec 2022 13:06:27 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 16 Dec 2022 13:06:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFuwuW03GBdGK7/ZYkPcnb6HivOgMt0mQ34xvxgIlKF9zZCC6xbqQRWbBIKODDX8bK914AOsRRaCnj/QoH+aSnbdW8xLkyBfbTkCRZqfyPa82d5TLRtUg/gCzEO+M1ubBLD9s0dwVW7QMeorSlnK+6taAS7UpuCbTlDGxR/qS7u1dihV+28s9+E9txW/S6EcazKhgNHSw/0UKZWPYKZjNu/IV+xP+SjTzIczGrClp+vcJ7WfwIuNvGxkUs4bMOsmWki7FqL00BP82luoMjPmGg1bSZ+ZiUVmcDubguuhAM/L5EL5VZhnjul1bPMT0/ra99GRYvltNbJ+POGbPodt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pV1+d92I1EAwMYIjIAUohz1sxDgy3ODMCRUSYGAHLo=;
 b=ibjMLyya5WUfs0rSNBszhx8RTbe8YKJb5MjNX2uOeAvGOAxXwkUuWCUXkcNnpmLAIxzigy2Ut9GGxBtCe4U9MdeRLi/55MXaJYnXSe6O5LLvGa4sHX7y9Ai73IiNz7wRQIxDs7/cKee+EUgf0E97Gy4ZI3mk+HqBbGYvPpmALwNK83rfUVDvCK2LUO3UVZW+p0YlnmpAMIVbZgjkhcvhL3XpzHL26lAFMKmndermntItgpL9VBW3AR4EUqx+V6V2SimMI1YnqKN7td+UldFJzejuxIw1vOsIqHvIJErmftqkB2QdEGzYrvC14U4BG09yb7xrmuXm4+yg9nDatmY/JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 21:06:25 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610%7]) with mapi id 15.20.5880.021; Fri, 16 Dec 2022
 21:06:25 +0000
Message-ID: <ffbb8a44-d88a-46c3-308e-a4156ba0721d@intel.com>
Date: Fri, 16 Dec 2022 13:06:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915: Allow error capture without a
 request
Content-Language: en-GB
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20221129211253.3183480-1-John.C.Harrison@Intel.com>
 <20221129211253.3183480-2-John.C.Harrison@Intel.com>
 <Y5fa1w2yIUVgBhyp@unerlige-ril>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Y5fa1w2yIUVgBhyp@unerlige-ril>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DS0PR11MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: aea6ccbd-b6a4-42bd-b24a-08dadfa96456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0/BlLOlolpmnxwMDU8pxcOFAMjB0UpWGYOM7BCSF+Ic7Dk7PWE/j+nzK2VELROYiR52lQIlvBsFmU2/Ddx562ISuuKr9fQuYR8C8AkQy16hF4wEHJGifSr0RFxISV5elgXGFLph7WwFfYd8C99dJ5Ktb48GGFsywmot6jvK7rC9SBdBIoE1wpd5bKBeCRiMs2gILtGEmwwAzbfmvwGeRwPSA/fMgBjrA56wM8kxRoZ/T7hz5DYuoxC5MBizLH+6+q5ltWFwY/ElCmv/2Dp9aXiW+TyeoSzFT33dPqGo7e5N4BhuamIFwISMBFQEXMELxiOClPBVdWYY2m4BHKJywGpNEzjbf1HIYRXuNesfL9oqsWxMHAODGkhlcjIgFmATmehc1LXE5ax4G/UKbIq6XZ4MgKzrpMCYiF+ODOaxABUh2At5tmTtCuFcEL40451zXfhx1XO/WUP8W6vybykgIzPVcy6u/WAvaltRdDVPCi27Q/6Gl3tYw1KbCgwzkB90J8YhwSji3kbko1NRTzcIWl6LbUcvIS7aSWB5mVv4ouJy0QYB4fYnEpc60C/qo3ius4+yQ1LckdHy3uGri4RmctPbanpwYDNbgyu3REOh9WV87CMV6RRjqtDrcOa5nT3MFH1PAZ6Ip9DOml4pqPyOaSxJaLaa7vZRxFQNHamE51av6DNx0p9w+xgFP+wQ+Q0apHXN22IWV+SzOyZA2NcjL/0OhjUuUZiyzMEO6FyrJ8o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(6486002)(6636002)(31696002)(82960400001)(4326008)(316002)(8676002)(41300700001)(36756003)(66476007)(450100002)(37006003)(66556008)(66946007)(2616005)(86362001)(83380400001)(38100700002)(478600001)(6506007)(26005)(6512007)(186003)(53546011)(5660300002)(2906002)(31686004)(6862004)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qkk1bHRkU2xXZy9Ucjh0LzJaOFVsSXd6S0NKbWxvNnZ2UmpkMzF4VkpsTUhj?=
 =?utf-8?B?TXlVaEtoT2c0MkhvY3d4R0lHdTQyOUFyMUl5QVJvZFM1cmxWL2Z4Rk4zSy9I?=
 =?utf-8?B?VGxMbjU4TmJEUFUxMnN1OFdaYnprbVdFR0k5Y3pNUWVtY0EvKzlpVVRCd01G?=
 =?utf-8?B?U2NOTHNNM0p5bElKdDEvQjBrRFE4MmVDTDdrYmdROW5TNnRzMXJFZ3VBaTV6?=
 =?utf-8?B?RVFmNDh0SlptbWpXS282YVN1S2t6WkdVRzlwa3Y3bmpVUUtMZTJiUUsxejJi?=
 =?utf-8?B?aFJNemkrcU0zSm5BK3k1S3U0RVpDeHZZTTNVY0VEd3pEUmdIZENQM3VRTldI?=
 =?utf-8?B?TmhYeHdITThEdVVCM1k2cXFqcHVKcnBPbGlNVUhicXVvTGk2WEJ6U1gxYlc3?=
 =?utf-8?B?QWtrRjBVdzcrRmU3cExqd1VOSzhGbVEzMEpnTzFpOFJGY01nWmhvTWwrckQw?=
 =?utf-8?B?aWdEUzJ5MWVENGdCdlAvU1NqUkxkT1VnMFczT1VNdWVCZWFma2krNDJrZGN5?=
 =?utf-8?B?bjFBVVRvVVlpT0VBS3R2SFpCK1Q1TlhXOG03cUdlVVVKTG5rczVia1NMOVlW?=
 =?utf-8?B?UHJxanowS00ySVdJU2VQaTZldi81aFdURHphZ3FmTDZLdXJHMzM0bVZNc0d4?=
 =?utf-8?B?WHlzejBTQ1NYOFE0SHQ1WGJ4L2QzOGdXQ2l0c3M1OGRtSUI3QnhRVVlyYVJl?=
 =?utf-8?B?TXE2aUl3K0pHSk5CMHBGRGZncUt2bzRPbVVKeWxrTkdreTQ1Z05jM3JYTTMr?=
 =?utf-8?B?OUVwYUhtTTN3TjlwMWdVci90bVR3bnVCeFNLcVlKYnUyZWx0WEJnSm94WlZV?=
 =?utf-8?B?NTJ0N0lkRUtQc3hqbWlXa0NHTjVjUC9iUGpoempla3JVd05NYkdpbXNXMzNB?=
 =?utf-8?B?RG8xaC9vZDYyMHl6MHoyY1IyMndibGYyeS9aQjQ0ZmFrL1FhaCtHK2FZdWVQ?=
 =?utf-8?B?eTB2ais2eVl4STE0bmUxVFdGcTVPS2lsaEVHdEV5MUEraURHZzVSYjZibTgw?=
 =?utf-8?B?ajI3d3VqYTRVNVRRcHZ4UnpkTHByaTcxR0pHTnJuNTUybXpnNi9sOUF2TFdm?=
 =?utf-8?B?YmhTVCtyWmRWUzc1Ni9EL2tQYWRvVFhXbXZOUCs4NkYyQU5OaVFrRm1HcHAy?=
 =?utf-8?B?cHFabUVDb0ZtRlJkd0dHSk9NTnk0ZkllaHlBeWIwYTluWGtRVEdtNndabE1z?=
 =?utf-8?B?aG9RYTFDUnpBYVhWKzFma2pQWm5hZDBPODVmdXRSTFVuWUxremRaMmNvZ3Jn?=
 =?utf-8?B?NTY3RnlJWnRwMVJ0dVUrZm5uZUkrWVZPSXpwekxxUHFOSFd6Qmw2ZGlQb3U5?=
 =?utf-8?B?czZtR2NoVndnOHI2amhJcVdodlE2MC9sV09pOUcraFdCOEw3RkZHbWtYdGVv?=
 =?utf-8?B?Q3JSV2ovWlRWVlRqV0lPWHhGNkJIUU1DMlVpMDNyV0dNV2ZEUklPZ0RLMHBj?=
 =?utf-8?B?Z2FWZVVTSlViUUdObjJwM3A2NUFPN1FSOFN5YXR2TDhDK3M2RVltMWFydldN?=
 =?utf-8?B?VEU1cS9STDREWG9FL1Zac3BkUitSREtrTStaajlTcDZ2bmJwZUhESzFtZTQw?=
 =?utf-8?B?bFJocHh5bkRGeWtFdVZqMlNXVW9KL3RyOEFjdlRCV3g4czB3T3pINlFxeTF6?=
 =?utf-8?B?cGVFaDZWYk1jalRLRW5KWEVyY0tYVSs5cDhNT1ZvekpnWXlMWmxBUTdVOE0z?=
 =?utf-8?B?ZGd6Wmo2NHBoRTNTZXRGcy82TndPN2xOMThMSkhBWTZHTW5SdzNFdHFySkZz?=
 =?utf-8?B?Q3d1QlF3QTJMR3JrU2ZQUkRxblVrTURUS0dZTVp2a0ZNQVVjaVNLck4wY0U3?=
 =?utf-8?B?USs1M2xrOXRXSVRsUndyWmh6RzlFcTBFekVGYUZUV2UxSUsveERSVFNWbW1M?=
 =?utf-8?B?WUZUNmdTbXhtdnRtVkNFN3JwUkZhckttdnExYXQ4K0lSRW5RNGcvQ2V2cFhH?=
 =?utf-8?B?RDBSOW1JdGNDbU54MitVUzhrTjkzVkRMS2RmZVdZVkRkNzhILzAvdXBGUURX?=
 =?utf-8?B?MkZUWVJOK0RiWmpHcU9heHlMbkQyZ2VxekI5YmVkT0hZUlZTYXUrUXFIMm1G?=
 =?utf-8?B?L0pzaXozaHhOcmgvazNEQUVaUDgxQjdsa05mNk5xbUFvWmxGM1drZXB1Ungr?=
 =?utf-8?B?YmtvUm9BZFB1RlZWTGNqY0gwS0J6MnY1NFdRWnlKUE1VU25FNjBhYVNwaldX?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aea6ccbd-b6a4-42bd-b24a-08dadfa96456
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 21:06:25.3935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0w7NRvMSUr5A7A+zf+4JOYGHTmCVbZpAQ8RJ0DohklVnvxcGZZR5AswfQHzuvGmg4F4QUJ7IH3Ma2nJ+V6aszYCGQW+wgEnwd3NqieWgpY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7880
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/12/2022 17:52, Umesh Nerlige Ramappa wrote:
> On Tue, Nov 29, 2022 at 01:12:52PM -0800, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There was a report of error captures occurring without any hung
>> context being indicated despite the capture being initiated by a 'hung
>> context notification' from GuC. The problem was not reproducible.
>> However, it is possible to happen if the context in question has no
>> active requests. For example, if the hang was in the context switch
>> itself then the breadcrumb write would have occurred and the KMD would
>> see an idle context.
>>
>> In the interests of attempting to provide as much information as
>> possible about a hang, it seems wise to include the engine info
>> regardless of whether a request was found or not. As opposed to just
>> prentending there was no hang at all.
>>
>> So update the error capture code to always record engine information
>> if an engine is given. Which means updating record_context() to take a
>> context instead of a request (which it only ever used to find the
>> context anyway). And split the request agnostic parts of
>> intel_engine_coredump_add_request() out into a seaprate function.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>> drivers/gpu/drm/i915/i915_gpu_error.c | 55 +++++++++++++++++++--------
>> 1 file changed, 40 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index 9d5d5a397b64e..2ed1c84c9fab4 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1370,14 +1370,14 @@ static void engine_record_execlists(struct 
>> intel_engine_coredump *ee)
>> }
>>
>> static bool record_context(struct i915_gem_context_coredump *e,
>> -               const struct i915_request *rq)
>> +               struct intel_context *ce)
>> {
>>     struct i915_gem_context *ctx;
>>     struct task_struct *task;
>>     bool simulated;
>>
>>     rcu_read_lock();
>> -    ctx = rcu_dereference(rq->context->gem_context);
>> +    ctx = rcu_dereference(ce->gem_context);
>>     if (ctx && !kref_get_unless_zero(&ctx->ref))
>>         ctx = NULL;
>>     rcu_read_unlock();
>> @@ -1396,8 +1396,8 @@ static bool record_context(struct 
>> i915_gem_context_coredump *e,
>>     e->guilty = atomic_read(&ctx->guilty_count);
>>     e->active = atomic_read(&ctx->active_count);
>>
>> -    e->total_runtime = intel_context_get_total_runtime_ns(rq->context);
>> -    e->avg_runtime = intel_context_get_avg_runtime_ns(rq->context);
>> +    e->total_runtime = intel_context_get_total_runtime_ns(ce);
>> +    e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
>>
>>     simulated = i915_gem_context_no_error_capture(ctx);
>>
>> @@ -1532,15 +1532,37 @@ intel_engine_coredump_alloc(struct 
>> intel_engine_cs *engine, gfp_t gfp, u32 dump_
>>     return ee;
>> }
>>
>> +static struct intel_engine_capture_vma *
>> +engine_coredump_add_context(struct intel_engine_coredump *ee,
>> +                struct intel_context *ce,
>> +                gfp_t gfp)
>> +{
>> +    struct intel_engine_capture_vma *vma = NULL;
>> +
>> +    ee->simulated |= record_context(&ee->context, ce);
>> +    if (ee->simulated)
>> +        return NULL;
>> +
>> +    /*
>> +     * We need to copy these to an anonymous buffer
>> +     * as the simplest method to avoid being overwritten
>> +     * by userspace.
>> +     */
>> +    vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
>> +    vma = capture_vma(vma, ce->state, "HW context", gfp);
>> +
>> +    return vma;
>> +}
>> +
>> struct intel_engine_capture_vma *
>> intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>>                   struct i915_request *rq,
>>                   gfp_t gfp)
>> {
>> -    struct intel_engine_capture_vma *vma = NULL;
>> +    struct intel_engine_capture_vma *vma;
>>
>> -    ee->simulated |= record_context(&ee->context, rq);
>> -    if (ee->simulated)
>> +    vma = engine_coredump_add_context(ee, rq->context, gfp);
>> +    if (!vma)
>>         return NULL;
>>
>>     /*
>> @@ -1550,8 +1572,6 @@ intel_engine_coredump_add_request(struct 
>> intel_engine_coredump *ee,
>>      */
>>     vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
>>     vma = capture_user(vma, rq, gfp);
>> -    vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
>> -    vma = capture_vma(vma, rq->context->state, "HW context", gfp);
>>
>>     ee->rq_head = rq->head;
>>     ee->rq_post = rq->postfix;
>> @@ -1608,8 +1628,11 @@ capture_engine(struct intel_engine_cs *engine,
>>     if (ce) {
>>         intel_engine_clear_hung_context(engine);
>>         rq = intel_context_find_active_request(ce);
>> -        if (!rq || !i915_request_started(rq))
>> -            goto no_request_capture;
>> +        if (rq && !i915_request_started(rq)) {
>> +            drm_info(&engine->gt->i915->drm, "Got hung context on %s 
>> with no active request!\n",
>> +                 engine->name);
>> +            rq = NULL;
>> +        }
>>     } else {
>>         /*
>>          * Getting here with GuC enabled means it is a forced error 
>> capture
>> @@ -1625,12 +1648,14 @@ capture_engine(struct intel_engine_cs *engine,
>>     if (rq)
>>         rq = i915_request_get_rcu(rq);
>>
>> -    if (!rq)
>> -        goto no_request_capture;
>> +    if (rq)
>> +        capture = intel_engine_coredump_add_request(ee, rq, 
>> ATOMIC_MAYFAIL);
>
> 2 back-to-back if (rq) could merge together,
>
>
> otherwise, lgtm
>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
> Umesh
There was actually an unconditional put of rq just after the block 
below. So will need to repost to fix that anyway. Not sure how it didn't 
manage to bang when testing captures with the rq forced to null!?

John.

>> +    else if (ce)
>> +        capture = engine_coredump_add_context(ee, ce, ATOMIC_MAYFAIL);
>>
>> -    capture = intel_engine_coredump_add_request(ee, rq, 
>> ATOMIC_MAYFAIL);
>>     if (!capture) {
>> -        i915_request_put(rq);
>> +        if (rq)
>> +            i915_request_put(rq);
>>         goto no_request_capture;
>>     }
>>     if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>> -- 
>> 2.37.3
>>

