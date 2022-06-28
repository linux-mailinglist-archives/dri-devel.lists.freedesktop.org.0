Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F42955E5BC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 17:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125C010EC5A;
	Tue, 28 Jun 2022 15:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8417510E50E;
 Tue, 28 Jun 2022 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656430782; x=1687966782;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=/qonCNsytz4hwgdhglQD2xakJA85YDY3SfoM4l2DDeY=;
 b=jhWZqw49cdous4uLNUfZSEUkXUxpUI0e4UQr/Jo92KzKu6ifPx/qduQw
 Ra1US5Oy1hfmvyDDMhQ1rn+uTvbueKqJf3l11aRVJs6Wbous5Fpnc7lll
 UkrLXC08vxHrgq5VTIUs3Nwg8PyqJOmCwpYtIQpFKKKNLtGY4ykuRUcbg A=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Jun 2022 08:39:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 08:39:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 28 Jun 2022 08:39:41 -0700
Received: from [10.110.113.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 28 Jun
 2022 08:39:40 -0700
Message-ID: <fdba8976-1bae-9bb2-60a3-bd206bf03a52@quicinc.com>
Date: Tue, 28 Jun 2022 08:39:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Fwd: [PATCH v2 2/3] drm/msm/dp: rename second
 dp_display_enable()'s argument
Content-Language: en-US
To: <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220617232434.1139950-2-dmitry.baryshkov@linaro.org>
 <b88142b5-2614-23e6-75fd-46f864716fd7@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <b88142b5-2614-23e6-75fd-46f864716fd7@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/24/2022 10:36 AM, Abhinav Kumar wrote:
>
>
>
> -------- Forwarded Message --------
> Subject: [PATCH v2 2/3] drm/msm/dp: rename second 
> dp_display_enable()'s argument
> Date: Sat, 18 Jun 2022 02:24:33 +0300
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> CC: Stephen Boyd <swboyd@chromium.org>, David Airlie 
> <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson 
> <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, 
> dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
>
> To follow up recent changes, rename (and change type of) second
> dp_display_enable()'s argument from generic u32 data to bool
> force_link_train, which is later passed to dp_ctrl_on_stream().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

> ---
> Changes since v1:
>  - Added patch
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index fea610793dc4..96defacc92dc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -608,7 +608,7 @@ static int dp_hpd_plug_handle(struct 
> dp_display_private *dp, u32 data)
>      return 0;
>  };
>  -static int dp_display_enable(struct dp_display_private *dp, u32 data);
> +static int dp_display_enable(struct dp_display_private *dp, bool 
> force_link_train);
>  static int dp_display_disable(struct dp_display_private *dp, u32 data);
>   static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
> @@ -857,7 +857,7 @@ static int dp_display_set_mode(struct msm_dp 
> *dp_display,
>      return 0;
>  }
>  -static int dp_display_enable(struct dp_display_private *dp, u32 data)
> +static int dp_display_enable(struct dp_display_private *dp, bool 
> force_link_train)
>  {
>      int rc = 0;
>      struct msm_dp *dp_display = &dp->dp_display;
> @@ -868,7 +868,7 @@ static int dp_display_enable(struct 
> dp_display_private *dp, u32 data)
>          return 0;
>      }
>  -    rc = dp_ctrl_on_stream(dp->ctrl, data);
> +    rc = dp_ctrl_on_stream(dp->ctrl, force_link_train);
>      if (!rc)
>          dp_display->power_on = true;
>  -- 2.35.1
>
