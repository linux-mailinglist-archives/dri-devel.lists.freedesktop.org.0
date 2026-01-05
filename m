Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8BBCF4865
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 16:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D5A10E47C;
	Mon,  5 Jan 2026 15:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B97gfyGI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE2910E47F;
 Mon,  5 Jan 2026 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767628424; x=1799164424;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cH0X2LXHG3G2myU/RKMrZXYxk5MB5DUGW1PJmiHhBxU=;
 b=B97gfyGImAfHrD5SUT80WOJ9ql0gP/+3kF+cfgOzcgGmiffcw8gEqQcJ
 3TegltfgFfEOLILztQLaMlJzXtPflZf3QOfBhwg55LaDGxRKpVBblf5MR
 6vGqW500zwsu2+FJpQ4J++MkHq9qCuTHoV4FyD5jpYF82tSzEfejMe2L/
 6ktZVjtA5yAbS6+rkssI9H66n/6Yr76CvFj7yA6bXFNKvdgMMRBtvTSgJ
 ep2LMTP4dO0/8DPRCqufRGQ9HiWu28Rh1dKOmxPu3f7dxlXrTAgqbnqyk
 jiPqEv2RDFNRdvlpGjCVXQHgs+vTFDiMvsalMM64dFrYCsFLME/EjrWlA A==;
X-CSE-ConnectionGUID: VutWBKRNTNOjZXOXFzr+Hg==
X-CSE-MsgGUID: TxTaxxwNRG6q9PBTISVIlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="86412625"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="86412625"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 07:53:43 -0800
X-CSE-ConnectionGUID: RRg2Hc13QBGMzFg1EO1swQ==
X-CSE-MsgGUID: x1+MQUVbTkycmTMG4csmGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="201652810"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 07:53:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 07:53:42 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 07:53:42 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 07:53:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AijLEx/+uTeV8sgfgknugJJIfyLVyCsnouspKUOiP+9QhnEPppWpivOCeMjSP5N2oGW3XChl3BF4Jzo1E0SDOrLB8ZWGG/CwCWFQIpWukexor0Udtfz+HwQ4OrVjnQjoLSW+0bRhvt6Dp7b2wqLtHe7Haeh3hAg0Hfao3SlCLLpvQRdbzvHmRKRi7ynnwAEsfNimN5trVN9K7n1gHX+TGEymN9J/V11YEaP8EUp0HZlQ7EppbspbQJdUsejUiAz9xYIwP3pWxHE6cH2UI3KlqR8Hwu2J6aASQpT2AOemUITVlgfPNjUXMHNyveAkGefBUq/BtKFQDhwvPfMF99rO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkgPaG37bMB7kuIcZIxxyFmz0QWsz80Qte//PXZcZhg=;
 b=VEF7RKv4Lyfolso/BL1WMRasDC7H0Z9X0IoT5rZru7klGgfuJFHj2pNjp2LHvqRbCIzQzTyiUwErS624ZWE8eYbJgibHkMPu2HPGdfmZddgtVvIuWqSZVbEY6/DB3W6UJkftukYPCCmtk0+Qva8FShRF7uZddEPtJw9hL+l70UPDRgoTL7HxUCigbdK5wYwb0AVUQE/TMz1Ek8S6M0wvFS5WrEx9/ey4Aj8CJlm3gY2ZZ2i13jkqYI8rS+7Obfw7YV6D7dPlvDT9gYTzEoaWR7hVRaX1j4aRIbupNUdKPDlzMU1KXY6+Adtn6XXKOFSFl3nNxZsqBHcJAHptFoKs+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 15:53:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Mon, 5 Jan 2026
 15:53:34 +0000
Date: Mon, 5 Jan 2026 07:53:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/5] drm/pagemap: Add helper to access zone_device_data
Message-ID: <aVvee9P8lSE7m68G@lstrano-desk.jf.intel.com>
References: <20260105111945.73292-1-francois.dugast@intel.com>
 <20260105111945.73292-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260105111945.73292-4-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: f0dd9163-2103-4625-a451-08de4c7294b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PtBZREH5LM6E90q4RoYPrB3KeG4orAE/bBBEdxrvJ0dGYIkblgsCXIQGzsC1?=
 =?us-ascii?Q?EhynHETIeZEXST/iHfDH4wV5pfJQSJPDcNYPCpONu5DFb8+8jke0GCi9Bq7S?=
 =?us-ascii?Q?8/obsHHH9ZR5dS7ewZXAeUwBubF4jo3Kk95BQli7kwuqGE4wVaJjvhy4GHJe?=
 =?us-ascii?Q?YSaVLt3EOV0v8SHhxnnvTBWn5THao4YVol5Jc2PTtHoHe5TARDXfg6R5n6Cl?=
 =?us-ascii?Q?mXX42IWw6CFVetxF1i3UscanPypRzBnQO4yVPxni/8BlxDUsjjVuA9Wh9amZ?=
 =?us-ascii?Q?Pj3PYEA0ZcXHAkH9w8zM/f0brdtYphHWQZkFGgRKsGPbihu2BdeuOir0zmEw?=
 =?us-ascii?Q?xRoSTDyPBENbp4WDHU01C7wdSHLRUVf8ZWGkMbyHz1I6lqsCFbgnxCREcCpc?=
 =?us-ascii?Q?lI9vpMYi+/KMMl1hW2MBGgYSdVZpSznCXOgM4RKmKn9o+McqhiM0P9lIfFW1?=
 =?us-ascii?Q?6q7aTisnpxdavt0GBmvYm6wLKmJ1HsCgNY12Dq7OwWAd5iqpNJq2OCEwDKLg?=
 =?us-ascii?Q?uMMA/XnKvDJLRRYgWrWybzD662XfQ/rlVYS66nT9soy4gQPStaMRdRxYLpcC?=
 =?us-ascii?Q?iYpIw/E8afSROPC+vlXFD77utYDkSJ1ThslOMQd1bIEJG795foS9CL79BaFV?=
 =?us-ascii?Q?p3Jj2YL+SxUozJFKvWjkYc9qCy5fDkMW1PqI31Kf5R6jFdcmxAuLxOzewGY7?=
 =?us-ascii?Q?2fsNs042zVp0JOeiI06ahs3BnCtcBVo24sesBF06Lj45OMRWrRo2bdL6YZ/I?=
 =?us-ascii?Q?lbxKRhYEKBZADDeJO4PYTVSprr6++Ip+sKDTC4Yffp0TFjleECeXmagPzYtk?=
 =?us-ascii?Q?AK+aCgaJ7m0NWbBPQZYEtxmto5SL4pLIXrE8Rvf4DV9hgilmwAHJgrqNtKVB?=
 =?us-ascii?Q?zwYkj6KMZA2JAoQa6TykWzgUAtR3zuVVYbpqR3bwrn4I/7tqEfz6uhF/vu2j?=
 =?us-ascii?Q?yjw+O5h7tc0n1gzh3cH10mXCXAQc91XVqbf1ISKaTaUEsttAyiRauUoCLjQ2?=
 =?us-ascii?Q?gLpHW0hCRJDDTff3Ak9XjuXjHRovh028pW7FnFHY84GKtz/z0UNkr3cwJJZn?=
 =?us-ascii?Q?kElQx7CAfO2TL9nj+/ArgVek7GrAVgmfO84F1yGILg4FO0tVC6fLTJz1Ax3/?=
 =?us-ascii?Q?ubfymi8MGmPOr1Xc4GAtZ+sbH6tGar/0mKM1XjU95xGsefVfgAZP4Cj4HyTt?=
 =?us-ascii?Q?7KfhIu/aGo0XPRpR/YML/9r6bm2QlBUZexZEZSkJJBAMSoJesfDZLQ3AFCrn?=
 =?us-ascii?Q?RYsAMTRAiGmuBAjeqfLVvmiT4/frn5LEbfDZ7wX+w3siAkWWenkQDounfoxf?=
 =?us-ascii?Q?PXTADw8J8k2N6cVPjlWX2YtVzCZMsQh/8VasKwVBYuL4ByYGu31Vwez7X9tw?=
 =?us-ascii?Q?fkO2pjRjOhTPHxhoJD0q9UflaaBPDFph2FxYDnItLz56F2jnRCnuhQKEhGxC?=
 =?us-ascii?Q?hqojOcZJoCXEDJhx/uUF6sJJn7GUuiFb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TIOx5kSmPu9YVqulhvEDTrxqb8vC5hL114N8OxW90459YmpPsb/TO/i2XWDr?=
 =?us-ascii?Q?f/hD/Nrk8rvnPt+3mNQNs0kpUdWr8cL8WXMAIvpmLY7h6fS5yFEvP0ayQrnz?=
 =?us-ascii?Q?103wt91yuaSzQj66jpjJ2+liIN8794ZvB0mTj0x7nszco+9V7L8eRrzQ6yDN?=
 =?us-ascii?Q?IQp+Vh9RoDljg+PFfd0675Ax2fsQtW3WA++aPzniLNsY2PCS17SM0rmObXIz?=
 =?us-ascii?Q?Q2PlKUrZlC980ISwfzsVT1B3y15LSTYyz6WvD7RmGjA1Xxn2gZ1mxEdwtadB?=
 =?us-ascii?Q?6r45OqcfHoeDfm8l30AkWTyFdYz20UWGi0FDoJZU+JAuiJHgulMMcNhRoQC3?=
 =?us-ascii?Q?sl77RlhgI1XSPcuHER3zKGmEzDpdrigfXQqcG/62/Jl6kCpjM7es1kq082OV?=
 =?us-ascii?Q?LRJsb1Eo4VcZnP58++d/uZZg98Qg3c5qpzNUPmZYS+0GrICzRqh8N74/qNDw?=
 =?us-ascii?Q?qXKBaQ2gYtVUZZ9YXOGEl5FeXTRiikLO54dwwsu6AQxs8G/HpMkwqua20fTf?=
 =?us-ascii?Q?nDxs8/rJ0Tc7d2Bh566t/MNqIN1+Q9H4325tIDLzpmyb8Jes6QyVmOCrm+o0?=
 =?us-ascii?Q?asQPh+AJwgyw1GDVW4xHxCeALPZLDaUYd8yLVujMddGsrrpD81rl9V0QWpWV?=
 =?us-ascii?Q?D+3dAb3PGqy6CAJOsRWrVDyDQksN6utJlb63VHuSoccHL1n2FVPmx1DIEKyR?=
 =?us-ascii?Q?Y0eRGEwXvfcJn3vXuxNqHKyr3pZ3WEod4I8VR3kCW8cQlWV5OJmHfonEth3Q?=
 =?us-ascii?Q?i3v+R5YpvTtcIf5ViN6rXH2ihySfSe+NUIIXQyTOKIaJNnf+jzZMGEuS/jH+?=
 =?us-ascii?Q?+Fj8/8Eb3siQ8y/s5HH1bFDAGl5sx4s+G4L6s/EW5wp1l7fdbAaz1WbVwPJB?=
 =?us-ascii?Q?Zea0SY3mJIa2LVeseftwNj/CvPvSoQi9TzzlHdEgN0B1vREtlMyuwoLwi4nN?=
 =?us-ascii?Q?xQIwLThEoXmJdyx2BFoTFboGpXdGITdI/zRYcX/UG7cjl/Pm605GLfZOpAgW?=
 =?us-ascii?Q?tzDgv50wZvu29Wea+5n6oTKZ/QTQi7Dwll8Ba3a0l7xhVNwiO1SbZF+0RP71?=
 =?us-ascii?Q?6HYvizLfA/zExyVD2k0VhwfzwrEI+EsZyrtiREqkv4tMn9gbjvQ12kk7h2V6?=
 =?us-ascii?Q?LyLb+i3oOG2yS/55eRuVLTjk0bZkfpz+nuG80ShK0L9e46n2SY+i7xyROsuJ?=
 =?us-ascii?Q?2Dk3HaC9vfRaRkyhnV/N6c1jZ+hMAmprFTEkV+99LpPhffgS5ytRxkjIG3Kt?=
 =?us-ascii?Q?8I7PXNPEclOh2xzk+R0/KnmxDQS9dEout/+/F8has4EeCdvoyJfHebRmm6qb?=
 =?us-ascii?Q?NLv6lADZYZzE+bWDFyl0GAY1IvZ5/2q54mwLfYR9Euww/7QdAKbM3C3E59Ov?=
 =?us-ascii?Q?EhmDvOctaoXnTi9MMwo20bmbt50hq94NLPqHOzsROwIgEMOYZMuA/Ub3rU2e?=
 =?us-ascii?Q?z3UbY0wyirToEmvql+YB2gUE7lOP9ghYboYK1dJQX/TBnco1aY1RA92LibG6?=
 =?us-ascii?Q?Homw71zTd0aIuU8TNGvWedmFg3UkBPC+O+stUno0skTpj0fd1M4otGMSXdXB?=
 =?us-ascii?Q?j+f6CEampmzXx/O/EE0DyftCGBcSwYqlU3bDKtIPVEiI+46Cu5nNAO7eWdaI?=
 =?us-ascii?Q?OqTX6y9ElNxAo/R7s/83jPTlv6wJXxbkrcX/nqXmJUH8838t0wWwq1hsSLn5?=
 =?us-ascii?Q?mMe3fKdtE67SPQvncc8COOkYwhhCdcgNXeu9JybQb70zaXPiJtvK0Qrf9meN?=
 =?us-ascii?Q?fTJnICiEPg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dd9163-2103-4625-a451-08de4c7294b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 15:53:34.0208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zlc26DAB2x/eEQ0YgWObCLcjK+wJN93BMloCHgcujvLHf61RdAo8LeNEcJuLfqzrueChuuEIlrajujwvqt/reg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
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

On Mon, Jan 05, 2026 at 12:18:26PM +0100, Francois Dugast wrote:
> This new helper helps ensure all accesses to zone_device_data use the
> correct API whether the page is part of a folio or not.
> 
> v2:
> - Move to drm_pagemap.h, stick to folio_zone_device_data (Matthew Brost)
> - Return struct drm_pagemap_zdd * (Matthew Brost)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_gpusvm.c  |  7 +++++--
>  drivers/gpu/drm/drm_pagemap.c | 21 ++++++++++++---------
>  include/drm/drm_pagemap.h     | 15 +++++++++++++++
>  3 files changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index aa9a0b60e727..585d913d3d19 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1488,12 +1488,15 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>  		if (is_device_private_page(page) ||
>  		    is_device_coherent_page(page)) {
> +			struct drm_pagemap_zdd *__zdd =
> +				drm_pagemap_page_zone_device_data(page);
> +
>  			if (!ctx->allow_mixed &&
> -			    zdd != page->zone_device_data && i > 0) {
> +			    zdd != __zdd && i > 0) {
>  				err = -EOPNOTSUPP;
>  				goto err_unmap;
>  			}
> -			zdd = page->zone_device_data;
> +			zdd = __zdd;
>  			if (pagemap != page_pgmap(page)) {
>  				if (i > 0) {
>  					err = -EOPNOTSUPP;
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index f63d72004a71..db3795f03aca 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -252,7 +252,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  		order = folio_order(folio);
>  
>  		if (is_device_private_page(page)) {
> -			struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +			struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
>  			struct drm_pagemap *dpagemap = zdd->dpagemap;
>  			struct drm_pagemap_addr addr;
>  
> @@ -323,7 +323,7 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
>  			goto next;
>  
>  		if (is_zone_device_page(page)) {
> -			struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +			struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
>  			struct drm_pagemap *dpagemap = zdd->dpagemap;
>  
>  			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
> @@ -601,7 +601,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  
>  		pages[i] = NULL;
>  		if (src_page && is_device_private_page(src_page)) {
> -			struct drm_pagemap_zdd *src_zdd = src_page->zone_device_data;
> +			struct drm_pagemap_zdd *src_zdd =
> +				drm_pagemap_page_zone_device_data(src_page);
>  
>  			if (page_pgmap(src_page) == pagemap &&
>  			    !mdetails->can_migrate_same_pagemap) {
> @@ -721,8 +722,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  			goto next;
>  
>  		if (fault_page) {
> -			if (src_page->zone_device_data !=
> -			    fault_page->zone_device_data)
> +			if (drm_pagemap_page_zone_device_data(src_page) !=
> +			    drm_pagemap_page_zone_device_data(fault_page))
>  				goto next;
>  		}
>  
> @@ -1063,7 +1064,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	void *buf;
>  	int i, err = 0;
>  
> -	zdd = page->zone_device_data;
> +	zdd = drm_pagemap_page_zone_device_data(page);
>  	if (time_before64(get_jiffies_64(), zdd->devmem_allocation->timeslice_expiration))
>  		return 0;
>  
> @@ -1146,7 +1147,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>   */
>  static void drm_pagemap_folio_free(struct folio *folio)
>  {
> -	drm_pagemap_zdd_put(folio->page.zone_device_data);
> +	struct page *page = folio_page(folio, 0);
> +
> +	drm_pagemap_zdd_put(drm_pagemap_page_zone_device_data(page));
>  }
>  
>  /**
> @@ -1162,7 +1165,7 @@ static void drm_pagemap_folio_free(struct folio *folio)
>   */
>  static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
>  {
> -	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
> +	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(vmf->page);
>  	int err;
>  
>  	err = __drm_pagemap_migrate_to_ram(vmf->vma,
> @@ -1228,7 +1231,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
>   */
>  struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
>  {
> -	struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
>  
>  	return zdd->devmem_allocation->dpagemap;
>  }
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 46e9c58f09e0..736fb6cb7b33 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/dma-direction.h>
>  #include <linux/hmm.h>
> +#include <linux/memremap.h>
>  #include <linux/types.h>
>  
>  #define NR_PAGES(order) (1U << (order))
> @@ -359,4 +360,18 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim);
>  
>  int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
> +
> +/**
> + * drm_pagemap_page_zone_device_data() - Page to zone_device_data
> + * @page: Pointer to the page
> + *
> + * Return: Page's zone_device_data
> + */
> +static inline struct drm_pagemap_zdd *drm_pagemap_page_zone_device_data(struct page *page)
> +{
> +	struct folio *folio = page_folio(page);
> +
> +	return folio_zone_device_data(folio);
> +}
> +
>  #endif
> -- 
> 2.43.0
> 
