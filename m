Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D5F9F7371
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 04:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686C910E704;
	Thu, 19 Dec 2024 03:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WT/7h57l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4A310E462;
 Thu, 19 Dec 2024 03:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734579712; x=1766115712;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RwNpc5x2xYWSFyentO5OovWoe3i/C/hm9xhtjYVstNo=;
 b=WT/7h57lVVIiAfKJWq7t5sFIuBelrTZY1iXq75R0/5sUNc2H/687rKc7
 mk7nmw8T9Rhol0Z0N/atibyBNW2FNAvFsE32kIaHXBf0XyI8lCAAhJ2Ik
 AS9QlWvHrhPyrwj0VLL3FQTjFSm46kXbmf7811CmEamyaRFmiVK46fU3u
 WJYJXzeGX2GGIa4CAp0OnFWRuBLcdUY0z3Vjm0tE0HIde/gikDtZxrfVr
 RVKZTRETgvMvfakmoMwHTcPJQKOZMmzR4k4qMQJN0y3aGb0kv0bLT69pG
 acqebQvI9YotYJXs+taaGSrMM/vc1xa3Q/AylPT/0t3aoRIgBPnaOz4Ec w==;
X-CSE-ConnectionGUID: gbaHFWSaQOyaLW9CkjgVHA==
X-CSE-MsgGUID: dvITX1leQOaSw0+9j5d9vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35206867"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="35206867"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 19:41:52 -0800
X-CSE-ConnectionGUID: rA1F+feCS5qi2ggiomQkKw==
X-CSE-MsgGUID: o2lCmJoySMS0FA2drkCVEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="98126416"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 19:41:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 19:41:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 19:41:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 19:41:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oA2V3fF94gechaUcpGhMaCzWkR6fmLqUVbpTFyjb7MvzXtOUPZZXDiTgMKNgqED9sI6K/W0AZWPuguj9g5s+PAVFuWko3WCxrhn0YGnD4xrEHnrQa1VB7tAGouBKMSn9xPOVdHtEj5cOwxFM23zJAMqPKLb8hBhOnNYjsa9Z/J031oB85nF5ePuKIQN4yvwdb0hsOrM5iCbpU1LPhlTUvDebgPaeUaycNhrt9wTctc1KapBhAUxMvISRIiS2qc48ViElaPptfr/4hlZSG9hqBJ0aPAHLdVa7aMgXuFP0emzp6b1dfZoQJzWYPdk6QxoDvV8PrgoPJ0+aHPXAxnVBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzrNdk4wquZaEoWVHq2rv7DTBgG/quU33FFL/DaZobs=;
 b=QAehbNAokX6dsfZvVJHCE1DmH6q8EVVp+GK7wh6E+nbMsq2d/lX3oWIT0eQW3fwCUgTlylqpPKXukHrkwr5K/by4lQerVSHlpUlDpdB+nnTCfGwkT1VlG3pumRG9t0v7YzJJ1W58swnmjfoGdqDvDAR033zGA11zKI3skZAdGHl0GYeaK8qcHjTipVfMAeM/PieDpo9f5JaFEUFZbXFRj8e7RSeoCx8GJpEMubXtBlr3ThUHIVE5ibYnqIz4+8nlObxmQnUHnaRdsojhA7gPPsETT+dVXmerfrmYoTaVEnyapLYH6Xp3rZOItH8P4MU7JF5dvm4eUajX5AWhcyVuJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7894.namprd11.prod.outlook.com (2603:10b6:610:12c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Thu, 19 Dec
 2024 03:41:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 03:41:49 +0000
Date: Wed, 18 Dec 2024 19:42:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 27/30] drm/xe: Basic SVM BO eviction
Message-ID: <Z2OWKf1t6yZIHeTn@lstrano-desk.jf.intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <20241217233348.3519726-28-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241217233348.3519726-28-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b793f72-06d9-4a5d-7877-08dd1fdf11b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OaeNF/2J8n33tpOz3+R0rJh25re/VhF7DnhXcbvzHCQa0Q+JAp2fVQox/ZoP?=
 =?us-ascii?Q?0FJAorVrTWIyXmpXtzmfn9tZPHOnUDPzp1wLN+SBegDoSONELNBBSvZ8RP0x?=
 =?us-ascii?Q?3uKUxZtLZvRKlzCVVqbAqulkCqxrO0/L+lgZI2/pyhZpo/cNK0IBktx/oplB?=
 =?us-ascii?Q?GyJiLohHCGQYayni+t2jBmfExQ3DIOIYhHV9Fp/jRLLCNdYOkos9tRo210vd?=
 =?us-ascii?Q?+PofHejsuX/Kwq7Bmm22de/JTVOueA7+LQqqRPuwZuZZcVig+5f3SA2s/8E3?=
 =?us-ascii?Q?wGPN98Wawnslc6wSQlhECyJo2aGh9F03OvNYiBctY+510p2FilJDnaMqHgGY?=
 =?us-ascii?Q?ATzOfrHbFvnvhYg3vQtPuC6p0WaUkDPxQdmx0KW56tCyYx5KXQ2l+LvIiQJp?=
 =?us-ascii?Q?vIRQhl/vb3z1OKA05FU0ufruTnLlDpbGnDHXCKoBth9N76KwOrIS9gg1zSAu?=
 =?us-ascii?Q?0BYn5H1XRK20l7bGxZzAiQHYy9F7Hi/I3fHShbG00M+wEbbpuOAHi5Z9+d6Y?=
 =?us-ascii?Q?0St/Q8PRvLBtJqPoIXkfW/7vtYmB790OM+BhxWGqFpDzoyCB7BmhnXzTYi+X?=
 =?us-ascii?Q?GzifdzL7mdo35V+JC6W3VBDqEZVcum362w1lm8FddTzSmkR6lBd8pGhwm9Rv?=
 =?us-ascii?Q?okEwi0mTUmBhuUBNXyIkqlIhFHRTphRYwKQC35mpeo1R6HFqofrj4IMV07W/?=
 =?us-ascii?Q?bbcIIgcmUw8Fi0ZkYhS15bCyGN9Imdcpispp1VDBUCrZWPuJvo0YAnqX6ZWx?=
 =?us-ascii?Q?nEjuqAkPpBMVvLPVbjeZyhN0dUq0o6tLRO2/ELk/U53gZGzM0lVfm+rv5bsC?=
 =?us-ascii?Q?in7S9lPXNXBnnnG6Ihi8mVm/EyEoJL1KjvR5bHgJNQqc0iyP7i5RKfMXxfnP?=
 =?us-ascii?Q?jfuYiF5dwyAK149hNekzmYjUQz6QR/g/AqkyUbQtrQIjBzd1iFhYzgJ995q+?=
 =?us-ascii?Q?hX/pHKPRN22uZUUoGv9YAppYk2pg5MFiDdFQiqzi2rxA5D3G9je3lT++2mv/?=
 =?us-ascii?Q?umZicVrzhN1/adMzDVPjM2xvywBb63QIazZ/SKKpUKHrQ6nto6lvBDB/UUhW?=
 =?us-ascii?Q?ze2yl4v/HizpRMKIAxyFPPS039k9s1c2tuD6s7mD3dqMplZ39dIPGr/uAQ5V?=
 =?us-ascii?Q?XpgYkPfJZuxgwiaaAmMFDv/lrPjTCl/KOT3AOvblZ5CSwd2MbaVTvww/6cPC?=
 =?us-ascii?Q?YkBR8whYSeuHT0l44QwisPC80Pt365gFZFK0VeDJO9tmsyktMU+4kt4M7qge?=
 =?us-ascii?Q?OXGM/HySUSe6TG/6VgD8BXbpcupB499bBs9j4n5S7LDlF1xLwo/yjt2XhQt8?=
 =?us-ascii?Q?oWJHegdGFEfngIgnmpSCx4PR9Mu8DL8ZHGgENoJM5fl8vT5pz+gCyyzJwePq?=
 =?us-ascii?Q?1G5WynWjyG6a8eY2gKwfjGwB6eFX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8NSiymR9/IuyHVL0crSydECc8/ITzrB437ocssr3BGHzASFN8rHMAE0beA8u?=
 =?us-ascii?Q?IxnGYdFkD7Oy+Vi4QzCaladdg6/BWzFlWo0ZZVVgBxzsJ6LBcsa1wOiIhBuf?=
 =?us-ascii?Q?32Ws2UV91TFx1cCaJaGvCWx6+20iW4dGo9e+HfyEQ2IuEdyZekSiQA2OSDda?=
 =?us-ascii?Q?AZLGMj364poGyh6fs9e/jRSkBx+fpS7LcI7ktb0bK5xwAo3wiz8cw9UmGZNH?=
 =?us-ascii?Q?DrX35tlFk/WJ3O+mXXOIsPNRs7ye9HzFANETmlLp9OSE/yPXtZFYJGBfVeuh?=
 =?us-ascii?Q?GE7Dn16d22JKLed94gcI2n+6Mh39UmH8uDYqFguhLUCnTbpVmBoFJ6EBRdoO?=
 =?us-ascii?Q?WCgDFc+J6AAVkjh5IWzK4msDpDdP2UGE47+Ww4nhCTIQpAUVjLyw9/C2SseI?=
 =?us-ascii?Q?t12vVZTnrzGOkkjPksqZVLpixtpnQEOjhfdYxbVYfeENR0FHF6oO9QYCxbbO?=
 =?us-ascii?Q?odxxARDxkMtFXDm59jsQCrgHxB1AAocfjSqopSyBzob6tJTlRX4bpuz0rdTv?=
 =?us-ascii?Q?lvRj3F91hTVCiWz7lVGlEH88RkYssS8JTw0QwpuMvkMpbmpmnXX+tXTmvXrv?=
 =?us-ascii?Q?IyavP6U5183g4I/AO53Jp+oO07caBgQY1HhL72TzRWOuheahUKxMHCA/nchI?=
 =?us-ascii?Q?6Puw992aUi63l16wEnS6i1fXtpGXAdB55HVvPDghcNjLO+6Y9uGloW+/cXsC?=
 =?us-ascii?Q?Kx98WzeCObsAGOkWhvd3SI3lnF6fEQ6pzHtb/5wzTpEMcLcvwhznUbpqFQ/Q?=
 =?us-ascii?Q?wjDA/aWb85/9opzY/ItyNLtC8cXS9lQB7OJZyZfEMXitxbA6GJWjQmeRKgGw?=
 =?us-ascii?Q?NYdPQxESzfJvkaqp60HVXr29D0UfVJInpjjfXrckvGyPFjD8FyIH/ek+EJNT?=
 =?us-ascii?Q?ZVcD1UTcwYbL2eUNxZGBylqUxNMNMNrG7gc8BDEsMcGg/A57hJZG8oYK/s63?=
 =?us-ascii?Q?nHXnBgJvr1V8vO69BG45yopCNIzlTSSjIhwlCfdn7wTwLluu6ZRcIpoVSXnF?=
 =?us-ascii?Q?/8I05z6Io+qiU4Ey96osogoU3CzhozfoPlQoIF39qb0BnRx/79IyLRXlkWTH?=
 =?us-ascii?Q?lSkgAtZfTUOcxl75ibQk1dWgea0cw4pYX16027WqCncJTbtEUDFfZFoo0LF6?=
 =?us-ascii?Q?DHMoedP7qxF52IHYup7xGu3pPZcam48oMZbe3pxcQEwOSv6r2O51cBSAo/xU?=
 =?us-ascii?Q?FfKx8JdCYPcO6Ky2IdXNsrmamoQfJnG+pEbs1gPAOp6NrGbq1xcCA4wtBMRU?=
 =?us-ascii?Q?T5I2dC4BUnxD6LY7WIK7Yw/m3zoKB5V/PehRrdNDEPfM8j7qmUtbHKh49ybx?=
 =?us-ascii?Q?pv/kvTvun4vfglJpBNSaCyhnC1n4GPHzwbjwuLBHMcFdbLRZ0iCyn38Al/dd?=
 =?us-ascii?Q?b5Q7N1v7hjYPgbTnMIGeB12DcSz77lY1NHn3FbPFgznKi14Bdzu86TGW5L/F?=
 =?us-ascii?Q?PtzPL67AGxkLii6vxOQATjtBZsqO2eH0oG4zHhVQVSMpxOWaVwoRBBQQEQZR?=
 =?us-ascii?Q?Yqy/fMFEOgOzhTRys3bF+SNIqEtux3qu14nnnmcHppfNs3DO0woNgdg5h0UI?=
 =?us-ascii?Q?BqPW/XcYc/RK0OsopXGocBDowxBcsq+P9D9PWmWrRtPmPWNH4LyOvDJihpGR?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b793f72-06d9-4a5d-7877-08dd1fdf11b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 03:41:49.3367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/+YBFsetIjFD1iWOZDwjt2VPnLYrufWI96a8FbDn+snfnHXpGviG40Rn3C+OWv57nO6pJQTCk7c9m/+2ibEGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7894
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

On Tue, Dec 17, 2024 at 03:33:45PM -0800, Matthew Brost wrote:
> Wire xe_bo_move to GPU SVM migration via new helper xe_svm_bo_evict.
> 

Somehow lost the xe_bo.c changes in this rev which call xe_svm_bo_evict.
Ignore this patch.

Matt

> v2:
>  - Use xe_svm_bo_evict
>  - Drop bo->range
> v3:
>  - Kernel doc (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index a417d8942da4..8780a0b2c81e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -768,6 +768,20 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>  	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
>  }
>  
> +/**
> + * xe_svm_bo_evict() - SVM evict BO to system memory
> + * @bo: BO to evict
> + *
> + * SVM evict BO to system memory. GPU SVM layer ensures all device pages
> + * are evicted before returning.
> + *
> + * Return: 0 on success standard error code otherwise
> + */
> +int xe_svm_bo_evict(struct xe_bo *bo)
> +{
> +	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
> +}
> +
>  #if IS_ENABLED(CONFIG_XE_DEVMEM_MIRROR)
>  static struct drm_pagemap_dma_addr
>  xe_drm_pagemap_map_dma(struct drm_pagemap *dpagemap,
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index d549dd9e8641..9e9d333bb9d3 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -56,6 +56,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
>  
> +int xe_svm_bo_evict(struct xe_bo *bo);
> +
>  static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
>  {
>  	return drm_gpusvm_range_pages_valid(range->base.gpusvm, &range->base);
> -- 
> 2.34.1
> 
