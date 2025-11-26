Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD5C8B7A4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 19:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9673A10E6DE;
	Wed, 26 Nov 2025 18:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhC3gwsd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2BF10E6DB;
 Wed, 26 Nov 2025 18:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764182930; x=1795718930;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pqD3sd1sg9r5ZulNk8e1rQ3xyfFQjWKS4Aqu82bGsvo=;
 b=ZhC3gwsdoW/dA4OHyRDcG8vyn1+pRZEsSwzUVX2mtPD3Cd2dGaX0o6Oo
 Swk+U8AMbZa0yK9qt+CmOL92JAGD+RvjKvdX6Yow0mfPRET+lirJQywTM
 Rw9CKDc7NasomUBM+EPGF5A+93rI68en36KEACKZDjOclyCHMbznfEkzn
 UyqWIiip8JpIMDPemF16F8ildKPfdYpJ577m8pzOP4Ch+QM/rFMRPM4cP
 W0fiiHYHyFLYQgDosm9sjKvBOktjrNF14RyE6fxGc531HgqhXhvROiizu
 CkMgy0jYy4weNMv1bbkxc4om2VQz+8PKxysaahbpq1RWV0Z4j8ieDLSvr Q==;
X-CSE-ConnectionGUID: etB6W1P1S3KsHK4Xc3ENYQ==
X-CSE-MsgGUID: kVQyAMI7SumunWtOPKTJqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76915815"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="76915815"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:48:49 -0800
X-CSE-ConnectionGUID: JaY3nsDHQECVz40SB17IMQ==
X-CSE-MsgGUID: 2k6H0wsVSRWjOMrEnE7y+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="223725561"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:48:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 10:48:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 10:48:47 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 10:48:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlOnhEf3lwbpUaAyNInlVUvezNwxKtrooV0aErRR4WxXFr8B0+10PGKgbRRJk1AQvdnktJYdw0Al456AAexVztSatc7FNc4Q+1Lf5QWIGqzLQYZNcQ661iBsB4PMib+75tpR01mjDKGcYLF4YRu+RfKil9pt49ZxRSKDjcgbvsvwikx13yFtteOiEHRkQgY0NsHDao4YVk0JB7tLUzl3ERivGt/hILrZWcXg83oASQLWpH1FWjQh7ktDh4Zb9w1RbQAbeqsPslLEQTEgGWGpIdcnHPIVtN7SMTFLRVVXe7jZJSBwsHu6V1AK8E6UP033Dp+FAIx1d79hFrjexWSUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcrkOvf1n56QK8ICebbnS5MWb1XQ8icVeB3YIWNj1KM=;
 b=CVi/tkRBy/vqRMvBkWr1oxnlq+YwYgBc91XrXVFSOR6f3F4h6iQJnmtE9W4XmTzJhwbab4wEEc0MnN2J/oVXPKVrFmrn/gH2hx4hd1lYyLw/rwOlzQWHhazqNkCr6cd7cSvM8p+w1vN+rNy4WLOIl7G19cGSmWpemeJoQ5UXALPKAhY5JxAfPtdqxxwTnptbuLHU6GGJGHlOmb257SpI4xmaWmcvXt1akozbfr4R6SKp8bAGwwg8jExUHDWFU5BiyqJEX8s6llNASJga88wSyUaJBjl0qwNjToepHhzI/AW6qWIdKHUMFGVoQ2ztd3mayI327JkDrHwsyHBYKjuUMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS4PPFBA72E12AE.namprd11.prod.outlook.com (2603:10b6:f:fc02::48)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 18:48:45 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 18:48:45 +0000
Date: Wed, 26 Nov 2025 13:48:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <lukas@wunner.de>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 2/4] drm/xe/xe_drm_ras: Add support for drm ras
Message-ID: <aSdLhiET8uIMg1zg@intel.com>
References: <20251126143652.2843242-6-riana.tauro@intel.com>
 <20251126143652.2843242-8-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251126143652.2843242-8-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS4PPFBA72E12AE:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ebcc0be-3579-42a0-b131-08de2d1c6d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+L/0H58m934vbLNum95IdcliO9ghd9VcxUUiY/OUb7bYfdXi4p6LyH0Kbe?=
 =?iso-8859-1?Q?f/AT4i7NkAbdOb3W8kAnXGsyz6UxGjI0EHz+G6bbueWS0dU3vS59PqPv6b?=
 =?iso-8859-1?Q?g4+9C9U08n03o8ibsVFu0AGlSgWFLMaN9sE0xWaPoRexYalxDQdKvSnatY?=
 =?iso-8859-1?Q?Zwfe5o5X7PbwR6hUOtCxL9IeKsXTDayQtHbLBVT2RhPb4W0q/2d2YGvdGF?=
 =?iso-8859-1?Q?RIvwkiPpcggX9GiTSZjxbn8lT6baRPvOkbh9L0UdHSRjR/wcDaaigkgS8A?=
 =?iso-8859-1?Q?fMioBqhQ01rzZZ8mvNJCpUshSIFixB6GopBZ14D14TyvReZgFXz20Zt2CH?=
 =?iso-8859-1?Q?PpReDjKCrkIQ7eFUDRigb1QFGYmAGDX1wzFvReWVWGpv5LygnO3CMZAQw7?=
 =?iso-8859-1?Q?+I8jGPVd5srtsJdLjHKqoooW7Rc3mKOlCVlESXh6Y89hC2+FrXbHzOnTMm?=
 =?iso-8859-1?Q?wR0tUo2Cnl4uXYC61C2TR8EBTvKfimVNDxfPGlaTJSPh7ZcUB0J6MgaLwk?=
 =?iso-8859-1?Q?792LsZwlTwOPpvagzOtsaMssKcQBT3sXAJ9FjFhw4jsA3WmGmmKxtIk9C3?=
 =?iso-8859-1?Q?9iWCsDWGhjXzyqiZJtFpkx1rfGKohKR0M/0O3N3DfMZVK49wF2xkdcjdDW?=
 =?iso-8859-1?Q?ywgu6NPk9qCkEBVeHA6ACyaHsgUwscAf9PrrblT0AkRdgKnMquLgyneSwO?=
 =?iso-8859-1?Q?B0tgU0EtrJ70OXt80NllDpe9TIFdmmsHY05Hk6WTfSm6sBto7bK+HTm4cK?=
 =?iso-8859-1?Q?5oYzFqrqZpfLKbrran5LfniMIuA+E52hA+t6mKXPTzryg1ZYASUMn1/Dq+?=
 =?iso-8859-1?Q?1sXfm//NOUE5jaxUUgXYa8fInGVCiaV4mZGtBwQtjQ+pdtpqiJRKNrYLDR?=
 =?iso-8859-1?Q?BAcuV3kH3MRljwuvTa9057kwXO0SSgJFyKLw/KR5CcEX18u4WU7FXQl6V7?=
 =?iso-8859-1?Q?TK23c+pcppDEy7R7r2wimvqJ/63v6RUV0lv7yfzMKQ5B3Oi7iKAC9S798W?=
 =?iso-8859-1?Q?Ynq72FR31n4Td+rHdSB/OOL8pMMEuqNcE2wO+rbRUwt6DXXmEdZqcMWvbM?=
 =?iso-8859-1?Q?Bsz1xeGw1EN1TdxPFEZOwqi9KZ3/4Jti0uG/OigqWPMYLKwPQdBBeo8s7e?=
 =?iso-8859-1?Q?dSTLRgBHWsKZrUhJP3UABG0hDkm7TtZ7AgulXv4aEvnh9Sbd2LqSIcYFPQ?=
 =?iso-8859-1?Q?/e7ibmZEMcFKTMHfGeOUYJt203E1eA3f1FgY7+BsQ2iJck8sW5g/5tmqxP?=
 =?iso-8859-1?Q?axEgaw+DPaXLlV1dYbfP3bVWV+kLOLlAg86EzaFe+Q2MhWpViw6jl8nbkl?=
 =?iso-8859-1?Q?d22KQgd3vIvk88P1YT2zeM4lGsAaC/gXRNG47HzZKg5Zu2GFXPiscNesHR?=
 =?iso-8859-1?Q?PQyuA5LHSOYBAKlP/NpClAxdWJ3sHEvkn8Ykhf2ixNJZ8nOcmFmO9dXdff?=
 =?iso-8859-1?Q?j2oEGwLfhTjdCHuqSAtfzYQ2HxCR2cEVV26I68cvYg1hvisvr27by0xlfs?=
 =?iso-8859-1?Q?390Nz0nCWRqZkupgj+hKOp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vhzfguASwnw9hZcXnQ2HbWnZwnKhnKJx8YEH+aDFwCDmJe//dicxkxtWIk?=
 =?iso-8859-1?Q?WSAWeQEZk1VOihFopDAAn9OzIds2qSfqnYHT+eoIbcggpHQgmjtXJbpDtJ?=
 =?iso-8859-1?Q?d36JHk3VDsEB4mUPdIcV76/kZO+8qh4dq/wL12w4PMexZObt1Y6I/H9DE/?=
 =?iso-8859-1?Q?yfwszxO6SWLOLodJudkPemTliTHi/kzVnJskYwAlBB8LKeuZqVJ2AvJM4r?=
 =?iso-8859-1?Q?eWhK8J9N0RCPkdnFicvigCLDv6eVgwhi/IsqOp9zjifj722Rn8f85xRDsK?=
 =?iso-8859-1?Q?YCYHPOHQYLjrHZqBXfwIHxhT3Elxe/z2ADQ3UkN4GonTEU7aJTr9qsgj2r?=
 =?iso-8859-1?Q?4FU9hGshNJABP8RBk9ffswWTLuJ6B/RgRVAxPUcGnQH+Eg+6LAGRU+czXP?=
 =?iso-8859-1?Q?Auw/pil2TkmGdXnbPt2x+OxwEGyFG/pobTTt3YSn/Z7pMjbL92KZ1hmoB+?=
 =?iso-8859-1?Q?LUBhe8dYpjTxNhf4ascpmSLlcyuBY/oTeE/z3cCdVCMV0Oq920OoyNyRwz?=
 =?iso-8859-1?Q?AUVSCN159N6RIIwvoi3g6r5c+TN56PzFEl6B3TKlIjzcyHPBuyAfBPQfri?=
 =?iso-8859-1?Q?dstMwI/XqZzQRjdI9Zsf5bQLdVYxw6LkVEt4PmeZxmfToDN5AcXtWuPm5x?=
 =?iso-8859-1?Q?KhhAegfYItvHViRx8LVQVkKj6WnxELcFuDob7EVp+Mmfm3wwilIgeLdGy0?=
 =?iso-8859-1?Q?1tAWwpnxgS/rV2f5NXBa/mkSCH/B4ugINTPC1xUPPzn+pEk7jt6O0YfY7N?=
 =?iso-8859-1?Q?9Mryr3nlWD+iz36mKgY8IU2vDu6OpJ3C35PUvQL+Yme5M9TVKA6b/Rqc8A?=
 =?iso-8859-1?Q?GQVahUxF8E+SLZLdI6rXNmOvXvwW+xVQa/WflANgPnkqoZlTK58RUhXwds?=
 =?iso-8859-1?Q?/ECze/ElnAgRk8cUve37OH1Yyrlc08g2Q1XretSnLglQPVDc9HPWJQmfvW?=
 =?iso-8859-1?Q?3i6gPPvniwrir13RwgVP8n0ipGQWJxW5tBehW07BwUMb58rAHQjZCEOaWY?=
 =?iso-8859-1?Q?l3frLGQc7rlX9UG27CRpfHSimCopb8dGY7kAancOoASu5EKV2w3E0fA/lp?=
 =?iso-8859-1?Q?AukI9qEmwWseKWAXoEVyEA3FKQJOGM+D5pxJmzUsK40c1U94vK1Bw9+3e6?=
 =?iso-8859-1?Q?bEd/WkKcoT7S/UrVg8w3/1sfP+qlTTverYeLp4smTMb2Zt1d6mKy6TD78v?=
 =?iso-8859-1?Q?0LWx9zw7zLYKP6nbjLAWu0O6rWBI01Oux/IGj/1jNS4VSZzi58ABNWrM0h?=
 =?iso-8859-1?Q?I0D1/R9M9eHwcxCxhdzb6U3eoTSC6HBtduK3ovagegfpeOLl/ZWzLZt3A7?=
 =?iso-8859-1?Q?ME9mm0sAd0ArfPRXA+GVlWb5+Q5kwvBtVdWW+tuYa2yHz2lIopKwNK+sAm?=
 =?iso-8859-1?Q?RHEb68QpPPMGvAJ/1Na2x6zH+BA0OPdpWjjZayT7qMCPLC0iCr4umtKqZz?=
 =?iso-8859-1?Q?H7oD2pvfX02a1OHPSrvbmZ1YwXnOnyRur3PbWQBDrBUDgqj5HcwDnOoXjj?=
 =?iso-8859-1?Q?fQPewYCzgTJSZkDiZzg/2hBqAPNSzqkJWNYJojJDAAekoi+dNexthgaIU6?=
 =?iso-8859-1?Q?N16qq1hVCI7bgf+QIg/qazqRgVx1jfiskKd+sFRmiN+QSorNIB7S25zjCp?=
 =?iso-8859-1?Q?CJdC8mv3CRVC7OjiPpDzxTe/1tT+TjWcsV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebcc0be-3579-42a0-b131-08de2d1c6d5d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 18:48:45.5043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/s9Yp5mCijsG+r0LC3Gpx4kjtx2cs09d38ovRqIaZMC5pLN5eGBdqt3MMGxvZfo7mhp3H8qa4ADOwvuq+SAKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBA72E12AE
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

On Wed, Nov 26, 2025 at 08:06:45PM +0530, Riana Tauro wrote:
> Allocate correctable, nonfatal and fatal nodes per xe device.
> Each node contains error classes, counters and respective
> query counter functions.
> 
> Add basic functionality to create and register drm nodes.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/xe_device_types.h  |   4 +
>  drivers/gpu/drm/xe/xe_drm_ras.c       | 221 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_drm_ras.h       |  12 ++
>  drivers/gpu/drm/xe/xe_drm_ras_types.h |  54 +++++++
>  drivers/gpu/drm/xe/xe_hw_error.c      |  38 ++---
>  include/uapi/drm/xe_drm.h             |   5 +
>  7 files changed, 313 insertions(+), 22 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.c
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.h
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_ras_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b848da79a4e1..7bc805b33e12 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -41,6 +41,7 @@ xe-y += xe_bb.o \
>  	xe_device_sysfs.o \
>  	xe_dma_buf.o \
>  	xe_drm_client.o \
> +	xe_drm_ras.o \
>  	xe_eu_stall.o \
>  	xe_exec.o \
>  	xe_exec_queue.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6ce3247d1bd8..69097e3b3995 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -13,6 +13,7 @@
>  #include <drm/ttm/ttm_device.h>
>  
>  #include "xe_devcoredump_types.h"
> +#include "xe_drm_ras_types.h"
>  #include "xe_heci_gsc.h"
>  #include "xe_late_bind_fw_types.h"
>  #include "xe_lmtt_types.h"
> @@ -353,6 +354,9 @@ struct xe_device {
>  		bool oob_initialized;
>  	} wa_active;
>  
> +	/** @ras: ras structure for device */
> +	struct xe_drm_ras ras;
> +
>  	/** @survivability: survivability information for device */
>  	struct xe_survivability survivability;
>  
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> new file mode 100644
> index 000000000000..5320e845e9d5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_ras.h>
> +#include <drm/xe_drm.h>
> +
> +#include "xe_device.h"
> +#include "xe_drm_ras.h"
> +
> +#define ERR_INFO(index, _name) \
> +	[index] = { .name = _name, .counter = 0 }
> +
> +static struct xe_drm_ras_counter error_info[] = {
> +	ERR_INFO(DRM_XE_GENL_CORE_COMPUTE, "GT Error"),
> +};
> +
> +static int hw_query_error_counter(struct xe_drm_ras_counter *info,
> +				  u32 error_id, const char **name, u32 *val)
> +{
> +	*name = info[error_id].name;
> +	*val =  info[error_id].counter;
> +
> +	return 0;
> +}
> +
> +static int query_non_fatal_error_counters(struct drm_ras_node *ep,
> +					  u32 error_id, const char **name,
> +					  u32 *val)
> +{
> +	struct xe_device *xe = ep->priv;
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[HARDWARE_ERROR_NONFATAL];
> +
> +	if (error_id >= ARRAY_SIZE(error_info))
> +		return -EINVAL;
> +
> +	if (!error_info[error_id].name)
> +		return -ENOENT;
> +
> +	return hw_query_error_counter(info, error_id, name, val);
> +}
> +
> +static int query_fatal_error_counters(struct drm_ras_node *ep,
> +				      u32 error_id, const char **name,
> +				      u32 *val)
> +{
> +	struct xe_device *xe = ep->priv;
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[HARDWARE_ERROR_FATAL];
> +
> +	if (error_id >= ARRAY_SIZE(error_info))
> +		return -EINVAL;
> +
> +	if (!error_info[error_id].name)
> +		return -ENOENT;
> +
> +	return hw_query_error_counter(info, error_id, name, val);
> +}
> +
> +static int query_correctable_error_counters(struct drm_ras_node *ep,
> +					    u32 error_id, const char **name,
> +					    u32 *val)
> +{
> +	struct xe_device *xe = ep->priv;
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[HARDWARE_ERROR_CORRECTABLE];
> +
> +	if (error_id >= ARRAY_SIZE(error_info))
> +		return -EINVAL;
> +
> +	if (!error_info[error_id].name)
> +		return -ENOENT;
> +
> +	return hw_query_error_counter(info, error_id, name, val);
> +}
> +
> +static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe,
> +							     int count,
> +							     struct xe_drm_ras_counter *src)
> +{
> +	struct xe_drm_ras_counter *counter;
> +
> +	counter = drmm_kzalloc(&xe->drm, count * sizeof(struct xe_drm_ras_counter), GFP_KERNEL);
> +	if (!counter)
> +		return ERR_PTR(-ENOMEM);
> +
> +	memcpy(counter, src, count * sizeof(struct xe_drm_ras_counter));
> +
> +	return counter;
> +}
> +
> +static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
> +			      enum hardware_error hw_err)
> +{
> +	struct xe_drm_ras *ras = &xe->ras;
> +	int count = 0, ret = 0;
> +
> +	count = ARRAY_SIZE(error_info);
> +	node->error_counter_range.first = DRM_XE_GENL_CORE_COMPUTE;
> +	node->error_counter_range.last = count - 1;
> +
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		ras->info[hw_err] = allocate_and_copy_counters(xe, count, error_info);
> +		if (IS_ERR(ras->info[hw_err]))
> +			return PTR_ERR(ras->info[hw_err]);
> +		node->query_error_counter = query_correctable_error_counters;
> +		break;
> +	case HARDWARE_ERROR_NONFATAL:
> +		ras->info[hw_err] = allocate_and_copy_counters(xe, count, error_info);
> +		if (IS_ERR(ras->info[hw_err]))
> +			return PTR_ERR(ras->info[hw_err]);
> +		node->query_error_counter = query_non_fatal_error_counters;
> +		break;
> +	case HARDWARE_ERROR_FATAL:
> +		ras->info[hw_err] = allocate_and_copy_counters(xe, count, error_info);
> +		if (IS_ERR(ras->info[hw_err]))
> +			return PTR_ERR(ras->info[hw_err]);
> +		node->query_error_counter = query_fatal_error_counters;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int register_nodes(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_drm_ras *ras = &xe->ras;
> +	const char *device_name;
> +	int i = 0, ret;
> +
> +	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
> +				pci_domain_nr(pdev->bus), pdev->bus->number,
> +				PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> +
> +	for (i = 0; i < HARDWARE_ERROR_MAX; i++) {
> +		struct drm_ras_node *node = &ras->node[i];
> +		const char *hw_err_str = hw_error_to_str(i);
> +		const char *node_name;
> +
> +		node_name = kasprintf(GFP_KERNEL, "%s-errors", hw_err_str);
> +
> +		node->device_name = device_name;
> +		node->node_name = node_name;
> +		node->type = DRM_RAS_NODE_TYPE_ERROR_COUNTER;
> +
> +		ret = assign_node_params(xe, node, i);
> +		if (ret) {
> +			kfree(node->node_name);
> +			return ret;
> +		}
> +
> +		node->priv = xe;
> +
> +		ret = drm_ras_node_register(node);
> +		if (ret) {
> +			drm_err(&xe->drm, "Failed to register drm ras tile node\n");
> +			kfree(node->node_name);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_drm_ras_unregister_nodes(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct xe_drm_ras *ras = &xe->ras;
> +	int i = 0;
> +
> +	for (i = 0; i < HARDWARE_ERROR_MAX; i++) {
> +		struct drm_ras_node *node = &ras->node[i];
> +
> +		drm_ras_node_unregister(node);
> +
> +		kfree(node->node_name);
> +		if (i == 0)
> +			kfree(node->device_name);
> +	}
> +}
> +
> +/**
> + * xe_drm_ras_allocate_nodes - Allocate drm ras nodes
> + * @xe: xe device instance
> + *
> + * Allocate xe drm ras nodes for all errors in a tile
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_drm_ras_allocate_nodes(struct xe_device *xe)
> +{
> +	struct drm_ras_node *node;
> +	int err;
> +
> +	node = drmm_kzalloc(&xe->drm, HARDWARE_ERROR_MAX * sizeof(struct drm_ras_node), GFP_KERNEL);
> +	if (!node)
> +		return -ENOMEM;
> +
> +	xe->ras.node = node;
> +
> +	err = register_nodes(xe);
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to register drm ras node\n");
> +		return err;
> +	}
> +
> +	err = devm_add_action_or_reset(xe->drm.dev, xe_drm_ras_unregister_nodes, xe);
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to add action for xe drm_ras\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.h b/drivers/gpu/drm/xe/xe_drm_ras.h
> new file mode 100644
> index 000000000000..6272b5da4e6d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#ifndef XE_DRM_RAS_H_
> +#define XE_DRM_RAS_H_
> +
> +struct xe_device;
> +
> +int xe_drm_ras_allocate_nodes(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> new file mode 100644
> index 000000000000..452ff9a91510
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_DRM_RAS_TYPES_H_
> +#define _XE_DRM_RAS_TYPES_H_
> +
> +#include <linux/limits.h>
> +
> +struct drm_ras_node;
> +
> +/* Error categories reported by hardware */
> +enum hardware_error {
> +	HARDWARE_ERROR_CORRECTABLE = 0,
> +	HARDWARE_ERROR_NONFATAL = 1,
> +	HARDWARE_ERROR_FATAL = 2,
> +	HARDWARE_ERROR_MAX,
> +};
> +
> +static inline const char *hw_error_to_str(const enum hardware_error hw_err)
> +{
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		return "correctable";
> +	case HARDWARE_ERROR_NONFATAL:
> +		return "nonfatal";
> +	case HARDWARE_ERROR_FATAL:
> +		return "fatal";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +struct xe_drm_ras_counter {
> +	const char *name;
> +	int counter;
> +};
> +
> +/**
> + * struct xe_drm_ras - xe drm ras structure
> + *
> + * This structure has details of error counters
> + */
> +struct xe_drm_ras {
> +	/** @node: DRM RAS node */
> +	struct drm_ras_node *node;
> +
> +	/** @info: info array for all types of errors */
> +	struct xe_drm_ras_counter *info[HARDWARE_ERROR_MAX];
> +
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 8c65291f36fc..2adc2e6540f6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -10,6 +10,7 @@
>  #include "regs/xe_irq_regs.h"
>  
>  #include "xe_device.h"
> +#include "xe_drm_ras.h"
>  #include "xe_hw_error.h"
>  #include "xe_mmio.h"
>  #include "xe_survivability_mode.h"
> @@ -17,14 +18,6 @@
>  #define  HEC_UNCORR_FW_ERR_BITS 4
>  extern struct fault_attr inject_csc_hw_error;
>  
> -/* Error categories reported by hardware */
> -enum hardware_error {
> -	HARDWARE_ERROR_CORRECTABLE = 0,
> -	HARDWARE_ERROR_NONFATAL = 1,
> -	HARDWARE_ERROR_FATAL = 2,
> -	HARDWARE_ERROR_MAX,
> -};
> -
>  static const char * const hec_uncorrected_fw_errors[] = {
>  	"Fatal",
>  	"CSE Disabled",
> @@ -32,20 +25,6 @@ static const char * const hec_uncorrected_fw_errors[] = {
>  	"Data Corruption"
>  };
>  
> -static const char *hw_error_to_str(const enum hardware_error hw_err)
> -{
> -	switch (hw_err) {
> -	case HARDWARE_ERROR_CORRECTABLE:
> -		return "CORRECTABLE";
> -	case HARDWARE_ERROR_NONFATAL:
> -		return "NONFATAL";
> -	case HARDWARE_ERROR_FATAL:
> -		return "FATAL";
> -	default:
> -		return "UNKNOWN";
> -	}
> -}
> -
>  static bool fault_inject_csc_hw_error(void)
>  {
>  	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
> @@ -146,6 +125,20 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>  			hw_error_source_handler(tile, hw_err);
>  }
>  
> +static int hw_error_info_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	if (xe->info.platform != XE_PVC)
> +		return 0;
> +
> +	ret = xe_drm_ras_allocate_nodes(xe);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  /*
>   * Process hardware errors during boot
>   */
> @@ -178,5 +171,6 @@ void xe_hw_error_init(struct xe_device *xe)
>  
>  	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>  
> +	hw_error_info_init(xe);
>  	process_hw_errors(xe);
>  }
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 47853659a705..053cbe1aafbb 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2273,6 +2273,11 @@ struct drm_xe_vm_query_mem_range_attr {
>  
>  };
>  
> +/**
> + * RAS Counters
> + */
> +#define DRM_XE_GENL_CORE_COMPUTE	(1)

The feedback we got from Joonas is that we should also make the string name
an uAPI defined here in the header.
I'm afraid this series is missing that part for all the patches here.
Perhaps we should also mention this in the docs in the firs patch as well.

Other than that the series is great, thank you so much for picking that up!

> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.47.1
> 
