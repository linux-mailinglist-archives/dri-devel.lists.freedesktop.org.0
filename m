Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E50F3F3408
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 20:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499F46EB03;
	Fri, 20 Aug 2021 18:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9CB6EAF0;
 Fri, 20 Aug 2021 18:42:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="302411723"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="302411723"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 11:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="425112406"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 20 Aug 2021 11:42:46 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 20 Aug 2021 11:42:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 20 Aug 2021 11:42:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 20 Aug 2021 11:42:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pd9PBF/zjRkIizVV2ClZzOo07udKljN5EovSnyg1HBScml+mGSmHDLn038iSiwP2Q3MW0sFOYGgLUk95/RysSHThhJpli3TFKPDEwz4+zmDAz1Mv3iCgQ0IDRsAJfpCUU/T/ilIlfXGkg6MHTfnrmNEnbElozNaJu5SO6SW6uqJKjotYLzoR/3jSUU3l7QrW6fJz0h6tGCzDFbNW8A1c4jz9Y8Jmk3PWEo8BcW9xJ/Ju2zj2QAvufXot5Jgso2UgwCahpvTxEen/YfPQECbDSvCQvl+Hh1/sUOT/5gIFFxG1iBzJgRcPADUTxqzDNXpE5+9ax/FChbm2dYvuaJSFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znX4BKtvVXpPKxsn8t67GE5b55bP/sMX9RDzTLuAa70=;
 b=b03q4Qa3vmWKdyQZqNYgI9HwBSW2ozktSnJavmX3nOtuzLd9RoU3d0yq92Hj19YHI1lGCoj74kav5Ryq8C6akBZ04L5XRFerpR95fljT2nLmWzzkYFyU9YqJ/47/qAv8LYGw3FBFiMwc7ITvdEjLjvBWusorLuaB6h4mLJM/oW9YhKk8tvW8Geq7UGjrrrXy7Zv7VzZxk+qHwpbLPw/J36OP2m/hnBlTwjDtrNexMOw14HEB8lF1pDe8tEio3ZPwbfxO0j4SwQt79fWQcXECw1/XZdMBoX5erCWKJOVDDij+5Pexlsdol22ANPD+OcDqceELKzdtnJl64tQnsy2abA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znX4BKtvVXpPKxsn8t67GE5b55bP/sMX9RDzTLuAa70=;
 b=AylxumdoCUv9Wqcuzm0DqK1BRZUJApRoUhuBSu47z9BWjjt25I+d1+lJqNlYrizqCcIPbvcjJDzad8oKv+EEurnpOXwfDOLqcEHVhclDaR2nxWnZF52bzqBUq0Yce/tcFln0m4somKQh8zQEl/CGphOJhO9NdTZhvDr5vF1ox9g=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH0PR11MB5233.namprd11.prod.outlook.com (2603:10b6:610:e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Fri, 20 Aug
 2021 18:42:41 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::202c:3305:3dc6:3b3d]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::202c:3305:3dc6:3b3d%3]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 18:42:41 +0000
Subject: Re: [Intel-gfx] [PATCH 10/27] drm/i915/guc: Don't enable scheduling
 on a banned context, guc_id invalid, not registered
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-11-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ee8d2276-99cb-e7aa-7a60-97f0774105a4@intel.com>
Date: Fri, 20 Aug 2021 11:42:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-11-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: MWHPR19CA0001.namprd19.prod.outlook.com
 (2603:10b6:300:d4::11) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MWHPR19CA0001.namprd19.prod.outlook.com (2603:10b6:300:d4::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 18:42:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73781a1d-b649-40c8-8456-08d9640a4abe
X-MS-TrafficTypeDiagnostic: CH0PR11MB5233:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR11MB523387BEC691CD9F20235B92F4C19@CH0PR11MB5233.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZHKkTcjl5io6j1CT0yX4wfTyARNgxLrRMBDxG7pLc6fVZauGLFFttJQE4LntDKxeBu5iBJFZ6u58oqnOqxjhcsG5B4bl3p831Xabxki7h1liokqrYNq8IdCegWwnr9XdEa8bv+NUBtBkRYuaV79hYKhUuV1Nm6GZlqGbr52mITHGbLscw+d3izaQks+j9mcyNscsY6zh+volblth8jBR9pSL6rAIGeRddHELjDAkQQ3YIuxfjOfMBjY3eCcv8LMQofgVDuHV/9Ti78h/jHbIiyvxSji6gGPXNNIjqMSdylrb8+sl33sXJ8T4DPi+gRHG1NzV2qdQg9YrLxWR4kEkiPMR6fvUOVjzHjfKLepwTZOG6weX8tfpy0FcjUBEMbiKs5fZkvfo1vN+sT/5aH36MEfwPWL9SP7mqLmn/eDpYCFfrlsAsvupZqV3668iYlmvVcxDXG2aGs4J+WhYbdZOR4uRQlEQLJTy0lqsYdHdFkvDiyQNma+o/7DmNqmdrh7peh0AFbeS0vvZaUcIWnzM/cQOZ6t5TUG4cLvxzLl2qR5hQsIASsPBKYSopo+7kYcxqCT1lcEGoJuPrVTue1CtE+UPnmwIcWIUknOV6RDHjqg+xmMXc0PCGSBZJ6r/uYYTGILcdHcXM9RO4Q+Yz8NkPDd6evV4SGUPOK5Tbc29VyPDyJQNhBOiuBFQ0M4/J+X2gNuTOrctH5tnT/+xPK21PAZ42Li5Aer7uq9TMWdxZHm5F1+i1cd4tVCwwMwhoelu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(6486002)(66946007)(478600001)(66476007)(66556008)(316002)(16576012)(31686004)(36756003)(38100700002)(4326008)(5660300002)(6666004)(8936002)(8676002)(83380400001)(26005)(53546011)(2616005)(186003)(2906002)(31696002)(86362001)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUs3VVdYNzliTFNsVURyc3NkbjRGYkVvc3VmalExalZYRWI2Y0lmQnpRTnVH?=
 =?utf-8?B?anZtL29Hem13VTQ5MFdIc2o4YzJ2WmxjOXZVUHByOHJ6N3lzaVRXV2VEQ3NQ?=
 =?utf-8?B?blgwb1RMVmhEVktndDZmUFdsNnA1L0JTVVUzQlR0TDg3Wmx0WUNxcTdVMktZ?=
 =?utf-8?B?NDdTdXYrQWorNjBkZ2gvOHRhdHZMRnpJdGdkdVdBcVJFbWJFS3JyU3NtSER0?=
 =?utf-8?B?SzBXbnBTa0FpL0d4dERxU1cyTEczeTBQOWlINGFUVk03MFgrclBlY1BxcWox?=
 =?utf-8?B?cHpLK1V0VzhlTTV5djFRbC9pRFpNeUdhbktUeGVodG9rdkxGZFFJQURqN25I?=
 =?utf-8?B?YmFTc3VJdGsyRU11bE5aSGI1anRrWkRjUzBNcGppdG9iQWU3Z2NLUnpNSk5M?=
 =?utf-8?B?bEdZakxucnl2U0p0YUdsOTMyY0pQMG96VElxWlc5dGQzdjMwc2tZVHlQSnFF?=
 =?utf-8?B?M0hPRHROT2R0NFZPL21yYlpacXp6bGFadWdXK1QzamZSMHlRRFFVQWw1QTVZ?=
 =?utf-8?B?QjgrMWtiYmlyQlJadlpFNGtCMEVpa2IvRHA0cXR0ZndCTUlMVDdSWU1BQXNp?=
 =?utf-8?B?UWNtRXBHMVcrcHowM0ZSU3oyZFRwQ1c3RUhGUGQ0VzkrUDIwR3hIVjNHUTJF?=
 =?utf-8?B?dFJyVWN0eG8zNEJaUWNNUEJpT2YvbXQ0RStzcmdvamtPUzJVWVl4STU4L2Ew?=
 =?utf-8?B?Qkg1ZzhxWDkycE95OWxwOTFYVXhBQlNJQk9OZ0NBWGNYUmF6OUp2R2IrcTNC?=
 =?utf-8?B?OHFrQ1FUQmowMVh1RDREUVJMZHprSU83SW14VE9zM0JwR2l2bTk4QnN1WDJy?=
 =?utf-8?B?SGFEK29kalpreXV2Nm1JM0lQZzBob2NPZ2FadmZjZlJOOVZ6T2V2N3V6c3Y3?=
 =?utf-8?B?bFdIMDJlZ1hPNDBtTmhpQ1ZDMzZoT1cva05KcDNLSVRwTzVIejhPRk1GRTBD?=
 =?utf-8?B?UXFoQUJUemJqam5YQXkwZUlseTJUSDI5dlVKZDZkRzNkL1VBaE9aWGhFcFBW?=
 =?utf-8?B?T1dWdHRFZzN2dEZtQVJ2RnRvVTBwRkJkVVpUait0SHNBVSs1aUl3dkpINkkr?=
 =?utf-8?B?R0Y3aVpVM0dYNFErdlZkWmhhK0p1UksyblpuUTVPOWZxRVdPZFlRU0hIZ2xa?=
 =?utf-8?B?eFNYTG5OV0gyRG15R3o0dXlOQm5aOGwwNHFjN2pKSDVXMDhQVThWTjVtdHdR?=
 =?utf-8?B?YUNzR2x6MmNNQ2VCLzlIWWtqSThVTDF4MEtEL0dBRjhKQmE5bzlYVVo1UUl2?=
 =?utf-8?B?bnI0TnRBWEpSc01PNCtHL3hoMEl5NitERGZsblFCd3pPWDR1bm11NHRhbjFk?=
 =?utf-8?B?QkVVeXR6THF3WlVJMDh4ZFppb1ZpRTFneTVBdGNoSWN2T1FDaVMxUmQ2TnNs?=
 =?utf-8?B?empHRklkWUQ2bkdnQUp0TU12R204VFhSZ0haRFhxbWcyUHh4L3ZyWkFSODRx?=
 =?utf-8?B?R1NNdVNCaDJjNldWVlozMzdSaEFyaHdqQkxNbENuNWYwS2pDWGE4Y2FoTUJp?=
 =?utf-8?B?TTVBSGtVNWd2cFpkTXZ0Y3BRQUwyM0JuOU41Y09OakdVdFQyQ2czZzVJMzdi?=
 =?utf-8?B?eGtlSklxSG5wZ083QUhBbFpJZFI5eERaSlBqQ3BoaHpCY0Z0a2o3TXNCR3BC?=
 =?utf-8?B?ME9aSzJGZFBXbW1RbEJnMDUxNitsNWFMRVhhMlcrSk1mZktVdFhnU01tQnli?=
 =?utf-8?B?aFlERDRYVmpvcUtxL1o5UW50Z0NBcGl0S2FEcHBTNmxybjNEa0VwSTUxelZ6?=
 =?utf-8?Q?CDuOu4YVqlWfNxXSxLDpkuvSdO6f7FCDiGtQWlb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73781a1d-b649-40c8-8456-08d9640a4abe
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 18:42:41.7748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xabs5VP7V9ewb4L6x/vXAu0MzwtlEi4+1a5FamOm2Y/VW0IKLxSvA8TIb6qoWuyGy4U/8KjAQ+NRb4TgUM4un4uZVeKOgh8rIMwJkqUDzIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5233
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
> When unblocking a context, do not enable scheduling if the context is
> banned, guc_id invalid, or not registered.
>
> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index d61f906105ef..e53a4ef7d442 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1586,6 +1586,9 @@ static void guc_context_unblock(struct intel_context *ce)
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   
>   	if (unlikely(submission_disabled(guc) ||
> +		     intel_context_is_banned(ce) ||
> +		     context_guc_id_invalid(ce) ||
> +		     !lrc_desc_registered(guc, ce->guc_id) ||
>   		     !intel_context_is_pinned(ce) ||
>   		     context_pending_disable(ce) ||
>   		     context_blocked(ce) > 1)) {

This is getting to a lot of conditions. Maybe we can simplify it a bit? 
E.g it should be possible to check context_blocked, context_banned and 
context_pending_disable as a single op:

#define SCHED_STATE_MULTI_BLOCKED_MASK \  /* 2 or more blocks */
     (SCHED_STATE_BLOCKED_MASK & ~SCHED_STATE_BLOCKED)
#define SCHED_STATE_NO_UNBLOCK \
     SCHED_STATE_MULTI_BLOCKED_MASK | \
     SCHED_STATE_PENDING_DISABLE | \
     SCHED_STATE_BANNED

Not a blocker.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele


