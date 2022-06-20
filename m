Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF94155208B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 17:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CC210E0A9;
	Mon, 20 Jun 2022 15:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C4610E0A7;
 Mon, 20 Jun 2022 15:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655738601; x=1687274601;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3RspoLTY/aaq8/GIIo7KFRfdh26vFE0QgbvyI/ESV+s=;
 b=lCzLE5MoBAtAiBTIzQTCmAbgXUJt85zdvFZKWU0F01kw9dHN2BFzqjea
 rBJp7BkGfYTJ8CmPQIWMEw82JSLdNobqFZpnIHM+NIJYj8HAWWEkg+mQu
 QJTZBvlfEtqSMfbGwbOHDjeoSjvJY20z3t8WoKtvfDLM2ID0TZfqzAsQm k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 20 Jun 2022 08:23:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 08:23:19 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 20 Jun 2022 08:23:18 -0700
Received: from [10.110.14.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 20 Jun
 2022 08:23:18 -0700
Message-ID: <8cc1d090-3f5a-8b30-0bf2-ccb4c9eda176@quicinc.com>
Date: Mon, 20 Jun 2022 08:23:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] drm/msm/dp: Get rid of
 dp_ctrl_on_stream_phy_test_report()
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20220617204750.2347797-1-swboyd@chromium.org>
 <20220617204750.2347797-4-swboyd@chromium.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220617204750.2347797-4-swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/17/2022 1:47 PM, Stephen Boyd wrote:
> This API isn't really more than a couple lines now that we don't store
> the pixel_rate to the struct member. Inline it into the caller.
>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 40 ++++++++++++--------------------
>   1 file changed, 15 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index e114521af2e9..d04fddb29fdf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1582,34 +1582,15 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
>   	return success;
>   }
>   
> -static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
> +static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>   {
>   	int ret;
> -	struct dp_ctrl_private *ctrl;
>   	unsigned long pixel_rate;
>   
> -	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> -
> -	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> -	ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
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
> -static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
> -{
> -	int ret = 0;
> -
>   	if (!ctrl->link->phy_params.phy_test_pattern_sel) {
>   		drm_dbg_dp(ctrl->drm_dev,
>   			"no test pattern selected by sink\n");
> -		return ret;
> +		return 0;
>   	}
>   
>   	/*
> @@ -1624,12 +1605,21 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>   	}
>   
>   	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
> -	if (!ret)
> -		ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
> -	else
> +	if (ret) {
>   		DRM_ERROR("failed to enable DP link controller\n");
> +		return ret;
> +	}
>   
> -	return ret;
> +	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> +	ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
> +	if (ret) {
> +		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	dp_ctrl_send_phy_test_pattern(ctrl);
> +
> +	return 0;
>   }
>   
>   void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
