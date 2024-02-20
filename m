Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A710685CC0B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 00:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC3510E5B2;
	Tue, 20 Feb 2024 23:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q78ALwMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D33510E5AE;
 Tue, 20 Feb 2024 23:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708471603; x=1740007603;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r/KmHmCztLyGx6oiax5k+1EtUXWM2qNofiVCV+9iGpc=;
 b=Q78ALwMRMyj7GWuNdCpcMHybhjaF5adkgB7CFlBoc2AGfVJ3ZRsq8DeZ
 jx5hmyKTpioVyetIUaQdQNa0w1lJU2YSbwCkAs1FZnqRw7zfjJO49TcE9
 DqfUNbje0ceAd5zfTDNkX8z8XeUp2gFxlNiTmUFqiaMmd6DUNUGfIAKMa
 tMwUWJJa5/L8AKCGlfcHeIaIWONMQqs1/Po5Bj9x5HaLJQNq8Nhot2GjX
 Ft8cY5Zv6BjeCGYZJ1W+gEVzj1pGjochc6Ct8o+Gd0nyV8wrdeEu7dzZ9
 jdmOwDksPhKgCAyyT0z8GfslAkK/EqcGHYsCO1toMT04msbTexf2pPVkr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="14024754"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="14024754"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 15:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="936528761"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="936528761"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 15:26:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 15:26:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 15:26:41 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 15:26:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHBydcCoD4kZxWoa/zOCn3klHK+aX2QPofiJ9io2m9YryxwYy/NLZkRkHn0fnZnx0ZobUjfnYQyYphYzCPSGcjCCFvFcBjw2jeyhh+Vr8WtWhRMV+LkjuQbtnXNYOyILpjheqAsF4BTO4Qb6xuauzuM9alalwPz3cv1PjlrF/opOke36AIkqGXoS+5HyKOrBOPE3AAhlkoqTdEriclbVWN61BVJGYKSvC6rWMKbbzMyo6fFQX9aoChNRmbrGR4xCEcW5Km+NaoiQfzRv37LO7vkGdAeIg4aBqMRJKXzxldnFvlA3QYl4aIjgbMbIh+ao8084JOi03TMnLoRo+WlTpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WE/L5Y+721eQnLOkXLCtQB7sR/C2T8r6KH3PZV+qXlI=;
 b=bn6gvLQVGUmBvHmebcjN5rRtCAyZiV/JD26az36FvajF4+RYA4hPyd1glq3Y7tyOZ6YujbZPMVtjUzogEhwX4/0i87x4fcgl9gB58fps/KrposL5l33kJA4qL9QvFOg8Q5gbO0QDcYTriCan+jgX9TiKFICN38myczH23nMVPK84J6Z2gS7ahnLg8FzPazW6dzEiShVot/t4qnVP7a7EsR8l38MMuQEqiSF5htGH8LND/lH5DSOaRcbuTg7H96zQBLLPJvPbYKbZehWxcY4z97PjoKTORLa0PW99xBBZxCCPHSlnTUrB6Ei2uuekC+Y6avVbbZLGkPIu7epAq4msdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB5391.namprd11.prod.outlook.com (2603:10b6:5:396::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 23:26:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092%3]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 23:26:39 +0000
Date: Tue, 20 Feb 2024 15:26:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, <stable@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 1/2] drm/i915/gt: Disable HW load balancing for CCS
Message-ID: <20240220232636.GF5347@mdroper-desk1.amr.corp.intel.com>
References: <20240220143526.259109-1-andi.shyti@linux.intel.com>
 <20240220143526.259109-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240220143526.259109-2-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB5391:EE_
X-MS-Office365-Filtering-Correlation-Id: add5f930-72da-40ad-c9f1-08dc326b6363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0m9xeM+oUbKhnSuH4WDWq4x/kL6Fmme74tTxs++0+HbrFyfFjbv7QFexsRC16hxmcYRIp6HoYf1uHvCzVkYGJl8wMJaa9Hty4DMcspqEeYP8ImqwUf9oN+ZlgcYLjan6U8vBuR3qHnoMVCMnFjSYiB9l5mwEIxNVo0VLlEqPZkF4VSk3rxyLSQKAfEwTJBTokN5lys7VuLfHGyDtqU6Cnq0i/EyIhps6slWG7iC1Ho046IUOz3jjy5Pu6RzDq/jIbDsMMAvuT3g15TCowb5P6ptECDB1vAI9FG/sBPxT8dTLF1WhGxOTbW4nzZqewz9D9RsB3so3/daH1oN94m2hj4dDVgdqGvPG33XlObXLBLoNI6zerLcotO9BQt+qPhs3CaHG46DmfKzIj5JKR6dhMtpDDyk5gCbOrIUsR2JewyoeldYv302cNhgLiMGBTV16QYWSXQ1wDFtPIBWb++bI8QOWReis2oabqoHvmJ7iubx1MfsNZFQdv4VpP+TIHH2Lu7bVkG9zYOBmyjD7qAM+NKUkBbBJO1iQ1rNqXlRINi4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kmj2G0TB8uNKQKSJjQ6yOBXWfOfyPYJeNpxK1HWOD0CoZT89a6RhGmPTLEmU?=
 =?us-ascii?Q?6pEe2sRzahAwHVsMx87spJgBPqsW1Wehtpb0XFsUMSmacMBzOHvGX+57QqB0?=
 =?us-ascii?Q?pqwX3dRCOSgYUmoKOhV4TIJaQ0Vf/tWySZU2kKsLhdZXVKEqghbEnZVbAyVj?=
 =?us-ascii?Q?Ey+sZ8m05fdsgsjFv+jxFacjdMLRhBH3wCvL+mER5nX+uWWO0kFZI0zqMWPT?=
 =?us-ascii?Q?A12Jvkpsvw6+GDD98mu8AktvPJYLBgCVRo/Pbl6F7amVzW7dnI0jquGCSqgG?=
 =?us-ascii?Q?pxCBf7PJwYHb/6LGMWWKKw7T60ejJm3Nh1vKA7Ool8N9v5n3a/GkJenVLJfM?=
 =?us-ascii?Q?XNp1Z41b2GvOjnHVnxfRcrR58csIkq/T0Akh8om6WvxX8tb/2YUfdDiriW1R?=
 =?us-ascii?Q?cWWlA43SlAgWge61J/HKDFQuCKiovaaPcwCmcZVWbpI7c3WrvwxRYVLpgfbf?=
 =?us-ascii?Q?RctdcEZosBLxDf2CT/6XZTfTrhztRlZHv7BLRzxtgrmiFCUTnIpJd65HWs2v?=
 =?us-ascii?Q?4D3nMkttP8s22H365fa3VaVO00GrFuwt/JqC5J8MaLM1aNuyi7yIoYsLkjBA?=
 =?us-ascii?Q?wGq/Eemw2gf2FNS6hSj29fmVJ+8xWw9Jd2vE75dF7u1IRm9cGTFKGl5lDjV/?=
 =?us-ascii?Q?Xtcrpy8x/ZsQ11RI3g0r35xFGgqTYd83/cmBzVH5WltNB8SLdaw/+hYqLvrs?=
 =?us-ascii?Q?RyJHQ1VmAJOJeD2XtUIx9gDBjqtlAT+Ha3b2pI6AWzs7N7CVOlleg2PfLkJa?=
 =?us-ascii?Q?j67JUXmzIye5yOGsxHVSiSrznWEzIX17+8PpDZm7MrKFW3DmTthZy2sbPTxd?=
 =?us-ascii?Q?lWTpywQTzTTxEh88/89gF6BLy2MTQqBhfSf6ZB23+iH87aVHF7L11wnkitXw?=
 =?us-ascii?Q?04eR0D4Nr+L/q/+68rCZ65BrjWqzS1Remcl7qMspnu//c2xSkSgjF19iZunD?=
 =?us-ascii?Q?J5Mi9a9yqk2ZRIEmbUw24bRigOlMfctw2H+IgNzqTh0+/boRoJ7CqyKi8drO?=
 =?us-ascii?Q?k4VVaP/LL3jW93HHnjU11TPPd69sILE4jAvwLxiZ9I2of90Qc6I8RJW9oobF?=
 =?us-ascii?Q?oMDzQg1SKQpwdv7EGPbxqflrX/Qh5JfCvAoN2/aQ/WnzSQt2p6U7i0z3+Enh?=
 =?us-ascii?Q?p1ZdKJF8U93wXsKRS4uwQkTQ7Ib3Bl7OG7LSIUy+CsQuL0+AzEaW0xRqBx+w?=
 =?us-ascii?Q?tv+siO5iyYIkCnR2Wpl3+v7nTwlbvLoJU11QG4Xt+T/r5w60cB1rqVo3IC81?=
 =?us-ascii?Q?WycxdDqGuJgcyfHjYKSelpYE5LuDsYZj7+07Bu8PXZJqohkQsn+2/k3M2fVS?=
 =?us-ascii?Q?WO7k1lS1aLhAbgBz2Q9nDK+GWCZJVgugBArrqrlxAWj+TAyH6ZGBl+/F4/po?=
 =?us-ascii?Q?t/QVa0rvVgDMvNF7rPqLQWwc5oCtPEM5gfsU3JcoECMKX9OKk/D/9ydlQLGn?=
 =?us-ascii?Q?ikw10XlilagNQmQpyJ3BxJJ9PajeIEDn68I+7lWXryHnydaT62dqan0R3kj4?=
 =?us-ascii?Q?ELg+jW7Tk12SjQTgfKQ/xNh9m7TiDnoNKMXRLRFkO/Oq3wsN934CwJPZCZ2p?=
 =?us-ascii?Q?BTq2XPMfDsaZkBNGmsFMbqw9vKEWU6qm+lUItAJ6DmWg8fRWq4lX//XgXPUd?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: add5f930-72da-40ad-c9f1-08dc326b6363
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 23:26:39.1242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98gZ8aE0tkgrCj1j5g5Ny6TPYqRHjBE56x4RHdiCXdE+BD0x3uK2DaMMYkby5gitmZu/c/TikxGuXdoMAs/QVLxZRMwH2EmintagHBDXkp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5391
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

On Tue, Feb 20, 2024 at 03:35:25PM +0100, Andi Shyti wrote:
> The hardware should not dynamically balance the load between CCS
> engines. Wa_14019159160 recommends disabling it across all
> platforms.
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 1 +
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 50962cfd1353..cf709f6c05ae 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1478,6 +1478,7 @@
>  
>  #define GEN12_RCU_MODE				_MMIO(0x14800)
>  #define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
> +#define   XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE	REG_BIT(1)
>  
>  #define CHV_FUSE_GT				_MMIO(VLV_GUNIT_BASE + 0x2168)
>  #define   CHV_FGT_DISABLE_SS0			(1 << 10)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index d67d44611c28..9126b37186fc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2988,6 +2988,12 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  		wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
>  				 GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
>  	}
> +
> +	/*
> +	 * Wa_14019159160: disable the CCS load balancing
> +	 * indiscriminately for all the platforms

The database's description of this workaround is a bit confusing since
it's been modified a few times, but if I'm reading it correctly it
doesn't sound like this is what it's asking us to do.  What I see says
that load balancing shouldn't be allowed specifically while the RCS is
active.  If the RCS is sitting idle, I believe you're free to use as
many CCS engines as you like, with load balancing still active.

We already have other workarounds that prevent different address spaces
from executing on the RCS/CCS engines at the same time, so the part
about "same address space" in the description should already be
satisfied.  It sounds like the issues now are if 2+ CCS's are in use and
something new shows up to run on the previously-idle RCS, or if
something's already running on the RCS and 1 CCS, and something new
shows up to run on an additional CCS.  The workaround details make it
sound like it's supposed to be the GuC's responsibility to prevent the
new work from getting scheduled onto the additional engine while we're
already in one of those two situations, so I don't see anything asking
us to change the hardware-level load balance enable/disable (actually
the spec specifically tells us *not* to do this).  Aren't we supposed to
be just setting a GuC workaround flag for this?


Matt

> +	 */
> +	wa_masked_en(wal, GEN12_RCU_MODE, XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE);
>  }
>  
>  static void
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
