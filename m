Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D4895BFF9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 22:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47C910E0E5;
	Thu, 22 Aug 2024 20:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jVSVbHqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889A510E0E5;
 Thu, 22 Aug 2024 20:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724360137; x=1755896137;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Ha23qJsTLZrMP7+dn/3dh14T2X9tWKl28DOH0QQsNl0=;
 b=jVSVbHqZI5f83tE9yadSqgGW6DfzoMKyB+icDEj8a4/JfsLNlj1zi1T9
 SPWWg+WAZSjrLsRyQe5x1nPrlxfdVP1o6xlTBjub1N4c+q7d6uxA+WPvQ
 6LvZYXuwvkIa78WlLRvTi6YM24kQUZnAFVsxt+22EumdXq8twjXUaP5rD
 Qnq+HQ4G0hfWOmwcW/amFQr3zrO7rn08mSAvr5AaHDQb1bofsNiePS6Ux
 aWSPV4bTakvbSS+kj0SwwVdVSNkOsfFS1GSDkfD5E+wqBZTVBPCxphfXT
 ZiaOJIQJfFY2bf+ANsO2skNyAEcBFJ2q39zHrJysys3XSbxeVVtRgKjRz w==;
X-CSE-ConnectionGUID: HAwoLEpLSPCIadW+2Bh4bg==
X-CSE-MsgGUID: QX+vTr87Tqq9v0lPWM8xsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="45324105"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; d="scan'208";a="45324105"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 13:55:37 -0700
X-CSE-ConnectionGUID: 9QcZXcgMRr2PRZuGn5lqCw==
X-CSE-MsgGUID: rlix0yFZRhemQ4KjaKrAkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; d="scan'208";a="62115534"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 13:55:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 13:55:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 13:55:36 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 13:55:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xk0sUik2pFR4kGISb6QzPRBiE90A6rOHLairio4pD5Z5tLevHMOg8knK7t1YKOY75lvwdooCKBkCxHL4sgwTWHotSOpIL+gFAFnEOK4YJX6tdmmVVOOGzuLfN2oNlSjX/IgZLkYSKgqyNlPKDzH1DXiODQeersgX2vfKYL07IDR5SJyQsU4hazFPIYGKVzisv+uslUH/vh5/3orkuF+2wo8b5xKLXqkPfcIbcsxCadG23t/NdJgKsDDE6JODrivY2i+9kRpQiqLx9iYRw7BuNhraDjxk57FnpAJnAij5/RNiv6d4vj+Pf6RNN5hGuDJZaerd4a/84lkMuuVkI6/56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5n65UjYmKSNRrzeEfB5lu1Ovtk/uuUcnY0TZg7kBHg=;
 b=T8RtER8vIUWRxjheSxN1uyykl2gAHyroih7SEbeNsj6YmpUAGq7KHEaM+xEykVmqBobz6LntmAgob7nB2YtxZA2FICRshaSemSNc8tEjhoj/pFVExQ7mzZVuOPoeukjtGzXGMMxPuHW1NYcAnp0bc5cyc/Z3100UJZyG7sXT01jxDbAqAG0Uk0Py5YrIPpv7prufEmVwqypud+Vvya2JTGwJYwlh9Jeh5aAdhOWFHD055EA8shW4rAFcoGF0KqSMppy6OQme/Ik+geOTMfv0Zn7i/xkadLXrG7zfDDKVSAUP8UvdSLLJ5oi0yt6vPE2EMn4EdGyxHjO6bwWKRrpL0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 20:55:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 20:55:28 +0000
Date: Thu, 22 Aug 2024 15:55:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <hecdxenxufrcps4ktypq64p3r6h5hp77c2sag2mkkvcmjploge@iyixts55vxus>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:303:b9::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: e9549039-cde1-4fa0-cb1a-08dcc2ecc099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sLecF5xl7sZMg7b+FC/QROrLyJhEY+CUcZMQl2HgODJMMJUmnG3oLfZfqyfS?=
 =?us-ascii?Q?aXJlS5cjobRJeKhErOXH0gcI6G/iHS6GYioVCXpKxMDIUuiQ5l8d1v/fAeLZ?=
 =?us-ascii?Q?R9KHvCgreKfVFwRJ/RiJ1mKqov7LUjuN+4NlVt5MMPF06e2rY2lqCkfuR5cq?=
 =?us-ascii?Q?wzjpBRSj5VEo4zGy96a/zlrUDbvh+amAdiJf51h0XnzWDhi1kyYyiPo2wr6Q?=
 =?us-ascii?Q?2FN91xHKYJQxyUOIvCWBZDcE9cG5R+81FYFbvo7mgaqJyr9fpJABFVWzo3Tl?=
 =?us-ascii?Q?kFq/VjJ/XOD3l5wfyDn0cIDeoKWGWvVbcWPDdkN+B8oLg4SC4/1c/AQOOfWz?=
 =?us-ascii?Q?/XK4bgd+YkSZUVGeHYQbOJwRxs+HRULugiAqr3lU/OdD5kF/U983/Kq8dSpc?=
 =?us-ascii?Q?weTZWzytN5wptY6YL7voXQept7dqfv5IjoFe5c3lzIVAGexljE/dOFeXkMmA?=
 =?us-ascii?Q?ycWQa7iGcSqMVAetPxKgKe9ut+y1IwS/ngRtUDKdx0Xe0Ws56D/1GeFDfkQC?=
 =?us-ascii?Q?IjMtt1o8Vo5TNszDza2jrg5cPAl+N8C8Cpi4rIAQ9WcSweJIYMMoDk/hVvk0?=
 =?us-ascii?Q?FcVYcJid6cdVSRjiHwoJRskuIz3mE51JrrELBgfZBb/98WOuPQThwdRMSVS+?=
 =?us-ascii?Q?BcEdqfP0tDA46N0IgppcLz5DPH5X1j8jWbBdv6t2kD2uRhzO/DRPH20YphIH?=
 =?us-ascii?Q?Xtp6Yj+ggXO/JJvul4uotr1vYuGz6makOUgTXD68G8wTfjqLOfsecRkKJTEj?=
 =?us-ascii?Q?7NWY88E59tTDMPbKwnkIufWMS7Z6NLp5YAPvGcNl5rApFAqNc/FG+eYc2AjD?=
 =?us-ascii?Q?mB64kx1+IR83zO+wcIpSTU+VhjHVDuS2p4/q9uy6OR5ajFSXBaTo0MJen3Gg?=
 =?us-ascii?Q?RroPfjMOrzmGJA+uMWP+Qne0WGSyIR7CscYE+q/IufWzBNi4Mq4TMkBVg8u2?=
 =?us-ascii?Q?IZ9RuuMGENpndb2EHX43EIa10rgM/YzmU+ysjjp+jKBWVY4D8Y5+B+UcyREK?=
 =?us-ascii?Q?LF32csFOYIKbc2qVvnohuScffx6NbjlQq7ORo1BxyHcOLXDcmUllYFAN8FSH?=
 =?us-ascii?Q?cXxiHJyIFGRJb2YgdMijHieEEmVsanDfo+R8xbBAYD4DreNW+5WSDF3VoVI6?=
 =?us-ascii?Q?z8A4uQCzIiBUZ2V2zG3QdUo9bOTqgP1enqRlNZjAyzqJoYxDQCpO9UuxPzQa?=
 =?us-ascii?Q?MLnxnaa8ARUpj076+EpZkyt9+WPg6uCWR1BTu11HPlaKAZMSYBsIK11AZ1YX?=
 =?us-ascii?Q?JoxE6BrFCPDOrqtVrVfcN8A9pdAUf+NpjhHrLBJV73MH/ABOeybkW2Y0Lzl8?=
 =?us-ascii?Q?+NA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7b/glmOBpy/MF46MudtjeFUsQY+RLrwT5PPp4tiZ9g8o6oqDcw9sBjwMe3uT?=
 =?us-ascii?Q?c/ShHEXJ0oLj/F2KQMagpml8nGX7+a1N66dGL+veAwD9cl8M1RkD1OAZvasJ?=
 =?us-ascii?Q?rsfa6tskVbwekgrwlBuIxBe3rP7T+tPpfYq9KXdwitMi/GvRuGY52lW8qI7P?=
 =?us-ascii?Q?GwmLc6p06tUKgCBMAVzuGyIuzTpFFOEifj3/3OydhogxnswqrFLfuWExGXJX?=
 =?us-ascii?Q?Up7ABJMv0VMnqjHHxeFr+aBvzK49hp2g99Gf2sYHh54NVF7LZboz7cysXCo6?=
 =?us-ascii?Q?dMzqKOS62NdSk9FKIHwaHLvCWzA6G73C1ElDV/m6g9iQ/MuM/+7lwxeYoAbk?=
 =?us-ascii?Q?4OChQM0/uhziDNFCTMKIXQ6x3C5bww5zLKpTYdc/6v9MCdB8w9Mi8VxLd4nq?=
 =?us-ascii?Q?5yizrFlH2T8Yxp4SS23EoyT+8N1jttGWdtAVwvNBvCrfe4UL/oAKZ4xUL1kU?=
 =?us-ascii?Q?g3sseDyKzaADUHSAGUnUFYQKyT0F2l/zJpamWzyyeI26wbVVLEGB/gAddU3p?=
 =?us-ascii?Q?Hg9D+Fz7R+Mut52M5EtOav7S+kTvqo8LOd7BVxXE5R7GxDs3srwNhhsUnbTF?=
 =?us-ascii?Q?jw9XAT/9Xe/86CNO2LBTEyWgVmCz7PTCcBobIN21bx5nleA0IX4jmwXr5OOL?=
 =?us-ascii?Q?+9UA0+Ej3MQtb+nvdFJlmeY4B2V6I7VC3iKfFYicW2chZmftxK6uH7W42WUx?=
 =?us-ascii?Q?i3ADOHo32iKr0JxkqtPIs1zgoaGnv/MsT43dcSW5x6PdcFBlAoL4eEawFgnE?=
 =?us-ascii?Q?0itlA2aw1iuu4l9hyaEuTCC1KsxPaNuAx2J8imhy2Y55rENNClj6EL+6lWzz?=
 =?us-ascii?Q?tZhcCy6Ry/EMjr+JtC0AI3igxKcG3jJdprHUETU/g+QYAjSnhgZU4j0P0feO?=
 =?us-ascii?Q?9sbXHqC39eEzt+IX4WWxPDBaaFef/Al9WJVqvabtqEZ8rQPAmgUWoAIDuxei?=
 =?us-ascii?Q?bMYCTp6MM7IYUe9/hVRT6j7qD9IBFK5FSX7LYiu2I6XlfmK5ebBLxa5feSFD?=
 =?us-ascii?Q?pgfOUP5g0eO6Lzlrfn7ApcCNM3QCdE4q/8c6iLursHVN+9weMpivyBJK38R7?=
 =?us-ascii?Q?wOvysfrUigzpRwxDUNbPQzWvCwSW8PZ/802BEM6ZSQotbivzsiRw6a8VI3PW?=
 =?us-ascii?Q?+L0lDeJHfcbLF9m6tGw7wKA13K7UG9Xv3ZhjQnBOR2DWzod6NJHpjB4RpN3y?=
 =?us-ascii?Q?VRt9ghKgTY71rOZuu4LRRSsT1QsdYJQNgmR/cpkGB63/qcU3ECLyg/3rghEi?=
 =?us-ascii?Q?gMPKvbLPhD2kx0g4xxcAydUFdyLMCl7ZR8ViOlFm6Tqu3KA0U815V/kDMu5b?=
 =?us-ascii?Q?y5l+Y9umfNtd6Ec9Fpvf3xXjF5fevqA51iEu50HfB13xZ3o/yTsm11gdRm52?=
 =?us-ascii?Q?d1ouHCubCG0aGl+UzvdCc8nbfxAi9fK7yUt26PUyYX2iwrncK+BdpsEs2t9x?=
 =?us-ascii?Q?NzuMskVAWNhsUrPE3ffcw50tNFh49s5AdRhWCfTTbiKRh3VWShSM+aRCT5wL?=
 =?us-ascii?Q?lIYHVARhyngvaGrzPwUfAV3VdOxKojWxlz9VezFWdQZfvxKaGzYCZ3ISJkYG?=
 =?us-ascii?Q?fEjbdOLNzgAEx6ANyyjMxppKFjOLL1sWn1l+ckbXjyomqdciqi8N0F11UiKN?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9549039-cde1-4fa0-cb1a-08dcc2ecc099
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 20:55:28.1033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyMe3lTYjhdHpHgGK4GdKi35PsDa/d9g1GcHvP8FuBm2LO/feCpSGL1th5mbLjyalEMlqT6c0tB6aEO8aamfUBJ5GqmKDfn4wy8o98xj6PM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

Hi Dave and Sima,

Second drm-xe-next pull request for the 6.12 cycle.

Several fixes here that are also going through drm-xe-fixes. Most of the
other changes are the missing bits for Xe2 (LNL and BMG) and general
refactors.

The only UAPI change is actually a fix for building with gcc 5.

I left some commits out since they were too fresh and I didn't have core
CI results for them. Plan is to send the final pull request for 6.12
next week with those commits.

thanks
Lucas De Marchi

drm-xe-next-2024-08-22:
UAPI Changes:
- Fix OA format masks which were breaking build with gcc-5

Cross-subsystem Changes:
- drm/ttm: Add a flag to allow drivers to skip clear-on-free

Driver Changes:
- Use dma_fence_chain_free in chain fence unused as a sync (Matthew Brost)
- Refactor hw engine lookup and mmio access to be used in more places
   (Dominik, Matt Auld, Mika Kuoppala)
- Enable priority mem read for Xe2 and later (Pallavi Mishra)
- Fix PL1 disable flow in xe_hwmon_power_max_write (Karthik)
- Fix refcount and speedup devcoredump (Matthew Brost)
- Add performance tuning changes to Xe2 (Akshata, Shekhar)
- Fix OA sysfs entry (Ashutosh)
- Add first GuC firmware support for BMG (Julia)
- Bump minimum GuC firmware for platforms under force_probe to match LNL
   and BMG (Julia)
- Fix access check on user fence creation (Nirmoy)
- Add/document workarounds for Xe2 (Julia, Daniele, John, Tejas)
- Document workaround and use proper WA infra (Matt Roper)
- Fix VF configuration on media GT (Michal Wajdeczko)
- Fix VM dma-resv lock (Matthew Brost)
- Allow suspend/resume exec queue backend op to be called multiple times
   (Matthew Brost)
- Add GT stats to debugfs (Nirmoy)
- Add hwconfig to debugfs (Matt Roper)
- Compile out all debugfs code with ONFIG_DEUBG_FS=n (Lucas)
- Offload system clear page to GPU (Nirmoy)
- Remove dead kunit code (Jani Nikula)
- Refactor drvdata storing to help display (Jani Nikula)
- Cleanup unsused xe parameter in pte handling (Himal)
- Rename s/enable_display/probe_display/ for clarity (Lucas)
- Fix missing MCR annotation in couple of registers (Tejas)
- Fix DGFX display suspend/resume (Maarten)
- Prepare exec_queue_kill for PXP handling (Daniele)
- Fix devm/drmm issues (Daniele, Matthew Brost)
- Fix tile fini sequence (Brost)
- Fix crashes when probing without firmware in place (Daniele)
- Use xe_managed for kernel BOs (Daniele, Matthew Brost)
- Future-proof dss_per_group calculation by using hwconfig (Matt Roper)
- Use reserved copy engine for user binds on faulting devices
   (Matthew Brost)
- Allow mixing dma-fence jobs and long-running faulting jobs (Francois)
- Cleanup redundant arg when creating use BO (Nirmoy)
- Prevent UAF around preempt fence (Auld)
- Fix display suspend/resume (Maarten)
- Use vma_pages() helper (Thorsten)
The following changes since commit a809b92ee0f84c3f655b16a8b4d04bc3665d954a:

   Merge tag 'drm-intel-next-2024-08-13' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2024-08-16 12:56:42 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-08-22

for you to fetch changes up to 23683061805be368c8d1c7e7ff52abc470cac275:

   drm/xe/lnl: Offload system clear page activity to GPU (2024-08-19 17:49:00 +0200)

----------------------------------------------------------------
UAPI Changes:
- Fix OA format masks which were breaking build with gcc-5

Cross-subsystem Changes:
- drm/ttm: Add a flag to allow drivers to skip clear-on-free

Driver Changes:
- Use dma_fence_chain_free in chain fence unused as a sync (Matthew Brost)
- Refactor hw engine lookup and mmio access to be used in more places
   (Dominik, Matt Auld, Mika Kuoppala)
- Enable priority mem read for Xe2 and later (Pallavi Mishra)
- Fix PL1 disable flow in xe_hwmon_power_max_write (Karthik)
- Fix refcount and speedup devcoredump (Matthew Brost)
- Add performance tuning changes to Xe2 (Akshata, Shekhar)
- Fix OA sysfs entry (Ashutosh)
- Add first GuC firmware support for BMG (Julia)
- Bump minimum GuC firmware for platforms under force_probe to match LNL
   and BMG (Julia)
- Fix access check on user fence creation (Nirmoy)
- Add/document workarounds for Xe2 (Julia, Daniele, John, Tejas)
- Document workaround and use proper WA infra (Matt Roper)
- Fix VF configuration on media GT (Michal Wajdeczko)
- Fix VM dma-resv lock (Matthew Brost)
- Allow suspend/resume exec queue backend op to be called multiple times
   (Matthew Brost)
- Add GT stats to debugfs (Nirmoy)
- Add hwconfig to debugfs (Matt Roper)
- Compile out all debugfs code with ONFIG_DEUBG_FS=n (Lucas)
- Offload system clear page to GPU (Nirmoy)
- Remove dead kunit code (Jani Nikula)
- Refactor drvdata storing to help display (Jani Nikula)
- Cleanup unsused xe parameter in pte handling (Himal)
- Rename s/enable_display/probe_display/ for clarity (Lucas)
- Fix missing MCR annotation in couple of registers (Tejas)
- Fix DGFX display suspend/resume (Maarten)
- Prepare exec_queue_kill for PXP handling (Daniele)
- Fix devm/drmm issues (Daniele, Matthew Brost)
- Fix tile fini sequence (Brost)
- Fix crashes when probing without firmware in place (Daniele)
- Use xe_managed for kernel BOs (Daniele, Matthew Brost)
- Future-proof dss_per_group calculation by using hwconfig (Matt Roper)
- Use reserved copy engine for user binds on faulting devices
   (Matthew Brost)
- Allow mixing dma-fence jobs and long-running faulting jobs (Francois)
- Cleanup redundant arg when creating use BO (Nirmoy)
- Prevent UAF around preempt fence (Auld)
- Fix display suspend/resume (Maarten)
- Use vma_pages() helper (Thorsten)

----------------------------------------------------------------
Akshata Jahagirdar (1):
       drm/xe/xe2: Introduce performance changes

Ashutosh Dixit (1):
       drm/xe/observation: Drop empty sysctl table entry

Daniele Ceraolo Spurio (5):
       drm/xe: fix WA 14018094691
       drm/xe: Make exec_queue_kill safe to call twice
       drm/xe: use devm instead of drmm for managed bo
       drm/xe/uc: Use managed bo for HuC and GSC objects
       drm/xe/uc: Use devm to register cleanup that includes exec_queues

Dominik Grzegorzek (2):
       drm/xe: Move and export xe_hw_engine lookup.
       drm/xe: Export xe_hw_engine's mmio accessors

Francois Dugast (11):
       drm/xe/hw_engine_group: Introduce xe_hw_engine_group
       drm/xe/guc_submit: Make suspend_wait interruptible
       'drm/xe/hw_engine_group: Register hw engine group's exec queues
       drm/xe/hw_engine_group: Add helper to suspend faulting LR jobs
       drm/xe/exec_queue: Remove duplicated code
       drm/xe/exec_queue: Prepare last fence for hw engine group resume context
       drm/xe/hw_engine_group: Add helper to wait for dma fence jobs
       drm/xe/hw_engine_group: Ensure safe transition between execution modes
       drm/xe/exec: Switch hw engine group execution mode upon job submission
       drm/xe/vm: Remove restriction that all VMs must be faulting if one is
       drm/xe/device: Remove unused xe_device::usm::num_vm_in_*

Himal Prasad Ghimiray (1):
       drm/xe: Remove unused xe parameter

Jani Nikula (3):
       drm/xe/tests: remove unused leftover xe_call_for_each_device()
       drm/xe: use pdev_to_xe_device() instead of pci_get_drvdata() directly
       drm/xe: add kdev_to_xe_device() helper and use it

Julia Filipchuk (3):
       drm/xe/guc: Bump minimum required GuC version to v70.29.2
       drm/xe/guc: Define GuC version v70.29.2 for BMG
       drm/xe/guc: Enable w/a 14022293748 and 22019794406

Karthik Poosa (1):
       drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write

Lucas De Marchi (3):
       drm/xe: Allow to compile out debugfs
       drm/xe: Rename enable_display module param
       Merge drm/drm-next into drm-xe-next

Maarten Lankhorst (2):
       drm/xe/display: Match i915 driver suspend/resume sequences better
       drm/xe/display: Make display suspend/resume work on discrete

Matt Roper (3):
       drm/xe: Name and document Wa_14019789679
       drm/xe: Add debugfs to dump GuC's hwconfig
       drm/xe/mcr: Try to derive dss_per_grp from hwconfig attributes

Matthew Auld (2):
       drm/xe: fix engine_class bounds check again
       drm/xe: prevent UAF around preempt fence

Matthew Brost (14):
       drm/xe: Use dma_fence_chain_free in chain fence unused as a sync
       drm/xe: Take ref to VM in delayed snapshot
       drm/printer: Allow NULL data in devcoredump printer
       drm/xe: Faster devcoredump
       drm/xe: Only check last fence on user binds
       drm/xe: Move VM dma-resv lock from xe_exec_queue_create to __xe_exec_queue_init
       drm/xe: Add xe_sched_msg_lock/unlock helper
       drm/xe: Reinit msg link when processing a message
       drm/xe: Add xe_sched_add_msg_locked helper
       drm/xe: Only enable scheduling upon resume if needed
       drm/xe: Allow suspend / resume to be safely called multiple times
       drm/xe: Fix tile fini sequence
       drm/xe: Use for_each_remote_tile rather than manual check
       drm/xe: Use reserved copy engine for user binds on faulting devices

Michal Wajdeczko (1):
       drm/xe/pf: Fix VF config validation on multi-GT platforms

Mika Kuoppala (1):
       drm/xe: Add kernel doc for xe_hw_engine_lookup

Nirmoy Das (7):
       drm/xe: Fix access_ok check in user_fence_create
       drm/xe/gt: Add APIs for printing stats over debugfs
       drm/xe: Add stats for tlb invalidation count
       drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()
       drm/xe: Remove redundant param from xe_bo_create_user
       drm/ttm: Add a flag to allow drivers to skip clear-on-free
       drm/xe/lnl: Offload system clear page activity to GPU

Pallavi Mishra (1):
       drm/xe/xe2: Enable Priority Mem Read

Shekhar Chauhan (1):
       drm/xe/xe2: Add performance turning changes

Tejas Upadhyay (4):
       drm/xe/xe2hpg: Add Wa_14021821874
       drm/xe: Move enable host l2 VRAM post MCR init
       drm/xe: Write all slices if its mcr register
       drm/xe: Define STATELESS_COMPRESSION_CTRL as mcr register

Thorsten Blum (1):
       drm/xe/oa: Use vma_pages() helper function in xe_oa_mmap()

  drivers/gpu/drm/drm_print.c                   |  13 +-
  drivers/gpu/drm/ttm/ttm_pool.c                |  18 +-
  drivers/gpu/drm/xe/Makefile                   |  18 +-
  drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |   1 +
  drivers/gpu/drm/xe/display/xe_display.c       |  88 ++++--
  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   1 +
  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  10 +-
  drivers/gpu/drm/xe/tests/xe_bo.c              |   8 +-
  drivers/gpu/drm/xe/tests/xe_dma_buf.c         |   2 +-
  drivers/gpu/drm/xe/tests/xe_migrate.c         |  24 +-
  drivers/gpu/drm/xe/tests/xe_pci.c             |  52 ----
  drivers/gpu/drm/xe/tests/xe_pci_test.h        |   1 -
  drivers/gpu/drm/xe/xe_bo.c                    |  48 +++-
  drivers/gpu/drm/xe/xe_bo.h                    |   1 -
  drivers/gpu/drm/xe/xe_debugfs.h               |   4 +
  drivers/gpu/drm/xe/xe_devcoredump.c           | 111 +++++---
  drivers/gpu/drm/xe/xe_devcoredump_types.h     |   8 +
  drivers/gpu/drm/xe/xe_device.c                |   5 +-
  drivers/gpu/drm/xe/xe_device.h                |  15 +-
  drivers/gpu/drm/xe/xe_device_types.h          |  17 +-
  drivers/gpu/drm/xe/xe_exec.c                  |  20 +-
  drivers/gpu/drm/xe/xe_exec_queue.c            | 237 ++++++++--------
  drivers/gpu/drm/xe/xe_exec_queue.h            |   8 +-
  drivers/gpu/drm/xe/xe_exec_queue_types.h      |   4 +-
  drivers/gpu/drm/xe/xe_gpu_scheduler.c         |  23 +-
  drivers/gpu/drm/xe/xe_gpu_scheduler.h         |  12 +
  drivers/gpu/drm/xe/xe_gsc.c                   |  20 +-
  drivers/gpu/drm/xe/xe_gsc_proxy.c             |  45 +---
  drivers/gpu/drm/xe/xe_gt.c                    |  10 +-
  drivers/gpu/drm/xe/xe_gt_debugfs.c            |  13 +
  drivers/gpu/drm/xe/xe_gt_mcr.c                |  40 ++-
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  11 +-
  drivers/gpu/drm/xe/xe_gt_stats.c              |  49 ++++
  drivers/gpu/drm/xe/xe_gt_stats.h              |  29 ++
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |   2 +
  drivers/gpu/drm/xe/xe_gt_types.h              |  15 ++
  drivers/gpu/drm/xe/xe_guc.h                   |  10 +
  drivers/gpu/drm/xe/xe_guc_ads.c               |   6 +
  drivers/gpu/drm/xe/xe_guc_hwconfig.c          |  97 +++++++
  drivers/gpu/drm/xe/xe_guc_hwconfig.h          |   3 +
  drivers/gpu/drm/xe/xe_guc_submit.c            |  62 +++--
  drivers/gpu/drm/xe/xe_huc.c                   |  19 +-
  drivers/gpu/drm/xe/xe_hw_engine.c             | 145 +++++++---
  drivers/gpu/drm/xe/xe_hw_engine.h             |  10 +
  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 372 ++++++++++++++++++++++++++
  drivers/gpu/drm/xe/xe_hw_engine_group.h       |  29 ++
  drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  51 ++++
  drivers/gpu/drm/xe/xe_hw_engine_types.h       |   2 +
  drivers/gpu/drm/xe/xe_hwmon.c                 |   3 +-
  drivers/gpu/drm/xe/xe_lrc.c                   |  50 +++-
  drivers/gpu/drm/xe/xe_migrate.c               |  29 +-
  drivers/gpu/drm/xe/xe_migrate.h               |   7 +-
  drivers/gpu/drm/xe/xe_mmio.c                  |   4 +-
  drivers/gpu/drm/xe/xe_module.c                |   6 +-
  drivers/gpu/drm/xe/xe_module.h                |   2 +-
  drivers/gpu/drm/xe/xe_oa.c                    |   3 +-
  drivers/gpu/drm/xe/xe_observation.c           |   1 -
  drivers/gpu/drm/xe/xe_pci.c                   |  10 +-
  drivers/gpu/drm/xe/xe_pm.c                    |  11 +-
  drivers/gpu/drm/xe/xe_preempt_fence.c         |   3 +-
  drivers/gpu/drm/xe/xe_preempt_fence_types.h   |   2 +
  drivers/gpu/drm/xe/xe_pt.c                    |  10 +-
  drivers/gpu/drm/xe/xe_sync.c                  |   4 +-
  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |  12 +
  drivers/gpu/drm/xe/xe_tuning.c                |  13 +-
  drivers/gpu/drm/xe/xe_uc_fw.c                 |  28 +-
  drivers/gpu/drm/xe/xe_vm.c                    |  53 +---
  drivers/gpu/drm/xe/xe_wa.c                    |   4 +
  drivers/gpu/drm/xe/xe_wa_oob.rules            |   6 +
  include/drm/drm_print.h                       |  54 +++-
  include/drm/ttm/ttm_tt.h                      |   6 +-
  71 files changed, 1585 insertions(+), 525 deletions(-)
  create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
  create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h
