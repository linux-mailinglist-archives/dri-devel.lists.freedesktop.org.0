Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B85FF7FFD68
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 22:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B919010E058;
	Thu, 30 Nov 2023 21:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6B510E042;
 Thu, 30 Nov 2023 21:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701379120; x=1732915120;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YXrvKaFpmoy0K8dcjiJJUsdT/+GilJR8PjlW/gJhykg=;
 b=kF+iGjgof2PbNacEAxFTTlleLI3E4WpaCn0aFvZAsZfERBk1HY3VPIHt
 qEVYb4qsMm6o4rnhGEmpaeizKcpR4x6shwJ7M2o0t4oYrEdFAwV9W3DfM
 Mh09fTJL/I127wfhS6FXKia3EEcwyyHYki1bVd0LA7DdEynsYuwy2asNR
 ionzbyUxmf6wu0tUq2gQcSisOQTrC2xDm9QiZ8I1zWtcS8Wnes4ZdN3oG
 hwvkQX9HuTh4piYp8Pc8zVGwhcPm0jUdWiQdI3r3HelgaYz3KD3p5UHKu
 lNzKoJJzw+HtOhvpVaI7LFfD+JRa/8cE/CFs2Mv9wZLhUMqfoSNZcMHmz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="459891281"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="459891281"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 13:18:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="773191492"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="773191492"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 13:18:33 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 13:18:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 13:18:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 13:18:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNQPcAu2tB8gFpRUK/iJgQlerpLdh9xkHnDOcSMVUP5a1EZgnmgKLrZFghwr/AFpGKRtpsGGzFsaCxtbgxvow5TO/CGLXIIXsvvsIV3Y7CoXMV+OwfjocDxva65SUxs2xsQ0HN+++gT9tlLZl+9XWb3x/lrn3fsA5KfGxj5n/Vn8JC7f++6oorodoF1IFkuRmgkc3nYak4Yhn2wctLyVjoDwOFKozX5q+VwQff/Gf7dcxFaoVKH2oFIUgLUObdn5BEUd4+xkBkJPH/whqcimIInkzwRyg9DIIaGjoTy3it6gtmqVUKn/begVPsC5PpvO2uM2bvAX+AgtF1RUMa0hug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvtbk7Q4HkhW5icfJmeO1EIjQjaHMqN+22ytrcCsPrw=;
 b=FaejHE2911oTLpANIC/Hx3T1KK315StF0C9khOH1chQtOwKmVPYxeGX4aPhfzPkwjOn53D4fheq/dMvUcf440aEc0LQQjArcnDjCuBaIOgKHc56MLPLCDogPKLzRNsT3pa+K/zDO/UMQJ+JeTdQpJujsdxvH13OmBHGJu52I409k0Nv7ogMTJZL7erzYCuHbcYljQJuJpqyPPRGWt+WNadVM2jD3N6bFUpC6OFyhf+WEwXo1enn3cELWaPraKPQbfUCfamZmkZNBQbw1YhswCjlewIL0I+tTQlU23XAmVKoUgD6T5tg3RulyHyIYwcNctSE3OFPci0IU7PAHaBK1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7789.namprd11.prod.outlook.com (2603:10b6:208:400::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Thu, 30 Nov
 2023 21:18:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 21:18:30 +0000
Date: Thu, 30 Nov 2023 16:18:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v7 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Message-ID: <ZWj8Ig7tzXLHZbSv@intel.com>
References: <20231130002013.282804-1-alan.previn.teres.alexis@intel.com>
 <20231130002013.282804-3-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231130002013.282804-3-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 445d79ea-5d70-4865-75d0-08dbf1e9e67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +iEF5p22fzVXY47XYoGDtvgtE5kDDKG1cUqqk4C3WzVa0szD+Sy80iiCwLUah9nAk5+k/zCFvzNP3gsOXr1DuKv/zaR8j8YLdieUYyP2Xbj8xD9bn2gbnGbzJN3rmKp1IRGpzAlrQPtx71g2HyC4FQUnmQPZCPREGrxxn5UZD6dyZn4OvHE+sdQkZm+St+uKfH8inXuLvc86WXFzV50P4qZ367OUQHwWayWMIXUNP3rlrjaBdGSfEeQALf+2NYwMNa8ATg7L7cbdu2ZvY6gCYg7fYmpIQilo2I5WgFeN8/MyDf8sR9eX7fDkJo9KEzl55icmnargDanCI0balcO5MII4KwmOrWlZzsshxaJzLQa68F9oEyi4WQ3q01DEKfUX/fDilBwe5vDyvijPC8gfTCzFn8kew5ngpJAmim/oXR6nPDGo/eiwZjDCHnMnKGwmuc3wCfC6snFEpre3OgXfUjQGf8lTh3b0WcfKAVrsxdr0RKSL40zgrGUsTyrrLkUaUrrSBUqcIk4B5/TmI1N7GC2fyRTRER3Lb97W+HlpL8ua2AcJix5g5W74RxPXk66k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(41300700001)(38100700002)(36756003)(86362001)(26005)(83380400001)(5660300002)(82960400001)(44832011)(107886003)(2906002)(2616005)(6512007)(6506007)(6666004)(8676002)(4326008)(6862004)(450100002)(8936002)(478600001)(6486002)(66946007)(316002)(66556008)(66476007)(6636002)(37006003)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yVCoc/YcFHDJyEgyj414X4l7c6VCGpHPSpY+RUJxecyUg63nfWHLYHVNyiAR?=
 =?us-ascii?Q?4YSG2HWk+s+US/eeMhEqEa+vuV7Q4U2ykg4RyigD9KrNhfbqA8+it7IL5mVR?=
 =?us-ascii?Q?TNjP/ByuwkiRn2YrguEHto8kubURhoa+Fj6ZunDxLNAt6puVWssVLDAHNgBo?=
 =?us-ascii?Q?F4wrP2kvltHivrDJd1IjG3yW2ns21pVZ6zrQFnFd1J4bC2Tx4/exMt1UQqPE?=
 =?us-ascii?Q?ANCSL7EG2b1xZdejaaP00cWpQsFmGhutvGlMLitZD6DUhoXdOr6w/4YDRCoD?=
 =?us-ascii?Q?gc9mn27uVMElQnU6s7wAT8K0eMXhMIIagZAo4SHIhojZdvrJkbh/bArbo8NR?=
 =?us-ascii?Q?nCBwj0MORpkaKIOGKID8JpjqNGhdud8RGM2gcgKNHlKO++8i1a45a7sCDKwe?=
 =?us-ascii?Q?SM7bBoF5eaM2b3r/uADEficg5X7iK+QhfY+/6P/R/nCPhflRBsjrEhAQNF2O?=
 =?us-ascii?Q?fDXv5f9gy7PWJZB2RmBc+JSeNTCnj+VZVYybRYtfsxp5owCe2ioWgnaBgnPW?=
 =?us-ascii?Q?4XXaiz9ipnV68/jHy2Y5Nlhit11/1fjpKBXQqvbd8iZcyi3rlXLR9eCWAc0I?=
 =?us-ascii?Q?ZTm7uhvconpUyKO3wb5Wq+h/L2NNC351ibh759mWUg8Tk1GYv52nAW4fpKna?=
 =?us-ascii?Q?FdNTFrRO7raeQ29CESEst/7FIxierN1Je30zlbGjQ4QPrdVaOY2IjfY9bl+c?=
 =?us-ascii?Q?QBecDmS0EV6bInTrx3zRxnVNrhwtdggBL5zpQTw6/w41BC2PALInp8jFwc7T?=
 =?us-ascii?Q?IJIvJyPmMCE+tk6pNEjoOiScOhVQus4e1q8ts8HPP0rLhZoDGOm3RxOIm9c3?=
 =?us-ascii?Q?a9ugQMT51e42kdqYbZGZl3y+660MqIypDR+xsveQyZRJnMv09tu61/XEOIUn?=
 =?us-ascii?Q?jol7Rs6AVD+wNEZMGbNqm8qI7B8EtVtV1J/v+Gl/Knzbo4x8sNNMi0IThxJe?=
 =?us-ascii?Q?pn9LS7Cne3y9I8WVp50eUXX9jtUE+XhAmP3W1H/u7uxSav5ITbTrSNuhUo1m?=
 =?us-ascii?Q?1UIooWbmgddFHsvaI5PKkE0FK7rGY7rK7eA+unZYtq9zMMoCZUFK5tSq5zYb?=
 =?us-ascii?Q?QzBUYAcVi5Xbj/6NE7MmTIi7J5dhxu8aU0KUqD8vgrV9E9KubK3z81o5mU6k?=
 =?us-ascii?Q?J+x7wurVK+tsjHdOPYhwghHrEdVAnAgY3KnWD3gInZWgtkibhyx3Cf7RZdBV?=
 =?us-ascii?Q?nqM2F6t1u807k3KlY/l2izsFxDYzHv3K5b8gXW4tiWsX1Hh+kdG1XTv9Ce0d?=
 =?us-ascii?Q?ByAC06Z3cUz+LrLlnpSWL2CLIoQLI7DyLqG0DYjoOxkHBb3PK0iOe5ZwW334?=
 =?us-ascii?Q?ov7x4AHzs/31zyHT27YnxOM6qRuACCb7xgJ7Cwlk528MA//i24FImw/kvgd5?=
 =?us-ascii?Q?ga/C6LJ0zAlUeNCnednfU74gspjAoKUElRW4dEMB+73YT/433i0z/i0RKd9y?=
 =?us-ascii?Q?ImukVOx9mKqumq94jz8za//LGIvDXdSo5RCvuJ025990rByHyUD/bjKv8V9s?=
 =?us-ascii?Q?nRjrIrRGVNroPZhHBd+U5/uiwPFye/87t/+I2lsnuHiDWJ95VUeb/tA05W+9?=
 =?us-ascii?Q?vnEuI8sx8le8L2uY9IjxjKzgTq3JXg0/EDsdVkczKFbaW+q0N2ySb7NRCMjm?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 445d79ea-5d70-4865-75d0-08dbf1e9e67f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 21:18:30.2728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1iNy6KR/fmv8t9yx/Qf0MIAPz0L9qZMW3v0NjaW2TPrzB2maIN/T2Et5gqWpqzbT4ThrXfuidTy16Oz3Y6U0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7789
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

On Wed, Nov 29, 2023 at 04:20:13PM -0800, Alan Previn wrote:
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
> index 6e3fb2fcce4f..a7228bebec39 100644
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

is success the right return case here?

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
