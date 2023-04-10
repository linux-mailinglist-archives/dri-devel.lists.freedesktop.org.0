Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE346DC95E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 18:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A1D10E3DA;
	Mon, 10 Apr 2023 16:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147BC10E3CD;
 Mon, 10 Apr 2023 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681144545; x=1712680545;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rcdOVcb8ITqBK2v4ioshDft8aagjYTcerOkKNwcWfZg=;
 b=lI7t4AzuhzpBsxfKtZ6EGrm0USS2fFWNmIIPwU1QP0YM1bEQYCzuu5Pb
 TY1rrCvIB5dy+M375TRa8hMwIYzQQnlCtnKhQPsjv1hHE6LnEo+i9+fyi
 3HysBLmymZYe950warL0G4cQXu4gEAvyNoyb6QuFduxPMdESOuqAa4mxj
 0dHn/I4woCT2Zrd4jVx7KpjpE6Kwuk6dBCCNbn1rcqL7LdBnOHN7x5Yt5
 BSk4LTV/lYf+9qdlKn5GzpDBqxpVfH4wq6g2vK0637csMTH0lE8Mf4vg+
 VgOqINohgI8SB1R9PnCAktuRA40qZLXRguOBdM4eATWHGnGF/1s6Tfamb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="429682083"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="429682083"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 09:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018030214"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="1018030214"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 10 Apr 2023 09:34:40 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 09:34:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 09:34:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 09:34:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zlg1zSh5s2zWFuB8wcFnMMp+v7/T8ARU0RrtFH/TUiI/gXrj5T9rVIslFgfvbB+RaVO5kbOeiKeQS9rMR/SgK2P2zKHcG1Ot4Il36zPOBz2h4gYFeY1XE1gX3CMFfTnB5JiOEfxRGHKfmBnKxla84bmzOv2FA+miGTZYo+qdThYlVwF+yvCkKVCoMM88koceE70XzBMCkQVFWDueK38unENxET0DldTrfgXYqyOOwl3Q0dv5lB2PMHTuVv0SlSFf4SHS5tXk9JeP8WEZPPAnv5OIvIqh+vrQeR4sPBq30EqkVuOjzFsGzNRMM9tFN3gha+nD1MrVl9PJe+MPxgpWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGzQTqJdOnIeXTc2rt0fcDo6u9pYFnGF+z1VDNPBQyc=;
 b=aMKiUZ8Z8WZ9lJGHq9z8zlXxClD7xvCq2pZV5Jmm7B8So/7YCg1zHglQdgVBPJuRY2ra7oIjkOPurMqAimS9iVyba2+Edo36g+vxvh2oF3XBmYgXK8JKcjd+UoO3xOsvNvLTbv54xNAfz8kLrxkvN7CfL1Nf5q+rwHZRTKCyHMvuH6Nn5QolqH+HCfrplr08wSDZQ0ytfxQhhr8zHBk5u5WtZeGw5Sbew81JLpobAUtFG4Fd+iFSLjLk8lFByWwj9RHvMgIt8f3FnhbJcG28Md5jPKLatiSDS5x+SpakGkIc1lgtC24iRAHxiSYaTSrsO56khICTAYCqfCeKt4szkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB7942.namprd11.prod.outlook.com (2603:10b6:208:3fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Mon, 10 Apr
 2023 16:34:38 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 16:34:38 +0000
Date: Mon, 10 Apr 2023 09:34:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Message-ID: <20230410163434.GU4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230407071236.1960642-1-fei.yang@intel.com>
 <20230407071236.1960642-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230407071236.1960642-2-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0041.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: c8548726-b96b-48c3-af8a-08db39e179ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mcp1qGVbwyK3qMGKdikimdBk3QT+hWRVldE0I6C5h+SFFIEUk3uQJwg0qt+O5aXpuYELULMjx5LebwzobqGyIzdO8NV2ATUBqjRgBaa4fEUzTD6RwQwFDAxsckTiJhePOdUIbSyYday644sBhsOW0SLCwRCScghz5nNf9CrgsO5ifxxmApqjLV6CZXcVte1xlJ/W/yAZceYH+PkaY6ftfLpMsIz90rhUyeUWZ392j+O2yLfMKpgr/rCz6w2J3KsvdeofP7GNIzZ5vnHjTWYwACKKSXysCywk4gb86wVidRVuQ/E8SxaCxb6Y2T58QGPmU8WCV0ifSKEVGMEKydPMSaYt4NaKl5hcxlH9Bt4Xi5GzXCoYEJhJRTE2yr7fgIKJOUzOiaGVdpK5WBSE4VxBuhPTEyu1zZyR3By/YoyJbhXfNpE6qVhG8ul3tNOW7VkJV5us0mkEMEECqBwbIWEHrwrD/W9hmA0cTvrszO0ZX1TLeShq6UtXUualZp4LBnAo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199021)(6486002)(66556008)(8676002)(66946007)(6636002)(4326008)(966005)(66476007)(478600001)(450100002)(41300700001)(316002)(86362001)(33656002)(83380400001)(6506007)(1076003)(26005)(6512007)(6666004)(34206002)(8936002)(5660300002)(2906002)(30864003)(38100700002)(82960400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bL+iC7P5r8A0ttot1PbmSuMQCh+t0XyeiGo87KUk/wmk9v+hDZDdK1Vww/+g?=
 =?us-ascii?Q?j4sin9NrP2jk86DDBS+TVdlml4WLkmGsZTL9uYSXekv58vadYtIAtv76zyI2?=
 =?us-ascii?Q?jQ97bURJYVA/PQ6ScRLTvdWJVH8mR3DNH1w4hzY090s4F3kpXQYLOVLsF1FO?=
 =?us-ascii?Q?YjeGotgsYmXViea9lU9WVeHf35Nes8bWkm5oUQuEc21//hB4IaVRyZDC79KB?=
 =?us-ascii?Q?uWsZCvhyuOAVhEMtzhPktF5EcuqJwidbWJMkqpy8n7e5Y7eNOceOJZexeq0H?=
 =?us-ascii?Q?0JJ0Vs9bMS8Ap0TYIOHdrdSXUUPNoeifeD+mBPkyNmW7dTSmUewbJZOxhF4U?=
 =?us-ascii?Q?difYRsGHjGVs0r4w8fzLOgE1OlASwzbBQUBD78vLCB0zQp8BpwKpMRnvFjw2?=
 =?us-ascii?Q?UX+arK/7N3xW57tRvPi1yR6aKY3qKt0lZBXQ1BE4AN+F4bcSzXhUTMNnHcyG?=
 =?us-ascii?Q?VjMjryDZdK+50KJkvq6dVmWTcZOIZxQLHpkp0xqRaLUZP9cBWkTGGHTc+u2h?=
 =?us-ascii?Q?54GJ+BGqgoD91xCR6rywwCpl1G/u09pa3+gKgJM1iXqnKRMh7gkO+ypyQnYm?=
 =?us-ascii?Q?Wmqzgc0j2q7Dwz/hUOUWWrgP46vvZHT7lKB2ZwUj6ZFFwv0sZ/0c8C4nJxLd?=
 =?us-ascii?Q?ZY1ac840xQSl/NxoFjoC/b/s8JusvGpvwsHgNK5HcUH6+aAhtFcA0h7WD5ZD?=
 =?us-ascii?Q?8NSbPXQAxV6FJEQL7mGHUtgJKEzL+gGty8Wj4f4A3i/3zvfudgRlXzRtdtES?=
 =?us-ascii?Q?00j38ajp4rIfsFd5uRx2PQ+g4dbp0zQdhs/SZZ09dCKPgy0gWqinhqs98/P4?=
 =?us-ascii?Q?7iIlB3IZXTrtpCvW+SL4xGMeRMFaI8+fh0UmlNtZeX/YafOY+DmkfDEz0KG/?=
 =?us-ascii?Q?/49AC68CNcgMkcXx4ESZE/WQKI2XQxfhiJDLLCDyXg+qku/DnlTog9jBsxjM?=
 =?us-ascii?Q?AQRZKrfeVDHfdTj2HR/AfonexO0Zpf5WJ2SYgf8zf89nJzBufP/qmv74usIP?=
 =?us-ascii?Q?ZnW1+cDYTajJ3Y7dk/AXMdH8OqfvZsO1KoJNN92AxP+kcQYqYWpEoTrdI2ON?=
 =?us-ascii?Q?2hQVG0zYj+Z2CeKQ+AMNACoaI0k9pbweZ7/y07lE6O2R0K7YOlzGvTxNj9YJ?=
 =?us-ascii?Q?bORza9RhwoBiLaU2nb368ib6YVuvxuDqWPdFdseYzzmIyF76CFE9B6eANqer?=
 =?us-ascii?Q?RCqg+Uzanbu2IKzWA1U6NziV8diZtSSnxh4uKdFmkn6ptdWbpMIdaKMeUFUw?=
 =?us-ascii?Q?W371bheHj1wOUrKPuptQgsxJ3lzhUzoAnjFDkV4cC+8rP4+ICLMgGhG2d6h0?=
 =?us-ascii?Q?ZKnc6gC78eXcDywHozF0NNtQXb0FgLcAfDcoJn7WlRvusprZuuSTxuZ/R4tM?=
 =?us-ascii?Q?X8EBAwGself9Qrrv/KkFbIGPdS5ekEAR0Y7dqq99whSeS+eUKZONki3rK+Tw?=
 =?us-ascii?Q?sYDR8/UOAskDAXpv2i5XbXoYHyfUdK2FVKTbc1uYHHLK/0To3HmE2yvd2Kt0?=
 =?us-ascii?Q?21vmRLhXe2S0jFml/Vio3VCtkANmj8zqwRhstn3d431OC8oEMJ7NQMFtvO8j?=
 =?us-ascii?Q?sMb2Mabff4EcpYduc/VrCBlGymZ8Qj60REdPS85Mw1vuGbqJyAyN1gzNYLXj?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8548726-b96b-48c3-af8a-08db39e179ba
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 16:34:37.8909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3x3r6YD+coZizEsonEBsxoDLJ2WIl1/E/gxHCNpTjbJc4hjKnInso1yORxVPWkxcXqSqmG1Yx+t5Jwhx3S4lPhQbZIQYVDplet5HLysyKAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7942
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 07, 2023 at 12:12:29AM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> On MTL, GT can no longer allocate on LLC - only the CPU can.
> This, along with addition of support for ADM/L4 cache calls a
> MOCS/PAT table update. Also defines PTE encode functions for
> MTL as it has different PAT index definition than previous
> platforms.

It might be best to keep the PTE encoding as a separate patch from the
MOCS/PAT tables.  It's a different enough topic that it probably
deserves a patch of its own.

> 
> BSpec: 44509, 45101, 44235
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c    | 28 +++++++++
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.h    |  3 +
>  drivers/gpu/drm/i915/gt/intel_ggtt.c    | 27 +++++++++
>  drivers/gpu/drm/i915/gt/intel_gtt.c     | 23 +++++++-
>  drivers/gpu/drm/i915/gt/intel_gtt.h     | 20 ++++++-
>  drivers/gpu/drm/i915/gt/intel_mocs.c    | 76 +++++++++++++++++++++++--
>  drivers/gpu/drm/i915/gt/selftest_mocs.c |  2 +-
>  drivers/gpu/drm/i915/i915_pci.c         |  1 +
>  8 files changed, 173 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index 4daaa6f55668..df4073d32114 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>  	return pte;
>  }
>  
> +static u64 mtl_pte_encode(dma_addr_t addr,
> +			  enum i915_cache_level level,
> +			  u32 flags)
> +{
> +	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> +
> +	if (unlikely(flags & PTE_READ_ONLY))
> +		pte &= ~GEN8_PAGE_RW;
> +
> +	if (flags & PTE_LM)
> +		pte |= GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
> +
> +	switch (level) {
> +	case I915_CACHE_NONE:
> +		pte |= GEN12_PPGTT_PTE_PAT1;
> +		break;
> +	case I915_CACHE_LLC:
> +	case I915_CACHE_L3_LLC:
> +		pte |= GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;
> +		break;
> +	case I915_CACHE_WT:
> +		pte |= GEN12_PPGTT_PTE_PAT0;
> +		break;
> +	}
> +
> +	return pte;
> +}
> +
>  static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool create)
>  {
>  	struct drm_i915_private *i915 = ppgtt->vm.i915;
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> index f541d19264b4..6b8ce7f4d25a 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> @@ -18,5 +18,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>  			 enum i915_cache_level level,
>  			 u32 flags);
> +u64 mtl_ggtt_pte_encode(dma_addr_t addr,
> +			unsigned int pat_index,
> +			u32 flags);
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 3c7f1ed92f5b..4a16bfcde1de 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -220,6 +220,33 @@ static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>  	}
>  }
>  
> +u64 mtl_ggtt_pte_encode(dma_addr_t addr,
> +			enum i915_cache_level level,
> +			u32 flags)
> +{
> +	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT;
> +
> +	GEM_BUG_ON(addr & ~GEN12_GGTT_PTE_ADDR_MASK);
> +
> +	if (flags & PTE_LM)
> +		pte |= GEN12_GGTT_PTE_LM;
> +
> +	switch (level) {
> +	case I915_CACHE_NONE:
> +		pte |= MTL_GGTT_PTE_PAT1;
> +		break;
> +	case I915_CACHE_LLC:
> +	case I915_CACHE_L3_LLC:
> +		pte |= MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;
> +		break;
> +	case I915_CACHE_WT:
> +		pte |= MTL_GGTT_PTE_PAT0;
> +		break;
> +	}
> +
> +	return pte;
> +}
> +
>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>  			 enum i915_cache_level level,
>  			 u32 flags)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 4f436ba7a3c8..1e1b34e22cf5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -468,6 +468,25 @@ void gtt_write_workarounds(struct intel_gt *gt)
>  	}
>  }
>  
> +static void mtl_setup_private_ppat(struct intel_uncore *uncore)
> +{
> +	intel_uncore_write(uncore, GEN12_PAT_INDEX(0),
> +			   MTL_PPAT_L4_0_WB);
> +	intel_uncore_write(uncore, GEN12_PAT_INDEX(1),
> +			   MTL_PPAT_L4_1_WT);
> +	intel_uncore_write(uncore, GEN12_PAT_INDEX(2),
> +			   MTL_PPAT_L4_3_UC);
> +	intel_uncore_write(uncore, GEN12_PAT_INDEX(3),
> +			   MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
> +	intel_uncore_write(uncore, GEN12_PAT_INDEX(4),
> +			   MTL_PPAT_L4_0_WB | MTL_3_COH_2W);

These registers are multicast registers on the primary GT.  We need to
use XEHP_PAT_INDEX and the MCR-aware functions on the primary GT.

Although we're not programming the higher PAT entries on MTL (yet),
there's also a jump in the MMIO offsets that we should incorporate into
the PAT_INDEX macro to future-proof the code.

> +
> +	/*
> +	 * Remaining PAT entries are left at the hardware-default
> +	 * fully-cached setting
> +	 */
> +}
> +
>  static void tgl_setup_private_ppat(struct intel_uncore *uncore)
>  {
>  	/* TGL doesn't support LLC or AGE settings */
> @@ -603,7 +622,9 @@ void setup_private_pat(struct intel_gt *gt)
>  
>  	GEM_BUG_ON(GRAPHICS_VER(i915) < 8);
>  
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +	if (IS_METEORLAKE(i915))
> +		mtl_setup_private_ppat(uncore);

We need to handle the primary GT and media GT separately since the media
GT registers are unicast whereas primary are multicast.

See
https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_pat.c
for how this was handled in the Xe driver.

> +	else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
>  		xehp_setup_private_ppat(gt);
>  	else if (GRAPHICS_VER(i915) >= 12)
>  		tgl_setup_private_ppat(uncore);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 69ce55f517f5..b632167eaf2e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -88,9 +88,18 @@ typedef u64 gen8_pte_t;
>  #define BYT_PTE_SNOOPED_BY_CPU_CACHES	REG_BIT(2)
>  #define BYT_PTE_WRITEABLE		REG_BIT(1)
>  
> +#define GEN12_PPGTT_PTE_PAT3    BIT_ULL(62)
>  #define GEN12_PPGTT_PTE_LM	BIT_ULL(11)
> +#define GEN12_PPGTT_PTE_PAT2    BIT_ULL(7)
> +#define GEN12_PPGTT_PTE_NC      BIT_ULL(5)
> +#define GEN12_PPGTT_PTE_PAT1    BIT_ULL(4)
> +#define GEN12_PPGTT_PTE_PAT0    BIT_ULL(3)

Which bspec page is this from?  The PPGTT descriptions in the bspec are
kind of hard to track down.

But if these only apply to MTL, why are they labelled as "GEN12?"

>  
> -#define GEN12_GGTT_PTE_LM	BIT_ULL(1)
> +#define GEN12_GGTT_PTE_LM		BIT_ULL(1)
> +#define MTL_GGTT_PTE_PAT0		BIT_ULL(52)
> +#define MTL_GGTT_PTE_PAT1		BIT_ULL(53)
> +#define GEN12_GGTT_PTE_ADDR_MASK	GENMASK_ULL(45, 12)
> +#define MTL_GGTT_PTE_PAT_MASK		GENMASK_ULL(53, 52)
>  
>  #define GEN12_PDE_64K BIT(6)
>  #define GEN12_PTE_PS64 BIT(8)
> @@ -147,6 +156,15 @@ typedef u64 gen8_pte_t;
>  #define GEN8_PDE_IPS_64K BIT(11)
>  #define GEN8_PDE_PS_2M   BIT(7)
>  
> +#define MTL_PPAT_L4_CACHE_POLICY_MASK	REG_GENMASK(3, 2)
> +#define MTL_PAT_INDEX_COH_MODE_MASK	REG_GENMASK(1, 0)
> +#define MTL_PPAT_L4_3_UC	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
> +#define MTL_PPAT_L4_1_WT	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
> +#define MTL_PPAT_L4_0_WB	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
> +#define MTL_3_COH_2W	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
> +#define MTL_2_COH_1W	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
> +#define MTL_0_COH_NON	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)

The values for these definitions don't seem to be aligned.

> +
>  enum i915_cache_level;
>  
>  struct drm_i915_gem_object;
> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
> index 69b489e8dfed..89570f137b2c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> @@ -40,6 +40,10 @@ struct drm_i915_mocs_table {
>  #define LE_COS(value)		((value) << 15)
>  #define LE_SSE(value)		((value) << 17)
>  
> +/* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
> +#define _L4_CACHEABILITY(value)	((value) << 2)

We should use REG_GENMASK + REG_FIELD_PREP for new code, which will help
ensure that we don't try to pack a value into a field that's too big to
fit.

> +#define IG_PAT(value)		((value) << 8)

Do we need this one parameterized?  It's just a boolean flag, so

        #define IG_PAT          REG_BIT(8)

would be fine (and then don't include the flag on the entries where it
isn't set.

> +
>  /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per word */
>  #define L3_ESC(value)		((value) << 0)
>  #define L3_SCC(value)		((value) << 1)
> @@ -50,6 +54,7 @@ struct drm_i915_mocs_table {
>  /* Helper defines */
>  #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
>  #define PVC_NUM_MOCS_ENTRIES	3
> +#define MTL_NUM_MOCS_ENTRIES	16
>  
>  /* (e)LLC caching options */
>  /*
> @@ -73,6 +78,12 @@ struct drm_i915_mocs_table {
>  #define L3_2_RESERVED		_L3_CACHEABILITY(2)
>  #define L3_3_WB			_L3_CACHEABILITY(3)
>  
> +/* L4 caching options */
> +#define L4_0_WB			_L4_CACHEABILITY(0)
> +#define L4_1_WT			_L4_CACHEABILITY(1)
> +#define L4_2_RESERVED		_L4_CACHEABILITY(2)

This definition is unnecessary and unused.

> +#define L4_3_UC			_L4_CACHEABILITY(3)
> +
>  #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
>  	[__idx] = { \
>  		.control_value = __control_value, \
> @@ -416,6 +427,57 @@ static const struct drm_i915_mocs_entry pvc_mocs_table[] = {
>  	MOCS_ENTRY(2, 0, L3_3_WB),
>  };
>  
> +static const struct drm_i915_mocs_entry mtl_mocs_table[] = {

The entries below with WB L4 cache don't include L4_0_WB.  That works
out okay since the value is 0, but it seems like it would still be worth
including it, just to make the table meaning more clear.

Conversely, I'd drop the "IG_PAT(0)" on entry 0 since that's just a
simple boolean flag, so the "0" there is easier to misread than just not
including it at all.

> +	/* Error - Reserved for Non-Use */
> +	MOCS_ENTRY(0,
> +		   IG_PAT(0),
> +		   L3_LKUP(1) | L3_3_WB),
> +	/* Cached - L3 + L4 */
> +	MOCS_ENTRY(1,
> +		   IG_PAT(1),
> +		   L3_LKUP(1) | L3_3_WB),
> +	/* L4 - GO:L3 */
> +	MOCS_ENTRY(2,
> +		   IG_PAT(1),
> +		   L3_LKUP(1) | L3_1_UC),
> +	/* Uncached - GO:L3 */
> +	MOCS_ENTRY(3,
> +		   IG_PAT(1) | L4_3_UC,
> +		   L3_LKUP(1) | L3_1_UC),
> +	/* L4 - GO:Mem */
> +	MOCS_ENTRY(4,
> +		   IG_PAT(1),
> +		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
> +	/* Uncached - GO:Mem */
> +	MOCS_ENTRY(5,
> +		   IG_PAT(1) | L4_3_UC,
> +		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
> +	/* L4 - L3:NoLKUP; GO:L3 */
> +	MOCS_ENTRY(6,
> +		   IG_PAT(1),
> +		   L3_1_UC),
> +	/* Uncached - L3:NoLKUP; GO:L3 */
> +	MOCS_ENTRY(7,
> +		   IG_PAT(1) | L4_3_UC,
> +		   L3_1_UC),
> +	/* L4 - L3:NoLKUP; GO:Mem */
> +	MOCS_ENTRY(8,
> +		   IG_PAT(1),
> +		   L3_GLBGO(1) | L3_1_UC),
> +	/* Uncached - L3:NoLKUP; GO:Mem */
> +	MOCS_ENTRY(9,
> +		   IG_PAT(1) | L4_3_UC,
> +		   L3_GLBGO(1) | L3_1_UC),
> +	/* Display - L3; L4:WT */
> +	MOCS_ENTRY(14,
> +		   IG_PAT(1) | L4_1_WT,
> +		   L3_LKUP(1) | L3_3_WB),
> +	/* CCS - Non-Displayable */
> +	MOCS_ENTRY(15,
> +		   IG_PAT(1),
> +		   L3_GLBGO(1) | L3_1_UC),
> +};
> +
>  enum {
>  	HAS_GLOBAL_MOCS = BIT(0),
>  	HAS_ENGINE_MOCS = BIT(1),
> @@ -445,7 +507,13 @@ static unsigned int get_mocs_settings(const struct drm_i915_private *i915,
>  	memset(table, 0, sizeof(struct drm_i915_mocs_table));
>  
>  	table->unused_entries_index = I915_MOCS_PTE;
> -	if (IS_PONTEVECCHIO(i915)) {
> +	if (IS_METEORLAKE(i915)) {
> +		table->size = ARRAY_SIZE(mtl_mocs_table);
> +		table->table = mtl_mocs_table;
> +		table->n_entries = MTL_NUM_MOCS_ENTRIES;
> +		table->uc_index = 9;
> +		table->unused_entries_index = 1;
> +	} else if (IS_PONTEVECCHIO(i915)) {
>  		table->size = ARRAY_SIZE(pvc_mocs_table);
>  		table->table = pvc_mocs_table;
>  		table->n_entries = PVC_NUM_MOCS_ENTRIES;
> @@ -646,9 +714,9 @@ void intel_mocs_init_engine(struct intel_engine_cs *engine)
>  		init_l3cc_table(engine->gt, &table);
>  }
>  
> -static u32 global_mocs_offset(void)
> +static u32 global_mocs_offset(struct intel_gt *gt)
>  {
> -	return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0));
> +	return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0)) + gt->uncore->gsi_offset;

Isn't this going to double-apply the GSI offset in __init_mocs_table?

We do need to handle the offset manually in read_mocs_table() since
those reads are done with an MI_STORE_REGISTER_MEM instruction.

Handling the GSI offset properly deserves its own patch with a dedicated
commit message explaining the details.

>  }
>  
>  void intel_set_mocs_index(struct intel_gt *gt)
> @@ -671,7 +739,7 @@ void intel_mocs_init(struct intel_gt *gt)
>  	 */
>  	flags = get_mocs_settings(gt->i915, &table);
>  	if (flags & HAS_GLOBAL_MOCS)
> -		__init_mocs_table(gt->uncore, &table, global_mocs_offset());
> +		__init_mocs_table(gt->uncore, &table, global_mocs_offset(gt));
>  
>  	/*
>  	 * Initialize the L3CC table as part of mocs initalization to make
> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> index ca009a6a13bd..730796346514 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> @@ -137,7 +137,7 @@ static int read_mocs_table(struct i915_request *rq,
>  		return 0;
>  
>  	if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
> -		addr = global_mocs_offset();
> +		addr = global_mocs_offset(rq->engine->gt);
>  	else
>  		addr = mocs_offset(rq->engine);
>  
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index cddb6e197972..025d32c0b161 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1146,6 +1146,7 @@ static const struct intel_device_info mtl_info = {
>  	.has_flat_ccs = 0,
>  	.has_gmd_id = 1,
>  	.has_guc_deprivilege = 1,
> +	.has_llc = 0,

This should also be in its own patch since it isn't directly related to
the MOCS / PAT tables.


Matt

>  	.has_mslice_steering = 0,
>  	.has_snoop = 1,
>  	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
