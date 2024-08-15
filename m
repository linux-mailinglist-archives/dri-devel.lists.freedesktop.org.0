Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C9895321C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 16:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC3510E40B;
	Thu, 15 Aug 2024 14:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnDTOKmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55C510E402;
 Thu, 15 Aug 2024 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723730532; x=1755266532;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=pRaNbUvuKsd/WxRfrTv8AE75e202nOOcoqptPY2UJ5s=;
 b=WnDTOKmzbMJqC1mW3IrEsEqAJbdaEUQii4CO/OgxNx5SyADV7E/rjhNl
 HHND1TiJw+vr3+i5z0hlZUP9TsWPnM+oBIIo+mvv57lUHBWTWouU5N80p
 DSS4DC8uUFOmezn9OnSErJZJbFmJMj+2pfp2NZHyMQLUL/mV2duFmJXYK
 43jh0G5O/oWIoloMc12qCDkf88QefVNUlmfC7RkNqDX/TrFua69aYRa5p
 F5K8UUoHO26b29sKJPufogWH8Z3yvo9oEtQJ7fL1k90+W4jb3YX3EYjCC
 hqnIAMpO40ulR3JFmFInH9+7Ek0TwB9q4JKJC0DYeHVjSeZVq5uyEVBnL A==;
X-CSE-ConnectionGUID: T0y3ZUZ0R6SLYWUz78THLw==
X-CSE-MsgGUID: G6N7eT/vTZiOYKmziwYt8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="13030135"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="13030135"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 07:02:10 -0700
X-CSE-ConnectionGUID: ramXt8s4SqKT7cQwdUvCZA==
X-CSE-MsgGUID: QjCImaGvSV+ZE1sWhtkmMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="64192835"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 07:02:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 07:02:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 07:02:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 07:02:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRCGmTxEkhN+7wKbfSC5R/tMlKtTUSdnLTc1f+lAR6MXTL/T67CImZG4WE/FjZ13BGKWYUCAJdPIPRtZ9A7ANxkAHmvHvzwSQnehaT2HYOmHDga48otxawQB98eU8HQ8WDFddTwiGIRsQpqN8CdOPBx9kzVCpFlZn2JWCMTD0I9RQtTJ0ZORLj84GjykyAhN4DpPfGBbEtjc1gl2PSHUipXOLcjpjVjwrQOr1cB/Tgb4BL0SQlF+bH72Xnl61oVdfEa1ktF7rzllj+rgf7C28Tx7gcb0Prq8x4MhZxhG1d9OgO2p3AEecS+KuM22Q0Sa+dQJk7jRLSzaANGjfVPc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aI6RFzzLCj6xcqGKhP/7YWnDbAKeG1sSAfJdc9ccExY=;
 b=l5wxyAizcNTY6hexRmN5ZBMtXHpRyGpZuxjuXDpcBbDh3VDgrUFG2CFA91cE5nt5ZQy664UPdIbfw8x4qKv54fWK2+Dd8WeQvTxRRAADWFr6DblhPFNDydmp8PrcFno8Thg4neu/F3GwnYBLy3GmNx302qCMVWC9U1xgjNBUW7mwL4epQX9W8UD/RtbwuNmz5wZetTJY9PRXF/qZYZkGXvt9/gdKQTB9y+WMSOEjeO2P/AN6aHT7dr/LAnvkGYJ3QIq5+w7RiwLTH1NO9ykE5d7g6cTg7cR+qA9UxmUuoYxUSkUIhd5KYPQxXDRjFR07tiv9OHUir1gvl1YGmfSUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB4834.namprd11.prod.outlook.com (2603:10b6:303:90::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 14:02:06 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 14:02:06 +0000
Date: Thu, 15 Aug 2024 10:02:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <Zr4KWF5nM1YvnT8H@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:303:b6::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB4834:EE_
X-MS-Office365-Filtering-Correlation-Id: 9264c9c9-e483-4135-a1f9-08dcbd32d8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6+s7dCcA4zKSNQ0mts25zgaRTXETQGsp5nD/rj6B8HV0AcwB1CAigW0g15BM?=
 =?us-ascii?Q?vpWRy9AbNkQNUaaaBK7IgX9KOicVb6rsFor6/kOy39f+2vL+rugRizRYLI3b?=
 =?us-ascii?Q?TPHO7BPvTK18Brtrbf0m4OHG2DvPby0QSaTi85V0K6hCgyZRbj7KNKZgzfQc?=
 =?us-ascii?Q?lzEPZ3b/6FVKZcJBunpm9Bz8MPosTnKGpoG9tWCA7D5kdzL1GxkjcLzzOlD1?=
 =?us-ascii?Q?jTsyjyf6X4xaCIwWT1hi6tzKaxhZQPuH0pCWzZCc/Et6adLCrxnPBtUAoupI?=
 =?us-ascii?Q?pmlCknfy+PfLXbHRgUnGrT+NUTJhZw5MWUbwhCMniMn1wgXu9n2iCGCiddUx?=
 =?us-ascii?Q?bcG9el6GcGTflRQdwjmdTTgU3GbsICNYHuZ4Jprc99nfY00ml0McA/4eLsH4?=
 =?us-ascii?Q?y28cXSDp5hzN8LTT2s5myE1PW7D4lyxRSo352/pykCsscBWynQTrqWwVbs+p?=
 =?us-ascii?Q?48q9jholjImoL3S0A46b0aa7qFVUH2DcNyAVwR6BKUdPDIMttqBcggkIZuc3?=
 =?us-ascii?Q?yfHeYhXErnjwJCm0d45KonTcs8qwroDn2G899utW+OnuPAOwfgOCcSwoctyR?=
 =?us-ascii?Q?cB/ivfCeB6HkBBVMVDRpJ+7BwAkPYaiaA84ROUv+uDPLsfKgk4B12APFd+ab?=
 =?us-ascii?Q?ZNrnmp5v6MeEiMmVQeqxrAts8CP5RyjKPTYnqG/NerO8vf0NfdHqGEEQucIb?=
 =?us-ascii?Q?xtu0Mw3ULYCzE3RQHUqXuLvkihPaNsM4egjVA1J6QGGYthO7qPYPnMmwS4h+?=
 =?us-ascii?Q?kAtfd15zoVQQeD0MOn2UasNOH1E4PvtDRYFY3hEG5NZOIa2d1ZJM4bpJqsPs?=
 =?us-ascii?Q?U7bRQD8Q3yLVdsKeUHhyUg+wXiADeMLLPQVb9mwDdqDI6ltz4yOK5Pt3qTX8?=
 =?us-ascii?Q?Ma/B4Hezgpl8Due6EqNBWlQxB3+bEKKlq32t7g9c2umHEAHzCFKUdgpHgcCF?=
 =?us-ascii?Q?de7oZxUEfaQexuzUa/at8aOC3m+y2sWWuQ2HAS8Ssc/VZpiz+ywhhKXO0Gmy?=
 =?us-ascii?Q?iIxmM3Bq7N3MMaroY3VRqGAjcnIJ05+RqDkXjPMsPJyt0rprTkER51nS0tXp?=
 =?us-ascii?Q?LPiC2et3248cki2ApPQKkUf71od9gojPoy6l72mkRlifiB9MGmua7x8GKhOr?=
 =?us-ascii?Q?cjEzByFFN0Ni/SLQ3HuszSCxMfXTIoqGyDy57m6zDV3tLwra0/goy7py3m7l?=
 =?us-ascii?Q?bqofZr0QJ5MR4st2xyFUc2m++wfCuKkcQ685BWIEej2jXn8LwUyNQbFzleE1?=
 =?us-ascii?Q?CTZ6vVtleqjVlioEFj2+NnMae+HSYQxIZkE7einy1yK/pcBMUW3b+gVjjInG?=
 =?us-ascii?Q?xYk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BcOHSo78O/6xe8DGzvkj2z5XYtJ0KKCBj+klNEAFjHdzfD2CuoyR9syup9So?=
 =?us-ascii?Q?hjeFb0SdZSKo5sh+A3R6WZW7F9hXfyIeNh9HDAgK4vxc3oMDrZcg5PhOD1NB?=
 =?us-ascii?Q?OzoHGc3qQrGDS6vAyMIAOOJiAOxE5MIwFQcmJ47lJE3Pk/6d6OrzoQceJfir?=
 =?us-ascii?Q?qKLNUnWbwmSdetpG4KdgSBiuTD2+Mayv9cxMpV059GUoTHreAX/mVfcrmhXX?=
 =?us-ascii?Q?193kSKRN9PlHtbbWTWlCUTbxhLF+tYGqG56HrAxixNfb5dJcYfX8XhpH4PYp?=
 =?us-ascii?Q?o7CGbD1ocL0sEzeOZa3iph9cPQoT8HfKHaX7jvuLRkWHy7Heh/ZACCefNoxz?=
 =?us-ascii?Q?cQMspUcKr4VyRrequlx/BQoxEaXcHu4sx7sQdwoSXdRinSWe92YLRoCCU190?=
 =?us-ascii?Q?ZcTbcUaH8SX7km+XmRsvXXEPszFZYecDGhJ9xrDXCkgCHOO8l4VqUj1j5JGt?=
 =?us-ascii?Q?XtB72HbPSD6/VSCr2r/D4yW0CGs78vD3owJaD0DINoCdpUH7x3mGNtot5av6?=
 =?us-ascii?Q?zVwiJNwYm5L+NPL78k+PvRix7XzYoA5/Ih0/WhzUzA1yrLCKo9qvqpAZ+RZi?=
 =?us-ascii?Q?pA9ZhVu2gpJl3lTF4ppHNTI+HF4uK8G/Z+WBJn3sw/a4sBIfBCN5LogCmIog?=
 =?us-ascii?Q?9IURIEqtSoTcAPhqxGSBc0jQMUaiqZpAvaUJ1+fG2c/KWeWPOEMFO5CZQY2t?=
 =?us-ascii?Q?jZDMY2ydj0Nc1uvhBwuCx6QDk/gHd4jhRkRdWOnYoZ1vB2W5QlHMkAVQDuHB?=
 =?us-ascii?Q?XGz7ZbWmer4wHsu8Y0rXQIxYfV8oe6lAvJNQZsVfc53Vhzmo2aYsvfzYDsGr?=
 =?us-ascii?Q?DaqbYu2dwdYdUZvAeyC7z6+tFUID9TA+kBEH955NQ55mqV5bPagE3JhIH24z?=
 =?us-ascii?Q?K2J+NDq/xV3O+KqotLEcn6uGOXIJo0CnNkKdYHz2bw8PyAKUiHbTvujtfRLP?=
 =?us-ascii?Q?8mN/Ok4RkwGcj1BorFKeezUX1a5xRcqQmOo1JWPifZXIwt1gKLyx4arocldr?=
 =?us-ascii?Q?UPS/OHBNQ6Nt0YEPbiQYIN2C0vRpJ56v6uOHnancX8UO8qvaij7Z5P5nosIY?=
 =?us-ascii?Q?s7gQhKCX6QL6e4SS2eIIsU8OWN8e9bR9pHzi4l6Gipz+26d/U8Q949SW5ZNS?=
 =?us-ascii?Q?v/FrdOfMZM1AqjcVKdFlI+bQWorbVXqebKH0K1SrvpTwxM3o5GfIMFuUCqjP?=
 =?us-ascii?Q?cWAl/DwfKiZbfJRHeGgppool7SC32CaddcKcgyNOQ1OqGaDVjbcMaIq0/NXX?=
 =?us-ascii?Q?PvYN6jaJS1oY1RlUbraxHSwkmzgNS1Wx4fChhu56Dtoq9tDq1YiD+A1PY1u4?=
 =?us-ascii?Q?l+BJfok2Nkn0qBMQCwurI/qF8/C2zW86NClqwG7IPaTNhNVVsxpXLVhNqlEP?=
 =?us-ascii?Q?OjexiasS3D/HhP+Aw4bvvoXNAH3XdakDyFeSjbBJpIrxpA6mUrgqzFJn8FLu?=
 =?us-ascii?Q?FWMx1q/ApdZT1LBS5D2oiYRgiDgXdM+MbAEc51e44fsTjdQ0CA/8hyNn1SMJ?=
 =?us-ascii?Q?o7octdUSAuuohjMgIBMJQvyHsN4T0U45vVO8gn8M1ZPdtTCugnUhocGRQEtm?=
 =?us-ascii?Q?+DPGsfPE1bumEW+5y2BilDyPR4oQOYoI/gmQ6gPMiRL/DnYm+R1JFiRC/KYi?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9264c9c9-e483-4135-a1f9-08dcbd32d8a4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 14:02:06.2901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHh+NofsI8TKbQGbr5Vhqw+fXdoIwgjt3/WGqynOIcKwtTC7HV36jbestgRlsWQFInz0ZBHBWH2YX9mwkl/B+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4834
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

Here goes another round of drm-xe-fixes.

The amount of patches is higher for this round, but not
because we have more fixes merged this week, but because
of me and because a few fixes are depending on some
other prep/refactor patches, now merged.

1. As I had told you last week, there were some cases
not applying cleanly, and I noticed we need those and to
get those applied, some preparation patches were needed.

2. I had tagged a drm-xe-next-fixes before going on
vacation, but the sending part failed and I didn't noticed.
With that dim was not picking the fixes to drm-xe-fixes.
But now they are here in this round.
Kudos to Lucas who noticed these missing patches.

Sorry and Thanks,
Rodrigo.

drm-xe-fixes-2024-08-15:
- Validate user fence during creation (Brost)
- Fix use after free when client stats are captured (Umesh)
- SRIOV fixes (Michal)
- Runtime PM fixes (Brost)
The following changes since commit 7c626ce4bae1ac14f60076d00eafe71af30450ba:

  Linux 6.11-rc3 (2024-08-11 14:27:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-08-15

for you to fetch changes up to f002702290fccbd473f5bb94e52f25c96917fff2:

  drm/xe: Hold a PM ref when GT TLB invalidations are inflight (2024-08-15 09:44:22 -0400)

----------------------------------------------------------------
- Validate user fence during creation (Brost)
- Fix use after free when client stats are captured (Umesh)
- SRIOV fixes (Michal)
- Runtime PM fixes (Brost)

----------------------------------------------------------------
Matthew Brost (5):
      drm/xe: Validate user fence during creation
      drm/xe: Build PM into GuC CT layer
      drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
      drm/xe: Drop xe_gt_tlb_invalidation_wait
      drm/xe: Hold a PM ref when GT TLB invalidations are inflight

Michal Wajdeczko (2):
      drm/xe/vf: Fix register value lookup
      drm/xe/pf: Fix VF config validation on multi-GT platforms

Umesh Nerlige Ramappa (4):
      drm/xe: Move part of xe_file cleanup to a helper
      drm/xe: Add ref counting for xe_file
      drm/xe: Take a ref to xe file when user creates a VM
      drm/xe: Fix use after free when client stats are captured

 drivers/gpu/drm/xe/xe_device.c                    |  59 ++++++-
 drivers/gpu/drm/xe/xe_device.h                    |   3 +
 drivers/gpu/drm/xe/xe_device_types.h              |   3 +
 drivers/gpu/drm/xe/xe_drm_client.c                |   5 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                |  10 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h          |   7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c        |  11 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c               |   2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c       | 201 ++++++++++++----------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h       |  12 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h |   4 +
 drivers/gpu/drm/xe/xe_guc_ct.c                    |  10 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                |   4 +
 drivers/gpu/drm/xe/xe_pt.c                        |  26 +--
 drivers/gpu/drm/xe/xe_sync.c                      |  12 +-
 drivers/gpu/drm/xe/xe_vm.c                        |  38 ++--
 16 files changed, 247 insertions(+), 160 deletions(-)
