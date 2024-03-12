Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCCE879F1C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 23:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF77E10E866;
	Tue, 12 Mar 2024 22:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICAAGeKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A1310E866;
 Tue, 12 Mar 2024 22:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710284057; x=1741820057;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u4m3xm9o2aLJFPPAH084B0QewU7KyaIXDFSEOugl9Vc=;
 b=ICAAGeKsGbVOVzuPVB5XobWtJ3xWnjvT9JZvrlMseonSn4Qs7KF45ybC
 /WnNsn0gQRr9GhUkqkWtXS+7E8OfsbUadMinv3v55edt3JX9jEj05LiXe
 bL0osEv94XlydcxL4dYweb/DTf4nPNedEHbBSwwCKtgrHLyqo0YRMM6Nh
 lco8pCSAjblBOncWhne2H55lhA4qs8eVUsQdkj5b3oDkl+dayEcuy3VPQ
 yrD+Fhmu9iNwTclmDZ/ktEQIJ5GL1UwAsHouCoMScynoOVCELKeKC4UZU
 Kf/nCIFAgGbOvyE/SjbQhkwpxehGlby2995EUgbqw4UY75HepvLkjTYjn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22477005"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="22477005"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 15:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12160241"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 15:54:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 15:54:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 15:54:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 15:54:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 15:54:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpKbV4AMjzcAYyAnXLyBFwYfIQzkMD+dSKFdvZ/gFPhf6j5cTGIxLhByJyblpQQc4HewTrd+NrH/LvSKsnENlaiZ+uJKyXueDNGiuEYohn+kATurCXOhPfDFoWYV6kBEjF3zEdt+UAcuRR1mjbGNMZ7jYNDT/q++AKTl57sW1vMxUDpDVPSVJ/lg0ZypbXuIlfy8RUZLlqrq405EvtCmbkzl9jsMqSvoVYXsf1ADY6wm3rvYGMr5mShN39oG8qRgDPdJ0hDOPQzh4Tn2n3EtWk7Obc0otzEriyl8rkbC/oQzy8n11/MyunEP5gELnR/dNcEeNs3RDd9LQfUjgo5t6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46c4Bs1o3LOACnoxVNNOKnDAEGNQP1gnrUX8jU/CwpI=;
 b=k1cSefpi6It+4LhEztAU4O/YfDjYxFDc+XOrBYamXN57DuWv4kiOeasn2xw1YYmsJxvrOmP+VtB9xAbSRlnX81Lr3WrTeQgfB2qNoddaJ5916NJ7Yt811UIRW0DjA0jpO6Py/BF+siIi3W19nD/KBzpOM2vo/Kg73dcbRR3zkwYFnMjzroYJRxFwTwiAiDUUWIeYQhzF/HTcmMenVhfbtWpx1aZuUvd0TSj7k4ZNFC01le6w2EF6aQu+CuLcDQNJGmpDxRmcUd4jK2Lrrk8Gh3Ta8NNfZHq0+j7TEke3zFMW2XZu4pOxMY+JG6GfGVkePcjGqejEgTIdyaRHdzS0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Tue, 12 Mar
 2024 22:54:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 22:54:13 +0000
Date: Tue, 12 Mar 2024 15:54:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>, Michal Mrozek
 <michal.mrozek@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/5] drm/i915: Drop WA 16015675438
Message-ID: <20240312225409.GM718896@mdroper-desk1.amr.corp.intel.com>
References: <20240306193643.1897026-1-lucas.demarchi@intel.com>
 <20240306193643.1897026-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240306193643.1897026-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:74::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec2a75c-38d9-4a58-58eb-08dc42e7561d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: maNicHFsj0uPTAPgUu0du3Ne/JTI5/9ijxpoi87oQpIs0f7VsKrSo74WJxZkY9I/RXZmEHQorRsWsBZMXoJ9RXlyif6fvYukA4POXO1lbdAMR++zXFWZ0kTKZQ4nTNab+SLsifbXKp6ujke7fW+pVt+0S6qGnrTnjt0B2mfTi9YvlWibjNM3BqyZITalqyTSt06n6Mwnaw196PiLEFTFT2Ozy01I447Bg1JHR8apL8iRp7qIe1MH90fknlxjbLY+AKr7LWIIWFJj7bAkaNwIQTe2sirJ5Z/QT+jbG92JMwjAgeSoX4Olw0hYqW5TkpuUFeCDp7H/XJT6tzx9vo3vUb8byFEW0wW1Te661L129W/iwsMZeUbFahKiKqhCmsZOY0+n1V5RfCEN9rVyGzETNU3QpiNmnN2KS5AjfU3v1hkAcb4FttAqKxQjPvn1T26luAQF/Q3urSxt/4DJy4XKSzHqaUfPjrKZa0OZeS9z/OkaIMhP4/R2UKK1ra5J+p4/N17xRKiqpzJB/SM+qkj9NK0YzKBdSJOB7+4K8JTjdmUUzAN/IEtgp5jyn/UB6sMXIUMxN6piLWhLagfMul9+KWzXCUH5KsVoBdMt5NqsfWltcjj4T1g+8jnKF8AZyx0O4lvCDMMXVtgJGv7HX2J99TU3gfiJK/Fx6yRZgzxu61k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2wttltx4DjHaOYM3fM6bE1maANdFS1CW7rJA9+Qw/+xRKjdwm990lDMqgC1E?=
 =?us-ascii?Q?85FD1nE/3bkiI2m8QZy5eIAq4VFwrvJ3z6JutQ+yoAkw50giDmZPE0rW/zcm?=
 =?us-ascii?Q?i5i+gdg+5Ym7rSXX1nLyDtc0oqiTAeSa6x7jqdesGL1R6GML8wLEVwyySOL+?=
 =?us-ascii?Q?vAUrM9r+5hAIKz9L4wnLblGm/1ipaEm17jo6p8Mx6cEGPK+R+Gw5/+eTUttX?=
 =?us-ascii?Q?A4rnpMh7b7dNABc8Zu/XOYmaRd5hdWX9ym7JuON8L+kaJZCvcObTJKar9OHo?=
 =?us-ascii?Q?sSECojqWxigWor+L3T6s57CqxPzdnkwTJQvMqPUZcYNoxFfRTCZMoPXWPDyt?=
 =?us-ascii?Q?Lt/WaRCwyUoweoP0nqxIW7nXtCFTmaKEEptWwH4o1QRFH20EfscMIQNqzRWt?=
 =?us-ascii?Q?KP3xbjTGp2fuYAB/Ah67s78FC269/h4FJ2Lt//qYoeDmfu0khDvreO/NQr40?=
 =?us-ascii?Q?MLUuxryk1nKr8xqrvIxemoechGiAx6FAuIaSzJa6Zm/YI7RfSF+hd3PEy40N?=
 =?us-ascii?Q?hBoS+7jiTYg85TfLujQYFvLZf16b4LzsVFmraErH7xGmwHFCPkCkpMu1kM94?=
 =?us-ascii?Q?4fzfiOD+4ZCbI2bKMTtU0oh9XrRWHFY888YYKyd1g5o1WISNA6LicDzjxmfV?=
 =?us-ascii?Q?rroK7UtYkCLkw0kr94DwpTDNSGOdMYqHuJFNL23mjs4jBi42swj3s9y24NWU?=
 =?us-ascii?Q?Zw44FXXqfhAxvL21azcC1pwCjOKNUE65Ubc82GRUW6HHkZT7u7+sAF8uK+xw?=
 =?us-ascii?Q?3pu8/JTISylIEvPe/LhEPb+5I/ktNSsuN/e2zeGCGkr5N70SSpbdKpTmAxuI?=
 =?us-ascii?Q?Ld8ee6VjEo1ij6J+E7RmwT/kvcldMQIImXr+BrJxbBoVCdr4ZVAdG2T6T2y3?=
 =?us-ascii?Q?hm2h9puvri8YzEKZCpw+vPo8QT4Ggncsd84QkLfeqK+3eAuWUqw+okdvhZ0D?=
 =?us-ascii?Q?3qwU4o28vkqVl3WxQ0N+JpiKgM9LZHY13cBwr3E6Qazw2Rdu6D3htce4S7wt?=
 =?us-ascii?Q?l9tR2cgm6JU3X4YNjH740BHMLo2QnKGsdVKMrJhgtq/0g4ipUXqRAdrXIAA6?=
 =?us-ascii?Q?BPEWdX6m7QHA3pM/prJjv8qLsIgIQtFZNOPclPMnXUjuPhstWhjcyZRlPCZz?=
 =?us-ascii?Q?eRTsBhW007x8STGh+J3FG5hQP9fnT9Tl5hjVli8kKXp3zzdVzQCUxVDjM88F?=
 =?us-ascii?Q?g/aEYbVokCYVbZGMLQJTKcxcBYwBS5qT1yQEp00UE8xLbyIjH4L9OvGANx9S?=
 =?us-ascii?Q?y8gVP5RyTBzSCcLD1pA5qV/nwasA5aEmfHyH9CD6uLoE8gEhILRxV/VGRhqT?=
 =?us-ascii?Q?Iozvt33cLxnakfPtSMTSuiCrIdKrhoydSmn2sSpPufWMUIssq3/Rn/Bg2O9i?=
 =?us-ascii?Q?l8YFjYy35ktlrt/NpfFKIA82ahe0jlXKQdMM46N2Oi/sHe4AQJqvHI1B8Zwa?=
 =?us-ascii?Q?FK2QDw+FIn6G5bflIkAg96BnQ8Lwo3EYwcPWyfFxGxRjkccYYgMyccA+nHMc?=
 =?us-ascii?Q?aN2PnXrvlmj3Nz4P2TZb/Os2oG+uWMNsIgoyU6DRaiCD1okCj+DJwp13Gx7Q?=
 =?us-ascii?Q?u9dQPgKqeCpx9USPPDpe3kslkjaF/rZz6QufkcmMnB09dEazXPo4pn9HQIH1?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec2a75c-38d9-4a58-58eb-08dc42e7561d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 22:54:13.0753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jiqp5kpjUH9LSryXOJ6Q2TMyauaEXAA6DwT2yMaQ4MxwZuijwSNvb/RRgglqSuD5fD7A9oc7mSwIoBb9K+j0q3tBvOdGoQzRDkXvZBTNENg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

On Wed, Mar 06, 2024 at 11:36:39AM -0800, Lucas De Marchi wrote:
> With dynamic load-balancing disabled on the compute side, there's no
> reason left to enable WA 16015675438. Drop it from both PVC and DG2.
> Note that this can be done because now the driver always set a fixed
> partition of EUs during initialization via the ccs_mode configuration.
> 
> The flag to GuC is still needed because of 18020744125, so update
> the comment accordingly.
> 
> Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Dynamic load-balancing disable hasn't landed in i915 yet (although it
probably will soon).  Assuming we wait for that to happen first before
applying this,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 6 +-----
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 2 +-
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index d67d44611c28..7f812409c30a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2928,14 +2928,10 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
>  	}
>  
> -	if (IS_PONTEVECCHIO(i915) || IS_DG2(i915)) {
> +	if (IS_PONTEVECCHIO(i915) || IS_DG2(i915))
>  		/* Wa_14015227452:dg2,pvc */
>  		wa_mcr_masked_en(wal, GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE);
>  
> -		/* Wa_16015675438:dg2,pvc */
> -		wa_masked_en(wal, FF_SLICE_CS_CHICKEN2, GEN12_PERF_FIX_BALANCING_CFE_DISABLE);
> -	}
> -
>  	if (IS_DG2(i915)) {
>  		/*
>  		 * Wa_16011620976:dg2_g11
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index d2b7425bbdcc..c6603793af89 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -315,7 +315,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>  	if (IS_DG2_G11(gt->i915))
>  		flags |= GUC_WA_CONTEXT_ISOLATION;
>  
> -	/* Wa_16015675438 */
> +	/* Wa_18020744125 */
>  	if (!RCS_MASK(gt))
>  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
