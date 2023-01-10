Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BC166459A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 17:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D5F10E0FD;
	Tue, 10 Jan 2023 16:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8336310E004;
 Tue, 10 Jan 2023 16:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673366868; x=1704902868;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ywLw+zAX+NQz8+MZRCEjVYK+yAZmdORwHNS30YanHzQ=;
 b=OQGOXL94G/V1k7BT3FR4cuXcXdvpxsz7cJO65YP/GEXtna9I2rkNTW6T
 eJFEGVLtwdOaUpTIrj2dkBYOkJ/ls691IRF5w5cwPg1itEwvNBoDUVbyo
 50T6JVuOpmhoHxL0WEQXYciW99dsGGJKyeBjkEQ8GudoxzzJX32vcXbFb
 2rjq+9w6zyy9oSFCugnhwpkvl/WY8eGr0BTR6tRnN9MWnZr9l4v1+d0SD
 JJi8pFwXuyhESDOcgZSuZprYA1YqOcABVbZHsHfyzeOUp8ILUtIgKMOcn
 Lk+Jyvc2KH5WbOLz2pH0agjxDMPGRM8IlnKCMCOqD4y578CWOUY65UAE6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="321883291"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="321883291"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 08:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="634633859"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="634633859"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 10 Jan 2023 08:07:47 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 08:07:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 10 Jan 2023 08:07:47 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 10 Jan 2023 08:07:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5chHblRkzEGvVyR6j/5zm2bDRvg2wU1Hk5F1N6RKjopC7Ilk9mJgmkyvf7NgL8XLpXjPxQsf904Qb2MMFzAGg91/Mm4+oA8M9TFLPWWZb9iC8hkWXRsYjzwOihf5rhwt33FzEZvDAS8DINJ2FLpsCcZTIyDkjKsYjrLjRAi11mlwdyBfsjtApblvpl0A//ioGTry0eAMoevPxlpSSQRjEY3smKAGC85Sj1bEQCOjlut44CvbJ1G5Z8GJThD7AvF9VjA0JWKV6mf0xqL38MbgINd8reyNwAZAm3wzq0H1pHE3iuBP4l0N5phvqDiSi0bZ/d+MdR3sE0dL9EveczfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9m3vvcMT6gPQhbt09bR4C/cJ0lSHadV9ZPKQnCuADcY=;
 b=GV0NHeQAXRxvY8IxxbBMO/6n8j1cZZ4fqmMdoeLTZhBz8Zb1XufF8QwNQviRQg9NiqlfKE9yTL1KBDkAwlV39BlGd7o2PioMSxry4lElWxX7l8tvxz7Qy0tU1XF2++baUB842KhGKhPbKDVTTaSmBDoOUpL403XLBse3fJV4hwUloGE2aROEFN0XYyPGo3qgGqlWEn2QToYwKloeLCK89ebOQf8U6W3iIxCZBm4Z2EUeqDhviFkTOEvsh0/uLmHoHqGUPaVCcXFuREasDJauIHMGO3cRBbBcQ2C/KRZviQmf+u3LDPw2zZ/AYurU7kSR+jlFcmSapl4q3pZKeV6k3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL1PR11MB5528.namprd11.prod.outlook.com (2603:10b6:208:314::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 16:07:45 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%9]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 16:07:45 +0000
Date: Tue, 10 Jan 2023 08:07:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v4] drm/i915: Do not cover all future platforms in TLB
 invalidation
Message-ID: <Y72NTgJ1rgpT2TIA@mdroper-desk1.amr.corp.intel.com>
References: <20230110113533.744436-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230110113533.744436-1-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL1PR11MB5528:EE_
X-MS-Office365-Filtering-Correlation-Id: 5335c2d5-0e3a-4954-bf90-08daf324cf91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ctZ4H0DShb6h4E6XuY1/ugVTwN4p3uu7HZLAJOHDOeAyjjuwIAa1tRcqR3sFGfWppFe6UMbnub9Gee3WnvTEiF2YYwcV2eL9lg8nDZ71TWN/C1ljc2hkTrhDg+Eg/IylvLeog8fFm036R6SXtax12nQmVWJHsWDOopqdZbfQ48GRzq69lrp+tW4gX1Uy86Ogx1uTeOJS9hupLZcT0nkXCKmC0d8kTa4l1YOMiNknbqqflIWNlVi6hxftCYwCyHri8G3y9oLyszYD94F3gvkU1znI4dY+DjoiylCFsDbOGWsPECfpuj/+rCqB3sb++hgesSthdAKPfxXN2XHBI3Z2KWdD3SSe7FDhBzMLKxVcLSOFzAI6DwvdK4Ir3BPP19oPKP0CIYDuCADCbdhxldbzo4HqaUCR7WeRdCdOdP1CdjW/yoYDto4WSF7MRl0Y8Yb8ChCKy+0T82HwmG9HFu06TodvPSaYMaI+EcThTxfWjFugHUKZ4Wz4ip8w7L8211YiX0tYxvofxQInJspT+3G8p+IHqMipG00xH/m+K1rPV+fqI2z6+hO/hD2EJq0Pr4S7kzoPibfShS8Pcc1+PtxfJ4l3w5rjN15gkdHNxshRv5sBEriJFR2yPjBjfrjKD1GPYpI0TD7El2TmfTHC8nT1nQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199015)(83380400001)(6486002)(478600001)(82960400001)(38100700002)(8676002)(66556008)(66476007)(4326008)(66946007)(41300700001)(6916009)(86362001)(5660300002)(8936002)(54906003)(316002)(6666004)(2906002)(6506007)(186003)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9nd+9Kp9NPWRhaLTUtiUYin8a4rTEftH1NPeTgj2mcmLKyMdGNRqJXbtXgia?=
 =?us-ascii?Q?80e6YwZJZJVLc/r8YXUgFPNkqPUqFhQa89tyw8cZGsUZUIvO49pm9fmDa5xH?=
 =?us-ascii?Q?9YYRjwlBajmp78FPopbgwOjDpehz6bkcRSQRoYkIxcWex6jGC4t57Mpm6UwV?=
 =?us-ascii?Q?FyUK3oeiJYyvpfYGBCPddqME6r33Xr0ZMPUDwKzL29svSL/8fNvsBjs+nvy1?=
 =?us-ascii?Q?5E9I2+TCQ/6h5zFPX2fXRSzVmoca4JiY08PoyTYdd+pGQnQtckfJTzECJx0m?=
 =?us-ascii?Q?ctZcH8Z6meY/5LVPlY/qNKT7Lh4L1k43gZ8SfEIHpkhsDbxlhYKbrtwIp6fJ?=
 =?us-ascii?Q?PphIfMGxiVDB2864NYnbXShcUj8CiaCUA9M73lPdFO7z66bxuS/Q4j9GjMK/?=
 =?us-ascii?Q?FI/VgVB9aShzwX9ucnxMkz3AYv07UI0wrwZrHkJGUuz3j+mTNHDGvmCbBxYG?=
 =?us-ascii?Q?8vDXu/8Hhbx4gvmd+Xs19v5fz+hr6Wg+sdbQ0naFXQRGWu64tDJDKZtEFc/Z?=
 =?us-ascii?Q?BjO+S74K6wHFTbvNQcIoyUBUkTy9Jp26LgpQMu70rkiHjJiFuYDOUppvkLXa?=
 =?us-ascii?Q?Zl3iRsfFCQ8IMoq4nYFWUG729b9ZUGoIlADR/TSZFoesdv3c3E4TK+gia9df?=
 =?us-ascii?Q?l1GaiPfr3nxlbErKnkKw3MPnfgxXrG98KGa3KMC2dnj386lSIyDtUGE/MXNJ?=
 =?us-ascii?Q?bRYKXXMOQzEb1JMl0erv2xtALFkDfjnmZVfNRTg/42ZrIxHynplMSmxqwWf1?=
 =?us-ascii?Q?fljmoYeAqY3XNfG2D337t1OsbukqaYUG0U0/5ZXGTpA9r0A5ZgOMJ5wvHV4S?=
 =?us-ascii?Q?Z9jHWlpaeJMe2nPuMpsybWD8bv5l4FFvg/UH2d/YzSjjg2xIaPtVOMWfdNKh?=
 =?us-ascii?Q?vyWa9lfdezbasTi4R9e3mKaRNqv3amXo8WIKeV5rH88eDG81oQF+UZsZtq4x?=
 =?us-ascii?Q?O9HA6Z1s/nTgp9RCUvcmzkB8URh1CDX8ZWIzfd9ET0PmCRd8Q1u3fQhOF1bR?=
 =?us-ascii?Q?dchaJ8Y3dkveDOBcf7Bz8V5mnYbaRHKM0YDXlUO/M9D7LpO+HvToDKao6VDX?=
 =?us-ascii?Q?5SQ0l9zO3BNS4jLqv8ZeoT6WpQ5yPfv0Gl4D46a/f1QeVCkYzUyQMxTssA4N?=
 =?us-ascii?Q?UC1Ug1IqNpO1q3olPCuKhheSHM70FD5DPY/Fu2GlrD+Siqb/gXbjQ9S1rbB9?=
 =?us-ascii?Q?EfuAXkiRviucIPuv0kXfrsF9lP+4uDlaDgAbENkI7DTlSN+ubgvD/qydrkfZ?=
 =?us-ascii?Q?ilXcWitKCcobKH/yr3S3BNsRj5OZ5FRSYAJchuLU7w0YGLFlKOR9kJZ3ifZu?=
 =?us-ascii?Q?hk2BztV1U1m6fmqz+R+5FDD+N7uWZ/2KwhBl0w5ehl++g5GOlqk9PoUqB7xV?=
 =?us-ascii?Q?gTuRHXQSYZ50OBWLE8bKBFq8ZktmRAOWl/nIE4VyPexkiKxLbqHMyIDkjPW3?=
 =?us-ascii?Q?JIZNdIcmwMdsj+IWRYKa7JtbVg7DODYqUUUIlfEgc/cPOH2XLNgk3YqAODCZ?=
 =?us-ascii?Q?DpHKguMxjbaQfzt0NJeqiOZDxrlYeCcnaae5qU96hN6dic0G5Qapt7WMwYrI?=
 =?us-ascii?Q?G8ZkO1O0yg/Aq0P8czqyXHk7qAzenxISF+0WjYvHlQzTYyptlMsF1PUSlyuJ?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5335c2d5-0e3a-4954-bf90-08daf324cf91
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 16:07:45.4091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTLqv8iV5kzF+l56+3eXIfvmoaIdP4iHrpu6YwvTT1bfjpFWlt7gB4upG+O6fizsq44n1vNMejbDCjSroFuTRXD/7EnY0QQXyzrF3+qews0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5528
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Intel-gfx@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 11:35:33AM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Revert to the original explicit approach and document the reasoning
> behind it.
> 
> v2:
>  * DG2 needs to be covered too. (Matt)
> 
> v3:
>  * Full version check for Gen12 to avoid catching all future platforms.
>    (Matt)
> 
> v4:
>  * Be totally explicit on the Gen12 branch. (Andrzej)
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v3

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

for v4 as well.



Matt

> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 7eeee5a7cb33..5721bf85d119 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1070,10 +1070,23 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	unsigned int num = 0;
>  	unsigned long flags;
>  
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +	/*
> +	 * New platforms should not be added with catch-all-newer (>=)
> +	 * condition so that any later platform added triggers the below warning
> +	 * and in turn mandates a human cross-check of whether the invalidation
> +	 * flows have compatible semantics.
> +	 *
> +	 * For instance with the 11.00 -> 12.00 transition three out of five
> +	 * respective engine registers were moved to masked type. Then after the
> +	 * 12.00 -> 12.50 transition multi cast handling is required too.
> +	 */
> +
> +	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
> +	    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
>  		regs = NULL;
>  		num = ARRAY_SIZE(xehp_regs);
> -	} else if (GRAPHICS_VER(i915) == 12) {
> +	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
> +		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
>  		regs = gen12_regs;
>  		num = ARRAY_SIZE(gen12_regs);
>  	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
