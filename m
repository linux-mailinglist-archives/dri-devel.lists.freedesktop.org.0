Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2809A922A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 23:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C3410E05F;
	Mon, 21 Oct 2024 21:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftCLY3W0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE66F10E056;
 Mon, 21 Oct 2024 21:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729546709; x=1761082709;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=daU24kitl/z02IkPV8FSVijUfcRTSWdm0sKKvWTY5F0=;
 b=ftCLY3W0EK7eU4F0HN7DBOpazmroRz17WgwJOhMwQXOKSvK3Yc21PSEP
 T81x+MAzbCLW61FhO7msnwanvLY0GXaEADp688aANXgqojOcAKQhdaGWZ
 Yfj9iyLhV2Dg4oAEsQf/BffctF4HDz06HGcw/mu7OIvzC+wz5Ukjr67Vb
 9cvh5YLaGAzk1fzSrh2e8lpcQxD3tJ96gtUdEYMpsZ9mjpI6SXxbzqL2P
 QJM4bUxBCONslr6wUbUb/+AxNr1seycu6jqko2TgVe5d/QCM6F0bCdTfE
 lmLd4u1+zMhY51kkBWXtOAwkLyilNoI/VWtODiaICbGbQBrtXBXx+PtDm w==;
X-CSE-ConnectionGUID: znLj0w/GR8qxWmvTpbBB4w==
X-CSE-MsgGUID: BIrzOycCRZilRKw1TqJFuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32734986"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="32734986"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:38:29 -0700
X-CSE-ConnectionGUID: LHAzyOB7RWK84x4GznMsGg==
X-CSE-MsgGUID: PiP4u8dtTDKVqOhQ+15hfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79823629"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 14:38:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 14:38:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 14:38:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 14:38:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDnWa1Xn/xt1oQnvi8/jy0QrOX5F/1HujnBSPoVGuVvJdJtwttYXng4TMrg2D5Pu7t1zrAJRiWBfeSUIcvZtTC+0CBHzEz43DRbnluRAwEUBY8mDkZhkhe/MP5n5bc9vbz2/9OSzcM0Vt/7I+cQqRGPBHS8lLfHoe4RwCmoEgRhIiS2vF9yOE/Eb6tSgnXq3dM4Qht6eUtEb82LCfBv0vhX6B3TBmbC2tlPkf6TTIPhX7nrAmZ3FMSxhjTnAaa8djfJSw6Ic3kjAI/bwP3oIePq2fDtqOyo4JpYKTE72v9xcc3ROyvNc2K6339Tj7EvKbztLYuVW5+MQFU/TReONng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZDidg9qNhKokxhnCzv5098wfp9TjIvAmy5sggrdD10=;
 b=yOg50kqlbb6e/oYAgTbiOWGohn0wLx2mVvKrWsv2SkPuw7CSBfdtcJ1rTwEPOosiCrEci/3sX7zExg+T5OteXhdL364499Mmg3XFLZGMX41tSHOYR6VT7qMjArWAb8sT2dXIcu9Usc1rslZZE3SgmXgVFtvlH5lW5be9nHTu1QfJBfbDrdzmTk5ir5WPTIP8QWK04EOxj51fzc6PCCM1C4w2rMXhyZqgf45AJX1sPxiNXRC5zPr2wRLJd1ufhkA43npx+XHCdpoQXoUKKPQ6PJe5n7kq0pNWKtLN8aIR07kCYsgtCUHFAT3SikbULddvO2dBB9NkcABZDen310lnOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7834.namprd11.prod.outlook.com (2603:10b6:8:ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 21:38:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 21:38:20 +0000
Date: Mon, 21 Oct 2024 21:37:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v11 6/8] drm/ttm: Add helpers for shrinking
Message-ID: <ZxbJjARrftCk69FE@DUT025-TGLU.fm.intel.com>
References: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
 <20241016085559.11840-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241016085559.11840-7-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:a03:167::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7e7f40-79ad-4803-fc4c-08dcf218ae72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Vrjr3mpHkPSvMlhBdCf94+oZmLZ2AYw7hgepS0Wb2xpFcdsLPuQQDJDk9u?=
 =?iso-8859-1?Q?kOixDfEPQUtl4yBP6xTmzzSHeogDd7b6XSzNTSQmkmSdp8ICfILAFk5GdN?=
 =?iso-8859-1?Q?1PuZS4GRIaf2QsruyKQcARxz6FJP2J5Mn7BQvn+g82uUWWuClEaiRPqUtr?=
 =?iso-8859-1?Q?BTweh6mu75rMQ02tzRMxf1FCQ2O5+yU3boqr5MztgS0GWgVz9/qyiVIs+B?=
 =?iso-8859-1?Q?uBinIQoAhjIdNqp7O1SZmlcRNq4ueg+rXIlxBhGTNqr4ltZ//KQng7YmIp?=
 =?iso-8859-1?Q?6CHIUIuOeJQvxTNFu2ZlPpv5LhZ7SCu8gmMDJqL9aIzC2HJH81KvLIh+ZG?=
 =?iso-8859-1?Q?dQiEk2fF3KO/XEC8C3p4Oicw411eT/LKGawCwo/51V4NiaNFLxjnvEwQVL?=
 =?iso-8859-1?Q?jHvcM9ng5VCNgtNyoLspfInLlXp8TP6K+yXC0S8pkLyCruhGxf7o27fvW8?=
 =?iso-8859-1?Q?b7iAiloA/ws0YhIcpONAxtKYXKPX0SZ/pH2ZWTj83wZExZcL+VKhJd9iez?=
 =?iso-8859-1?Q?bv9mT+fI11FMdauc+nlOs0qgC0tKg+CqBXD+oXTNgJ7mm4LcH7RWAw6xzb?=
 =?iso-8859-1?Q?RlReoycavsJh5vxANWOxhzxUcSQfVUlLw0p/ugoSJvpqIc1+ZL/6C+ZEAC?=
 =?iso-8859-1?Q?SKETK0DTxLcVo1ZrbhzCyZT2M5xeRflK2UsfPo73sGGrejvu3fpTdnrBR+?=
 =?iso-8859-1?Q?9AF9pwVX7urxIjgA4G9vAnNuy7lxtKIedHCbmZ+/oaGDAE4TiNl5/3rTEg?=
 =?iso-8859-1?Q?TWivNcSHhl2kc8XRmP0Gu3zC5w/s3fpUVhgXxpT0TU1eKBIDOvoYsHxDpq?=
 =?iso-8859-1?Q?V5+nX2JWrDDCIeNuIpylnYX181hVrTSIJp4PEIFUGWJ44hJ5QMrF8XVM0V?=
 =?iso-8859-1?Q?J8b/Mrl/g/E2obt4gMd19lSOxGi2gQ0KMV0k2ulvlAcB1T0wYG2mt37JJA?=
 =?iso-8859-1?Q?aYE0HW2F/kGdhbuadaeAH93t3wNfqL0Badcazhe5+8ZMaxpg17ohCE3vtD?=
 =?iso-8859-1?Q?+xFePZi0Dh7kGwiAenw6ZQNqOgAQL9h1yBRhstUcljYUhyC+B0qKvqVdRM?=
 =?iso-8859-1?Q?vuMO+LFnQwaX1HgonWYZFi+u22FKfgSVpIu6GZmRMZFGo4TwjpSksxozjF?=
 =?iso-8859-1?Q?+PUnu6FlZsbPZSaj3WcZka02kUeQzHbrtyMEH7nt9WP62+LpWgEY0Mv5a+?=
 =?iso-8859-1?Q?Oc30+wjopOT+tHs/ssw26TmGh/nkMLFuDT4umepZnDmN+aKMLpE6GLT4/a?=
 =?iso-8859-1?Q?2pMtD3/1JD/RWltchAl0hLFPS/jE2qrRDuvhk0cwKxnx4eeGBRkCk3x49x?=
 =?iso-8859-1?Q?hN+7XK0bERR5MkoIMmIksdGkXuVRkH06jFVOppvI39wtcFyV8tXjGBaOdC?=
 =?iso-8859-1?Q?pvcG/LQTmr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9ZAmH/6y2JQ/+axdMepshYlFMs9dL1aqDCfw6JWCcJqcQ3zgq8bTnyBfpt?=
 =?iso-8859-1?Q?OHu1YvFfF5/SNp3TFKap750ZjvYgENAAvECM3NyYaxYwwG0yz6xmzkDLFL?=
 =?iso-8859-1?Q?UaYqyhojkvK9j73wcJKwS9BGPhJZ4y5pALKgPx/qPVzTvrfGwpKE6osWyV?=
 =?iso-8859-1?Q?TZLVWaK3LUoGsOmpiT2+ScyaLuY7qtHH4Wlfuqcn6wNL8dE1YWUrcsx2FU?=
 =?iso-8859-1?Q?xrHxEmXmah8xjzeyAuqKIduETU4L7+8pg61lCzhQlqHjQsnnDsmA25Ool3?=
 =?iso-8859-1?Q?x1uCKrPa4Gov8/bX6fz2g/X21A2XqEy0eilx4Pf3SBnnUg44VP5GNFJ6U3?=
 =?iso-8859-1?Q?cIA3qe5x4bOeuTOmmzY85trCBZdDZ2W1x4X+CrjREt68i3moDz7VyO9mxt?=
 =?iso-8859-1?Q?xQaEK7IIfFuOSDdIRuKN0OKH98kcyBwYtFl9XazGWSr9SK/G3xux9upHtw?=
 =?iso-8859-1?Q?7tE6Xk9l+N9/rFZZaY1IytUtN3NJgGjyyS7pj40EZHj44PbH2eJZ7HrCB0?=
 =?iso-8859-1?Q?C37e9O/4eHOvPFvbkmMBeonzYuuJD7UKBWKdX0v5ruiozT3s4cFYmK4tIu?=
 =?iso-8859-1?Q?xJVInfedhMk6REFGdxrw/gbJvAK5Ai/8pJX9/kNusT21ZrLK4IgGTRnX9w?=
 =?iso-8859-1?Q?AAGQXxiuaYb1o8D9qiylnFifI0o3LsHD2rXe24bgY52/xJnawz2y7ol9q/?=
 =?iso-8859-1?Q?gdpVFtTQmsLQrbh87Lan/pPkNsoAFVlNWrdGCMgUe+DIPxcj0fhWCahVrI?=
 =?iso-8859-1?Q?S2c2ZY9VbkDtE2ocahmgprLB4eM7Wd7NrHUJQWDsNDlzTm1LYwvdNI3LL2?=
 =?iso-8859-1?Q?xH47GJeyiBxvRAB42neK6cUmoAiRgnaxEAiXvSxfI3CfGTfpAuI+CaYuyU?=
 =?iso-8859-1?Q?IwkGBb9S4AJg5PDubJIwHkmHkVcKqFblIeJ7//1F4Ov2YKTHh/f6mUy8K8?=
 =?iso-8859-1?Q?jkAADyKNU40h93QOnT9wXWAY9ZM329DyQ78/KbpL6mKoQhL5niVIbO1FXe?=
 =?iso-8859-1?Q?h7Oq3+VfdGGBmY85vlArYpeFQrMPGFJMr5RsgzS5WzINZynZfzrPzWgdGu?=
 =?iso-8859-1?Q?GRuCHlGaU/a5J123T7Coji9UKeh+gguy7UmVZa49MfUEnkcM51J8og7Wq0?=
 =?iso-8859-1?Q?6Xv6JWMh/8ZqmNHjfxCkwRpUc2zgc8E/KxN2j5whPhx+ipVcaUytnujrhm?=
 =?iso-8859-1?Q?M1JJSrMYQb4qLQRNwWNb3b4Eua1cOnByJOTqM93js2KcfzgQ05yf/t7m8L?=
 =?iso-8859-1?Q?S0QrWUIhz9z+VCzPOyyZ9COEYjuOXkXMX1n2klRACBYH5dTLJcYkrNwzC3?=
 =?iso-8859-1?Q?C3fIt3XJadhOGjFoDycS81cwAD5BMB1dFKtvNgtvM00qpaMmFcia0hCDZg?=
 =?iso-8859-1?Q?o1BEJAe8PCbe9tLGkCjQMPyESeVY6j4anvK5FJs75YlXG2VJsRyk3qmPob?=
 =?iso-8859-1?Q?k2rS/96yldAcjXc71fIwdjHeAXFCYr7AeNYgOmp7sQ8e5IbGsZ2wR8hpzw?=
 =?iso-8859-1?Q?jCENr2u5fFaUqPiQS+2W/shgotBZHg6pCghhndr2txLJJkp7YMY7ijYtpK?=
 =?iso-8859-1?Q?+8mLf0lOOYl/g0NlLg1ZnSWx2Lhx1Wnfb1VWUeZimzA/y3ceZJmPcjVXnQ?=
 =?iso-8859-1?Q?ydygjXYNuDPBUjCJNGotsz+bR7ooVEAZE0Y7A5QCPmscCwOyQLE1zRvw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7e7f40-79ad-4803-fc4c-08dcf218ae72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 21:38:20.1388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMLkYfiiOyuTvVGUqUTti3MlDZcnPpRMLqobb5tOBVD1CjQqmvc0IkPz4mMrTSGQIpfcki5IbWAvU84QhdOFhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7834
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

On Wed, Oct 16, 2024 at 10:55:57AM +0200, Thomas Hellström wrote:
> Add a number of helpers for shrinking that access core TTM and
> core MM functionality in a way that make them unsuitable for
> driver open-coding.
> 
> v11:
> - New patch (split off from previous) and additional helpers.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/ttm/ttm_backup_shmem.c | 23 +++++++
>  drivers/gpu/drm/ttm/ttm_bo_util.c      | 95 +++++++++++++++++++++++++-
>  include/drm/ttm/ttm_backup.h           | 20 +++---
>  include/drm/ttm/ttm_bo.h               | 21 ++++++
>  4 files changed, 149 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_backup_shmem.c b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> index cfe4140cc59d..4046d56dcc8d 100644
> --- a/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> +++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> @@ -5,6 +5,7 @@
>  
>  #include <drm/ttm/ttm_backup.h>
>  #include <linux/page-flags.h>
> +#include <linux/swap.h>
>  
>  /**
>   * struct ttm_backup_shmem - A shmem based ttm_backup subclass.
> @@ -107,6 +108,28 @@ static const struct ttm_backup_ops ttm_backup_shmem_ops = {
>  	.fini = ttm_backup_shmem_fini,
>  };
>  
> +/**
> + * ttm_backup_shmem_bytes_avail() - Report the approximate number of bytes of backup space
> + * left for backup.
> + *
> + * This function is intended also for driver use to indicate whether a
> + * backup attempt is meaningful.
> + *
> + * Return: An approximate size of backup space available.
> + */
> +u64 ttm_backup_shmem_bytes_avail(void)
> +{
> +	/*
> +	 * The idea behind backing up to shmem is that shmem objects may
> +	 * eventually be swapped out. So no point swapping out if there
> +	 * is no or low swap-space available. But the accuracy of this
> +	 * number also depends on shmem actually swapping out backed-up
> +	 * shmem objects without too much buffering.
> +	 */
> +	return (u64)get_nr_swap_pages() << PAGE_SHIFT;
> +}
> +EXPORT_SYMBOL_GPL(ttm_backup_shmem_bytes_avail);
> +
>  /**
>   * ttm_backup_shmem_create() - Create a shmem-based struct backup.
>   * @size: The maximum size (in bytes) to back up.
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 0cac02a9764c..e6d88557f2c0 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -28,7 +28,7 @@
>  /*
>   * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
>   */
> -
> +#include <linux/swap.h>
>  #include <linux/vmalloc.h>
>  
>  #include <drm/ttm/ttm_bo.h>
> @@ -1052,3 +1052,96 @@ struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs
>  	return bo ? bo : ttm_bo_lru_cursor_next(curs);
>  }
>  EXPORT_SYMBOL(ttm_bo_lru_cursor_first);
> +
> +/**
> + * ttm_bo_shrink() - Helper to shrink a ttm buffer object.
> + * @ctx: The struct ttm_operation_ctx used for the shrinking operation.
> + * @bo: The buffer object.
> + * @flags: Flags governing the shrinking behaviour.
> + *
> + * The function uses the ttm_tt_back_up functionality to back up or
> + * purge a struct ttm_tt. If the bo is not in system, it's first
> + * moved there.
> + *
> + * Return: The number of pages shrunken or purged, or
> + * negative error code on failure.
> + */
> +long ttm_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
> +		   const struct ttm_bo_shrink_flags flags)
> +{
> +	static const struct ttm_place sys_placement_flags = {
> +		.fpfn = 0,
> +		.lpfn = 0,
> +		.mem_type = TTM_PL_SYSTEM,
> +		.flags = 0,
> +	};
> +	static struct ttm_placement sys_placement = {
> +		.num_placement = 1,
> +		.placement = &sys_placement_flags,
> +	};
> +	struct ttm_tt *tt = bo->ttm;
> +	long lret;
> +
> +	dma_resv_assert_held(bo->base.resv);
> +
> +	if (flags.allow_move && bo->resource->mem_type != TTM_PL_SYSTEM) {
> +		int ret = ttm_bo_validate(bo, &sys_placement, ctx);
> +
> +		/* Consider -ENOMEM and -ENOSPC non-fatal. */
> +		if (ret) {
> +			if (ret == -ENOMEM || ret == -ENOSPC)
> +				ret = -EBUSY;
> +			return ret;
> +		}
> +	}
> +
> +	ttm_bo_unmap_virtual(bo);
> +	lret = ttm_bo_wait_ctx(bo, ctx);
> +	if (lret < 0)
> +		return lret;
> +
> +	lret = ttm_tt_backup(bo->bdev, tt, (struct ttm_backup_flags)
> +			     {.purge = flags.purge,
> +			      .writeback = flags.writeback});
> +
> +	if (lret < 0 && lret != -EINTR)
> +		return -EBUSY;
> +
> +	return lret;
> +}
> +EXPORT_SYMBOL(ttm_bo_shrink);
> +
> +/**
> + * ttm_bo_shrink_suitable() - Whether a bo is suitable for shinking
> + * @ctx: The struct ttm_operation_ctx governing the shrinking.
> + * @bo: The candidate for shrinking.
> + *
> + * Check whether the object, given the information available to TTM,
> + * is suitable for shinking, This function can and should be used
> + * before attempting to shrink an object.
> + *
> + * Return: true if suitable. false if not.
> + */
> +bool ttm_bo_shrink_suitable(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
> +{
> +	return bo->ttm && ttm_tt_is_populated(bo->ttm) && !bo->pin_count &&
> +		(!ctx->no_wait_gpu ||
> +		 dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP));
> +}
> +EXPORT_SYMBOL(ttm_bo_shrink_suitable);
> +
> +/**
> + * ttm_bo_shrink_avoid_wait() - Whether to avoid waiting for GPU
> + * during shrinking
> + *
> + * In some situations, like direct reclaim, waiting (in particular gpu waiting)
> + * should be avoided since it may stall a system that could otherwise make progress
> + * shrinking something else less time consuming.
> + *
> + * Return: true if gpu waiting should be avoided, false if not.
> + */
> +bool ttm_bo_shrink_avoid_wait(void)
> +{
> +	return !current_is_kswapd();
> +}
> +EXPORT_SYMBOL(ttm_bo_shrink_avoid_wait);
> diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
> index 5f8c7d3069ef..0d38dc1fd441 100644
> --- a/include/drm/ttm/ttm_backup.h
> +++ b/include/drm/ttm/ttm_backup.h
> @@ -110,6 +110,15 @@ struct ttm_backup_ops {
>  	 * After a call to @fini, it's illegal to use the @backup pointer.
>  	 */
>  	void (*fini)(struct ttm_backup *backup);
> +
> +	/**
> +	 * bytes_avail: Report the approximate number of bytes of backup space
> +	 * left for backup.
> +	 * @backup: Pointer to the struct backup queried.
> +	 *
> +	 * Return: An approximate size of backup space available.
> +	 */
> +	u64 (*bytes_avail)(struct ttm_backup *backup);
>  };
>  
>  /**
> @@ -123,15 +132,8 @@ struct ttm_backup {
>  	const struct ttm_backup_ops *ops;
>  };
>  
> -/**
> - * ttm_backup_shmem_create() - Create a shmem-based struct backup.
> - * @size: The maximum size (in bytes) to back up.
> - *
> - * Create a backup utilizing shmem objects.
> - *
> - * Return: A pointer to a struct ttm_backup on success,
> - * an error pointer on error.
> - */
>  struct ttm_backup *ttm_backup_shmem_create(loff_t size);
>  
> +u64 ttm_backup_shmem_bytes_avail(void);
> +
>  #endif
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 91ecbb64f6c8..24d8769bcb37 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -225,6 +225,27 @@ struct ttm_lru_walk {
>  s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  			   struct ttm_resource_manager *man, s64 target);
>  
> +/**
> + * struct ttm_bo_shrink_flags - flags to govern the bo shrinking behaviour
> + * @purge: Purge the content rather than backing it up.
> + * @writeback: Attempt to immediately write content to swap space.
> + * @allow_move: Allow moving to system before shrinking. This is typically
> + * not desired for zombie- or ghost objects (with zombie object meaning
> + * objects with a zero gem object refcount)
> + */
> +struct ttm_bo_shrink_flags {
> +	u32 purge : 1;
> +	u32 writeback : 1;
> +	u32 allow_move : 1;
> +};
> +
> +long ttm_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
> +		   const struct ttm_bo_shrink_flags flags);
> +
> +bool ttm_bo_shrink_suitable(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx);
> +
> +bool ttm_bo_shrink_avoid_wait(void);
> +
>  /**
>   * ttm_bo_get - reference a struct ttm_buffer_object
>   *
> -- 
> 2.46.0
> 
