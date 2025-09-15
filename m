Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36811B57FC6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 17:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC9E10E2EA;
	Mon, 15 Sep 2025 15:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbqtxhZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3843910E2EA;
 Mon, 15 Sep 2025 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757948469; x=1789484469;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gd7x2kDSG8acHkDz6r3Awd7k5zdyCecaCHqhlW3m0fo=;
 b=FbqtxhZUsl1EdMvXnJfUnrFEMbWrodvPbG9DENr2qQTkrsJVpbB2tKfA
 y8ihvdmIRGnIn8DahBkwG4TUxgqoC1ytc2FNgV0AI+gBsuJLRW67sWK6l
 K8S2Yh6HmZzxLv8pmRndqi3CbZv8pkSL55PYweMb4wro9csU+A4G7iFZU
 OyCzPZdW1z3bDivV9NgW/71KjB6pI0fw6dmfjzi4UfK3SlXBrI7AyApFN
 a/0Q0Y6K+h/0WSoay+yHxBHUDnzucP2Ssm4PR5cCqHpTGpvH4vuFaavYk
 hsKpBtabVK08WeMo2QovTxxHcTvg4BIOl3pMCnuLBa/6SKHZBbVg3O0tP g==;
X-CSE-ConnectionGUID: TESfE7iGSyCfwplPWDav6A==
X-CSE-MsgGUID: 4Wkt9tlzQ8KWM+uAin5buA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="77655258"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="77655258"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 08:01:08 -0700
X-CSE-ConnectionGUID: JjMOb6upSgyH3c0cU//f+Q==
X-CSE-MsgGUID: qk4mjN5/RJ2/Kjfo3Ev+sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="205439467"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 08:01:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:01:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 08:01:07 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:01:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5rap0+eemT+7K6A8byekABGOEJzkux5FisQBiYIIWP1jwF8J6PVN35QUCd6zShXQ6BEn3rEgp3C+ms08KP7ua0p7DpahinJ967+Z3B6mRVjxFIMBpcAdOaLoq14GbJPKARIIampzNeM9wducDkAwRlS3P/6hbuUnjiRJbLtftKe/24lQTtIHh4EVwn4TQgcg99v+5gO3/500r7MGstNnc5aoStddsVxQ2DNW/qF89X+fzenpToQD8lz1YXYkbPLTihIimLUBBbTNxtbe9CORd/GQHeqD4yiIqW9qGFl/cG50xMpYHqRPzFZ+HPG/++oNYBQ5AnX7mIFpopCPYypJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gd7x2kDSG8acHkDz6r3Awd7k5zdyCecaCHqhlW3m0fo=;
 b=B8VBaoCj6zTzh4YEgbpHb/CvilnA1f9d+xsvO51FTWC1WaJpGV3KPPqKcDUj+2MHLmu2MmBXjbodTztXLdrcocgvgw68dWYU0z8rbWAO/JkTgtJuFZSdV+AXulPyVZKl9kkJeXRBuNBVOuAEY+eXzpdLxci7NARerTFwtmjAWCus4fB0aXX/x1R8DmVHSb1nfxfHQ9YXeLFaenik1IpvVdns82Ci99IL/I63Mdgx/bptvt0sE2G7LGK0cl+W8EJ3JFlE+n9AjfX+b+CrzNUZag7BINVaLfPPQFT26SdhZJkHyekbV9njy/+VzKo1aTWrLk9Wttc6NNDouZFx6TDVDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.19; Mon, 15 Sep 2025 15:01:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 15:01:03 +0000
Date: Mon, 15 Sep 2025 10:01:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Abaci
 Robot" <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next 2/2] drm/xe: Remove duplicated include in
 xe_tlb_inval.c
Message-ID: <76tbazroiyw7xxfoncae6s3kv5rzfvzwkk4vhmj6feb6uabg73@mo7tlafcvaeg>
References: <20250915080647.669569-1-yang.lee@linux.alibaba.com>
 <20250915080647.669569-2-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250915080647.669569-2-yang.lee@linux.alibaba.com>
X-ClientProxiedBy: SJ0PR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:334::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 7decf3b7-84a2-4ad2-583f-08ddf468b069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8GOSgTsJnSSr0Yaa/S+FJ2rkVsiHQga/s6rytiAFF2nqPSW2DUdNFW++eUIG?=
 =?us-ascii?Q?vVthPx1+TjzboksskopI9EC8YknGS04j14nNosFXnBKAikBwiiCjm9DUPlow?=
 =?us-ascii?Q?G4ePb1cJIiBsfAA8QSE4CzcmiN5hI++8gayPfK+RWc4RhGemVaMUwTPky3TV?=
 =?us-ascii?Q?1ne65cW3xH9v6XAxnY46+wvFSvVwJNcNtioigobHHVn2PCriTtX95nKAy1vr?=
 =?us-ascii?Q?CvqKXPkO89qnYPtjrq8fQAAck1Mi8WKtBi88vLmpIXxpSnAnrr6U2cUcaSHk?=
 =?us-ascii?Q?xKWf8AvH21tAY8Jr3Ctux/vezoop4ThWzoDnpXDsWDekOX6Spf/0WpaSzwWy?=
 =?us-ascii?Q?W05UjQP+69YtmGVo1czR9/nRQ4uvXGh5i0SfPVMKWLdO+P0gcJK8g6WGeGK+?=
 =?us-ascii?Q?4CM3yu/Dl1cOEfTOMxlUfjq/jM/5QFRwe5S8hxrjf7MRBodBUG6D/bPOyHQd?=
 =?us-ascii?Q?lxqu6HNtjlXxO19CC+nRrNuAzpn+uuSn1SJ2KtVD1fKKsBIFyfDLogdKkE3x?=
 =?us-ascii?Q?sIudZVPGvGZH0mNH9x+30KMtr5ZvrYpAghVVN6yl5UjZ9WAAVpNx2WpWNIB7?=
 =?us-ascii?Q?6jRhiICM+lRKNQKb8NNCPJ8dsEknZE54mPdQZnDu3T0dkdE3km7znf5+ytBD?=
 =?us-ascii?Q?ljxSwSVWVh7FrSl4yUiJyId4UqfeUjJPdWRnkuKxW24VjQW63C/TJmaBR7/y?=
 =?us-ascii?Q?MTtZY9u6rPrOe3Bov+F2CiqdeJXQTvBYT8FvBSCpKg+doN0dYSSGbTs21dtG?=
 =?us-ascii?Q?KoIhTsR+2mUFCmAEoEGESeYyVaB9JbL2NTrpCdgjJCgLi4PgUCjVNK9A5iX2?=
 =?us-ascii?Q?2LnkdcKoDURR3fyaEWEV2YH2diCGJBsIDc8yjvObaW+C5sYAPJGJyr5ben1y?=
 =?us-ascii?Q?Eqi/Pk+IGSFSUefUow/64zJtmwHQM3Icf2Eaz1PcZY3fRJd/+eDjgVSWHjml?=
 =?us-ascii?Q?Wbg+95Hi9UD5lCnYhltHkF0lB0HpnOZv0njoajVyA6kk9gBuHge2SYmvhr6R?=
 =?us-ascii?Q?Xv2tJssTe1di83FvvSweDolBRQ42GabrZyFSLu6pP2lfyJ7PqNzAk02/ZjMF?=
 =?us-ascii?Q?1SdRtqx+MsrTgLCwvb1KM4JRdCCfrZ2Lqfpuoufqz5FsaDjliKdgi/GcN3z/?=
 =?us-ascii?Q?m13VP/h+RY7CJ+vA3+lQJqa8KcTbsLcLv/akOAliYCWfIXPfgRykM3TpGFpa?=
 =?us-ascii?Q?dXY/bcQEw8Y6plZU0/S9Up48mpn9j3UEZu9sSnFLK7ULAnfR0SEObmP+yHPz?=
 =?us-ascii?Q?EA+KA7CDyia5cChq07Sb3sr77p3BxUcR3JnWRvIKfbEiwdb7p6/eJZTB4I35?=
 =?us-ascii?Q?VYDLHW6I/ko/jK9T4vQzlgliZ5zNqZ592onbVArGpyT5wtxMu3ZOt1DV6saP?=
 =?us-ascii?Q?kpseQ/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TQfQ7BpiNK3aUWwI8dCTkLa8em9PRkR7U46VVQsutVhRy6Qf486yGXcbF2LO?=
 =?us-ascii?Q?o9ks0zwFFRG5T7PT3i9hQYF55Ojsf01vcQ++eHU81lA/p2yf17xfebeSv5fq?=
 =?us-ascii?Q?m1u/uIf7lzE8kyubZBh4YM9el/O6kW3OeygE3jELK9X313xVHtuSKq2vRC1t?=
 =?us-ascii?Q?LSIruxedlU1t1HZnsKwrFnjuMTYr3p81hPXjnW6zbeyo6u9iHkANSgWSmWkU?=
 =?us-ascii?Q?7yn5ujZWHvFnGDUMKXDP6yBIRfgt60emT4XG420NjP82rkJagz+iUBBD0Dhd?=
 =?us-ascii?Q?GjtgFN2HyHelu2829Ij8mqvrXHKnmGqql8ieiMeEnou8xsIv3gJSgCMOABff?=
 =?us-ascii?Q?tZ9B0jCU8ulfsiwhXL2LaAamhNQ2EjVpYKKAMUAGSrkmUcYfeaX5VdwpLmeS?=
 =?us-ascii?Q?qCVvNTkyQv0T++9bsQlvta50PO1wUUzxutAHqMi9tCQebktuFJFuNY39ISsg?=
 =?us-ascii?Q?nvGkx+cYsqs3rJwcici4bNWncmdz7DfZbPmBgTSvRUDinNNvaOZhlokwcM3e?=
 =?us-ascii?Q?Rxtp3yDN12s/piUEJf0D5apVAZTjy9lsJhQ/+5cu7KPfyXfZXfdQ5htW79zq?=
 =?us-ascii?Q?J8JuiLdx+N5o70z/aoN84N+u4KvVwIVPcKpzHO7MXIyroycG5w55LlQ9OsEs?=
 =?us-ascii?Q?0EON+bEKb4MuYkRkubgGx5rcmD/a4uRHl9yl9flKGyrz88owtocoSke5qlag?=
 =?us-ascii?Q?+22VaHO/P82ulDJkhs/3a60vTkltUGMmBVWqDOAn2VkHO5rEWW1FzAqtPLW5?=
 =?us-ascii?Q?89s8Q8WD6dKsOFJjXRGJGvPIXVROzhaEJ5EAtSnDd8DNw/HDd6Km/TxSd2Ar?=
 =?us-ascii?Q?rLt84O1S2T5gCgg2ZSnEekv0WwXBgMRFXE9eDNjvxkZ2LIncio3pFg3ExWFi?=
 =?us-ascii?Q?EUNYB00SSEacFOQJSkNI0brva3MV/hyEzTWrycxK9C/FESKxI1SviJudhfwb?=
 =?us-ascii?Q?mfq7JJt/rOCJMmdCvAJT2ScZjUXnkwM0cJ1PQgMTFUOr+J6W0c7G+Ibwi5Xe?=
 =?us-ascii?Q?dja3HGxhbdEv844VGCpLWPoYpneTjm4GUGv9mGUymZqujvfPGSPIRb1Z8rIX?=
 =?us-ascii?Q?D9YTVrA0sGkRLBhKSFQx/JcKmtwExjOmWoIkBdfztFJo7Zef/vEBRy7dNFaA?=
 =?us-ascii?Q?lBkMBnQ+pkbZSVpWrNf6/x3tggfTm+BUOMqUZpye96jjMaZD4y/t9+b2LXRB?=
 =?us-ascii?Q?hLOdz+kuNi3E4mLyorfmNJDC+Q6TFdPtPXXwTcaKJifnujncSlyHVbzoyIuy?=
 =?us-ascii?Q?WS+4sxRMVG++9eankkwGjCQSwg/WlsdlWP9iyVgVwUjigGR2N7AxGQBeLh+k?=
 =?us-ascii?Q?eJfzopHYhtAq+62PMAnLVD3XqxMhSmQhHxEuk7gSKVavQll3U+0oYFOr3N0o?=
 =?us-ascii?Q?qfn9y4B/Cmach2x3WG9lWXp+p8KB+9aVkfFrhi42FhIwrYHNR2NuwZdGdPbE?=
 =?us-ascii?Q?YD3Cd+Kg40EzXSMR9z1WHMA8ZwQKfP0fKVHqY1aF5S+cYmSdTU43tg1WEtc2?=
 =?us-ascii?Q?pK5wQq4O768wOWSof8LvO6HH53gakm1HhFOW8fSDHVpwPKLvicNtT1LwV+1Z?=
 =?us-ascii?Q?Qp6GhbHoqLYhn6zYAo4v2a/eEngCzPoTrHaB6tY9qgmex5KlKH4J7vghHp/v?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7decf3b7-84a2-4ad2-583f-08ddf468b069
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 15:01:03.1184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjSPo3euAIei0IqQCe+8fyhHgyLvM0hfsX7wzNBS98ppTU0YyxvbbiBLaHCxqRSfHi5vKbuOg9VjJeiHkHs7XnIzLB/DHNTlXy5VrzQkF3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
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

On Mon, Sep 15, 2025 at 04:06:47PM +0800, Yang Li wrote:
>The header files xe_tlb_inval.h is included twice in xe_tlb_inval.c,
>so one inclusion of each can be removed.
>
>Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=24706
>Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

similar comment as in the previous one. Please use `LANG=C sort -u` and
submit as a single patch.

thanks
Lucas De Marchi
