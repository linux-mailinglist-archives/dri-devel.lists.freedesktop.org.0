Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3660A44E65
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F86410E7EF;
	Tue, 25 Feb 2025 21:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5Z17FmN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C268410E7E9;
 Tue, 25 Feb 2025 21:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740517783; x=1772053783;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D+1gnSWktHyHXBXq1basasH3hB9gyxPJUsxsJ2Su++w=;
 b=b5Z17FmNfLG1lojVAoZbbTG26e5/iBkNGDesrS50omYSH3/v6n90s5J/
 n/C+eMeDbaRULfYGKNmhRqs9TJlwx8Hk9bE679woJYHF62sIt7iBToru3
 VvGXogMuhsGjvHf+iJRG3FJ7snntPCmT2q6nv3hweO4JgUTYIxeZhknXm
 FTmKzSSQAtehArXPcvIM/5doNmJE48U2LYJl5SBq4+N/tXkAN3o1b5YzP
 0Ki++qLMUDUPix1JUATZKGedruCkhelo33N+BD0AuRDZe+cHI7TOQAa+8
 pcVrVgOfY7+YpLLo1lCIvF1mqumifMLhu6IjC3AwrqaOfqRjbVuy7/Xcz A==;
X-CSE-ConnectionGUID: vgb2SP1dRTijktBG8HOO3A==
X-CSE-MsgGUID: Y7ePfCZwSVq82b48KR8Vzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41365036"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41365036"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 13:09:36 -0800
X-CSE-ConnectionGUID: D0ITMYE0TEeHEeEsybWpeA==
X-CSE-MsgGUID: Fy60eopgTcKLcSrZPOBopA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="147327147"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 13:09:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 13:09:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 13:09:34 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 13:09:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPPCumUYQIN510U796zUfgDzbsjZZQ6ozeRga6Rq9HdDGSrCBaCdUavVUf9jop8I7kk4RetzOK0WmiHV68qV4ymUNye5Vm/LwT2KXtzfYAgKFhcJ+h6cZgWJeWCFdqR2v46H/ICYM304oGD3tVkd5nA/9ieHx9UbsmtvG742//Tuv8pkAKAhyzTSGrI3WHTSLn7h2Ejz5gdYLS17nXH2ZQStrsAzji8yD7esqg2UzIRkN+fYr8kdUwBqEE+FjgBd26+v0N3xNE+nuITt4TX7p+DbjaHqCl8AFTsvlMSPInqzHWNBmRUBZBotGOiggUJ0L8vizuH63Nw2pISBQG1Cuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ix4tLS9RAjZz5/SCm5Pi1N93+0dYhHddIFpweyLAbhY=;
 b=ciBYOnz7uD5CF94Nls1d89qhiiqSg3/U4epftUaR3aiMN4MIcY/TlrW/D9EC/g+lNzySD2pwMcJJ+JvpdYg0jPvnIGX9hsBw0JfGkGt9Ylm8BGIOkN+YhG3xQiDFQ/6IvcrpS9VAJrVA5Ls2uRXdHd5gQF/jNLymeDDEVbK3eDkUlZ8awtUDtQWF/H+iuf+sdliVni5iNieJ0icFNAS2KgDyLWEkbOh0WByJ5V9CRj7BnSi+2KhXPL6+vjGMZ6cErE4hjuxd4Rc64bXfk7QLXEanITGSo/z3NZg8TQgsz+QIRDyPg3CxFFnWoBu83Y2kL8V+nYSZWQwXVzNFrfbfag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 21:09:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 21:09:30 +0000
Date: Tue, 25 Feb 2025 13:10:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tvrtko.ursulin@igalia.com>, <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 3/6] drm/xe/xe_drm_client: Add per drm client
 pagefault info
Message-ID: <Z74xyU3Y8bTSIuv1@lstrano-desk.jf.intel.com>
References: <20250220203832.130430-1-jonathan.cavitt@intel.com>
 <20250220203832.130430-4-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250220203832.130430-4-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:303:85::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cee1a5c-8d72-4c72-1d96-08dd55e0b1be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mLl9vmVDyAmxcIELIe/y3rkOLeHIRHjULmeSDt4bVpjnLmmBna8vX69+9AUN?=
 =?us-ascii?Q?ZlPQg0UKr2S/L2k9rSnKbrxpak7fL7HZxsCu+3Ik3b5Byf8yETw9m/rdxb1C?=
 =?us-ascii?Q?WIDcsXOX1hBI/UoD+aqqgLRLY4dT+EmnVmycia48d7nDNTstyVThzoLt8sp2?=
 =?us-ascii?Q?zjH0goTHc3w6DK9fEhWSRb9Tf6KHS2r7ypP3l6P9wlaKitc6cRaGXKO+44TC?=
 =?us-ascii?Q?C2Fu9U8i3UmGXaPWqJJF1cWBnRhZ6Fem2n4Ok9t+C7ploO/RFLKei2XB820k?=
 =?us-ascii?Q?j1qyWWVk38GCKb5A7AjpAdcguHXYvHHySIy2zTuRKohKNem8lpjJ2M9CwVgn?=
 =?us-ascii?Q?nwAy9G6VIGuk2DZDgl4xXYJ0fjXmojwiSDgbDqJ+R2WLlLlfBm302WkKgL/i?=
 =?us-ascii?Q?PPVqDOsZwf9MR1lGaI6R8hUX/cg+fXhXpsj2Pb4axK9JSGrpzEjdqKz/TVjc?=
 =?us-ascii?Q?c95Lokgptbgmx2E9U23OQGHxtOHwsLj1q+yGAd32xlFu2R2zGoTL2E/TpYVq?=
 =?us-ascii?Q?Q88JNFjJbogLpDE1feJTcaDNi1JirkAI7+cwor8TE8gGiQZHpNzELYu3VJcq?=
 =?us-ascii?Q?HHNjGVFxG+cHZwzwMnhzMOmwqPj6LU/UTOMKY8zELMfxEXZU+90LRBBNRVSp?=
 =?us-ascii?Q?5NksW68poS7621YvVRuUOUC9G9KxnzuyOetL6ZslhD6f5xjUmVy2zdGM5hhB?=
 =?us-ascii?Q?n2p04ffZubhOcG0yLYLkYgtcrZewjB9qKJuURnz46mYcu1/jsELZcMhqlbr4?=
 =?us-ascii?Q?pik9ZE2dasX6UEcfkcy4yFGsWaBju235DXmWJu378rhIeO2uLfrJBVXsJ/kX?=
 =?us-ascii?Q?G3MfMbp1PNL7GPLSSM98hKXjAwVbExFwpOpOfABmccT9D6nDOTSKsNIvE7OI?=
 =?us-ascii?Q?5PGrBGohO6juEZ9W0+nXxQN8TiD/gF7hhRw5S/tTKjz+yU4Up9yyZPWJssEU?=
 =?us-ascii?Q?GcLykXZB8QDiq/+6GsVmj3o6je3dzpdOSAOToMLA/KEJkpHQlxgXHfRuTQdh?=
 =?us-ascii?Q?7jgWenOYpx4cuTwioGiiTNQqMwyCoRJo2nFaxyzWlUkdVL8zDI2GSGr4emL9?=
 =?us-ascii?Q?14wkmExnE0U1YeAwB8CiHlPhJxuy5IFnBxn06GXgHmAI9VUoShE6SEqdINaz?=
 =?us-ascii?Q?YlMSa8hxzkJei9/0DNO3S2bu3CSW+ynRdxx8aH5NRyb53E8MVmVIKcyVYXDl?=
 =?us-ascii?Q?5i20dLOs1aIu2Cinw5GY7L8yktDwSDXSeu5Jghfm7wWS0V6/eTZ+yYFi6rY9?=
 =?us-ascii?Q?XmfMrrhJ2ECDWKq7fMSrDPz4HAQrfk+5dR4xD8OiCkF9pIpD3LeRMF9wl6al?=
 =?us-ascii?Q?q6lql9bfMq4MWRrJAa+bVTf6t0bdW6bKZoeiYDjnxauCll7eAaJHZPGN6o3i?=
 =?us-ascii?Q?8HXyNWjHmROKQ9xi6dbH6OSyNlqE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gcDK4yGEDHnW87gFQ7lLbTDfJXfbNJ99TcEFEHAQi77btiZx2PsQtRq7LZ/Q?=
 =?us-ascii?Q?RRJMapDd58ZC+9jOpxZyiSpjGQosZLQ4tIOAjXi+kYKhHW7U5FZX8kUJWNPz?=
 =?us-ascii?Q?DXfAR6WcZeBMoEEHgG9wtuJ8P1jTCxbAlgy/9L8kpwtyMJm63zxNcZHTG4vx?=
 =?us-ascii?Q?kzTz1f0nBsXybcb+X22KQxhZnGvhv2l6V0vdU5N72fVHSSTRy4kl5jJoJQOC?=
 =?us-ascii?Q?D9pOIpESxiE/IHatbigfS9W2hfYiZaRuay+k0lYgH9vd75QrRQqvvbbcEYCr?=
 =?us-ascii?Q?nHMohMBRS0AGf2LnCQo7s+Wuo2mnPOhb5OpCMyuXS4ZsLh1bdofosWuODOfZ?=
 =?us-ascii?Q?wDVwg8zupAJLbyUxCdw596WJvb5n0Q0ho0g8dKKqlKyOZZO2K+zeah/+p6Zv?=
 =?us-ascii?Q?qTMud95YFVjG+e9d0c2/YL8RIiu+uGty3qd4t+ljMi3FgmKkeYsJsyIq+lPT?=
 =?us-ascii?Q?CbUUnax0RRAuWG0Ubtvwj1gj5RiPkPa27WzK1Qd1BRE+vTU6dIqdPvPTdyZx?=
 =?us-ascii?Q?uOi8tyGZHBupTyWfHt8OfSD5tqHNGr/2rJK301aQvj8K6QYaxnPBqtfVsrem?=
 =?us-ascii?Q?oRZ51NFe8DoS7hkQJeIilJBwTIWUinSRy4FDxxPQzCC5OFus0dYstjc2KIag?=
 =?us-ascii?Q?v+u7CaVnEisWLl64A2oXlHblaibl/BPNAa7GUpPyGLhj8aLo9O9rX2WQd8fU?=
 =?us-ascii?Q?Z483qg6OH2aUQpXGa9Qe1hu+gkD7RP6cwmGhOLtzmLBk19wER/b8A1S6aLP4?=
 =?us-ascii?Q?Fjd0vtm4hRJWaSPrZoC4pdqfAIxGbtgM638Agwe367rDayzsbgAiMjiEW47T?=
 =?us-ascii?Q?TWfS2t/jjmPXZv6p2ZUQ7fjBpo5UiTyS5DhUKH3WAQL7u9dZuDuP1URjuhoe?=
 =?us-ascii?Q?/XSquGeo2KeM7Vi50fDi23k3XTJ8sHjuOXqTIDuy607R680r6L614cs3MBUx?=
 =?us-ascii?Q?e1PYlw24DNCw4WkIfpKcFyxBv57K7tudX74JRmMlCvqu9KSliRABGirF40T2?=
 =?us-ascii?Q?vcDix4MCd+1FfTI/JmhwZtz0qp/W22u1cTfBIJEP0y+R9WJoIrByYlAxzPDT?=
 =?us-ascii?Q?W5hb2i10eh4L6Kz2oupqoHqyhnSb06Nc5i5ttll1Esb+BGgwu5nSYcEAO5Q6?=
 =?us-ascii?Q?+Ng6JaFzA40smAfRHAUmshfCqVqwbVK+sDwpPrSwqoe0Cqx6tGd6BOZCY7Ll?=
 =?us-ascii?Q?rg9cKshy283Y9wgWOlwTGhwUFE5x2uNnwt81nkr4Dhr5R+BakDwkAqEnFsFN?=
 =?us-ascii?Q?rFFiVa6LSPF6LVfaFoe6L2hyDBrab4H2Oni1G4GP7xr1to/sXplYANq1vR1Y?=
 =?us-ascii?Q?5+SPnjL2ukhAYYpAQNNswCQ1/qkjpSk3EtJ9XCugSA6MpnXWxaeoHhsX+9yn?=
 =?us-ascii?Q?c4ZUIL2plEti6CtEbsSoHBv2LxSacmW2hCP88DJwuShEOOLVTMRfwrJFMx76?=
 =?us-ascii?Q?EiEAkwU4j+nQcXI0cDck4fhpxkaW7JZSRsawkUxK1Wu5ZUKHqNhmLmxTHEf3?=
 =?us-ascii?Q?+9JQqqMUtpL2KxUxbjCXwnFZrBBCVMjReex4K7eZmdQwjQTtJZ/xrlgO5V2c?=
 =?us-ascii?Q?Xy5SiAvc1PMfB4JOzeEwgl9TZdmM0MI2RyH1uav0ub754Vl9kyX0nkuJY5NZ?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cee1a5c-8d72-4c72-1d96-08dd55e0b1be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:09:30.1347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCxdAWJk7DL8bvVXV6/wGfBK1P3fuuq6+4BcmSLm+prLkD82WBKUCMjqe0TUv9ASbJRNT3qgIwPBWStn7tOfPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4666
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

On Thu, Feb 20, 2025 at 08:38:29PM +0000, Jonathan Cavitt wrote:
> Add additional information to drm client so it can report up to the last
> 50 exec queues to have been banned on it, as well as the last pagefault
> seen when said exec queues were banned.  Since we cannot reasonably
> associate a pagefault to a specific exec queue, we currently report the
> last seen pagefault on the associated hw engine instead.
> 
> The last pagefault seen per exec queue is saved to the hw engine, and the
> pagefault is updated during the pagefault handling process in
> xe_gt_pagefault.  The last seen pagefault is reset when the engine is
> reset because any future exec queue bans likely were not caused by said
> pagefault after the reset.
> 
> v2: Remove exec queue from blame list on destroy and recreate (Joonas)
> v3: Do not print as part of xe_drm_client_fdinfo (Joonas)
> v4: Fix formatting and kzalloc during lock warnings
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c      | 68 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_drm_client.h      | 42 +++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.c      |  7 +++
>  drivers/gpu/drm/xe/xe_gt_pagefault.c    | 17 +++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c      | 15 ++++++
>  drivers/gpu/drm/xe/xe_hw_engine.c       |  4 ++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  8 +++
>  7 files changed, 161 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 2d4874d2b922..1bc978ae4c2f 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -17,6 +17,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> +#include "xe_gt_pagefault.h"
>  #include "xe_hw_engine.h"
>  #include "xe_pm.h"
>  #include "xe_trace.h"
> @@ -97,6 +98,8 @@ struct xe_drm_client *xe_drm_client_alloc(void)
>  #ifdef CONFIG_PROC_FS
>  	spin_lock_init(&client->bos_lock);
>  	INIT_LIST_HEAD(&client->bos_list);
> +	spin_lock_init(&client->blame_lock);
> +	INIT_LIST_HEAD(&client->blame_list);
>  #endif
>  	return client;
>  }
> @@ -164,6 +167,71 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
>  	xe_drm_client_put(client);
>  }
>  
> +static void free_blame(struct blame *b)
> +{
> +	list_del(&b->list);
> +	kfree(b->pf);
> +	kfree(b);
> +}
> +
> +void xe_drm_client_add_blame(struct xe_drm_client *client,
> +			     struct xe_exec_queue *q)
> +{
> +	struct blame *b = NULL;
> +	struct pagefault *pf = NULL;
> +	struct xe_file *xef = q->xef;
> +	struct xe_hw_engine *hwe = q->hwe;
> +
> +	b = kzalloc(sizeof(*b), GFP_KERNEL);
> +	xe_assert(xef->xe, b);
> +
> +	spin_lock(&client->blame_lock);
> +	list_add_tail(&b->list, &client->blame_list);
> +	client->blame_len++;
> +	/**
> +	 * Limit the number of blames in the blame list to prevent memory overuse.
> +	 */
> +	if (client->blame_len > MAX_BLAME_LEN) {
> +		struct blame *rem = list_first_entry(&client->blame_list, struct blame, list);
> +
> +		free_blame(rem);
> +		client->blame_len--;
> +	}
> +	spin_unlock(&client->blame_lock);
> +
> +	/**
> +	 * Duplicate pagefault on engine to blame, if one may have caused the
> +	 * exec queue to be ban.
> +	 */
> +	b->pf = NULL;
> +	pf = kzalloc(sizeof(*pf), GFP_KERNEL);
> +	spin_lock(&hwe->pf.lock);
> +	if (hwe->pf.info) {
> +		memcpy(pf, hwe->pf.info, sizeof(struct pagefault));
> +		b->pf = pf;
> +	} else {
> +		kfree(pf);
> +	}
> +	spin_unlock(&hwe->pf.lock);
> +
> +	/** Save blame data to list element */
> +	b->exec_queue_id = q->id;
> +}
> +
> +void xe_drm_client_remove_blame(struct xe_drm_client *client,
> +				struct xe_exec_queue *q)
> +{
> +	struct blame *b, *tmp;
> +
> +	spin_lock(&client->blame_lock);
> +	list_for_each_entry_safe(b, tmp, &client->blame_list, list)
> +		if (b->exec_queue_id == q->id) {
> +			free_blame(b);
> +			client->blame_len--;
> +		}
> +	spin_unlock(&client->blame_lock);
> +}
> +
>  static void bo_meminfo(struct xe_bo *bo,
>  		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
>  {
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
> index a9649aa36011..b3d9b279d55f 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.h
> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> @@ -13,9 +13,22 @@
>  #include <linux/sched.h>
>  #include <linux/spinlock.h>
>  
> +#define MAX_BLAME_LEN	50
> +
>  struct drm_file;
>  struct drm_printer;
> +struct pagefault;
>  struct xe_bo;
> +struct xe_exec_queue;
> +
> +struct blame {

blame is not a great name here. How about xe_exec_queue_ban_entry?

> +	/** @exec_queue_id: ID number of banned exec queue */
> +	u32 exec_queue_id;
> +	/** @pf: pagefault on engine of banned exec queue, if any at time */
> +	struct pagefault *pf;

Maybe just embedded the 'struct pagefault' within this structure. I
understand a page fault may or may not be attached here but unsure if it
worth the extra allocation / free to save a little bit of memory. I
don't have strong opinion here, so take it as a suggestion.

> +	/** @list: link into @xe_drm_client.blame_list */
> +	struct list_head list;
> +};
>  
>  struct xe_drm_client {
>  	struct kref kref;
> @@ -31,6 +44,21 @@ struct xe_drm_client {
>  	 * Protected by @bos_lock.
>  	 */
>  	struct list_head bos_list;
> +	/**
> +	 * @blame_lock: lock protecting @blame_list
> +	 */
> +	spinlock_t blame_lock;

Again blame is bad name. See my comment above and adjust the naming
appropriately.

Also I'd use a scoped structure here. e.g.

struct {
	spinlock_t lock;
	struct list_head list;
	unsigned int len;
} blame;

> +	/**
> +	 * @blame_list: list of banned exec queues associated with this drm
> +	 *		client, as well as any pagefaults at time of ban.
> +	 *
> +	 * Protected by @blame_lock;
> +	 */
> +	struct list_head blame_list;
> +	/**
> +	 * @blame_len: length of @blame_list
> +	 */
> +	unsigned int blame_len;
>  #endif
>  };
>  
> @@ -57,6 +85,10 @@ void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
>  void xe_drm_client_add_bo(struct xe_drm_client *client,
>  			  struct xe_bo *bo);
>  void xe_drm_client_remove_bo(struct xe_bo *bo);
> +void xe_drm_client_add_blame(struct xe_drm_client *client,
> +			     struct xe_exec_queue *q);
> +void xe_drm_client_remove_blame(struct xe_drm_client *client,
> +				struct xe_exec_queue *q);
>  #else
>  static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
>  					struct xe_bo *bo)
> @@ -66,5 +98,15 @@ static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
>  static inline void xe_drm_client_remove_bo(struct xe_bo *bo)
>  {
>  }
> +
> +static inline void xe_drm_client_add_blame(struct xe_drm_client *client,
> +					   struct xe_exec_queue *q)
> +{
> +}
> +
> +static inline void xe_drm_client_remove_blame(struct xe_drm_client *client,
> +					      struct xe_exec_queue *q)
> +{
> +}
>  #endif
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 4a98a5d0e405..f8bcf43b2a0e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -13,6 +13,7 @@
>  #include <uapi/drm/xe_drm.h>
>  
>  #include "xe_device.h"
> +#include "xe_drm_client.h"
>  #include "xe_gt.h"
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_hw_engine_group.h"
> @@ -712,6 +713,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	q->id = id;
>  	args->exec_queue_id = id;
>  
> +	/**
> +	 * If an exec queue in the blame list shares the same exec queue
> +	 * ID, remove it from the blame list to avoid confusion.
> +	 */
> +	xe_drm_client_remove_blame(q->xef->client, q);
> +
>  	return 0;
>  
>  kill_exec_queue:
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index fe18e3ec488a..b95501076569 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -330,6 +330,21 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	return full ? -ENOSPC : 0;
>  }
>  
> +static void save_pagefault_to_engine(struct xe_gt *gt, struct pagefault *pf)
> +{
> +	struct xe_hw_engine *hwe;
> +

This doesn't work with virtual exec queues - i.e. exec queues that have
logical mask of more than 1 bit set. In this case the q->hwe is a
pointer to a hwe in logical mask but not necessarily where it is
running - the GuC controls that. With that, the best we can do here is
record the fault per hwe class and then try to associated it with next
exec queue banned.

> +	hwe = xe_gt_hw_engine(gt, pf->engine_class, pf->engine_instance, false);
> +	if (hwe) {
> +		spin_lock(&hwe->pf.lock);
> +		/** Info initializes as NULL, so alloc if first pagefault */
> +		if (!hwe->pf.info)
> +			hwe->pf.info = kzalloc(sizeof(*pf), GFP_KERNEL);
> +		memcpy(hwe->pf.info, pf, sizeof(*pf));
> +		spin_unlock(&hwe->pf.lock);
> +	}
> +}
> +
>  #define USM_QUEUE_MAX_RUNTIME_MS	20
>  
>  static void pf_queue_work_func(struct work_struct *w)
> @@ -352,6 +367,8 @@ static void pf_queue_work_func(struct work_struct *w)
>  			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
>  		}
>  
> +		save_pagefault_to_engine(gt, &pf);
> +

I think we really only want to save this upon a fault failing, right?
Either the VM is not in fault more or for some reason page fault service
fails.

>  		reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
>  			FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
>  			FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 913c74d6e2ae..92de926bd505 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -20,11 +20,13 @@
>  #include "xe_assert.h"
>  #include "xe_devcoredump.h"
>  #include "xe_device.h"
> +#include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
>  #include "xe_gpu_scheduler.h"
>  #include "xe_gt.h"
>  #include "xe_gt_clock.h"
> +#include "xe_gt_pagefault.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_capture.h"
> @@ -146,6 +148,7 @@ static bool exec_queue_banned(struct xe_exec_queue *q)
>  static void set_exec_queue_banned(struct xe_exec_queue *q)
>  {
>  	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> +	xe_drm_client_add_blame(q->xef->client, q);

I think this is not the correct place to do this, rather in
xe_guc_exec_queue_memory_cat_error_handler. With above, when we NACK a
page fault it will immediately followed by a
XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H. Assuming we only want to
capture bad page faults, not ones serviced normally, my suggestion here
seems like the way to go.

For an example of the above follow in IGT, run xe_exec_reset --r
cat-error:

[12725.778776] [IGT] xe_exec_reset: starting subtest cat-error
[12725.783727] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]]
                ASID: 4368
                VFID: 0
                PDATA: 0x0490
                Faulted Address: 0x00000000002a0000
                FaultType: 0
                AccessType: 0
                FaultLevel: 1
                EngineClass: 0 rcs
                EngineInstance: 0
[12725.783760] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]] Fault response: Unsuccessful -22
[12725.783942] xe 0000:03:00.0: [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] GT0: Engine memory cat error: engine_class=rcs, logical_mask: 0x1, guc_id=2
[12725.784528] xe 0000:03:00.0: [drm:xe_hw_engine_snapshot_capture [xe]] GT0: Proceeding with manual engine snapshot
[12725.787350] xe 0000:03:00.0: [drm] GT0: Engine reset: engine_class=rcs, logical_mask: 0x1, guc_id=2
[12725.787377] xe 0000:03:00.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=2, flags=0x0 in xe_exec_reset [26019]
[12725.815980] xe 0000:03:00.0: [drm] Xe device coredump has been created


>  }
>  
>  static bool exec_queue_suspended(struct xe_exec_queue *q)
> @@ -1971,6 +1974,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_hw_engine *hwe;
>  	struct xe_exec_queue *q;
>  	u32 guc_id;
>  
> @@ -1983,11 +1987,22 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> +	hwe = q->hwe;
> +
>  	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>  		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>  
>  	trace_xe_exec_queue_reset(q);
>  
> +	/**
> +	 * Clear last pagefault from engine.  Any future exec queue bans likely were
> +	 * not caused by said pagefault now that the engine has reset.
> +	 */
> +	spin_lock(&hwe->pf.lock);
> +	kfree(hwe->pf.info);
> +	hwe->pf.info = NULL;
> +	spin_unlock(&hwe->pf.lock);

I'd clear this cache when associated a PF with an exec queue.

Matt

> +
>  	/*
>  	 * A banned engine is a NOP at this point (came from
>  	 * guc_exec_queue_timedout_job). Otherwise, kick drm scheduler to cancel
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index fc447751fe78..69f61e4905e2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -21,6 +21,7 @@
>  #include "xe_gsc.h"
>  #include "xe_gt.h"
>  #include "xe_gt_ccs_mode.h"
> +#include "xe_gt_pagefault.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_topology.h"
> @@ -557,6 +558,9 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  		hwe->eclass->defaults = hwe->eclass->sched_props;
>  	}
>  
> +	hwe->pf.info = NULL;
> +	spin_lock_init(&hwe->pf.lock);
> +
>  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
>  	xe_tuning_process_engine(hwe);
>  	xe_wa_process_engine(hwe);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index e4191a7a2c31..2e1be9481d9b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -64,6 +64,7 @@ enum xe_hw_engine_id {
>  struct xe_bo;
>  struct xe_execlist_port;
>  struct xe_gt;
> +struct pagefault;
>  
>  /**
>   * struct xe_hw_engine_class_intf - per hw engine class struct interface
> @@ -150,6 +151,13 @@ struct xe_hw_engine {
>  	struct xe_oa_unit *oa_unit;
>  	/** @hw_engine_group: the group of hw engines this one belongs to */
>  	struct xe_hw_engine_group *hw_engine_group;
> +	/** @pf: the last pagefault seen on this engine */
> +	struct {
> +		/** @pf.info: info containing last seen pagefault details */
> +		struct pagefault *info;
> +		/** @pf.lock: lock protecting @pf.info */
> +		spinlock_t lock;
> +	} pf;
>  };
>  
>  enum xe_hw_engine_snapshot_source_id {
> -- 
> 2.43.0
> 
