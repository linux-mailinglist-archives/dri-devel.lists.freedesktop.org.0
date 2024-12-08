Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855FC9E84E1
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 13:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE41F10E455;
	Sun,  8 Dec 2024 12:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I1C6QOyC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5781710E44F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 12:00:40 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ffc357ea33so31104781fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 04:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733659238; x=1734264038; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IZQDqZh24CIlU2q7DysLNqODQ6Kiip1cX4ZxRIqPVaA=;
 b=I1C6QOyC3u4tQ4LyjYjTS3i25YUNFqbL2HHASzuFvfKmCnYWd2MGW9ceME2ZWag1A+
 WSB4vd1h7ZWsgynLFhgR6SiEMlwN29LX36skMeV3ij/y21xJgFXnztmL8K3i5/6k01GZ
 KW6cGqQUSvxxlBwqeOM3mSSVKtd6y/ZJ2X+MSKvoSDWWUBqotnyOYlD7h7r94XR91apA
 fOptGjW6lP2s8LrFgLpiPCWZ0Mu14u1PmZgnfo4Rsjjf3nYUjmAExKHl3qpHs0U7CSUQ
 5UMN7CVsWsE+f8cLQbXNJlv0PU409Xi9O18DHY/xVopPWClxM/Z+D1Yhf6smQDmsVctL
 ljpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733659238; x=1734264038;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IZQDqZh24CIlU2q7DysLNqODQ6Kiip1cX4ZxRIqPVaA=;
 b=DLCnldxRt5vuailMJebzZgM8hlY1DGXPkS+W2SCLAhcVaxcobwaOpPwLCCiiWuhBLq
 anGA3yPu2BLzH7fC1qRiSPu1Z9gNp5B8k16Gr77XG2HNWBH0eQa3tmZmZkkEc+xjpDxv
 E0N4SlnkeRghFPeuTodjeqFrLjVTddqtmnONFlAgMx0QLGAbqUPjwUfnt0NH9OqR7qKF
 AP+LyJMrEcE6bMae9xVeeXVK020Ao/1fJyp77hzpmj+V8jIZcOeWZ2X2WUC9S19qDY3a
 Mj12Fo/38rwtfPWzsjwVRlCA+g6PVLPRPIag4RFFckfZBk5CNWVLxe0dEMZ07ZkM97ls
 KS0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHvtNVEl6dMjABwR3DL4O8Ivmo2oi30N8M9fjx3mBDG/B806U2wHXWrShP4kzDd/LvmR62KDBj8So=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHmBwKiRMOFloNycm1g6A4AN9SaBT3cfjA2VyS4PWCkvP361d7
 Yih3Mnvhbqxed63n8f51qkLyuoKepw28rADSsMhfXRFwtQEcTeJzzNAG/F87ahw=
X-Gm-Gg: ASbGncvoagsE9zaM97aTfV4b0YQAdbMu3eRfBJZkScitwVqo9eEOF4M75fJN8XUpjX+
 cHTI8juj5HwIp0Pq4QHukTBRc5RV+9rMqLoNrC0rRh5A1uHB+MBCKxEoLd3KC+doYg3mX8Xtj4i
 GmO/Z1Bw0by9rPk7Ex2metmAHEWcU0i0a6wRSURbZ7oOVvXWHUhcnv2bJjZrCxwwvgQPdOCYwri
 0QdaZMLOpeRkHoHJxEapKK9o8oSSmr4l0EjsLadPlcLwdKzk6/z+AEg0oAdIt18CtC0n31Yv3/A
 XbtdquwWr5Ofz2/uQsPMzxfgSVPCpg==
X-Google-Smtp-Source: AGHT+IFtuMd2CLZMp/J0k4uDOw6R2C77JANZoosZcIAaqEzW6+8T96FmwIKt4fcpD8nXNf+JBXuB1Q==
X-Received: by 2002:a2e:bccb:0:b0:2ff:cfbb:c893 with SMTP id
 38308e7fff4ca-3002f688d90mr36234661fa.6.1733659238447; 
 Sun, 08 Dec 2024 04:00:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3022397e845sm144661fa.66.2024.12.08.04.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 04:00:37 -0800 (PST)
Date: Sun, 8 Dec 2024 14:00:34 +0200
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
Subject: Re: [PATCH 43/45] drm/msm/dp: populate the max_streams for sa8775
 mst controller
Message-ID: <5hmhxnqp3ix636jdsxqgmdkrzvsduax4ft5uec35qduuwif2rz@pwbm6hchctrw>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-43-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-43-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:14PM -0800, Abhinav Kumar wrote:
> Populate the max_streams for DP controllers to indicate MST support.
> 
> If the pixel clock handle for the second stream fails, treat it as
> SST case rather than a complete failure.

Could you possibly clarify:
- Are there MSM DP controllers which do not support MST?
- Are there MSM DP controller which support more than 2 streams?

It might be easier to to set max_streams statically rather than setting
it via the descs.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 ++
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++++++---
>  3 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index d4915a962f97b3d2a347456e197265a5dc043eb0..0e5ebcdab00936cf0ce6e35514f2932158530cc0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2438,6 +2438,15 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>  	return 0;
>  }
>  
> +int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	return ctrl->num_pixel_clks;
> +}
> +
>  struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
>  			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
>  			struct msm_dp_catalog *catalog,
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 9ad7022d6217572395d69294c3cc4d4dbaddf0ac..f72a499809ec01a9cc5bb79762bc2604820426a1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -54,4 +54,6 @@ void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
>  				      u32 start_slot, u32 tot_slots);
>  void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>  
> +int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
> +
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 528cda1453a85f5f8dd37bb0d2366548016c88e4..db563af19461089dbcaccce0d03fd03d5aa567aa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -126,6 +126,7 @@ struct msm_dp_desc {
>  	unsigned int id;
>  	bool wide_bus_supported;
>  	const unsigned int *intf_map;
> +	unsigned int max_streams;
>  };
>  
>  /* to be kept in sync with enum dpu_intf of dpu_hw_mdss.h */
> @@ -149,10 +150,10 @@ static const unsigned int stream_intf_map_sa_8775p[][DP_STREAM_MAX] = {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true, .max_streams = 2,
>  	  .intf_map = stream_intf_map_sa_8775p[MSM_DP_CONTROLLER_0],
>  	},
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true, .max_streams = 2,
>  	  .intf_map = stream_intf_map_sa_8775p[MSM_DP_CONTROLLER_1],
>  	},
>  	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> @@ -1481,7 +1482,10 @@ int msm_dp_get_mst_max_stream(const struct msm_dp *dp_display)
>  
>  	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	return dp_priv->max_stream;
> +	if (dp_priv->max_stream == msm_dp_ctrl_get_stream_cnt(dp_priv->ctrl))
> +		return dp_priv->max_stream;
> +	else
> +		return DEFAULT_STREAM_COUNT;
>  }
>  
>  int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> @@ -1517,6 +1521,9 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>  
>  	dp->max_stream = DEFAULT_STREAM_COUNT;
>  
> +	if (desc->max_streams > DEFAULT_STREAM_COUNT)
> +		dp->max_stream = desc->max_streams;
> +
>  	dp->intf_map = desc->intf_map;
>  
>  	rc = msm_dp_init_sub_modules(dp);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
