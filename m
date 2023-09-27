Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3A7AFA4E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 07:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E6C10E46C;
	Wed, 27 Sep 2023 05:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE7010E46B;
 Wed, 27 Sep 2023 05:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695793688; x=1727329688;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WV2GT3MqmgvkaeOdGho0FQtzlWzULGvrDmyXN059hgU=;
 b=TpjPXIw9Rkrk6tCfkcrCHqXDbbsyWbyhFIFalEnJWC9PBoPfBW/bqxjA
 eP/Or7kJv1P615gg598hYjsY5VKn3mms38ZTMJ5EGq75O4n6QP9fUnI5q
 aN5F7qtuapHISbVDTL8QojtPc3ZhS0puTA9slXcJRV3EEokZH5mvTj96l
 jKN47gfhUqWgMPyQq9T4akzyjMvAvDQbz1qY/S1KuReJklLlNOH3vwAoO
 oyIaw5ib/NFqhAYg9Fky+tvWbyk2FiWpG+6cezbG94jo0Xgktr7ErQObC
 MW2VbrGf2gPX2PVqHejo8Q/HUQnP1oRCWkVUX3iXuWERrCn30YXvHhOCF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="468023393"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="468023393"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 22:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742591810"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="742591810"
Received: from jchodor-mobl2.ger.corp.intel.com (HELO [10.213.23.248])
 ([10.213.23.248])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 22:48:03 -0700
Message-ID: <af8f0c44-7f4a-f1f7-cd4a-6cae3ea477cc@intel.com>
Date: Wed, 27 Sep 2023 07:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230926142401.25687-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230926142401.25687-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Mark Janes <mark.janes@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26.09.2023 16:24, Nirmoy Das wrote:
> PIPE_CONTROL_FLUSH_L3 is not needed for aux invalidation
> so don't set that.
>
> Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before invalidation")
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: Tapani Pälli <tapani.palli@intel.com>
> Cc: Mark Janes <mark.janes@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 0143445dba83..ba4c2422b340 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -271,8 +271,17 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
>   			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
>   
> +		/*
> +		 * L3 fabric flush is needed for AUX CCS invalidation
> +		 * which happens as part of pipe-control so we can
> +		 * ignore PIPE_CONTROL_FLUSH_L3. Also PIPE_CONTROL_FLUSH_L3
> +		 * deals with Protected Memory which is not needed for
> +		 * AUX CCS invalidation and lead to unwanted side effects.
> +		 */
> +		if (mode & EMIT_FLUSH)
> +			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
> +
>   		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
> -		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>   		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
>   		bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
>   		/* Wa_1409600907:tgl,adl-p */

