Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF0F756BCB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 20:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDE010E2A4;
	Mon, 17 Jul 2023 18:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E9110E2A1;
 Mon, 17 Jul 2023 18:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689618109; x=1721154109;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0u6F7R1pl3WVsOOyvrZJmV5zfsoS1f6q1xWmozMPV/0=;
 b=UjB+uJnxcIjklO20/gFJd5bskZA7tVEuZklDzsaiP/adhdhj/5jPB5AH
 x7xNCNjw2Ca9N/em3ODZNu7xzpgl8fWd6IqKAOXDRr302NAyfaYoj4LHk
 fq7Y7RpeY/QAbmfKVMnn8wBn0aZHjtt/sQF3h4KXzPb8XJ4gFRK+6nu7W
 Hs5YnnqFw9uDpK0EJBEHwrU7FURFEi2bXb0Z8eZWDEuStjyRgeuwi0iW6
 j6Ilexksd3PsQTZgp/CqqcAUfjEL/E0TMQ6ipLe6pvSiyIlPEnL58nDTU
 rpFj7yRQ8Y5eD8xqhtD1BL50QK/2IN7IJuC0c8LYcSXEMTT10sXSXhd3c Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432178988"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="432178988"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 11:21:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="788742340"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="788742340"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.9.23])
 ([10.213.9.23])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 11:21:42 -0700
Message-ID: <e951e0c3-23e8-75aa-f58a-5aa99a7d4598@intel.com>
Date: Mon, 17 Jul 2023 20:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v4 3/6] drm/i915/gt: Rename flags with
 bit_group_X according to the datasheet
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-4-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
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

On 17.07.2023 19:30, Andi Shyti wrote:
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

For me flags0 and flags1 seems more readable as in 
*gen8_emit_pipe_control(batch, flags0, flags1, offset), but no strong 
feelings, but if bit_group is chosen arguments of 
*gen8_emit_pipe_control could be changed as well.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

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

