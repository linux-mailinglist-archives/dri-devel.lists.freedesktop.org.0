Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E409F942D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 15:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A9610E387;
	Fri, 20 Dec 2024 14:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmT/ff11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E1B10E0D5;
 Fri, 20 Dec 2024 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734704573; x=1766240573;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fTIstZS8VDCGSOVrlj6cX6squJAlhWdq+dbYuZlnPVA=;
 b=YmT/ff11/+HDTHph4Q0Q7YE9aGFZED4trvGVGq6xR766WE2kq4eeCLxJ
 yxgv4OOTzhoy/CvZC842gUN8Ed+qjvw2dljzkKZ8QiXxURM9XcAG9xqDF
 LWqF9M6kmlA5+FVgQ6iz60IBEI57tJ6Un5WfHDtA4ztngfsCBp2gUgmzm
 cnJOWFYZA7Nemzjp4n+iKEtntXFaGyXAOW+rn96ZX/Iany5/boQFlGaNB
 sXwFuK10Q/C+afhBBPbrFJC38tGP+rfrkk/V10sc8CTHho5PEEZhxg/2Q
 CiIIFFQvKd4SPQe9vfkI/SI7U0tJOPLvWcuEsDIWJOEIJqHNZurxeff+b g==;
X-CSE-ConnectionGUID: UTmxbTchRK+RGFgG9nFjWQ==
X-CSE-MsgGUID: F3TX01EgTC+/+D9/UHR4Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35145195"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="35145195"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 06:22:52 -0800
X-CSE-ConnectionGUID: xY00Ceq8T0yHuTTEpC+/Uw==
X-CSE-MsgGUID: Rjzv02YfRRi8GgtfUHPF2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135868073"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 06:22:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 06:22:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 06:22:52 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 06:22:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUZp1SlN9RnZUk2NXZZwJYbgc7D/yNkrWnrv7hdNxDoJ641a0c2spYClji58Mi4BWjCTTY0AGK4djhrXzNbg/ym4pvVezRneaQ6PSk+pCnFGuhjwgSk/FtFUkUHneh9IdzEcra16nVnbgJGQiSMKP9f45Lgn7ty5lVzUfiw987DZPKTAL7Qa0iOVtc733m2UvKpRPyUeonRfeZ9fWRBAGvtMPy4viFTrwe8J1Tu5oKWXJ8CLP/WpM2J5oBKFk1YFpHD0b8Zsdty8+zjj4YSk3nLDijthxPwMALx7qo65wWrhPyj9ucYgD1YAtzFuNABef2RMlgoHtXmj4PnyMay0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4ZDY9GkxZBoUFuw9MsML2+zjBLUbFolUWR9Btsv1IQ=;
 b=bHcI7aqVbR4BfiAYhBaHRWTGmDbDNDSjn67MI52tUMpTiOqyWmo8QdralsbWMIK21neAxcn/Jgurv83pnFMokVSxwTX0VV2YlBVnvYRbWbA6MT2JnhVCS1NxOz2YXQ2OkhU7X2BfCO+IlI7zqZOhROO0FVeQf5SfiEMyGZ0Sg8P8wifc57KJdkK1WXBGsAB/YXxx3enowjVNQmkY/PscXAZHVYPFACwgy15biCpjjmCzPGzn+3nqeyeIN3t/DEywyEeyVxgoavysZJp3i3lFRvPKwOhUdJ3hV4OAp0aPv+sL3KAfRlqkso8DS29oTeWXyRmcKmxCv2y6HpJfhx+uzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 14:22:45 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 14:22:45 +0000
Date: Fri, 20 Dec 2024 09:22:39 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>, <linux-kernel@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Tejun
 Heo" <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner
 <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, "Friedrich
 Vock" <friedrich.vock@gmx.de>, <cgroups@vger.kernel.org>,
 <linux-mm@kvack.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 4/7] drm/xe: Implement cgroup for vram
Message-ID: <Z2V9r80L2IgKdgvJ@intel.com>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <20241204134410.1161769-5-dev@lankhorst.se>
 <20241219-banana-pudu-of-radiance-aa62db@houat>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241219-banana-pudu-of-radiance-aa62db@houat>
X-ClientProxiedBy: MW4P223CA0013.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::18) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1a7c35-2e42-4b14-3755-08dd2101c588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tRi8gj+uuow0RcN67sBDj/uJLEK0/6YxqsapTbLnHTs4OTn3IjC1eY/1BBfO?=
 =?us-ascii?Q?Erdmp8Oukhgeh7406ujNiTli9BSEEG5zgYmiH8F9ncL0f2siT77sf+k/IUm2?=
 =?us-ascii?Q?3Bp7t3g6FEnIFEj6Xjx6ymoB83O5z7OnzxpChauKFU1KsyaCBedjikdvd9Ut?=
 =?us-ascii?Q?eHZoJ97kbvQjKynyaHR1O+mkkHdFYQv43bWlYfxow6Fu8QcTE3MO8pcUM5Fl?=
 =?us-ascii?Q?UTzWSkJkFe8N+5NC9dO5/RHc77kSNUzwqq7wuB/sEhnIXKStVuX2cYNBOo0Z?=
 =?us-ascii?Q?G8PfjT/GdwfdFMznI/V0xb/ijVao2uQ7Zj2fMy7oTxxrG88z5VYqM9rIYlG+?=
 =?us-ascii?Q?idk22vSsux9izOtdIp9axwgxps8g4FpgNQ+NdMMmEoPurZJJPjRQitwOoPC5?=
 =?us-ascii?Q?kW7EVjcM8iAzG2WZ7G5cecMg/szUQuc5jnajb9FbvxEgR7/DFfD9Xw5X8qSu?=
 =?us-ascii?Q?Csm6bXpIpSTGoJfDx3ZivNV7+3wg4/KU4x0wRUsmzzdUes8aUd8znvxjCUrx?=
 =?us-ascii?Q?h+E1+ybJ0KOtZAy34qVk+J/f1eUe9Hy8bDaREMU1ibixih/7wko0DFXqzOyR?=
 =?us-ascii?Q?7TUuglT9TAZ/SRJntpTj2dcuUx+QqJFTAJQtZw8X0VjTUYUtbYigzZsBZKpS?=
 =?us-ascii?Q?JS3VJARVW/3JkQjyj6R7dvoXPRaq8XhiRf/NE8EVU5zw1Fb4+NS3Dy+GaSFl?=
 =?us-ascii?Q?D3Ext5uVbfsXkYzP3sgU0U7dVBVzftyWeJK713rMGFBvgDjBh65L+IxibTIK?=
 =?us-ascii?Q?vfAmG1lS1aOxV+61gP8yEmo/sYCBWDX/dJXvepnDUAuwflx+c6sG27j+R0kC?=
 =?us-ascii?Q?neN7Q/zP/u+IMbpTn/WSQfAAUYAGpSF+RB7uNKD/o0/0iCCqM1s+oZmIS+7r?=
 =?us-ascii?Q?1HboVjvabIC8661lqF9YlGGytBD9/VUSj6cJdZsO2Qfd7wtT3M3WfIVl06r9?=
 =?us-ascii?Q?7O3keVnMDyldLp4KMNmqDh5ZLpZyhklXuYQ3AKj4cVEKQLWT6qIWYo6XA760?=
 =?us-ascii?Q?NMVRM4P9IWPOCsNw/XBkS2sUCU2Wwnu3RTDsUVxUAmnK13CE8HKHzap01ZK0?=
 =?us-ascii?Q?LHEXtaLkxzH10QoDBJ6kVrKJ4ZgMwt/AiSYiFt9IS4nc6MHFgXKkiFb7ObEa?=
 =?us-ascii?Q?TrvhOdnl8GYCQ2qIv+fnXjRZETaweTVV5OnuzcNiGYpVPkwRomeoaACbGxdG?=
 =?us-ascii?Q?v0bdOzjwKJhPkh3zwLzXnfZE0CIXdeRODqAQtSBLGym5eJ8omGKp9TRady6I?=
 =?us-ascii?Q?X7IXVEzi7eBx02U6tfUp3akk19iKvXPcFuBBoY3vJKtRlPSt6kO2eiYdFn//?=
 =?us-ascii?Q?5aXc358gYktXoGKAZS6mFQFNuzSBpVhpDDKNq6a17oeDv+zsFJ27ggJiODrR?=
 =?us-ascii?Q?6UGW4IW4Jo7hJ4mEFuKQtyvu//A/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yzappZCtEi3jqYLgfwuJCJ2Bzs+ba5EcuxB57ehmq8Ob1ID4heIPYNgBxE/c?=
 =?us-ascii?Q?ByUDyK5/FcbZVMDBR632qFdHK4gKl8aAvvjItoIvYKNutXT7g6teVR82rJ+3?=
 =?us-ascii?Q?JhlmMnN/NrpVoHkhbjccgjn2p03FCAcuNdvTGmM9fxplNmd7Ok08+mPOOG1e?=
 =?us-ascii?Q?6PVP+fF+CSu0ZYm+WspGdzXGdBc6iLUt2R4Qt2PwfsXKF+SeB+qbQetVxAx/?=
 =?us-ascii?Q?ygBvtwCcwEEyAnoKv/BqmvuTpmLm6GuM4Tn8MxOFJA9OQi6ZaMP0XZgijTpD?=
 =?us-ascii?Q?vfRJeG9SKuYm+SiQwg/77V7dKlfoL+xiNfPP/23sMrFC0fFK83wu4av5BzKX?=
 =?us-ascii?Q?vZYd/H3XSAbIkbY2nDJF+HXsc5DpxCBELg1orBjLuiXvM/Yda3C3Hc11KbXF?=
 =?us-ascii?Q?AZYNXgGQM9QzcmSwBCfnD+BxfqrnRu+yknDxkvdv2efaskfbnE7mRixXJvF+?=
 =?us-ascii?Q?QVMyX06814/kRawg5+rNnYT5H5zBO76/BegOO6rKevAy3wd0umEvbv8EcKWh?=
 =?us-ascii?Q?aHnKKyrg1CxNp931Aers0p/q8Bh9t1FTTmhtwk/OX6hoAi42TnYn42MzepI8?=
 =?us-ascii?Q?rhFN3YcnbsAksUhdlTpgHDLaJXuVq9RwSPjp/rdVBInXwoLFMTmNPMB2GHBz?=
 =?us-ascii?Q?bJE9CBDkw2ICEdNRjUDNb43oz7H6lM6S7Qk8Sh4Rv0+MZwFQi62KkYT0Tf06?=
 =?us-ascii?Q?l4I6i6IHH1kEv0LAC2Y/FvjjbnP1e9RpsjkfC4bqg5YxOE/DzM5ThzUVsf09?=
 =?us-ascii?Q?ywzqxPmOCzN6xVYC0Wy+GpI+Snt7NAWFD152KIw3NFXykp+ZNkrcFnnrDTwK?=
 =?us-ascii?Q?Vz1KLReTSb1YcFT9okQSjwKv5ebPLUpducmXzkFA8kaEnhs/R88o+NA1EDJP?=
 =?us-ascii?Q?LErbYIlHwBzEsWOGdXz+exYUiGhAQgNnJIi5qoZliqF9uYit/MGnNuAIHUHa?=
 =?us-ascii?Q?omklVuGWHkQ2/yB9JCXP6Pfr7Qi/pQz+AZiw6k17bybywDmxja6aFJ58YsP0?=
 =?us-ascii?Q?pl1/96bgTMW2jng11JYv5stuYqK5vFVR+ao0+GMmr7tGs1XLZweC4DtjPXNu?=
 =?us-ascii?Q?Pc92XEX/IkBzfF+2ByOAoYbOLzrP3sSheC8o98Wcqg8wdc8TzdwWy+p+shYD?=
 =?us-ascii?Q?UiE+VQpEDnl+ITd3ij6wyKzgZFv6EEdFkJYvL6ZSYo+1wdkbiBZaJ7VXRtnp?=
 =?us-ascii?Q?UXNcCt4bjcQcskG76VMhkE60lYMDAEuioosiAUrHbWA34T8oK4sAjq42rUWD?=
 =?us-ascii?Q?dr+TRS5nLVMQ9blgmwzYFAYiGRZf0q17I2tEa7YTKlOm0lSioecjjiMKR1HR?=
 =?us-ascii?Q?4IxKY5+moySFKIJcND99wGTukSW5/5B/4TVqH4VLZultNyinhTooNvRq0NrU?=
 =?us-ascii?Q?9+b/zdBOJOu+m1b/88/nNaOHsR1MaS9/u4PpvNE7uG6+UVHWuK/kgEb4p2Q1?=
 =?us-ascii?Q?6ztmQZN08izlS4HLJUtGpUt7IlIl8KOlkAtreEU3i0Ku7Gd4/d3Icx4Xatdd?=
 =?us-ascii?Q?/2UKIauGUamX2QY7MY4KSTEqwaIQwN+y55XD1b2jmwgsJNV8CBa4afy6W/J8?=
 =?us-ascii?Q?gk6cnp5D3paXLeaJ3ULe56sMu/hQgK9iAlZ6rBvD6EJfhaqn+8IIEzSKeEpL?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1a7c35-2e42-4b14-3755-08dd2101c588
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 14:22:45.1376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9XMm57ypYrnSyRhz2peQEYH9zbuc3cMsZj7o/jwC6H2qu+dvqDR7g1M02LYkl9W9gDtMHYOwLaBs6hLtn2i5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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

On Thu, Dec 19, 2024 at 01:03:48PM +0100, Maxime Ripard wrote:
> Hi Lucas, Thomas, Rodrigo,
> 
> We forgot to Cc you on this series, sorry. Could you have a look at it,
> and especially the following patch?

I'm sorry for the delay here.
I was following the thread on the side.
I'm glad to see that we are finally going to get some cgroups support!


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Fell free to push this through any tree...

> 
> 
> 
> On Wed, Dec 04, 2024 at 02:44:04PM +0100, Maarten Lankhorst wrote:
> > Add vram based cgroup eviction to Xe.
> > Most hardware with VRAM uses TTM for its management, and can be
> > similarly trivially enabled.
> > 
> > Co-developed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index c95728c45ea48..f4a16e5fa7700 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -5,6 +5,7 @@
> >   */
> >  
> >  #include <drm/drm_managed.h>
> > +#include <drm/drm_drv.h>
> >  
> >  #include <drm/ttm/ttm_placement.h>
> >  #include <drm/ttm/ttm_range_manager.h>
> > @@ -311,6 +312,13 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> >  	struct ttm_resource_manager *man = &mgr->manager;
> >  	int err;
> >  
> > +	if (mem_type != XE_PL_STOLEN) {
> > +		const char *name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
> > +		man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
> > +		if (IS_ERR(man->cg))
> > +			return PTR_ERR(man->cg);
> > +	}
> > +
> >  	man->func = &xe_ttm_vram_mgr_func;
> >  	mgr->mem_type = mem_type;
> >  	mutex_init(&mgr->lock);
> > -- 
> > 2.43.0
> > 


