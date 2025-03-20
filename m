Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE4DA6AF43
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 21:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23FA10E6B2;
	Thu, 20 Mar 2025 20:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKOXR++1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F56610E6A6;
 Thu, 20 Mar 2025 20:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742503187; x=1774039187;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iIGfpHiyUkt50rwlRNM9oXKMa4PHSV7YNuPfdtozSSo=;
 b=RKOXR++1SUEk2grJdlIrRuZKjIha3jCWbYccI5sz7JRK6r4uIuS92bj6
 tHUN8XcIkbnX1kb30FrDyvWrD/mM/rJPWavQ1TkoyBw61i78XUhzmnfme
 lcgCXxgFZN3HD+SzmDAIkf0bM/pMn0TBnXVQcV4s6biWpRZYse1z1ofJ9
 skH3lXOTFUipue2nrER68SEkZcT9WoMkjN+hdCzverqAh6mf1agL09r0U
 cTFF4OuV0uqNObH2AxntNCuTRhTrLCP51xyt9dUvIPdb1+T7WtaYD9ZPw
 fYuF0eFFVgWxhFXKr+p2/DGPrZdBW81/oSkuVAOZC3KaGLd2RCyFdote/ w==;
X-CSE-ConnectionGUID: FUBIgdDuT56uKlWtWIg3hQ==
X-CSE-MsgGUID: oK2Pa12vQ5e3Ce8IlrNcrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43488957"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43488957"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 13:39:45 -0700
X-CSE-ConnectionGUID: dekLS3ABRjamgSYTtZnoOA==
X-CSE-MsgGUID: hsqlyGCsRWODnQ7H7IR12A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="154095010"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 13:39:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 13:39:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Mar 2025 13:39:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 13:39:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hut2BGcBy54wqeHDIjBsIhKmGgSKql6KXitd5MgSf093LkGhqj3oyJqbA8E2lLXFqxam++Vv8gSWfcu/WLzdr6A5Ov7JjIWIWxkDhji4poKEbGkK+c3rgex2kZNCKtZyDyJF+T4mciFNdE3oL5Avi8LNUY/dLgLdPjVwd++NGVAicz+MZiiXyvYPJf8GPAwsZZDvSU7UOa+fMcomg1lxMxoVRNvXBjrXXOIkO/6iOwoEB07e5PCygCw3ypq8OfFw6jBGbDQ/xKOhMejrkcU6aFYw1JTEtFJ9/2P0qmWntBpTC+6Ym92UscyYCdit4Vz7wfmX4T+gvMsTWfWQb9xqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7U/hBRfAV6EOHq+zA1zF1thDy9fXKgVyxclYT/xYU4=;
 b=g6oAnApIdfitLCsXvWNPC8mv709tSy6WYX559CTurIAkpya0uwFigvYnPGfGRtCQb8FHMhGcHgk1Tfc3W20pTEcSB+2S4uoE8v6MX36Ef5tWncWaK0B/mdkRWRp2kYShpShWdymFvhZYoyU//EzB/DNHo8hjdMyvA0hnIGn3BKL8bPH0yeHzq/WcqDo9vIfaqoR18J79LR9P6aWm9yE8b0rS1Fwt6Hw2MrKSQD7XF8PnL0taH9Kdah0WBbI+gKn34hHGen6oB5dU1ktanIwDHYOSS+K+ViJo/Dy2UHN0zx5StHMl9gFEOayB72rrtaK+NPzBPwKP7pDZeiSvCn0TZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH8PR11MB6903.namprd11.prod.outlook.com (2603:10b6:510:228::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 20:39:26 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 20:39:26 +0000
Date: Thu, 20 Mar 2025 13:40:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/7] drm/gpusvm: fix hmm_pfn_to_map_order() usage
Message-ID: <Z9x9RSvaoexRjj90@lstrano-desk.jf.intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-10-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320172956.168358-10-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0331.namprd04.prod.outlook.com
 (2603:10b6:303:8a::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH8PR11MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba9354a-9a1d-40d7-7a61-08dd67ef4e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?u66SzD+FqVDsTiJ8qcEK0XexhC23rmf29fyZ75fFTXTzJGwNNKUlQKtlPo?=
 =?iso-8859-1?Q?iK8OFNBfb8agIELj5RvME01HhWkHkVlkYiv/AP+DZQwf3AzkHgaZwxlaCU?=
 =?iso-8859-1?Q?rrpYhJJTqR8YS16rotjv4Ra4mBxXFgUQLZNL1bcSP6NCvEhIj0LDtDIVZW?=
 =?iso-8859-1?Q?g6emFdtUhpJ5q+gjAdz+dcLlWwr9pear7Vp543eGuWy6+4QSjvGURH04vY?=
 =?iso-8859-1?Q?CwJg26sjsZJeUUrSoT2gwr5/j2h66VAuqRx6AqK1/GK0ME+pYAY3hNUOV/?=
 =?iso-8859-1?Q?C0QueiCcA8F8gSwrqBjTXkEUlSM4hul9HWu12HOaT5tucT+6ySi8ZT4+F1?=
 =?iso-8859-1?Q?OA6853BUJamsLC3nPn2QuAIMineqL03B2O0dplLGm6CnY+aaOl3owTatp1?=
 =?iso-8859-1?Q?JcH7zq5Z6T0EgA7LA3DRSQYCFoTzpAOG0vubHb8LMH+3dv5PbitQJ72JJR?=
 =?iso-8859-1?Q?BlOtn14Gd/PdA6CRc4azQhOxutf/pM38fEJphnO6cXWKIN6gg62srt39yA?=
 =?iso-8859-1?Q?7O1gA99+4a7jv2dKPapDMhBSK6M0Rn74kyoq+KFN4bpxUp/KKf2mrKDImy?=
 =?iso-8859-1?Q?hBw73aLVtlufIZfHFCaMIKtTx+G20+9XBThWyKQr8An+8StAJ5QKM+RrLv?=
 =?iso-8859-1?Q?ebo+U6+Zvpr7uM/bc4g4eI+iekzSbvGKJqrsTbMsdMErepQsN+1+rY1N1R?=
 =?iso-8859-1?Q?DA1ifw30otYbwdGh69DrdBjREkcbLi1GSegMyul6IebndLOBrh5yQ7/Pu2?=
 =?iso-8859-1?Q?5uUANiKS4pU1qfZysz/S5M/BujTnMfzD1InuJe07YoXVZ2vfhsr/dUVf43?=
 =?iso-8859-1?Q?avb8muznGaFg6Qb2N5GwX1GoI5ardXNt6IxhorBFvoZ2LIwhKou+vYNdEv?=
 =?iso-8859-1?Q?Vw2vZtN7iIrM/PliYdgwbksTjXo6Fxe72DMKaFWPsE5Q8IpJG/UxyfrGPF?=
 =?iso-8859-1?Q?9wbSwvV7pRBR+Kxy/0K/IOcjv3lFK2Sv2+Zje8fXV8gSk68OuKdpmEeq6C?=
 =?iso-8859-1?Q?Az0waL5yOBXgyaw+ozbf1CEC2leWJwo/zLAR+jZo14pzhzaGCODcp+h23R?=
 =?iso-8859-1?Q?Dg9ih+SNzM6to7T+DivqnfOi7sk88nOv6c2O/696KKsKIxmWFATV8oE8qE?=
 =?iso-8859-1?Q?fJnhnBEZYvelV3YX/td+gly3/ZmwJyIQlhQq6BmNZ3T8DwF0he9+F7TR7u?=
 =?iso-8859-1?Q?onATyQmsWulmE5ey0hB66WuZP2CwoTvjxqBS0KSpdsMX2uAfomn0rW17Fq?=
 =?iso-8859-1?Q?bHNsVYc8D0tnp+00qTv1qKF6ip5ogMmXAvhCo9GCUIdWquTQ/JxHiDMiGr?=
 =?iso-8859-1?Q?aL5uBqOWjofIt66o0x7O/x+UBnuNs1b6ti3ShT1aNXJF/6whHtace6bPnh?=
 =?iso-8859-1?Q?Cek5tHnvzBuDAQiYhSfd4sI3anXH59dIjWqxfLDMfZF38T+C1ImjiG0LBj?=
 =?iso-8859-1?Q?CvA5+txfi7AEYiOU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ze/s4EjCwbs9mncmY3DdtXLav7PuW3h11aaoXIlbk2Wr9S5Frg/6opbxPk?=
 =?iso-8859-1?Q?x+oNGy6RD+Onzbqlalxh7t3/oVNP+sACRIbHl4ODfZhZvEIQtdPeXy9T2k?=
 =?iso-8859-1?Q?ZnvfSf9H0hz4MSIqcbeFILzWYdYDCTIPhQPkUkNjVqdbrsJrCMR5kPi2+C?=
 =?iso-8859-1?Q?LJDqkwugE8xfiEvWiiNyiyLHWbk8bj2/1YdMo8F96HZJkc7tvMbtPgZ5CE?=
 =?iso-8859-1?Q?R4uOS2Se6awmh3CLpBrwdgTcsn8V8RXNCxFC/cx1p7oI+RbeGQ8RmRRd9y?=
 =?iso-8859-1?Q?18kwkT5qJlb+gzcLxfeNVm+FCf8hn3NZ3hAv2BodTM5N1zT9vNDdFdA3DZ?=
 =?iso-8859-1?Q?jmbjPUqb4Lk2hpoTxhpVNdKAJ3KYkLaCv8lhDI1b5h0R9mk+sOytez7S8z?=
 =?iso-8859-1?Q?B4m6GUnA2Aw9Zx72m/9JI4XUfbXFwNl7J3J13fdtgbh+JwyWf/2RQGrY6l?=
 =?iso-8859-1?Q?vu6YXOL5Oiln8O0jxfd7+Wgvx11wDUXjizgHEXaOZh/hJ1dzTWIP9d3vma?=
 =?iso-8859-1?Q?l5f6IdllTc/NH85zi2TKlASSTETPQYGS/5VdopRFes9ihebLXQb+oPcXuG?=
 =?iso-8859-1?Q?YyraQx5VrEKjT4sX7pbMXfg+lwbuqdKpQZASmmHhqtEaWtalR5AIJOBnBf?=
 =?iso-8859-1?Q?2dkGzEJkwSUxazbUeAzGCL7ppEFtU37oJHT8aAK4ldjPj/iW06cfN6LHrb?=
 =?iso-8859-1?Q?WcHfTvFdHDaEJK+08v70Gs+FXDgJ0ExQEP0b5t1S6i7czNbU7GtUP4IA73?=
 =?iso-8859-1?Q?wTTknLoU7Syeac54IKmoRQ0KLq0+ZPB/vRw9qaDeSIp44Hns8iatxtSP+q?=
 =?iso-8859-1?Q?x65M5+0Ud76X9dhRPErGGmELF4ztogiLXBe+iZSqcuH9eeeREUUQi0ZxvL?=
 =?iso-8859-1?Q?QoYtUDpPVu4390GsLkMhaP4ktc5r4UTmRRJKNtQMxr4TjY5hJC66h1RHtx?=
 =?iso-8859-1?Q?0DKKI3DMhIqDCWGnMGzxiXuzOId0SAnfAWfRRZp8yk5Z8Ah5weyCE9X34d?=
 =?iso-8859-1?Q?A9EcgGiMY3+iaZpdpPcKdjnnQAKcNzbHgcSki5gxDTkWl2YO5FBDYBCVO3?=
 =?iso-8859-1?Q?Hz8YosMm5Ecm3GtrStchykdaw2HAgP5mZsiG08sIJ+z3kJxRsEBvsU/LxT?=
 =?iso-8859-1?Q?+U3ys/L7bFH9kB8UenC90KSrwdpX/0VsyGdScy6P4wJW+/oHsy9vEg+i9s?=
 =?iso-8859-1?Q?iCmsKdUqgzxa8Y87bcu1ySuZP5Qhps1jyvtDowzqEwIZyr143X6vfvgodp?=
 =?iso-8859-1?Q?ztiszPSDs3JH8JUHz6vya9Chsi+gloXaRe2IHXtmISW0qobEAqoxg7M/Pc?=
 =?iso-8859-1?Q?+PbaSHTag8CtrizZS/VT37GHI54/B+ZXLCjgTZHcYCUa51LnDEfVuQ3AgY?=
 =?iso-8859-1?Q?FYpk6NQ3s0OGEFopQ26RRxDntOgd3vjgnbPw9ceAIFtrkRMPxMml4xo2Zr?=
 =?iso-8859-1?Q?F4mTdXsikxbCQu0EyuGcKbXuXXu5Kmnu53SMbp0MXKOs3Mj6ouS8P1/b5B?=
 =?iso-8859-1?Q?DaiaTyV1IxerEEH62ASlYYNNtN+A65F5rrwWXhKbcPApvIOgeHT6EWZznV?=
 =?iso-8859-1?Q?vXSwDO+1+uqAQUbityCkoCOeyjeeNR+bN6dLndDCYDQeN5Rl9hHk5n656B?=
 =?iso-8859-1?Q?3CnMBS0XT2xqtKWZ61+a/VI8bTlavqXe01F7P/hFa1sySxYexl9abs2Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba9354a-9a1d-40d7-7a61-08dd67ef4e2a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 20:39:26.4788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVjFtAKwKi3g9Sei5sw+SvfaygIGC1tcFGs6HOalZYo1FIGgVU4jd+uQCJBFfcNJExcD6VJfggV2ByirNGCi3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6903
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

On Thu, Mar 20, 2025 at 05:29:58PM +0000, Matthew Auld wrote:
> Handle the case where the hmm range partially covers a huge page (like
> 2M), otherwise we can potentially end up doing something nasty like
> mapping memory which potentially is outside the range, and maybe not
> even mapped by the mm. Fix is based on the xe userptr code, which in a
> future patch will directly use gpusvm, so needs alignment here.
> 
> Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 2451c816edd5..48993cef4a74 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -817,6 +817,27 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
>  	return range;
>  }
>  
> +/*
> + * To allow skipping PFNs with the same flags (like when they belong to
> + * the same huge PTE) when looping over the pfn array, take a given a hmm_pfn,
> + * and return the largest order that will fit inside the PTE, but also crucially
> + * accounting for the original hmm range boundaries.
> + */

I'd make this proper kernel doc given all of drm_gpusvm.c has proper kernel doc.

Otherwise LGTM.

Matt

> +static unsigned int drm_gpusvm_hmm_pfn_to_order(unsigned long hmm_pfn,
> +						unsigned long hmm_pfn_index,
> +						unsigned long npages)
> +{
> +	unsigned long size;
> +
> +	size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
> +	size -= (hmm_pfn & ~HMM_PFN_FLAGS) & (size - 1);
> +	hmm_pfn_index += size;
> +	if (hmm_pfn_index > npages)
> +		size -= (hmm_pfn_index - npages);
> +
> +	return fls(size) - 1;
> +}
> +
>  /**
>   * drm_gpusvm_check_pages() - Check pages
>   * @gpusvm: Pointer to the GPU SVM structure
> @@ -875,7 +896,7 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
>  			err = -EFAULT;
>  			goto err_free;
>  		}
> -		i += 0x1 << hmm_pfn_to_map_order(pfns[i]);
> +		i += 0x1 << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>  	}
>  
>  err_free:
> @@ -1408,7 +1429,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  	for (i = 0, j = 0; i < npages; ++j) {
>  		struct page *page = hmm_pfn_to_page(pfns[i]);
>  
> -		order = hmm_pfn_to_map_order(pfns[i]);
> +		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>  		if (is_device_private_page(page) ||
>  		    is_device_coherent_page(page)) {
>  			if (zdd != page->zone_device_data && i > 0) {
> -- 
> 2.48.1
> 
