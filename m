Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D6F42CA26
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 21:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F276E07D;
	Wed, 13 Oct 2021 19:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A463C6E07D;
 Wed, 13 Oct 2021 19:35:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="313714166"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="313714166"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 12:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="659660057"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 13 Oct 2021 12:35:11 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 12:35:11 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 12:35:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 12:35:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 12:35:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNqXeUYbd12O/oKFyNu1VUuEXfhK8UUvdlXjwWd+9Gb6uxZYErswY6UU6yJqhxUmBFYH4uJ36rJf96KvmpwN8BhpyNxcxEykbkdbDnYdSTsv3E9OqXuJXuM04C2+koPHXsZ+PSdz4buIPp86xR9i1BRbJ+npxUPn/1lj2wdxMNXKrMfNbanwu59vkHHYw4tBI3GP4UTapBR8f5tkC5Cwtw6Pby19uBJRD6fk1W6FxUrnTKVlnj59kgzINLXIjCGfoleczo7u+Ct4y6H84mY0lZPACO0aIx2I13FcAwytnFDc+Mm6ip7/vPRBn3zuMflGCUaN0tpT9uzzFCzsA4R/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOpyaIRPQ1xf/z6U35l6k7rKdWjdw81lhhIGpDS5nfw=;
 b=Wjpo4RFXEf2Lh6ZVvNDash9Zv/ZFESLF2nvZWqY5ps5G+v0V+hOAcfm8EwqxyLILonVyDWTKJABF3+18V2DYJL6+WxnZl1ou58sifF+Os8wMgDlbN4hJtCQqZQ+zi1wwD5QNd7eaSfzKlkypxGvMQfneX/vgnhSfxywLgg7wavbxgRhaMJAlmPocA+vQ75+Lz5O4UNRPXaVtASSeJE13IixnnA5TVPkhwuMIy17UrEBKxY2F2r88RpJQJWNWyldHbenDFe0vsAEIIv4iwv+s5L+8vBT6X8dISpZevt3oM6MRysYgR3Ly/Z8ezAS+Jxs7GrqqzSAJyqJrc3xoK9kzUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOpyaIRPQ1xf/z6U35l6k7rKdWjdw81lhhIGpDS5nfw=;
 b=zJKvN5Gs37hIbWzyP6hKdRwyTtqxZ6OHnYJ/8pfpCPXAXlmeBg41Q7W8bhLY4HfAXDCJaTtROqCU7APdQ2YxmdhSRbZlEH7TDoFOT/gGUI5Y6NNUBkmUEOhZ3f8aDqgU9heyjqOepvQFZV3W66pedIjphXl3hk6K+x+nh3BTs4s=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 19:35:08 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 19:35:08 +0000
Subject: Re: [PATCH 23/26] drm/i915: Make request conflict tracking understand
 parallel submits
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-24-matthew.brost@intel.com>
 <03661707-0416-93cd-94b5-1624f1a5e073@intel.com>
 <20211013003248.GA4795@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <d908f73e-73cd-95b4-c89b-8016a56a3566@intel.com>
Date: Wed, 13 Oct 2021 12:35:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013003248.GA4795@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR2201CA0052.namprd22.prod.outlook.com
 (2603:10b6:301:16::26) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR2201CA0052.namprd22.prod.outlook.com (2603:10b6:301:16::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Wed, 13 Oct 2021 19:35:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40e2c88e-cfea-4298-d2fe-08d98e8090d0
X-MS-TrafficTypeDiagnostic: PH0PR11MB5627:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5627444268AB805BF335A3E1BDB79@PH0PR11MB5627.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i9BTTi6LUv9PR/fABL0my0n1AB8kNXat872bUxkMpLsAF7vgo3TwOxMl9aIeKEuyrL3cxfkVfxDytVP/VhnUz9HOuolZn4+YGzoD862529NmcqGJ2HskAeLv6H4+NJ117uOd4xTACuXq/e9Su7oFYh75fuwF1uUhdZNY9jIZ/Q11JWpFblGaN0Q2XBKwU+daAtcWFtu75KGd2tyMrCDv7fl7qlukoqW14rwZ+scKuWRmPSqbRaFjwcnapoAkn/UUo0Mz9fXg4gCEqBah9ylJJZOUlrgXvTCnLFCUkjiFqLM8/wSyhrpfpPRbJbArqFkboPZbtzc+whSKZt1yPDq7kgnWtoNTbhRfDUnEdi7ogbnCR/qpt1h+wll0mJMrwA8KjK1+saLVORhtZqavVqzxqsW+b0Ai6vAtCpY9v3VUWvI0oXpGgeGUb/axNRjA0QIMhGnToYaQIfkelbHqtL0udUdU6RB1QJ0W4PR90D7eTM1zxDPBUGOuBwk64ud0OZCn3zsya3+NBdUGu59fV+zAAKTIWWVYSgZrhhAgMc1w2oz4LtZTEJ3W50wSQ+9ermGnSzrkay+fgGCVgRIr25lEHUEQo9qn1g4EeSgH4EzDYFpKzEujK6UJMVY+4wH3NCSk+vRbHcYvtE+Epjl7bt2onMw0Oh21kArsc9TvnA7mZ1H6RHb6o0FJ3dYpwzDnDsUjtqxz1mPp8C/jliIyeEy7d/PwJ/rBOhtf4OwQzaqk8sozekDOpqUlsWtwmHGzcEnC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66476007)(53546011)(26005)(5660300002)(450100002)(8676002)(86362001)(508600001)(31686004)(38100700002)(36756003)(16576012)(66946007)(6862004)(6666004)(2616005)(83380400001)(8936002)(956004)(6486002)(82960400001)(4326008)(316002)(31696002)(6636002)(107886003)(2906002)(186003)(37006003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0VPS3FReFVxZVdxRWRldUJmQU5vNjJDRHZrc1JUSUdYdjJvVFFERXdsaG5k?=
 =?utf-8?B?cXNXQXJuRDRIU0d5bjc4dG1EcFpQZ1ZnSnNRVGZTdWlMSlFCOFEyc0VIanRm?=
 =?utf-8?B?bTBxT29Wb0t0TkloN3ROR2ZZZS9teENrclE4ZU4ySmtma2h3UG5kam9lRW9C?=
 =?utf-8?B?aDVYVW5Ubng5TDVPYVNZVExKTE1hUXRoc3diV3NoeGpSR09COGllM2J3dC9E?=
 =?utf-8?B?VHNMU2Q5SlB0d0xtcGM2K29rVnNNY09UWUtSUGMxQ2VKMjcxZlZ5VFZLYm5n?=
 =?utf-8?B?VXpMUWRkUVR4Z3k3UjBuaGNWNEk2OWtzeVUyMFNKUkt1RmVWQVdSdHZBcm5p?=
 =?utf-8?B?ckREWXcxdm03YWlNOXNNN2hNYlNEZ0VkYzlGd1JRZFE4YVhxUXdBUHpQMVR1?=
 =?utf-8?B?aVp5TDJaQXlMendkRkVjUFNHYlFydzljOEpvNTVIaWtBMDYyeHFGcHFGVHdC?=
 =?utf-8?B?WnRNdlZJMHZ3NjRIa21oK0hRUzJ6dVBzdUI2SFllbnFKY1M3TFZnUUw4OUNK?=
 =?utf-8?B?b3Zvck5xelJ2RmpLeU9uQ0FESUdvREtEbzk0czFCME03K29KMDdJVzdSalFu?=
 =?utf-8?B?NHhlOVg3dS81WFBUMDBBMXJFOWlrVGRaeUFYZE5YRExTSHZ5eGxjcVpQbEE4?=
 =?utf-8?B?OTlXdTdnR3FCMWN3ZlZ5YTJKWmlibFB0ZkNGZFlJNGdISW4wclZ3cTk4aXlm?=
 =?utf-8?B?czl0bkg1ejZaOGJWMFR6Q3RnOUhMSHNPUWhjWG12VmNyc1pOWGtVOEc1NG5O?=
 =?utf-8?B?cmEyMGZSVGJMU3d1eGNRODZDanN0dm00dktLTlZkeUxaOFRhTG9FT1h5a0t1?=
 =?utf-8?B?Q3RSYVV6OVR6cTMrTzlsV2lJNy9NRkxWUTRHQUhFNmZKUldXdXNzQndLT0pK?=
 =?utf-8?B?WjliQVZvNmQ1elBPQTFEb1VBTDNPRFVScGQvL09MdGxnbXJrSElkR2JsOERG?=
 =?utf-8?B?SDkrdENsRW40NzFldm9jSTZlTmFXNFhnN2s0NlF3M1RFUzM2cllWODdUVjdm?=
 =?utf-8?B?OXYyYkNtZlB5b3NSMlh4bVV1c3pNN004MW9waUE2RWRVRmp3WkZlZzRhdHk1?=
 =?utf-8?B?bHkvZmlOSXIycmdUakV5bDQ4ZXpmYUR0a1pvaU41NVBrUXRuUVVZbXpiazZW?=
 =?utf-8?B?cGV3YkZiVVhpUUhRZG9qQTI3YVZpdkVwd1JSWEtZTlhva1VHcXVRSUNDWXNx?=
 =?utf-8?B?bjg3QTVydG5NRVUvWFl4MU8yYTlLdWRncmIzTUpuanl2VHhDcmtSa05Ub09a?=
 =?utf-8?B?QjFVbTF0T3VhaUVhQ05aNWpLUjhuRFZ3Q3pqTDM5OFBnYit6eUZ3OGlxTy96?=
 =?utf-8?B?Rks2TlhJazBGTDFpNGFDL2ZacWZIR1l2U1M4Y3NiWmRyQ2RFWCtrMTM1dnpN?=
 =?utf-8?B?UGlxTVpXc25kVE5nQnRBL0tHOU1kWnc0aE4rVEhMM0YwVmFCYVg2QzNjRkE1?=
 =?utf-8?B?TGExVnQwc3h0Tk40UCtxd0MwYWRBcUZENVlJTGdwc3BaM1dWSm5iLzhhbkpN?=
 =?utf-8?B?WS91eWRhRWNnMEZNc2dzdVhUV0g0RGpXY21jOTM1WnBPWm5aREhkTlJsL1Nr?=
 =?utf-8?B?TW5acHZhV1RLNFMxODRPNUJDRHFTZjQzKzhFdDRsWmQ5RE5rRU0zbWFXWDJm?=
 =?utf-8?B?blgwNkpCOUhlWnAxMGhFa1N0azRsWmdqUWh6ZzJCZnVLdXQ2WUxEaWlpRnIy?=
 =?utf-8?B?N3JZaGxZT1N4T0kvdEVpbnpmTE9XQTdlWVNvY1J4VWtYNXhONHpnYWY0S0Zu?=
 =?utf-8?Q?yxdHqOEpoWJKEj0Nn0qjbbyezXdBn3NvWK0FAvL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e2c88e-cfea-4298-d2fe-08d98e8090d0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 19:35:08.7253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNUEAGLxUdhRvpvFtDtRfApKllensIdKxRL2WphJVpnyA+XZWZ7Ox9jQVcr6Nt4Ad2/6N5FkII8yqCqovR2UlZaemrmhP5QcY1b/n+KKh7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
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

On 10/12/2021 17:32, Matthew Brost wrote:
> On Tue, Oct 12, 2021 at 03:08:05PM -0700, John Harrison wrote:
>> On 10/4/2021 15:06, Matthew Brost wrote:
>>> If an object in the excl or shared slot is a composite fence from a
>>> parallel submit and the current request in the conflict tracking is from
>>> the same parallel context there is no need to enforce ordering as the
>>> ordering already implicit. Make the request conflict tracking understand
>> ordering already -> ordering is already
>>
> Yep.
>
>>> this by comparing the parents parallel fence values and skipping the
>> parents -> parent's
>>
> Yep.
>
>>> conflict insertion if the values match.
>> Presumably, this is to cope with the fact that the parallel submit fences do
>> not look like regular submission fences. And hence the existing code that
>> says 'new fence belongs to same context as old fence, so safe to ignore'
>> does not work with parallel submission. However, this change does not appear
> Yes. The check for 'if (fence->context == rq->fence.context)' doesn't
> work with parallel submission as each rq->fence.context corresponds to a
> timeline. With parallel submission each intel_context in the parallel
> submit has its own timeline (seqno) so the compare fails for different
> intel_context within the same parallel submit. This is the reason for
> the additional compare on parallel submits parents, if they have the
> same parent it is the same parallel submission and there is no need to
> enforce additional ordering.
>
>> to be adding parallel submit support to an existing 'same context' check. It
>> seems to be a brand new check that does not exist for single submission.
>> What makes parallel submit different? If we aren't skipping same context
>> fences for single submits, why do we need it for parallel? Conversely, if we
>> need it for parallel then why don't we need it for single?
>>
> I'm confused by what you are asking here. The existing same context
> check is fine for parallel submits - it will just return true when we
> compare requests with the same intel_context and new additional check
> only true parallel submissions with the same parent.
>
>> And if the single submission version is simply somewhere else in the code,
>> why do the parallel version here instead of at the same place?
>>
> Again I'm confused by what you are asking. We might just need to sync on
> a quick call.
That's okay. I think I had partly confused myself ;).

I was just meaning that the parallel compliant version of the 'ctxtA == 
ctxtB -> skip' test should be coded adjacent to the single submission 
version of the same test. I had somehow completely missed that the 
single submission version is indeed the line above in 
i915_request_await_execution(). So the two are indeed very definitely 
next to each other.

It's all good :).

John.


>
> Matt
>   
>> John.
>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/i915_request.c | 43 +++++++++++++++++++----------
>>>    1 file changed, 29 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
>>> index e9bfa32f9270..cf89624020ad 100644
>>> --- a/drivers/gpu/drm/i915/i915_request.c
>>> +++ b/drivers/gpu/drm/i915/i915_request.c
>>> @@ -1325,6 +1325,25 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
>>>    	return err;
>>>    }
>>> +static inline bool is_parallel_rq(struct i915_request *rq)
>>> +{
>>> +	return intel_context_is_parallel(rq->context);
>>> +}
>>> +
>>> +static inline struct intel_context *request_to_parent(struct i915_request *rq)
>>> +{
>>> +	return intel_context_to_parent(rq->context);
>>> +}
>>> +
>>> +static bool is_same_parallel_context(struct i915_request *to,
>>> +				     struct i915_request *from)
>>> +{
>>> +	if (is_parallel_rq(to))
>> Should this not say '&& is_parallel_rq(from)'?
>>
>>> +		return request_to_parent(to) == request_to_parent(from);
>>> +
>>> +	return false;
>>> +}
>>> +
>>>    int
>>>    i915_request_await_execution(struct i915_request *rq,
>>>    			     struct dma_fence *fence)
>>> @@ -1356,11 +1375,14 @@ i915_request_await_execution(struct i915_request *rq,
>>>    		 * want to run our callback in all cases.
>>>    		 */
>>> -		if (dma_fence_is_i915(fence))
>>> +		if (dma_fence_is_i915(fence)) {
>>> +			if (is_same_parallel_context(rq, to_request(fence)))
>>> +				continue;
>>>    			ret = __i915_request_await_execution(rq,
>>>    							     to_request(fence));
>>> -		else
>>> +		} else {
>>>    			ret = i915_request_await_external(rq, fence);
>>> +		}
>>>    		if (ret < 0)
>>>    			return ret;
>>>    	} while (--nchild);
>>> @@ -1461,10 +1483,13 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
>>>    						 fence))
>>>    			continue;
>>> -		if (dma_fence_is_i915(fence))
>>> +		if (dma_fence_is_i915(fence)) {
>>> +			if (is_same_parallel_context(rq, to_request(fence)))
>>> +				continue;
>>>    			ret = i915_request_await_request(rq, to_request(fence));
>>> -		else
>>> +		} else {
>>>    			ret = i915_request_await_external(rq, fence);
>>> +		}
>>>    		if (ret < 0)
>>>    			return ret;
>>> @@ -1539,16 +1564,6 @@ i915_request_await_object(struct i915_request *to,
>>>    	return ret;
>>>    }
>>> -static inline bool is_parallel_rq(struct i915_request *rq)
>>> -{
>>> -	return intel_context_is_parallel(rq->context);
>>> -}
>>> -
>>> -static inline struct intel_context *request_to_parent(struct i915_request *rq)
>>> -{
>>> -	return intel_context_to_parent(rq->context);
>>> -}
>>> -
>>>    static struct i915_request *
>>>    __i915_request_ensure_parallel_ordering(struct i915_request *rq,
>>>    					struct intel_timeline *timeline)

