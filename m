Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D597FACCD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E1410E318;
	Mon, 27 Nov 2023 21:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46F210E318;
 Mon, 27 Nov 2023 21:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701121898; x=1732657898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b8QAHIlRSNmPSf799xH0JjHEM4nhHnqUMDWS1J9gAF8=;
 b=CyYjZuRnKuZJA2JsFtunrOCs/LpfHG4V9g9qoZEByTDDsjWkqefhOUys
 dIgcWOKwFdSpBNAsOwTCBWsKF8/3+zigoqBDmON5BaR7ujMnfLyWQjBB4
 5bRHHgYujRvD1c5xf+mf5cT2l6oZNfWCIGEClH14hqgljOIWCqWPf3qVV
 Pb70ZXJsdXSnKrlh/k/JKut6gXXzAYfgq6fs0nBHordIyw34fi723/d4T
 DnWG3FzSYeNc1rfRYfD5+P9yzNvtVAlV7GOfaVAqZrqo1lXWX5A9SMwAG
 TLAhCk0p9P4uzxoLFrDa6qo1vbXlchz5EXej3OD/93G7L6C68s8veXnCj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383180362"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; d="scan'208";a="383180362"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 13:51:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="834451039"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; d="scan'208";a="834451039"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 13:51:37 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 13:51:37 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 13:51:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 13:51:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 13:51:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9TfYd/G4v9dDCTOEfRNIp/R2LMRZt35Jcuz2sMRgUxZfpVhCpD0DkxyTvSZK6ZHtpLv9cn6CWAYw9HuFao8r8wMdqlhxQm+UxCsAt2k2wn6MsSt9MEpD4zOWTOgrsAkQG1zUt+tgTITMj3851e/e5EkRSuV8rhIjOOer6J2S44yvPL2/zj6wQUbKwrQuFW8K/jOpdZm47xbsIBBZkh4quFhAF8iYOtu+nbkpVNZkLwtg8XNs7NZAaxHMXPNLTZr+ubVwW37Mpd59YhodjchF2f1eTywhVvcb8rAxxDyK/9LkQboOhJkGySvJc17ln64EDp1pnCcFouwbmqwu9uh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8KIPsRtaV8OulFGBcehagXhyjluifWveDCdG516v8Q=;
 b=UJE0c7Ve9SQ4adM1ijACpUQclRFmA/GE/Avp6zH1joT3tm8TugKyQ9HcT7MYctLXYBAazfXtUFzceI+z1tzCYA4RH268OsShiyox1lYl5aLPvk0vG8oCvYAZ0sD1xEU/tHV1ujTKIQEjvx0EQ4ZWfMKibqkVytPpHRu8vn1azTJSYxjpRp1ZNOrLJs09M7WRNXmr28oyWAaVqcfpkmEJI/tfvMvOiXkv/JwXUJedNQGi6BSk64y6gIq8vdrkbwEtJwB1U+Zq65I4KQivy5XDSQZUF7NqcP4SK0XkcF5NUDPXoYIgrwp76scAHTc814xeT/iv+YGx8Q32yIx01IJouA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5410.namprd11.prod.outlook.com (2603:10b6:610:d1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 21:51:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 21:51:34 +0000
Date: Mon, 27 Nov 2023 16:51:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v6 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Message-ID: <ZWUPYG/qG+T0Qo0D@intel.com>
References: <20231114155229.756100-1-alan.previn.teres.alexis@intel.com>
 <20231114155229.756100-3-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231114155229.756100-3-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5410:EE_
X-MS-Office365-Filtering-Correlation-Id: 97855ef5-ab60-4f9d-8986-08dbef9305ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GAVKDuVyLJl28bo83T89vYB4F0YBn4MMuE82+XsvWfEESpCCXNa6b6DuiXSWKtihxoHlmy8pQHMOwgMZNgxYWBJz0jaaZGKqo/Fhgjp7RMTJqYImwxuNKLEnkNN744JY638jNDYvraFW8VUpO00fQJnqOd1CSB+RZu7KEko6h5v/cyAXjjNAwGmbCIQDihsrJ4reQLKbvCI6IO7odILtoH0RWoSCfIcqMUxzZMqeJGuAY7xIzezPHisOqzuueRi+bnIT1geo/F/ZCmnI+5AQVGISgtNmApJYdQWFMfG2eBATpg2bJYTjucgSuLmnSsvRieAeuWk0/6cO4HNYfTkL9l0uFWoHSolUJ/20Ucfby8nceq6Pib7QMLnZk+h/Mam9fVX+TDpuBGuFejy7pKOUfS1AUnAWqvkYOcgGPNNYpGOCCymaQMreRFErohHeOKdbCrpZcbas4+nVXZhMDCeA6XdP+WQnx26xDZNPWXy4/g5pyWAUV43SJQ7352HzLR5x8zv5y68d9wQ/RF68lBM9HsrI7t5eFs+hNqH2UhwNhIzsEodiKUDWb8tpzKaeRFhT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(36756003)(38100700002)(41300700001)(107886003)(2906002)(83380400001)(82960400001)(5660300002)(26005)(86362001)(2616005)(44832011)(6506007)(8676002)(8936002)(6862004)(4326008)(6666004)(6512007)(450100002)(6486002)(478600001)(66476007)(37006003)(66946007)(54906003)(66556008)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LM2C5UD0SLnN5gKelnowDt7WzNkwqsZMFv43mau7yGoxdjVax+M624ZWzxam?=
 =?us-ascii?Q?8BZrxYr3roUtvV5cHJdujKXxcX2C+TTw1LI5ioJRx4RXKxK1xJWOecxnj3U8?=
 =?us-ascii?Q?TcOBNOzKrhpbIyWeDEg0PaYoujaGm9ilKdwdg65jUB9Ct2l9prAphJmwBqGZ?=
 =?us-ascii?Q?CuEjJ4l0JwnXRCLCztpdwvWWVXsYH0ee8gW8HIzlBBzV3n4ejGEawo2x1q4c?=
 =?us-ascii?Q?QHMOJ1BBi9ceYlLNP6GC5gHxXiSqzWzj+6Q/tvGmVNgi7enHitH7LEsQKuaO?=
 =?us-ascii?Q?icncKNOZIVwwHtnN/GEVF6t+MYJXlVX+AOSPP51iuqh0w33uXPUGET+oTVKz?=
 =?us-ascii?Q?NSX+dd7y6fWnsRbPODLT6f7ejydNqxKiE3knYQqhYGMV1vtEr8NsmruQyI7E?=
 =?us-ascii?Q?C25fLsyPZYaikCHAP4r8GKhUn3MvKG6cRudqKe6yGuDRzozvCcezn2VHb11Z?=
 =?us-ascii?Q?a2h63xlgUQNM9kIc98inbV4F/S47pISg1iiF2zUYH5wSDIe9zQzUiDTKTmVX?=
 =?us-ascii?Q?Sere7kSLa+JmW2yeOe6W/lDzpJbY42NfwUCnFcLhFgX8ij2Knl3CPgH6Ooc7?=
 =?us-ascii?Q?sxP2KAOA3X+OJ2Bt46Wc8j0ScVtFF56VokCOEJij/bwz6kT1HR9gYFhI8f8Y?=
 =?us-ascii?Q?x/82UUNqGtkdaZA4xnssk/uKWXNv5/5D6tK+q3ZKgNXzXscPoZzTLZALqUsg?=
 =?us-ascii?Q?1nLnPBfukTjd5o+nGNeIrG5TqJ+hXfyG/iURiJ7w4SKcqpsvYBv4nBqoecsI?=
 =?us-ascii?Q?qPaskL5Gwq0TUs9ib6X/HI4sOoZgmYVE/zBeWjpaeUJHTpjDhn5CzUsPxV9g?=
 =?us-ascii?Q?LXEFsFuU1wjJjnCMczQnFkHe6dS5kVdePZkxv/x5MyP8cBVzWHqLi5MCpyfa?=
 =?us-ascii?Q?YSLQY7fYccOU6S5FXrVzdx07hAqiTDH95sK39AfghjU4EHvhfVV0KrtjCQd+?=
 =?us-ascii?Q?+ttM5ftxzi28aT2KkotImudMXSsHxu/Lw1yRI8FoF52WcPlT3jWiZAdvWknA?=
 =?us-ascii?Q?Kx2JTHuZ4zTf6PpJIlyD8Q/V/rSxqPfWw0l1GMwDbDY34/EpfMI4xz+WNzhV?=
 =?us-ascii?Q?3zRdDjR7I3fqnQ1RUVG1IwA4b0fkfEN4WicR+SgrQ9hvqioReO7PioQcAywa?=
 =?us-ascii?Q?Ls0Xwklgt9/7uf3ZTrcBOBDrTkhghVvMOzUvyj279QOUBK2r6Ppoh52hicqn?=
 =?us-ascii?Q?u33tvwfUfA4E0fXbM+4u61fVS3x4HHWLQsVU6e3FRvgw/19ef7fdVsoTbJ8r?=
 =?us-ascii?Q?Mx7cfmDP8C0GO2aKr1hy/NlpdQ6JjpEJp0nxOcpy38NRMFEh9wN6AUyhiPWo?=
 =?us-ascii?Q?RQzlC2KNqo4fdhHcl6PnzQmpl372wylg+RNMQs8a8OXLmGi1mW4ewxqeAKIa?=
 =?us-ascii?Q?g3s3YmohITmmmFARsiQ9QKt0UXpd3BXqhnAHphN4bpeD19O9JZ3F584Fosdl?=
 =?us-ascii?Q?PwO7L5yhA6LtrtuzjHdgSLJPY5OTUb9IoD01C8Ft/QryxV0SSuqbyHJRPtav?=
 =?us-ascii?Q?dKxFQZCVsi1cXCcwfpEvE66TynE9JWKuwznrhLxF5f8JpUrrfP/GWkbVvkl4?=
 =?us-ascii?Q?vWAmAdlp/FHVrilsOz5unNX2XIkCAFeYgRF/iny1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97855ef5-ab60-4f9d-8986-08dbef9305ff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 21:51:34.6668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jMAEfdbeghrn7BMjGCLUvRpg2mpKLTUOgw/HbtpNxJAjSifI7pwj7FnS7iX0iwwAg9SaimTjHsfv6dXIcqsiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5410
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

On Tue, Nov 14, 2023 at 07:52:29AM -0800, Alan Previn wrote:
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
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 81 ++++++++++++++++---
>  2 files changed, 80 insertions(+), 11 deletions(-)
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
> index 9d1915482898..225747115f78 100644
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
> @@ -3286,12 +3299,13 @@ static void guc_context_close(struct intel_context *ce)
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
> @@ -3301,19 +3315,38 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>  	/* Seal race with Reset */
>  	spin_lock_irqsave(&ce->guc_state.lock, flags);
>  	disabled = submission_disabled(guc);
> -	if (likely(!disabled)) {
> -		__intel_gt_pm_get(gt);
> -		set_context_destroyed(ce);
> -		clr_context_registered(ce);
> -	}
> -	spin_unlock_irqrestore(&ce->guc_state.lock, flags);

you are now holding this spin lock for too long...

>  	if (unlikely(disabled)) {
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>  		release_guc_id(guc, ce);
>  		__guc_context_destroy(ce);
> -		return;
> +		return 0;
>  	}
>  
> -	deregister_context(ce, ce->guc_id.id);
> +	/* GuC is active, lets destroy this context,

for multi-line comments you need to start with '/*' only
and start the real comment below, like:

/*
 * GuC is active, ...

> +	 * but at this point we can still be racing with
> +	 * suspend, so we undo everything if the H2G fails
> +	 */
> +
> +	/* Change context state to destroyed and get gt-pm */
> +	__intel_gt_pm_get(gt);
> +	set_context_destroyed(ce);
> +	clr_context_registered(ce);
> +
> +	ret = deregister_context(ce, ce->guc_id.id);
> +	if (ret) {
> +		/* Undo the state change and put gt-pm if that failed */
> +		set_context_registered(ce);
> +		clr_context_destroyed(ce);
> +		/*
> +		 * Dont use might_sleep / ASYNC verion of put because
> +		 * CT loss in deregister_context could mean an ongoing
> +		 * reset or suspend flow. Immediately put before the unlock
> +		 */
> +		__intel_wakeref_put(&gt->wakeref, 0);

interesting enough you use the '__' version to bypass the might_sleep(),
but also sending 0 as argument what might lead you in the mutex_lock inside
the spin lock area, what is not allowed.

> +	}
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +	return ret;
>  }
>  
>  static void __guc_context_destroy(struct intel_context *ce)
> @@ -3381,7 +3414,22 @@ static void deregister_destroyed_contexts(struct intel_guc *guc)
>  		if (!ce)
>  			break;
>  
> -		guc_lrc_desc_unpin(ce);
> +		if (guc_lrc_desc_unpin(ce)) {
> +			/*
> +			 * This means GuC's CT link severed mid-way which could happen

here you got the comment style right.

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

For this GuC interaction part I'd like to get an ack from John Harrison please.

> +			break;
> +		}
> +
>  	}
>  }
>  
> @@ -3392,6 +3440,17 @@ static void destroyed_worker_func(struct work_struct *w)
>  	struct intel_gt *gt = guc_to_gt(guc);
>  	int tmp;
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

is this racy?

> +
>  	with_intel_gt_pm(gt, tmp)
>  		deregister_destroyed_contexts(guc);
>  }
> -- 
> 2.39.0
> 
