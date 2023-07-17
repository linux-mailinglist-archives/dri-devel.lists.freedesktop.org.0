Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE515756C5D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 20:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B5810E2A8;
	Mon, 17 Jul 2023 18:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0C410E2A8;
 Mon, 17 Jul 2023 18:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689619513; x=1721155513;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AR3oPutieacLQtLEpeFKul3okLTiearp7rNSPjYiRuA=;
 b=Gz4yU2euudJM1oHISQ4ySOGSEtdjGE7dJ+GZayzfFN/PlCkmfydn45ps
 pPXtWDUUtrqmSNfCEO2SvrkeRO1WFCp3ssZxDjXSC3OoR3vZjY168mbQh
 51Izpvx1b3b/qG3jBl8B3HTOrhyIZnkSNA7fh6OV+vK1uHOstR9NIAiad
 33vpOeHzP+HzJZdYfjTjTHYnulvFnfmCXYvPZ/3h6+eu3mwQIGqUKb/NE
 NWAgpc+gj9LHVsY43j0BbSdh1ttxavWxO/voSzHCHSFYTulV8ecPHZOXI
 a5lZkROBrJ66Fz+F0DALSvXTswruGx7agypo9bO1R4KkeRQgvlQCFUQfJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="366048999"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="366048999"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 11:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="813458069"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="813458069"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.36.7])
 ([10.249.36.7])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 11:45:09 -0700
Message-ID: <ad4c5943-398e-59fc-75f6-3384b6b19c8d@linux.intel.com>
Date: Mon, 17 Jul 2023 20:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/6] drm/i915/gt: Rename flags with bit_group_X
 according to the datasheet
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-4-andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230717173059.422892-4-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for cleaning this.

With Matt's suggestion, this is

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 7/17/2023 7:30 PM, Andi Shyti wrote:
> In preparation of the next patch allign with the datasheet (BSPEC
> 47112) with the naming of the pipe control set of flag values.
> The variable "flags" in gen12_emit_flush_rcs() is applied as a
> set of flags called Bit Group 1.
>
> Define also the Bit Group 0 as bit_group_0 where currently only
> PIPE_CONTROL0_HDC_PIPELINE_FLUSH bit is set.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 34 +++++++++++++-----------
>   1 file changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index bee3b7dc595cf..3c935d6b68bf0 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -210,7 +210,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		mode |= EMIT_FLUSH;
>   
>   	if (mode & EMIT_FLUSH) {
> -		u32 flags = 0;
> +		u32 bit_group_0 = 0;
> +		u32 bit_group_1 = 0;
>   		int err;
>   		u32 *cs;
>   
> @@ -218,32 +219,33 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		if (err)
>   			return err;
>   
> -		flags |= PIPE_CONTROL_TILE_CACHE_FLUSH;
> -		flags |= PIPE_CONTROL_FLUSH_L3;
> -		flags |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> -		flags |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
> +		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
> +
> +		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
> +		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
> +		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> +		bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
>   		/* Wa_1409600907:tgl,adl-p */
> -		flags |= PIPE_CONTROL_DEPTH_STALL;
> -		flags |= PIPE_CONTROL_DC_FLUSH_ENABLE;
> -		flags |= PIPE_CONTROL_FLUSH_ENABLE;
> +		bit_group_1 |= PIPE_CONTROL_DEPTH_STALL;
> +		bit_group_1 |= PIPE_CONTROL_DC_FLUSH_ENABLE;
> +		bit_group_1 |= PIPE_CONTROL_FLUSH_ENABLE;
>   
> -		flags |= PIPE_CONTROL_STORE_DATA_INDEX;
> -		flags |= PIPE_CONTROL_QW_WRITE;
> +		bit_group_1 |= PIPE_CONTROL_STORE_DATA_INDEX;
> +		bit_group_1 |= PIPE_CONTROL_QW_WRITE;
>   
> -		flags |= PIPE_CONTROL_CS_STALL;
> +		bit_group_1 |= PIPE_CONTROL_CS_STALL;
>   
>   		if (!HAS_3D_PIPELINE(engine->i915))
> -			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> +			bit_group_1 &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>   		else if (engine->class == COMPUTE_CLASS)
> -			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> +			bit_group_1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>   
>   		cs = intel_ring_begin(rq, 6);
>   		if (IS_ERR(cs))
>   			return PTR_ERR(cs);
>   
> -		cs = gen12_emit_pipe_control(cs,
> -					     PIPE_CONTROL0_HDC_PIPELINE_FLUSH,
> -					     flags, LRC_PPHWSP_SCRATCH_ADDR);
> +		cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
> +					     LRC_PPHWSP_SCRATCH_ADDR);
>   		intel_ring_advance(rq, cs);
>   	}
>   
