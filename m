Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E473AA6AF4F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 21:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C1610E6B9;
	Thu, 20 Mar 2025 20:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrOMu5g0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7977710E6A6;
 Thu, 20 Mar 2025 20:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742503332; x=1774039332;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/rrBMarsh8XSU/c6JgJYO/0/GrB3tlbznMXQ80X/wmM=;
 b=XrOMu5g0UR60q7FMDA0idat1hVHoRa+7iPKp8b1HdjRShmwxd9VglNBg
 0nLl4MvK9UMvauIC78xOOs97yC9EwS0tM+pZkXVEE25D2V+AzbCu4+5df
 S/2EHJyLBEAG35mHbM37XqdLcWttQgzJlwndRd3bTyQlandnRbupfFXDR
 qPKy1/7xo5vHiOdoZqNKKNceURVml7jSlI4YkQV2gpgTVwF5WT4xvUShP
 bB2R484g0XNDaq8ODkJL1zEdSi7og0bR5eV9CHdtoo+DsGql6y5lQWe0b
 ILgejTPnKSlg/4eo2OxmxOMWCSMNCQSjpNfJU0n725tRQFTTSgeajBC+K g==;
X-CSE-ConnectionGUID: B7ZSXeLQRsGr8rxF+Bq2OQ==
X-CSE-MsgGUID: zlhl+24bTmiooHIWlGGLaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43642545"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43642545"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 13:42:11 -0700
X-CSE-ConnectionGUID: kI6f/fiYSoi5VQnF+1fimA==
X-CSE-MsgGUID: tvvLMhrSTAqIf8dtzSqzrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128272381"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 13:42:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 13:42:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 13:42:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 13:42:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFK0UHkG7FP5zO6HEamCLlvKc1vMhkF6QZwrifeeIdbljNGwgpZ3yrVcqiluMPh1Fc5niILvEth/A6syMlG9u/YcCm2IEjGVSDe3wYCTEuzyy2vgeHAn173E7dnhaveFNz4bcGJZjohVanBVdPU7fBOCIW5Rjk6gV7a4BVfwrjZdPYHh6nFRzOzOjq9huSltbk/GxQKbIt/xeuqKifx6Z2vKnHmcIxFMq+fpaek0ElRhV1jRAppcDpkBDXQa9DOLJ95MgRYlR+9p6au03ggtHiRffCWtwEbD0HhvATihJSggL8TweqxL/yBTve1neLfTJykZoKf5Vrd8OVOgrfo3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3ZbVo45xLxRq9VcUPugGllpVXvreheXKEMaDo7ATjY=;
 b=DNu3Uy6MeT+B9OEaOsNewO6LlIwHDUvt5kAQR5a1LQts4rYLnREAVavifwSb0Sqafh3xwVbbfHWG58/LfFPExGeNsBH8jhhG5zRcv8hBVVwEalAZHSNow2jq/7UY4nbGG/cSSriqGd2Z1rCtEGcSZOqBhjWLIVvb+v6vmf9p1LGJTd1YKCXl7Pg3pwYCf5feOTuFLsDhxHJDuv63Mlo0GSzqqRW0Ob7sPUYvX2Gs7bERN+RCwB/sotZ+H3I9daDCP9ZkUvJo8JRzSZXgioOqB0oIyHGatC1k6hBrzlFlif/NVb5co/WHo57gNeb2Ns+P6SynYFgLAMtYjwicwx26yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 20:42:05 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 20:42:05 +0000
Date: Thu, 20 Mar 2025 13:43:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/gpusvm: pull out drm_gpusvm_pages substructure
Message-ID: <Z9x94yBoffcSbwv9@lstrano-desk.jf.intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-13-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320172956.168358-13-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0258.namprd04.prod.outlook.com
 (2603:10b6:303:88::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: ce15e13f-ccfc-4c96-2e29-08dd67efacc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4n1u8k617Uxg5AM6QEerWJWIV8etQ1BdWWeZvuBXWzvWeD2UnGzXEUTg/P?=
 =?iso-8859-1?Q?ZFLwzCDoezGvJxpwkaXuAZWyqzC7d5t0XJQqcv+i91YSbzu5nADht6khJn?=
 =?iso-8859-1?Q?TpUi/wmPU/w3Fxn9b/1Xa33KZZPfdYVIjh6QzMCF+Iu9K9YPkenIs/8dUZ?=
 =?iso-8859-1?Q?JNsgxJ0bS0WhaewvYvcIvJK4js6N+duW5AkcsEbhvHlygVBr52Ks6Lqsva?=
 =?iso-8859-1?Q?3l5MC5viVNGXsJiunWU+Gk221EaVKlyK/iR2iqqkCAtn33HStiJmdJQLok?=
 =?iso-8859-1?Q?LhIBhNbHMK+l133m6QjPWhOgC+cyDYmtSpN1OVESEX8bTBaAHudZ3W4tjF?=
 =?iso-8859-1?Q?X00mhnCUJH6GoQAz5J8Nov079WY12OPrb+W0Q/ZYxPl8HUwqBE3n0st1B1?=
 =?iso-8859-1?Q?EigMMQYFGcdEl/2uj86eoRiQwT7tsydhM5oP2l4VKRH3pZl6xrULLmofIU?=
 =?iso-8859-1?Q?+FvkcrxtVLBEZINndZd67KionqFiR+8l6oxsZYe0FTA1BMGxKYs4plVEJh?=
 =?iso-8859-1?Q?Qy2U6jlQb0PSm0ac0pjlpWlhuBxcqf7FEC4l3HuDAFOPRoEHVAyGdsCTRD?=
 =?iso-8859-1?Q?tBW93DUY8wVUl4kZ3h6vywMdgRIS/N1OU/ZhmFB9oK94Kpi0mUdxo1abVO?=
 =?iso-8859-1?Q?tgwdkOiykon2yTY/Q/KBlAajyPOvLq3SInAuIr0IQr+F2nw7YvJjWVEJFl?=
 =?iso-8859-1?Q?fO4s6Rc9rg6mxPaPQjrjBWK+VfgYSMelRgSMeFpLIWMN85FRAEmOdWHFUB?=
 =?iso-8859-1?Q?lwhPwljoesUBFRf/wcaDSu8vUt1IAZCeKjptHxsU8W/ImoA+UJlRYA695t?=
 =?iso-8859-1?Q?6vW0JcoiovKbMTTjsA0v+p5iVhRXE6c4QNxDmkaBWoDzaBcHrK3KqWFtop?=
 =?iso-8859-1?Q?Gl2rbVYEXKzVvifk7Lmk5vNJBnWdjZYI4KYLybQJTOkSfjFUm+P1gYd9Q1?=
 =?iso-8859-1?Q?19dI4TmapJCb/AMdHG6hVL0C6qwXP0+FolKv5ItaVZMb+QmSw5ulgaPKxG?=
 =?iso-8859-1?Q?hCyOlV1F5t8izooR2WpymoKJqJq69jercuyEMqnTk1+QOcoKOTzSfWsTLA?=
 =?iso-8859-1?Q?by52xmpzWFtqJhrzUKXygz/WhmcC7p10u516Wy6PQeBzy1pUBeh633oGok?=
 =?iso-8859-1?Q?rgi/U0v4vGYSkRu2FymMWuJoMBwNWE4D7N6WYRS0HLab9FehA/2rE0s+6s?=
 =?iso-8859-1?Q?1vlGIqJN8ChOIekN9Ep5RIlyjBCjQfoxEYcM4gfVS24rya1gqxWrTSqg5L?=
 =?iso-8859-1?Q?gAvlcb8H4UN9IBubanph37EzXXBX6V/zuVghG/2QZpGbFnN5ITK7o01df1?=
 =?iso-8859-1?Q?pb7w+IgIWPs/uPqSYXw8P0g4QPUbB9V3w8Ewr/DpwKE/0WsRVSFFpUUHEo?=
 =?iso-8859-1?Q?YhpRfxYDCq8+JrLai+ebHlfXrxprNpIOsPvOcuf2IWqcDltWzAIFB0nAXS?=
 =?iso-8859-1?Q?MFVMclvGULt2D1t3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Vt+9OU0gHrNOUgMaPGw/2GO6iS42OmFBT+zKVODCtMH4X4/LJ1jKbCaQqn?=
 =?iso-8859-1?Q?x2lnA02dVJWGfO53DBiI8dINyFDzcq1MuEZf78CTW1VXXc7QmKievdvESH?=
 =?iso-8859-1?Q?0I3Mg2BPQA5hUCw9LQJsxGlOW6aow5TaybsydgzP0DpuIMHB95YrxWhQc5?=
 =?iso-8859-1?Q?BsLtHTjpNnl6cxgrZuHtCBNb3UdZ4S2rhle3+Wv8vR9hGT7IV3aXdVLGkX?=
 =?iso-8859-1?Q?mvtZHtlNwP0cDlsjG8UU3FtuJPgIXjgT04/iPLALVCow24JyK4u7+r6r2G?=
 =?iso-8859-1?Q?PeU6SykKdmCR4m+KJ6xjQTh99ai8dBQhwN3N1rlSnkYfwP2Fk85+YNYpTy?=
 =?iso-8859-1?Q?NCek/PES7PxAFZGDYjg9Z1/TDi1uUk4j8IASEf/3Eocc9E6XAl2+k1Har2?=
 =?iso-8859-1?Q?bub+vxP+PfGBEMtuyki/K7WQWiAPor04Lla1RZIsrA92ULh58QBTH/CBj/?=
 =?iso-8859-1?Q?jnnmZHQvO7geRoflf7va1POe7+8LjSdm5ec1XSVZEnyJoFi61FOeJuZcGU?=
 =?iso-8859-1?Q?UuqnuxqGwfcSjGjej5A8v24bLdXzrLjOXL/6cij/5rtDVyBm6Li/x7SqUA?=
 =?iso-8859-1?Q?a834c+QG5v2pIPCL+pXStQs2ghhPbdUcNv5MubIqHh7UmqZWAvIXRkpXvs?=
 =?iso-8859-1?Q?LfxbpAuWKGGX5DG4+kETP7Du614p/wB0slzAMHlqs6/4t+zYIGkep5Qixy?=
 =?iso-8859-1?Q?OBtV2AabN86bld2TF3O2GiLr5yOWrvo2Q9H90ErxF1IQn/AM9u8IUb2QT1?=
 =?iso-8859-1?Q?F4oV/WxcnYFansALW+iGvkyec/m2h5tWOMvTJR2t8dLefrPpf2fPJIH+l1?=
 =?iso-8859-1?Q?YY0fjsiLZdXRcBzriQsu5bASSTujzIFM6L6n/K4AxXNjobB2yB/XutRtpv?=
 =?iso-8859-1?Q?ozV0/qZao0vzJpAwYKt6A16J4FkhAsK/siHyF2IQw35bysr+nWqHiQ3DXZ?=
 =?iso-8859-1?Q?jDizZJnrU3ZppEqKExRL9ZfHDkHcQ6rmQDrirvqhUhxhO+vA7c84ZKkoKx?=
 =?iso-8859-1?Q?JThXG/6I65aEbyupuEps1zwJfoGn4tVPdrrgAcuPgK8WCe8BTObdC4ZCqf?=
 =?iso-8859-1?Q?McgoNvak9eJToyXljfv1hKMKX1HRZa2aUNcTCTwj4Apm/1XIAeYCfvlhaS?=
 =?iso-8859-1?Q?cDOAsctRLgmiRGw4jBUMJllbtxzYiJPA4NN0BN/j8L3RrG27MNths/IkkY?=
 =?iso-8859-1?Q?6/eTxHZAYPAfTyDWIaLzgKN31MvHxSWqoSwTYGLIdnWh6F1YyDu5eOiKhD?=
 =?iso-8859-1?Q?l1riQmPWs8Ff8Sek6HQ+OwJworlZ9JyGpguUPgbPsLCpaIvEJ6+H4RodJU?=
 =?iso-8859-1?Q?bwrfstty6G5SMJHXQff7rlUzmnc6IJ0/SyUS3KejAeDYn2YdPULIzMmKlT?=
 =?iso-8859-1?Q?KIiI4Lc+cvjAS7cKzVE+6aL8eRNNS7vFRxdducZJfPMY2yu+rTdEoAtB8X?=
 =?iso-8859-1?Q?SdqMrLcNy+S9VrFmHXrEUowBfJsdM2KShgZMu28FxxS9r6NbUFKf/lQ7fk?=
 =?iso-8859-1?Q?/pt7gm+0uichDV0ZoWqxIlwtPVpoJaKr41TdMv0drvh1JllYvaXKqYux1o?=
 =?iso-8859-1?Q?7lUVUV2CON2BgQxC453Z42meBli4fopd3NP7EWeTJKcxNPwHCfWRyvI5Sa?=
 =?iso-8859-1?Q?FD2L2S3UNdQQ/7Rd0jtNY1WazdYk2GqpizgLoJOzMf/h5osugHFVVdlQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce15e13f-ccfc-4c96-2e29-08dd67efacc7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 20:42:05.1642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWcO0Im3vyNfeEYxqAmYTQx0j+Nkow1st2TUlhtfx4n64yi67rxw+Ba1CbqLHi4I1o6iGC5x6FJP8ze8gGu74w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
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

On Thu, Mar 20, 2025 at 05:30:01PM +0000, Matthew Auld wrote:
> Pull the pages stuff from the svm range into its own substructure, with
> the idea of having the main pages related routines, like get_pages(),
> unmap_pages() and free_pages() all operating on some lower level
> structures, which can then be re-used for stuff like userptr which wants
> to use basic stuff like get_pages(), but not all the other more complex
> svm stuff.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 95 +++++++++++++++++++-----------------
>  drivers/gpu/drm/xe/xe_pt.c   |  2 +-
>  drivers/gpu/drm/xe/xe_svm.c  |  6 +--
>  drivers/gpu/drm/xe/xe_svm.h  |  2 +-
>  include/drm/drm_gpusvm.h     | 43 +++++++++-------
>  5 files changed, 82 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 5b4ecd36dff1..f27731a51f34 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -812,7 +812,7 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
>  	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
>  	INIT_LIST_HEAD(&range->entry);
>  	range->notifier_seq = LONG_MAX;
> -	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
> +	range->pages.flags.migrate_devmem = migrate_devmem ? 1 : 0;
>  
>  	return range;
>  }
> @@ -1120,27 +1120,27 @@ drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_find_or_insert);
>  
>  /**
> - * __drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range (internal)
> + * __drm_gpusvm_unmap_pages() - Unmap pages associated with a GPU SVM range (internal)
>   * @gpusvm: Pointer to the GPU SVM structure
> - * @range: Pointer to the GPU SVM range structure
> + * @svm_pages: Pointer to the GPU SVM pages structure
>   * @npages: Number of pages to unmap
>   *
>   * This function unmap pages associated with a GPU SVM range. Assumes and
>   * asserts correct locking is in place when called.
>   */
> -static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> -					   struct drm_gpusvm_range *range,
> -					   unsigned long npages)
> +static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
> +				     struct drm_gpusvm_pages *svm_pages,
> +				     unsigned long npages)
>  {
>  	unsigned long i, j;
> -	struct drm_pagemap *dpagemap = range->dpagemap;
> +	struct drm_pagemap *dpagemap = svm_pages->dpagemap;
>  	struct device *dev = gpusvm->drm->dev;
>  
>  	lockdep_assert_held(&gpusvm->notifier_lock);
>  
> -	if (range->flags.has_dma_mapping) {
> +	if (svm_pages->flags.has_dma_mapping) {
>  		for (i = 0, j = 0; i < npages; j++) {
> -			struct drm_pagemap_device_addr *addr = &range->dma_addr[j];
> +			struct drm_pagemap_device_addr *addr = &svm_pages->dma_addr[j];
>  
>  			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
>  				dma_unmap_page(dev,
> @@ -1152,9 +1152,9 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  							    dev, *addr);
>  			i += 1 << addr->order;
>  		}
> -		range->flags.has_devmem_pages = false;
> -		range->flags.has_dma_mapping = false;
> -		range->dpagemap = NULL;
> +		svm_pages->flags.has_devmem_pages = false;
> +		svm_pages->flags.has_dma_mapping = false;
> +		svm_pages->dpagemap = NULL;
>  	}
>  }
>  
> @@ -1165,14 +1165,14 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>   *
>   * This function frees the dma address array associated with a GPU SVM range.
>   */
> -static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
> -					struct drm_gpusvm_range *range)
> +static void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_pages *svm_pages)
>  {
>  	lockdep_assert_held(&gpusvm->notifier_lock);
>  
> -	if (range->dma_addr) {
> -		kvfree(range->dma_addr);
> -		range->dma_addr = NULL;
> +	if (svm_pages->dma_addr) {
> +		kvfree(svm_pages->dma_addr);
> +		svm_pages->dma_addr = NULL;
>  	}
>  }
>  
> @@ -1200,8 +1200,8 @@ void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
>  		return;
>  
>  	drm_gpusvm_notifier_lock(gpusvm);
> -	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> -	drm_gpusvm_range_free_pages(gpusvm, range);
> +	__drm_gpusvm_unmap_pages(gpusvm, &range->pages, npages);
> +	drm_gpusvm_free_pages(gpusvm, &range->pages);
>  	__drm_gpusvm_range_remove(notifier, range);
>  	drm_gpusvm_notifier_unlock(gpusvm);
>  
> @@ -1266,6 +1266,14 @@ void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
>  

Same comment as patch #1, let's aim to keep kernel doc for all functions in drm_gpusvm.c.

> +static bool drm_gpusvm_pages_valid(struct drm_gpusvm *gpusvm,
> +				   struct drm_gpusvm_pages *svm_pages)
> +{
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	return svm_pages->flags.has_devmem_pages || svm_pages->flags.has_dma_mapping;
> +}
> +
>  /**
>   * drm_gpusvm_range_pages_valid() - GPU SVM range pages valid
>   * @gpusvm: Pointer to the GPU SVM structure
> @@ -1283,9 +1291,7 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
>  bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
>  				  struct drm_gpusvm_range *range)
>  {
> -	lockdep_assert_held(&gpusvm->notifier_lock);
> -
> -	return range->flags.has_devmem_pages || range->flags.has_dma_mapping;
> +	return drm_gpusvm_pages_valid(gpusvm, &range->pages);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
>  
> @@ -1301,17 +1307,17 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
>   */
>  static bool
>  drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
> -				      struct drm_gpusvm_range *range)
> +				      struct drm_gpusvm_pages *svm_pages)
>  {
>  	bool pages_valid;
>  
> -	if (!range->dma_addr)
> +	if (!svm_pages->dma_addr)
>  		return false;
>  
>  	drm_gpusvm_notifier_lock(gpusvm);
> -	pages_valid = drm_gpusvm_range_pages_valid(gpusvm, range);
> +	pages_valid = drm_gpusvm_pages_valid(gpusvm, svm_pages);
>  	if (!pages_valid)
> -		drm_gpusvm_range_free_pages(gpusvm, range);
> +		drm_gpusvm_free_pages(gpusvm, svm_pages);
>  	drm_gpusvm_notifier_unlock(gpusvm);
>  
>  	return pages_valid;
> @@ -1332,6 +1338,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  			       struct drm_gpusvm_range *range,
>  			       const struct drm_gpusvm_ctx *ctx)
>  {
> +	struct drm_gpusvm_pages *svm_pages = &range->pages;
>  	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
>  	struct hmm_range hmm_range = {
>  		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
> @@ -1360,7 +1367,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  
>  retry:
>  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> -	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, range))
> +	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, svm_pages))
>  		goto set_seqno;
>  
>  	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> @@ -1401,7 +1408,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  	 */
>  	drm_gpusvm_notifier_lock(gpusvm);
>  
> -	if (range->flags.unmapped) {
> +	if (svm_pages->flags.unmapped) {
>  		drm_gpusvm_notifier_unlock(gpusvm);
>  		err = -EFAULT;
>  		goto err_free;
> @@ -1413,13 +1420,12 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  		goto retry;
>  	}
>  
> -	if (!range->dma_addr) {
> +	if (!svm_pages->dma_addr) {
>  		/* Unlock and restart mapping to allocate memory. */
>  		drm_gpusvm_notifier_unlock(gpusvm);
> -		range->dma_addr = kvmalloc_array(npages,
> -						 sizeof(*range->dma_addr),
> -						 GFP_KERNEL);
> -		if (!range->dma_addr) {
> +		svm_pages->dma_addr =
> +			kvmalloc_array(npages, sizeof(*svm_pages->dma_addr), GFP_KERNEL);
> +		if (!svm_pages->dma_addr) {
>  			err = -ENOMEM;
>  			goto err_free;
>  		}
> @@ -1457,13 +1463,13 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  					goto err_unmap;
>  				}
>  			}
> -			range->dma_addr[j] =
> +			svm_pages->dma_addr[j] =
>  				dpagemap->ops->device_map(dpagemap,
>  							  gpusvm->drm->dev,
>  							  page, order,
>  							  dma_dir);
>  			if (dma_mapping_error(gpusvm->drm->dev,
> -					      range->dma_addr[j].addr)) {
> +					      svm_pages->dma_addr[j].addr)) {
>  				err = -EFAULT;
>  				goto err_unmap;
>  			}
> @@ -1487,7 +1493,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  				goto err_unmap;
>  			}
>  
> -			range->dma_addr[j] = drm_pagemap_device_addr_encode
> +			svm_pages->dma_addr[j] = drm_pagemap_device_addr_encode
>  				(addr, DRM_INTERCONNECT_SYSTEM, order,
>  				 dma_dir);
>  
> @@ -1503,10 +1509,10 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  		num_dma_mapped = i;
>  	}
>  
> -	range->flags.has_dma_mapping = true;
> +	svm_pages->flags.has_dma_mapping = true;
>  	if (zdd) {
> -		range->flags.has_devmem_pages = true;
> -		range->dpagemap = dpagemap;
> +		svm_pages->flags.has_devmem_pages = true;
> +		svm_pages->dpagemap = dpagemap;
>  	}
>  
>  	drm_gpusvm_notifier_unlock(gpusvm);
> @@ -1517,7 +1523,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  	return 0;
>  
>  err_unmap:
> -	__drm_gpusvm_range_unmap_pages(gpusvm, range, num_dma_mapped);
> +	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, num_dma_mapped);
>  	drm_gpusvm_notifier_unlock(gpusvm);
>  err_free:
>  	kvfree(pfns);
> @@ -1543,6 +1549,7 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  				  struct drm_gpusvm_range *range,
>  				  const struct drm_gpusvm_ctx *ctx)
>  {
> +	struct drm_gpusvm_pages *svm_pages = &range->pages;
>  	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
>  					       drm_gpusvm_range_end(range));
>  
> @@ -1551,7 +1558,7 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  	else
>  		drm_gpusvm_notifier_lock(gpusvm);
>  
> -	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> +	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, npages);
>  
>  	if (!ctx->in_notifier)
>  		drm_gpusvm_notifier_unlock(gpusvm);
> @@ -1719,7 +1726,7 @@ int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
>  
>  	mmap_assert_locked(gpusvm->mm);
>  
> -	if (!range->flags.migrate_devmem)
> +	if (!range->pages.flags.migrate_devmem)
>  		return -EINVAL;
>  
>  	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> @@ -2248,10 +2255,10 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
>  {
>  	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
>  
> -	range->flags.unmapped = true;
> +	range->pages.flags.unmapped = true;
>  	if (drm_gpusvm_range_start(range) < mmu_range->start ||
>  	    drm_gpusvm_range_end(range) > mmu_range->end)
> -		range->flags.partial_unmap = true;
> +		range->pages.flags.partial_unmap = true;
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index ffaf0d02dc7d..c43e7619cb80 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -659,7 +659,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  			return -EAGAIN;
>  		}
>  		if (xe_svm_range_has_dma_mapping(range)) {
> -			xe_res_first_dma(range->base.dma_addr, 0,
> +			xe_res_first_dma(range->base.pages.dma_addr, 0,
>  					 range->base.itree.last + 1 - range->base.itree.start,
>  					 &curs);
>  			is_devmem = xe_res_is_vram(&curs);
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 08617a62ab07..4e7f2e77b38d 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -17,7 +17,7 @@
>  static bool xe_svm_range_in_vram(struct xe_svm_range *range)
>  {
>  	/* Not reliable without notifier lock */
> -	return range->base.flags.has_devmem_pages;
> +	return range->base.pages.flags.has_devmem_pages;
>  }
>  
>  static bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
> @@ -135,7 +135,7 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>  	range_debug(range, "NOTIFIER");
>  
>  	/* Skip if already unmapped or if no binding exist */
> -	if (range->base.flags.unmapped || !range->tile_present)
> +	if (range->base.pages.flags.unmapped || !range->tile_present)
>  		return 0;
>  
>  	range_debug(range, "NOTIFIER - EXECUTE");
> @@ -766,7 +766,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	range_debug(range, "PAGE FAULT");
>  
>  	/* XXX: Add migration policy, for now migrate range once */
> -	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
> +	if (!range->skip_migrate && range->base.pages.flags.migrate_devmem &&
>  	    xe_svm_range_size(range) >= SZ_64K) {
>  		range->skip_migrate = true;
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 93442738666e..79fbd4fec1fb 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -136,7 +136,7 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>  static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
>  {
>  	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
> -	return range->base.flags.has_dma_mapping;
> +	return range->base.pages.flags.has_dma_mapping;
>  }
>  
>  #define xe_svm_assert_in_notifier(vm__) \
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index df120b4d1f83..c15c733ef0ad 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -186,14 +186,8 @@ struct drm_gpusvm_notifier {
>  };
>  
>  /**
> - * struct drm_gpusvm_range - Structure representing a GPU SVM range
> + * struct drm_gpusvm_pages - Structure representing a GPU SVM mapped pages
>   *
> - * @gpusvm: Pointer to the GPU SVM structure
> - * @notifier: Pointer to the GPU SVM notifier
> - * @refcount: Reference count for the range
> - * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
> - * @entry: List entry to fast interval tree traversal
> - * @notifier_seq: Notifier sequence number of the range's pages
>   * @dma_addr: Device address array
>   * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
>   *            Note this is assuming only one drm_pagemap per range is allowed.
> @@ -203,17 +197,8 @@ struct drm_gpusvm_notifier {
>   * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
>   * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
>   * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
> - *
> - * This structure represents a GPU SVM range used for tracking memory ranges
> - * mapped in a DRM device.
>   */
> -struct drm_gpusvm_range {
> -	struct drm_gpusvm *gpusvm;
> -	struct drm_gpusvm_notifier *notifier;
> -	struct kref refcount;
> -	struct interval_tree_node itree;
> -	struct list_head entry;
> -	unsigned long notifier_seq;
> +struct drm_gpusvm_pages {
>  	struct drm_pagemap_device_addr *dma_addr;
>  	struct drm_pagemap *dpagemap;
>  	struct {
> @@ -227,6 +212,30 @@ struct drm_gpusvm_range {
>  	} flags;
>  };
>  
> +/**
> + * struct drm_gpusvm_range - Structure representing a GPU SVM range
> + *
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier
> + * @refcount: Reference count for the range
> + * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
> + * @entry: List entry to fast interval tree traversal
> + * @notifier_seq: Notifier sequence number of the range's pages
> + * @pages: The pages for this range.
> + *
> + * This structure represents a GPU SVM range used for tracking memory ranges
> + * mapped in a DRM device.
> + */
> +struct drm_gpusvm_range {
> +	struct drm_gpusvm *gpusvm;
> +	struct drm_gpusvm_notifier *notifier;
> +	struct kref refcount;
> +	struct interval_tree_node itree;
> +	struct list_head entry;
> +	unsigned long notifier_seq;

Should the notifier seqno be in the pages?

Matt

> +	struct drm_gpusvm_pages pages;
> +};
> +
>  /**
>   * struct drm_gpusvm - GPU SVM structure
>   *
> -- 
> 2.48.1
> 
