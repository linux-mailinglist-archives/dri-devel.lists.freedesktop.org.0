Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A469F88C885
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 17:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA64310EE35;
	Tue, 26 Mar 2024 16:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcnkWW+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063F110EE2D;
 Tue, 26 Mar 2024 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711469187; x=1743005187;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=w4BYE3Kg1UHOyonPq7sv+2nEzw9F17HES/g0GBCBuJQ=;
 b=UcnkWW+Fex5bDPvIkEcL4rQYzL8KyfyPdEwTvpOleqnUTE/F5CEGFZY/
 xZQmZ6DRfCBfvmuFFdDMt1y0EjlLnwNgA3/wkdCr4L+ehzRxdVNJRXpDY
 v/fufZ9GwbH3TxxrhsFC21a8UGOncmpVNR9YMUQhwwgR3kSgCBYm63wTb
 gMv3mqMOL5mc+zCiWQ3KMge6ttUXdzhb+90wh28L27+v7LEousOk6SIv8
 tenjIgCJKazvOYpq/neQ5zZKZgvWzLhxa70gd8qGE2ZPlKb6SsR30+5+K
 pszT1adUowrSp1+V+s1zPiiOQ2U873mGnGuLiQrmciaiktdmkmdxU68AL Q==;
X-CSE-ConnectionGUID: YLVT5wXqTSSWmLR2AXXL6Q==
X-CSE-MsgGUID: /ztBpLVrT2W/5WtaqWaThA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="10329719"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="10329719"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20657580"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 09:06:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 09:06:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 09:06:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 09:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbFz6Y6JdMRPZbCVCCjr8IDy3iLdSN86OOi88NQoIwhFnyXjbnsX5EMCNG8kzaZqWVzxLHDDT2PsD5dGvluxe3Fr2XWB0D6hj4XJhmd5JWfe1iXZ/R8qvbqXM6qEEc3UD9A3E/mcLepnca4QjyqotJtKCXIEz7qOBgXzsvFF9V83MLogvfodSPcWLjBEcy/QeFnM/EK/J/TdLH/+sVu5amMoQtXt3hfWQIymqlKUE5WjblDEO7OOIYg4yBC7X7DOsePTXcfD06KCV6jaTwjiVVESPm5LOw+6XFWbfXVrc2EbO629fsYmtIYy8Y4egGRatVOh0W71XL1HSqEPSDf5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2uVqWVgn00z5rtCtYDYvwXMGBpxJRiq1Tr23HufeSY=;
 b=HhpRYQPdV2xPywnPoh5VSWFLjCmaeRSO0pf+0hQ2/usZ9RuCIEhzQhLHz5lysJh5nsQRupY3yivMNPE8LqqoLUxSCXVEnK4ZJWk5TRGe/hJbJnotP3gGHPOBBMUrKJedNgMBTELnpToTF4q+eYyI+3H2/aNmvgvszudHfJRabl1h/fOw/N7it/MUkBMW5Zvd8Et+SCeEod70gILk/CjWZZpaluw5UnDTRDm6142jYJxEMkw5sToj2yxRXHDlF7MWwvbBFnXSgVkyCkZeHkurKbVBY1ZGkX+ztucp3vNaPzdgsPeEKbjkvMdiiQ9bx/DK+eAVRT+iSEAoO0AQLuB3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8137.namprd11.prod.outlook.com (2603:10b6:610:15c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 16:06:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 16:06:23 +0000
Date: Tue, 26 Mar 2024 09:06:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 <stable@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v6 3/3] drm/i915/gt: Enable only one CCS for compute
 workload
Message-ID: <20240326160613.GD718896@mdroper-desk1.amr.corp.intel.com>
References: <20240313201955.95716-1-andi.shyti@linux.intel.com>
 <20240313201955.95716-4-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240313201955.95716-4-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8137:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iqmzRxTvOtResOXmCIfvYvSP239XF4Lns6CzaIXGM8Ek1OCUY9Wh3+BhCEoEMswTbM+OmEk4fmhfnfJkV9zU257bPW8UIW55JchS0/8304qomSHcQJHbLlHwHkzaJm9KAfAicrEnwG5hEVwCQ0JRQydjP3jMmxvSclwTsAeTOHfRMcuDHX/pPCbyYp0WcR6+5pFWXFzOC+Gl3vIY2Trt2I7L5sSYAYfrda7DtW76AK3paX2e4Lv0Jm6m9JRDAS2grkFl84UivTed9ku4nSE3hlaSyvrwYOD1WfFmXNJq04BfiX4uKhWVBnNykNa0ERhpSWfQxJJUK/qoOH4yo/BbpF9gMMHxCg9veMr9ZjGL5n1peaLLrg54oQAAyQuGruvvpjIdjTHoFdvoVOyeYboLLRlQIUJ3aUy/ADHvX9ZLoHugaPfgTRcR9fHyD/x3bIEg9ylAyVzS1uFyZzusIdGfm00oFkP7kSQjtYf3rM9KgHOVF/6a4K3syKZllV1HKM545M0jrK5zLU0tqbcpbo6AHbanPhvVLJ1DycVWnaUHqWKjP3GimZvQPzSkPzskJZVPZM4IuydXFdo7rdZ0YIvvNDA6CvM+BVp6m0+WZdMBTEi0XN40E8z7w46Y3Zgfx0ct8UKzNPf57vtQi1B/iQGcHEAhUcEUUpgOq6TsxmOXGZc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?S7aJH3o65B2+EMOTyykoar9Xo6iAUYL/sDDmbjRSWkISTeumt+/9Pw41ee?=
 =?iso-8859-1?Q?Iybym57wOtPt2H38yPCRZBRIT9ugTH3YWOZ386oMPAwfa6jSEv7l8RjRFa?=
 =?iso-8859-1?Q?I/L4CYhNIwwBZxfQ2U/StyRD1MloM3Fauxw0RdyimtK3hEyQaPkwJ16utp?=
 =?iso-8859-1?Q?rc/h63WJErwDamB7l0J1OCaWPEuvHLNBZLAeBmsDoGu/LLWEaWHIxLtYrj?=
 =?iso-8859-1?Q?bXt7ByHORKrJA4FT4GQ2A8ZJC3bAcy3lij5UXbXUpomZkjJSqYkFKaZMX0?=
 =?iso-8859-1?Q?/OW6zX5avdbqZRGNBMCEw30U2JvyIjdRuDNgiPuCKOthfpEEVferaYWWqN?=
 =?iso-8859-1?Q?5KeebfFy7QN+BXzea7yikpc/jrvMuNCBwLSb9J5wXjQvuzCDdUdtPGlrDV?=
 =?iso-8859-1?Q?1IW4VN05PbSoyI8Km5RdZQwJYWMWVO57eDlhVGaA2qKcQ0NLz+5dcNtad3?=
 =?iso-8859-1?Q?b1nfM7Y0O3cr4b5i6A0O1+orCAi9YXNCxEofhoAR+ZSuEtrN6i+W53ErpY?=
 =?iso-8859-1?Q?vFlcw1ahcx2huSL8W/BTMQHwSj/OPuTycGNmJwoMCZDJ+bEyg6yulF/qyJ?=
 =?iso-8859-1?Q?YOigFZKHEF9pksT9Aot5v/zKL32YSDwZMdzjLSFza/e4P2uFyUHOlK+bbb?=
 =?iso-8859-1?Q?uQ/SFRKUWj5JvjU0+W5fIRy3YQbTD5OH1ldC8NQGothvvOPIZ/Qt8uMT5N?=
 =?iso-8859-1?Q?6ZdqjXzo276UQJG4y3WxNRfQd4j+6dRNp7/rMyoIDIGrBAHs3SujEXQaqt?=
 =?iso-8859-1?Q?QPH4wOqCiuiCSlEmC4MWVSQ1l3pGxU8bDRWpUY01qiScdd+M55OZbH/utq?=
 =?iso-8859-1?Q?cVrCX7mpogE7ep4FXjkLl2EoZXJMjXa1sNO0KV0kCj2Vw7xmc/fbc+beyn?=
 =?iso-8859-1?Q?5kdyHcS0jvU2DnsXk3VzdW5tQVTCbskOSiAtivjIQvB5khrgvBgJYsLphC?=
 =?iso-8859-1?Q?zwstVjB15ivG2gHu79L1YyGAokA9FsVH/Z4+UY9MYc+UfAYrxrzpoF2vXp?=
 =?iso-8859-1?Q?BwidH5MsJs1d8qJF5t7psQR9bF23ThiQtBIIteCqrSjdSkwlCggXgQ7HYu?=
 =?iso-8859-1?Q?4OXwz5/XaH3uGyfabuDrgBZHrOYNMdz4UGDvbK1FAsk7fWJUHo5mA4iUV4?=
 =?iso-8859-1?Q?GdgaG4m2s4dZLucczfWvcMV8R+RfV5ktUsFtpMlvpYK0NKSqnMebfp65yY?=
 =?iso-8859-1?Q?gThgZ5w32NLmY3naTHEji6kdqSuJmV2k99VRMgKlDVUd+EIdfxQOXebu55?=
 =?iso-8859-1?Q?veZrxPrvjGud2IHCQK9PNWqRNmFSCiv678vplglksxYmY4QZaD+d8fr+kN?=
 =?iso-8859-1?Q?/biFDCoRKkvgZ2WR+q/8KGeEEoA6zFeKWDCVvsVko+dWB6K5eY8jZgMv/E?=
 =?iso-8859-1?Q?j7aZgY90iObo2c2zKCjGCGbOXKg0VoclYGeBpektGXdsEfmSPDxD8ik5n8?=
 =?iso-8859-1?Q?scyBlhMod/yiwPmxBbLVxK8b7rx37WUFVxmTbDM0h+CMkYexCShbCzchhN?=
 =?iso-8859-1?Q?wMUB1pUCuJ7wkovJN6Rnf5mbufpTx3Wpam0gNhRhSNmyTsc/HBx7iArCZZ?=
 =?iso-8859-1?Q?ZKy4xjnN9BRBHKB7JZVEP5mByfAoluAfhQNys2dbt4uQN0PxAf9deUpkPn?=
 =?iso-8859-1?Q?pASs/dojFLEvCpF3eKdY8AbJ9I3rAIkMKOijr6F+/FbehUM1wfoENr7A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 751758a5-cb06-4fa0-15b4-08dc4daeae82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 16:06:22.9006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkXFjdIfjmxkrmuHsxBG2zkrUFaCLeze63UAWNr6rMbfxLwkdgKQWg/4mOQtnKO1ZMSxMheOTq+AWDV8dDtxUGInFQU6QNCWX1C0/R1wjyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8137
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

On Wed, Mar 13, 2024 at 09:19:51PM +0100, Andi Shyti wrote:
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

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/Makefile               |  1 +
>  drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 39 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h | 13 +++++++
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  5 +++
>  drivers/gpu/drm/i915/gt/intel_workarounds.c |  7 ++++
>  5 files changed, 65 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 3ef6ed41e62b..a6885a1d41a1 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -118,6 +118,7 @@ gt-y += \
>  	gt/intel_ggtt_fencing.o \
>  	gt/intel_gt.o \
>  	gt/intel_gt_buffer_pool.o \
> +	gt/intel_gt_ccs_mode.o \
>  	gt/intel_gt_clock_utils.o \
>  	gt/intel_gt_debugfs.o \
>  	gt/intel_gt_engines_debugfs.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
> new file mode 100644
> index 000000000000..044219c5960a
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "i915_drv.h"
> +#include "intel_gt.h"
> +#include "intel_gt_ccs_mode.h"
> +#include "intel_gt_regs.h"
> +
> +void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> +{
> +	int cslice;
> +	u32 mode = 0;
> +	int first_ccs = __ffs(CCS_MASK(gt));
> +
> +	if (!IS_DG2(gt->i915))
> +		return;
> +
> +	/* Build the value for the fixed CCS load balancing */
> +	for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
> +		if (CCS_MASK(gt) & BIT(cslice))
> +			/*
> +			 * If available, assign the cslice
> +			 * to the first available engine...
> +			 */
> +			mode |= XEHP_CCS_MODE_CSLICE(cslice, first_ccs);
> +
> +		else
> +			/*
> +			 * ... otherwise, mark the cslice as
> +			 * unavailable if no CCS dispatches here
> +			 */
> +			mode |= XEHP_CCS_MODE_CSLICE(cslice,
> +						     XEHP_CCS_MODE_CSLICE_MASK);
> +	}
> +
> +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, mode);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
> new file mode 100644
> index 000000000000..9e5549caeb26
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef __INTEL_GT_CCS_MODE_H__
> +#define __INTEL_GT_CCS_MODE_H__
> +
> +struct intel_gt;
> +
> +void intel_gt_apply_ccs_mode(struct intel_gt *gt);
> +
> +#endif /* __INTEL_GT_CCS_MODE_H__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 31b102604e3d..743fe3566722 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1480,6 +1480,11 @@
>  #define   XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE	REG_BIT(1)
>  #define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
>  
> +#define XEHP_CCS_MODE				_MMIO(0x14804)
> +#define   XEHP_CCS_MODE_CSLICE_MASK		REG_GENMASK(2, 0) /* CCS0-3 + rsvd */
> +#define   XEHP_CCS_MODE_CSLICE_WIDTH		ilog2(XEHP_CCS_MODE_CSLICE_MASK + 1)
> +#define   XEHP_CCS_MODE_CSLICE(cslice, ccs)	(ccs << (cslice * XEHP_CCS_MODE_CSLICE_WIDTH))
> +
>  #define CHV_FUSE_GT				_MMIO(VLV_GUNIT_BASE + 0x2168)
>  #define   CHV_FGT_DISABLE_SS0			(1 << 10)
>  #define   CHV_FGT_DISABLE_SS1			(1 << 11)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 9963e5725ae5..8188c9f0b5ce 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -10,6 +10,7 @@
>  #include "intel_engine_regs.h"
>  #include "intel_gpu_commands.h"
>  #include "intel_gt.h"
> +#include "intel_gt_ccs_mode.h"
>  #include "intel_gt_mcr.h"
>  #include "intel_gt_print.h"
>  #include "intel_gt_regs.h"
> @@ -2869,6 +2870,12 @@ static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_li
>  	 * made to completely disable automatic CCS load balancing.
>  	 */
>  	wa_masked_en(wal, GEN12_RCU_MODE, XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE);
> +
> +	/*
> +	 * After having disabled automatic load balancing we need to
> +	 * assign all slices to a single CCS. We will call it CCS mode 1
> +	 */
> +	intel_gt_apply_ccs_mode(gt);
>  }
>  
>  /*
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
