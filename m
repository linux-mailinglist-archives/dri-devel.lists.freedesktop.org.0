Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1FA9E69D1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9B510E197;
	Fri,  6 Dec 2024 09:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lRmtP2jI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0552010F033
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:11:34 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53e23fb807dso1546333e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733476292; x=1734081092; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T8gpX618iMkRwGuO0MNBjOsaC1WUlIK8H0NQRZoPtiI=;
 b=lRmtP2jIBE9470OtALeQc6LfUmClqrsJ/OEJU3SPnK/iTKt79wIg9L2kyqrrg+uwqt
 sMasqZD4WP+kPG3kGv/VTHYRWIj2Oqjkj2BQz4fvYeykUBrnoCfYVR6psXZh41KB49pM
 1KtQ4hwAecsDhhXq7dbsDXRCBSWVPaFecLP3J2DwaLzzPUrqVJdkAlRjoJkH4S44qBEL
 CXsOL/TWtFtrn3yvVjTEB30tU+I3AOWAEImSPziQZajDUhO+rxgT+MyYgCniApVqIQ9g
 1jRk+XEbu92qkBMApQWqiKIHP2o6H31864YtrDwpNXw9OIkENLGW2Zn+xUEqDDBJw1uX
 9f7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733476292; x=1734081092;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8gpX618iMkRwGuO0MNBjOsaC1WUlIK8H0NQRZoPtiI=;
 b=MfaxCsZU9Ulic/rtrttZrcOFQAX0vxnWvt/aGjDb3z1ELvI8dodATRJRsD5GJytV/w
 9yyhB4Z5YCFvy4A8TsC+nQgclLVhEStAqy8ndAxj8mbbgE5Jzxa0QCjE1wB8o02UGbHA
 PLVnjKgxP0++2siSrS9PapTR74ZZYKRIn8vDj4SX5JDS31pFhAzqBYHQkOSlTx3caKF7
 wOwN1452yYjX6s/X4vVrrQuvFDJ+whaaz42T/AUpm5QHniMCTTs10KkOjpCX+yYguMoj
 xCaRTeh1//z71DiPKEG731XyXsTOKkn/zqgCYnLO74BdEdBd2M6f8HL4CGRcOYI8qmH6
 Zbag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP225C9mzr55KTsm6UyE9/CjzQsiJ+maELQXuYdXcj3HTe5QcEmVnNmt4T+f55zgP02zXoDsgOhus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzuff3QqEJJE7FfHPUOBfoaJKGygdy26AXdD74TwSC63KVJukRe
 l7I4YJGj1OqE9dnWbLNG+/V2rkyEy+tRbddC3CE/uuyvPZYN6ZAjAaddoKudjW0=
X-Gm-Gg: ASbGncsMkiSR0wzHG6LfGKnMYcHcz6Pt0lqSwpaDbsqvr9XEZwEo4g8fZFe3Rqh3aMB
 zHrQ4fuYbNP7rvgV3LV00QH938R+ozzE9xId0wL4g1F5ICYu2b/27ZBPTmXELKkkLwRVESS8zhN
 lWXMY3Qg0LAdPthT92VaO7iAdjhxIAspb2he+/Jb96YvMgUICZoLy0427t4ZF9GygQr0zHrtjCq
 tEhMqnNICdoTfwp+/45A9OEyWCxGN9ixhrT3k9MoRu3L6eY/G2FbBTEKLyBUkrHXIa5YZds5b+l
 w3uIR05IggH59+wKn6flLPmxgn7A1g==
X-Google-Smtp-Source: AGHT+IGNi8p6tF7mI10HM7W5wGLN6DaQZ+XRjtGNfF7C+qKH+cNm/VA+lU/O/GtzKadPV+/qvj5+wQ==
X-Received: by 2002:a05:6512:2316:b0:53d:f712:53ce with SMTP id
 2adb3069b0e04-53e2c2b18f8mr560342e87.7.1733476292070; 
 Fri, 06 Dec 2024 01:11:32 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229c1ef2sm442949e87.186.2024.12.06.01.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:11:30 -0800 (PST)
Date: Fri, 6 Dec 2024 11:11:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 10/45] drm/msm/dp: move the pixel clock control to its
 own API
Message-ID: <mqreu34au5g6yfogb2ijv7f2yx76fqoba2n3kljioagrfe2ilz@skoljluurawr>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-10-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-10-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:41PM -0800, Abhinav Kumar wrote:
> Enable/Disable of DP pixel clock happens in multiple code paths
> leading to code duplication. Move it into individual helpers so that
> the helpers can be called wherever necessary.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 76 ++++++++++++++++++++++------------------
>  1 file changed, 41 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 0bed85b5c8e8133ffa8c74d5de22668905396d09..118f5ed83e464f9f27f813eb39624f9c3189f5ac 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1698,6 +1698,30 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>  	return success;
>  }
>  
> +static int msm_dp_ctrl_stream_clk_on(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> +{
> +	int ret;
> +
> +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	if (ret) {
> +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	if (ctrl->stream_clks_on) {
> +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> +	} else {
> +		ret = clk_prepare_enable(ctrl->pixel_clk);
> +		if (ret) {
> +			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +			return ret;
> +		}
> +		ctrl->stream_clks_on = true;
> +	}
> +
> +	return ret;
> +}
> +
>  static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
>  						struct msm_dp_panel *msm_dp_panel)
>  {
> @@ -1724,22 +1748,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
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
> +	ret = msm_dp_ctrl_stream_clk_on(ctrl, pixel_rate);
>  
>  	msm_dp_ctrl_send_phy_test_pattern(ctrl);
>  
> @@ -1999,21 +2008,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
>  
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	ret = msm_dp_ctrl_stream_clk_on(ctrl, pixel_rate);
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
> +		DRM_ERROR("failed to enable stream pixel clk\n");
> +		return ret;
>  	}
>  
>  	/*
> @@ -2041,10 +2039,21 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  	drm_dbg_dp(ctrl->drm_dev,
>  		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
>  
> -end:
>  	return ret;
>  }
>  
> +static void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl)

At least this should come right after msm_dp_ctrl_stream_clk_on().

> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	if (ctrl->stream_clks_on) {
> +		clk_disable_unprepare(ctrl->pixel_clk);
> +		ctrl->stream_clks_on = false;
> +	}
> +}
> +
>  void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *dp_panel)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
> @@ -2115,10 +2124,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	msm_dp_catalog_ctrl_reset(ctrl->catalog);
>  
> -	if (ctrl->stream_clks_on) {
> -		clk_disable_unprepare(ctrl->pixel_clk);
> -		ctrl->stream_clks_on = false;
> -	}
> +	msm_dp_ctrl_stream_clk_off(msm_dp_ctrl);
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
