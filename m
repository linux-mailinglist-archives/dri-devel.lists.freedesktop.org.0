Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120E1B093E1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 20:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A5710E881;
	Thu, 17 Jul 2025 18:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D83BQv1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EBB10E31B;
 Thu, 17 Jul 2025 18:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752776753; x=1784312753;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rBqFxJPE07t6vkLZJZPhsQ9OmSqCOiSNN1stJPuVLGA=;
 b=D83BQv1rplkUKso5CxFx2SU+RMRcUTjEj2Dexb5sMde11Ybyq124VH9h
 kAlX+9TWdp60+MOwdBlEAV8OuFggIiAvllLIvN1RCd5UhpegocniQhkz5
 eZh4RdV/6eFOtvcPSBiLROZt7BPHObZ/LnPPXJGnaCmH+hjfdpWcPy533
 Z67U1xifd5cdafwcd1heoMu91SylHfp/IrWpF8WxMEcH9vKQ7uaSrvjMX
 w1B0m5dLYbNH6kmr9Zz/VpYUH3g+GCzpKDDydZHWC+j2pWGQGU2SDeimu
 wTR62PWlDDOhu3+XsLNkCOo7EVBp0lnPVMLJbtq1+OVEH4oM0XVUbC5zy g==;
X-CSE-ConnectionGUID: a7Jo4GRSQoa9HtxUyWxvbA==
X-CSE-MsgGUID: jsrxB1qzR6GxHW+Ah/WOfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55007029"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="55007029"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:25:52 -0700
X-CSE-ConnectionGUID: wf6QgXjBQ565mJ1Sy5lp1w==
X-CSE-MsgGUID: ohUQlHL8QBqQKcKk1L6zbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="162161771"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:25:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 11:25:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 11:25:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.81)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 11:25:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSr4yWejmNy11dc0iZfDJri1H7njWKvYoK+kV8BCeoFLrRV23MxE9fv88qmkrXvsYQ21ANqZCiBiNajFrd8lk1Jm3N57IDB9kjg4dpPCYFqVzSCN5SJbyrXiDGtAYSXhCdhFCR2gum1QKMrC8wQljA9xSNfXnbbF+hrdqDn6hAk/MK7UYA5EFf9IlDNsAyMHPH825p7vORNj4hp8L90/4PFb9+zf51XFiLap/ncyh+9RpLAll+qSKLYRcM0sqSgLLtkrk45AqXo4kkpzX6ZByX63bPIgWBMn2FN4d9yO5IZzxvEmtMqTvboaFsmd1MNcfJwXXwwql0NqZpT2jzSp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byxN03TlxQ+73Y1AXCson6qGcrKivCSs0ey4HDviimg=;
 b=e/0sCK9GxfYk7fho0pSzY0GUIBoLpqGEKj1jDW+0PICPHX6IV8MJn0EkE9LQckqO6eIX4OWFrRuzYChkWBTV6uPgzcs1WqQqr3H3UVfepvdCWQRa5ePhKqsTbqzCa2RIHfON/i/dfKMn3sBdEeVhdmWYlYg21CV1VE2DdNF7SPBkK4KBlTfE/0q6ySgmvEqYgANK1WuAeA7i64hrx0ZQ+iLq8I08MYLWAhxSoQ5Dj/Hrr/0clQZtiQNDXeHLvMfvbuQ9m7hTXZ/cpuUTddCL4BzdwR3IMLBFWzq6NPrruQCQ2PzJVFcPfszLPru2zm+I31K1N94ZHH3RAAKjG88IyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB9447.namprd11.prod.outlook.com (2603:10b6:208:571::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Thu, 17 Jul
 2025 18:25:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 18:25:21 +0000
Date: Thu, 17 Jul 2025 14:25:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <aHlAC833MWmPwNEu@intel.com>
References: <aHkQmRhelb4Fzqau@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aHkQmRhelb4Fzqau@intel.com>
X-ClientProxiedBy: BYAPR01CA0032.prod.exchangelabs.com (2603:10b6:a02:80::45)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA3PR11MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: d3431dd1-5443-468d-f8bb-08ddc55f4a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bipwkKnNPyhWCftMX+izF3kBpA0n89TVExeiw5BfdEyscZppTcibMb/q2XmS?=
 =?us-ascii?Q?a/FDohBpg2dvHuk4v35luXRSDaysSzcFdmdyUJXpsK5iByorbeq300M5GHGM?=
 =?us-ascii?Q?JcxF+JrpQfi9HF1pviRREs5XoeiCw05FQ70ta20N3SrsQvhsvB4B3fiqih52?=
 =?us-ascii?Q?a+LFtB+gb9UqzCxwTFT0XngLH7HZNyNYwa/3HVgQ8B2mDjMxj8hwG8BzQwIe?=
 =?us-ascii?Q?RldNOEHeG7yiMjQpkrSZWWuLY8xB1aHbkhMxzEiWjCJb2kG0efQwszTSrYNf?=
 =?us-ascii?Q?GfpAlsnNUK0PcRsB0Elv8EPci5N+yrqRC5Tjzt0H9Yvou3azuh/tFJYSGEmL?=
 =?us-ascii?Q?GN/gtUcTAuDtM0PvTdw5si3+Jf1Ubts456Wp8wF8GvdHtbqGxLoxC5YyiMgg?=
 =?us-ascii?Q?1srXyLXoASIfAt08NCRjOlWtcqe9vgLYHfyrQRF5Lctc8wHOPg/y5BMAOGIh?=
 =?us-ascii?Q?uRGNeXn9JAvMpbndNrCOhgpnVERH0oc5kfY0UN9VP4fk2ZoVCHqpFmK9pCny?=
 =?us-ascii?Q?zLfZCh+0r1URIV96JZJbHc8XfQEzUH2xDkwFW1Wgv9ZTBodIvoxRLNqug8J8?=
 =?us-ascii?Q?LNxZjBXAbn/PHQZRZ2rU1q6oEpQ7p87hsuQVBylhhhTOzu+qAO6VP7giSgRd?=
 =?us-ascii?Q?QJZMNid2B7hyokgAbM7KQyEaB0Lea2raTrIo6ZeOGHC/JNNKx2cqOcP+Jsws?=
 =?us-ascii?Q?ksZyh0gMb57zDoEBJiEwa7DxNC/P6rhAFhbA3CLkcJOfzsf2K9pF7lgkNjFh?=
 =?us-ascii?Q?tzuvj3b8zNYqxLURtOQ66SWN3ipsA3C5KkDSgU0g90pqZpHU9w+nKZ43irOY?=
 =?us-ascii?Q?pwnJKnVBdlCle9kd6KNcNE+Sopj1obvNFR7pYCpY0hLMGlp54craY5iKB1/r?=
 =?us-ascii?Q?nbIRtQoo6sLNWHPBKFARCU1WdFNv6Ami452tfIW+AwPIja6/zAcS4tFdHP6z?=
 =?us-ascii?Q?MoUk9YZJodPl5At0CLUWvBSCOB59A2l+cykDr6bRLvBKdSDeHNSU6h4T69ZN?=
 =?us-ascii?Q?6rGNOIGKACLOg4tT359NlzAK6W/Kf56pBrc3q4GoRu80wCjz7oSghis8qgSA?=
 =?us-ascii?Q?2QU49KuSe2IMoyI8PQiJQk4Affmv/zPeKJ2b7mmKKOrr31I61GnyCTARFiaK?=
 =?us-ascii?Q?TdcUebOxGq1na7pc7nxk3UVqYy2kKkDQyBfZOBqNlngvjiy4nU6XNLwyed+g?=
 =?us-ascii?Q?0TqNdg6DFF6CYTyEk+0ffBarsO1daLLBOLTDdQnpzYVEoAYpc2LDct/hhJig?=
 =?us-ascii?Q?Es12VAP8tQA4S9GrSUW5fhidyBa/EsdqGCSLN/o4vVq8GSIz/wyANFy4v6FF?=
 =?us-ascii?Q?MxGARPx+iDjbn4fowmWHo+qyHmv0JAaDDt8fEd9Ll48DGfQalDROSve25Qij?=
 =?us-ascii?Q?gqqXtOU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fSi+HUz5LO2YpXuuBB4bu3UsHtb9DZrPyl12cS5XBgv8yUA3sAoYiDbHygPh?=
 =?us-ascii?Q?gi7lcFhlmAqblgeT39zLGNljNUkDdcCddVhomlZJjzQJE13ECrx+pUlT0Cr4?=
 =?us-ascii?Q?sYnQOVin2YQoSh0phoapns3SCNFYbT/iY1ozNQMd7Q5Br75oaTeGieCYN5zT?=
 =?us-ascii?Q?7eeor/qFDvKDIuMPRyy1f42nYtif88gXZc4od5oYG4pWdrLhMQ8uoLcX6Suz?=
 =?us-ascii?Q?Smxish8Pwk07dcNyUVqTCE9TI+MVe4OkqHvpH7GFFzZd0kix6ofSmSb+rsNG?=
 =?us-ascii?Q?q6EqpZA7KCaxZ5reUgC26JVHUbcvTT0GaOgOTlx98UJFnHFXUg6nvkMJmnsa?=
 =?us-ascii?Q?y+Uf5X4kP+HKEghxFHKwsOdk3kAA9kNQV5uGOchra6R8IKW0zdgUk5QmH6w3?=
 =?us-ascii?Q?QYQvbN5gRkkpfzYLAnRtgq+y379iAsDNMIxU+Tz014QwfOdkZ2obbhflg9Y8?=
 =?us-ascii?Q?8+3UPdn+WVktNpkJOPl6zN/oPffTqAi+jrkOgPWHbq2ov+Jf3mJpEzvI7nHp?=
 =?us-ascii?Q?g2YjfU085uFRicHgtbkOubFlqPrWPTl98GGH4G4a7yfLbdagQwLJg6iXzXcd?=
 =?us-ascii?Q?hYyIFSLHPULsqRAiVdyBTL03wVbo3kQ59QTcQu3jsP1yaPdW8vRagBhSH3EK?=
 =?us-ascii?Q?Efca+5Rb7Ohk2TuvL+NiT+rArcGnZ/7FNxgi+nArD1j5dqrqfCetonOh0JOb?=
 =?us-ascii?Q?e+BtUlYwPpPqa1S3eb6SYCwogrqeTbXxPUc0p1RWqE9gPqY54WQ83hwNsBDQ?=
 =?us-ascii?Q?W2wYoGjNEILCrumv6uyzQdOXsKF+FjGBvQghZ9MoRbI8lFKBagA2wVhZVLXP?=
 =?us-ascii?Q?DV2R81wAEKZVPPiiZlmT3BQ5OLk5ZdzZasyc3RqJZt7KKpKaqS+8Rg8OyMxk?=
 =?us-ascii?Q?HOLFz8JE/FcORcm/GK8p1hxP9l3bhD4viobK5ovI269mvNOCBZjEV+DejyXT?=
 =?us-ascii?Q?E52NFzTKoo2k+wr1Z4RztWNjLDU6RLk6ce+/eEaoT0fzPX1x8WdT3H0Hlj6f?=
 =?us-ascii?Q?9mONpnm6TU4nNMrNuaJaaw/i2hO2I1j9WNGoyCIYPxeAbGlAJCpj6YAV1Bw7?=
 =?us-ascii?Q?f16JXuanuhaGJeOg8R2ZYtPvIZLcNm2TghFTdslfx/VCVAHWRaNr3pPhOOnl?=
 =?us-ascii?Q?NO8QgLfOiJ0+/8T+g7rQdmSSWQ9LY8qVTVG98Uwulpc4LSYBlG3G3nahUEZZ?=
 =?us-ascii?Q?QTYxnCpW55+f1u7+R58CxZzqT7DlbjusiW+e/zqRwDOqvzsciNrZ3o5qR6MW?=
 =?us-ascii?Q?TiW46oLahrCbv6fTYOkc26jIXZZc6p0DHthPxj326hhAqfTEuD7kONrWdE9m?=
 =?us-ascii?Q?EZaNysKuNZPXeinxBQGNLWC3ohzaxMtCBC0BaX/OL/HvfNW8ljByE+gSHVlS?=
 =?us-ascii?Q?j2O92LEREnquTFPdRlbR9oiXW3lHs+FdfXOCi4rGNwize5Z4/+dWE+uoX6Tn?=
 =?us-ascii?Q?0G4ByjW+Z+3/Q6KgJMjUBcyUVLseU10iacpHStzQCXPeTYlF0C7VwLUKRC9b?=
 =?us-ascii?Q?4W62DHYPivDQLB0ELCuE+Ke/MwpQx7mHhZzay9jXmM7+lbT1GxF13KfRiqm3?=
 =?us-ascii?Q?U//twM3WWb8i/aRfOWdPU2Xpia3YtIOUKu3L5bWB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3431dd1-5443-468d-f8bb-08ddc55f4a1c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 18:25:21.5862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbaY7zjLJLQ2KAPPATSLO09mHYw6lY+JIrDAKYx3yBN+2ZzSCrxLd2DT/n8nEYl1Pft/bQe7cBqeAozCqghOJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9447
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

On Thu, Jul 17, 2025 at 11:02:49AM -0400, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes the drm-intel-fixes of this week
> with a single display fix.
> 
> This might conflict when getting merged, but the
> solution is trivial to go what is already in the -next trees.

doh! it looks that I under-estimated this conflict and ended up
messing our rerere with the wrong resolution.

I'm sorry about that.

Imre, thank you so much for the backport and for cleaning up the rerere mess!

rerere has the right resolution now. Basically the resolution goes as
using the right address DP_TRAINING_PATTERN_SET with whatever code is there.

Sorry,
Rodrigo.

> 
> Thanks,
> Rodrigo.
> 
> drm-intel-fixes-2025-07-17:
> - DP AUX DPCD address fix (Imre)
> The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:
> 
>   Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-07-17
> 
> for you to fetch changes up to d34d6feaf4a76833effcec0b148b65946b04cde8:
> 
>   drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to TRAINING_PATTERN_SET (2025-07-15 09:37:57 -0400)
> 
> ----------------------------------------------------------------
> - DP AUX DPCD address fix (Imre)
> 
> ----------------------------------------------------------------
> Imre Deak (1):
>       drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to TRAINING_PATTERN_SET
> 
>  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
