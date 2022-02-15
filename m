Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0A74B6DF2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 14:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E461610E50D;
	Tue, 15 Feb 2022 13:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10D710E515
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 13:47:29 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bu29so31749289lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 05:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ARQblko0T1ABLz5LqKA7X0wsMW3xBAK4LmRW1gxdDRU=;
 b=MHzC40HMzCcjShwDv7vs0RcOPxJbQfUi1J4EneOBRfBO2NyKpKSS0RxUtDCHhNxsgE
 O7H8h3jGLtGNKZNldtoxKv5exybE369CJVA4i8JlKXBLLC/g1flynwUgB1Mw68x+QlOL
 ygTxi1wQitY6eaW3BQMigYpl7ji4JmgkEv5pN9zEfHvYvZXOXyYI6fagugy1w1dXOwJp
 LCeiotaEwwnIlwUbHaUhvczwX/67vao5drRwXaZvrcWbAUS2wDh4RCAOgv5ZglQgmcDm
 fXq9YecvjqKYaEbNbBwecO/VQMEZA7Szf4lOky/RVm0qAbBw76liSGiTFwh+4WGfvy2E
 aKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ARQblko0T1ABLz5LqKA7X0wsMW3xBAK4LmRW1gxdDRU=;
 b=6p6zpAYOlCF26fkMqLoVF5Z9k5GIKMlfmvHjogsC+zjuP8wNVz9yvgp+aLMHuOxgqS
 Smjv2upXxDC7QBMhLwdzxlM+TGO56xfEnvsH6OE9lZblrF3VdA/V9HCaHcnxsf1Kq2+O
 xrHMRlA/HiW+y4X8uWMXBy7uU9/M378m0JtQlNAXfghtyVRH/PbqyDa3cTPbBL/wRgkR
 eg8UA/1SPDx7STfHHqEle0rg+2khSWHfUYei5/43G/ieXOcoTKf+uguMZXFzXq1ezYBk
 2E6LzQowXO/YLECqNfsbX/ulqg7SmkrM4+CnyzpulgRycbbYIOjNSw732SeDjq679VRt
 eTdw==
X-Gm-Message-State: AOAM53278D9UFQBBKVk+svAuFCIPn5sEDu7tixYgnJDKQS9YsTcPTG6J
 +zGkANJhaoh09U3uTbrnXshvSQ==
X-Google-Smtp-Source: ABdhPJxOpiFoYhdG/6dlK28hXXq+ENO+EBeh01eAc3CpTUg3LGAMXYoW8IW30IVksxnmFq5yg8G8Gw==
X-Received: by 2002:a05:6512:3a85:: with SMTP id
 q5mr3183268lfu.628.1644932847992; 
 Tue, 15 Feb 2022 05:47:27 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id r6sm2272401lfr.111.2022.02.15.05.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 05:47:27 -0800 (PST)
Message-ID: <8c9e6603-8bc9-1849-6a16-5949326e6f67@linaro.org>
Date: Tue, 15 Feb 2022 16:47:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v1 1/2] drm/msm/dp: Add basic PSR support for eDP
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>, y@qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <y> <1644670295-25068-1-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644670295-25068-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/02/2022 15:51, Vinod Polimera wrote:
> Add support for basic panel self refresh (PSR) feature for eDP.
> Add a new interface to set PSR state in the sink from DPU.
> Program the eDP controller to issue PSR enter and exit SDP to
> the sink.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

Just noticed, thanks to the patchwork. Please do not send patches in 
reply to other patchsets/threads. This will confuse both reviwers and 
the patchwork.

> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 81 +++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  4 ++
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 65 ++++++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++
>   drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 14 ++++++-
>   drivers/gpu/drm/msm/dp/dp_link.c    | 22 ++++++++++
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 21 ++++++++++
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  6 +++
>   drivers/gpu/drm/msm/dp/dp_reg.h     | 19 +++++++++
>   drivers/gpu/drm/msm/msm_drv.h       |  2 +
>   11 files changed, 247 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 6ae9b29..d20cabb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -45,6 +45,14 @@
>   #define DP_INTERRUPT_STATUS2_MASK \
>   	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
>   
> +#define DP_INTERRUPT_STATUS4 \
> +	(PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
> +	PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
> +
> +#define DP_INTERRUPT_MASK4 \
> +	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
> +	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
> +
>   struct dp_catalog_private {
>   	struct device *dev;
>   	struct dp_io *io;
> @@ -343,6 +351,20 @@ void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog)
>   			ln_mapping);
>   }
>   
> +void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog,
> +						bool enable)
> +{
> +	u32 mainlink_ctrl;
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +
> +	mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> +	mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
> +	mainlink_ctrl |= (enable & DP_MAINLINK_CTRL_ENABLE);
> +
> +	dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +}
> +
>   void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
>   						bool enable)
>   {
> @@ -581,6 +603,51 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>   	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
>   }
>   
> +static void dp_catalog_enable_sdp(struct dp_catalog_private *catalog)
> +{
> +	/* trigger sdp */
> +	dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x1);
> +	dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x0);
> +}
> +
> +void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +	u32 psr_config;
> +
> +	/* enable PSR1 function */
> +	psr_config = dp_read_link(catalog, REG_PSR_CONFIG);
> +	psr_config |= BIT(0);
> +	dp_write_link(catalog, REG_PSR_CONFIG, psr_config);
> +
> +	dp_write_ahb(catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
> +	dp_catalog_enable_sdp(catalog);
> +}
> +
> +void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +			struct dp_catalog_private, dp_catalog);
> +	u32 psr_cmd;
> +
> +	psr_cmd = dp_read_link(catalog, REG_PSR_CMD);
> +
> +	/*
> +	 * BIT(0) - send psr entry SDP
> +	 * BIT(1) - sned psr exit SDP
> +	 */
> +	psr_cmd &= ~(BIT(0) | BIT(1));
> +
> +	if (enter)
> +		psr_cmd |= BIT(0);
> +	else
> +		psr_cmd |= BIT(1);
> +
> +	dp_catalog_enable_sdp(catalog);
> +	dp_write_link(catalog, REG_PSR_CMD, psr_cmd);
> +}
> +
>   u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)
>   {
>   	struct dp_catalog_private *catalog = container_of(dp_catalog,
> @@ -608,6 +675,20 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
>   	return isr;
>   }
>   
> +int dp_catalog_ctrl_get_psr_interrupt(struct dp_catalog *dp_catalog)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +	u32 intr, intr_ack;
> +
> +	intr = dp_read_ahb(catalog, REG_DP_INTR_STATUS4);
> +	intr_ack = (intr & DP_INTERRUPT_STATUS4)
> +			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
> +	dp_write_ahb(catalog, REG_DP_INTR_STATUS4, intr_ack);
> +
> +	return intr;
> +}
> +
>   int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
>   {
>   	struct dp_catalog_private *catalog = container_of(dp_catalog,
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 6965afa..9b1b199 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -91,6 +91,7 @@ void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 state);
>   void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
>   void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
> +void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
>   void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>   				u32 stream_rate_khz, bool fixed_nvid);
> @@ -101,12 +102,15 @@ void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
>   void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
>   			u32 intr_mask, bool en);
>   void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
> +void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog);
> +void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
>   u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
>   u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
>   int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
>   				u8 p_level);
>   int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog);
> +int dp_catalog_ctrl_get_psr_interrupt(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_update_transfer_unit(struct dp_catalog *dp_catalog,
>   				u32 dp_tu, u32 valid_boundary,
>   				u32 valid_boundary2);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index c724cb0..952ab96 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -20,7 +20,8 @@
>   #include "dp_link.h"
>   
>   #define DP_KHZ_TO_HZ 1000
> -#define IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES	(30 * HZ / 1000) /* 30 ms */
> +#define IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES		(30 * HZ / 1000) /* 30 ms */
> +#define PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES	(300 * HZ / 1000) /* 300 ms */
>   #define WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES (HZ / 2)
>   
>   #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
> @@ -78,6 +79,7 @@ struct dp_ctrl_private {
>   	struct dp_catalog *catalog;
>   
>   	struct completion idle_comp;
> +	struct completion psr_op_comp;
>   	struct completion video_comp;
>   };
>   
> @@ -151,6 +153,9 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
>   	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
>   	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
>   
> +	if (ctrl->panel->psr_cap.version)
> +		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
> +
>   	dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
>   }
>   
> @@ -1365,6 +1370,52 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
>   	return ret;
>   }
>   
> +void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl)
> +{
> +	struct dp_ctrl_private *ctrl;
> +	u8 psr_config;
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	if (!ctrl->panel->psr_cap.version)
> +		return;
> +
> +	dp_catalog_ctrl_config_psr(ctrl->catalog);
> +
> +	psr_config = DP_PSR_ENABLE;
> +	drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &psr_config, 1);
> +}
> +
> +void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter)
> +{
> +	struct dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	if (!ctrl->panel->psr_cap.version)
> +		return;
> +
> +	if (enter) {
> +		reinit_completion(&ctrl->psr_op_comp);
> +		dp_catalog_ctrl_set_psr(ctrl->catalog, true);
> +
> +		if (!wait_for_completion_timeout(&ctrl->psr_op_comp,
> +			PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES)) {
> +			DRM_ERROR("PSR_ENTRY timedout\n");
> +			dp_catalog_ctrl_set_psr(ctrl->catalog, false);
> +			return;
> +		}
> +
> +		dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
> +
> +		dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, false);
> +	} else {
> +		dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, true);
> +
> +		dp_catalog_ctrl_set_psr(ctrl->catalog, false);
> +	}
> +}
> +
>   int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
>   {
>   	struct dp_ctrl_private *ctrl;
> @@ -1964,6 +2015,17 @@ void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>   
> +	if (ctrl->panel->psr_cap.version) {
> +		isr = dp_catalog_ctrl_get_psr_interrupt(ctrl->catalog);
> +
> +		if (isr == 0x1)
> +			DRM_DEBUG_DP("PSR frame update done\n");
> +		else if (isr == 0x10)
> +			DRM_DEBUG_DP("PSR exit done\n");
> +
> +		complete(&ctrl->psr_op_comp);
> +	}
> +
>   	isr = dp_catalog_ctrl_get_interrupt(ctrl->catalog);
>   
>   	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
> @@ -2010,6 +2072,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>   		dev_err(dev, "failed to add DP OPP table\n");
>   
>   	init_completion(&ctrl->idle_comp);
> +	init_completion(&ctrl->psr_op_comp);
>   	init_completion(&ctrl->video_comp);
>   
>   	/* in parameters */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 2363a2d..f623035 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -34,4 +34,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>   			struct dp_power *power, struct dp_catalog *catalog,
>   			struct dp_parser *parser);
>   
> +void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enable);
> +void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl);
> +
>   #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7cc4d21..fe7ceea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -871,6 +871,10 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
>   
>   	/* signal the connect event late to synchronize video and display */
>   	dp_display_handle_plugged_change(dp_display, true);
> +
> +	if (dp->panel->psr_cap.version)
> +		dp_ctrl_config_psr(dp->ctrl);
> +
>   	return 0;
>   }
>   
> @@ -1037,6 +1041,14 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
>   	enable_irq(dp->irq);
>   }
>   
> +void msm_dp_display_set_psr(struct msm_dp *dp_display, bool enter)
> +{
> +	struct dp_display_private *dp;
> +
> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
> +	dp_ctrl_set_psr(dp->ctrl, enter);
> +}
> +
>   static int hpd_event_thread(void *data)
>   {
>   	struct dp_display_private *dp_priv;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index d4d360d..6eb53a0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -123,12 +123,24 @@ static enum drm_mode_status dp_connector_mode_valid(
>   	return dp_display_validate_mode(dp_disp, mode->clock);
>   }
>   
> +static struct drm_connector_state *
> +edp_drm_connector_duplicate_state(struct drm_connector *connector)
> +{
> +	struct drm_connector_state *state;
> +
> +	state = drm_atomic_helper_connector_duplicate_state(connector);
> +
> +	state->self_refresh_aware = true;
> +
> +	return state;
> +}
> +
>   static const struct drm_connector_funcs dp_connector_funcs = {
>   	.detect = dp_connector_detect,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
>   	.destroy = drm_connector_cleanup,
>   	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_duplicate_state = edp_drm_connector_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>   };
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index d4d31e5..5503c29 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -924,6 +924,26 @@ static int dp_link_process_phy_test_pattern_request(
>   	return 0;
>   }
>   
> +static int dp_link_psr_status(struct dp_link_private *link)
> +{
> +	u8 status[2];
> +
> +	drm_dp_dpcd_read(link->aux, DP_PSR_ERROR_STATUS, status, 2);
> +
> +	if (status[0] & DP_PSR_LINK_CRC_ERROR)
> +		DRM_ERROR("PSR LINK CRC ERROR\n");
> +	else if (status[0] & DP_PSR_RFB_STORAGE_ERROR)
> +		DRM_ERROR("PSR RFB STORAGE ERROR\n");
> +	else if (status[0] & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
> +		DRM_ERROR("PSR VSC SDP UNCORRECTABLE ERROR\n");
> +	else if (status[1] & DP_PSR_CAPS_CHANGE)
> +		DRM_INFO("PSR Capability Change\n");
> +	else
> +		return 0;
> +
> +	return 1;
> +}
> +
>   static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
>   {
>   	return link_status[r - DP_LANE0_1_STATUS];
> @@ -1042,6 +1062,8 @@ int dp_link_process_request(struct dp_link *dp_link)
>   		dp_link->sink_request |= DP_TEST_LINK_TRAINING;
>   	} else if (!dp_link_process_phy_test_pattern_request(link)) {
>   		dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
> +	} else if (dp_link_psr_status(link)) {
> +		DRM_INFO("PSR IRQ_HPD received\n");
>   	} else {
>   		ret = dp_link_process_link_status_update(link);
>   		if (!ret) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 71db10c..e128d73 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -19,6 +19,26 @@ struct dp_panel_private {
>   	bool aux_cfg_update_done;
>   };
>   
> +static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
> +{
> +	ssize_t rlen;
> +	struct dp_panel *dp_panel;
> +
> +	dp_panel = &panel->dp_panel;
> +
> +	/* edp sink */
> +	if (dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
> +		rlen = drm_dp_dpcd_read(panel->aux, DP_PSR_SUPPORT,
> +				&dp_panel->psr_cap, 2);
> +		if (rlen == 2) {
> +			DRM_DEBUG_DP("psr version: 0x%x, psr_cap: 0x%x\n",
> +				dp_panel->psr_cap.version,
> +				dp_panel->psr_cap.capabilities);
> +		} else
> +			DRM_ERROR("failed to read psr info, rlen=%zd\n", rlen);
> +	}
> +}
> +
>   static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   {
>   	int rc = 0;
> @@ -104,6 +124,7 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   		}
>   	}
>   
> +	dp_panel_read_psr_cap(panel);
>   end:
>   	return rc;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 9023e5b..631657a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -34,6 +34,11 @@ struct dp_panel_in {
>   	struct dp_catalog *catalog;
>   };
>   
> +struct dp_panel_psr {
> +	u8 version;
> +	u8 capabilities;
> +};
> +
>   struct dp_panel {
>   	/* dpcd raw data */
>   	u8 dpcd[DP_RECEIVER_CAP_SIZE + 1];
> @@ -46,6 +51,7 @@ struct dp_panel {
>   	struct edid *edid;
>   	struct drm_connector *connector;
>   	struct dp_display_mode dp_mode;
> +	struct dp_panel_psr psr_cap;
>   	bool video_test;
>   
>   	u32 vic;
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 2686028..7a0b052 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -22,6 +22,20 @@
>   #define REG_DP_INTR_STATUS2			(0x00000024)
>   #define REG_DP_INTR_STATUS3			(0x00000028)
>   
> +#define REG_DP_INTR_STATUS4			(0x0000002C)
> +#define PSR_UPDATE_INT				(0x00000001)
> +#define PSR_CAPTURE_INT				(0x00000004)
> +#define PSR_EXIT_INT				(0x00000010)
> +#define PSR_UPDATE_ERROR_INT			(0x00000040)
> +#define PSR_WAKE_ERROR_INT			(0x00000100)
> +
> +#define REG_DP_INTR_MASK4			(0x00000030)
> +#define PSR_UPDATE_MASK				(0x00000001)
> +#define PSR_CAPTURE_MASK			(0x00000002)
> +#define PSR_EXIT_MASK				(0x00000004)
> +#define PSR_UPDATE_ERROR_MASK			(0x00000008)
> +#define PSR_WAKE_ERROR_MASK			(0x00000010)
> +
>   #define REG_DP_DP_HPD_CTRL			(0x00000000)
>   #define DP_DP_HPD_CTRL_HPD_EN			(0x00000001)
>   
> @@ -164,6 +178,9 @@
>   #define MMSS_DP_AUDIO_TIMING_RBR_48		(0x00000094)
>   #define MMSS_DP_AUDIO_TIMING_HBR_48		(0x00000098)
>   
> +#define REG_PSR_CONFIG				(0x00000100)
> +#define REG_PSR_CMD				(0x00000110)
> +
>   #define MMSS_DP_PSR_CRC_RG			(0x00000154)
>   #define MMSS_DP_PSR_CRC_B			(0x00000158)
>   
> @@ -184,6 +201,8 @@
>   #define MMSS_DP_AUDIO_STREAM_0			(0x00000240)
>   #define MMSS_DP_AUDIO_STREAM_1			(0x00000244)
>   
> +#define MMSS_DP_SDP_CFG3			(0x0000024c)
> +
>   #define MMSS_DP_EXTENSION_0			(0x00000250)
>   #define MMSS_DP_EXTENSION_1			(0x00000254)
>   #define MMSS_DP_EXTENSION_2			(0x00000258)
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d7574e6..28e182b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -400,6 +400,8 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_displa
>   
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
>   
> +void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
> +
>   #else
>   static inline int __init msm_dp_register(void)
>   {


-- 
With best wishes
Dmitry
