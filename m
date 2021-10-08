Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF2E426FAF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 19:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128D06F51B;
	Fri,  8 Oct 2021 17:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535256F519;
 Fri,  8 Oct 2021 17:39:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="213504214"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="213504214"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 10:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="459245563"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 08 Oct 2021 10:39:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 8 Oct 2021 10:39:41 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 8 Oct 2021 10:39:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 8 Oct 2021 10:39:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 8 Oct 2021 10:39:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJozQWlViCPRTj/xEoDPOmYOwhTVKDZLTvoBaLcwZ0xWmbfCskoimj8cKOZahW+4loUjoODfZz3RvUy35OtwA5XLCoztFK3rh/pEcgahIYu6fsSvC5h6Pjojv7HDwgn6fZhWEZB/vA9tIot9Uau6pMK8v7AOBu2TEDeWegsVNsNXYQ88LsbrpPIEExUumU7D3OnSoaKbfRP6wJNWF6tUYi92aKVb0ZEhAV1Te1uv/1IfNhvqvmvkHeMz7WtMi8QgfA5ZFbC2IqGheqLSG3SB04TYWIx/yss3yH+aCYaCpzjYWZcAtR1FvQiVQ6eQhI8iMkdmfSQKpdagvR9zToN1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmHXBD0ewV9k4iGFLAGQO4qtno4PxCTA+WBRINfgyIs=;
 b=KyyzKiOCqT0p8tb6Q/25EQnkCWo5WiDEddOzchEaAzlFYNr7Jc0P0/nsKFTHUfmYNX0dqd+wLbC+sDf50mkeT5zbGMLYM5ZvKDUrVjld/VVezBSAAu89c9qNs1hramkH2/VoYa4PjNJ5LrwO6+64ZMv482UmV35f3Hs04uYxmdSxgc8mxjWM1lT9aFFrcGS5Of4yMYnv1iN9SXLkcrxgh5TUTtKYqe1ht2Mrgf1Rz5xsDk3aRG9936U8FGGXYiW33zgjJAgxzLjK8/Wzt8D+gJvxJfwKPHM/37gXrV1VNvKs9oqYaa8UJ90ZrYo7pPZotAhrZbp1E9ViocDH7nwJ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmHXBD0ewV9k4iGFLAGQO4qtno4PxCTA+WBRINfgyIs=;
 b=qHHPa+OMKuFo6QfDzfMDgf0Mk6FDRuH/Tba57GG2gvNOhUAmWtBRF7unnpPgbEnFyhPTpfXMjHeKsN2Odf7bo31wZVzAinJB6g7/TUbtfiySe1PpyJcrQecfQiXQytUTeIY6aBVSmbHfJsktuiQWWto5FAUSC2hl0KnQX6es5XE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5593.namprd11.prod.outlook.com (2603:10b6:510:e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 17:39:39 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Fri, 8 Oct 2021
 17:39:39 +0000
Subject: Re: [PATCH 14/26] drm/i915/guc: Implement multi-lrc reset
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-15-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <2d816209-7c88-8059-ff04-0cb7559f2c2f@intel.com>
Date: Fri, 8 Oct 2021 10:39:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-15-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0291.namprd04.prod.outlook.com
 (2603:10b6:303:89::26) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR04CA0291.namprd04.prod.outlook.com (2603:10b6:303:89::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 17:39:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc2d0c27-a8f3-47aa-d5e4-08d98a829a44
X-MS-TrafficTypeDiagnostic: PH0PR11MB5593:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5593D8E551D5A2C28F49676ABDB29@PH0PR11MB5593.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +IMWWLgIjHZfxN+D0imcNqoHbqN6FTgkPqWXW7j/Uz3G1wmnfeXFG4EFkOgG6+OLU+CctOI+Rb/WFiAYVqHzYxgFgMKypALnt8hWtB48RZE96bIQjA2G/6zI5YT+O/rhuTlD3Qkb1l2iM3bgt9FF+SdhHrVcfsOlRdeb1UZpmhGVfhwWRMR/yGNktgyTqg6wGsg594oQVAnr+ZEfpc/MBH/6uJPL/j5LhLf/TXwK1XjdUeX0IwyfGYcwT9l5eZ5pOhLNnBzJ7FoawAm9NKfnNhqhZ+RYsad14L6rxjsJSszPX98oWCVrjikg13hMRnJGNBl4RHIoEjTZmBb7u+jJMBrj5Mj0mP1fMVzVZfPrf/6OkocZJoMJLevtry8i95An6qL/+A7VilWCzykoOM6XwtirP6J0RmUkFxJ5xa5CDPZUvqbYkzhs4n4N5AGG1TIwhQs/JUsfYgHbJwJDO/LFR5QxcUJ3I1YMvBMqdRIRuqLOnzkY6HQyuhov7d1vFSWSCOjs5XCTxBo9t4adQ+SlHocv91XVJubXUPGhFRJ4FgJiFX7Vw7fb8ei8ta+LDVDgoLcl2cr+1fYDIhP5zidqWFDoSZXmjHFws7kpFPz4Xujko8u2Wuf745cDe1g6MFX6l3CC18onTe11aeTfBAXn59DCQL2t7Oj+tVzT4YM8ftElLA3/9OEZ1y32oFqRmnw6rniJf6Nd3jmRjDwFDRj82FceJYufIzsGt83oloBBwhypSKwHXcji+OsLB8uY+oWv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(26005)(107886003)(6666004)(6486002)(8676002)(38100700002)(956004)(2616005)(31696002)(36756003)(4326008)(8936002)(508600001)(450100002)(2906002)(86362001)(66946007)(83380400001)(31686004)(66556008)(66476007)(316002)(16576012)(5660300002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFhxVGs0ZnF0YTlCNzJFSzRGOFgwV0hlOG5lZEZjSFpxQm9yUVRkVEZ5emtr?=
 =?utf-8?B?TkpWQ3hkMWx5MFdXbUhUTlhTVFZyS0V1eFZMN1I2S2E4azhXdUpITFFiZ3dG?=
 =?utf-8?B?Ym5LUHd4UTZJSUxLUEJIOE9LTVFZZ2YxVWRkS29GanpaUGVteGt0WkNyNS9R?=
 =?utf-8?B?K1BJbSt2bVNYMkRuZDU3MkdHTlBSSGU5MWU1SmhVVDczTktLRWNWdlg5cTFG?=
 =?utf-8?B?S2VReG1xR2JwbWVlNVBWcitQdVpDWUpxL2NGSXdOZG1aUC9sL2JPSVFuSmZo?=
 =?utf-8?B?TUR3QUFEWFMzRDdGaUoxYnFuNEJCQ2RLWks2VnhTcHlDaDUwTSs1SGtPTklq?=
 =?utf-8?B?STF1MDBsSmplalNvaDZIZS8xUGJHWFM2dmkvbVNtaFNKSVF1aDhuRHQ4QjFQ?=
 =?utf-8?B?b2N3Z2o0SXA4R2hWTGlLM09pZUZwUDdGSzhwYjJHamxqQWlwVUsvMmxZbjVG?=
 =?utf-8?B?bE5TRTE5VEorSkQ1SU8yWkRDck5scFZoVW5NSlcyUTdDc1c2ZEpzUDY1OUlW?=
 =?utf-8?B?UG1tTmtEcXNBY3FJRW9LM055RWhSaEhLN0Z6RjN4UlpyUEZDMEthVjRtbytL?=
 =?utf-8?B?UW9lSHJUa1RVbTNhVWcyZEQ0dmJuTUt0c2tRK1NZcCtsSFlNZGRTdUdzQjBr?=
 =?utf-8?B?SDdLRkY3T05WZk1GeDFDSHA3WWFjYXRGUVZGYWp0ZThNMzhuam5MeEluNVpq?=
 =?utf-8?B?cW0xS09oallySFBoTWZKSDN1OElrS3doOUM1Mi9oTE9BRy9FMFQrSG9EU2Rp?=
 =?utf-8?B?eGtyd1dTWlZ4T1Z1T1BiWHEwV3RuOEUyNVh1Y3lST1A5ZmFLVFd2THE5ZG5N?=
 =?utf-8?B?c0dKaTU1UHU0OXZoZTJ1MS9ObXAzQ21nNU9STGJTWmF0aXZDZ1lNWUM3MFp1?=
 =?utf-8?B?bE5SNXJ2NTBocUFsd1lmOHdlMVozbFJTZ09uQyt5azFvRmVuajBHdWN1QkJI?=
 =?utf-8?B?U3F6c1NSR0xyZkt5YVpGamswMFRGMDF6M3hJcHBRdktCNnFMekpRN2IvamZJ?=
 =?utf-8?B?MkZSdWJ6WFhORzcyaHI0dGlMaXpqN3AxU0VFcnNkZHJvcHVuVmFmcGExdzl2?=
 =?utf-8?B?d0tOQ09NNXR3SUUzSXNYN1k2SFFJWUR3ZlNRQ0RLNEMxcGFlNFF1azJLRnJm?=
 =?utf-8?B?VFdMU3VkYUNCNWJXY2t1THFqMU9YZzZqZTNReTh2WnU1TXhxRFVWd0lkaWZQ?=
 =?utf-8?B?OEdZeWlEQWtnZGhwWTc1S3Q5Q2hYYWtrVE1ieGVhTFJQcUJUNFYxOEJyTXFG?=
 =?utf-8?B?MUMxNUJVU0NSK2lhUzFROGVNOExlYVc3NzdjOG9GeHpNaE1LY0tsbXlsZlIv?=
 =?utf-8?B?dlhLeUZtWmRyUFQzR2RscmQzQzdDcWIzTVg5Zm1nN004QmdNbVg0Y0dQRDE0?=
 =?utf-8?B?cTAydk5jM3kwb0VQRHpXRHE5aUNTelY2bWxFVGE0RW1UUUEva2ZSZkxxcFJn?=
 =?utf-8?B?R1p4SWhaZlpBOGh6Mml3S0w4OFNPRkZicEhUZ0FrTHUxTHp0dzdxSEl4Nlgv?=
 =?utf-8?B?cjcrUnZUc1RBM3hLYzV4UDRFVjdMc2ZYU3lENU9zbXd3VUNEVGZ4MUV4Njh0?=
 =?utf-8?B?bmNnV3QwTkt4cjBraDB2dTZZYStYeGs2V0xDOUxaS0tkNWFnQVd5cVBMVHBL?=
 =?utf-8?B?VllFell1YVp1bmZJWnU0YWIvek84VnZzWVRJRzJ3TTFQMDFBdThxQmh2WmZU?=
 =?utf-8?B?ODB0RjFaNkNzTS9vcXZiRGhhZk9SeHl0LzJVMVBjL0xFV055Rk14RmQ5YVh0?=
 =?utf-8?Q?hFn+B4TYdhDM1hc006vHijoC0Yxu2ZYzgfG804P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2d0c27-a8f3-47aa-d5e4-08d98a829a44
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 17:39:38.9882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5/G1SQz+l8BQWf4VenpStkNBV0joQHqzMOtxfKe7Mdxvum7OF6qsSvGl4n3Mt3R1xxWF1v/IKe99A6gpnA3j6euWYCl9KEtF+92i6vvYhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5593
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
> Update context and full GPU reset to work with multi-lrc. The idea is
> parent context tracks all the active requests inflight for itself and
> its' children. The parent context owns the reset replaying / canceling
Still its' should be its.

> requests as needed.
>
> v2:
>   (John Harrison)
>    - Simply loop in find active request
>    - Add comments to find ative request / reset loop
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       | 15 +++-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 69 ++++++++++++++-----
>   2 files changed, 63 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index c5bb7ccfb3f8..3b340eb59ada 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -528,20 +528,29 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
>   
>   struct i915_request *intel_context_find_active_request(struct intel_context *ce)
>   {
> +	struct intel_context *parent = intel_context_to_parent(ce);
>   	struct i915_request *rq, *active = NULL;
>   	unsigned long flags;
>   
>   	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
>   
> -	spin_lock_irqsave(&ce->guc_state.lock, flags);
> -	list_for_each_entry_reverse(rq, &ce->guc_state.requests,
> +	/*
> +	 * We search the parent list to find an active request on the submitted
> +	 * context. The parent list contains the requests for all the contexts
> +	 * in the relationship so we have to do a compare of each request's
> +	 * context must be done.
"have to do ... must be done" - no need for both.

> +	 */
> +	spin_lock_irqsave(&parent->guc_state.lock, flags);
> +	list_for_each_entry_reverse(rq, &parent->guc_state.requests,
>   				    sched.link) {
> +		if (rq->context != ce)
> +			continue;
>   		if (i915_request_completed(rq))
>   			break;
>   
>   		active = rq;
>   	}
> -	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +	spin_unlock_irqrestore(&parent->guc_state.lock, flags);
>   
>   	return active;
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 6be7adf89e4f..d661a69ef4f7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -681,6 +681,11 @@ static inline int rq_prio(const struct i915_request *rq)
>   	return rq->sched.attr.priority;
>   }
>   
> +static inline bool is_multi_lrc(struct intel_context *ce)
> +{
> +	return intel_context_is_parallel(ce);
> +}
> +
>   static bool is_multi_lrc_rq(struct i915_request *rq)
>   {
>   	return intel_context_is_parallel(rq->context);
> @@ -1214,10 +1219,15 @@ __unwind_incomplete_requests(struct intel_context *ce)
>   
>   static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   {
> +	bool local_stalled;
>   	struct i915_request *rq;
>   	unsigned long flags;
>   	u32 head;
> +	int i, number_children = ce->parallel.number_children;
>   	bool skip = false;
> +	struct intel_context *parent = ce;
> +
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   
>   	intel_context_get(ce);
>   
> @@ -1243,25 +1253,38 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   	if (unlikely(skip))
>   		goto out_put;
>   
> -	rq = intel_context_find_active_request(ce);
> -	if (!rq) {
> -		head = ce->ring->tail;
> -		stalled = false;
> -		goto out_replay;
> -	}
> +	/*
> +	 * For each context in the relationship find the hanging request
> +	 * resetting each context / request as needed
> +	 */
> +	for (i = 0; i < number_children + 1; ++i) {
> +		if (!intel_context_is_pinned(ce))
> +			goto next_context;
> +
> +		local_stalled = false;
> +		rq = intel_context_find_active_request(ce);
> +		if (!rq) {
> +			head = ce->ring->tail;
> +			goto out_replay;
> +		}
>   
> -	if (!i915_request_started(rq))
> -		stalled = false;
> +		GEM_BUG_ON(i915_active_is_idle(&ce->active));
> +		head = intel_ring_wrap(ce->ring, rq->head);
>   
> -	GEM_BUG_ON(i915_active_is_idle(&ce->active));
> -	head = intel_ring_wrap(ce->ring, rq->head);
> -	__i915_request_reset(rq, stalled);
> +		if (i915_request_started(rq))
I didn't see an answer as to why the started test and the wrap call need 
to be reversed?

John.

> +			local_stalled = true;
>   
> +		__i915_request_reset(rq, local_stalled && stalled);
>   out_replay:
> -	guc_reset_state(ce, head, stalled);
> -	__unwind_incomplete_requests(ce);
> +		guc_reset_state(ce, head, local_stalled && stalled);
> +next_context:
> +		if (i != number_children)
> +			ce = list_next_entry(ce, parallel.child_link);
> +	}
> +
> +	__unwind_incomplete_requests(parent);
>   out_put:
> -	intel_context_put(ce);
> +	intel_context_put(parent);
>   }
>   
>   void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
> @@ -1282,7 +1305,8 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
>   
>   		xa_unlock(&guc->context_lookup);
>   
> -		if (intel_context_is_pinned(ce))
> +		if (intel_context_is_pinned(ce) &&
> +		    !intel_context_is_child(ce))
>   			__guc_reset_context(ce, stalled);
>   
>   		intel_context_put(ce);
> @@ -1374,7 +1398,8 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
>   
>   		xa_unlock(&guc->context_lookup);
>   
> -		if (intel_context_is_pinned(ce))
> +		if (intel_context_is_pinned(ce) &&
> +		    !intel_context_is_child(ce))
>   			guc_cancel_context_requests(ce);
>   
>   		intel_context_put(ce);
> @@ -2067,6 +2092,8 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>   	u16 guc_id;
>   	bool enabled;
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   
>   	incr_context_blocked(ce);
> @@ -2121,6 +2148,7 @@ static void guc_context_unblock(struct intel_context *ce)
>   	bool enable;
>   
>   	GEM_BUG_ON(context_enabled(ce));
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   
> @@ -2147,11 +2175,14 @@ static void guc_context_unblock(struct intel_context *ce)
>   static void guc_context_cancel_request(struct intel_context *ce,
>   				       struct i915_request *rq)
>   {
> +	struct intel_context *block_context =
> +		request_to_scheduling_context(rq);
> +
>   	if (i915_sw_fence_signaled(&rq->submit)) {
>   		struct i915_sw_fence *fence;
>   
>   		intel_context_get(ce);
> -		fence = guc_context_block(ce);
> +		fence = guc_context_block(block_context);
>   		i915_sw_fence_wait(fence);
>   		if (!i915_request_completed(rq)) {
>   			__i915_request_skip(rq);
> @@ -2165,7 +2196,7 @@ static void guc_context_cancel_request(struct intel_context *ce,
>   		 */
>   		flush_work(&ce_to_guc(ce)->ct.requests.worker);
>   
> -		guc_context_unblock(ce);
> +		guc_context_unblock(block_context);
>   		intel_context_put(ce);
>   	}
>   }
> @@ -2191,6 +2222,8 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
>   	intel_wakeref_t wakeref;
>   	unsigned long flags;
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
>   	guc_flush_submissions(guc);
>   
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);

