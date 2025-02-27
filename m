Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F89A4842C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 17:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6BC10EB24;
	Thu, 27 Feb 2025 16:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvvSlkw3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B4910EB24;
 Thu, 27 Feb 2025 16:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740672270; x=1772208270;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5jx+vdjEHLu2rRNHQMGU9RxJqL2IxTg3c5NR9LCipXU=;
 b=lvvSlkw3pqvpDywDOI0y/IbDba/yhRaVELsQ6TTcVPnbB1//9d8CK28r
 DN1/eBoZ538LE9s29o/urtA30mDOCOvqS3TODLVq8l9Ba5qQldMVY38JT
 CmiW0rtD0uvXLbxBNZUA9X+lV9HQw5PABByf5lsPnpWWmJxOcIEwYgAMe
 XV4DHH22atinbYQyjG1RrBsGQRQN5v4V2VdDdXSqvbD6e9hI7HDRMA5V1
 47hpN4PlymRHc98lPu8YPbbnlLAq+rQ85uYLnsJjofBZI19RpK99V6rt/
 RW8pDNPn6FNjjyFuNH39BLRTlayT7YoHjasCbkzznjnC5RWmxU2+KCvtp A==;
X-CSE-ConnectionGUID: 3CJ035b3TLqwgbGeSpXtDw==
X-CSE-MsgGUID: 6U1T/C38TCmFElTVaVxaLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41594356"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41594356"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 08:04:27 -0800
X-CSE-ConnectionGUID: N/QwLfX/RdyhX3/+3LVsyw==
X-CSE-MsgGUID: ircMNYYLTBKe3VrTdnLp0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="116871740"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 08:04:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 08:04:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 08:04:24 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 08:03:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPxmSsFxhnt7Hs/JVZG/7liHb6P+oqXg8ljk/Cnboy/FLS8YH3R7S6Ru11SIvhWvG59nyHXBG8ZMoQ76kw6akz37vK/PW86ygZV5bwOnwR6aml4gpVCZ0MBTIIC70z6331NgKSbZZOGwnAg+yutBDSqIXWIZyEV0Wj78kBCId1DLHEam4fA/c+LeZOrOSjDx9ycpV/h49H3YZw6LbSdr7mZ+zAs4vFqZyQBFW8+QfjEGVsISwpFCgThXUzIYlCfjSkFUX3lxafJQonCY47C5mrly5v45Wcs4oOegC2PMgLM/+Hd9TGx8kxUjzEo89Fzh+PTYVX+jH04tYQz3v4tv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDFh+eiix558p/g5a14h2Fa0mbEXvZeO9Kx59LjEgIE=;
 b=Q/LFneDU0FcH9bOULgy3w/eGURgdhwTePthNscjHGpd7EJvZx9nZV4w+khjbw3kF63d6zuspcDaWK4ErAXIPB+5NSchV+hxrEZLcOMIB+l58rw4aPRtmEkrAhV0QL3GFrPr+eCQ549zM0GYj6X3rdDuPfJL7G9S3uPDrT1Lx2+W+cz3kC6sb+QiYtJS+mwpZDJzc77tKvTHXIEYVGgLgy1DPE8Ub+2CnMSskAhWNaLctpsNGPmKL3Cj2mZ811l5/c7s5VNKfq6MUUBwIJFQXhtwVuSyE6ALhuHObIi06o2Ceufy72B9xpH7DhejyK5utxn2WILrbkF4snvaYLEiAlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6850.namprd11.prod.outlook.com (2603:10b6:806:2a2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Thu, 27 Feb
 2025 16:03:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 16:03:37 +0000
Date: Thu, 27 Feb 2025 10:03:33 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Su Hui <suhui@nfschina.com>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ilpo.jarvinen@linux.intel.com>, <andriy.shevchenko@linux.intel.com>,
 <michael.j.ruhl@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Select INTEL_VSEC to fix build dependency
Message-ID: <bwirms6gvkvu7guxlzmmlbxb3df6qctuqedarccqer4lsu3ehx@5n3jg2ujryxb>
References: <20250227073205.1248282-1-suhui@nfschina.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250227073205.1248282-1-suhui@nfschina.com>
X-ClientProxiedBy: MW4PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:303:b5::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ea4484-1731-4fa7-f0a3-08dd57484b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JhT2c+OlqFsEKcXg0R4BAOR95yiAjxSV2wE3nrVdXfgZUJa0CU4mxs3mVn2i?=
 =?us-ascii?Q?+7EvO2rRwrPv1rEkb1eBUIs7f36HqSUy2S27LH77rICflZ0wHZSIZ6dbFhWZ?=
 =?us-ascii?Q?KusPNrqW7GRG+l1oqKYWnk1CLTKo2kLmMkagXaHorqtzD078eoYhzaFQwRRR?=
 =?us-ascii?Q?bYDLhmyhQUi0IXUMch2icsQsmnrGDZJ51HfcAgc5oVv+rR4DvO/O8qKoISPI?=
 =?us-ascii?Q?rmBPbJ0gb6trBftSQbWJ5GQlhG7iSVxrCCMYr1qPOuW6K3/MpE6ZZ+yR8LRE?=
 =?us-ascii?Q?hynf308nb4EFaW/B4d4U82Q0l9S26a15ZATWK09MhH/dr3N5elWc1f56F3x5?=
 =?us-ascii?Q?Me5T9AYF79XEPsjORjz+YsIkGZO8AoBQ4D0PQRYtmSRibslCjeCo/NBRVbBv?=
 =?us-ascii?Q?C5GTJeax5u/HAT/0fN2RUXHhimckVFBwhw/Qtc3sCD/KcwmTGmhXW+nIFlAM?=
 =?us-ascii?Q?vXv5XMXYL1RXuZJtQiKBv0BxWLDikDAnANwzTGlB7ync1xSlbzMoYgdPeMQh?=
 =?us-ascii?Q?G5Tq4WbGdqxy+oc2K0hmwTlrcMw02o2F5VkBXfbPq5m9fuFuf2XnDUx2mxX+?=
 =?us-ascii?Q?w+0coGMrcmWE+I60ToC11dEIcEQaTIzLCrxVfQAL/eqC4/Ll3Iif+PL9w5uF?=
 =?us-ascii?Q?gvFm+wM7kTPbrXk22GhD/NiFXQLWS9Bo+KtQNXXnUbStPzoigCwLGKTCJnWt?=
 =?us-ascii?Q?q58Ao8xt2EKDF6JlVBcaDVMQxbyJj8dMUUIJCyokLlLTt0yuAsxKwHfWST5P?=
 =?us-ascii?Q?kzidxsjvEHj2m3mKbHGajh0o5ZwTE7ztIKdK60kmQUutPm3k/8qtLVHJnrl6?=
 =?us-ascii?Q?5ohGmSrrpKV0baG9i83bVrx/fb5sIhfe8rXqJ8rh8FfSqeBP4wXRSbNU0cDs?=
 =?us-ascii?Q?ehGYTxHlNZmKeXFD3LvSmYqIFl/9+NwL27xfc9fxSFPqBsGMefYwrK3l6YVn?=
 =?us-ascii?Q?XxHWXMryH66SJvpLIoGLdfi7+Bi06TSRhkbCSRYiqQO9NQycsnyMLWow1vaK?=
 =?us-ascii?Q?s4ItftIf4deKwt/1n0f6sqXsrbX5pMC+4A7jaZdz82SO/zE9uhjtMkoge/bY?=
 =?us-ascii?Q?a2hdobUHskoODdI9FuOC1dAopgSqnlTUw2PZvecuC3nBzW9UCIwjtYaSyihY?=
 =?us-ascii?Q?4t5KpYVS5nRlOmEUzzxvA16XTe50bmalRolIO4oZ3v8aFOsf17xY09csZhvG?=
 =?us-ascii?Q?SPcaVTlaOrv1lxEZoV2IUO/s+rtO/U8MRIbdodgToUmVsFwfzZsxeJb7DoU5?=
 =?us-ascii?Q?o7qU4/LpzYVh+V3mJoeuez7tCk7GBUKCbTYwtMx/RPg2JI6orR17Occo1lR2?=
 =?us-ascii?Q?b/fGzSgDHb8HBKizLuSrUn5AQS/jXcgW7fE5aLfuq4iYf6T+VxrXPw1M4iz2?=
 =?us-ascii?Q?8vNSYqafFkrQH/ZQL8BOwr29h+No?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LaBUAZhi6JOFI2jQ5Nl4ECP0ht/+nMwYDBAnTmpWPzRAFzqVIVt2mi2FnV/O?=
 =?us-ascii?Q?hDCizOnnN0mTA+cYi2W1Q2qz7wkeSA2s9ROOBhIdcos/BEEJ0ZTqo1UKmAjD?=
 =?us-ascii?Q?hwUZa8hBQDvBdLxiw2bnW4PlYl7UxiXs5TU7lXRJEGhU+WVs0guB+mgcyYyy?=
 =?us-ascii?Q?ZmEI39ZaqdFhhCpDl6tNv2adSYL1AFYGZqDDDWAX+xT+LgwSudLPYpggfPmk?=
 =?us-ascii?Q?XUEpiqSHfbs5t/Yd+mFG3UFfZSzaUtvHg83O0AH+bCKtvuca2ZqnBFJ1GuPi?=
 =?us-ascii?Q?btfO5oIkwYT/zrkeWd+rIkxu3eDuYX+NWGhzIX44c4TRf1B9ulFc74R2Hkp8?=
 =?us-ascii?Q?GXAzs0HiegSDhC4n/ITkkPih8KQRzE2ktxzSsOFomMysVpUoM2hbCZp6LKCi?=
 =?us-ascii?Q?4jAF/WZPf5HRpAWqUpIOFhZunK2k9OyIoEFMERjAnPirZDGm/947UsOVePDP?=
 =?us-ascii?Q?FOT7Y3MFhFwWDzAD/BlXpI0m2mOdUZpFRNyNySh9uNCdj8v8wA/KJZ2LHfBq?=
 =?us-ascii?Q?kIlOOtNwyaZwkjuGRDQ/RcffaDFOkZ4qmYvzldfVOoFyNDGYtLIo0M781CEk?=
 =?us-ascii?Q?mFDxQ+KPXjhqdFNu7wDxIGWFzXjSl/w5yE+f+nPKs2bIq2SoqchVhwkQiM46?=
 =?us-ascii?Q?MkSOR7NvLR2oWQ1RQlcUGmKu7pZ4hDCnu85Mt2Pf+P6NKrCFJhB8D0pPo3S7?=
 =?us-ascii?Q?EFzFsba96HHfmBME6hKChp4ZQKK/8sMfxaciRjiBKqSa78fAR/SiyFKMXarm?=
 =?us-ascii?Q?JHEH95Va3ajCPmSGtCNLWhi5XNGXmh3YYusVD4VSq9CkjZ5ntd/eBFuyuOP2?=
 =?us-ascii?Q?nbDfycD9g3xJMkaKAFdMf58+S5hQcWFb3zg0gLwCfQI5+JdBeuDZG1SjIefN?=
 =?us-ascii?Q?G4BeQjr9kyaovvWBCUzCTcNnWSjdYr9GrBx61M0Q9ZVEJzdFIm22CywrlXym?=
 =?us-ascii?Q?HzWAFbjFZOHogNaybt31TBCpfkHB+ldogSaG+vABBxliSM4wMWh8+0Pta54A?=
 =?us-ascii?Q?AcPukVrMaVUv9/7L3ZfJs5vF5DVOAp58kX3paf/Iy5W6LxeGDcZxW4tvuRTG?=
 =?us-ascii?Q?994fMLCBbfu9Y70YzWkxB5zJZDqy0CtaDSlrTOOT3LiPfe1zLLJegmKJvcPC?=
 =?us-ascii?Q?CZMtOUNwBetHICuVJ3Drr+yhRmBMBsLpjFvYklR5ZhVfgPkNVUaQUxCo5Wlk?=
 =?us-ascii?Q?JZaDWqU/a7DjMgVkTa/tmqFv2i8OyLoxnWMMaHubS4QV+toVhyX7BqTXEJJi?=
 =?us-ascii?Q?MOK1G44xUcZsb/+BRsjCseZtZKYZg+8CGHJDs+aUAIzUc47jzhELnbEHQkbQ?=
 =?us-ascii?Q?2YsxBILtAxt3irrpkdBeSAolRLN+Jqga4ppxTzuv1/d/YjXDIcGART8AD1d1?=
 =?us-ascii?Q?TCj13f7lNUmyL532Pr3BIf5oyLECogJMT+FkzIQzUSo0XtgDviB+mXz0yNYf?=
 =?us-ascii?Q?L8JunZI9jg3OtT3CJhckbDxmMjiGscMNxoGwOoVP/I/7yqPPJyKsZf4KNNb+?=
 =?us-ascii?Q?A3M9Kop62AIXmVheVFk0G+k4Jy5+ure/8LB+T/pryZnKvh38IoVvqAUZvida?=
 =?us-ascii?Q?JWIzz5py1ATPjyrPeDIL9VjQNqOsQNquU6dJGxeRl4OVycbjHv3Wx1TZtjKw?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ea4484-1731-4fa7-f0a3-08dd57484b74
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 16:03:37.5045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXTbbC32N1Vib4/HoeKDFUNaA81QpYwHpuMUcMiu00etBQOIjIh3bvuYeZfIPAKoIxY2jRZVSkIL+E16uyAKq/wwARt2XGC0a0X/cA/sj4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6850
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

On Thu, Feb 27, 2025 at 03:32:06PM +0800, Su Hui wrote:
>When build randconfig, there is an error:
>ld: drivers/gpu/drm/xe/xe_vsec.o: in function `xe_vsec_init':
>xe_vsec.c:(.text+0x182): undefined reference to `intel_vsec_register'
>
>When CONFIG_DRM_XE=y and CONFIG_INTEL_VSEC=m is set, ld couldn't find
>'intel_vsec_register'. Select INTEL_VSEC to fix this error.
>
>Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
>Signed-off-by: Su Hui <suhui@nfschina.com>
>---
> drivers/gpu/drm/xe/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index b51a2bde73e2..7a60d96d2dd6 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -44,6 +44,7 @@ config DRM_XE
> 	select WANT_DEV_COREDUMP
> 	select AUXILIARY_BUS
> 	select HMM_MIRROR
>+	select INTEL_VSEC

intel_vsec is an x86 platform driver. I think we probably want to add a
config that depends on INTEL_VSEC rather than selecting it like this.
At the very least we need and `if x86` and also make sure the driver
works without that part.

Lucas De Marchi


> 	help
> 	  Experimental driver for Intel Xe series GPUs
>
>-- 
>2.30.2
>
