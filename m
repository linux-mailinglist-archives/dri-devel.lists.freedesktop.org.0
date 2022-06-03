Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583853D340
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 23:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1973311239C;
	Fri,  3 Jun 2022 21:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8732B112397;
 Fri,  3 Jun 2022 21:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654291882; x=1685827882;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ifzUKe4OSB4720dRdcmtQGCBY0jYKBDtS7b7akT5Xhs=;
 b=uJ3Bjizmn+IdDvnirPocpBDhTUo94V0Y+KkHpjyog+6J5NW90FHCWoaU
 OAfWMrHB1Eey1FAetK8zad4MhMvX1W/VMxNUq5+CQ0udLBkOfxpsR2qVW
 uiBWTOsKFgT4wBu4lOTFvkYpMFHOSaRFAGMadje4A9f+k57XUC0ee6LCF M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Jun 2022 14:31:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 14:31:21 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 3 Jun 2022 14:31:21 -0700
Received: from [10.110.52.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 3 Jun 2022
 14:31:20 -0700
Message-ID: <2f8dca4a-3046-2336-80ff-267d8dbc7a3e@quicinc.com>
Date: Fri, 3 Jun 2022 14:31:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4] drm/msm/dp: force link training for display resolution
 change
Content-Language: en-US
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
References: <1653687133-32331-1-git-send-email-quic_khsieh@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <1653687133-32331-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Any one has any comments?

Thanks,

On 5/27/2022 2:32 PM, Kuogee Hsieh wrote:
> During display resolution changes display have to be disabled first
> followed by display enabling with new resolution. Display disable
> will turn off both pixel clock and main link clock so that main link
> have to be re trained during display enable to have new video stream
> flow again. At current implementation, display enable function manually
> kicks up irq_hpd_handle which will read panel link status and start link
> training if link status is not in sync state. However, there is rare
> case that a particular panel links status keep staying in sync for
> some period of time after main link had been shut down previously at
> display disabled. Main link retraining will not be executed by
> irq_hdp_handle() if the link status read from pane shows it is in
> sync state. If this was happen, then video stream of newer display
> resolution will fail to be transmitted to panel due to main link is
> not in sync between host and panel. This patch force main link always
> be retrained during display enable procedure to prevent this rare
> failed case from happening. Also this implementation are more
> efficient than manual kicking off irq_hpd_handle function.
>
> Changes in v2:
> -- set force_link_train flag on DP only (is_edp == false)
>
> Changes in v3:
> -- revise commit  text
> -- add Fixes tag
>
> Changes in v4:
> -- revise commit  text
>
> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  6 +++---
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>   3 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index af7a80c..bea93eb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1551,7 +1551,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>   
>   	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
>   	if (!ret)
> -		ret = dp_ctrl_on_stream(&ctrl->dp_ctrl);
> +		ret = dp_ctrl_on_stream(&ctrl->dp_ctrl, false);
>   	else
>   		DRM_ERROR("failed to enable DP link controller\n");
>   
> @@ -1807,7 +1807,7 @@ static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
>   	return dp_ctrl_setup_main_link(ctrl, &training_step);
>   }
>   
> -int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
> +int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   {
>   	int ret = 0;
>   	bool mainlink_ready = false;
> @@ -1848,7 +1848,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>   		return 0;
>   	}
>   
> -	if (!dp_ctrl_channel_eq_ok(ctrl))
> +	if (force_link_train || !dp_ctrl_channel_eq_ok(ctrl))
>   		dp_ctrl_link_retrain(ctrl);
>   
>   	/* stop txing train pattern to end link training */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 0745fde..b563e2e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -21,7 +21,7 @@ struct dp_ctrl {
>   };
>   
>   int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
> -int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
> +int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
>   int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
>   int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
>   int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..370348d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -872,7 +872,7 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
>   		return 0;
>   	}
>   
> -	rc = dp_ctrl_on_stream(dp->ctrl);
> +	rc = dp_ctrl_on_stream(dp->ctrl, data);
>   	if (!rc)
>   		dp_display->power_on = true;
>   
> @@ -1654,6 +1654,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>   	int rc = 0;
>   	struct dp_display_private *dp_display;
>   	u32 state;
> +	bool force_link_train = false;
>   
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
>   	if (!dp_display->dp_mode.drm_mode.clock) {
> @@ -1688,10 +1689,14 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>   
>   	state =  dp_display->hpd_state;
>   
> -	if (state == ST_DISPLAY_OFF)
> +	if (state == ST_DISPLAY_OFF) {
>   		dp_display_host_phy_init(dp_display);
>   
> -	dp_display_enable(dp_display, 0);
> +		if (!dp->is_edp)
> +			force_link_train = true;
> +	}
> +
> +	dp_display_enable(dp_display, force_link_train);
>   
>   	rc = dp_display_post_enable(dp);
>   	if (rc) {
> @@ -1700,10 +1705,6 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>   		dp_display_unprepare(dp);
>   	}
>   
> -	/* manual kick off plug event to train link */
> -	if (state == ST_DISPLAY_OFF)
> -		dp_add_event(dp_display, EV_IRQ_HPD_INT, 0, 0);
> -
>   	/* completed connection */
>   	dp_display->hpd_state = ST_CONNECTED;
>   
