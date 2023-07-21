Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E25975C470
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 12:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B616110E64D;
	Fri, 21 Jul 2023 10:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD76B10E64B;
 Fri, 21 Jul 2023 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689934647; x=1721470647;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OxibDKtAvapPQ7P85Ukb7Bo6W97b/VOI3fTJx3B8gxY=;
 b=LU4jgxKrOLDN7viv7zBXYAqGlDf8h/d+te7iD4sOcMpM81amcffjpGxo
 g5xg+5kAi2QBIAw94AchF4yvaC6XzAfQDWWbiN9023PgFWGU8c6abH9aN
 Na93mZ+Z9++s6628bBlYTfWIAg12+hjsO4N2KXluFES6PKfpfzsHpbUQU
 4x7gaHJC/9GJBkDceAYIsCs97+rWIN+Nl+J1zRL5gbV9WD2ux6VmThZwR
 BxgGK710lQlIGWwumt9pMiTX+VRzbDT1ZCnMXpc9OgPjQ8Cq5CjdOwebr
 uESJ8LvU5iS3ugiza/3TYJhhJFAZmQgdqQ0T+BMxZbC07TTcgooeVKP20 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365881229"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="365881229"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="794916476"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="794916476"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.21.56])
 ([10.213.21.56])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:17:24 -0700
Message-ID: <bb22e634-03ed-7c51-8211-8fb6d5a52570@intel.com>
Date: Fri, 21 Jul 2023 12:17:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v7 5/9] drm/i915/gt: Enable the CCS_FLUSH bit
 in the pipe control
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230720210737.761400-1-andi.shyti@linux.intel.com>
 <20230720210737.761400-6-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230720210737.761400-6-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.07.2023 23:07, Andi Shyti wrote:
> Enable the CCS_FLUSH bit 13 in the control pipe for render and
> compute engines in platforms starting from Meteor Lake (BSPEC
> 43904 and 47112).
> 
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 7 +++++++
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 1 +
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 7566c89d9def3..9d050b9a19194 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -218,6 +218,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>   
> +		/*
> +		 * When required, in MTL+ platforms we need to
> +		 * set the CCS_FLUSH bit in the pipe control
> +		 */
> +		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> +


Btw, not for this patch, but related: rcs and ccs have slightly 
different set of flushes according to bspec but this functions is the 
same for both. Is it sth we should address, or just safe simplification.

Regards
Andrzej


>   		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>   		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>   		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 5d143e2a8db03..5df7cce23197c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -299,6 +299,7 @@
>   #define   PIPE_CONTROL_QW_WRITE				(1<<14)
>   #define   PIPE_CONTROL_POST_SYNC_OP_MASK                (3<<14)
>   #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> +#define   PIPE_CONTROL_CCS_FLUSH			(1<<13) /* MTL+ */
>   #define   PIPE_CONTROL_WRITE_FLUSH			(1<<12)
>   #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12) /* gen6+ */
>   #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11) /* MBZ on ILK */

