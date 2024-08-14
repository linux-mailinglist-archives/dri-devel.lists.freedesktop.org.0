Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78182951F75
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 18:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF22C10E3AE;
	Wed, 14 Aug 2024 16:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCCXBm+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857FA10E4DD;
 Wed, 14 Aug 2024 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723651697; x=1755187697;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BJhD2+8S3pldL24CP6tSeXp/v/Zs6WwSbXPlm5ibFwo=;
 b=GCCXBm+H0vNFcafhBm/j35fnEWrxwkRmHrDqOuWl5zslVWk5Lt2TPfpi
 ejt7M8FI9jt3+0+5/DdIrDFTeIk4K0z+cbqO8VFvHkKlw0NUwBgq1wFQS
 A5x1B1z106CrOSihrtRgY8CYK9OhZiHEIkx+gqTNRvCisMZYyrZX4j0bN
 2n5tDT6HOpSerYroA2P4V+PrJyETy4Tkt4Y5juKybq6ImdfAmeqh1pNKZ
 1sHXeBRImaHd3jj6PqD3QR9cbRVXfdewGdh4C0XpoXt46dMUDcj0E0F3w
 vEibjsUSYsrH0AjxajP0EQSRnCe3BwA+gSJJVxFm5rCODjYJzT3JYdlDu g==;
X-CSE-ConnectionGUID: hAH8CyN2SSC4G4syfUuozw==
X-CSE-MsgGUID: b1HnA6p5QW6Vpp8n7fddQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="13012801"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="13012801"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 09:08:09 -0700
X-CSE-ConnectionGUID: idJsoQaITam3Ze8s3KTUZw==
X-CSE-MsgGUID: p8OahfYjQmKTDy808OAF7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="63719655"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 09:08:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 09:08:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 09:08:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 09:08:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmjDHKBPO+2k/+aUUCgnM+B0ckPySgpaR8J89sAenWbz749gsYrolyZk7gZlsGesCRexPLF/A/gl9ALfnoeGNBNeCZ+odafEb1OoM/pk5NxeD+W0hshXxF3BWuBHIcsOLp8MTjqu2popEgMvP0rYfujcud2WQuqSeC/X2f6b3jairhrG3UUETsw/KppPrcqOzwcXRXOpDyBxAUql4AFqxeFDeCGSp9ucfA1yllrXGXL4Ci1A6jq6GV6sTGxKLpQcEUSum1iiZr19jquAuOEs69HVuMh+KgMneOHpOeHgHnTPNUYdVqw9kHRflgF0TTFTlGmrPI6KjoMPm2Gy02Y99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PV51W7wJ3DNcfvmLhj7mSQqMDaTHQvmnJWBivHNtnOo=;
 b=xbKcKepvUi08yObNTNJyD/Ol6VWMbHZc/C0fauPh+u20Rl7CH+rcquN+IQKf+0pdZRPkgA0+cFtU56fjoazGIGwkj2TUfm0x+5fOsdM2YEAccw7orZGK45vOPDTSYJHdrFX68lQP6ehA1cgnzLpGkkFwolmJxlSivPqpewLSj9xaUWCJXyVseRhEK2ebFl6tOQOvL1gqE0tsjSM+7mkhEMHcGRwJd5+WddDROd7FkSblME+oZNa+2i/gIV/rleysB9ynzNpNeuePwka82+dkTZ59J0m77qoHTCqgijS/SOqI48qD6q+sATwo+C2Hc+ne3YSOtjSjDPnFo//FLarPdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 14 Aug
 2024 16:08:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 16:08:04 +0000
Date: Wed, 14 Aug 2024 16:07:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>, Sima
 <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 0/2] Allow partial memory mapping for cpu memory
Message-ID: <ZrzWJiJ2Yr0DJPG2@DUT025-TGLU.fm.intel.com>
References: <20240814134837.116498-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240814134837.116498-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: e6488964-7db2-4c65-a579-08dcbc7b475f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: T1n3cs9N1FpUX638wl035ga36HEP6Vtl0FNNh2qQBpoZaO4V+OfSYTNRlqqNFpmqfig4nmcZSL3qKWFMZqVAYVN+3iYfO/hlCE1RkU0zQfK9wy5bsjV6oA7rNLs+nM5JL6mwq8u0c1MOLTVD/65mq2kkKSwC6NRKeZMOzih4aZBF/TBHAOJmKpnwZTdpreiMZ0prNVgz0bRMJ2B+WsbFWq18Em18FsxZBbGtPQSh+ARdEvaqF27AdBdj0HIoeYIkTDe+aoXgZxbiZFcm2yHD730I437nCclGBWCzcuhOHl0uadRLW0vAvx2B/UFDcFIy0pboEea61D3M2wjwem4VtrCv6vdWXmgCVIf1C3P8f6hFi2gNiDgfZQ9iASwC8cVEUbqP+94n4a2hbhOH6K9vd194Pjv8BRTk4UFPpWMbaH7miq4YbZu34F7CRIv5CQCd8GhlXj+8v9vSi6wNr8mEoU6b/uOUNkXmNYhcWb5cIfBCKAvA8sWMu6fnRz6vwSELnWK3uNjGOmAL8doyJBDiDVJJqTmY5YnrYPJthVbtzDc2tvj2zwckv3xIKKTyYdeUzmm4BR/RsdqX6SQCdDGWo4G9hq1yJA6Rxz50VBSO780=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pqFfSmr7AlWrnz5I1F/UEunzsqu+PkckTZXru8PAFoYvBX9KuGdJYipJxJ97?=
 =?us-ascii?Q?7R5BPMy0HsAt5ljJb/a+8u21dJ4ONVOWTXCyvY3S9p9X6VTgrc+YCx5CWYmp?=
 =?us-ascii?Q?TZeECAptQHGQGyq+0JVs/60aJyd6HD60lwzCzyGRmbFBRt1JeD3YI8/egP5I?=
 =?us-ascii?Q?8SVrzE4Yyr/SDVjTS0nhsj9nf8YpLXn2dcYN+cesVmEu3JnWP2NBvQcrXoNP?=
 =?us-ascii?Q?BZSGhKpJdLLeiin3pvhT7xHPiKNpKr+VC4imRKVBhKnuKN1OCtLE5of/MiLg?=
 =?us-ascii?Q?iAk6SFXmjNXoWm5J492Lih40o1O+Uar2End6iea2J49NZTODM82qK8Gx4j1M?=
 =?us-ascii?Q?0vmyPI3wCgXZZF1g3nxXa5mT0uJdhfXz7k+DEqYTVxiF/3yo+EihdXLQbQox?=
 =?us-ascii?Q?6MXDf+zlo2WHmm01L/0/nebNUBeYHBmUNxoXnlu3ui/7iN0dTM6kdrHtOGPx?=
 =?us-ascii?Q?CJTDk+xWtdFcOkQXONwRnh9cdl0R+l4ysn5wDqGbDyPuLIcB2jC/1FLgfkkW?=
 =?us-ascii?Q?mpOTxFg1myuu3k/zJQ2WXnzswYjjsXhsyYb/4O0pw5nXTPSDdBhUCo4Oz0GV?=
 =?us-ascii?Q?AKvvfkAWfMslL5mxdP4inM0fYwlt/rw59CTOKrpgJ9DKCurKRDvXx2ns4HR0?=
 =?us-ascii?Q?o9uVRmEf/8bXnpxLF1Y9JrqC8k7YPiaZw4RVF1o0DONM2jyoWqZel8WjFC/Z?=
 =?us-ascii?Q?CsUoFusOlG18eM11HC494COR2nPeX6E5msr3BsVof7XGviMy20UbMoMGd1pc?=
 =?us-ascii?Q?th7VLy4qOSkdrkmjGZag4ikrkqPCi4r2RiYI4lOOpUTDepqC54GquvowfF0N?=
 =?us-ascii?Q?eAkrmMICWB2hi/Wf134oMsV2pojNOO0Ov47quAkVENIYw26OsHHNlNb4g9vV?=
 =?us-ascii?Q?MYUn4USIvWNZgna4uA/ljsCD/Q9Gxq3ujNtTA9wjn5KURIYdydsdi9aF0vuO?=
 =?us-ascii?Q?aV/fockdyNsmTMSGPjoIGhuKTGKVP/ryTRMaARPVx5HS9QLyE3aXCJEDH/Cd?=
 =?us-ascii?Q?By8tFXULhVKkD5q56ix4Y+Rlyks4ur5QTOlkrYuS1SIc198e1kIsItkeuKRv?=
 =?us-ascii?Q?1uruxr7eNZSDdE9bHjcnMEgg2SyDpGstoqaauAOq+lanW+M19v7EMOjIt9XZ?=
 =?us-ascii?Q?HC8ppBBYMBnNf26PYIbwdP3UjQeIg6mofNTm7gBdGuq4VOZb7s5RqUzXuCnx?=
 =?us-ascii?Q?qAipuPbkpCardtDOKw7Tm4UL80qwo0pkkgnIcYn8WVTLZBgMVCqwnJq90pNR?=
 =?us-ascii?Q?2OLqXXZZ/btDBYrOVoQVM+fJj+pDFksIrm50tXTbUvLyQ1ArBKyqD/7w4DIi?=
 =?us-ascii?Q?a+P9AlFdHlRtKWJWCbDsx74xoIhrb7RFKvtI3TkPWI750yjJZw4YXxgsvplC?=
 =?us-ascii?Q?XKOgerEkaAfuYG5acMkXRJ5kr/kd4eTcmU2R9LAhggnOP/PQLmQs9gOSlWAt?=
 =?us-ascii?Q?Nkwk/zrPUSsYcFRbQ4yqhVH6xzJHrGs2LXWnmFwd8LlQstBTHny1cnUwLbL9?=
 =?us-ascii?Q?fIo6YwgcvHOWTQwp52Iqs2OcoH6KaxGp6ejjKfV/pS6cvokKxnP5qJUei6G+?=
 =?us-ascii?Q?o40j1emKVRiR21GQ7aAtnfZAFuZQRFY1gBuC8Ch1B+pj8CM/50OPq3hcetyc?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6488964-7db2-4c65-a579-08dcbc7b475f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 16:08:04.5443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YR+g1cLbROU/UfmwIyfaARdMdfgtRGNUwXgnPps9ea38QnxNfaFU8+HsLJQL7ZIsj0HiHLhVrBfD0RfiftQlOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
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

On Wed, Aug 14, 2024 at 03:48:32PM +0200, Andi Shyti wrote:
> Hi,
> 
> I am resending this patch series, not to disregard the previous
> discussions, but to ensure it gets tested with the IGTs that
> Krzysztof has provided.
> 
> This patch series finalizes the memory mapping fixes and
> improvements by enabling partial memory mapping for CPU memory as
> well.
> 
> The concept of partial memory mapping, achieved by adding an
> object offset, was implicitly introduced in commit 8bdd9ef7e9b1
> ("drm/i915/gem: Fix Virtual Memory mapping boundaries
> calculation") for GTT memory.
> 
> To address a previous discussion with Sima and Matt, this feature
> is used by Mesa and is required across all platforms utilizing
> Mesa. Although Nirmoy suggested using the Fixes tag to backport

Other vendors than Intel too?

> this to previous kernels, I view this as a new feature rather
> than a fix.
> 
> Lionel, please let me know if you have a different perspective
> and believe this should be treated as a bug fix, requiring it
> to be backported to stable kernels.
> 
> The IGTs have been developed in collaboration with the Mesa team
> to replicate the exact Mesa use case[*].
> 
> Thanks Chris for the support, thanks Krzysztof for taking care of
> the IGT tests, thanks Nirmoy for your reviews and thanks Sima and
> Matt for the discussion on this series.
> 
> Andi
> 
> [*] https://patchwork.freedesktop.org/patch/608232/?series=137303&rev=1

So here is really quick test [1] which I put together in Xe to test
partial mmaps, not as complete as the i915 one though.

It fails on the Xe baseline.

It pass if with [2] in drm_gem.c:drm_gem_mmap. Blindly changing that
function might not be the correct solution but thought I'd share as a
reference.

Matt

[1] https://patchwork.freedesktop.org/patch/608268/?series=137313&rev=1 
[2] s/drm_vma_offset_exact_lookup_locked/drm_vma_offset_lookup_locked

> 
> Test-with: 20240814132404.18392-1-krzysztof.niemiec@intel.com
> 
> Changelog:
> ==========
> v1 -> v2
>  - Added Nirmoy's tags.
> 
> Andi Shyti (2):
>   drm/i915/gem: Do not look for the exact address in node
>   drm/i915/gem: Calculate object page offset for partial memory mapping
> 
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 10 ++++++----
>  drivers/gpu/drm/i915/i915_mm.c           | 12 +++++++++++-
>  drivers/gpu/drm/i915/i915_mm.h           |  3 ++-
>  3 files changed, 19 insertions(+), 6 deletions(-)
> 
> -- 
> 2.45.2
> 
