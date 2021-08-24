Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959AC3F6C40
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 01:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220556E0ED;
	Tue, 24 Aug 2021 23:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410A86E0ED;
 Tue, 24 Aug 2021 23:31:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217421437"
X-IronPort-AV: E=Sophos;i="5.84,348,1620716400"; d="scan'208";a="217421437"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 16:31:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,348,1620716400"; d="scan'208";a="425624676"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 24 Aug 2021 16:31:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 24 Aug 2021 16:31:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 24 Aug 2021 16:31:26 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 24 Aug 2021 16:31:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMVdOaY/d5UG8HltBlyLunLBm3q5DKj1nTv1PE1ChWBX2M84hHnUiQqhMILVCmlKEs22rFbd156GzpJmEfxu86Kw2fK2cjZ/tQ6xOjW9xLh52o1NOAy1q6MuHTsrq6zGiIfzNfSv9oW1YHHPiQB6OcCmH6sxcnk6WTf14TzWG7pwV3hZkSLJdFC9gl2/1prvkCfeI3AqsY+LtzEstWb1R4kbFPnLXXYTCtongdN6fZ79OGfVR5DXxpB6a2anD3R7VWIcc07UTDKtSGjfa7Qj6pMPiWSft6E1Tx2V8GwvQXQ3YllJSk8Ud6KwqP9IVjNbZRfukSbe2TeiIGz2gclKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aexR2zKJIar35ZeGJak/slbcMy2qCr0aA8sFxLsVhOM=;
 b=T4d08fM2yBjYIkKf8q2yDVybEB3hni8GEz0SlxpZQgH1acifIw59IhtepX8cVZXnXOXB0RLldncskNBrTtzVtnSnWn7nMOGIOahY3wF7QLJUv1kM/F82R3qiryu7+P+DEsCEtShQOTGLP1/qkY+5KhEeC5SFtnXJ2FhvY1kj6YfTSjmlozIb1y48EdnJWkBOe5oc4yhSeBq87H2wG1QP470Zgz2n6jQwxBp8SEB0cHyqtWekqZlFxWTUIPt90aqFYW8d2cV3B7V7dUoGyBd9iK5ktFOdFibIegnK7fhQXDk01wjPBb32RRSgXjITTCeX3yZYNBXhbHBH5WS7SQAE5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aexR2zKJIar35ZeGJak/slbcMy2qCr0aA8sFxLsVhOM=;
 b=ipS0kTHdKkz8QU9QxFE+Jvja5Nc4UpXMIKx0/SpdS9zntgVlW6epnmqKfovX91WChNgWnwb0paL7IB/ozx83NWccNmfO/cu41YkzXPSKgYBDpFXHlLjT4+y9nZ67rRdDZT0ONvkLbAoA+SrDOs6j1FAguGhH+HLJgGXUqKxTc0c=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH2PR11MB4309.namprd11.prod.outlook.com (2603:10b6:610:44::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 24 Aug
 2021 23:31:25 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e%9]) with mapi id 15.20.4457.017; Tue, 24 Aug 2021
 23:31:25 +0000
Subject: Re: [Intel-gfx] [PATCH 06/27] drm/i915/guc: Workaround reset G2H is
 received after schedule done G2H
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-7-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <5015ca18-7237-b101-8afa-0cd17ef98aed@intel.com>
Date: Tue, 24 Aug 2021 16:31:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MWHPR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:300:ee::13) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MWHPR04CA0027.namprd04.prod.outlook.com (2603:10b6:300:ee::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 23:31:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bbcde14-81b5-43e1-31bf-08d967574a02
X-MS-TrafficTypeDiagnostic: CH2PR11MB4309:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR11MB4309F72F3F2E81C8882908A3F4C59@CH2PR11MB4309.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8qzJB/eCNMEm7Z/e8zUQHiQS0GGUAxwiBlcNQEen8EbXa/poZJADZrnBYYg8pd+00fxxfkgwpAiizp/15mIiv5YAoRwQQjHcMKBkizIUBNC2XJgvUCNYMPDA6D18+nmrjDJgTILybVa+pGjNNJvqzQvQlvkjKqEOxF3w3nfoppsW1dnRBqthM+4O0lGdHU461MyZ5e1h8uS7tSqgSRNAOBLJJav93zVcpKyjKJs7xfTEZA9P0KipaH4m28VnVOIAHA1DVOsKUKM/3Es9Kc1laIpyds+8B3XWJ4fsb3iu1It37Pdn5D8Os19oPjK82xoEkPaPsrcQxLyxrKCeJs3sWLzAHVDQF6RXle4kcFFNdH3pBsBuUJMQ8m5elH6T701tLnPTJ5JPR43+WGMKu5KHvQiFbqzzrOCVSEi450B/yOQnA1h+AWzTSi6ZOTTquzp5wuxapfa5x6r0Akb9kl8gbqZ+2ma3bQaOLMIHGD4lz5Mhe4Lkh/V/f3AphINaKtf4xcCQXQ7s6de5AuvkYml/H0S7u7pxO0MoS/zFA7bSQQOUN8A9n2AGyF7EkjXAc2VFUz6mKj9MI23cmQrizlAlAP9PELpjBXR+bpQd441H0NSKQkUHca+AlljFbjbj0Tvayp9YBclSdc9AZaKdkAIC9Shnlk1SMdkXS6iUVT90qVYwjq8io0HvNzy9Cm+leNB1MyZePd0MlvFivLL1yJLwG0xiKtax2ORTVIq/26kPpYCk3Wgl/GFPuoimoKY7CSQFQrCUutTcFxwdI5cJ6wkW7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(83380400001)(31686004)(16576012)(2906002)(8936002)(8676002)(36756003)(26005)(2616005)(316002)(956004)(6486002)(6666004)(38100700002)(66946007)(4326008)(53546011)(478600001)(186003)(5660300002)(86362001)(66476007)(31696002)(66556008)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXhURHEzMVFxWERCMkZ0Y2R2aXByb3I3b2szUUJOTmd3cy9YaGx5Q2RNMzJ1?=
 =?utf-8?B?NHBzZXBmTjhXY1dWa1BQZ3NzU0dybGdhS0VjMCtlcnFkYzV0L0RudHNoYXBm?=
 =?utf-8?B?ZmxmWjJMSDR6NGhBam02MVhSYStlVlRuZ3JmU2ZrYXVsUWpiWE1NMG5UWGQr?=
 =?utf-8?B?a1dxaExxUzRjdVo2SHkva3o3Q0xQR0YyRTlCVTNHTncwNmEwWGQ2SzFWSGV6?=
 =?utf-8?B?MURXcmNTaDR6V2FDZzRUZ2hoWlFOcTAyS01LWEExOHRJbDAyelZCL2RSOERt?=
 =?utf-8?B?OG1OZ0thUDdDZmcveHdLV3lXUXh2UE1qU3VIRzFVSHowdzErSERYRkozYzdH?=
 =?utf-8?B?SEQyUVBiZlk3MU9TSXk2c0Y2TGN4Y24zeHN4d2F5aEdRd2kzY0VUM2VOeWI0?=
 =?utf-8?B?RnFnVVhVbXI0b2srRFRpenlGc1ZEUFcxZXhuU2NCdXZjMGx5YnZob1ZiMDBP?=
 =?utf-8?B?clNDS3duZHhVVDBnY3hYWWwxT0dZdFZjS1FkS2lyQmhVWlVqV3NmOEtCZnl3?=
 =?utf-8?B?U3N5bWFYUFZMQ25lNTBzUW5xTFk2Q0xiTGIxQjBhNWw3bndrd0MzV2tJVm5v?=
 =?utf-8?B?anFsK2dUdE1IWmRzUUNBd01XZjRGaFlmeVdESFg5WWhUTFZINmdoMFhjcVh1?=
 =?utf-8?B?VStrRDQ0ZEJpbENjN3FxTlhRVVFkVG5ZbTRyVEhxL09ORk5DemY5Y3dzOVlE?=
 =?utf-8?B?bjE2UGNLVk41MHBmWUNtNERxckpEYzdaU3FJS3JtM1lZS0ZjaWs4VUtRR1Zz?=
 =?utf-8?B?TTRZbGpLcmp2TGlWTVZKMzlmVUdFSkJuWk4wMytrbkxIcVY5bDZJUmtWSE1p?=
 =?utf-8?B?NWRaNDZTZnVzcGtjUENJTXBMK1dKMWY5S1FLTkpEajZ2UXg3TE8vYmxtY2Zx?=
 =?utf-8?B?bUVrOUNEUjhmMjU5MEJOQ2JoRlJKMVZJb1laZWpvWlZtM0g1alVaaHJla0Zp?=
 =?utf-8?B?NHhaWUU3ZkpORkUzTDdFOEY4QnBHZGNzRHZCZWprQ3hRRzZjczRaY1o3U1Bv?=
 =?utf-8?B?SkNyR3dLRlRDVCtYSkZJMVNCNkNLdUN5SytwRUY2bE1zSTBZWEFwTkh2TUd1?=
 =?utf-8?B?THBkczl0cTFLaWRNOGpQdTBBbU5GcE5wZktXV3c3amR1WUwyM3hiLy9oYUIr?=
 =?utf-8?B?TVpJWWVYVUF0cXkrZ3BvTGdxT3d3Q1NqcFdjanAvQWxZMlQ5MlNGUG1EMGp3?=
 =?utf-8?B?dThMSjAxYlZxZSs1eElDRFhlYmVEOHdqbTJ1NTRtZjhwajkwOGFBdFFXdnZU?=
 =?utf-8?B?eGVqOFNDTWcwVWE4N3FhTEpkeTFuV3Q1NVpRdDNuVll1NHRUNmUzcjkzNVc3?=
 =?utf-8?B?RVVYZ2t0NHZRcFZrTllueEFUMnRzbkhrdmp2VFgvMnFEMnlRTTlZWjM4TTl0?=
 =?utf-8?B?ZExVaGRvLzk2NWV2S1o4ZUtCZm01N0o0bkpBaXJuYWpuWTkzNWtSSElURE9j?=
 =?utf-8?B?MklaMWVoSjJPMWtqOWIrc1MyYnpGU1JKT2lQVHBIT091K1JBTStZandDbXp0?=
 =?utf-8?B?aFRXL1pzRVBwamtDTmg1UGpCNmRsOXk5TkFQbFQwSjlPTktwMlQ0aFVDTE9y?=
 =?utf-8?B?NUQ5SU5uUG5qbjZpbkdlQ29rS1JGUVhDdE1DZ2VpbFRreS9HV0hUalh0TjlR?=
 =?utf-8?B?N21EUjJoeGNtV09WZWQ0ZnlkYkptd2h1OEVsdjlGQXZPNnd5QTYrbjVmelhn?=
 =?utf-8?B?V1NaRTFmSXlvQ1E4V3J1RnZlVFRlTzdVK1EvTzM4a2ZPUS9yLzdSQVdhTkhk?=
 =?utf-8?Q?sYNUh69SZp71aTbBMII+r0tvrtgS3ca/cBpgc0c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbcde14-81b5-43e1-31bf-08d967574a02
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 23:31:25.3130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvOqeEe4Zx+CDF5kDKtARgR6MFmoqoLF0OG8KbwLGPJyl4mhTk4sgwO7fKw3vF0K7VBYrFouxFGJslxnfZBi/jXotiQrG7KhGP8PZjTS0Aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4309
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
> If the context is reset as a result of the request cancelation the
> context reset G2H is received after schedule disable done G2H which is
> likely the wrong order. The schedule disable done G2H release the
> waiting request cancelation code which resubmits the context. This races
> with the context reset G2H which also wants to resubmit the context but
> in this case it really should be a NOP as request cancelation code owns
> the resubmit. Use some clever tricks of checking the context state to
> seal this race until if / when the GuC firmware is fixed.

Did you raise this with the GuC team? If it's a GuC issue we definitely 
want a fix there ASAP so we can drop any i915-side WAs.

>
> v2:
>   (Checkpatch)
>    - Fix typos
>
> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 43 ++++++++++++++++---
>   1 file changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index e4a099f8f820..8f7a11e65ef5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -832,17 +832,35 @@ __unwind_incomplete_requests(struct intel_context *ce)
>   static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   {
>   	struct i915_request *rq;
> +	unsigned long flags;
>   	u32 head;
> +	bool skip = false;
>   
>   	intel_context_get(ce);
>   
>   	/*
> -	 * GuC will implicitly mark the context as non-schedulable
> -	 * when it sends the reset notification. Make sure our state
> -	 * reflects this change. The context will be marked enabled
> -	 * on resubmission.
> +	 * GuC will implicitly mark the context as non-schedulable when it sends
> +	 * the reset notification. Make sure our state reflects this change. The
> +	 * context will be marked enabled on resubmission.
> +	 *
> +	 * XXX: If the context is reset as a result of the request cancellation
> +	 * this G2H is received after the schedule disable complete G2H which is
> +	 * likely wrong as this creates a race between the request cancellation
> +	 * code re-submitting the context and this G2H handler. This likely
> +	 * should be fixed in the GuC but until if / when that gets fixed we
> +	 * need to workaround this. Convert this function to a NOP if a pending
> +	 * enable is in flight as this indicates that a request cancellation has
> +	 * occurred.
>   	 */

IMO this comment sounds like we're not clear on expected behavior. 
Either the ordering is wrong, in which case we have a GuC bug and this 
is a temporary WA, or the ordering is allowed and we need to cope with 
it. The way the comment is written sounds like we're not sure.

Code changes look ok.

Daniele

> -	clr_context_enabled(ce);
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	if (likely(!context_pending_enable(ce))) {
> +		clr_context_enabled(ce);
> +	} else {
> +		skip = true;
> +	}
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +	if (unlikely(skip))
> +		goto out_put;
>   
>   	rq = intel_context_find_active_request(ce);
>   	if (!rq) {
> @@ -861,6 +879,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   out_replay:
>   	guc_reset_state(ce, head, stalled);
>   	__unwind_incomplete_requests(ce);
> +out_put:
>   	intel_context_put(ce);
>   }
>   
> @@ -1605,6 +1624,13 @@ static void guc_context_cancel_request(struct intel_context *ce,
>   			guc_reset_state(ce, intel_ring_wrap(ce->ring, rq->head),
>   					true);
>   		}
> +
> +		/*
> +		 * XXX: Racey if context is reset, see comment in
> +		 * __guc_reset_context().
> +		 */
> +		flush_work(&ce_to_guc(ce)->ct.requests.worker);
> +
>   		guc_context_unblock(ce);
>   	}
>   }
> @@ -2719,7 +2745,12 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>   {
>   	trace_intel_context_reset(ce);
>   
> -	if (likely(!intel_context_is_banned(ce))) {
> +	/*
> +	 * XXX: Racey if request cancellation has occurred, see comment in
> +	 * __guc_reset_context().
> +	 */
> +	if (likely(!intel_context_is_banned(ce) &&
> +		   !context_blocked(ce))) {
>   		capture_error_state(guc, ce);
>   		guc_context_replay(ce);
>   	}

