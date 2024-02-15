Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB23856A38
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 17:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFC710E9F8;
	Thu, 15 Feb 2024 16:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNAW0XTD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860A910E9F8;
 Thu, 15 Feb 2024 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708016151; x=1739552151;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7MdxTB6k1eyErmhNnr9A7lsrYPtSquVCCt+Fim0ycFg=;
 b=XNAW0XTDQ+5yyjksghp8CLx07AMQ2a5U+j2bMuPwWrUgl0OPvOsNTKTd
 2fU4ZDqlZ81KDYBC28Cd44hfxOKxVYVey2kbyNQLFLGuiT7sdjeQe92fn
 LKx6pj+sx03jZfZanobDLYGiX4I7eFJKFiyq5GekEGlqKKCXkvZ46M5/N
 96aO5+PJuhWYnyjJOvQ/ADTbg+4NNNLZAkKoPViAcq7EHpKjuNj+xPFNc
 4jvsxlZqk6xK2KuJ1G3WoLOBIOAETIaIESkioN8g7Jk44ti2oEMRAQ7GQ
 /mWz1McXziERnpNCMYVZ0F/8xrLOmObV2KZkMbGDfOm8RVrjDbut+6rzK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2243963"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2243963"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8282612"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 08:55:50 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 08:55:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 08:55:48 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 08:55:48 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 08:55:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/Gps5Xzhg4w7r0K4BqiU7yqEglIqpsCWqQhRm4MckZOATCaHL+vSgatGTcOU2EjixjkG/7OIElOMh3w50664gybsPnubYGBnx4L7Q0k0R4k42h1W+dcDehLTCFq2uYiaEz4euHZsqn543dB7AkEZ4C0tehZAtfN4CFQxR76OVTvRuIyTIGRjfHYYTb1Ik5+JdkJDWnxfUaMSmnUqmP07EQEkBXhiG47bROroM6PbzGjZp/9kDUdM8r1SClK/Gk9Wri81ANqLcjX+0+E7PxVa11LgKmtV39OlNciw2U5wxN0cb8QQDYKMrO6/CuzrEg/EiMV56Ea6p5Sh8CJ4ricDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPDoqe73cQOOnt0tntDBTAFrHdkq257Wy1ON68Dn87E=;
 b=nLqZM+hpH/tAcMJAXg1HTxQqexLJ5FAJnDUU2amoM1lW5LuOQKA3RdZM+jzzdehdzbqTyKZw54dWfpy+3/gcuVy0ihoMEuRjdUGT6qivGexaSMvl7RPsIT/69ApPsXw5auRn6avMocwmKO9imMyYOL0+Lt8/zF9jmMk99Y1CO3AWYqlmqxy+wZ7H+clPWd54dYiq/xjkFPAUT2IPCNQfHrx6VY/EmiSIbltdU5MxoHcHaOTMYjhV4dUqM/+I+wORgpBxdpE0qjAL9wUbPudiBjL0RzUg5Hu/mVdF1BdaPBYTYsUUZAGWoRGHZbmN0dWEO+9WUV8H3qWtkagcYrqMhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Thu, 15 Feb
 2024 16:55:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092%3]) with mapi id 15.20.7292.026; Thu, 15 Feb 2024
 16:55:43 +0000
Date: Thu, 15 Feb 2024 08:55:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, <stable@vger.kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>
Subject: Re: [PATCH 1/2] drm/i915/gt: Disable HW load balancing for CCS
Message-ID: <20240215165541.GJ718896@mdroper-desk1.amr.corp.intel.com>
References: <20240215135924.51705-1-andi.shyti@linux.intel.com>
 <20240215135924.51705-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240215135924.51705-2-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5ca57f-40fc-4c57-c9de-08dc2e46f2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yXi9yXEZKyTI8a4L2Trfi15Q01Xr8KhuabniIT7dmJmYHwawYNgyrERhme0mxwaBW2m8Pesr4YYXHltZllxPCPUEisOmbVjwnoPLLwJ1NGlVvx8pp3OeitGUcrl/+wavHXGDBs59EbFZRPLnZE0Vg2jUyu80B4MS+6JG/bpHpuj487MleeemgOonWqKMornRYstyFWQk2LInmg1DLDsm+R86NuNKFCJoM14ulAyklfwHTx/92DqZksJUMVt3IU14hJEvGeh7/OATKcVDR+nZMczZMIcuZkGBUxzmksMkUDHvLLzJAw/LgUdoMRwFO/u9FgnfrPH1siRgUtMTidC/ExaM3ceEPhcj7Z6YIcfVJ8uU78WmLCCFx8MfH2mJLwB/V5DJOYUeENM/MQbNJx0+/zDwRcVvjtz6iTXTYF/IAemIhpQHD17ymzI0lQy+47+lZL8SDH5n0MfpbNoMLEJroqxQgwo3S8c3T0hqgLKtEoFT/CeMBhqs/c0Bg020LryyJWTk4MQWJ91JY9WRm0E7/MkS+bzmIH0NgMS5g80ngJlCogvbw7BT5OvCDXzfO5TS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(66556008)(8936002)(66946007)(5660300002)(2906002)(66476007)(6916009)(4326008)(8676002)(38100700002)(82960400001)(41300700001)(316002)(26005)(1076003)(6512007)(6486002)(54906003)(478600001)(6506007)(33656002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4sM+m6t5FDITqxZjJ96pP/6EMZNEApwO9+TMyQZkrInCQWy69/ryHdWE2ozz?=
 =?us-ascii?Q?+cWKy0FZocAJQKzPQEmpCrVENpogU4w7TRx2nS1sBGDVzp0pjHRxhGCztq2t?=
 =?us-ascii?Q?wWSUX36Ne6HURKo7YGgaUEItRk9li/bjkysnmHaaURHY8WCLUtmLKeD06GaH?=
 =?us-ascii?Q?2Nb3r9jTWvP0tTL5ns7CxZ7ZlvXT8idZvmF1D4HTpUFqSsmhb5XmE9+Pq5vQ?=
 =?us-ascii?Q?0QtcQzOEMbZJ9ujWbEPVTXT//q1P4yI2dvM90Ts+BNrb0ujnTaO1u5+DwO2r?=
 =?us-ascii?Q?MMarI4vqcIwdeGjoDsfR0bbwg6SXyEGRq3U81//X/wBXrhF1BFRrWyr/5lme?=
 =?us-ascii?Q?kinQBqRrQIvdjlY9T2F+hguUULCNhUbV4Df0aMwCLF0vEX9tS991p+x4xWrt?=
 =?us-ascii?Q?FMddmPBIls70GFYpurUuwcbtHbw2zZiGrW94RCwS8Yd+NWZmgt4lR1N5o34J?=
 =?us-ascii?Q?jhQR0g37j2GaqFL+cnv9cYvy8KLUt6P2IjDY0IQaqXOgfCiwpE5zuRcuyrtK?=
 =?us-ascii?Q?EvD9kExmGVrltGObl1n1fpONxfCKp5SpO7r1+rbWBvabsHIu5H+F9thyHD62?=
 =?us-ascii?Q?JSaNmLyKchLyfpKtlQbIsYg6vxA/hC+LW6I/FSzIeI+iPk6M5s45SfZPVGtS?=
 =?us-ascii?Q?7hhlCTlHwq+Jb6Phz2UgzItezImjutBV0hyRVkuBWxdyhq5PRMk0PPVg++sr?=
 =?us-ascii?Q?Y6RusMIw/avzF9bzvRrn1/P/LcXyM2M7cxcm8kyFVwD56GgFLjf2Al5wlbY8?=
 =?us-ascii?Q?Brwy86V5+tfLpk0ifRxCYnIceszyOEH7VYOsBiz5Rjv8KOyYjTfk8bYBA7da?=
 =?us-ascii?Q?uYGzlw4aALJmPjI1PGeh50uWDOakHsM0s0wtgj0uPyBlDWu6+UMx0Jl+2TBe?=
 =?us-ascii?Q?7jrf6LLnnIpm6cfWhqqs+rS3HYqAK47Ae2vXGvB4pOD2IbzzBE+W9iftmYN3?=
 =?us-ascii?Q?wmNrjpelCu9gPoE7aSFCHFT/IyBowEdK4BzEBGxNZ5myfBblW0deapOSSCAl?=
 =?us-ascii?Q?P/rnWRKZixaqWMWwby+o8UUs/B1XqggLW6+loooA+rl23d3umpWuK16vE1Qi?=
 =?us-ascii?Q?hjr4/We/fOqG2h7GTMZgYmivDD0+O9QqMNq+uF1jxAB1976JAIulyAGDLIB3?=
 =?us-ascii?Q?TiSiIF//ywwDYXIetMPZYPnNYgZwlqLQvmeKEYND+ZQM6FBHXrfWCy+xADVz?=
 =?us-ascii?Q?XnoYkMVcMLo3uc4Y7nVhsEm3fvMt0+sMvNFPYsqKwWw9xu16tqeuvxkh/pzm?=
 =?us-ascii?Q?kLlrmemzz5oT/nQ8FPQNfQY10z3jGqooHRS2gfNI66BYErh0R4LBwYV8a2Tx?=
 =?us-ascii?Q?W4+m33ibi/z+Er+O4AFpjY4zsHXEMdN0FORQJpqRj57kX1P0JIJs1qkAF4/L?=
 =?us-ascii?Q?nV+KByyDlEFlmX8eZMP3+Ln5GJkCwRhDpBQYjCzK11Y+AlkXdPV8SKQk4f5V?=
 =?us-ascii?Q?SesllitZ7Oa2HLU9KwQ32f4oZ8TyOHK+Op23s9UPhbQq6WD4eCgsg0DrqD1B?=
 =?us-ascii?Q?1sDciYuoybC+rLCgYvMO5R4FB4q8xklEPYRBSE5eTGiY02dnj0hMg2mtI51I?=
 =?us-ascii?Q?F3sj9wsHajM0VE/3SiCMCVCBt6eM16+8pdnegWYDcgVtUGmg6XRURxGUwZnL?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5ca57f-40fc-4c57-c9de-08dc2e46f2a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 16:55:43.5111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vohb6RkPq6iZj8I5DMqIeYtrTeHdJIZChY+7K6RLZlUfuKChARyjMmZ8xazZ9cYo1HVrENt1wZBGN+TFkbhhG064bWoYX3mgmql8x1xgDuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
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

On Thu, Feb 15, 2024 at 02:59:23PM +0100, Andi Shyti wrote:
> The hardware should not dynamically balance the load between CCS
> engines. Wa_16016805146 recommends disabling it across all

Is this the right workaround number?  When I check the database, this
workaround was rejected on both DG2-G10 and DG2-G11, and doesn't even
have an entry for DG2-G12.

There are other workarounds that sound somewhat related to load
balancing (e.g., part 3 of Wa_14019159160), but what's asked there is
more involved than just setting one register bit and conflicts a bit
with the second patch of this series.


Matt

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
> index d67d44611c28..7f42c8015f71 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2988,6 +2988,12 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  		wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
>  				 GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
>  	}
> +
> +	/*
> +	 * Wa_16016805146: disable the CCS load balancing
> +	 * indiscriminately for all the platforms
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
