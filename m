Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F0772D56
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804CA10E375;
	Mon,  7 Aug 2023 17:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0E810E375;
 Mon,  7 Aug 2023 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691431027; x=1722967027;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EN+OvIPQ5AeS69AxTsAyUuCL5ZQGX9ajpi62uVgCedI=;
 b=HMv+LnaPzafsyqYi9LjhuWLVUIr4x38EVstLd2DwUyr8ASiHAl33NZQG
 joGXMHFTkwgVkMcS4jh+wfwSp0v3LAS6icynQItvH+IEhESV1/YpoBB/f
 iTPGnlnkwbwmNQltlRsW5P2f6BD+UiOK239utO8yydIy+nBF2slmx4KqJ
 cthgaAn0NsRK3XOWdXZKgDf69X6qYT9OGnhRSZeLTed1qDVLFmqdS2hxi
 EsfJdUWxv1VCUANawpszqOeeN3ygo7IU4qGGuko0qu8t0B85IuzP5yokR
 mexz9piPd/DqorgjKPwL+K2XXGSPGsa4ulOnGVKLaCXmLZ5V3tUUmGGP1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350916613"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="350916613"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 10:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="760588154"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="760588154"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 07 Aug 2023 10:57:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 10:57:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 10:57:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 10:57:05 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 10:57:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0AEunTlyDwcncme5SnjFnNp/ySActy9X8anZrc6fwlL7yqaKGUbEiyztKl+IiUcbEj0m7Y6ACAB9m9UW4vj/8vfhpGEk4CwjxWMLu+8WEvrmb67w25du8+zXt1R3QQNPZJm4puF4qWGPgwGteFG1GAjn+5k5KKHhEN08Gp3Ce4T74Qc02rJWcJ23g9C128+5NCiCZs5RQfn16HVIws2ESISNrSLa1//w8pAgPOdGBZ6Kn/tt5clvUPHCkFtd0IAwxI1+WQZBKlaBJsOXWJQSCu5Y4IlYJ7jUxC5Ci1sYPTOL11vlEv9bWeg6mI0fQkSYg3jb3Kuk8411SDpGPwOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuG9UUvykcBGV6pnPFUtJsHv1IQrT0Gy7SnSKGdij9o=;
 b=QRlVQo81yd6NKWZZ24v5RzxwLSY+KEqbCw/I1cMIpHb/Zz3ChaksV+KEmFXcHiXUxVvUQjfgn+iVWykJ+mrvzTjWUrDnuCmMmA1F7+DEAVuxQ6UHXBwq+7FamfgKH/45BMB+3o44pk8ghNzaXbhchV7e2gkzk+Uw/7XqXx90YveBZA8CvXxLv3LVMklaZ+dvM/UQCe78rBkX4NF1p00PF1KWPVVtOtXSwBfdcyJXe9vpufzprzcveXCSoV3cH1wc4P19eoC0OKQFsszfD5l14Rw9OAgFUEe/Qx7ML6mJOc5GdH0vG3XzVd1umeSvJDJHHi4B2VINQUWK2sj2zOSJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5374.namprd11.prod.outlook.com (2603:10b6:5:395::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 17:56:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 17:56:59 +0000
Date: Mon, 7 Aug 2023 13:56:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH v1 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Message-ID: <ZNEwZzp6KPEwEpsv@intel.com>
References: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
 <20230802233501.17074-4-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230802233501.17074-4-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: BYAPR07CA0052.namprd07.prod.outlook.com
 (2603:10b6:a03:60::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5374:EE_
X-MS-Office365-Filtering-Correlation-Id: c58348cd-3748-41ed-0698-08db976fb20c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BuQno0xj/owsSRuTLAykt9XvG8/T2j7Ir8rFGTOhBeS+3IYYT5TCS1ZG9XiuTSOwVgWGd2NNXdXT0XVdFyp2M8rN6z2CHbVSnbQrpvHLF5x1iQXKOH2zbwDHDsmBRohdFp1tFMEx45pSxbbfRCFy3zh/jl5i29fFhrnnDs6ibOMFmR+JNs3CnvjPn7RqqwYcWRIxvQrsS11uEONTLikyRLVf5ZwgK55vwwdxok8ShzQJnTHEbia+eLV3gcZX9qBrgrwysXEDvXkFkfYCqKXb2YzjfxvJcF+ZfMw6zk/nKfQZe5ukqLblCre2y7fSNc09PE0B9IpfXgSuM8veUyIGCFEKZ4utiytV+ddNtgmTSpbGXsBp3iSr476Yk4xHxP+dkmd52VR77/ax1l0IJPNUNnxwoflBRsY7wfwpA9HMtITzJLSjM26Cdm6RVTfFEsmws/cXDKXiLt2qSwrlMBcZ7yMtrPJc7mmqMXe0QkIyrOlojppykRrvTX9bW/8zY5a+iH+XeR4fdlf07wMnc6tDT1M5t0RuOJJ/C4zxpC+5+iQq1qkZ1VKVnrtpy+KpH7pn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199021)(1800799003)(186006)(2616005)(6486002)(6666004)(478600001)(86362001)(6512007)(82960400001)(26005)(36756003)(6506007)(15650500001)(41300700001)(8936002)(5660300002)(316002)(8676002)(6862004)(44832011)(37006003)(2906002)(4326008)(6636002)(66946007)(450100002)(66556008)(66476007)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5jZ1ttXGsNwIRmJLTGrwpMkKxgFLPUWT2mIwRdpApFWTUAaQI1XZ84hiK5sC?=
 =?us-ascii?Q?dSk+K51lbX1fboZvVnQ7HbOOCUMQeNvFovNgrKQs0y6DB4BPWM8k7iEOcmKS?=
 =?us-ascii?Q?9gHLmT0qQ2f/9cyQVxY1jL6qVkuMZOJRcZNxMT8g8WKn99VQgJd5jt3CXKp9?=
 =?us-ascii?Q?NP1SLHUC4Gr6QTDaalV9kgqxEqPYjH+iSobJw3WI55QIoRCHAZH/2Dcc2ZNG?=
 =?us-ascii?Q?CuWOfRwFoPew8IHtq74U9jSjI0W8UwmyQMnCV1m/zXswz41gFaRVyXdBzy2S?=
 =?us-ascii?Q?5dIHZF/9lkyhM9J5VuCTruj1+0QlkZPMsPbL94/ZDVsIADSUxym/EVYepxU/?=
 =?us-ascii?Q?kuGGBvlkCyUVfaK6cxdIbKX6P7aCtHZiGdXjzt4E6nd78HOWBppTI5R+gobW?=
 =?us-ascii?Q?rI+80TgE7IXZTzC5RLVusO4tmJ0cOw0NN+GRiANpnhXTTEy5JNTbt1fKGBzu?=
 =?us-ascii?Q?4GwruEOJ0hZiQQnSUyTHk5h/s6oIpdqNGz1f2JQ1XEb9qudeXkEoQn5I+OGk?=
 =?us-ascii?Q?SMYH0CYFcmUcbCdOf9+KdPMv8TCoKltu9yyyFUejYV35DVTUOl6ts3vmTHvB?=
 =?us-ascii?Q?gJSreDym2j+onQmUpx/DjEo9xOwaDVp2x+vkTkqBxs+7OeafKR9amnlOLu4x?=
 =?us-ascii?Q?mMMAFfgxc82Q4LS99aXueuu24wYDrKZBN+my9umZSHFYZ/CK1Uu6BIK8gxhB?=
 =?us-ascii?Q?nXj2Z/387TFXbRYXRxN09tAXCLxFoJHlVeRCF/HVDdsbKWkU6qglXaOJKe9+?=
 =?us-ascii?Q?i3Rds+QSQOcBA9R4A9cFjGd9L3qDqSNbKvsPexgMvUgqKhQ+Rxlek6TCVXd5?=
 =?us-ascii?Q?wFUOQHo7taLzVpefZhUnJ9gY9P7zMklSunQo2qIY0caJ+TSz7tW953XDd8MM?=
 =?us-ascii?Q?ghw0FfbBR1d9SQUJJaRxU8m20fQeGAYTzhx9ngRE6tyVICBYHarUTr88Px3V?=
 =?us-ascii?Q?z6XJkhlN3azAThQbxGGF3hYfFbXhQOhpVOlzlmkEmhWDER+o1m4hQw53uQfb?=
 =?us-ascii?Q?8ejywt4qIBZna9GEFbU0EPNe3FnfMMssDS840tuLx6eSdpCRoLNB244wCu4/?=
 =?us-ascii?Q?dkJ3N3sZGPuCJDLQVEaSEil1xEigPKnWynBSFsj2Snyn7iAuQFZCF9Tur/dB?=
 =?us-ascii?Q?UAIBrFxNMckUDdMOXxtniYc5jh7oiH5p0OEWsrX3XBc2lOeQ1GkI6tuGS1Zo?=
 =?us-ascii?Q?abXRMae1nZNnlhlH7tbwTwcY0dIRVY9SDQiRM3MVO4J4CVXelYLLXZQyidh1?=
 =?us-ascii?Q?wMfNk+VEWVR95EgA2pHh48OE1773WcS59ga1CU4UYTnF8THSwWzOd5ytOfml?=
 =?us-ascii?Q?LEQmcrZqDNuEfy9kNiP5GSsDPJr9E7eMzuTgeHVd5iOICS3QO0KvBrYObBS9?=
 =?us-ascii?Q?ZH0uDB1U2ljXW0JbDANvEcjBLgJxrLWe2amM3zjrYRhntnXqX3xUZQ7sr3B7?=
 =?us-ascii?Q?PHgoaBMs16HM+C44w74suYqLkyVwkK0Wqv9IAu+U7I2zNusouh56pSPKIUhQ?=
 =?us-ascii?Q?pGAu9dpTnJMK3U0bmPlFiaITK/dpY0GH3sEc/9A4mK6PXgOBcWuCMuJDU4Bt?=
 =?us-ascii?Q?gJAoFVcunRfbW7jp3G9l4I4SpbDpZDsLA98WNzez?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c58348cd-3748-41ed-0698-08db976fb20c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 17:56:59.0650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIW0AxOd0CFs9ejuci2ipq0EOG0s75TIi6Ac2/dpWxm+lT9d/Do+HLjqOvRfeK8blRc5mRjLUtvKJw7miIcmdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5374
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 02, 2023 at 04:35:01PM -0700, Alan Previn wrote:
> When suspending, add a timeout when calling
> intel_gt_pm_wait_for_idle else if we have a lost
> G2H event that holds a wakeref (which would be
> indicating of a bug elsewhere in the driver), we
> get to complete the suspend-resume cycle, albeit
> without all the lower power hw counters hitting
> its targets, instead of hanging in the kernel.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c     |  7 ++++++-
>  drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  7 ++++++-
>  drivers/gpu/drm/i915/intel_wakeref.c      | 14 ++++++++++----
>  drivers/gpu/drm/i915/intel_wakeref.h      |  5 +++--
>  5 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index ee15486fed0d..090438eb8682 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -688,7 +688,7 @@ void intel_engines_release(struct intel_gt *gt)
>  		if (!engine->release)
>  			continue;
>  
> -		intel_wakeref_wait_for_idle(&engine->wakeref);
> +		intel_wakeref_wait_for_idle(&engine->wakeref, 0);
>  		GEM_BUG_ON(intel_engine_pm_is_awake(engine));
>  
>  		engine->release(engine);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 3162d859ed68..dfe77eb3efd1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -289,6 +289,8 @@ int intel_gt_resume(struct intel_gt *gt)
>  
>  static void wait_for_suspend(struct intel_gt *gt)
>  {
> +	int timeout_ms = CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT ? : 10000;
> +
>  	if (!intel_gt_pm_is_awake(gt)) {
>  		intel_uc_suspend_prepare(&gt->uc);
>  		return;
> @@ -305,7 +307,10 @@ static void wait_for_suspend(struct intel_gt *gt)
>  		intel_uc_suspend_prepare(&gt->uc);
>  	}
>  
> -	intel_gt_pm_wait_for_idle(gt);
> +	/* we are suspending, so we shouldn't be waiting forever */
> +	if (intel_gt_pm_wait_timeout_for_idle(gt, timeout_ms) == -ETIME)
> +		drm_warn(&gt->i915->drm, "Bailing from %s after %d milisec timeout\n",
> +			 __func__, timeout_ms);
>  }
>  
>  void intel_gt_suspend_prepare(struct intel_gt *gt)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index 6c9a46452364..5358acc2b5b1 100644
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
> index 718f2f1b6174..7e01d4cc300c 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.c
> +++ b/drivers/gpu/drm/i915/intel_wakeref.c
> @@ -111,14 +111,20 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
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
> +		err = -ETIME;

it looks to me that -ETIMEDOUT would be a better error.

> +
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
> index ec881b097368..6fbb7a2fb6ea 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.h
> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
> @@ -251,15 +251,16 @@ __intel_wakeref_defer_park(struct intel_wakeref *wf)
>  /**
>   * intel_wakeref_wait_for_idle: Wait until the wakeref is idle
>   * @wf: the wakeref
> + * @timeout_ms: timeout to wait in milisecs, zero means forever
>   *
>   * Wait for the earlier asynchronous release of the wakeref. Note
>   * this will wait for any third party as well, so make sure you only wait
>   * when you have control over the wakeref and trust no one else is acquiring
>   * it.
>   *
> - * Return: 0 on success, error code if killed.
> + * Return: 0 on success, error code if killed, -ETIME if timed-out.
>   */
> -int intel_wakeref_wait_for_idle(struct intel_wakeref *wf);
> +int intel_wakeref_wait_for_idle(struct intel_wakeref *wf, int timeout_ms);
>  
>  struct intel_wakeref_auto {
>  	struct drm_i915_private *i915;
> -- 
> 2.39.0
> 
