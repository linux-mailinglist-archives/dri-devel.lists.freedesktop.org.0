Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE199E845B
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 09:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DDE10E25C;
	Sun,  8 Dec 2024 08:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A93TgWD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA34310E25C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 08:58:40 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so288222e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 00:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733648319; x=1734253119; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=D7Uh+SJQekyCtS3Bb8quKYzQ2jhfqR7g6RmC561JgnU=;
 b=A93TgWD8NCZ1mT+CwI3TZ+iIDJ5pNtmoWHczODk+aw/ILY3sT9EcYy1PLsrQnfbKcS
 jI4HJ5IYopdhYSlKnsZe8adW5Je1BNf7P4vor/NEq8vjXTbLwLNShSgNiGwb8G/UhZKi
 +DFf66eJmpMj8juwPY5K1wYhQ2y6Om6JweeaRon/7cYMTeVxr2gbETzKqqMV8eGjdXmk
 xI/VnC/6hn0l+tyX9ZSbNc1BHG1lu16hvRidt3/4c8DTGNTs5qWn0ld6YakfDcJ4dBT1
 DI8219+B5jhk2ArSI7RD2p89uv+s64QQ47G3xUSusi/kPM7MNVbIo8dNX+UjlNHmWj2c
 5Ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733648319; x=1734253119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D7Uh+SJQekyCtS3Bb8quKYzQ2jhfqR7g6RmC561JgnU=;
 b=hd2yxJL7pYouhlYXHVh570cSZnRhLk4urpeMoEMh3Yi6dtasklVKOelqNP98Av2iYN
 9TBZXx1oMqA2TdZtO5EnXdRqGpa8LwZhEXj3DR6EZhWwp+uZBKfaY8O2lKGa9I2q71jU
 UU1GasobXeV5urc9oreVFOWluZuuKq8Ig8+XpS4BL4aYMmB3jmJ8JIRb0ed+CFREXSIU
 MOIh6Gy45qKZG1hZ3hVc4jEdgSPo03xHD8euRIFnjH3WaaxoymXMqQ0Cl1ZKVVgrETKf
 yGXrrL7rvoCIIqZREHkF/SeBl04ml1w8BtCsZgaVIZKgFu2hn/lvRuHj2rEjD2MyhPkx
 teaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVesaqYZZcljLm2mItZXd3QI45jSFrL+kHMykw4xC8Mm3JOs/R3/9TJSL2bEomBTMZOfqr86ShwZ4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI3BFRNUIzmJljcDojkvXpSwv1AvgWp2lHSi2u0B00rPc1WfAq
 fUj+S3hTtDo3cYjC4cEi0IXV6X2DWhYmXcm+7BxAIcswWL4IDj+kIStLuaBGteA=
X-Gm-Gg: ASbGnctbobZq6sWavfzKJG44VI7NVqoxPQZf2us0e3tHygbVQ9yEDtxE5FCMsZXtzJk
 xZUXoNEieKaPgSuxxQVQ45C/IrLRAWOsqVFUF5msEV7NW0L8l7CtU5Z66BL5sjnL/pC5QJFh+dJ
 26jLjSG9jupXFPeIB6JZyDGOyD7iZvecz7rxhifxZDJqgCImENbhHpxhX8AvuDSVnF9xeOkbAZN
 WRWrmZpEOI3OQ/1fqtr7f8sCnGgcPmFFW4jC+K+sS1R3mapgtcMlavw3jcvF+OKRTtMqmTCUtG6
 mw2pDoIOoZ5zpIo7gHOOEnBHdAIUxQ==
X-Google-Smtp-Source: AGHT+IH2ch7ihmd9jopH5ZUgfSxWgUmNfamdhAezIqSfVOYXD+euFjFOJiJWhx2N3HmtHnu0C5AiMQ==
X-Received: by 2002:a05:6512:2208:b0:540:1e17:10d2 with SMTP id
 2adb3069b0e04-5401e1713acmr110960e87.49.1733648319062; 
 Sun, 08 Dec 2024 00:58:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f22eaec0esm364933e87.72.2024.12.08.00.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 00:58:37 -0800 (PST)
Date: Sun, 8 Dec 2024 10:58:35 +0200
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 36/45] drm/msm/dp: propagate hpd state changes to dp mst
 module
Message-ID: <z55f2r7ooavjoj7gbjr4cg6xbf3p7bjayl5oe2uk26esgpdvfz@jx4kxbmyz7zq>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-36-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-36-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:07PM -0800, Abhinav Kumar wrote:
> From: Yongxing Mou <quic_yongmou@quicinc.com>
> 
> Propagate the hpd state changes to dp mst module so that it

please fix upcase.

> can be synchronized with the cable connect/disconnect.

It doesn't propagate HPD state. Instead it updates MST state when the
device is plugged / unplugged.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>  3 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 97f8228042773f51f23a9d39fc009de0798059d7..80df79a7c2077d49184cdeb7b801bf0699ff4ece 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -26,6 +26,7 @@
>  #include "dp_drm.h"
>  #include "dp_audio.h"
>  #include "dp_debug.h"
> +#include "dp_mst_drm.h"
>  
>  static bool psr_enabled = false;
>  module_param(psr_enabled, bool, 0);
> @@ -409,6 +410,17 @@ static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
>  	msm_dp->mst_active = true;
>  }
>  
> +static void msm_dp_display_set_mst_mgr_state(struct msm_dp_display_private *dp,
> +					     bool state)
> +{
> +	if (!dp->msm_dp_display.mst_active)
> +		return;
> +
> +	msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, state);
> +
> +	drm_dbg_dp(dp->drm_dev, "mst_mgr_state: %d\n", state);
> +}
> +
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->msm_dp_display.connector;
> @@ -455,6 +467,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  		goto end;
>  	}
>  
> +	msm_dp_display_set_mst_mgr_state(dp, true);
> +
>  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>  
>  end:
> @@ -521,6 +535,12 @@ static int msm_dp_display_usbpd_configure_cb(struct device *dev)
>  static int msm_dp_display_notify_disconnect(struct device *dev)
>  {
>  	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
> +	struct msm_dp *dp_display = &dp->msm_dp_display;
> +
> +	if (dp_display->mst_active) {
> +		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
> +		dp_display->mst_active = false;
> +	}
>  
>  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index 313eb63b9a35cbbb36db2d7d8f0a85e4441f2998..1149af71d01f99ba5326870fa69e30ae081d6101 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -1043,6 +1043,24 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
>  	return &mst_connector->connector;
>  }
>  
> +int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
> +{
> +	int rc;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +
> +	if (state)
> +		mst->mst_session_hpd_state = state;

Where is mst_session_hpd_state cleared?

> +
> +	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
> +	if (rc < 0) {
> +		DRM_ERROR("failed to set topology mgr state to %d. rc %d\n",
> +			  state, rc);
> +	}
> +
> +	drm_dbg_dp(dp_display->drm_dev, "dp_mst_display_set_mgr_state state:%d\n", state);
> +	return rc;
> +}
> +
>  static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
>  	.add_connector = msm_dp_mst_add_connector,
>  };
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index b1adb8a61115d4809107553809206bb2ed3c6c3d..b89913ef7b343d449e0003f56b96df049fa36e89 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -105,5 +105,6 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams,
>  		    u32 max_dpcd_transaction_bytes, struct drm_dp_aux *drm_aux);
>  
>  void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
> +int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
>  
>  #endif /* _DP_MST_DRM_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
