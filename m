Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5D54BD9B3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 13:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F9610E1D8;
	Mon, 21 Feb 2022 12:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AF710E1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 12:37:42 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bu29so18459462lfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 04:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BHEt1T1Dr3DMzmTO8EpeENJekq7BZDfUi5pPH/ucie4=;
 b=jzURkuBSvHGgkr8DytLLtBFQyDU8KDb9QvoXlkOKbodgYF96qgkxGv8j2VkH2xwe5E
 TmgUSyTl05rmW/lBk046nkv6Cbqi/WvnYc92O3rzu0Kqmj4bl97OmqiP1pb/fZ59VRJt
 AugWLr0Cqe5VMTBzxr3nobHHLZcn+h8fXr7wC/M8pOdFTSxtF0YBgrSdm2SBMFppPAT5
 fHi7Xnly/ynVuieYMsJBRZb/jrnqphfaGvDQjVO/ckrDYH8uYK2n7yIfxMgVkEpxAvVb
 +d+iN0j0ln4hB9ixaJt/AQEfFEmO1FneoY0AalYlRE8sLVQp6EjbiPtOVN4JRb3MPxMC
 fAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BHEt1T1Dr3DMzmTO8EpeENJekq7BZDfUi5pPH/ucie4=;
 b=JzQI3Nf7Qv9Fh2dfkCMqw+aJlhz6E+G2EGwHFpubiSvqla7OrjzcJyqwPeLxnHOvag
 hzPNi7hSECvT/DLv8Fxvj4D7U2eM6BW9JIQKeTjMPwI1YQXBPpK+9UpATBef4FgGFsqz
 +YZfjoCZ4SYBB6xhp2zMPttq0mYbC55dSC5xB7ef5OL85o+I7OAO0kp6VdksWQpSXVo9
 BtZDuROfEP42QnQit0WymqpRtNXramUh5OZV4KSPpkNa+dYrTETzt7+J4/EAlyiXXU1i
 LMX3DppyPwcXOwlYAtr8KPHwlCLPnXuMRBE3KinVRP35YddgkklfVlRh+l+wac9wGT0a
 jsNQ==
X-Gm-Message-State: AOAM533K06a/sRSTW4urPAhsX8HtQQ/2h1NuldFZdTD/SkQw/8L3X2h8
 HOWHGAcmDeFhSIlF+ouBclv5xA==
X-Google-Smtp-Source: ABdhPJwXmsvWi5N5+zEcG0VMEdEgWaH9TLXdnqHBzhYOfPatDGiICbASsGOZ8oIPL2zeVWJjeFAnwg==
X-Received: by 2002:a05:6512:952:b0:443:7f74:1418 with SMTP id
 u18-20020a056512095200b004437f741418mr14397020lft.36.1645447060761; 
 Mon, 21 Feb 2022 04:37:40 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d16sm1107988lfs.63.2022.02.21.04.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 04:37:40 -0800 (PST)
Message-ID: <813297ce-c0fa-e805-eec9-1dbc31860f8f@linaro.org>
Date: Mon, 21 Feb 2022 15:37:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [REPOST PATCH v4 02/13] drm/msm/dsi: Pass DSC params to drm_panel
Content-Language: en-GB
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-3-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210103423.271016-3-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2022 13:34, Vinod Koul wrote:
> When DSC is enabled, we need to pass the DSC parameters to panel driver
> as well, so add a dsc parameter in panel and set it when DSC is enabled
> 
> Also, fetch and pass DSC configuration for DSI panels to DPU encoder,
> which will enable and configure DSC hardware blocks accordingly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  2 ++
>   drivers/gpu/drm/msm/dsi/dsi.c           |  5 +++++
>   drivers/gpu/drm/msm/dsi/dsi.h           |  1 +
>   drivers/gpu/drm/msm/dsi/dsi_host.c      | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h           |  8 ++++++++
>   include/drm/drm_panel.h                 |  7 +++++++
>   6 files changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 47fe11a84a77..ef6ddac22767 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -578,6 +578,8 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>   			MSM_DISPLAY_CAP_CMD_MODE :
>   			MSM_DISPLAY_CAP_VID_MODE;
>   
> +		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
> +
>   		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
>   			rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
>   			if (rc) {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 052548883d27..3aeac15e7421 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -20,6 +20,11 @@ bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
>   	return !(host_flags & MIPI_DSI_MODE_VIDEO);
>   }
>   
> +struct msm_display_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
> +{
> +	return msm_dsi_host_get_dsc_config(msm_dsi->host);
> +}
> +
>   static int dsi_get_phy(struct msm_dsi *msm_dsi)
>   {
>   	struct platform_device *pdev = msm_dsi->pdev;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index c8dedc95428c..16cd9b2fce86 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -152,6 +152,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>   int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>   void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
>   void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
> +struct msm_display_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host);
>   
>   /* dsi phy */
>   struct msm_dsi_phy;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 27553194f9fa..7e9913eff724 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2059,9 +2059,24 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>   {
>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>   	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> +	struct drm_panel *panel;
>   	int ret;
>   
>   	msm_host->dev = dev;
> +	panel = msm_dsi_host_get_panel(&msm_host->base);
> +
> +	if (panel && panel->dsc) {
> +		struct msm_display_dsc_config *dsc = msm_host->dsc;
> +
> +		if (!dsc) {
> +			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
> +			if (!dsc)
> +				return -ENOMEM;
> +			dsc->drm = panel->dsc;
> +			msm_host->dsc = dsc;
> +		}
> +	}
> +
>   	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>   	if (ret) {
>   		pr_err("%s: alloc tx gem obj failed, %d\n", __func__, ret);
> @@ -2626,3 +2641,10 @@ void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host)
>   		dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER,
>   				DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER_SW_TRIGGER);
>   }
> +
> +struct msm_display_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host)
> +{
> +	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +
> +	return msm_host->dsc;
> +}
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 384f9bad4760..e7a312edfe67 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -119,6 +119,7 @@ struct msm_display_topology {
>    *                      based on num_of_h_tiles
>    * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
>    *				 used instead of panel TE in cmd mode panels
> + * @dsc:		DSC configuration data for DSC-enabled displays
>    */
>   struct msm_display_info {
>   	int intf_type;
> @@ -126,6 +127,7 @@ struct msm_display_info {
>   	uint32_t num_of_h_tiles;
>   	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>   	bool is_te_using_watchdog_timer;
> +	struct msm_display_dsc_config *dsc;
>   };
>   
>   /* Commit/Event thread specific structure */
> @@ -365,6 +367,7 @@ void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi
>   bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
>   bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
>   bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
> +struct msm_display_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
>   #else
>   static inline void __init msm_dsi_register(void)
>   {
> @@ -393,6 +396,11 @@ static inline bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
>   {
>   	return false;
>   }
> +
> +static inline struct msm_display_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
> +{
> +	return NULL;
> +}
>   #endif
>   
>   #ifdef CONFIG_DRM_MSM_DP
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 4602f833eb51..eb8ae9bf32ed 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -171,6 +171,13 @@ struct drm_panel {
>   	 * Panel entry in registry.
>   	 */
>   	struct list_head list;
> +
> +	/**
> +	 * @dsc:
> +	 *
> +	 * Panel DSC pps payload to be sent
> +	 */
> +	struct drm_dsc_config *dsc;

This is not a blocker or a request for a change, just a kind of thought:

I've been looking onto this change for a while from the following point 
of view. I'd like to switch DSI driver to use panel 
bridge/drm_bridge_connector(). This simplifies handling of DRM bridge 
chains.

Also since DSC can be consumed not by the panel itself, but by the next 
bridge in chain (e.g. it's supported on the DSI input by the ANX7625 
bridge), using drm_panel doesn't look completely correct.

So, I have been looking for a better way to pass DSC configuration.

For DSI we can use struct mipi_dsi_device (together with the rest of 
data we are passing from DSI device driver to DSI host). This would 
allow both DSI panels and DSI bridges to pass the DSC config to the 
previous deivce in chain (DSI host).

Any comments/thoughs?

Note, for DP this problem doesn't exist. The DSC config is a part of 
DPDC, so it will be parsed by the msm/dp driver in a natural way.


>   };
>   
>   void drm_panel_init(struct drm_panel *panel, struct device *dev,


-- 
With best wishes
Dmitry
