Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF1C7AEE7B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 16:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC0C10E134;
	Tue, 26 Sep 2023 14:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2B310E134;
 Tue, 26 Sep 2023 14:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695739098; x=1727275098;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XWsjvL50sFkKOt6WSHJSK6lnHDwGTfxBEfEvbWjjgzI=;
 b=V8zHxAfI0R8J2KzmUMMQIP1uSVowcabLc0JWaq6hsxX3eTeA1u2n3w5k
 klpV+RfpILhoFB+wFCIHIYa3+j2zj+hXo6oYrQeYBBFq8G4wpEhpq9HNl
 Xwkrkv5SjCx9kocwHUKkmCT9JOwYmI2VpErA0q9tOCrrMP0q0coPfuxxu
 Qx7ZSY5C1CkygVFXcjACIPWLnkue3GIFg+OJDF2cMNr9PLMn56lvlQJoM
 WLE1oKMFwzuC81BuRpE/m71vXhWAAvJhDmBVGqR9UGj8Gd/0Xdv0syXZo
 cGXTkzn2B9SVfVdpfw1gBwR4BOmX1ViVn+ccr1oXxwVNh1o8pE/xIRAmg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445709883"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="445709883"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 07:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814502880"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="814502880"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 07:38:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 07:38:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 07:38:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 07:38:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 07:38:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdgvnExUbJ3VbjxdG/zk0NIloGU6+5Pk7T930HzBY9JmDJhQKQW96L7/NVVScv5gnBFfEqnMwfI+aqPLWI9jFhZ7WGCKUIW8nnvHqaAd+8qrxW7DLqOwjSNXqY0yUhA9zM077rsg99MrJQSkVW4MV8EXbZtNB3bXKWsIxvjkvKt+pS1ooA06Xl+lx+Y+Ip5G1AohDnJgHu9QTJhb+sraPVMbs5s2QYbRbNwTJ/++wnSYbbCQ7EK2stbxsy7cV6Pl4lU05vik70AK+te6CT5KZsbUPWY9SG5PKWCxWnT4UAe1qc4euE0UVJlewGK/GkRDCXnPzPYZB375PxRO4mSd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqq7PTKZavZ1ekSqL4v3twTMIg9WbraCNpQX4rtyjO8=;
 b=Fhjbo6PNwl/xxz1KuktBlmd7HeI0voUeaHk4PD17LTkKXFsCJ1x2ecdx6sKokAdkj9ak/V+L7bGRS7zgs8Qt7vsC7r6yB1xe27jsJlS27942CZpzO1VAzhrwkKEoSLmSR0vtgaPLPgEv28MWJAK3UaygKPbyD471uy+0XTnX4JfAJCRqg7JSFSSCqJpkwaFJEbEmWwmqG6rxLPhpyPaWnakS50bPNE7PX+vBvLpdduTzaoec47EwtdBLxuE4ogub3FZwkp5LSMFwxadRXIfX28evRsx4OHmpggC568kvMmwASbuxtEi5/yO/wEj20M5b3XI10pvTyhyK909ZbzcUzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS7PR11MB6173.namprd11.prod.outlook.com (2603:10b6:8:9b::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.28; Tue, 26 Sep 2023 14:38:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 14:38:12 +0000
Date: Tue, 26 Sep 2023 07:38:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915/mtl: Skip MCR ops for ring fault register
Message-ID: <20230926143809.GG2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230926141842.8681-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926141842.8681-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS7PR11MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af261e6-ad33-4017-a36a-08dbbe9e360c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KUfqb1C9Bsll+F11wk/j5wwE95slb6cnrejaweJEPFbpORZ0L5lumxxnuZDYcUH3/OJF5evuABESPac6sMf/6XX2Go26wq9q4Ax1YxvyU+9g7HThtd578MpRpBeQayWndECCRaz0im+xav3QZb3ZxDGGLh+LVElUrt0QAg+klYeVvYyCtSpDPOwGRVEjvz3J6bOg5ndueRXqDm7miK+uS5UWyCfN4EKK1+t4DqT2qqtwKxFw5xWQzOIZJ4o6/vYevadrUmKAQLdzcDYdcIgDUIWCJW0vf+ChDQXD8q0FjgKuPUeYoh9jCI9Se5HwuxHMeN0lsysmRZXlgaWxr0Ah8e6XMNt8wrheyaeKaITeafqw7g8kHGzY51B+wuroMzY1dc1VGvJ10S6+M36zNTP1rTmtXqCx/NQr+fLwOt0PGM44Hmi8g0MjvUqm/U+qcqgfZsQw2A+gmFQiFRE9gRuDzPPVGK6IdhrfUizAxoRSdM6qgq9eczjPtIu2T6p1qIkebJ79OeuC6DZGPLJu/HM/F3j2ofOwk8WljaqAfYUp5YiYy85+/25Qq4EJ5+aBdz+Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(6666004)(5660300002)(38100700002)(4326008)(8676002)(6862004)(8936002)(33656002)(6512007)(86362001)(6636002)(316002)(66556008)(66946007)(66476007)(6486002)(41300700001)(6506007)(82960400001)(26005)(2906002)(478600001)(1076003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vtd3GBljsm5MovGbHtD0lpUjYF0dKR1hRNiYzBnfBXZbUhPAlbb9526zFRne?=
 =?us-ascii?Q?+jCFX7WSCEKUC3bRA5Mn+y++NzqXUO6Ud3DIqhiUlwITxg7R5zKU2+gjUXlg?=
 =?us-ascii?Q?1n8bjgQag25CgVqOWCGh4XY1KhfvRRtBEzUJporEiqtkj9LLc0tEig7dRN8M?=
 =?us-ascii?Q?huUpY5Akx+xmFa/HI9O85aym0mqCe/33ddpVQa26PXqiHHl5uGc7COBlvRim?=
 =?us-ascii?Q?nVO9Af2/ssOJztsaAXVBwTyzhHOJYA8VgJma1sy4KxEIWV4qZYPjsxpf/LhL?=
 =?us-ascii?Q?+GTLyuDWyj6gbjtHBV7PmaJBwjutimHeJm0xkpN/HJifhtPjbiCM+jqoDegj?=
 =?us-ascii?Q?QZC0Pptquu941sonzq8VV9rUfjykttpMGAeEXuVbi0sIVlCs79U2fMKxVxV8?=
 =?us-ascii?Q?xrWDWldserodpgYll4+C8LOEeshu6qI708uaKA9svWOC/GJpRs7ryccnNaTU?=
 =?us-ascii?Q?4eHkrA0eV9xVh8ZKqPek7tUfsX/s7s6Ohn/DqUmhUa0X+utjsR7B4nAxY762?=
 =?us-ascii?Q?3ML/9FBhNLQI2jEHI/YMnibiLJ/NNuZRxrxfAg3vEcw9e/0KKsQwPYY8kRwW?=
 =?us-ascii?Q?CGYUgU6EIPBEYD96pVzzHS0YyQN5qWsNUUbzYXLyQyaWmwjhFIO+aa6zQ8dF?=
 =?us-ascii?Q?2ATdTam9/G6+kCTd1K5czRIOooPfHI1e9+aG0lR7Gr6+POLOyagxMM8KOIPl?=
 =?us-ascii?Q?yb4toTOH9Dxaswr6Zng3XTrX8ogNsJjp+mMjD4Eu9+qylfJFpZip12OgmUbx?=
 =?us-ascii?Q?E2s87Z0EP2xhaKTzDsoCqj4Iur/t1DxWEMwTLEmpJz8a6wVv8kVZjJMsv8L7?=
 =?us-ascii?Q?QZRdGHuC3GxPrsezlhPIlTVXLVS87NL4hBw/vGGrVE3ykTCiJarqhYhx29Xu?=
 =?us-ascii?Q?nf0nodfl8ozWKEX645aqF1BZarBHW8jQ+Gy4xke6BrE1Tu4W8F1Uy1bzd06p?=
 =?us-ascii?Q?VtAlWL5Ig6DfJmQbHTXRM8+QYmdVdM2JKr2Dc8YYyP0q5tzY/PwcYQ/pSbT5?=
 =?us-ascii?Q?44d4zcdQ4GwC1Z9xMSyK9rTCibaWg73n3RTnkm54wTZR/kXp5Gf2jSjddRBx?=
 =?us-ascii?Q?bQse7LPqLz1OnOPTjWjU3pGj4cyTeSEuR8mf3cv2EyAXBgFqCZ0bglgQMdSa?=
 =?us-ascii?Q?vd5JK66VLqthvgCRRzm8ucYUqw2vPDOS7IRMqqw2BApuSXNV69Ol9PN2VV83?=
 =?us-ascii?Q?vhKxcKspYlL50+0DTDVsno7LUgYgE0y3XUwcuQK5P095+McoFjAWGIG1dlOM?=
 =?us-ascii?Q?ZVYWRyVKirXG9E4E+AnHkRV6wz3w8kzocZ1vQVDAPhAxmrUoA/bSPPWYX7dE?=
 =?us-ascii?Q?L1ClHOSXjWnOKqggYnJBMSD/3WhDGgwwa+UXKVmMKSKFn6eIcMRy55gwPkqf?=
 =?us-ascii?Q?YE+taw+GJrONFxpFNaPyGhtgfgN96aJBnW9zYLwdD2kFtKTKqYqCt4LyzNAF?=
 =?us-ascii?Q?TyHc2oq7pkkXRBpsGXXDs9TvppJwQrZ2ZltFQvsK145izIj0WYOIgQtiLuM2?=
 =?us-ascii?Q?/67KpkfgPw7H6kKKTtK27z9KMdrYLoBZvs6RNeOcLm8DaTmDXhY8GN85oiM0?=
 =?us-ascii?Q?4LBrTrXrvsxcBJ6wEsEd/+B18Vb24vNUQpVHIxqgOYf7ZvETnwu0yqVFBATo?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af261e6-ad33-4017-a36a-08dbbe9e360c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 14:38:12.6352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ewj2+hGd3aVmjtVqNQqwn+SF1Q+eN7f4nEH2xVJJPhC2OaObx/z4tafIlLHZ7Cm+TsWOxrdt+Wr/DB9NBhKkQAdPAvtDCILdsMUvyMS7YaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6173
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
Cc: intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 04:18:42PM +0200, Nirmoy Das wrote:
> On MTL GEN12_RING_FAULT_REG is not replicated so don't
> do mcr based operation for this register.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c      | 14 +++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
>  drivers/gpu/drm/i915/i915_gpu_error.c   | 11 ++++++++++-
>  3 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 93062c35e072..d4de692e8be1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -262,10 +262,22 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
>  				   I915_MASTER_ERROR_INTERRUPT);
>  	}
>  
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +	/*
> +	 * for media tile this ring fault register is not replicated
> +	 * so skip doing mcr ops on it.
> +	 */
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&

This should be checking the media version rather than the graphics
version.  I.e., "MEDIA_VER(i915) > 13" since it's possible future
versions of the media IP may change the behavior (independently of the
graphics IP versions).


Matt

> +	    gt->type == GT_MEDIA) {
> +		intel_uncore_rmw(uncore, XELPMP_RING_FAULT_REG,
> +				 RING_FAULT_VALID, 0);
> +		intel_uncore_posting_read(uncore,
> +					  XELPMP_RING_FAULT_REG);
> +
> +	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>  		intel_gt_mcr_multicast_rmw(gt, XEHP_RING_FAULT_REG,
>  					   RING_FAULT_VALID, 0);
>  		intel_gt_mcr_read_any(gt, XEHP_RING_FAULT_REG);
> +
>  	} else if (GRAPHICS_VER(i915) >= 12) {
>  		intel_uncore_rmw(uncore, GEN12_RING_FAULT_REG, RING_FAULT_VALID, 0);
>  		intel_uncore_posting_read(uncore, GEN12_RING_FAULT_REG);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index cca4bac8f8b0..eecd0a87a647 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1084,6 +1084,7 @@
>  
>  #define GEN12_RING_FAULT_REG			_MMIO(0xcec4)
>  #define XEHP_RING_FAULT_REG			MCR_REG(0xcec4)
> +#define XELPMP_RING_FAULT_REG			_MMIO(0xcec4)
>  #define   GEN8_RING_FAULT_ENGINE_ID(x)		(((x) >> 12) & 0x7)
>  #define   RING_FAULT_GTTSEL_MASK		(1 << 11)
>  #define   RING_FAULT_SRCID(x)			(((x) >> 3) & 0xff)
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index f4ebcfb70289..83f1a729da8b 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1234,7 +1234,16 @@ static void engine_record_registers(struct intel_engine_coredump *ee)
>  	if (GRAPHICS_VER(i915) >= 6) {
>  		ee->rc_psmi = ENGINE_READ(engine, RING_PSMI_CTL);
>  
> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +		/*
> +		 * for media tile this ring fault register is not replicated
> +		 * so skip doing mcr ops on it.
> +		 */
> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
> +		    engine->gt->type == GT_MEDIA)
> +			ee->fault_reg = intel_uncore_read(engine->uncore,
> +							  XELPMP_RING_FAULT_REG);
> +
> +		else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
>  			ee->fault_reg = intel_gt_mcr_read_any(engine->gt,
>  							      XEHP_RING_FAULT_REG);
>  		else if (GRAPHICS_VER(i915) >= 12)
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
