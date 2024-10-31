Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791189B8737
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 00:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F210910E112;
	Thu, 31 Oct 2024 23:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DldoGmaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08BC10E0B4;
 Thu, 31 Oct 2024 23:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730418173; x=1761954173;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wcH+iZWyyhOlyPAviq77YGGzwpNhQcs4PM1Il7+0lRI=;
 b=DldoGmaY0AVY0jZXaHQin2jxvhrceHwAg8PGgHbR3Hf3KBbiRPlVoSE2
 BYI7BgmRwZUO2e8ZqIxAiJ/isOHqNExro+LrAT93zvlHH1E0m3HdbOzaf
 CTAxKkpYYqEmVMtXayHZRbWzzrRxD6CqQe6qVgHBaN3P9N60N+7oVgKwN
 Mx4oCTOBiM25UEj4Y5HJfhEQ7PVsRXj4+IsLjKA406/29Ro77bbT5XHTn
 g09du5BNeC6vPEGp7YoKQz0Mw5G00gwwg2tL7SSI1dQKJr9UjZFdwxStT
 E3ZkeRJ565WvEFdfluZnPyjEZCerhtpqxTldJvKHqdmcwicI+R0W2cV82 w==;
X-CSE-ConnectionGUID: fKPPNdAZR5KQ8XNDYL8kaA==
X-CSE-MsgGUID: hscS4AHIQfOJzoegrBSrzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30041617"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30041617"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 16:42:52 -0700
X-CSE-ConnectionGUID: 6RgEW9ykRRG2XYXprrRkww==
X-CSE-MsgGUID: 5Yev2t4fR66//gUN16hbdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; d="scan'208";a="87332418"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 16:42:51 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 16:42:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 16:42:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 16:42:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F25QFx9Y9YSjciqxjTZfIRg3ULUbf9Nth0jreXh7MNj1Q4X8EopMbUTtqml2Ycmkir6mH6zcEyMcRDFH1TwZf1gaapU4D43XmoA7EIFAIL//0cG3yE08fp6ttRDJ80Fg+8oscWhWbtwbX45VcqfvIUm/fpiUzNSBX2pMRJA6fbc3fSUXU8aJ5t4v9/3NZs0AI/IQNsmxeydMZn3nNeY3HGuejVwLJHSoAEfvTI06GiLk1+mZMsU3fL0OfawmIg+SFKJrfUEsfiJIOPi5JIk9Nlt5UXI1mleYBJ9OSuZxnKGXug5FiKh0h0EiM/Sco3UmkAVZ2JN/EPQ+Y2prFs1krA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcGmY97sC6yGGmndw3VNlURZTqwqqrENH2QYu+DHR0s=;
 b=IfHXm4N4A0g5y/4P3Ij0VOJoft68D67zR3hrt5Na1cd1z1R5r/z/mN9zX3OXzDj89hSzsTNnkHFL6XJU23gfRbJY31W7uBMGQkIb1OLLfR/linUI3939ainJMvW9Yopo9EMRhlyiecwdbTzX27li8q7eUrKc4CuakhtfJNhr47sVabQJRw0v6dwPQJPNVhsoVzbKm18HKKdIhEyIPpdu1k1/C2NcGlj4MUP+dnxwBJ81AzpA+xQveoyvEntc48levoswqJ5CCmlM4SO2WmbKMUf16pcagRZ99QznRMGmh7Upcr/vky4DrM5L79yJHbA4IwbV4/AIcwedfg63en5Zqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8522.namprd11.prod.outlook.com (2603:10b6:806:3b1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.36; Thu, 31 Oct
 2024 23:42:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.025; Thu, 31 Oct 2024
 23:42:49 +0000
Date: Thu, 31 Oct 2024 16:43:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>, <ckoenig.leichtzumerken@gmail.com>,
 <dri-devel@lists.freedesktop.org>
CC: <matthew.auld@intel.com>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
 <20241031181048.2948948-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031181048.2948948-3-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0256.namprd04.prod.outlook.com
 (2603:10b6:303:88::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c158af8-e279-47a8-9045-08dcfa05ba6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?l6UHBtbTuD0QZIwbfV+hY8BB6XEXEEqw56ZLbBu2PnxMZjqD0qUvdernla?=
 =?iso-8859-1?Q?MZDz1NmJfNnKVk47ZWyRRiyqGS5lmNvk2qbpDz1XGnysT6onjWHHzOBAIQ?=
 =?iso-8859-1?Q?t+87eN7dV4TRm3NxhfR9fBMIo58o2pGU3Rnp983Remzbt4WaDb2Knb1hoX?=
 =?iso-8859-1?Q?yI3VGDAergcmTgg0vsQjQyA72ukm64SEcDqt9CniVIZzoUNWpSsm5Q63zm?=
 =?iso-8859-1?Q?aAuaRfUtRDzBuKupaldWVnyiT1mahL/ekiOr+1EG+Aq084Pz5qWTrPLQB6?=
 =?iso-8859-1?Q?7yu8nsZQx91ZazDxC1siZ3GzWJQkMuIUiSBIV+RYYjmtsi1eM8F7TyrcZV?=
 =?iso-8859-1?Q?eXJh/bU49T4bI24CWctkGGksnMYhlu65wiyfdI3POxpkKwCnChZRT3ZM97?=
 =?iso-8859-1?Q?CzXTkKbY7BKqCufZxzhRF+hZzHYSzL30+jgYn0we/ks9sgk9Dm92ooH5N/?=
 =?iso-8859-1?Q?fLv22TvpxD6IVdtwiQv8dI8YD/d0536qjoNm6KwKWBSwd+PJY2I3fqHewG?=
 =?iso-8859-1?Q?DZXU4DM2uYgINOzHr5qOKNhQjstAyv0aoxWGnc7PtK3eLM9XF6RyE4M29r?=
 =?iso-8859-1?Q?z+W1EsmiElJr7vlJL8p/Lpe5PAfd8AoETHbDV3gexcB5g59ZQdr6DB+m68?=
 =?iso-8859-1?Q?QOGTgBLF/+sBqOJD+wIh5D/mlHq6FEjrnjRhpqJwPLcOlPOP15/S7Qg6hq?=
 =?iso-8859-1?Q?jovfFJg1U7GR3o109LIWtM4TJe+p6Apfkx9XhH9EKDLYXl1Gs2OGv5NxVs?=
 =?iso-8859-1?Q?UTfSJcEHEWNUjilrELCWu8gnTs9LegwfeSB+ppo+6GgroLREGYSjRGeOBP?=
 =?iso-8859-1?Q?ES0ltqKif1fqPLDqkEFSDQn3HrvIHIR1NtwF9c3sC7V2X+h7HPwGd3Uaur?=
 =?iso-8859-1?Q?FsQvmBjUSTYT2i8o3DmHY9nu57PCUmFMclq6vYaRD5HBREAoXKJK8h/jLy?=
 =?iso-8859-1?Q?KZ1yg0okJdo8v3Dt7N1UkJrAP3x7hjp5faoMEzL6MjfKAnvyVZ8HXUWIv8?=
 =?iso-8859-1?Q?DWv9uXvZAbcsLa0Ebk3Klyh7SJxgs37fZMLJSgierI/kNJ6m+GAbxiE9CO?=
 =?iso-8859-1?Q?vycQ1oiTe4KjDPgmvOrawyfpCSFNfJ2AUn5cykufuybIHfdPP36vgZlPpk?=
 =?iso-8859-1?Q?22OdG9OUVN+AbozqJgkUZvqv5je5NGSCNRa/yJcAvymtIosggDRbPKRSMk?=
 =?iso-8859-1?Q?W9BlzS3lLydxCK6sDgmMfmwxDoYEfuNwgaXgy5xgsWO5jB5zFQYGYwtPf2?=
 =?iso-8859-1?Q?4zVEyegZhtjiSxRT/2rRCf1MtxOXop23sk4tm5ivB5I6ljNyx7HG58LGZJ?=
 =?iso-8859-1?Q?cC0qCIl387p6guHEHwtMTVVGaFgqJ2dCbzS2dkTYDfo4YLRCPoOKRfjRlm?=
 =?iso-8859-1?Q?0HOpl2FV7R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xGOPDII0mJozieSRw/mG5uy1heWcOSuyByePPDfwl3/enGJRHWDFPYQuQV?=
 =?iso-8859-1?Q?QD+o4gHQ0w5yG/oTxUKQmsUSj+Fbrz2seh1EmhCkhgDfMXWm8JgQ/OSFkg?=
 =?iso-8859-1?Q?AG5teEfiOrHMGVECNBsMfyBmQE4fvyKPbYqOe8NFKwZvdkdd1e1VR58IHO?=
 =?iso-8859-1?Q?sKV9GsKORA0cRD2ikKs6c+FrToDkCfa5vD2NoRX7MFd3nBGgiokiL6jIn9?=
 =?iso-8859-1?Q?prOQfdOsNsJ4T4EEqekZQZN7zEU2104g1yvHZFAiXKzcruNNxTNtNDM3/P?=
 =?iso-8859-1?Q?D5tiLWNjnCSlQafbBXuUTn3qyFGET+BGBBJRF7auz+fpZuqNSt71JVZ4NR?=
 =?iso-8859-1?Q?FstqNJJG1RM42DHyeuChjuEqkyoqHRqzX9HtE1NrRI0VwXFL12VdlQhWRq?=
 =?iso-8859-1?Q?ATRKWWFUUdFGlwj220oUU9YQ1lCbXNdG/9nSqk/ZcJo7tVKY6yt3UDOUEY?=
 =?iso-8859-1?Q?dG3RhMpRPvd4ritE7fpx0WEAGqyG7qoeKvNCjl38/mlk2ClVSJ2iETGV3p?=
 =?iso-8859-1?Q?RrocOFk2jNixJed3ttKclO1vLeuGqG2xN5+NZalxhsDrWmq+zPZZmsNbh6?=
 =?iso-8859-1?Q?o5FwokoMztlXalOiwwCLyUArn8vcU1P+tvTemrjEHwZcq/qcLR2hVMeLTd?=
 =?iso-8859-1?Q?QCMnTlEPC5Kb/b6elh0Xos/LVEdh1tfZYttiKX38kHXigIsn5KeE0P+bGj?=
 =?iso-8859-1?Q?ZVJmnkI61d8K+T6MkXhEZAvJ3gX4DkiAwIXA8GVfT32e73KhtnOI1RZ9hs?=
 =?iso-8859-1?Q?+nX13q0RCx/U1C2bWhr4aw+pVQqiD5j4mxAInRoPXx9yQ+1kdAVcLCH1Aq?=
 =?iso-8859-1?Q?n5RvvO7mGw2p4iTamEPRJlxeG/bgT3gr7VfKh0G9UCDShq3wqrF+hFLjQw?=
 =?iso-8859-1?Q?FnhH5TNFNVnrIpoLm5NmmpWB/NWCgjLftMYHUPk2TSry2ZzVsUHc7e531t?=
 =?iso-8859-1?Q?4Zqq9vTcRoBgEWeObtp1UVntYF5d0a7v7aypfK6ouR9zPLafkY2dRPeHig?=
 =?iso-8859-1?Q?FDJyJlpbhePEYOd6EkoqCoH0u5l+Oh7uKKEZSYgrgJlDsCsx6tHXfbeZJB?=
 =?iso-8859-1?Q?5QMr/H5wzLBAUHWq4+ANf76qd7qNlHvQLvosAmhoU8wbnk+isDnpp/Z7dG?=
 =?iso-8859-1?Q?/jZ15cOGkpgtstVwcoO+AKKl/qjea7MmHurNN+yZLEQipVcGIs+L7IcrMu?=
 =?iso-8859-1?Q?FLybOOiXHSKUGGH/4x+ZqNucu8yCfs8x7ozEflXj5pzDPmsd1ijT0cBBn2?=
 =?iso-8859-1?Q?CU9a/OaOaF81Fq8P83VC0BiD4fKJ5UclSz3+ska7A2mhQ8aZynJQp/hAz5?=
 =?iso-8859-1?Q?NRFJ1alyj4xsM3fLcmJnfz8/Hkp0ugANS7bxP6vo0zrdO4KcqM+aAEhwkM?=
 =?iso-8859-1?Q?I8V9vDBS1l06Xq0emhidDJja9Yg4oXKfnM3v1WZmetxWmpEGJ4HajUZibp?=
 =?iso-8859-1?Q?Pn9fqkKEDo4ndiPCEBT8CuHd0WW2HNPyFwgVutKOuI+IyNbLAUYeWE7HMm?=
 =?iso-8859-1?Q?bxITq8GcaXN4LG/nimesKYNnVk60KtR9hwdIqZ78bY0IgOPe6NA+mkfyWD?=
 =?iso-8859-1?Q?e17e/LyyUEOesjBInds6gLzz0xsSjeC+dOsA2q54uWar+EChweNvO7tNw1?=
 =?iso-8859-1?Q?sTtIzhmYdE3jtolTYAGXg66GY1eTIz/23UuKgNDPr85zYKO0k/m77Bug?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c158af8-e279-47a8-9045-08dcfa05ba6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 23:42:49.1347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CrPAK+jO+LvVVEpipRoMq1yynrwawpa57S1OlcbLhQBj+5zP68eLP0TqsKR3HHBXP1zru79mtbralb6aOKvlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8522
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

On Thu, Oct 31, 2024 at 11:10:42AM -0700, Matthew Brost wrote:
> Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> VRAM easily be accessed. Add ttm_bo_access, which is similar to
> ttm_bo_vm_access, to access such memory.
> 
> v4:
>  - Fix checkpatch warnings (CI)
> v5:
>  - Fix checkpatch warnings (CI)
> v6:
>  - Fix kernel doc (Auld)
> 

Christian - Do you mind if I merge patch along with the rest of the
series to drm-xe-next?

Matt

> Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
>  include/drm/ttm/ttm_bo.h          |  2 +
>  3 files changed, 89 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index d939925efa81..77e760ea7193 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  
>  	return progress;
>  }
> +
> +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
> +			      unsigned long offset,
> +			      void *buf, int len, int write)
> +{
> +	unsigned long page = offset >> PAGE_SHIFT;
> +	unsigned long bytes_left = len;
> +	int ret;
> +
> +	/* Copy a page at a time, that way no extra virtual address
> +	 * mapping is needed
> +	 */
> +	offset -= page << PAGE_SHIFT;
> +	do {
> +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> +		struct ttm_bo_kmap_obj map;
> +		void *ptr;
> +		bool is_iomem;
> +
> +		ret = ttm_bo_kmap(bo, page, 1, &map);
> +		if (ret)
> +			return ret;
> +
> +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> +		WARN_ON_ONCE(is_iomem);
> +		if (write)
> +			memcpy(ptr, buf, bytes);
> +		else
> +			memcpy(buf, ptr, bytes);
> +		ttm_bo_kunmap(&map);
> +
> +		page++;
> +		buf += bytes;
> +		bytes_left -= bytes;
> +		offset = 0;
> +	} while (bytes_left);
> +
> +	return len;
> +}
> +
> +/**
> + * ttm_bo_access - Helper to access a buffer object
> + *
> + * @bo: ttm buffer object
> + * @offset: access offset into buffer object
> + * @buf: pointer to caller memory to read into or write from
> + * @len: length of access
> + * @write: write access
> + *
> + * Utility function to access a buffer object. Useful when buffer object cannot
> + * be easily mapped (non-contiguous, non-visible, etc...).
> + *
> + * Returns:
> + * @len if successful, negative error code on failure.
> + */
> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> +		  void *buf, int len, int write)
> +{
> +	int ret;
> +
> +	if (len < 1 || (offset + len) > bo->base.size)
> +		return -EIO;
> +
> +	ret = ttm_bo_reserve(bo, true, false, NULL);
> +	if (ret)
> +		return ret;
> +
> +	switch (bo->resource->mem_type) {
> +	case TTM_PL_SYSTEM:
> +		fallthrough;
> +	case TTM_PL_TT:
> +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
> +		break;
> +	default:
> +		if (bo->bdev->funcs->access_memory)
> +			ret = bo->bdev->funcs->access_memory
> +				(bo, offset, buf, len, write);
> +		else
> +			ret = -EIO;
> +	}
> +
> +	ttm_bo_unreserve(bo);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_bo_access);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 2c699ed1963a..20b1e5f78684 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
>  }
>  EXPORT_SYMBOL(ttm_bo_vm_close);
>  
> -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> -				 unsigned long offset,
> -				 uint8_t *buf, int len, int write)
> -{
> -	unsigned long page = offset >> PAGE_SHIFT;
> -	unsigned long bytes_left = len;
> -	int ret;
> -
> -	/* Copy a page at a time, that way no extra virtual address
> -	 * mapping is needed
> -	 */
> -	offset -= page << PAGE_SHIFT;
> -	do {
> -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> -		struct ttm_bo_kmap_obj map;
> -		void *ptr;
> -		bool is_iomem;
> -
> -		ret = ttm_bo_kmap(bo, page, 1, &map);
> -		if (ret)
> -			return ret;
> -
> -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> -		WARN_ON_ONCE(is_iomem);
> -		if (write)
> -			memcpy(ptr, buf, bytes);
> -		else
> -			memcpy(buf, ptr, bytes);
> -		ttm_bo_kunmap(&map);
> -
> -		page++;
> -		buf += bytes;
> -		bytes_left -= bytes;
> -		offset = 0;
> -	} while (bytes_left);
> -
> -	return len;
> -}
> -
>  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>  		     void *buf, int len, int write)
>  {
> @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>  	unsigned long offset = (addr) - vma->vm_start +
>  		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>  		 << PAGE_SHIFT);
> -	int ret;
> -
> -	if (len < 1 || (offset + len) > bo->base.size)
> -		return -EIO;
>  
> -	ret = ttm_bo_reserve(bo, true, false, NULL);
> -	if (ret)
> -		return ret;
> -
> -	switch (bo->resource->mem_type) {
> -	case TTM_PL_SYSTEM:
> -		fallthrough;
> -	case TTM_PL_TT:
> -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
> -		break;
> -	default:
> -		if (bo->bdev->funcs->access_memory)
> -			ret = bo->bdev->funcs->access_memory(
> -				bo, offset, buf, len, write);
> -		else
> -			ret = -EIO;
> -	}
> -
> -	ttm_bo_unreserve(bo);
> -
> -	return ret;
> +	return ttm_bo_access(bo, offset, buf, len, write);
>  }
>  EXPORT_SYMBOL(ttm_bo_vm_access);
>  
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 5804408815be..8ea11cd8df39 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>  int ttm_bo_evict_first(struct ttm_device *bdev,
>  		       struct ttm_resource_manager *man,
>  		       struct ttm_operation_ctx *ctx);
> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> +		  void *buf, int len, int write);
>  vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>  			     struct vm_fault *vmf);
>  vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> -- 
> 2.34.1
> 
