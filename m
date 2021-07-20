Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDFC3CF152
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 03:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A7D89CD8;
	Tue, 20 Jul 2021 01:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BAF89CC9;
 Tue, 20 Jul 2021 01:27:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="209255495"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="209255495"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 18:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="500118262"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2021 18:27:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 18:27:11 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 18:27:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 18:27:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 18:27:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7fxsysBIM+XO31njdaelJR1+vTd8fOi7m0xPmGAtTWU1cVH0cRq31yFhbT9zKwh+AcON5L5MLHgFbBWu9E9eUnX6dMkxLszUswa+dl8i7kHJU2ewF1/M9FvlzHIdmnJU7gV56Z9rxs0J4NUA+NCsuUFsTgr2WmIvZp7hb57CMZVMrVD9e+7jb1jpGz+/wT9bbCrJ6ja9/ck4DNRR2FWoGkERnKxJdxCrsxo/RJDQYtLr9qv7d04RDYhNgBk4rvCgtLinmTe19GejPGtIDNmTIGQEK13fbKuYm7BmdU/n+nZxXThLzO/0c0wuV0LZo+XuyZLRx9A2nA96Pr69k7E8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7WXBGbV7lV7KVK72y1DZD9i6tp/m5mxDNqe5U8a88k=;
 b=lZXeM3fKGSJQu4s9heLLHfKEOWM3hCK+IsFNL50S7cSjG5RE2srHj4BVOYRn2U8mm1kybyDMfNlisV1kFtlQQwgP7kbt1YvOsGI+qlPspHDpw3PHFnmmjX+QbAeCslAxZ51+2hmPimH2ryiJk0tXk3ovXNk0J46te/dNRYZgA5IaFsdwk+9iBUu8p/bXf8UaL2vKHqzJ6Yj3L9o6z8UUACxCpgY/znwHJrXthI24TUUPcv02Ulb/QLAUkKGV4fR/uqpzkTTcIEvfR28vzqjbmnDBylzgASET5jnka8c1Jmwvv69FRcmla1llNzBtYBzFmA31r+phRwoCwLNSiYfTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7WXBGbV7lV7KVK72y1DZD9i6tp/m5mxDNqe5U8a88k=;
 b=h70LoyTDXMhVu8zlYU8wVOZUY5gnOlR/IYCmZWnz4vf72mjLNQCMvTsuoiHR30AFx4hBlkO6NffkkJBRLwzkwQnBuKyJYJ087YHImu914RNzv1QmMMld0NqDeEQ2fFlE4c/FOC+N6IGUvs44hQMsnCLQ9XOhlolpi8mlfbqWHes=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5595.namprd11.prod.outlook.com (2603:10b6:510:e5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Tue, 20 Jul
 2021 01:27:09 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.032; Tue, 20 Jul 2021
 01:27:09 +0000
Subject: Re: [PATCH 17/51] drm/i915/guc: Add several request trace points
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-18-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <e8776ea0-84b3-fd8b-fc17-1f634d1a083a@intel.com>
Date: Mon, 19 Jul 2021 18:27:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-18-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW2PR16CA0064.namprd16.prod.outlook.com
 (2603:10b6:907:1::41) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MW2PR16CA0064.namprd16.prod.outlook.com (2603:10b6:907:1::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.23 via Frontend Transport; Tue, 20 Jul 2021 01:27:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08a214f4-8134-4ecb-1f17-08d94b1d7e21
X-MS-TrafficTypeDiagnostic: PH0PR11MB5595:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55959310726E82B53CD6B66ABDE29@PH0PR11MB5595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zRvP+7V4Z6gqupth/rfM5n0G4PuA7sfISAg52fQYXZnFqCJQVmCUDA5BrxM/tPAovJZBIvV7uGx0PGkyd7VXeDyYX37RLBcFJGLd95NM87oU39BxsfLWkVi9xBuX8ePngsuE9Lo7RexF1bowAXcppxxp8SuZ3ngg2YnGGPhUBlvB8F5hr3sDwg8wpje7lCwIJ1HzphSzKPjxDPp4ya1IYJwD4pLJJLjq9Ie8V4gftYc3ea1j7qO6mxLQY8ZkgYppxzz4bZeX4xB+M7H+rlRkATPJPE0hqKtZWtbKOz57MMa5HC0k4t3Y1zGJDzZMk8RlzXEJElSfEHQ1cu9lt9QYeYFmvfe73J3norgZCgdxtBQ0BuWzABs9ZyOxf7U8W0iSCWT9IySmz2w1Ruvu6ow1F785QKczF3g+huhUaNWrp2vjqt+LkQD0csOfrO9s0vFLiVLfUHnCYiGII/U00dVPS8ikqFGZnbmECZU8RTHLxAhtYarnaiLyixeUB8PgxRflk9qO9Qtqt16MqBa+a1u4YCZU1CQHkEMHmglllOuXtydZvqhpQ7fpD1gbXxTY99nLtWZ4ecyH1CF8hQ4FXyzPbLuc4d/WJRGaF5ZfclBKJQLYtDH2ulyalFFeo3y4+WTHl2Mr5wT2n0Xu2mt34S2ySblVoYfQ54AyTl+Cfhfd007UjmHLTRibwwvUEdxNWDQZGf8TpD1Bx/wE6d33PQQtNGHTAwSsCn9dehaB+0n+Omw62lJXvf64pD/AVVzBcGkA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(66476007)(5660300002)(66556008)(956004)(86362001)(36756003)(478600001)(38100700002)(107886003)(2616005)(31686004)(6486002)(66946007)(4326008)(8676002)(450100002)(31696002)(26005)(8936002)(53546011)(16576012)(316002)(83380400001)(186003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjZ4N1dzcDZCZitOYkNONVdJZWVvTVBScUR5dlJuY1hWUkFWN0gxRjVqRnpF?=
 =?utf-8?B?Y0VaLzl1cUR5eTRpQ3EwcEV0bCtqc0VoajNUa0pJQysyeWZlblNHTlN4ZXN4?=
 =?utf-8?B?K0NSVjBZa1NsRC9PTC9Yc2h5QUdKTkZiWW8vRGpGYnFXbSs5Ukw0T29lZnlp?=
 =?utf-8?B?eU9zSnNLZHFmNCtXclY3QlZ2Y05oWmVwb0tsZ2kwQ3BzVGpnVjRnbW5VeVVT?=
 =?utf-8?B?RTRhY0xJb1ZETjAranBCLzZFdG5HMHE5WjlxNzVMTThXUjFhRE4rajdtMjJl?=
 =?utf-8?B?ak43Vlk1cEN6WVZHK1lpNkovbjllSVJyQXQwM1BYYVI2WU40cS9OcldTKzZ5?=
 =?utf-8?B?cmFoYVZMVE94WisvOGczMnZac3JFcWZIdmpZNFdOc2R4TDFxblJBN25JYlpx?=
 =?utf-8?B?amc4TDJwNmc1UE1hbzdPdkk5MElyNUJwM1BxSWhSYTMzd2pQL3JxOXlKTkVs?=
 =?utf-8?B?bXduZTVNc2VOVjQyQWZKNDZJc2VEWVpKRFVKZW5ndHJqaFRSaGhJRCttQlky?=
 =?utf-8?B?S3RtZ1BnTjl1RnpDNE9NMlJzVEUramlqdlB6cmFGTGZZVVkrUmFtSEo4bGxn?=
 =?utf-8?B?VVdGUE96V0hoQXNmTVZXQ2hSYUpMQjRBSlFJdU4xa1NrbjRYWmZlS2h4T2RP?=
 =?utf-8?B?WlBaRm5mZjQ2ZmpGRCtQRTBsWStMN3VDRm85aWpPWE5iZEpKUWJCQVJOanlH?=
 =?utf-8?B?R3pJdHhwSUpsNGdNNmxLeUh0NmJRckdnT3JZaG11VkZxTE50NkhtSXJLdXNv?=
 =?utf-8?B?bUVtWm5DNnF3dkZwR2xvcmtrdGZIS21JRjJZV0U0U1BlNnY4cHZRd203R24y?=
 =?utf-8?B?eHBFOFhwaUR4UW53WERGd3RlQzlSd2JOQTJjWTlETXpxOWxnRWZpd3IwOUx6?=
 =?utf-8?B?L1JNamF0TWVEaW56d1lvenc0c05sYU5jeWQzTUdFVGN0TjRiaUpUZ01oajBh?=
 =?utf-8?B?c1M5NWxuUS94U2xtVEQyS3h4S0hqNDkyTEFHOWVuMWFWN2JXd3Z3dmx2QjBv?=
 =?utf-8?B?WHY2T2JBVlJkNWVsZWU5WjJYZk1GenhrN1U1VVpzZU80MGtsMXR1RFgydFJS?=
 =?utf-8?B?djZuUG82NStVMUdSa1RsWk94ZVA4Y1lrS2hUWkdjSjlFbmNYaTY3U2VldlEw?=
 =?utf-8?B?REJNcDJTdlQ3dEhNcXhXQlM0eWhXczZrRGxMZFFQRXFhYk85NEVkNUNRbjky?=
 =?utf-8?B?QmFCZ0RsRmVqSHd2Y0xHMENMY2ZxMDVBVFBwZW9CTDNJU3BRcWpSbk56cUk1?=
 =?utf-8?B?T2Zha0hPd3RTL0RCQUM0Tkl0dTArY2l6THowRmJWN2IwRGJsVXY0ck9RTTVL?=
 =?utf-8?B?QUVmU2RCZFBIYll4NmRvaStLMHBJVW13T05veXZQMDFzVVljaEZhTVA4UkJY?=
 =?utf-8?B?bUpvMVI2dmkyK1FaRkhxMzVzdzFBdGU4OVR4dVZwYVRsZmNlZ0RtOHdOUEw0?=
 =?utf-8?B?c3gzN2piYnQrcTZQUG9XQUxwWE5FTVNsM21FRjFIbWY2SUZsZWFwMU43bjJw?=
 =?utf-8?B?ZHp0Q3JBa0oyWEUyZU5uZHI3cmpRVTFGU3VQN1NLYksvN0hYamtlU0VqNXFP?=
 =?utf-8?B?MGtVS3ovRFFQdDNYUis4NFZDTmx1WGJmdHVnc3Q0bkFRMUxRUGZaaE5abEtP?=
 =?utf-8?B?V2xRWW42bE42MEJJMWFVTXFQbHEvYS9WQy9uZjI0L01wYi8xUjlUalhLNXN6?=
 =?utf-8?B?MHJvazNxYWlKNG4vWENoSTRST2pHdWJ5cjRFT0gwY3kza1M2QjJZb09BZVNm?=
 =?utf-8?Q?7WPrJbY/Ip17U0KLnOwjSxkf7vqxQUcww6wmrjV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a214f4-8134-4ecb-1f17-08d94b1d7e21
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 01:27:09.3413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +aKpSB9IP0OgoCej50fHzCof8C8pJwUvokqS1mcK/Nbo6U0dWJIXQdxCLo2KjPKfbwj9yq1hPgv2jjHqu+BIAEPr6IaMb7BAXegK83z+EVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5595
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/2021 13:16, Matthew Brost wrote:
> Add trace points for request dependencies and GuC submit. Extended
> existing request trace points to include submit fence value,, guc_id,
Still has misplaced commas.

Also, Tvrtko has a bunch of comments/questions on the previous version 
that need to be addressed.

John.

> and ring tail value.
>
> v2: Fix white space alignment in i915_request_add trace point
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  3 ++
>   drivers/gpu/drm/i915/i915_request.c           |  3 ++
>   drivers/gpu/drm/i915/i915_trace.h             | 43 +++++++++++++++++--
>   3 files changed, 45 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a2af7e17dcc2..480fb2184ecf 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -417,6 +417,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   			guc->stalled_request = last;
>   			return false;
>   		}
> +		trace_i915_request_guc_submit(last);
>   	}
>   
>   	guc->stalled_request = NULL;
> @@ -637,6 +638,8 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
>   	ret = guc_add_request(guc, rq);
>   	if (ret == -EBUSY)
>   		guc->stalled_request = rq;
> +	else
> +		trace_i915_request_guc_submit(rq);
>   
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 2b2b63cba06c..01aa3d1ee2b1 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1319,6 +1319,9 @@ __i915_request_await_execution(struct i915_request *to,
>   			return err;
>   	}
>   
> +	trace_i915_request_dep_to(to);
> +	trace_i915_request_dep_from(from);
> +
>   	/* Couple the dependency tree for PI on this exposed to->fence */
>   	if (to->engine->sched_engine->schedule) {
>   		err = i915_sched_node_add_dependency(&to->sched,
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 6778ad2a14a4..ea41d069bf7d 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -794,30 +794,50 @@ DECLARE_EVENT_CLASS(i915_request,
>   	    TP_STRUCT__entry(
>   			     __field(u32, dev)
>   			     __field(u64, ctx)
> +			     __field(u32, guc_id)
>   			     __field(u16, class)
>   			     __field(u16, instance)
>   			     __field(u32, seqno)
> +			     __field(u32, tail)
>   			     ),
>   
>   	    TP_fast_assign(
>   			   __entry->dev = rq->engine->i915->drm.primary->index;
>   			   __entry->class = rq->engine->uabi_class;
>   			   __entry->instance = rq->engine->uabi_instance;
> +			   __entry->guc_id = rq->context->guc_id;
>   			   __entry->ctx = rq->fence.context;
>   			   __entry->seqno = rq->fence.seqno;
> +			   __entry->tail = rq->tail;
>   			   ),
>   
> -	    TP_printk("dev=%u, engine=%u:%u, ctx=%llu, seqno=%u",
> +	    TP_printk("dev=%u, engine=%u:%u, guc_id=%u, ctx=%llu, seqno=%u, tail=%u",
>   		      __entry->dev, __entry->class, __entry->instance,
> -		      __entry->ctx, __entry->seqno)
> +		      __entry->guc_id, __entry->ctx, __entry->seqno,
> +		      __entry->tail)
>   );
>   
>   DEFINE_EVENT(i915_request, i915_request_add,
> -	    TP_PROTO(struct i915_request *rq),
> -	    TP_ARGS(rq)
> +	     TP_PROTO(struct i915_request *rq),
> +	     TP_ARGS(rq)
>   );
>   
>   #if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
> +DEFINE_EVENT(i915_request, i915_request_dep_to,
> +	     TP_PROTO(struct i915_request *rq),
> +	     TP_ARGS(rq)
> +);
> +
> +DEFINE_EVENT(i915_request, i915_request_dep_from,
> +	     TP_PROTO(struct i915_request *rq),
> +	     TP_ARGS(rq)
> +);
> +
> +DEFINE_EVENT(i915_request, i915_request_guc_submit,
> +	     TP_PROTO(struct i915_request *rq),
> +	     TP_ARGS(rq)
> +);
> +
>   DEFINE_EVENT(i915_request, i915_request_submit,
>   	     TP_PROTO(struct i915_request *rq),
>   	     TP_ARGS(rq)
> @@ -887,6 +907,21 @@ TRACE_EVENT(i915_request_out,
>   
>   #else
>   #if !defined(TRACE_HEADER_MULTI_READ)
> +static inline void
> +trace_i915_request_dep_to(struct i915_request *rq)
> +{
> +}
> +
> +static inline void
> +trace_i915_request_dep_from(struct i915_request *rq)
> +{
> +}
> +
> +static inline void
> +trace_i915_request_guc_submit(struct i915_request *rq)
> +{
> +}
> +
>   static inline void
>   trace_i915_request_submit(struct i915_request *rq)
>   {

