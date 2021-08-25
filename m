Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066873F7DE7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 23:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FBD6E42A;
	Wed, 25 Aug 2021 21:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799396E42A;
 Wed, 25 Aug 2021 21:51:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="281334989"
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="281334989"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 14:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="464910914"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 25 Aug 2021 14:51:17 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 14:51:17 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 14:51:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 25 Aug 2021 14:51:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 25 Aug 2021 14:51:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdtvKilF1EEo4QU2UseO+fCe8JW6l6dd62H1ndacFZUYiGJEoU+QqqxMCStTkXDJgcip6NlMFqRj23+OsoTgH+sTi75X02cRcSY1vpoSzkDQQPt9KhV1sxnKBcJhkiiQ2QNvKa2evlOswPf88Aqy+730CQaEn6MBR+hI9Ucis10ks1Nof7/ca2voc5WF2cexl+pJ37ByBlw3RMu6jyhivBpnRyOj5/g1XD+RRwYj3QPJPnbto//qMfxUhfrjT9x+l+1A9gVut/zH0WJwzUNa9E3YtLQqTzfS/erQ8sJIJAR5xk9pFuGQTGQMhyUMv0dI1iFPgSfixiDmXeKjkMcreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5RKDDRN8E4buVSMM6aNxoOaQF5a0jYelZv8q/3ioGw=;
 b=BDK1lek3Px7qfnviINBLON3Cok6RM57P2Qx7lapmfVXLa+YEQ/5QGnzGwxWBtdIcja+GISoHBXew2od+NBhTjcO3j69KfE6PWRL+wQkyxOAkA3dBXQWobTA9hI5zAM3p+wwCUnXX49ZXB8PY4dQB8Ap0a6iIlPz63nqvDNJE9oM4b8eiBV1wSKnPAKMwRj0oCYGhmD3WIH+h/h/wx9lAEVAEFlTrkDGzev/UJS1QUDGDWqFi54EjfsoeMKh+xWu/PP1CwGm6q9OGNUPBiHg7+4YrqnaM79gIUJv4ytPsqV/MhZZLMDs3w7UM0DFJk7w5zPZTwUkTjuR2b18tT1xNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5RKDDRN8E4buVSMM6aNxoOaQF5a0jYelZv8q/3ioGw=;
 b=zfyrSe0DmJP53o4IJHL5MG+wWGiiOVlFyybPqvFrGWfCunMz8nsOScfOV9uYlnc4zfJCIkwzhJBci9pHWUf/j13FLDmahWkqHLpgZ8cz1DeM9Kf+UhK20ueTEWfJ1elTj9bhwCbJN6U7Hg/XUA30MMYVpSFV9aMvskD/qT1J4fg=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1689.namprd11.prod.outlook.com (2603:10b6:3:14::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.21; Wed, 25 Aug 2021 21:51:14 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.019; Wed, 25 Aug 2021
 21:51:14 +0000
Subject: Re: [Intel-gfx] [PATCH 23/27] drm/i915/guc: Move GuC priority fields
 in context under guc_active
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-24-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <9de5b4ac-a808-c77c-afb3-fc45b7e57145@intel.com>
Date: Wed, 25 Aug 2021 14:51:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-24-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR13CA0085.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::30) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR13CA0085.namprd13.prod.outlook.com (2603:10b6:a03:2c4::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.9 via Frontend
 Transport; Wed, 25 Aug 2021 21:51:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e59894a1-f5f8-434e-7620-08d968127587
X-MS-TrafficTypeDiagnostic: DM5PR11MB1689:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB168984F8675934C3903BBD92F4C69@DM5PR11MB1689.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pvw8wF3oJwwQaycVgQsj5qpbeRQ65HdBeZaQpMQUK4ymY1WNPfqrMvT/5GMe3KOB0YlvXDw4nrTM81qoeYPW0EHLAbdqeJf/Pr6cYen2xSMXFiV6H6ioC4RNkKbARtLPC8nRBQmO9brbvyHPH70++zLKuwOLNeWxiCHrz1nR/dtMaJwMuHTBVgzgSNQZ3i4JjCRJGWG8KSslX2sJxueTAXhaEQpHxpv7hQr9XwYks5ly/3BfW/KTQz64OGPi/32USdMRLSVj2W7hjMdNiFrs8dWdTl2XJafxj9+Z/a3kLcTIJF3FyUitM6+cw3dzh5PtXBDxEEdKhrM9zjcfyl368Z1mQiS+Rr2VGu0MLpfclN+eojXR9fTEjzmatkAXII3qks7o3mdvD0jtpqJn6ic639xv45JuLxGuadcqy7AoFS4cdVcQ39qNKfI1jwLXuJH7xPKzK10e5GgkQbY9w8EaDRgqE0AR2nQu2b7f1SFl4TAW0sOvJhpCxazv3me4ARAB8HqIQGE7+8I9F0v0T1o1l2YAeRhD8kiqZzyEWRBdpEN4tu8cTjALx7evnTT5kxEdW6iMUkwmAv5tUVucCLP9nZ1SejUbx4CrVP+bRZSLloanNZuyhfU+u+cRxlTUOp0f9KcVzza5bDmz2OjoPOm87ISSrmg5MRHWBle5EUZjxKLPUhe+1gTaChuWvYzLb0W+0RyiLlM7PxQFlaTs7y1pgq4y30hxkrrKmclUiFJACFA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(5660300002)(16576012)(4326008)(316002)(31696002)(2616005)(956004)(83380400001)(2906002)(86362001)(53546011)(66476007)(66556008)(26005)(38100700002)(8936002)(186003)(36756003)(8676002)(31686004)(6486002)(478600001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXJCUkVWUDBGMXp1Q3RjYnlkQ3FsMEw5WHVUbEo0eFI2dTN4VnY3Zm93QkdC?=
 =?utf-8?B?M09sWE9HVm55QURKOS9GZ3ZGSW4yQzdzS09iNjYvN3RmOHlCWjdxNEpETHFN?=
 =?utf-8?B?cVAxb2t1Vlp6UEVNSVVEZ3ROYlpqcHZkUHJGcWp4VCtqY2Z5QWlQK1dNd1lt?=
 =?utf-8?B?b3RETUJOL0lVdmhrekwwTHlxeDNEMmZSYTMvV0JpbEpHa05BbkRqWlF5SklL?=
 =?utf-8?B?WTlGVjQwOGhGZjB5ZzRrZzlta2xmc29SVXBpTG9hNHBOeWt3TThlbjhBYXRI?=
 =?utf-8?B?Y1VOeFNib1FWc3hONEZtN1VHclJOdHhub2xvN2paNERNUkRXMy9vN3JZZ1dl?=
 =?utf-8?B?cjB4WmZPdURORzlRNmRkbk8vdWZWZk10UXErV0xEWHlGYk94Rlh2YmJMb3Vt?=
 =?utf-8?B?Rk5tZTBuL2dHYjBXK1ZmMERmKzhUZ01POGdSdEQ1YXBsTU5Edzg2RW9Zb2ph?=
 =?utf-8?B?UE5CMExtWmhrT3lSUjIwam1YTzNVZ2tUWTU4ZnRpMTI2N2ljOGtjZVBrKzhI?=
 =?utf-8?B?WFVyWmVPZE1MWEJOL3RDVmRBSnlqVmJYd1ZsMGtKS3V6dUxXM002VXpSMEwz?=
 =?utf-8?B?OWhCYzRYb25oc2s1NEdGd0d4QU15TzdkenB1ZEc3ZXVFb1A0bTErVEE5cnFC?=
 =?utf-8?B?MXdsaTVHeWhtQkFEVWI2NmhsQ2d5N1ZwMXZGTVlpa1VZWDUzcTVyUGRxMVVT?=
 =?utf-8?B?OWxVM21jZDNpa3lQeWs1N0pXK24yUW9IeUJCanpaZUN3alZsS2dBYkllWUFM?=
 =?utf-8?B?V0Q5NTN4MVVZR1pOV1IvN2cxREE4cGdmd1RnUldHOHU0TzhySmxnanBaSzR0?=
 =?utf-8?B?bGhpQ2lXSS9vUllIMXcxU1NQK1VHbm10WXZ1ak5mcHVkc3ZuSVJMMWN5RzVv?=
 =?utf-8?B?cTVqcDA2LzFJcHBHMGYxSHQrT3FDTVBMWVltaGErNkhQT1hrTEw3S3FQRlNE?=
 =?utf-8?B?MnJXSlJSUnZLSzJtNTU0NUtqU3R0TjN1Wjh5UFFwd3BrZ0lONDF5dmFYYWxa?=
 =?utf-8?B?Smw1MzU2VDhKdlBhMzE1cTlKUmVtUENvT0VpcGprQlhxL2U1ZU9uUFJaaTVp?=
 =?utf-8?B?djFyM0RZVERpdzMzOWMxaElYdlk0K29WbVhaU0hLUVBOVFFWYVJqQTVKZnpC?=
 =?utf-8?B?NkFnM3N1c29TaHM1VTAwc1czQUc2UnovblRkMWNDR0YxRHVXRzVxbm9VU0Zm?=
 =?utf-8?B?bEZDK09CK0pYZldrbHFIdVlIeCtHS01xbEo3a3pJYmVlNyt5WlcrQTl0S3FJ?=
 =?utf-8?B?Yi81UHZnV3pNeVBGT2MrUW4yaTBwMnY0MkZhQytGcytrQ21LbkVWMDJaRXEr?=
 =?utf-8?B?K3g0UmFSTUNkckh0YnpxWldNeVlicjlIdzRFWXVPQ0NzRnR2dWdPUHN3eEVE?=
 =?utf-8?B?OXZjSS90Zit1NU1LRFBmKzF4blc0QnVGYUNEaW1vL0wrNlI0bFBjeWkyOUtm?=
 =?utf-8?B?RlFGNElWZzU4eUtPRVNRaFpkUHRITDFOaXBYaEtKaVNQYW5DVERSWnpmQ2x3?=
 =?utf-8?B?MGJmVE9TTVMzMjdQaklEczYzV2lvZEg5UzBQOTFCK1pFdWdtUTF4Smt1VVBV?=
 =?utf-8?B?aFJSMTFKUTF1ZGtzNFBJL1Y2UUloakcraXZKbWxaSXVnSWVRaVF1a0ppZThE?=
 =?utf-8?B?UjZ2TXN3MEpuRzROV0tJV05IRlE5MTBxd09IWE9IV25YMnZlNHQ1Vno0TXZX?=
 =?utf-8?B?ZW9OZ2lwRXpsVDRQeEdLRjYwVTYxdUMrSEVScmxWS2NHblJ1YjEvYm1TNDlX?=
 =?utf-8?Q?Js/C3UN1v6dNjExh1YpkhBOnJfoZPB35nB4OBXO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e59894a1-f5f8-434e-7620-08d968127587
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 21:51:14.1969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2atbr7YMmUEAnu/OIChw4RGd0jCe2FllpV9scbmKxXvww5a5zAiAU0qaRWaUtGf2r876uwVs11YxcBEgme14/Ukth0TeLkqX45jYpVeam50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1689
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
> Move GuC management fields in context under guc_active struct as this is
> where the lock that protects theses fields lives. Also only set guc_prio
> field once during context init.

Can you explain what we gain by setting that only on first pin? AFAICS 
re-setting it doesn't hurt and we would cover the case where a context 
priority gets updated while the context is idle. I know the request 
submission would eventually update the prio so there is no bug, but that 
then requires an extra H2G.

>
> Fixes: ee242ca704d3 ("drm/i915/guc: Implement GuC priority management")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h | 12 ++--
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 68 +++++++++++--------
>   drivers/gpu/drm/i915/i915_trace.h             |  2 +-
>   3 files changed, 45 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 524a35a78bf4..9fb0480ccf3b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -112,6 +112,7 @@ struct intel_context {
>   #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
>   #define CONTEXT_NOPREEMPT		8
>   #define CONTEXT_LRCA_DIRTY		9
> +#define CONTEXT_GUC_INIT		10
>   
>   	struct {
>   		u64 timeout_us;
> @@ -178,6 +179,11 @@ struct intel_context {
>   		spinlock_t lock;
>   		/** requests: active requests on this context */
>   		struct list_head requests;
> +		/*
> +		 * GuC priority management
> +		 */
> +		u8 prio;
> +		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
>   	} guc_active;
>   
>   	/* GuC LRC descriptor ID */
> @@ -191,12 +197,6 @@ struct intel_context {
>   	 */
>   	struct list_head guc_id_link;
>   
> -	/*
> -	 * GuC priority management
> -	 */
> -	u8 guc_prio;
> -	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
> -
>   #ifdef CONFIG_DRM_I915_SELFTEST
>   	/**
>   	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 3e90985b0c1b..bb90bedb1305 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1369,8 +1369,6 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
>   	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>   }
>   
> -static inline u8 map_i915_prio_to_guc_prio(int prio);
> -
>   static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
> @@ -1378,8 +1376,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	struct intel_guc *guc = &engine->gt->uc.guc;
>   	u32 desc_idx = ce->guc_id;
>   	struct guc_lrc_desc *desc;
> -	const struct i915_gem_context *ctx;
> -	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
>   	bool context_registered;
>   	intel_wakeref_t wakeref;
>   	int ret = 0;
> @@ -1396,12 +1392,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   
>   	context_registered = lrc_desc_registered(guc, desc_idx);
>   
> -	rcu_read_lock();
> -	ctx = rcu_dereference(ce->gem_context);
> -	if (ctx)
> -		prio = ctx->sched.priority;
> -	rcu_read_unlock();
> -
>   	reset_lrc_desc(guc, desc_idx);
>   	set_lrc_desc_registered(guc, desc_idx, ce);
>   
> @@ -1410,8 +1400,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	desc->engine_submit_mask = adjust_engine_mask(engine->class,
>   						      engine->mask);
>   	desc->hw_context_desc = ce->lrc.lrca;
> -	ce->guc_prio = map_i915_prio_to_guc_prio(prio);
> -	desc->priority = ce->guc_prio;
> +	desc->priority = ce->guc_active.prio;
>   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   	guc_context_policy_init(engine, desc);
>   
> @@ -1813,10 +1802,10 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   
>   static void __guc_context_destroy(struct intel_context *ce)
>   {
> -	GEM_BUG_ON(ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
> -		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
> -		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
> -		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
> +	GEM_BUG_ON(ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
> +		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
> +		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
> +		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
>   	GEM_BUG_ON(ce->guc_state.number_committed_requests);
>   
>   	lrc_fini(ce);
> @@ -1926,14 +1915,17 @@ static void guc_context_set_prio(struct intel_guc *guc,
>   
>   	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
>   		   prio > GUC_CLIENT_PRIORITY_NORMAL);
> +	lockdep_assert_held(&ce->guc_active.lock);
>   
> -	if (ce->guc_prio == prio || submission_disabled(guc) ||
> -	    !context_registered(ce))
> +	if (ce->guc_active.prio == prio || submission_disabled(guc) ||
> +	    !context_registered(ce)) {
> +		ce->guc_active.prio = prio;
>   		return;
> +	}
>   
>   	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
>   
> -	ce->guc_prio = prio;
> +	ce->guc_active.prio = prio;
>   	trace_intel_context_set_prio(ce);
>   }
>   
> @@ -1953,24 +1945,24 @@ static inline void add_context_inflight_prio(struct intel_context *ce,
>   					     u8 guc_prio)
>   {
>   	lockdep_assert_held(&ce->guc_active.lock);
> -	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
> +	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_active.prio_count));
>   
> -	++ce->guc_prio_count[guc_prio];
> +	++ce->guc_active.prio_count[guc_prio];
>   
>   	/* Overflow protection */
> -	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
> +	GEM_WARN_ON(!ce->guc_active.prio_count[guc_prio]);
>   }
>   
>   static inline void sub_context_inflight_prio(struct intel_context *ce,
>   					     u8 guc_prio)
>   {
>   	lockdep_assert_held(&ce->guc_active.lock);
> -	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
> +	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_active.prio_count));
>   
>   	/* Underflow protection */
> -	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
> +	GEM_WARN_ON(!ce->guc_active.prio_count[guc_prio]);
>   
> -	--ce->guc_prio_count[guc_prio];
> +	--ce->guc_active.prio_count[guc_prio];
>   }
>   
>   static inline void update_context_prio(struct intel_context *ce)
> @@ -1983,8 +1975,8 @@ static inline void update_context_prio(struct intel_context *ce)
>   
>   	lockdep_assert_held(&ce->guc_active.lock);
>   
> -	for (i = 0; i < ARRAY_SIZE(ce->guc_prio_count); ++i) {
> -		if (ce->guc_prio_count[i]) {
> +	for (i = 0; i < ARRAY_SIZE(ce->guc_active.prio_count); ++i) {
> +		if (ce->guc_active.prio_count[i]) {
>   			guc_context_set_prio(guc, ce, i);
>   			break;
>   		}
> @@ -2123,6 +2115,20 @@ static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
>   		!submission_disabled(ce_to_guc(ce));
>   }
>   
> +static void guc_context_init(struct intel_context *ce)
> +{
> +	const struct i915_gem_context *ctx;
> +	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
> +
> +	rcu_read_lock();
> +	ctx = rcu_dereference(ce->gem_context);
> +	if (ctx)
> +		prio = ctx->sched.priority;
> +	rcu_read_unlock();
> +
> +	ce->guc_active.prio = map_i915_prio_to_guc_prio(prio);
> +}
> +
>   static int guc_request_alloc(struct i915_request *rq)
>   {
>   	struct intel_context *ce = rq->context;
> @@ -2154,6 +2160,9 @@ static int guc_request_alloc(struct i915_request *rq)
>   
>   	rq->reserved_space -= GUC_REQUEST_SIZE;
>   
> +	if (unlikely(!test_bit(CONTEXT_GUC_INIT, &ce->flags)))

Where is CONTEXT_GUC_INIT set? Can't find it

Daniele

> +		guc_context_init(ce);
> +
>   	/*
>   	 * Call pin_guc_id here rather than in the pinning step as with
>   	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
> @@ -3031,13 +3040,12 @@ static inline void guc_log_context_priority(struct drm_printer *p,
>   {
>   	int i;
>   
> -	drm_printf(p, "\t\tPriority: %d\n",
> -		   ce->guc_prio);
> +	drm_printf(p, "\t\tPriority: %d\n", ce->guc_active.prio);
>   	drm_printf(p, "\t\tNumber Requests (lower index == higher priority)\n");
>   	for (i = GUC_CLIENT_PRIORITY_KMD_HIGH;
>   	     i < GUC_CLIENT_PRIORITY_NUM; ++i) {
>   		drm_printf(p, "\t\tNumber requests in priority band[%d]: %d\n",
> -			   i, ce->guc_prio_count[i]);
> +			   i, ce->guc_active.prio_count[i]);
>   	}
>   	drm_printf(p, "\n");
>   }
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 0a77eb2944b5..6f882e72ed11 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -910,7 +910,7 @@ DECLARE_EVENT_CLASS(intel_context,
>   			   __entry->guc_id = ce->guc_id;
>   			   __entry->pin_count = atomic_read(&ce->pin_count);
>   			   __entry->sched_state = ce->guc_state.sched_state;
> -			   __entry->guc_prio = ce->guc_prio;
> +			   __entry->guc_prio = ce->guc_active.prio;
>   			   ),
>   
>   		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x, guc_prio=%u",

