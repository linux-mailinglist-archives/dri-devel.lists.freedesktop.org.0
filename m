Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3707958763
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 14:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6CB10E785;
	Tue, 20 Aug 2024 12:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYNUkcZi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA19D10E103;
 Tue, 20 Aug 2024 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724158399; x=1755694399;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FQ0O+tMqkrrZYkdTKaimP3rl0lr0UQ1DYWyY+lnjxo0=;
 b=TYNUkcZiYoRCwthP2kQT2L5r/FoBpwX8Fk1BPk3H2OTr5+xL+MhmEuXg
 QmyPBxpXqIdLdHt6gXTnweB6aD01XW3KY95T3U34QMDjCLuQdQBFj3kBy
 ulUY1gpsZuikzTCSHbHfflAuSQz6NdHNP7sSfVQFKWd2BKtVyZmQI0oNV
 j4WAEpj24Z2xj1LNeq2enIBmOVbwlZ5hi2QHQXZaOqHw7dB3Cn2YL1qxX
 d2aJuSLYeE9fmNxohG+vUSKuew6dfiaD2vbazQdQ+S6t1T/Y80iGBRhiH
 K+I9K6YwprH7l0cHktak2SorY3D8e5ALhVK8t+pQO8T5FPA5r6HafBmUs Q==;
X-CSE-ConnectionGUID: YyoCO0LrQPaetrfXY2d4xQ==
X-CSE-MsgGUID: dwkgFaDzQzGsdxNk5pgNxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="13113046"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="13113046"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 05:53:18 -0700
X-CSE-ConnectionGUID: TMdZc3ChS0a/uzvp6srJQA==
X-CSE-MsgGUID: LbEMqLD3RhuAvd8Oztb7GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="83921118"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 05:53:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 05:53:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 05:53:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 05:53:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmRysRKXq8jCgzlowTJoGPAmouERAOcPNuyeCnsDKqlVD0J3DjNrsBL7zAsMBM5l/O8y8jOd0cliDn6tHneMix1f/sIS1z8mWe8aDoR0s/dm1awDt20Jg5XNKAyzGPaeblz4isEEKI97qaDhlode6VDk8jjZlV96AZcIOpNF0ihmLuh9oTDXAHFu0whtL8QyD5Yr/LJ9kbVSL447UoasQU8j04Nzm9c2gIMuz1+vHQMSONrYPmaK7Otjx0twHZiFIeBYTwLxsOgV9t06NAlD2eipydK3sN6fz4waoCfxKY8+IYtG8JU002+llNouBb93ntjGmIkXjjwjfAHa7xpQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Thj43JvbtknNpi49JCOZ10Wbq9wlBw68mIR5mx4qQE=;
 b=hHx/+kn4o1diyF19X6tjQEqQNwg2bNdQaVeS6sp1kp7v4yeCygEWAz4WodgNimniGK4kWbzcyK9aV4PjDXa9qOGTyB3mvEI3EE18KgeqBCPJNaoNQazoLYBr50R0qJeyOZ0KAj84svkug8k4kZgiqIvbmDnOwlkc7WHNcrDwEceMWu5Bbh3ajJt48K3BH18Khw3fksQ5szTWtNXs7OXLIi5lAixri+6TRwjwbGzV5+B/dKFLNxVfJmsC0QmZhSAXLOckmd5DVIPijl2FAG684O0UUJebt+0M7iO0xotl5idfBhBtHOH5AvsKawPJyKsCdjX7jNoe3YwsWvbWgswzrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8593.namprd11.prod.outlook.com (2603:10b6:806:3ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 12:53:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 12:53:14 +0000
Date: Tue, 20 Aug 2024 07:53:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>,
 "Andi Shyti" <andi.shyti@linux.intel.com>, Michal Mrozek
 <michal.mrozek@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>, Gustavo
 Sousa <gustavo.sousa@intel.com>, Shekhar Chauhan <shekhar.chauhan@intel.com>, 
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <opensource.kernel@vivo.com>, Jani Nikula
 <jani.nikula@intel.com>
Subject: Re: [PATCH v2] drm/i915/gt: Use kmemdup_array instead of kmemdup for
 multiple allocation
Message-ID: <ngzckr4tdknp73oki6ig7drg6vx5hapqz3226ejfuhah5khefh@6gwnuk4q2nlx>
References: <20240820095304.2746102-1-yujiaoliang@vivo.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240820095304.2746102-1-yujiaoliang@vivo.com>
X-ClientProxiedBy: MW4PR04CA0164.namprd04.prod.outlook.com
 (2603:10b6:303:85::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: 3adb96d8-5d45-4b12-88b0-08dcc1170e08
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Tog+rR4p03aW5JKik8qm6XkmbnSl1eVOBizXo9eSLm5fFbcJZXfJ34Zvd3U?=
 =?us-ascii?Q?r8shK7y0be2T5Y1pAF6aWyKTKJIvf8RZ0dbsxod9vOBSoCZOByLAK9bPzeRl?=
 =?us-ascii?Q?qbpK1NV2CExkJSdap1Daxpr6Lian6agBbFTJ17xgZFVQpDLEIcyd1NLhLSQq?=
 =?us-ascii?Q?id0h0hTcuN3stVFSV3n3UaJuZBFr8S/3ro0gBNLWSQKC4fPuvVOiFGmxwq0x?=
 =?us-ascii?Q?QTNMgSYnmRWFcyv4bV2AiNF3kEW8YQQWgsZTmWp/N1V85X/RBkvURhJiGE9+?=
 =?us-ascii?Q?3aONOqxSu3UrREU/xudDoVEAPCwY+/v+kjw4v6ny2XnB7ZK0ujfCplhkKZYs?=
 =?us-ascii?Q?93QYzVERLfnBdQ50eq2eu71k+E0ziAwaEgHGy+YZWwUOM/V9JsTo5TCTS9C+?=
 =?us-ascii?Q?OdcGnSTGixkIsTjRQV1loM58cSnRm9Y5b6cfZm6ixA6gCu40QW2A1mV2hiQs?=
 =?us-ascii?Q?bqZdIoNt0N9X67s5IlLkmiP5QXohi/XNdEP7RNMYCdXbCHIpVpAaBDXtpyh1?=
 =?us-ascii?Q?+qCeb8RqXsaPcdlWzvRZvWOTiwcN7hsaSZQNANrZZjBtv1ETKb8Z1NwecViT?=
 =?us-ascii?Q?PnLvjQd6f0RZVFV6CIti4zne0kvTZsLOw+u42MGyWgo+f3q7+LdUwMnDK+ks?=
 =?us-ascii?Q?kUI+Ak94pRMjg/cT8kYltaJFgv4+AW1Xs3Vq00tdLuVPqY/K1Uxr0mxc9Owk?=
 =?us-ascii?Q?1f3ukjVO434asY53hNNPeCm3WO9B/Sw0RslfDj+QSxvbo5GDWp+Kt9DB6KqO?=
 =?us-ascii?Q?q0f16nMUf1AtvLMw3nQ35nA/5neQs6P9JbuNfbXDTfj1aMtg06z0qyZN5lqX?=
 =?us-ascii?Q?FfQxo94j1CIaJGlo4W5GnFowWWYPcw/OaqAJP3LSyCbaOpp5H+ECYmtx/jfD?=
 =?us-ascii?Q?cN5cJmTjht28CmSVNKk84s9U1tckX0OMwjTTAR6J7lMJXq1VIXsHOtyIwRX1?=
 =?us-ascii?Q?zIFT6HOso0nib5jDEGpI1BxytAzehSAdQju2WuCl4WIvThsyLPdi+d2v46PM?=
 =?us-ascii?Q?Q9l6Ano/mXFxkBHEnbKY7FkeeGQdfwp9M4w2joXIuf5zZraXQttdCJdljwtX?=
 =?us-ascii?Q?x1luVdX03pliPhaSy8lWfq4xR/pJVTzEKfijs2677p9vcngxBlLRt/HHPqFG?=
 =?us-ascii?Q?WfbUqEO35jW0x4BLdK2iVxF+x1yXFCsu3g1VezhpWl99z6MZ/BzU6nI3Ogf5?=
 =?us-ascii?Q?kLJkBggc8MS+FKmmxrpXngKgzQHaNdl9J21Am8bkSB8BAAT9LA4AF3tFWv6f?=
 =?us-ascii?Q?6CNqPKR7gbONrtxtj9wD6JxSkQbqPIUYP+XeuTV5M0eQkHiPimnyhElY7ZHR?=
 =?us-ascii?Q?7//d+dIQy6YK3i6wQ25YzCXKe+vqqC5w4UQFaWuWsL83Vw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t+Ne8VUiLX5neWpjAzIvs2HglMz4G4hSkBnnirOv1sPX56mHR+laM0aBn+AS?=
 =?us-ascii?Q?Qr89E9rhCdTav0KJ+AByMJXO+irpKovbdLB5Z3Aua1zGfnDlEtrX7qoX1+VL?=
 =?us-ascii?Q?QcfWoEu0RHN7m1MYfuyfuMWnIz0aT7cVERPJbQmknIeM0phsSOCVdPYNPfEJ?=
 =?us-ascii?Q?hesrrLZzVpkB7GAA/SzlFRKCh8GXGwno0UakL0kigEwSNYXDxDL5s8IrqrW+?=
 =?us-ascii?Q?1zVkQos8MquV81ZpXhx2rH1eaTtOCWsVWIdvPFVi3hdLghp7E2oth6YDjuju?=
 =?us-ascii?Q?Pao7c88rw0G7lz5KSU9DSbvEcd8Avl9LGn04SXalE/yoes2+uFxTTKVtKK34?=
 =?us-ascii?Q?2/lc3jsur1eyXEHpCjS+y7qlbNT177H5Zi0BZZIR1KaDM8Kdqk+7w8EwTnCo?=
 =?us-ascii?Q?Fz7ahDWPPV7zsctl2N1k9W3rpLlm5U6DFN3lqYHBB4jnDzC1v2aYvr8nDJS4?=
 =?us-ascii?Q?+8MnYO2fHEu03FDmsW/Uei4InbyZgcIfVllhhuGmhACXOq+Qm8SNgvSgHeBy?=
 =?us-ascii?Q?Xv0RE/IsB+Gkm1HZwgC7aINoUe9DrIH4iK4Cz/8SsUv1UapWWi9364uvUyhi?=
 =?us-ascii?Q?l7i+ECZf/tGvJRR06nPuGYAq/n5cMIH5ASBBhQddm+mCX44V4R600H4tjL/6?=
 =?us-ascii?Q?YHwQ9wKIt1f+7sNiAicSeWRCXldWArOhkLWARx5rC2tvp9/kzxpDwvVR0Zzq?=
 =?us-ascii?Q?isTMKBxCDdwk401smQIqQR3ryKFW2XHkilTfzFn70+7lSdoYA2Y2rTjp7qMJ?=
 =?us-ascii?Q?G9tFDHQKdUgZ9ZZXlNzT95HfKlNgQGT2Wo99gsUUCVeH+CJd2pcKxxMyNr7J?=
 =?us-ascii?Q?lQi3SmJxItQ8HjAg8Vd3wcVbi8QD39yiLtA8uXkaXmrCuFgwtRWvv9iD7Z5i?=
 =?us-ascii?Q?CBL8czpjNwCuORXxvKpR1ZbWGrU7puh/yVEQmfPDPFfN4WdpvfQuZ34m8CQQ?=
 =?us-ascii?Q?5920Y1u4aLyzRGgqcNnlEhkkxXFgQDpTnuPfZ3rDk+hkUHDJQQMVH6usD1z2?=
 =?us-ascii?Q?uHPSGbU25G8qHVnqbez68wq8FzHZ9/1AjXs8ZWVF4INJJrCcy9GtNg573VMW?=
 =?us-ascii?Q?idlV7qASd5UBRVwMsCARlZMmqQoPfoEqvzGVtBQq6gTQikgKdh3gNb/3vgKI?=
 =?us-ascii?Q?NBR3ktpYuh67dHbTgWzWq7SMDR/OcTRRill18N3tAyI51q0L6bmiLM7LVFGg?=
 =?us-ascii?Q?bL4q/mvTn8y0lOzEQLbV4PT0zqViQLp7CRIffBHQMFoU7J4GQqia44qDI8Gk?=
 =?us-ascii?Q?VyGuMLyWm3c8+Ac7rpyLpEcHXu88IczVEz4WN602HnJEt8Ubt5XxyHgssEHX?=
 =?us-ascii?Q?DKgywWP5bA72p4cbcB8gzmJWuERmONlC39q7sltwhBuTXboFGslReFPdg+TY?=
 =?us-ascii?Q?UmFnn6DsJm4N+m6PGldyffIHgLA6vnVE6gTnUyS6HdYvJ3Ninv3p69RWe639?=
 =?us-ascii?Q?uZFx2vgHtu774NX5py2XBjhqI1Il8J0weUcTlJ3L/nY+oHo/1wjkVvAt2WHD?=
 =?us-ascii?Q?hjDlgf1JzUzhPLBpOxrlD8LU4jKIic4Rla7+kZKv54KegmTn4P4hwNGSsKqh?=
 =?us-ascii?Q?ly63+3EM9l6jVN/EVJhrixiifOhCW1Gbcu7llZnQBHUD4X7yl7cbRtJ4wFu+?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adb96d8-5d45-4b12-88b0-08dcc1170e08
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 12:53:14.4884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DHAXX5+Wd1MzHna2CZr6XwGkq33RZ3tnhZyLRssk8A0gMkvZMet1G7MSlrI/Ij0k+1EsNlIYGozPigSUjLZaeeY2sLF16h8c1nGXVzV5AI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8593
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

On Tue, Aug 20, 2024 at 05:53:02PM GMT, Yu Jiaoliang wrote:
>Let the kememdup_array() take care about multiplication and possible
>overflows.
>
>v2:
>- Change subject
>- Leave one blank line between the commit log and the tag section
>- Fix code alignment issue
>
>Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
>Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>index d90348c56765..0fcfd55c62b4 100644
>--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>@@ -111,9 +111,8 @@ static void wa_init_finish(struct i915_wa_list *wal)
> {
> 	/* Trim unused entries. */
> 	if (!IS_ALIGNED(wal->count, WA_LIST_CHUNK)) {
>-		struct i915_wa *list = kmemdup_array(wal->list,

					^

it was already kmemdup_array, not kmemdup. Am I missing anything?

Lucas De Marchi

>-					       wal->count, sizeof(*list),
>-					       GFP_KERNEL);
>+		struct i915_wa *list = kmemdup_array(wal->list, wal->count,
>+											 sizeof(*list), GFP_KERNEL);
>
> 		if (list) {
> 			kfree(wal->list);
>-- 
>2.34.1
>
