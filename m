Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A69C1117
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 22:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF4A10E8FE;
	Thu,  7 Nov 2024 21:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1NXGFmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38BB10E906;
 Thu,  7 Nov 2024 21:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731015537; x=1762551537;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nAKxxRp9KUlbjkSeTG5LG0mq8GKYEZIMNtv1LVfHeu4=;
 b=f1NXGFmT+6sJ+25pDk2qbS3wfvuKII2dzH4XTZeUbvxQHPzdDkhxwMyr
 a1UmM9oqJS31421ceOfPC86NZHZHqtEQAu5z1Oc4ovKRId2GYPunvtShw
 Sbe/IEFU1AF+CG18FLQDZMUK8BGEkiTC/PBHO2DnMmFQtHt/DufT3jypV
 gkfm/LaUxvci/AuRLEzsHTYe2xbcQPDEqA2e1A4tBeCj7LAqIra9cwxAb
 dakCBMxQfHekiz+9C4Ma7u4110R4JLjve1OKcTa8sVmroeOYDK2BpL/Cp
 MOGKkD1kqKtrYeMSIGQNOjqd6kmSY46vpRZ0Wic2GMTRKs/ODKW+dMpcX Q==;
X-CSE-ConnectionGUID: T/HLOzU7TJuPnijV0ApHpA==
X-CSE-MsgGUID: cjXWO5bzSXmL44NuXEoQjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30285386"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="30285386"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 13:38:57 -0800
X-CSE-ConnectionGUID: wde8YiTaRsCUcPaefGKHpw==
X-CSE-MsgGUID: gnHwkvgNSam7R/zAxGgaeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="84863802"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 13:38:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 13:38:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 13:38:57 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 13:38:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1BDpe4AtjzeuFqM1TJ2nmUVvVjPtXosqZnYD5Y95SrFkZ/VTIxLv2wg7SYZKcdy8KalFNq1ZnqiWl3ZcUz+NK2TcMj6M7eJ4LTLpyxR0Os/cc4O3iHnEajzSVD1kyjN6JPmiT0xdbtRvdAZ1MPRogFVGxXRj3O1S2419kzQfnAQIiUMtnCF2o4+Z4ncNLCsPa+khEjGdUGhpm8shrmQrDk3R5FECM2QZ/JclQyVqSHJVEMXsxEq85/PD+HeONNMuS+0qxj6IyMNMzhibSQnN9Ozo5KtwiMMHe4lx1uhXe4aHMPOvxaGYs66XT6l74XMpGEEb8/I3mQSPBcujGe20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j15/7T7riphkMci4SsEF2pUFGN0j20IFXlWyEpLd/RI=;
 b=Dga1W6oxLHGsvAERC8lF1Ajk2jZFJ1cL6dDxEYP8dlBvrERtlF8hYCZ8fYAFGcTxVA64HqQ6a4LVwp7viF03ipshz5EHvx/cmT8nHFDc8VFwLunTmjaE0KSPtN9jNNJq83g83MDAFmqiU7cE35jvk16LI+Rs7QmsTYDREdwRF92cDqxvqcA4ySowNy3Nw8Hmhtuh4Gi7bIvrsNxCAbSAou1foyc4ocMNNPyWQxjSuIREOngjP+g0j9dFlhHO8oDGrgYBtzgoV9aHUj2eOvNniJl94AsUsu33i6/ordY4PDKUS/GSJdMAqr2oheiBWDUWHHa+Z/08GVvnvplKn85BDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 21:38:55 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Thu, 7 Nov 2024
 21:38:55 +0000
Date: Thu, 7 Nov 2024 16:38:50 -0500
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
Subject: Re: [PATCH v2 10/10] drm/xe/nvm: add support for access mode
Message-ID: <Zy0zalKiZXB2G1-X@intel.com>
References: <20241107131356.2796969-1-alexander.usyskin@intel.com>
 <20241107131356.2796969-11-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241107131356.2796969-11-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d8e3c6-7014-440c-27b8-08dcff749470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VLBaNOeVAxJfOEI/jNzGuz4KPTB1pDxKoD27aYQYYGJfEAEJ++hzIsjcgowI?=
 =?us-ascii?Q?5q1mLNa2K3gjNXsqlCcgUz/QvG3R5C5rTF4c8Ba1dSeTblQMGl5bWStlssPs?=
 =?us-ascii?Q?uqTS48sKNncK7oHVq8qNgFPQtKyBG3cfR4bDrKUX+dPbwKWVJpTVVEHoZLQQ?=
 =?us-ascii?Q?FHm+BPsbSWV+h/D2uGY+i71LWRYeLU5aVEubZWj8NcMvSGIRyp/2hBXG7Ara?=
 =?us-ascii?Q?1ixZ2Xpn1K4TBKp/MlF8ZICIEgLHbwpvUBNkusSfJ2ZbBo1ZJ87zTSyu48uC?=
 =?us-ascii?Q?7vQ3gsWwpnm9N25L/ni63VKRJPe04PuWmoWLf6qRv1HCe662yBacgsRKV3xZ?=
 =?us-ascii?Q?h/gasIPkf6REH0VbUiDJXhjEKjk/dwbUMeX7+MzNYg46gYH1Mj0DZpT6uO/I?=
 =?us-ascii?Q?U1mjGvxRH3qRbLKUS0tyuieoE/nUWPF7/x5Kt1wTrujBGfJiE2UJ0Y6H5u/I?=
 =?us-ascii?Q?DsrmMUjabUjt8/pnoDT+ZDjzSpRDs8f5IlCVIlWlUpGz1ypq96nJ0yQ+Psrc?=
 =?us-ascii?Q?OeZFUp1wLtO3/Zd52GzHRn0NLw/riwZGAZRnIeEXLIuQ1kPr0POK+3wQtsqg?=
 =?us-ascii?Q?95gIKcX5KiUCy3ZnEn0s4AlytxyyuRkeZZAAlfJyuHln03WSf3LDh50O0wqd?=
 =?us-ascii?Q?xMwr4NcTxztB4J/Q2VcSL6w7ffVAnoTJ6Y0SHWz5HFgkY0u3a29xD+Cx889z?=
 =?us-ascii?Q?2MqE4JGkhAKglwMmJA/RMJ+TCdigegpoGtKSADquJLaBmhlNb/gApVRuM3sB?=
 =?us-ascii?Q?rfSieNpTaryTHuMKioAs0FJMMy/3hboI/aGxlUMcnxT9FEneHtRkqSzIRvyB?=
 =?us-ascii?Q?g1LMv/TchFsAkJfD06WTdHk/OM0+I/rdGza7+TpZqc8cfm3jkqWQ8liAz15P?=
 =?us-ascii?Q?oNe86nPz/WimIl9S2p+prt+P58X8EAGtKbOe8WKTSVHtGflEYUI7uYBCgMPw?=
 =?us-ascii?Q?bEjQDlDFRsc7oRRexmwOhNW6zFNrE896OGoqpZ1qANOETXrPLI6yBllpK04H?=
 =?us-ascii?Q?NJ5TuhRf5F2kn9BuKdI7vPeMOZaseYbQpcIeDfC5xJJxOZlbbfDudnW0Hect?=
 =?us-ascii?Q?vadvoZTBYkK52FZcbleTatJ7o8yPzPMytaGpoT5urN1mLVJW7qKc+hCrQo41?=
 =?us-ascii?Q?6EoMaU3msC5FpF5QL9geCF6SwW4FDOMNIi7eogRyqCSzSE4TCaA1c67p9lBZ?=
 =?us-ascii?Q?zhX80ClZD5Jkoal1fpyDhaOcm4oMOukl6A2yMmrKkKo7FFVcg1TTacfmZwQP?=
 =?us-ascii?Q?6cZxTwsxTG1K+pvQAVfcjABwd6S0OzVzwDudeHtazbOAmonWsOKRkPfIkIe8?=
 =?us-ascii?Q?d1hC/mMgpyX0qNyn3ejRiwAP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KbBJe+snlQLLDioZPSWbFRgXmH0B6fBFQ2Gq3is1Y1ztc/xva08NO8LCcI8j?=
 =?us-ascii?Q?F4OheZOSN3cGBtwk5y9HrPc/XyAhzO4J2N3+Jit4lUlcDlzailZY8m38o3Xq?=
 =?us-ascii?Q?8oaCTH7+i9Kx+tyutJLY9ka5FED1HxB4saZ9T2c+8cijYW0egYaNz8AueW9u?=
 =?us-ascii?Q?6l3NJKf2FmQBMx2nsrlNePdquT2VTZrkBUkXZMPlLimIMK9tFqJhPQGFO+Bc?=
 =?us-ascii?Q?eFq65Tzcxy6R616g0pm/9GMsTWowPGi5rGsQlejhHm1ReCOwwYAUrcU65PTJ?=
 =?us-ascii?Q?39AG4CChrNxNotwFLu8Am9/rqw3nLzIww6L4cSQFt/mmeuqo2hM5L5fHqlDA?=
 =?us-ascii?Q?TaEkYh0hBI/RTWdznZdShas1X1/EuJdU4KgH0P5z4iwOCO3UFuJrhMDTfkIR?=
 =?us-ascii?Q?ulixs7d5OE8eGsaPGDIU1TnSssX6lqB9F1pxE6QjiR/x5e++WYcPjrPl1g4z?=
 =?us-ascii?Q?bU4kO7b9129bvNS57QSCZHQWrAvW0nY0ThiT83u7yZtEdtarWHz1TGKDrjha?=
 =?us-ascii?Q?kQZwfiHHVDkR4Eax5Mo3LJCfyhSAhgqjdQ9mK8TeE8ToeSoU0qqfbDl2Fnxq?=
 =?us-ascii?Q?1OKYv7pgS6GHbB3f2m+gLlgBRoKWNiwMrxxMDEAgdPo0ZoPFYoG/+HUq7zMs?=
 =?us-ascii?Q?Qkq1khsrJdMW8EK5wHFcUa00ztDYeg19J2djm029TxWuVg+guxMDd8HywppT?=
 =?us-ascii?Q?47wBo94yG0PbtM6MLdKBVzx6r20qKlwtWKarzKwoVo48sIGMT5hGqC6TvAiH?=
 =?us-ascii?Q?WsqKLf8fImHZcW+D3cHU77VawYq2BHzVitRhwRXT4mnBjY0W/f11a6d7nv9R?=
 =?us-ascii?Q?Sl6a438DrQOP7yJ3HZkYyQDCx5HghfOWS4uB+xcU6+O8zGA024j8EW+il/lo?=
 =?us-ascii?Q?YemPakD0LgJvuActuwWuoGEEvE6KN2SNzVbtrB2mwEFHdNKXq/ES2vIv5410?=
 =?us-ascii?Q?BZXsrdIgRWvvBEGnTpVBiZx3Y8idAFxYmw+qqU8obB35N+aAvTCst7GDClXp?=
 =?us-ascii?Q?+8hG5vK3CZNIwrOiEZGxpqApdDTjqWByag5HIrS61MxRDDgI7XQZPPE4fLds?=
 =?us-ascii?Q?9+aNE1N5Hk7U/sgOd0eRZyKMXYDzJWGiDaJPuv2x7DQ+vYncus1zitf9ScpR?=
 =?us-ascii?Q?Rq5IMs1jKLREurcEW65PX++m7C/bf1IERKMp33gw9KtoyQbtnbNgSoRO1kWr?=
 =?us-ascii?Q?AnJS8x0m4oU/c63qBLEQZv/9AlkVlYo4fdx2z2wsnxMBf6mn/uMlj1Rewhnt?=
 =?us-ascii?Q?WqsfDP5eBtB3O9oNqbBX9BfgT6rWCkXaxTrxuhU760t0kW5DY/WWZ51bln/w?=
 =?us-ascii?Q?2jpRSoyqEDxFXz3aNLgP5q5Lu1MHVsg8RM98MgmKooyW7SY6k1QiDN7GfGXC?=
 =?us-ascii?Q?Ep7+NkeLu5B/xKWZNAWF5p15eaZ6YZs5rLow2lva2X+mrpVE0HFCR0wfCr6a?=
 =?us-ascii?Q?kapszzUbDTMBOG7WfACsbigYyM3s1D8eOLbNGt41ZuuDTZy/7e+c3DZIxqb6?=
 =?us-ascii?Q?qRZe6anMDGRJLNb976POUqlrOCIufuIhGTyTb2IWI98zMOZ3CespGKdFJBTO?=
 =?us-ascii?Q?XMBuvUhF6GyRrysQ8+W6wbl2negAgp+I2T9CPsEVedZidmgThxX71nFiGstp?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d8e3c6-7014-440c-27b8-08dcff749470
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 21:38:55.4480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBlhys088Ry7EwKakU3QVSbLQAsCZ2CDvgfoUhl1hQaMUhmttQiOrDJDP+EOxKButqk7ImZ5zd9VdwstxwHcTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
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

On Thu, Nov 07, 2024 at 03:13:56PM +0200, Alexander Usyskin wrote:
> Check NVM access mode from GSC FW status registers
> and overwrite access status read from SPI descriptor, if needed.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gsc_regs.h |  4 ++++
>  drivers/gpu/drm/xe/xe_heci_gsc.c      |  5 +----
>  drivers/gpu/drm/xe/xe_nvm.c           | 32 ++++++++++++++++++++++++++-
>  3 files changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> index 7702364b65f1..9b66cc972a63 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> @@ -16,6 +16,10 @@
>  #define MTL_GSC_HECI1_BASE	0x00116000
>  #define MTL_GSC_HECI2_BASE	0x00117000
>  
> +#define DG1_GSC_HECI2_BASE	0x00259000
> +#define PVC_GSC_HECI2_BASE	0x00285000
> +#define DG2_GSC_HECI2_BASE	0x00374000
> +
>  #define HECI_H_CSR(base)	XE_REG((base) + 0x4)
>  #define   HECI_H_CSR_IE		REG_BIT(0)
>  #define   HECI_H_CSR_IS		REG_BIT(1)
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index 65b2e147c4b9..27734085164e 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -11,14 +11,11 @@
>  #include "xe_device_types.h"
>  #include "xe_drv.h"
>  #include "xe_heci_gsc.h"
> +#include "regs/xe_gsc_regs.h"
>  #include "xe_platform_types.h"
>  
>  #define GSC_BAR_LENGTH  0x00000FFC
>  
> -#define DG1_GSC_HECI2_BASE			0x259000
> -#define PVC_GSC_HECI2_BASE			0x285000
> -#define DG2_GSC_HECI2_BASE			0x374000
> -
>  static void heci_gsc_irq_mask(struct irq_data *d)
>  {
>  	/* generic irq handling */
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> index 787272761e42..3396bec29c97 100644
> --- a/drivers/gpu/drm/xe/xe_nvm.c
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -5,8 +5,11 @@
>  
>  #include <linux/intel_dg_nvm_aux.h>
>  #include <linux/pci.h>
> +#include "xe_device.h"
>  #include "xe_device_types.h"
> +#include "xe_mmio.h"
>  #include "xe_nvm.h"
> +#include "regs/xe_gsc_regs.h"
>  #include "xe_sriov.h"
>  
>  #define GEN12_GUNIT_NVM_BASE 0x00102040
> @@ -24,6 +27,33 @@ static void xe_nvm_release_dev(struct device *dev)
>  {
>  }
>  
> +static bool xe_nvm_writeable_override(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	resource_size_t base;
> +	bool writeable_override;
> +
> +	if (xe->info.platform == XE_BATTLEMAGE) {
> +		base = DG2_GSC_HECI2_BASE;
> +	} else if (xe->info.platform == XE_PVC) {
> +		base = PVC_GSC_HECI2_BASE;
> +	} else if (xe->info.platform == XE_DG2) {
> +		base = DG2_GSC_HECI2_BASE;
> +	} else if (xe->info.platform == XE_DG1) {
> +		base = DG1_GSC_HECI2_BASE;
> +	} else {
> +		drm_err(&xe->drm, "Unknown platform\n");
> +		return true;
> +	}
> +
> +	writeable_override =
> +		!(xe_mmio_read32(&gt->mmio, HECI_FWSTS2(base)) &
> +		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
> +	if (writeable_override)
> +		drm_info(&xe->drm, "NVM access overridden by jumper\n");
> +	return writeable_override;
> +}
> +
>  void xe_nvm_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -48,7 +78,7 @@ void xe_nvm_init(struct xe_device *xe)
>  
>  	nvm = xe->nvm;
>  
> -	nvm->writeable_override = false;
> +	nvm->writeable_override = xe_nvm_writeable_override(xe);
>  	nvm->bar.parent = &pdev->resource[0];
>  	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
>  	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> -- 
> 2.43.0
> 
