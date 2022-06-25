Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C455A603
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 04:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4EE10E732;
	Sat, 25 Jun 2022 02:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C4710E732;
 Sat, 25 Jun 2022 02:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656123074; x=1687659074;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PA+NlwtwluPHOiMrJMO876oPMfHwLC1uX43agZsOREk=;
 b=YOg2bZb9MHfF68nxam2iJlONpfVk7b1HNzXAw2v4mRCt5NhJee+0hXzW
 IltNsD6pC1zBXt1c9bMPiCSZ9q+a+RxyOInwIoW1MJzg884KOmePJZu2i
 fYVYl8CEvvy541Dx+Q5qMMJ83Ow71OA0Z8+XpoBled676QhL6xKsTQyLo Y=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Jun 2022 19:11:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 19:11:13 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 24 Jun 2022 19:11:12 -0700
Received: from [10.111.168.196] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 24 Jun
 2022 19:11:10 -0700
Message-ID: <dbc47ebe-ee03-8e3e-ed0d-b7ab299582d1@quicinc.com>
Date: Fri, 24 Jun 2022 19:11:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dp: Remove encoder pointer from struct msm_dp
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220625002811.3225344-1-swboyd@chromium.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220625002811.3225344-1-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 patches@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/24/2022 5:28 PM, Stephen Boyd wrote:
> We don't need to stash the encoder here. Instead we can simply pass it
> around as an argument.
> 
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 4 +---
>   drivers/gpu/drm/msm/dp/dp_display.h | 1 -
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 8 ++++----
>   drivers/gpu/drm/msm/dp/dp_drm.h     | 2 +-
>   4 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index da5c03a8cc4c..798fd5398b48 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1621,8 +1621,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   		return ret;
>   	}
>   
> -	dp_display->encoder = encoder;
> -
>   	ret = dp_display_get_next_bridge(dp_display);
>   	if (ret)
>   		return ret;
> @@ -1638,7 +1636,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   
>   	priv->bridges[priv->num_bridges++] = dp_display->bridge;
>   
> -	dp_display->connector = dp_drm_connector_init(dp_display);
> +	dp_display->connector = dp_drm_connector_init(dp_display, encoder);
>   	if (IS_ERR(dp_display->connector)) {
>   		ret = PTR_ERR(dp_display->connector);
>   		DRM_DEV_ERROR(dev->dev,
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 4f9fe4d7610b..dcedf021f7fe 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -15,7 +15,6 @@ struct msm_dp {
>   	struct device *codec_dev;
>   	struct drm_bridge *bridge;
>   	struct drm_connector *connector;
> -	struct drm_encoder *encoder;
>   	struct drm_bridge *next_bridge;
>   	bool is_connected;
>   	bool audio_enabled;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 62d58b9c4647..6df25f7662e7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -116,7 +116,7 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
>   	}
>   
>   	if (dp_display->next_bridge) {
> -		rc = drm_bridge_attach(dp_display->encoder,
> +		rc = drm_bridge_attach(encoder,
>   					dp_display->next_bridge, bridge,
>   					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   		if (rc < 0) {
> @@ -130,15 +130,15 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
>   }
>   
>   /* connector initialization */
> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
>   {
>   	struct drm_connector *connector = NULL;
>   
> -	connector = drm_bridge_connector_init(dp_display->drm_dev, dp_display->encoder);
> +	connector = drm_bridge_connector_init(dp_display->drm_dev, encoder);
>   	if (IS_ERR(connector))
>   		return connector;
>   
> -	drm_connector_attach_encoder(connector, dp_display->encoder);
> +	drm_connector_attach_encoder(connector, encoder);
>   
>   	return connector;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index f4b1ed1e24f7..82035dbb0578 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -19,7 +19,7 @@ struct msm_dp_bridge {
>   
>   #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
>   
> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display);
> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
>   struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>   			struct drm_encoder *encoder);
>   
> 
> base-commit: 24df12013853ac59c52cc726e9cbe51e38d09eda
