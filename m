Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278CD6EDB99
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 08:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE1310E67E;
	Tue, 25 Apr 2023 06:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC35110E67E;
 Tue, 25 Apr 2023 06:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682403931; x=1713939931;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UlJU8GtcmapKDIHm1T1/Sr7ITIBa2YrtEJeOAJpSeSg=;
 b=HMsNZBEP80ntQ1YXL+ye67iZC0aNZQNxtGSTb6ht49ZbpwGxAHLW9CL8
 LGGckLuBL6Rrpv9YusmxNOFQTC+tYCVXDvixc947PhwGXIhzOIablJk7z
 6vFxMEJHwuxIzTMfFIg7fMSM+rCYShaYW4MBMw+yssiHP+4jRX73WW2MW
 TK1ClOeUBLYwTZ8WYQoaDNrw6eYvMtfpjNoU+9/emas6OT+DqsAtyzrUw
 4ESbuB+hdiJTHPZJxLIVFSXhdXEpeBT61fMBy1fZFOSzVwbVC4EdKZt7Y
 ZEGjS4wHidz4W6mxpd6+TVYHxuWhew9w9Y2n2JgDSzvTaK1sJfgHVV5Kk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="335568368"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; d="scan'208";a="335568368"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 23:25:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="643660347"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; d="scan'208";a="643660347"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.19.44])
 ([10.213.19.44])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 23:25:28 -0700
Message-ID: <7973f765-5528-f0da-dab9-567277e266da@intel.com>
Date: Tue, 25 Apr 2023 08:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 1/2] Revert "drm/i915/mtl: fix mocs selftest"
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>
References: <20230424160913.19886-1-andi.shyti@linux.intel.com>
 <20230424160913.19886-2-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230424160913.19886-2-andi.shyti@linux.intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas Martins De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.04.2023 18:09, Andi Shyti wrote:
> This reverts commit faca6aaa4838c3c234caa619d3c7d1f09da0d303.
> 
> This patch, in series with the next "Define MOCS and PAT tables
> for MTL" are causing boot failures for MTL.
> 
> Revert them both.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/i915/gt/selftest_mocs.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> index a8446ab825012..ca009a6a13bdb 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> @@ -131,14 +131,13 @@ static int read_mocs_table(struct i915_request *rq,
>   			   const struct drm_i915_mocs_table *table,
>   			   u32 *offset)
>   {
> -	struct intel_gt *gt = rq->engine->gt;
>   	u32 addr;
>   
>   	if (!table)
>   		return 0;
>   
>   	if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
> -		addr = global_mocs_offset() + gt->uncore->gsi_offset;
> +		addr = global_mocs_offset();
>   	else
>   		addr = mocs_offset(rq->engine);
>   

