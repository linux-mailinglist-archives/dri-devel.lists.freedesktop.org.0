Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3715AD1E93
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 15:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BFF10E2ED;
	Mon,  9 Jun 2025 13:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxRqhYtI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF93310E11E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 13:16:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55993O2d006202
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 13:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LqafI7UpDS2G2nMa59iMzkyR
 7WPx8aM+c9eWQscV7b4=; b=MxRqhYtIwoD2339euRI1eVA5/1yoh2y6a3NGPpRh
 OTibOgclf8nstd3PPA30xWY3rVTqqmR4Y/EZ1Kgu+oc7QPWBJW6AkboMDP+OHuHw
 qIIyY6eG1ab744wQXZ8R7KRqFLPovgmGKOSoxFGzWrPktJFu8q8aoFaScztnNoex
 X23yyvwYox3jzQ7p0GpPskOdW6iX898aCWzrTs2u6S2r6QFBKQw9znEAu4IL+z93
 fhNXsWQIAeO2iRxOz0ZxOqvBDL395YrmZK/MsTt/zM6Ppv8lswrcBlAWp1zLd/9V
 nW1I5QBm8WRzIbholXtjHeO2JpuZIiZh3NwCETep3vz8aw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxpf3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 13:16:49 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7387447988bso1057033a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 06:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749475008; x=1750079808;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LqafI7UpDS2G2nMa59iMzkyR7WPx8aM+c9eWQscV7b4=;
 b=q+LeqwGEiE1qJsE8T5T6nvu/lOyZhCrsUj6NdAYyqTMa8u+LPcV39Jz67xaSq4xsy3
 N/CcYfoqsPt8wq6IIq9lX5VLjkhTKqNtaHbXjoaXcZbZc2jnJbfXWMGo6o96GerymX44
 yh9++rq5C6jas94G15Ain8+hAwUZYJoXZEHRjKNsVVhzudJWvZOcT45xyRJ1+ct/7J3X
 DZRYnDDWkpKjkvtndUvof2tEMxJU0mGJOylafteQm8asEzS9rNktKVbxGXrlLw6Z4R0b
 HSz94imtd88l+6jKy8bnT4qvRI28TwAVXZa9eruUzcljcikkqG+I66rZhzvTueHN36yq
 fY+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbAgxhYur8SsF9zGPr10kF6cyghLXRodPyRmrgKQpJk3ONkXJy0hWqZ4gSFC/Bi+4SQvofS476yio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGLdTTtDnmfJxFaSjvj/7pkCJytNgRp0ACnsvhN75H3Npj727q
 O2sPZIUxEV5iIQAYUWKKP2q+RUCSq2ITYKNAD1LihULpR/ScjIJrcZRkEv1UZo0usmFShDfRMu6
 s+/9M5MsTQDzGAmKsQONX592woiFWjh3I1FE2ZN1wvb093euECzCFfB5jcXDPbMZ+ua9PJe7GPs
 OMaMY=
X-Gm-Gg: ASbGnctjGV88WpYdSAadS0o3nsx9yIb0w49BUVmoJyrXZvbbo4Ph5XBT4mY83LWnppG
 OYq1yaW3q0K8nfA5/F8753pfuR0h+sa4vRBKpp7UoNrtAOP1Yx9UgMab7Q0tWVb+Syy3QnDqIWT
 pdI7FAlqDu/k4mHP/InrDqbg+y6DJdIXvIFf+C1x7YPYylLH0ZHwMURZg0JGhKeTINfMG2tSQki
 F9PESbM1RYOJVEtFFEJ4drVApZz07KLl1CkUiY/FBcKO8w2jIraYE3P2HPr5lV8Kv4RRW93Gm9g
 EoemUworrOWCijybxIY73mtP46owzoesxAGe2zdaSeSvRB73ozP/mMiPO+wK18YP62i1ttyMDNg
 =
X-Received: by 2002:a05:6830:730e:b0:735:ac82:1ad4 with SMTP id
 46e09a7af769-73888e10d56mr9635140a34.10.1749475008536; 
 Mon, 09 Jun 2025 06:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdXJjdZDljViV4FdBjdzNy5cmzSfLLgDg6pGta3W3UTkuyEnx8yRKEOFsY04mEbYRFh+EByA==
X-Received: by 2002:a05:6830:6681:b0:72b:80b4:dbca with SMTP id
 46e09a7af769-73888d9e9b4mr10164715a34.5.1749474996438; 
 Mon, 09 Jun 2025 06:16:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a899sm1134523e87.170.2025.06.09.06.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 06:16:34 -0700 (PDT)
Date: Mon, 9 Jun 2025 16:16:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 06/38] drm/msm/dp: move the pixel clock control to its
 own API
Message-ID: <5b2lpjd2raqmowi466avustasdjsssl2tjwogd3ixjg7gi3dxv@cqtkbtcijnlc>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-6-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-6-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: Ax6GEENksb7FjDgblv2Tc2VZiUOnBkVU
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6846dec1 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=Spwbhj-UJuWzIqB0iS8A:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ax6GEENksb7FjDgblv2Tc2VZiUOnBkVU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NiBTYWx0ZWRfX+QgKwrznILIN
 w9p81f21QJ0+tJpX9GQOTXced8hLCCnzSnodsaWCH/tdj27vFlDTh6oZUgzg9nF4BgrjawGOKrF
 0mfRQFuQOq+uE27JJtMO6dyiDIJY7XgGRXl8E1SL7Tfbh9KYgil91mLFIpjLInfHDb6E8aPfIV3
 k+F9q9TkwSRY5OT9xet5JI1GZsvqOOX4CCfnH3sz3zYqJLJDY2yFoVt2oOMTrvvnFGwUNEmQNH/
 2cpjsTZeSgANIojPSR6/ICGMYSQn5hw0R6bxpKztIh9vGix6NzQXdJNh3C37hx0S81p37lYoyRV
 wsIBSNaVTUety+uVPIfTfLP2EYiwRrOfIe6+tJow2BE+ebXgvAfGJb7lgd1dpYQKdp7fruxIwfY
 O6czPWK3ldMeMjcFkA/JzhXC/dew1rf3EXl14/iA43casfXzdNWboy3RY20o6wi74O9lo2n0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090096
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 09, 2025 at 08:21:25PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Enable/Disable of DP pixel clock happens in multiple code paths
> leading to code duplication. Move it into individual helpers so that
> the helpers can be called wherever necessary.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 98 +++++++++++++++++++++-------------------
>  1 file changed, 52 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index aee8e37655812439dfb65ae90ccb61b14e6e261f..ed00dd2538d98ddbc6bdcbd5fa154fd7043c48d6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -97,7 +97,7 @@ struct msm_dp_ctrl_private {
>  
>  	bool core_clks_on;
>  	bool link_clks_on;
> -	bool stream_clks_on;
> +	bool pixel_clks_on;

As you are touching this part, how many paths lead to pixel clock being
enabled and/or disabled? Can we sort them out and drop this flag, making
sure that the clock can be enabled only in one place and disabled in
another one (hopefully)?

>  };
>  
>  static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> @@ -1406,8 +1406,8 @@ int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl->core_clks_on = true;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> -		   str_on_off(ctrl->stream_clks_on),
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> +		   str_on_off(ctrl->pixel_clks_on),
>  		   str_on_off(ctrl->link_clks_on),
>  		   str_on_off(ctrl->core_clks_on));
>  
> @@ -1425,8 +1425,8 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl->core_clks_on = false;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> -		   str_on_off(ctrl->stream_clks_on),
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> +		   str_on_off(ctrl->pixel_clks_on),
>  		   str_on_off(ctrl->link_clks_on),
>  		   str_on_off(ctrl->core_clks_on));
>  }
> @@ -1456,8 +1456,8 @@ static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl->link_clks_on = true;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> -		   str_on_off(ctrl->stream_clks_on),
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> +		   str_on_off(ctrl->pixel_clks_on),
>  		   str_on_off(ctrl->link_clks_on),
>  		   str_on_off(ctrl->core_clks_on));
>  
> @@ -1475,8 +1475,8 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl->link_clks_on = false;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> -		   str_on_off(ctrl->stream_clks_on),
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> +		   str_on_off(ctrl->pixel_clks_on),
>  		   str_on_off(ctrl->link_clks_on),
>  		   str_on_off(ctrl->core_clks_on));
>  }
> @@ -1737,6 +1737,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>  	return success;
>  }
>  
> +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> +{
> +	int ret;
> +
> +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	if (ret) {
> +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	if (ctrl->pixel_clks_on) {
> +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> +	} else {
> +		ret = clk_prepare_enable(ctrl->pixel_clk);
> +		if (ret) {
> +			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +			return ret;
> +		}
> +		ctrl->pixel_clks_on = true;
> +	}
> +
> +	return ret;
> +}
> +
> +static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	if (ctrl->pixel_clks_on) {
> +		clk_disable_unprepare(ctrl->pixel_clk);
> +		ctrl->pixel_clks_on = false;
> +	}
> +}
> +
>  static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
>  						struct msm_dp_panel *msm_dp_panel)
>  {
> @@ -1763,22 +1799,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	}
>  
>  	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> -	if (ret) {
> -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> -		return ret;
> -	}
> -
> -	if (ctrl->stream_clks_on) {
> -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> -	} else {
> -		ret = clk_prepare_enable(ctrl->pixel_clk);
> -		if (ret) {
> -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> -			return ret;
> -		}
> -		ctrl->stream_clks_on = true;
> -	}
> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>  
>  	msm_dp_ctrl_send_phy_test_pattern(ctrl);
>  
> @@ -1998,8 +2019,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
>  		   ctrl->link->link_params.num_lanes);
>  
>  	drm_dbg_dp(ctrl->drm_dev,
> -		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> -		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
> +		   "core_clk_on=%d link_clk_on=%d pixel_clks_on=%d\n",
> +		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->pixel_clks_on);
>  
>  	if (!ctrl->link_clks_on) { /* link clk is off */
>  		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
> @@ -2038,21 +2059,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
>  
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>  	if (ret) {
> -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> -		goto end;
> -	}
> -
> -	if (ctrl->stream_clks_on) {
> -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> -	} else {
> -		ret = clk_prepare_enable(ctrl->pixel_clk);
> -		if (ret) {
> -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> -			goto end;
> -		}
> -		ctrl->stream_clks_on = true;
> +		DRM_ERROR("failed to enable pixel clk\n");
> +		return ret;
>  	}
>  
>  	/*
> @@ -2080,7 +2090,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  	drm_dbg_dp(ctrl->drm_dev,
>  		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
>  
> -end:
>  	return ret;
>  }
>  
> @@ -2154,10 +2163,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	msm_dp_catalog_ctrl_reset(ctrl->catalog);
>  
> -	if (ctrl->stream_clks_on) {
> -		clk_disable_unprepare(ctrl->pixel_clk);
> -		ctrl->stream_clks_on = false;
> -	}
> +	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
>  
>  	dev_pm_opp_set_rate(ctrl->dev, 0);
>  	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
