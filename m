Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBCDAC0D65
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512BA10EE98;
	Thu, 22 May 2025 13:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KF9aQOui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C2910EE98;
 Thu, 22 May 2025 13:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747922266; x=1779458266;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DQC6JXhNTdQQFxk/UscT3RPiCbMKgkI2+Uiu1aHstMw=;
 b=KF9aQOuiIo4CGOeiB/K4GEjMmd2ZTs9/X/c2Pm7HYmBGUiwpaYYpjHiQ
 ALjgIPZzWciSeOuHvjNuaasBYh2QfLZuyCtaPLjRUYiCzFdgHrxiFVkme
 rKS7xcuFmz7VJ3P/vQepWQJtjFT3bEHJwexT83F7igWC7sIVT4hwlefOB
 Bza/XlV4lbd4kgdtLloIa3868WHI2RJua1BssWDBx+WlUrA66bLtcJ6Ua
 6NbpRoz9FCdUYiOBjJ9rjBE4JRuhTHsibDbYzOPK5ZrLnbjmx+XbUloY0
 0wHugPppE1IQIhYiQIkD8srS7nL5w/AYlpP69DiMZFzxW8bW0bAlBFJVh Q==;
X-CSE-ConnectionGUID: uMTituSnQSuV2DW0Mitg/g==
X-CSE-MsgGUID: qOY2UrdXShWh9T/ZCIHgwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61297278"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="61297278"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 06:57:44 -0700
X-CSE-ConnectionGUID: 2+NGSKHdTqq2sE/ZlM57pg==
X-CSE-MsgGUID: NNTnAGq8RoGeY92f62Q3hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="171604334"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 06:57:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 06:57:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 06:57:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 06:57:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUoYeC61Vbh4686Hj3RpF0OHcKeAhMk4scDUawA4EtNIiNT9Dsz4hI0CRJn6LLbS2elu7UTINzIVVOZgecpD5D4ZJhhk0rri5lxm151dBfVve2/2piiYP4utXmkLn255RO4grvy81aSqvkXyaRuPdHTX3F0tObU8uEcFnLwiXfLlMUxvAQXowaIaMJadKVvqY54nsHJY5WBLeSDnhw/y0sMChw6+blUUY6CY2fj3oCFeJtCeXoFOQPa/Hc/KVgh87e+089oUECvdy4EKmx7HIBJCo0AOZXUKXGtdIrNJE0yK/9BYesF/VAn/5uoRzI8u+DEWjAS8viHQ60UbZOpljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlCFOh8Hxf+6eUtep83DIxpZIuG8YgfJ88bzm+BpTno=;
 b=axbIyO8db/9DnCdCkLxlGkcVl8dZUtU029DMUMZRgWc6vvsxf80e7qSgHi4+DjnG4u+n/kuOPg3tTE4dCMTvXn4rLDZBNd7sWi7PF3faSsBhfc9s0ex8+bDkwBK2238T71rOr2jJmc35QMrGkoBuqEpqv0vNxehkCxX69UvIRtF87RL4nwb+gXxj3CuhBg1cue1gA1LWODD3zLoSEHBRi9zb4dAfXHVUl/WVr8J5tJNhWAcw6k7/Y8KG43GBbnDA9vU257/EBivECuAYXl27l+wocwjhXwVgAVz20cmo6v4uKV+9yvsEr/AL+ylkEaql47zP2v9wa/X2T6030R/66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 13:56:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8746.029; Thu, 22 May 2025
 13:56:57 +0000
Date: Thu, 22 May 2025 08:56:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <tzimmermann@suse.de>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/9] drm/xe: avoid accessing internals of iosys_map
Message-ID: <4trephgwx74ub7kjcf6djuq3hp63pp37vm3vuxlwe6cgd27dg5@mgf7legadygj>
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-5-airlied@gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250522065519.318013-5-airlied@gmail.com>
X-ClientProxiedBy: BY5PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: a799ba59-6d5a-40a5-aaa2-08dd9938840b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?igFHr4oEzV8OF+SPxFQ+RvqTHNB00P2GQ0pEmACTC2P9GTykVbU/Fv3Q/z31?=
 =?us-ascii?Q?qPHZA2ZaTFqGmTK4XR7bamOL2HhKkMsF3+l86p0CvuoimWI4NHRl7iE15BHl?=
 =?us-ascii?Q?hoG757EWRyRcqSn9s0CtCzRObFZrTa+rudsGRgHdJqvCcHd2Zx95CRa/98K/?=
 =?us-ascii?Q?Df7117MRiH7GTRHRDI6alu2IwG/W0ylXkPxZqh3BZp4aaJ4H1dwO2w7/kL1r?=
 =?us-ascii?Q?dBZ/JLSubV9o0y+Av06e45CTrtpHYK/gf4lBHVxijxJKlKUjDKrd+TcqBTr9?=
 =?us-ascii?Q?vGfQrgtamwDg5Imqqnt/7fKV3+QyFbhBiLk+ybmjmPHJrk81HxaUTKQwydxR?=
 =?us-ascii?Q?iEdNMTA2kzDxwTmAX215hirDr5bVROHHfRJAyoechi/fL6irFDb5j5x8aN2I?=
 =?us-ascii?Q?ltVQNRsOij1LqIOMeSL5Osu0LL1ml5qeccEpyqW4qfUgNL8pvVXFsvPwFNpo?=
 =?us-ascii?Q?jBkLBC7WkV9E/DjstifLKAGbGjKu/ZB/7OeIlr+K9f4++QkruO10gCty7upv?=
 =?us-ascii?Q?BLoi5DQLU7wQtPFHt/YubzUkrwEh0Z9M4Qh40zwkCe+B9SEzLkkH/UeVVgX8?=
 =?us-ascii?Q?qbAa9nsJbDcd6KwOFHQVNhd2Yd2GFAVTh8E3KIaNw25NNxd/PqD5fUYg3X5l?=
 =?us-ascii?Q?khXdLIT9wVj6FvCjHvyGmAQErv/UKMsz4jEQ0m8oEaslfHx8kRvQmb/ltVh+?=
 =?us-ascii?Q?Rki1DnRtBL+jxYYcXfFG00IqWpSB33rWrkRnbmNteZqIoZ6YGNDw3Cm2jpxM?=
 =?us-ascii?Q?IfZaWeWOsL6qV1EdsHAEqZShtCGJ8fVTbl4y091iJlhURsLtLUQ0IolA7fr9?=
 =?us-ascii?Q?oaGs7gESYi0nJvyQjZ/pZm589ELPubZ5Ee76fr6bJI6cZqAZxytEN2XLOFJ2?=
 =?us-ascii?Q?y89xffv+g3Z8CX6UG4qn0yjrXIhYjzqRr8EmFVpBn4bMrhkAnQ9IARUzTRcz?=
 =?us-ascii?Q?+Y5BbrD8bV7uOKlBE2c3kd1HCKfABk8sb6TJCdFQOekN8QkGZoyZAalxG8JH?=
 =?us-ascii?Q?5OVXhUue8Gf2VSk2DSceZOSOzcKkUlFL8YkLvN3iWYxzo6twYOU5SWzrMU6I?=
 =?us-ascii?Q?edjKo8C2b5GhAjSK2GhnOJBt79r3IlwRgQswst9Iz8AkN1n2sgmEuDWqiaKP?=
 =?us-ascii?Q?1AAfSuEHkEtNVkH/dz7uDk98nUaWzIxyPNXS4ZhM0l6XTQ4ZV72CjQALuXP2?=
 =?us-ascii?Q?ICjri4BQxyErg3sF5mCxDf4JWEpCov6hsDKH85pEc8XLC7RI1JwaRR5+HKx2?=
 =?us-ascii?Q?BQNNFsPOy3NU6/KCBsnqhcIDXhpo+cPiHLeHH9+pacHujcVMWDUoxTIqRK9n?=
 =?us-ascii?Q?4A+Mx66scDXBllnTVp2uHgJ8JdC89SICripoCOh81fsLa+kBTL9ya1zQTsu8?=
 =?us-ascii?Q?iMAMRWmoVvJplZQVJ7xJi3o3QAHee13fPub5m/lTYcLOwlEqxZQUrtcU9Z+V?=
 =?us-ascii?Q?gupkeHfatU0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q29vN2+XBssS5JeLGtR1KYfh2Ivq/0Y3jqPAafRX6wEwskj4MWS728qmfvtI?=
 =?us-ascii?Q?n94f7BrJiJPlu+SWBK6nl5JXlYUbJNjYTUena3u36MbJOCiOY0QQOovoqOgd?=
 =?us-ascii?Q?egcqeZim8PiDRZShppL/4cQXBZs5r+alwKum/QFIaQy7qWet2PGdByw7M6WY?=
 =?us-ascii?Q?QRldBPBQ4okIfAwyjZ6mTWU1rNduKZp4FhuTcLPiE8C0IrZZYR79xxU7kprv?=
 =?us-ascii?Q?xhfbGhXbpDASrFTH4oi77JsjJAGPGFJu1iDDq8RcdSMBpAGkqRhWSYJU2+Ss?=
 =?us-ascii?Q?N73j05kZBGMejSsU+3WZpjIp/7b9ogDy0Rq7982blqmG5y6iZT/mwTRshrwW?=
 =?us-ascii?Q?EgYya7VE8ZH3eiI+m5Hfz61pXTfTvMEoENUBaQnINAEmj3Dll/Y/V05zHJPP?=
 =?us-ascii?Q?fER78gRu6st40A0ssssOQ4l/dDtl0kuMVJ0hUsQm9n/dFoKuQHu0GBrbLJUN?=
 =?us-ascii?Q?cPF4o+DDN4dj5yaDrOPwRnCXtYajq+C1Ud7QE68grENPTWL8HjFXlwS4UJjo?=
 =?us-ascii?Q?G2GsHoXMad+4qFmppEsxrWvmvkCOz9PiY9Mhc/hiNpk5CRJZstxVwM7oNyDY?=
 =?us-ascii?Q?gc3Rdgy/7VWYW7zg2lhgniSNyu2D/NxuAcJxT6/uEB1ljNocqaVe2UOAmVew?=
 =?us-ascii?Q?/Em2NhjzKuWZ3cYVnMJww1CuJ4RPtyc6K7IPyU7oFi3lfC4M8w+o1iGbQhYh?=
 =?us-ascii?Q?AzG3tRsfdDJnMztjD4Wa+CsImta4yrethq25b2Fr2hFuqox7m0jF8yTJh+vj?=
 =?us-ascii?Q?MPWv5y7cTmGZXoa4dCrXCQXZN+hnRRWHEwErJKOUuL4H2NjcXEd3v0WAb5AA?=
 =?us-ascii?Q?wAEKJKqwkzg7CiyKAmDj2kTBKrBnU6VJgB0didMfO1FA7DNEbkTDPh0AzVcN?=
 =?us-ascii?Q?eWEsXIN+i1/plVWnWJTYngqXNgg/XYay2pUwkav56xnZFwF5jutQTrs/Kkwp?=
 =?us-ascii?Q?ZTtOInGFQqzNo27XTrtQBPUlhz7Nd5hH1dxbZY477cZj4LO/Rqf/Au8iY99I?=
 =?us-ascii?Q?CPWpbZvBCjNKj8YbCgYRrOcLRl7wW0Q9oU7LFNNEHI+rJy3iAIvaVWrypqXt?=
 =?us-ascii?Q?c6q93B6M8l6grJfKMxV7jhIXuitAxqWtb7a5U6TE31VTK9hGR2Tm1NcSNNzw?=
 =?us-ascii?Q?rQYWBTh4DFMtj56L5lqxmpjo88+owYC2D2IvlG841htO9+ANnr7fXzlJNB9F?=
 =?us-ascii?Q?DZAzBtVEYlDza2aq9K7mUb9W99reESOJTWYnbRIPXdqjSjLVMMkRfP0496nV?=
 =?us-ascii?Q?CouxnCs/k7V4PqnM3FFErDwXr7kk1BKglwW/8UbdU/h3bX2TiDYninNlZ5Ho?=
 =?us-ascii?Q?JmDIAfwyYKe4Y2bYsqZJp4iM1CsDQyT65ReF9Ym6oiub5zUgtwHPCwFBg7C5?=
 =?us-ascii?Q?BPWNSp6UYlpCiD3SfuvZco2SD9Qoqqy11HahLs0ChXVOYuNlqoa/P3nHXQaG?=
 =?us-ascii?Q?YTOmLj9PpeaPebghPupf/94jAAWx/Khtu7qFo1KJFQqWyDkuo+Z/OQeoV9Gx?=
 =?us-ascii?Q?c6S7FW7JADoLAHrNMljB/n6hxJlF2/9V+dLBTbPPmcJM8OptPJDHZjPfgziJ?=
 =?us-ascii?Q?HG1b0QkI/O1suTNin2xfxUTscfBqlx1L06wFOrXPf9Sgxxrs6dk66G+QH+NC?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a799ba59-6d5a-40a5-aaa2-08dd9938840b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:56:57.1535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttarCONlU9fULJn2sdGHOhVn4yzBCzLJVpIEYY1nKhGZHbihx3fq/5TX+WEcUSAdYp5nQUAiowzpClLOdjV1VSS8P9WtjSzGugiej9JcvIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557
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

On Thu, May 22, 2025 at 04:52:13PM +1000, Dave Airlie wrote:
>From: Dave Airlie <airlied@redhat.com>
>
>This uses the new accessors to avoid touch iosys_map internals.
>
>Signed-off-by: Dave Airlie <airlied@redhat.com>
>---
> drivers/gpu/drm/xe/display/intel_fbdev_fb.c |  2 +-
> drivers/gpu/drm/xe/xe_bo.c                  |  8 ++++----
> drivers/gpu/drm/xe/xe_eu_stall.c            |  2 +-
> drivers/gpu/drm/xe/xe_guc_pc.c              |  2 +-
> drivers/gpu/drm/xe/xe_map.h                 | 12 ++++++------
> drivers/gpu/drm/xe/xe_memirq.c              | 16 ++++++++--------
> drivers/gpu/drm/xe/xe_oa.c                  |  4 ++--
> drivers/gpu/drm/xe/xe_pt.c                  |  4 ++--
> drivers/gpu/drm/xe/xe_sa.c                  |  8 ++++----
> 9 files changed, 29 insertions(+), 29 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>index e8191562d122..ad2681c90efb 100644
>--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>@@ -101,7 +101,7 @@ int intel_fbdev_fb_fill_info(struct intel_display *display, struct fb_info *info
> 	}
> 	XE_WARN_ON(iosys_map_is_null(&obj->vmap));
>
>-	info->screen_base = obj->vmap.vaddr_iomem;
>+	info->screen_base = iosys_map_ioptr(&obj->vmap);
> 	info->screen_size = obj->ttm.base.size;
>
> 	return 0;
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index d99d91fe8aa9..c83a54708495 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -1249,7 +1249,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> 			unmap = true;
> 		}
>
>-		xe_map_memcpy_from(xe, backup->vmap.vaddr, &bo->vmap, 0,
>+		xe_map_memcpy_from(xe, iosys_map_ptr(&backup->vmap), &bo->vmap, 0,
> 				   bo->size);
> 	}
>
>@@ -1342,7 +1342,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> 			unmap = true;
> 		}
>
>-		xe_map_memcpy_to(xe, &bo->vmap, 0, backup->vmap.vaddr,
>+		xe_map_memcpy_to(xe, &bo->vmap, 0, iosys_map_ptr(&backup->vmap),
> 				 bo->size);
> 	}
>
>@@ -2226,9 +2226,9 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
> 				      XE_BO_FLAG_PINNED_NORESTORE);
>
> 	xe_assert(xe, IS_DGFX(xe));
>-	xe_assert(xe, !(*src)->vmap.is_iomem);
>+	xe_assert(xe, !iosys_map_is_iomem(&(*src)->vmap));
>
>-	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr,
>+	bo = xe_managed_bo_create_from_data(xe, tile, iosys_map_ptr(&(*src)->vmap),
> 					    (*src)->size, dst_flags);
> 	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
>index 96732613b4b7..d8f900efac95 100644
>--- a/drivers/gpu/drm/xe/xe_eu_stall.c
>+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
>@@ -741,7 +741,7 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> 	for_each_dss_steering(xecore, gt, group, instance) {
> 		xecore_buf = &stream->xecore_buf[xecore];
> 		vaddr_offset = xecore * stream->per_xecore_buf_size;
>-		xecore_buf->vaddr = stream->bo->vmap.vaddr + vaddr_offset;
>+		xecore_buf->vaddr = iosys_map_ptr(&stream->bo->vmap) + vaddr_offset;
> 	}
> 	return 0;
> }
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index 18c623992035..c7ad56774c99 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -1068,7 +1068,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> 		goto out;
> 	}
>
>-	memset(pc->bo->vmap.vaddr, 0, size);
>+	memset(iosys_map_ptr(&pc->bo->vmap), 0, size);

this is wrong, we need to move it to iosys_map_memset().


> 	slpc_shared_data_write(pc, header.size, size);
>
> 	earlier = ktime_get();
>diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
>index f62e0c8b67ab..37842c02c7f9 100644
>--- a/drivers/gpu/drm/xe/xe_map.h
>+++ b/drivers/gpu/drm/xe/xe_map.h
>@@ -49,10 +49,10 @@ static inline u32 xe_map_read32(struct xe_device *xe, struct iosys_map *map)
> {
> 	xe_device_assert_mem_access(xe);
>
>-	if (map->is_iomem)
>-		return readl(map->vaddr_iomem);
>+	if (iosys_map_is_iomem(map))
>+		return readl(iosys_map_ioptr(map));
> 	else
>-		return READ_ONCE(*(u32 *)map->vaddr);
>+		return READ_ONCE(*(u32 *)iosys_map_ptr(map));

we added this because of the mem_access. But I have no idea why exactly
this is hand rolling the read.

It seems we'd benefit from also having fixed-types (at least u32) in
iosys_map so drivers don't seem tempted to do this.

Lucas De Marchi

> }
>
> static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
>@@ -60,10 +60,10 @@ static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
> {
> 	xe_device_assert_mem_access(xe);
>
>-	if (map->is_iomem)
>-		writel(val, map->vaddr_iomem);
>+	if (iosys_map_is_iomem(map))
>+		writel(val, iosys_map_ioptr(map));
> 	else
>-		*(u32 *)map->vaddr = val;
>+		*(u32 *)iosys_map_ptr(map) = val;
> }
>
> #define xe_map_rd(xe__, map__, offset__, type__) ({			\
>diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
>index 49c45ec3e83c..458955c75e04 100644
>--- a/drivers/gpu/drm/xe/xe_memirq.c
>+++ b/drivers/gpu/drm/xe/xe_memirq.c
>@@ -198,9 +198,9 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
> 	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET(0));
> 	memirq->mask = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_ENABLE_OFFSET);
>
>-	memirq_assert(memirq, !memirq->source.is_iomem);
>-	memirq_assert(memirq, !memirq->status.is_iomem);
>-	memirq_assert(memirq, !memirq->mask.is_iomem);
>+	memirq_assert(memirq, !iosys_map_is_iomem(&memirq->source));
>+	memirq_assert(memirq, !iosys_map_is_iomem(&memirq->status));
>+	memirq_assert(memirq, !iosys_map_is_iomem(&memirq->mask));
>
> 	memirq_debug(memirq, "page offsets: bo %#x bo_size %zu source %#x status %#x\n",
> 		     xe_bo_ggtt_addr(bo), bo_size, XE_MEMIRQ_SOURCE_OFFSET(0),
>@@ -418,7 +418,7 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
> 				   struct xe_hw_engine *hwe)
> {
>-	memirq_debug(memirq, "STATUS %s %*ph\n", hwe->name, 16, status->vaddr);
>+	memirq_debug(memirq, "STATUS %s %*ph\n", hwe->name, 16, iosys_map_ptr(status));
>
> 	if (memirq_received(memirq, status, ilog2(GT_RENDER_USER_INTERRUPT), hwe->name))
> 		xe_hw_engine_handle_irq(hwe, GT_RENDER_USER_INTERRUPT);
>@@ -429,7 +429,7 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
> {
> 	const char *name = guc_name(guc);
>
>-	memirq_debug(memirq, "STATUS %s %*ph\n", name, 16, status->vaddr);
>+	memirq_debug(memirq, "STATUS %s %*ph\n", name, 16, iosys_map_ptr(status));
>
> 	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
> 		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>@@ -479,9 +479,9 @@ void xe_memirq_handler(struct xe_memirq *memirq)
> 	if (!memirq->bo)
> 		return;
>
>-	memirq_assert(memirq, !memirq->source.is_iomem);
>-	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr);
>-	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr + 32);
>+	memirq_assert(memirq, !iosys_map_is_iomem(&memirq->source));
>+	memirq_debug(memirq, "SOURCE %*ph\n", 32, iosys_map_ptr(&memirq->source));
>+	memirq_debug(memirq, "SOURCE %*ph\n", 32, iosys_map_ptr(&memirq->source) + 32);
>
> 	for_each_gt(gt, xe, gtid) {
> 		if (gt->tile != tile)
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index fb842fa0552e..99424d790d84 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -880,8 +880,8 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
>
> 	stream->oa_buffer.bo = bo;
> 	/* mmap implementation requires OA buffer to be in system memory */
>-	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
>-	stream->oa_buffer.vaddr = bo->vmap.vaddr;
>+	xe_assert(stream->oa->xe, iosys_map_is_iomem(&bo->vmap) == 0);
>+	stream->oa_buffer.vaddr = iosys_map_ptr(&bo->vmap);
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index b42cf5d1b20c..af0992aea6b4 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -1723,12 +1723,12 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
> 	u64 empty = __xe_pt_empty_pte(tile, vm, update->pt->level);
> 	int i;
>
>-	if (map && map->is_iomem)
>+	if (map && iosys_map_is_iomem(map))
> 		for (i = 0; i < num_qwords; ++i)
> 			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
> 				  sizeof(u64), u64, empty);
> 	else if (map)
>-		memset64(map->vaddr + qword_ofs * sizeof(u64), empty,
>+		memset64(iosys_map_ptr(map) + qword_ofs * sizeof(u64), empty,
> 			 num_qwords);
> 	else
> 		memset64(ptr, empty, num_qwords);
>diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
>index 1d43e183ca21..4ac335c68242 100644
>--- a/drivers/gpu/drm/xe/xe_sa.c
>+++ b/drivers/gpu/drm/xe/xe_sa.c
>@@ -68,15 +68,15 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
> 		return ERR_CAST(bo);
> 	}
> 	sa_manager->bo = bo;
>-	sa_manager->is_iomem = bo->vmap.is_iomem;
>+	sa_manager->is_iomem = iosys_map_is_iomem(&bo->vmap);
> 	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
>
>-	if (bo->vmap.is_iomem) {
>+	if (iosys_map_is_iomem(&bo->vmap)) {
> 		sa_manager->cpu_ptr = kvzalloc(managed_size, GFP_KERNEL);
> 		if (!sa_manager->cpu_ptr)
> 			return ERR_PTR(-ENOMEM);
> 	} else {
>-		sa_manager->cpu_ptr = bo->vmap.vaddr;
>+		sa_manager->cpu_ptr = iosys_map_ptr(&bo->vmap);
> 		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
> 	}
>
>@@ -116,7 +116,7 @@ void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
> 	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
> 	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
>
>-	if (!sa_manager->bo->vmap.is_iomem)
>+	if (!iosys_map_is_iomem(&sa_manager->bo->vmap))
> 		return;
>
> 	xe_map_memcpy_to(xe, &sa_manager->bo->vmap, drm_suballoc_soffset(sa_bo),
>-- 
>2.49.0
>
