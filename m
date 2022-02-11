Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088A54B1A27
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 01:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD76810E993;
	Fri, 11 Feb 2022 00:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8263310E993;
 Fri, 11 Feb 2022 00:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644538258; x=1676074258;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TXtiuweZkQZeXry8a7znX/b1/4DHIP+ypOqTEw/jN2c=;
 b=hPdjLA76vPbKWxtiIiRzK5QGFJzIkeiG2UMckRTPf52313bG3kvDGa+1
 Gdn8AwV0wLkFFrdPPAPiXOtC46BjyfB3/uJsdkc8A9vVVEPryq0EtoaYP
 rEou+Jp5YAvG71RDwL/AouRt1KeFCG31yTUvlba/rTyAQ/h2AcUiQlzJg k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 10 Feb 2022 16:10:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 16:10:57 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 16:10:56 -0800
Received: from [10.111.162.111] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 10 Feb
 2022 16:10:54 -0800
Message-ID: <334b4d31-8665-a844-f5dc-a5fa19494f85@quicinc.com>
Date: Thu, 10 Feb 2022 16:10:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [PATCH 1/7] drm/msm: move struct msm_display_info to
 dpu driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
 <20220203082611.2654810-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220203082611.2654810-2-dmitry.baryshkov@linaro.org>
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



On 2/3/2022 12:26 AM, Dmitry Baryshkov wrote:
> The msm_display_info structure is not used by the rest of msm driver, so
> move it into the dpu1 (dpu_encoder.h to be precise).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Yes, this is true. Its not used by rest of msm driver.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 18 ++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h               | 18 ------------------
>   2 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index e241914a9677..ebe3944355bb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -34,6 +34,24 @@ struct dpu_encoder_hw_resources {
>   void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
>   				  struct dpu_encoder_hw_resources *hw_res);
>   
> +/**
> + * struct msm_display_info - defines display properties
> + * @intf_type:          DRM_MODE_ENCODER_ type
> + * @capabilities:       Bitmask of display flags
> + * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
> + * @h_tile_instance:    Controller instance used per tile. Number of elements is
> + *                      based on num_of_h_tiles
> + * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
> + *				 used instead of panel TE in cmd mode panels
> + */
> +struct msm_display_info {
> +	int intf_type;
> +	uint32_t capabilities;
> +	uint32_t num_of_h_tiles;
> +	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> +	bool is_te_using_watchdog_timer;
> +};
> +
>   /**
>    * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
>    * @encoder:	encoder pointer
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d7574e6bd4e4..16f9e25ee19e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -109,24 +109,6 @@ struct msm_display_topology {
>   	u32 num_dspp;
>   };
>   
> -/**
> - * struct msm_display_info - defines display properties
> - * @intf_type:          DRM_MODE_ENCODER_ type
> - * @capabilities:       Bitmask of display flags
> - * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
> - * @h_tile_instance:    Controller instance used per tile. Number of elements is
> - *                      based on num_of_h_tiles
> - * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
> - *				 used instead of panel TE in cmd mode panels
> - */
> -struct msm_display_info {
> -	int intf_type;
> -	uint32_t capabilities;
> -	uint32_t num_of_h_tiles;
> -	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> -	bool is_te_using_watchdog_timer;
> -};
> -
>   /* Commit/Event thread specific structure */
>   struct msm_drm_thread {
>   	struct drm_device *dev;
