Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BF9A1A420
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 13:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A8410E0E5;
	Thu, 23 Jan 2025 12:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fT0z0cBL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F8E10E0E5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 12:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737635153; x=1769171153;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y9y2JiSrLOPvXTWHcZparjJwT3r8iLZ2GoulTbz9w5s=;
 b=fT0z0cBLgc3YJECpU0RWf+GQ4FvIoEQDS7c/Pkom5/mWNc7bWJmpFITp
 7k19EB24TcHB3ZMOLUixk3RKfpSkT4i+i+ds7d3CGG+8Cdb6ZmQ59TizR
 9dwjn0exjYCdy8y9Faq4dJla7Jcmq8IjiCSd63tdo9ulg8oR6MEjRlwax
 BeDhHi9ooIyDlfM2Ov2s/1R5T2QWPQch9nI0V18ZK1jXg3WbhicBGQqRn
 do/DtaVDExfhmw4XeyH2nyfRQAdwI6FhLMQ92BFjst0NoWCXV83m4uLWL
 Px2PSycHEpQCjPSs6bIiJhK51fU/uf3T19dounh2yssnGEW7EG+k676C1 w==;
X-CSE-ConnectionGUID: MxIYf8bESByBAALv56QcyQ==
X-CSE-MsgGUID: bOGlC5aJQlWSIfBamMqGqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37336132"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="37336132"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 04:25:41 -0800
X-CSE-ConnectionGUID: LAR+3lOGQqq3l5CRJiaT5Q==
X-CSE-MsgGUID: tzHN9lx5QzuLvdBtxS/HRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111462249"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 04:25:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Damon Ding
 <damon.ding@rock-chips.com>
Subject: Re: [PATCH v6 01/14] drm/rockchip: analogix_dp: Replace DRM_...()
 functions with drm_...()
In-Reply-To: <20250123100747.1841357-2-damon.ding@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-2-damon.ding@rock-chips.com>
Date: Thu, 23 Jan 2025 14:25:29 +0200
Message-ID: <87ikq5n2di.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 23 Jan 2025, Damon Ding <damon.ding@rock-chips.com> wrote:
> According to the comments in include/drm/drm_print.h, the DRM_...()
> functions are deprecated in favor of drm_...() or dev_...() functions.
>
> Use drm_err()/drm_dbg_core()/drm_dbg_kms() instead of
> DRM_DEV_ERROR()/DRM_ERROR()/DRM_DEV_DEBUG()/DRM_DEBUG_KMS().
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>
> ---
>
> Changes in v6:
> - Use drm_...() uniformly rather than mixing drm_...() and dev_..()
> - Pass 'dp' in drm_...() rather than 'dp->drm_dev'
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 29 ++++++++++---------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 0844175c37c5..dd33d7540e4b 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -100,13 +100,13 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
>  
>  	ret = clk_prepare_enable(dp->pclk);
>  	if (ret < 0) {
> -		DRM_DEV_ERROR(dp->dev, "failed to enable pclk %d\n", ret);
> +		drm_err(dp, "failed to enable pclk %d\n", ret);

Please don't do this.

You're supposed to pass struct drm_device to drm_err() and friends. Not
some random struct pointer that just happens to have a ->dev member.

The drm_* macros may change at any time to actually expect the correct
type.

BR,
Jani.


>  		return ret;
>  	}
>  
>  	ret = rockchip_dp_pre_init(dp);
>  	if (ret < 0) {
> -		DRM_DEV_ERROR(dp->dev, "failed to dp pre init %d\n", ret);
> +		drm_err(dp, "failed to dp pre init %d\n", ret);
>  		clk_disable_unprepare(dp->pclk);
>  		return ret;
>  	}
> @@ -126,12 +126,13 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>  static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
>  				 struct drm_connector *connector)
>  {
> +	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
>  	struct drm_display_info *di = &connector->display_info;
>  	/* VOP couldn't output YUV video format for eDP rightly */
>  	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
>  
>  	if ((di->color_formats & mask)) {
> -		DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
> +		drm_dbg_kms(dp, "Swapping display color format from YUV to RGB\n");
>  		di->color_formats &= ~mask;
>  		di->color_formats |= DRM_COLOR_FORMAT_RGB444;
>  		di->bpc = 8;
> @@ -201,17 +202,17 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
>  	else
>  		val = dp->data->lcdsel_big;
>  
> -	DRM_DEV_DEBUG(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
> +	drm_dbg_core(dp, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
>  
>  	ret = clk_prepare_enable(dp->grfclk);
>  	if (ret < 0) {
> -		DRM_DEV_ERROR(dp->dev, "failed to enable grfclk %d\n", ret);
> +		drm_err(dp, "failed to enable grfclk %d\n", ret);
>  		return;
>  	}
>  
>  	ret = regmap_write(dp->grf, dp->data->lcdsel_grf_reg, val);
>  	if (ret != 0)
> -		DRM_DEV_ERROR(dp->dev, "Could not write to GRF: %d\n", ret);
> +		drm_err(dp, "Could not write to GRF: %d\n", ret);
>  
>  	clk_disable_unprepare(dp->grfclk);
>  }
> @@ -236,7 +237,7 @@ static void rockchip_dp_drm_encoder_disable(struct drm_encoder *encoder,
>  
>  	ret = rockchip_drm_wait_vact_end(crtc, PSR_WAIT_LINE_FLAG_TIMEOUT_MS);
>  	if (ret)
> -		DRM_DEV_ERROR(dp->dev, "line flag irq timed out\n");
> +		drm_err(dp, "line flag irq timed out\n");
>  }
>  
>  static int
> @@ -277,7 +278,7 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>  
>  	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
>  	if (IS_ERR(dp->grf)) {
> -		DRM_DEV_ERROR(dev, "failed to get rockchip,grf property\n");
> +		drm_err(dp, "failed to get rockchip,grf property\n");
>  		return PTR_ERR(dp->grf);
>  	}
>  
> @@ -287,19 +288,19 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>  	} else if (PTR_ERR(dp->grfclk) == -EPROBE_DEFER) {
>  		return -EPROBE_DEFER;
>  	} else if (IS_ERR(dp->grfclk)) {
> -		DRM_DEV_ERROR(dev, "failed to get grf clock\n");
> +		drm_err(dp, "failed to get grf clock\n");
>  		return PTR_ERR(dp->grfclk);
>  	}
>  
>  	dp->pclk = devm_clk_get(dev, "pclk");
>  	if (IS_ERR(dp->pclk)) {
> -		DRM_DEV_ERROR(dev, "failed to get pclk property\n");
> +		drm_err(dp, "failed to get pclk property\n");
>  		return PTR_ERR(dp->pclk);
>  	}
>  
>  	dp->rst = devm_reset_control_get(dev, "dp");
>  	if (IS_ERR(dp->rst)) {
> -		DRM_DEV_ERROR(dev, "failed to get dp reset control\n");
> +		drm_err(dp, "failed to get dp reset control\n");
>  		return PTR_ERR(dp->rst);
>  	}
>  
> @@ -315,12 +316,12 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
>  
>  	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
>  							     dev->of_node);
> -	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
> +	drm_dbg_kms(dp, "possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>  
>  	ret = drm_simple_encoder_init(drm_dev, encoder,
>  				      DRM_MODE_ENCODER_TMDS);
>  	if (ret) {
> -		DRM_ERROR("failed to initialize encoder with drm\n");
> +		drm_err(dp, "failed to initialize encoder with drm\n");
>  		return ret;
>  	}
>  
> @@ -340,7 +341,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>  
>  	ret = rockchip_dp_drm_create_encoder(dp);
>  	if (ret) {
> -		DRM_ERROR("failed to create drm encoder\n");
> +		drm_err(dp, "failed to create drm encoder\n");
>  		return ret;
>  	}

-- 
Jani Nikula, Intel
