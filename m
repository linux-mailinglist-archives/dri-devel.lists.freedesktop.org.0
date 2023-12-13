Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 442A08120A9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 22:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA0F10E87C;
	Wed, 13 Dec 2023 21:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7130210E87A;
 Wed, 13 Dec 2023 21:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702502629; x=1734038629;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z1y9OsVDgbwvqYdsYY4OnqC5wZijGs/7ms1V6+EWTvs=;
 b=BFAQiJw8sqXlwv1wTxfjxWtvx+5YVs8dO4V5NE78HaLBx20lNrq2lghA
 7zeT2lPIL+zxru19S2Q97VQL3K0UUw4qeTWS/vA/iyhjqIAPN7ag00ztV
 /ldEs1yFv97FRYxdOToAzDryJ9zw+53G3FypspSif4J5kpI3TIhz3CwbO
 exIQqIXwxYNnVqw4a6OukwW5LNU8QgvsAGhPTzp0ph653J2OSoSh0nCsg
 2ClU61MBLOA772v760S5CvqOtMvb5Y46Lx218+vKfoZ0VW1PUXYr63afh
 cfhBxD97B2uklQG8/kBEgAlBqqriYOnsMaQ5v/ILwvRKmPn+WfOsRpjtM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8424001"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="8424001"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 13:23:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="723808601"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="723808601"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 13:23:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 13:23:19 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 13:23:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 13:23:18 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 13:23:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9iFsAVBmvi2/r3qPMZM3HJb/tLv2UZEDobM0uFmdJ/20W+XCneNDz9Usq8B6XFIh7wx9cFfx8JO9ccxJz5Yno7UDRUlPq9XVpRPhbW8fm0cVMwxfKXnUjLhXiDBGCI86P7KaQPcpkcRS6GBN/RzR9s+ww230w1Qhn1xoonv4lK8hrEE+V7XsdlEApZJWZDo2JsYB/4H/av5Q08xXBq9jbL4+sZIcRO/PV7yV663u9Glla2kcutnAZi0OsYAA0feAzyIem77/xZVDKR3TtQCsh7Sw+u+79IG6AY0jChREUS8+TKDLlwouj5rCkSvLDefKuq9puwwVqIu1iOqYosELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mzbGG76t3S93oLM71GveLfolFc9wD1OnRgYOTBpwMA=;
 b=Z1ZHavSCbNLu53RyQsL6RqkdIMF31d8aRvskWfqMBjrbBqBfW8/iFVwz8JcHoWsUtUOb2R2czKSkZLAC788eTqcpQGOmnlWFQOB6EWhhoG7A3cGAUnXYpVsl0yJX3NuhGUFxV5VNO7SxfcnK0fFbnyLAwHukTRqEhkRDVKCsHV2Df1WzFG6Q0t9PZD6Xs62Bnhw0lGA+wUIp0XBTgEmUzcCOtm4vZOMdUxthyCd6fBEWY/aAcWCYoYYoddJxsBxXBmW82C2fixZglNk97KHDSrfcZypV3ZgIuVIjaIgKCGXIvKf5ZBh/1p9tYN9y5rfZwBakP83wSZcxt8/vOigAug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH0PR11MB5441.namprd11.prod.outlook.com (2603:10b6:610:d0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Wed, 13 Dec
 2023 21:23:15 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::5064:87cb:f7c8:65c1]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::5064:87cb:f7c8:65c1%4]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 21:23:14 +0000
Date: Wed, 13 Dec 2023 16:23:11 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v8 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Message-ID: <ZXogv_iKOSLXnb8b@intel.com>
References: <20231212165716.57493-1-alan.previn.teres.alexis@intel.com>
 <20231212165716.57493-3-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212165716.57493-3-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|CH0PR11MB5441:EE_
X-MS-Office365-Filtering-Correlation-Id: 1392c590-17af-4974-f9c7-08dbfc21b758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: waM1WCDm1NlE5l8jz9UPm6bhSuXH5j8hDZ6PslB6G1YcEd7+e+8J+Gjo2E+QW9ParPCeLGVfKtkPkiF3aaIy6Qn7Nunxx0mIKG2jnjMYVZIL2oTExzbCN5YQSOEXNnQvLjNFsKomBOYXrzJO1+mkSWP1wl65ZP7/sjSDQD+KsO436EOZcYnPYnpqOqK2QXTlqBCXZoavfrjfAWndY1lCHYrBJwssp0x4soElj2EoQe0BArdychwpMED6HLeoPehLSK0qJlihWeERDEqrgcfvCxHpq/pmIrVFK7KaJzUN5H0ThiHwLromgLnjgucLoqA1buz+2V53PV+m6ZDCtNujvdEpiZo5HPuMsWKv27gGXbATxNgoWZMG4XPTIq/Lf79fP/kt+IhnOse/MmVUQn+LEEdN4iUCJOH5SEQFzKwgNeDzOjefWBFISfBJcZdbHWh4rxYW2wJ5GiyGFt13W+pMcl5CUJvGoaBzLepkMqfpnQwkK7ndyl3P8QEz8KmscxFgazIpHP7r7dfpJU7Tbfis0pR+Ois6LFuUwmpHPGuVs9yj6jnZp2wMcOzpMft+CIbf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(5660300002)(66476007)(66556008)(66946007)(54906003)(83380400001)(6636002)(37006003)(316002)(44832011)(450100002)(6862004)(4326008)(8676002)(8936002)(478600001)(82960400001)(2906002)(2616005)(6486002)(36756003)(38100700002)(107886003)(6506007)(41300700001)(86362001)(6512007)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hn79oHxjOhvd+57R2Nut9BIdJXzhVNrn+WQv5gE3TT2xk0UBR+DdQLiLq8W9?=
 =?us-ascii?Q?t851WXqYDmeNjsg0zMaYfnJCBRiQNVMzBRnlVWqeBBy08nwOCC17DkVYQLph?=
 =?us-ascii?Q?/t6Zw2JY1WlzWfRZ/bYRlh0BLupr2DHzQ8Aar9FXlV0NiBcMdwmeGXBlECcv?=
 =?us-ascii?Q?t6i9BB8k9/UOCMTjWqlC71rj6IhGUKmhC++LY27FM4mgCVX9UiLPW0iVP8LF?=
 =?us-ascii?Q?PZSPUqDZ/mwPZIYE+o3DmOPpVrTWT6w5/1ll23xqqV/62wRUDBjwYQVbOCkM?=
 =?us-ascii?Q?11pWoTXd5r5WT4AP1e4qnLYUieOM67l7dRFNK+vxWC537i6jeF3X+8QKTqB3?=
 =?us-ascii?Q?VL3YdHd1Tck+1yoZJv9vGkgp81owncd2buqZS76nHuuXKuBlwUv0kS6gTMPP?=
 =?us-ascii?Q?j3fxwwQCjfldlc6f0sNRmE5n8jAIp7EAdZPz1pidc/JkMAXMY0jr0Heci6lS?=
 =?us-ascii?Q?vKLFtR+mgd/t8JH0cnpqZJ3ZZKoHy4C12pN//tiQUzKuzhxr8DuuJuZ4Gbc6?=
 =?us-ascii?Q?UP3Gz38RmS5FZF1pPq7pTm9UxSGCUEw8zBqgIMFF+ldbhD9SBJ0BFypr40pJ?=
 =?us-ascii?Q?1RxnVZGKXYLDbsW9wPlHQJOKyETnCl0uybmpKqr7khnKfdOoZf7r14gGsPxE?=
 =?us-ascii?Q?T7l+sGFiB5+rbxcjXLIoN7C8mek8svFH8NJ++Qdfo3R8eMGIKzf8sED9HSs1?=
 =?us-ascii?Q?4HD1v6dxGfsvBhDvCo5WBYlj6r8sp+NYxDQBZDNSYks76RXOp7Wyh9DDcBBT?=
 =?us-ascii?Q?1E0xPJzG4gv19p/F5isLKR7F6TPAdGh+3AHDz/hsREwej2GzNRgLyOIWMyRC?=
 =?us-ascii?Q?GuKyAEK/adAQsdjtuXWGeiMy0QC8jScLognzrHIcILKM2aT02xMQS7x/fXNT?=
 =?us-ascii?Q?lrltt4t1m9mjpZVolpqid8IzFx+0dAAMmcl3ipHVPBpYa2vmNB+akaVI3/mX?=
 =?us-ascii?Q?lgp0+VeY5y4jtTKPmdgLZQp2MZOwua2rsvoezi8j1aQGxME5RhaVFIklIXkL?=
 =?us-ascii?Q?tLbwuegRdrkbSGdpO8ZYMmr1OgOHPUvk7DaAggRbidZfuBCpc6iSd5Gnfw1l?=
 =?us-ascii?Q?YFSebSqdKKRo5j/2/VDQRHszcdI/jUXc1/YYRU6F5fob8S2N3188RmmYJ3L5?=
 =?us-ascii?Q?M77RrdDGULL7ztXr8RfO+QwHpObSye4MZrXFO8XPscGIavYAStP7f6MQRLtK?=
 =?us-ascii?Q?N3+DjtSsh9Xgf9KuwY6ks8S4CnzuMxTOVoQ64g3vI478GTnO4/oRjF6AS0Mw?=
 =?us-ascii?Q?XerhxOBx295LrqrjU32R+yp6MLqj7TpSnASioXZ6RGxZGHwxreVOCSnNl2qq?=
 =?us-ascii?Q?NR5eBwVE/uLSjM4Whm1uQ1dv0xBkLULjeDuceg7M7O/fJVtAhkKp69nfz56K?=
 =?us-ascii?Q?8Bob2Oc1h6CVcPl6dpVLWlWKu8P3gQU2NkkhnQrlWW1hExGccti9fdCc2H2j?=
 =?us-ascii?Q?MsGBu46hAboGcgu+O91r2ezHsz9gjCN55wLiFmESfFBELMjym2Tlfvx9ut4H?=
 =?us-ascii?Q?k9+/imVts+gHOE9yizom0Lr62IkSvWB6y604Vnko8LcarKkA7ISPZ6ECAh1p?=
 =?us-ascii?Q?ywRCHMH7/2Vgllpp8dZRK0W9f0pVJ9y82UAnHHEGkseWU/jHenw1U2mKce6o?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1392c590-17af-4974-f9c7-08dbfc21b758
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 21:23:14.7357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bsBz3tOgLx4lOwCykzz/3qla0OSm5N8zhUb/cYRZEsqkzbJ6u3kUcIgMZPXitxcvR1uG8XyZZu85ZAXoVILYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5441
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Mousumi Jana <mousumi.jana@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 08:57:16AM -0800, Alan Previn wrote:
> If we are at the end of suspend or very early in resume
> its possible an async fence signal (via rcu_call) is triggered
> to free_engines which could lead us to the execution of
> the context destruction worker (after a prior worker flush).
> 
> Thus, when suspending, insert rcu_barriers at the start
> of i915_gem_suspend (part of driver's suspend prepare) and
> again in i915_gem_suspend_late so that all such cases have
> completed and context destruction list isn't missing anything.
> 
> In destroyed_worker_func, close the race against CT-loss
> by checking that CT is enabled before calling into
> deregister_destroyed_contexts.
> 
> Based on testing, guc_lrc_desc_unpin may still race and fail
> as we traverse the GuC's context-destroy list because the
> CT could be disabled right before calling GuC's CT send function.
> 
> We've witnessed this race condition once every ~6000-8000
> suspend-resume cycles while ensuring workloads that render
> something onscreen is continuously started just before
> we suspend (and the workload is small enough to complete
> and trigger the queued engine/context free-up either very
> late in suspend or very early in resume).
> 
> In such a case, we need to unroll the entire process because
> guc-lrc-unpin takes a gt wakeref which only gets released in
> the G2H IRQ reply that never comes through in this corner
> case. Without the unroll, the taken wakeref is leaked and will
> cascade into a kernel hang later at the tail end of suspend in
> this function:
> 
>    intel_wakeref_wait_for_idle(&gt->wakeref)
>    (called by) - intel_gt_pm_wait_for_idle
>    (called by) - wait_for_suspend
> 
> Thus, do an unroll in guc_lrc_desc_unpin and deregister_destroyed_-
> contexts if guc_lrc_desc_unpin fails due to CT send falure.
> When unrolling, keep the context in the GuC's destroy-list so
> it can get picked up on the next destroy worker invocation
> (if suspend aborted) or get fully purged as part of a GuC
> sanitization (end of suspend) or a reset flow.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Tested-by: Mousumi Jana <mousumi.jana@intel.com>
> Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Thanks for all the explanations, patience and great work!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_pm.c        | 10 +++
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 73 +++++++++++++++++--
>  2 files changed, 78 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> index 0d812f4d787d..3b27218aabe2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> @@ -28,6 +28,13 @@ void i915_gem_suspend(struct drm_i915_private *i915)
>  	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
>  
>  	intel_wakeref_auto(&i915->runtime_pm.userfault_wakeref, 0);
> +	/*
> +	 * On rare occasions, we've observed the fence completion triggers
> +	 * free_engines asynchronously via rcu_call. Ensure those are done.
> +	 * This path is only called on suspend, so it's an acceptable cost.
> +	 */
> +	rcu_barrier();
> +
>  	flush_workqueue(i915->wq);
>  
>  	/*
> @@ -160,6 +167,9 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
>  	 * machine in an unusable condition.
>  	 */
>  
> +	/* Like i915_gem_suspend, flush tasks staged from fence triggers */
> +	rcu_barrier();
> +
>  	for_each_gt(gt, i915, i)
>  		intel_gt_suspend_late(gt);
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9c64ae0766cc..cae637fc3ead 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -236,6 +236,13 @@ set_context_destroyed(struct intel_context *ce)
>  	ce->guc_state.sched_state |= SCHED_STATE_DESTROYED;
>  }
>  
> +static inline void
> +clr_context_destroyed(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state &= ~SCHED_STATE_DESTROYED;
> +}
> +
>  static inline bool context_pending_disable(struct intel_context *ce)
>  {
>  	return ce->guc_state.sched_state & SCHED_STATE_PENDING_DISABLE;
> @@ -613,6 +620,8 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
>  					 u32 g2h_len_dw,
>  					 bool loop)
>  {
> +	int ret;
> +
>  	/*
>  	 * We always loop when a send requires a reply (i.e. g2h_len_dw > 0),
>  	 * so we don't handle the case where we don't get a reply because we
> @@ -623,7 +632,11 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
>  	if (g2h_len_dw)
>  		atomic_inc(&guc->outstanding_submission_g2h);
>  
> -	return intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> +	ret = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> +	if (ret)
> +		atomic_dec(&guc->outstanding_submission_g2h);
> +
> +	return ret;
>  }
>  
>  int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
> @@ -3288,12 +3301,13 @@ static void guc_context_close(struct intel_context *ce)
>  	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>  }
>  
> -static inline void guc_lrc_desc_unpin(struct intel_context *ce)
> +static inline int guc_lrc_desc_unpin(struct intel_context *ce)
>  {
>  	struct intel_guc *guc = ce_to_guc(ce);
>  	struct intel_gt *gt = guc_to_gt(guc);
>  	unsigned long flags;
>  	bool disabled;
> +	int ret;
>  
>  	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
>  	GEM_BUG_ON(!ctx_id_mapped(guc, ce->guc_id.id));
> @@ -3304,18 +3318,41 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>  	spin_lock_irqsave(&ce->guc_state.lock, flags);
>  	disabled = submission_disabled(guc);
>  	if (likely(!disabled)) {
> +		/*
> +		 * Take a gt-pm ref and change context state to be destroyed.
> +		 * NOTE: a G2H IRQ that comes after will put this gt-pm ref back
> +		 */
>  		__intel_gt_pm_get(gt);
>  		set_context_destroyed(ce);
>  		clr_context_registered(ce);
>  	}
>  	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
>  	if (unlikely(disabled)) {
>  		release_guc_id(guc, ce);
>  		__guc_context_destroy(ce);
> -		return;
> +		return 0;
>  	}
>  
> -	deregister_context(ce, ce->guc_id.id);
> +	/*
> +	 * GuC is active, lets destroy this context, but at this point we can still be racing
> +	 * with suspend, so we undo everything if the H2G fails in deregister_context so
> +	 * that GuC reset will find this context during clean up.
> +	 */
> +	ret = deregister_context(ce, ce->guc_id.id);
> +	if (ret) {
> +		spin_lock(&ce->guc_state.lock);
> +		set_context_registered(ce);
> +		clr_context_destroyed(ce);
> +		spin_unlock(&ce->guc_state.lock);
> +		/*
> +		 * As gt-pm is awake at function entry, intel_wakeref_put_async merely decrements
> +		 * the wakeref immediately but per function spec usage call this after unlock.
> +		 */
> +		intel_wakeref_put_async(&gt->wakeref);
> +	}
> +
> +	return ret;
>  }
>  
>  static void __guc_context_destroy(struct intel_context *ce)
> @@ -3383,7 +3420,22 @@ static void deregister_destroyed_contexts(struct intel_guc *guc)
>  		if (!ce)
>  			break;
>  
> -		guc_lrc_desc_unpin(ce);
> +		if (guc_lrc_desc_unpin(ce)) {
> +			/*
> +			 * This means GuC's CT link severed mid-way which could happen
> +			 * in suspend-resume corner cases. In this case, put the
> +			 * context back into the destroyed_contexts list which will
> +			 * get picked up on the next context deregistration event or
> +			 * purged in a GuC sanitization event (reset/unload/wedged/...).
> +			 */
> +			spin_lock_irqsave(&guc->submission_state.lock, flags);
> +			list_add_tail(&ce->destroyed_link,
> +				      &guc->submission_state.destroyed_contexts);
> +			spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +			/* Bail now since the list might never be emptied if h2gs fail */
> +			break;
> +		}
> +
>  	}
>  }
>  
> @@ -3394,6 +3446,17 @@ static void destroyed_worker_func(struct work_struct *w)
>  	struct intel_gt *gt = guc_to_gt(guc);
>  	intel_wakeref_t wakeref;
>  
> +	/*
> +	 * In rare cases we can get here via async context-free fence-signals that
> +	 * come very late in suspend flow or very early in resume flows. In these
> +	 * cases, GuC won't be ready but just skipping it here is fine as these
> +	 * pending-destroy-contexts get destroyed totally at GuC reset time at the
> +	 * end of suspend.. OR.. this worker can be picked up later on the next
> +	 * context destruction trigger after resume-completes
> +	 */
> +	if (!intel_guc_is_ready(guc))
> +		return;
> +
>  	with_intel_gt_pm(gt, wakeref)
>  		deregister_destroyed_contexts(guc);
>  }
> -- 
> 2.39.0
> 
