Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B6A6AE9C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 20:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1406E10E035;
	Thu, 20 Mar 2025 19:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PpWdCZe4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF7E10E035;
 Thu, 20 Mar 2025 19:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742499363; x=1774035363;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iFGp3h8lYqWzYstfJsTmUfYjQtN42LjcA0492WU+SoU=;
 b=PpWdCZe4sVZsJfCT3CLrIKUcc/AJ/UAe8jesXxLN+jNjZnZBRST5rnQi
 XZOnGse4MroUcEC3mcuVdjuWEmrzstWTiaeumk1YUzs63FIfdAvKcuUNX
 9rdrxYb+7uHTj1kkimcipgyoTCj4gBY1A/ltib523g1ULiDloT0HKmuLQ
 7KZLtBTjM7iZNuydky6MbihVBCu6oS3Nzeb8kwPJ01PyFVbqkfSQfuhWz
 ngxFawfjsBu4w92XeKwiK0KM4MeslxrLZiHWRjsCQIFztAH1waB/buaEL
 m9axnJo92Aq1kITJ4/Z124nIQBy59bWrEjTOHNHmpT5gp9FtkQ/6WxKKs w==;
X-CSE-ConnectionGUID: VdM+xSE0QTiekSvQSsd74A==
X-CSE-MsgGUID: qeDtzX0XRQKELLWDY1xemw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43762587"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43762587"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:36:03 -0700
X-CSE-ConnectionGUID: RNCjHRerTp6i2ltxkQFaiw==
X-CSE-MsgGUID: J1cmTR0JRWWcTuF3s8BBwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="124138953"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:36:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 12:36:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 12:36:02 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 12:36:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqarZbdxZafMG3uKOHB87yw2W21iFTfTKy6yn0sOeWKRbplo7t4t+7JiAwBQPOQcQKdyHXAidjrcqd2KqoBRCmGgffGP6W8tXTSH2Fma6hsigMhz1nYRBwqTCG9br8OJ6oaO5nY444YjfADwu28r6t2VvGvSM4koBo7FMQyIc6BrS4dQejB8FDglJsM/5J44L9cPZPVIRAhHNPnBCw65Rz85Z4in2Ty4tk82K+xHQPOVc4cUPnJhT6vvUiGOBjA8aW/Z3q1LWx2RgR/n+Egv/O1lduv7st7x9CM02LpN+ZaP+qvBwGsTIsFKmUcAi7B2tMEDF37NmpyGMdcNzhaPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XT/8mOJQ2W0o/NvsTmjR7pwrkIJhJIvx5ojGuby3X/o=;
 b=jRYndURS4fWCQt8ziNIKBR7XFWOIUDMaguGTgFn1ScvIWerTXnpIMUf4C/a5RLyP6RLJSJh2vQQyrrrQT0CZgDokY2/9iB2BdhTsDgkB7IDg5CLAi03Nuy4OWFlCxkBYZswrsjsSIz+bXSHiaAiw5ewqGOu5GMlXMJ6rZ3ZHSogaEliGzd/znGDxtmbgHoho7WQgvleuegF+3P9PTL1ffTbj77QQUop2T4jwN+0uaAtfPhO0dIUmDUMftGF5kV+vS7ZkyZDfRe46p7rJBv/C8S+Ev5S5D/cC5ib8tszEh9kfOLrvHk7arjWnCjhwUZEpw9Vnc66y0TdKUTjf93ay0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB8190.namprd11.prod.outlook.com (2603:10b6:610:188::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 19:35:59 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 19:35:59 +0000
Date: Thu, 20 Mar 2025 12:37:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/7] drm/gpusvm: use more selective dma dir in get_pages()
Message-ID: <Z9xuZZZlseaWCzCL@lstrano-desk.jf.intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-11-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320172956.168358-11-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0226.namprd04.prod.outlook.com
 (2603:10b6:303:87::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7c9edc-4ab3-40fe-9acb-08dd67e670c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GPptYtnohAvmQ5J39ACMF9nin7sBnKddL9p6uSFrNaV+AV228bjusirVbr?=
 =?iso-8859-1?Q?Zk1APl3J8gvCWukXGnawzRzfqmXBqnozlHExAz8WL5vBVp0EUgqFW6HN6h?=
 =?iso-8859-1?Q?mUFIz9tAwjRbv5BK9hHWhOFftxJnYZuW6fvInFf2vFMwaokTLToyaCG1Eh?=
 =?iso-8859-1?Q?yQ3mfdRi7YE5vwQTe6udGXaGi4HjGF2J+2N01ntOFq3OwCTfVVWNh4ht0P?=
 =?iso-8859-1?Q?h3Krsx6WOgHBpVY7UkTWgehirxHgkcfQCuDw51ECIJTagj9zYA4aXLErjd?=
 =?iso-8859-1?Q?GcQ/ynJj5Q599/qU4xyf2iRSOHCtoSlzPeglaZdtZssaH3F3Ah0wfN4ZD/?=
 =?iso-8859-1?Q?j2gaGG6wf0NO4yExW7bLlPNGzy9LmC+OQ7cZ4cBh8ajcsXM/MWpyFmGy8A?=
 =?iso-8859-1?Q?kv5tuhej/E3KWjmaRh0hjHHGBSjIMblrHqtV6K3f1vWygikz0htIBFFxhO?=
 =?iso-8859-1?Q?4P6rvkqTejLxddvJWj72v4pftrxOHr5DCs/q1IczW8eXU4X5u5GRBQtGuR?=
 =?iso-8859-1?Q?RrD4q5uJokxjqLgc3S+zJs65DLA/fSxTti+zpBXZ/1/vFvHpranG9XWMLM?=
 =?iso-8859-1?Q?SoTek9k0DMd0A7prnKYpB4MntBAzCF+mcCZjyCLxXH/EgaDVHpsKGImfk4?=
 =?iso-8859-1?Q?Pd7awcX5fIb1KY1oufT4fZ2ZJV4Oxfeo62L1fs6muYo4/yAPWEgLsNqXc9?=
 =?iso-8859-1?Q?RmNTu4WEGhvzVAWUVtnKeNR3aUEQ//8w1EZZxqw84hrwHQtefaY9iV5zke?=
 =?iso-8859-1?Q?SM80aTyxgjnWXUKgWlmP7vTRNVDnfI8SsfG9GHy/a8Gr2vzbcTijfgLf/c?=
 =?iso-8859-1?Q?3U+Gc+7qO5lEUDv6qyN5w18W9Yd8P//2+dC/oMxRareS1G7yp38vn6xoOe?=
 =?iso-8859-1?Q?oppeDhwCaHygq2qeYwcXVU46IWkCCDeKLAPv0SuhnKD8BOp9vgK8cps8Jc?=
 =?iso-8859-1?Q?75T7GTQdy9znFCQCPqWqZ0ZvgyJ+OcybEMm9NvUG3HzCBs1yTEL+cvuRhz?=
 =?iso-8859-1?Q?exjRsRobPS9pf9/BqgffwX6HfNCCw2KEjptjD9blUweYJmJ6oG1ceTLcEa?=
 =?iso-8859-1?Q?r8NWoH2yRMGRY+ExPZvdxdN/w/OgFuYGW3zhF2DqbOgYdZkqwsW5co4u/s?=
 =?iso-8859-1?Q?qSWLLND+rTtRVmVvs8/6vb5jYygNNc3x8qoy1Clp3P2U8lX8l1sNMJMSZn?=
 =?iso-8859-1?Q?Ge6b5T4U5gQMbFoGfLELUNPuqBZ0aoxNBCzSGfrBR6hTD1qnj5ZkhVObaU?=
 =?iso-8859-1?Q?LhKHrPn6KMWJg6S3TM7pOQht4FDE6LHchHOWVnBPe2YZ2xxX/4FUpcSrPy?=
 =?iso-8859-1?Q?3UM8P4toMooN5GhlnQkoyJCnROvAasXAxrKQUbdJUcYvnZ+wu9tAcT3zTU?=
 =?iso-8859-1?Q?Qb3VwFaPHwYxXENCV4GbIWROOi81KBBCeWoii5FibW5R4Rykz3tvHwkxaL?=
 =?iso-8859-1?Q?3YI0xBN4c1ukfbST?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LV68g+pTV2d33CB8PTiyj1fHKaAvziPSxf/76JNCK8RG46/5NMHXgwgvj4?=
 =?iso-8859-1?Q?GBZQpNZ5fUhQ6fF4M2rmGDCDzVu5R/pQdU8/UcqeeSTs+fZx3grsGfLzmU?=
 =?iso-8859-1?Q?E4+olobTLwZ+SOcoArHJWsiNM/h09eq+xbxcK+GKgASmvFkYnUlgjCZ3NX?=
 =?iso-8859-1?Q?Wfy9okcvY1KHRA3vfO8SpG4lC65EqKcSukFUya0tiEzTRztoYFTFQSedey?=
 =?iso-8859-1?Q?fL4AnH+hH1s9imWXOYJvI5luCUvUlV+E/oHaUbkMnZ+atbkJRBiDyUrOya?=
 =?iso-8859-1?Q?6Iea0UQLG5Scs62jucpJnipGFB0cD00BKelC/QHSwflLZS9rZSMK+SLKf0?=
 =?iso-8859-1?Q?iKmbJR8+c0QWcxSVCDXLLxTi3KAB8XQtKJMKIY+RkxxlfWj0lkFE/hn3oy?=
 =?iso-8859-1?Q?+VWIRDUxJfnLw+BDzYGZH3yXcKmWLT52aaB4TUyCY/45oIwFNx7rbsRlsg?=
 =?iso-8859-1?Q?N60onwI1s8gm7CMxzTC2BkcMm9/k7DRjXvE2fzBNmijdmt9OYj6zbUksRD?=
 =?iso-8859-1?Q?dGoR29XQeLNwx9WMUPu/UdXENQ7e/vXhhrn9vkIt6Wk8GCtJNljxkuqIgF?=
 =?iso-8859-1?Q?mGajldnf3eSr21yQpkQfhZTZxYCsF1Ih2+tWoPxtpj7AMCHnsAoDqfqbiV?=
 =?iso-8859-1?Q?KfEzkhjMD//ZsgeoAWNB2P6gh/cNNRB76kgGeh12AUwxA7g/XZrioD9kct?=
 =?iso-8859-1?Q?IR7WxX6Wf76uk+6PN68X1uD7UdreVVhR98jIyUaiWEGziNHeuMuH9J78bb?=
 =?iso-8859-1?Q?FbSB51Lpyg9psKQhpp5CdCzEveVFaZcB6RUHSDkvefO8FYlTl26MZOgUrz?=
 =?iso-8859-1?Q?oDwb/6fTMXuyWGpQQuxiXFlyD2CQ0IA1B0h+Bun+ICHYnZkflXEJgwJv5E?=
 =?iso-8859-1?Q?VYeXJHBzjxhlF/+1Fhr7Q40THNV8dUBKbQ7TJgqoUkODs27GkpxxiWBeb5?=
 =?iso-8859-1?Q?193ctbgeBJAbwiUqFy5/wek3WNesz+3gTm0rPQLFsvy6xm2JZf7gPOlz3r?=
 =?iso-8859-1?Q?IIrWXCSsPfpIipWJP29OOsYYKMFMjOdN8rvXqbYHBVyzqua++NYhgzDd0p?=
 =?iso-8859-1?Q?st5sCJw+eOMamrlKfPGfjVofGQ+dWCFuE0wN0WYegMge+YxxmlOrxKNsi3?=
 =?iso-8859-1?Q?nQAzrKuExrL2+suaBvo16E1vYx+Y0VHiu28s+EuhNOGuLkTwGs0vZyHAiq?=
 =?iso-8859-1?Q?nbxoq/VPuvgEekIY8R1oMTkq6lmS/XBkZsN5V+fxQNvbgnaQeYkFaGpQv2?=
 =?iso-8859-1?Q?4JezrPnbCmKUV4Bpo4DVqIAymyVFyUyGT7Q4PDpKGqPKcRHJ5QjS5wWggk?=
 =?iso-8859-1?Q?/6dU5HOQEja7X8vk9e7GG9+FgjUu79Aq3ElWjsaeubfv1uGWEzR8TPFVVk?=
 =?iso-8859-1?Q?pUwVCs2E1IClq16gnEwLg2RBKs/pr1cow4OLYZHXuFIVqYpkIEqyan1JE3?=
 =?iso-8859-1?Q?b2noNy0i9vFjJI/j9sQCokwtNVq+MqEM16QQ5LUIdaIjdbAWHozIa8Esfw?=
 =?iso-8859-1?Q?/PCv8KWDnim3jcY6gEY5kTQ8Um+xnuZOv3JyBErBFIMxZ/MdX3WpDU7YlK?=
 =?iso-8859-1?Q?a0fEnoNl3F2C6/pDWxQBbSe0i9c7KNraSxEqyBGbmW64jHGZ4vsW4b+Crr?=
 =?iso-8859-1?Q?d8mbtpsz5/55nH08lX+vWatoEUzlY4PBHzg868LT+d0zjlvoWDAxf8SA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7c9edc-4ab3-40fe-9acb-08dd67e670c8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 19:35:59.0368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLT58rU1sFE9zeDhNoag1qK5G+ypuYi+dhaIi8OIySFnX1rs6nS3xmAFmzmrCqt3d4FPNJGpGfUKyF3ZkOepZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8190
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

On Thu, Mar 20, 2025 at 05:29:59PM +0000, Matthew Auld wrote:
> If we are only reading the memory then from the device pov the direction
> can be DMA_TO_DEVICE. This aligns with the xe-userptr code. Using the
> most restrictive data direction to represent the access is normally a
> good idea.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_gpusvm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 48993cef4a74..7f1cf5492bba 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1355,6 +1355,8 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  	int err = 0;
>  	struct dev_pagemap *pagemap;
>  	struct drm_pagemap *dpagemap;
> +	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
> +							   DMA_BIDIRECTIONAL;
>  
>  retry:
>  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> @@ -1459,7 +1461,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  				dpagemap->ops->device_map(dpagemap,
>  							  gpusvm->drm->dev,
>  							  page, order,
> -							  DMA_BIDIRECTIONAL);
> +							  dma_dir);
>  			if (dma_mapping_error(gpusvm->drm->dev,
>  					      range->dma_addr[j].addr)) {
>  				err = -EFAULT;
> @@ -1478,7 +1480,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  			addr = dma_map_page(gpusvm->drm->dev,
>  					    page, 0,
>  					    PAGE_SIZE << order,
> -					    DMA_BIDIRECTIONAL);
> +					    dma_dir);
>  			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
>  				err = -EFAULT;
>  				goto err_unmap;
> @@ -1486,7 +1488,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  
>  			range->dma_addr[j] = drm_pagemap_device_addr_encode
>  				(addr, DRM_INTERCONNECT_SYSTEM, order,
> -				 DMA_BIDIRECTIONAL);
> +				 dma_dir);
>  		}
>  		i += 1 << order;
>  		num_dma_mapped = i;
> -- 
> 2.48.1
> 
