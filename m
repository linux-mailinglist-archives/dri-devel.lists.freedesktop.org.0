Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF24E5A4F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 22:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4D210E00B;
	Wed, 23 Mar 2022 21:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6BC894C5;
 Wed, 23 Mar 2022 21:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648069356; x=1679605356;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wYy+UKVRUiZUUpyNwqERacFeo/23Mh9A/vuoVECNjdc=;
 b=zXAHeIGqlKTa4ZcVI7REbkDPDq34Na3F/2aPcQffKxuL87cqKlNeQ4Ce
 ndsDRYwSAcVF8bDLXasEoGg2v+249FCbev2FNxK28vUoDYPfv8x6z+Nfb
 BoPRaGU+eGEPByHq+SnQw+xS692iM+QUzMEkbulHgvpeLbncoJmGf5UoZ 0=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Mar 2022 14:02:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 14:02:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 14:02:34 -0700
Received: from [10.110.28.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 23 Mar
 2022 14:02:33 -0700
Message-ID: <b19ea2c3-9283-3dd0-98d0-d00d59dacacc@quicinc.com>
Date: Wed, 23 Mar 2022 14:02:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] drm/msm/dp: drop dp_mode argument from
 dp_panel_get_modes()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Sankeerth
 Billakanti" <quic_sbillaka@quicinc.com>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
 <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
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


On 3/23/2022 3:35 AM, Dmitry Baryshkov wrote:
> Since the commit ab205927592b ("drm/msm/dp: remove mode hard-coding in
> case of DP CTS") the function dp_panel_get_modes() doesn't use (or fill)
> the dp_mode argument. Drop it completely.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 2 +-
>   drivers/gpu/drm/msm/dp/dp_panel.h   | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 178b774a5fbd..3dd790083cf7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1013,7 +1013,7 @@ int dp_display_get_modes(struct msm_dp *dp,
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
>   
>   	ret = dp_panel_get_modes(dp_display->panel,
> -		dp->connector, dp_mode);
> +		dp->connector);
>   	if (dp_mode->drm_mode.clock)
>   		dp->max_pclk_khz = dp_mode->drm_mode.clock;
>   	return ret;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index f1418722c549..8d7662028f30 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -259,7 +259,7 @@ u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel,
>   }
>   
>   int dp_panel_get_modes(struct dp_panel *dp_panel,
> -	struct drm_connector *connector, struct dp_display_mode *mode)
> +	struct drm_connector *connector)
>   {
>   	if (!dp_panel) {
>   		DRM_ERROR("invalid input\n");
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 9023e5bb4b8b..9fa6e524832c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -64,7 +64,7 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel, u32 mode_max_bpp,
>   			u32 mode_pclk_khz);
>   int dp_panel_get_modes(struct dp_panel *dp_panel,
> -		struct drm_connector *connector, struct dp_display_mode *mode);
> +		struct drm_connector *connector);
>   void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
>   void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
>   
