Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF23772D49
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1854910E02C;
	Mon,  7 Aug 2023 17:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454F4895EE;
 Mon,  7 Aug 2023 17:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691430730; x=1722966730;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DMxofzGXP2lonmEXD9FV2NWV4aT+vOGYjpqGCa9nwt0=;
 b=O0rlKvahEAqpNxWfOFC0JEGQ+oIFrqfuHYTK2ZvuNq2E14W/Kt3zzqbz
 WnZMG2OEisz1bcwV5kehvHHkUKtcgXUodUW4phIVP0nm7Ycpf4OKf7Ugy
 E/7S8RXFWKaq/X6K6lvGjXqZIXwyE8Dv+eVX2nm2mIDfAJoZ/M7Wgr6Mh
 MWJg4kIwujH8M/oQo+mwiQJeixbQ9nLirEvxWWjVe2142r+vOUJSElGNK
 KN3zcmNaNWS/DJmOid/NBxHbJYxx9++jRAQzBkiUSgGVqZ6iQad32vPwA
 bVsDzuV28tjnsaLrJ5aFI+JDyhfVHDnYgDkcVDQkbl/qTrHe9Yyq93En8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373366253"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="373366253"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 10:52:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731059248"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="731059248"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 07 Aug 2023 10:52:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 10:52:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 10:52:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 10:52:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 10:52:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfnEpH7E0EgkAgizTltRlaEUbFV0RJxjCyPfPimRWsrT27tLhC3jUBBFXCqEylWuMjR0xcw2I9u9lZFPd6WYnpN7MH7dlKPMqae7BVZ1dJ/DqA6ZxOtSQV6GXuZ70GKNNFYLL/6GQWLeGy06p6i5IP28gf2ynb/iu2L3tfbvBZPvsUDkQtWtTouM4oCLVcTWv2o1AOIqrJJ857ivRSU/tYlFeZGX3c4x7vKr9ziFUQukUMtdPWtUsLAnrFM6D1xsetWFycZcnBOXY9eOJT+AAKatYHopzvR10ApCDP5/XauQJ7ZFo7YnsOss5WEYWt+OXE9sgaXkpUtZ5LUOlBumDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGmsYoFYHox/xU3OPU7zN9nqgzVXbYC915be3pK0g24=;
 b=ICYmcOchWK0fFpPuQE9lhtaO6V7g4zcRhJq5l9wYkhkdZI362GzsaY8bbgxX1vSgNyNcWk/G/sfNGPUUfvVx812TuA7UMjRgFOH9CR3VrAXuxDhTs3ENOBIy87xojxbUYSm7fx1dxl6EWbIVu9B1CpOqbOo46Olbxgixi8Dk6aaKaYAQ6cgU1a73DeZPhaIsRnZCgb3ZsfEpvwQEc5QNJTUXBFtrBDhj25oQg+apyHSlRT1SSfm3NphOYnwZ0MefgTstpCahtWsn4NzK7sFZjvLSuR/lbX8/ZJDQA9Rold3Y8VBvSYoOqT/mNIX0QPgZq4wYkgMKpEztFzGz5v22rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7921.namprd11.prod.outlook.com (2603:10b6:930:7d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 17:52:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 17:52:07 +0000
Date: Mon, 7 Aug 2023 13:52:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v1 1/3] drm/i915/guc: Flush context destruction worker at
 suspend
Message-ID: <ZNEvQqeZgvd1XHPV@intel.com>
References: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
 <20230802233501.17074-2-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230802233501.17074-2-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: BYAPR02CA0036.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::49) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 892ff5d6-2052-4dec-3fb0-08db976f03d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xB9YOpSdcKLZWIykvxLjdXkE/50N6CUMoky7Wq5dPJKW7m8VpR4h7ke89hwl4QXOEGtbfTlfFMrsxyeS72VQce2isPYC/OwutTDM4NExb3txmZJUiQBS1MIHTgmCi/S3+++QsSPU03pu4/1cpwXH5Tvy6SRuDlbTJMX33UngVfvlIFupKbF7B2mZVEePRufBUZFEMm4MY/QIxEG1Q3Kf94IlyXjzklOIAWWlmgrysm0ZnlZxqarK+2pLj7lBM02nPdSDWo+1J7YzSz5JwdfVl2KsKuXnxAbzSV9qt8ux4Jcl8ClQmR7HrsNWXEha75PAgKp8HXY+qXdXNf7Y/4OAd4W6QGh0JyhMEVh73xBKm9vegG6BZplpzqooj6niiPEmH/YEXvRJG1Eg/4Orowp9mWE9RU1qHNQVRle+hlWCZes3FXA6wELZghsaRMJ/tIUiF8LMY93U0sSdCYidDuvHk+aH7ZMVQ6RtuXEhTxGYbuTN0camFwU+egejep+QiwiJzya1/QFBplExAu94fum6iJvUk/6b4IjJCb4PueyzT3//KXWCmlkdpwUIzIsK96aw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(316002)(86362001)(6636002)(38100700002)(54906003)(66946007)(6666004)(478600001)(66556008)(66476007)(6486002)(37006003)(450100002)(6506007)(82960400001)(41300700001)(26005)(15650500001)(8676002)(8936002)(6862004)(2906002)(83380400001)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aVcW+jEYDg0IxGp3LBkSMK5FLLO8VUy1gEuSrT+Kqr3KKFCUC/+jYAxBryBs?=
 =?us-ascii?Q?X8L4UOV6E9/UDUJ7xWAvaif6Sptefx/jqh0GFO0LxUPrJlrCyzKK2FG485do?=
 =?us-ascii?Q?BYKLYcxBSrN/3nD4qxXMryNY5wupfa5hNwsDk8qmVrbfD3srNBXTMoB/BOJk?=
 =?us-ascii?Q?wc4KSRLn/jij43GfhEOsH2mJCPUFeKaM59zBSU5a6jiZrtzkU8ANceF+yIGQ?=
 =?us-ascii?Q?g625lmt7m60EMsWKIquTZ7QSAa/s81m9JNZf1U/IJf+RGgdglIjJQrcaeupo?=
 =?us-ascii?Q?+osgljE6sugIqbBCJKYK8Hmj4U0pXTyNe8D8+3KXreAwy5nwavLE58adwFNf?=
 =?us-ascii?Q?d0Z1thY2Dw125XDsl2XI6z4XhCvyHXoLRr8axAwE+7ILUEgs2E7msFvBdOAj?=
 =?us-ascii?Q?fdupmJ6lpJxfWXlPI0GiRwW1vwNrxp2KvlfL64XvZMELvFBMZ3j1du4Cm9Dp?=
 =?us-ascii?Q?KKVElMP/1NQY1DA/aOA2TrTrbbb1OgARmM/FdKNYaVHJFq1h5N4Eq78p41Uo?=
 =?us-ascii?Q?m5SDJaVO4UGPJKKvFvphgWlFrVP6/QkSxqXEVZNFarWeBfBPxbqTARHxlyLX?=
 =?us-ascii?Q?ukPR9jYpVkPoAvwPCSk2RYdqgV/veEEc5Psxi2jnxX/PdjPwVdoZbReb2Q2G?=
 =?us-ascii?Q?oDFE+f0Juq1osXGFBwiyeJw+9cBVvF9TrkIrtEIecq7eKRNSyjqJPrmJVy+P?=
 =?us-ascii?Q?hc1WgjkaZWkYnGo6+oQom/IwegC7HPaZhRcdc4SwfpI1pyv5d51t6jRsrS3X?=
 =?us-ascii?Q?VmSzgg1mwkYcNIwKpJQ6VDoKCk05Jk6bc4ynpzrKw9BrcyskkeBTDzC4FiYJ?=
 =?us-ascii?Q?vynAxsoxHymBIA9k54fMtmKa8rgeQBhBTh6ZyKkNxY4T4t6+lDoCR9AzeCcE?=
 =?us-ascii?Q?H0UWQ2JuaT2kBwOXPEj/OmG0Mh8nz8jWJQOIkF2qvW2hC6jo0GM393HHqAcJ?=
 =?us-ascii?Q?NrM364Oz3Cg2i7Zhk3r3K06AjwtgWg5Bf3e6FyA332zocpv0Xhx/E1lgftU+?=
 =?us-ascii?Q?fu8z42T86I4noUJqFN12YgqQQTWRuf46jMH0ZziigI+6FuJsqHL9MYM/21Ix?=
 =?us-ascii?Q?QhSco7deh0Mn1wPam3IFndNi6uNOy0VAh80r/bVIOMpcrbXs4QpLMP7j+vHk?=
 =?us-ascii?Q?5gljFjtwT/oLAuAP9Ipn2LMSW9FTxweOA5U5/iLvT1DSoL3AnMDWFYE4JWvA?=
 =?us-ascii?Q?pZtWn27Kc56AIL8r2bx7adBUyRTZSU0vfxfUkx+hPnnJVAzQHsrmp0LvGMyY?=
 =?us-ascii?Q?yTm/TuTUz3t95po3/2MEvCDwQvu/p2ZVLCk8ZA1i9l9eF8msqFGHZDfahxGE?=
 =?us-ascii?Q?Fisf91VFvNoEUrzrGOhknSl42kmCAK7vqMlTGk/3TcdgTQ6/aRjVzkH0vvbm?=
 =?us-ascii?Q?tQc7RC4iyhVixMYlNv+iUPeyvHH97BCYrX71xm4LACbqrAlZBo+zQhnP3xBZ?=
 =?us-ascii?Q?2Vc2NLyrSA+eWsUV7lKqXsVJxNGBCmXSWNAKa6QGEB0g1e2j6HfxAskUf6Cj?=
 =?us-ascii?Q?U08AwVXX69bPCJSnGLuVNC3FtdTppTSDu5BJsamZpfj3sMoYTn2CKbwXQFHw?=
 =?us-ascii?Q?kAJnnCBm0DV6orbaqD8tftvQxMk7XEprys3ZDhhB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 892ff5d6-2052-4dec-3fb0-08db976f03d1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 17:52:06.9530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlDHYxF0tRYFdv69NZhIQIaT3LC3Hz/5tviNd3b2WK6Ea48ggpUdpQLu03FYv5ShYgftjA7nAA2qaw+byxIXVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7921
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
Cc: intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 02, 2023 at 04:34:59PM -0700, Alan Previn wrote:
> Suspend is not like reset, it can unroll, so we have to properly
> flush pending context-guc-id deregistrations to complete before
> we return from suspend calls.

But if is 'unrolls' the execution should just continue, no?!
In other words, why is this flush needed? What happens if we
don't flush, but resume doesn't proceed? in in which case
of resume you are thinking that it returns and not having flushed?

> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c             | 6 +++++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h | 2 ++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 7 +++++++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.h             | 1 +
>  5 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 5a942af0a14e..3162d859ed68 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -289,8 +289,10 @@ int intel_gt_resume(struct intel_gt *gt)
>  
>  static void wait_for_suspend(struct intel_gt *gt)
>  {
> -	if (!intel_gt_pm_is_awake(gt))
> +	if (!intel_gt_pm_is_awake(gt)) {
> +		intel_uc_suspend_prepare(&gt->uc);

why only on idle?

Well, I know, if we are in idle it is because all the requests had
already ended and gt will be wedged, but why do we need to do anything
if we are in idle?

And why here and not some upper layer? like in prepare....

>  		return;
> +	}
>  
>  	if (intel_gt_wait_for_idle(gt, I915_GT_SUSPEND_IDLE_TIMEOUT) == -ETIME) {
>  		/*
> @@ -299,6 +301,8 @@ static void wait_for_suspend(struct intel_gt *gt)
>  		 */
>  		intel_gt_set_wedged(gt);
>  		intel_gt_retire_requests(gt);
> +	} else {
> +		intel_uc_suspend_prepare(&gt->uc);
>  	}
>  
>  	intel_gt_pm_wait_for_idle(gt);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a0e3ef1c65d2..dc7735a19a5a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1578,6 +1578,11 @@ static void guc_flush_submissions(struct intel_guc *guc)
>  	spin_unlock_irqrestore(&sched_engine->lock, flags);
>  }
>  
> +void intel_guc_submission_suspend_prepare(struct intel_guc *guc)
> +{
> +	flush_work(&guc->submission_state.destroyed_worker);
> +}
> +
>  static void guc_flush_destroyed_contexts(struct intel_guc *guc);
>  
>  void intel_guc_submission_reset_prepare(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index c57b29cdb1a6..7f0705ece74b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -38,6 +38,8 @@ int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
>  				   bool interruptible,
>  				   long timeout);
>  
> +void intel_guc_submission_suspend_prepare(struct intel_guc *guc);
> +
>  static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
>  {
>  	return guc->submission_supported;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 18250fb64bd8..468d7b397927 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -679,6 +679,13 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
>  	guc_disable_communication(guc);
>  }
>  
> +void intel_uc_suspend_prepare(struct intel_uc *uc)
> +{
> +	struct intel_guc *guc = &uc->guc;
> +
> +	intel_guc_submission_suspend_prepare(guc);
> +}
> +
>  void intel_uc_suspend(struct intel_uc *uc)
>  {
>  	struct intel_guc *guc = &uc->guc;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> index 014bb7d83689..036877a07261 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> @@ -49,6 +49,7 @@ void intel_uc_reset_prepare(struct intel_uc *uc);
>  void intel_uc_reset(struct intel_uc *uc, intel_engine_mask_t stalled);
>  void intel_uc_reset_finish(struct intel_uc *uc);
>  void intel_uc_cancel_requests(struct intel_uc *uc);
> +void intel_uc_suspend_prepare(struct intel_uc *uc);
>  void intel_uc_suspend(struct intel_uc *uc);
>  void intel_uc_runtime_suspend(struct intel_uc *uc);
>  int intel_uc_resume(struct intel_uc *uc);
> -- 
> 2.39.0
> 
