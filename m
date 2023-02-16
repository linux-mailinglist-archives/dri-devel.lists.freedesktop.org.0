Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9794699921
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 16:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691C110E174;
	Thu, 16 Feb 2023 15:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C685810E32F;
 Thu, 16 Feb 2023 15:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676562097; x=1708098097;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0fVxDJbi/KfL28MXD+CtPSWnaZOdhkGkfwf/5GP08gg=;
 b=EEEdjq75YHyhh+fIaWaSQ8K9fp/B1NavsqRhhG0s2RadhRK5Ug3FmcOM
 qctP6kgyqHRL9yqn1kGk1LhG+lVI9pk35X2tFZc+sJt/0slP01mHof2Z2
 qJAjHMcCu3zVW8EsRdpKmuFKQ7VOa77/wQlV+VjLmfvUlMo+EqJIcAFO+
 ZeDWZB+4cvyGf+VK/LDKddHZXOhwWJRIWH6moIliS30k9aYGXgUyMEDQI
 HsYp+Us98arRHt9UjkvdKLZGAqIrYxaHcWIhJHFDNgfPUczqXumtY4lc4
 bkDsaBV2NH0HUCXenTnZcZ0DneZrSTEgjqwX9PG8XEZMhORI6chTZOCyQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="311375409"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="311375409"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 07:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="779384318"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="779384318"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2023 07:41:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 07:41:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 07:41:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 07:41:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 07:41:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJkC7GgDCgLjdaCBhaOUksRvnzUufWPocXoEQVr0GuI48omH1qO0MDXlldnmJU4zblUSzmELq+yjHQ4Ht+4eGOvJKzhhGsb5HErNGi9lDg6Nye6+0O6gdIPRtYwYltdnNTe7Ed5rCac7cQO7y4NixlXS3EBbjGnJ4gMcpCBVwSHFy8mpWqreYlGIIDEP7SYj49fNRQzTS9u/WssDxlSYfiG8Y8+e5vsdV7lm2Ia+8ZW/BweMQIARrgWLA1sId2GgGYqsUC23C3iTcArzjoeVO+0M0ZNZFO3MpdHdY+wLtGjVWfd16s2a/WGktqRpkPwQN2mhufsouMctm1dlAUHewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHr8B4gqDsZb+IbW7CXKIxKmx50A8OTMBG46y/mleqQ=;
 b=aqPE0bQ/EV4UphvxEkSutWCpEBtNZDfNVt7KkyY0nCGH8Uf9XvVy5QLB7HnDPLbPWHYTicJd89AHcsXQqu3V9Lc4uXeHe+CGddtd08lGsUA6cZinN+La3OZSetecNC1RaZZBzEDcNz3PyFonv24S8JqUWgD7l75w7Y9n05t5GHQjMM+Rn7m6TI3NorhZM3Ss9eGUzCoW6LfAaPWvou7hZCDxBBRUkaYiXHaGe3ZnIpxRPofSKC0szURfVP7/2G5DIqE0b4vYRoqJKBFoEDkytcGKoHmlI+ydQtuqLr7DM6jpJxqfMbWDASJhywhF23O89F4npRyeQYMORTe2nugAtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6402.namprd11.prod.outlook.com (2603:10b6:510:1fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 15:41:29 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 15:41:29 +0000
Date: Thu, 16 Feb 2023 07:41:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v5] drm/i915: Consolidate TLB invalidation flow
Message-ID: <Y+5OpUckkJlqaRjh@mdroper-desk1.amr.corp.intel.com>
References: <20230216092123.159085-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230216092123.159085-1-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1ac60d-8e0c-4f53-2d19-08db103444ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K1PJ26pofZ+/4JXx8or8kXylKfe61Nevii6QHqoLb5iw/yPji1kXyOVVYvkiHYcQFHkYC53rqIGi2DYvo+fNA09GN/21qLdApuNDPHByhKn9Zy9fEzNFhNgleKW9cRhBmHPSyrFrIJ45akAO+Vo8akUthyyIbZzcrChHZajBhLPbqHlEKTZkGDomhBeyeOF0MXR0EtYiIhIjK91dRgHwce+7AZMHlKAv8kpq1JhtHcMGsiveW59ZMa8JY0QBX8lJ7AZK8v6DxrbRe5rbmcg7QaLVuwIOD8ULTMJxxp6XjTJDkbX72KwReygfMhRxU8GGKey0GLyGYd6+9M9W30rYbeEm71eG6qIdFr8CosKj+OVu5vXEDgNHSZXIlQqxh/2VwBtRI4r459bfDbaKxy9eDNnafJWJv1+Hx5JgGpYIjHT1qOTfBzxsQ3aBSxfWcLD3CewgKwr7A+y9aznC108b5FdGPDqzHNaeE9PhD5odSwuBfFIwzviFymFGbRfLDndqfbRw1ulT8AQBH3GKCjPjqMa5qpPc41+jvlZT1+7q0Ppz2YnETuha+E+dhu/z36wUZfxN6MYEI83UrhZy2D8eFQPLJct4KB8Eux6DOwUSIu3Ulq/cZ9Oy682HvT1NXdgT/1BuRLs41sk1MJ7ngWtoMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199018)(6486002)(966005)(478600001)(38100700002)(83380400001)(82960400001)(86362001)(6506007)(6512007)(186003)(6666004)(26005)(54906003)(4326008)(66556008)(5660300002)(66946007)(30864003)(8936002)(66476007)(6916009)(8676002)(2906002)(316002)(41300700001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RiJDE+hsV2vMQ4G/D4uuGeyUN+canCbfbCq/1Hac89CfrDmN69vlZ1BZ8fxF?=
 =?us-ascii?Q?c1THVPXHbV6u6HfyBY5rPH0WW/b2TkDybQW2a1cXwcGF/YioSxx+IlOnr55W?=
 =?us-ascii?Q?IJ+j5bOnZyWl9I2vJLFOErNibSzfkhWUENoJZOimkD/hL168ZHYPxoEvu9rP?=
 =?us-ascii?Q?Zf1ag4ztviGtqr7+C5XdaF7UO7egI1XqrB92oqY+SgY6s39lb0togJdmOPvl?=
 =?us-ascii?Q?w3U88XHeousbVGtfO4/mxCfPLDBwvu/ymMG6CP4/IKAw8f57EUJEh1v2uKAt?=
 =?us-ascii?Q?LkQfg3X/tmKJjPB0ImGNwrwBo/1b7RLhxgtvaiXLvXpMt5FfR4wjw4nFM7zW?=
 =?us-ascii?Q?WhZFGwDb4fHTPx3e+7s+KVG/TsvLYQrC/XWX/fiHXH++Bj92xTBESDJfWxww?=
 =?us-ascii?Q?uO5XPt4o2+7+zyQs0mrvovBuH2cL9evtQ112VCWqjIe7hi3u3ZRjZAM8mt4g?=
 =?us-ascii?Q?pbAtYqcU6oJfENIhJkQekDXYhoDhbCpNCmd2LKrGl8w1TSddmkx8szv3iHJi?=
 =?us-ascii?Q?Zb+Mv92rnVQSVhUIDSrIWsDW2yflygtjVk8zy+F2feyRFTmuQZyVmZbZFYiJ?=
 =?us-ascii?Q?WGD7x5VVmlNbxIn8gig7narECWqQ0zlVkPj5xRLWRvqxk873bSJf6kInODb5?=
 =?us-ascii?Q?gX0ZEGvKSrtoku6OpYgIgv0mvFfmQHYaBiAOw3VeV7y4D2TyuE1SmWMSNeIq?=
 =?us-ascii?Q?r5jVK3rpmBD+Cie77YQmoXDcp3p3ibfXpHQHUGEZRSVTLUjKo5KhuUhufyKn?=
 =?us-ascii?Q?TWnNi+f9zUQIQyuO6qdleG204V/3hmu2GHinYwNzMsf8Vmm9gmwfD8eGu7Wr?=
 =?us-ascii?Q?lwl3n2xqPZDn2RqgSUrvo6tU8NlZDP9WL4QFO571qkEHoq3YqpoDX60uo+Pu?=
 =?us-ascii?Q?Z0B+fYMr0wwyahWlqGf2OvhVCXUpWx5tBOdSLMIcgg1mRU7aXOz8y+dEVe9E?=
 =?us-ascii?Q?kA5vVSi5Gxi0Z/qv0i9mGsNCeBX41pOOxeUr9ysOvu3uHDeOEkVS2JkIh26a?=
 =?us-ascii?Q?VlhNq3ec261GfFUzJ3Ytw1zUd78m1xgGZEOJaeCRGGRJmZK3gsaoSGC+d48P?=
 =?us-ascii?Q?Rqy7esW3Ve4bt+r2TiqqYULiCm17q3UrIYBbLG21KmPuu8i71zVEbIBkl5rr?=
 =?us-ascii?Q?8syWTg6Un9rTU8MTI2xiWmfil8ju0ISO6rF6VdczsF2JRWE18fqO7u6KE3OA?=
 =?us-ascii?Q?TjpQtsTBM0aDOIBbZS5ordqu2pARJv4/LXSn4hh7YXUkhQ6NhWNAMStEn3YT?=
 =?us-ascii?Q?FjX6vQlFNRhS6G32r4dYCTzfMi2tvHmGX8HK/dc32ROtoOjaOtH+B2TjE/6e?=
 =?us-ascii?Q?AQ6WCS9N1ZHk6k5PpmfMiy2YraO/SBdC9kCGYCpfx0Ftx2x3PEwUtQ28jB4u?=
 =?us-ascii?Q?Op8FekhgN4i8JR4WjJG0XN+FLCYjVjQtWqUcHufr/etiKeQP/WwcKtnuxLfV?=
 =?us-ascii?Q?PpnID18HtJGmQNWBwuUHU21zaFuD7daX7hJ6o75jgBl2V1F4bisQ/wP2+DJW?=
 =?us-ascii?Q?gNAA7H3EPKo5EwRuceZaSU+lhqRFnsyhNsCpjZQ21XDxvoncOom4Kyl/1PK/?=
 =?us-ascii?Q?plvvxeL/tQkspeyvhaBoHK4lnVOicp/5cn8V7Ya4DESrJQa86hexNHj3kpQo?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1ac60d-8e0c-4f53-2d19-08db103444ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 15:41:28.6386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfzEeUutbMM1y6bhq09/eI+SgREUy32Jbq8MOYwfpfik7noafx/AW51VcNlCs0ibwRTZnwvvcENe4hq+BN4afU3iELQspoaIcAGPa6wfNeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6402
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
Cc: Intel-gfx@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 09:21:23AM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> As the logic for selecting the register and corresponsing values grew, the
> code become a bit unsightly. Consolidate by storing the required values at
> engine init time in the engine itself, and by doing so minimise the amount
> of invariant platform and engine checks during each and every TLB
> invalidation.
> 
> v2:
>  * Fail engine probe if TLB invlidations registers are unknown.
> 
> v3:
>  * Rebase.
> 
> v4:
>  * Fix handling of GEN8_M2TCR. (Andrzej)
> 
> v5:
>  * Tidy checkpatch warnings.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v3

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

for this version as well.


Matt

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20230202083218.4100760-1-tvrtko.ursulin@linux.intel.com
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  97 +++++++++++++
>  drivers/gpu/drm/i915/gt/intel_engine_types.h |  14 ++
>  drivers/gpu/drm/i915/gt/intel_gt.c           | 138 +++----------------
>  3 files changed, 133 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index d4e29da74612..f3a91e7f85f7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -9,6 +9,7 @@
>  
>  #include "gem/i915_gem_context.h"
>  #include "gem/i915_gem_internal.h"
> +#include "gt/intel_gt_print.h"
>  #include "gt/intel_gt_regs.h"
>  
>  #include "i915_cmd_parser.h"
> @@ -1143,12 +1144,108 @@ static int init_status_page(struct intel_engine_cs *engine)
>  	return ret;
>  }
>  
> +static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
> +{
> +	static const union intel_engine_tlb_inv_reg gen8_regs[] = {
> +		[RENDER_CLASS].reg		= GEN8_RTCR,
> +		[VIDEO_DECODE_CLASS].reg	= GEN8_M1TCR, /* , GEN8_M2TCR */
> +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN8_VTCR,
> +		[COPY_ENGINE_CLASS].reg		= GEN8_BTCR,
> +	};
> +	static const union intel_engine_tlb_inv_reg gen12_regs[] = {
> +		[RENDER_CLASS].reg		= GEN12_GFX_TLB_INV_CR,
> +		[VIDEO_DECODE_CLASS].reg	= GEN12_VD_TLB_INV_CR,
> +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN12_VE_TLB_INV_CR,
> +		[COPY_ENGINE_CLASS].reg		= GEN12_BLT_TLB_INV_CR,
> +		[COMPUTE_CLASS].reg		= GEN12_COMPCTX_TLB_INV_CR,
> +	};
> +	static const union intel_engine_tlb_inv_reg xehp_regs[] = {
> +		[RENDER_CLASS].mcr_reg		  = XEHP_GFX_TLB_INV_CR,
> +		[VIDEO_DECODE_CLASS].mcr_reg	  = XEHP_VD_TLB_INV_CR,
> +		[VIDEO_ENHANCEMENT_CLASS].mcr_reg = XEHP_VE_TLB_INV_CR,
> +		[COPY_ENGINE_CLASS].mcr_reg	  = XEHP_BLT_TLB_INV_CR,
> +		[COMPUTE_CLASS].mcr_reg		  = XEHP_COMPCTX_TLB_INV_CR,
> +	};
> +	struct drm_i915_private *i915 = engine->i915;
> +	const unsigned int instance = engine->instance;
> +	const unsigned int class = engine->class;
> +	const union intel_engine_tlb_inv_reg *regs;
> +	union intel_engine_tlb_inv_reg reg;
> +	unsigned int num = 0;
> +	u32 val;
> +
> +	/*
> +	 * New platforms should not be added with catch-all-newer (>=)
> +	 * condition so that any later platform added triggers the below warning
> +	 * and in turn mandates a human cross-check of whether the invalidation
> +	 * flows have compatible semantics.
> +	 *
> +	 * For instance with the 11.00 -> 12.00 transition three out of five
> +	 * respective engine registers were moved to masked type. Then after the
> +	 * 12.00 -> 12.50 transition multi cast handling is required too.
> +	 */
> +
> +	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
> +	    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
> +		regs = xehp_regs;
> +		num = ARRAY_SIZE(xehp_regs);
> +	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
> +		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
> +		regs = gen12_regs;
> +		num = ARRAY_SIZE(gen12_regs);
> +	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> +		regs = gen8_regs;
> +		num = ARRAY_SIZE(gen8_regs);
> +	} else if (GRAPHICS_VER(i915) < 8) {
> +		return 0;
> +	}
> +
> +	if (gt_WARN_ONCE(engine->gt, !num,
> +			 "Platform does not implement TLB invalidation!"))
> +		return -ENODEV;
> +
> +	if (gt_WARN_ON_ONCE(engine->gt,
> +			    class >= num ||
> +			    (!regs[class].reg.reg &&
> +			     !regs[class].mcr_reg.reg)))
> +		return -ERANGE;
> +
> +	reg = regs[class];
> +
> +	if (regs == gen8_regs && class == VIDEO_DECODE_CLASS && instance == 1) {
> +		reg.reg = GEN8_M2TCR;
> +		val = 0;
> +	} else {
> +		val = instance;
> +	}
> +
> +	val = BIT(val);
> +
> +	engine->tlb_inv.mcr = regs == xehp_regs;
> +	engine->tlb_inv.reg = reg;
> +	engine->tlb_inv.done = val;
> +
> +	if (GRAPHICS_VER(i915) >= 12 &&
> +	    (engine->class == VIDEO_DECODE_CLASS ||
> +	     engine->class == VIDEO_ENHANCEMENT_CLASS ||
> +	     engine->class == COMPUTE_CLASS))
> +		engine->tlb_inv.request = _MASKED_BIT_ENABLE(val);
> +	else
> +		engine->tlb_inv.request = val;
> +
> +	return 0;
> +}
> +
>  static int engine_setup_common(struct intel_engine_cs *engine)
>  {
>  	int err;
>  
>  	init_llist_head(&engine->barrier_tasks);
>  
> +	err = intel_engine_init_tlb_invalidation(engine);
> +	if (err)
> +		return err;
> +
>  	err = init_status_page(engine);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 4fd54fb8810f..0a071e5da1a8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -341,6 +341,18 @@ struct intel_engine_guc_stats {
>  	u64 start_gt_clk;
>  };
>  
> +union intel_engine_tlb_inv_reg {
> +	i915_reg_t	reg;
> +	i915_mcr_reg_t	mcr_reg;
> +};
> +
> +struct intel_engine_tlb_inv {
> +	bool mcr;
> +	union intel_engine_tlb_inv_reg reg;
> +	u32 request;
> +	u32 done;
> +};
> +
>  struct intel_engine_cs {
>  	struct drm_i915_private *i915;
>  	struct intel_gt *gt;
> @@ -372,6 +384,8 @@ struct intel_engine_cs {
>  	u32 context_size;
>  	u32 mmio_base;
>  
> +	struct intel_engine_tlb_inv tlb_inv;
> +
>  	/*
>  	 * Some w/a require forcewake to be held (which prevents RC6) while
>  	 * a particular engine is active. If so, we set fw_domain to which
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 001a7ec5b861..f7f271708fc7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -982,35 +982,6 @@ void intel_gt_info_print(const struct intel_gt_info *info,
>  	intel_sseu_dump(&info->sseu, p);
>  }
>  
> -struct reg_and_bit {
> -	union {
> -		i915_reg_t reg;
> -		i915_mcr_reg_t mcr_reg;
> -	};
> -	u32 bit;
> -};
> -
> -static struct reg_and_bit
> -get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
> -		const i915_reg_t *regs, const unsigned int num)
> -{
> -	const unsigned int class = engine->class;
> -	struct reg_and_bit rb = { };
> -
> -	if (gt_WARN_ON_ONCE(engine->gt, class >= num || !regs[class].reg))
> -		return rb;
> -
> -	rb.reg = regs[class];
> -	if (gen8 && class == VIDEO_DECODE_CLASS)
> -		rb.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
> -	else
> -		rb.bit = engine->instance;
> -
> -	rb.bit = BIT(rb.bit);
> -
> -	return rb;
> -}
> -
>  /*
>   * HW architecture suggest typical invalidation time at 40us,
>   * with pessimistic cases up to 100us and a recommendation to
> @@ -1024,14 +995,20 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
>   * but are now considered MCR registers.  Since they exist within a GAM range,
>   * the primary instance of the register rolls up the status from each unit.
>   */
> -static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
> +static int wait_for_invalidate(struct intel_engine_cs *engine)
>  {
> -	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
> -		return intel_gt_mcr_wait_for_reg(gt, rb.mcr_reg, rb.bit, 0,
> +	if (engine->tlb_inv.mcr)
> +		return intel_gt_mcr_wait_for_reg(engine->gt,
> +						 engine->tlb_inv.reg.mcr_reg,
> +						 engine->tlb_inv.done,
> +						 0,
>  						 TLB_INVAL_TIMEOUT_US,
>  						 TLB_INVAL_TIMEOUT_MS);
>  	else
> -		return __intel_wait_for_register_fw(gt->uncore, rb.reg, rb.bit, 0,
> +		return __intel_wait_for_register_fw(engine->gt->uncore,
> +						    engine->tlb_inv.reg.reg,
> +						    engine->tlb_inv.done,
> +						    0,
>  						    TLB_INVAL_TIMEOUT_US,
>  						    TLB_INVAL_TIMEOUT_MS,
>  						    NULL);
> @@ -1039,62 +1016,14 @@ static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
>  
>  static void mmio_invalidate_full(struct intel_gt *gt)
>  {
> -	static const i915_reg_t gen8_regs[] = {
> -		[RENDER_CLASS]			= GEN8_RTCR,
> -		[VIDEO_DECODE_CLASS]		= GEN8_M1TCR, /* , GEN8_M2TCR */
> -		[VIDEO_ENHANCEMENT_CLASS]	= GEN8_VTCR,
> -		[COPY_ENGINE_CLASS]		= GEN8_BTCR,
> -	};
> -	static const i915_reg_t gen12_regs[] = {
> -		[RENDER_CLASS]			= GEN12_GFX_TLB_INV_CR,
> -		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
> -		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
> -		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
> -		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
> -	};
> -	static const i915_mcr_reg_t xehp_regs[] = {
> -		[RENDER_CLASS]			= XEHP_GFX_TLB_INV_CR,
> -		[VIDEO_DECODE_CLASS]		= XEHP_VD_TLB_INV_CR,
> -		[VIDEO_ENHANCEMENT_CLASS]	= XEHP_VE_TLB_INV_CR,
> -		[COPY_ENGINE_CLASS]		= XEHP_BLT_TLB_INV_CR,
> -		[COMPUTE_CLASS]			= XEHP_COMPCTX_TLB_INV_CR,
> -	};
>  	struct drm_i915_private *i915 = gt->i915;
>  	struct intel_uncore *uncore = gt->uncore;
>  	struct intel_engine_cs *engine;
>  	intel_engine_mask_t awake, tmp;
>  	enum intel_engine_id id;
> -	const i915_reg_t *regs;
> -	unsigned int num = 0;
>  	unsigned long flags;
>  
> -	/*
> -	 * New platforms should not be added with catch-all-newer (>=)
> -	 * condition so that any later platform added triggers the below warning
> -	 * and in turn mandates a human cross-check of whether the invalidation
> -	 * flows have compatible semantics.
> -	 *
> -	 * For instance with the 11.00 -> 12.00 transition three out of five
> -	 * respective engine registers were moved to masked type. Then after the
> -	 * 12.00 -> 12.50 transition multi cast handling is required too.
> -	 */
> -
> -	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
> -	    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
> -		regs = NULL;
> -		num = ARRAY_SIZE(xehp_regs);
> -	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
> -		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
> -		regs = gen12_regs;
> -		num = ARRAY_SIZE(gen12_regs);
> -	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> -		regs = gen8_regs;
> -		num = ARRAY_SIZE(gen8_regs);
> -	} else if (GRAPHICS_VER(i915) < 8) {
> -		return;
> -	}
> -
> -	if (gt_WARN_ONCE(gt, !num, "Platform does not implement TLB invalidation!"))
> +	if (GRAPHICS_VER(i915) < 8)
>  		return;
>  
>  	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
> @@ -1104,33 +1033,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  
>  	awake = 0;
>  	for_each_engine(engine, gt, id) {
> -		struct reg_and_bit rb;
> -
>  		if (!intel_engine_pm_is_awake(engine))
>  			continue;
>  
> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> -			u32 val = BIT(engine->instance);
> -
> -			if (engine->class == VIDEO_DECODE_CLASS ||
> -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
> -			    engine->class == COMPUTE_CLASS)
> -				val = _MASKED_BIT_ENABLE(val);
> +		if (engine->tlb_inv.mcr)
>  			intel_gt_mcr_multicast_write_fw(gt,
> -							xehp_regs[engine->class],
> -							val);
> -		} else {
> -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> -			if (!i915_mmio_reg_offset(rb.reg))
> -				continue;
> -
> -			if (GRAPHICS_VER(i915) == 12 && (engine->class == VIDEO_DECODE_CLASS ||
> -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
> -			    engine->class == COMPUTE_CLASS))
> -				rb.bit = _MASKED_BIT_ENABLE(rb.bit);
> -
> -			intel_uncore_write_fw(uncore, rb.reg, rb.bit);
> -		}
> +							engine->tlb_inv.reg.mcr_reg,
> +							engine->tlb_inv.request);
> +		else
> +			intel_uncore_write_fw(uncore,
> +					      engine->tlb_inv.reg.reg,
> +					      engine->tlb_inv.request);
> +
>  		awake |= engine->mask;
>  	}
>  
> @@ -1149,17 +1063,9 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	intel_gt_mcr_unlock(gt, flags);
>  
>  	for_each_engine_masked(engine, gt, awake, tmp) {
> -		struct reg_and_bit rb;
> -
> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> -			rb.mcr_reg = xehp_regs[engine->class];
> -			rb.bit = BIT(engine->instance);
> -		} else {
> -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> -		}
> -
> -		if (wait_for_invalidate(gt, rb))
> -			gt_err_ratelimited(gt, "%s TLB invalidation did not complete in %ums!\n",
> +		if (wait_for_invalidate(engine))
> +			gt_err_ratelimited(gt,
> +					   "%s TLB invalidation did not complete in %ums!\n",
>  					   engine->name, TLB_INVAL_TIMEOUT_MS);
>  	}
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
