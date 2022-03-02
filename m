Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0E54C99C7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD40889EBD;
	Wed,  2 Mar 2022 00:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C4689EBD;
 Wed,  2 Mar 2022 00:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646180289; x=1677716289;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jFnqVQRqiC8aoc1lHH90eCtahq0D/mBKHDCvYou20OY=;
 b=YUwaV2YfoQ7PJ7May+rDsujM+Ik9Xlu0916IW61GaYNLqRpxk0Xglpxi
 I2zQTEiJ0rkBa7mX9aBdV6s1P7cT5Gx1TLnKtpeElC72bf1do9bbXKBxj
 1wZllrLDDdq7BWMdFU68+iZTcNg1g0Jl0pSkYZFvkkJlBe4SMg3r+khY6
 5zgR9Wrqt3l8nZgdTDTEw2kefZ4TvFVjMzCI4ATJIIZUnYVeYUc5LeW0z
 21dbKBz+Y5HZ4gJMNKieUw3rvFXi6vMzJ301vtfXdvCLIuVu8oXJSv510
 mMpnSpG06uZmwZaarXS/XruvpdneXTRtS9dAf0rHU6mgrwLAtM+GMFyca Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="250850619"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="250850619"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 16:18:08 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="806111271"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 16:18:08 -0800
Date: Tue, 1 Mar 2022 16:18:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 09/13] drm/i915/xehp/guc: enable compute engine inside
 GuC
Message-ID: <Yh63v7JoeHqO047A@mdroper-desk1.amr.corp.intel.com>
References: <20220301231549.1817978-1-matthew.d.roper@intel.com>
 <20220301231549.1817978-10-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301231549.1817978-10-matthew.d.roper@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 01, 2022 at 03:15:45PM -0800, Matt Roper wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Tell GuC that CCS is enabled by setting a bit in its ADS.
> 
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Original-author: Michel Thierry
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 29fbe4681ca7..9bb551b83e7a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -434,6 +434,7 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
>  				     struct iosys_map *info_map)
>  {
>  	info_map_write(info_map, engine_enabled_masks[GUC_RENDER_CLASS], 1);
> +	info_map_write(info_map, engine_enabled_masks[GUC_COMPUTE_CLASS], CCS_MASK(gt));
>  	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], 1);
>  	info_map_write(info_map, engine_enabled_masks[GUC_VIDEO_CLASS], VDBOX_MASK(gt));
>  	info_map_write(info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS], VEBOX_MASK(gt));
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
