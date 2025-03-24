Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E7BA6E052
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7F110E49D;
	Mon, 24 Mar 2025 16:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOvWAU7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6988410E171;
 Mon, 24 Mar 2025 16:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742835432; x=1774371432;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=68VLjPx3fC0he8ZUvF/2zubAZDr27ZOUsdXhXyG/F+U=;
 b=KOvWAU7wUZzsR9din2Mev3JaUsLUmPQMmWRMFFZf8fUyKnWFHd0S22+c
 Kae3T2Uk7YJuMLf/rtG3jn4cyJ/bCbDTh4ikbjKWupm5w8RS2kz4LheWb
 bTdgjy2xE/DRKf2VDvAHIMveWZk5MzGS9F9EEAo9rYoSQNwousWIWatCy
 CH7fhF7iKox8g5QMmZc0bb81v1scN+1ozPOmlglfdTNvE06Xca+TqNOxU
 wMHEH0fcnlFXVsJJj2mUwXB0WD64aTDagw9c5ooEI94y9yZrqwKw3TnVT
 ukCKT/QwrKzTSA+EvGLeaOzH0I516BGkMocmTQH3rigtwZxCThUy3ab7r w==;
X-CSE-ConnectionGUID: CcBWvnzrSdek69/yIaAz7A==
X-CSE-MsgGUID: i9ewXBofS36iy8w3EBmjFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="61445301"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="61445301"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:57:11 -0700
X-CSE-ConnectionGUID: NwOliQNjS4OkcbSTPF2YYA==
X-CSE-MsgGUID: N5pUGYLCQOSkVxzJCXM/WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124891786"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:57:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 09:57:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 09:57:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 09:57:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uv74E1BnYsSF7a6JQSopC6kOIBdR+uh1RKI6x0lqdMReUXw8LPOJ0g4PSBFrHjFsbLKlKj0UGm9FH49efr8TBhxugDEE/hnr5EXXuFs5sqJYOT89VEL8o6djUl/w2ICHMGfNqEOrWW3DMgrWDXbNfiCFE+E6SlvZzhYvGI0mENoGg28F1sBWytB4q68Aya9lpUmT91B1sRDalBRZrqPGskQiS3gIlQ71TMWqiiCQSUthE+JBWEbFbDS+od1dBK00sg4AKGB4E/xc8c2v0ykoXn8udCOGbrbmWkMKAMNOBF+T/r6l+pkGelURXSAocwi+eO2LtuKAon/MNrEfr+sDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhlsImSTItn53Ro4AM+FCdavFa47Ydo2B58B1KFkPGQ=;
 b=l6KGdZCyIKiEdQhQw3DecBP07Gg0ht9jOR4ZVfnw7ov5Yqjiim7BlG8+gqQbN935VW1uV8E9n4U+AvgTm+RZLx+1iWlzDpsvvuuUYWknFkkAsuE1Dby+0qU9C4hnpPZiMcCKWbgOohP3alEu6on907qp+v4UtvH6/LJfGnaLBf+ejkhEtDxlAKwF6GpqHkmeQ6qcCACJ6SomsGM3PWdoCYMPf6PU3Ob4cQd8oIeUOwq7ML8lQCtzHowx/Egv3Cia9xlQ+fHKb+3A0J32HRJ+qOndxR7oM+Dzm1ACbN+avNaSOFXMJQcZLxDUhH2XJax64z5NYTEbf22qRcsSrOV7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7532.namprd11.prod.outlook.com (2603:10b6:8:147::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 16:56:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 16:56:38 +0000
Date: Mon, 24 Mar 2025 09:57:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <dan.carpenter@linaro.org>, <kernel-janitors@vger.kernel.org>,
 <error27@gmail.com>
Subject: Re: [PATCH] drm/xe/svm: fix dereferencing error pointer in
 drm_gpusvm_range_alloc()
Message-ID: <Z+GPDvA8PM7DJ9ex@lstrano-desk.jf.intel.com>
References: <20250323124907.3946370-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250323124907.3946370-1-harshit.m.mogalapalli@oracle.com>
X-ClientProxiedBy: MW4PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:303:dc::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f1ce73-48fc-4355-d23a-08dd6af4d7f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gGEWfG62AsDLaLOJTUWGnGvy5ER+Gp691TZIvAWON0+1r7HCt7fLvmF5X1zu?=
 =?us-ascii?Q?5wvTFxcE277FelFzSf0HUwiLPZbNaGafEjj48o6LhO/ZsZ877Qx09WMVoREb?=
 =?us-ascii?Q?A9sMl7qDEpGJ456vvdgZqNGgSW4Uzw6b3URrdJibhy/tfuL8z1AeVrq5pxkL?=
 =?us-ascii?Q?p0/eTMqNAp/7CJz3sm3PJ5Nw51TMqSCx+4sohencjvHkW9NfbD9kaqNeA/ks?=
 =?us-ascii?Q?JbylzYtbZZ3sgZi6Ti9sjjyKqSN+Ys7AhGKPHUZnG0yCw0xKEff8GGMBxV27?=
 =?us-ascii?Q?PaxKEcv/4nzcseS6BFsKWIaTKdL+A+lQJw4Q8c3LwAorxyyIE2yQ70iPfSxy?=
 =?us-ascii?Q?NB3H85d4O6iBwy9PqvQapHgF+1rn/qvBZEgOJ7eG8HR+IbCKetHF2BoMwbd5?=
 =?us-ascii?Q?P9V+SNDfQQI2RYx/jp54NfpOoImdXIZ4GixpdvClFDcR1O/OlDbpOJ5tYxT9?=
 =?us-ascii?Q?StUIRK1hRB6kFQYa4MHb+0hBiora2E4srNWtv+raGZ+o+DbySviGtFalGJ5Y?=
 =?us-ascii?Q?FLbnzrCgW9A1PB3B1L+t141rEUreemJXGjN6e3QkuU8RcmJafXP2t9c3W/0N?=
 =?us-ascii?Q?bQf1w9Rnq5l2KpP7xQlyaCXe3FOdp2naRj1JMolEJcOogWBVYVKjelvpC8TC?=
 =?us-ascii?Q?/nKOysn6Ia6ORqlxbu9L2EM7D9Np4qxnEyRIE7D/nyKURRrmF/ScB12BVGv0?=
 =?us-ascii?Q?8BVtzx79Ut3p7WMGAuaw953g6/edRJXdbWQ4Fz/qPd/bqoFqNF5i9e948pSL?=
 =?us-ascii?Q?03xjdQoBCrfYCnfybC98pwNrAVTadF2RIhT0tVLA3h4GRm5KP4t8G2PrI0IY?=
 =?us-ascii?Q?mOjCbjqP/IncOJ9+4ASgM03aFmcrfmN64ggFMzUdW9kTUR9+6ukVf86Dhe2E?=
 =?us-ascii?Q?LWDgelCZw7SjlEa2wGpU4qd5drrIRHshAFw7fKxhzOI6FjrTXDxUeI65S4Rr?=
 =?us-ascii?Q?Mgv+fJNvQG7cILro7gZptfsmC5FD3gjEGCVbT1UdVqDxWCf0X/nOzSjmR5Yb?=
 =?us-ascii?Q?jPJWj18CH0ToTt73JDYNep+Z2XLCy3d5P6nrYAZA4aswYQ0Hx9tiEAMX2fEc?=
 =?us-ascii?Q?KSLv+Y8oiyxrYE1+XxDT5Y8vfPzSe6m0zRdsSzF2Sn0+FXlFFjMC7XyysVP4?=
 =?us-ascii?Q?9U6DfMrn3WecEDQNEtOo+i3HJyBFVjBOfBFqZfwyyND3swBUdnPw5ULnhtXx?=
 =?us-ascii?Q?a1Q93mwfP07wybn4MGryMtHupf4iI7n3dSvelcPPRmaXevmqKDNNq5+pgfUA?=
 =?us-ascii?Q?Sn7gmgItxMEXrmboT7HEUw2EHz9Zohp3e3O7/Xs2p11c7hybCgzYQhqmqvP2?=
 =?us-ascii?Q?lpAdQpY9nyYccz+Joqbma6Z21/7fHNecfxu3d/VGG0HlF9dvxMzqlgA+uAGc?=
 =?us-ascii?Q?3dA7/E3qUvctDn+pOnrUbY5UibgP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xbyr8glSHT0ERQur+prfYfWA94a5VclxDQ+iwER1DnGumriIwpMxGgmJ6kcE?=
 =?us-ascii?Q?mlZXIXb5OqgTmuIrLrs4C5qCg7E3HXNO+/jIoQfrTYbAJiQ6Zz8N72I+4C6h?=
 =?us-ascii?Q?ad+vkNDqFXcEFRqDr4/4bof+lksLMWF2v7jsv/k9kSAGIry+/E0nB/8u+aYR?=
 =?us-ascii?Q?bRq/e/bWOQaFF0ercM4tD3SoQn7ohLe2sNJ+xSeXQT0RfN0wM3XTJW9StqOr?=
 =?us-ascii?Q?UX57GHRG7jZF62422XUTDWGCKLZgm/j9J5mSCkIunS28c8ip1DXE5I00r6Kw?=
 =?us-ascii?Q?zaH9OouKQN1MohJhQsSXu8Rra9p5l2VaalT6FcnI3VIzwxSoQi4UB3inkquW?=
 =?us-ascii?Q?6iFgcrgAZfwE7yGnxwOxPGvY8ly3Hpjizz7lwiOdTAnzHBwf3upfoHcLKtxt?=
 =?us-ascii?Q?GJeOPtu8ECAIsZQx0xwhjyVUS3V5uTVlMO+1EgFsHFeUISigyQkvGyCQpgUS?=
 =?us-ascii?Q?XdaLB7qLaf8jYb0/FkJylLrxAAvIgh7m1ohQwC+wLBIfM9gBp0FfixQKKLlq?=
 =?us-ascii?Q?rLL/MYzRPRo38sRjey9Ejt2IwpGzAZqoCxpPXpX1k9loFqIEQDc77afN/+S6?=
 =?us-ascii?Q?QTMbnz7EnPCayWTOgRwKO2JwtR8qGs1LK7GTsSE/+EIGjyhoINhJLCEOU7l2?=
 =?us-ascii?Q?frCHJHYGJO+zU4aaHSH3uHzJD/JZiYxVs96+5i2AFJblMBpI39U4Sc5qIiWQ?=
 =?us-ascii?Q?fip8FQrPPtJWRXsgKRf0PuR9EzhkclWbHKTZcDDxPEhtXDQV0s6kXMdm2oou?=
 =?us-ascii?Q?h/ZO/SJxmFKoURsNYffsmMXQmqVTJrvpwj2U7jytXpJDOw7MVOFStiAMsuKh?=
 =?us-ascii?Q?CViV9KbALzt+8IKU1B8q28TgKT0ICiYh6QR1PZG5N15aEeisYik3fuy5CKD4?=
 =?us-ascii?Q?PNfOD7qmUDg3iUTwULUvSSzv59qCEi/1+mK4k8FxScT//Sv4ospVjvfQWhcp?=
 =?us-ascii?Q?zeJD3t1qdzVLmVujpiVIb6FllmF2Q40poieoaiTmbErgS8Wg6JVIvSJIknT6?=
 =?us-ascii?Q?M3JonnP9SePWMMAOSMv1C91PdfTLc067SdAcR/S14bXqJmVdFvjUpuBpTw6p?=
 =?us-ascii?Q?3RbCD0N91tTY+wAO2/XnoxdiSx+7GIkqqzELbMFyghmdF6JtAMAb2/SvQMqb?=
 =?us-ascii?Q?Jc8rSE+okfIdOWfpeXtBN0tD9oQ01wn//8u4FuAn7ZX+t+YMCamC54TE75zT?=
 =?us-ascii?Q?3HkzvUWGaCwFKP13J9RSiEHmh9zn83b6HwDjNX2VjPj9AINmOqNqq1Q+IE5I?=
 =?us-ascii?Q?K89B/kt8UTzvJDg0tnBruK+I+66FwNdWquDiNz72D/7vY+AmX0uHiwBrOm7p?=
 =?us-ascii?Q?H1ldH5ICcbNay8Tg+xu1qdQJZ1lwAgWRDISQgoKrXa40L4sTdVf09hTJu/xa?=
 =?us-ascii?Q?YJuc/zZ1dlyb8fvNe05lcH2jNNPd1C9zKQ0Q/V4c3zoR+F6lzlXxsIydgmpX?=
 =?us-ascii?Q?KlPU5r8GHy0dRHZAFU5TqoJlTZxOHALm6YsZPSaHnIq67Bn1wBrB0JdN88Yb?=
 =?us-ascii?Q?ELugADMvMvIJ6CTYNRa239zoDg83cIIPPEp9UkIc7NDqh/KQmD0VG7+IHTtv?=
 =?us-ascii?Q?2MPmy/5/jffmq6u1qNs/g6C7pT54chqjgtP24uDxucwOYkGBaokT7/Aukacy?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f1ce73-48fc-4355-d23a-08dd6af4d7f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 16:56:38.5667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXfG574qjhMPIEfcbJLc4jvQcMjEsASPMKIZS/lXN5GKxxItKmrUNIvHkMXs+ptJmF4JWMDjUE/rTLbVc0y82w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7532
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

On Sun, Mar 23, 2025 at 05:49:06AM -0700, Harshit Mogalapalli wrote:
> xe_svm_range_alloc() returns ERR_PTR(-ENOMEM) on failure and there is a
> dereference of "range" after that:
> 
> 	-->     range->gpusvm = gpusvm;
> 
> In xe_svm_range_alloc(), when memory allocation fails return NULL
> instead to handle this situation.
> 
> Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/adaef4dd-5866-48ca-bc22-4a1ddef20381@stanley.mountain/
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> This is based on static analysis and only compile tested.
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 52e04e7e343f..a79df8cf1f36 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -80,7 +80,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
>  
>  	range = kzalloc(sizeof(*range), GFP_KERNEL);
>  	if (!range)
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>  
>  	INIT_LIST_HEAD(&range->garbage_collector_link);
>  	xe_vm_get(gpusvm_to_vm(gpusvm));
> -- 
> 2.39.3
> 
