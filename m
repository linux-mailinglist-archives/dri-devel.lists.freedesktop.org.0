Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCFE42AF66
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 23:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039C06E57A;
	Tue, 12 Oct 2021 21:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523476E57A;
 Tue, 12 Oct 2021 21:56:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="290772793"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="290772793"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 14:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="441403271"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 12 Oct 2021 14:56:42 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 14:56:42 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 14:56:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 12 Oct 2021 14:56:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 12 Oct 2021 14:56:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSyTTdK3bA7pIJZLeeTXHHVTGbamK6dfUT7pkgIGdU2BW3/rIMFwNmjx/yX+tTiwNrKbHfE393yrvhRpZ/QsbAbrMRn0a+WHv931Jw8d2+hkYqxNvOzhJfqvUKHwLGSZBzvd8DFo6CKaUk0d6/9BxiZ2y0oK6IzzW8LlB2yZufWWJABzMvCuXztwtJMAVPHAKk4BtvYuAZJhfEpogwkmEcndfhPH9nLIPT7dOHa3phnUfA7BCOF8T9neN/78WC9u+EUlGSHXHQm2V02ptlt6ManVW1afsHsA1wcnWqpcF7O+fRLGQ2My27+L87xmD6ACRZKAXUM5IVNsn1td84pt3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWXMRfyBPEa/wASXzKrEYUo0POFZNZvKDJvVxTV1Hlw=;
 b=MQ6En1XYCLY9BBXQdPfWp0WekSmQSSHoZCKBCwXkO/DKSzLtD5AeOBQXEZDHC1eaQ1hV5miwyirIVGoT84mLVDcZhVMoVNLHMKqpvJX8A5R1AfLMe2pjURfpwaqqrdd547AmPs02cIDmZ359wE7z2us7P/NJ2JUNRoFFUKSn9NBsk4SLO4t32SLp+cVYhGjsa2uSRngPYOcmVSfFkMnhSWZE3DOrCJ2EZBaEB0fnMGm/V1aoS4/GPDjG3pEmbnxEz8tH/8mp9QKtjR1KIWs0Hp98xMlW2cOMfNmIwP9dKJ6zJ7FLI8rTaPn8+QHtVpRdscgEbqADeTKnD8zcGrY85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWXMRfyBPEa/wASXzKrEYUo0POFZNZvKDJvVxTV1Hlw=;
 b=jSWvj6i5fwPsFUg6nsvadksU+wwHZ+Dl/OHAr9NrzLzpGnAUO+RN4KMlYXkus7RSmIh9botQynEtgCCScAW+Ao6lBG0FSkDHWy8iUhNzPij7zWqAyoHJeNC3GT7qgoLfmnR8tMhTKBzGwb4q5c/nQlv4zy6z63bxw9wXQgKFZEU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5594.namprd11.prod.outlook.com (2603:10b6:510:e4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 21:56:40 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 21:56:39 +0000
Subject: Re: [PATCH 22/26] drm/i915/guc: Handle errors in multi-lrc requests
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-23-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <9e63ab2b-55e1-5b83-45c7-4d0f8bb771f2@intel.com>
Date: Tue, 12 Oct 2021 14:56:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-23-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::11) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 21:56:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f228c356-a9c4-4efc-1d03-08d98dcb2b7f
X-MS-TrafficTypeDiagnostic: PH0PR11MB5594:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55942D0187E23E38ECA830ECBDB69@PH0PR11MB5594.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KcA7HJVbTQSIVhs7aEB8Rg6qiNuDgNvlEp0Qh8iJloKTcjCwiAEet72/uqyv3TBx4rype5zEV3c3DXNgDoeb5SrpATKJAmaddqNasQVloshxvJ9afAfduLcK0ed81cAr+ZH6+e8f3VSPe1YHDbSXWSitX1ZvmLNBKIAZR1hnsHcs+bEndtc91JW9S42rAwo9TcShhcLASjk+TL9Gr/+f1oFkJcwopqUZR2KmMqmh8ggtDFSQq7MQnA8+5XBOExVw6nN9P3rP7v0ngj47/+26oSOSm3vA9nbKugbmnnK3EcYif1ikoRemgskxdyDgHs9jC4ssscvKywi2kM3k/7+n6S54O9Jfjs+RH4/YczUi690JX8jO3KFKI42SbZHR9a8hnAJDjFiOyBvGY1QkxOnBTHTDuLVCr+FFLs/nCeL3SFfiiqjuYZpje4TdTgazikznnY2F3/Tgz0L2v1/O4uvhMcYiNcHkzfoIownyLE0HO6wJdcFkGLKIrjhRjr0sdMLzT8dO++3/RopKXdt+QDytsvDea/6QwgykRY+zUHl2r4bUX73hki6RM7NVjNHLY0V/WfgqaN2bvFu0rE9vNgVXilj0deNBtrSldzELEOxJwfFrTXUOF56BaCcHVMwtr5TEaJDkHFoSnWdaI5Dw9lixiu6KLwCfKCOAIlxZJ4fcI/+ot+84XmHkH+erq+Pp3FKgavOsiwcQ+8juwV/HQ/+iRM2HvCfYDP2UccTwQ1HoWg/QLao0jtQ7lV5Udwq7sDJn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(53546011)(186003)(8936002)(107886003)(36756003)(31686004)(83380400001)(16576012)(5660300002)(2906002)(6666004)(2616005)(6486002)(956004)(26005)(66556008)(450100002)(8676002)(66476007)(86362001)(66946007)(38100700002)(31696002)(508600001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzYyaWJFcnVFVE9qdnMwakRwYlRrMmo2NlBvZWFTKzR1RTE3YlhEMVJOR2Z5?=
 =?utf-8?B?T1JxM0lPcTJhMDJFeFdvc2IyVWczcyt6NTNhaWNJNkJPSDRkdEd4VmtKV3VS?=
 =?utf-8?B?WGg2UUVmaUVsWFl6czk5a3piSkhVZFAxN2tIbUlWUUQxZHovS2FQMitBYUc3?=
 =?utf-8?B?RkdVL3dsRG5JbzBEZ1NCb082TmVCMFYveXl5T0h4aFQ0cEYrem52WUNjVkFD?=
 =?utf-8?B?aFFaVFdIdkI0dWZoSk5ub1VIQi90WVZySGQ1c1FkM2VsMlNKUmp1ZENmdEFV?=
 =?utf-8?B?Vit4ejVqRUZDQ01QblBKN1ZkeEk0anhMSkJad2lCV0lRV2lsWnFWR2tyNlBs?=
 =?utf-8?B?YmUzOEJaUkIvM1pNRyt3NGdXcml2Tmh6OWJlaC9uZWkzbHVodVBMRmxUU0E2?=
 =?utf-8?B?L0tDT09BVkZIQjMybi9JWk9rc3BNc1pFOWQ4K2FXWjNhSzlFL2FXWjFhajRn?=
 =?utf-8?B?MnI5R2xPRzVWcGNlNXlTbG81SFJReWUrbEJ0M24vOFU1VEZmbHFHczdZUGVs?=
 =?utf-8?B?YjFJaHhIYW1lekRuVU9hZmhrUHQ2S2VKa3ZkTG5uVWdUTHBPWjR6ZjkvSzcx?=
 =?utf-8?B?Tnp0bi9qYllHWlUrOEZmMDNDNHpzWi9ubmVycUI1Uis1M1B6aXVXZWZSQ2tC?=
 =?utf-8?B?RnVwMEc1NTJMTzFLS0FzamMwdHArQWhUQW9qdTRSQXRsYk9BWDdBS2RzbzVa?=
 =?utf-8?B?VzlpVnpjZEZQRzNoVks1dm5tREMxeHByU0x2RVNQeE9LSmVKS0E2TW1oeFow?=
 =?utf-8?B?TnViRHhlbGxZL1FrTU1VM0R0eUphMlZsLzQ0SStmdmI1UG92eVlwZGZnQUJw?=
 =?utf-8?B?TVVlYW11RWFYRDdyUEZ6S0JiQWlhdWI3Y2MzWVU1WTJIYURwYkl1UkpZSjNG?=
 =?utf-8?B?NEkyR003QzExR2pHRWw5cjMvZUNITmREaGZyVzh5b09QVmdSZzlxOXpvWTA1?=
 =?utf-8?B?YllSRWllMTFxcldIZjlYdnhYN1ZjekJjTXBIamR2NEd6QVhRaWpldnM4dGgr?=
 =?utf-8?B?QnQ1SEowQlVsRjJhWEJ2T3hMbU5hTFlBdDdBWCtvYVE4blNXdTRYdHJJR1Rv?=
 =?utf-8?B?RGNBTjZiL0ZUQzJ4UXZFSmhSUVhhK1BTam1WK1hHSEVLOFVaWWRUdEFLKzVu?=
 =?utf-8?B?WW5SZHZyUXlZaDZsQkVGdDdOak1VWjlwUHVrd3ZSbnFBOWMwUjFMR2NrcWVq?=
 =?utf-8?B?M3JPRkJJUzlpUUFOVXpMeGtjS25DUmZWN0hyd1NtaFZES29sME1IM2xGWmZu?=
 =?utf-8?B?eFlRUEhPT3FoNzBtK2xwSmpqRjJNdlFKSjFBNEErY2dUMVVOYTZnSEJMckcr?=
 =?utf-8?B?Vk5vU1phM3NuTitLQmxDY3p0WjU1cFZPRjJoNkl2SGtkN2F3S2tJSEFUR0tC?=
 =?utf-8?B?YXpUUUpLRUx1aWE0Q0dhMzVJbFVZSlZOL0xYc3o1MllJUnRkVUtkOEIrQ0hZ?=
 =?utf-8?B?aE1XdVN0bFR4UVoxMHhJZW5KbTJaSFgram1maHJYTWxGREQ3U2pBNHFRVmgz?=
 =?utf-8?B?UzR6VDQ1L2t1WGI3bUlhczR6eVpqR0tHMWErMHlYTkd6VXVTRS9sK0VjZXlK?=
 =?utf-8?B?VCtpekt1NVhULy9ZUyswbkV0OGJ5SW5TR0w4dlkzQjhqeDUzSEZEeUpscTUr?=
 =?utf-8?B?MkttSmF2NjkwR1ZKd0FGOUlYNXo4MVBwUTRPZ2d6Y05tVVFFQXpMemgrSFVp?=
 =?utf-8?B?RU1TbWtyR0dHQWk0WHU3V0hqbndCYnQvc0lGd3d5WDk0VkthelYwVnJucURK?=
 =?utf-8?Q?kv0G84CpWXDaiNLtBxxu0eWYXHanlZXQlXkyEzk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f228c356-a9c4-4efc-1d03-08d98dcb2b7f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 21:56:39.8498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzL9dPH8tkOw/lM5J8OQ61uUhw4rqrjbUP5+1SW3T01AEz7QHFv0CFqpF9fbsDVEsRAUQb4wAqotyLth3lMkA7KMCV1R9aWPhTDzZTMQJvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5594
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

On 10/4/2021 15:06, Matthew Brost wrote:
> If an error occurs in the front end when multi-lrc requests are getting
> generated we need to skip these in the backend but we still need to
> emit the breadcrumbs seqno. An issues arises because with multi-lrc
> breadcrumbs there is a handshake between the parent and children to make
> forward progress. If all the requests are not present this handshake
> doesn't work. To work around this, if multi-lrc request has an error we
> skip the handshake but still emit the breadcrumbs seqno.
>
> v2:
>   (John Harrison)
>    - Add comment explaining the skipping of the handshake logic
>    - Fix typos in the commit message
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 71 ++++++++++++++++++-
>   1 file changed, 68 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 83b0d2a114af..05e8b199e4ce 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4072,8 +4072,8 @@ static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
>   }
>   
>   static u32 *
> -emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> -						 u32 *cs)
> +__emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> +						   u32 *cs)
>   {
>   	struct intel_context *ce = rq->context;
>   	u8 i;
> @@ -4101,6 +4101,46 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
>   				  get_children_go_addr(ce),
>   				  0);
>   
> +	return cs;
> +}
> +
> +/*
> + * If this true, a submission of multi-lrc requests had an error and the
> + * requests need to be skipped. The front end (execuf IOCTL) should've called
> + * i915_request_skip which squashes the BB but we still need to emit the fini
> + * breadrcrumbs seqno write. At this point we don't know how many of the
> + * requests in the multi-lrc submission were generated so we can't do the
> + * handshake between the parent and children (e.g. if 4 requests should be
> + * generated but 2nd hit an error only 1 would be seen by the GuC backend).
> + * Simply skip the handshake, but still emit the breadcrumbd seqno, if an error
> + * has occurred on any of the requests in submission / relationship.
> + */
> +static inline bool skip_handshake(struct i915_request *rq)
> +{
> +	return test_bit(I915_FENCE_FLAG_SKIP_PARALLEL, &rq->fence.flags);
> +}
> +
> +static u32 *
> +emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> +						 u32 *cs)
> +{
> +	struct intel_context *ce = rq->context;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	if (unlikely(skip_handshake(rq))) {
> +		/*
> +		 * NOP everything in
> +		 * __emit_fini_breadcrumb_parent_no_preempt_mid_batch, the -6
The line wrapping makes this look confusing. It seems like the function 
name should fit on the line before. Even if it is a few characters over 
(although the limit is now 100 not 80, I think), the checkpatch warning 
is worth the readability of the code.

> +		 * comes of the length emission below.
-> comes from the length of the emits below.

John.

> +		 */
> +		memset(cs, 0, sizeof(u32) *
> +		       (ce->engine->emit_fini_breadcrumb_dw - 6));
> +		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
> +	} else {
> +		cs = __emit_fini_breadcrumb_parent_no_preempt_mid_batch(rq, cs);
> +	}
> +
>   	/* Emit fini breadcrumb */
>   	cs = gen8_emit_ggtt_write(cs,
>   				  rq->fence.seqno,
> @@ -4117,7 +4157,8 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
>   }
>   
>   static u32 *
> -emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs)
> +__emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
> +						  u32 *cs)
>   {
>   	struct intel_context *ce = rq->context;
>   	struct intel_context *parent = intel_context_to_parent(ce);
> @@ -4144,6 +4185,30 @@ emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs
>   	*cs++ = get_children_go_addr(parent);
>   	*cs++ = 0;
>   
> +	return cs;
> +}
> +
> +static u32 *
> +emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
> +						u32 *cs)
> +{
> +	struct intel_context *ce = rq->context;
> +
> +	GEM_BUG_ON(!intel_context_is_child(ce));
> +
> +	if (unlikely(skip_handshake(rq))) {
> +		/*
> +		 * NOP everything in
> +		 * __emit_fini_breadcrumb_child_no_preempt_mid_batch, the -6
> +		 * comes from the length the emission below.
> +		 */
> +		memset(cs, 0, sizeof(u32) *
> +		       (ce->engine->emit_fini_breadcrumb_dw - 6));
> +		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
> +	} else {
> +		cs = __emit_fini_breadcrumb_child_no_preempt_mid_batch(rq, cs);
> +	}
> +
>   	/* Emit fini breadcrumb */
>   	cs = gen8_emit_ggtt_write(cs,
>   				  rq->fence.seqno,

