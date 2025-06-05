Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A720AACF9CC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 00:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D632810E162;
	Thu,  5 Jun 2025 22:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJEqruWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C6610E162;
 Thu,  5 Jun 2025 22:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749163443; x=1780699443;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6INw+bBoZ+4M5bRqlDA9K6i6BcBpdBNdDb0k1a/7AWk=;
 b=oJEqruWpnyu/Nh2WOBKW1zgicq0ECoKPLXTWlAmIcob1Ax3ijybMAC/1
 GLJ03K0Rfv6pZr1HJe7oNRY5j5k4VUHqzKaHKNg2HL+37n3X78QHulDZb
 p3WyqoQU7JufOmSLcRCwwK3brtLQklk6eo5ugjhfGuhOlvxqxW2kGdh2j
 /QRZ1FQc20If23N/8CWC0gKaXj4bxxSIYeQPxx/wjX1sfGrM8zbb3Plbr
 6iHmMzeISkCNlH/ptWoxsFX94crVyIWbJklIycTUp1O9T7XkTrtI0GMfM
 KupEhKQvBtHhqbq5DvE2ELbcxQOD32C6uIMvo8BZDObdhzP6O8oCQvX/c g==;
X-CSE-ConnectionGUID: or2rBPIDSp6i0uMEVFjc+Q==
X-CSE-MsgGUID: 1zwJdD0ETMK3AzI3iG5C/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61571431"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="61571431"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:43:58 -0700
X-CSE-ConnectionGUID: iftfOVMvQp+STxVzkw89Kg==
X-CSE-MsgGUID: GCIz7SNCSn+nhx8heaPXNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="146628359"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:43:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 15:43:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 15:43:57 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 15:43:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlMqx31nt/rDd3sG/NZP/53cO5DTo8qE95r/q8bZHMj26ArCK6T14cpOxaOS5ZLGB/zwcwgdR2AkjfPww12gx2g3+8dkhjm8kMsvkHWAhzxvdskabRQL5irbuRGkxSUtYmBIdtGx8u44QW4LR/yEkR9m7zlVdebtxAUrtzwekgnxCycRoH+x3wiHvkSIeXSStIrmplMf04uxCpg5oaxnXLiTe78WKjoFogI3LBQjo+38mNviwe7e2QRnf3V7v3plQZduQeDKMcZ4jwu/LJXghuG4e7qVo4fL+VWLg5bH8XLbt4q/8eKxPHkpTzlOgjybDbaWCu2MmV+vbOwrbRaSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpfPWt3wqXZpmvdLegORZ6o2dhTE9gyDjrEn9M4/YBw=;
 b=JH5sVwV8uy+tqjb7ShsTw+1in2HyZkZa8fRYLBvfYV52YF6duBAiVJlzW/8udkLmvFRMD0gx+XRiX/x+ofiDZ3tEaHZ5XZpLhPRArDMBLuQTlzSFtLcc2LMoGyE2C4BSC9zofMIY2e9euspdD8QlC6N8UsxsCBEd2Y4ZuRvcL8AGd8459ATOOtDvK1N7yskVtW26m6ov7zWrLOgUCmshN8Wrrdk1p4zYO0cEs6NzXFxptquvu9TQ82R1ZzXNO5lETw80OWLGNv2byxcNubzqOzhZDapFXQiLCHKMKwALJptrTDDONUiej5f1A4PFH3jE5qSFf/XcKsbRFFSf1SWQQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 5 Jun
 2025 22:43:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 22:43:22 +0000
Date: Thu, 5 Jun 2025 15:44:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/gpusvm, drm/pagemap: Move migration
 functionality to drm_pagemap
Message-ID: <aEId57TJ64kdNDK2@lstrano-desk.jf.intel.com>
References: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
 <20250604093536.95982-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604093536.95982-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f4d1713-cab6-4c99-c313-08dda4826038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?BONoTFGaGX3bNNcSVAa2MIKPdWaaK1/0Hv4R9m0EBal6HAJ1aMP1m+U2Be?=
 =?iso-8859-1?Q?/iiPOUvuhyISftJhDYyhwMg166uiDsycdzkgozmzjq/5684qZhwq1YJ2T+?=
 =?iso-8859-1?Q?ssB3CjovR69qIx22fgVR2tREjD1CpCSNoIccsjfKxHfpcT8u1ooleJYJUt?=
 =?iso-8859-1?Q?sgNw405UU/I8+FFC7ZwmWkWsc3JMwS0t1dYF6F2mHs5ioJ7ueq0UF2vrPV?=
 =?iso-8859-1?Q?nfRDQeSZXj6MKLl4sR76b4FhuBYIXAs3gut1JIdItbAer525nmbDJElyjo?=
 =?iso-8859-1?Q?ebMLnTbXeosIE7Q9+4SbcAIdYWk7auxLmpcLbGOscjuUT+PReMouBrs9pS?=
 =?iso-8859-1?Q?37xI73IzIhil5tjSd0EnTtltX6Yz7cisYi3Z80WPkYZ+8F3u35V1D65BVb?=
 =?iso-8859-1?Q?x5Jonf8BaiX7o3GXuOF+5V/vkGZ5xMFLO+IiNEKlxrDrDsNzF1UrTLPmVq?=
 =?iso-8859-1?Q?BNNiStd6wSgzrqCr5SSfVOzs77yU0ZiknwyoqrpYUh3i60oZh8pdAUNfeC?=
 =?iso-8859-1?Q?uFxlZsZvB7E34rivCMMmaotnPvtxmTuXizKfqw7Zoijn++767tlNdjqXF3?=
 =?iso-8859-1?Q?6S702Enq+/LYqtGQWAmyy+qpSanEZmd2vsjA29HfC+Gl+y9gCHALKPocjl?=
 =?iso-8859-1?Q?BIedQgXPv2SMIa3ZvyRJD24vTl9ywBJV9Blr/w9EgKcJClsdOrH3vpPIMX?=
 =?iso-8859-1?Q?jAgLPD7Ln4hGFWEniuslhUtD7sDljCoNfg5ydIMJexnUy/cDPmMm8wvuDZ?=
 =?iso-8859-1?Q?z3CXnbJFrk/SX5Auyllxl/ZP4zwzLwveRVNQx1SyfGt2EjiwEi/7LwFVCB?=
 =?iso-8859-1?Q?pZx1xWpI0mktaaPF1GGqUfFw4E75S2JqHJLmtdTbTSM4qAy+r9w0curTcQ?=
 =?iso-8859-1?Q?8poLecUp52Xn2w95wR1s9WcSSFmZroWgi3WuS1Ko3mPRf7KbWyUHBQBtIU?=
 =?iso-8859-1?Q?Lqfwop4DD5A29a8Fgyr0CNx/9SbPlYpf8L38z4qO2E2OxJ9lz/0GSnR0NX?=
 =?iso-8859-1?Q?sIe6VDjtL/eP68OfE1g+VUfsUjgy2tCcRXsIeh24Isdou6VEHA1a6z+TYz?=
 =?iso-8859-1?Q?f429KS8jGwdbJk6O9mj+6ItcI/UVz25doptEwT4N2Zm6TK/zxuL+6v9Bb0?=
 =?iso-8859-1?Q?J6qJcK/xGXtknVOA1W4uvL2KYF6Z9Q3a1T0pyh1wFtbiOwpB8uQ2TCmquG?=
 =?iso-8859-1?Q?0fXoF/xV5RqwGcurbDcCjgP8++STHL7RDFeiVeNW2co3UPvtOigmmrIxog?=
 =?iso-8859-1?Q?DLP+Ll8CZt2vTND8c1mP/fVLqbltTBVd25wCq44IleBgFIGPw8DICOU4Ua?=
 =?iso-8859-1?Q?GRxHmOsCpBw1/bUp/zRc8gFdyCa6kcPAFGgXsW6hUl9CcR9SwDxJk8Q4rv?=
 =?iso-8859-1?Q?XP8t6BYdwBgion7G42iqWaYUp+5oq2agvna4T4bp6xGaVbsLHM/V28kwB8?=
 =?iso-8859-1?Q?AdXecXr/7J31LGTPEcOC15ZGhh7TlLFZGxq5HlbVC9feYqR9/B+zlCncEr?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?x4L8lEzEMbFGD0R/xHjE4GZSY2+VX2pPJvWhs1oSOevtzLuMoymMFVW8pF?=
 =?iso-8859-1?Q?Bp9zlPHlASPg7O3GtLxWquSzw5XFWS1TJD6sTJqFrfe1hzbbygZ+tGbFCy?=
 =?iso-8859-1?Q?0mMmNmuG/akHZCQwhq6tbJXegjmKKq8Xux8HC9c8Lwjkx4cMwsyPKOen3A?=
 =?iso-8859-1?Q?rGSHr1+IIGbaIOsw10Hpb1K6NzmzQoPNwoim6AmI5cC0XAZfViFZgVsVRR?=
 =?iso-8859-1?Q?5sAwlyRTGIKTSvl7iPEhs4rtQ2IUtyeKhpAgobAM8vIfUUUntGCArI96bC?=
 =?iso-8859-1?Q?Iy4B6Fh3rtFn55mKAq9DhpPn8LKNUX2bHF8KArxwKbTb8R2VIJfUiblWja?=
 =?iso-8859-1?Q?6FBxoPMNLKSmWpmDvmlOj0m7dQrWhgcRBRvaeNavC3GzobuEd7i8iRrkkV?=
 =?iso-8859-1?Q?CSWrz38HKlc/JrzIpncbqnsadSKgD00i7+ofCkcJUZRAIVGVHq3tIR/y9E?=
 =?iso-8859-1?Q?AExwPCE+13mG5YZkYAf84qKd1/RRFBF4+Pea5BcXJ79PKeIdrJ1gVxxIZi?=
 =?iso-8859-1?Q?HoOiXSQtakUzAK7FuDG3Fnj+6XnOFRujgca/PDNWbvUeLL8atOBNzQNWr9?=
 =?iso-8859-1?Q?jlVWOwEipFLxildzBjKL+2EqDPzziRZfV58p2Z6CnDO2PZOmX98WHUm92N?=
 =?iso-8859-1?Q?BDPJtFdbr4bbxnaM4u4+BudZdoY9utyZ/drXD8bI4oOP5u5np1wWF7yKQZ?=
 =?iso-8859-1?Q?oE6Wqu811S1OEVTrIpguvdeZvz5L47c14yqaemB1WzM/sDEBof/Jju/c6A?=
 =?iso-8859-1?Q?NzJa2D5LsddWoEeirGGxHcIm5BFUBinBhXnHenzK3MzSz6pVG8/S78vBYw?=
 =?iso-8859-1?Q?DkY2bPEyfG0oC3/6cq7nzEZB6GdU+pPyomg4UoKICA0Qj9Ys7V6FwjhkUR?=
 =?iso-8859-1?Q?0GMsalDk2GjWVmk25Xf+e8FJ3zflfBK1Jd0+ogw/yFvD73Qa1PhoBXn91K?=
 =?iso-8859-1?Q?OCzt9gGG2bLFkiNXW5TaEbZeFYAUmQ8AsCi9pGJaYMNO8OGBQcnWNvRVG2?=
 =?iso-8859-1?Q?8y93lKuoUJN4IIzL3X1lT/EThAS223TXy1PecET01wZ01LlUoZNyR0S0BL?=
 =?iso-8859-1?Q?bJ11m+bxaf+fQzBdFQjkGGvYol/3GdKmXJMlQdLLgPmOOPXUnVQGt+PGlr?=
 =?iso-8859-1?Q?2BDASmufn7dRURhUn8UZQn2xG+T9fXukAgPML4h8tT7nii6L32Z2SM0IMp?=
 =?iso-8859-1?Q?MmGZYd0obgUlHadpGUe1eiPGgNn0KhkbYU3lDnjS8w+lR8PnMv4VKAPfo2?=
 =?iso-8859-1?Q?gSDI+yOC6GxhOzNT4Ml3Bg2Ek8ULEi381MgPv+CZ29NU0zL+mRXGVAP/BO?=
 =?iso-8859-1?Q?ipDxJuCH3sWHe9txZFLJInPTMz5iNhBANdKgdv8AVK8LaCXzSoY0O8tF/t?=
 =?iso-8859-1?Q?17lfyk90ZxWMMgX2hfrAfQG+SewyFR+G/wsT7RRysJFmmBnnf9XmgIHFft?=
 =?iso-8859-1?Q?YRpryorxXnXbHqZuHE0e7zmWL/z88xIqCiOggQXD1kkmK8l50YyOEWwplP?=
 =?iso-8859-1?Q?90ZZY+w1/Omv3F80UOBzeg48xtKZqmwOZkxug648bMSF2F4CrkmbnX2hLX?=
 =?iso-8859-1?Q?HzyORqMvkhLb5LAbPPmkpGriMdBFwZsler8sJt5RlwU4RZuccvbMNbGH7h?=
 =?iso-8859-1?Q?EN2swwYc+MNKUl7cEwKfhCr0qQTrLZKMmJJAatrwu1b059XWxHl6axPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4d1713-cab6-4c99-c313-08dda4826038
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 22:43:22.6776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Ar6zJpE1SZ6hofQkOiJPxTMrMU4ku95vyXjI0ovKyG7RBUwx6l2/Ae856ux6Y8vRS82Zmx8mPWCzo+AwVwy+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
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

On Wed, Jun 04, 2025 at 11:35:34AM +0200, Thomas Hellström wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> The migration functionality and track-keeping of per-pagemap VRAM
> mapped to the CPU mm is not per GPU_vm, but rather per pagemap.
> This is also reflected by the functions not needing the drm_gpusvm
> structures. So move to drm_pagemap.
> 
> With this, drm_gpusvm shouldn't really access the page zone-device-data
> since its meaning is internal to drm_pagemap. Currently it's used to
> reject mapping ranges backed by multiple drm_pagemap allocations.
> For now, make the zone-device-data a void pointer.
> 
> Rename CONFIG_DRM_XE_DEVMEM_MIRROR to CONFIG_DRM_XE_PAGEMAP.
> 
> Matt is listed as author of this commit since he wrote most of the code,
> and it makes sense to retain his git authorship.
> Thomas mostly moved the code around.
> 

Kernel test robot has kernel doc fixes. A couple questions / comments on
the new doc below.

> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  Documentation/gpu/rfc/gpusvm.rst     |  12 +-
>  drivers/gpu/drm/Makefile             |   6 +-
>  drivers/gpu/drm/drm_gpusvm.c         | 759 +------------------------
>  drivers/gpu/drm/drm_pagemap.c        | 811 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/Kconfig           |  10 +-
>  drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
>  drivers/gpu/drm/xe/xe_device_types.h |   2 +-
>  drivers/gpu/drm/xe/xe_svm.c          |  49 +-
>  include/drm/drm_gpusvm.h             |  96 ----
>  include/drm/drm_pagemap.h            | 101 ++++
>  10 files changed, 974 insertions(+), 874 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pagemap.c
> 
> diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
> index bcf66a8137a6..469db1372f16 100644
> --- a/Documentation/gpu/rfc/gpusvm.rst
> +++ b/Documentation/gpu/rfc/gpusvm.rst
> @@ -73,15 +73,21 @@ Overview of baseline design
>  .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>     :doc: Locking
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> -   :doc: Migration
> -
>  .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>     :doc: Partial Unmapping of Ranges
>  
>  .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>     :doc: Examples
>  
> +Overview of drm_pagemap design
> +==============================
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> +   :doc: Overview
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> +   :doc: Migration
> +
>  Possible future design features
>  ===============================
>  
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 4199715670b1..f9cde5717f85 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -104,7 +104,11 @@ obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
>  #
>  obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>  obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
> -obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm.o
> +
> +drm_gpusvm_helper-y := \
> +	drm_gpusvm.o\
> +	drm_pagemap.o
> +obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
>  
>  obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>  
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 7ff81aa0a1ca..ef81381609de 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -8,10 +8,9 @@
>  
>  #include <linux/dma-mapping.h>
>  #include <linux/hmm.h>
> +#include <linux/hugetlb_inline.h>
>  #include <linux/memremap.h>
> -#include <linux/migrate.h>
>  #include <linux/mm_types.h>
> -#include <linux/pagemap.h>
>  #include <linux/slab.h>
>  
>  #include <drm/drm_device.h>
> @@ -107,21 +106,6 @@
>   * to add annotations to GPU SVM.
>   */
>  
> -/**
> - * DOC: Migration
> - *
> - * The migration support is quite simple, allowing migration between RAM and
> - * device memory at the range granularity. For example, GPU SVM currently does
> - * not support mixing RAM and device memory pages within a range. This means
> - * that upon GPU fault, the entire range can be migrated to device memory, and
> - * upon CPU fault, the entire range is migrated to RAM. Mixed RAM and device
> - * memory storage within a range could be added in the future if required.
> - *
> - * The reasoning for only supporting range granularity is as follows: it
> - * simplifies the implementation, and range sizes are driver-defined and should
> - * be relatively small.
> - */
> -
>  /**
>   * DOC: Partial Unmapping of Ranges
>   *
> @@ -193,10 +177,9 @@
>   *		if (driver_migration_policy(range)) {
>   *			mmap_read_lock(mm);
>   *			devmem = driver_alloc_devmem();
> - *			err = drm_gpusvm_migrate_to_devmem(gpusvm, range,
> - *							   devmem_allocation,
> - *							   &ctx);
> - *			mmap_read_unlock(mm);
> + *			err = drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm, gpuva_start,
> + *                                                          gpuva_end, driver_pgmap_owner());
> + *                      mmap_read_unlock(mm);
>   *			if (err)	// CPU mappings may have changed
>   *				goto retry;
>   *		}
> @@ -288,97 +271,6 @@ npages_in_range(unsigned long start, unsigned long end)
>  	return (end - start) >> PAGE_SHIFT;
>  }
>  
> -/**
> - * struct drm_gpusvm_zdd - GPU SVM zone device data
> - *
> - * @refcount: Reference count for the zdd
> - * @devmem_allocation: device memory allocation
> - * @device_private_page_owner: Device private pages owner
> - *
> - * This structure serves as a generic wrapper installed in
> - * page->zone_device_data. It provides infrastructure for looking up a device
> - * memory allocation upon CPU page fault and asynchronously releasing device
> - * memory once the CPU has no page references. Asynchronous release is useful
> - * because CPU page references can be dropped in IRQ contexts, while releasing
> - * device memory likely requires sleeping locks.
> - */
> -struct drm_gpusvm_zdd {
> -	struct kref refcount;
> -	struct drm_gpusvm_devmem *devmem_allocation;
> -	void *device_private_page_owner;
> -};
> -
> -/**
> - * drm_gpusvm_zdd_alloc() - Allocate a zdd structure.
> - * @device_private_page_owner: Device private pages owner
> - *
> - * This function allocates and initializes a new zdd structure. It sets up the
> - * reference count and initializes the destroy work.
> - *
> - * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
> - */
> -static struct drm_gpusvm_zdd *
> -drm_gpusvm_zdd_alloc(void *device_private_page_owner)
> -{
> -	struct drm_gpusvm_zdd *zdd;
> -
> -	zdd = kmalloc(sizeof(*zdd), GFP_KERNEL);
> -	if (!zdd)
> -		return NULL;
> -
> -	kref_init(&zdd->refcount);
> -	zdd->devmem_allocation = NULL;
> -	zdd->device_private_page_owner = device_private_page_owner;
> -
> -	return zdd;
> -}
> -
> -/**
> - * drm_gpusvm_zdd_get() - Get a reference to a zdd structure.
> - * @zdd: Pointer to the zdd structure.
> - *
> - * This function increments the reference count of the provided zdd structure.
> - *
> - * Return: Pointer to the zdd structure.
> - */
> -static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct drm_gpusvm_zdd *zdd)
> -{
> -	kref_get(&zdd->refcount);
> -	return zdd;
> -}
> -
> -/**
> - * drm_gpusvm_zdd_destroy() - Destroy a zdd structure.
> - * @ref: Pointer to the reference count structure.
> - *
> - * This function queues the destroy_work of the zdd for asynchronous destruction.
> - */
> -static void drm_gpusvm_zdd_destroy(struct kref *ref)
> -{
> -	struct drm_gpusvm_zdd *zdd =
> -		container_of(ref, struct drm_gpusvm_zdd, refcount);
> -	struct drm_gpusvm_devmem *devmem = zdd->devmem_allocation;
> -
> -	if (devmem) {
> -		complete_all(&devmem->detached);
> -		if (devmem->ops->devmem_release)
> -			devmem->ops->devmem_release(devmem);
> -	}
> -	kfree(zdd);
> -}
> -
> -/**
> - * drm_gpusvm_zdd_put() - Put a zdd reference.
> - * @zdd: Pointer to the zdd structure.
> - *
> - * This function decrements the reference count of the provided zdd structure
> - * and schedules its destruction if the count drops to zero.
> - */
> -static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
> -{
> -	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
> -}
> -
>  /**
>   * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
>   * @notifier: Pointer to the GPU SVM notifier structure.
> @@ -945,7 +837,7 @@ drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
>  		 * process-many-malloc' fails. In the failure case, each process
>  		 * mallocs 16k but the CPU VMA is ~128k which results in 64k SVM
>  		 * ranges. When migrating the SVM ranges, some processes fail in
> -		 * drm_gpusvm_migrate_to_devmem with 'migrate.cpages != npages'
> +		 * drm_pagemap_migrate_to_devmem with 'migrate.cpages != npages'
>  		 * and then upon drm_gpusvm_range_get_pages device pages from
>  		 * other processes are collected + faulted in which creates all
>  		 * sorts of problems. Unsure exactly how this happening, also
> @@ -1363,7 +1255,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  		.dev_private_owner = gpusvm->device_private_page_owner,
>  	};
>  	struct mm_struct *mm = gpusvm->mm;
> -	struct drm_gpusvm_zdd *zdd;
> +	void *zdd;
>  	unsigned long timeout =
>  		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>  	unsigned long i, j;
> @@ -1465,7 +1357,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  				}
>  
>  				pagemap = page_pgmap(page);
> -				dpagemap = zdd->devmem_allocation->dpagemap;
> +				dpagemap = drm_pagemap_page_to_dpagemap(page);
>  				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
>  					/*
>  					 * Raced. This is not supposed to happen
> @@ -1489,7 +1381,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  		} else {
>  			dma_addr_t addr;
>  
> -			if (is_zone_device_page(page) || zdd) {
> +			if (is_zone_device_page(page) || pagemap) {
>  				err = -EOPNOTSUPP;
>  				goto err_unmap;
>  			}
> @@ -1517,7 +1409,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  		flags.has_dma_mapping = true;
>  	}
>  
> -	if (zdd) {
> +	if (pagemap) {
>  		flags.has_devmem_pages = true;
>  		range->dpagemap = dpagemap;
>  	}
> @@ -1545,6 +1437,7 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
>  
>  /**
>   * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
> + * drm_gpusvm_range_evict() - Evict GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
>   * @range: Pointer to the GPU SVM range structure
>   * @ctx: GPU SVM context
> @@ -1575,562 +1468,11 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
>  
>  /**
> - * drm_gpusvm_migration_unlock_put_page() - Put a migration page
> - * @page: Pointer to the page to put
> - *
> - * This function unlocks and puts a page.
> - */
> -static void drm_gpusvm_migration_unlock_put_page(struct page *page)
> -{
> -	unlock_page(page);
> -	put_page(page);
> -}
> -
> -/**
> - * drm_gpusvm_migration_unlock_put_pages() - Put migration pages
> - * @npages: Number of pages
> - * @migrate_pfn: Array of migrate page frame numbers
> - *
> - * This function unlocks and puts an array of pages.
> - */
> -static void drm_gpusvm_migration_unlock_put_pages(unsigned long npages,
> -						  unsigned long *migrate_pfn)
> -{
> -	unsigned long i;
> -
> -	for (i = 0; i < npages; ++i) {
> -		struct page *page;
> -
> -		if (!migrate_pfn[i])
> -			continue;
> -
> -		page = migrate_pfn_to_page(migrate_pfn[i]);
> -		drm_gpusvm_migration_unlock_put_page(page);
> -		migrate_pfn[i] = 0;
> -	}
> -}
> -
> -/**
> - * drm_gpusvm_get_devmem_page() - Get a reference to a device memory page
> - * @page: Pointer to the page
> - * @zdd: Pointer to the GPU SVM zone device data
> - *
> - * This function associates the given page with the specified GPU SVM zone
> - * device data and initializes it for zone device usage.
> - */
> -static void drm_gpusvm_get_devmem_page(struct page *page,
> -				       struct drm_gpusvm_zdd *zdd)
> -{
> -	page->zone_device_data = drm_gpusvm_zdd_get(zdd);
> -	zone_device_page_init(page);
> -}
> -
> -/**
> - * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM migration
> - * @dev: The device for which the pages are being mapped
> - * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> - * @migrate_pfn: Array of migrate page frame numbers to map
> - * @npages: Number of pages to map
> - * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> - *
> - * This function maps pages of memory for migration usage in GPU SVM. It
> - * iterates over each page frame number provided in @migrate_pfn, maps the
> - * corresponding page, and stores the DMA address in the provided @dma_addr
> - * array.
> - *
> - * Return: 0 on success, -EFAULT if an error occurs during mapping.
> - */
> -static int drm_gpusvm_migrate_map_pages(struct device *dev,
> -					dma_addr_t *dma_addr,
> -					unsigned long *migrate_pfn,
> -					unsigned long npages,
> -					enum dma_data_direction dir)
> -{
> -	unsigned long i;
> -
> -	for (i = 0; i < npages; ++i) {
> -		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> -
> -		if (!page)
> -			continue;
> -
> -		if (WARN_ON_ONCE(is_zone_device_page(page)))
> -			return -EFAULT;
> -
> -		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> -		if (dma_mapping_error(dev, dma_addr[i]))
> -			return -EFAULT;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
> - * @dev: The device for which the pages were mapped
> - * @dma_addr: Array of DMA addresses corresponding to mapped pages
> - * @npages: Number of pages to unmap
> - * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> - *
> - * This function unmaps previously mapped pages of memory for GPU Shared Virtual
> - * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
> - * if it's valid and not already unmapped, and unmaps the corresponding page.
> - */
> -static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> -					   dma_addr_t *dma_addr,
> -					   unsigned long npages,
> -					   enum dma_data_direction dir)
> -{
> -	unsigned long i;
> -
> -	for (i = 0; i < npages; ++i) {
> -		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> -			continue;
> -
> -		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> -	}
> -}
> -
> -/**
> - * drm_gpusvm_migrate_to_devmem() - Migrate GPU SVM range to device memory
> + * drm_gpusvm_range_evict() - Evict GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
> - * @range: Pointer to the GPU SVM range structure
> - * @devmem_allocation: Pointer to the device memory allocation. The caller
> - *                     should hold a reference to the device memory allocation,
> - *                     which should be dropped via ops->devmem_release or upon
> - *                     the failure of this function.
> - * @ctx: GPU SVM context
> - *
> - * This function migrates the specified GPU SVM range to device memory. It
> - * performs the necessary setup and invokes the driver-specific operations for
> - * migration to device memory. Upon successful return, @devmem_allocation can
> - * safely reference @range until ops->devmem_release is called which only upon
> - * successful return. Expected to be called while holding the mmap lock in read
> - * mode.
> - *
> - * Return: 0 on success, negative error code on failure.
> - */
> -int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> -				 struct drm_gpusvm_range *range,
> -				 struct drm_gpusvm_devmem *devmem_allocation,
> -				 const struct drm_gpusvm_ctx *ctx)
> -{
> -	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation->ops;
> -	unsigned long start = drm_gpusvm_range_start(range),
> -		      end = drm_gpusvm_range_end(range);
> -	struct migrate_vma migrate = {
> -		.start		= start,
> -		.end		= end,
> -		.pgmap_owner	= gpusvm->device_private_page_owner,
> -		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> -	};
> -	struct mm_struct *mm = gpusvm->mm;
> -	unsigned long i, npages = npages_in_range(start, end);
> -	struct vm_area_struct *vas;
> -	struct drm_gpusvm_zdd *zdd = NULL;
> -	struct page **pages;
> -	dma_addr_t *dma_addr;
> -	void *buf;
> -	int err;
> -
> -	mmap_assert_locked(gpusvm->mm);
> -
> -	if (!range->flags.migrate_devmem)
> -		return -EINVAL;
> -
> -	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> -	    !ops->copy_to_ram)
> -		return -EOPNOTSUPP;
> -
> -	vas = vma_lookup(mm, start);
> -	if (!vas) {
> -		err = -ENOENT;
> -		goto err_out;
> -	}
> -
> -	if (end > vas->vm_end || start < vas->vm_start) {
> -		err = -EINVAL;
> -		goto err_out;
> -	}
> -
> -	if (!vma_is_anonymous(vas)) {
> -		err = -EBUSY;
> -		goto err_out;
> -	}
> -
> -	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> -		       sizeof(*pages), GFP_KERNEL);
> -	if (!buf) {
> -		err = -ENOMEM;
> -		goto err_out;
> -	}
> -	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> -	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> -
> -	zdd = drm_gpusvm_zdd_alloc(gpusvm->device_private_page_owner);
> -	if (!zdd) {
> -		err = -ENOMEM;
> -		goto err_free;
> -	}
> -
> -	migrate.vma = vas;
> -	migrate.src = buf;
> -	migrate.dst = migrate.src + npages;
> -
> -	err = migrate_vma_setup(&migrate);
> -	if (err)
> -		goto err_free;
> -
> -	if (!migrate.cpages) {
> -		err = -EFAULT;
> -		goto err_free;
> -	}
> -
> -	if (migrate.cpages != npages) {
> -		err = -EBUSY;
> -		goto err_finalize;
> -	}
> -
> -	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
> -	if (err)
> -		goto err_finalize;
> -
> -	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
> -					   migrate.src, npages, DMA_TO_DEVICE);
> -	if (err)
> -		goto err_finalize;
> -
> -	for (i = 0; i < npages; ++i) {
> -		struct page *page = pfn_to_page(migrate.dst[i]);
> -
> -		pages[i] = page;
> -		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> -		drm_gpusvm_get_devmem_page(page, zdd);
> -	}
> -
> -	err = ops->copy_to_devmem(pages, dma_addr, npages);
> -	if (err)
> -		goto err_finalize;
> -
> -	/* Upon success bind devmem allocation to range and zdd */
> -	devmem_allocation->timeslice_expiration = get_jiffies_64() +
> -		msecs_to_jiffies(ctx->timeslice_ms);
> -	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
> -
> -err_finalize:
> -	if (err)
> -		drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
> -	migrate_vma_pages(&migrate);
> -	migrate_vma_finalize(&migrate);
> -	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> -				       DMA_TO_DEVICE);
> -err_free:
> -	if (zdd)
> -		drm_gpusvm_zdd_put(zdd);
> -	kvfree(buf);
> -err_out:
> -	return err;
> -}
> -EXPORT_SYMBOL_GPL(drm_gpusvm_migrate_to_devmem);
> -
> -/**
> - * drm_gpusvm_migrate_populate_ram_pfn() - Populate RAM PFNs for a VM area
> - * @vas: Pointer to the VM area structure, can be NULL
> - * @fault_page: Fault page
> - * @npages: Number of pages to populate
> - * @mpages: Number of pages to migrate
> - * @src_mpfn: Source array of migrate PFNs
> - * @mpfn: Array of migrate PFNs to populate
> - * @addr: Start address for PFN allocation
> - *
> - * This function populates the RAM migrate page frame numbers (PFNs) for the
> - * specified VM area structure. It allocates and locks pages in the VM area for
> - * RAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
> - * alloc_page for allocation.
> - *
> - * Return: 0 on success, negative error code on failure.
> - */
> -static int drm_gpusvm_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> -					       struct page *fault_page,
> -					       unsigned long npages,
> -					       unsigned long *mpages,
> -					       unsigned long *src_mpfn,
> -					       unsigned long *mpfn,
> -					       unsigned long addr)
> -{
> -	unsigned long i;
> -
> -	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> -		struct page *page, *src_page;
> -
> -		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> -			continue;
> -
> -		src_page = migrate_pfn_to_page(src_mpfn[i]);
> -		if (!src_page)
> -			continue;
> -
> -		if (fault_page) {
> -			if (src_page->zone_device_data !=
> -			    fault_page->zone_device_data)
> -				continue;
> -		}
> -
> -		if (vas)
> -			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> -		else
> -			page = alloc_page(GFP_HIGHUSER);
> -
> -		if (!page)
> -			goto free_pages;
> -
> -		mpfn[i] = migrate_pfn(page_to_pfn(page));
> -	}
> -
> -	for (i = 0; i < npages; ++i) {
> -		struct page *page = migrate_pfn_to_page(mpfn[i]);
> -
> -		if (!page)
> -			continue;
> -
> -		WARN_ON_ONCE(!trylock_page(page));
> -		++*mpages;
> -	}
> -
> -	return 0;
> -
> -free_pages:
> -	for (i = 0; i < npages; ++i) {
> -		struct page *page = migrate_pfn_to_page(mpfn[i]);
> -
> -		if (!page)
> -			continue;
> -
> -		put_page(page);
> -		mpfn[i] = 0;
> -	}
> -	return -ENOMEM;
> -}
> -
> -/**
> - * drm_gpusvm_evict_to_ram() - Evict GPU SVM range to RAM
> - * @devmem_allocation: Pointer to the device memory allocation
> - *
> - * Similar to __drm_gpusvm_migrate_to_ram but does not require mmap lock and
> - * migration done via migrate_device_* functions.
> - *
> - * Return: 0 on success, negative error code on failure.
> - */
> -int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation)
> -{
> -	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation->ops;
> -	unsigned long npages, mpages = 0;
> -	struct page **pages;
> -	unsigned long *src, *dst;
> -	dma_addr_t *dma_addr;
> -	void *buf;
> -	int i, err = 0;
> -	unsigned int retry_count = 2;
> -
> -	npages = devmem_allocation->size >> PAGE_SHIFT;
> -
> -retry:
> -	if (!mmget_not_zero(devmem_allocation->mm))
> -		return -EFAULT;
> -
> -	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> -		       sizeof(*pages), GFP_KERNEL);
> -	if (!buf) {
> -		err = -ENOMEM;
> -		goto err_out;
> -	}
> -	src = buf;
> -	dst = buf + (sizeof(*src) * npages);
> -	dma_addr = buf + (2 * sizeof(*src) * npages);
> -	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> -
> -	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
> -	if (err)
> -		goto err_free;
> -
> -	err = migrate_device_pfns(src, npages);
> -	if (err)
> -		goto err_free;
> -
> -	err = drm_gpusvm_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
> -						  src, dst, 0);
> -	if (err || !mpages)
> -		goto err_finalize;
> -
> -	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
> -					   dst, npages, DMA_FROM_DEVICE);
> -	if (err)
> -		goto err_finalize;
> -
> -	for (i = 0; i < npages; ++i)
> -		pages[i] = migrate_pfn_to_page(src[i]);
> -
> -	err = ops->copy_to_ram(pages, dma_addr, npages);
> -	if (err)
> -		goto err_finalize;
> -
> -err_finalize:
> -	if (err)
> -		drm_gpusvm_migration_unlock_put_pages(npages, dst);
> -	migrate_device_pages(src, dst, npages);
> -	migrate_device_finalize(src, dst, npages);
> -	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> -				       DMA_FROM_DEVICE);
> -err_free:
> -	kvfree(buf);
> -err_out:
> -	mmput_async(devmem_allocation->mm);
> -
> -	if (completion_done(&devmem_allocation->detached))
> -		return 0;
> -
> -	if (retry_count--) {
> -		cond_resched();
> -		goto retry;
> -	}
> -
> -	return err ?: -EBUSY;
> -}
> -EXPORT_SYMBOL_GPL(drm_gpusvm_evict_to_ram);
> -
> -/**
> - * __drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM (internal)
> - * @vas: Pointer to the VM area structure
> - * @device_private_page_owner: Device private pages owner
> - * @page: Pointer to the page for fault handling (can be NULL)
> - * @fault_addr: Fault address
> - * @size: Size of migration
> - *
> - * This internal function performs the migration of the specified GPU SVM range
> - * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
> - * invokes the driver-specific operations for migration to RAM.
> - *
> - * Return: 0 on success, negative error code on failure.
> - */
> -static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
> -				       void *device_private_page_owner,
> -				       struct page *page,
> -				       unsigned long fault_addr,
> -				       unsigned long size)
> -{
> -	struct migrate_vma migrate = {
> -		.vma		= vas,
> -		.pgmap_owner	= device_private_page_owner,
> -		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> -			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> -		.fault_page	= page,
> -	};
> -	struct drm_gpusvm_zdd *zdd;
> -	const struct drm_gpusvm_devmem_ops *ops;
> -	struct device *dev = NULL;
> -	unsigned long npages, mpages = 0;
> -	struct page **pages;
> -	dma_addr_t *dma_addr;
> -	unsigned long start, end;
> -	void *buf;
> -	int i, err = 0;
> -
> -	if (page) {
> -		zdd = page->zone_device_data;
> -		if (time_before64(get_jiffies_64(),
> -				  zdd->devmem_allocation->timeslice_expiration))
> -			return 0;
> -	}
> -
> -	start = ALIGN_DOWN(fault_addr, size);
> -	end = ALIGN(fault_addr + 1, size);
> -
> -	/* Corner where VMA area struct has been partially unmapped */
> -	if (start < vas->vm_start)
> -		start = vas->vm_start;
> -	if (end > vas->vm_end)
> -		end = vas->vm_end;
> -
> -	migrate.start = start;
> -	migrate.end = end;
> -	npages = npages_in_range(start, end);
> -
> -	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> -		       sizeof(*pages), GFP_KERNEL);
> -	if (!buf) {
> -		err = -ENOMEM;
> -		goto err_out;
> -	}
> -	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> -	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> -
> -	migrate.vma = vas;
> -	migrate.src = buf;
> -	migrate.dst = migrate.src + npages;
> -
> -	err = migrate_vma_setup(&migrate);
> -	if (err)
> -		goto err_free;
> -
> -	/* Raced with another CPU fault, nothing to do */
> -	if (!migrate.cpages)
> -		goto err_free;
> -
> -	if (!page) {
> -		for (i = 0; i < npages; ++i) {
> -			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> -				continue;
> -
> -			page = migrate_pfn_to_page(migrate.src[i]);
> -			break;
> -		}
> -
> -		if (!page)
> -			goto err_finalize;
> -	}
> -	zdd = page->zone_device_data;
> -	ops = zdd->devmem_allocation->ops;
> -	dev = zdd->devmem_allocation->dev;
> -
> -	err = drm_gpusvm_migrate_populate_ram_pfn(vas, page, npages, &mpages,
> -						  migrate.src, migrate.dst,
> -						  start);
> -	if (err)
> -		goto err_finalize;
> -
> -	err = drm_gpusvm_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
> -					   DMA_FROM_DEVICE);
> -	if (err)
> -		goto err_finalize;
> -
> -	for (i = 0; i < npages; ++i)
> -		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> -
> -	err = ops->copy_to_ram(pages, dma_addr, npages);
> -	if (err)
> -		goto err_finalize;
> -
> -err_finalize:
> -	if (err)
> -		drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
> -	migrate_vma_pages(&migrate);
> -	migrate_vma_finalize(&migrate);
> -	if (dev)
> -		drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
> -					       DMA_FROM_DEVICE);
> -err_free:
> -	kvfree(buf);
> -err_out:
> -
> -	return err;
> -}
> -
> -/**
> - * drm_gpusvm_range_evict - Evict GPU SVM range
>   * @range: Pointer to the GPU SVM range to be removed
>   *
> - * This function evicts the specified GPU SVM range. This function will not
> - * evict coherent pages.
> + * This function evicts the specified GPU SVM range.
>   *
>   * Return: 0 on success, a negative error code on failure.
>   */
> @@ -2182,60 +1524,6 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
>  
> -/**
> - * drm_gpusvm_page_free() - Put GPU SVM zone device data associated with a page
> - * @page: Pointer to the page
> - *
> - * This function is a callback used to put the GPU SVM zone device data
> - * associated with a page when it is being released.
> - */
> -static void drm_gpusvm_page_free(struct page *page)
> -{
> -	drm_gpusvm_zdd_put(page->zone_device_data);
> -}
> -
> -/**
> - * drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM (page fault handler)
> - * @vmf: Pointer to the fault information structure
> - *
> - * This function is a page fault handler used to migrate a GPU SVM range to RAM.
> - * It retrieves the GPU SVM range information from the faulting page and invokes
> - * the internal migration function to migrate the range back to RAM.
> - *
> - * Return: VM_FAULT_SIGBUS on failure, 0 on success.
> - */
> -static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> -{
> -	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
> -	int err;
> -
> -	err = __drm_gpusvm_migrate_to_ram(vmf->vma,
> -					  zdd->device_private_page_owner,
> -					  vmf->page, vmf->address,
> -					  zdd->devmem_allocation->size);
> -
> -	return err ? VM_FAULT_SIGBUS : 0;
> -}
> -
> -/*
> - * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
> - */
> -static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
> -	.page_free = drm_gpusvm_page_free,
> -	.migrate_to_ram = drm_gpusvm_migrate_to_ram,
> -};
> -
> -/**
> - * drm_gpusvm_pagemap_ops_get() - Retrieve GPU SVM device page map operations
> - *
> - * Return: Pointer to the GPU SVM device page map operations structure.
> - */
> -const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> -{
> -	return &drm_gpusvm_pagemap_ops;
> -}
> -EXPORT_SYMBOL_GPL(drm_gpusvm_pagemap_ops_get);
> -
>  /**
>   * drm_gpusvm_has_mapping() - Check if GPU SVM has mapping for the given address range
>   * @gpusvm: Pointer to the GPU SVM structure.
> @@ -2280,28 +1568,5 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
>  
> -/**
> - * drm_gpusvm_devmem_init() - Initialize a GPU SVM device memory allocation
> - *
> - * @dev: Pointer to the device structure which device memory allocation belongs to
> - * @mm: Pointer to the mm_struct for the address space
> - * @ops: Pointer to the operations structure for GPU SVM device memory
> - * @dpagemap: The struct drm_pagemap we're allocating from.
> - * @size: Size of device memory allocation
> - */
> -void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
> -			    struct device *dev, struct mm_struct *mm,
> -			    const struct drm_gpusvm_devmem_ops *ops,
> -			    struct drm_pagemap *dpagemap, size_t size)
> -{
> -	init_completion(&devmem_allocation->detached);
> -	devmem_allocation->dev = dev;
> -	devmem_allocation->mm = mm;
> -	devmem_allocation->ops = ops;
> -	devmem_allocation->dpagemap = dpagemap;
> -	devmem_allocation->size = size;
> -}
> -EXPORT_SYMBOL_GPL(drm_gpusvm_devmem_init);
> -
>  MODULE_DESCRIPTION("DRM GPUSVM");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> new file mode 100644
> index 000000000000..3551a50d7381
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -0,0 +1,811 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright © 2024-2025 Intel Corporation
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/migrate.h>
> +#include <linux/pagemap.h>
> +#include <drm/drm_pagemap.h>
> +
> +/**
> + * DOC: Overview
> + *
> + * The DRM pagemap layer is intended to augment the dev_pagemap functionality by
> + * providing a way to populate a struct mm_struct virtual range with device
> + * private pages and to provide helpers to abstract device memory allocations,
> + * to migrate memory back and forth between device memory and system RAM and
> + * to handle access (and in the future migration) between devices implementing
> + * a fast interconnect that is not necessarily visible to the rest of the
> + * system.

The latter part (fast interconnect support) is NIY, right. Also not only
fast interconnects, PCIe P2P, right? 

> + *
> + * Typically the DRM pagemap receives requests from one or more DRM GPU SVM
> + * instances to populate struct mm_struct virtual ranges with memory, and the
> + * migration is best effort only and may thus fail. The implementation should
> + * also handle device unbinding by blocking (return an -ENODEV) error for new
> + * population requests and after that migrate all device pages to system ram.

So this means populate_devmem_pfn returning -ENODEV. Should we
specifically document this return code in populate_devmem_pfn,
drm_pagemap_migrate_to_devmem?

> + */
> +
> +/**
> + * DOC: Migration
> + * Migration granularity typically follows the GPU SVM range requests, but
> + * if there are clashes, due to races or due to the fact that multiple GPU
> + * SVM instances have different views of the ranges used, and because of that

'multiple GPU SVM instances have different views of the ranges used'

This seems scray and hard handle, perhaps you have thought this one
through a bit more than me.

> + * parts of a requested range is already present in the requested device memory,
> + * the implementation has a variety of options. It can fail and it can choose
> + * to populate only the part of the range that isn't already in device memory,
> + * and it can evict the range to system before trying to migrate. Ideally an
> + * implementation would just try to migrate the missing part of the range and
> + * allocate just enough memory to do so.
> + *

I think we need bit more plumbing to implement the ideal case but again
maybe you thought this one through a more than me.

In general there this doc seems forward looking to this not implement
yet which I'm not sure is a good idea for just moving code around.

Matt

> + * When migrating to system memory as a response to a cpu fault or a device
> + * memory eviction request, currently a full device memory allocation is
> + * migrated back to system. Moving forward this might need improvement for
> + * situations where a single page needs bouncing between system memory and
> + * device memory due to, for example, atomic operations.
> + *
> + * Key DRM pagemap components:
> + *
> + * - Device Memory Allocations:
> + *      Embedded structure containing enough information for the drm_pagemap to
> + *      migrate to / from device memory.
> + *
> + * - Device Memory Operations:
> + *      Define the interface for driver-specific device memory operations
> + *      release memory, populate pfns, and copy to / from device memory.
> + */
> +
> +/**
> + * struct drm_pagemap_zdd - GPU SVM zone device data
> + *
> + * @refcount: Reference count for the zdd
> + * @devmem_allocation: device memory allocation
> + * @device_private_page_owner: Device private pages owner
> + *
> + * This structure serves as a generic wrapper installed in
> + * page->zone_device_data. It provides infrastructure for looking up a device
> + * memory allocation upon CPU page fault and asynchronously releasing device
> + * memory once the CPU has no page references. Asynchronous release is useful
> + * because CPU page references can be dropped in IRQ contexts, while releasing
> + * device memory likely requires sleeping locks.
> + */
> +struct drm_pagemap_zdd {
> +	struct kref refcount;
> +	struct drm_pagemap_devmem *devmem_allocation;
> +	void *device_private_page_owner;
> +};
> +
> +/**
> + * drm_pagemap_zdd_alloc() - Allocate a zdd structure.
> + * @device_private_page_owner: Device private pages owner
> + *
> + * This function allocates and initializes a new zdd structure. It sets up the
> + * reference count and initializes the destroy work.
> + *
> + * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
> + */
> +static struct drm_pagemap_zdd *
> +drm_pagemap_zdd_alloc(void *device_private_page_owner)
> +{
> +	struct drm_pagemap_zdd *zdd;
> +
> +	zdd = kmalloc(sizeof(*zdd), GFP_KERNEL);
> +	if (!zdd)
> +		return NULL;
> +
> +	kref_init(&zdd->refcount);
> +	zdd->devmem_allocation = NULL;
> +	zdd->device_private_page_owner = device_private_page_owner;
> +
> +	return zdd;
> +}
> +
> +/**
> + * drm_pagemap_zdd_get() - Get a reference to a zdd structure.
> + * @zdd: Pointer to the zdd structure.
> + *
> + * This function increments the reference count of the provided zdd structure.
> + *
> + * Return: Pointer to the zdd structure.
> + */
> +static struct drm_pagemap_zdd *drm_pagemap_zdd_get(struct drm_pagemap_zdd *zdd)
> +{
> +	kref_get(&zdd->refcount);
> +	return zdd;
> +}
> +
> +/**
> + * drm_pagemap_zdd_destroy() - Destroy a zdd structure.
> + * @ref: Pointer to the reference count structure.
> + *
> + * This function queues the destroy_work of the zdd for asynchronous destruction.
> + */
> +static void drm_pagemap_zdd_destroy(struct kref *ref)
> +{
> +	struct drm_pagemap_zdd *zdd =
> +		container_of(ref, struct drm_pagemap_zdd, refcount);
> +	struct drm_pagemap_devmem *devmem = zdd->devmem_allocation;
> +
> +	if (devmem) {
> +		complete_all(&devmem->detached);
> +		if (devmem->ops->devmem_release)
> +			devmem->ops->devmem_release(devmem);
> +	}
> +	kfree(zdd);
> +}
> +
> +/**
> + * drm_pagemap_zdd_put() - Put a zdd reference.
> + * @zdd: Pointer to the zdd structure.
> + *
> + * This function decrements the reference count of the provided zdd structure
> + * and schedules its destruction if the count drops to zero.
> + */
> +static void drm_pagemap_zdd_put(struct drm_pagemap_zdd *zdd)
> +{
> +	kref_put(&zdd->refcount, drm_pagemap_zdd_destroy);
> +}
> +
> +/**
> + * drm_pagemap_migration_unlock_put_page() - Put a migration page
> + * @page: Pointer to the page to put
> + *
> + * This function unlocks and puts a page.
> + */
> +static void drm_pagemap_migration_unlock_put_page(struct page *page)
> +{
> +	unlock_page(page);
> +	put_page(page);
> +}
> +
> +/**
> + * drm_pagemap_migration_unlock_put_pages() - Put migration pages
> + * @npages: Number of pages
> + * @migrate_pfn: Array of migrate page frame numbers
> + *
> + * This function unlocks and puts an array of pages.
> + */
> +static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
> +						   unsigned long *migrate_pfn)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page;
> +
> +		if (!migrate_pfn[i])
> +			continue;
> +
> +		page = migrate_pfn_to_page(migrate_pfn[i]);
> +		drm_pagemap_migration_unlock_put_page(page);
> +		migrate_pfn[i] = 0;
> +	}
> +}
> +
> +/**
> + * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
> + * @page: Pointer to the page
> + * @zdd: Pointer to the GPU SVM zone device data
> + *
> + * This function associates the given page with the specified GPU SVM zone
> + * device data and initializes it for zone device usage.
> + */
> +static void drm_pagemap_get_devmem_page(struct page *page,
> +					struct drm_pagemap_zdd *zdd)
> +{
> +	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> +	zone_device_page_init(page);
> +}
> +
> +/**
> + * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
> + * @dev: The device for which the pages are being mapped
> + * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> + * @migrate_pfn: Array of migrate page frame numbers to map
> + * @npages: Number of pages to map
> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + *
> + * This function maps pages of memory for migration usage in GPU SVM. It
> + * iterates over each page frame number provided in @migrate_pfn, maps the
> + * corresponding page, and stores the DMA address in the provided @dma_addr
> + * array.
> + *
> + * Returns: 0 on success, -EFAULT if an error occurs during mapping.
> + */
> +static int drm_pagemap_migrate_map_pages(struct device *dev,
> +					 dma_addr_t *dma_addr,
> +					 unsigned long *migrate_pfn,
> +					 unsigned long npages,
> +					 enum dma_data_direction dir)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> +			return -EFAULT;
> +
> +		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> +		if (dma_mapping_error(dev, dma_addr[i]))
> +			return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
> + * @dev: The device for which the pages were mapped
> + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> + * @npages: Number of pages to unmap
> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + *
> + * This function unmaps previously mapped pages of memory for GPU Shared Virtual
> + * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
> + * if it's valid and not already unmapped, and unmaps the corresponding page.
> + */
> +static void drm_pagemap_migrate_unmap_pages(struct device *dev,
> +					    dma_addr_t *dma_addr,
> +					    unsigned long npages,
> +					    enum dma_data_direction dir)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i) {
> +		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> +			continue;
> +
> +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> +	}
> +}
> +
> +static unsigned long
> +npages_in_range(unsigned long start, unsigned long end)
> +{
> +	return (end - start) >> PAGE_SHIFT;
> +}
> +
> +
> +/**
> + * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
> + * @devmem_allocation: The device memory allocation to migrate to.
> + * The caller should hold a reference to the device memory allocation,
> + * and the reference is consumed by this function unless it returns with
> + * an error.
> + * @mm: Pointer to the struct mm_struct.
> + * @start: Start of the virtual address range to migrate.
> + * @end: End of the virtual address range to migrate.
> + * @pgmap_owner: Not used currently, since only system memory is considered.
> + *
> + * This function migrates the specified virtual address range to device memory.
> + * It performs the necessary setup and invokes the driver-specific operations for
> + * migration to device memory. Expected to be called while holding the mmap lock in
> + * at least read mode.
> + *
> + * Return: %0 on success, negative error code on failure.
> + */
> +
> +/*
> + * @range: Pointer to the GPU SVM range structure
> + * @devmem_allocation: Pointer to the device memory allocation. The caller
> + *                     should hold a reference to the device memory allocation,
> + *                     which should be dropped via ops->devmem_release or upon
> + *                     the failure of this function.
> + * @ctx: GPU SVM context
> + *
> + * This function migrates the specified GPU SVM range to device memory. It
> + * performs the necessary setup and invokes the driver-specific operations for
> + * migration to device memory. Upon successful return, @devmem_allocation can
> + * safely reference @range until ops->devmem_release is called which only upon
> + * successful return. Expected to be called while holding the mmap lock in read
> + * mode.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> +				  struct mm_struct *mm,
> +				  unsigned long start, unsigned long end,
> +				  unsigned long timeslice_ms,
> +				  void *pgmap_owner)
> +{
> +	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
> +	struct migrate_vma migrate = {
> +		.start		= start,
> +		.end		= end,
> +		.pgmap_owner	= pgmap_owner,
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> +	};
> +	unsigned long i, npages = npages_in_range(start, end);
> +	struct vm_area_struct *vas;
> +	struct drm_pagemap_zdd *zdd = NULL;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int err;
> +
> +	mmap_assert_locked(mm);
> +
> +	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> +	    !ops->copy_to_ram)
> +		return -EOPNOTSUPP;
> +
> +	vas = vma_lookup(mm, start);
> +	if (!vas) {
> +		err = -ENOENT;
> +		goto err_out;
> +	}
> +
> +	if (end > vas->vm_end || start < vas->vm_start) {
> +		err = -EINVAL;
> +		goto err_out;
> +	}
> +
> +	if (!vma_is_anonymous(vas)) {
> +		err = -EBUSY;
> +		goto err_out;
> +	}
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +
> +	zdd = drm_pagemap_zdd_alloc(pgmap_owner);
> +	if (!zdd) {
> +		err = -ENOMEM;
> +		goto err_free;
> +	}
> +
> +	migrate.vma = vas;
> +	migrate.src = buf;
> +	migrate.dst = migrate.src + npages;
> +
> +	err = migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	if (!migrate.cpages) {
> +		err = -EFAULT;
> +		goto err_free;
> +	}
> +
> +	if (migrate.cpages != npages) {
> +		err = -EBUSY;
> +		goto err_finalize;
> +	}
> +
> +	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
> +	if (err)
> +		goto err_finalize;
> +
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
> +					   migrate.src, npages, DMA_TO_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = pfn_to_page(migrate.dst[i]);
> +
> +		pages[i] = page;
> +		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> +		drm_pagemap_get_devmem_page(page, zdd);
> +	}
> +
> +	err = ops->copy_to_devmem(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +	/* Upon success bind devmem allocation to range and zdd */
> +	devmem_allocation->timeslice_expiration = get_jiffies_64() +
> +		msecs_to_jiffies(timeslice_ms);
> +	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
> +
> +err_finalize:
> +	if (err)
> +		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> +				       DMA_TO_DEVICE);
> +err_free:
> +	if (zdd)
> +		drm_pagemap_zdd_put(zdd);
> +	kvfree(buf);
> +err_out:
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
> +
> +/**
> + * drm_pagemap_migrate_populate_ram_pfn() - Populate RAM PFNs for a VM area
> + * @vas: Pointer to the VM area structure, can be NULL
> + * @fault_page: Fault page
> + * @npages: Number of pages to populate
> + * @mpages: Number of pages to migrate
> + * @src_mpfn: Source array of migrate PFNs
> + * @mpfn: Array of migrate PFNs to populate
> + * @addr: Start address for PFN allocation
> + *
> + * This function populates the RAM migrate page frame numbers (PFNs) for the
> + * specified VM area structure. It allocates and locks pages in the VM area for
> + * RAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
> + * alloc_page for allocation.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> +					       struct page *fault_page,
> +					       unsigned long npages,
> +					       unsigned long *mpages,
> +					       unsigned long *src_mpfn,
> +					       unsigned long *mpfn,
> +					       unsigned long addr)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> +		struct page *page, *src_page;
> +
> +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> +			continue;
> +
> +		src_page = migrate_pfn_to_page(src_mpfn[i]);
> +		if (!src_page)
> +			continue;
> +
> +		if (fault_page) {
> +			if (src_page->zone_device_data !=
> +			    fault_page->zone_device_data)
> +				continue;
> +		}
> +
> +		if (vas)
> +			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> +		else
> +			page = alloc_page(GFP_HIGHUSER);
> +
> +		if (!page)
> +			goto free_pages;
> +
> +		mpfn[i] = migrate_pfn(page_to_pfn(page));
> +	}
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = migrate_pfn_to_page(mpfn[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		WARN_ON_ONCE(!trylock_page(page));
> +		++*mpages;
> +	}
> +
> +	return 0;
> +
> +free_pages:
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = migrate_pfn_to_page(mpfn[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		put_page(page);
> +		mpfn[i] = 0;
> +	}
> +	return -ENOMEM;
> +}
> +
> +/**
> + * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
> + * @devmem_allocation: Pointer to the device memory allocation
> + *
> + * Similar to __drm_pagemap_migrate_to_ram but does not require mmap lock and
> + * migration done via migrate_device_* functions.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
> +{
> +	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
> +	unsigned long npages, mpages = 0;
> +	struct page **pages;
> +	unsigned long *src, *dst;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int i, err = 0;
> +	unsigned int retry_count = 2;
> +
> +	npages = devmem_allocation->size >> PAGE_SHIFT;
> +
> +retry:
> +	if (!mmget_not_zero(devmem_allocation->mm))
> +		return -EFAULT;
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	src = buf;
> +	dst = buf + (sizeof(*src) * npages);
> +	dma_addr = buf + (2 * sizeof(*src) * npages);
> +	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> +
> +	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
> +	if (err)
> +		goto err_free;
> +
> +	err = migrate_device_pfns(src, npages);
> +	if (err)
> +		goto err_free;
> +
> +	err = drm_pagemap_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
> +						  src, dst, 0);
> +	if (err || !mpages)
> +		goto err_finalize;
> +
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
> +					   dst, npages, DMA_FROM_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i)
> +		pages[i] = migrate_pfn_to_page(src[i]);
> +
> +	err = ops->copy_to_ram(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_pagemap_migration_unlock_put_pages(npages, dst);
> +	migrate_device_pages(src, dst, npages);
> +	migrate_device_finalize(src, dst, npages);
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> +				       DMA_FROM_DEVICE);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +	mmput_async(devmem_allocation->mm);
> +
> +	if (completion_done(&devmem_allocation->detached))
> +		return 0;
> +
> +	if (retry_count--) {
> +		cond_resched();
> +		goto retry;
> +	}
> +
> +	return err ?: -EBUSY;
> +}
> +EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
> +
> +/**
> + * __drm_pagemap_migrate_to_ram() - Migrate GPU SVM range to RAM (internal)
> + * @vas: Pointer to the VM area structure
> + * @device_private_page_owner: Device private pages owner
> + * @page: Pointer to the page for fault handling (can be NULL)
> + * @fault_addr: Fault address
> + * @size: Size of migration
> + *
> + * This internal function performs the migration of the specified GPU SVM range
> + * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
> + * invokes the driver-specific operations for migration to RAM.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> +				       void *device_private_page_owner,
> +				       struct page *page,
> +				       unsigned long fault_addr,
> +				       unsigned long size)
> +{
> +	struct migrate_vma migrate = {
> +		.vma		= vas,
> +		.pgmap_owner	= device_private_page_owner,
> +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> +			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +		.fault_page	= page,
> +	};
> +	struct drm_pagemap_zdd *zdd;
> +	const struct drm_pagemap_devmem_ops *ops;
> +	struct device *dev = NULL;
> +	unsigned long npages, mpages = 0;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	unsigned long start, end;
> +	void *buf;
> +	int i, err = 0;
> +
> +	if (page) {
> +		zdd = page->zone_device_data;
> +		if (time_before64(get_jiffies_64(),
> +				  zdd->devmem_allocation->timeslice_expiration))
> +			return 0;
> +	}
> +
> +	start = ALIGN_DOWN(fault_addr, size);
> +	end = ALIGN(fault_addr + 1, size);
> +
> +	/* Corner where VMA area struct has been partially unmapped */
> +	if (start < vas->vm_start)
> +		start = vas->vm_start;
> +	if (end > vas->vm_end)
> +		end = vas->vm_end;
> +
> +	migrate.start = start;
> +	migrate.end = end;
> +	npages = npages_in_range(start, end);
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +
> +	migrate.vma = vas;
> +	migrate.src = buf;
> +	migrate.dst = migrate.src + npages;
> +
> +	err = migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	/* Raced with another CPU fault, nothing to do */
> +	if (!migrate.cpages)
> +		goto err_free;
> +
> +	if (!page) {
> +		for (i = 0; i < npages; ++i) {
> +			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> +				continue;
> +
> +			page = migrate_pfn_to_page(migrate.src[i]);
> +			break;
> +		}
> +
> +		if (!page)
> +			goto err_finalize;
> +	}
> +	zdd = page->zone_device_data;
> +	ops = zdd->devmem_allocation->ops;
> +	dev = zdd->devmem_allocation->dev;
> +
> +	err = drm_pagemap_migrate_populate_ram_pfn(vas, page, npages, &mpages,
> +						  migrate.src, migrate.dst,
> +						  start);
> +	if (err)
> +		goto err_finalize;
> +
> +	err = drm_pagemap_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
> +					   DMA_FROM_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i)
> +		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> +
> +	err = ops->copy_to_ram(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	if (dev)
> +		drm_pagemap_migrate_unmap_pages(dev, dma_addr, npages,
> +					       DMA_FROM_DEVICE);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +
> +	return err;
> +}
> +
> +/**
> + * drm_pagemap_page_free() - Put GPU SVM zone device data associated with a page
> + * @page: Pointer to the page
> + *
> + * This function is a callback used to put the GPU SVM zone device data
> + * associated with a page when it is being released.
> + */
> +static void drm_pagemap_page_free(struct page *page)
> +{
> +	drm_pagemap_zdd_put(page->zone_device_data);
> +}
> +
> +/**
> + * drm_pagemap_migrate_to_ram() - Migrate a virtual range to RAM (page fault handler)
> + * @vmf: Pointer to the fault information structure
> + *
> + * This function is a page fault handler used to migrate a virtual range
> + * to ram. The device memory allocation in which the device page is found is
> + * migrated in its entirety.
> + *
> + * Returns:
> + * VM_FAULT_SIGBUS on failure, 0 on success.
> + */
> +static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
> +{
> +	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
> +	int err;
> +
> +	err = __drm_pagemap_migrate_to_ram(vmf->vma,
> +					   zdd->device_private_page_owner,
> +					   vmf->page, vmf->address,
> +					   zdd->devmem_allocation->size);
> +
> +	return err ? VM_FAULT_SIGBUS : 0;
> +}
> +
> +static const struct dev_pagemap_ops drm_pagemap_pagemap_ops = {
> +	.page_free = drm_pagemap_page_free,
> +	.migrate_to_ram = drm_pagemap_migrate_to_ram,
> +};
> +
> +/**
> + * drm_pagemap_pagemap_ops_get() - Retrieve GPU SVM device page map operations
> + *
> + * Returns:
> + * Pointer to the GPU SVM device page map operations structure.
> + */
> +const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void)
> +{
> +	return &drm_pagemap_pagemap_ops;
> +}
> +EXPORT_SYMBOL_GPL(drm_pagemap_pagemap_ops_get);
> +
> +/**
> + * drm_pagemap_devmem_init() - Initialize a drm_pagemap device memory allocation
> + *
> + * @devmem_allocation: The struct drm_pagemap_devmem to initialize.
> + * @dev: Pointer to the device structure which device memory allocation belongs to
> + * @mm: Pointer to the mm_struct for the address space
> + * @ops: Pointer to the operations structure for GPU SVM device memory
> + * @dpagemap: The struct drm_pagemap we're allocating from.
> + * @size: Size of device memory allocation
> + */
> +void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
> +			     struct device *dev, struct mm_struct *mm,
> +			     const struct drm_pagemap_devmem_ops *ops,
> +			     struct drm_pagemap *dpagemap, size_t size)
> +{
> +	init_completion(&devmem_allocation->detached);
> +	devmem_allocation->dev = dev;
> +	devmem_allocation->mm = mm;
> +	devmem_allocation->ops = ops;
> +	devmem_allocation->dpagemap = dpagemap;
> +	devmem_allocation->size = size;
> +}
> +EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
> +
> +/**
> + * drm_pagemap_page_to_dpagemap() - Return a pointer the drm_pagemap of a page
> + * @page: The struct page.
> + *
> + * Return: A pointer to the struct drm_pagemap of a device private page that
> + * was populated from the struct drm_pagemap. If the page was *not* populated
> + * from a struct drm_pagemap, the result is undefined and the function call
> + * may result in dereferencing and invalid address.
> + */
> +struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
> +{
> +	struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +
> +	return zdd->devmem_allocation->dpagemap;
> +}
> +EXPORT_SYMBOL_GPL(drm_pagemap_page_to_dpagemap);
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 98b46c534278..c7c71734460b 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -87,14 +87,16 @@ config DRM_XE_GPUSVM
>  
>  	  If in doubut say "Y".
>  
> -config DRM_XE_DEVMEM_MIRROR
> -	bool "Enable device memory mirror"
> +config DRM_XE_PAGEMAP
> +	bool "Enable device memory pool for SVM"
>  	depends on DRM_XE_GPUSVM
>  	select GET_FREE_REGION
>  	default y
>  	help
> -	  Disable this option only if you want to compile out without device
> -	  memory mirror. Will reduce KMD memory footprint when disabled.
> +	  Disable this option only if you don't want to expose local device
> +	  memory for SVM. Will reduce KMD memory footprint when disabled.
> +
> +	  If in doubut say "Y".
>  
>  config DRM_XE_FORCE_PROBE
>  	string "Force probe xe for selected Intel hardware IDs"
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index eb5e83c5f233..e0efaf23d051 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -86,7 +86,7 @@ struct xe_bo {
>  	u16 cpu_caching;
>  
>  	/** @devmem_allocation: SVM device memory allocation */
> -	struct drm_gpusvm_devmem devmem_allocation;
> +	struct drm_pagemap_devmem devmem_allocation;
>  
>  	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
>  		struct list_head vram_userfault_link;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b93c04466637..67b7f733dd69 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -104,7 +104,7 @@ struct xe_vram_region {
>  	void __iomem *mapping;
>  	/** @ttm: VRAM TTM manager */
>  	struct xe_ttm_vram_mgr ttm;
> -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
>  	struct dev_pagemap pagemap;
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index f27fb9b588de..e161ce3e67a1 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -329,7 +329,7 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
>  	up_write(&vm->lock);
>  }
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  
>  static struct xe_vram_region *page_to_vr(struct page *page)
>  {
> @@ -517,12 +517,12 @@ static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
>  	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_SRAM);
>  }
>  
> -static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem *devmem_allocation)
> +static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
>  {
>  	return container_of(devmem_allocation, struct xe_bo, devmem_allocation);
>  }
>  
> -static void xe_svm_devmem_release(struct drm_gpusvm_devmem *devmem_allocation)
> +static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
>  {
>  	struct xe_bo *bo = to_xe_bo(devmem_allocation);
>  
> @@ -539,7 +539,7 @@ static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
>  	return &tile->mem.vram.ttm.mm;
>  }
>  
> -static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocation,
> +static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
>  				      unsigned long npages, unsigned long *pfn)
>  {
>  	struct xe_bo *bo = to_xe_bo(devmem_allocation);
> @@ -562,7 +562,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
>  	return 0;
>  }
>  
> -static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
> +static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
>  	.devmem_release = xe_svm_devmem_release,
>  	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
>  	.copy_to_devmem = xe_svm_copy_to_devmem,
> @@ -714,7 +714,7 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
>  					 min(end, xe_vma_end(vma)));
>  }
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  {
>  	return &tile->mem.vram;
> @@ -742,6 +742,9 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  	ktime_t end = 0;
>  	int err;
>  
> +	if (!range->base.flags.migrate_devmem)
> +		return -EINVAL;
> +
>  	range_debug(range, "ALLOCATE VRAM");
>  
>  	if (!mmget_not_zero(mm))
> @@ -761,19 +764,23 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  		goto unlock;
>  	}
>  
> -	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> -			       vm->xe->drm.dev, mm,
> -			       &gpusvm_devmem_ops,
> -			       &tile->mem.vram.dpagemap,
> -			       xe_svm_range_size(range));
> +	drm_pagemap_devmem_init(&bo->devmem_allocation,
> +				vm->xe->drm.dev, mm,
> +				&dpagemap_devmem_ops,
> +				&tile->mem.vram.dpagemap,
> +				xe_svm_range_size(range));
>  
>  	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
>  	list_for_each_entry(block, blocks, link)
>  		block->private = vr;
>  
>  	xe_bo_get(bo);
> -	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
> -					   &bo->devmem_allocation, ctx);
> +	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation,
> +					    mm,
> +					    xe_svm_range_start(range),
> +					    xe_svm_range_end(range),
> +					    ctx->timeslice_ms,
> +					    xe_svm_devm_owner(vm->xe));
>  	if (err)
>  		xe_svm_devmem_release(&bo->devmem_allocation);
>  
> @@ -848,13 +855,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	struct drm_gpusvm_ctx ctx = {
>  		.read_only = xe_vma_read_only(vma),
>  		.devmem_possible = IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> -		.check_pages_threshold = IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> +		.check_pages_threshold = IS_DGFX(vm->xe) &&		
> +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
>  		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>  		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
>  			vm->xe->atomic_svm_timeslice_ms : 0,
>  	};
>  	struct xe_svm_range *range;
> @@ -992,7 +999,7 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>   */
>  int xe_svm_bo_evict(struct xe_bo *bo)
>  {
> -	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
> +	return drm_pagemap_evict_to_ram(&bo->devmem_allocation);
>  }
>  
>  /**
> @@ -1045,7 +1052,7 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  	return err;
>  }
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  
>  static struct drm_pagemap_device_addr
>  xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
> @@ -1102,7 +1109,7 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  	vr->pagemap.range.start = res->start;
>  	vr->pagemap.range.end = res->end;
>  	vr->pagemap.nr_range = 1;
> -	vr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
> +	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
>  	vr->pagemap.owner = xe_svm_devm_owner(xe);
>  	addr = devm_memremap_pages(dev, &vr->pagemap);
>  
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 6a5156476bf4..4aedc5423aff 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -16,91 +16,9 @@ struct drm_gpusvm;
>  struct drm_gpusvm_notifier;
>  struct drm_gpusvm_ops;
>  struct drm_gpusvm_range;
> -struct drm_gpusvm_devmem;
>  struct drm_pagemap;
>  struct drm_pagemap_device_addr;
>  
> -/**
> - * struct drm_gpusvm_devmem_ops - Operations structure for GPU SVM device memory
> - *
> - * This structure defines the operations for GPU Shared Virtual Memory (SVM)
> - * device memory. These operations are provided by the GPU driver to manage device memory
> - * allocations and perform operations such as migration between device memory and system
> - * RAM.
> - */
> -struct drm_gpusvm_devmem_ops {
> -	/**
> -	 * @devmem_release: Release device memory allocation (optional)
> -	 * @devmem_allocation: device memory allocation
> -	 *
> -	 * Release device memory allocation and drop a reference to device
> -	 * memory allocation.
> -	 */
> -	void (*devmem_release)(struct drm_gpusvm_devmem *devmem_allocation);
> -
> -	/**
> -	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
> -	 * @devmem_allocation: device memory allocation
> -	 * @npages: Number of pages to populate
> -	 * @pfn: Array of page frame numbers to populate
> -	 *
> -	 * Populate device memory page frame numbers (PFN).
> -	 *
> -	 * Return: 0 on success, a negative error code on failure.
> -	 */
> -	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem *devmem_allocation,
> -				   unsigned long npages, unsigned long *pfn);
> -
> -	/**
> -	 * @copy_to_devmem: Copy to device memory (required for migration)
> -	 * @pages: Pointer to array of device memory pages (destination)
> -	 * @dma_addr: Pointer to array of DMA addresses (source)
> -	 * @npages: Number of pages to copy
> -	 *
> -	 * Copy pages to device memory.
> -	 *
> -	 * Return: 0 on success, a negative error code on failure.
> -	 */
> -	int (*copy_to_devmem)(struct page **pages,
> -			      dma_addr_t *dma_addr,
> -			      unsigned long npages);
> -
> -	/**
> -	 * @copy_to_ram: Copy to system RAM (required for migration)
> -	 * @pages: Pointer to array of device memory pages (source)
> -	 * @dma_addr: Pointer to array of DMA addresses (destination)
> -	 * @npages: Number of pages to copy
> -	 *
> -	 * Copy pages to system RAM.
> -	 *
> -	 * Return: 0 on success, a negative error code on failure.
> -	 */
> -	int (*copy_to_ram)(struct page **pages,
> -			   dma_addr_t *dma_addr,
> -			   unsigned long npages);
> -};
> -
> -/**
> - * struct drm_gpusvm_devmem - Structure representing a GPU SVM device memory allocation
> - *
> - * @dev: Pointer to the device structure which device memory allocation belongs to
> - * @mm: Pointer to the mm_struct for the address space
> - * @detached: device memory allocations is detached from device pages
> - * @ops: Pointer to the operations structure for GPU SVM device memory
> - * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
> - * @size: Size of device memory allocation
> - * @timeslice_expiration: Timeslice expiration in jiffies
> - */
> -struct drm_gpusvm_devmem {
> -	struct device *dev;
> -	struct mm_struct *mm;
> -	struct completion detached;
> -	const struct drm_gpusvm_devmem_ops *ops;
> -	struct drm_pagemap *dpagemap;
> -	size_t size;
> -	u64 timeslice_expiration;
> -};
> -
>  /**
>   * struct drm_gpusvm_ops - Operations structure for GPU SVM
>   *
> @@ -361,15 +279,6 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  				  struct drm_gpusvm_range *range,
>  				  const struct drm_gpusvm_ctx *ctx);
>  
> -int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> -				 struct drm_gpusvm_range *range,
> -				 struct drm_gpusvm_devmem *devmem_allocation,
> -				 const struct drm_gpusvm_ctx *ctx);
> -
> -int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation);
> -
> -const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> -
>  bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
>  			    unsigned long end);
>  
> @@ -380,11 +289,6 @@ drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
>  void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
>  				   const struct mmu_notifier_range *mmu_range);
>  
> -void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
> -			    struct device *dev, struct mm_struct *mm,
> -			    const struct drm_gpusvm_devmem_ops *ops,
> -			    struct drm_pagemap *dpagemap, size_t size);
> -
>  #ifdef CONFIG_LOCKDEP
>  /**
>   * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 202c157ff4d7..dabc9c365df4 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -7,6 +7,7 @@
>  #include <linux/types.h>
>  
>  struct drm_pagemap;
> +struct drm_pagemap_zdd;
>  struct device;
>  
>  /**
> @@ -104,4 +105,104 @@ struct drm_pagemap {
>  	struct device *dev;
>  };
>  
> +struct drm_pagemap_devmem;
> +
> +/**
> + * struct drm_pagemap_devmem_ops - Operations structure for GPU SVM device memory
> + *
> + * This structure defines the operations for GPU Shared Virtual Memory (SVM)
> + * device memory. These operations are provided by the GPU driver to manage device memory
> + * allocations and perform operations such as migration between device memory and system
> + * RAM.
> + */
> +struct drm_pagemap_devmem_ops {
> +	/**
> +	 * @devmem_release: Release device memory allocation (optional)
> +	 * @devmem_allocation: device memory allocation
> +	 *
> +	 * Release device memory allocation and drop a reference to device
> +	 * memory allocation.
> +	 */
> +	void (*devmem_release)(struct drm_pagemap_devmem *devmem_allocation);
> +
> +	/**
> +	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
> +	 * @devmem_allocation: device memory allocation
> +	 * @npages: Number of pages to populate
> +	 * @pfn: Array of page frame numbers to populate
> +	 *
> +	 * Populate device memory page frame numbers (PFN).
> +	 *
> +	 * Return: 0 on success, a negative error code on failure.
> +	 */
> +	int (*populate_devmem_pfn)(struct drm_pagemap_devmem *devmem_allocation,
> +				   unsigned long npages, unsigned long *pfn);
> +
> +	/**
> +	 * @copy_to_devmem: Copy to device memory (required for migration)
> +	 * @pages: Pointer to array of device memory pages (destination)
> +	 * @dma_addr: Pointer to array of DMA addresses (source)
> +	 * @npages: Number of pages to copy
> +	 *
> +	 * Copy pages to device memory.
> +	 *
> +	 * Return: 0 on success, a negative error code on failure.
> +	 */
> +	int (*copy_to_devmem)(struct page **pages,
> +			      dma_addr_t *dma_addr,
> +			      unsigned long npages);
> +
> +	/**
> +	 * @copy_to_ram: Copy to system RAM (required for migration)
> +	 * @pages: Pointer to array of device memory pages (source)
> +	 * @dma_addr: Pointer to array of DMA addresses (destination)
> +	 * @npages: Number of pages to copy
> +	 *
> +	 * Copy pages to system RAM.
> +	 *
> +	 * Return: 0 on success, a negative error code on failure.
> +	 */
> +	int (*copy_to_ram)(struct page **pages,
> +			   dma_addr_t *dma_addr,
> +			   unsigned long npages);
> +};
> +
> +/**
> + * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
> + *
> + * @dev: Pointer to the device structure which device memory allocation belongs to
> + * @mm: Pointer to the mm_struct for the address space
> + * @detached: device memory allocations is detached from device pages
> + * @ops: Pointer to the operations structure for GPU SVM device memory
> + * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
> + * @size: Size of device memory allocation
> + * @timeslice_expiration: Timeslice expiration in jiffies
> + */
> +struct drm_pagemap_devmem {
> +	struct device *dev;
> +	struct mm_struct *mm;
> +	struct completion detached;
> +	const struct drm_pagemap_devmem_ops *ops;
> +	struct drm_pagemap *dpagemap;
> +	size_t size;
> +	u64 timeslice_expiration;
> +};
> +
> +int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> +				  struct mm_struct *mm,
> +				  unsigned long start, unsigned long end,
> +				  unsigned long timeslice_ms,
> +				  void *pgmap_owner);
> +
> +int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation);
> +
> +const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void);
> +
> +struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
> +
> +void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
> +			     struct device *dev, struct mm_struct *mm,
> +			     const struct drm_pagemap_devmem_ops *ops,
> +			     struct drm_pagemap *dpagemap, size_t size);
> +
>  #endif
> -- 
> 2.49.0
> 
