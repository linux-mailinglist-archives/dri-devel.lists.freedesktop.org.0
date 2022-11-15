Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB2062962E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 11:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD8310E136;
	Tue, 15 Nov 2022 10:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0343A10E136;
 Tue, 15 Nov 2022 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668509165; x=1700045165;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=GAzeVYNqTVR4g0BVB/ZRiNkns4SFmJ801P/q/wtkW4A=;
 b=RDtymIc6oOPQvvWVLnQGVtyZnMnsQwOeoykxc2g6jUZ2tITjverW88XF
 RZGRDL/CPZ8sB3CvVB/vlgXHgauTpbk6puxBjJpUuHs5s0tWZHmU5NBf3
 aHiPMkVrN++cJd/mOBJMOjdfhxSccbkSm8beVegxSRMxDQV/4RvDHBfXp
 XW/I+FAZjTLblcRbtE2Bfejl4t6JDfH78YZR5db7tmWfpPr5h4m/ogUg1
 dITrYzNdHF8c5/KsPWnAjtpk1PC8n7lFZu+HqcUeocr30X96ShlOcktKm
 CQAYR3st3rO1ehBZN182Zk+BG023Kx8U+MYK8ntpYmkoygFsCHJPKucOG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="309849916"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; d="scan'208";a="309849916"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 02:46:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="744541096"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; d="scan'208";a="744541096"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.26.97])
 ([10.213.26.97])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 02:46:03 -0800
Message-ID: <60b1a6aa-f3f4-06c0-01af-409fa378c747@intel.com>
Date: Tue, 15 Nov 2022 11:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix vma allocator debug
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221115101730.394880-1-tvrtko.ursulin@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221115101730.394880-1-tvrtko.ursulin@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15.11.2022 11:17, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Add a missing colon which I accidentally removed in the recent logging
> changes.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: a10234fda466 ("drm/i915: Partial abandonment of legacy DRM logging macros")
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/i915_vma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 3b969d679c1e..947fde68e5f5 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -73,7 +73,7 @@ static void vma_print_allocator(struct i915_vma *vma, const char *reason)
>   	char buf[512];
>   
>   	if (!vma->node.stack) {
> -		drm_dbg(&to_i915(vma->obj->base.dev)->drm
> +		drm_dbg(&to_i915(vma->obj->base.dev)->drm,
>   			"vma.node [%08llx + %08llx] %s: unknown owner\n",
>   			vma->node.start, vma->node.size, reason);
>   		return;

