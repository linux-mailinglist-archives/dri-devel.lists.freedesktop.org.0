Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF891A7D1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 15:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D45010E273;
	Thu, 27 Jun 2024 13:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y73VMigR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0EC10E273;
 Thu, 27 Jun 2024 13:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719494908; x=1751030908;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jCy1CFhQWPIx3/ygrpu/TXQrXcKG3k5ZAOH4kXIpyhE=;
 b=Y73VMigRjmliV66R26DU3P73+Hem+GQlxI4ksy7eVA4dHaY2gDcUjoLY
 wlsAfNHAabxHsf1O9+Dsg/mzkn1lDynaQAfYQy3gzLJf8V/gFGhBDM5ZY
 4pWdNGSBcpQCSnUOisGUHadV/Zc33IIO0+s7MVFig+mu0/x3PtJ4S0egn
 du/QsjHr5r3+6J5XtHgXj/Nfk2ysSS5mOpQV5wnKsV3OSSlQPvaS71I5e
 /TglZyjK82ZPEQPZqsOqPpVdIir5ut/jT5kY3r0Yeldm7yJG0pmmIxzed
 DFQI+TMy9y85e8+qh06+pZlNzfbbzY9/ErHNL0V1ntlCxNpAUM/J3HkvR g==;
X-CSE-ConnectionGUID: o1AHlAb/RQuQjFpRNzANLA==
X-CSE-MsgGUID: sxNMN4UaQx6Y/pMpQSRMag==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="42037781"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="42037781"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 06:28:23 -0700
X-CSE-ConnectionGUID: bPQn6MiQTjKNs8Ii56VDOw==
X-CSE-MsgGUID: O15IssJcTwa55YwnWUDehg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="81931313"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 06:28:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 06:28:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 06:28:22 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 06:28:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5wrDNA0fS/0F4tLztOcbqBLso1ZRh5ATIz+MdAiRas6WbSsB7zXR9F4hUaq8dclu+1x/We3ym9jvMhv4d8vtQh09/LA81rfeWsFc/0gB/WaU08CCGUfjMd3Vsjg9wcR7ut9vOw86KdvJZNHErafxSpc8HZk24T+ATHHFdz8NIaPyBJilQu59iRoPS2tt21AJTbnajBOCNrSnYGcm4kC9Ttg1DWgrbkqDAO+BWlQGHoEyfuVFq5nzF3ESxFKfa9kiOnSvs4kAYvMfExYR6ciW1NsE9VUq7cYzBGCSOIoSr92bPtOJWAAVg3l0F/Ms1nG+/VsLcQvaRsDl4jH6NgF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYugRCCwR2DMbtzXY8o750rksPFrEDMF79CS6P1Xezg=;
 b=K+j378IDaa2CzUkiiaWv4cHnJ4SqlO1id5B7s1VFadeiynIlavUe0L1yc8K/fhj5f4bbh2PDCUv2WYicepzuYulJhyjWP8rSLDdl+eA3DJ8P1fy0rf9G8Qnu2GEenG+9i7vym5Il1CUv4pqPl/v1oEsE0UCXrwuq1EEDPkAhzUBslIZYrRsIK8yqyV7cxSbVXt4yvxG+ZZsUs57CeMjVvoL9jgFFWCcM6PYg1xnNOHjahQrCa3mi3MqBV8OVskQclFwFX4s+8KZc11RvZogybSEFi0Clo4Aye/gAC9kN6LcPz2xN1vuqiFAjAMA2l38X3F+NWx8THw4lmGDeczUHEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Thu, 27 Jun
 2024 13:28:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 13:28:12 +0000
Date: Thu, 27 Jun 2024 08:28:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915/gem: Return NULL instead of '0'
Message-ID: <hoqtitewipx6nmdeiw32fnodbip4aaxcnxn73ibmislyxz3c5j@6ngnn5vogxzy>
References: <20240617184243.330231-1-andi.shyti@linux.intel.com>
 <20240617184243.330231-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240617184243.330231-2-andi.shyti@linux.intel.com>
X-ClientProxiedBy: MW4PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:303:16d::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: edc452dd-5cf5-4d13-519c-08dc96acfe16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ofKzkmHs2WIj6zNcmHvVq4v2Twr25PAoR+mOjRkf3l/mK5QcsdFoX7I4Z9ts?=
 =?us-ascii?Q?VC4copszXtZv/Vc4YBnYtNX7r8a+pB5zv1p6cURqPlZUF0e/X4Z73YcqnDo6?=
 =?us-ascii?Q?ZJS0kN+bhZTkV1nZK6123OYhg3Q8KeeSbktKgfMlYfaY6DTe2RLDwqPCukW1?=
 =?us-ascii?Q?cG8pp8YIVFSPEVpooJWh5H03ZV6QT3Wee4wGfyRuiYMISKOzpx4QOb896qGx?=
 =?us-ascii?Q?sYrLwQkVvuWjjHHqHzF4qwo3le3lp2Z34SsPpWQpae1+/MBj1xi6vIdP/EyA?=
 =?us-ascii?Q?OcfgrFynzYY0yxF7NzdCWvViKiLQQiFYwNBd4y2Si3ZWu5XNWi2f88IfMo04?=
 =?us-ascii?Q?U0Vk310wMV0vW+VN6/ReX7/V6MEoOatH/OD2lRAEjHEWnw/E6p4+u8iVUqjy?=
 =?us-ascii?Q?h2ocFltG/Uw20sBAWwk469dEA9qLU+eeDtbMwgikLfCi0LGMoF6BbWSIBnCM?=
 =?us-ascii?Q?ka6Nq8anqG3ea/r7tSj7aoarHqo2dVWZjUxUuohh3vqdpyCwNWlqzgtSRsWd?=
 =?us-ascii?Q?j0Oz2WgysHxyaizz1+nxEOrpZJzx6k7Schf9Lc369z7GUBUdvbvdc1X0OYb/?=
 =?us-ascii?Q?4pRWmE/1/PEjWrf+Yc5gLd5NrNLTmFlAyKaE0rt4eQp6x2gtrFtUeddTUbqq?=
 =?us-ascii?Q?6TGBy1OxD472u0ixGUxJshlHtSj4zVW6WZHSZXASLBnoVxQpOVsGGbsdcto6?=
 =?us-ascii?Q?2eKckwvU4J3bxpmmQqIDZB+92PKAfQwwn4bjrddNs7kOyEAf6z2KgO9anWsK?=
 =?us-ascii?Q?86A8sqJ+aZka1FKVwaDwhu9x6252QUzzaOqOyuae/jE4Ci5wQFYZ2IQtIUYe?=
 =?us-ascii?Q?wLew64uvT/0Gq/1TUvg/IOMCeL81e+6SgVFWUl2bF5/W5zrp0fQno3DrdzkH?=
 =?us-ascii?Q?iyI/quDaG/50fUR6DTo4C/dapNOtvqiU/GeX0z32QzK2YntefwvOeR43xmu4?=
 =?us-ascii?Q?d75zEUhLIzjX4BUdHbxvI/ZBhXyg7YWi1vHYpc8W+vLJ00CgsN5ftr3JlOYF?=
 =?us-ascii?Q?Vx49jf1tyPkaj26GkZSR9XBd/BIH9bJ3eXRKHqY7gQSMDiT9nlTtIf56X5Vm?=
 =?us-ascii?Q?pzG6qxEabQ6JYA5B4neco/r80F5hnJvy548nJRGfG5c2mzs7THOHVfHrZFdY?=
 =?us-ascii?Q?PvEqWtK837IbVp1D31rDY+qUsCLUT5lgqYzWP4VlrNQVBZ66F0qg737LK0w9?=
 =?us-ascii?Q?1aflINvWnApDrA95DpALjgePJUFnqZ7XcLTihelccsTAZJib0By6bqMSPmJG?=
 =?us-ascii?Q?/EOWJCdGxl0A7WlrvuJW3z/aUheRsxKUXMmKGCKQgoigez4FY6KtzFdR7VZY?=
 =?us-ascii?Q?H5oRwNIJNnf0bAK5Ot1ye415GtqeaYigBoIPCxX+OTilsA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U/O/YEwABFKcL0a5J0+by6wdione8KdtBkX1Zu52u8ILbraWDOqWn1rgpRpd?=
 =?us-ascii?Q?dsGGQOxPtoqiZTywmgNizszhwQJTKBkPkK/n7SOAKuGhvsQeCdzfWgSTT6hQ?=
 =?us-ascii?Q?3U0Vz/5EMXUv04ILfa+WwCGvO8AxE3A3BpRf6rDD+8rIOsG654ae/uKddJVD?=
 =?us-ascii?Q?C+8qC6aOdRhF4saqB/Tdv8u1A+kuj1d3LerzDAD/BEbBYlSQ9/u0ZsFXlGcQ?=
 =?us-ascii?Q?JCmuZmMXxMpzduHqcMFTC96tyZCC8n+dtySY1zQNYSINezPLzGprnrSx9cTr?=
 =?us-ascii?Q?NY4rzFKjJXQrisOopIQu28k5XfkJYqtBZlD5ktXPNaeauZGSsjtOHLlGNeD6?=
 =?us-ascii?Q?uNAhppreZsjUUhaJuvsUtqf1T/p4wsHtMZRSTOpT3ar9y5RGUrEq1jbRLm8l?=
 =?us-ascii?Q?UN+qwoReG1Ozq3Td6EIdFDPtVvjwdSketkozoiI6Zjr0IIAdzVG276OEhBVt?=
 =?us-ascii?Q?eSOAn7J3oOTInLMiN4Gc+TH+T7Nfvxa+5/+6eBX4ee2BCdCxQROlGfCU5w/G?=
 =?us-ascii?Q?eVnx+sfkaqquxXNrCmSU6lBISY0RUO41bVtQCQOBNJS+zHPygQk+s4fT3AJH?=
 =?us-ascii?Q?1+DtJUJAgpbVvtow/e+iWzeXBNdX/Kis7M2a8pTofoVP0HA+Rm07kvI6XH5g?=
 =?us-ascii?Q?xTD61SX84016Kha/3b7XrhXGKVah179Y/+oAEaI/wEBMyvwiAksqF+qI+cD1?=
 =?us-ascii?Q?rNGUchFl0bOHELOiZ2bFmcqXFuc9+zlC/Kcq/0xOof6FMbPF/uMcxy4yItCl?=
 =?us-ascii?Q?6bSHs3oiDSozl3KL1jSn0ca8qOa0nKiDLowbp0+nWJ8GAZe3oCc4JDt77QQ2?=
 =?us-ascii?Q?j0ZXGliVffr13BvBRcYBd6TQ5usH7y+Wgbgjy1IhDj3WTH9Sqc7VNsjUDby6?=
 =?us-ascii?Q?HeV5eXgk27ZEgF9TxEgUHVkCtMkgyxwGwBwr53TNfNd3Y7RP0/hR3xJFCeD/?=
 =?us-ascii?Q?34awu865YBGpTtAUF6ksWksMRmMAN5Cq6yX3ltDTNn2odSVIW+q/3JaFE+Gd?=
 =?us-ascii?Q?yeh648mRjKYIQgB5H1QFH4sS8sBlEbG9eKe8F+27ED2+zn7kvopAkY/wLF3K?=
 =?us-ascii?Q?zarOppSzErutZWhVxDPTQoPitXdmuC+o75MuzW200rdr1QdDWcc8hun1L/Hc?=
 =?us-ascii?Q?wloEfcwAcLRTjIo4YpUfkLX7r1AqdlANBSToX2QGfwMtwH5JCuoDqwD7Xu8u?=
 =?us-ascii?Q?fP1QqjYDI3tKRoKxDHf20429ozpdGBELSdCry9mWFXr3gGiChx8GwYSYQm02?=
 =?us-ascii?Q?IFNBn/hs54AwOWbaF1lvdsMATiiQGX+PGov2FINQL/FQoZ239rILGYVFvmPf?=
 =?us-ascii?Q?BrSJ9jwGwH55hzmcSJgl1Zl6Tgef3XD6irF6hpJymZgLF+scRPV8SHrJuNqo?=
 =?us-ascii?Q?t0x1MDg//mPRmI0JxVkm3dLSBgCNC3IkZDcyoSga1b/+4gjtLM/ZGmKukXbG?=
 =?us-ascii?Q?rY3Bxtq3bme4/qZS7LUFKbcaPr6oVbsAsL/xNkZD7n3dWrdTgrPdXh7YmQYx?=
 =?us-ascii?Q?qJh3tVP218Y2m3oSC4Mt+oxOv8XhlUIbOwU6tZdq1ZoMNp6BOJT+B4EtIvO6?=
 =?us-ascii?Q?0sl8VokHt8tRMqign693dmawvObuEFGj6gcmcl5Gc9Ijj0Wv8qVoPf+HlEvX?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edc452dd-5cf5-4d13-519c-08dc96acfe16
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 13:28:12.2845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZjfaTEOfoghn4w7+ZtRG1sG3cTdwcMo7k11oya383RX9ukebocXXO04YjHRbFBMLHDmDl15vQ/O4qZIQSbe5mbKzHsKxOC1iwsImdBvf3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
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

On Mon, Jun 17, 2024 at 08:42:42PM GMT, Andi Shyti wrote:
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
>Return NULL.
>
>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>---
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
> drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>index 004471f60117..9ca73936dc5e 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>@@ -940,7 +940,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
> 			drm_dbg(&i915->drm,
> 				"Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
> 				lmem_size, dsm_base);
>-			return 0;
>+			return NULL;
> 		}
> 		dsm_size = ALIGN_DOWN(lmem_size - dsm_base, SZ_1M);
> 	}
>-- 
>2.45.1
>
