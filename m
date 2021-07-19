Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27603CF022
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 01:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBC86E209;
	Mon, 19 Jul 2021 23:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1224C89EB7;
 Mon, 19 Jul 2021 23:47:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="272265486"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="272265486"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 16:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="632058269"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 19 Jul 2021 16:47:03 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 16:47:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 16:47:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 16:47:02 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 16:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqHSk3Xvpe7BcsjsobW3jWGBY91wVkM9r0Bp6JDJ2lB5NCv8SGGCav84PWVoe7Q3p0slaeZZukJ+qyZyfcSIWQy6A8RzrFxvFBLjSaF/EtDoYsTTORfcPRCsAQ+GCwB8X61sScJ1igO9PaxqhlfQXYweqwCzV8KVEY+Vn0OgoPEz5qW+pKv1L1RCA7L1GrAMV194QxFAzJyyz+3kHGISZS3fuQJbyiQaVBQLRv566T8aNO69V4b8B3yK6ENZ3L/W/QmvHaW44nACcb3xkhhvca47Wuwq20ybz8tXVvluyLfpdJcRslpZMIXJz2FjHvxaNtBB1u5JcskaiG20TB9MIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90RpvWs821sOOe/3l/yta7oumSr+GD0iOUnip1MmFz0=;
 b=DvJ+XtS7nhbBA2YDjQRMp3VYVrJHs5jxFicE3BDLkDm+S628Xtw1GqM1DAdpup8qj4wi2vYd5sqSJn6kmwv6QDiutcx4rEOAC+SfK6vbk33IvkLUWVkuhHldVRSV/gq1nZJy4O41aTUsho5WZkCqRMey6VWjJ2LxLCkQzpYvwuMibVgdNCRAEisXD44jrRmBnq3rAikPMI/klQcBh2ZagM9IFVv2h07n6SSoXEM44Pond0aEfyu4zFKiyVh+tPtKFa7spQH844JGISajy08nr+M/16re3Kx+84Q2LambRHsuMDXIcLZT4LGt2KyCA6QSseMHFSVM9jb6x3DXH7OBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90RpvWs821sOOe/3l/yta7oumSr+GD0iOUnip1MmFz0=;
 b=pEQEMDS056MdDAUA1Y6znYSGvBrtYn3xCTtW8IEro6x2tMoXlqLnIzj+/fZyxTbS9if66LhkX7BsOQ1/+1Le5OGeJ1w4wh1I3vWHW6HOjLJitOYogcuwTGdRf7mr94CvPp8ducrBwwIcsGIHccbdZjdRfFfX9CD0MRVfSBuLUfg=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR1101MB2153.namprd11.prod.outlook.com (2603:10b6:4:56::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.29; Mon, 19 Jul 2021 23:47:00 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 23:47:00 +0000
Subject: Re: [PATCH 12/51] drm/i915/guc: Ensure request ordering via
 completion fences
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-13-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <16b360b6-50fe-aaa9-4277-2ee3f3db8d0c@intel.com>
Date: Mon, 19 Jul 2021 16:46:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <20210716201724.54804-13-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MWHPR1401CA0009.namprd14.prod.outlook.com
 (2603:10b6:301:4b::19) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MWHPR1401CA0009.namprd14.prod.outlook.com (2603:10b6:301:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 23:46:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 819d49d7-d778-4fd0-1116-08d94b0f8099
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2153:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1101MB2153B29D70C43BEFFCA559D4F4E19@DM5PR1101MB2153.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PVkHg9ge3tCTvdo6iA1y2wUG7mNfahPKuGKynvLmAxEtvAzeWS8PF0iFrfPoVyrkt6nKOyRFVlz5BPaKql1YDthp/Bq3SAWG3O8AV93KeBIL/oI8Vpe4zb7Uk2G7ANBvchJtV4S8kE7qLdplVscdq1mhuJ8wXaodfQEiSStC8s4zFkNdsu5Oi0FR/QmCRBw98RsdXwp1GUpYxweJ7alLGeB8Twtenlv4EjWGX0eHYMLxgctKviXZuX8hYrSK6YNMlmttlqnfpvKrKpltrG2CrIXVVbs6vxLcWnY1w2w+Mi9fJehCQA7ubci+VqFe23bB8uTug3BoufKf1AQiWmPzy2kGcyAc08cZC4MUCfQS1YKLhnkK8YqKwuIb9yspNoikg2oP8W/0O2b+pEfOVT5Z66Fep14bis8yatsYvarETLN/7VyBVeC7ClptJAu4tDoeN5sYHgKegbsXg7PwnMSrYo7/qm7jnmEH+qoehoGeg1RCzx9O5TaImHf3Dfw3RRcVAPHIgLmr/O4yux6Vf1UMlWUgInfKLChg+IQU+eEGQ+MYO/kkZGxgxGMF7YDAW67l6FZ+tqcYg4kC/IIdXXh/YoQiDq16Q7VIpb8Bj9ntaB+p96SUWNoJJwgDnNCT0wSB7QqFWu4++WssH9JbT0RqW6D6YBIgNWIwXPmXVf9/P5M21xrgPebM4LmOeOtyayp1NB/KNFicQvHLOV5/Gr1g9tsUjaNUpUx/2ARVGIiMiIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(5660300002)(31696002)(2616005)(31686004)(36756003)(26005)(38100700002)(316002)(956004)(8676002)(16576012)(86362001)(83380400001)(2906002)(450100002)(6486002)(8936002)(4326008)(66946007)(107886003)(186003)(66476007)(66556008)(53546011)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTVCYUU2cEV1MktUbnc3NnhteUlvMFZzYkNCWERnK1RlQUd4YTRHOG5GSkln?=
 =?utf-8?B?YkxvMW44RUl4UTd3Y21QVU5HTWVWSnMxSG9OWVBSZ2JBK0FKTmtUMzN6dExO?=
 =?utf-8?B?NnBBUkpLcS9mR3VJbkVSVG01dE1Ha3VzMkY3VmwvZHFkOHNFcUlMeXJpdlRL?=
 =?utf-8?B?Z0UwbDJORVhkN1FMR3ROd0JPUG10OW9pelFoOTlFWWMvcytXUjBtWUlieW9m?=
 =?utf-8?B?Q3lVZ1M2UnZ3Y2xQaEc4Q00ydlNtZE5PYSswV21sdE9iV3BXdVN4dlJlclph?=
 =?utf-8?B?Z1hjSFlTMWl1dHpvZ09hNmZYME0xRGQrMXJOaG5UT0d4MUJxVkFtMzN0bzlZ?=
 =?utf-8?B?Y0hzY09Mcy9VWHUvZm1HNjd3R3dqTlhpK2xwdWY1Q1dKNGp4bHk4Q25VSkpn?=
 =?utf-8?B?M2lIM3U5YkpQYWtzN0FvVWo5ckF1RmR6N3N6TEMvd3JLWEVhVHlGNThnYTYr?=
 =?utf-8?B?cW1hVXFPaVNoV0FoVW9UTzlnbVJiSHFDUUxNYzllVHZ0bDJQWHJyYS9XTTYv?=
 =?utf-8?B?WGsrR0hhK1BLS3ZBeUIzWEc2TytvUnVydkRVOGpIeDNEcUh1VElteEl2KzZh?=
 =?utf-8?B?RFV4c1REUCt5dnN4dis2bzdLT3VXSlFaaFIrRVBieStSVDR2M2I3eUpacFll?=
 =?utf-8?B?bDEvSjczamFMLzlrRkxXdmx2Q051VFNEcmM3cWtSRDhiK1ZES0dvalIrWUdP?=
 =?utf-8?B?SFo0K0RGKzRmYXA3Q2M0RnRwaVFUNk16TjNHaDR0WnFlM3NsMEpPVmJRNnVS?=
 =?utf-8?B?RkZUU3ZrOHFCRlFLaDlxdVBVRHIraG1yWlhrM2JEZlB2dEhaSWtXc05LUER3?=
 =?utf-8?B?bWc2d1JPdVZ6azd2czNmN3pyRnhmL0F2bU41dnEwOW1RcWovRUhqMnJYaS9R?=
 =?utf-8?B?UnBJeEk5VE1QaVlGdHZsckZhQy9hZElyaklaVUFaTGExWm0vYTN1NmsvQlUw?=
 =?utf-8?B?WEUyVk1iUHljaXBrcXQvNVFteURPZ3RnRTlHU3ZKeTZNZGZyVTJyTTJzV0VB?=
 =?utf-8?B?Y05VNEdIdURaSVdyWTBLdnZSU3M5ZjZMQ0FLalZFNmNud1FMaklPdkxCblpv?=
 =?utf-8?B?c05lcXpaQnIxaHdabVdveGpmM2hIZDRpdVZWZG4wczVaWnhFbjB5QkpaU3h6?=
 =?utf-8?B?VnZocTdEVk5YZVRHV1Q3NlNsTFFSU3JDMmtIWXA0WjlKUmVLZGFyOVI5UXAr?=
 =?utf-8?B?N1R3Y3pZVFZBMmpFdDJLU3F0a09aVmJkSlAvVG5OaG9XU09lTXE4RHNGeDRJ?=
 =?utf-8?B?d1I0SHVTNkk1YisvTW92MS84TE5EYmgvQzZVbjk1aVRDSGYwNG5kaFFMWmJ3?=
 =?utf-8?B?T1pwWDNBbkljQlFDd3hQQ2dEZlFMRzV6bGU4TnBJWDQ2WHdVeVlPbW9qRk53?=
 =?utf-8?B?bDJnZEsrOGRCdEV1L0dOY2dobFcwVmE1WnZ0c3BCamtCTnV0d1Q2KytmZzR5?=
 =?utf-8?B?NHlqM3JTSmJPQTJUN0VDOHNNTWJvRFMrbVFVNHQyL0U4Z1dQVVB0NFR1ajlL?=
 =?utf-8?B?empKUEcrSFU1a0NIcDdaWmpBRVcvVE1PNGhWZlNPNUt1aWt5SWNsRmkzYWto?=
 =?utf-8?B?dTF2NzhNVzJubms3UlI3YllyYVJzMmNPZkFRRU80Qkp0Wm9Yelp6RjFrVTYy?=
 =?utf-8?B?eGxSaUNqZnFLdzhmeXFLTnQwODZIdUdFQytlNXhSVE52c3IrbmthTkxxNDRz?=
 =?utf-8?B?VUZzUWpzTFI4d0xzQlBWRVFacUdycTRtSzh2TCtCSkJsbVpKOGdIU2xxeks4?=
 =?utf-8?Q?44+mDuBv34oU8tC/Qeu6I7DMjiISBGByhYw5abf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 819d49d7-d778-4fd0-1116-08d94b0f8099
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 23:47:00.5027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFCa1nPt1tABVaEkoQUwsHdNLT1Bg8uJxReXroGqSvfxsgekUIG+Kc34X9Kr3Z/wcJa4EA8BU5inJHpwdk9U7Em3fbiikXYn/PHCsQNYouQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2153
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/16/2021 1:16 PM, Matthew Brost wrote:
> If two requests are on the same ring, they are explicitly ordered by the
> HW. So, a submission fence is sufficient to ensure ordering when using
> the new GuC submission interface. Conversely, if two requests share a
> timeline and are on the same physical engine but different context this
> doesn't ensure ordering on the new GuC submission interface. So, a
> completion fence needs to be used to ensure ordering.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  1 -
>   drivers/gpu/drm/i915/i915_request.c               | 12 ++++++++++--
>   2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9dc1a256e185..4443cc6f5320 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -933,7 +933,6 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   	 * a request before we set the 'context_pending_disable' flag here.
>   	 */
>   	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
> -		spin_unlock_irqrestore(&ce->guc_state.lock, flags);

incorrect spinlock drop is still here. Everything else looks ok (my 
suggestion to use an engine flag stands, but can be addressed as a 
follow up).

Daniele

>   		return;
>   	}
>   	guc_id = prep_context_pending_disable(ce);
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index b48c4905d3fc..2b2b63cba06c 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -432,6 +432,7 @@ void i915_request_retire_upto(struct i915_request *rq)
>   
>   	do {
>   		tmp = list_first_entry(&tl->requests, typeof(*tmp), link);
> +		GEM_BUG_ON(!i915_request_completed(tmp));
>   	} while (i915_request_retire(tmp) && tmp != rq);
>   }
>   
> @@ -1380,6 +1381,9 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
>   	return err;
>   }
>   
> +static int
> +i915_request_await_request(struct i915_request *to, struct i915_request *from);
> +
>   int
>   i915_request_await_execution(struct i915_request *rq,
>   			     struct dma_fence *fence)
> @@ -1465,7 +1469,8 @@ i915_request_await_request(struct i915_request *to, struct i915_request *from)
>   			return ret;
>   	}
>   
> -	if (is_power_of_2(to->execution_mask | READ_ONCE(from->execution_mask)))
> +	if (!intel_engine_uses_guc(to->engine) &&
> +	    is_power_of_2(to->execution_mask | READ_ONCE(from->execution_mask)))
>   		ret = await_request_submit(to, from);
>   	else
>   		ret = emit_semaphore_wait(to, from, I915_FENCE_GFP);
> @@ -1626,6 +1631,8 @@ __i915_request_add_to_timeline(struct i915_request *rq)
>   	prev = to_request(__i915_active_fence_set(&timeline->last_request,
>   						  &rq->fence));
>   	if (prev && !__i915_request_is_complete(prev)) {
> +		bool uses_guc = intel_engine_uses_guc(rq->engine);
> +
>   		/*
>   		 * The requests are supposed to be kept in order. However,
>   		 * we need to be wary in case the timeline->last_request
> @@ -1636,7 +1643,8 @@ __i915_request_add_to_timeline(struct i915_request *rq)
>   			   i915_seqno_passed(prev->fence.seqno,
>   					     rq->fence.seqno));
>   
> -		if (is_power_of_2(READ_ONCE(prev->engine)->mask | rq->engine->mask))
> +		if ((!uses_guc && is_power_of_2(READ_ONCE(prev->engine)->mask | rq->engine->mask)) ||
> +		    (uses_guc && prev->context == rq->context))
>   			i915_sw_fence_await_sw_fence(&rq->submit,
>   						     &prev->submit,
>   						     &rq->submitq);

