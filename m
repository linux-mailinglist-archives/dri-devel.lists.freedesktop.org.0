Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD056C3D1C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 22:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0124F10E873;
	Tue, 21 Mar 2023 21:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F06910E873;
 Tue, 21 Mar 2023 21:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679435736; x=1710971736;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ivccHhLp7z5r8NUv74IrBDe6vnjOvhytRKVQnmGWlv0=;
 b=frStv4pgD8J8dGqs31i2DWlGWBr647UqIAX27qClaWX70CeVm3ddayZk
 nXEAndGknpQJhLcN+H/M10rU8kia/zQh4z+9MLT2En8YxXu4wDsDRHE+G
 bVE3G2UBWjwEhSUY0yrDUCbCqx7nlfENOJSmgGsUfBkF7owtQMpWG6cpP
 w8vigb6piFxD9Az3r9KT3QwkAPZIfEu243J2XN2e1fPtUrIT8NCFvglH7
 H1FFxgw7GqkSuwhcZPfvUpc3gyR3bZzwxda0fWI8KYgRmG6zhAiZDru4h
 DkILsxPUGegDloxGCj1U970G9WOun+4UvjM1SzHgShKjXEvtdfjCMjDqW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="337792120"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="337792120"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 14:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="711988948"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="711988948"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 21 Mar 2023 14:55:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 14:55:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 14:55:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 14:55:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 14:55:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxXVC1J21QOmxsINO1vbWFC7aFFAE64RheAeWTpa4yz6CTy+wPfZf7ZTvpazYPNTEuO59hvzaHGcrlKu403qIU70HkzhtjS3MrBoSohY1hOskQs3OCTKw277e13nfosRBs/7CjGkHSHXnWLEjsTPWg8bqtAab4ftHcrhrGBc+nQMM+cvZJYYOBMr3Jvj6VMI7VIiB4K5eAxvVqKsOeYIvLFLng6pbpWwL9tpELM9R0UCI4t48DlorxDTJgjJNQ1qlJOllGU8XIAG4MQhymdfiGlJXZKezwZbC6BWTi1BLfCtMCX9liMlU/kLiF4G6sySioHv+f2WgkMrXtOLMaVTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Fgy6o75qo2IWoCvYGMJ1OfDgOKJ5N9VIEbXAFMdVl4=;
 b=cNILijq9x/4zvzRdNBLsewbGbgw3nmc61oqd5DAO9H+5ta1BrKB6KTvOgLLKzmjEX5B9CtFRbiPe/VataXTko7mIsxhvtXvmuFU9oRttW/F7IunauMXON8d9oPfocQLG5nXC9Z5uTcqxkorE+tvEzGzZxAU45mX9UIUNwJTnTCJOgv3zIYNK2gOJ2UH059J52KKngTDQpmgF1NTDG4Dju+UOS15UKcMiiRSvuBnwLYMCZNbIZEpuW2I5lnA7m2aQHXsmwJP3AGdvUAYsvwrVQ4GpFi8MDmHeGGIKKCiSegHsOwbyv8SDzn8/0kwxk6u00macgGJs8w2xI/Mcv83NxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB5326.namprd11.prod.outlook.com (2603:10b6:5:391::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Tue, 21 Mar 2023 21:55:30 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 21:55:30 +0000
Date: Tue, 21 Mar 2023 14:55:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915: Sanitycheck MMIO access early in driver
 load
Message-ID: <20230321215527.GQ4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230321170936.478631-1-andi.shyti@linux.intel.com>
 <20230321170936.478631-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230321170936.478631-2-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: c4290142-b229-42f4-39c1-08db2a56fcc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vuOK8VzmYPGbsw9ArZdH5xASiyjyapaIyZ0Ff3R+VIjJbl6xSRrkX+FxIi2Bdv72oMitKcjq8PPLVh3lX4t+3d07BQV7F66VfLeT8rTZZJJa7mS/4E1WxMcspTLw2satq23JCKIyLbi07+mAgMNHoFAkUeB5hMGaAq+s2f5h25MfGLE7IsIi8Y5Cbwuj5plcQvBu+Uvyx/uWWmW3bdFJIvnDEauZhQ5JDk3hYBoJ/A9pOcfw7qMdwK3V/64DpKGPtDjOjvb8jNYu3YRBlun65J0PNPTQxWT3OYUJA1lvQcGbcHonXCWiKjR0U6WjFp57mdbNuoPRz1WqDhq9pmksYezSia5fyI72b528BznEBL10wFlgT9P8tRsXvo+prS0ATisgTWmcGgdCUvwqTVM64+wUES+ouredIl/NKqEBk0xQCKJJ3FnnHn3logQbLK5zNMcqLeCQmtUkSjQiR80kWdvgDxqfA5hOqAKCMc5satZ/qfK9oxSzFabm/6ejzV/+eRP8U2714t2hq1gCR5KwHdWPObU9c6smQdbL6Wtgnk0kPTOqmj0LD+Mg6gTW1T9eMFB2/ub14N5HaD29O//JZelwgzVAHTFvkxNKl+UGXM6nrowOP9K+Lzq6qA8eaDIA4dXknZ82dnI1U4vQ/shkNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199018)(83380400001)(316002)(186003)(6486002)(6666004)(6512007)(6506007)(33656002)(1076003)(26005)(5660300002)(478600001)(8936002)(54906003)(38100700002)(86362001)(66946007)(4326008)(2906002)(66556008)(6916009)(82960400001)(66476007)(41300700001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TQMO3ebUkeiLY1KOTmab0VZF/5k8TYW8rXfspY+gpIjEzzeokDF62CvfC5fh?=
 =?us-ascii?Q?10D3ErW1m5sBFp6M1rs8BFwFzLeRWK+3oAAyDl8e94KqSduJM5Cayc66lNdI?=
 =?us-ascii?Q?P3ANASRU/p9nEpHdrEqIClyH8v+tN4aOGEzA6hAiFk8LdgEI2dtEauBYSole?=
 =?us-ascii?Q?vKPjX9joJ+7DLJ0ll05lmsuA+tH2kqIfXeLCXYJUo6/Bmr1zJzLVfrnDOZoB?=
 =?us-ascii?Q?P/llJ+fTDN6UlvHE1WqnVF9cbItrzh3lCXiBxVJcOGbydgSMkzNDz04WSsa6?=
 =?us-ascii?Q?uC8tyiYhp1wlcMrwfiA7aepYzsYUKNzYCYqdz5Nl5fsD4FqgtAMrO3p51V2m?=
 =?us-ascii?Q?swsg2LobL+hoy+LrJ3nys/HjNAVOVtlf0nF/Wyyhodzu6jdvjcwc2GtUB4l/?=
 =?us-ascii?Q?BMgHxl6liHSxez2NCXr94E+7STxfod+70Z/INC8LrXmRlKfoszwTG2hEGJCS?=
 =?us-ascii?Q?KnCuQUZGgVAOFRfmc1s8Rr23vHFvUAFY1kw2dUeU3HDSsmGuxkJFokd9DD9m?=
 =?us-ascii?Q?ZlVqKEaVeDff3tAVuJn4p+PTJ4PtQPqkwmaE3qb9BcPBJNxfzl7IEXfIddMD?=
 =?us-ascii?Q?i6yGxWVYnfc31nOgC3YVSB0+QiFXSqyeEaSeRe7zFcvCGl9EYLkznzqAuEUp?=
 =?us-ascii?Q?3/w28d6mNEe4YskOaml9srl2Y84dSyZuizwtxRD+rzikO0VS/RC1vhJQf9K6?=
 =?us-ascii?Q?/Ny5lyGQDL2n2wR7dLVLwA1eh93PrFops8nOK8sxFvmZVA7d7eZ9wQsfXqhJ?=
 =?us-ascii?Q?GQ4dEIO9q1Ufyw/KKhpLlXJwu5Oh1b4G66itaQdyXDZx8D25harFQXk/dbcb?=
 =?us-ascii?Q?9zRwcqjqa+xvqnOaaHx6jIvTve5DxbjIGmJsXzzwTNPEtZG9cTAQQoUJW9FK?=
 =?us-ascii?Q?BkVH83amTY98ZNRKQgQeA4XgpeLDU3zfNDEEUQ3FKW7W5h3CVxaEJXfOz56H?=
 =?us-ascii?Q?3v7g91TmCLwbUZ993JrvoZKA5UnvflXQUhiyFTdjTTq0bOXcrQIYA6OnW2Zz?=
 =?us-ascii?Q?Q9eNz/9vZY54oWL89lsWnEHblJa5SGvkyVALHS46Kvvz94Sk/W39LwexksCD?=
 =?us-ascii?Q?tEquYQskcd+giwnRexCZjXfkLc0BKikjgCfYQ5w1iSuWotMdtnK6iWDrtXNd?=
 =?us-ascii?Q?Vtas4BWRSm6RgMpZnUqt+tzw3o6RIk/LU9JbwSEZpvD0dUWBoYkBrrweEVX0?=
 =?us-ascii?Q?eRc+3g2JB3mo42sIe/wXYs0nC3PReq9spLeyZz0b3n9PKPElZk7Mzlvacp2Z?=
 =?us-ascii?Q?MStmTvB7xeV4YL4IWLGm9Km7vR454DeSwtCk5ygp+c8/wpwjP0RsoxUymdSa?=
 =?us-ascii?Q?tpPJCg/BMVFDYgg72g+lMggIASlcm0VYqWQn5grucYrCtrf1fXr/DuG6zD0h?=
 =?us-ascii?Q?2JkdB+YN2/GJ0xF2zKbA3WeKaQTht6nmX0qxtSBmWeSO99eFW6pMS1IcBQZb?=
 =?us-ascii?Q?UFVh4ZrzgDy+6n+VEDs4/1zazyG4hE2nSL9TbDHGk4RCeRjX5MkaAXCPc8M/?=
 =?us-ascii?Q?b/COlX3/Ks+ByZLaeT5FFYnE689bfRJpmGG5Udnh9Jr4c77n6ZW4wEJ3ke5E?=
 =?us-ascii?Q?PnvgcYIoL3BeWFBZ9H5BLr6c+qqLfemjshoVVX39ACEHtBb7OyQCCq+HZXgp?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4290142-b229-42f4-39c1-08db2a56fcc4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 21:55:30.1204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Cxf+Vae1vVXEZgSN8MX0lLknCx5wWz1XlgbP36oKYnc3+eJ7k6CJkgxU7/im3QLpCbicBUjpc2LUBGTEMiyOFS+5wN2tVv4UOxpthdPrpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5326
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
Cc: Andi
 Shyti <andi.shyti@kernel.org>, Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 06:09:35PM +0100, Andi Shyti wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> We occasionally see the PCI device in a non-accessible state at the
> point the driver is loaded.  When this happens, all BAR accesses will
> read back as 0xFFFFFFFF.  Rather than reading registers and
> misinterpreting their (invalid) values, let's specifically check for
> 0xFFFFFFFF in a register that cannot have that value to see if the
> device is accessible.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/intel_uncore.c | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index e1e1f34490c8e..0b69081d6d285 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2602,11 +2602,46 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
>  	return 0;
>  }
>  
> +static int sanity_check_mmio_access(struct intel_uncore *uncore)
> +{
> +	struct drm_i915_private *i915 = uncore->i915;
> +	int ret;
> +
> +	if (GRAPHICS_VER(i915) < 8)
> +		return 0;
> +
> +	/*
> +	 * Sanitycheck that MMIO access to the device is working properly.  If
> +	 * the CPU is unable to communcate with a PCI device, BAR reads will
> +	 * return 0xFFFFFFFF.  Let's make sure the device isn't in this state
> +	 * before we start trying to access registers.
> +	 *
> +	 * We use the primary GT's forcewake register as our guinea pig since
> +	 * it's been around since HSW and it's a masked register so the upper
> +	 * 16 bits can never read back as 1's if device access is operating
> +	 * properly.
> +	 *
> +	 * If MMIO isn't working, we'll wait up to 2 seconds to see if it
> +	 * recovers, then give up.
> +	 */
> +	ret = intel_wait_for_register_fw(uncore, FORCEWAKE_MT, 0, 0, 2000000);

It looks like you lost the check for 0xFFFFFFFF specifically.  In fact
with a mask/value of 0, isn't this always going to just always pass
immediately?

We don't know what the value of this register will be (there may or may
not be some bits set), but we need to make sure that it isn't 0xFFFFFFFF
because that means we're not even truly accessing the register, just
hitting a PCI BAR read failure.


Matt

> +	if (ret == -ETIMEDOUT) {
> +		drm_err(&i915->drm, "Device is non-operational; MMIO access returns 0xFFFFFFFF!\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>  int intel_uncore_init_mmio(struct intel_uncore *uncore)
>  {
>  	struct drm_i915_private *i915 = uncore->i915;
>  	int ret;
>  
> +	ret = sanity_check_mmio_access(uncore);
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * The boot firmware initializes local memory and assesses its health.
>  	 * If memory training fails, the punit will have been instructed to
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
