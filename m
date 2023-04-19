Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0242B6E7B8D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 16:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E45D10E9BB;
	Wed, 19 Apr 2023 14:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B497C10E9BB;
 Wed, 19 Apr 2023 14:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681913424; x=1713449424;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yQOvTRY4sROk/vs+rqjANgUZpPxBVP6uZr162wyxdfk=;
 b=B+IwhDW0cWyfZNoqdaFiaPNK3r81B/4XfVrVcVE7MazE+R45b1gn4TKf
 /dNnjw0KqkLq+01rPpfFtrTXY0pnWpG7yxXuafPKYwgIPY4ub8r8NFdId
 rS7QqdzoqiCVbpCGeyfBi3Bin9ZPU5CeL02FG0uSS6EFWFn3Xmn9bzd7S
 RHv1ts1R5vP2ZUnEmDZD3BVYd2hMTl7CJ5+yJukzuq8radZdOR8KhmSDX
 av/rLGnysIsFq6YFHT1dI8PbHGiVfOEwqlSE0Z+rUb+/g1gHYk3SfylDk
 kpuKahJ4a3uO9TjSUvNfYpBlOh6d+QKsgplAVbVBHID2xnvfjvamRMkNV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325790687"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="325790687"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 07:10:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="780869171"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="780869171"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.32.240])
 ([10.252.32.240])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 07:10:22 -0700
Message-ID: <b980f553-fc00-fd51-f858-6a38a195605b@linux.intel.com>
Date: Wed, 19 Apr 2023 16:10:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Set has_llc=0
Content-Language: en-US
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-2-fei.yang@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230417062503.1884465-2-fei.yang@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/17/2023 8:24 AM, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
>
> On MTL, GT is no longer allocated on LLC, set has_llc=0.


This statement is bit unclear to me.  I would say "On MTL, LLC is not 
shared between GT and CPU"

Otherwise

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
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
