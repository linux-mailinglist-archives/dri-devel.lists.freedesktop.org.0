Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA33550032
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 00:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE5710EF7B;
	Fri, 17 Jun 2022 22:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FAA10EF7B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 22:50:20 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id a29so8935182lfk.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 15:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xOxkF4mzeYd1/+qHSn88D6dzTW2RY4MuLGzz276BBWI=;
 b=q3KoGTIiJaI8clsa4c1ULBUqNwFn85K8GrBZS94T8WSePXvIt6Kv4irUSQ6LRchwSy
 U31y2j3v5RLYshU0GD2pVEryFHf0FzBrdfC92zhwiClFbRNeO8pvUazKliUl9PkitCCX
 XSy+9pb2Rw7qbPoBbYKLsTtnFhH8nQtW/j163QaDo4KPnjMB/fi2eOomoPYcnXO/NOOQ
 lhkO4HZBpIkaFAH8FimyyyoQsto2Uzq2NfHBfr5FA5NWfOZ5fd2py+NLoTpva4b41ro2
 4CR8biFvWt6yRtfwVqbTGgXhkDq+x0f3HNKJFUxp5jItWeF28yDucUP2dhJIcBMHi3rO
 yLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xOxkF4mzeYd1/+qHSn88D6dzTW2RY4MuLGzz276BBWI=;
 b=6Iews9M98DnDLoBOsl79/+lTzIvwsXYp/okAShoqFESWr295jr48+k73gz8boAGBb1
 0A4qdq8KaqtnLPAqHpyvuOhMcQjwR02kgryvt9HqzA8Z2FKICiE9nMrKwQDsKW/x4kFL
 hjjeYJiZzJHvrZWLA2m58WphWVtMXe2iEZbzfR/0zoDDxrXr+FG9beA4fY4XY6eLH/jN
 W+OJA7M6yGmdX8h6HXgUPbdlKEdYGPlv3FSUZbqzhr0HWdlv7pyduGeto4TSBRJdeSs3
 S+USDdBxwjQB0tA/gtWWhzm78NUjVxHkSgIoJMAaIiPC49iLwOxXTt8UnGYcZ3+xGQsQ
 HqYA==
X-Gm-Message-State: AJIora90I0SEuae8ErkW0IGkUAjvNLR0pPnGyc3s70h9pyDifYg4eOne
 Y2aDSM5p7HqkshcNTVIBFqMJ/Q==
X-Google-Smtp-Source: AGRyM1sbhZsF9OvwGOTigG+v3++nQ+M6/Hvpvsg/tOgLGXFwRYDF8Hd3y4QNNmjUVwmb6jT/u5EXIg==
X-Received: by 2002:a05:6512:3081:b0:47e:da1e:725f with SMTP id
 z1-20020a056512308100b0047eda1e725fmr6886324lfd.176.1655506217824; 
 Fri, 17 Jun 2022 15:50:17 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a056512201300b0047d479884b8sm796969lfb.27.2022.06.17.15.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 15:50:17 -0700 (PDT)
Message-ID: <ddddcb1d-46c6-4903-3a8a-83bc96ece159@linaro.org>
Date: Sat, 18 Jun 2022 01:50:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] drm/msm/dp: Reorganize code to avoid forward
 declaration
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220617204750.2347797-1-swboyd@chromium.org>
 <20220617204750.2347797-2-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220617204750.2347797-2-swboyd@chromium.org>
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
> Let's move these functions around to avoid having to forward declare
> dp_ctrl_on_stream_phy_test_report(). Also remove
> dp_ctrl_reinitialize_mainlink() forward declaration because we're doing
> that sort of task.
> 
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 104 +++++++++++++++----------------
>   1 file changed, 50 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 703249384e7c..bd445e683cfc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1238,8 +1238,6 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>   	return -ETIMEDOUT;
>   }
>   
> -static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl);
> -
>   static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>   			int *training_step)
>   {
> @@ -1534,38 +1532,6 @@ static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
>   	return ret;
>   }
>   
> -static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl);
> -
> -static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
> -{
> -	int ret = 0;
> -
> -	if (!ctrl->link->phy_params.phy_test_pattern_sel) {
> -		drm_dbg_dp(ctrl->drm_dev,
> -			"no test pattern selected by sink\n");
> -		return ret;
> -	}
> -
> -	/*
> -	 * The global reset will need DP link related clocks to be
> -	 * running. Add the global reset just before disabling the
> -	 * link clocks and core clocks.
> -	 */
> -	ret = dp_ctrl_off(&ctrl->dp_ctrl);
> -	if (ret) {
> -		DRM_ERROR("failed to disable DP controller\n");
> -		return ret;
> -	}
> -
> -	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
> -	if (!ret)
> -		ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
> -	else
> -		DRM_ERROR("failed to enable DP link controller\n");
> -
> -	return ret;
> -}
> -
>   static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
>   {
>   	bool success = false;
> @@ -1618,6 +1584,56 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
>   	return success;
>   }
>   
> +static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
> +{
> +	int ret;
> +	struct dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> +
> +	ret = dp_ctrl_enable_stream_clocks(ctrl);
> +	if (ret) {
> +		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	dp_ctrl_send_phy_test_pattern(ctrl);
> +
> +	return 0;
> +}
> +
> +static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
> +{
> +	int ret = 0;
> +
> +	if (!ctrl->link->phy_params.phy_test_pattern_sel) {
> +		drm_dbg_dp(ctrl->drm_dev,
> +			"no test pattern selected by sink\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * The global reset will need DP link related clocks to be
> +	 * running. Add the global reset just before disabling the
> +	 * link clocks and core clocks.
> +	 */
> +	ret = dp_ctrl_off(&ctrl->dp_ctrl);
> +	if (ret) {
> +		DRM_ERROR("failed to disable DP controller\n");
> +		return ret;
> +	}
> +
> +	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
> +	if (!ret)
> +		ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
> +	else
> +		DRM_ERROR("failed to enable DP link controller\n");
> +
> +	return ret;
> +}
> +
>   void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
> @@ -1815,26 +1831,6 @@ static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
>   	return dp_ctrl_setup_main_link(ctrl, &training_step);
>   }
>   
> -static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
> -{
> -	int ret;
> -	struct dp_ctrl_private *ctrl;
> -
> -	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> -
> -	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> -
> -	ret = dp_ctrl_enable_stream_clocks(ctrl);
> -	if (ret) {
> -		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> -		return ret;
> -	}
> -
> -	dp_ctrl_send_phy_test_pattern(ctrl);
> -
> -	return 0;
> -}
> -
>   int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   {
>   	int ret = 0;


-- 
With best wishes
Dmitry
