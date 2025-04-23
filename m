Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A587A99462
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 18:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B716A10E6ED;
	Wed, 23 Apr 2025 16:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yo1oVHCc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6203210E13E;
 Wed, 23 Apr 2025 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745424835; x=1776960835;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mcQ0QJxgLva0qvEjYAGTS+Dw1D1ITTJ23glV1L3/n/k=;
 b=Yo1oVHCcrrlJi/W+ObKdtH6lF42UxE0FdPl1IWquxvHMiBdjg5nStt7B
 mO8mXiotYKQGwGlygWlU3WwAM33wsaR6WuQdO4VX82i7tXOpDPYxmGSmn
 9yWA/gPmqI1EynyFpufIEPfSaIQYIpZWymQdtSgzy1OU/CjEDldXubmKR
 gN82nOuu7ss08DLyRJENLIHoBoNkD8A7ukNkTYKXuntu62diHeUGmiflM
 wRJV8OhRUHQXI8jpFPRQi5wg6PVntvm5DWxnfxc8Ah2urHCQHe4MS6KpC
 2draxgDPbePRe+E0IywWSBDkexAZxO/Wd0ypDmcz4Q5JSgNYvtZuxt4kZ Q==;
X-CSE-ConnectionGUID: fC4OP83WTwCFWA6nDYoirg==
X-CSE-MsgGUID: CC7YX+r+S6GUMXXalYIh4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57222160"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="57222160"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 09:13:54 -0700
X-CSE-ConnectionGUID: 1gg2mtIBS5OazFiYdYwzTA==
X-CSE-MsgGUID: TyRspgroRuGw39u/RK0MQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137145665"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 09:13:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 09:13:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 09:13:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 09:13:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDkDCErIcEO9p8QxIGrUDPRDKhT7+i9MFHij3J4RSiS5tCBC06YMcUgM27rAOtST2rKZ35QUZA/x+ZnGgDZJzyg+2CMUOGb64/Em41ro40xTtZSNFvpXbdAr2FRxV1XSVzOn0BJCyausUSGXXPuKvab5fl6N2FajyKp+GkPJ8QuoXLghWdYOGELSdTqnQCINSwwP1ATc770aB2X9tM4V+r+rEbC5KrBSlddCbb5DnVb3afL4VFNLqE0l94tghwPsCdJywKN+DHe2LgX+gtyDnraFSCJOQdMhWqXN7s5Pa9oquJuio1Gr0dDvDJ6FKZe0d6/d2h9Wv6fTlTp71onEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDuATOgAlO0Or8EpQEs83WG+jEUwahy5vLgBw4uo584=;
 b=cGkkbUP4ETKGxOsn0+cVmp8WxJe5FhpY7vgPu7iojq6+glBaqwN4iupsqHMg6GhQts5MCY6aTnKeo609ZMM8VA0DO9IGp03cn2WFuAL1layC+68d8AQ/EtYT+KhcmWherbMA0sO4ZuOBDl+s6hz8r3BcRzBc8Rr9VoSEn1csrCZSnBw71K7JDs1AFSsZs0fZSocv0DFjIFnCwmJWuNOH4kq1tnxsiqlNov1qRhgPDNuWGkdq/vubLIVZFm0d6pXB1HEu3j1YRy4wNO9BRErE0JygwNKRzsj0H7TroqqttLq8+qhhGL/K4hYF05idfQkFqFHLVX4UoPKtq033U7np+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4796.namprd11.prod.outlook.com (2603:10b6:806:117::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 16:13:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Wed, 23 Apr 2025
 16:13:07 +0000
Date: Wed, 23 Apr 2025 09:14:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 1/5] drm/gpusvm: Introduce devmem_only flag for
 allocation
Message-ID: <aAkR4697yQm4s9qB@lstrano-desk.jf.intel.com>
References: <20250422170415.584662-1-matthew.brost@intel.com>
 <20250422170415.584662-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250422170415.584662-2-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0292.namprd04.prod.outlook.com
 (2603:10b6:303:89::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: f85770ed-c1db-4cff-918f-08dd8281bc25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W4IvawdPJ069JOSpmMLqUE6tGRULj5nGeU3CIgzl8ZLPeqtWiSJPtslwUROn?=
 =?us-ascii?Q?8FuLrSiPBRNdHYtCVhiDP/CpGqm7IA8CjaE+mpjxf3ZmGqXpa/XxFXu0+kvF?=
 =?us-ascii?Q?34LRsIS8LQClAhV3EYWxBYy4hPXeSymzO18LOfAK/kfs7IeRRnMidN3LnCOl?=
 =?us-ascii?Q?CH0yD+uYWpkL71LwJVfJKO6yexeX/i6DTFRriP5ihkcp8qH6Ar1ly15gfUTX?=
 =?us-ascii?Q?95xcvHr1ILP8K3sulzZ3sHuj77fSlU1ISXwFuYbJEhTHFjGJPD2YjqJuCv17?=
 =?us-ascii?Q?b7f/HrB9j/sVrSy9IU1DaqpnnlxQWNbBI6/dtf5aFaTWwKTlWy8k/n6Kar+u?=
 =?us-ascii?Q?IjW5TWxSiFNW8k1kMstoL50JuJmzd9JNWlvodNG6Ol6qo5T7OMSUfafAQaEt?=
 =?us-ascii?Q?NspgVWVS93wInWkc4b6xWM4fwlC+xsCNcggEKyeQOTUSD1W3CWnnAWb7j5BF?=
 =?us-ascii?Q?DD7mt1KfUGOgNSxWpXdggXtupkIWfuwlD/WK7KtBGTVU/TO8/IO9KEwG6chG?=
 =?us-ascii?Q?YdZoM/KRbbss1BkcSfEN8xw9XT/qSIDIN4ubX6R2TCaCAcIwPuG9xwYSW5WP?=
 =?us-ascii?Q?FAokovqqw15ohHxP3Sea1sWOXudxG20FIM7vOgvKa+VQdBMvVe5PLNyDLxcJ?=
 =?us-ascii?Q?2cWSvl8DiWnyOMFmvxxz12F38eaNceeLOfp8ECrorZLvp2sYIa0NsQRpdHp8?=
 =?us-ascii?Q?mqXDvedQUc81Y/xwKFs5HkVqOLBDleeNtBD0gTWGRwsGHWmMIos5cJyzsFfY?=
 =?us-ascii?Q?ZwnBPq9dAghRAwM+7sV9yOuzP3mpaKaQHylIEXSGRKMGEGHu6wBHKNvT+FTE?=
 =?us-ascii?Q?5L0FMyJAGAKSr1uZAIt2CP6PjSL8UzFF3frnxW3RzaBO7PlDLAjI4WuWt3rx?=
 =?us-ascii?Q?MWoqD52fRvV0+xTwvwd17oG1+MnT4pJS9aYK+qqKsynYLR+F7UzNZl1CMafp?=
 =?us-ascii?Q?04J/sPcMkaMR41zOZ7GXDyYrndO9fizBYXr8h15ZkUNQP06nTJJrbaM/mV/1?=
 =?us-ascii?Q?RISG6Hie0jHObzEMAEEAo1kz5lTUl3CD3Y2zfGnS8e/cCDocF14QsCAdGa+S?=
 =?us-ascii?Q?qZ9i0gTYsbYx/J007XohihzmTOOJ/g0fTEH5G1Vy+Q0kihUE30q/cQgoJkyZ?=
 =?us-ascii?Q?GEl9LHloqG7C+88CqIzyyGKEnE+XmcK8p8QRbtqfibdmhW8ryiECLUQ+FwNb?=
 =?us-ascii?Q?tIytVZjKKVSfSXZh0cZc9J9xOLQteRe/NTMZHaycpvsZWYDYGDFhUw8M9abN?=
 =?us-ascii?Q?pbcn7bjVeaMbOE2HtKX+uMjV1nGNql0/RpjVIRBmgTlXRYF9K38NQMx276t5?=
 =?us-ascii?Q?EoZXLy7JY0pZMTB3fGyWTzFKuL01yIwE/pgbL29+48pcC5taVMQDcVKagKHG?=
 =?us-ascii?Q?BdP0TQfSlwbe4k0SBJ1n/mBL+Qb8ct1s4YAnSMSXlEJktgAms+JLz3nZx9Eu?=
 =?us-ascii?Q?R6HrwLDlzVM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M6SLKhhMXJjt+4gu0KdgUYVVCe5MCwkeXXStGHV7a3XI/8PlxV3XsnS5RZrg?=
 =?us-ascii?Q?srwr6XOu6ksdzzstu8/yJ5sAzep4IIxwQYwhv+YRsP4wjIenDNrpD1sdV6e8?=
 =?us-ascii?Q?DuNmMy3VcaWh/JhMYtLX84t8IXrEGsIgxV62+ZVdFYzizJilCpwt1EXifkz3?=
 =?us-ascii?Q?H/+gHX8wowSYNDhFXGLQwBZMzfPIZ4OzH/UsmPbAe7Dlf96bZHeBlLR4xmQa?=
 =?us-ascii?Q?bE+F8pcnufPH+waKCSvPS4JEUzl4cwAlnZAQTLeY2e2JfqvHjDFgvnIGA3nG?=
 =?us-ascii?Q?fb++3PWLcjCeIwLwRPL1+rioMcd1+VmJarung2ejrd56JPz58XE6/VKOOwmL?=
 =?us-ascii?Q?7eHHRbOtSN09mAQ84MUcvJ82mU0AD129HXbq9UZdigL/AGE+pD7wuPLsLLfd?=
 =?us-ascii?Q?Inxp2p9MkXch+YTBQZYunez2/1JNBm0kLf0sm9oN8fzYgZWPEDOitomchugs?=
 =?us-ascii?Q?snGBn9wkAGbOgCv2/h6WWrHKoRxF35LnciSpC0IaZ9Sxzqi/XgtOlKZWoU49?=
 =?us-ascii?Q?qbH0fZ+wEvJLJVpFIpDO2cEvt6AJ8Tfttao4+JX99hbmXe/mGB6zGGJ9LZI9?=
 =?us-ascii?Q?hBI7CmQC+/+oFE6STrtXtdfuuPYK4dtR3AarUrwlru9DqEVZH7WpD/IRnV5J?=
 =?us-ascii?Q?BC7eX1UAOeTATGg0W52s3LLXT0LJtvlZOMPLkMudQjC69RgbN2g/nkAfUqjy?=
 =?us-ascii?Q?KESxY955aT7dkMFaHKOSiynShRhjHBv5IFId8GFSCcZna8TuWdMF2YeO13Lp?=
 =?us-ascii?Q?b1ZCSNkPk45t0/+VjzukdrI6oojK8MSME8I84ARgJ5o3XtHie3iYQsSjETi1?=
 =?us-ascii?Q?3gxohJnhmpgFahFnpJ83U9E3okGryM9SPULK1lYnGGkbQLuuBfQ4U2KsJbGl?=
 =?us-ascii?Q?axCGfO8Q9pzMe3/hAZp0WFZqOLO/oSkRtZ2sFprrKeIrrSVca+wOm5bPIhm+?=
 =?us-ascii?Q?m4lLzgPUtB8xuq3drIrJT37jo7z3af+1TOgMOP2+kM+wPxffjTpl6+Q6FQ6x?=
 =?us-ascii?Q?kt5XPl1aa+3NclIfRe7pqSKCs0mZEtzBJ2CCmeCecH3dE26NXJKcwacgMHO2?=
 =?us-ascii?Q?+hfJCi7pot8eIUliPDcWKrc1vlY7DEo9XbzEGZwvM/6RbSM2tiKvyK6a9Ob2?=
 =?us-ascii?Q?kIX/T3ywVw/QF3qp1v9sNFbrx8nOvdvNbYqua6bLfk/RgwJ8G8SSYjylbUXS?=
 =?us-ascii?Q?/UKOHlb/Yb+ALu2Rq2JJGye7sxUbc8aFsFy599iW/r9uVa9d4u/MPPiIFiSk?=
 =?us-ascii?Q?rVqxtHwA0ij87H5LJL4e/lUfglsQDDSK8eckoIrZY8iH+YoWzgBjX+6xnBWE?=
 =?us-ascii?Q?QD27seRJPrJfEmcVWaHYJPVjNIEaYXFFlJDDrC3QZQQDjUinlQfKc3OzNuR4?=
 =?us-ascii?Q?gCzqQoOQwzalM5NCTypGP+UTm5pNRugjqUjgB23JYsfbCKiT1s6EBo+jDaRB?=
 =?us-ascii?Q?HHLqlpfT3vSOaVaFmMEdknBhb3XY5L9Kmz+HMK2sg3CW0sTIsQ4S5wb/gYH8?=
 =?us-ascii?Q?GWctnF1CQUeXYj62TpYTrsovoW/SXwrRdmV9+zuT3gIusJpGRN9Iq3VMvsOA?=
 =?us-ascii?Q?MDJ90B2z0d62owNoU1eqQPqPt6fFfErEPYjuvuOXnTcqtkM5yQM+1lXMHBhT?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f85770ed-c1db-4cff-918f-08dd8281bc25
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 16:13:07.7636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiaIJpI2FLLmd6dn8tK6TMRdWz3md/uiDyHLIGG6CyOHFnOB1YyxRvdtXRv2+weppOfoekhutp14lCP9tPLkVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4796
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

On Tue, Apr 22, 2025 at 10:04:11AM -0700, Matthew Brost wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> This commit adds a new flag, devmem_only, to the drm_gpusvm structure. The
> purpose of this flag is to ensure that the get_pages function allocates
> memory exclusively from the device's memory. If the allocation from
> device memory fails, the function will return an -EFAULT error.
> 
> v3:
>  - s/vram_only/devmem_only/
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 5 +++++
>  include/drm/drm_gpusvm.h     | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 38431e8360e7..edf107809d20 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1454,6 +1454,11 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  				goto err_unmap;
>  			}
>  
> +			if (ctx->devmem_only) {
> +				err = -EFAULT;
> +				goto err_unmap;
> +			}
> +
>  			addr = dma_map_page(gpusvm->drm->dev,
>  					    page, 0,
>  					    PAGE_SIZE << order,
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index df120b4d1f83..9fd25fc880a4 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -286,6 +286,7 @@ struct drm_gpusvm {
>   * @in_notifier: entering from a MMU notifier
>   * @read_only: operating on read-only memory
>   * @devmem_possible: possible to use device memory
> + * @devmem_only: use only device memory
>   *
>   * Context that is DRM GPUSVM is operating in (i.e. user arguments).
>   */
> @@ -294,6 +295,7 @@ struct drm_gpusvm_ctx {
>  	unsigned int in_notifier :1;
>  	unsigned int read_only :1;
>  	unsigned int devmem_possible :1;
> +	unsigned int devmem_only :1;
>  };
>  
>  int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> -- 
> 2.34.1
> 
