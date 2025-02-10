Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17031A2F83F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40AA10E5FA;
	Mon, 10 Feb 2025 19:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3LSOVy2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E393E10E5F8;
 Mon, 10 Feb 2025 19:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739214637; x=1770750637;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h+Lyt+oYVV7LoBBZfOFD0F32BzFlaNjiuro+tS0Cuw8=;
 b=A3LSOVy2wPmdTyH15CtuJM85MTZX6gMGriKm4QP0Aw4FP01nHiTEBIKS
 0FSYdLwd1CxWcvhhRFCyGysIoYAcgCBpbIBdLRDJe4sz4I2lJ4jJQd6G4
 afF0C8xxZSZCqpXuxjaZuQjfzXPN+61usljAHkD/sj9xaIJG76IlPG6vB
 l89kgcU5q737IWdy3OVkg17cHIyR6p+mB3lUgw0XydWuTAWTEdhnAF1Zm
 +2oeP+0lftdDyQLXbzLvj+4dL5O0UP5TIYhlhDhXVWJVcfQVQ17Jo94/w
 CqqJUTFYXHg04Ob3yxul3HPePswWMHN9Zn+ZQ4bFDl+uCSiK+bGjzOkgl g==;
X-CSE-ConnectionGUID: +Ngl7AS8S5OMLybBZoptPA==
X-CSE-MsgGUID: i9jdYTDWTrGq1EfZfVG1mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="42649889"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="42649889"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 11:10:36 -0800
X-CSE-ConnectionGUID: HjTUAnN7SzmrsqgxCpquWQ==
X-CSE-MsgGUID: nlvAH143RPa+bvxI3cr9dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135542673"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 11:10:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 11:10:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 11:10:35 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 11:10:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8bF6xfvRjvpyQabJj9coWYNe2g1Ig2qc275HU4vqlEJS5RlK48Mh6l32hY80HoCX5F45CJl8MvpX4h1oS7ogmn9prTiM254vBpPcXPtyPiNCMnSESkwRffzSZHZEntLJRUtDLVGEYxalRAWLjTR9w2I19CUTu0ardP8Xl400dkuazE28H585SRlaXJtvVMXPuN8NgbGtqs6p1Hy32kQKsy14/lb3OmOnLKy1G2HjEcGayJVZcAeEysFidT5jKcp8H/MoiBSY1X1LFrGCNN0aLXupU9JsIfmawyBM/LgPeBURshl+cHp/tSjoaCTSar3y+tOujY8GaxWz4bfTKwONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WeJ8LTq8lg4cHe6d31JUfskrD4nN2sjjrtLvuUkGEc=;
 b=eseVmbr9GdQFrQa4AjHPYGxEAnnzmebDPalU/VtdxBh3YyqKjVq7qrMQGEh7pV647xiqLuxZa6dfQXzQhmb7w4CwJaM6wBoRn0nuLdJp12OXlg6NHtFRcFV0ech9ZjWR/d2wl4Eik1usE4cfvTECeMEoVzdhbyer4uMEV/kfdRX8DOMgPhUG9Pafc223OsFmlomr21KeXE0eek37oeSeJXcsDx8JmOJF2P2obGghDG69X/bQotMYMjctubYx3+bki6vfgkrDb0/HuTCa/DmesQmMVWGRTTvNMaKfPG+OnYRQh7IYJpCcwyNA2BrZk0MlJIkuImMpOya5vCOj2RBm0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7587.namprd11.prod.outlook.com (2603:10b6:510:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 19:10:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:10:05 +0000
Date: Mon, 10 Feb 2025 11:11:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>,
 <airlied@gmail.com>, <thomas.hellstrom@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 10/33] drm/xe: Add dma_addr res cursor
Message-ID: <Z6pPSL6T6Mqt9//3@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-11-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129195212.745731-11-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0123.namprd04.prod.outlook.com
 (2603:10b6:303:84::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: ca37055c-50d1-4e89-54bf-08dd4a0686bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ky1DIybvzJETMidlmwZVsgttAO+YKS3jC/FnEVOGV40TEH7hZb+zPNezvc?=
 =?iso-8859-1?Q?qU/kEU//i8MpZi+HTjJeOOJfJeWDIKxj0IcgApInSGzrMQ4q9TU0BXsmTU?=
 =?iso-8859-1?Q?uEOz8gzNpzPVgpT5eK58HWQBlVSlj7gPPZ+xsrDV7IhgCBMK5pXXUHZbIA?=
 =?iso-8859-1?Q?IzI2zRa1S8g7M9eT9UW3hAOzEaJ3ZBRQ5BwRxkNuZc44GyA8Harzh6ProD?=
 =?iso-8859-1?Q?l2OveLHhIfnXfIi9PIUBgIbzw5fuC61aRenO7R9AhFnuSRZbabMhGVRZiF?=
 =?iso-8859-1?Q?YxO3Fpvtu+M5d/dUVFYtre24oke/oIPyDxBMriVphHjtXku8EZuyzz3rba?=
 =?iso-8859-1?Q?Ap9mj0g1LOYnH5mszzFjugodfHCl8ejnsRazkHh8uAPSFyO6LZAafIDN2W?=
 =?iso-8859-1?Q?q8ZaXt8gZLWnx9mXw50NSUEbeLtxsuNiode8WXW06Uui9kwxOahAnVJTpZ?=
 =?iso-8859-1?Q?K4NX/WOJkd3g5BpkoZ76RtmHsyttOz+FKPFdsJhXp8qEvgVQW49uQRF7tO?=
 =?iso-8859-1?Q?PKhWquZkQoTABApO8NMBWcRvb7QmhvrJ5k1YRe+l2wGHstCU++jFvaVkhY?=
 =?iso-8859-1?Q?Ncy0vFWl+52L6RWwm4xyhBNYulvEXknyquF3PG4misVTgVYg63ZzTuLhQr?=
 =?iso-8859-1?Q?k7U5qMBCfobDUGL+B5GrmycD/d5r1qv5aoFAu4AdXLpIqqoCgeeak983Qf?=
 =?iso-8859-1?Q?LVoPtpmbSEjjXbiGQBLj4ox1TMkeFIFUi6lurgryx9vG7i1GU89CCLOcxy?=
 =?iso-8859-1?Q?19wqu2uh/WKe0/mGAYasix4hOMn4otl22q2kHuHRCi4alKXB7lJaBusvuz?=
 =?iso-8859-1?Q?4ndRt6H1yM6wndJlJ5pREllVB0FT48lHPe3DIxkvo6l68hi00CDvFDphAw?=
 =?iso-8859-1?Q?xSqF3aE7K5rQwPi/YGzUfJ2Zb5DpFZvNH468fyLN5jnkehR1ToU2UB99WI?=
 =?iso-8859-1?Q?qlRu/ermXDrehuc8Fo79i4k5DtHjyXFm0HUVOEsDwSNKSQwXAEZf3MZ4En?=
 =?iso-8859-1?Q?14IvzSjIbb1ZDA/ROP+yeXrZ8uYWfD2KKOyxmLXaSVRLUrWT5YBxL630nb?=
 =?iso-8859-1?Q?8C3bwyRQy+tsmSkV2QF4UNohGG91Y6WTg4iLoHLRhtGUjdHIBta2UIjzo1?=
 =?iso-8859-1?Q?BEh/XFctkzP0TuipG1pODq63eMYD+BS50aUbsUc8EBk2Cg9f22dA9OPV1l?=
 =?iso-8859-1?Q?yQZLZ10tSqpz2murN9TgMZxoGAX6tNVm7Oa7OwfCn0EsCvXHoinEFw/Rrn?=
 =?iso-8859-1?Q?6u+8rhYGz/pOb3FrknHoZ+XlLox7hmDiHbsQMV/SJdmiyuvCkLk13xI6SX?=
 =?iso-8859-1?Q?1lDNKljfLEnKaBCQRU8UglM0VSxV4rvgn9kw9oKz2YR7yLhG3CzdE5Sza+?=
 =?iso-8859-1?Q?ICiqgXteLcLv89aySRn8NT4la7o0OT2MSQWgxndKhR+uVzGIRyThxpiRLB?=
 =?iso-8859-1?Q?NYg+8f+wrBxiOrqf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LKRG+xDN72iRLfG+8p4LPYTHL+oZCsyUu455TFiXakXV/vF1Y202ycQ0N/?=
 =?iso-8859-1?Q?m4ESIAj8NeNR8pQjAYIdfFv7su/bbDj4dTItFY2hT2/goMqV76bfV72m2I?=
 =?iso-8859-1?Q?tY0+Ak3qFd/RGkW0OtFENkCvkgYCSaMjYvTntRbcs8QT3CJt5GW4WR3xqK?=
 =?iso-8859-1?Q?sTg/sBN8oU/6B29QKM6L0Q9QuV26Lm40xEMyHAAGcmod6VS/C8nTc+9mvL?=
 =?iso-8859-1?Q?RiA8gpF35/zNyGmnpLQA5P4ohLNL54juGH2t1/CHBCNYq8a5SGOtlmizcu?=
 =?iso-8859-1?Q?e+5yDP91YmScr6p5mnKqVT6T8YXEmVYqf881nPg/lZY39WiEwog9NvR56g?=
 =?iso-8859-1?Q?jPsii13xm/hUPtTE6G/Ib6HvYv4IyLopjRm1FNlrmUqJ3oL3lX9oYmrtD/?=
 =?iso-8859-1?Q?JDudMbE3N9m8kE7b0CMHcJ9w/QUwCfoiP9tQRSzPiefoEKQywUdRpKafUO?=
 =?iso-8859-1?Q?jljG9iMU8ENAmGM12BbdBe5dD3/fiVO3aoiD9MeuK1egMTIA2+H9wBO8PA?=
 =?iso-8859-1?Q?+JTs7AkVKOnNNRcLO5sDiBJAPijK4bqSCedwR1QxNRiaDmFSWPIj4bT+bC?=
 =?iso-8859-1?Q?B3Mtce7gKUXMYpxDaYIuzZDAIZrjUm4bZtI0p0PlUpxUnVMfnLlbwGnii6?=
 =?iso-8859-1?Q?Lqg81K/xh8hhk//yGDudGvCmB9hAhlNXXWURFkLDiKX6rKd3KtOy3opPWu?=
 =?iso-8859-1?Q?CNdzbtYdn0hX3aFpT1YNlr3C7g6qsPeGaktbsVdbojjRHxG6nrBwRe5Li5?=
 =?iso-8859-1?Q?fGqQLRPbw+7CyzI/fMdPOuTqj2xFtIthDUasQiL1zp/LPVN7gIJjt2ojew?=
 =?iso-8859-1?Q?JrDhvVmVaxi9y9LUt2/ccgQTxwXIlEtNATMY5/sjlQPV9JkEOwTaMA1taF?=
 =?iso-8859-1?Q?fFJoE+iLF2gIzuzVEoyGkttbwTsh7dkwYHQzQ7gFGv4OrfOmKDW9kX1IMV?=
 =?iso-8859-1?Q?PX7mMZhQTvG5f/A6ibWKWjzgL/ScvXnSOdsj0Y9+MbXBD1vW65BbfmMUfE?=
 =?iso-8859-1?Q?woX8wcMyfrno5HoJkV17ILPzt9dx5IAohDOArtQqVIHChnDIuF11YZh+lM?=
 =?iso-8859-1?Q?tgB0YZ2nZvjWy+HXTMR7cjcb/LKQxMceZE/vPTClISArw6kQirCyCbpgqV?=
 =?iso-8859-1?Q?XJe9GgSDQ+MDYsqsvURjNozVK3QfyZMEH/rYr/JiRG9HxhYtVMYHmDGOwU?=
 =?iso-8859-1?Q?lnJMduHs72FYQ4ybM2S6Jb0ebXqXZpVwfvTVM69gLunKqDEs+L0PmfTkt4?=
 =?iso-8859-1?Q?n09efHktEDQPZ9EMYrTIdu/tI8hLsAI/FH/Dhi8Xp5aK6HBxj98breB069?=
 =?iso-8859-1?Q?pUuA7fZFEVETrk2dh7w9MVxgaYxphfa+EuEekSWi04Ay/k/85y3BVEVmD9?=
 =?iso-8859-1?Q?t6Nydsed3cMkufHlL+OQD9AhGIXxU2yPKQz1UQWl0qYnQZsxhi+cc5ejQ/?=
 =?iso-8859-1?Q?b+YrWmI35KsUZ132IhMMYcGHlW7/ltJ50yvOYKw0PLAuEFM5FJo45oTpE1?=
 =?iso-8859-1?Q?6RtSunltTH7DeraNy5FbGCJQU5vinGi7AzLVmyyufnYegjo/76mHEGxfXQ?=
 =?iso-8859-1?Q?umF0hg08QYypBlo1raz2XANxLU351KakodhrlzfeUtHLWozg8qPVqSm6wQ?=
 =?iso-8859-1?Q?BgD0QtHzc0qEsLFk6ibEuWvYwpw0wLArjgFwEIim2nHvUu4Ql7L0wDqQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca37055c-50d1-4e89-54bf-08dd4a0686bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:10:05.0556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Re8WM45TroL34Ju0IDGfR8bTRELrQn6iB6F+QQZYB8WCRNJO/hlJAKfk0u3vQfXScoGUIaNcW/qcu2UFMEL0MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7587
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

On Wed, Jan 29, 2025 at 11:51:49AM -0800, Matthew Brost wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> Add dma_addr res cursor which walks an array of drm_pagemap_dma_addr.
> Useful for SVM ranges and programing page tables.
> 
> v3:
>  - Better commit message (Thomas)
>  - Use new drm_pagemap.h location
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_res_cursor.h | 116 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_svm.h        |   4 +
>  2 files changed, 118 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index dca374b6521c..46486087a51d 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -26,6 +26,7 @@
>  
>  #include <linux/scatterlist.h>
>  
> +#include <drm/drm_pagemap.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/ttm/ttm_range_manager.h>
>  #include <drm/ttm/ttm_resource.h>
> @@ -34,9 +35,13 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_macros.h"
> +#include "xe_svm.h"
>  #include "xe_ttm_vram_mgr.h"
>  
> -/* state back for walking over vram_mgr, stolen_mgr, and gtt_mgr allocations */
> +/**
> + * struct xe_res_cursor - state for walking over dma mapping, vram_mgr,
> + * stolen_mgr, and gtt_mgr allocations
> + */
>  struct xe_res_cursor {
>  	u64 start;
>  	u64 size;
> @@ -44,7 +49,17 @@ struct xe_res_cursor {
>  	void *node;
>  	u32 mem_type;
>  	struct scatterlist *sgl;
> +	/** @dma_addr: Current element in a struct drm_pagemap_dma_addr array */
> +	const struct drm_pagemap_dma_addr *dma_addr;
>  	struct drm_buddy *mm;
> +	/**
> +	 * @dma_start: DMA start address for the current segment.
> +	 * This may be different to @dma_addr.addr since elements in
> +	 * the array may be coalesced to a single segment.
> +	 */
> +	u64 dma_start;
> +	/** @dma_seg_size: Size of the current segment. */
> +	u64 dma_seg_size;
>  };
>  
>  static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
> @@ -70,6 +85,7 @@ static inline void xe_res_first(struct ttm_resource *res,
>  				struct xe_res_cursor *cur)
>  {
>  	cur->sgl = NULL;
> +	cur->dma_addr = NULL;
>  	if (!res)
>  		goto fallback;
>  
> @@ -141,6 +157,36 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
>  	cur->sgl = sgl;
>  }
>  
> +/**
> + * __xe_res_dma_next() - Advance the cursor when end-of-segment is reached
> + * @cur: The cursor
> + */
> +static inline void __xe_res_dma_next(struct xe_res_cursor *cur)
> +{
> +	const struct drm_pagemap_dma_addr *addr = cur->dma_addr;
> +	u64 start = cur->start;
> +
> +	while (start >= cur->dma_seg_size) {
> +		start -= cur->dma_seg_size;
> +		addr++;
> +		cur->dma_seg_size = PAGE_SIZE << addr->order;
> +	}
> +	cur->dma_start = addr->addr;
> +
> +	/* Coalesce array_elements */
> +	while (cur->dma_seg_size - start < cur->remaining) {
> +		if (cur->dma_start + cur->dma_seg_size != addr[1].addr ||
> +		    addr->proto != addr[1].proto)
> +			break;
> +		addr++;
> +		cur->dma_seg_size += PAGE_SIZE << addr->order;
> +	}
> +
> +	cur->dma_addr = addr;
> +	cur->start = start;
> +	cur->size = cur->dma_seg_size - start;
> +}
> +
>  /**
>   * xe_res_first_sg - initialize a xe_res_cursor with a scatter gather table
>   *
> @@ -160,11 +206,42 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
>  	cur->start = start;
>  	cur->remaining = size;
>  	cur->size = 0;
> +	cur->dma_addr = NULL;
>  	cur->sgl = sg->sgl;
>  	cur->mem_type = XE_PL_TT;
>  	__xe_res_sg_next(cur);
>  }
>  
> +/**
> + * xe_res_first_dma - initialize a xe_res_cursor with dma_addr array
> + *
> + * @dma_addr: struct drm_pagemap_dma_addr array to walk
> + * @start: Start of the range
> + * @size: Size of the range
> + * @cur: cursor object to initialize
> + *
> + * Start walking over the range of allocations between @start and @size.
> + */
> +static inline void xe_res_first_dma(const struct drm_pagemap_dma_addr *dma_addr,
> +				    u64 start, u64 size,
> +				    struct xe_res_cursor *cur)
> +{
> +	XE_WARN_ON(!dma_addr);
> +	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
> +		   !IS_ALIGNED(size, PAGE_SIZE));
> +
> +	cur->node = NULL;
> +	cur->start = start;
> +	cur->remaining = size;
> +	cur->dma_seg_size = PAGE_SIZE << dma_addr->order;
> +	cur->dma_start = 0;
> +	cur->size = 0;
> +	cur->dma_addr = dma_addr;
> +	__xe_res_dma_next(cur);
> +	cur->sgl = NULL;
> +	cur->mem_type = XE_PL_TT;
> +}
> +
>  /**
>   * xe_res_next - advance the cursor
>   *
> @@ -191,6 +268,12 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
>  		return;
>  	}
>  
> +	if (cur->dma_addr) {
> +		cur->start += size;
> +		__xe_res_dma_next(cur);
> +		return;
> +	}
> +
>  	if (cur->sgl) {
>  		cur->start += size;
>  		__xe_res_sg_next(cur);
> @@ -232,6 +315,35 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
>   */
>  static inline u64 xe_res_dma(const struct xe_res_cursor *cur)
>  {
> -	return cur->sgl ? sg_dma_address(cur->sgl) + cur->start : cur->start;
> +	if (cur->dma_addr)
> +		return cur->dma_start + cur->start;
> +	else if (cur->sgl)
> +		return sg_dma_address(cur->sgl) + cur->start;
> +	else
> +		return cur->start;
> +}
> +
> +/**
> + * xe_res_is_vram() - Whether the cursor current dma address points to
> + * same-device VRAM
> + * @cur: The cursor.
> + *
> + * Return: true iff the address returned by xe_res_dma() points to internal vram.
> + */
> +static inline bool xe_res_is_vram(const struct xe_res_cursor *cur)
> +{
> +	if (cur->dma_addr)
> +		return cur->dma_addr->proto == XE_INTERCONNECT_VRAM;
> +
> +	switch (cur->mem_type) {
> +	case XE_PL_STOLEN:
> +	case XE_PL_VRAM0:
> +	case XE_PL_VRAM1:
> +		return true;
> +	default:
> +		break;
> +	}
> +
> +	return false;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 49cfd938aa17..4569931db622 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -6,6 +6,10 @@
>  #ifndef _XE_SVM_H_
>  #define _XE_SVM_H_
>  
> +#include <drm/drm_pagemap.h>
> +
> +#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> +
>  struct xe_vm;
>  
>  int xe_svm_init(struct xe_vm *vm);
> -- 
> 2.34.1
> 
