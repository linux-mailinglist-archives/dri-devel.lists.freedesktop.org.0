Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3BD3F6D08
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 03:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB1D6E0F3;
	Wed, 25 Aug 2021 01:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33D06E0F3;
 Wed, 25 Aug 2021 01:20:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278441933"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="278441933"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 18:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="444005145"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 24 Aug 2021 18:20:56 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 24 Aug 2021 18:20:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 24 Aug 2021 18:20:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 24 Aug 2021 18:20:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXhGaLYi7lzLyLQxNb2v1GGXOAcegVh20AQHHt2hLmJv8PPEBZmR2OqTAAeNkZniCysJGXoeGcxEkmHdfThf6em1F+S1+AEBl4Csm0rPXrwciQziMedoXOjk/Imxd4m851JC7UoyyBtWkvgebIxNbDGHZWWKTntP+VmVuae4DVIYY2J0kP61GRQtEsQ6I1m/oFWx4R54jPuHwao8QiPJsCGa7/CWhAP0kl2VscNG1urEJLET96R0itBoXds+zu/ItX3qzp61sYBu7jQSV6NwT1K+o0SQZtgRLtVsZjk4nkbQYlmcP0//eyWBSqB1vNZQxw7MYCKLzuqIT+B/75XFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvEZ4JyTEbx347PomtsEGiOQqVBcEyJmm1YZhgn4C6I=;
 b=dFr0Le6g1Ynv9Vm4KN4F61lyu7CxRXjbzH1Gx6SOTtFbi06YNe8CDxTDVuj9qznBS/fr10yzIS4PsEjbnRwG6xLzcebA4CMaAok6c2Tn4ELEHGO4/p/KQas9/zm/HaPQ7AkF7merDui9unERER/mQTAMMS/YxB/GmqiDoSeSy98FAM5YxcKIdhwLC7+J7ighnQYb7dlPzljWeJlhvhW8CpJgi+SpKpQQ44dwjRyUwhXZs+Z74Vtp1C1Uf8ssDUtx443HF71l84TjWp9tt24+sk5/9ml2xJZVrSm4IoKlWGKTuuDC8S9yltzTNky5s69jCtk/T1wz/o7IqEtERVzNyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvEZ4JyTEbx347PomtsEGiOQqVBcEyJmm1YZhgn4C6I=;
 b=iELftWsybIpbWZG0PHN3YNbOJBuwA7hL1ryizaqtRDJZqop2mxZOqv3Gs2/IkDoEd3SPq2lpTXYXsnzQfn6CE9uo+xrZT34zmMG2h+7oNASf8mOFMB4xHNqVR2g/udP/Bq2cfj2BUiHcnOKzVJJNwzAZpNk6kfh+kEm91q6F4h4=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH2PR11MB4341.namprd11.prod.outlook.com (2603:10b6:610:3c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 01:20:52 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e%9]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 01:20:52 +0000
Subject: Re: [Intel-gfx] [PATCH 14/27] drm/i915/guc: Don't touch
 guc_state.sched_state without a lock
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-15-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <c7a09b2d-b5f2-49ea-01b9-f9b9fbbe7824@intel.com>
Date: Tue, 24 Aug 2021 18:20:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-15-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 BY5PR03CA0012.namprd03.prod.outlook.com (2603:10b6:a03:1e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 01:20:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7275284-cce0-4e00-8113-08d967669413
X-MS-TrafficTypeDiagnostic: CH2PR11MB4341:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR11MB43416EB4678D04497CE39778F4C69@CH2PR11MB4341.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NSg44GLfvNXIaPTk7mKP1xyzkErSFTGJsqAKd9LRFZvEWAkHy+Q+4N275dbMRFnigEbGI0EYLFaBOeiYup5ZTRnMvQ9mx3X+6T4hgaRUAOeEFb0TZ4ghgRfYQVdt5qlQWVQMyQ8NFrFbk0mu9G4bnqwPNJdYjEyXAUf+qz2vE6GHEw9ci8V3JpB08+wqPjaIElSTRuYlUJ6S9hqQyF6W3T/Hjkpbu+qVgZNZ19EqqI2puAlKx6ad8Xim3QHaZW6zeMJ6VnLkOvfj8APYIjyRmTWv8IBizVAyYbaDWX6L/2EFT3eRS8u/AOYmwIgW65JmCaEwRoJOCkpCkWZnpLqrB8iRu5xr8/vS1MMk2GHThkfhg0eXcaU/nKK6as1KbOMYYPfx1YqbOzO1071dMWg6N3lgwHmZlzquPtmZAYyzpEWELrm+r24fx+QI0KHBbg9Gyof/LEq+7Fax6ECRAPnjZwa10sKhYvg1jget0nCFSknLWcy8hnldf0nOpKgR3xHRZyJf5JMGIc4DA9heSyws92kwEMu6QD8a+bUkXeZb42esH7gJ+23DYM5AVf3rLHbr8L3K9YXB6ObE8olpXgcD0VsJFX6CgHqIvwjdTOmu2FDsQrUFu4tXOIzeRrZ0m0D8Qp5icEm9wHAKM1PUj68uijwGjhDTV5b+vOD/ghVIiftiLu67lxPgkV5akVH8/FCVRcjpsoZYm9IamobfbNER+JjibW/uFV7AbwDSkbj8kOGMx0bGcHYHmO4GG58qdXmudll2N/fA7ZizllI44lyr9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(316002)(66556008)(66946007)(31696002)(66476007)(86362001)(16576012)(2616005)(8936002)(8676002)(31686004)(956004)(5660300002)(83380400001)(478600001)(6486002)(38100700002)(26005)(186003)(36756003)(4326008)(2906002)(53546011)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alBYaWFvTEZBSjUxMVNuNFpwTTYrTlF0UkI2Uy9xdmhjT2NMbWI2NlRDSjNP?=
 =?utf-8?B?QmNOdE9qcWNwa3g0ZVB3bXNyL1hvVUVCb1N6RXZBT0MvU1g4YWJ3ZmN5c2pW?=
 =?utf-8?B?TjdqWVJLT3I2emxCOVRDR1V5WVIvb1lKS2hTYmhBWDdOWnFkU0tJbWVRMndT?=
 =?utf-8?B?M2lGaTdUVk82Yy9GZmw4UDlQampYNUN1NzBGaWovUk1PTVZzR3NrQnhVN0hs?=
 =?utf-8?B?R0lYem9nTjBZNXFtdkpFaGlQVGpnUkwxTVpManhYN0cyM242cGJOYXBtQW50?=
 =?utf-8?B?bGVhR1ZncEZTMUIvWUhIZlNEZmtJU2JnTUJZR2NCQk5DVWN2YkZiVGpDT0NB?=
 =?utf-8?B?aU5FV0tTUG55R1ZlYndiNnFOSEZieEpFTDU4VnFrOGo2a2wrY1FLTzRrbkNq?=
 =?utf-8?B?SUlJYURpa0VoWmNDT2gzdVpoZkxiVWNvYS91enNkSFdUOXVQaEludjlqZ2Nn?=
 =?utf-8?B?bkx5QlByU09COEg5S21ZdnNXVjR1aXkwc1JWcFhnRlFOb2FSLzlxVlU2Zys5?=
 =?utf-8?B?eU5PTDM3VU43VER5MkdhY05qWnpZaHdwenhtTWhUcWN5cmExOTl0UHI1cjZI?=
 =?utf-8?B?RCsvbXI0VEhjbG90YlY3UUxzZmhsQksrZjhzUGF6UjlmS0xWdkpPRmd1QVd4?=
 =?utf-8?B?cTdlT1QyVEhkN0R5VjcxOVNqVTNWSGN2UC8vRnhGUnZFcDlhQllJVmRlSDN0?=
 =?utf-8?B?eVo1dk1mQlpTS3U1ZWRYcitKZnpMdjRsQ3d2Y1BlL2dnMGltK3V3dDVYaHV2?=
 =?utf-8?B?M3EyTU5kekhUNzFhN1JuL3grMVRHYU5vSUpnNHdxcXJKdkc0Z3U4cE8yRnY3?=
 =?utf-8?B?bmpUejRpTENQTUdzV3RteGpWYmwrNTdzVWVNZ2lDbmx2Y2ZKd1ptWFplT3hr?=
 =?utf-8?B?UkdPandBc09LR3FINjV1cUVGZmdRZ0pqeW5aSnVQTVk5NzgvS2xudDVadG05?=
 =?utf-8?B?RGczcEhLYi8vQytxTHhRZVlvSkRVSVpBdGhVNEErcHZtZGloTUxBbEE1RWV3?=
 =?utf-8?B?bGI3SXZRcEdvbDZuTnh4bHB1K1JUSWdXbUovcDlKQ3Z2dmtzUW1zUzRIcUJ1?=
 =?utf-8?B?cDBNalpNT1hSMmhISzBhV0Y3eHp3WlV6UkdkZFJac0RzcXpBUG42OEpUYk9O?=
 =?utf-8?B?NzczVWx3dGQyYm12U3M5ME5lVms1SjVmdGZWRmxhVE53d2psQnVmUGtWbXMw?=
 =?utf-8?B?UlpUbGlCdnZyZ3ZnRmlsYW9mbmo5OEtldm5PaG1YRzBjdE52VWZTQ3JkUEtw?=
 =?utf-8?B?cHlBZi9nVFhyZnpjK2NyVkp1MS9saE9qU0RlT2xPSURPdGRGUmYwZ1VWSVQz?=
 =?utf-8?B?WHBiSmpCWk1yT1lsZGZYUUdJRS9EUDNKVGE5TmVaR1B6UHBaWDZod29oQ0hI?=
 =?utf-8?B?b0ZhZFhoVDJ3dllQeVByK2RPaHk5ZElaa25ZRUdraktPa0cxa2o4ZjNqdGk4?=
 =?utf-8?B?NnNyZCswdzIzVndUeVl6L1ZBZW1COEd2R29QNjVHcktNQndDamJ3eXFWM01H?=
 =?utf-8?B?OUx5NmEzSlNadVR4MUYySlRXNFAxVUE1S0lSU29ZY0s4U3FyeXVwenk4QzdS?=
 =?utf-8?B?anhMY0VscXJVc2ZaVXF4dlFpL0VFS2RDOURBdzR0NmdWSGpVd3R0T0tLMWRw?=
 =?utf-8?B?YThUVVBzalg0QkUybnBUbjlzWllpYmc4UnVCdEhRdTcrMVErT3VKSzJrSE4x?=
 =?utf-8?B?Z2hoZ0FHSFV3Tmc3TCtoWVp5QzdndGxvcjc5SUd6T01mTDdzc0ZoaGFjcFNM?=
 =?utf-8?Q?reaaP/wsLtoGSk+ogUy1nZLuNI1dSImZ5ia/1rL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7275284-cce0-4e00-8113-08d967669413
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 01:20:51.9661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvrjlAtynxZ311rMXYQ+moEG8+oIImpH2iAzZN85xuH4b1aLgotSE4O5QNdbOnRHWOCQVJf4WTl/VsYEHUPfmQKIy5a4ct4rNSbWw46rsHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4341
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
> Before we did some clever tricks to not use the a lock when touching
> guc_state.sched_state in certain cases. Don't do that, enforce the use
> of the lock.
>
> Part of this is removing a dead code path from guc_lrc_desc_pin where a
> context could be deregistered when the aforementioned function was
> called from the submission path. Remove this dead code and add a
> GEM_BUG_ON if this path is ever attempted to be used.
>
> v2:
>   (kernel test robo )
>    - Add __maybe_unused to sched_state_is_init()
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 58 ++++++++++---------
>   1 file changed, 32 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 85f96d325048..fa87470ea576 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -150,11 +150,23 @@ static inline void clr_context_registered(struct intel_context *ce)
>   #define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
>   static inline void init_sched_state(struct intel_context *ce)
>   {
> -	/* Only should be called from guc_lrc_desc_pin() */
> +	lockdep_assert_held(&ce->guc_state.lock);
>   	atomic_set(&ce->guc_sched_state_no_lock, 0);
>   	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;
>   }
>   
> +__maybe_unused
> +static bool sched_state_is_init(struct intel_context *ce)
> +{
> +	/*
> +	 * XXX: Kernel contexts can have SCHED_STATE_NO_LOCK_REGISTERED after
> +	 * suspend.
> +	 */

This seems like something we want to fix. Not a blocker for this, but we 
can add it to the list.

> +	return !(atomic_read(&ce->guc_sched_state_no_lock) &
> +		 ~SCHED_STATE_NO_LOCK_REGISTERED) &&
> +		!(ce->guc_state.sched_state &= ~SCHED_STATE_BLOCKED_MASK);
> +}
> +
>   static inline bool
>   context_wait_for_deregister_to_register(struct intel_context *ce)
>   {
> @@ -165,7 +177,7 @@ context_wait_for_deregister_to_register(struct intel_context *ce)
>   static inline void
>   set_context_wait_for_deregister_to_register(struct intel_context *ce)
>   {
> -	/* Only should be called from guc_lrc_desc_pin() without lock */
> +	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state |=
>   		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
>   }
> @@ -605,9 +617,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   	bool pending_disable, pending_enable, deregister, destroyed, banned;
>   
>   	xa_for_each(&guc->context_lookup, index, ce) {
> -		/* Flush context */
>   		spin_lock_irqsave(&ce->guc_state.lock, flags);
> -		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
>   		/*
>   		 * Once we are at this point submission_disabled() is guaranteed
> @@ -623,6 +633,8 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   		banned = context_banned(ce);
>   		init_sched_state(ce);
>   
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
>   		if (pending_enable || destroyed || deregister) {
>   			decr_outstanding_submission_g2h(guc);
>   			if (deregister)
> @@ -1325,6 +1337,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	int ret = 0;
>   
>   	GEM_BUG_ON(!engine->mask);
> +	GEM_BUG_ON(!sched_state_is_init(ce));
>   
>   	/*
>   	 * Ensure LRC + CT vmas are is same region as write barrier is done
> @@ -1353,7 +1366,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	desc->priority = ce->guc_prio;
>   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   	guc_context_policy_init(engine, desc);
> -	init_sched_state(ce);
>   
>   	/*
>   	 * The context_lookup xarray is used to determine if the hardware
> @@ -1364,26 +1376,23 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	 * registering this context.
>   	 */
>   	if (context_registered) {
> +		bool disabled;
> +		unsigned long flags;
> +
>   		trace_intel_context_steal_guc_id(ce);
> -		if (!loop) {
> +		GEM_BUG_ON(!loop);
> +
> +		/* Seal race with Reset */
> +		spin_lock_irqsave(&ce->guc_state.lock, flags);
> +		disabled = submission_disabled(guc);
> +		if (likely(!disabled)) {
>   			set_context_wait_for_deregister_to_register(ce);
>   			intel_context_get(ce);
> -		} else {
> -			bool disabled;
> -			unsigned long flags;
> -
> -			/* Seal race with Reset */
> -			spin_lock_irqsave(&ce->guc_state.lock, flags);
> -			disabled = submission_disabled(guc);
> -			if (likely(!disabled)) {
> -				set_context_wait_for_deregister_to_register(ce);
> -				intel_context_get(ce);
> -			}
> -			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> -			if (unlikely(disabled)) {
> -				reset_lrc_desc(guc, desc_idx);
> -				return 0;	/* Will get registered later */
> -			}
> +		}
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +		if (unlikely(disabled)) {
> +			reset_lrc_desc(guc, desc_idx);
> +			return 0;	/* Will get registered later */
>   		}
>   
>   		/*
> @@ -1392,10 +1401,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   		 */
>   		with_intel_runtime_pm(runtime_pm, wakeref)
>   			ret = deregister_context(ce, ce->guc_id, loop);
> -		if (unlikely(ret == -EBUSY)) {
> -			clr_context_wait_for_deregister_to_register(ce);
> -			intel_context_put(ce);

Why is the EBUSY case not applicable anymore?

Daniele

> -		} else if (unlikely(ret == -ENODEV)) {
> +		if (unlikely(ret == -ENODEV)) {
>   			ret = 0;	/* Will get registered later */
>   		}
>   	} else {

