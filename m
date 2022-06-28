Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B97455E5BE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 17:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E331E1127A2;
	Tue, 28 Jun 2022 15:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE268112823;
 Tue, 28 Jun 2022 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656430872; x=1687966872;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=umUEFXkxpRuTFxwhPM3gZ5RAxhtH9douX/WuwYj1eSA=;
 b=UPrUE4WyatCGyPTQz6aaHSrx5JrnYjHpfTb4UAkM3OhQXBK+AjWfaNu1
 Ic6G1RrBSazm6AFVj/fnqFaBjkQolim54SbOxcgqRlnTAgMu5foAvvKuj
 iD45ORd7Ggd9RhRANrmh4+KLekOO+ybdRtyhR51wtnCwZDrZaTuNONe8u E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Jun 2022 08:41:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 08:41:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 28 Jun 2022 08:41:11 -0700
Received: from [10.110.113.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 28 Jun
 2022 08:41:10 -0700
Message-ID: <aae228c6-b1e0-91eb-8b05-a7ac38e271e0@quicinc.com>
Date: Tue, 28 Jun 2022 08:41:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Fwd: [PATCH v2 3/3] drm/msm/dp: remove dp_display_en/disable
 prototypes and data argument
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
References: <20220617232434.1139950-3-dmitry.baryshkov@linaro.org>
 <c60af04c-4985-88de-5110-341fa985b276@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <c60af04c-4985-88de-5110-341fa985b276@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/24/2022 10:37 AM, Abhinav Kumar wrote:
>
>
>
> -------- Forwarded Message --------
> Subject: [PATCH v2 3/3] drm/msm/dp: remove dp_display_en/disable 
> prototypes and data argument
> Date: Sat, 18 Jun 2022 02:24:34 +0300
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> CC: Stephen Boyd <swboyd@chromium.org>, David Airlie 
> <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson 
> <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, 
> dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
>
> Remove unused dp_display_en/disable prototypes. While we are at it,
> remove extra 'data' argument that is unused.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
> Changes since v1:
> - Rebased and dropped the dp_display_enable() chunk
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 96defacc92dc..c17a799d3009 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -608,9 +608,6 @@ static int dp_hpd_plug_handle(struct 
> dp_display_private *dp, u32 data)
>      return 0;
>  };
>  -static int dp_display_enable(struct dp_display_private *dp, bool 
> force_link_train);
> -static int dp_display_disable(struct dp_display_private *dp, u32 data);
> -
>  static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
>          bool plugged)
>  {
> @@ -894,7 +891,7 @@ static int dp_display_post_enable(struct msm_dp 
> *dp_display)
>      return 0;
>  }
>  -static int dp_display_disable(struct dp_display_private *dp, u32 data)
> +static int dp_display_disable(struct dp_display_private *dp)
>  {
>      struct msm_dp *dp_display = &dp->dp_display;
>  @@ -1676,7 +1673,7 @@ void dp_bridge_enable(struct drm_bridge 
> *drm_bridge)
>      rc = dp_display_post_enable(dp);
>      if (rc) {
>          DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
> -        dp_display_disable(dp_display, 0);
> +        dp_display_disable(dp_display);
>      }
>       /* completed connection */
> @@ -1717,7 +1714,7 @@ void dp_bridge_post_disable(struct drm_bridge 
> *drm_bridge)
>          return;
>      }
>  -    dp_display_disable(dp_display, 0);
> +    dp_display_disable(dp_display);
>       state =  dp_display->hpd_state;
>      if (state == ST_DISCONNECT_PENDING) {
