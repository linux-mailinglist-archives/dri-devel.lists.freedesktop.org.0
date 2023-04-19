Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A66716E83ED
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 23:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B23E10E21A;
	Wed, 19 Apr 2023 21:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6412E10E21A;
 Wed, 19 Apr 2023 21:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681940928; x=1713476928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LetWuQU0oxXmLXjCnte7GwXL87kkIPTNDLZCcscfLqw=;
 b=gNMkGestJYRoUEOHzEDfKQlL0LYQjhd000oI1oe0trnJklG0Het/VJTq
 dDqK0Mow0dIwXB6/ObBpUvY8S3sj/KMqDQbpUX8t5YTPW6xHaaRb0sjNw
 pzvsXWYkW6urmJ4WOB8Luui43ZJ8PNCruZnw/P6pQ1YRlPQGX/y2EobB4
 1hnmNFN1KEJtiZqyJX/trdpM7HHKe/T9XMfXWG7nzuQuWHtqwqnjxIlX5
 mPL3Jm7K4bIpPpp73Tobytm5wrI9H2eR9DR3vJLfcMzEojw7C6ZdfeL8c
 Hei3fdXn/PunH3DtIS8YfSIh7kJ5g11hhgcjuit/xqgK/GmUmvsijHN+i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431845211"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="431845211"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="865993425"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="865993425"
Received: from mmzakhar-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.251.213.234])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:48:27 -0700
Date: Wed, 19 Apr 2023 23:48:24 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Message-ID: <ZEBhqBGTrNRfz0NK@ashyti-mobl2.lan>
References: <20230419211219.2574008-1-fei.yang@intel.com>
 <20230419211219.2574008-3-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419211219.2574008-3-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

> +#define MTL_PPGTT_PTE_PAT3	BIT_ULL(62)
>  #define GEN12_PPGTT_PTE_LM	BIT_ULL(11)
> +#define GEN12_PPGTT_PTE_PAT2	BIT_ULL(7)
> +#define GEN12_PPGTT_PTE_NC	BIT_ULL(5)
> +#define GEN12_PPGTT_PTE_PAT1	BIT_ULL(4)
> +#define GEN12_PPGTT_PTE_PAT0	BIT_ULL(3)
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

BTW, are all these defines needed? Not all of them look to be
used.

Andi
