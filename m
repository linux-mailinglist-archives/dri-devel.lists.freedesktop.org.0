Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CD4CCDBE3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 22:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238D010E415;
	Thu, 18 Dec 2025 21:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/yg1gPI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09A210E3D7;
 Thu, 18 Dec 2025 21:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766095159; x=1797631159;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Eh2JXrRCNn55xIJFgoDwVs/XDtWILhwAEdEJR3ZClDo=;
 b=C/yg1gPIRyH0Gog+BICnsh4FO7MT/LaW6L/6eLzrvSb24lu5WgIAacgh
 1eIxLI2WPH5BQB22LLkIK8sFmhziMku0fiWyZNxoPlKBmdACBpT7iiCMt
 nIzSlZ1ywFKFzYxYADn73MuIqALCw0RaKlcqWHu8ArbNo/ctQ5mRrCDOe
 TroBshi2IXvgMw5OCTaeWkt3TAM8tumCjww41K0Dwb2NRw4JOcrdAKnbe
 B1aFzSV4825YUirohnl9+eO2oCQsBzje3D5e+HjjXcH3j5eQg4o0l2+YC
 HTYDkofyQTjETvKuowukj8UZmIb2nqvpTDHbevhly4bbMODljVEGsejhg w==;
X-CSE-ConnectionGUID: 2HXomzG7RoGUduz5Urfh8w==
X-CSE-MsgGUID: TlfHFnxYQ3+RD5SJjeZAMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71690230"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="71690230"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:59:19 -0800
X-CSE-ConnectionGUID: 1Obn7A/ZTHqSdnY5eYHRVQ==
X-CSE-MsgGUID: MzZmahHHTbOcpfmH8q2tsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198600921"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:59:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:59:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 13:59:17 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:59:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEzvaJX5dtvOY4ItAsTmtic2DaztnFfkBdmtdZk+nItzw1T2eUKqk6wbcTYnwr7mdfnw5l0092JEMBwc57zIhuOkpI2IkSe/YoevodByGZFJjovPDJWtDmWsqlRDtfqnILXDSO1NbJtt5idz3AbwO9vJt9bhbMoAYFo5XpxG43QJLQjecP2hxRcryfDERCgXBOdcwgT1vlKvVttzf/Ttr2Wb9zOs7W6YS1WErEzvlz0zlRm9QhGmcju3GyBE74cuNNOKkRxTwfepqCGOYKcu4iPdBp/8wwCB5ctI/TnE7V2VrYkV4ZT+oar/ULjjgv0eZa0SclRdLbbU30rI1usKPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ujl/ItFQaWR30hIklhh9kL1PJH4+cIERASkdytwlytg=;
 b=MWBI2RZDNG8HQqCG8nyUpqyrUPptePqvi4k09f4L3TMICmmwOPPFOYrTHn0d1r/0SGndecZxNoB1Ux9pWP/kA8RUMXg9ufbtAOrKK0hFpZ28UWidt77WmrFdMuJFpYoufHdLvfgG4yf1Nsrv/iiytgaA69rrrgruVTtRwWejvOnd30qDsdnQJy1eTwzRdz2LvvG5r4wvBGOh9CHenFZ1zVVSKNV+1Mn9b+qjdHMWRtgeo8aBusZQpZlIkjlERY60sMNe3ZBaFwwQpCoWtdKqKFB3buhsTF4EK+0mLFHXKKYds/68Tr53Uha+op08LBskQe+OvdBQ3I0/4kdARY5lnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 21:59:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:59:13 +0000
Date: Thu, 18 Dec 2025 13:59:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/pagemap: Unlock and put folios when possible
Message-ID: <aUR5LifU3Wk2BQ3G@lstrano-desk.jf.intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251216201206.1660899-3-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 81655cba-62f9-4063-1238-08de3e80adf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1oBkQkUKyefR+CiSWuJbg8JLtmtHgfDL4yb25/hHvn9HDUvaFEC6Fnjx6qA+?=
 =?us-ascii?Q?ILlfyiMgUwmg4CXV/kvDOYJKdCAOAVyTyO5405E7yW/rGOCHxKO3X5eFdsF2?=
 =?us-ascii?Q?z7OcoTpEPNjQepX8VPzTrdUHR1eniTpFy+CjbcngYhi7G99u13JsB5re5TPs?=
 =?us-ascii?Q?wOnt8TKL0ePDlZqxAr88VSzIgg9fwDvRStfjcdcuDApbighKPlEpqbr4PTwc?=
 =?us-ascii?Q?jbobUtDl1X8IZ07A7dW9zXqsuw701Ab1+EV+IQ00hnyPlSAsXYq6xt0cdjrn?=
 =?us-ascii?Q?64+hS2tixAEM57yjwGxjGDbphV3OLU4/VXGcN9TzHVrWKBjqbdRnys01UmMX?=
 =?us-ascii?Q?CKCShdZyR78Gtz1RmFrZoFSucbXt4LoyfgK3/7gUsAxnlFlV9UJI8IFee/Sz?=
 =?us-ascii?Q?0L7eVZOYrs+F88F663z9wVz7zaovpxT2jJkhwxeaY6h9WuNq2/Xmik6BgrTy?=
 =?us-ascii?Q?Y5ghyd317vqcWCm2ZmT0udTjdt8jlu0yWKU/axe1yZYcP0PI/moAN3Ai/agB?=
 =?us-ascii?Q?CYuKArJQyL6mBeGiBTzEcCZUoPhSBrNkojZr8aSwkMKuHq2U0fYz/Fdtzerh?=
 =?us-ascii?Q?+xZdJ9vY+HYzh3Mrj9HboXz4yWZSiNnhaxKvIHa4F7/hbdkxnIscY7XNQgjl?=
 =?us-ascii?Q?uZ3aupz4Z6R7WJ/PL2bRwqYHYYUYCKoy+0h2E7SalQYqW4pCF5B+o1OJrYIZ?=
 =?us-ascii?Q?wyZcpwtA1EidHGxRPYRmPMLpVj8gulQDAl4Ehz0j1Y7ExLv1lt6V4M4Udq/x?=
 =?us-ascii?Q?Y3bk10m0prwkcpmJ2TO0Yh2/GYTEtGNpsRuMPFV34cAKOmfwflVrGw5swLdq?=
 =?us-ascii?Q?GFNqMBiGJZl4VX6uAKk9WLCDZtiqnbwdMmYcA5vFpM5TLC1HHyv8kd98c2at?=
 =?us-ascii?Q?2TmjSbvKHM5xYT+gvOQs6IHIWre1L06Nb76pIJqCda92aWcvvFlzHgniwTGR?=
 =?us-ascii?Q?3eyKpuPAaFwzSCahFkb2AxPZTB38ZTkb5kZ/vhKLahx/kM0zmu0UwTTvnCpj?=
 =?us-ascii?Q?xwyNDbIAcrnquj4GORitkWbM8V8jW0I63g8n+QfpijLtRxRlEJbN4907Uh8Z?=
 =?us-ascii?Q?WvyY5YjVuK0DOD8UDAkd3O50hPU8VOIrKSjd4bzyfo/WuLu3aOrh6/7kUvTR?=
 =?us-ascii?Q?sxPjYrz4kw2Be0McNcy2UUogOWhrYGmoW8DOy6nJwhHAMVOZsXG17Uw7ZMDT?=
 =?us-ascii?Q?yBlcIkVaD3LAy2x2J3IGfTlvW7tfhEP19oUQzpTuwiFdf5rpzl5gW/SBIGa7?=
 =?us-ascii?Q?JMnLrYsf31b1ONvU4pGmsulxMzDw0I0VpOwEwkC0zXwtScEmPhyiR5TO/BzS?=
 =?us-ascii?Q?8DEJiv698zI1cKWh/kPweoL8BT6rVUl/obtYOYzHsUM4Xc/iobj5HOwZ96LX?=
 =?us-ascii?Q?5xK4Uwa2HN9GzcnLmoW0WhFEffatQuHeiUiq91WFSdrQ9Xr+x1742tCKDt9g?=
 =?us-ascii?Q?4IQior38G/bV/wZF0K72PzCgzKB8vSth?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f8rL3bZ6N2VxDcsZHaXt9z+ZqqjXugRuuFWG3Wcren5xHM/o9puF09gTBjnm?=
 =?us-ascii?Q?hqt3VQDeZ5e5KAwy5EpRbDrqcEb7xmwomj9AOlb2RFZDzRrA5aq6odoAmw32?=
 =?us-ascii?Q?EBZYj/VvHjh453FRxEDR/shJWk/t8KjGvRQvHmIjH+rCe87mTyf/S6c8NTGl?=
 =?us-ascii?Q?zKg78DZpha2UCXiWhltrfECbJikmdm+4VTgBKs1clozvqVyw74wAfl1rsRIl?=
 =?us-ascii?Q?30nfHrdLsPPIR02ga7/FjRhP9H2L/5RGZBj2fqxqKAd8K8S0w7CDt9we+2jY?=
 =?us-ascii?Q?ZpR7oFZ4vnhpWZEwAbEYFUhz/puQsSX+TUzXNypkMEz48Njabv2SGe49N+6Q?=
 =?us-ascii?Q?lp8nI1JS8r9yDsklRselHtIzXknAKPG8Jz6MrgnBuGDcxaSX9R6CGYc3PwKQ?=
 =?us-ascii?Q?o5M482gHy34ssY0W5Mrwi0RpwQZMUesbmJY4h/e5SvkOlP35OPxsWUSK1R8P?=
 =?us-ascii?Q?HbQ81NKfH0ZwWkEzLfy6Np2KnT3INdnZtMDVmqjqoFQ9YtrKSLly1vj9Dhrw?=
 =?us-ascii?Q?KNs5z2+9KvZZexcIsSIsm1ht0X8EFwQo2t521pgmHZDI5cIEDW6LeqOuzVMc?=
 =?us-ascii?Q?2FHOEYCT9OVco5QRaBodLct7O3Ijfmr3dfajsga6cGeDv/lYqdCUI9FVZjhz?=
 =?us-ascii?Q?RlhTdSVS+FT6xW38o7cU9IT2zHnz1uPZD9kQ77hK/8MdFIO3ckJtYSnOBRfT?=
 =?us-ascii?Q?MWgkckqDT0rTG7sl57uLhyROYfKWzxgQ51enFwdjWzbc5VYPlTdAZdz4bNbI?=
 =?us-ascii?Q?a/TlunBmQnFHcSo9j8mYhZwXRYz6TU+4iUzECMDvQPx+1FfnnuC8q5RSxOuz?=
 =?us-ascii?Q?p6m/nnvy9LkFMueeK/bpGBC4mRqWFaYmTzGMv2CSeS+v2O6v8vyN1cYUkH6Q?=
 =?us-ascii?Q?FbYPx3Fpsl0MjF4nkzIcRTat8KC+1yDE9dTryc/HItgBixa4nBiBWFLriNkJ?=
 =?us-ascii?Q?hU1WDtSH9mYIODfv/bvFoUfwJmrnJMb5p623We/XeDyclNcipq7SclDf5PSo?=
 =?us-ascii?Q?Kj82ISLsFWgtCRAH+sG7wVz8sIgeE7Wkm6lkJFC9mlb85VtMMCM8RyH5TmC8?=
 =?us-ascii?Q?amHFNKYkgySGFQYd21sv0pB0z+cZkC32PeuVIVCQYajg39T6mSX71AldvVt3?=
 =?us-ascii?Q?PtACLvThXujHbS/d2OHj3HONEhJoAzkCPzqJ8R4q8DqlaPhvVPVq/xgKSEfn?=
 =?us-ascii?Q?HZPppXidUi/WJl/XUqpIHohCDVcfh5ssg3iPoUQYUeId3Uj8qWyRYtGtImhs?=
 =?us-ascii?Q?UqM7/XU/t2DmBL1Dc3RYZRWdQw3KbxzXZ+WocMLAVkKuNum/pQZAdgcu8q0Z?=
 =?us-ascii?Q?coDSppqq08pslek/xHyYGoIRIrCv3F44nEAiOtnIWIJlEzL3e3+fl1O1IRfk?=
 =?us-ascii?Q?LbNZB1rU4uv2+/2v/LUaUkHNXn26l35UuOi2ztIOn5ZyY75teMDeuXiITjZJ?=
 =?us-ascii?Q?9k8e0wjM04z6177Wk0F6WoHY2DXsXQUt7iaiszAfHfs5D1jgRrmYr9kgszAs?=
 =?us-ascii?Q?YmECuhV7s/70QYoNgq4y62BCEgXanhPUDexW/xw5u7j73C3Cyi5k33/oqW1h?=
 =?us-ascii?Q?04Lz+QK1XUVgsKnNF6PEuz3Df2d6UKmYcNXisrLRvWi6nPxeHag8vvEgzwXC?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81655cba-62f9-4063-1238-08de3e80adf1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 21:59:12.9579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +opS0GT2IwJv20LRWLiayzB2VvGUbJwD30cUc5sTWPGUUcgnlGJEkodf2CAwdvQvIlW0yd5mUPSFEdggzDvY4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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

On Tue, Dec 16, 2025 at 09:10:12PM +0100, Francois Dugast wrote:
> If the page is part of a folio, unlock and put the whole folio at once
> instead of individual pages one after the other. This will reduce the
> amount of operations once device THP are in use.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_pagemap.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 37d7cfbbb3e8..491de9275add 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -149,15 +149,15 @@ static void drm_pagemap_zdd_put(struct drm_pagemap_zdd *zdd)
>  }
>  
>  /**
> - * drm_pagemap_migration_unlock_put_page() - Put a migration page
> - * @page: Pointer to the page to put
> + * drm_pagemap_migration_unlock_put_folio() - Put a migration folio
> + * @folio: Pointer to the folio to put
>   *
> - * This function unlocks and puts a page.
> + * This function unlocks and puts a folio.
>   */
> -static void drm_pagemap_migration_unlock_put_page(struct page *page)
> +static void drm_pagemap_migration_unlock_put_folio(struct folio *folio)
>  {
> -	unlock_page(page);
> -	put_page(page);
> +	folio_unlock(folio);
> +	folio_put(folio);
>  }
>  
>  /**
> @@ -172,15 +172,23 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
>  {
>  	unsigned long i;
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		struct page *page;
> +		struct folio *folio;
> +		unsigned int order = 0;
>  
>  		if (!migrate_pfn[i])
> -			continue;
> +			goto next;
>  
>  		page = migrate_pfn_to_page(migrate_pfn[i]);
> -		drm_pagemap_migration_unlock_put_page(page);
> +		folio = page_folio(page);
> +		order = folio_order(folio);
> +
> +		drm_pagemap_migration_unlock_put_folio(folio);
>  		migrate_pfn[i] = 0;
> +
> +next:
> +		i += NR_PAGES(order);
>  	}
>  }
>  
> -- 
> 2.43.0
> 
