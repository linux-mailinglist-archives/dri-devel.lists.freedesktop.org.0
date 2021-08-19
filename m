Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFADE3F23E0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 01:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D5C6E9E8;
	Thu, 19 Aug 2021 23:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F056E9E7;
 Thu, 19 Aug 2021 23:54:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="216675810"
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="216675810"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 16:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="532702148"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2021 16:54:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 19 Aug 2021 16:54:07 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 19 Aug 2021 16:54:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 19 Aug 2021 16:54:07 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 19 Aug 2021 16:54:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyWTCiXkUNCMnWeVU926g5I49NmuazOcsGbcgTdTO/N0hgBzzWgifmt+HuFceXknBRKuQlZqEXLzsqyL+f42Ao86GI+G7qovmZmtj0FkEzaj14j6yfPJIU6LK2+M2WnpgYvRt1NEnjICJC3Oq8M9KTDG1Typ4U+z32/R4kHIbz2kkIk4BUh7EABrQJlh4lDr8LWUvCiNGaESajDA/Om0vLYibw2P52wJuDMpX3xiISMwIdvmpKKYApSsHhFyoKxcsHVZ1IZo9BHxjd6S8R8/U19/m7La4EBBQH9osM6wvT01MmDsWVAiUk6N1vL00mFW/wSD9dLWlZWVQqgCINyXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCtOSLgqFbv122f36a2ok5gcJrqDpbLMK+x8u8MFjBg=;
 b=jB29JiF1Zq56nWL67HwxcKhu7JBEN/HeZE3TBukXxRaNNnhn8JuvllETrQACd6SzUsWhA9A9I5bJKu0fiJahamhQMivGBQqh7kIJxHyJyK3XfqeGJpzsw8ezyR9WPTTOpSWaRpS/a8yCJqHT02M1E0w9uvhaviotIsSFXZOqFxigO+/HvuAfDBgowxZi4b+kYhYR3RU+grIdjTt9oZ/o6/3PSlRifwRDkI9ao9WYgEMsSB4LEqphYfw1RCPSo4T8TKI/ONcUbj2UEIdSeAZyXnSfwE5tY9y7NP8h3kASTvDLtdKturN6vexzgMx3Op5+D0AguqRFCqQOYrZANpaRWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCtOSLgqFbv122f36a2ok5gcJrqDpbLMK+x8u8MFjBg=;
 b=IM/R/PIKBjRe7ihC/1f7X4EV4aqfcynAM7jPmFZ9FIkuzcaVWxwKU1W3/4+wu8rcHnoDgasNgHUgbmcZjnSQXDiI+b9fh/ryWiJT8I8O6Kptx5D6MJ91yBPws9WtOyAfE0RvalShADjZSFjyTadgQiJXe6AN3ZLB2Co+n7ztOZ8=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4236.namprd11.prod.outlook.com (2603:10b6:5:1d9::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.18; Thu, 19 Aug 2021 23:54:04 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff%9]) with mapi id 15.20.4436.019; Thu, 19 Aug 2021
 23:54:04 +0000
Subject: Re: [Intel-gfx] [PATCH 03/27] drm/i915/guc: Unwind context requests
 in reverse order
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-4-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <0aab40fb-77e7-2187-66e0-5c981a2083a7@intel.com>
Date: Thu, 19 Aug 2021 16:54:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MWHPR11CA0035.namprd11.prod.outlook.com
 (2603:10b6:300:115::21) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MWHPR11CA0035.namprd11.prod.outlook.com (2603:10b6:300:115::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 23:54:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00daadea-c444-454d-b455-08d9636c9fdd
X-MS-TrafficTypeDiagnostic: DM6PR11MB4236:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB4236985632B6C9FB7BD04326F4C09@DM6PR11MB4236.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9hXghAz2YaHMg/OjfQ1Ly6NeU7y19eD5sAdzCfYzaVdT7kitnvit9WJollRM+yj31A4URLnqIb98YqsaI4qbO17+XTwy8SxkEf7Zwya45h9u9rtA7b1uTj8j53Eef9DX4xuoRe6quvEJyhKvX4O/6YVDB5eYRFhmeejfow1WqRW/7LoqGGZEL3mqdT4gyeJLzoj+F0Qh9YC74135sWM2BRpTHHiDhTnq8SFV/WXPw7alKSyOTzPAErxGUTCwhKNn/dRkNu0OkertXiV47R1MQrILhQV34SAywEfc1mOwOguNGffmGijidM98nCQx77NOMpphUmaHmiaEL6SJlz2mNyZ7n8NsHp76aiCm8Tar+mTvJzu4b/5QOuIpvLKV9qWGAyAqUhjgWX53pQFzVG0J6mKLdOVS7HFf3qvuN1SR/986CWKW0NN2M8XxvG9AQ5k07a23/RqSI91m8ejgZyaD57OHs3eAbAaR2eT2av4emwWND6xOyBeMbTfVU0RtYPXms9ELQuY5JMWjDxkjj+ILN/SKBLE4N2ZtErNhIEzFk7C7uYiKwjR7iuQcthtg7zxTOJZTWugH3wbpy5jfTCRdYQlqrrNcSq4tLkxTp0II2Kwedq0DeS89Rgc5l5q76M1rTC9yfUm/fp8OFwM6cwt/sblHz9KmJ9ulOlC+daPud30GJz+vnRGA2sY8E4CllSzI16zygyK8d2HTWnvu+2RhU/lI54JqaXavO6QgFVyPeamq/IiMTUHi5JCNzUltr3Fi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(316002)(16576012)(2616005)(186003)(8676002)(4326008)(2906002)(956004)(478600001)(8936002)(26005)(53546011)(6486002)(66476007)(66556008)(83380400001)(31686004)(66946007)(5660300002)(31696002)(36756003)(38100700002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEkwZ2c2OGhRUDN1RFh5bktZNTdrZExSdzZWNzB3SHNVeWdOM3N5L2c4VkpS?=
 =?utf-8?B?b1dVcmdxcktRN1h0aTJPTlVJMVJGbFJacTJyNnVBUmlJenl0RTRFS05rOVVt?=
 =?utf-8?B?QUxMTE5RZkp2dElHYXRzZGppd2hSMi91UEI0dHpteWtzK3ptcEhrVnh1QTUx?=
 =?utf-8?B?eWhCZHJzMFhzaFprSUlpTkI0OE4rb3Z6ZTExaCtvSTVKR29sNUFFbXhMcjlU?=
 =?utf-8?B?d1pYL3k3Yi92Sk9HVmV4ZlRrQ0NhSTRwLzNPcFhZYU4yeElTYXdXQ0F3ZGtq?=
 =?utf-8?B?SmRYcm9DQXNpRjN5WVdaNUVZd1FOd2tuRWlScHA2RlJjZ0l6M29LQi9vSWx0?=
 =?utf-8?B?b2lkSm8vRmJvbGhmcWRkNEUyTkx1U0FTcS9MdmRGQnlwWnRYYWtzNS91bHJS?=
 =?utf-8?B?bU1tamUxSXVrTXUvZzJTbnMzOWJaWUlxQ210SUlOQ2JIb0RiaGM1RFZ2L2Nj?=
 =?utf-8?B?TFpCQmdUQmQ2aUd3WDYxRnBvWU5zMFpGdmJDTmxNVnBVU25yVEErZ3pSU2kz?=
 =?utf-8?B?RXpYT2tKZGMxak5vKzBjeEFQR0lHbEp5dU9PNGs3RFF3ZkIrdGxkVlY3MjI3?=
 =?utf-8?B?RExRVHdEcW1QelM5TlZyWExzc0hSNUJ5dWNZU1F6U2pCT0hKYWs4M1Q3T0Nn?=
 =?utf-8?B?ZGFsL2MyL1lFcXRmQSs5Tk8rZDNuTkxka1RQUUdZeWdYdVFpOW11RFNlUU9y?=
 =?utf-8?B?bzB2WHNuMktHQ25XaW4wV0Q5MVBuWGx6MDU4djRaeVE4S1JJKzNpd1VUU3lM?=
 =?utf-8?B?c2tIdW1TTHgrL2VHa1RpL3grQUhlU2NLUjVxc3I1bUJtZUozLzNYeCttUzQ0?=
 =?utf-8?B?ckZnK2NOVWhnWVlBdXNIeDlCNVBPMmlMcWxybWhzSnpYeDdabE1helNrazVZ?=
 =?utf-8?B?RHFaVDBoT25zaGdVRXBiS3VtQUx5TUtRMG41MUNYd2lJbHNWNFpRNHU5Sm1W?=
 =?utf-8?B?Tzg5KzQ5VnBQazl0VmdrN1FEM0N6L1lFWnBTbjM5amV2YjVHRTFiR2dhdEFz?=
 =?utf-8?B?dWkwUmtJaWVSMWxQOHBhYXE1TjRYaE9PcVhPS0d1em9zNmxKVkhDVDQ3cFdq?=
 =?utf-8?B?Szh1KzVBL2IzNFk2a1dTVUhNcjV1cm4vSDd4eTlBY211UEliOWhVcyttQTBy?=
 =?utf-8?B?clB0c3JDdVNQZXdxMjdnSkhFaFlNRDVNVUpKRHpRV09SbFN5QUovODdJRTFS?=
 =?utf-8?B?c0JqRmFJVFp1WlB6aEx1ZCt0cE5nZndGL0k5cjJLUktSOUVsR2pJMXovMmc4?=
 =?utf-8?B?VmwrMHp6eXE3aldYSm9uc1dRT3hJRlFJeW1iSlVVcXlacUxjMUlSYjhnR1Rt?=
 =?utf-8?B?aGpwcDRKbFhlWWlubkk0SUdIWFVtUkRUcjBwZ0NPZ3ZDelZxaVZKSmxuR0g5?=
 =?utf-8?B?SjhxaDJlYVdwbVpjVWI3cUtmMHlVZHVjVzBGcFQvR1lxUUQ0NFdoZlZzVGJu?=
 =?utf-8?B?OTBRdTVpdmh1MVJzMVhWVWw3R3doTDdRMXNUUm1Gdk1ZejBaVVJoSjkvRTRD?=
 =?utf-8?B?WUtXYUtiRnVtdU5UZS95bkVDUHdkQ29MMjNQeTUzQWlQZlZSRU1mYjFNSkw3?=
 =?utf-8?B?SGhOYjFTSEo1b2RGSWUyZmtFS0xIMkNjYjB0TTltbytJYmdvSjZ4aHpxRVA2?=
 =?utf-8?B?ay9RL1g3TTlSc1RoTC9RS0Q5RnRRM1VUTm0wMXA5NEtVYVVpQTltelRzclpk?=
 =?utf-8?B?NlpTNzdyS3lPZHd1TWhIVGZyUTErVVp6M01jYnhiUklFcTlyeEo0T292YjRT?=
 =?utf-8?Q?tiwGyFb18UFWJQFFHqXYb1W7xohTpskzJU0Wjhm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00daadea-c444-454d-b455-08d9636c9fdd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 23:54:04.1083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fu0alT0NT2Fl0PUu1EsuB2COCw01YwLMP1lOjdldjaAYjdcg3/FTmsO4CJsV03SlLkewwdtMIq79z0s5tqCjZA7wXo99rsMVy294LtioUAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4236
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



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> When unwinding requests on a reset context, if other requests in the
> context are in the priority list the requests could be resubmitted out
> of seqno order. Traverse the list of active requests in reverse and
> append to the head of the priority list to fix this.
>
> Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 32c414aa9009..9ca0ba4ea85a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -805,9 +805,9 @@ __unwind_incomplete_requests(struct intel_context *ce)
>   
>   	spin_lock_irqsave(&sched_engine->lock, flags);
>   	spin_lock(&ce->guc_active.lock);
> -	list_for_each_entry_safe(rq, rn,
> -				 &ce->guc_active.requests,
> -				 sched.link) {
> +	list_for_each_entry_safe_reverse(rq, rn,
> +					 &ce->guc_active.requests,
> +					 sched.link) {
>   		if (i915_request_completed(rq))

The execlists unwind function has a list_del if the request is 
completed. Any reason not to do that here?

>   			continue;
>   
> @@ -824,7 +824,7 @@ __unwind_incomplete_requests(struct intel_context *ce)
>   		}
>   		GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
>   
> -		list_add_tail(&rq->sched.link, pl);
> +		list_add(&rq->sched.link, pl);

Since you always do both list_del and list_add and it doesn't look like 
you use the fact that the list is empty between the 2 calls, you can 
merge them in a list_move.

Apart from these nits, the change to navigate the list in reverse and 
append here at the top LGTM.

Daniele

>   		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
>   
>   		spin_lock(&ce->guc_active.lock);

