Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB61C16943
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9CB10E12A;
	Tue, 28 Oct 2025 19:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RxVWAmtQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF7C10E12A;
 Tue, 28 Oct 2025 19:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761678906; x=1793214906;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=deCj+MNRSLPuoB0Cssk66fHA29tJRAg+ozJLO7KLMkQ=;
 b=RxVWAmtQxC6rCqPxrBLoL0VWA8WREacdtw/whabk5da56QnTCZSYaMoq
 iagLi8oZvX5iMPZmb8uOIfDUTHNsYIs6QI7x2Ey2bqISIr2dK7cyb/o0e
 yGxm0UYILGldFebFDklOXScHHuTCC8AFTCDoz1o4+wkNheXkcJmY5diS2
 LsJpgx04G1xFnfyea5lbaeY60jaDXBBPuCxTTnzEpuI+1WDIIBQJwXLJT
 2OfstLMJTXVH8D/YAiAwHcYTR/xcFBlI6zwnswO0zsEaIi5SWC1dQTu+R
 3HY0h3JI5UIwHAg0Ags31bl47Cnri2f1NTpRICjXBToKH/9qEqCVBeO+D g==;
X-CSE-ConnectionGUID: 3ttA/ZsnQLWBfeNDfi+tHg==
X-CSE-MsgGUID: lrrTjp9qQ86j95E9saGHyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74466687"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74466687"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:15:06 -0700
X-CSE-ConnectionGUID: X12zy5vcSnW/aNxy+lxLmQ==
X-CSE-MsgGUID: XjhNSpTnRJWnB1eul8oA5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="209039267"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:15:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:15:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 12:15:05 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:15:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8HTcXTdFQrtKCZZGmR95Kru05kX3Hvx8bZCRYj9+IilmQHQkIRg/EV07dAZODDVrudTJZH3Aw2vBW7cV3TYCA745v81ST8Ad8yyHA0pAWqwVVttJ/FW8auTeFwLLq9x9/Cg9/uDsTOWzJZlTg8CXs5Md7YQFUglvEanhau3S9BfCUlDimYBGW8PXHHnxbrK9wHXUFjAdJm0Ami/aH7zXvCRi+wdMApTOWg7bxyZ6HhMz1G6hdchr2bCPXj7Dp0LECQhOCAKvLmH1BamZSIUUgSUeHWlUtaDI3un5yNoyuQXJjgW80yMmyY9QbcgL+WV//Z79nZZrMZ1z8IMyJRekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHA2UmbqKMHO5XnO3ERYXXKlc7BaD92Ki85MihnJwz4=;
 b=pSWN12y4tIyapqh8tk0fLLmDMj/r2xute3kfi1NtRNJbs/ZdUBIV9msb0CVkjHDnbhic1/nH1UwJvGqzXmhyrpNROPKE249dEfPCZfK+/dxm/6bskpyOmNUpAfHjGRJfsNWJtq+qIwLgtKMwRa+CXiU4j9qxG4GrLyfKQPu09qEe/63rQD77emp+1CngMFrweKPNWVXptKWP8CFibHX6n23PFSXAkBsgo6wqf5w+LHGeqSue5mVYFi1uLsi8eLXTH/0xrFbNcPAAdFdFf10Mn+v/AtlClZ3vQjZcQFPXHK6b4VFZcsacaylI4/SsCfMR6WCauLwmll54kafAPtMh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ2PR11MB7475.namprd11.prod.outlook.com (2603:10b6:a03:4c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 19:15:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 19:15:02 +0000
Date: Tue, 28 Oct 2025 15:14:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Lukas Wunner <lukas@wunner.de>, Dave Airlie
 <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, "Aravind
 Iddamsetty" <aravind.iddamsetty@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 0/2] Introduce DRM_RAS using generic netlink for RAS
Message-ID: <aQEWLXQGOMrBbLTZ@intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <c8caad3b-d7b9-4e0c-8d90-5b2bc576cabf@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c8caad3b-d7b9-4e0c-8d90-5b2bc576cabf@oss.qualcomm.com>
X-ClientProxiedBy: SJ0PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:a03:338::19) To SJ2PR11MB8424.namprd11.prod.outlook.com
 (2603:10b6:a03:53e::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ2PR11MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 56de0294-dbe6-4194-7caf-08de16564b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KnsGrWS3w36hd/MF4DUZqmAVKSxvRICM5GPHt2128fgzcPS22uxgkqJ6bZ1H?=
 =?us-ascii?Q?unN+AD0Snc7+25k+mG3BTpc2Ni9IFy8m4z4aSFsWaa/gvKI660RGA6B6nuMe?=
 =?us-ascii?Q?UKuwiAFDRMaMK6hbClXxd+aV8hzeZ9m0vQufkdy1hvRMkh+qXeJsyCbAwQy1?=
 =?us-ascii?Q?f5l+iwzAi9Ko3ImZh109wwJGmNj4/R5szOyEGuGeggPFgTkp2j78aCfXFXZm?=
 =?us-ascii?Q?w8fPoLJxJea8+XTX263VMVp12QEQJz+6BnuqUwWLADH1SUV9smyvERd8sWIR?=
 =?us-ascii?Q?EuWZqrQzZ8H9R/uD/w10wGJxd4xNGbf5eOKzMYffBKL+ActyH9Mf73Kl5kEc?=
 =?us-ascii?Q?Xcwd2xgpdIa750YYKc3OewrHPQG/ifmCvi+5JWfx8iDql88P/EFUCkSZc2h2?=
 =?us-ascii?Q?PSnSi51EMekAv4j5VMNhKCqOMm86HzbL+LYufXBBSXIn1T9Dq8dYndhxvUYU?=
 =?us-ascii?Q?gQQqD2i6F1yjT8KIoeLVKz2sjEbcFhrqup1am5muLWhkJ6ALhivrFFtxNniP?=
 =?us-ascii?Q?6pg74W/E5nNr8p9K37i+NnVlD01CPeblps2ZyJOvqr70vv93oxvUwHbD6fqD?=
 =?us-ascii?Q?uhYiWad5zvFFfAPNhEdqGCgPqONHM2s08wWiWwmmlxQH5pF/6gOnhqU9RAoA?=
 =?us-ascii?Q?EP85W80uL9ax5zone00qXnLaP1RUpHYvcL6x6zgpZ74EYRbOnurX+T6liScm?=
 =?us-ascii?Q?H3iDJ9RvQZetnE1z9NwgdeqP5g8Vqy7L7xwLR8tBzcrivaV0S3dlyv4qdvxH?=
 =?us-ascii?Q?GTNRuAQOkEJsGtFwRGbJigyDw8ppTR08eWxjH603yxFIMACDxosGcCgCBruM?=
 =?us-ascii?Q?PHpcGux2fDrq424IsnOwXGZUmqO+5+R67v7IUSt8oYomSJIFgswHtcMygXZ4?=
 =?us-ascii?Q?ajkd6vNBO21SNIpbfWZ+zm5feQzHlB2rI/dxV9PZVH5NlAQrRfNcyV1aPIT8?=
 =?us-ascii?Q?s+VV5DpzTtrtgFu8mRydvn1BdhVZ27R5745YgzbYv0PrTLmdFna9tI5S+Hix?=
 =?us-ascii?Q?/YlAa7KJ9J2U5okr1IW61eG4dtpgZ/KHJvmy2DPZxKpkwRUoVgm2/PYJOHKw?=
 =?us-ascii?Q?tXewGmWg3P9uW4EoJqBy3rozkLRG4Bxju2omwerX3b5LlYVjQxHc9vTwJQa6?=
 =?us-ascii?Q?mwQ0vHs1Bd74nKi4xKjyGbbbZOPTYNYXnTPbdnwy2OMAN8aL/gu4AF2eWRA9?=
 =?us-ascii?Q?JM3EICinjqWWDTu/570fAAODg1tcVh9d+XEZjxiRzp52dwrkHu76wRnMyL7A?=
 =?us-ascii?Q?nqL608MwPcmnMCEMkHMV478mOOB+kijIKNu4n3wBwbFoXeshBzM1hQjg1Lry?=
 =?us-ascii?Q?90QWKZ8egHdvI79fuktsclZlPb5oFZIBIjbPThG6XJrCEjbcIZ1Sia2nFprW?=
 =?us-ascii?Q?dT5P9BAzYVSL5fZIvZd+R7LofiK33deRTQ2gvoUGE4XEanu0HQitHa9diUtH?=
 =?us-ascii?Q?PGsElC9e1Wp9OnUXCH0qF4k4ao+6skef?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IOtNadgRcNmznovQyA+xgig1yPXogNxYYmd1wuhbb+wdUWAQ3SRRFtWUxVth?=
 =?us-ascii?Q?n1xTiTiw3XYwBP4dwunSJgJ+ntCzBj2F8b94SgUOe8d+5G40/4ZzK7NluVnB?=
 =?us-ascii?Q?Y4/MMtNjTsoxZ6fsjnuRKNHq0ZJiwTHJbnV8rb2H34Yuz2ny6sZWEWL6KsAv?=
 =?us-ascii?Q?NL//ICy2wSVRrBMLhkaSrRIhGFMLXJl9CPYfKZ5LAGJha2N6rAz90Y90kzoQ?=
 =?us-ascii?Q?fnDNctkGR8BV6vXSBvUWAreLs+JCrOu9tNrrIBcDtE9S2yujb3BYATL3j/Ru?=
 =?us-ascii?Q?t0Pnhh/FYHsceI/QcSmEFKRTIUhlX8E6/a6mSoqAbwCihmQ6EbX0lnoQkjQL?=
 =?us-ascii?Q?z0kHmVzHft34cNLmH2q8nNVVuuaRabnV0Ovk+qJCoU/fVvLhHG6ZsSRYQ9Xg?=
 =?us-ascii?Q?7zlZoxQNd/krNM2vxjQL4bFyEIe1oB1qi0qkocVgeWaWh5zfQj4kBmBhmOmS?=
 =?us-ascii?Q?hU/qvRlq0g69oh4EravPAHhs6IChZfa/6d0AzUTb/mIx9xN42XSAiBCiBLls?=
 =?us-ascii?Q?UUGYTaghlfsy2YPfS+tZ4qir/XEv59JaF2Tfqqb0zL0LLjeynelv8/uvoiDy?=
 =?us-ascii?Q?0WG0EB46nRA/IEfcw5iIY9Ao/YkWIWRbSa21VtNGFjhFfMp+zZehukd+Ub4d?=
 =?us-ascii?Q?Lt/pXt0Xjv3syN5/0YKqxpyhmpfBoh74e9lsUr4oJndnyezMVW5gaN+Vmgd8?=
 =?us-ascii?Q?BuIjj3c5miYxtyUNPJ9owBn6NMW319rGmuxSKHqxv1Nc6g91P15UYzqN7Ler?=
 =?us-ascii?Q?7600BrNVSboI8yVj+1iiEOi0VtQuAIv1iii5lrSCLa2tU59KaN9vM0MhiSTv?=
 =?us-ascii?Q?Q25aJIl+n8HEUhGsb2yVgLuVAqxU579faWG8woA+R3P6aTgfk4JSNyzaCYid?=
 =?us-ascii?Q?5vhiu9l/lB/SLKtcWSGVUapesruUyeADkvjAKvAO27ICl3d+gZ1Nw49rPPMo?=
 =?us-ascii?Q?Mx9OwxyurI9fcqEpOZDM9DCpIXTWfj4GnRqK51WGxCXFDNPP6naapc3AHmk5?=
 =?us-ascii?Q?CNzEbf8n+smWszqzPSa1MD/9yz4Ufiqp3IQx7mFd1IZJnYI1TEXGwSQ14HP1?=
 =?us-ascii?Q?lsrctweRSB3ePTpI5n4N1p/cOzKyKMWokxhMFgPBB65xSdzqelhslXs7RFUN?=
 =?us-ascii?Q?HgqktlDfIrhBV68IFmC4Wa2y1rtqYXah4WdYpDaEyQ2CwISTkYFojxUwm+RQ?=
 =?us-ascii?Q?3ECF5iQmxq9N1GopRXQaLOMnBmvvfLi0GI4sDZOWdALLVO/a7ZvLWEuEegc6?=
 =?us-ascii?Q?uZLW9Pla8Lz8fCXoYvgQJ5u1RXMMEnCNnBKEWQCxSh5CTMwJ2smMlBtMnCBz?=
 =?us-ascii?Q?uXQuZFfWrR87Jro1wCy+XAgdHdHg4FSs7R7JxHQp9K0vDOJwNy17jhiJjqZb?=
 =?us-ascii?Q?NmtHsSCiotd2Gnda800hwJW+ySySNidFOt+c4Ga4ZPcCZu4vFS+X20aSpbT1?=
 =?us-ascii?Q?SXOT3Ro1DG6AKLlPLJHQwo3/XW317NeoAv4+OZI2Gh+H3rM3OG/9HKJmaoF3?=
 =?us-ascii?Q?C8vJ98ftg7BgvG1BF4TDZcMAMAuCVRO+WB+QZ4J/jw+3YOudXtfcpuM8bgNH?=
 =?us-ascii?Q?qof2GxUoorRkWhQZGBQgaZack3uE/EJqFvlLG7WSE5H8iHkLOaEbq40kVYPg?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56de0294-dbe6-4194-7caf-08de16564b3a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 19:15:02.7847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZCCCCSHnEnxHbYHPQPZ0DYIsQFZRkWi/KjFjbC37Wyc0hwd2ONbmFdbrQ8bS/vMDGuphBEwX87QO2X3gvA2kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7475
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

On Thu, Oct 02, 2025 at 02:38:47PM -0600, Zack McKevitt wrote:
> I think this looks good, adding telemetry functionality as a node type and
> in the yaml spec looks straightforward (despite some potential naming
> awkwardness with the RAS module). Thanks for adding this.
> 
> Have you considered how this might work for containerized workloads?
> Specifically, I think it would be best if the underlying drm_ras nodes are
> only accessible for containerized workloads where the device has been
> explicitly passed in. Do you know if this is handled automatically with the
> existing netlink implementation? I imagine that this would be of interest to
> the broader community outside of Qualcomm as well.
> 
> > Also, it is worth to mention that we have a in-tree pyynl/cli.py tool that entirely
> > exercises this new API, hence I hope this can be the reference code for the uAPI
> > usage, while we continue with the plan of introducing IGT tests and tools for this
> > and adjusting the internal vendor tools to open with open source developments and
> > changing them to support these flows.
> 
> I think it would be nice to see some accompanying userspace code that makes
> use of this implementation to have as a reference if at all possible.

Yes, we are going to provide a true userspace IGT tool that exercise that directly
instead of only relying on the provided netlink  pyynl/cli.py.

Develop is in progress, but sorry for the delay here.

> 
> As a side note, I will be on vacation for a couple of weeks as of this
> weekend and my response time will be affected.
> 
> Thanks,
> 
> Zack
