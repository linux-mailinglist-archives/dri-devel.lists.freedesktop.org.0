Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8654C7F5D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 01:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760B110E14F;
	Tue,  1 Mar 2022 00:38:29 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D647610E12F;
 Tue,  1 Mar 2022 00:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646095107; x=1677631107;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Th5gBx3ZcpejSoIMvKlcHUgNYM/EXfehhbLNcViGgkI=;
 b=VqGodfHPpVZVOCtmY+PT5TgIQsCtz2pkXxs4pzPkOMuwFMp5f8BXSdoS
 INFzH0x6PvPwolVzROK9bRELqEOMpFvRKfB74zu56SDkN6PfSJp8fIap5
 86Nhf0SLLFEbILychHgY5cMdlSw0eIySgQlr4kuTOgVl90FEnnWTNTwYg
 Ub35wircRwz4p4/31pk4UQP1ci5/sIRrde5PWqhKvSZWP3o8qkUTqNiko
 cXbUwgN1SSrxPwu9QsoTory3Ei86KGn0XO+oyMOji2K9g1yyD3ryufLOU
 bS+hd8LIbztt/20sLaN7xLsQsvpxOyVUN5cbgdV83pU4h+wp3ODIWhAiK g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="253214528"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="253214528"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 16:38:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="510300497"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 28 Feb 2022 16:38:26 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 16:38:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 16:38:26 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 16:38:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+jXimxGde3PSqszOW2XLoMzDE97DEAwSGXn2H35+DQPgn9YPKIMI0ETehUwt6cYIqFycL2EdNxZsiKFEInXrXwWog5lZnfSsDABgqHbmk6O55tR0MBr8NP4ii8NmMM4VbGx2+ShtZFcgg5btfV6Q5mi06y98ftuOjqiJo8zFpDgI7kch2rAgxnqbg38RFK3k2xWswPsBRS3C5Wk6gPTQAyNuS888YYAZbV727lviCFAEbpt7ZF536Er5YORpN/mR+fplp6AeSUhf5V8+SkelLhTC5BZQ5+qQRZslSGMD9ejio340VDqHakUtSOO/P7NcxIkRoYSPNekPy73up9sqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCvU8Nn0kXAeFwyVSDLX/ounqXvWo8WGvTwsv9mIwkA=;
 b=UWmveXK2XNjv1H4wZb6S7vLx+KFyOoEvaNmw/ULkj4b1YKFY7cP9QYHJSPE0uwPQSDO40DGL0+fJaroS52aH9CtRsaq2MJsnATaVC0q7BqjUq2H+RIvT3vU8vfSw9srEVvPp7wDTZptyW5mMKqoOj6Wf+RfqSldXILakYKizAw7LXf0hIUPO5O+/MABsNvD15xnO4m4LcTGc88P33geYkhZBmQ0vuO5NtYWfP13hhb+BKlmjWpUdZJB3llW6rYfB1rTW2vKHbZoiiVp9nuzO1BsVlXHGOJGSh9wV1XVN38Bc1Yw/uULO4JVVYujW3yxm66s3xRQ1hscyiiLu2jeZhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Tue, 1 Mar 2022 00:38:18 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 00:38:18 +0000
Message-ID: <94d2176c-4606-2f1a-9df9-4df04de5e96a@intel.com>
Date: Mon, 28 Feb 2022 16:38:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] drm/i915/guc: Fix flag query helper function to not
 modify state
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217212942.629922-1-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220217212942.629922-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0055.namprd08.prod.outlook.com
 (2603:10b6:a03:117::32) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89570f7e-14d4-4d75-a8a1-08d9fb1bc7d7
X-MS-TrafficTypeDiagnostic: MW3PR11MB4715:EE_
X-Microsoft-Antispam-PRVS: <MW3PR11MB4715979662C45636C2C45EA1F4029@MW3PR11MB4715.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h24OM1RrWzEloUxduNtHsq8h+oeX/isWiU7PUuF2AqeJ91AyAXIK8E4XP10tZjhAAvfrRkrz3yC2t7MjSkZgqLiFcOPZLmO1W8JnycQ98N94HGkJTl5BSRlcT8QjaDXJwSKvFj6OFfJ20B9Axe5d41stIOdeD1vfmaOgGCuFfRzEGxvw++OiNIFYG7DAuVP0LDwwdHmrwPl/wd6MXSlP8lSfX9cT3+tS0wmSLpMfzLMHmRqfOo+R34JGIbzkWgj5ieiAe5sWlVqMANxgQRWmvow8Wx26zR2UN68PbH3tVTQ+ViENHe74LFcWU9vjopnZUs4lEUWdjHhvdlyIwetZi63Pv5mLolTJRR0oNOjZSv1toM7U3EhMiuAViUx0gH9QChDkM+7r+er6NxPS9qCgPt+77So4SuO8vOb8gBXC1rIbSZG418ay4AoF+KP3jd4JqQE5NZvrM2nhFyOsRlZZy+Q46z7WRr3OIRlc7iq5LYOlqf1cc2s9JmkUUUgmxzGd2pZ1YJP/96XMWXN9cHEiuY/FY81ggTwYGsu9yr35KmQbpFXIHGxyUWIB9mvu/B9rQfJX8HaTdkL8jUmTMPevl33czXQ2ss9NKsVlgSUsqxlMVJ5VWAiNtS0ZyhabhAJ3aY6SWH4Fxfx4JOpygxC1Sk6wGD0mOPiAAoQDkmFGrT/uh8yqWsKkjDBZyJvSeFpWXMlHKC6Vtx64bWsUglAGh0FOJKnn9B2sceBy9OWr2hht0Q3wwwxTZ9RgtpL7LFi01Bb1gSTtCfGcoimCEKBTag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(2616005)(31696002)(316002)(8936002)(86362001)(450100002)(66946007)(66556008)(66476007)(8676002)(2906002)(26005)(186003)(4326008)(53546011)(38100700002)(36756003)(82960400001)(6506007)(6486002)(508600001)(83380400001)(6512007)(31686004)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVBCQnZqbUhncnJNM2F4SC9TUGRDUGFOWWV6bGdKMk9SMzFFa3c5Q3QzTC9W?=
 =?utf-8?B?ZmQ3S0NxUjFOd3NsWDVQTUltcTZDMmpoVTZKQXNiY0hzbGJYVEJNZ2MwdklM?=
 =?utf-8?B?RFUzUVpyMU9JS3ovbGhVeE5pbVBRYW9qcDFBS0huTUJRYStoYnZUWVBwdXpw?=
 =?utf-8?B?cEJZalZVUk1vTHF3KzdBRlpxcVhYVFBKdVBlTUw0SGE3OUU5Y2hVTndHaHdT?=
 =?utf-8?B?TFpjeUM5OE9sOXBja25SU1gyakZld1hQS3p1S1FPSmFiQ3E5S3RLWTNHZjFp?=
 =?utf-8?B?Q0t5em5NREJJSFM5aXpyeTNxSnNMYlQyV3VWVzdyUTh2dmhkMlpkRHNEVmMz?=
 =?utf-8?B?aXdwNEIycFhvV2VhUWxFZzRycThnVmdHV05yYWF1YzNidjYzLzNtTFd2d2dx?=
 =?utf-8?B?ZTRVMm13TUtlOUVvTjNlN2ZuU2pvd1g4VEZmbkw0emRUSWNUWWI1VEdkTXRT?=
 =?utf-8?B?L1NQU1MrMm05elEzWStmMy9OTkVXdU04Zms1VTBTTURNYlVWWTJTQ01zMjAr?=
 =?utf-8?B?L3JEam5qU2paYm02WlJ3OHEyb2ZWN0xOZXYrUUp0c3VDeE5jenlyTTQrRjRi?=
 =?utf-8?B?SVUwZmp0SDNZeDZhbndEV0prclMvVExqNjFQSCtucDc2NVkrYUZFUGJpSS9w?=
 =?utf-8?B?YTNGcEUwVVVJalRVaVRoZDNLWWpBalpuKzJwdmc2VEJjM2lUbXdTVHRKNzhK?=
 =?utf-8?B?Rm5sVWVkL0dxK0lWejVDRS9vWURvVmdsLy9WMVU3alZ5azJvL2FKQWhlbmJR?=
 =?utf-8?B?SW8zdGhvZmFTZ3JDZWdpSGlTVWY0Slo2aHFET0w1RGxENWcwbk9tSUxuek9m?=
 =?utf-8?B?NFlSbThzRW04c2ZYOXQ2Wmx5cjRvSVhENmFBdWZDWG03WkJxRTlXR3hwTlB4?=
 =?utf-8?B?TXBKSS9uVCtvM1cxM2NycHA0RmhVSTRDRXREM3Z5RHdka0Q4ekNwTjJGYlUr?=
 =?utf-8?B?N3A1ZmRtQWFTODFUVy9RZ0JOSmM1MGpRc0twL0sxSzIzd2tkaUx1WGlacWVQ?=
 =?utf-8?B?eldzSU8vTHZRSitBSldRcWFMYThxVlZHWXRlejhTWkZRdzVucEJRTHlibnBU?=
 =?utf-8?B?U3RZQ0hQMlh1eHI3YTdDOVY0QVl1N3oxWmNFV1JPMkFuUHNMRXF2YUxROUpl?=
 =?utf-8?B?Q1dsRXordGQxdzJxWFZFRFRCdVVaZnVnemc2dWlPQ3NmL3plcXNhSmVPQWtM?=
 =?utf-8?B?U2JMQ0tBRUloRVRDaXZzdGxVNHovS21UVEZmRTJ4TXpJbU9zSEhvMHJCZG1K?=
 =?utf-8?B?ZnZDNUR5REJIclBSeWpwYnlIb0R0TjU5QjJQbnhpejhxd0J2cWhwM3Y3dS9Z?=
 =?utf-8?B?dUUyNmhwdGZyY1M2dU1PRE9BWng0VUpocVhFeU1rVnA1WDZvQnZpbHVaNzBM?=
 =?utf-8?B?Qi9DTzNIL1ZFdGxmWHZicWE5QVA4dWltVkZER3p6SmdLUjJDdmlYWVJsSDNv?=
 =?utf-8?B?TzhwbExqSlc4cmgwKzJKdkJTcHQ3cTZlOTFLc0UreGhqY1YyMlMyRzgxRVh2?=
 =?utf-8?B?NExvaXJmNzZYTGMrSVYydys2dlN6QXRCc1Z3MHlnd1NJS1F1VWFtNzlQdWc3?=
 =?utf-8?B?VUpYQk9BY0NqQWRWaDU2UjNzUktZWCt0Zk9yVm02Y3YwVW9KalQzSGE5Mytw?=
 =?utf-8?B?OHRiSE5UM2h4UGM5dGFYcGJkYldsNHpXcnNSNEp1aGNvTkVHZWVtMTdGYnVN?=
 =?utf-8?B?dm5NSXpjOVZCcmwxVGFySllWNWZwMW41a2pwMmtMcTRtYVluTEQ0WEp2WjNm?=
 =?utf-8?B?Y1RmK3k4bGxrbGxmVUFmb2dBcWdMcTR2ZXFlT2haZ1l3elFpbkdjZlFHRGFn?=
 =?utf-8?B?SG9qdmVRK2QwYjBhVlExTGRxakNITGJ1WTJWWFhVMUFwZllvaUs1bE9UUEZt?=
 =?utf-8?B?YjFVcnZGbHZpeHJGL2FzdS96dmZ5QW5HbkFERVZpUm1xSDVDTUFhZmxvek9E?=
 =?utf-8?B?bXpVMXVUOExBaFpkM3JtSjBQMkpNNThRTXZXeVJ0Qnc1TXRiYjhScDlSSzE4?=
 =?utf-8?B?ZWFDS2ZRNy9jZURGSis0K3BhV2M3aGNJSkt5aXNPUmpha1RKY3EzVVdzMkhY?=
 =?utf-8?B?d0ZjdTFicE1LRnBaUGFMU3hkMFk2SzRZUUZ6TnhhSmdyWDBvWm53S1BSK2Zz?=
 =?utf-8?B?R00zdExzbGlGdGp4YjZnelNWc0FTMG14RXNpdFZhZ0kvU0ZpN3BpenNMQ0dL?=
 =?utf-8?B?OHNrYVBzRGJKWDg1bnB5L0ZqV3o4b1dnb1VnUUlhY2JBeUhFSGM5Wi9Mamt4?=
 =?utf-8?B?MEJBTXByMnNVQVdOUW1yb1MrNmxnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89570f7e-14d4-4d75-a8a1-08d9fb1bc7d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 00:38:18.6841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBHdigcwWGO7hN10TQylCgcUesrt9a9dgUCkmfWn0WPgPmWPa+9f5V82TZkgDnybHvkr2zv3rmLNW+9aO9+wjqRtqunokJb/E/X+v/vH+vM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/17/2022 1:29 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> A flag query helper was actually writing to the flags word rather than
> just reading. Fix that. Also update the function's comment as it was
> out of date.
>
> NB: No need for a 'Fixes' tag. The test was only ever used inside a
> BUG_ON during context registration. Rather than asserting that the
> condition was true, it was making the condition true. So, in theory,
> there was no consequence because we should never have hit a BUG_ON
> anyway. Which means the write should always have been a no-op.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

I seem to have confused patchwork by doing a cut & paste of my r-b from 
a different review, so here it is again:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b3a429a92c0d..d9f4218f5ef4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -174,11 +174,8 @@ static inline void init_sched_state(struct intel_context *ce)
>   __maybe_unused
>   static bool sched_state_is_init(struct intel_context *ce)
>   {
> -	/*
> -	 * XXX: Kernel contexts can have SCHED_STATE_NO_LOCK_REGISTERED after
> -	 * suspend.
> -	 */
> -	return !(ce->guc_state.sched_state &=
> +	/* Kernel contexts can have SCHED_STATE_REGISTERED after suspend. */
> +	return !(ce->guc_state.sched_state &
>   		 ~(SCHED_STATE_BLOCKED_MASK | SCHED_STATE_REGISTERED));
>   }
>   

