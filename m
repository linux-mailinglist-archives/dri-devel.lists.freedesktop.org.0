Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0545C90681
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 01:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FE910E82D;
	Fri, 28 Nov 2025 00:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhygGWZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C386410E793;
 Fri, 28 Nov 2025 00:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764289488; x=1795825488;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=zOfHuO8fkD4NRmCYKrqEqYo+6OlircOXfPCCRsDPN7g=;
 b=RhygGWZwaXuGuwqZ/bBoDUZeuLJDNyjjKt1bqEwA9fYXJvnrSnPW8/3C
 2MmfmE0YyjyakVvRxb4qmQ7Nf7t4vS2we+QOAMrXU7w75Ajd3EI0kE7MR
 Rqeu0u/cG7gTMgsi07w0FwVh3Gf9VUNObrbwgGsihvC5a1Sd6O/B2JNsC
 JsT+3Dn0M4KHktJ5rQ7dv3J3vB/z8K+d+SnSGXvrJAxTA28RNZVvEkVBB
 5+KukW3+5lQtQRgqUwCe2yuoVR4AbXVRMnnZfN83lW4KnFltFtV51qVDd
 Rfs9ZYHVywO65VRmNf3JcvPsXmZDJJGpZZKPClNrPcReCqPO9MnpsSqgu g==;
X-CSE-ConnectionGUID: eWb2gUpXRRmZle5l4NcTbw==
X-CSE-MsgGUID: sEW//CFrTbCnSTv5nl7/mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="83939709"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="83939709"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 16:24:48 -0800
X-CSE-ConnectionGUID: Ewhk5ozpSbqrF/mVTqhaJQ==
X-CSE-MsgGUID: N2jvP/9aRLWbIiCx5QDjUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="192594209"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 16:24:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 16:24:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 16:24:43 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 16:24:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQ7C+MX6kaU0NaOEbWiu/QnaDSnfkL9STFO1w1ytD2Bjq9ndOFxfKI2c1Ujj1v40nP/wL9wgV1zixK7CgyEzGKL4+m/edK3kcyDx1TpZvsgyU7CWWTrfnzZbaCX8j3RJpXSNWGWXgsS2P1EZDXv4gKGLQUihDiKAFuRU+DCymvtG2KgNTyqdJhVi+/FNWaQc3Li4ChDcoUA0VFR6UA9IfuBSnncfM73BwCXr/dsL8QY9sp4EO2XmNdXOiV5ty6IxM9NF9c40UhaSq7OnzT5HWWGAM28FX0e2E/dk12R/l0R85diq4Vqusj/xOMeOjV48VAKQJXaaDH1++5GKoVuEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwPIKSCXd61B/sarNhzzxauIKWgT/21bs21YOxasxWQ=;
 b=rIjcp1X17ZATrnewIp7lahyBUxuP9igeYSWFfivWUQ74P1V4mNPxtY8HuPsk35W6M6bDscBAQS9q2g3tyYtvdDX3PPI1xWsCvs1Lykn/q2wCDzLmMpuzj63+7Gyn+tLuji/ZBfNfcQH3Vc8SahZFxbUyDbVy8VBmD2ggnBcojur5AwrQt27FtZh6Y9z65P0JS8BRj3oROWGp8kxPRAru1UCQMFOc4Z0u/H5gSEBkvv1t9Mn2QX82MUPAzB/QlPtOkm5RvXQnTQvD4Vr3LxFbJCUKOZntObFC91vsFn3wJN9TGU3FwAi4Uxo5ufR/xy83JH+Faspx1pvQ+sMzdLnNHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 00:24:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 00:24:40 +0000
Date: Thu, 27 Nov 2025 18:24:36 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>, <demarchi@kernel.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <7ejiqjgthpqybg5svmkind2pszk4fqadxuq7rngchaaw76iept@5pn6sngqj6lk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0091.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: ea326c6e-01b0-4de7-57c3-08de2e14850f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L/FeoqIZotWngojPGf3H7Y6B0pUclkYVGYfFlX7Ai8RcQzXeqWDxj9JE7cVg?=
 =?us-ascii?Q?KVGkP+5ZXl/yiUB31q2n676+WUA4m2RLy2VeM9Rv8VUPF7lYxOi0ecXOknrH?=
 =?us-ascii?Q?1crqp//L86WeM2pi6P/VjCjPc174uFYxAqaFtvtjdtjRX55NmpsJfjv1Ft8L?=
 =?us-ascii?Q?r6xz3iWvMaZQwkXaqHjiIjtpNnhqQ4JCPtraka4FoSfPKO2l9iXew7DRZBrD?=
 =?us-ascii?Q?cA45rkMeE+1yKT5iSUOA869Na58HUsSHWLz/yBebC0cH02tP60nGKH2i/IYW?=
 =?us-ascii?Q?al5siUWXQHn0J569CorR2qE5KJEV+OIJgEe4PWYyz1EQZsUxjdZEor7AKZjq?=
 =?us-ascii?Q?hiJhkiHI/14KL6pGDMHR1lAHfCCFSr4pl+QPGOYZOrzRnaxEDUqr0lRP6crj?=
 =?us-ascii?Q?JbqhtAKkocCBN2/MaSXw6Bdmc2zoD57krOYuzOEX1wAh6EBkUg1GMnrlaBNx?=
 =?us-ascii?Q?3U/P6w5TZ2xRR92E4mJiqeKbSJDsvtN6AcXi1/3yO4S9Q0UYhZCJFWp3jM12?=
 =?us-ascii?Q?oewUXWJFI6bd79iuFc8zVsc0fpJTuUVkBvwjbYaCmiSI68dRKng7bo/N5wka?=
 =?us-ascii?Q?qMd68jyGvSOk1NUCl9tTX1XQNocA4q+qgOEZoc5GOP7M9j0jbuygVP/uJrKi?=
 =?us-ascii?Q?1yVQS/IgiQUQmPplXhq0D2RbSNCrdH5nIK7wktcaBWRF/sn4Pf9HcwTHNu5I?=
 =?us-ascii?Q?WgEygUlRRJuoByZ6MGgbbA8yyGSx20nYl9E/s3rCCNn0hyf4iAQiX0mWCkJy?=
 =?us-ascii?Q?FfdYegobZbp8q8eUE3DxzWIgYq+Jxb3A3Tnhi+kzEtR9nwZC+t7pEjOOp9Im?=
 =?us-ascii?Q?iatAbNF563Td38gOdqhLBZKlc2s9Zi+migza/KkDw+LuN8D0iDmnLdDNzRo0?=
 =?us-ascii?Q?yl7SrS4wY6BjGoadSiwvMau+xGosO3nb+8GICRIWRVxO3DVlPpg5jBfIwMWb?=
 =?us-ascii?Q?PiXJ9wOAF6DVdZzdURidqYj621uqSEO8naOmaETTSLYR7x6bAfbkQ4eo00ne?=
 =?us-ascii?Q?GxvTfHL1nMi+pWwnb5ZnAp4c2q8eKhaxFoHsjFkKxw8xOlg6ywqP1AFAhgY0?=
 =?us-ascii?Q?WrUcUydov0aVYXEHjgbHokUWYuhyS2yajBDBiO0Lm/lIbqHorhUW4r909yCA?=
 =?us-ascii?Q?2xbw8qgOcqu9RN72Lo6bFw0bbqbr3KB1i/kiPfI7xqmV+7Eb2ZoKhKZB2HKf?=
 =?us-ascii?Q?RTG2vH32yXNmYnSds1o6letsmaluiAdiHy9SOBthgzPs/Tyd01wZV7yApjMN?=
 =?us-ascii?Q?bfU+yKJTSdKrjRIJyHR52r1xhzdnRPe937+8FNxMkI+RQtGGP0jHebT/eUdo?=
 =?us-ascii?Q?nQRtrrMmMe05kUW2WtFnNHLni5FTDEFZsWgzv6qjMg+PYjMRfYznKF/vkUbD?=
 =?us-ascii?Q?EO7GyPOlxBcQnFvXAGkXn4p0TEZJFTYlUtT03rQJrlgXs9hM/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uVCU/Id1eqOnpvotZSUPfIgLMYu96/GeayNsq7yAU4/OkbLEDnuYr06Y7WhW?=
 =?us-ascii?Q?ZUL/k7ufRtnu/o2n/OZxa24LmuwH8NuV7WkzwhNqltaIwEtDBr+rPDATdEwM?=
 =?us-ascii?Q?6vovg6p8VMUCFuo+blj3g6Jud9F5UwkwGmoj1+NcmqjSJM5ZAl1bV7sJ0UO4?=
 =?us-ascii?Q?HY/h6kkKs+lctxWfGM00Zm30+5WPSOLiacAYfapvk2pe9ka+GcLzrgo3bM0+?=
 =?us-ascii?Q?e/XpR3qf3hRTSJtb+Mt2USIhnDYWzqu0J0H6z8gQqDUstQEocAXXZKWDLfpA?=
 =?us-ascii?Q?RplrDF9VKU4otHE1Rhsiy9smChm0tfLrvnCksdAeFGDHMNPomTUcb9UsRIpy?=
 =?us-ascii?Q?6lQHDe0TBLZomkfrrBinaIH9Ck+iCoo8xrxEN8qzCGJBo7laO682FRl0L82b?=
 =?us-ascii?Q?/U0Fe2bROMJ+IWMcCsReB8i3PLvo8jw4ogt0s+BAjYYxl/cr4sbF3w3NsLWO?=
 =?us-ascii?Q?26fMCt5teVaMrOcxHkE6R8BREQMGpzBgj8uSmLb3uTqkrkL5f3iKJ/YuJSTN?=
 =?us-ascii?Q?QoFj0VNJG5/4cvD/OsEFB1Yitc+ucIeRXVZAYKidjyyEQnBVV4XnFbi7Xa48?=
 =?us-ascii?Q?YW4NwP4jq77RstRpHf0KBEOSrudADxMpbXezrJqzEXrwaZp/IB1jwAq+IQRR?=
 =?us-ascii?Q?uWBdGBfb03Ae5Qo3QGFzS+blUq+/xUPfp4as9gh4v0ZITpNcZznKyKWFaMir?=
 =?us-ascii?Q?Xrlp6K0wdDsmZaEx8wIeZjck0REy7LJ53DhT9dbXQJKMRYbMUcVHf/FO9vTP?=
 =?us-ascii?Q?yNjaNbNH2+g0CI3O45uZ94SF0CiVEmPh2VCxKIj2loOeZn0wpMcW60lHe16z?=
 =?us-ascii?Q?MTk540tstmzd5lNg1kncuSbdxmYtvlkxjy5CDpLnzlS5g3CsQDoqnqFPHjG0?=
 =?us-ascii?Q?zcZlPSz9ELPAPYiYE3roDWM/EfSJTaoGJ6oXWMRrjxN+RgUYJarRqw8unfnO?=
 =?us-ascii?Q?tZZO06kP/I6W/rlblj47JzeQ1BJ+qIKcP1i3HaMku3yPxIH8H0LvBnUu1JGq?=
 =?us-ascii?Q?ZWnV0bSPoxc+lh8Iao62om5K/eg17Sqp0VhCZwX6VyyllyUUSlOnYposRiYS?=
 =?us-ascii?Q?YoyHdTNkPxgvZsJ/CcnKXW+rKBU0i5EUygu9//7lW/jQg3lg7bHpi4trC4tC?=
 =?us-ascii?Q?yg3gnVfsYPo4ZDoL7idmQ+NyRD34EoE4Za3H0jwxdMqNeSbJOwD3nU7SyTin?=
 =?us-ascii?Q?k6qQslyn7YxJwV/Hk341BTZKSwjs6tuWiKLa+hdmIJdV+hO3lsqZnz4LwS2i?=
 =?us-ascii?Q?jpqxsT8uYiVzuUrMwT1nMcwFdY3PRmLQFiDKTH1sTZmVgnHZhbDzbQIi61g3?=
 =?us-ascii?Q?KnAvEzCb/RbU4CSBsAYaRqssu11eltHtocQOsGrgFMLZL+GbKzjSqHGQPnSt?=
 =?us-ascii?Q?9d6zHth1pP8nrK9tIIkshVZsl8pqzDj6kl7ulDi4s7aam0SXQrwXMleW6UHg?=
 =?us-ascii?Q?/FDt8Kyb/cUg02gUQy3ym8wEusk2DvJLlj1I8jrl6WT/VtYbCemJ7BR9u0Ke?=
 =?us-ascii?Q?Ic8LQyQIkQzl0uDdJjJlxzoSmIQHdSCIT5KaKQbfNKaW/z2/KzgQiavDzotm?=
 =?us-ascii?Q?K5SGyD6UkuVQK2vjRxmGE11LTmHdRFiB+gtGU6TxCAQfjxgXAJHC1Ulw8fUh?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea326c6e-01b0-4de7-57c3-08de2e14850f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 00:24:40.2069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2Mg3n3nlPfR++G4SZFgD3pghkyCQFp7aDX78+bLuGRJYydE6qD2nx2//WQf66TUuLHNWnZGIeV9fZHu7E2ucClnisBZbrj/7TI+irUAE8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
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

Here are the fixes towards 6.18. This is also my last pull request as xe
maintainer as I'm leaving Intel. Patch to the MAINTAINERS files will be
merged soon. Rodrigo and Thomas will continue sending the fixes if we
don't have a release this week.

drm-xe-fixes-2025-11-27:
Driver Changes:
  - Fix resource leak in xe_guc_ct_init_noalloc()'s error path (Shuicheng Lin)
  - Fix stack_depot usage without STACKDEPOT_ALWAYS_INIT (Lucas)
  - Fix overflow in conversion from clock tics to msec (Harish Chegondi)

thanks,
Lucas De Marchi

The following changes since commit ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d:

   Linux 6.18-rc7 (2025-11-23 14:53:16 -0800)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-11-27

for you to fetch changes up to 7276878b069c57d9a9cca5db01d2f7a427b73456:

   drm/xe: Fix conversion from clock ticks to milliseconds (2025-11-25 11:53:34 -0800)

----------------------------------------------------------------
Driver Changes:
  - Fix resource leak in xe_guc_ct_init_noalloc()'s error path (Shuicheng Lin)
  - Fix stack_depot usage without STACKDEPOT_ALWAYS_INIT (Lucas)
  - Fix overflow in conversion from clock tics to msec (Harish Chegondi)

----------------------------------------------------------------
Harish Chegondi (1):
       drm/xe: Fix conversion from clock ticks to milliseconds

Lucas De Marchi (1):
       drm/xe/guc: Fix stack_depot usage

Shuicheng Lin (1):
       drm/xe/guc: Fix resource leak in xe_guc_ct_init_noalloc()

  drivers/gpu/drm/xe/xe_gt_clock.c |  7 +------
  drivers/gpu/drm/xe/xe_guc_ct.c   | 15 +++++++++------
  2 files changed, 10 insertions(+), 12 deletions(-)
