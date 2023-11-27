Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5687FABA5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 21:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D113110E14A;
	Mon, 27 Nov 2023 20:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EFF10E137;
 Mon, 27 Nov 2023 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701117397; x=1732653397;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xsxzOZLihSPhMf+CplYOquWRuLGMAE3Onbn5actR+M4=;
 b=HfIB0pWACSjl46SbsEN05TaK/yehmgqqJAVgxpIa8nMMLsPjpS7Ilj8/
 rOgX12k1iAvrDQek3sdx79I8YnQyOksOIrMCEkR3eo5ZMjNeFLg+Xs0uZ
 5vg19GiwV5eR5C9bEtjzyuwjHjY1ZsWK1NNJ8/z/VUbxx3uyFP8ysKOcj
 lRNYiSPXUDGHSnLw+ICBn/TmewMUC/B0/wn/aj0Ye9pyqc7YNm7qRAjwH
 KI+D+cubJOtQhEyM+zpeNoG3CtSzfxDJt4LykvPsYPcfGN9mm3xLfUNSo
 d2kcy5fpKAEKTzTpzd69VqRCOv1LYeyygkK0kxIhjAFZAmniOdk9TjbcL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="389938642"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="389938642"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 12:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="9900557"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 12:36:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 12:36:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 12:36:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 12:36:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 12:36:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLRMS0eughaILrYEJX9FKb+E2LxTMt+ElnaEGrXrJM6eddVQsTQxjuDJbLVVKcmoV6BXKSvdx4nfhNoQV+SYz8TLULWaf1mv7LlUmj+wkRJd950YLVNjqkmHrJGOddQvxmOQQnUXqUIS46UhJZXQQx4q1ljYcEdAb27UUTAl4DYQCjwI/qHXLKegG7bUHKCgvpzmtBh/xlaFysg07Yts2epMilDZKZd6FhpuM+p071ZssmvkJ/xzqtXoUyh96D96X4D8UFtMNQO1tac2g6kPqIK2oIAvldrmKlDV70ZG81iKEF8vSN/9u/c7jEI4fDRbfVHRVo9Oh0wSViNrE8lasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q85+lAIsGWFrnx9QgV+cnsDGNxAPwzrN1Fa8oHUgHuw=;
 b=BG8GWdmpdA5SsFF7APeJmd2Cw9Hf7fe4wCPN4GcLSzGiEuLkGHc986ghsEWjGPd9dQbLIjpLxDL8XzyBUhQZjoyZ6PrOwsnFVGI4Wa5umevJd8PIK3CaprEhuWMSi8RKLLKUO8Qe7EpqVUmNl4mJaWtxfUYr7qgPDmyDNBrMe62uNLXkwm4//9mhheuYaoOKb599uwp+06ixbgGH9s6VXNqHkRbPXW3pTyv5RM8LLUsE88GmsTJPCeIENKsdri0yEM7jt4JXIe8qwX+yR5BBHUaAiz/HDo3xRszOidTPriEvSe9uehFPt6RfB+Q0MJ9Ebi7E0zNIOpfq5ScbJ52qfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Mon, 27 Nov
 2023 20:36:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 20:36:33 +0000
Date: Mon, 27 Nov 2023 15:36:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH v1 1/1] drm/i915/gt: Dont wait forever when
 idling in suspend
Message-ID: <ZWT9zAlzzdQ3ixPR@intel.com>
References: <20231114162227.756974-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231114162227.756974-1-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0PR05CA0113.namprd05.prod.outlook.com
 (2603:10b6:a03:334::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: fda11503-4b13-45c1-98f2-08dbef888b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gxxbT91B1F6vYxFXPpjQzB6f0gmoHx8S33o97idtqzfh/+AVEhIRuVIenfEvbZazwgMpHkSpDWSHCs716/5hXKAKN6xDEEHVO9bFsLjIXuWkNs1ksYlPWjqsDA0H0JYH+J2trZq0rKJFSA4WOIst7+rFThrO7wHyXXs1Gjwi7tWgi4Y6PwPXAjKQFiq++rgHU3XysMBdnkkUCnYbFqs85NbyVNozA4GTnaWmVHqKCwzn4jfd4CBMtrj7RuLpbkGfI3dSQQcWZBQ5VsIAYl9MdvaAYQtA3d50koAjsZ6u/zIdkTL/lbtjIA4xzztmWjPqg87vzF8MU/pZW4jJ5SkqWL5c2E39hl/a+W4xxhd7WvsorfQbfwN5FFc8av6HRneWPMMUdK3QiI6R6iO36gVBj6qFUOeRrczURbCD0413tXf//OpnmJpDO/xuoH5oPd6boTXWY2L+IDGZetahUgRq09czvB1lGWlE06AlLbpEFYvoF2J1NH80BSuhI9wUWbdMRYux//Tp8Lh5xgpw6PcPmPHybOpvEoQNfm1Gu5mPofFCiR7VBCjc2rB98DSqT9hCrN+2+muqNcjK35YyUleORibpUDdWtcEVjG0156Du31c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2906002)(15650500001)(5660300002)(44832011)(6666004)(6512007)(41300700001)(478600001)(36756003)(450100002)(4326008)(6862004)(8676002)(8936002)(6506007)(6486002)(38100700002)(82960400001)(2616005)(66476007)(83380400001)(86362001)(66556008)(6636002)(316002)(37006003)(66946007)(26005)(192303002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J0II5NWtIhOsJHHsZF889APf1Ecp9+NvXvFuFruyZ6zOmNQCvkpXDQQaRUJW?=
 =?us-ascii?Q?laBfmcB+QV9d76tX1doOAUUYC3Ftt3nOn8V3YyCRnFwXZrvUsYU9qymo0fxJ?=
 =?us-ascii?Q?ethzoKgoLhHvhAOaW7ef9x3LGBMQ98gM1RgGYguh877Krr9QEZ9NbX+DAqmi?=
 =?us-ascii?Q?wqCvmv7oDHDwNKPLNxSB2PqwUbzvkcgAHYq/hahqaiqPm9yYPysPo9FoBDg/?=
 =?us-ascii?Q?Sy4w2rk/NZCoa8sDlfARlte2jxbqK4Ctk9CsUOuV2cfJlfUwI2XNwRxAjTWi?=
 =?us-ascii?Q?WRKk7vuQOIiKXbH9OF7F37Q7Rs6rd7tfCReDZ6x/G2eSY0R2AQENcwsgfZTc?=
 =?us-ascii?Q?8MI87yIEi99SjSqunSKo+Mf1K0F+YqJ3Mv6AlIcTVlVNnfoCwdUQKL7jlfPo?=
 =?us-ascii?Q?ApnskJYpAj4fBYuqwUWvfGa/nngN9SGWTPGRENPAmICJXdRjjZJohdwLs8Cs?=
 =?us-ascii?Q?QQw4V7M/6cAoL2oL1KVyIoVDdlxcX014SG3TdzAZamq6/UG9+Nxq3r3xIlSt?=
 =?us-ascii?Q?NDQmJ4Q3JVO/n6AKmbBOLo9SM7AzFmg1s+J8qY0Y/IDiyx2dBTM1q02lm1Wp?=
 =?us-ascii?Q?QZWtGsPN45apF1YykL72UXbdU7SWVTwQsspnTcb/sIp4o95IO/VQlcWOC6XF?=
 =?us-ascii?Q?GQpunEna1UMiHDCBCbaiZpSp6IbHiqHQjfoDX+gQC6ivsVNXdsV+xnZ6I9M/?=
 =?us-ascii?Q?pLkSk/qWCKIYCjhv99oF+ClZ9bQlVKxRULFFmLYAEZVrXIa8VTC/xhxxP1Yy?=
 =?us-ascii?Q?zCEa20D3GINFJ0EjPI1YidQaQNrf4lGWqGJ/k/iq0uQ6ab0l+MlI5fCh02cj?=
 =?us-ascii?Q?FJhj5yAv2jPO26JAt+TzNuSsQjGkgZqm239+Mz2MDZ/ZamdO/oNyEdsT82SM?=
 =?us-ascii?Q?/HYP7vfKEeSRS9C+9AUVp29Twsaem2ituMgrm90rQOyq3Hwh/rGAe53OWmVz?=
 =?us-ascii?Q?Muq81zJ7mA2RXmtRSldFOvg/+VwbERfD5ijHQzvqjSzNKj35y/eCQNeJAgxN?=
 =?us-ascii?Q?OXvh/k27v3Yh0wwAmTjNFp9UqSi3VhK2zDIYuCsHi6iUoGhBWpXzhKVvkRpu?=
 =?us-ascii?Q?hQpOhp2XQ9Ho4FaNz2LV1HNlWRGb0CTHb2Qi+58jsoxMaZggT7oKWjC2CVZM?=
 =?us-ascii?Q?qVNuSbZgpcibQeErLI8/2ctgFPXNZT9YkJyMAy3tTlm8Gve6yvgemprU362a?=
 =?us-ascii?Q?uXL2/b4as4PBUa35YmsORSrSVEXV8M10I4/QHLsrZZu/PTiK6CJRQLnboALH?=
 =?us-ascii?Q?Kww0ynk1bE1aj02Cnyzj7TjWczAuhXAqeAMWawIOIqZrA8//dj+8duOTnNIv?=
 =?us-ascii?Q?4MeLBBMK+GhiBH4BYEN2hWXh/w85xMgifi5qu/maB8IBA6Wc5LxzbxWx8JS8?=
 =?us-ascii?Q?x/HKYvK9XjPlGphVRjevKz2q1CrKhiVaPmpZiZmZCqQrbtbLQdBFqTs4QBh2?=
 =?us-ascii?Q?gQZPF9CQdArn7eiVYbktzdaMPieTQi+5caiLQWutlI6inp02aQ6LHDFLdHsk?=
 =?us-ascii?Q?bphRabufCO+MHWJ6yXA7ALEr3GpfJoQoCJUVvxUw/FN6DucuZA7cGZKpWeJq?=
 =?us-ascii?Q?TFTJUDTuVIaXC3AylUXys0lhJutgFFn2Bbx1MZDY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fda11503-4b13-45c1-98f2-08dbef888b1e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 20:36:33.5759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuQmKcC/pr0lWEdLKRNcnXKWcWrB9h6BOYGGwGSOKabT8o3z2sATSE11fu1+YcFDyaFC8M+Ypu93+7ib76fn6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
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
Cc: intel-gfx@lists.freedesktop.org, Mousumi Jana <mousumi.jana@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 08:22:27AM -0800, Alan Previn wrote:
> When suspending, add a timeout when calling
> intel_gt_pm_wait_for_idle else if we have a leaked
> wakeref (which would be indicative of a bug elsewhere
> in the driver), driver will at exit the suspend-resume
> cycle, after the kernel detects the held reference and
> prints a message to abort suspending instead of hanging
> in the kernel forever which then requires serial connection
> or ramoops dump to debug further.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Tested-by: Mousumi Jana <mousumi.jana@intel.com>

could you please rebase this on top of recent drm-tip and resend?
I got a conflict while trying to apply on drm-intel-gt-next.

As I had stated in another thread, I believe we should go further
and block the suspend and have a clean return to normal operation.
But anyway, I agree this is already a good and necessary improvement
because being in the dark if some bad case like this happens is
the worst thing. So this patch is already an improvement anyway.

again:
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c     |  7 ++++++-
>  drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  7 ++++++-
>  drivers/gpu/drm/i915/intel_wakeref.c      | 14 ++++++++++----
>  drivers/gpu/drm/i915/intel_wakeref.h      |  6 ++++--
>  5 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 40687806d22a..ffef963037f2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -686,7 +686,7 @@ void intel_engines_release(struct intel_gt *gt)
>  		if (!engine->release)
>  			continue;
>  
> -		intel_wakeref_wait_for_idle(&engine->wakeref);
> +		intel_wakeref_wait_for_idle(&engine->wakeref, 0);
>  		GEM_BUG_ON(intel_engine_pm_is_awake(engine));
>  
>  		engine->release(engine);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index f5899d503e23..25cb39ba9fdf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -306,6 +306,8 @@ int intel_gt_resume(struct intel_gt *gt)
>  
>  static void wait_for_suspend(struct intel_gt *gt)
>  {
> +	int final_timeout_ms = (I915_GT_SUSPEND_IDLE_TIMEOUT * 10);
> +
>  	if (!intel_gt_pm_is_awake(gt))
>  		return;
>  
> @@ -318,7 +320,10 @@ static void wait_for_suspend(struct intel_gt *gt)
>  		intel_gt_retire_requests(gt);
>  	}
>  
> -	intel_gt_pm_wait_for_idle(gt);
> +	/* we are suspending, so we shouldn't be waiting forever */
> +	if (intel_gt_pm_wait_timeout_for_idle(gt, final_timeout_ms) == -ETIMEDOUT)
> +		gt_warn(gt, "bailing from %s after %d milisec timeout\n",
> +			__func__, final_timeout_ms);
>  }
>  
>  void intel_gt_suspend_prepare(struct intel_gt *gt)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index b1eeb5b33918..1757ca4c3077 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -68,7 +68,12 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
>  
>  static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
>  {
> -	return intel_wakeref_wait_for_idle(&gt->wakeref);
> +	return intel_wakeref_wait_for_idle(&gt->wakeref, 0);
> +}
> +
> +static inline int intel_gt_pm_wait_timeout_for_idle(struct intel_gt *gt, int timeout_ms)
> +{
> +	return intel_wakeref_wait_for_idle(&gt->wakeref, timeout_ms);
>  }
>  
>  void intel_gt_pm_init_early(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
> index 623a69089386..f2611c65246b 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.c
> +++ b/drivers/gpu/drm/i915/intel_wakeref.c
> @@ -113,14 +113,20 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
>  			 "wakeref.work", &key->work, 0);
>  }
>  
> -int intel_wakeref_wait_for_idle(struct intel_wakeref *wf)
> +int intel_wakeref_wait_for_idle(struct intel_wakeref *wf, int timeout_ms)
>  {
> -	int err;
> +	int err = 0;
>  
>  	might_sleep();
>  
> -	err = wait_var_event_killable(&wf->wakeref,
> -				      !intel_wakeref_is_active(wf));
> +	if (!timeout_ms)
> +		err = wait_var_event_killable(&wf->wakeref,
> +					      !intel_wakeref_is_active(wf));
> +	else if (wait_var_event_timeout(&wf->wakeref,
> +					!intel_wakeref_is_active(wf),
> +					msecs_to_jiffies(timeout_ms)) < 1)
> +		err = -ETIMEDOUT;
> +
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
> index ec881b097368..302694a780d2 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.h
> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
> @@ -251,15 +251,17 @@ __intel_wakeref_defer_park(struct intel_wakeref *wf)
>  /**
>   * intel_wakeref_wait_for_idle: Wait until the wakeref is idle
>   * @wf: the wakeref
> + * @timeout_ms: Timeout in ms, 0 means never timeout.
>   *
>   * Wait for the earlier asynchronous release of the wakeref. Note
>   * this will wait for any third party as well, so make sure you only wait
>   * when you have control over the wakeref and trust no one else is acquiring
>   * it.
>   *
> - * Return: 0 on success, error code if killed.
> + * Returns 0 on success, -ETIMEDOUT upon a timeout, or the unlikely
> + * error propagation from wait_var_event_killable if timeout_ms is 0.
>   */
> -int intel_wakeref_wait_for_idle(struct intel_wakeref *wf);
> +int intel_wakeref_wait_for_idle(struct intel_wakeref *wf, int timeout_ms);
>  
>  struct intel_wakeref_auto {
>  	struct drm_i915_private *i915;
> 
> base-commit: 3d1e36691e73b3946b4a9ca8132a34f0319ff984
> -- 
> 2.39.0
> 
