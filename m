Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B706A1A42F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 13:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C424710E040;
	Thu, 23 Jan 2025 12:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBiZvlJ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB15A10E040
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 12:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737635278; x=1769171278;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=87QOxN9grVOib/hH+LM5POuv8keCENLQWQeF7hQcDdE=;
 b=VBiZvlJ+ZGSAAg6eiow7sX+MaXyYC9/uNavXxVgNB5bek6U7xSwU9PIj
 m9q9WbRVRRBN5OoQQry4O8IqMndPFO63qVIibGHbbkma702I3/ZzcJPem
 UABDok1Z4XR96qqcRFLh1mgZjACyeV7FW1tkND2/6peSotxRhvIsXLCy6
 yUB/VdTLDJ7FChRwoa3lEAS/cmVPtKoPIjQyz64wrXf5m07uDI1Y8fwkO
 dbNtz/q/r/MTUXY/qnEW5zA7YdVkE5xay4Gg5t9FzWCEqWYJin/qXGcwK
 IBa3aRf61nHvIn0BuR/L2BDYsbe92j9u/6KqnSKQ1fgprqY6BeyXVO7vN g==;
X-CSE-ConnectionGUID: vVMh5pPjRzuy/DUNqb33ag==
X-CSE-MsgGUID: mw16H56YSpqO7AbThVRgXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38010311"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="38010311"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 04:27:58 -0800
X-CSE-ConnectionGUID: 1EnuViEfSL+CW2HULfQNsw==
X-CSE-MsgGUID: NwuHjsrQSyazuHsNRTEbDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="112440338"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 04:27:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Damon Ding <damon.ding@rock-chips.com>, Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, dmitry.baryshkov@linaro.org,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 05/20] drm/rockchip: analogix_dp: Replace DRM_...()
 functions with drm_...() or dev_...()
In-Reply-To: <a8bee693-cbde-469d-abcf-363311cfd904@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-6-damon.ding@rock-chips.com>
 <40b09942.533e.19449c023a1.Coremail.andyshrk@163.com>
 <a8bee693-cbde-469d-abcf-363311cfd904@rock-chips.com>
Date: Thu, 23 Jan 2025 14:27:50 +0200
Message-ID: <87ed0tn29l.fsf@intel.com>
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

On Wed, 22 Jan 2025, Damon Ding <damon.ding@rock-chips.com> wrote:
> Hi Andy,
>
> On 2025/1/9 14:28, Andy Yan wrote:
>> 
>> Hi Damon,
>> 
>> At 2025-01-09 11:27:10, "Damon Ding" <damon.ding@rock-chips.com> wrote:
>>> According to the comments in include/drm/drm_print.h, the DRM_...()
>>> functions are deprecated in favor of drm_...() or dev_...() functions.
>>>
>>> Use drm_err()/drm_dbg_core()/drm_dbg_kms() instead of
>>> DRM_DEV_ERROR()/DRM_ERROR()/DRM_DEV_DEBUG()/DRM_DEBUG_KMS() after
>>> rockchip_dp_bind() is called, and replace DRM_DEV_ERROR() with dev_err()
>>> before calling it.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> ---
>>> .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 29 ++++++++++---------
>>> 1 file changed, 15 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> index 546d13f19f9b..8114c3238609 100644
>>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> @@ -100,13 +100,13 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
>>>
>>> 	ret = clk_prepare_enable(dp->pclk);
>>> 	if (ret < 0) {
>>> -		DRM_DEV_ERROR(dp->dev, "failed to enable pclk %d\n", ret);
>>> +		drm_err(dp->drm_dev, "failed to enable pclk %d\n", ret);
>> 
>>                 You just need to pass dp here:
>>                  drm_err(dp, "failed to enable pclk %d\n", ret);
>> 
>
> I see. It is really better to pass dp instead of dp->drm_dev. I will 
> update all relevant logs in the next version.

No, this was bad review feedback. You're absolutely expected to pass
struct drm_device to drm_err() and friends.

BR,
Jani.


>
>>> 		return ret;
>>> 	}
>>>
>>> 	ret = rockchip_dp_pre_init(dp);
>>> 	if (ret < 0) {
>>> -		DRM_DEV_ERROR(dp->dev, "failed to dp pre init %d\n", ret);
>>> +		drm_err(dp->drm_dev, "failed to dp pre init %d\n", ret);
>>> 		clk_disable_unprepare(dp->pclk);
>>> 		return ret;
>>> 	}
>>> @@ -126,12 +126,13 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>>> static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
>>> 				 struct drm_connector *connector)
>>> {
>>> +	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
>>> 	struct drm_display_info *di = &connector->display_info;
>>> 	/* VOP couldn't output YUV video format for eDP rightly */
>>> 	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
>>>
>>> 	if ((di->color_formats & mask)) {
>>> -		DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
>>> +		drm_dbg_kms(dp->drm_dev, "Swapping display color format from YUV to RGB\n");
>>> 		di->color_formats &= ~mask;
>>> 		di->color_formats |= DRM_COLOR_FORMAT_RGB444;
>>> 		di->bpc = 8;
>>> @@ -201,17 +202,17 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
>>> 	else
>>> 		val = dp->data->lcdsel_big;
>>>
>>> -	DRM_DEV_DEBUG(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
>>> +	drm_dbg_core(dp->drm_dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
>>>
>>> 	ret = clk_prepare_enable(dp->grfclk);
>>> 	if (ret < 0) {
>>> -		DRM_DEV_ERROR(dp->dev, "failed to enable grfclk %d\n", ret);
>>> +		drm_err(dp->drm_dev, "failed to enable grfclk %d\n", ret);
>>> 		return;
>>> 	}
>>>
>>> 	ret = regmap_write(dp->grf, dp->data->lcdsel_grf_reg, val);
>>> 	if (ret != 0)
>>> -		DRM_DEV_ERROR(dp->dev, "Could not write to GRF: %d\n", ret);
>>> +		drm_err(dp->drm_dev, "Could not write to GRF: %d\n", ret);
>>>
>>> 	clk_disable_unprepare(dp->grfclk);
>>> }
>>> @@ -236,7 +237,7 @@ static void rockchip_dp_drm_encoder_disable(struct drm_encoder *encoder,
>>>
>>> 	ret = rockchip_drm_wait_vact_end(crtc, PSR_WAIT_LINE_FLAG_TIMEOUT_MS);
>>> 	if (ret)
>>> -		DRM_DEV_ERROR(dp->dev, "line flag irq timed out\n");
>>> +		drm_err(dp->drm_dev, "line flag irq timed out\n");
>>> }
>>>
>>> static int
>>> @@ -277,7 +278,7 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>>>
>>> 	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
>>> 	if (IS_ERR(dp->grf)) {
>>> -		DRM_DEV_ERROR(dev, "failed to get rockchip,grf property\n");
>>> +		dev_err(dev, "failed to get rockchip,grf property\n");
>>> 		return PTR_ERR(dp->grf);
>>> 	}
>>>
>>> @@ -287,19 +288,19 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>>> 	} else if (PTR_ERR(dp->grfclk) == -EPROBE_DEFER) {
>>> 		return -EPROBE_DEFER;
>>> 	} else if (IS_ERR(dp->grfclk)) {
>>> -		DRM_DEV_ERROR(dev, "failed to get grf clock\n");
>>> +		dev_err(dev, "failed to get grf clock\n");
>>> 		return PTR_ERR(dp->grfclk);
>>> 	}
>>>
>>> 	dp->pclk = devm_clk_get(dev, "pclk");
>>> 	if (IS_ERR(dp->pclk)) {
>>> -		DRM_DEV_ERROR(dev, "failed to get pclk property\n");
>>> +		dev_err(dev, "failed to get pclk property\n");
>>> 		return PTR_ERR(dp->pclk);
>>> 	}
>>>
>>> 	dp->rst = devm_reset_control_get(dev, "dp");
>>> 	if (IS_ERR(dp->rst)) {
>>> -		DRM_DEV_ERROR(dev, "failed to get dp reset control\n");
>>> +		dev_err(dev, "failed to get dp reset control\n");
>>> 		return PTR_ERR(dp->rst);
>>> 	}
>>>
>>> @@ -315,12 +316,12 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
>>>
>>> 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
>>> 							     dev->of_node);
>>> -	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>>> +	drm_dbg_kms(drm_dev, "possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>>>
>>> 	ret = drm_simple_encoder_init(drm_dev, encoder,
>>> 				      DRM_MODE_ENCODER_TMDS);
>>> 	if (ret) {
>>> -		DRM_ERROR("failed to initialize encoder with drm\n");
>>> +		drm_err(drm_dev, "failed to initialize encoder with drm\n");
>>> 		return ret;
>>> 	}
>>>
>>> @@ -340,7 +341,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>>>
>>> 	ret = rockchip_dp_drm_create_encoder(dp);
>>> 	if (ret) {
>>> -		DRM_ERROR("failed to create drm encoder\n");
>>> +		drm_err(drm_dev, "failed to create drm encoder\n");
>>> 		return ret;
>>> 	}
>>>
>>> -- 
>>> 2.34.1
>>>
>
> Best regards,
> Damon

-- 
Jani Nikula, Intel
