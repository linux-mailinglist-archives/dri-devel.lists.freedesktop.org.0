Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 955E6583685
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 03:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C4512A54C;
	Thu, 28 Jul 2022 01:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D718EC8EA8;
 Thu, 28 Jul 2022 01:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658973031; x=1690509031;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FXze6oWGGYxxoMCP9ekqNTswu8AckWIuzQ4Bi/ao0Zs=;
 b=P/Y0KM7s1XXIV96ONUNqx3LyoxaGtnnuIr7siAljYOJd0q72HQvNaT3Z
 NOWDpH6rLZ5GP3kdA5ZhZiZyo6l2XS3plyxoWUvwm2/ZSIW7ykTvgnBXr
 k7g7gGKN/ICENFmH/mbK4YtMkCCLjpf9ndsAwyxbBhzL5hMrwqZcucbBg
 7ni4PVJH4c7Md4Uv/GCLpVfNPFgx7VqYqtLpnksOmrlxWsbTzdIfIn8XX
 E9YJBBzUp3fGBjmQhx0HejfyCLIWjdnefANeDCGgYTEj+hdDd64cimGti
 vT6khlfVAMiOwjDMTowObzfHtDi4FPHLfJRZw4Z4x4Bs5SlXhoLeKaFGe A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="288405460"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="288405460"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 18:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="551077418"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 27 Jul 2022 18:50:31 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 18:50:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 18:50:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 27 Jul 2022 18:50:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leB3BoRo6YJQYdaH5nRVtoQSgC8lGpHyGvwOxojTFuqNOdxpF5j4Pw/0C8hWg6LUUSjxsFpxwO8qDlvoRVc9SWnXFfyxqufX5BK/8DBwP2WEnchSq2nwfYIYH0ZS7XX79cS83c/k8wtyJOAO2szVwx6Gr8Y+ZhuO4lUecdfxtsagWsztb8iYMb6SbCLSnEio36U/CnkwYD/HhYzuXJCFnGh+DpD0gMOr7PM1fs6vCzm8leHKbFXiqIKpoYFGk5RHsiKUoU9C0FIpdlE6o4PvTucFY3+OYJWhmu6EnIOJYZd/tJo9ij1wm3dOksiKNOuAInazYK/VAKIKyzN1FTrkjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPeok2HGMfKpXHZnHOiTCkTy/eSTB0mBumFrbBwE46M=;
 b=An2F/EjL7PtadzkGFfwxb+iTnwTUxK0fGrvFVBP1gqmQSAbJM6SjfWKR+WXfUXxrtslZGBpyDNxoaK9CGbd4HrXzfZH9TqGVos3a8BI4N0pmIDceQcjEzCsu3a3h+FbFLUeCWY4TVfBWdpBvYLpZ9RVd9b6l1atcfgEkLtLFkaBTF9lLtzWWWchQdEQ0woswVEEP8r1VerDYSL1IVfIXPCcEpiodGEzOBFjHYUx+Yp8DvcJAPwXjgsVTii6E51ipZgpS1+E2Q5pi5t4KDlWI7dPhxPptVTrW88Yzw18n9ONhny/n09TND41j5iAVbdN8hXO1A6GSXkvB9DQkmVK+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.6; Thu, 28 Jul 2022 01:50:29 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c97:4423:7f0c:2300]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c97:4423:7f0c:2300%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 01:50:29 +0000
Message-ID: <086bd24f-aa89-055a-ebd2-792b215eb67f@intel.com>
Date: Wed, 27 Jul 2022 18:50:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/i915/guc: Don't send policy update for child contexts.
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220728003339.2361010-1-daniele.ceraolospurio@intel.com>
 <1e05b82e-b19e-644c-c1a6-614de643dc64@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <1e05b82e-b19e-644c-c1a6-614de643dc64@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16331d5e-d71e-468d-5cbf-08da703b8c96
X-MS-TrafficTypeDiagnostic: SA0PR11MB4525:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EB3AE5iELC+jGXTZofSsLBNB0hs+YuCUuFd/SEycjZ4lM2KCqVSwaDEGTFWzQKiNIhcCDBNyFUED4+vlBZvJZsD8kzznHd5Ma6Qx4IRhPY53Mu30yj/93K52ffckKAKGi625q9Js1cbwdJCzkd/IidMXhXuARxXefpKvTsgN7F0v6ijEix+bcVo7erhbXFy4/txTWicbARhDnWY6AGfusSKDilHfo42dq67/ZmUikMzcVBlBYBFcB7hpijCUflswdWWibcqbmLdje4QXl//nZq3kTUHgvXVY5Dks2uQz4eGx6KPMKzdZej1297VZXS1U++ypgIGVvOTqNwiCjNe72Dh3SByHUXxURNmXMviLSD6u26btCqv3aybZ7fsng3lwTD+qZGBJ6AqyjLaT5h2dLLtMJAOOSx/ZCipfvQ4R5Mx+2gE43VGWbNMLHqgL6HhinE9MkW+HDofSsSr38OoBKKr3nGknclT+bZOom2y8oULlYinChed02Q51y6GcgcKhT6D34MTiZ/xecczO3We44aDR0bViYeJ7N1IGabYz7KBdSbNF57kgaIB3Chm0FFPl/Ie2CiFc9p9oLqZmticnDd+JC96uq50thSC3EaTacyjP92oAKMDJ9TcB/NN59cp1oTodZpBNSUkrbive1kE6G2zVrYIvnyuNHluGqOHNPcMiB55xyle2NylmPy/2PMpNmIDiT0Yo3kMqd4jdFXEUMKmaB6sJ/m4tsQBtu5M1TSWTX2ZCW3jCcgYaEAWTivePqa39eFUFAEdglCpyMf+cSRWEeggmMe8PJ6qOHTUFqL3QyS+WEfjDZbzxysf0TuMqOvzbZqZrQowxN9oOhZ7geA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(396003)(39860400002)(136003)(346002)(38100700002)(36756003)(5660300002)(8936002)(6486002)(31686004)(66556008)(66946007)(66476007)(8676002)(4326008)(316002)(15650500001)(478600001)(2906002)(82960400001)(6512007)(86362001)(6666004)(41300700001)(53546011)(6506007)(31696002)(26005)(186003)(83380400001)(450100002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEVCRCs3SGZBbThZdVJqN2pPTHR6SU1SZ3AxdXZiMHlIOUhXQ2R3Vk95dmtr?=
 =?utf-8?B?a3JOZUFIWnhXSVVEbnBVak91QUlZcUhEelp5MHF3cFhpd2E2WHJ5OURvZ2gz?=
 =?utf-8?B?Z09zMWUrSUd3bmhBZ2dicXVOWUd5ZmRlQTlQZldDZDk1WjNOSHg5c3NkdXhs?=
 =?utf-8?B?Y0xvQlMzbGNOb1lQVm1McFZRZ2NSa2cwbTFRR3JNaEJaYUU1SEFteVFYSjY3?=
 =?utf-8?B?eUxpb1lYbW5GZUh6NVdsTHEzL1ZjRHV3SXRpcVk3OXRsYlpseXhMc2tMYW01?=
 =?utf-8?B?K09LSC81MWxMMWlySVhuN3Y1REJ3anhNV0MzV3BuOHEyQVJ0djk5aDVmR2JT?=
 =?utf-8?B?cXU2b2J2SStUU1ZiNnRqRXUzUnJDQXQwcXcwZHlTRDh3c1hVTGFvMStWa3FW?=
 =?utf-8?B?QkpSZHhiM05kTFJoUUd3aWFDN3B0ZXpPWVVtY2I3WHprNU5xOW1FMHJxVGR1?=
 =?utf-8?B?UElFM3VXcExVaGNhRnJIcjQ4SVVYWU50Wk9SYWx4RGk2V01PejZ5Zk5QdW1o?=
 =?utf-8?B?QnhtRURGa0NPMUIwUTJNYjkzU3ZzdGgxU2JxSzhhRTVGM2QxQ0VRZ0NXVXlz?=
 =?utf-8?B?Q29wOStFRkhYRTR2VDNzWTRuSHdSVnJmaElJUmdsWnlhdU1zYUk2SnNsb0hJ?=
 =?utf-8?B?SWtDMmI4RW8vYUF6ZUtrd1k1L1J5OE1XclpzNjR2QXM1cmIrTzloUDhVY3px?=
 =?utf-8?B?c2h4anNoaXFJdnYrdG9HM2JycVRESUprY3V1Qm9CeEdDUG5NeGF1aEVsdjdJ?=
 =?utf-8?B?NUhnQ241QVQzdEtOZDVqMG0yNGNxNnRHQ256VDd2blZ3VkVic0hzcHZIeHVC?=
 =?utf-8?B?ejNIRFJacU5QT3F4NDFIY09RaGtPVWwzT1poTFRmV3lwYUlpZm96My95czZK?=
 =?utf-8?B?WFVxd1NsWnFSM2MwaW5wWmcxM1g3cDV5RDh0OUhjZ2JLcitwdURvb0FwcXhy?=
 =?utf-8?B?eEZvRzJNUDVrL1BsTy9rcm0wbDBrTWRDOWlBNTBnRTFqOXRFK1RybVllNDA0?=
 =?utf-8?B?Nm04clJpaVhQVmFISW80RHFoWmZCYmlPdis5MmRGQ2llWjhzS25qU3hLSHZ5?=
 =?utf-8?B?WGl1OGY4bkwrbXk4QXpWK2pEYjI0cTh4RlV6NlB3VXZWbjhrYjRuRFJESjFC?=
 =?utf-8?B?UHhucUNkR1hVbG9IYTNFM2pxcjNPK2lZaktsNTR4NnRSQ1J3OC9yaWxzZy9U?=
 =?utf-8?B?R28wTDRqN0ZoMWZHQTdRMW9LNzA5VlIyM0FENDRmMDZwbGtwS0NJc0VZcC9m?=
 =?utf-8?B?YTEweHZKdGQzUVRqaE1TZmg3TkNJN3MveXYvN2ltSlEzY2NPZnpnSWJ4N002?=
 =?utf-8?B?TGMyVlRFekQ4RkRrd21ENGxyOHFUazRRRmRYcm5pWmZwLy9oTFJNVy9JYkZm?=
 =?utf-8?B?TGVnOUg2SkJtVnJxTENxV3REdkpnaUIvVVdIRjJoZnRqTklSeXROTGpaSURK?=
 =?utf-8?B?Yzh0eEs5YkZJY1JCVXdSM0huZ1dIRFhJdjVkQVhlV0lMY0VUM0JQb0ZUSzJm?=
 =?utf-8?B?VFZNdXd0bldFL0hNMkF4djFYRkxPUXA3NEpVajcwYStJd1lNZnJ2MjMrWFg1?=
 =?utf-8?B?cW9kZk1JUGJqSXpHbC9VMmVKSlBQbldlZEJIRVpLNkplb2NFc1pnMGE0cFkw?=
 =?utf-8?B?NWRwREk2OW1xT2JJWEExRlhsSTJmQWN6OFZtQTJFRDg2ck8ybjBRMWFsMTNV?=
 =?utf-8?B?eUQ1YkpaamhiTk9ucTJTUEtaTDNlWWp3V0huMDRBSUVtc1lEbW5zMnNuRDF5?=
 =?utf-8?B?Y3RpYUlsU3VQVk85V3AyVmJ5UDhTWXBmUGx4TGMvc3pJNFdOVUVKWElQK0d3?=
 =?utf-8?B?dmhaTEIrb0FXTzQ3THdPZzJMV09aRXZRTG1NQXFLQ2FGQUpEdVllSThNNzIx?=
 =?utf-8?B?d3YvL0UzeWM4UEM4RXN1Q0lYS084NE5GdThnUEJGRG9hc1hoQUQzQXlJeTlB?=
 =?utf-8?B?Njl1K0hXdWFibmVYQmY2L1pHNDkzWlV0TnVJVk16R2NDczQ3WFhLMXRaUmZw?=
 =?utf-8?B?eFdrZ2cvdi80NHV3WmE1TFE3ODZIaTJuc0R5YnpHdnIwYnpIZmcvUVZBTVZl?=
 =?utf-8?B?a0RuQW1ETG9PTE9HQml4WDFwa25NemJNeE1xczJJR25aQXpEMEVCNE1wblJS?=
 =?utf-8?B?UlJ5ZlVSVkNIdDlzcVlodERFTUxUbjJLeUdFa3BjMSt6dGVSVVV3RGxFM0hO?=
 =?utf-8?Q?EpIKBZFsAPs72Yl3daRSVuA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16331d5e-d71e-468d-5cbf-08da703b8c96
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 01:50:29.1798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPc8bmoyn22gqtq2BtcBBY2Tt0QX3x/WXXeylSN1isWaf58IXcEysZdmEEm6a3fyxzc47c+AhNRbPLGCk96NIGmIzL+mhCJYyQBEyduI500=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/27/2022 6:44 PM, John Harrison wrote:
> On 7/27/2022 17:33, Daniele Ceraolo Spurio wrote:
>> The GuC FW applies the parent context policy to all the children,
>> so individual updates to the children are not supported and we
>> should not send them.
>>
>> Note that sending the message did not have any functional consequences,
>> because the GuC just drops it and logs an error; since we were trying
>> to set the child policy to match the parent anyway the message being
>> dropped was not a problem.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
> Needs a Fixes tag for the original v70 update patch?

I don't think so. I added the explanation about it not being a 
functional issue to make it clear that everything still works as 
expected without this patch, just with a bit of extra noise in the GuC 
logs. If you think it is still worth applying to older kernels I'll add 
the tag in.

Daniele

>
> John.
>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 26 +------------------
>>   1 file changed, 1 insertion(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 76916aed897a..5e31e2540297 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2420,7 +2420,6 @@ static int guc_context_policy_init_v70(struct 
>> intel_context *ce, bool loop)
>>       struct context_policy policy;
>>       u32 execution_quantum;
>>       u32 preemption_timeout;
>> -    bool missing = false;
>>       unsigned long flags;
>>       int ret;
>>   @@ -2438,32 +2437,9 @@ static int 
>> guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>>           __guc_context_policy_add_preempt_to_idle(&policy, 1);
>>         ret = __guc_context_set_context_policies(guc, &policy, loop);
>> -    missing = ret != 0;
>> -
>> -    if (!missing && intel_context_is_parent(ce)) {
>> -        struct intel_context *child;
>> -
>> -        for_each_child(ce, child) {
>> -            __guc_context_policy_start_klv(&policy, child->guc_id.id);
>> -
>> -            if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
>> - __guc_context_policy_add_preempt_to_idle(&policy, 1);
>> -
>> -            child->guc_state.prio = ce->guc_state.prio;
>> -            __guc_context_policy_add_priority(&policy, 
>> ce->guc_state.prio);
>> - __guc_context_policy_add_execution_quantum(&policy, 
>> execution_quantum);
>> - __guc_context_policy_add_preemption_timeout(&policy, 
>> preemption_timeout);
>> -
>> -            ret = __guc_context_set_context_policies(guc, &policy, 
>> loop);
>> -            if (ret) {
>> -                missing = true;
>> -                break;
>> -            }
>> -        }
>> -    }
>>         spin_lock_irqsave(&ce->guc_state.lock, flags);
>> -    if (missing)
>> +    if (ret != 0)
>>           set_context_policy_required(ce);
>>       else
>>           clr_context_policy_required(ce);
>

