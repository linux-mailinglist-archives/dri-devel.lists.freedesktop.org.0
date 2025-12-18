Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93DFCCDCD8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 23:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA6F10EBB6;
	Thu, 18 Dec 2025 22:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PxzbMBWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8E210E920;
 Thu, 18 Dec 2025 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766096690; x=1797632690;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J9AIxN1QfPyN/0XN7PgNbxlOkv2x2yieulCBiT53rp8=;
 b=PxzbMBWyH6gC7ZA8+8ywl80B3i7+V9oXBhPzWxcOX2UbdNpDeSGwvjPC
 LiPJjqCOHady42gbundAVRJkyjWlofItKGBto6rurlY76aP8Uyjurl+2f
 jhNDB3zl7M4ad6onHNCC9VW0Ox9KUq9tPcBCCqPry1F3s2K37YNu9umxy
 NibrQ2bLdtjqLnwyl9BhhSThHRqc0CGVf5orry6OzJkCbYlcEfdFGnJqS
 OXwU0X7a2IEvnMPsG141XUQZFXmvI6cyOlKbAENBEgqwPDti9zyGiKaqP
 +gRedGXkAjY9YOipahQ54PB2ADnKs1jQYFxjpMWn6/ASwj4brBj62DlTO w==;
X-CSE-ConnectionGUID: brHm3V3LQqe9QWE4bDevDA==
X-CSE-MsgGUID: CzCnRgoKT7yK8ZyDVnsNLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68033072"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68033072"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:24:49 -0800
X-CSE-ConnectionGUID: hwY9XdhdSwOodPWbmalN+A==
X-CSE-MsgGUID: 9kMCYPT3Tt+KPWl5SaF1UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198292559"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:24:49 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:24:48 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 14:24:48 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:24:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMvOO91Zqia4V1ASf/Aw+lkdI2SD6C65rqyeWdK2lbbrjkYijn1p5/WStIiKKt+Fi0qaruAygOHPfZKcI8/9rq6gu+Dtm8Lyf26S5511f8AOrOkUgTM295bZnZLfOS1cEHR9pCUtgH7b3tX/JisiDF28qEmQEfi4cBOMBAmN0C9Hu21zSyxeO8f9+fCW/wgsljRBCQg8wJF+qLxBgAgBakkM2jNrzFf5oD3UTJnkUayVnMFphI8vKQOl33JJafMt8Z47x891unXHhWjNzFv/absVadwOP8lXZE3k6tyRMQZeecDAlLvGufaK3J1s396NEQzM7o9LF3Rlwt5HFfykHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeVSPfTPXSklCx+98YCAkzwgOzZVag/T9ikLxqHmD8Q=;
 b=ZNaqxGDqok8yXyC/KhyJbF44wTERTxSgUI2JjrG3NuxykLMMijNYsBtxw1dcbWCZccCj00hrj7ezEWVLJp2/s6Ji2wgxA5Bdy1na5vPsonSl62v1qpphmPaj6zLQSRbpFsFXdxn+JAJrh0qn3UhDJ1kAwcS4La4vPX3Sen6vDfMFS3GNO8pfZhGpnKLoHZaBr1jJi65iMhUX8CHA2BWK/5jGj7lYiV1wP27ZTIN9JM7RAScdoKH5g5QMEjJ9WNTa8NqXENYtMQLiLhJHmbhr36ZxpZp7lrkctHRqtVYRjTyF8CAFe2n4twHuJz5DrHmLqm62CnroKKQTb2BIz2RnEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7355.namprd11.prod.outlook.com (2603:10b6:208:433::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 22:24:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:24:46 +0000
Date: Thu, 18 Dec 2025 14:24:43 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: Re: [PATCH 4/4] drm/pagemap: Enable THP support for GPU memory
 migration
Message-ID: <aUR/K5EPi4vb9E9K@lstrano-desk.jf.intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251216201206.1660899-5-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e2e9ae0-309f-45bf-0d57-08de3e843fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lBzkIcHmX/SeOnoqSAONQ4xvGeC3+viNmA42sG/l0nooMcuL3jOz7m+YNZ?=
 =?iso-8859-1?Q?3LVDjhBU9iQ16qCDlIqenR0FIN6XfdrXSkHlM1uJvZaKAN7X8GcmgL15m/?=
 =?iso-8859-1?Q?pAnNkHzHBr1DihpVOO4CUIYPQMex4OCBW5ExyWrEYyw+XnDWfe91rz7UUN?=
 =?iso-8859-1?Q?smkPPAESrGqpnnCXzJCiZYkhKEAg/iZB5cYwiSugi3+j0BoRBpgyt7ezWw?=
 =?iso-8859-1?Q?54lbuaqUr7LVz2huyY2ItmDPaMxSgDUieQ5Qn6zyIAOA4P+jq6aGXao3Gp?=
 =?iso-8859-1?Q?qz574UKRJRnf7/wFHXU+eUGeQeoqddJpf063YDp6XGYw8WQHGz2z2bRMh1?=
 =?iso-8859-1?Q?izIIjksLCEtYDDFcZRqFfH4e419HMOMDeR9pSSMzV8Hv7ftZxbZpx6Ny98?=
 =?iso-8859-1?Q?JfuHTykwabTE47a4i9EZZ/qLsh4J5luLKTzT1LkVs87Y/fTmkeLnxMzKNi?=
 =?iso-8859-1?Q?OAmkHrxyDNwaEIWlAGGZRFKz53xZaQYHept2efeOxI5Xak0qz1ZM6611dU?=
 =?iso-8859-1?Q?MCUizODn0d4IGg/7tPF4D88ECEkESVQ73fmEV3Gb8u0WDk9C8iY8cErFbC?=
 =?iso-8859-1?Q?vpD9SgGIQpuNul0l7KDL/BU80x2Clf3ALEhyleM/ResqJac1F+ehK6UTyN?=
 =?iso-8859-1?Q?F8xtZOIb97ThJA4QNQyGl5So2ygkGodwE0PMytyau1OVtyXDygFCzJkSLw?=
 =?iso-8859-1?Q?g6GO8mTLG62G0PzLc7aqNlpbMDsxXS2U1UkgI/dUxbsd89FPTi2XS4oO6g?=
 =?iso-8859-1?Q?SarpPQ/UOjPR2cQ5PIHTKdeOUJmEaTvTXlD1g2VrU4g4OxWWT0LYSCdOLL?=
 =?iso-8859-1?Q?sPVMhijAXyIIIQg7Wrs1S862hU/gX9nhWFVwBZsTnF6Ax8vBbCY/8nh1wK?=
 =?iso-8859-1?Q?AF5nCNQ9TfVPImkcNNwOb16oaSLdQeOsB2eFMRfT+iagtbOO4o6+dQCFs1?=
 =?iso-8859-1?Q?ZwPGKM4tX1Ex7wExH4T9z9IVTLCLeO7phPHWPmSckXgDGFFVbWz2gCRfMm?=
 =?iso-8859-1?Q?TraYzyZgE/liev0dCLEnY2oGuAFVApoof26mNG5i3CglSGD/TzHcY/D8AH?=
 =?iso-8859-1?Q?R7UO1UwijTg0lkdMh9FeXtndFpAHh7O2iTHfLgsZEXo1Ah8JP/hAjp1SeG?=
 =?iso-8859-1?Q?yN80wXPbOA8IKW/OgeV8i/pZ4FE1vbIQO8Ed4wJHnnHAB018NdHi+2oDpg?=
 =?iso-8859-1?Q?7Xq1xogG11Li10X1btTy12yRf6iXV9eqjsyawgq0pAGGVmlQy8lmvfABTi?=
 =?iso-8859-1?Q?rzn5ojIqFpqKgkHOTmRwjpUJawnc0FuodD1eW+gDyXbLy+za7ZH5TD4pBh?=
 =?iso-8859-1?Q?dyJTvUW5tlxKSrjRQS5Tv88SO5Xkxhey6JEOcgq0K5M/fVWBL3vqDStiRL?=
 =?iso-8859-1?Q?qiukDiDcOjJwx5nooL8ItQ665K15WennoRXDDdp9vyourQgbSiSyyN7q6X?=
 =?iso-8859-1?Q?uO9Q29Hddt7yTabqsvqjKxuAGStbVJ6+x8tWTquPuXcqnpRXb0DMv0TwdJ?=
 =?iso-8859-1?Q?cjefAjKaBri80SBXSeK1Yi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TXdIvZ4zsdm8d4RVXrooRIzyf/cI9+noko0rXDdmmISAxOt3mhpKjbNQnH?=
 =?iso-8859-1?Q?YQxlcJORF9wGbgiHS6cE45Exb6VK6nVTDrblKc1zrfBNN3NoJ7c+qREzRv?=
 =?iso-8859-1?Q?JIVxQ7l2ktyicyL2M6mFl/fCImY8ET8HotNuDY1F2UyrJugqw67uNdVVcB?=
 =?iso-8859-1?Q?kvsYFGqMFiGgpQHPRCXc49iAy/QEMQBzPtZUCRX/O7L9GZ6CxneCFtHC1/?=
 =?iso-8859-1?Q?zEYMZnkRigN67Bh/EMf/KUvT7TPnNRwJEjOpRyui1TGH3+1sM5KuontFWg?=
 =?iso-8859-1?Q?b5dZVS65XPUydUlBMDdM2q42NafgxjvGiq4ABwEg8g0W3wRuCNqLgO5YiX?=
 =?iso-8859-1?Q?uzJYbem8SNPn1IXn2m8PYwquGEa7ewWEVGfuWpubTeWArzYlXl4apD5PV8?=
 =?iso-8859-1?Q?gNvcD0LHhcqKWHt8BIeb6E4bV73a9Ll5bZUma7T55MXya6k9Jld+4LevvD?=
 =?iso-8859-1?Q?s506yhZKQBPXw0v5rMItB2i7CJxTPNhpqXlw8xlIMnRamP9lEzQB72Ca9U?=
 =?iso-8859-1?Q?tXw6+iaoGGXVIG2J8kZ2QZUSDwnzGg+ECLdMJo3dDAU+eTD7sGcyl+XidC?=
 =?iso-8859-1?Q?Uv4aSGkD8J0mpnqxkYgip8MeTPRg8ul4H/OeHShhLMoXTrBM/9vptLSzil?=
 =?iso-8859-1?Q?7C+OWvIzIi7+15+nNkGp2GDrTyHMQPGITOP9PWut2FcTacqEKuZC8Hfd7W?=
 =?iso-8859-1?Q?5m0URgYPxM6Da1KYQRzyIO8yz0MO8LkIMll9SIrz5nrr7hDj6TbMlXwyTU?=
 =?iso-8859-1?Q?FWO0ZgZn7WqeQstZfrbowK2iEdPyAAD7vu1NxaJ/l4ELts360gHOah7hxM?=
 =?iso-8859-1?Q?mgZXz6SZ6XuxXUWrtApXEIsx/anavQWomb0oEO90fZwKbRu8rxbbDl/4GE?=
 =?iso-8859-1?Q?xuzV6JgVcVC8Ue5Wb61SclsuxQghUx1F+cV4xnwITR2PIylgMc7xweknov?=
 =?iso-8859-1?Q?2DUo1lR9W7m35ad3Gp4Kuz+UJMjsxpJB/ybMHVuk8tfr+8dmOSUYwlwJYU?=
 =?iso-8859-1?Q?ZjrD0iypFMmUuvxdzS/KUoLPMEb5hm17xrpR6Iw2RvCrVQ2FNbBMCasjRP?=
 =?iso-8859-1?Q?f91RYRpZtL2Xwb03gHFCJm5lozSko1rvXsTHJ/Widyi/PR6z2+a1QndN0k?=
 =?iso-8859-1?Q?lyfvBnEDQpf7OBH0t0tRBGAT3UK0Hg4A7H3HgbDyvcMo4kN/XdXPMCPe5c?=
 =?iso-8859-1?Q?Zzlevjb4K9v468nGw45Lwm9boxcKkm4GRwHdRh8CtHkA//KjG+GOfDIkwS?=
 =?iso-8859-1?Q?yXX00vVxYAPr0iQb2a4Ercakv+JJ2tRk99ba0z8UgOHgWsJUYfZam2t23c?=
 =?iso-8859-1?Q?td9pYPWTOsgLootKT8sjvbZIZBWMZ3aM/JvSttNKS9TtgCP8xkB7OdaDQH?=
 =?iso-8859-1?Q?/GuHH3AbjS+MUNJZnkHgV0oxzX+rZ8SXNiSXMtdAzpjE9DxsUnHO0ZCBqH?=
 =?iso-8859-1?Q?+kz1jJF9ooMhPQrCsgHGEIBt/UEbHI/D4II6O+g6qoE6V3bG7dYJmVFwBE?=
 =?iso-8859-1?Q?YA4qH6SGQeWmx0cbSbRAxp5CSjIWJQSSDMcNVzUio7e7m+FavLZL/6GXqK?=
 =?iso-8859-1?Q?DSgm9LqXfzmjqn9pBxEQbwzJJVH9xCrecAJ0/rMpc+0hPos7xKCorsFuMy?=
 =?iso-8859-1?Q?KU67yk7hpu/E5xYyehWqoj5h/DzVrBpdzAoiOpEk/rs/sLMoqGreXaKA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2e9ae0-309f-45bf-0d57-08de3e843fa4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 22:24:45.9792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcYVP2780J6CA8k8x+vvLK94l8Qf3rWOJMMqmfgi8aAQ3YJgBlOtKyd8XFs2TkmE6oS3e4dNRojevQtlRndCmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7355
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

On Tue, Dec 16, 2025 at 09:10:14PM +0100, Francois Dugast wrote:
> This enables support for Transparent Huge Pages (THP) for device pages by
> using MIGRATE_VMA_SELECT_COMPOUND during migration. It removes the need to
> split folios and loop multiple times over all pages to perform required
> operations at page level. Instead, we rely on newly introduced support for
> higher orders in drm_pagemap and folio-level API.
> 
> In Xe, this drastically improves performance when using SVM. The GT stats
> below collected after a 2MB page fault show overall servicing is more than
> 7 times faster, and thanks to reduced CPU overhead the time spent on the
> actual copy goes from 23% without THP to 80% with THP:
> 
> Without THP:
> 
>     svm_2M_pagefault_us: 966
>     svm_2M_migrate_us: 942
>     svm_2M_device_copy_us: 223
>     svm_2M_get_pages_us: 9
>     svm_2M_bind_us: 10
> 
> With THP:
> 
>     svm_2M_pagefault_us: 132
>     svm_2M_migrate_us: 128
>     svm_2M_device_copy_us: 106
>     svm_2M_get_pages_us: 1
>     svm_2M_bind_us: 2
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 88 +++++++++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_svm.c   |  5 ++
>  include/drm/drm_pagemap.h     |  5 +-
>  3 files changed, 83 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index b71e47136112..797ec2094fdf 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -211,16 +211,20 @@ void *drm_pagemap_page_zone_device_data(struct page *page)
>  /**
>   * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
>   * @page: Pointer to the page
> + * @order: Order
>   * @zdd: Pointer to the GPU SVM zone device data
>   *
>   * This function associates the given page with the specified GPU SVM zone
>   * device data and initializes it for zone device usage.
>   */
>  static void drm_pagemap_get_devmem_page(struct page *page,
> +					unsigned int order,
>  					struct drm_pagemap_zdd *zdd)
>  {
> -	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> -	zone_device_page_init(page, 0);
> +	struct folio *folio = page_folio(page);
> +
> +	folio_set_zone_device_data(folio, drm_pagemap_zdd_get(zdd));
> +	zone_device_page_init(page, order);
>  }
>  
>  /**
> @@ -345,11 +349,13 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  				  void *pgmap_owner)
>  {
>  	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
> +	struct drm_pagemap *dpagemap = devmem_allocation->dpagemap;
>  	struct migrate_vma migrate = {
>  		.start		= start,
>  		.end		= end,
>  		.pgmap_owner	= pgmap_owner,
> -		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM
> +				| MIGRATE_VMA_SELECT_COMPOUND,
>  	};
>  	unsigned long i, npages = npages_in_range(start, end);
>  	struct vm_area_struct *vas;
> @@ -409,11 +415,6 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		goto err_free;
>  	}
>  
> -	if (migrate.cpages != npages) {

I don't we want to blindly delete this. I believe if the original check
fails, call a subsequent function to calculate cpages based on the pages
in returned migrate.src, if that doesn't match npages bail out.

> -		err = -EBUSY;
> -		goto err_finalize;
> -	}
> -
>  	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
>  	if (err)
>  		goto err_finalize;
> @@ -424,13 +425,38 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  	if (err)
>  		goto err_finalize;
>  
> -	for (i = 0; i < npages; ++i) {
> +	mutex_lock(&dpagemap->folio_split_lock);
> +	for (i = 0; i < npages;) {
> +		unsigned long j;
>  		struct page *page = pfn_to_page(migrate.dst[i]);
> +		unsigned int order;
>  
>  		pages[i] = page;
>  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> -		drm_pagemap_get_devmem_page(page, zdd);
> +
> +		if (migrate.src[i] & MIGRATE_PFN_COMPOUND) {
> +			order = HPAGE_PMD_ORDER;
> +
> +			migrate.dst[i] |= MIGRATE_PFN_COMPOUND;
> +
> +			drm_pagemap_get_devmem_page(page, order, zdd);
> +
> +			for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
> +				migrate.dst[i + j] = 0;
> +
> +		} else {
> +			order = 0;
> +
> +			if (folio_order(page_folio(page)))
> +				migrate_device_split_page(page);
> +
> +			zone_device_page_init(page, 0);
> +			page->zone_device_data = drm_pagemap_zdd_get(zdd);


drm_pagemap_get_devmem_page(page, order, zdd); ?

If so, this part could be moved outside out the if/else clause.

Matt

> +		}
> +
> +		i += NR_PAGES(order);
>  	}
> +	mutex_unlock(&dpagemap->folio_split_lock);
>  
>  	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
>  	if (err)
> @@ -516,6 +542,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  		page = folio_page(folio, 0);
>  		mpfn[i] = migrate_pfn(page_to_pfn(page));
>  
> +		if (order)
> +			mpfn[i] |= MIGRATE_PFN_COMPOUND;
>  next:
>  		if (page)
>  			addr += page_size(page);
> @@ -617,8 +645,15 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	if (err)
>  		goto err_finalize;
>  
> -	for (i = 0; i < npages; ++i)
> +	for (i = 0; i < npages;) {
> +		unsigned int order = 0;
> +
>  		pages[i] = migrate_pfn_to_page(src[i]);
> +		if (pages[i])
> +			order = folio_order(page_folio(pages[i]));
> +
> +		i += NR_PAGES(order);
> +	}
>  
>  	err = ops->copy_to_ram(pages, pagemap_addr, npages);
>  	if (err)
> @@ -671,8 +706,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	struct migrate_vma migrate = {
>  		.vma		= vas,
>  		.pgmap_owner	= device_private_page_owner,
> -		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> -		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE
> +				| MIGRATE_VMA_SELECT_DEVICE_COHERENT
> +				| MIGRATE_VMA_SELECT_COMPOUND,
>  		.fault_page	= page,
>  	};
>  	struct drm_pagemap_zdd *zdd;
> @@ -753,8 +789,15 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (err)
>  		goto err_finalize;
>  
> -	for (i = 0; i < npages; ++i)
> +	for (i = 0; i < npages;) {
> +		unsigned int order = 0;
> +
>  		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> +		if (pages[i])
> +			order = folio_order(page_folio(pages[i]));
> +
> +		i += NR_PAGES(order);
> +	}
>  
>  	err = ops->copy_to_ram(pages, pagemap_addr, npages);
>  	if (err)
> @@ -813,9 +856,26 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
>  	return err ? VM_FAULT_SIGBUS : 0;
>  }
>  
> +static void drm_pagemap_folio_split(struct folio *orig_folio, struct folio *new_folio)
> +{
> +	struct drm_pagemap_zdd *zdd;
> +
> +	if (!new_folio)
> +		return;
> +
> +	new_folio->pgmap = orig_folio->pgmap;
> +	zdd = folio_zone_device_data(orig_folio);
> +	if (folio_order(new_folio))
> +		folio_set_zone_device_data(new_folio, drm_pagemap_zdd_get(zdd));
> +	else
> +		folio_page(new_folio, 0)->zone_device_data =
> +			drm_pagemap_zdd_get(zdd);
> +}
> +
>  static const struct dev_pagemap_ops drm_pagemap_pagemap_ops = {
>  	.folio_free = drm_pagemap_folio_free,
>  	.migrate_to_ram = drm_pagemap_migrate_to_ram,
> +	.folio_split = drm_pagemap_folio_split,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 93550c7c84ac..037c77de2757 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
>  
>  #include "xe_bo.h"
>  #include "xe_exec_queue_types.h"
> @@ -1470,6 +1471,10 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  	void *addr;
>  	int ret;
>  
> +	ret = drmm_mutex_init(&tile->xe->drm, &vr->dpagemap.folio_split_lock);
> +	if (ret)
> +		return ret;
> +
>  	res = devm_request_free_mem_region(dev, &iomem_resource,
>  					   vr->usable_size);
>  	if (IS_ERR(res)) {
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 3a8d0e1cef43..82b9c0e6392e 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -129,11 +129,14 @@ struct drm_pagemap_ops {
>   * struct drm_pagemap: Additional information for a struct dev_pagemap
>   * used for device p2p handshaking.
>   * @ops: The struct drm_pagemap_ops.
> - * @dev: The struct drevice owning the device-private memory.
> + * @dev: The struct device owning the device-private memory.
> + * @folio_split_lock: Lock to protect device folio splitting.
>   */
>  struct drm_pagemap {
>  	const struct drm_pagemap_ops *ops;
>  	struct device *dev;
> +	/* Protect device folio splitting */
> +	struct mutex folio_split_lock;
>  };
>  
>  struct drm_pagemap_devmem;
> -- 
> 2.43.0
> 
