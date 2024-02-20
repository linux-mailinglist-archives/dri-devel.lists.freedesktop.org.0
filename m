Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E253985CC1E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 00:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E5D10E5B3;
	Tue, 20 Feb 2024 23:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jerwZNgb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3680410E5B3;
 Tue, 20 Feb 2024 23:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708472365; x=1740008365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1I0FaUHz7kEH/d6iJgyAMmWLkqK7kenEAyMhUbr+S4U=;
 b=jerwZNgbLs4l6ci069+WkTHcigejgpoKR/pr/QoZZeewmzUngBO6VUKs
 tkANwjEeUTQdgMc2DODaIe0YMGy9OQHSui6iikHSTdgdLK/BqnWCth/v0
 BZUGICSWtRkl09b7W8uXqAzEOo4I1RJaVsnaDzyaWyDogr2WFiiso3Sln
 NhEzMB1rNoiMAi62Nioj25ow0VHvDijxD6Qxnkgod4ORSYGwuaJA/baOA
 YonKnBX1sWwPsZlymqSoI6oT7CR21HLa+CstpH8+BuBjZ6V0AFE7CecvH
 CovY1WhBqfIN7YEsdTzREvnDPTyQzXWrPiY3Bf3HgVorLkk7M7ycxcX9J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="20040309"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="20040309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 15:39:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="28099917"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 15:39:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 15:39:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 15:39:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 15:39:23 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 15:39:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeR9pu4WmZXp4zF5OlIvDEntEivhmLA7uNpkjrPVi1gbxsT6gCiF1Sa3p7raXfMrMra+f6SHG1G+bnF6iSghxze10OZmZQTKOM8SURKzkkQm2Sw/IK7ZDQEvfYcEv9J1++ids83ZoQiQaOA+cxs2X7k9yt+4jT28UaLa1cAbkZ1i4T+xkyRC94MhB+O5P+EllrxoOyPDdtDuDkA2Ym1bO1TuHb3Mo1GaBItQ3/+mW5dOZ4XiCLriJwz5JEDJSPtI0Z0VA/J6kMh6XOonE55gkM55+X+nFkVVLAz4KB3eYzu8un31VgBoM3BTdEGPZ27he6WBHxUgpc/7g6v+XakTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URcxoBB5XGNjk/mz8895MSLNizScGPcTKf/MilKsy6U=;
 b=lPdHy3Dt9qpukxoMelV3mpUo78Z+Lk8v1QREYsmM/fB7Ja3Zcd9mtFubN01Fm43gYcUzxtRH2Mz0HGADNzcbGjU2Rs4VIl3fFR7QxuAR/mdcyApwJTJC/n44tOJ/obIXoi5UYmSeFpcdcPIUh4u+rn4zTUgJ56UW3ukxa4fjhGNgJebsJxc5AEx0AseUM52ItPZPYZzhyLuUb+OZpLmQO2r1RgMCFxrTZIgji0mzJxBogrIno0DjR6SEXIzc9nEoPDWgMBbRWOpwxUyyGiEIJZSKBIIPajYuaTaQ2U3DtTO+JZ/IPLul5sRhlxQ82QmeJCaUdnwUiVyMrxz1yluxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Tue, 20 Feb
 2024 23:39:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092%3]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 23:39:21 +0000
Date: Tue, 20 Feb 2024 15:39:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, <stable@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/i915/gt: Enable only one CCS for compute
 workload
Message-ID: <20240220233918.GG5347@mdroper-desk1.amr.corp.intel.com>
References: <20240220143526.259109-1-andi.shyti@linux.intel.com>
 <20240220143526.259109-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240220143526.259109-3-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::44) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d3568ca-6208-401f-7aa2-08dc326d2999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwQmOyDGbSJmZ6kHkH9XTfBWcHu3ywOrIqRb5oh1F2UbkAbKeD+bqBM/a5wFDuGvP06Qc3wSoZpEPPYuYdyD4hK122HqBJHzxiOsPzVzE1SuOB5yJKWgoEx/u65HDd1yqJZ5WOMc0ktdzxuIn464ZsbcWg5FZOgN8AuiMr9Hgey4KrRm0YP/0qVOPtP/404jCIwDchaoMJnmMB3YRr4X8AnuFMXDK8SYDhzhGKSh/e6mHun7Rv6M9RahDRvDYl+zbsFyhzPXSA5e3Pm/xt0bxYoL9XfGb2kAozJhTFYQsS688/PevIU14BYA548jv3KZBpMDmFIU7x1Td5Mbb1WULwS3JvgC1R9XFlH3Zy326PyDlX90MefyMVNDerU5QR29zN4ESUpXQ3ehLHFQ50YO8+iD28jEThAtwabwHr58v1ex3js4YtuCZ60TFNgGDyEAJlGTnpM139S8mv/dr8cU6rkU6csOF1wl2zKi89o8EBWDUedMuE/L1g/Zt/o9wQoqF/ra3AZvcRjpLs9VLEPYGdottAAeEUscMv/3+PmVmsM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ijy0+llwf4YM5Rye9F7kR5RFb9E+GEjOgpy6pBhVgKUtiousMdDe7vz9GaX?=
 =?us-ascii?Q?UU1EMdnlmwE73FEZRFYUyVWkKV/zO2Fiz76gqg9Ep8Lb0DQ/93HI47Md09tf?=
 =?us-ascii?Q?BUexvTWjp5yZNRmOxCyuaU2Imvn0VuqzppOGKlj1wUsP+MA2z5SE4bZKyeYW?=
 =?us-ascii?Q?zfLks9UnEsiZSOfkBiNSkaqphDWGkS06617TjxcjYAT39Zc2PrN1Uwl30t/l?=
 =?us-ascii?Q?RCYvT7TRsrzELZhTRNMal+LwjqhJKEq7yIxAJ7YCo4L12q9Zci1MGRcxE+tg?=
 =?us-ascii?Q?zIcKTv5hyRmSOKYNclC7vYCCA2rMU9tT0I/vQjXer0j0TlZJWV4c7yrEyqgm?=
 =?us-ascii?Q?hvfGkzD9hXNz+SbzQ05HPb82ff8wiLYM1duhroner+rIC7qeJ9KG7kHoGN8Z?=
 =?us-ascii?Q?ywPXqewOK+otBqHltd24X8VNDVfz0o+Ip+YekLnJwa5bxHrIorfmrKwQEi9w?=
 =?us-ascii?Q?Qo3SJrbEqSfEjD7c4IqDVl580T2c6+61STEPRWu/ZRjNfThJ9Uey4fgKOBrn?=
 =?us-ascii?Q?H95TNBSqkBRpEqqoCgxlLjZTG0iuZ5CJwFtR91Iqb3tg2aM3PkadIjDICPBC?=
 =?us-ascii?Q?IpnPtJS3D9vPs3JUIiiOBemAuaJnrIDYq5R3GcuO0o4qU88MJ3+HQNwLQxyR?=
 =?us-ascii?Q?r/GA36JpHgtgmaQ0HX6CXTKFwuKQgCGRHw8jl0CEKiIIKv2puZWraZ0CBDao?=
 =?us-ascii?Q?hexuG2lSUAMkXunHMbTS7LsGSpxWwCUO9/vfOydEPHbRdGRlboG+m7i39AX2?=
 =?us-ascii?Q?/qIkxK/D4plAik3D1QF+vVgsgMr3hHQntVyxar4Anur2JgVg72CFlA7A9867?=
 =?us-ascii?Q?2VhZGxupO/ZEn/DeQWH5U+TqFtpYubxwwRg0T/K0sjwKiBUI3QVs3qwWxU4w?=
 =?us-ascii?Q?K3jz6LdPKnOFKHydzsPBz0oJuGi6vRFF2ghSUAWAn9uh2iDQaMkh6a/Z2fhj?=
 =?us-ascii?Q?jzMilaKzGgR1ZUIfbzStDZT1QpHx7toTjxjvYE34BfYS5ErsbBLkW8SP/oDi?=
 =?us-ascii?Q?gpz+ZKIYVVMqB22GSQllMn5yfbXakGOV56rBYCVt5lzRTfthmS+8V9D5kLV5?=
 =?us-ascii?Q?K4Or22Wn+MR7VwIHnNqNZq4jH1nprdt1EpFF3HZWATqAL1Tm5ZtcQ0SF82o7?=
 =?us-ascii?Q?KxLwuZ7F5DVBy1v5BxGWfGDrG3PheeuEXv4cJYihrLRAAL5DrShqnFdX/Ach?=
 =?us-ascii?Q?ppPQlleRn9mnNKyscO448TiYP52N2fMukDGhDTcu6+2wIDLnFdxN3wdKRpkT?=
 =?us-ascii?Q?nQpJ30jpYDaPqsDMhOBePkL47Kwpx68J1htbGjtI9S+9JpVk+LZVv0Q+gP5n?=
 =?us-ascii?Q?Zwjs938CKgB0/xP7Y0g9HAZpFsnXQYOkunApmv/hjYw6dRnrgKnJQCLRjq3o?=
 =?us-ascii?Q?7GhY/5FiMPvf7WqABrsErogWTGQsDFsKFSMXiR93fl3Mxw4h+v2eexhtoHCl?=
 =?us-ascii?Q?tBo5TCZXpvexgZPgTRd1TQV1lXyqwyocbb7NIYBh3IhkFDevwY9dRv9LSSbo?=
 =?us-ascii?Q?fGLxfHO/wISXejuFPRtP7MDeWaJgDyeL01yasPDnKbWaN173Mbd95e+Zpr91?=
 =?us-ascii?Q?3tDOXOxxQeFu3lH1auU9ZAMpfhN21nvyXzbt/+tkULqD2TqAy56xn4auoXmQ?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3568ca-6208-401f-7aa2-08dc326d2999
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 23:39:21.1525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jq6KTkTWYV7vSo/lGZc8JK3mg6WjznEk/mU28YsKwynnlb7a+opg2dAu81Tt/mEHp2r0l3B7Y2lmeRehDBW/xCg7m/7VZaIQGpr/IHPCGDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
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

On Tue, Feb 20, 2024 at 03:35:26PM +0100, Andi Shyti wrote:
> Enable only one CCS engine by default with all the compute sices
> allocated to it.
> 
> While generating the list of UABI engines to be exposed to the
> user, exclude any additional CCS engines beyond the first
> instance.
> 
> This change can be tested with igt i915_query.
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_user.c |  9 +++++++++
>  drivers/gpu/drm/i915/gt/intel_gt.c          | 11 +++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  2 ++
>  drivers/gpu/drm/i915/i915_query.c           |  1 +
>  4 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 833987015b8b..7041acc77810 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -243,6 +243,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>  		if (engine->uabi_class == I915_NO_UABI_CLASS)
>  			continue;
>  
> +		/*
> +		 * Do not list and do not count CCS engines other than the first
> +		 */
> +		if (engine->uabi_class == I915_ENGINE_CLASS_COMPUTE &&
> +		    engine->uabi_instance > 0) {
> +			i915->engine_uabi_class_count[engine->uabi_class]--;
> +			continue;
> +		}

Wouldn't it be simpler to just add a workaround to the end of
engine_mask_apply_compute_fuses() if we want to ensure only a single
compute engine gets exposed?  Then both the driver internals and uapi
will agree that's there's just one CCS (and on which one there is).

If we want to do something fancy with "hotplugging" a new engine later
on or whatever, that can be handled in the future series (although as
noted on the previous patch, it sounds like these changes might not
actually be aligned with the workaround we were trying to address).

> +
>  		rb_link_node(&engine->uabi_node, prev, p);
>  		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index a425db5ed3a2..e19df4ef47f6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -168,6 +168,14 @@ static void init_unused_rings(struct intel_gt *gt)
>  	}
>  }
>  
> +static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> +{
> +	if (!IS_DG2(gt->i915))
> +		return;
> +
> +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, 0);

This doesn't look right to me.  A value of 0 means every cslice gets
associated with CCS0.  On a DG2-G11 platform, that will flat out break
compute since CCS0 is never present (G11 only has a single CCS and it's
always the hardware's CCS1).  Even on a G10 or G12 this could also break
things depending on the fusing of your card if the hardware CCS0 happens
to be missing.

Also, the register says that we need a field value of 0x7 for each
cslice that's fused off.  By passing 0, we're telling the CCS engine
that it can use cslices that may not actually exist.

> +}
> +
>  int intel_gt_init_hw(struct intel_gt *gt)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
> @@ -195,6 +203,9 @@ int intel_gt_init_hw(struct intel_gt *gt)
>  
>  	intel_gt_init_swizzling(gt);
>  
> +	/* Configure CCS mode */
> +	intel_gt_apply_ccs_mode(gt);
> +
>  	/*
>  	 * At least 830 can leave some of the unused rings
>  	 * "active" (ie. head != tail) after resume which
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index cf709f6c05ae..c148113770ea 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1605,6 +1605,8 @@
>  #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
>  #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
>  
> +#define XEHP_CCS_MODE                          _MMIO(0x14804)

Nitpick:  this doesn't seem to be in the proper place and also breaks
the file's convention of using tabs to move over to column 48 for the
definition value.


Matt

> +
>  #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>  #define   GEN11_CSME				(31)
>  #define   GEN12_HECI_2				(30)
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 3baa2f54a86e..d5a5143971f5 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -124,6 +124,7 @@ static int query_geometry_subslices(struct drm_i915_private *i915,
>  	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
>  }
>  
> +
>  static int
>  query_engine_info(struct drm_i915_private *i915,
>  		  struct drm_i915_query_item *query_item)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
