Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D8787ABEC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 17:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A37A10E60D;
	Wed, 13 Mar 2024 16:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGf7yvsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84A410E2DE;
 Wed, 13 Mar 2024 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710348770; x=1741884770;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mhqmJULT06HyRS+Qji3wgupSDPf4s2stGcADCCBxHSg=;
 b=gGf7yvsb8xYYtQrnWUyy1f2l9eJYqivKi1xzteJyKYWzQBj5l0QzhsgY
 WfRGegFHlZUBMTrUvFHAND7YK++xdbHfQTutlMaBPWLTFHVVCHiEtGAyg
 34YMUKzqktqJZ2mqLVoBA51ZunTvemUWI5FTBHnQ19bnACt9o3lHSOQTA
 O6keun96147Kbc1fB8+sjY51fdMV/ZFqt6zvnI16IeWEZUfEuJIFdbMQV
 pecpSJ7ULJE81VB0XPIGUq36kuZ48fdZ141ClmgYoakNDsMkWcD7TcCk+
 Bf5I4weXAUzrOIXDBqhR53+8kyMd5v84sfZkBnNJsIoD7sr2Vw+2tone8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="22583147"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="22583147"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 09:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="12010637"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 09:52:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 09:52:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 09:52:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 09:52:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 09:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUjL3VFGc8hcPwOAL/sthpnFoxULk3KOlNl09vkvuZsOnWKtgY8A/i/FR/yDRo+8KufFt35CmuFxlZg7whWC47HH2ANXf++DemrBePO2U3OS9LuP82idd4pczw1L5xizO4KzNmcrBk1pDYTkFfJVvWMcEKqD42qPKYlFSl/XG+4M3Q/ti7n2c14hpKz0KHMt8Z+vw5QftAqq1mqqws+hCtp4COW7qpJR1LzEI1X8ASkvJgiafx6Rp/DmlqaiUzxtLJSfss6Q8m1xTUN9ZeudrdfoYKYPMSWqEa+xTRCMOlsEeZb6rKOJfrkMXoXGxO8fsCi9lspyu8QiMJJ+MxcW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8ejw7BDdgLhPqQ9WYkBCRkdBG+wRscD/0qIeEphcEA=;
 b=nwIEBGyQhLPcjpmAXMJc+sMmFCIUGSY6eHVKtx0Tj2jpxtvdGDReLigaMQhaHlPR1Onpd5nNvB1YtxR8wJAueJwIKELnSfnme/km3uObzad8z+l1zaLW+C08Mh4NcNalNX12jG4ADyS1AAPcqGyFqemWFjHmwrVjsOkLXwjpBZbIRSsqy8wbBSzcuxub5JcEQ9IU90e7Dm+aTUsOjnTR0xptBOVgI/uLi63YlyBmL9OnFnBM9SyQ7/ofTHinjyQsbhNdO/yKe/Ivnju1ILH/jeG7DjEk1IBQVjFpa4QYSYX2+HY0BoSGUBo9cpWKvg7ZNKwpEc3m9tUVnxRdpXi2Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7637.namprd11.prod.outlook.com (2603:10b6:806:340::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Wed, 13 Mar
 2024 16:52:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 16:52:45 +0000
Date: Wed, 13 Mar 2024 09:52:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nikita Kiryushin <kiryushin@ancud.ru>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>, Shekhar Chauhan <shekhar.chauhan@intel.com>, 
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/i915: remove platform checks in platform-specific
 handlers
Message-ID: <20240313165242.GP718896@mdroper-desk1.amr.corp.intel.com>
References: <>
 <2931c3e3-054d-4085-9bd9-3b8414788675@ancud.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2931c3e3-054d-4085-9bd9-3b8414788675@ancud.ru>
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: eb373b53-e9c9-4be1-1ab7-08dc437e01d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mu8LnW2q9aPiRTlqb+ERJy1l1W70T2ZOedb/a7cS32Oso/ePfJnUG18UkuofPUhv5knW3U6qcNDznFewmhvyDkvY6Z8YYaw8BceRiMLyi9Z0Ku7PpyPMBrK94rpzrWg9W3cjDP0yPUuRpihPmSySarYIciKtg1prFgTnVBoUZoRJeUKBxNQHfXY5+7GyYsDd2YhacroKKz6cVnHbOAVpqKpTbGfq/VtyZM0P8EOvQmxQO7FuLz1AMwJFoGmwlrmnMwl94IPgwS8y9ejP2GKIaB3FvlVTVhhyONS2JcEnVZntejXXtFR3tXTyK408q/KT7KadlzJEXZHdsTiEW0gvIgrwujNxKa1zHyJ3J0vejX4mlvWhe0mTbDkxrLltDZqOP8LiSEZEbXpy0yoTgZnzFH5UIPt7TKigfKxFawyKKbanEEPE42w+gQ2tYwhbECrIqOmmKF+P4Mj7gx/r+ICCVIqApRJEdlNc8DOemI7Q/qdxUgqWHc2auRgGdi7XhJ9NVBHqp8IWc6sZ6DCIxCPXPZC7f8fUInrUgWsYffZ1K76+kG07m74LEouZvQVLGBR64MV+AoZz3/t0iVQ7W9WNgTE7/UKKv6MdEyM5a463Ur662XJH/03DYqLC8+tGdzhXRMo+NzQNpfAbuK+j8PPI0Fr6gy7r0YdAFd7EJXGP3WA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cpnR+PwKnn7UmepRfXPPwrtlyTICIcbJdsf/GEG3rOlsWArxt/M1VCVjL1ev?=
 =?us-ascii?Q?W/Jre8tBqFZ2mC9cJ5speIpvgACGYmkYhv9eyOueYC08I1VHWQJ9OlcGu70a?=
 =?us-ascii?Q?OJT0IHQgEQxdoMaJI3+FOVg2hGsDiEnbDCb/P5nIAYKCdnQXcbc/CXaFBSRY?=
 =?us-ascii?Q?d7rlGO7nCwoIYcjDMcGyB+xvvXYRbW8Qnozu98bKgxZbFXnY31bxxcGA2t5j?=
 =?us-ascii?Q?KyTexXl3zuAXVcfs+lg+FhiGHBg26fNGGo4TpsMDyvHiuJDriVsauPaXjVYH?=
 =?us-ascii?Q?JdhyJJlnc0+bUp0nBN7Fr0n/3PZRRErYUL+iMRNszylyRVC9JSDRscKWzYnT?=
 =?us-ascii?Q?YFO/n2u4w4GPKOqL3tuLE++DlMSu9RZUOOvz1yZmY5ekmlgh+ZMsFU28aZiq?=
 =?us-ascii?Q?w7j25LnlO6+d9mCgY2ylT67pSglSlv2E95EObuwWw47k+4uQAzFNuIxiKCf9?=
 =?us-ascii?Q?V6IVlXTj7kPtEc4ym2pdkJDrCUTOtjtr0zlSR4t4wpsqYtl9jaRtgrKEketT?=
 =?us-ascii?Q?kxT9o+YOD13tyUDM51QTa8g4Isk3wFng0gbuK9VZfgSDqPx6ocFNV97FZ4KI?=
 =?us-ascii?Q?JF3llOInSOS+0amclDRq4cO9e74Rx11+591E/lO4ljF4QxokTCJSYPjJsVpq?=
 =?us-ascii?Q?LAPkG6mwBBfM2wsSckD668Tqs1cvz2NdbCBXx4ZDSljH2OXOnnAoMehJEKo8?=
 =?us-ascii?Q?ZVjVd+rijBOXToFnvpvQaISHxmMXNpma6Hvn36jBSw8iKbxiH3TNlJmibw9s?=
 =?us-ascii?Q?uPX0DpEkGAC87SN5z7c+qfLlUU9an2FZmwZF+h7gc1TotcpZXuogFeZwXDBS?=
 =?us-ascii?Q?hDS16HRpui0regATXv4oBVDIlYG9sU0zUsWKGzKDQFz80gWUhBZy5xi+qcW2?=
 =?us-ascii?Q?BCYxrtnA07i+NYyx4k9JkJ3NGt5HavDY17wXyo6elYAepzkUFYAgDSWs7UdH?=
 =?us-ascii?Q?6EFwyG0VvrQcPfks05EWjx2sP6WTC96a0yzBvJcnKad12WniS+bMuNtc1MqQ?=
 =?us-ascii?Q?tO9pNrqOuduq/inWFzHmbbYfY7eqmBAARnnc0X5uA/66kM4sTZLEg3fc67Tm?=
 =?us-ascii?Q?aLpI3J0cxkyoDdcDuHjW2eXEp5MaOVv0SXtyAbRoWP6jSMH1b/2ZYiMt23ZU?=
 =?us-ascii?Q?EO8WLdTvmNoYxJnZ9bsmfyG47m+SwuG6qIOq5bo5vrRD+Fqet7qdoyn1IPEy?=
 =?us-ascii?Q?G6oRw+j4+ZTVxvXSfFet0fRCUW8kUwT2KjAVkbIgUuM/Mmvho2kE4eTzvJuR?=
 =?us-ascii?Q?TXnDcYFxKLjnkJM6emwoxNi4BH01v/W8D65f2REEAX6m7LhJIJ8HAMK8qVKn?=
 =?us-ascii?Q?GwsO0aW7nt9K4IUs59mOF+44JQczUUFsw7FWE0tpJH+rdo98zSXEPvlw851v?=
 =?us-ascii?Q?G689BKCwS0LeKAZzLekkgdghijNXcJVVOZML3eDvXix4U1cmYMaQyDvy1wva?=
 =?us-ascii?Q?B9FFv1JjU/Gn8eCfRLjNXrwzJhpJkqAc7dCVAqVidsTahty4Gtu2eIAujHOZ?=
 =?us-ascii?Q?z8EMEyNGT1QOWWqK5Sia51IYw1e3HXAlTDA5cNFohCHF/N2gCeGsoMKe4suO?=
 =?us-ascii?Q?tnA3SWpRuysgq4ASXMcMksGSEpxQc1K3MXpzWItveGmQed2XkA3nLVo6jnzN?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb373b53-e9c9-4be1-1ab7-08dc437e01d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 16:52:45.6901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11Ty+jl5tq/iJV2Itot3gRdWoNQDIYpUU5U0CsP5I3WCSaYECLTrShZCVp67zuNauLYJNskgIzWs3358JwGmRcncS6jRbwf2VfDzx58Rw3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7637
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

On Wed, Mar 13, 2024 at 07:27:36PM +0300, Nikita Kiryushin wrote:
> 
> Remove IS_KABYLAKE and IS_SKYLAKE in special handlers for
> skylake and kabylake: the checks are done at hook initialization and are
> always true in corresponding handlers.
> 
> Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 6 +++---
>  drivers/gpu/drm/i915/intel_clock_gating.c   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 3eacbc50caf8..8eff6be9d74c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -601,7 +601,7 @@ static void kbl_ctx_workarounds_init(struct
> intel_engine_cs *engine,
>  	gen9_ctx_workarounds_init(engine, wal);
>   	/* WaToEnableHwFixForPushConstHWBug:kbl */
> -	if (IS_KABYLAKE(i915) && IS_GRAPHICS_STEP(i915, STEP_C0, STEP_FOREVER))
> +	if (IS_GRAPHICS_STEP(i915, STEP_C0, STEP_FOREVER))
>  		wa_masked_en(wal, COMMON_SLICE_CHICKEN2,
>  			     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
>  @@ -1169,7 +1169,7 @@ skl_gt_workarounds_init(struct intel_gt *gt, struct
> i915_wa_list *wal)
>  		    GEN8_EU_GAUNIT_CLOCK_GATE_DISABLE);
>   	/* WaInPlaceDecompressionHang:skl */
> -	if (IS_SKYLAKE(gt->i915) && IS_GRAPHICS_STEP(gt->i915, STEP_A0, STEP_H0))
> +	if (IS_GRAPHICS_STEP(gt->i915, STEP_A0, STEP_H0))
>  		wa_write_or(wal,
>  			    GEN9_GAMT_ECO_REG_RW_IA,
>  			    GAMT_ECO_ENABLE_IN_PLACE_DECOMPRESS);
> @@ -1181,7 +1181,7 @@ kbl_gt_workarounds_init(struct intel_gt *gt, struct
> i915_wa_list *wal)
>  	gen9_gt_workarounds_init(gt, wal);
>   	/* WaDisableDynamicCreditSharing:kbl */
> -	if (IS_KABYLAKE(gt->i915) && IS_GRAPHICS_STEP(gt->i915, 0, STEP_C0))
> +	if (IS_GRAPHICS_STEP(gt->i915, 0, STEP_C0))
>  		wa_write_or(wal,
>  			    GAMT_CHKN_BIT_REG,
>  			    GAMT_CHKN_DISABLE_DYNAMIC_CREDIT_SHARING);
> diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c
> b/drivers/gpu/drm/i915/intel_clock_gating.c
> index 9c21ce69bd98..977251bcbf42 100644
> --- a/drivers/gpu/drm/i915/intel_clock_gating.c
> +++ b/drivers/gpu/drm/i915/intel_clock_gating.c
> @@ -413,12 +413,12 @@ static void kbl_init_clock_gating(struct
> drm_i915_private *i915)
>  	intel_uncore_rmw(&i915->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
>   	/* WaDisableSDEUnitClockGating:kbl */
> -	if (IS_KABYLAKE(i915) && IS_GRAPHICS_STEP(i915, 0, STEP_C0))
> +	if (IS_GRAPHICS_STEP(i915, 0, STEP_C0))
>  		intel_uncore_rmw(&i915->uncore, GEN8_UCGCTL6,
>  				 0, GEN8_SDEUNIT_CLOCK_GATE_DISABLE);
>   	/* WaDisableGamClockGating:kbl */
> -	if (IS_KABYLAKE(i915) && IS_GRAPHICS_STEP(i915, 0, STEP_C0))
> +	if (IS_GRAPHICS_STEP(i915, 0, STEP_C0))
>  		intel_uncore_rmw(&i915->uncore, GEN6_UCGCTL1,
>  				 0, GEN6_GAMUNIT_CLOCK_GATE_DISABLE);
>  -- 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
