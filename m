Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EAA55005A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 01:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393F510F80C;
	Fri, 17 Jun 2022 23:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B80510F809
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 23:08:02 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id d18so6169429ljc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 16:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6ZYaMoRyFzzdVkOyMeMhxNNQQcfk+a73MTAQKe18VZo=;
 b=RXh3EgnMC/4kWNHclXpiSul9Dc/Ob4bXsZK6inOyualZGJ4iznqD1kHoc0adcTZZnD
 L+L6W8ndCsJGT1OORGpESaqm5/p/30VgrLRgo8zT75zpmLE5F7XhS6J6Vnid+cHtpWZG
 Hb1oX53AxFwTOw+3PJdhs+aDez8q9p095mpVq6gMzrh54J1a3hXPRx/865gRmszCMxTR
 bugoa6F+cw0baRkUNVYLM675cgALD2YVe3LgDH3tWPKytzq7YDGep3PDBcAymNicXVKZ
 Dw7aIHO+SP3NEs5GBdh3pDWDxKCxruFMN1UEEyVRn3SR4BE+CF9Y4Ednvamdvd26XIqN
 HklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6ZYaMoRyFzzdVkOyMeMhxNNQQcfk+a73MTAQKe18VZo=;
 b=RtAuPokuy5JtCjpOYBFm4RV0BDPYEXOL6yMwxOnWng+7MZ4Sh7BlhILDCRblAnO7SR
 HBNF6e8T1jk+pgtDCK0H96Niy4G4hjNDVwUrviEfsRB9LnMxEKJnGN+2OpQ7yF0/5xiF
 hTQTiZxpJGKMRLtfTxH0r2Pjk+55xrLbLyJDf5xIG3Wk5Jf7+1XCbwGlTWBSVLbg4iLT
 J2HHLenvBSjXY49/7DF6ln1IVrQ3J6mWYDREDkVsHklsTPsKqvRhMAVk4l8XQgHj2EDj
 ErEo2uE18QC5X1SzrZ1zstrYuwhR3fZdeQ5niiNWnSk0D+//f5u5E7ILOwc6zWu7hZqw
 rtRA==
X-Gm-Message-State: AJIora+tl1g1HIhNN9KWpl+jNa8xo81z4f3NYCEUTZmqOwNJsgYi3PoF
 PnoFPM4T9TH4O+gYyyxlgq59SLeLpkJem5ZF
X-Google-Smtp-Source: AGRyM1u4px/R5mYa/q2Ih7N60pbaP0+87kXGXeIvKyOLQnhWdyhLroYYlme5OHm8OUgyfr0MVJVTgA==
X-Received: by 2002:a2e:80d3:0:b0:255:5c62:7614 with SMTP id
 r19-20020a2e80d3000000b002555c627614mr6140247ljg.389.1655507280420; 
 Fri, 17 Jun 2022 16:08:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a2e9f08000000b00255446b1726sm680292ljk.121.2022.06.17.16.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 16:08:00 -0700 (PDT)
Message-ID: <bb98ca29-8752-6864-ddbd-19547fb6f73b@linaro.org>
Date: Sat, 18 Jun 2022 02:07:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] drm/msm/dp: Remove pixel_rate from struct dp_ctrl
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220617204750.2347797-1-swboyd@chromium.org>
 <20220617204750.2347797-3-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220617204750.2347797-3-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 patches@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/06/2022 23:47, Stephen Boyd wrote:
> This struct member is stored to in the function that calls the function
> which uses it. That's possible with a function argument instead of
> storing to a struct member. Pass the pixel_rate as an argument instead
> to simplify the code. Note that dp_ctrl_link_maintenance() was storing
> the pixel_rate but never using it so we just remove the assignment from
> there.
> 
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 57 ++++++++++++++++----------------
>   drivers/gpu/drm/msm/dp/dp_ctrl.h |  1 -
>   2 files changed, 28 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index bd445e683cfc..e114521af2e9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1336,7 +1336,7 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
>   				name, rate);
>   }
>   
> -static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
> +static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl, unsigned long pixel_rate)


I think we can read pixel_rate here rather than getting it as an 
argument. We'd need to move handling (DP_TEST_LINK_PHY_TEST_PATTERN && 
!ctrl->panel->dp_mode.drm_mode.clock) case here from dp_ctrl_on_link().

>   {
>   	int ret = 0;
>   	struct dp_io *dp_io = &ctrl->parser->io;
> @@ -1357,25 +1357,25 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>   	if (ret)
>   		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
>   
> -	drm_dbg_dp(ctrl->drm_dev, "link rate=%d pixel_clk=%d\n",
> -		ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
> +	drm_dbg_dp(ctrl->drm_dev, "link rate=%d pixel_clk=%lu\n",
> +		ctrl->link->link_params.rate, pixel_rate);
>   
>   	return ret;
>   }
>   
> -static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
> +static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl,
> +					unsigned long pixel_rate)
>   {
> -	int ret = 0;
> +	int ret;
>   
> -	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel",
> -					ctrl->dp_ctrl.pixel_rate * 1000);
> +	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);

Note to myself (or to anybody doing further cleanup): store stream_pixel 
clock into dp_ctrl_private and set it directly here. Then 
dp_ctrl_set_clock_rate() can be removed.

>   
>   	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
>   	if (ret)
>   		DRM_ERROR("Unabled to start pixel clocks. ret=%d\n", ret);
>   
> -	drm_dbg_dp(ctrl->drm_dev, "link rate=%d pixel_clk=%d\n",
> -			ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
> +	drm_dbg_dp(ctrl->drm_dev, "link rate=%d pixel_clk=%lu\n",
> +			ctrl->link->link_params.rate, pixel_rate);
>   
>   	return ret;
>   }
> @@ -1445,7 +1445,7 @@ static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
>   	return false;
>   }
>   
> -static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
> +static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl, unsigned long pixel_rate)
>   {
>   	int ret = 0;
>   	struct dp_io *dp_io = &ctrl->parser->io;
> @@ -1469,7 +1469,7 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>   	/* hw recommended delay before re-enabling clocks */
>   	msleep(20);
>   
> -	ret = dp_ctrl_enable_mainlink_clocks(ctrl);
> +	ret = dp_ctrl_enable_mainlink_clocks(ctrl, pixel_rate);
>   	if (ret) {
>   		DRM_ERROR("Failed to enable mainlink clks. ret=%d\n", ret);
>   		return ret;
> @@ -1517,8 +1517,6 @@ static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
>   	ctrl->link->phy_params.p_level = 0;
>   	ctrl->link->phy_params.v_level = 0;
>   
> -	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> -
>   	ret = dp_ctrl_setup_main_link(ctrl, &training_step);
>   	if (ret)
>   		goto end;
> @@ -1588,12 +1586,12 @@ static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
>   {
>   	int ret;
>   	struct dp_ctrl_private *ctrl;
> +	unsigned long pixel_rate;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>   
> -	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> -
> -	ret = dp_ctrl_enable_stream_clocks(ctrl);
> +	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> +	ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);

I think we can take another step forward here. Read the 
ctrl->panel->dp_mode.drm_mode.clock from within the 
dp_ctrl_enable_stream_clocks() function. This removes the need to pass 
pixel_rate as an argument here.

>   	if (ret) {
>   		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>   		return ret;
> @@ -1709,6 +1707,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>   	u32 const phy_cts_pixel_clk_khz = 148500;
>   	u8 link_status[DP_LINK_STATUS_SIZE];
>   	unsigned int training_step;
> +	unsigned long pixel_rate;
>   
>   	if (!dp_ctrl)
>   		return -EINVAL;
> @@ -1723,25 +1722,25 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>   		drm_dbg_dp(ctrl->drm_dev,
>   				"using phy test link parameters\n");
>   		if (!ctrl->panel->dp_mode.drm_mode.clock)
> -			ctrl->dp_ctrl.pixel_rate = phy_cts_pixel_clk_khz;
> +			pixel_rate = phy_cts_pixel_clk_khz;
>   	} else {
>   		ctrl->link->link_params.rate = rate;
>   		ctrl->link->link_params.num_lanes =
>   			ctrl->panel->link_info.num_lanes;
> -		ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> +		pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>   	}
>   
> -	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
>   		ctrl->link->link_params.rate, ctrl->link->link_params.num_lanes,
> -		ctrl->dp_ctrl.pixel_rate);
> +		pixel_rate);
>   
>   
> -	rc = dp_ctrl_enable_mainlink_clocks(ctrl);
> +	rc = dp_ctrl_enable_mainlink_clocks(ctrl, pixel_rate);
>   	if (rc)
>   		return rc;
>   
>   	while (--link_train_max_retries) {
> -		rc = dp_ctrl_reinitialize_mainlink(ctrl);
> +		rc = dp_ctrl_reinitialize_mainlink(ctrl, pixel_rate);
>   		if (rc) {
>   			DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n",
>   					rc);
> @@ -1836,6 +1835,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   	int ret = 0;
>   	bool mainlink_ready = false;
>   	struct dp_ctrl_private *ctrl;
> +	unsigned long pixel_rate;
>   	unsigned long pixel_rate_orig;
>   
>   	if (!dp_ctrl)
> @@ -1843,25 +1843,24 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>   
> -	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> +	pixel_rate = pixel_rate_orig = ctrl->panel->dp_mode.drm_mode.clock;
>   
> -	pixel_rate_orig = ctrl->dp_ctrl.pixel_rate;
>   	if (dp_ctrl->wide_bus_en)
> -		ctrl->dp_ctrl.pixel_rate >>= 1;
> +		pixel_rate >>= 1;
>   
> -	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
>   		ctrl->link->link_params.rate,
> -		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
> +		ctrl->link->link_params.num_lanes, pixel_rate);
>   
>   	if (!dp_power_clk_status(ctrl->power, DP_CTRL_PM)) { /* link clk is off */
> -		ret = dp_ctrl_enable_mainlink_clocks(ctrl);
> +		ret = dp_ctrl_enable_mainlink_clocks(ctrl, pixel_rate);
>   		if (ret) {
>   			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
>   			goto end;
>   		}
>   	}
>   
> -	ret = dp_ctrl_enable_stream_clocks(ctrl);
> +	ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
>   	if (ret) {
>   		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>   		goto end;
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index b563e2e3bfe5..9f29734af81c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -16,7 +16,6 @@
>   struct dp_ctrl {
>   	bool orientation;
>   	atomic_t aborted;
> -	u32 pixel_rate;
>   	bool wide_bus_en;
>   };
>   


-- 
With best wishes
Dmitry
