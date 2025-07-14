Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD65B04263
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD0310E49A;
	Mon, 14 Jul 2025 15:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1GOW6oa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FCF10E49A;
 Mon, 14 Jul 2025 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752505242; x=1784041242;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5TQxQgoMgS+EZwWgVm9AGPnVw8zIHNqrO2xcIcBTVH8=;
 b=k1GOW6oaeGqxLRnkwImq7q2XAaTOUMWPqqnWnbU2LIKQgk17xQsYdrGg
 2pVYMm2C8bDS//wGy4Cv9TZe2IhV1wb89YsZitk/Y1tmWpJeg5+Jb3bpy
 rOCfajbVyRTB9+PR8zdtsxORLYKxyetCxSWlYIZuc5S0D1rAX5G0B9FL6
 IWNLMOS1T000fuCTH31kYYL4cGbvLVYNVXOmi9bw/ymKWDAD0UdTd5szM
 VWQFgcYawgFSBLN5hwN8DxNi3a5Wq8Gf6DrHNvfBpcnqIVfOuxDGSqAw9
 OuzYovGdxiLI1yMv1CYiIhkmktYaLjTC7Q7U3MybE8iT/kxou7v7ZX/ck A==;
X-CSE-ConnectionGUID: UAIlCT9YRSmAXaZGmcPhpQ==
X-CSE-MsgGUID: bs0+LBkrTzm0Es7r8inEMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72277464"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="72277464"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:00:40 -0700
X-CSE-ConnectionGUID: R1TauKQ6S0+ieG1UiOR+jw==
X-CSE-MsgGUID: +E4E9zcxQJ24CmkfyD//7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161277240"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:00:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:00:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 08:00:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.40)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:00:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g092Yhb8yfDHirOearwO6iAotIx4aIg4JqL00pM6aNyaTAwlgHqR4zbVsf7tgRM6wVEPf63taQwyJO/tbXoZl5y3CfRfV2T7hpuncbPlxUqS6rzzeBWsSySc9OEkigdEVj+7/8pwTiJSTuiY4A0x8l42ywdFEQlf12S+FE8jdBMsrAqwPpl+uZLH/hP2qZfbPCLKAZEjF6Gp+6KidpRBMypIdumo3PLbdTb0oJJcCbNBbdZnfCfyzt6AP4gUnNyUb5PxXABGSksnf9vz47rE0LkzZ8uCceTftY7DjFbRSY1S4nNKqOS9kaO13dEfb9e1MZvVRignbjdgTs7XA6hY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njwwVxuRHdpQOR2Q/VIznv5KtVm2bpgL2EERaikleEI=;
 b=OitnQsqD+0fjwO6jST7uNzD/N+HNwQtDu7QVnApTwCY0L9ia5ZXw1OIYfWGk4zdwSE3vu9GtJ01E7/QxW+UFBprXRK34vi3Fb/VXf3Nhw7/tn7kZG7cX6R5Q+5rpD/xMZT6XqHdBEhOKJnFS7K7jHDyDTjOTBnyFRMEsJ+0owRbQCZ2EnaylWzpEo5hWct3sNxcUTLrHETNwKolpRp01FIsa3xHnSFUYZzMG1XP7QBorTE2OR2X+4qwe+QBNFeN0EqcCSyrZVecBnDxzIW5TFzcs5iU0YIM3/nAdEaDUeXpMv6jst1DiGJeooIpvp8LBlLkw8Z8X7owlmhh8wBzWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5091.namprd11.prod.outlook.com (2603:10b6:303:6c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 15:00:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 15:00:35 +0000
Date: Mon, 14 Jul 2025 10:00:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <linux@treblig.org>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Remove unused functions
Message-ID: <3epsz2otgzlruqkehslyji23xxjhxp6srkvtv3w4pgdftr57eo@os4np6enqtrx>
References: <20250713152531.219326-1-linux@treblig.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250713152531.219326-1-linux@treblig.org>
X-ClientProxiedBy: SJ0PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d3af01e-1fb4-4f3a-d8e0-08ddc2e72fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c4MwZY3rrlOKwZH6YwRHgt1J0CLRjg96+CG6LKxPONshx83oyh16YeJ/r3vW?=
 =?us-ascii?Q?/FTelGOCocijYDqGeljNPdeN85UTg0MXD66i7CT1IoOQrNaM+gntNL3NC+U9?=
 =?us-ascii?Q?lvXuj3N0dYuvOr7Ju05KcSZsB6DJxm6kciRpLAcjPFZzKvZ85mjPtLRBqLIS?=
 =?us-ascii?Q?v5gNRaW3tctagTs04UBa5UWl7SXNI70rr8SSIEmCjjkWL7sQnp+MSNTtxmut?=
 =?us-ascii?Q?S5pke0GdEkxd/KccGzmIEG3Ar0GZvgRADkxZBAveT4OV6PZ2/ocVzS6DPfKv?=
 =?us-ascii?Q?f783OOUMDMVy6rU9u00rF+Zg0FmBxUCpSJSs3Kx/IKtnpCSDFTPRkh+MZ/3l?=
 =?us-ascii?Q?cMhnjxEUUrDx0//NAlLFuoQ63q7xk54+7WiboR7whw0TBGVHY5XqnUID2Q/y?=
 =?us-ascii?Q?Z3XpKfp5OLZUJf7pRIEr3sBo105Ghcyf+RdSiTQcEg7PO/3p1hQYz01FAaNC?=
 =?us-ascii?Q?Rr4nPlmwrmrf2m4+KDdkXi+zRJNL8bIPJ2lzzeKYEPQl7aBWNdEKxBhzd8Qw?=
 =?us-ascii?Q?3xqMtjxpS3GnF3hEl1Cl/G4T1cJnmZthGwiWhydMKiSbmxIE1XewSXyP5dfg?=
 =?us-ascii?Q?NUnKXfXgMr58LkyGl/5Crgidyfq7nNhWkM+XX4biMASb9dPbGsE6rnvy9NeJ?=
 =?us-ascii?Q?cUkpqMsNdOiAOEJCEIYKuzX5KewDHHQPeRcl4TMvWRO9k1EAahvZoWMvVy4I?=
 =?us-ascii?Q?T7oHZjaoVkgzCS8uyyTdzC503HTsdoyLmKVIfpKvrkFOD/BB/LlQ7WkAkF0h?=
 =?us-ascii?Q?cL0kr1C+1SbTocfltgQRe871/vMmTbfgu10n/4Z0SjzdvhHzwvphGkugKV16?=
 =?us-ascii?Q?wQf+ch1vMKpfPafamsYUaWfn5CqCqm8UyE7fVHM61u988SztiAlmcwRmbjzJ?=
 =?us-ascii?Q?SOh3R0yMtMQ6bXMdkiXR+7VpP4yghMOili8ji+rewuz4xfANnCCVRLdiG3t9?=
 =?us-ascii?Q?yFc/Asc2cebiHfWbwUYFLapxXzkUWBtb8IcrQqnRJKKNXBGB65zyZrJNoYpb?=
 =?us-ascii?Q?B87Q/x+3T4cHSY244Uh7cxBV6pUdCnnPNT6+hmeJ3UrNxmsUNeAT13GNJsTZ?=
 =?us-ascii?Q?8+99wHxOVvMi760zxQY2eT1lPXFaDIyt0InPKf+XNDEOOBadfvrFPcxsM5oT?=
 =?us-ascii?Q?aRm2ZSu9iIKRXSXUfwJLFWI2qPYCYR+XMJktrPwj+NjUf/dA/nVc25Cy1KBH?=
 =?us-ascii?Q?PPYd1e/Kmf3FCDY9mbmknWKnKdYixchCZzO6ruSw/CrVNDMG9c7aCnFtbYVm?=
 =?us-ascii?Q?8Lx3TpsZ5QfbMgPvrNNojcdz6FwvteQUyYYs46RbuYYXgI57nm3pfAouNlpe?=
 =?us-ascii?Q?jWqmcz992dUCTTbqpsQbifasoLvfhcAb+PpLC3DCJaOHGu8WPZlwSU2wevrY?=
 =?us-ascii?Q?cNFOGZs55xb6lI7unXPAuqn5TujvkCBBdsnwuvItB++IMeRXIaQMB003qlk8?=
 =?us-ascii?Q?kA4CZA7/yEA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LPfwx2FnyL9E8HrmultjHRQR69INAVKURw1ixM7awSOOT39l2pNf6sJB1F25?=
 =?us-ascii?Q?M7UeLuBRDBOZFVimpTF/2rnRe8pEbaY/9HzrZ1Q6tsprFdJ7B9WIisQS8C1W?=
 =?us-ascii?Q?UMFb8g4ONEOU4NI0cD8F8/zqBPnMrXjGOd2ZUpXPVtoK4twDr+fDT/NAY9ak?=
 =?us-ascii?Q?jUCtyYHr1//CEdPMwhXvqsdyvzO6z3V+52T5jaqHp0+yzXgGPsWD3rvWjAmc?=
 =?us-ascii?Q?sjk+IEEDvcBfujcohim2TQtFp4ZVr9AEo1RRxKN1Os83U7ceTXXDBW/vZStB?=
 =?us-ascii?Q?+pMgg/34oXcgci0njX1BT0bZsXWTQloatzhHuH8ablZkMG4vtcDyRqXUqne1?=
 =?us-ascii?Q?Zfo/6oJGE1q0SweyyRBu6r9MdRbdYUPZBLQKC92QQvIOP74gHXcW0rqTWHCp?=
 =?us-ascii?Q?iKeJZCZY84EmUVaFJwD4p76i/ppoJyQprmfWok532uWGWXP8rMrYzSKWaKVF?=
 =?us-ascii?Q?grLcLibJLxKNBpJqeCFuU3GbbuIG/zBZJeLYCuwe0+UrDgRXRsd6jkIg22Ou?=
 =?us-ascii?Q?WJ2F/tTVxcX/xe4i8KglWydbT3n/tYM3Vnt3BTHylyBEz5s4X8A0uncer9Cr?=
 =?us-ascii?Q?rWBieH4zQR5DMm/th/qwqvRxfDnmsjq7+m3Cim+GrwdaPHleFNlwshNaWQpK?=
 =?us-ascii?Q?ETqO3IL0QZFuwcIzeOt9acy6inOZX8hyt63iQgGlbJ2w8lmrhnv/HBz9N2/U?=
 =?us-ascii?Q?lrQkqwXcJzLU973bYWRJMhk69sHCiT3wHoenZUK9neyUqNbUXcddtQjqA5lb?=
 =?us-ascii?Q?VvBzWKgAO/cpmKV3A1wxTFjdVWvvnonMQvmFUnXOHVngDY3FGKmSqDuKk8ah?=
 =?us-ascii?Q?Inogpe2b3UY6stihRtCHrZ6p0olF/+DFs3vxwRu3CwjKZg4VbwQD+Y/MnjCK?=
 =?us-ascii?Q?s/olZDVKBW1LTntOqxCMlvIa9hKmxiFbHRWDYePYIz/2lTKon490pJg2m7yJ?=
 =?us-ascii?Q?dooF9aONgI8oOeEoWtxaYnL/zpYnQ8ve5Q3n5YNvuttS1Rl8S/K/ux8XBbVr?=
 =?us-ascii?Q?GIlZGez0Y+vuc7ki25daXfv9KEJd8MPlhjW3KzA64azLhMCn9/gfsFPzY7N7?=
 =?us-ascii?Q?F8sVmtm7+3zex31aGNv9Nuxc5YxJBjcO+/mAV0QoamlnK50BBE8qYdIAsKj4?=
 =?us-ascii?Q?rHko64eYNOVqHKAFFgQioFwtxZeinlWKZRsUOVNYz+uMXGaLwKQZvTr/4taM?=
 =?us-ascii?Q?Hj0Atcnggoyv7OBKqcr2Ks8zKMMxfnBSUCBsFet1H/f5kpW8mZQCdYbUFfpe?=
 =?us-ascii?Q?yTnxVkAsqPoBJqWNiJhq9YYNPq/AyM4QQJBg/OO0vqatspcAYkr7LFzOjin+?=
 =?us-ascii?Q?RF6Tj0jf/EEuDfz96DAYxhJmeflw4gLnmQvGFGHlVy3mxRb5Ul7L50ZJuoSt?=
 =?us-ascii?Q?HNPN5hthqCtaD5tR8VSS0yrzGVrXo2aqbJMh2ueXdvr46pdtxUv3Ay0k/iKh?=
 =?us-ascii?Q?j9yvGjac/IV5ibpkmPfmez731cBJUNmMaqzADn6BFrXekEghUqbMwAi8pqxa?=
 =?us-ascii?Q?nM4XMKt8fg7DRa281V4j2B/rOWEyc5cQGX2ehrq2xKoFeUxp+PPxW3H1ziNW?=
 =?us-ascii?Q?7U5ITQrOJRIZtWcoIvhoobDqf59E4Oeu+wgttocQnnzJi17Albx9oy54nszT?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3af01e-1fb4-4f3a-d8e0-08ddc2e72fbe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 15:00:35.2646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtyoNQ7kLt8Ccz1IR+lCIF+cpMo6wVpNffvnSGcixKq08ECdKNSMP9PP0vH4KEkCcvffkBxGOXamaqcUSnKE3MQpjZIR/pHkLFQ2u9SaETA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5091
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

On Sun, Jul 13, 2025 at 04:25:31PM +0100, linux@treblig.org wrote:
>From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
>xe_bo_create_from_data() last use was removed in 2023 by
>commit 0e1a47fcabc8 ("drm/xe: Add a helper for DRM device-lifetime BO
>create")
>
>xe_rtp_match_first_gslice_fused_off() last use was removed in 2023 by
>commit 4e124151fcfc ("drm/xe/dg2: Drop pre-production workarounds")
>
>Remove them, and xe_dss_mask_empty whose last use was by
>xe_rtp_match_first_gslice_fused_off().
>
>(Xe has a bunch ofother symbols that have been added but not used,
>given how new it is, I've left those, as opposed to these that
>had the code that used them removed).
>
>Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Applied to drm-xe-next!

[1/1] drm/xe: Remove unused functions
       commit: 8f3d1c9fb04e2ae018d06b4cacc49e146120facc


thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_bo.c          | 15 ---------------
> drivers/gpu/drm/xe/xe_bo.h          |  3 ---
> drivers/gpu/drm/xe/xe_gt_topology.c |  5 -----
> drivers/gpu/drm/xe/xe_gt_topology.h |  2 --
> drivers/gpu/drm/xe/xe_rtp.c         | 15 ---------------
> drivers/gpu/drm/xe/xe_rtp.h         | 11 -----------
> 6 files changed, 51 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 7aa2c17825da..6bd1287869b4 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -2156,21 +2156,6 @@ struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
> 	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull, type, flags);
> }
>
>-struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>-				     const void *data, size_t size,
>-				     enum ttm_bo_type type, u32 flags)
>-{
>-	struct xe_bo *bo = xe_bo_create_pin_map(xe, tile, NULL,
>-						ALIGN(size, PAGE_SIZE),
>-						type, flags);
>-	if (IS_ERR(bo))
>-		return bo;
>-
>-	xe_map_memcpy_to(xe, &bo->vmap, 0, data, size);
>-
>-	return bo;
>-}
>-
> static void __xe_bo_unpin_map_no_vm(void *arg)
> {
> 	xe_bo_unpin_map_no_vm(arg);
>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>index 02ada1fb8a23..89b6e1487971 100644
>--- a/drivers/gpu/drm/xe/xe_bo.h
>+++ b/drivers/gpu/drm/xe/xe_bo.h
>@@ -118,9 +118,6 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> 					      size_t size, u64 offset,
> 					      enum ttm_bo_type type, u32 flags,
> 					      u64 alignment);
>-struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>-				     const void *data, size_t size,
>-				     enum ttm_bo_type type, u32 flags);
> struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
> 					   size_t size, u32 flags);
> struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>index 516c81e3b8dd..b325eb9d3890 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -288,11 +288,6 @@ xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
> 	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
> }
>
>-bool xe_dss_mask_empty(const xe_dss_mask_t mask)
>-{
>-	return bitmap_empty(mask, XE_MAX_DSS_FUSE_BITS);
>-}
>-
> /**
>  * xe_gt_topology_has_dss_in_quadrant - check fusing of DSS in GT quadrant
>  * @gt: GT to check
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
>index a72d26ba0653..c8140704ad4c 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.h
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
>@@ -41,8 +41,6 @@ xe_gt_topology_mask_last_dss(const xe_dss_mask_t mask)
> unsigned int
> xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
>
>-bool xe_dss_mask_empty(const xe_dss_mask_t mask);
>-
> bool
> xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 29e694bb1219..cc6636f6cd98 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -326,21 +326,6 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
> 		hwe->engine_id == __ffs(render_compute_mask);
> }
>
>-bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>-					 const struct xe_hw_engine *hwe)
>-{
>-	unsigned int dss_per_gslice = 4;
>-	unsigned int dss;
>-
>-	if (drm_WARN(&gt_to_xe(gt)->drm, xe_dss_mask_empty(gt->fuse_topo.g_dss_mask),
>-		     "Checking gslice for platform without geometry pipeline\n"))
>-		return false;
>-
>-	dss = xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0);
>-
>-	return dss >= dss_per_gslice;
>-}
>-
> bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
> 			       const struct xe_hw_engine *hwe)
> {
>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>index 4fe736a11c42..86a3f1e4b3dc 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.h
>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>@@ -465,17 +465,6 @@ bool xe_rtp_match_even_instance(const struct xe_gt *gt,
> bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
> 					  const struct xe_hw_engine *hwe);
>
>-/*
>- * xe_rtp_match_first_gslice_fused_off - Match when first gslice is fused off
>- *
>- * @gt: GT structure
>- * @hwe: Engine instance
>- *
>- * Returns: true if first gslice is fused off, false otherwise.
>- */
>-bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>-					 const struct xe_hw_engine *hwe);
>-
> /*
>  * xe_rtp_match_not_sriov_vf - Match when not on SR-IOV VF device
>  *
>-- 
>2.50.1
>
