Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3044A90AE4D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0957610E066;
	Mon, 17 Jun 2024 12:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RoAOd/Pz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274A510E066;
 Mon, 17 Jun 2024 12:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718628917; x=1750164917;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AoetVxMWTEdfitOMfiL/kyq+mdxejxswjti+Vi9fjUo=;
 b=RoAOd/PzQBD9Gl9197EzQ0yNfczwyWmzw6Z++dtGNd23tPdb7txnEfB1
 8UH7EeoP4Hqr7b6cQmhsm4+wy5Oju1EDwE4POL4BNJ+mWDPhKd4PzK9Db
 NxYe9Usb0QwhhENZv8scCqI3tncO2tIhxz7I1ec7klg2Imv7o6A6YjC2l
 57LJHCNjJVHvyx7tDWrukkU7A5QBaE907tgHAnxk4WJD9n40fT+9wELJY
 oarec3AuhGGn2CYed0krQh+a8xqzzviWVDzMe/heSu4GZEH3nWHpekvH2
 tqurMd/pLO4+HZtX+BV70c0NQAzBBRZgUSokA543Mb/Wb5rLVgG1me1yq A==;
X-CSE-ConnectionGUID: 7wH9hxQYTkud13pJUdJLrw==
X-CSE-MsgGUID: MeMXapELQ8uJ/2X7tmvVaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="12108183"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="12108183"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 05:55:16 -0700
X-CSE-ConnectionGUID: rEb/ZgVgQ8eHJt6MLNAZhw==
X-CSE-MsgGUID: Ig1CS4fWQNmQ+7Kjwq5Wgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41871737"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 05:55:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 05:55:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 05:55:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 05:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xv21vH5tvC6NOHGZBAaUd0Men3uHuVhbpYoevlV13VKGLEaTcdUn5aMXylg8SSBvNntODe0Ce36wTVWWIEhZhgv9vo1CC9/+BBxkVsUTi5XEqMiRN3NSdp83DuKzlD3144EdsQbbzvw6qTCaY1YaXBpBvI/czFKklyEAADaakCnV45lKmAoG5vImeFy1x0j4OzgR8hJAIb0pk0Ho0z+w8dGFr69G+X9IOU09p4TLGy/VP//AcPUY+UVWze8YsSutqVItBoVlng2m9AOkxhdLcj0FMGmuJbNUxsAeDntmxmV8ozkanQRr1Gj56Q5GO9X4WOnWfQaI74lsdQ4CjRwChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gNuxUsvp8PfkiN+v9464AEYMpTJrgpCcv/a+Waov9A=;
 b=ZHHivWUmzkkOSOnSy9ffUbX69Wqi6trNNCtYtzJL9MpNOgqVVoYutzpiZ86b0QE2yZClXzRYkYFWWCQqFZEwemyP8XUUtySLjzIUZQ2eupFzp40U2Pvmgc1T+8i/5kPj5VaLwQvCx+AXPlIZpCflYmKruOzLvcz39aiBGo4ObURmum3DlN6g3IMC+iBnyJp69mAfVifQX30TWh6qTWczgw3oL7Blyf4jvGGGQqdaK5FIhFwBmoKhXPVNsnCEKRXlb36LwNqRH5yjGL3x7gCB752ECdni19uYcXwOgzRuf6jbKk9xf73RoT6hc669N/zX6pZ6BbA8cWF7032cuMewbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7525.namprd11.prod.outlook.com (2603:10b6:806:31a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 12:55:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 12:55:13 +0000
Date: Mon, 17 Jun 2024 07:55:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gem: Return -EINVAL instead of '0'
Message-ID: <3fpme67vq7nf3sswznn7un7m7p53bibfbd5ek3uknnlwkogu6a@34oufw2qwtie>
References: <20240616070349.250899-1-andi.shyti@linux.intel.com>
 <20240616070349.250899-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240616070349.250899-2-andi.shyti@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0235.namprd04.prod.outlook.com
 (2603:10b6:303:87::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 13fb2330-c6a7-432a-cf1d-08dc8eccba6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j1trV+4U8J95kuEKct5BNmuV3GI15AeGSHnUGmoquy7uxt6NsGBlKUVz2zb9?=
 =?us-ascii?Q?/c4I9gnyB+ZsKFs08qrDxofqLU2/t5RV0Cw6CtVyGqetDs3K9g1umKafoKlo?=
 =?us-ascii?Q?wZGVpobGUlbtfwh32tWXn1w4rPW6drZatNM8yHqzQs8bDHxs8igZlkO8O0WG?=
 =?us-ascii?Q?aRnudrA4HWP3votEwSiCeaVYmgHTkBxzXDtjhXtZIK3D7Ybr4024x5xh2+b0?=
 =?us-ascii?Q?YtFKyXChiOhRz7aphtUiB3Dzf/+dSnb0kp/bhhAVBcrCLHBnI1wAaSbJ4O5V?=
 =?us-ascii?Q?njxnLiJD9Et4XLEsTLdb7nPNjxm8urK/MIRm/A5dxFIC1f2wpR93uXDQYcgs?=
 =?us-ascii?Q?eLhasaChCQ1bsfgCjX4mw6bF8SB0QaHfo9NvoS2Ub5WAHWKoZGeWVGudnWoy?=
 =?us-ascii?Q?xbhqKCj57sqSas73+e8hHWlHIDB2qxJ+7qI4lG/haoZFTLG20JUxL5ViRgAh?=
 =?us-ascii?Q?k7bidKGMTnTaRon3PW4mnTS0VQE6YK4e2t6ML5Xk9JPAaOYm6uzpWA8IWafj?=
 =?us-ascii?Q?lyWBn5QMulZbyrgr++r8xaDV7iv+3EDnVOIISewXXuFBSKUCULImgHyR2kS8?=
 =?us-ascii?Q?b/gDW3igCQFt3a0TYRjJby3QxsECQ620lMwjhSEvdtcnV4JvmjlUBoHoJdUt?=
 =?us-ascii?Q?wbVqY3OhQcaAk/Qu/FFxYjn02sssZj+8fH7GSvzoY9QBDv4cKwGROGrXjcgv?=
 =?us-ascii?Q?qO8owTjDkKz/nIkB2O7D4LBfbQTJJMnMn7smD5+w8sGlqdWAoA4j070LqlAM?=
 =?us-ascii?Q?nLn+BBoRz11M8Zzj4ItWzhBCAqWREwQ/Ul+AQNYqgG2ScsGNsZ5a8uet+EeI?=
 =?us-ascii?Q?gwVXQ1JLrulF20DFJMqrrB6hl6lWRK6+AjumSrCr/EK2FbNETqBm/IGCxRi6?=
 =?us-ascii?Q?5s4z8PA7l5jpdVaInLGJFt9c95/ieJaNHFNia/ScnZ7r6GOSu+LY0ii9qNKk?=
 =?us-ascii?Q?7vrLn+CcrH5OPbcQzUHe/ao0DThpUHxoD4+A4t3u47AuIyCCs31r+8IRc+kg?=
 =?us-ascii?Q?0wFPbxX1TNSakMKKvj47jSs9yOvVj8V3IoZiqSyeumOq+oEYa5rbTN1JO+bF?=
 =?us-ascii?Q?Yik5BanXxEdEOzoGYEuRK8Za4dF5g1XbY8A/IYQ1QBIHchGYnRlQdRWKbmZ3?=
 =?us-ascii?Q?BH6OzOjntsa+RS3X35BbtlXKK2Bb7kv5tMFRY6e6qm/KsApCKDkVaAtt5FyL?=
 =?us-ascii?Q?t3BXDA434umooHP5SGSBO2Hjt+9bEG+9q6cFFFLOc2jBmSEjRKC0gTsl8Hz4?=
 =?us-ascii?Q?eJFeQ+SW5HxRiM1NgHEa572PxRkdmlh/lBbJfUToMzYjEqRMMlibuKQbHDvg?=
 =?us-ascii?Q?RKbokyPER8sh5A4uRPpTilFs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZkgyfxahjrmooP3eqz1PLjVW59waYPRzRHzAYSaXpLUZHrrWKomxe/bpAEP2?=
 =?us-ascii?Q?YWWPI/82OnLXq3Nu5SoSuiadVpWSCCiA2ltyuCosXAHTzMOjmTrIyhjvJqR8?=
 =?us-ascii?Q?zyQ+hextGUdoMANxJFhqJt93eutpahJDLHJz85A/xGyuq4VYtaFc5zcc9HIU?=
 =?us-ascii?Q?9PA0+VlDo+mfUpgaH+6Pg9dW/jglxibkJt38lU1u6EfbKjbTU13ED5Xqkubt?=
 =?us-ascii?Q?w+PQJW5r6ffdpoz1Tvl7UtMNtuaU2gwmdW58PhYupUzYv7of1CYvO14HFzqC?=
 =?us-ascii?Q?TmOrEA7PoPYOsLE1YV0YJ+MD1Nr/WH6AmBW/u23kvigGM6laKMk4Yso9EkuR?=
 =?us-ascii?Q?IdHfYkuBwoEtzy+FhXutxydSZIY9TKIA5jdumolHV0SNIJeGwOCbRZ0y85n+?=
 =?us-ascii?Q?RMeLLrgRVLpm6U71AJCgTYjtWnD0zf6phgcjqd75v4RH7lcE3Gw2woqm8ZR8?=
 =?us-ascii?Q?J/LgtAx3QfH3iSaYAO+09aIY93YmDfU+DIdkfpAyU0JrJg0Zho/JWhwr9O9t?=
 =?us-ascii?Q?z797O77KIP2lNeHdbTxVYU/HYWdnEILHx+klvpSZTRvVoiFw2id1d/UbMiLs?=
 =?us-ascii?Q?n5FC0/z/INDxJhVN43qYCpd3FIymxDi90+okE4x6SqNttBJfGpXSNjJ6vNxy?=
 =?us-ascii?Q?Utfe4jE5p0mIGNU1DqSsqOnGJWIfX/sVHrybN2MHOudCESyBzlHz+jP/0L6l?=
 =?us-ascii?Q?unU1/aBQwfX6eUH0fYzqOEB+XYvM9FQzuzhh8opwoVP3M9b6/LFGgCXKi/4h?=
 =?us-ascii?Q?z+VccTgE7kqWHgZdG0Lvp0SX81TvQ1b61RNttzxlKlC8Z5AsDkFhAJxebYQz?=
 =?us-ascii?Q?r8V5j//7QuVvX85msyjyO6u1Usp1BlAptmvTCxhSjSXJKZkb0GomKsw3xMwU?=
 =?us-ascii?Q?/M4Lf/7LFyMZA8YkexQyTW/j39GyiA0QhwXwNCdm6K9xgkicCW3o2aHYRe+r?=
 =?us-ascii?Q?kbxqTlktLAL5rfR8jJEvVfh3ryVz1QR9+2qG3d+tEyuT1j+dxFySIsRnGMWe?=
 =?us-ascii?Q?WIdXPkyKSys4ivwUG1oPIg3o19HE4jC5GQRvQ2eUp8RXh1JIgOVVKVFRSuTr?=
 =?us-ascii?Q?1M3PtYDZqQdepfF5Cm5zSUVMAlsqaWng8fP/kJ2o8Rw7mKtKERAG6kgi4EQg?=
 =?us-ascii?Q?xbVH4nM11GMeLZkyhT/5so7qGZ7FzvMdlibzBKMgPupVBq/p2i5hUDmuaJzr?=
 =?us-ascii?Q?KpdmBZOOTobNdB4OTwCsh808QsqbEnEauRgjEC8j+mJsj4+Jci6sUjRKnmEN?=
 =?us-ascii?Q?eZUrnklLyBnJ3debHzxY6Vcxd2nfPfUbP+5TtUVkOooYcscmN5kXs7hUnUHQ?=
 =?us-ascii?Q?uYm7A/xuOYt4Lvkc3C+HyAVHhLxxYmM73NEhHeGqJFU661nksi+rIQOTlQk2?=
 =?us-ascii?Q?byBYJJWvYX1BqELb4V5ZhQv82xN1hx5cYmUOLeMnZMYySFBwaKR/mlkJU3Mx?=
 =?us-ascii?Q?SRveDxtE2yDliFZnRz8ehbtj+oGq98aypuHGHCo8AmB4OQwPeN7g/+fVcBc0?=
 =?us-ascii?Q?RclaifN17LucKVHy4JW/0RbwRjDRW/uWIIS/XnzYOy7GohW95c4v8vz1U/ql?=
 =?us-ascii?Q?hFbBRGMPXtUyf4idEU90/CW1UDmk8uRmzZcZiyKXEkdBDgibT/fbOBPpaNYm?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fb2330-c6a7-432a-cf1d-08dc8eccba6f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 12:55:13.4930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNtWlmpdsRMN+D04SY5QpYB/L0MFiYSpduoKiIUPC+LHP++/rp+j5uplyibHdRWF6+hpJC8yC8jL2HnHmTcxaSnTcDHpXdYeYsqLrcD/j6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7525
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

On Sun, Jun 16, 2024 at 09:03:48AM GMT, Andi Shyti wrote:
>Commit 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup
>warning") returns '0' from i915_gem_stolen_lmem_setup(), but it's
>supposed to return a pointer to the intel_memory_region
>structure.
>
>Sparse complains with the following message:
>
>>> drivers/gpu/drm/i915/gem/i915_gem_stolen.c:943:32: sparse: sparse:
>   Using plain integer as NULL pointer
>
>The caller checks for errors, and if no error is returned, it
>stores the address of the stolen memory. Therefore, we can't
>return NULL. Since we are handling a case of out-of-bounds, it's
>appropriate to treat the "lmem_size < dsm_base" case as an error.

which completely invalidates the point of the commit that introduced this
regression. That was commit was supposed to do "let's continue, just
disabling stolen".  Apparently we should just revert that patch instead
since it introduced 2 new issues and didn't solve what it was supposed
to... for probe failures, we are completely fine leaving the warning
there.


Lucas De Marchi

>
>Return -EINVAL embedded in a pointer instead of '0' (or NULL).
>
>This way, we avoid a potential NULL pointer dereference.
>
>Since we are returning an error, it makes sense to print an error
>message with drm_err() instead of a debug message using
>drm_dbg().
>
>Fixes: 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup warning")
>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>index 004471f60117..bd774ce713cf 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>@@ -937,10 +937,10 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
> 		/* Use DSM base address instead for stolen memory */
> 		dsm_base = intel_uncore_read64(uncore, GEN6_DSMBASE) & GEN11_BDSM_MASK;
> 		if (lmem_size < dsm_base) {
>-			drm_dbg(&i915->drm,
>+			drm_err(&i915->drm,
> 				"Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
> 				lmem_size, dsm_base);
>-			return 0;
>+			return ERR_PTR(-EINVAL);
> 		}
> 		dsm_size = ALIGN_DOWN(lmem_size - dsm_base, SZ_1M);
> 	}
>-- 
>2.45.1
>
