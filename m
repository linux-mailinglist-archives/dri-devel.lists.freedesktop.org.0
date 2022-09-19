Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FA55BD274
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 18:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0514210E6A7;
	Mon, 19 Sep 2022 16:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689BF10E695;
 Mon, 19 Sep 2022 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663606185; x=1695142185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x6TrmVfvxKdbypOq1IL/oVkoC1TWKIBsGf+zZFx9FQM=;
 b=ihi3z4GWq5i5CUZWQVDPHfKcIZ1u7oHQ61L1nsiQyRGz5VYYVihBfrMe
 rdciIpjeIlggg2lOI87MmaFCQjZjxcmIJwkh8jkeLPCEhS01dkolxGwZH
 5I6vjmKSX3+0I2w4fW9PI0XycvSouuCqO3hwE7J5QB7wdlkb5Y1bn2gAv
 hVG53wyzvq503/oYb6TSOr+YfwA5qEmkQtNBMIHu6+1+sqrzBWX1hEad4
 5X4wlt9nPbSf6uapCazFu0ogJ9qoZdoVFSPqdwj3PSlGc71kLwgeHTq2+
 YpCXMJja74b6pk7mXZgNaPMGnDyXDJFVuoEIme4U91oZkxKfQezs/KBFL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="300827949"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="300827949"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 09:49:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="687045844"
Received: from menz-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.61.69])
 by fmsmga004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 09:49:12 -0700
Date: Mon, 19 Sep 2022 18:49:07 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/mtl: Modify CAGF functions for
 MTL
Message-ID: <YyidgzOwS5CT+RVN@alfio.lan>
References: <20220919115906.1264041-1-badal.nilawar@intel.com>
 <20220919115906.1264041-2-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919115906.1264041-2-badal.nilawar@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Badal,

On Mon, Sep 19, 2022 at 05:29:05PM +0530, Badal Nilawar wrote:
> Updated the CAGF functions to get actual resolved frequency of
> 3D and SAMedia

can you please use the imperative form? "Update" and not
"Updated".

Besides I don't really understand what you did from the
commit, can you please bea  bit more descriptive?

> Bspec: 66300
> 
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h | 8 ++++++++
>  drivers/gpu/drm/i915/gt/intel_rps.c     | 6 +++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 2275ee47da95..7819d32db956 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1510,6 +1510,14 @@
>  #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
>  #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
>  
> +/*
> + * MTL: Workpoint reg to get Core C state and act freq of 3D, SAMedia/
> + * 3D - 0x0C60 , SAMedia - 0x380C60
> + * Intel uncore handler redirects transactions for SAMedia to MTL_MEDIA_GSI_BASE
> + */

This comment is not understandable... we don't have limits in
space, you can be a bit more explicit :)

Andi

> +#define MTL_MIRROR_TARGET_WP1          _MMIO(0x0C60)
> +#define   MTL_CAGF_MASK                REG_GENMASK(8, 0)
> +
>  #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>  #define   GEN11_CSME				(31)
>  #define   GEN11_GUNIT				(28)
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 17b40b625e31..c2349949ebae 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2075,6 +2075,8 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
>  
>  	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
>  		cagf = (rpstat >> 8) & 0xff;
> +	else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +		cagf = rpstat & MTL_CAGF_MASK;
>  	else if (GRAPHICS_VER(i915) >= 9)
>  		cagf = (rpstat & GEN9_CAGF_MASK) >> GEN9_CAGF_SHIFT;
>  	else if (IS_HASWELL(i915) || IS_BROADWELL(i915))
> @@ -2098,7 +2100,9 @@ static u32 read_cagf(struct intel_rps *rps)
>  		vlv_punit_get(i915);
>  		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
>  		vlv_punit_put(i915);
> -	} else if (GRAPHICS_VER(i915) >= 6) {
> +	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +		freq = intel_uncore_read(rps_to_gt(rps)->uncore, MTL_MIRROR_TARGET_WP1);
> +	else if (GRAPHICS_VER(i915) >= 6) {
>  		freq = intel_uncore_read(uncore, GEN6_RPSTAT1);
>  	} else {
>  		freq = intel_uncore_read(uncore, MEMSTAT_ILK);
> -- 
> 2.25.1
