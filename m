Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D368C7912
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 17:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121F610ED51;
	Thu, 16 May 2024 15:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ri82c7rn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9026410E13F;
 Thu, 16 May 2024 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715872383; x=1747408383;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NcNTL1Vm+V0cqU8sXBayxnCbMEebkL1Sl75tApKD4Rs=;
 b=Ri82c7rnzegAPIJYR/qAfF8y1Gj0iOCEzWrm9UkocsHSptf5XDI4DqkC
 7+hP2EtrqEZDWAml5X17ODJXHhIzf0S9fDXZrRfr81Ut0kaKz4V8bHJkH
 vS23CXFYmODmApT/I9CMQIqibqSHJG3IL+z2JdmIcysSJ5ijmvWH6lkLX
 i1kWA1xpCsfD/IA/D0pSxSvC3ceUgz3DRvKALUoM2TKfwxn3eb5UnPhz5
 6LkLRGXWIVu5gVd2NOaAdyofZhhqtUFpgCWLu5UdV4wJoVD1gwOzQkvbS
 kWobjp0KLV5Alpr9+LEuJEXXdZ9O8UiSK0smIYn0nQkEKSbxhfXIDKP5q A==;
X-CSE-ConnectionGUID: o/FNLEaGSdmP3sjN5MR5Fw==
X-CSE-MsgGUID: 2sepvkwNRrG6JhKd1ztkHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11801368"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="11801368"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 08:13:02 -0700
X-CSE-ConnectionGUID: BB724o4DQyutCDE0VQ12zQ==
X-CSE-MsgGUID: ZWL1yrK7RsCSqDOOe7b/IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="32009718"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 08:13:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 08:13:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 08:13:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 08:13:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLhrk+xnlSsAkVFjezgkvfwiiL10oN35ictiOCSVnABUxl4lKkYr0m3QSwUqiZhfTL9+LCERRIXygVh9M3716HzVqwoZscqLIeP+rsRauhwlKPnt1STcgRbvrNUEXfLjYrmT2APwOADUvnhKVdModNKIDn0yjCW6RnSabd8XLjJx/Tpy2OSy4Rha8+ftizWuYGokSdoCPFJO2WHQYv88Zy0L96d+WE1Zs/Wc95E76j4vL1zuWxMncuaXjNfq5bfKQ72MU76Ad2HY/9fdhYTuul3pbtqWWmJtFZZy0euUjT/v8OJXidsmxCDSMTvwKS012auZoHfeJWwXk9scLL583A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7oIhG2swlmA25WO/SPC8Nk4QV3LU8XSnP8FcBpGrPE=;
 b=QBSa+K5UOsOY/wRSZVjTIdVIw68EbYs9U4kT9j6khyntMxy2kZQdKwQPKQ1pAobPfPLZOLwsLjjLbz/8Wgm1QmUB1z4KG4Dld8TdwFLEOcbJI8i2xd3DTOM6WTUSciLQLG0F2ffyWZTJniOypcaD5VmqexwdOzHlIHJsQTLjVwLKtds9H4Vzga9byujK+OrFnHhJOjt1uYIfMpXO3QU7iV20iXqH5ShXqYm0++srWHoMz3PN71AtQRGaZ/GCtpugr1/NL0UHnT9Mo9gJueTGSDlemfLTYAjeH38Qq+ESDG4ZEC+orReUnpK34ACjAk3IFPworXBcPUL6tWE/1jgi6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6441.namprd11.prod.outlook.com (2603:10b6:208:3aa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 15:12:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 15:12:58 +0000
Date: Thu, 16 May 2024 10:12:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
CC: <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Stephen
 Rothwell" <sfr@canb.auug.org.au>, Jason Gunthorpe <jgg@nvidia.com>, "Ofir
 Bitton" <obitton@habana.ai>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: update Xe driver maintainers
Message-ID: <4i4vqo7u2bprwjwlpq5oftafiuyslcs3u7hzeaouto6ezc6k7t@lqulw6jpxrui>
References: <20240515162222.12958-1-ogabbay@kernel.org>
 <20240515162222.12958-3-ogabbay@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240515162222.12958-3-ogabbay@kernel.org>
X-ClientProxiedBy: MW4PR04CA0267.namprd04.prod.outlook.com
 (2603:10b6:303:88::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: a807f3de-55a1-4b0a-7a51-08dc75baab96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015|7416005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uUQSdHGzb22W6rxM2wt+y/H6A9riuofRP4eByRhEMPvNwDF5TMIXIBUZoc?=
 =?iso-8859-1?Q?3M58znlhd1je6mvUmJaciYqdAJypXNF9C2jQlk/2EXyiAbb+RgJ/9cEYBz?=
 =?iso-8859-1?Q?zo/mXpCWbsX73WR4S2ZcEH3idtxJz2XZ/69P91FtbmLCwWrSQWrt4lt5rr?=
 =?iso-8859-1?Q?omqzp5jawSMM/MP7AU9zN4SV+ndU4dxK+m9/aY+50YIUizSwYRxAPrMxqO?=
 =?iso-8859-1?Q?qHSxSnb9K1/t/rSsXP7K4WR7k91tZh2RoD5wsOO2PvK01nQt+MqfXeL3mG?=
 =?iso-8859-1?Q?PEEivDHyLKIdBFVWSGJ3UWmYPDMg9ch1TecYSsWXOPHazUWMC7BJZdZB3O?=
 =?iso-8859-1?Q?SXfA0kSeY6bH7h2n5ZyL87wtZGujY4XOJmz0ogrogqxrjZntU73sI3srkv?=
 =?iso-8859-1?Q?bLvC1GZNaqmVFP/nW/J7MLfZGHQvwvp72WK0p+rU9E8cC3iIAF/xSsd0td?=
 =?iso-8859-1?Q?pjtHSSPgCCznNQvZARrzSVziUvK2ImKNC1hR0qGGL7VOwXptnjXzjkrO6a?=
 =?iso-8859-1?Q?TaCF2HTIqhz7fVnFGq9bMzxIAb9IxawuhJTuVURzK85eo/gZncIMKsPL+f?=
 =?iso-8859-1?Q?sU0xJ2awGZ0GATl8Y2W6LUY9zp4Rw/6/oz8y5DJivXpixmQs2FSN9z0nM2?=
 =?iso-8859-1?Q?bIekmsYoYVnWavzAoSNN90A1gWkxSxS8ECxTnei4i+gNHDw+AH6XojHCOB?=
 =?iso-8859-1?Q?rT6cQY/2R5Migr3cei6zk0c5C0z2yWAovM2DyaKUxDLl+FyFfC2L9Lc+qR?=
 =?iso-8859-1?Q?Apa2DKC/uYfiT8hzC1sD3DHCddMHDWqAhJ7mvquKJ/QXVaXqxrmU3btrIi?=
 =?iso-8859-1?Q?h1ovK/htS76M8k6+v60LC1FJciifmsofNlPpXE+oBna0xtVlWakYkRE55j?=
 =?iso-8859-1?Q?+sQEqhnr8wb8la1s35oX65mNqbuFuw5dc3AEeT+ieZanO8LuBaDLP+Z34o?=
 =?iso-8859-1?Q?6IdWW5j+SYhxzWVxEBO5Zbjt8AF1ULxAaNLQn7VEAH5P2xIjcgipscTXL5?=
 =?iso-8859-1?Q?pwCXp2I064X/P9Y+1n4QW0QEd1GYBTkO43HSx9c5UDpp7b7SsUjFxNR3oW?=
 =?iso-8859-1?Q?5BlUZuPONCh2QZLtUk0P2XxfVtC2VUrn54um1/qUtmDITS77sFCFBvyOqE?=
 =?iso-8859-1?Q?AH3Xq32rx4bE7apAQAY4Cnh0wmwcL/792ESJqr//otCkndC0QKhtOPNl2R?=
 =?iso-8859-1?Q?vJ9vYs1GcWhRRP8bgXJXjVx41Hwkwtm3hnFNX1InD1jh3TfEuDAIAQl+CC?=
 =?iso-8859-1?Q?DCZ4YsG5tTyGgClih/u548N7b+hmJ+k9sCmzuoBO+fiGl9JWoHzd0uq7fN?=
 =?iso-8859-1?Q?RHJmF5eBXsIaE9zULB3UQ4PN+A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(7416005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HhojfD0uwn1qPiGK2bf6qcQi0+RVeUm8eIrnHjcGR0jFQYoolh6nC7fRqC?=
 =?iso-8859-1?Q?PqY30hfG28Yc4yJ/K55mUZA1fEOyrdSJmPe6mcfJIllRSkQNKXb6MERxVN?=
 =?iso-8859-1?Q?esJ938iS4KeiMp5gmfTOGV8rjMXVKmWLk1S3cq0Y2I1Ws5NOc0jBeVcPCQ?=
 =?iso-8859-1?Q?PSDyvBXzRnpCck27o0pXP0xRIGj3GPuGcm1kc7tW1BL2jbK7R4psQGsvMe?=
 =?iso-8859-1?Q?cnpyxwmCh8SW3QnqWih1+/xpdfwdS+0ltv0ZAcuMKLtOGGnKG9RxmhMr+f?=
 =?iso-8859-1?Q?oImb8IKF0Ds6w+UFoCHNCtQ7ehHlExduSguMvEioEstkQzAjqF+DeSV6eq?=
 =?iso-8859-1?Q?kLGR1OJ05ASStHpC0S+zc/g+ATwB+4fJoh/915D3/QtaynmcQ3uTCI9CWp?=
 =?iso-8859-1?Q?fi9HHrdLjbOqsGbnn/mRP5dbN/5YQlZAJOsTgPFHuJB49XdGNnje4a7Va+?=
 =?iso-8859-1?Q?h3lky3w00mONWK1MIrAe1r04GhTB0JOk5On/3fpEAk9HITkD/I5WW6HqOh?=
 =?iso-8859-1?Q?xtGDSk2334XXQtW8up4F12AAtTVxIaHiMhjTDGUe8ulO4GiAul5nHkyKhE?=
 =?iso-8859-1?Q?5djb/zCtvQIMjC2dmJhXQ/c3ucoUQjjuBAKAW6YqMyvsG2PO3itjQg2jNm?=
 =?iso-8859-1?Q?34ubkJEOpuKVjN236av5sOh8ejL7zKBJDMbobeGdgWkb1Mou/FDnKxwlyX?=
 =?iso-8859-1?Q?H9zRw+lhofM/fOuv5cfztfRwDfSNXoyPSikVJRuet7XFF8kA0F8QXoYbV6?=
 =?iso-8859-1?Q?cBRrlwESqX8vsoDhdJgT8edA5qHVyfbbONRPrVFtVSxrWoKLx39+HjhL5b?=
 =?iso-8859-1?Q?T798Kt26BTyZE+Odqben0wrVm77B8PzMJE4AG3SdMbm4yaqcU08CPl6q57?=
 =?iso-8859-1?Q?NqcSSJHuDYbQleiVnO6GE/KN6G8Nqq5453/ZO32+FokhhhNp8m97MOr+7/?=
 =?iso-8859-1?Q?iVJIMWyiGHN1JMZikFJTvTzE/7y6A9o4eVt4gLxiSLJP8dHll7nppz4UfG?=
 =?iso-8859-1?Q?2Q7qnlPGpCeX7gpjwIW/qfljSA6fuQWsqeAcrK3AUih6cvT7BHAr7jSqeN?=
 =?iso-8859-1?Q?tr2RH9/Wp2HwXisE/JgMeIMRbr4TIseOibBwWcRPeKWi9cC0vQEWLVwd3T?=
 =?iso-8859-1?Q?Moj2HFoNYoPj0h9/EpgTZxEDO7jX6twck18ho2GPzC5eCQmCEacO4//+qq?=
 =?iso-8859-1?Q?Q73opomHbS5KUZsVs+FfuoUw5tH4NgGQbyyUKygD8NqJ8yuUyimKFVfYfP?=
 =?iso-8859-1?Q?nbJNxAKPgi+fkCogqv3KWsfegX0CtW5IEACVAIs7kVpTgjtd+9nR9E9ULF?=
 =?iso-8859-1?Q?K7ZpJGnK5/s0jXRTDckEqhZ7tIyUdn2vhNiSONlq8x7McsIMJ0Or0iUtdI?=
 =?iso-8859-1?Q?VeP9HH5dsVb5+ke6BXvmIgGTQaKetTOH2YNLGjvGArPUR8o17nJmxpnJ9M?=
 =?iso-8859-1?Q?3kndbV6d3/GFAs7D6P8HRDXeYVJ2BUNLmb+KNk8KkH9Yep16OpqMJvDW0Y?=
 =?iso-8859-1?Q?7AV1DGuaveWc9734FG088m9jnCIjUh6O4bagIrloRI6iLs+kgtLiF2dodo?=
 =?iso-8859-1?Q?jtWnG+9M8OIvmPaYXpqJ6cJQrqgBke+5J20lW6svIA0lb9/+B/KB+qPB93?=
 =?iso-8859-1?Q?3IyyD/56VKKqYMr8TAldiMn0lgdHgF52b6clQVH6Vi3q0XcK889BhIEw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a807f3de-55a1-4b0a-7a51-08dc75baab96
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 15:12:58.4543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +X1VutmPtW/Gd0lf7xq8LyrAq3/n1SL8xLxt9vJuNqCfG96svgrOP/fTxEGcxNd16J1jsS9Iu6JYFe/DWDNC6XEGBDU4ezLIPa102mGN0IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6441
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

On Wed, May 15, 2024 at 07:22:22PM GMT, Oded Gabbay wrote:
>Because I left Intel, I'm removing myself from the list
>of Xe driver maintainers.
>
>Signed-off-by: Oded Gabbay <ogabbay@kernel.org>

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> MAINTAINERS | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 5bd45a919aff..2469607ff5b7 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -10863,7 +10863,6 @@ F:	include/uapi/drm/i915_drm.h
>
> INTEL DRM XE DRIVER (Lunar Lake and newer)
> M:	Lucas De Marchi <lucas.demarchi@intel.com>
>-M:	Oded Gabbay <ogabbay@kernel.org>
> M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
> L:	intel-xe@lists.freedesktop.org
> S:	Supported
>-- 
>2.34.1
>
