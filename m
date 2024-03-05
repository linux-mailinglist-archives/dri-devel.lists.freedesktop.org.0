Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA58872A69
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 23:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EEC10FE05;
	Tue,  5 Mar 2024 22:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAXYsDLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3E210FE05;
 Tue,  5 Mar 2024 22:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709678880; x=1741214880;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k4nwRv+5CL+HU7QKN+TMqh/BMX2ubarXrPNDsXLXKCQ=;
 b=kAXYsDLrm6Jw3ITxsJMc1rMI9CnGVGFysSohutMGqTopN1bOOMrVdfFD
 BeAHUVpRMzrseDWiVuzchWKrlpaREjuGSxGKn8k5KiGayj/QWTLmZ3l5G
 OyoDL9KoeIMh8DniwKckGK8Mg0BrACf/J2S7Kw+rzYbBeI//mTigF7l/v
 aW8vbyDwqCajLsw2wj9gBXeCCgydYOJHdoUpnzoG2A5zH/5LuRaZCcf8C
 oGqBQl1EcOZFcTHLbv2tNuW+ZfZiif1C/IzNEh0ausi7z7G3iyXmz6/sQ
 FQB19l5IYllMgw6w8nl4p6kvpAXpkuh0Qh7orTM3Isa5zXARETEYNSJwJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8068019"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="8068019"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 14:47:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="14021350"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 14:47:56 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 14:47:55 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 14:47:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 14:47:55 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 14:47:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1KjjzAKyAq0YEtJCRfl7NbaGcDWeapZSQr8FD8Wcj5tfil3Wi1GRnbl4RLc52I0V3NGaA1f6s6nuhLkvYNlxNodVy6pNZgCd3d6KVyd/fGHnGX6pJhmekxuRwJPMvuRm/16BH41gItV4nRKNYjA+1wtlnajsG/AaqtTFB/1mtOIURZDsxpSRiMqhTMJkENfeJUw1gerKNsuC9asIgawbzfqGOk6s46sVcYeQnex068QU11VbtMs+/lQNQpO3I8oPhCt9Rmjb8i6xO70MBXd9PhDXqLP8gZg4JnYEefTiK5yXt7H/lthiFRjmWNLth3QJO3aCgWHq/hW1yezr4OvCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6c7WEHr2k/qMwapgamLYtXA0JB9uLpsuPwTvtIR/ws=;
 b=ogi44EiqBTG80dQGudlRT0Lyej/kyWlVv7/BOEWxFcSyYindFEjHPM/QsoBDcc6mLClV55bx/c2vexskXZ8bJfioENY4vG7E56wcHxEC0JyZ0z8dpm/mCXd7SIqAcOxXZuTd9qyW+lSw3Zz4L5jh9oyEFIpJ1puhnFg2rfnuJpyyakDQnwFM6BgW2UrIe3WG6hY2P3GxIpf+bL63H6K0eDO8sTH15ZYyf/O4p4NZ68p4MgOIlXbJPa4mOSmmuP5mSRqaqZDux/kcpSMx8x8gnyL8AoHyKiStL9gyFWu7qkX6OxknZaqmYZnBufgupsd6fbyphpl3RtNZ/92RoaGUlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Tue, 5 Mar
 2024 22:47:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 22:47:38 +0000
Date: Tue, 5 Mar 2024 17:47:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Sushma Venkatesh Reddy
 <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH v3] drm/i915/guc: Use context hints for GT frequency
Message-ID: <ZeehBqhY7WsagcNy@intel.com>
References: <20240304233450.4040579-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240304233450.4040579-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: cebf0f37-7c4f-4868-ac81-08dc3d6641d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sbt6OA5yHeO04P/hC4IbXS4N7T/F3Xdl/UfRiFYbBGUDGu2GurcUliKObd5+w+AZ5kbCAmLzX4IhF4oMTWlt1N3BdVQV9R4UbEy5hGbjYjTBlaKmnGWdTROnOTdLl85On1pCg6138qyPbk9liAKB9iTmBFjF2XNDZeWwASspRuEp4lpUiKalA75ieSwyOJdXnnNWDNcYtER1OSfKdwPp24hXfx5VAjLAyFBTu7aDWZPhlLZTzIyPm2SraHZUyz0Aq8ZDsz2c1tIo0DRmFyVrMachAjpVQQB3URA+RIVEDroBXmhwqF5tdTaAcEE2olNqg5B9kDRPU5vZgEO7iEjd7B+xCXvEI4WSfPA9PgMB5roodMiTQVaGjj0+qqWveNVPV5D39viMvn4Wadlev8aTfEowAR5m7PRKcGa34OthryJ0nAd+FuliAOTqVAXbD+GXlDWkJblD9Pso8MymwNNT3uTbgzKkSTBpoedLoG83J3PkUYKuLofNslACFzl6EJvIY+vuWYEDPvo3NeMzQq/37J0gXqlQ258E4CfNX/PeyLKSSa5dlPm1HoKRUCAWMa3qJslCOVp7wH2g1bH/j70YPhhcbbdCFLZPPPF4p9V2FbU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?McJpfLqiwuE93plIZaEKfzeCFZrSrhEfDD9mr9AGeeioAruITTmSxRtF+7Ly?=
 =?us-ascii?Q?sl6G0AAxJguJ0X3pntnQcBqAzO/FsiBZplLbES1i5UXMz1N3GyDlz78IJn3/?=
 =?us-ascii?Q?hXV8v4WqiMRyODulgZmBQ3zxidgudvccy3DFeE3PJmpidsqjuxigGtUiI/0p?=
 =?us-ascii?Q?xBxqf9Fty9IuFIYfZEmc7C3GMcL7MTE7gpywr8isNl9ZbNpg3IFRNdU+vf1R?=
 =?us-ascii?Q?h3jHtQYZYQSGpwRJb6oO0wPNIy1KTRMZ9GQCc2FaFx0DoOiBVLtEAqPVIF0b?=
 =?us-ascii?Q?5vuquZP9aCicc6jwyaIHQ/xcBOaZurj18j1MPZqeUv/3Es1FcmeaaW/VK8dd?=
 =?us-ascii?Q?Xek878AjwxHZl4aN+f156C/CasX0vmpAtjxqcuuVLGcRElOdljdUaSYr88sx?=
 =?us-ascii?Q?UJfdAFgJ/LwTz1nMn3Qqo41zba6s78Qbur3/78fsLm0UJ0f2VHWwseXGGCmR?=
 =?us-ascii?Q?GK14o1mYTgBA/7oHPC5JZudEJaA9dEMHVHKnAwHuysasPlkKDo5KAhPTHvoJ?=
 =?us-ascii?Q?ZJ4N8ttH2Y21X5oJUQewf+RfbNAHZxTXUPTtoDnTNeachqqxqhG/XrIxk4rv?=
 =?us-ascii?Q?4sdbPALbyCacoOkHKs8Y8XnUBIAYHZXFQLm3JrGvEf/2dcFatfei2uZ02SU3?=
 =?us-ascii?Q?izt07OAdR6eo0b4KOUsALLvXSAlh5Vpd8ESZq/ZGbRElGdk0oxeTWPlr6gTH?=
 =?us-ascii?Q?O3SEpzcvbS6HI5l1ZEtIfEEi8Z8Q5As5AKefOj9sqPFof6XCDxkpRxIOUUXK?=
 =?us-ascii?Q?PgeIwrd+Huj+E0FjhjwhJGknHo4zxLYp++WZB917QyLWq3NSerImYOQR3jkA?=
 =?us-ascii?Q?v9pvzZgiseTq2AWnNmOiHy8DJslBSZaw9JWpuyIRTNoryjQbHI34IeFZ2qY5?=
 =?us-ascii?Q?3aZdhsr29cK12i7mfz9/POxpLTwtTYlLHf1s3XpVJOlkkquWFE6RZK/KLaIY?=
 =?us-ascii?Q?szk/DZBEnmt+Qwdpm0KgA4D9pLz1dOVerrIvSI/BC2+gnOa4AhY6gfVc8nC/?=
 =?us-ascii?Q?NaruHEzSdjtwGNGanzV7xQBOxjL9YRZtu/o93PZ94IzAXn9lNd6ygPPN15ht?=
 =?us-ascii?Q?17l3PbzKLWhRN0Uv0nRQg3fe+T1H/oDJcQcMgFW4ALM9NYrHIPXRqQW89Q9p?=
 =?us-ascii?Q?4RlrWQcU/RwLArXDTb4jEtWUoubeGJBpkSJFkh6bBLiRTSYPhOHeQUIHo7Ui?=
 =?us-ascii?Q?W9JDtV8dUB6CKRS1CJyeY87K+ibj0HDFPq5yFw94dtiYY/QE5joFoRyHFDXp?=
 =?us-ascii?Q?jsuQkJNPvf1gvZd/UyjAaV5se+nGS8xFQhw+Q5eZFKoc8I2pitnj1pO56ubX?=
 =?us-ascii?Q?WNguxZsjsRLNO/noJdMatPjOTwUycfbPnyknCmU5FWnc+Uk92RGsjeWqYEsz?=
 =?us-ascii?Q?o8xP09ClOkvzBQbwoq1n7Vz/rY2jL3uDZwiUdnYradpzrX8mwb5KO9Uaoinh?=
 =?us-ascii?Q?uuflT9B/mlSpKeKY5c3UVGalbQb8e3Knbg3ExOk5m0EYbceb9GQfKQHABG0d?=
 =?us-ascii?Q?IA65efh1blZYGduPlJXkK9sjSpNI4GOSUww/3n/2fVdtXdysOoQCmro7QUVI?=
 =?us-ascii?Q?tqd9Tl8tv5SdF+dkZA+wQPGtnlzyj/M+nEyvU+XRYedoG1BLwDubu7FrV9tL?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cebf0f37-7c4f-4868-ac81-08dc3d6641d9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 22:47:38.2483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n507QM6Euz7tDl9Pzel4y0f+T+1F3+Q/UsOgffaAXcx1q56QKgSeAP7VqrWmcSB3TL9afR0x2eOvzyRU3iPTvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8393
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

On Mon, Mar 04, 2024 at 03:34:50PM -0800, Vinay Belgaumkar wrote:
> Allow user to provide a low latency context hint. When set, KMD
> sends a hint to GuC which results in special handling for this
> context. SLPC will ramp the GT frequency aggressively every time
> it switches to this context. The down freq threshold will also be
> lower so GuC will ramp down the GT freq for this context more slowly.
> We also disable waitboost for this context as that will interfere with
> the strategy.
> 
> We need to enable the use of SLPC Compute strategy during init, but
> it will apply only to contexts that set this bit during context
> creation.
> 
> Userland can check whether this feature is supported using a new param-
> I915_PARAM_HAS_CONTEXT_FREQ_HINTS. This flag is true for all guc submission
> enabled platforms as they use SLPC for frequency management.
> 
> The Mesa usage model for this flag is here -
> https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint
> 
> v2: Rename flags as per review suggestions (Rodrigo, Tvrtko).
> Also, use flag bits in intel_context as it allows finer control for
> toggling per engine if needed (Tvrtko).
> 
> v3: Minor review comments (Tvrtko)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 16 ++++++++++++--
>  .../gpu/drm/i915/gem/i915_gem_context_types.h |  1 +
>  drivers/gpu/drm/i915/gt/intel_context_types.h |  1 +
>  drivers/gpu/drm/i915/gt/intel_rps.c           |  4 ++++
>  .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h | 21 +++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 17 +++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 ++++++
>  drivers/gpu/drm/i915/i915_getparam.c          |  6 ++++++
>  include/uapi/drm/i915_drm.h                   | 15 +++++++++++++
>  10 files changed, 86 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index dcbfe32fd30c..81f65cab1330 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -879,6 +879,7 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>  			       struct i915_gem_proto_context *pc,
>  			       struct drm_i915_gem_context_param *args)
>  {
> +	struct drm_i915_private *i915 = fpriv->i915;
>  	int ret = 0;
>  
>  	switch (args->param) {
> @@ -904,6 +905,13 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>  			pc->user_flags &= ~BIT(UCONTEXT_BANNABLE);
>  		break;
>  
> +	case I915_CONTEXT_PARAM_LOW_LATENCY:
> +		if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
> +			pc->user_flags |= BIT(UCONTEXT_LOW_LATENCY);
> +		else
> +			ret = -EINVAL;
> +		break;
> +
>  	case I915_CONTEXT_PARAM_RECOVERABLE:
>  		if (args->size)
>  			ret = -EINVAL;
> @@ -992,6 +1000,9 @@ static int intel_context_set_gem(struct intel_context *ce,
>  	if (sseu.slice_mask && !WARN_ON(ce->engine->class != RENDER_CLASS))
>  		ret = intel_context_reconfigure_sseu(ce, sseu);
>  
> +	if (test_bit(UCONTEXT_LOW_LATENCY, &ctx->user_flags))
> +		__set_bit(CONTEXT_LOW_LATENCY, &ce->flags);
> +
>  	return ret;
>  }
>  
> @@ -1630,6 +1641,9 @@ i915_gem_create_context(struct drm_i915_private *i915,
>  	if (vm)
>  		ctx->vm = vm;
>  
> +	/* Assign early so intel_context_set_gem can access these flags */
> +	ctx->user_flags = pc->user_flags;
> +
>  	mutex_init(&ctx->engines_mutex);
>  	if (pc->num_user_engines >= 0) {
>  		i915_gem_context_set_user_engines(ctx);
> @@ -1652,8 +1666,6 @@ i915_gem_create_context(struct drm_i915_private *i915,
>  	 * is no remap info, it will be a NOP. */
>  	ctx->remap_slice = ALL_L3_SLICES(i915);
>  
> -	ctx->user_flags = pc->user_flags;
> -
>  	for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
>  		ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 03bc7f9d191b..b6d97da63d1f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -338,6 +338,7 @@ struct i915_gem_context {
>  #define UCONTEXT_BANNABLE		2
>  #define UCONTEXT_RECOVERABLE		3
>  #define UCONTEXT_PERSISTENCE		4
> +#define UCONTEXT_LOW_LATENCY		5
>  
>  	/**
>  	 * @flags: small set of booleans
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 7eccbd70d89f..ed95a7b57cbb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -130,6 +130,7 @@ struct intel_context {
>  #define CONTEXT_PERMA_PIN		11
>  #define CONTEXT_IS_PARKING		12
>  #define CONTEXT_EXITING			13
> +#define CONTEXT_LOW_LATENCY		14
>  
>  	struct {
>  		u64 timeout_us;
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 9c6812257ac2..a929aa6e3c85 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1013,6 +1013,10 @@ void intel_rps_boost(struct i915_request *rq)
>  	if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
>  		return;
>  
> +	/* Waitboost is not needed for contexts marked with a Freq hint */
> +	if (test_bit(CONTEXT_LOW_LATENCY, &rq->context->flags))
> +		return;
> +
>  	/* Serializes with i915_request_retire() */
>  	if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
>  		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> index 811add10c30d..c34674e797c6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> @@ -207,6 +207,27 @@ struct slpc_shared_data {
>  	u8 reserved_mode_definition[4096];
>  } __packed;
>  
> +struct slpc_context_frequency_request {
> +	u32 frequency_request:16;
> +	u32 reserved:12;
> +	u32 is_compute:1;
> +	u32 ignore_busyness:1;
> +	u32 is_minimum:1;
> +	u32 is_predefined:1;
> +} __packed;
> +
> +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
> +
> +struct slpc_optimized_strategies {
> +	u32 compute:1;
> +	u32 async_flip:1;
> +	u32 media:1;
> +	u32 vsync_flip:1;
> +	u32 reserved:28;
> +} __packed;
> +
> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
> +
>  /**
>   * DOC: SLPC H2G MESSAGE FORMAT
>   *
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 3e681ab6fbf9..706fffca698b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -537,6 +537,20 @@ int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val)
>  	return ret;
>  }
>  
> +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val)
> +{
> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> +	intel_wakeref_t wakeref;
> +	int ret = 0;
> +
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> +		ret = slpc_set_param(slpc,
> +				     SLPC_PARAM_STRATEGIES,
> +				     val);
> +
> +	return ret;
> +}
> +
>  int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
>  {
>  	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> @@ -711,6 +725,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  	/* Set cached media freq ratio mode */
>  	intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
>  
> +	/* Enable SLPC Optimized Strategy for compute */
> +	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index 6ac6503c39d4..1cb5fd44f05c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -45,5 +45,6 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt);
>  void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
>  void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
>  int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
> +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index cc076e9302ad..e5c645137cfe 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2645,6 +2645,7 @@ MAKE_CONTEXT_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
>  MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
>  MAKE_CONTEXT_POLICY_ADD(priority, SCHEDULING_PRIORITY)
>  MAKE_CONTEXT_POLICY_ADD(preempt_to_idle, PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY)
> +MAKE_CONTEXT_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
>  
>  #undef MAKE_CONTEXT_POLICY_ADD
>  
> @@ -2664,6 +2665,7 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>  	struct context_policy policy;
>  	u32 execution_quantum;
>  	u32 preemption_timeout;
> +	u32 slpc_ctx_freq_req = 0;
>  	unsigned long flags;
>  	int ret;
>  
> @@ -2675,11 +2677,15 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>  	execution_quantum = engine->props.timeslice_duration_ms * 1000;
>  	preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>  
> +	if (ce && (ce->flags & BIT(CONTEXT_LOW_LATENCY)))
> +		slpc_ctx_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> +
>  	__guc_context_policy_start_klv(&policy, ce->guc_id.id);
>  
>  	__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
>  	__guc_context_policy_add_execution_quantum(&policy, execution_quantum);
>  	__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
> +	__guc_context_policy_add_slpc_ctx_freq_req(&policy, slpc_ctx_freq_req);
>  
>  	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
>  		__guc_context_policy_add_preempt_to_idle(&policy, 1);
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> index 5c3fec63cb4c..95c58805b2a4 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -155,6 +155,12 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>  		 */
>  		value = 1;
>  		break;
> +	case I915_PARAM_HAS_CONTEXT_FREQ_HINT:
> +		if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
> +			value = 1;
> +		else
> +			value = -EINVAL;
> +		break;
>  	case I915_PARAM_HAS_CONTEXT_ISOLATION:
>  		value = intel_engines_has_context_isolation(i915);
>  		break;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 1279a6b2bece..a8b3dd594831 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -806,6 +806,12 @@ typedef struct drm_i915_irq_wait {
>   */
>  #define I915_PARAM_PXP_STATUS		 58
>  
> +/*
> + * Query if kernel allows marking a context to send a Freq hint to SLPC. This
> + * will enable use of the strategies allowed by the SLPC algorithm.
> + */
> +#define I915_PARAM_HAS_CONTEXT_FREQ_HINT	59
> +
>  /* Must be kept compact -- no holes and well documented */
>  
>  /**
> @@ -2148,6 +2154,15 @@ struct drm_i915_gem_context_param {
>   * -EIO: The firmware did not succeed in creating the protected context.
>   */
>  #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
> +
> +/*
> + * I915_CONTEXT_PARAM_IS_COMPUTE:
> + *
> + * Mark this context as a Compute related workload which requires aggressive GT
> + * frequency scaling. Query I915_PARAM_HAS_CONTEXT_COMPUTE to check if the kernel
> + * supports this functionality.
> + */
> +#define I915_CONTEXT_PARAM_LOW_LATENCY		0xe
>  /* Must be kept compact -- no holes and well documented */
>  
>  	/** @value: Context parameter value to be set or queried */
> -- 
> 2.38.1
> 
