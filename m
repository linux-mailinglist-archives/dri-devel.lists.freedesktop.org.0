Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7335926816
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 20:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0398910E9B3;
	Wed,  3 Jul 2024 18:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+NqZPlW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5AC10E9BA;
 Wed,  3 Jul 2024 18:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720031141; x=1751567141;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UMDiIxnqZKNFAugFaDiUEzAtcSxkvXM+zB88+rtmHO8=;
 b=X+NqZPlWiUDvvdCEpuv3DiyRgjLN9MRovaP/dL5yPd+szBfrdli74vCI
 r0jmcKWUlctm/Lx3snTcNLAtBne9cRNSmrjdY6WEnq+nhPhkLy6YhxB5U
 h3QLD2cwkl3G33lOm2yhXNQeGlhpNavBJjtzMcTznS4IdvKtN3W7pM6xV
 V7HwtNz5/hQjxFjp32HlxxQjcMSxlI9P8lKpmrzrqUE2//fw7s54eI2Cg
 8b6a/R8j5hQ1pcNQ+mcgxWhCwxh6jCMSB4U9Hz6ZMHBCxk18rDH8KmT2a
 b8RN+3Y1A8JrOYQr0UVjAd1TLWrTwpXs1Mr2GKlDqXKNm2BveDv9/wm1i w==;
X-CSE-ConnectionGUID: lAvakLLASK2Lh0FF3kcWUw==
X-CSE-MsgGUID: DSQ06qzLQjqHMHLDswnn0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17398233"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="17398233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 11:25:41 -0700
X-CSE-ConnectionGUID: Luqc3GZFRImmZpUAylAjXQ==
X-CSE-MsgGUID: YWE9S6m7RNGWVnN9uljM7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46477518"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 11:25:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 11:25:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 11:25:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 11:25:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkZYqhV5OjabS/wc7paHVUmsCRzwQjUB+azSrbzTg4+LcPqOpob9Tz0VtlQFcs54C/onlKEhdGW0XJZRi8nHoagE4de25tjl+m6DTZep6aVhr98r0yGzmoRKFnk8I+0UT2MRqz2eDUp9QYkoDTR/4O0NEIVzUfWJcVHixz/W7yRJnrRjvYuwOPg2IOAqhYiQgfc+KprI8c4dr4aerVlPTzAWwvcG0CrjnMt/5C4y8Kit/HJN0LCclVTqE0FBBJyE64cE1+6KpBSg8+WD4MIPy2n1E8iSmtYnXrSTYpdcCAdQ8rONP5Lp+KastwBU+VjPwzIEne4luo7BEipiAjXeHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwntaQuS5Vbi22YTJpZYHYJ0Fo6rqkz2q67jYRYTxcY=;
 b=MsWr5cwA50ZOJI9pLEb70vGqbMGSsCVOuy+HAgTa6vL8weZCJy1FuYFaDYepXdubzoxB6ptAi+z37kXOgxZAVEnUAjFY/B1EpX2nthA5l4HdaIj05SVCOwxTDAXLyLoFuHNy+fLgBh5vS66ry2flYq3A5hvOwSdSqfJ5FCOGltbPofVn2jC5eSEN+JmM5U0E6zm/OsGDhmIx5V+JoC2KheOGjxWOMHyY5mf9to3Gta5MlJ01rFzKh9XVxtsEqjdOdXUZHqkDkU+oP0JvVC7cCr0uPZmrRTIcW0W/5t/WoU+aztxYRuuwnTyUh35SlCMtee69UO4n5rY4dGpEeMog8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB4872.namprd11.prod.outlook.com (2603:10b6:510:32::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Wed, 3 Jul
 2024 18:25:37 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 18:25:37 +0000
Date: Wed, 3 Jul 2024 18:24:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 06/12] drm/ttm: Use the LRU walker helper for swapping
Message-ID: <ZoWXdj8BbxE72Lxm@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703153813.182001-7-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0005.prod.exchangelabs.com (2603:10b6:a02:80::18)
 To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ea5872-f28e-47a5-afd9-08dc9b8d8917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?S/ssBLQndizxqhTibLWzusV5xjmHlYppAVy246E6pnX30f3q8fW2AamHkq?=
 =?iso-8859-1?Q?X5mqqzFtpcSLezBn4Bdx4aU8LtVjaxLfU6iXMsZM45IO6QRXbAK0EoLbs+?=
 =?iso-8859-1?Q?9A4U9wu9A9Js0QNx7mAquZ27/6mgk9jVN0e95LpVUhwKI2eOqshIXq5rrX?=
 =?iso-8859-1?Q?3EEqG8oq7UYGqZcD5B6V7VE+yWIQBvb5VmzxQuGSPonssTTG3MkCQFuL6J?=
 =?iso-8859-1?Q?t4xpXLUozqddk0XUKDryazUTubx/7xgdWZg7FOtBSMc2gopImO7oupNYkV?=
 =?iso-8859-1?Q?YbGHlriynp9OBQlB7ViZOUNkvryRZLx8IX4touuu+kbf3JufSDa4xwbW/H?=
 =?iso-8859-1?Q?l/QgBo8ee+Bh8GsdcWiXcnwLdk4Eh/OH42MAW88ZnN8C1ZfxgLQUc0lpnX?=
 =?iso-8859-1?Q?yTSx5WVkDh7J0EcX72Pxptwv/YFgZhuS1FjQfssuCdwO2DVpTFoiDOXZkI?=
 =?iso-8859-1?Q?dHdFu5YNNchif311uT1I3UVlKhVg1gDxlhYRtbUXArjskqwMmIlPM/OjRU?=
 =?iso-8859-1?Q?3kkXV27ZKJYVG95YJ8QoCA1jedHmNGI9R3jgb8CN/elsNvwc1PJtj+GkQY?=
 =?iso-8859-1?Q?uVG5vNoHczSC0DFhrRPwuwhxAM6/y7Ozf4mmfHIKNBcK8VjM7iH3dx1ZAM?=
 =?iso-8859-1?Q?KOcTtR7V58W4N5ujiPlUEKROvNKiaAE8HzL+E68SZQvwdjztCB8OUQj+4N?=
 =?iso-8859-1?Q?i+8CeI/0SbJF/9oDcAXwPxEP1Ka0080TpVsZUZy1OCDEkHGtIDIjVvZe8U?=
 =?iso-8859-1?Q?jHr2DC2PHf9rSy4fgqUrTgxP6zzhvaXvPRJLfZvEIqhooFkKiDPxHelNt4?=
 =?iso-8859-1?Q?xjGBqmND6Q0UFZfDMx/uce6jFrn9X+lpyNr1tTbddy6a4kIp5i0QIjHrTV?=
 =?iso-8859-1?Q?S6XgOiyMgWrZU/L5kdUnTinz3H04lQdMIHv9MkOHO68QNxpMsVJuFEeM+G?=
 =?iso-8859-1?Q?8fOopj6e+1GwlMRSX04GfcHsQbmDb0+dafgUvAQimDv0a9S4pEBbnGOls8?=
 =?iso-8859-1?Q?X+1t6VP4XNop1xYT24e+gW/nU9Yn72YlB7wd9wOC8mnocVZC8NP4QfaumG?=
 =?iso-8859-1?Q?VWUpurvEm9B6W/tD7eELs6PO6/XkECkd8UakXRq92RDElLs9nA/IFtL6kr?=
 =?iso-8859-1?Q?0Cc7GFLSe0ifcN2zpSTP9oAJUvsYDLM4ku7UK2eQDGfxP2+zeGQX3fS4QC?=
 =?iso-8859-1?Q?m7hXfdY95XbNOaYoctbJQfpTOuMEjpTPFOUvOkk4aB1nQivldS+TZHYGbz?=
 =?iso-8859-1?Q?N8XHVeziAXaGVGmgh+aVP5QDY/dwGoYmqPznDb5mCkSACcW1xBEYn4c7YI?=
 =?iso-8859-1?Q?PSCvalxZsFQ9m5fCLr2dY0XP2j7BdhrOdEZmU3jshBIUtISy1pXJigtvhi?=
 =?iso-8859-1?Q?O8vqZkJBlB0Dk8Ylw0cGMh2KIhFMXPHA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?d5BO4WGKhfE8jZKb3wJTAh4C8nJHc58aFx8QeuwZR31VZ8APTdEtwdjhOy?=
 =?iso-8859-1?Q?gmKbqgTGRHWZu+wZgZqvrqEtA2ndJbu5FC7lQ1Z2Lai/ylCUzU0D3t4+v+?=
 =?iso-8859-1?Q?ZfqJtxEFWOC6FGR9RZKRaBqUknwGR8OFRozypfDEv/O0DJhKYArmiXwNRp?=
 =?iso-8859-1?Q?Q6rl3J7CxLAIbnJldQHhLaoQNdnJ6QhXau3dFPlPvjNAR9MPQGsoSP7WMc?=
 =?iso-8859-1?Q?QOrwyKCC6ZwL5P5glSJms118EF5hAMahF11PM1id2ch3EDwmrqKKahJXVN?=
 =?iso-8859-1?Q?aVsOGWaw8mOTKY7p+x39lhnp89U3CbIMnYrQmDFlhP3yA71SwO2vsqAXiF?=
 =?iso-8859-1?Q?casTKiWGZ/nvSm5e7W1ZDx3Q+rzVQ6Dh7sR8FZqA5SDiNlObwr0t+5HJVR?=
 =?iso-8859-1?Q?gfu0CiCMtz4Piox3275RBTM0JIVo2b4wc1VgiN24t4hKDeUznmyAr+tmkJ?=
 =?iso-8859-1?Q?CZoHSIQateeYCgI9bMDOxDxiM+LyIUerZ07xwL/U1k6RFremoUXAfzuM3U?=
 =?iso-8859-1?Q?x9IgCQ6h9lNgcr0xFzTlPwSzCZ+JQZlc7jTXpGmPGS7lktABhBwM3sGexu?=
 =?iso-8859-1?Q?57axhOP8Atq52C8nqw9q9MHYSfn+imUa0vMtQPY4fWFtomChDL88s/FI+d?=
 =?iso-8859-1?Q?G5bNLyFviYhaOvZRmAJgVK3W02teoqgJHSFNiDj3/uogHKJykIHxSz6etM?=
 =?iso-8859-1?Q?u07YCH2XkyAd1biFpE7c5e2LKJVjSBTK3ln3U4ePsvoTIC98F21V0TmMSU?=
 =?iso-8859-1?Q?6bqilPoZDZef/ZDHbpomd274LvMFjAkVYyarM5fPHX8fjvr2rr0ebz03B7?=
 =?iso-8859-1?Q?JGps5hheXgXJj8m4i/RtJoPV15eE42VEn7rGjHnZmQrYP/iZegUlsytnGt?=
 =?iso-8859-1?Q?rV6LEpB0IBzkfzeiM+a0pBkJUzyohMES29ElMH/+418uxQmb/VS41UNWaC?=
 =?iso-8859-1?Q?/pQZL6wNi5Ec0LK1+BrKTSuahq3S90XSPrQPSVu4TSmz+uTyjPLAwDzr7e?=
 =?iso-8859-1?Q?dLrpifeKt9Wpvptrf71OXZv7IlyGLZn8E9YWUOlIkhEv6J7vCuzYwK26rh?=
 =?iso-8859-1?Q?3SIo+XfSa1l/TAB4maK8M/lh18rrOAfo28NMUt6pDFzuQ5YHUoHCUHvmDQ?=
 =?iso-8859-1?Q?4QzKThUlUJeXclci6KggfZxLaaX8+45iv0yOioEeSJl/vO6vN5i8cPi/5X?=
 =?iso-8859-1?Q?TXuN4pRAq5rhN5PH7AukaAxZyXM2g2lT745PwVToJVzZd/C3nu8Ky4X+tf?=
 =?iso-8859-1?Q?umXUeZ9iz+FzKI7Qtu8TMG0d6XVkDvcoGQih6An7hfk0tw86pc71iVIhus?=
 =?iso-8859-1?Q?XyQw6wA2wQtK5zoE7/ZhwqWSbNuDxFpBL5e9CZLcGMOHMIre8GOClagVMj?=
 =?iso-8859-1?Q?GnVRDPWBLRjBnr9PS1CAu6giTVZWgPwjXn9d+fG4RHwzcSKqbQUIPeVzrA?=
 =?iso-8859-1?Q?XqVJkp7GZeMROi5tCMudBl1wqU3ZR68O23wfePrgSx6dolCZDyBR/lS4+0?=
 =?iso-8859-1?Q?aci3gNfhIYPfHP4lXlz696OVhPzR0MttVHHkUP7qhbvknH2WE/SA6wuv0e?=
 =?iso-8859-1?Q?ORwT3S+uyO/bnZzMpNOoLVSDfMo3OdWpJESX/75Bw4dIhDCpCMXLznyKS+?=
 =?iso-8859-1?Q?MwHG0rWL8HJ5jDl9nT06xiR6DQY0S5OikPpHZLVfpDuIQxVtiOD1CnSA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ea5872-f28e-47a5-afd9-08dc9b8d8917
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 18:25:37.4596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+zMHZsp1YZggM4QpigODHTjTi7S2npuEDL99DLwYq6KYiOK+bI2nJQO0hp2dRRrGzYDM1X3TtUfq/ytcfJQRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4872
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

On Wed, Jul 03, 2024 at 05:38:07PM +0200, Thomas Hellström wrote:
> Rework the TTM swapping to use the LRU walker helper.
> This helps fixing up the ttm_bo_swapout() interface
> to be consistent about not requiring any locking.
> 
> For now mimic the current behaviour of using trylock
> only. We could be using ticket-locks here but defer
> that until it's deemed necessary. The TTM swapout
> functionality is a bit weird anyway since it
> alternates between memory types without exhausting
> TTM_PL_SYSTEM first.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: <dri-devel@lists.freedesktop.org>
> 
> v6:
> - Improve on error code translation in the swapout callback
>   (Matthew Brost).
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c     | 111 ++++++++++++++++++++-----------
>  drivers/gpu/drm/ttm/ttm_device.c |  30 ++-------
>  include/drm/ttm/ttm_bo.h         |   5 +-
>  3 files changed, 82 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 43eda720657f..1053cdca131e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1118,11 +1118,23 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
>  }
>  EXPORT_SYMBOL(ttm_bo_wait_ctx);
>  
> -int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> -		   gfp_t gfp_flags)
> +/**
> + * struct ttm_bo_swapout_walk - Parameters for the swapout walk
> + */
> +struct ttm_bo_swapout_walk {
> +	/** @walk: The walk base parameters. */
> +	struct ttm_lru_walk walk;
> +	/** @gfp_flags: The gfp flags to use for ttm_tt_swapout() */
> +	gfp_t gfp_flags;
> +};
> +
> +static long
> +ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>  {
> -	struct ttm_place place;
> -	bool locked;
> +	struct ttm_place place = {.mem_type = bo->resource->mem_type};
> +	struct ttm_bo_swapout_walk *swapout_walk =
> +		container_of(walk, typeof(*swapout_walk), walk);
> +	struct ttm_operation_ctx *ctx = walk->ctx;
>  	long ret;
>  
>  	/*
> @@ -1131,28 +1143,29 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>  	 * The driver may use the fact that we're moving from SYSTEM
>  	 * as an indication that we're about to swap out.
>  	 */
> -	memset(&place, 0, sizeof(place));
> -	place.mem_type = bo->resource->mem_type;
> -	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, NULL))
> -		return -EBUSY;
> +	if (!bo->bdev->funcs->eviction_valuable(bo, &place)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
>  
>  	if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
>  	    bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL ||
> -	    bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED ||
> -	    !ttm_bo_get_unless_zero(bo)) {
> -		if (locked)
> -			dma_resv_unlock(bo->base.resv);
> -		return -EBUSY;
> +	    bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED) {
> +		ret = -EBUSY;
> +		goto out;
>  	}
>  
>  	if (bo->deleted) {
> -		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
> -		ttm_bo_put(bo);
> -		return ret == -EBUSY ? -ENOSPC : ret;
> -	}
> +		pgoff_t num_pages = bo->ttm->num_pages;
>  
> -	/* TODO: Cleanup the locking */
> -	spin_unlock(&bo->bdev->lru_lock);
> +		ret = ttm_bo_wait_ctx(bo, ctx);
> +		if (ret)
> +			goto out;
> +
> +		ttm_bo_cleanup_memtype_use(bo);
> +		ret = num_pages;
> +		goto out;
> +	}
>  
>  	/*
>  	 * Move to system cached
> @@ -1164,12 +1177,13 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>  		memset(&hop, 0, sizeof(hop));
>  		place.mem_type = TTM_PL_SYSTEM;
>  		ret = ttm_resource_alloc(bo, &place, &evict_mem);
> -		if (unlikely(ret))
> +		if (ret)
>  			goto out;
>  
>  		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
> -		if (unlikely(ret != 0)) {
> -			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
> +		if (ret) {
> +			WARN(ret == -EMULTIHOP,
> +			     "Unexpected multihop in swapout - likely driver bug.\n");
>  			ttm_resource_free(bo, &evict_mem);
>  			goto out;
>  		}
> @@ -1179,30 +1193,53 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>  	 * Make sure BO is idle.
>  	 */
>  	ret = ttm_bo_wait_ctx(bo, ctx);
> -	if (unlikely(ret != 0))
> +	if (ret)
>  		goto out;
>  
>  	ttm_bo_unmap_virtual(bo);
> -
> -	/*
> -	 * Swap out. Buffer will be swapped in again as soon as
> -	 * anyone tries to access a ttm page.
> -	 */
>  	if (bo->bdev->funcs->swap_notify)
>  		bo->bdev->funcs->swap_notify(bo);
>  
>  	if (ttm_tt_is_populated(bo->ttm))
> -		ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
> +		ret = ttm_tt_swapout(bo->bdev, bo->ttm, swapout_walk->gfp_flags);
>  out:
> +	/* Consider -ENOMEM and -ENOSPC non-fatal. */
> +	if (ret == -ENOMEM || ret == -ENOSPC)
> +		ret = -EBUSY;
>  
> -	/*
> -	 * Unreserve without putting on LRU to avoid swapping out an
> -	 * already swapped buffer.
> -	 */
> -	if (locked)
> -		dma_resv_unlock(bo->base.resv);
> -	ttm_bo_put(bo);
> -	return ret == -EBUSY ? -ENOSPC : ret;
> +	return ret;
> +}
> +
> +const struct ttm_lru_walk_ops ttm_swap_ops = {
> +	.process_bo = ttm_bo_swapout_cb,
> +};
> +
> +/**
> + * ttm_bo_swapout() - Swap out buffer objects on the LRU list to shmem.
> + * @bdev: The ttm device.
> + * @ctx: The ttm_operation_ctx governing the swapout operation.
> + * @man: The resource manager whose resources / buffer objects are
> + * goint to be swapped out.
> + * @gfp_flags: The gfp flags used for shmem page allocations.
> + * @target: The desired number of pages to swap out.
> + *
> + * Return: The number of pages actually swapped out, or negative error code
> + * on error.
> + */
> +long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
> +		    struct ttm_resource_manager *man, gfp_t gfp_flags,
> +		    pgoff_t target)
> +{
> +	struct ttm_bo_swapout_walk swapout_walk = {
> +		.walk = {
> +			.ops = &ttm_swap_ops,
> +			.ctx = ctx,
> +			.trylock_only = true,
> +		},
> +		.gfp_flags = gfp_flags,
> +	};
> +
> +	return ttm_lru_walk_for_evict(&swapout_walk.walk, bdev, man, target);
>  }
>  
>  void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index f9e9b1ec8c8a..ee575d8a54c0 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -148,40 +148,20 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>  int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  		       gfp_t gfp_flags)
>  {
> -	struct ttm_resource_cursor cursor;
>  	struct ttm_resource_manager *man;
> -	struct ttm_resource *res;
>  	unsigned i;
> -	int ret;
> +	long lret;
>  
> -	spin_lock(&bdev->lru_lock);
>  	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>  		man = ttm_manager_type(bdev, i);
>  		if (!man || !man->use_tt)
>  			continue;
>  
> -		ttm_resource_manager_for_each_res(man, &cursor, res) {
> -			struct ttm_buffer_object *bo = res->bo;
> -			uint32_t num_pages;
> -
> -			if (!bo || bo->resource != res)
> -				continue;
> -
> -			num_pages = PFN_UP(bo->base.size);
> -			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> -			/* ttm_bo_swapout has dropped the lru_lock */
> -			if (!ret) {
> -				ttm_resource_cursor_fini(&cursor);
> -				return num_pages;
> -			}
> -			if (ret != -EBUSY) {
> -				ttm_resource_cursor_fini(&cursor);
> -				return ret;
> -			}
> -		}
> +		lret = ttm_bo_swapout(bdev, ctx, man, gfp_flags, 1);
> +		/* Can be both positive (num_pages) and negative (error) */
> +		if (lret)
> +			return lret;
>  	}
> -	ttm_resource_cursor_fini_locked(&cursor);
> -	spin_unlock(&bdev->lru_lock);
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_device_swapout);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 10bff3aecd5c..de97ea9fa75f 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -417,8 +417,9 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>  int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>  void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>  int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
> -int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> -		   gfp_t gfp_flags);
> +long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
> +		    struct ttm_resource_manager *man, gfp_t gfp_flags,
> +		    pgoff_t target);
>  void ttm_bo_pin(struct ttm_buffer_object *bo);
>  void ttm_bo_unpin(struct ttm_buffer_object *bo);
>  int ttm_mem_evict_first(struct ttm_device *bdev,
> -- 
> 2.44.0
> 
