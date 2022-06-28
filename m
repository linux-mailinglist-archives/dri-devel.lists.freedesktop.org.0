Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4FA55E5BA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 17:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7821610F8E0;
	Tue, 28 Jun 2022 15:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C29410F6FF;
 Tue, 28 Jun 2022 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656430658; x=1687966658;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=NXj1WZe08kEUAOpbbP1dP8Pw6O6wQJTbDFXzWboZB6I=;
 b=rvNMfaA/XStyJC7eC4Wq5rrXKxgNSsUqyInHt2hKRLuYp87PJZ0W5buX
 TULpPoBQOZ0Qz+gTF0/Boq5KE6ujk9gsGGcgbTotgnd/ROi4+guFAZthd
 LwyRH1UhCgbU/Q5jyq2Oatwm4v306Dho0USv1pJ9eD8yhxnuGpSbMfYCF Q=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Jun 2022 08:37:36 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 08:37:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 28 Jun 2022 08:37:35 -0700
Received: from [10.110.113.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 28 Jun
 2022 08:37:34 -0700
Message-ID: <fedce9fe-5145-ea90-9012-7e5dceef3163@quicinc.com>
Date: Tue, 28 Jun 2022 08:37:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Fwd: [Freedreno] [PATCH v2 1/3] drm/msm/dp: remove unused stubs
Content-Language: en-US
To: <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
 <9b5b6fed-cd42-fd38-a1ff-58cb590482fe@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <9b5b6fed-cd42-fd38-a1ff-58cb590482fe@quicinc.com>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/24/2022 10:36 AM, Abhinav Kumar wrote:
>
>
>
> -------- Forwarded Message --------
> Subject: [Freedreno] [PATCH v2 1/3] drm/msm/dp: remove unused stubs
> Date: Sat, 18 Jun 2022 02:24:32 +0300
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> CC: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, 
> dri-devel@lists.freedesktop.org, Bjorn Andersson 
> <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, Stephen 
> Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
>
> Refactoring DP code transformed several functions into empty stubs.
> Remove them.
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 35 -----------------------------
>  1 file changed, 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 08e3f0b1b395..fea610793dc4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -857,11 +857,6 @@ static int dp_display_set_mode(struct msm_dp 
> *dp_display,
>      return 0;
>  }
>  -static int dp_display_prepare(struct msm_dp *dp_display)
> -{
> -    return 0;
> -}
> -
>  static int dp_display_enable(struct dp_display_private *dp, u32 data)
>  {
>      int rc = 0;
> @@ -938,11 +933,6 @@ static int dp_display_disable(struct 
> dp_display_private *dp, u32 data)
>      return 0;
>  }
>  -static int dp_display_unprepare(struct msm_dp *dp_display)
> -{
> -    return 0;
> -}
> -
>  int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>          hdmi_codec_plugged_cb fn, struct device *codec_dev)
>  {
> @@ -1458,21 +1448,9 @@ static int dp_pm_suspend(struct device *dev)
>      return 0;
>  }
>  -static int dp_pm_prepare(struct device *dev)
> -{
> -    return 0;
> -}
> -
> -static void dp_pm_complete(struct device *dev)
> -{
> -
> -}
> -
>  static const struct dev_pm_ops dp_pm_ops = {
>      .suspend = dp_pm_suspend,
>      .resume =  dp_pm_resume,
> -    .prepare = dp_pm_prepare,
> -    .complete = dp_pm_complete,
>  };
>   static struct platform_driver dp_display_driver = {
> @@ -1686,13 +1664,6 @@ void dp_bridge_enable(struct drm_bridge 
> *drm_bridge)
>          return;
>      }
>  -    rc = dp_display_prepare(dp);
> -    if (rc) {
> -        DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
> -        mutex_unlock(&dp_display->event_mutex);
> -        return;
> -    }
> -
>      state =  dp_display->hpd_state;
>       if (state == ST_DISPLAY_OFF) {
> @@ -1706,7 +1677,6 @@ void dp_bridge_enable(struct drm_bridge 
> *drm_bridge)
>      if (rc) {
>          DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
>          dp_display_disable(dp_display, 0);
> -        dp_display_unprepare(dp);
>      }
>       /* completed connection */
> @@ -1731,7 +1701,6 @@ void dp_bridge_post_disable(struct drm_bridge 
> *drm_bridge)
>  {
>      struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
>      struct msm_dp *dp = dp_bridge->dp_display;
> -    int rc = 0;
>      u32 state;
>      struct dp_display_private *dp_display;
>  @@ -1750,10 +1719,6 @@ void dp_bridge_post_disable(struct drm_bridge 
> *drm_bridge)
>       dp_display_disable(dp_display, 0);
>  -    rc = dp_display_unprepare(dp);
> -    if (rc)
> -        DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
> -
>      state =  dp_display->hpd_state;
>      if (state == ST_DISCONNECT_PENDING) {
>          /* completed disconnection */
