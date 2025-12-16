Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E825ECC588B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 00:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AE810E307;
	Tue, 16 Dec 2025 23:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceGVLmG9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2D610E307;
 Tue, 16 Dec 2025 23:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765929345; x=1797465345;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=btKdn4n38wCNtagAseBiSVkE3mxG1I2TKy449Un3cNA=;
 b=ceGVLmG96siGvpIhRJVCvJy+dwvwAAAiEwukHq2PUSL9C4r60s3AMLn+
 +KbZVa0H85D5lxzrenXpjcuun0qkZ4dOqZfcS9WqT27OiWrXjrILq47O1
 NxbUNESiGWao4IiVyJ5p7WC4hYf12YW4dkorqo99sGIMI+lwlL3KMMuYj
 +0kIYKHSBVo4ACtaeX8TTZ2OeqLqb+D+RwDe3IJCB6/BHAYzUD3bDbTrM
 tGlbfglgGCPY/PbIcrg889rcWAP/NoiZfwu7VZID43GqjumLiJe/y74CH
 QWdfy033fef0qkZVcqAWjbgb0FHY6vEzx0N90dq4LiGH+qykzQQJGHagU g==;
X-CSE-ConnectionGUID: x5RvFWqPQMCVh8vVYtTeNA==
X-CSE-MsgGUID: FjfymxhcRJGyDX0Tahc4Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67819971"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67819971"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 15:55:44 -0800
X-CSE-ConnectionGUID: sSYkc30WQ9W6V30gQvbkZQ==
X-CSE-MsgGUID: PjdfvMtXRDW/mFU5z54vWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="198635765"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 15:55:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 15:55:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 15:55:43 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 15:55:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLsy/DiTCVv4DTtQPhEmh1uRJTwP+SEn2+JmXvemSrAuOg0eg+Hj1o00W23c4PHbF6TA1UoHoS3ofBMq0pRobf7tG4UwzGrBWniFSoDJs7ZRcZ4JjX86Lj6J5fPUmgLEiesA8NA2rYW8Sg/PQrncqn6nxtdMJIID415/j09LJwbMobVflSxw4nAungOr9ioy+OYCwQE54RDbDub2velOa5Fs+prZUKr34WRWT1JmCxuSPTNk0rwq/RCSdP675y62P9xA+tb9sBaKspaz8XbINyyFZizT9dOVBnlY6hq1P0Jk2SGuGASk+XUNkmVrqZg5Wy4cZzHaaWSxBKzHQxLeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCu/sBB0p4VToyoNC2j79yir52uqXI3k5VziQZaqlP0=;
 b=Ft5/zAk8e/T18Z07pL8Rjwx2ERIYZFRs1VvdomCoLHhVuStj0f9wc+Zl2rurPUqJnp8Biw/HQMayWhWlUO28RUf64bmLwUUD0lUs7yVz3hYX6lLRRTrqwp8EtcIVfpdqqpgGJnCPvvSAxECFcBq70cVrZrjOlvNSbUdr437YuW0F5TxKs/lV519xTvUpBP39vEyAqoW7HPlrWdIjgnSSyvjimU6B869ySkYm9E8ALg9lBdYJtwwHRm37RYn9TCM6qJHi+cJMvOFqHqtO5fXbT59dzkE73X9ecMdhPNfnTWrniqkEKxyvrF7plguVjIcwApYU+8GDEmBX8jb0lqLEUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 23:55:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 23:55:41 +0000
Date: Tue, 16 Dec 2025 15:55:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v4 19/22] drm/gpusvm: Introduce a function to scan the
 current migration state
Message-ID: <aUHxevBTPGKx/YKA@lstrano-desk.jf.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-20-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211165909.219710-20-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:303:b4::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: f0fb223f-3591-400a-b1a8-08de3cfe9e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZY/7kFD7l1Z5YKZg9TWEPDY/eN79n9hBX+OvYipDH2PrbMrg6pcG6PG9p5?=
 =?iso-8859-1?Q?ki+A7M/8Et2iIxkUGe4pN3WnqZ5dtT+oY4o+bbfffq+vDVVNlB0r/coVXa?=
 =?iso-8859-1?Q?KCIhvlW4zSHSyrbIRx4edFExTQLdHjshoYDCQfXkRpPCKzKQTPGAr4oE6A?=
 =?iso-8859-1?Q?ejwZH2mzkHPTDZB44m/jphAy2MuEFG/ELm+kSeTzoreMBLGlH3MxnNxWrn?=
 =?iso-8859-1?Q?cIvNTPn2qYsUWXntE9YGwN5GRozJKbZorjStBNU/grIFHp4XC5ok+nVjTM?=
 =?iso-8859-1?Q?fmN9KMbswVU4IOaeQxRdPwcoRWqVBBoivJB4/B/B/DwewT9S9TjVTqtzHa?=
 =?iso-8859-1?Q?QKQyI5x1AvZAy51RFDbm6TLv8pIdtYv3Og2GoXcm8qCVT7GDQM1GmMpRHK?=
 =?iso-8859-1?Q?HAyeCj4jAEyes5MM0ILpI8gtUQYHASXBFhEUH0xJpvVHpjiSMlN0sPi0dr?=
 =?iso-8859-1?Q?sP+drPxbmEVNE4/txwonj2NDpMivRkaQGp2DcO87ZjXg0u7ympLf3Re7uT?=
 =?iso-8859-1?Q?t9l489+SAz6eKqc4X+b0DwPfguYgtlRp0tSHWX9OpZWKsNqaq25QaJnnnV?=
 =?iso-8859-1?Q?MEXVJaB5oLPurxOZg7ttWqdQ1GW20B0JLVO3Ni7LM4/LCoOL0wtju4RZ3T?=
 =?iso-8859-1?Q?6f6ilh0WOcvjlqCXHQvpBD86jgGJdJQAnsbnl47x2kokYD9EYRV16huEHA?=
 =?iso-8859-1?Q?dic2SGlaSJxZe+5tHhtCCtlep7tidXDAIO2VMYwTyZNmuhLToHcTJhbXIJ?=
 =?iso-8859-1?Q?0KvFBxGw6zxtxwuh9tryCe2uHlFVepnG0/gfVgEMDutl2ohopYCFIMfLlv?=
 =?iso-8859-1?Q?fC14d8gqFwv0JKJFKijWXtVB0pfOotbu20DCUCD9j/l6O7mmIxFJBSUS7o?=
 =?iso-8859-1?Q?xCJ+9HDCq/1cLyh4F7gU183W8uH5zWCrZX9qP6SNcbS3HY98qIOOZH1QYd?=
 =?iso-8859-1?Q?5FLdbva3SYrJbU1Grwfxh1nW53OAc3f7ZvCPI4585jqhGng2tJ4/ID7KQP?=
 =?iso-8859-1?Q?5BxpFkgLyvgU9KkAcnaBnKrHxMGRrS0usvS03hwnSrh5UmHcxrcOoDakYb?=
 =?iso-8859-1?Q?2XC1EXsipFnZvBkzGgHaapCaeFGqIHh2mLVBgIVlANWPrPfrHNFfKrVyNA?=
 =?iso-8859-1?Q?CsL3s5aZZD82cq/8HqF2nSBHlVvzYyTGB8LNhj6S52DIC2Ilo3X8QR/WY8?=
 =?iso-8859-1?Q?4763xEEkUdQzsdR8NJ7WDunDJZU2cJh918x8a1vl+PuF+oypvA5LUt5etn?=
 =?iso-8859-1?Q?6MUgrX5ZD7wX31Wr4hFdvpGyqL7RIxKy4ikSLEjHCOX9jSimGn5R54d3a7?=
 =?iso-8859-1?Q?Ws2IHKaW4ZZ9sVI7ENDpjCVkKj3GrW0PYX9i3k+uGLO2rvveqwgUb1rUy8?=
 =?iso-8859-1?Q?900L4wUfVQu5kualY76EFTrKNjRtvqwZC/FKWwCcwCCb3DM7SylzuIAmja?=
 =?iso-8859-1?Q?l1rMXY6rePdm94uQQDodeuE6VlIi//dLuh8Tfj7l5fU3n+3GCidc+P6Pgm?=
 =?iso-8859-1?Q?rKYphQ+HOBnAwQiB45kRLC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6XDPML/psyNf6inOqIQX0qaQUgCxx6Gx87Ietw8UbXnM48KnI7Q/svnlJw?=
 =?iso-8859-1?Q?2VGsWCkb8umtdX9uM3Q/BiUbbjUGkXyxkOUfuHnXzHSGlix+Y3dzUcQEPb?=
 =?iso-8859-1?Q?PZBcNGN7C8vExs9DeOkfep0s0WzALnjhPji/5vkibBQLKMJXYJ7iQOtZJo?=
 =?iso-8859-1?Q?p19sffXAWIEgCnNvxv45dAY6EtdN/MfYXtnqivV5lO+qyNh5dNto7s21lv?=
 =?iso-8859-1?Q?MzWt+Kk0MAr4KEJOsnOlJsTY6Tgzlt7xA+h3/YvYy888UIQAO6+L2jTdw/?=
 =?iso-8859-1?Q?EpIz7LayFoTOFuUkUSQw5wQBls2OZEuIIeSX9jKIaFgtZEG/AEyUHFUYoW?=
 =?iso-8859-1?Q?STvTtVuu8fLkPzbxCIGUggg1ufXbjS7scQl9N455bLKM+bpsdL2mgGcFTA?=
 =?iso-8859-1?Q?SLstERRIJVqgtUuKnYPh11cZTXcXr5A0QkrFUUpX8xF1I1EZHOnn3Wnb23?=
 =?iso-8859-1?Q?0w9atx2CidShn/yLLAhFiuTU5VGDK0A2hTDgEpLf88ZZMvyHGE42tRQvNy?=
 =?iso-8859-1?Q?reqDBI1pcHfjkSs+h+LPo7PsRLZE6nGOAfKFhgF63Ynu9b5yNVwuXXl+GQ?=
 =?iso-8859-1?Q?om8oTIg6iQlCpa0C8NirPrL5eFqN5xZWWh345CL9gIxbMyCrqnvO65PL6x?=
 =?iso-8859-1?Q?boFulCk6JoEAjNwYv6gxvAuo1NB1t3l2QTwkBCa994/VWlaHKmzEi3C+Om?=
 =?iso-8859-1?Q?ftUsQJpC0PLuIoMT82gDtMvN2DKNBMxwe+jYtOJCWjjWEUK9yw5Uks3GiD?=
 =?iso-8859-1?Q?lEyLVH+3kB+0oc6BAwl2meh+rEN/btwe2hx3mQ3Qwxp3tZW+oG34ORhGq7?=
 =?iso-8859-1?Q?7b3EKP2C/3WSj7wgLgzO2WCdoDhtFKX7rvt2OZEKC1CtPf9v6M0chz/1Ox?=
 =?iso-8859-1?Q?PkrE2XDzZhGyN9O1mfBL1ErSTFwcCDrhpotRkyh06cCZ769dhyJT4Ea/H5?=
 =?iso-8859-1?Q?Q1pp1U8DATfeAg01ZrDmL8MqAznjVMjmDT77TsIQtK/m1UEFkRaDRdTvIp?=
 =?iso-8859-1?Q?LLWXdPLx6m+KwkK0Jy3SRCEKH86plh6KMceaqdnfDaEdV0lv9EfWae9fiI?=
 =?iso-8859-1?Q?0xXJ/YD5Tr4sXB2rLkOYTnZs4HrlRdah64jxFQ1lF5LwwmAj5d/ObHK/yS?=
 =?iso-8859-1?Q?FbExpy/EBFOi2ywJWwINNWZKiXFFnEQT+Jct8Vs4WZobw4qgCjCEWqJ8JO?=
 =?iso-8859-1?Q?9b3SHx1sxpSpiu+3qwd6nkdegusoNO0cRbtbvaaCMCHZfLBmfJ12hqMPCZ?=
 =?iso-8859-1?Q?uCL4DwH5JZaFGXaZYgOnoSW449bK6FdiSyViOeCLcGEe9oL2hZFi//gTVJ?=
 =?iso-8859-1?Q?2iwCrET6NhW9IdLqewgTy3rFR6I9qI8KiU3va1mnwQxPysaf1FrHTK7jZ9?=
 =?iso-8859-1?Q?Bmcb/3lzMaJzjkbTvjUoxsogaUdZhmRaiFf1BLVPxFj5ioYX5BuD2GsYWU?=
 =?iso-8859-1?Q?6cxq0sFn5K43wLcGkKcaf8+8rm0Y13gNlp1R2efzvNqE6De/sppxBM9MEl?=
 =?iso-8859-1?Q?I4Jp/sDmHIV1Iv5182lM7ps8oLl1FV+tHrfAZF3BT9dvWKDCq6rrM8HxZE?=
 =?iso-8859-1?Q?sY67Ze1/bg7PasmPG6qqlFMvlj/SN6v4WgFJfDp4yb0rSyuAhjGchtevSI?=
 =?iso-8859-1?Q?e/yfMmIaObI/3HrwFusyH9OTf2WyK47ScGvChT+J63aq5MA2gVhYHHpQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fb223f-3591-400a-b1a8-08de3cfe9e4c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 23:55:41.0025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYRayFWwI+Ligjm97FgdE/JCVabUAJ6CS/h64Vv5S/pso1BYtcWXb9YqdGDHVnTLzXxfp4VpEvvIPTkT3FU45w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
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

On Thu, Dec 11, 2025 at 05:59:06PM +0100, Thomas Hellström wrote:
> With multi-device we are much more likely to have multiple
> drm-gpusvm ranges pointing to the same struct mm range.
> 
> To avoid calling into drm_pagemap_populate_mm(), which is always
> very costly, introduce a much less costly drm_gpusvm function,
> drm_gpusvm_scan_mm() to scan the current migration state.
> The device fault-handler and prefetcher can use this function to
> determine whether migration is really necessary.
> 
> There are a couple of performance improvements that can be done
> for this function if it turns out to be too costly. Those are
> documented in the code.
> 
> v3:
> - New patch.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

We talked offline Himal, Thomas, and myself all agree this patch is good
as is. I looked through the logic and everything looks correct to me.

With that:
Reviewed-by; Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_gpusvm.c | 121 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_gpusvm.h     |  29 +++++++++
>  2 files changed, 150 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 4c7474a331bc..aa9a0b60e727 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -743,6 +743,127 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
>  	return err ? false : true;
>  }
>  
> +/**
> + * drm_gpusvm_scan_mm() - Check the migration state of a drm_gpusvm_range
> + * @range: Pointer to the struct drm_gpusvm_range to check.
> + * @dev_private_owner: The struct dev_private_owner to use to determine
> + * compatible device-private pages.
> + * @pagemap: The struct dev_pagemap pointer to use for pagemap-specific
> + * checks.
> + *
> + * Scan the CPU address space corresponding to @range and return the
> + * current migration state. Note that the result may be invalid as
> + * soon as the function returns. It's an advisory check.
> + *
> + * TODO: Bail early and call hmm_range_fault() for subranges.
> + *
> + * Return: See &enum drm_gpusvm_scan_result.
> + */
> +enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
> +					       void *dev_private_owner,
> +					       const struct dev_pagemap *pagemap)
> +{
> +	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
> +	unsigned long start = drm_gpusvm_range_start(range);
> +	unsigned long end = drm_gpusvm_range_end(range);
> +	struct hmm_range hmm_range = {
> +		.default_flags = 0,
> +		.notifier = notifier,
> +		.start = start,
> +		.end = end,
> +		.dev_private_owner = dev_private_owner,
> +	};
> +	unsigned long timeout =
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	enum drm_gpusvm_scan_result state = DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
> +	unsigned long *pfns;
> +	unsigned long npages = npages_in_range(start, end);
> +	const struct dev_pagemap *other = NULL;
> +	int err, i;
> +
> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (!pfns)
> +		return DRM_GPUSVM_SCAN_UNPOPULATED;
> +
> +	hmm_range.hmm_pfns = pfns;
> +
> +retry:
> +	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> +	mmap_read_lock(range->gpusvm->mm);
> +
> +	while (true) {
> +		err = hmm_range_fault(&hmm_range);
> +		if (err == -EBUSY) {
> +			if (time_after(jiffies, timeout))
> +				break;
> +
> +			hmm_range.notifier_seq =
> +				mmu_interval_read_begin(notifier);
> +			continue;
> +		}
> +		break;
> +	}
> +	mmap_read_unlock(range->gpusvm->mm);
> +	if (err)
> +		goto err_free;
> +
> +	drm_gpusvm_notifier_lock(range->gpusvm);
> +	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> +		drm_gpusvm_notifier_unlock(range->gpusvm);
> +		goto retry;
> +	}
> +
> +	for (i = 0; i < npages;) {
> +		struct page *page;
> +		const struct dev_pagemap *cur = NULL;
> +
> +		if (!(pfns[i] & HMM_PFN_VALID)) {
> +			state = DRM_GPUSVM_SCAN_UNPOPULATED;
> +			goto err_free;
> +		}
> +
> +		page = hmm_pfn_to_page(pfns[i]);
> +		if (is_device_private_page(page) ||
> +		    is_device_coherent_page(page))
> +			cur = page_pgmap(page);
> +
> +		if (cur == pagemap) {
> +			new_state = DRM_GPUSVM_SCAN_EQUAL;
> +		} else if (cur && (cur == other || !other)) {
> +			new_state = DRM_GPUSVM_SCAN_OTHER;
> +			other = cur;
> +		} else if (cur) {
> +			new_state = DRM_GPUSVM_SCAN_MIXED_DEVICE;
> +		} else {
> +			new_state = DRM_GPUSVM_SCAN_SYSTEM;
> +		}
> +
> +		/*
> +		 * TODO: Could use an array for state
> +		 * transitions, and caller might want it
> +		 * to bail early for some results.
> +		 */
> +		if (state == DRM_GPUSVM_SCAN_UNPOPULATED) {
> +			state = new_state;
> +		} else if (state != new_state) {
> +			if (new_state == DRM_GPUSVM_SCAN_SYSTEM ||
> +			    state == DRM_GPUSVM_SCAN_SYSTEM)
> +				state = DRM_GPUSVM_SCAN_MIXED;
> +			else if (state != DRM_GPUSVM_SCAN_MIXED)
> +				state = DRM_GPUSVM_SCAN_MIXED_DEVICE;
> +		}
> +
> +		i += 1ul << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
> +	}
> +
> +err_free:
> +	drm_gpusvm_notifier_unlock(range->gpusvm);
> +
> +	kvfree(pfns);
> +	return state;
> +}
> +EXPORT_SYMBOL(drm_gpusvm_scan_mm);
> +
>  /**
>   * drm_gpusvm_range_chunk_size() - Determine chunk size for GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 632e100e6efb..2578ac92a8d4 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -328,6 +328,35 @@ void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
>  			   struct drm_gpusvm_pages *svm_pages,
>  			   unsigned long npages);
>  
> +/**
> + * enum drm_gpusvm_scan_result - Scan result from the drm_gpusvm_scan_mm() function.
> + * @DRM_GPUSVM_SCAN_UNPOPULATED: At least one page was not present or inaccessible.
> + * @DRM_GPUSVM_SCAN_EQUAL: All pages belong to the struct dev_pagemap indicated as
> + * the @pagemap argument to the drm_gpusvm_scan_mm() function.
> + * @DRM_GPUSVM_SCAN_OTHER: All pages belong to exactly one dev_pagemap, which is
> + * *NOT* the @pagemap argument to the drm_gpusvm_scan_mm(). All pages belong to
> + * the same device private owner.
> + * @DRM_GPUSVM_SCAN_SYSTEM: All pages are present and system pages.
> + * @DRM_GPUSVM_SCAN_MIXED_DEVICE: All pages are device pages and belong to at least
> + * two different struct dev_pagemaps. All pages belong to the same device private
> + * owner.
> + * @DRM_GPUSVM_SCAN_MIXED: Pages are present and are a mix of system pages
> + * and device-private pages. All device-private pages belong to the same device
> + * private owner.
> + */
> +enum drm_gpusvm_scan_result {
> +	DRM_GPUSVM_SCAN_UNPOPULATED,
> +	DRM_GPUSVM_SCAN_EQUAL,
> +	DRM_GPUSVM_SCAN_OTHER,
> +	DRM_GPUSVM_SCAN_SYSTEM,
> +	DRM_GPUSVM_SCAN_MIXED_DEVICE,
> +	DRM_GPUSVM_SCAN_MIXED,
> +};
> +
> +enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
> +					       void *dev_private_owner,
> +					       const struct dev_pagemap *pagemap);
> +
>  #ifdef CONFIG_LOCKDEP
>  /**
>   * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
> -- 
> 2.51.1
> 
