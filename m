Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083D13F23F8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 02:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB866E9E7;
	Fri, 20 Aug 2021 00:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9456E9E7;
 Fri, 20 Aug 2021 00:03:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="216409349"
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="216409349"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 17:03:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="442429819"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga002.jf.intel.com with ESMTP; 19 Aug 2021 17:03:23 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 19 Aug 2021 17:03:22 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 19 Aug 2021 17:03:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 19 Aug 2021 17:03:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 19 Aug 2021 17:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+zm7nRS3St/8NN15wz0WV41C+SKcmg1a6jV9+6tZ8781nAoY4vbUIXzejuErxYhXh5Z5oJ21zgUeYJIeNgtD+cNr1IsQ31LHGBPputmQ/Sie8Ltf24vMLqXJ+zLsadHpVugtyKpYoQQrCBeUgmdqjdpjOpgODvqEb8Cug6Lw7DKT4w0SfVOwSbkUBcslhUhonjUlMVHahRdb09+hNNCkUzlM9v/dnfW0UlIA9BW6gTifSuiCeI6E6oA08ISmdWv0DP6TKO62pnJqU3UTc8gwLeAx6bYol7/ss03vOxRH70oo+gTDiVQLkr25+M1YA1umk5Y4dxI0/cWFFSTjayBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBQAqCHyfOmpU0Hnh/GRg7RscVIE33DGLX7TnNFXlrM=;
 b=fS05fIw18u/0W+xbS4HwPNu4T6/IkRfMyOXi4C1xyGUBE2kqhFIOqJu/O5BwFZxuDxNS4UB0lPqUDQBWV2AwZozVesyQID+eragJFw3dHZf2VXvYtANzoDhwvimofCU7wvmACjIIxIBayIzjRxNvTkLWggq4UD3A0RM4UATn1NCVJPbbqMAindz6vkcebQfkCSezRhwHJzTcgIiGZC2v2Tt7hVA2tCy5Pb9TajkJ49+j+gaqyJBBnfKATuITH0Hpys1fMJ0y6pc55vLW5va7TYe9qdkQ7CNEbRvQ0fCDzazvMDOzDxlbjhYLJSAmdSqgdHOuOI5YE0Uq3jbrsk75zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBQAqCHyfOmpU0Hnh/GRg7RscVIE33DGLX7TnNFXlrM=;
 b=RDcd77uoo4YQNyifW3OuAuzXG8NMoAUgmjBDrjKg2ErEsMAzQeFe96PF9UELBJ7S6mQb1uNwrRzkLXHehcfeaaYNxB7xOnTb9hJQZTmKLCx6BAogt2KROteYtBq7MpAj9gNM3SYjYPOL6LoQRTi5C6sNgCCiYlOXUEW8PNw02Mo=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4644.namprd11.prod.outlook.com (2603:10b6:5:28f::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17; Fri, 20 Aug 2021 00:03:20 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff%9]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 00:03:19 +0000
Subject: Re: [Intel-gfx] [PATCH 03/27] drm/i915/guc: Unwind context requests
 in reverse order
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-4-matthew.brost@intel.com>
 <0aab40fb-77e7-2187-66e0-5c981a2083a7@intel.com>
 <20210819235306.GA16156@jons-linux-dev-box>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <03b7dae1-678f-d611-1205-7fc97e894032@intel.com>
Date: Thu, 19 Aug 2021 17:03:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819235306.GA16156@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR07CA0035.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::48) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 BYAPR07CA0035.namprd07.prod.outlook.com (2603:10b6:a02:bc::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 00:03:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3c671bd-58eb-4580-ec56-08d9636deb1c
X-MS-TrafficTypeDiagnostic: DM6PR11MB4644:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB4644A082AF598503B748A42AF4C19@DM6PR11MB4644.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i++0p7eXdJ4UGkhB4cpS/u1WMXQcMDDaM5YmJKr8sPzrbUc9C7lGqRi5IWmY7RXVG5mSBQB163bYX5QHTweAjNppbJzZFrTOqWEOoqhINXJo5uKRm2Fyc/nSExHDdH3hsGLYADyyhPdGyy3Uw7rUbpLC5x8tIFmiq1ZoBbHQfZfdLZRB7TzCb27cGE5ff0GgAmrvIJjXKhEeH/B8OUwiDbwAL2tASzihwXtOQ7nt8roj+N7jWwk02Hx5KpSbtxnt9NWszc8mUMeVr4o2/3ZUEDi8MjmBwF7TjoRu9UNmyC3ooDULH0fwrXkVwd94XQkpJNhqMrLF65SAkuHYHbiXUSzxjCcF/6bqTOhChszCIEhUpHMatusQG8ZijaevIg38dGg/WUdrASKfrZs8DeMAsnyH7mAkyw8cMB9pHmIJkBIxrYvAGccI+dvoEC6PZvy3UguBFFrGs2gGDAYyjiHB3JvCLhD/LL09dtPt93SnTTW70f74Dvxv7U1Go3p9mhC9KO4KOGR8MB7Lu5hxYBiVK1ifowhZpjYdweXlw0H91MWsY37tRgsqWyLLLGg/LYAAD8toWHFIYnmGFGVHrYqlAsaJYzubMjhm1yLdp0ljmeI36WhFPPhYyN2yXX2SloVYahMN/nvKv6GuGN6UWeNbvXes25ZhfDn2aYaOsI6Uj8eSHNxpENO0ULh1yIK1SyVT2Bpr0IRJY1GT73yJrE3p5cF5vKK8jdPva0QzHTlxR7YqkDR+6I6qk41FW2Pb6qKd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(478600001)(66556008)(6862004)(8936002)(86362001)(6486002)(38100700002)(316002)(16576012)(6636002)(2906002)(8676002)(53546011)(31696002)(83380400001)(186003)(31686004)(4326008)(2616005)(66946007)(26005)(5660300002)(37006003)(66476007)(36756003)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXNCU2xOSmEzd1RBRUhnN1R6cVMwTTN2eFZtWnh6bXg1SVZXbVJPV2xuaTJD?=
 =?utf-8?B?cmU4bm4vUHZsL0xKcU05VUF2T3pBN25MZXBSZnpmOW5EbmdjOWZxZGt5bjlw?=
 =?utf-8?B?NmZpcVA1YXR3d2FiOHlrRmpIbnlvcUF6c0RFUEJNVGpKZHZXUVR1NlZaUHll?=
 =?utf-8?B?WFQra3p3UGtTZjhqSzRJamFBK3FxWkhMZ3A0UzJ1bFd2WDByR2ZwNi9rOStR?=
 =?utf-8?B?d1VOL1hoZGRhdWVnR2xtSzVKWkZmWVVoanphTEUrdExvS3JhS1F2UmpoYmZh?=
 =?utf-8?B?VTJCaDNwMGdTNEtTaFRKRTBad2owVjBKazJ2aUtWbVVjY2lwZTlMaEhlaldr?=
 =?utf-8?B?ZWt4eWppRitGVnpPdmx3clVTL2dqOGYxbmJyQ050TnovNFNpanZWTkF5eEIx?=
 =?utf-8?B?TktSdVgwUEVJQy8xZlpKejJaV3B1SlI0MUZpMkRrenA4TTM3cklnbzdpemFV?=
 =?utf-8?B?Q080aGJxbG5ka2pET2UwK0RrRXhZS1hpS2kvQ2Z5V3BKYkNWNHpnbWRreDNa?=
 =?utf-8?B?cFcyMGl5RktGajk5ZlJpTDIyVDI3NEV1R1d4L3Nzd3hyZnZET1d2Y2FHYVBD?=
 =?utf-8?B?U3psWnhMU00wSWNkRFphNmQrNjZITGEwQzIyOXgxMFdiT3VsTXVJTkxuV3V4?=
 =?utf-8?B?dTRqWkVmK1FHZE0zTXpIWHNjUWtNaWNFcUNvN0ZDWmtHVlJhN1V3bjVaa3kw?=
 =?utf-8?B?KzZPQWh4aTJHd3cyOGtZL1hwc0VSRU4rb254blNpa3duTUJWYWRLZkVvMkZW?=
 =?utf-8?B?ekMvMjVDY3JuQm1FNVo5aGUyWWFpNTYwK1ljei9wbmRSbkdDaFE3V3hnNGRS?=
 =?utf-8?B?eHdsV2J5KzlCcnI1UFRObzFvMWtGYjVIU1ZqOUlxUFRYc2tXblFueWNmUE9Z?=
 =?utf-8?B?VFFnV0Q0c2JkeS8wUXFicnlOazBGZTAzT0QxcU1kVEc1RmhVL0VzK3N2WWFV?=
 =?utf-8?B?L1pYbmZEMDZBMHNyUW0yOHRnOWxQV0RFM2xvVnB6MytReUpGU0lxMVptbHYv?=
 =?utf-8?B?ZXdHZkJuZFFsVTBCUGlVUkpEcHJqM3Roa0tWMkkwdHZYVUVYRktaemNFcmNs?=
 =?utf-8?B?NFpXT0VveWdiczRyV3VHYW9hbEFMS0xlZDdBa2ZobUtQNksxQXh4YTZzbFdU?=
 =?utf-8?B?WVZHVkNiL3paOGdtcW9sWXc2UnJObGlIS0dPOHU4ZTZ0WTdpempja1NIWkNS?=
 =?utf-8?B?UCtOeXVRbHlvVHNsWkh5TW9VTlh2YzdscmFDZ3lKeW9BL0dNR0xIRHdZTjdK?=
 =?utf-8?B?VnNpVGlkRWJVSkgyQmZjckxheU1rQ0V3T1ZXam9yckxzSFZHNWhPOXdGb3Fp?=
 =?utf-8?B?YjJOYmNsN3VsRDk0cytDZnNkVHAvSE9GU2NJVEJlV1NyOWwydVpIS3o0UEY3?=
 =?utf-8?B?WWFRTnk1S3kyNXVEaXFyMmJBMkxFRW9oU1Z1MFYxWkdHNlRpcSs4OVVVVUVC?=
 =?utf-8?B?RTNyckYxNGtIdzNrWjYzYnBLekp1QzVPc3ZSMDc1TUIwVlNRSGJoRzg5YlRE?=
 =?utf-8?B?ZFRmKzk3ZFRLazZxOUtkMk85UHBaNDZnaFhyZWs5bDNDVkpQVmVvUzNmb2t0?=
 =?utf-8?B?bXVyTE1LajVTQzRoblFHbTU3aWU4S2hNOHdzSXFmNDZoTDZ4K25pUVhmczl6?=
 =?utf-8?B?NlpIVisybU9CK3JLb0kvZXJRb3JkelRXZm0wYStDazl4bWlzWGtMQm82RHFY?=
 =?utf-8?B?aWZHOE9TRDhlMDB3VkhHbjhBbkc3UEhORk8xcVg2NE5XemhzLzR1V2liUUJX?=
 =?utf-8?Q?V/yfifOOUdz1cJcLXQN33O5UA2B9m2FCABf4h/K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c671bd-58eb-4580-ec56-08d9636deb1c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 00:03:19.9042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ST9VvVu4U9DyqA+Quu9cXNuiX08omUqpBYxEsQ5vgefSldsOk1lidvqmhYlXXfj3odFX9Kct8jR9MfwFjO0sr1meCgPk2gpcCGjRpRj2Ee0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4644
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



On 8/19/2021 4:53 PM, Matthew Brost wrote:
> On Thu, Aug 19, 2021 at 04:54:00PM -0700, Daniele Ceraolo Spurio wrote:
>>
>> On 8/18/2021 11:16 PM, Matthew Brost wrote:
>>> When unwinding requests on a reset context, if other requests in the
>>> context are in the priority list the requests could be resubmitted out
>>> of seqno order. Traverse the list of active requests in reverse and
>>> append to the head of the priority list to fix this.
>>>
>>> Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Cc: <stable@vger.kernel.org>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 32c414aa9009..9ca0ba4ea85a 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -805,9 +805,9 @@ __unwind_incomplete_requests(struct intel_context *ce)
>>>    	spin_lock_irqsave(&sched_engine->lock, flags);
>>>    	spin_lock(&ce->guc_active.lock);
>>> -	list_for_each_entry_safe(rq, rn,
>>> -				 &ce->guc_active.requests,
>>> -				 sched.link) {
>>> +	list_for_each_entry_safe_reverse(rq, rn,
>>> +					 &ce->guc_active.requests,
>>> +					 sched.link) {
>>>    		if (i915_request_completed(rq))
>> The execlists unwind function has a list_del if the request is completed.
>> Any reason not to do that here?
>>
> Def isn't needed here as this is done in remove_from_context(), probably
> not needed in execlists mode either.
>
>
>>>    			continue;
>>> @@ -824,7 +824,7 @@ __unwind_incomplete_requests(struct intel_context *ce)
>>>    		}
>>>    		GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
>>> -		list_add_tail(&rq->sched.link, pl);
>>> +		list_add(&rq->sched.link, pl);
>> Since you always do both list_del and list_add and it doesn't look like you
>> use the fact that the list is empty between the 2 calls, you can merge them
>> in a list_move.
>>
> Can't use a list move here because we drop
> spin_lock(&ce->guc_active.lock), that gets fixed later in the series and
> at that point we likely can use a list_move.

fair enough. I'll leave it to you to decide if it is worth moving this 
patch after the next one and using a list_move. With or without that, 
this is:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Matt
>
>> Apart from these nits, the change to navigate the list in reverse and append
>> here at the top LGTM.
>>
>> Daniele
>>
>>>    		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
>>>    		spin_lock(&ce->guc_active.lock);

