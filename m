Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2ED492EBC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 20:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13FB10E51F;
	Tue, 18 Jan 2022 19:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DF510E1BB;
 Tue, 18 Jan 2022 19:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642535517; x=1674071517;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j2lL892cPUdiLzDTOsDf0EqRqkwXBC+tJVZuvQS3Ras=;
 b=oeuBrxonk6EdduicjkZcoW07ZmkgUCQseS8xmpCELLHbrtsbVNvmVtk/
 Zyv/bjtbUtcei3FuHbcgwe2TvcY+PkaPMD/fB3ATB7zWGWswaOyo8TJl8
 QqfKNfw9as6ijpPKCdfRTWxTb80X3A9kqkSDaLJJP3kchI9+hIeF6HQjX 4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Jan 2022 11:51:56 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 11:51:56 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 18 Jan 2022 11:51:56 -0800
Received: from [10.111.164.20] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 18 Jan
 2022 11:51:54 -0800
Message-ID: <dd8433da-83a3-afcf-3be6-caf20aa2ae72@quicinc.com>
Date: Tue, 18 Jan 2022 11:51:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Freedreno] [PATCH v2] drm/msm: reduce usage of round_pixclk
 callback
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220106070656.482882-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220106070656.482882-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/2022 11:06 PM, Dmitry Baryshkov wrote:
> The round_pixclk() callback returns different rate only on MDP4 in HDMI
> (DTV) case. Stop using this callback in other cases to simplify
> mode_valid callbacks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Changes since v1:
>   - Rebased on top of HDMI changes
>   - Dropped eDP part, driver got removed
> 
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  7 -------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  7 -------
>   drivers/gpu/drm/msm/dsi/dsi_manager.c    | 22 ----------------------
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c   | 11 +++++++----
>   4 files changed, 7 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 47fe11a84a77..ebbee5f103e1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -774,12 +774,6 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   	return ret;
>   }
>   
> -static long dpu_kms_round_pixclk(struct msm_kms *kms, unsigned long rate,
> -		struct drm_encoder *encoder)
> -{
> -	return rate;
> -}
> -
>   static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
>   {
>   	int i;
> @@ -948,7 +942,6 @@ static const struct msm_kms_funcs kms_funcs = {
>   	.disable_vblank  = dpu_kms_disable_vblank,
>   	.check_modified_format = dpu_format_check_modified_format,
>   	.get_format      = dpu_get_msm_format,
> -	.round_pixclk    = dpu_kms_round_pixclk,
>   	.destroy         = dpu_kms_destroy,
>   	.snapshot        = dpu_kms_mdp_snapshot,
>   #ifdef CONFIG_DEBUG_FS
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 12a5f81e402b..20859fd7af4a 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -190,12 +190,6 @@ static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
>   		mdp5_smp_complete_commit(mdp5_kms->smp, &global_state->smp);
>   }
>   
> -static long mdp5_round_pixclk(struct msm_kms *kms, unsigned long rate,
> -		struct drm_encoder *encoder)
> -{
> -	return rate;
> -}
> -
>   static int mdp5_set_split_display(struct msm_kms *kms,
>   		struct drm_encoder *encoder,
>   		struct drm_encoder *slave_encoder,
> @@ -278,7 +272,6 @@ static const struct mdp_kms_funcs kms_funcs = {
>   		.wait_flush      = mdp5_wait_flush,
>   		.complete_commit = mdp5_complete_commit,
>   		.get_format      = mdp_get_format,
> -		.round_pixclk    = mdp5_round_pixclk,
>   		.set_split_display = mdp5_set_split_display,
>   		.destroy         = mdp5_kms_destroy,
>   #ifdef CONFIG_DEBUG_FS
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index f19bae475c96..1dbbfca163d9 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -305,27 +305,6 @@ static int dsi_mgr_connector_get_modes(struct drm_connector *connector)
>   	return num;
>   }
>   
> -static enum drm_mode_status dsi_mgr_connector_mode_valid(struct drm_connector *connector,
> -				struct drm_display_mode *mode)
> -{
> -	int id = dsi_mgr_connector_get_id(connector);
> -	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> -	struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
> -	struct msm_drm_private *priv = connector->dev->dev_private;
> -	struct msm_kms *kms = priv->kms;
> -	long actual, requested;
> -
> -	DBG("");
> -	requested = 1000 * mode->clock;
> -	actual = kms->funcs->round_pixclk(kms, requested, encoder);
> -
> -	DBG("requested=%ld, actual=%ld", requested, actual);
> -	if (actual != requested)
> -		return MODE_CLOCK_RANGE;
> -
> -	return MODE_OK;
> -}
> -
>   static struct drm_encoder *
>   dsi_mgr_connector_best_encoder(struct drm_connector *connector)
>   {
> @@ -586,7 +565,6 @@ static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
>   
>   static const struct drm_connector_helper_funcs dsi_mgr_conn_helper_funcs = {
>   	.get_modes = dsi_mgr_connector_get_modes,
> -	.mode_valid = dsi_mgr_connector_mode_valid,
>   	.best_encoder = dsi_mgr_connector_best_encoder,
>   };
>   
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 68fba4bf7212..10ebe2089cb6 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -282,15 +282,18 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
>   	long actual, requested;
>   
>   	requested = 1000 * mode->clock;
> -	actual = kms->funcs->round_pixclk(kms,
> -			requested, hdmi_bridge->hdmi->encoder);
>   
>   	/* for mdp5/apq8074, we manage our own pixel clk (as opposed to
>   	 * mdp4/dtv stuff where pixel clk is assigned to mdp/encoder
>   	 * instead):
>   	 */
> -	if (config->pwr_clk_cnt > 0)
> -		actual = clk_round_rate(hdmi->pwr_clks[0], actual);
> +	if (kms->funcs->round_pixclk)
> +		actual = kms->funcs->round_pixclk(kms,
> +			requested, hdmi_bridge->hdmi->encoder);
> +	else if (config->pwr_clk_cnt > 0)
> +		actual = clk_round_rate(hdmi->pwr_clks[0], requested);
> +	else
> +		actual = requested;
>   
>   	DBG("requested=%ld, actual=%ld", requested, actual);
>   
