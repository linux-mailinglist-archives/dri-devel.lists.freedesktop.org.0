Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D87E73F90E2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 01:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25916E8C6;
	Thu, 26 Aug 2021 23:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4806E8C4;
 Thu, 26 Aug 2021 23:11:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="281579255"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="281579255"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 16:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="426950256"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga003.jf.intel.com with ESMTP; 26 Aug 2021 16:11:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 26 Aug 2021 16:11:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 26 Aug 2021 16:11:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 26 Aug 2021 16:11:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 26 Aug 2021 16:11:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afMlbYdwyvk6cKyXlU0iGeKr3q1DHvigB0VRRRtb38QGKvylvsyDI6OUQQDvF++He8MOS1nGPYrkykhf2AAfsispFea5PMlXlJ9RCbTbhnxqlaff+bL0N5RZv/mGuy3exJ0NxSABs0Rar3UIEV3/9ViFn+HXpMYkm6FwvCwrnUbc8mA9Fp8ogyw5eoqihPxMBJUw8+KvAT39+UawDUpJ7wrozElYBiH00b2HlQQfY2Cn/22a2dBDfRQNkaa03It6sgGck3L9F1RjCY9f6tSaPoj/mb/24f9Qn34AFKxlZglcbI6xt14ciiclbLH+zah98RT+iQwVj91vGpl90lgC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PGuRa2S62XULognWYh6PpuluTZ397RN8RyCpWBj6D4=;
 b=c6VUMwZHI3uA1AEzSZ0CGMAfAXE5V9TpllaCixgqXDDQHQI2KGY5aQeJSNIfJ362ukC8yt7RBKTKiDl4BOSTW+Hc73ynHSoK8QGLov+Vqzvw2Rw8FXd9RuybJyr878R5bWRDa0chhs+nChDt9O8hsbg6kAOovCWykMNUbRktTl8bFNpoWwsWRxa42QFLpXQpV4JgPrFpxSzIEPyLf7uyKQuei/7H8SS8TYMry2XuyX64chisI0mYU/GNbUOu2zgUXFngo2lhkTcf5Hzw9hjxFVWWsp5N2KhxG7bVlt8skueCSRDQ0aMR6xs0HTRskRntrgMvtpikMgJFbDSYX0wjXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PGuRa2S62XULognWYh6PpuluTZ397RN8RyCpWBj6D4=;
 b=WGNMX+91l0mwbSQS1TUw1Pu2uUAR3x4cs+pAkyVp+aHMa4piMCcapgoc7J3QPK4ZNbqOeBi3HKfqHcLi+lNJd6Rur7O1ImzCpj3hnTx4OkOCtExGeCTvN4LEQDtixba5fjJVOSuLWWhs1LkMUI+3+G5ps45DhF9s1PqSSVgbJC0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1769.namprd11.prod.outlook.com (2603:10b6:3:10a::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Thu, 26 Aug 2021 23:11:44 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.020; Thu, 26 Aug 2021
 23:11:44 +0000
Subject: Re: [PATCH 06/27] drm/i915/guc: Workaround reset G2H is received
 after schedule done G2H
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210826032327.18078-1-matthew.brost@intel.com>
 <20210826032327.18078-7-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <515e2439-46d4-8e80-f07b-c862a123d836@intel.com>
Date: Thu, 26 Aug 2021 16:11:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210826032327.18078-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.79.152.56] (192.55.52.219) by
 SJ0PR05CA0177.namprd05.prod.outlook.com (2603:10b6:a03:339::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.10 via Frontend
 Transport; Thu, 26 Aug 2021 23:11:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71066bd3-2507-493f-1079-08d968e6def2
X-MS-TrafficTypeDiagnostic: DM5PR11MB1769:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB1769AAD93AC6DF61538E2B0DF4C79@DM5PR11MB1769.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fQtlibjWWVSdLRz5+Jb5z3utVmwP8QhkwZ0pnxZMCFBDOG1vZ4Wo3vXSdbriHwcYHbDZTdQ0VsbEbbXA37vfBCWBdGqnjwgbZRt0duY/DfZSZrSSUhun/dpUPZPigKjRqszHtKLvmayJUdLADxOpr2B2Zr3We5AIhizQ3XbiIBIsan/oUwMfusQkNJaIHqif0gHmQ+zx8jA8xlftA3hkuu3PKD30gRRrgFZcJ3n2BgC6h0D+KzLbq7d12s0zAi1R6HjrV5VYgNyarEYLUhRjeHfmu8aT45QP7wxNIxYuIpjOmyOaiAwaSjWUUr1UqztwN//LwMlRdvJ0zbmgVGS0asXgbedDcwtHXMMYemnacPZFcgG6CIiAYZSjgdFTptnH36NOX/0ekEmnLzpeRP5qRr0D2E5V4cB6KNYk+eUlWVLsbYN7rauKwB/Y+lAdygtnUWEzh+ieThYBJanHlsq5sVXGM//FOi0hNrQSBVyG8/byb22Ejz48AotCtBxaYIjC6IucWo3s22c9ouvWIrdIlb5lt3Uux8eCmCrzteQOm5/YeL0DyFlGL8F+0W3HzUecGJHO6Evy0Ok4lOzpiI65sZZKbug6BUlUoF7wDL5d5iikDLlvWfAJAMvNY9F3iz/C3SWNnktvitWcG/rUb2Bzkqk2rscsH2k4VjOYsoRxpA2lOeg853cfCkqHmA0dwHoZXM6aH3iFc8l32WvVTrDVyqp7UXaTbmHrsmrreTblYPivVB/fOWLV3935XraJcEg9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(6486002)(38100700002)(450100002)(31686004)(186003)(31696002)(26005)(2906002)(16576012)(8676002)(316002)(86362001)(66556008)(66476007)(2616005)(53546011)(956004)(66946007)(8936002)(5660300002)(36756003)(478600001)(83380400001)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MStlTUg5dmYrWE5IQUdDT1NoNEpQNEZIa1NFWFZBYVVISUdQTnNUeGgzWEVW?=
 =?utf-8?B?TEdyNnFGbUswSSt4SWJmclJlU1V6SHVQakxrekQ0L1BuQXY5TXR3Q2liR0l2?=
 =?utf-8?B?Qy9ZUmV5TG03bzFKN3dQc3B5dmI0T2wxaG9wNVNGODJUbk5tSkFsUEFYcWVq?=
 =?utf-8?B?WFl2RXZ4OCtTUlkrM2dKejNKdXkxczgySHFOblJja2x5dkxJMGhrK0pkRHhH?=
 =?utf-8?B?WjZvWHpqQ3JGMUVtV0tlMW1TRlllU3p5RjdoYjE4a3doWndNMlN2WFpvU1da?=
 =?utf-8?B?QTNOdTk1UGJIdStsQm1xZDFXd2hsaVA2YXRKK3FWS1ZVWnR5c1lWTzZ5bGVD?=
 =?utf-8?B?M3FMVlhNaGFmSFJjU1ZIQUtweDNldiszcXg5YWRYT2V6TnBxRHRpakNDM3JS?=
 =?utf-8?B?Q0krNUFCWUNzam9lb3B6NENYa0YrM09ESHQvS0oxaTZuS1Fwc2F4a2pSL3FQ?=
 =?utf-8?B?a3g5Um1zaVVsVVc0SGtOcGpLUjVXNFh1dlI4Mld1YUc5WGZLRHgwMGlvbmo0?=
 =?utf-8?B?aGU5a2ZtVjF5ZVFQOGordXE5UjVnN3VLVDVBb1Z0Q3hSNnVML3JSM09xUmx1?=
 =?utf-8?B?eTRUcktGOUVKOFpLWDlKMCtNa1Mzc0FzaVltUXF2eFpmVUhEWVBTQ1pSRk1N?=
 =?utf-8?B?Tk1NaFgxckpUZHd3bDkzMGpEaGhyQlpsRy9ISkc3NDQ1aVlHRVRWZHBoVERx?=
 =?utf-8?B?d3dBdjhsNTdBbjNjUkd4YlQ0dDFMT2N3Y2lZeXhBSGFxK0xweWlLYmZ5MmRv?=
 =?utf-8?B?dXU2aFpSbWRUTFdlb0pXbk9hZUZCT3BPczRWS0wvZzNqYUFTdmwxaENiNkRK?=
 =?utf-8?B?RmQ5dXZzMVljdTg2dm9uZU9hbE5YQjdaR3ZuNkQrMmRmWDZ1ZFlpMFFoSjFz?=
 =?utf-8?B?Z2dkbXhiUVBYeTAva0VzZUh0VUFPVzcwYXlSbDJOZGxFbEtXbmkrOHM3R2N1?=
 =?utf-8?B?clJhVUV5Z1c5eDJTaXNFajQ5TnFVZ2dNY1dZOXRWUmhPaXVuRXRORTd5WFZj?=
 =?utf-8?B?OGlEdGZpVTJ0ek1zckE2Ylo0MHBxYkI1WmZFdW5KeGhtTzFHRWZxRHZXWkpP?=
 =?utf-8?B?MS9HcDh6OG5tdnJCTS93eStBRzNwQ0ZtSFNBRzVHM2ZwaFA5c1cvRlZQOXFQ?=
 =?utf-8?B?M0tnMzBsZHlRaE9WVEd1R2o1cDRlbTh6bE9wdVdQYnlLb1BGZllCTTgwS0Rt?=
 =?utf-8?B?ZkUrSi9mYTVqN1hZS0sxZ1ZVOXI3VXRGdS9rdmJkaUlQYis5cE8yZGR2OTZx?=
 =?utf-8?B?UXl2UGJmSjNUUlkyT3oxc00xdU9uL0tEZE9tY0RwM2xPVnFmbFQ0Q2VsSzRB?=
 =?utf-8?B?UDRZdzVHN1cwL0pIY3lqSUF0c0pzRk1MQ3FOT1Q1UDRtSGZYRlo2cjMyd3pm?=
 =?utf-8?B?NWhvTGVkS0VhVyttbkRNMVlmeEJpNlpoSVBpZ25mcnlxZzM4cFVZRFFiNGNr?=
 =?utf-8?B?YnQyMkt0c1RYK0gxOUsvYVFqazUyZTRDeExSWjg4YVFCdmlpNGhLRXNKcDRy?=
 =?utf-8?B?OHl1RUoxMVpKT3IwTmJ2cHJTWEx5REEraEFpRlBQKzVpTWJjZVNyZ2g2eVNq?=
 =?utf-8?B?QVd3KzNBQjR0MFVhUGZ6Slc2dVdKTi8yRkRGbmVBbHhiMVgxeEdmMmREcDhq?=
 =?utf-8?B?eUQvOENiVjBwRjRpdnplL0t0UHBuSjE3NU9LWW5LTDRMVmlqajRqMWVEUnln?=
 =?utf-8?B?U2xaWnNkQy9MZGNTVFN2Wk1Ma1ZHcmp1RnhCeFVWcnd1SDVqeVdhUXk0RU5B?=
 =?utf-8?Q?m5vT8vnZ4N/j9MJpZ/V7Xyt9lNZgrkz0cBGbWwN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71066bd3-2507-493f-1079-08d968e6def2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 23:11:44.2535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: locKHByJWHSPnJeAH1mMell91t33Wb2VAAinvC1ThBWRE1JzOP3EOK30OMHVJ9eDNvamA6Vmz8HG0SV1rkARY2LgbHqWpVksNyKZ92x/IGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1769
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



On 8/25/2021 8:23 PM, Matthew Brost wrote:
> If the context is reset as a result of the request cancellation the
> context reset G2H is received after schedule disable done G2H which is
> the wrong order. The schedule disable done G2H release the waiting
> request cancellation code which resubmits the context. This races
> with the context reset G2H which also wants to resubmit the context but
> in this case it really should be a NOP as request cancellation code owns
> the resubmit. Use some clever tricks of checking the context state to
> seal this race until the GuC firmware is fixed.
>
> v2:
>   (Checkpatch)
>    - Fix typos
> v3:
>   (Daniele)
>    - State that is a bug in the GuC firmware
>
> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 41 ++++++++++++++++---
>   1 file changed, 35 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index d94e7e1a876f..592b421e1429 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -831,17 +831,33 @@ __unwind_incomplete_requests(struct intel_context *ce)
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
> +	 * wrong as this creates a race between the request cancellation code
> +	 * re-submitting the context and this G2H handler. This is a bug in the
> +	 * GuC but can be worked around in the meantime but converting this to a
> +	 * NOP if a pending enable is in flight as this indicates that a request
> +	 * cancellation has occurred.
>   	 */
> -	clr_context_enabled(ce);
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	if (likely(!context_pending_enable(ce)))
> +		clr_context_enabled(ce);
> +	else
> +		skip = true;
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +	if (unlikely(skip))
> +		goto out_put;
>   
>   	rq = intel_context_find_active_request(ce);
>   	if (!rq) {
> @@ -860,6 +876,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   out_replay:
>   	guc_reset_state(ce, head, stalled);
>   	__unwind_incomplete_requests(ce);
> +out_put:
>   	intel_context_put(ce);
>   }
>   
> @@ -1604,6 +1621,13 @@ static void guc_context_cancel_request(struct intel_context *ce,
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
> @@ -2718,7 +2742,12 @@ static void guc_handle_context_reset(struct intel_guc *guc,
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

