Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13D75F7025
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 23:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEE410E8AC;
	Thu,  6 Oct 2022 21:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B30810E8AA;
 Thu,  6 Oct 2022 21:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665091482; x=1696627482;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Awc4CB1QJ6kNt7Dl/uCYoFshvqHMyutnQxrOhUaOsno=;
 b=PUeKeSjEOIET5I9TNpRx4QLmXKYOe0iLVCp6Lh4SKM3rk0fZROsuAOJy
 ECMJyOoA6oxNqDK7KRtjjPidPKC+dM7tpOl+bGezfW15BeghEDQ01hn5s
 OuNfqXDvhQxGmdUSBFZ+2OkFVIWwc+1m2ciZk+Qgg34F/NX8ZQtPYY48k
 pyqo/w2zF6tBbPdOswlZd/txOYYTkCqgR7722f5/tXfcZ71NxymBEbf4x
 1SKXDfe5zI1LoxzZkDpuc1xWEOYSs4uCMXuHzZJeph8XHq/AlcTmwGxTm
 fAfAPUOXSNGdSE1uoO/zO7y9VgOxpH+sLFJ9751/76fP4TdPJ8hfOMeC3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="389866641"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="389866641"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 14:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="602609489"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="602609489"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 06 Oct 2022 14:24:41 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 6 Oct 2022 14:24:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 6 Oct 2022 14:24:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 6 Oct 2022 14:24:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsU1o1BMlP2y/KU7TiAN51Xo6Lf8kHb29Vt0ueaZN28gekb56yJGPG+G9xtFze4DVNwQV2v/nBdx/w2nG51Gbv72cWMQs8+gyIH1DvvWXDOLxfGgQ085Wp4rZo+gtu3Hh6LwlO83Z/fvZT+V7VuUXBdix5YaF5fDx9CyLP2c+QqySUfj4vt0xinEJ5op5GP/k6qvXQz1SNoCR5y8H/XPk4WLgWiGG1eQK43hGQua0PtnG+8RubO84KBf8cIx269OMLBiqTaiS4oV36pqsH4c6XKA6tGEAd4WAqPx0YjmRyeLXHkM2qTFAytIWZpHB3m3HQ4rvSDDOYPZyRwLa8uJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhivymnyAP5RMd47a75dGBSQBL8fZ0cGaHOIPUWZw6g=;
 b=oRMc1nCQG5Ng0+KX9edaVr30DifJJWycuo41uJOmRsHBelhqofFPE39Za9N4Nn9tN0djcaM+rzFYTqQwAe/ke/wWHBo8XkzPdmAbphdA7SYyvOwd/7wD1V0OiT0bw0KisKoB/bUDvdPu0cfSMfefQAV5P3r4tI+8/5sxGLzQ9V1KgDxVIE4RHVOkxKu08bemGWC6YCjbYqeikPcXs/lpSKZ+xxH65CqUCuxnUrggMN+ldXP4raFvJcSPGBpp3PenzVEqvL+OzhmUpxD8A0o7U+HfUnns74X56m2RZwisZO5oBstC78U88qblo2UPE41QJ+3/V0msougFvyWwqU/bpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6831.namprd11.prod.outlook.com (2603:10b6:510:22d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 21:24:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%3]) with mapi id 15.20.5676.028; Thu, 6 Oct 2022
 21:24:39 +0000
Date: Thu, 6 Oct 2022 17:24:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/slpc: Update the frequency
 debugfs
Message-ID: <Yz9Hkhw7GO2ATCcQ@intel.com>
References: <20221005155943.34747-1-vinay.belgaumkar@intel.com>
 <20221005155943.34747-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221005155943.34747-3-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 870b0133-20cf-45a8-3080-08daa7e12cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vhystLXkSq6SrhS4+rw9nrHKX2Q+KddNpyUJAmb03lFis3FHDu+C8EXtV7+yKwQnRLBSm1fzrok3yR6HMCW0r1JmXZizEK1pDJ5IfUdDpVAxlaHk2vSqIZg4EmwCWtZ/oV/mDRCjPhn40EB4X2fnvPfk3uOVAjq0jkeU/zb5bJ+O91OlXG4mviFxOd/rBqVt4F4VB3zpy0HmlBD0D/J+Fp7YrelwmqK+0MrPEoMYdIzhUpING8KqsUSdlX/CEKzzKxqtJk6mavvFfS3WOrJod0KaWw5rxO7/9II1NBZphx7NN6Tpyz29scy7avFl1YJANG3qPRE9xaMvPF7gXRw5gU59CVZ7/IZFVIZk8K1w0ABJTMWtRIf9OjQ0fwI4w1tlvAMO2T8Dcin/IbjdEpbkpxL2qcTt9fKfBaKNptv6xQkxrcqmMH+ooi2yLnfzsEZUGeBbgUVur1/EeRELhw2qL5E/EvcLTNwnmOuoIrSsMF47ns4MK/IabNno2T3TiTL1Z2Ym/2IDXodA7By2fDB4PRV6aZdDkxiDE6n2uws4xVRY6kOVgC68jHxv5wrJ3JbQAu59hIipbsLvTkNrpIdCRlHG1q9U3uGkBZTNli6ExAw/KyNVgWgeMq2R/gYlwU629IEORFigtj6HBBr576fUiDpEPaO5CbKzSrg05mwk4jZAc0ALP5uCfL6BU0r8cDtiAEolvFVJQj4+wH5cfd72+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199015)(82960400001)(6636002)(38100700002)(37006003)(316002)(2616005)(66556008)(66946007)(86362001)(26005)(6862004)(6512007)(450100002)(5660300002)(66476007)(83380400001)(4326008)(8676002)(186003)(6506007)(36756003)(478600001)(2906002)(8936002)(6486002)(44832011)(6666004)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FU3/FbCOmf2zJHgqytXG6zabkLOSxtSsQYKGcnRatS8qcmEUruTlpfEpaCWJ?=
 =?us-ascii?Q?tFdyFBifidVAAycVopHfqAcgdGqLD9DPt37q7TPuuMmnW/ueYY5w9S0sDCcG?=
 =?us-ascii?Q?KNxvomshPBXQVdnAEOzxai1cHexM3/TgPsgQDMkuEHK7Mlnwuuxszg2uM55r?=
 =?us-ascii?Q?+24oUs9qERb47y2GW/wa5pMmGGRFsKWojaThjkO+MiB10prR1BsSvcVhFSKb?=
 =?us-ascii?Q?iaBa8oMP5xcB0WSlrQDiogWfUGVK554iKLNuDnxw9Fal49z/MEyyLhFmXlL5?=
 =?us-ascii?Q?OugZQedCafqSW/qEwRcQbUKvfltG5Z8TdH7RJLBfGzurSC6qmB5GqWsX97sI?=
 =?us-ascii?Q?1SB/ueCOXf6VCt+wzGEa7kqrJ4ZoQF8hjr2hO5jW3cCtkZ93l05TGSR3o8Uw?=
 =?us-ascii?Q?aQSosi85hrqSgsruXIssLFD7FxP7FEM1RfLLW8LILj1Ke9doy9D9vvLAjK4B?=
 =?us-ascii?Q?9gGZeejTE6ewBou/Y3bY+qjDZkWgWcNzFYEyslSEMj5Ix7ZT1ROsyIBHPfsE?=
 =?us-ascii?Q?gzrs+cTSFUjX4jU4BXNceYAdkmhBxn7FbVRtSKdlV+x4ue+Ly0Tz9cnHwMvm?=
 =?us-ascii?Q?KSVigCVfQNARdOy/MxMwUkQ5BvN8WQ+xQ0p7QZGMtTfrqDAxwbsa7N/BMTbP?=
 =?us-ascii?Q?EFMNcHU6ABxniP+TzoBwNDceYAAy1TFsgT/PFY3Ndh3bu6H3l2W4wucmHiu4?=
 =?us-ascii?Q?xEWC5w3jUl3WjS15v3+UcYg9rl+/I5GJ6C44yH/gCJjcyqgydtsWykYpb9/H?=
 =?us-ascii?Q?gABFimw2O18kGHc8KAD6M5zJSsMnVPwJTKdc8+LndDqNt3jSTxo7PrtmWTUQ?=
 =?us-ascii?Q?M2G1GhNf0hJEz3QRlkAnkSTuT8QDS3URNr5tVn+hm/HtWqYpnqhJdaGCficB?=
 =?us-ascii?Q?bYvCFMf1ell+KSrIbPdyrgAfuMJFmycN6Tv1EJllb5QHD5tTQ/nr9yWd1UKr?=
 =?us-ascii?Q?F6vQqg0B2kn1bntmx7VaZ7f9jBy/3t8MHpaiB/+OnLFbEFgVU/5N1E1n1kLf?=
 =?us-ascii?Q?+Qc1PSbZEpqcmEv2nD4uPuFuVix8Q42Q5H2XsMAuCOrzIIKOTJJg7ohjqw84?=
 =?us-ascii?Q?Oj6oTds4/i86lXIgE4LsUw6Pxv3sIwrAkb1D/6jQn0OcN02Os9Mpbu1CXpr1?=
 =?us-ascii?Q?4hqzSeny8aRqLegs7Mt9Bb4x3a95AM3q8TOMmCh1MhqAJTOLuAI5L0wT02/U?=
 =?us-ascii?Q?6rg5D5c8VsVXbc+qqexLOJSoOHAkm4ipz60R6zahqxih6tOLbbvrq0ZobPDx?=
 =?us-ascii?Q?oWFqGXyv0GUYWJDYOGhVV9yGL9sneEUqGauPkAfvhK+FtrwDJMkanARsjLg4?=
 =?us-ascii?Q?Cfy/A7DCrbLCzxNOlgrOOi6MH3G/nnX5S22pvmPSqYWtbgMT7Jm2k8Jt0hWa?=
 =?us-ascii?Q?2l+aafl0A6k0pZ1oJTQeyXVR5GDaxILCFV/w/DAETjuuDa7AQ8QEZhUgbhWz?=
 =?us-ascii?Q?o4hhMl8bkXOv+5PC7akkUyYDKrBwjeEA9j+gweEAfZbyU+7Ewmbm4yfTQQSl?=
 =?us-ascii?Q?+Yr2uQq6Q9exrzi4u9mQ2HjShkuaS9EByMtucjGhXnQ7gdxaFE866im4p7je?=
 =?us-ascii?Q?7/qYosTWrhrBYM63Tzb1YNiRp69qnJfHhc9I2K2Yc+G0BsmGTg6gpoNde2sT?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 870b0133-20cf-45a8-3080-08daa7e12cbb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 21:24:39.1134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wT5F165Jd/05PUeC0r+m48h8XPKWZQ2NpjF+sX/yp84mvd92AhYvrh398hQ1FTWFKdWZBK7zlkR6WGnQIT7jcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6831
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

On Wed, Oct 05, 2022 at 08:59:43AM -0700, Vinay Belgaumkar wrote:
> Read the values stored in the SLPC structures. Remove the
> fields that are no longer valid (like RPS interrupts) as
> well.
> 
> v2: Move all functionality changes to this patch (Jani)
> v3: Fix compile warning and if condition (Jani)
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_rps.c | 46 ++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 737db780db00..fc23c562d9b2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2219,7 +2219,7 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps *rps)
>  		return intel_gpu_freq(rps, rps->min_freq);
>  }
>  
> -void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
> +static void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
>  {
>  	struct intel_gt *gt = rps_to_gt(rps);
>  	struct drm_i915_private *i915 = gt->i915;
> @@ -2382,6 +2382,50 @@ void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
>  		   intel_gpu_freq(rps, rps->efficient_freq));
>  }
>  
> +static void slpc_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	struct intel_uncore *uncore = gt->uncore;
> +	struct intel_rps_freq_caps caps;
> +	u32 pm_mask;
> +
> +	gen6_rps_get_freq_caps(rps, &caps);
> +	pm_mask = intel_uncore_read(uncore, GEN6_PMINTRMSK);
> +
> +	drm_printf(p, "PM MASK=0x%08x\n", pm_mask);
> +	drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
> +		   rps->pm_intrmsk_mbz);
> +	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_uncore_read(uncore, GEN6_RPSTAT1));
> +	drm_printf(p, "RPNSWREQ: %dMHz\n", intel_rps_get_requested_frequency(rps));
> +	drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
> +		   intel_gpu_freq(rps, caps.min_freq));
> +	drm_printf(p, "Nominal (RP1) frequency: %dMHz\n",
> +		   intel_gpu_freq(rps, caps.rp1_freq));
> +	drm_printf(p, "Max non-overclocked (RP0) frequency: %dMHz\n",
> +		   intel_gpu_freq(rps, caps.rp0_freq));
> +	drm_printf(p, "Current freq: %d MHz\n",
> +		   intel_rps_get_requested_frequency(rps));
> +	drm_printf(p, "Actual freq: %d MHz\n",
> +		   intel_rps_read_actual_frequency(rps));
> +	drm_printf(p, "Min freq: %d MHz\n",
> +		   intel_rps_get_min_frequency(rps));
> +	drm_printf(p, "Boost freq: %d MHz\n",
> +		   intel_rps_get_boost_frequency(rps));
> +	drm_printf(p, "Max freq: %d MHz\n",
> +		   intel_rps_get_max_frequency(rps));
> +	drm_printf(p,
> +		   "efficient (RPe) frequency: %d MHz\n",
> +		   intel_gpu_freq(rps, caps.rp1_freq));

Well, my feelings with these are:

1. We have these already in sysfs and we don't need to duplicated here.
But we have this already duplicated for years

2. We should probably simply remove this file when using SLPC and force
folks to look to the sysfs files?

3. Maybe we should take the simple lazy approach to just fix the values
that are wrong?

But well, we might end up bikeshedding this for years... At least the
new version for SLPC is clean, so I won't block.


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(but I will hold the merge until tomorrow to see if anyone disagrees)


> +}
> +
> +void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
> +{
> +	if (rps_uses_slpc(rps))
> +		return slpc_frequency_dump(rps, p);
> +	else
> +		return rps_frequency_dump(rps, p);
> +}
> +
>  static int set_max_freq(struct intel_rps *rps, u32 val)
>  {
>  	struct drm_i915_private *i915 = rps_to_i915(rps);
> -- 
> 2.35.1
> 
