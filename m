Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5389C1128
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 22:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D46710E8F4;
	Thu,  7 Nov 2024 21:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpahtHKh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A8D10E8F4;
 Thu,  7 Nov 2024 21:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731015693; x=1762551693;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q1dpdYZSdcS1Z8DTwKGcMD2wIqnDQca29nXzQvBPGd0=;
 b=FpahtHKhrudwiwQ/fxLadaHECKpuvpgo8cyJ4CEQXAe8ndahNy2jrOOh
 dl+qeYIiQNqAo/K6o77WdAsI25leWZxIT2VorZiHKw3PDVSd3tAomkhbx
 C7/THaN9qXc1fVGoxY2a591mO5sJFQ0BGYreT33e+McKFxWtgq7Fpds19
 9ZA6T/Bb1oW6yRBbbj867kfz5IvoSvAm8W6T/nUDXT1yIuD9dUPmIoBfZ
 Z0qyddAKQVirL5ZcCPqTDemeyLvzF6l00ppbIs9JAuvycNhsYpaSO7TwP
 CnT1qpN1W1RKJSouRVh+XyN2BJZYcs7llWYUVlQkKCC+KT/7yTwX6PujE w==;
X-CSE-ConnectionGUID: HwwLoZOxRVKNzb2Vbh8HIA==
X-CSE-MsgGUID: 0sFqMmfeRqiD5cgyP4yZMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30285738"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="30285738"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 13:41:32 -0800
X-CSE-ConnectionGUID: 6v6FgyeSRyOL5sMCI/79pA==
X-CSE-MsgGUID: /JGLYHr/T6eLsfYo+/ROBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="84864336"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 13:41:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 13:41:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 13:41:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 13:41:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uqq/btujVP0W87SyxwWlJqw2ghC/24X5StIiz3XjT2gVipb22z3LU+UYGk75fCUEI1zYA2cK0BFLsn0d6lWZqRLJMz7pQO0XgUXTvvw8Qu780sXVD1QALrpvS6y8k8MDvSddRfvQoOZiTe8Y6Nr+WsSTWKNSGeOCEyNZUMtyz8U8neFhBnG7bjvWYrnATgHbjUIFMwtMSzSgKXZZ+QCbeAQzdaG2/DBy30q6xEeXc9HEf065Ucs3SVdrY0AB0n541wiRyWoqZWF1xssOw65Vfig44i/pUPu3DIHCL1RwDPpEoyyB/j0lyHz+sMdtAghtBWZNdutY3XTne59xR4q2dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pLuvefulUuzvfeDajCn8KRvNsqTD6EcdrhacBkaFDE=;
 b=y7BGkJw5ybKJvxoi8WywckS452tT6vxoVdtVd+dYEP58Mf9cVbyaP2taHdwVBhKDaFtQSR+rJZx06CKq1vGXVlIlbuE8Ui88S+SiHbgcvDkvk6GsMX2l4NH4+WCWvPdep7CedUkLF2Kxoz/MgM8Y1EwMjHZPZmhOvqjmNSmtIvSn+QgaNYteg92TQwci7ZOPI4+CsfPY0RI+EYTjXzd+ZpY9xtc53/6mlRK2qwsSvaprCCt3ZAfrbK/MiV5tDs3QbveCcKp8H/OToOlBUJZafZliuv225mhfvF1i3geNMj7F8p2QZj3X4mhaOCeNIW71Wv2TZRTaXkAEGlaAtSauAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB5119.namprd11.prod.outlook.com (2603:10b6:a03:2d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 21:41:29 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Thu, 7 Nov 2024
 21:41:29 +0000
Date: Thu, 7 Nov 2024 16:41:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 08/10] drm/i915/nvm: add support for access mode
Message-ID: <Zy00AoxE0_8p5xCY@intel.com>
References: <20241107131356.2796969-1-alexander.usyskin@intel.com>
 <20241107131356.2796969-9-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241107131356.2796969-9-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:303:b4::7) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: 599323cf-b3cc-427f-89db-08dcff74f081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fG5qwVIwK9KOEoiMBM4pb7TPAE0hG/889VnKLKcK89c+cRlyZ+wA+piYwNMq?=
 =?us-ascii?Q?TVKo6fY9/3C8G2qjnBTEjbEcKm5QG3Hlo+PAVdc71qiQAUOFIC86Rl/3edHl?=
 =?us-ascii?Q?L6Ow9UqzS407J2Y5Ssl5wyWYjrjUKvMEKrus/kIhG5DGZLBaPf+hJ2kyD/fb?=
 =?us-ascii?Q?qzjfMCLwkmvtZUUYL5Yia58er0cqCS5W4/YXaTpbMi//kGVS7x0owJzQnFtz?=
 =?us-ascii?Q?blfqALbI7fqE514pQg4kidyvORDNZ8oDvCWFYGb9YL8JUg+px4xVZOrd/lPk?=
 =?us-ascii?Q?rEEs7P3ftxYbLVCW0r0w/GG7ysYL0qy9LHy5I/pcDn4/A1nDpxcieXfUmnqK?=
 =?us-ascii?Q?i+XDA7FQasYBWUC54D98L/q5GZWlbXx74fc9htIIlSMXYbvDFLaiqfxJNn4T?=
 =?us-ascii?Q?wkXZMz2u8tOGP9U4gHh2BXysv24Fvb+C7hSjsIC7iCt5ALBeH3U8f1nfgjOF?=
 =?us-ascii?Q?zKV68/A/0rfhm3VA1rniAEdKQxF4G4To7j7MxnRrf+aCn6qo3NQtCovKd2gy?=
 =?us-ascii?Q?9GA+bk/MQv9PHtgOD2UyxhQ15d2SuDqe2EYa58Q0FqHVt3A0WqGY1yImIFmM?=
 =?us-ascii?Q?2MJqBe4q+YovzuhxgctMvtFsOM4mT0H32JYID3Cjgaf72XBy96jK2GU1bDyJ?=
 =?us-ascii?Q?HLQHexwtawcN9T2v91MhU8OHziNFslN7U5eXFDTZo7JqM1PMmVTrr7VacL/M?=
 =?us-ascii?Q?URZlbw3Z65h0h6Gr99UnVGUYzzKEwUYYkIUFYtdwB2bXvlW99/L3qUsAB1Zf?=
 =?us-ascii?Q?uxIqSpe267Ai5aqdIVuhPU4b3rm8ei4T3sxkqMYyTbJfBtzDh1umykEwCPcx?=
 =?us-ascii?Q?F6fVxkd87FlS6GBjV4GKpBoxOU52PHyJylLPct0/Kz715GEIFjL32roZNAa4?=
 =?us-ascii?Q?/qXAFmeT2rJCuTUt7PDPVqiUqbTjqc3jPbUcd4gb5i8bxrsc5OwUnycY326v?=
 =?us-ascii?Q?F9MqvQfxHFS6ERqyyUbVEzSXhDeQq+NTjgpdCJi0qGdC/Y5rOKXpUwRVbc8O?=
 =?us-ascii?Q?sRub08uD5m9ltWEzi8kHqV9x+mc0DZgOdL2I7B0WLz6AOZO8YXBAKhBCt+ml?=
 =?us-ascii?Q?+ntIMNvtxISUgk1DycEC6B45aOioEqOOX8gl3l/m6Gh8Hx/qiBB6L2RCFfWr?=
 =?us-ascii?Q?uLG2FF1kfprggchFXfxUYAj4awq0lxOKx/8GAoNY6ePu0gMi7gGVemu0X4yJ?=
 =?us-ascii?Q?NvRSj3lN8izSh+68UeG4sBoUWF8Vi9oOo16Ct08w0QY3qfKfKvqNTA5Y+Vka?=
 =?us-ascii?Q?171jBwxt+Mus42vJegOCzrM5AAaGdmdCUxqiTWKkke+0DwfDNlFmWw+HjIfM?=
 =?us-ascii?Q?JF3BwQUo9zp8Ulm8g3/7Votg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rx4Kco+xUmTaA7c7TeK/UOhQkUUUOOOpT7i1SvdKpCMSssMsxyznJ9jVdnCz?=
 =?us-ascii?Q?q/VwJwUG9d3mtGmJJn2smAsikloO4tt2ExrO7Y4pmiJABjJcjOc7yV3A+lJ7?=
 =?us-ascii?Q?vMHjzN6/Sr4Zg2puP5FZQXNRH0QizQyrVwz6J53Bii46adQJoZfEIlpikY8j?=
 =?us-ascii?Q?aibcBXCjRHAJN5QcZevBmHWeHw+Hj6jtbhZcHyZ+Ha062P6DjwUe9IYN7TEP?=
 =?us-ascii?Q?Ps6BCrICqDi0T2j41ppKIdg1ox02FE87BKyUBctAQbRhUphL92MlrNhFUVuP?=
 =?us-ascii?Q?MAlK7isbZrQMiKOcv/rERwaQt/D6ckBdfqO2XbBprhXqvTZIQ91Gf276hfnn?=
 =?us-ascii?Q?Q7R3oqQGPh2Cqc6fggaxoxiLDwLT4AQeYeJ4nUKrsSdiDdD3yCmvUYWbq4Sc?=
 =?us-ascii?Q?UW09/m/8adrjz3SZ3JQQLakKlzos0CNhpm+321flDjjhuyhjBn9YLEZpJ6yE?=
 =?us-ascii?Q?WFrZH24HpTEPArcojMmhYNA5PRpNsvAY7NO9/GDMzCweusdt7k3YyBR3xSjC?=
 =?us-ascii?Q?Z0u+UnKvXZ+ex+1YqBsVsZ2Jp+qJaE4grpLXmJ/+tg3mmb3LaklL9QyW99YG?=
 =?us-ascii?Q?i1ZRxcT+zgn2+d43Qf9IJn1hLNPtHIbVYIpr9ncc6AQevk7HOXRR0OO6Sf5D?=
 =?us-ascii?Q?f1HZdXhTHf3JkCWL5T01jlcBOlsuh70Y/QlU92ClPfj5Fg/7hDALD4tbbntZ?=
 =?us-ascii?Q?8gy0UUlLcCRDYj5E9hIXd969x4bwRah0aUjLaVdeeXZ8axvk1OxaDmm88Xcj?=
 =?us-ascii?Q?X0wxCrRkjFv4M2UZRNu/4YZ32zj8NQHf9S+54E7l29l456uO6D7018hKaAnI?=
 =?us-ascii?Q?/SzNk2VnIYQunC5AtKKS2PSsQk3NQrGJgJuDrCcr8autNxjGiiT8snNUasqc?=
 =?us-ascii?Q?Q0CY5YbChHJWuHHd0qBljlqeBci7fAtxB76PLvw5Hucqk6FeZQKopDvEAJeJ?=
 =?us-ascii?Q?JiR3BK1iZbf5rH27E8qBt3UlFSKQ+BzztTi5O4j6HmFjSPBVkxw7YqQ4ZcAJ?=
 =?us-ascii?Q?4Q6Rmnkd0RFPkMDqMdmhsTrX67OeM+rwGFeyVcYzAFqvYl083vnVuB3CpFjA?=
 =?us-ascii?Q?tsDSZZtUfKisRrVpbAYLkN4jvAAtiX6UvUGPSF70jrb/LfeLItzEjZ+sSn35?=
 =?us-ascii?Q?KycBY/9B/VAH+Hc1njHgaOeuyrfeyApiTvkKdRq7bkq6T96i7NldnwgyvP6i?=
 =?us-ascii?Q?Z2EylMNnht1SYoSJDMREZ3OkrZ5d0sQoCEMHR04KrHoZz3+6YFmCkfJW4g0p?=
 =?us-ascii?Q?tHoQN+zdadENCxyyEqxjNpQA4Le8d7F+EjRrLk0RF6pAsa+LJlHAld7ZPRGs?=
 =?us-ascii?Q?Nu9+c0+0SiwPghxjQOebYwCotzdOSHoMNxz9G8eWh7tQnllN0+nIk6PIElfy?=
 =?us-ascii?Q?d651L8IxuVkDf5gqUSPObqM/jYfozXejrdhmUdI7sLoBY+EHDcrKhPqZXR1p?=
 =?us-ascii?Q?pei8UdqN4KhprJF2HIJ8KMETYzkGb6eHU4Rl8VALPfZmDUAkszdzXp4Smv1T?=
 =?us-ascii?Q?SzKe0X4vRopHTv2J3xgdtuRVJxpX+RshbRh/pPQeWdlU1cDY5f0TO0zdAHbq?=
 =?us-ascii?Q?oHmZ8jO62id0bFHMNTgNHp9mnBxXC7v0auluNvXjVMys0IsdVryjED4WJXVs?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 599323cf-b3cc-427f-89db-08dcff74f081
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 21:41:29.8234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+W/6kP8xB9K7MnwgYKXW64HTmNYa3b+SW06WFrkftY1wXJQR7LiEWiv9ZUB8ZjFyjnHmKXgfW6LqgDdSzIMzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5119
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

On Thu, Nov 07, 2024 at 03:13:54PM +0200, Alexander Usyskin wrote:
> Check NVM access mode from GSC FW status registers
> and overwrite access status read from SPI descriptor, if needed.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_nvm.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_nvm.c b/drivers/gpu/drm/i915/intel_nvm.c
> index 214c4d47a9cd..cbd776e667ad 100644
> --- a/drivers/gpu/drm/i915/intel_nvm.c
> +++ b/drivers/gpu/drm/i915/intel_nvm.c
> @@ -10,6 +10,7 @@
>  #include "intel_nvm.h"
>  
>  #define GEN12_GUNIT_NVM_SIZE 0x80
> +#define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
>  
>  static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
>  	[0] = { .name = "DESCRIPTOR", },
> @@ -22,6 +23,28 @@ static void i915_nvm_release_dev(struct device *dev)
>  {
>  }
>  
> +static bool i915_nvm_writeable_override(struct drm_i915_private *i915)
> +{
> +	resource_size_t base;
> +	bool writeable_override;
> +
> +	if (IS_DG1(i915)) {
> +		base = DG1_GSC_HECI2_BASE;
> +	} else if (IS_DG2(i915)) {
> +		base = DG2_GSC_HECI2_BASE;
> +	} else {
> +		drm_err(&i915->drm, "Unknown platform\n");
> +		return true;
> +	}
> +
> +	writeable_override =
> +		!(intel_uncore_read(&i915->uncore, HECI_FWSTS(base, 2)) &
> +		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
> +	if (writeable_override)
> +		drm_info(&i915->drm, "NVM access overridden by jumper\n");
> +	return writeable_override;
> +}
> +
>  void intel_nvm_init(struct drm_i915_private *i915)
>  {
>  	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> @@ -43,7 +66,7 @@ void intel_nvm_init(struct drm_i915_private *i915)
>  
>  	nvm = i915->nvm;
>  
> -	nvm->writeable_override = true;
> +	nvm->writeable_override = i915_nvm_writeable_override(i915);
>  	nvm->bar.parent = &pdev->resource[0];
>  	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
>  	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> -- 
> 2.43.0
> 
