Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B5425D2C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 22:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3B86F4C2;
	Thu,  7 Oct 2021 20:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A34D6F4C2;
 Thu,  7 Oct 2021 20:23:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="207161261"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="207161261"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 13:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="624392065"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2021 13:23:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 13:23:55 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 13:23:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 7 Oct 2021 13:23:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 7 Oct 2021 13:23:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6PKDqNCxfO957DIEYch5RFMUreK7FoLOFA78zG2vf+5TqrqTRyEVEFySZgI1R49BTHE4G1jccdP4KrNNjuFoeukmHfjMMInicic7zdahQpPCNKHTQoRocvsz+5U+W/U4qDgnNDx+ix65ySgvpttaBWbBO18FA60FkFt0Oqo8wEjSPGojeEDkOg7Q4rENhbGLp+hhsFzDtF0wUbkcENGrFpL40cfjDmzU0gS7FDjLypfq1/fLqOgazorCNg+xHlsK43T82Bkzas6KQGtV4vjAVaPhTWTjCeOkguY+ltzplSt3kMoKoOTOpMJq9BcwEaIuARA7+sSfcpe+RzYmDcpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Bi8j8tQVdRCo8lBv3zIAFynssHzArQUITqJWlIOwlY=;
 b=Hsi02YL7ZCRWejoMXNDR75rMVl5Z8GLzKapwSn+4gpjtzhd4/7GhkicVe43KU1c+KCFD/84WDqJKLbgk3KeHyUb5s+kqRuxhdQ5BKzUW/Mis5CKfjS7wKmwvYQPkAfaAVPxRQp4Xp6qZd+K+M8S4NEBIbnBelxaj/4GB0gTmmNL+3Gz5cY3NQhJFr5CfOV/2vowCcqJrSjEXRWA3lC+p66E5RToSgFCY7oI0U7sGzI2jfGw1O1EXoDMm/qOSKwWtem2Ob7uuc/XN0QYyRHSa6Cu8f8ex5+8vA0GEgO3Kfmiv7Y3+E2XtTkA8h/3g/lnRtennO+d5r7wiEBm3T4j+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Bi8j8tQVdRCo8lBv3zIAFynssHzArQUITqJWlIOwlY=;
 b=h5z3HKUSZYygXPbhAzrDh1GnIZEll20PSgIJW4L97ilm1V7Cu+4m/ND2SiWDpKl9dyfQJLzRxgdbuZuXVhk0Acr2Bo4fGv3Y/Megn878qOoiqzdZJLM6gPddI7YPLyVUMs4rPLIlamzGdTnwk7lGCtkJQUflk1yqMJcO1uCpgXg=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5595.namprd11.prod.outlook.com (2603:10b6:510:e5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 20:23:53 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 20:23:53 +0000
Subject: Re: [PATCH 09/26] drm/i915/guc: Ensure GuC schedule operations do not
 operate on child contexts
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-10-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <fa167231-7708-4734-e039-7e05bb26a220@intel.com>
Date: Thu, 7 Oct 2021 13:23:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-10-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BYAPR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::42) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 BYAPR05CA0029.namprd05.prod.outlook.com (2603:10b6:a03:c0::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Thu, 7 Oct 2021 20:23:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23409de3-b8e8-4e7d-4ced-08d989d0611f
X-MS-TrafficTypeDiagnostic: PH0PR11MB5595:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55957F25F9DEDB275F0ACA25BDB19@PH0PR11MB5595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y7otV6efSxqIH+v56wZqYm+WIvVd+8WyjxWmAMNu/DQfOjOO005njdMh8BjHihY9817mX43XPry229pTGWdtp/aQSgfR5D0hfbkyTalD71j5IreS5RkT9tbVxGYn1GJVztn/z5IxEAvxq7KCgFS5L9D2YTUNh+T6d+SB9pIxBfoQ8zTjBx7+qgo4XAb/Vj1b+w5XiRtVrAa/qT/kbkvLu4zsme4aYFMf+8ABVi0F/6nBQ3vFnIyQVWR5P9nWsTEZKACXvpJTX2lgJNg2tqBzp7klkY9U6Bhfiro6eT5H+EmZ5OWi+RUQLM5sO2wuZ+nTBp20B11NceTjrESOO6oih9yz7IgldIqRRNhsoFA0p6UkVXwEu5Y5HqHd76KfwgmQrvn2qP5oawd7bEuZ0VgDEuRBkKvFVD2hap4gG7FFW2Udwob+vBN4xeRQ4t4p59nQtulFU+K/PbZR1MrRNLJjQftEgoNGClq5Xpg9uZbopXpzeNMR4cx8XolqkzWw/tMHFqiXQbfmfHCQSyomOYq7B4aXZKVoIw+tolJaObYkcSIcEOo+fAqatGZ17P2WlVaJ7z+3NblnPmzm0wDp81EoPaZuvl5jURYwp64nS6IRY5+P4m7tauxxwfsoOYeATV1u8ZGnKHDGM2uKN+1EvbUYBmHlZ6RX93K3STGOw/qh4h6vsCDaRyRJioEkwxK2Hu8APe2B9igk6X72XSj4wbWl5PMxLVGh2RE82EfUenUA08A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(450100002)(8676002)(83380400001)(86362001)(16576012)(956004)(2616005)(4326008)(66476007)(8936002)(66556008)(31696002)(31686004)(66946007)(6486002)(36756003)(5660300002)(107886003)(186003)(508600001)(38100700002)(316002)(53546011)(26005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1Z0cmNUT0YzSE12SXgwY2tEWU9GSkVKZFlLcjQ4dUNpaEhqdlN1VjJrcWNG?=
 =?utf-8?B?M2MvT1dSMWx0VmExZm93cXc5NmJJakhEMW1BZTJjUEtUeUlsVVFhQWZKUEZR?=
 =?utf-8?B?ZFZWR0V1cTVqODhwaEVHb1J0WFcyZXVYV0xYbFNScXVjQ0tQcmZ4OTNpWXNo?=
 =?utf-8?B?Z1hWbktod2IybmovSTJ5QUkxdEJIcFdrcG15VElFQVBsU1ZBeHB4dlFCRU1Q?=
 =?utf-8?B?Tk8zemlkVEhwMTk0ajZPNVVUckplV1RPdEV1Ky9OanF2c213VWtCM2xiS1Jo?=
 =?utf-8?B?bXZkSm5YTUpkODNXUkFNYytkSTJFcWNZaGg3VnVUeFI3NEZLTWo5LzdOU3BM?=
 =?utf-8?B?akJvNFhTY1REREJmRzdkeTYwTFAwMU1SeUtwL0RMNW1UcHN5OHZQNXlsM0tp?=
 =?utf-8?B?K0xrOWwzRVhpYkxqVlBVU09hQnRwWjJzNjZXcjljQktoRnpORExsS3g5aHZL?=
 =?utf-8?B?ekdyYzR5OEVycktHQmNjVjNXU0JrNW1xcittdVpwL3lPQkt6YUNzWVV4WndC?=
 =?utf-8?B?K2JXaTBpdzcza3Vqd1BuUEpnVnByazkvdTZCZW9QRzlQWFdxQUFQUGMvOUJB?=
 =?utf-8?B?OUk3bHltU0xoWWNTais4bzMxbmFaZjU5eFErb0pSNStKZzNRQklXRzlEWWZM?=
 =?utf-8?B?M3RGK3JSL2tFN2Fabnl6SnVVNDkyc3hwU3BBWHl6Si9PcW9XeFNsd01RY0xW?=
 =?utf-8?B?elNJdjFETmI1eVRhQUt4dXJCOW5VenlTc1JRYytEa0wrK3ZoRTE5YWxkRTN5?=
 =?utf-8?B?di9oTXNubHJTNDQrcjd6azMvVWw2SkQ0MDVZQlVqMDVyckZjdmxZZldta1Vy?=
 =?utf-8?B?UlQ5R3NKR0ZmRnZLYUwwbDhkd043VklGNU03N2RWWDFScEZTUktZd0RnV0VM?=
 =?utf-8?B?eWdVOUo1UE5LM2pMV1FVeUhPSHFEbzBkR2g1aURVQ0Y4L0FsdmZlZENodW0y?=
 =?utf-8?B?amhuemk0aC9xaGV2Y0VSU2hJcGtiWXNyZHdjZFdxbjY3MS9PUkFLZnI3YzlD?=
 =?utf-8?B?cjhBUjdKRUd6ekNtTlJTN2k1NWUrUFJFWHppb0g5d0M3TlpFeFh1VWFlMmNZ?=
 =?utf-8?B?VDhBSk5XVEVIWTNuZmxjYnZrdGtLRldyUjZaM1cvR2drWUdiK1hmdTRFcnpW?=
 =?utf-8?B?dzJuQldxU0N0d2g1SFFEY2wvVzNyUnprRHdOSm55eEFnQlgyODhtSytOMjR4?=
 =?utf-8?B?dTcxVTFUVy9KUHFpY1NMUEl2Rld5S240WXkwRUVuNEovNFdpb05XQzRTeFIv?=
 =?utf-8?B?MjFlbVVrZkhCdXV1WVdzY1JEUERPVWNtME15Mk9MVTJrM2s4di9yT3pGN3hE?=
 =?utf-8?B?K3FoOTRLV0thSS9nbktOK3hhTHFrSW5sSE8wc25rOGJiOXpGWktvellCUkdO?=
 =?utf-8?B?QXBJbGZqK1BUd0tCblFMTEFQL3lMOWU5d0phRDdyejBjaEVIWXZDVmwzbkYz?=
 =?utf-8?B?blpXNFFRTDN3d3FPMTZUNmJndTVVOEhnU3J5alVvMEJ4NUw4RmdZN25XaERV?=
 =?utf-8?B?KzQzUEdIcE5uMDdWdHRpRS91ZGxjY2xHaEdMbnNKYzFEM1o2UVlVSmR6KzhF?=
 =?utf-8?B?Mld2V3NFU1JiWitmTlA3Z240Ly9EWWsvY1M3Zm44VjNJeWNsdGRPSmFPRFh4?=
 =?utf-8?B?U3IvY3dsUXZXMjVXbTQza3dFYlNTVzA0eTVVbUV5b2VyVmd2OEJPZ1ZWeXkx?=
 =?utf-8?B?d0t5eG5QRU1OYTk1UnhSRVA0WGNRcVgzRzM1R1pRTVFGMlNKSnFsOXJXeFVX?=
 =?utf-8?Q?PeewiQaskeODdXA2gtG/43s9nwCRJlbLr5AImA6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23409de3-b8e8-4e7d-4ced-08d989d0611f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 20:23:52.9252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYu73twYuL1tjAdFAMyyqO0VQONGPVrmi4ZSL8JWp6ei/Ih9xG64+30M1OROPZG/7JGXdLRF1zKilVABtSzsp/I78Nsa//kPufaFLnLzr+c=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/4/2021 15:06, Matthew Brost wrote:
> In GuC parent-child contexts the parent context controls the scheduling,
> ensure only the parent does the scheduling operations.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index ab6d7fc1b0b1..1f2809187513 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -324,6 +324,12 @@ static inline void decr_context_committed_requests(struct intel_context *ce)
>   	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
>   }
>   
> +static struct intel_context *
> +request_to_scheduling_context(struct i915_request *rq)
> +{
> +	return intel_context_to_parent(rq->context);
> +}
> +
>   static inline bool context_guc_id_invalid(struct intel_context *ce)
>   {
>   	return ce->guc_id.id == GUC_INVALID_LRC_ID;
> @@ -1710,6 +1716,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
>   
>   	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_sched_disable(ce);
>   
>   	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> @@ -1935,6 +1942,8 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   	intel_wakeref_t wakeref;
>   	u16 guc_id;
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   
>   	/*
> @@ -2303,6 +2312,8 @@ static void guc_signal_context_fence(struct intel_context *ce)
>   {
>   	unsigned long flags;
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   	clr_context_wait_for_deregister_to_register(ce);
>   	__guc_signal_context_fence(ce);
> @@ -2333,7 +2344,7 @@ static void guc_context_init(struct intel_context *ce)
>   
>   static int guc_request_alloc(struct i915_request *rq)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   	struct intel_guc *guc = ce_to_guc(ce);
>   	unsigned long flags;
>   	int ret;

