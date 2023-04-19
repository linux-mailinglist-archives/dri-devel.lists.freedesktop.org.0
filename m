Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2309C6E79FA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 14:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0353810E973;
	Wed, 19 Apr 2023 12:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71FE10E96B;
 Wed, 19 Apr 2023 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681908628; x=1713444628;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=v861K8LqWWNhULxDefWe8jsVxNmsKrP44WquhL4AECg=;
 b=gaOS6KwDhxH0HAVYrUwctHKJ4OyS4CD6PZGDyq+NEXxWjKx3BfccH0l1
 O1MD0OxNilAi83nd6cdv9kPom+nEzZEnb4uKeq8tQkzFq3Pl7ruoQgv7l
 3ch1fIPJsOEGO9P/rufrQ68j0qIDQOvVED3HR0MpweE/pudn3gL9QWUxh
 klUR4hdDPlQe47cJoRfdyylenjXTxZcIaWfwIHALcLqqv84DV167t4RfB
 wJKau4MRr7dzVjH14IKghHdYv6mxuKsYsfPZvvvNJNGciLcVAg2QT5m0R
 PtKRvIGc9qVWeiidj/cvSkvpobYaNaAtllMVuFm7ICtoMlVy1NjPZGWzR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347291177"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="347291177"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760729201"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="760729201"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.18.145])
 ([10.213.18.145])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:50:24 -0700
Message-ID: <27230221-53f1-8764-a32e-b9cb86447d0d@intel.com>
Date: Wed, 19 Apr 2023 14:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Set has_llc=0
Content-Language: en-US
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-2-fei.yang@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230417062503.1884465-2-fei.yang@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.04.2023 08:24, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> On MTL, GT is no longer allocated on LLC, set has_llc=0.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/i915/i915_pci.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index cddb6e197972..025d32c0b161 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1146,6 +1146,7 @@ static const struct intel_device_info mtl_info = {
>   	.has_flat_ccs = 0,
>   	.has_gmd_id = 1,
>   	.has_guc_deprivilege = 1,
> +	.has_llc = 0,
>   	.has_mslice_steering = 0,
>   	.has_snoop = 1,
>   	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,

