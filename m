Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9886ECCDC57
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 23:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C734A10EBAB;
	Thu, 18 Dec 2025 22:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eS1+VMA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ACA10E124;
 Thu, 18 Dec 2025 22:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766096371; x=1797632371;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZGJTG76+5GiH9k7WSB2YDCfz8uJ/JzLXpk67JdZHsmY=;
 b=eS1+VMA6k0beg8fLKNLCaFygJ47Pp7jWAS4+xkLZ1OJ6QOPwMoAXnc0G
 c3VhZZXMSkl/EY3H8if6bdl1/jPK2mqQauVNshwm5efPvluD96cAK1n2P
 4onkj7Iy11uyw/JEedYHP7DNmIQMsLa+Jy6Aed7OzzlkLQ7gRz5vVDkur
 mOTiPZs2hCll7KmMZZq6vlXjfiME8LyHRG4/QIsxso0Gzb0lGTNFEAtEL
 rSE0j7Bph/LpzOf7qH0OYXq/y3kWnnHF4qwjDAiu6cdvE49l+hS3m/idc
 DjzlcgIeep6Q6urHiAdC4KWU1SHkxlVtKP2H6PDQf73vTSaoCmL2AHVRQ w==;
X-CSE-ConnectionGUID: wtGH7hlMS5arTWKS2bijLw==
X-CSE-MsgGUID: 6wLYhkiiRBSgznXMn/5/aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85480956"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="85480956"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:19:31 -0800
X-CSE-ConnectionGUID: WGMxIVDrTJizvA/4njfSmA==
X-CSE-MsgGUID: +1hRf6aTS9uuyrF9WVZvnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="203215486"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:19:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:19:30 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 14:19:30 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:19:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGPY7c1xowIXYnuROWJTtTE7auoHFzpwvOV+IPk6i4PO6G6npCGHqg5VD5JGjip55PXQi9nMnnx1QSpuVs4u/vLVMsTpoDAKHLAFcpfWl1Qr00IRAcpN5kIERwBAdl2dWuEU33qtVsn122NFcJSuY1ig7MyxcOeHiU6f788GS2nuTMoQEvf7Z0RneZA78AXNolqdakyVeKNFKJKf04sESGEctWPBG1xm6gi4s32i7R6j+VKj08G+mX8/elglO8HgTxarmE/JOpO2cXyWZ4+ZGdTBA+T/zwZdQy4Yt03aPr168Mw2lL07oj2sf2wjK91iWn+vH+Wq+DXq1MUr+XK/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DN5hHtm1PkFMj4VCANpGkNFZYBrQyuWU8xUVd8VMSw=;
 b=q8NWA87nhr65sW7lEqjAOGhRHR5xIdZSdMVvKT2ujaR2cORxzjSNG59TZajrAoZxmu60OQWuJD6ktZ4cPM7WzOd5phy40XWSPxAo+HifsPOA3XtbDZH4ptsoNwpnwmGKDDvdxwdYUD+bml4lpbVxnm0+DVGfQwRk+MJC2M5wqE6BTVbW7dvb6PoM9c32x7qM5mjQI2m2G3PMcF6mtxMZYMNkWGsFjXglzjRgxHovIVE1IpHsUzpjAXgix1/GvYuTNFZ5/1SQC0U7TmCHI9jlMgQPzSde5skRC08ovHKfw+lX4g2Fdz7keB9vM6/dVOdiljH+AaIH0PD3C1pWkjeAfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6121.namprd11.prod.outlook.com (2603:10b6:208:3ef::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 22:19:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:19:27 +0000
Date: Thu, 18 Dec 2025 14:19:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/pagemap: Add helper to access zone_device_data
Message-ID: <aUR97HW9UGMHObuf@lstrano-desk.jf.intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251216201206.1660899-4-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea5e87f-bcd8-43d8-0ef7-08de3e838197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MrcrtTkgx9rb24Y9qzbJHgPjOmh2ZQ8JkjsHp3d6BqbXfVa5sy+EYUe8CxWk?=
 =?us-ascii?Q?XLEIOcggQlFVabD69HwR6mJ6ydc4Kw/XdnvlNMbZu61UBs0Djk4YPx/Hcyj5?=
 =?us-ascii?Q?uFfAwxQ1bjYMfupcm+o8OR6I3cvoZkr2ZYv80F0s/FNNyGQpKaVVwm6TjHXL?=
 =?us-ascii?Q?z4WxLVabjJ/XCBzGtdi+Fku1Rep/tWe7hwwMdNGkYk2Er7+2CvYm0ULAfZw6?=
 =?us-ascii?Q?KkyYLAbpIcHKFRSVcFbww8nR5Oa2tv8VSpm6kQ/pAx+LePXKt3PyR5MW3QZO?=
 =?us-ascii?Q?ByGtUvA8U07UNSzWAmkJLCjXLnJheqDCs8wY9NVJTviM9OQan9lPPlyjN6sF?=
 =?us-ascii?Q?jPN90xUOa0pmvd4am0BE9SNjSLTwxjnYt7kN12rNKmTkJaYmxr6uLp7xD3kD?=
 =?us-ascii?Q?BXyLptDFk/8MBcLHfYT+AAMC/GyRlqYH2dKxVmubsdLUeLcZVDXfk8AFlaDv?=
 =?us-ascii?Q?nBnyCMp9eptIlMGhlBa000YRV0UmUSzjkNRaiDjw1K5+JXN6OK1HlPm6GJE6?=
 =?us-ascii?Q?CRT5O5UWcaoZVYpl3IHoBMZp0FW5ovaERnCvEzmVctpt06y7omH5VVgxgjSM?=
 =?us-ascii?Q?9bvjV5y6T48AJYJ4SG8/RCvrW5iwgHo6sp0JZcHHKZqOz07PmAKc6LaYPpWs?=
 =?us-ascii?Q?FYn2Kj+et+zz5FdF2XSOeYCbE8VuEDv5uw+qi2JMyL59GKijC1scqdhJ/+Vy?=
 =?us-ascii?Q?8MAL4a6zDfG/V7tYyQnUFGdkZgk4W1uUGxzXCdydodwiR1T/3tc9JY/0tK7b?=
 =?us-ascii?Q?GFN9cPFivW+ML1b43d6DBLC0GUkG1Xp4y0c7dDEXQyBn5BOLkuvv94JCiiSz?=
 =?us-ascii?Q?gJyX8I0jMnkHrfj6apvAuTqBG5xT23Obeg5kfra9AAhX/6qimvQAgeDlbUjd?=
 =?us-ascii?Q?VipHmLjIFIBhrxontEY3Rm4K4sSr345tRvSoyBBsxOl/tZutQGQm5WGfYXsi?=
 =?us-ascii?Q?EMnYv6m00YRvV1uaj1EMLRvm7D4cDHaUJqMvCJR9Lrk1RnWErbnJBTPdidLn?=
 =?us-ascii?Q?sphKk2POj6b8UVvZUPzyAofqMDZnhXzz/yTs4MYgBWBuA7965XfmuoXanlxf?=
 =?us-ascii?Q?ZkfURHukgJ0NjwyfGyXzVqMRk2Ooe25WFrDrVvID/xFjuXIX7vtdHAEGkG7l?=
 =?us-ascii?Q?6ibpPrS4BWUotqDa4nBousU1rA3sWVWY4XnmJh2kopaAwLGm31Vpbi5iOM69?=
 =?us-ascii?Q?4pCnywOdC6o4Zk5BB1ZF+PCODuykC5ZnAxzQzBRjJsI491FQMfLilquyyr0t?=
 =?us-ascii?Q?Zm1wNsoYWiHQI1WBOxC4PsM7h7o8kbuTa64apMC8MK13QCMa5OF0Jk1saDVv?=
 =?us-ascii?Q?Mf22+S8EWtFD3hLwFLKtrJ71wGbHQFz4ghn7umQooJZ2/DJV0oW4xsLnzQ0T?=
 =?us-ascii?Q?VpS0nRn6fwe+lwnaTW//vURFx3p8s3ikQkciVcSlHDy07VqcDoOvg9BmQgtn?=
 =?us-ascii?Q?FzVS2/voqa/FLP52a/oP6nN9KaHjCufF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aZd8InXFdJQZDK3OmpI5DxEHGBqtzfOUdUbvzG0QEw4jWdYBhkXfDWiKoxGC?=
 =?us-ascii?Q?YRmM51qSxNxr/9VyDJgySp4qooKwy/B4yImx/mtLx2+RPolPO4p9jQVwr956?=
 =?us-ascii?Q?d5CuA7Cv3S6FlFCvUtB1q29q0Bs11dQQOTRR/oqHETCf8yqLFgGOO0tbOTC/?=
 =?us-ascii?Q?+DS4Pny7eAw+z+iJNWkm25yRhHtvR/xkkENZUiuHxbrHmv4FuDBkevROqY9n?=
 =?us-ascii?Q?dCGAz0m2lvzY7AeE+Qcw3LlbpImwXFyiSXOgpa9vCyC7NUd7hFKdDmqhFbgl?=
 =?us-ascii?Q?JKgmd7hZg9sQp6e334hej5tIaLhfbVexc85Im4WyMKyp68Uv1rFX7O7gJYMs?=
 =?us-ascii?Q?l88LoAMW6ltV1Feejo3K/CRHvzqMTVwwB4YxZRoyDPHc1dmPuQbzuCzOdG2c?=
 =?us-ascii?Q?2QpLalqThD4f2dBEgRxJFpUChqpBaG2LvJlbVO46X5Vp1g7XEMfXKsHlSYEF?=
 =?us-ascii?Q?FQX3pBTYyUTh1QWeJQcV84m0bejzHfYw2t6b2qN9c9VFQz4rRbmObq/Z/Zfy?=
 =?us-ascii?Q?9oIEMzcpIPlRVFve+fkuINfEMgajy3lqtd86558hVz3v2sg6VSFbLUes04ZU?=
 =?us-ascii?Q?zqq9BVZrE7NCL3tAhgbpWjBClRI4G5D5QJwQSTBF2tC5YkW6Qb7M+2J6R16a?=
 =?us-ascii?Q?kla0spmGsAsd4OExmBKb2EEtA98bG2oC/h7/9PjQnSdOIXvhcHxxOL6MoRNE?=
 =?us-ascii?Q?JInOASoaKWwZ4iBXDbmuob/7yiufg7Ix3ibEd0UxBtYmP4dM13R9x3ds2LHw?=
 =?us-ascii?Q?e16wKD//+WH+4oEdGiEUeKf3sfcsyYnPdJdi3FelH8YhWxJ3Ej4txmCM53bf?=
 =?us-ascii?Q?F97bOPQqq1fBvEdiy5RLjoSnVudQQ1UoItoZX0bRGXISd+rSj6Ba91m/VdZh?=
 =?us-ascii?Q?IoNxzl9es6kBeaAp5ZhfvOrvwdzmtRs550zunOTKTnY3oa2GADWFql3+H5bn?=
 =?us-ascii?Q?F8k9zMqfH8dbtchTjf2hvMAicv7sOxyXEeY8asZdJgo41jYmFwu2/JhmT0M5?=
 =?us-ascii?Q?uWJk9JdQol9I2VbB8NZQaAyDhdm2PqulBIGelCCVv1HcIqM9Hwwk3foE6xz1?=
 =?us-ascii?Q?tyAS0TEricR76rYmhY/9c/90lBqu294upWrGDmJO6p1/MKA6lr7uxpwmVihb?=
 =?us-ascii?Q?ukVjrhMK86HtGKsYVQxlig2+NC4dslfrk7t0zoynVIVvJRJzkroQPZ3pI6c1?=
 =?us-ascii?Q?CVS8gySgYUP/gO2WgOwdAnbGAxNzVYK9umop2gw5RjGoe4+XtpfjQP9juoAD?=
 =?us-ascii?Q?QhJhrjSYtqEKRZEVSdsxW/t6/ziO5Tp8Ky4Q4vbs8ySHRkyzBUZ3PCqRNonV?=
 =?us-ascii?Q?1LN8rzeV5WatqfXPL0N49z3bkqSEz8hNJTp1gM2/ayQ6uovjRQbkcfj7T+Cc?=
 =?us-ascii?Q?QDSwRqkReKsepiWwKtsHndC8H8x5jTQ+Q0+nnSCmI35ibpUNFJoCKLLG3KG7?=
 =?us-ascii?Q?pIzA5YRj7jBcaBqcg4AgjCIrGr7nwu5sYTaMsRaNyS853VlOTTZYu7KC5WBy?=
 =?us-ascii?Q?fYPO9RgezkcfKVKFjOX2bzzgtjhF61VoDFB7fa6xF4Bsxml1UfoTNt6oiMxz?=
 =?us-ascii?Q?1yoFAuroCu7zxwSkwt2y2ZDTs2w3svV4EKD4xXEdJmOWzfeTFw4KrW+Yj0GE?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea5e87f-bcd8-43d8-0ef7-08de3e838197
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 22:19:27.0708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xamclHhP56FE/UtS2Ndy/1EvJejDyixioWwDpiDZHxaXE7xags3bU1/n2QXrZnLpUOhLTA0ToXdQBB0KJnb/Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6121
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

On Tue, Dec 16, 2025 at 09:10:13PM +0100, Francois Dugast wrote:
> This new helper helps ensure all accesses to zone_device_data use the
> correct API whether the page is part of a folio or not.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c  |  7 +++++--
>  drivers/gpu/drm/drm_pagemap.c | 32 +++++++++++++++++++++++++-------
>  include/drm/drm_pagemap.h     |  2 ++
>  3 files changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 39c8c50401dd..d0ff6b65e543 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1366,12 +1366,15 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
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
> index 491de9275add..b71e47136112 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -192,6 +192,22 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
>  	}
>  }
>  
> +/**
> + * drm_pagemap_page_zone_device_data() - Page to zone_device_data
> + * @page: Pointer to the page
> + *
> + * Return: Page's zone_device_data
> + */
> +void *drm_pagemap_page_zone_device_data(struct page *page)
> +{
> +	struct folio *folio = page_folio(page);
> +

I think we can actually just do:

return folio_zone_device_data(folio)

We still need the helper as if page is part of a folio the individual
page->zone_device_data could be NULL.

Also since this called from GPU SVM maybe make this an inline in
drm_pagemap.h too. We'd have to include 'linux/memremap.h' in
drm_pagemap.h but I don't that is a huge deal. 

Matt

> +	if (folio_order(folio))
> +		return folio_zone_device_data(folio);
> +
> +	return page->zone_device_data;
> +}
> +
>  /**
>   * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
>   * @page: Pointer to the page
> @@ -481,8 +497,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
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
> @@ -670,7 +686,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	int i, err = 0;
>  
>  	if (page) {
> -		zdd = page->zone_device_data;
> +		zdd = drm_pagemap_page_zone_device_data(page);
>  		if (time_before64(get_jiffies_64(),
>  				  zdd->devmem_allocation->timeslice_expiration))
>  			return 0;
> @@ -722,7 +738,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  		if (!page)
>  			goto err_finalize;
>  	}
> -	zdd = page->zone_device_data;
> +	zdd = drm_pagemap_page_zone_device_data(page);
>  	ops = zdd->devmem_allocation->ops;
>  	dev = zdd->devmem_allocation->dev;
>  
> @@ -768,7 +784,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
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
> @@ -784,7 +802,7 @@ static void drm_pagemap_folio_free(struct folio *folio)
>   */
>  static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
>  {
> -	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
> +	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(vmf->page);
>  	int err;
>  
>  	err = __drm_pagemap_migrate_to_ram(vmf->vma,
> @@ -847,7 +865,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
>   */
>  struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
>  {
> -	struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
>  
>  	return zdd->devmem_allocation->dpagemap;
>  }
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index f6e7e234c089..3a8d0e1cef43 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -245,4 +245,6 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  			    struct mm_struct *mm,
>  			    unsigned long timeslice_ms);
>  
> +void *drm_pagemap_page_zone_device_data(struct page *page);
> +
>  #endif
> -- 
> 2.43.0
> 
