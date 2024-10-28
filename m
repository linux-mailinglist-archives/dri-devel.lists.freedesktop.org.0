Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3759B3423
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 15:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE4710E4DD;
	Mon, 28 Oct 2024 14:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGDm131m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4173510E4DB;
 Mon, 28 Oct 2024 14:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730127479; x=1761663479;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3mXlHqjwP09SAMhXbOXESoz4B5DIS0iRkDmiySD/wX0=;
 b=ZGDm131mVDO7qLR9crgvwYXqR/YCBDLh8oRh8jq8NLLCaPVrGZjzAUFC
 olYTzXNfHHqq8evkAGrNb8/IRC0LVXHthzQB9L2VT7R7OH6/4OW4ujTl+
 Atl2Rhv3EyyImgD+igiAXhdrBsN5VZct13HmqARgKrnbg9zhQcyZOlRys
 C7hLr914FolSUZ9BXTXpPfbBGLB8VDMioU91ZpBvBQouxOxTS80QNByJz
 c6ckP1f7UfMJyfNo0eotjW6uf7AGAt5hJv0gbF3RRGrBm9u88RcUJ1qCt
 NTWV8LVP66udi+smgochAKWVsdhZTMl4cxnNQlkTdIfqAvZv95Az5TLWT A==;
X-CSE-ConnectionGUID: zzQL4GqkSF2I3muUPOflSQ==
X-CSE-MsgGUID: irPE3j1JR86kvpl39y0xqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40264005"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40264005"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 07:57:16 -0700
X-CSE-ConnectionGUID: Xzj51W/DRgy9dRtyv12bDQ==
X-CSE-MsgGUID: +WuDRQhKRU2Ey9NmC5ohPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="119101824"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 07:57:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 07:57:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 07:57:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 07:57:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBCmE6l9YnI2XoXm5fDewbS1TD6q86Wh90WiJBrg9K4cL58ZpV1zFu2doXnzIAK5pWn963ouSI8Vo3oqnwIWUfVMvxMsbuf6JkGpkgEsizJ0/6tvzJrBqjgpb+xLA5WQPbWxd4UP3be6o6TNt0uxRcCva/WEMICmoAoQCWA/DHE97CRaH57PN4YH4DODzAczXEPTWr0zhLB3caO8hgawMcpdhGXVR3/uVR0PMB3uDxosnLaPDyHduWQEre642lnJZ/GAG7o+sQ0GYmVBNUlasmjAnjzepRJqxX4RCiy5sPBhHkK3MNxa8gXM/wZlTUKraox2w60Z3IKANHS3yYw1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuICFapbBHben6zYUk8hAAXlyaV0+ONAKolTZ5zJ7ls=;
 b=jPlvHh2vJAuzN3izsZXYwtuevC0808u2xtpW0o+n0cAEq3lQK2oPZDI1aVfMgGq3018bZgJ7mZFLlEnK7zo9bKyNvdOFtcHq5EZyBF0G9XT38WCd9XaN3486tiVDzL1oXGeT01Da9A/2Lb/JnFbMqd/nAT2kBLHKNTDreO/rVfD7WfxaxIWZb6QRDgaaMKnZ/HjRWBLCL2seG4nnhmBzpyP81CejpZWt114b+YY58XS6s4xzBBy6xdrYT+DaU7yHNcVtPhZFRL8bLjPf4TFGqGKnA0GD2PW1shHHbAQkr1eJ4H/5EfP0c83O62SLgonBIOx/RJ/Noa+8brmrXtD+fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB6672.namprd11.prod.outlook.com (2603:10b6:a03:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 14:57:08 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 14:57:08 +0000
Date: Mon, 28 Oct 2024 10:57:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Imre <imre.deak@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/10] mtd: intel-dg: wake card on operations
Message-ID: <Zx-mPQSHXv5Teq_j@intel.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
 <20241022104119.3149051-7-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241022104119.3149051-7-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4PR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:303:b7::35) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB6672:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b3b705-c3c2-47da-e395-08dcf760cb40
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tOjoNlWYnjtk3bOh65pqf7j5LpDXu6NAKJysbZIw868wqDgpkNpENV8tmctp?=
 =?us-ascii?Q?56LiuWrbHYRSi4KqSr4fJhRxQsu2cGecH4vTbq575uZQToH+2tPDmqc9NPHy?=
 =?us-ascii?Q?1o5IoV/iOeGExsCwvbFcndEN1Q4zOji9k2DAilpZk2T171OD73kPpajh9adR?=
 =?us-ascii?Q?1bhH5cD9nDtz4tt9Sr5rMFu8dzDQXClSSXeVZ/kWlBQ7EFE0UVMFo+YAUvR5?=
 =?us-ascii?Q?aPa8uzB8QB4bEOAG8b9dRMn/ySjndJ385NVuBp3Ss9aoAa4wv3hf4mEJjRGa?=
 =?us-ascii?Q?S4C2P+U3UhVCpqUz3XwOtiOYwik6bDdd66bXnTlxuNaZAR+4TV5xZJ/842gF?=
 =?us-ascii?Q?Bh8wNS6II5LmK0lhQNQLhcTnfAOPJl4idCUKo7cHk47HBf3bxLM9dBSjAuU9?=
 =?us-ascii?Q?htUoc869EA/6VYy/9sDzNUmtIx92K/S8DbbNuLNYXISxOWEW5oWVm9F8qddS?=
 =?us-ascii?Q?K1XJ313HQErZ9giCTL0tUlXGVYvNQq1x3yJqd+vuMmCx8mKHh66q87FYKt1W?=
 =?us-ascii?Q?1C1SenjtuRez26u5rRqg02R//fPLPqGXbv07nqElNez3lryn1C6i4Nm/QxjC?=
 =?us-ascii?Q?7uR6M3El3BwlyKHJsj8oXNbAPMwaRlNdd61xJdg4GfiCB8zLiaP/o+vGLExd?=
 =?us-ascii?Q?jDHk52S7M64kxIXZzJ/e3A591kEzHz9YnQvXpqYys5djhxyJQhgVvnEKCImk?=
 =?us-ascii?Q?8a2DqPV74lMJXnMYLrc0b29IP/i2HX53O9CdwqHaEYcEBUhuf6lmus87fy1S?=
 =?us-ascii?Q?iXDADXBbFYC9227PMJ28iwepdqJToq2mj568wlE3v5fRxZdAJhS9sPj0wkys?=
 =?us-ascii?Q?U2UzBGA6M8DJd4wBg2yDFH4jV84q9Bm5XzQCW5p3gpvDvKu67RGeZjonv/kt?=
 =?us-ascii?Q?hZWbdYy70uLVkoJ+AoWxFo/s3tb+GyD8PJCLA7WQdwGyyA+0mWv2HYMhVl7W?=
 =?us-ascii?Q?C5VLwMueKz/iYsxfwVuiGS6rfrUh009pPjwoz990ZAjdrkzwdXaqWs3Y0CjZ?=
 =?us-ascii?Q?7Gv9VTT0Ewi67Bgp5WMr7RczyFImFWFs8njV4r59DXwFhlJ+5fToYTbm02nA?=
 =?us-ascii?Q?41zxLFTW/VsQVbX+vUMAVD6zX5eOEgegnffO+0c8a+Uy75iAakIHGkGKoiLE?=
 =?us-ascii?Q?E7GsXJfWNrXzDFKHfths3cltFZBkwvWcH6yAUa54TmfIyolOPfHeCFKGIZzt?=
 =?us-ascii?Q?hIvfoQW0p/SZdYoRZEm92GMHEuE2QO0/E7huFsKcz7qAyd8648MF7gwcwol9?=
 =?us-ascii?Q?hTEAuRUeICvWhs1leOdM90ig/c/GmFuShFdWbC9otFTZeDmVEp9OYSXAo72v?=
 =?us-ascii?Q?/PmwGPyo+1sZ5P2C57yi0NHp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UJrRbXYtNLG3WGl7gvVGFvjRGRQAEWkqAfk0IF/zBlic++vwKT0Z9SRNiS1R?=
 =?us-ascii?Q?KCZzjm9Wfh+XbKayKAWaSGI728Sn9RjYwTK7czsr+0AxrbAQSrjXjQvKxUv3?=
 =?us-ascii?Q?Y7PnSz0PMo39qJsgh/UtebPMTH3WcaJjjJbRub4BYEsdplHoayRJey7b5Uo9?=
 =?us-ascii?Q?ZUwTPuav1vgN2D0IeyPX5TRSROwmwukV12jQvmLKcQVxJxrfUZu9a0DM+2aF?=
 =?us-ascii?Q?c4FuP6wnUroh5fiRXbo7HuB+kVz2dBQxuJ6R+XillCqbTUQ4esjdAByC9CIN?=
 =?us-ascii?Q?FJoS4ywTBytf3fDG5e9RBGyPJO2WZxUAs5qwx7gcKJfZICE0E+Xmni1E95VN?=
 =?us-ascii?Q?sRDd8aGPwYsz1W4PUcnRFVPhh2Ygt8YGZHhdvXF8yV1qa/psR7yHgEEwnjHk?=
 =?us-ascii?Q?aCvslZ3bHJgjXRTikFaC4y0u6+dHDUXwHUOHYxvNA0q+6u0R7fe7/GH+z/Kp?=
 =?us-ascii?Q?wYLoQIWGoMjASd0ECyzmTRys+DXoSfQdxyrCrQFAps/mykNqA+R3Zw8TJ3Qe?=
 =?us-ascii?Q?y1kDXp4YBsy96fdmTYSVCoN2lfGGlxtq+PAoATGTI6+vkub+GteEuqAaIr1w?=
 =?us-ascii?Q?8uaMONJA7zB3yj5rkmgpJ7ts8Dp6R2hW+n5EKR1zqsgvmlmIEsOcvgxyIb5D?=
 =?us-ascii?Q?sl98Wfj+WnRdYdCntoHz3oWiswtpn/PlU5t92bcEglfM6pqWBuM4mqLBUi1z?=
 =?us-ascii?Q?twjrWLccukD1Qxmosw7UJsnYA1o50kZz8NRQ1J6gIidlaVgJvpNBnfM+Eah6?=
 =?us-ascii?Q?PmcCTUr2FOGtXgzyznk21+ojUC0aTVcbpOm2ISfF33DCZSlTLY3tC2kgrmyT?=
 =?us-ascii?Q?EWKFcr1gaIt2g44WzHSTINXQgZKw84b0s49z+kegIjD+ozG7mwZsPaAfRqFf?=
 =?us-ascii?Q?jLDWkJ+ZFMWOm+peMYMa7cfCvdFK/Dl2awVk65YCp5Pe1ZZI2ACSwRoSGqIB?=
 =?us-ascii?Q?C2TPQldLKGHJN6UtnmWYg75KgiTAqtKMAlDKypXUHYIsz8G4pUhUajtdukf/?=
 =?us-ascii?Q?bIfCy6vyot0EePC3uQrbjWrAgHjmMOe1VDSZoMnUbzn9LY+QjaCBbmEAIa9B?=
 =?us-ascii?Q?AcnT819ln0D0YxFo3CdnAJnw4+eSSNv0mX7MRuXTrstbtRheaKrRVXfg44Ox?=
 =?us-ascii?Q?u4Fbjorzijh46Dd8OLb6dlgG30FBMSQ0nlFr7vAGXp4GMFmIYFnSJlFoYK2m?=
 =?us-ascii?Q?sc5GQe/DlkSG0xSXvSMNqwDwG8Gfzr4d9LgczNrvypb4LdrDyJYjnCaKViqk?=
 =?us-ascii?Q?McxTqBn90bua0/ihHMX3qOZRl1xrsCuXj5r5OxgVPXvblrffa0wQcxTmAp7/?=
 =?us-ascii?Q?9t0+7krNynbep387+Ootjz+hSvQS346AH+ir1fNXEXJAvBFkd2G6Vj/f4N7Y?=
 =?us-ascii?Q?me737JBM3Mz/ok3WlX2MeSd2TDmEmF/nV9KiBcqDw4PuQpAUE/dlKc1uvtre?=
 =?us-ascii?Q?jiTQp5sVjA5jw9/LhBLMzi/krTr+tbp1gqrF0Ejljdbh1FvtcT9l5BIOZP1f?=
 =?us-ascii?Q?+0vkc0uzaFWi6mqI94bh0P9R4IECzpxysRWz2EhVoiV2OF2bL5A6qqkMQrDF?=
 =?us-ascii?Q?oiQ1pClogP4cLieibyEc7xNpHufRZvZY6CQkHrHljIp2i6nZjJtx85RK1t5z?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b3b705-c3c2-47da-e395-08dcf760cb40
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:57:08.1428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wi8SoGWdjivDZNzT6BENKZ9HyRWausFBY/MAwJYO+Ggv/Xugssda7R1Psep26ct/Gk53S8FEEDCs1zz8rFv8Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6672
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

On Tue, Oct 22, 2024 at 01:41:15PM +0300, Alexander Usyskin wrote:
> Enable runtime PM in mtd driver to notify graphics driver that
> whole card should be kept awake while nvm operations are
> performed through this driver.
> 
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/mtd/devices/mtd-intel-dg.c | 73 +++++++++++++++++++++++++-----
>  1 file changed, 61 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
> index 4951438e8faf..3d53f35478e8 100644
> --- a/drivers/mtd/devices/mtd-intel-dg.c
> +++ b/drivers/mtd/devices/mtd-intel-dg.c
> @@ -15,11 +15,14 @@
>  #include <linux/module.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/string.h>
>  #include <linux/slab.h>
>  #include <linux/sizes.h>
>  #include <linux/types.h>
>  
> +#define INTEL_DG_NVM_RPM_TIMEOUT 500
> +
>  struct intel_dg_nvm {
>  	struct kref refcnt;
>  	struct mtd_info mtd;
> @@ -462,6 +465,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>  	loff_t from;
>  	size_t len;
>  	size_t total_len;
> +	int ret = 0;
>  
>  	if (WARN_ON(!nvm))
>  		return -EINVAL;
> @@ -476,20 +480,28 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>  	total_len = info->len;
>  	addr = info->addr;
>  
> +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
> +		return ret;
> +	}
> +
>  	guard(mutex)(&nvm->lock);
>  
>  	while (total_len > 0) {
>  		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
>  			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
>  			info->fail_addr = addr;
> -			return -ERANGE;
> +			ret = -ERANGE;
> +			goto out;
>  		}
>  
>  		idx = idg_nvm_get_region(nvm, addr);
>  		if (idx >= nvm->nregions) {
>  			dev_err(&mtd->dev, "out of range");
>  			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
> -			return -ERANGE;
> +			ret = -ERANGE;
> +			goto out;
>  		}
>  
>  		from = addr - nvm->regions[idx].offset;
> @@ -505,14 +517,18 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>  		if (bytes < 0) {
>  			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
>  			info->fail_addr += nvm->regions[idx].offset;
> -			return bytes;
> +			ret = bytes;
> +			goto out;
>  		}
>  
>  		addr += len;
>  		total_len -= len;
>  	}
>  
> -	return 0;
> +out:
> +	pm_runtime_mark_last_busy(mtd->dev.parent);
> +	pm_runtime_put_autosuspend(mtd->dev.parent);
> +	return ret;
>  }
>  
>  static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
> @@ -541,17 +557,25 @@ static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	if (len > nvm->regions[idx].size - from)
>  		len = nvm->regions[idx].size - from;
>  
> +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> +		return ret;
> +	}
> +
>  	guard(mutex)(&nvm->lock);
>  
>  	ret = idg_read(nvm, region, from, len, buf);
>  	if (ret < 0) {
>  		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
> -		return ret;
> +	} else {
> +		*retlen = ret;
> +		ret = 0;
>  	}
>  
> -	*retlen = ret;
> -
> -	return 0;
> +	pm_runtime_mark_last_busy(mtd->dev.parent);
> +	pm_runtime_put_autosuspend(mtd->dev.parent);
> +	return ret;
>  }
>  
>  static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
> @@ -580,17 +604,25 @@ static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
>  	if (len > nvm->regions[idx].size - to)
>  		len = nvm->regions[idx].size - to;
>  
> +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> +		return ret;
> +	}
> +
>  	guard(mutex)(&nvm->lock);
>  
>  	ret = idg_write(nvm, region, to, len, buf);
>  	if (ret < 0) {
>  		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
> -		return ret;
> +	} else {
> +		*retlen = ret;
> +		ret = 0;
>  	}
>  
> -	*retlen = ret;
> -
> -	return 0;
> +	pm_runtime_mark_last_busy(mtd->dev.parent);
> +	pm_runtime_put_autosuspend(mtd->dev.parent);
> +	return ret;
>  }
>  
>  static void intel_dg_nvm_release(struct kref *kref)
> @@ -722,6 +754,17 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  		n++;
>  	}
>  
> +	pm_runtime_enable(device);
> +
> +	pm_runtime_set_autosuspend_delay(device, INTEL_DG_NVM_RPM_TIMEOUT);
> +	pm_runtime_use_autosuspend(device);

something looks strange here...
on the functions above you get and put references for the parent device directly.
But here you enable the rpm for this device.

If I remember correctly from some old experiments, the rpm is smart enough
and wake up the parent before waking up the child. So I'm wondering if we should
only do the child without the parent.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>

> +
> +	ret = pm_runtime_resume_and_get(device);
> +	if (ret < 0) {
> +		dev_err(device, "rpm: get failed %d\n", ret);
> +		goto err_norpm;
> +	}
> +
>  	nvm->base = devm_ioremap_resource(device, &invm->bar);
>  	if (IS_ERR(nvm->base)) {
>  		dev_err(device, "mmio not mapped\n");
> @@ -744,9 +787,13 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  
>  	dev_set_drvdata(&aux_dev->dev, nvm);
>  
> +	pm_runtime_put(device);
>  	return 0;
>  
>  err:
> +	pm_runtime_put(device);
> +err_norpm:
> +	pm_runtime_disable(device);
>  	kref_put(&nvm->refcnt, intel_dg_nvm_release);
>  	return ret;
>  }
> @@ -758,6 +805,8 @@ static void intel_dg_mtd_remove(struct auxiliary_device *aux_dev)
>  	if (!nvm)
>  		return;
>  
> +	pm_runtime_disable(&aux_dev->dev);
> +
>  	mtd_device_unregister(&nvm->mtd);
>  
>  	dev_set_drvdata(&aux_dev->dev, NULL);
> -- 
> 2.43.0
> 
