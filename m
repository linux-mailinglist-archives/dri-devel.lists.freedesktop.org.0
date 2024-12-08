Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B59E84BA
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 12:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7CE10E261;
	Sun,  8 Dec 2024 11:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F9Ql346Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F46510E261
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 11:44:33 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30219437e63so4901531fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 03:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733658272; x=1734263072; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eWB3sye8cWIxHYXqy1h9WuTO1cA5DNUjc+3vEKAXYac=;
 b=F9Ql346YIuS+Ke44NyN4UKaGPBnT0GOL4a7YJmmcGyC+sNLc1aHGnQyJmQ43hDvS5q
 KC6tWxQWlhFZPvCxZYyitBbn9JXirmYA9SlJ/lDYTxGnnTxVpysOnTS0v3VzhTDxbvm/
 uZVcL8Vy2wZ9Y4JBNQxnKD9a5sRv5PNDtZIYOE1a02n+WHfs016tq63zIoONi/taHw87
 BSeRImHlS/t3wx0eT4tEwrL/2HcaRM7yO3DYT4WPlyegncpv78OOYzqiIKu8/S2+4D7u
 D2YIFTi2j4XcjZszuBHOTWdtPyrFvXz+j4vi5WGFddXr/uASRCmPU9Mw5pjA2nNUeefM
 AorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733658272; x=1734263072;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eWB3sye8cWIxHYXqy1h9WuTO1cA5DNUjc+3vEKAXYac=;
 b=tqZHfoVbRDeWTk1su3dA7A+wMMzVueeyEduRtUqsJW246SFZ5ZwUrLyqPAoRomXQWY
 IbSdZfjLWQYqTzutXwgHEC8YzkTutK4YvSzYVGIWLPer8J0dGN3y0XyhsGmUOKUGeB61
 J2YLBTJSDCgeRc6t03ypbXh5n44vxZBKa25xG7FVQvS540bNMyhq20vSwpRYaW47jvY/
 zK2YG2CElE/WifvW22LEAU0tyQbGVCPf9eaDPvATeUlKciVuPYFyKMMJcGpAvkqNy1QO
 AWWx9cKGFE7UueG7krN7lC5z+R8DHObXETwJD3wi49kHa+DbaESHVKPtqVt7DrelVt+8
 Ik9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpGYS/LqSP5aC/gbG3oFr2ehvFLPBHstxOwFb+SPh0m7PllPy6U8bLN1R1A48sFjKHYBPWACf5hWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZWWJ0AwQ6UKn8Q1gPnd7ANA9T++Cmu8nQrBQAXIp+ZKZE95jc
 8vIT1hUrloP6HWmPldcJpW92iLW9uCChf2DCTXwknJsARJO9i6EmkoDBuy/p9qU=
X-Gm-Gg: ASbGncss74Tv6Ie9qt/2qAnjc4QQuYYWKMKyHxhLo5eYaRu0IS53UoskfJb5vPY9WW+
 ujiD2Cip+W9ZmHVVB0QvqZquIlkpjcDNiiUj5vrGCMEOt2VC8RoJ/MkRHtpviyXEEVpDj2Y6c4I
 OUpk2txXfF3upp6eHlx3EtZwY1w4Kz50RXooQYeTEWESwVJoRzPgD29crvlL7riWhx9d7M97c97
 5dbzoXvAb2S2Ypa7EPj6iNOmlkF1RyAutq6lBG3qNcer6dMOhkAomhTKX1lOUK36gF1Mr3343UI
 P7FOlmevl0DTNKWVEI8cmTwMYEk6zw==
X-Google-Smtp-Source: AGHT+IF9OLSj0xMfFrYE07UenkQPdpJOUslvuXVUW/CXO34qS9IIktGa66/ZoTzyAzDfoEFHUCLSFw==
X-Received: by 2002:a05:651c:1614:b0:302:1d85:1045 with SMTP id
 38308e7fff4ca-3021d851207mr5037341fa.20.1733658271617; 
 Sun, 08 Dec 2024 03:44:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020e6fbcfsm10100841fa.121.2024.12.08.03.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:44:30 -0800 (PST)
Date: Sun, 8 Dec 2024 13:44:27 +0200
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
Subject: Re: [PATCH 23/45] drm/msm/dp: always program MST_FIFO_CONSTANT_FILL
 for MST
Message-ID: <lks6otgplrjldckvce6a3jrofefm7q3kp5swab6y5hk22iz6f3@lp2pg7kzzhoq>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-23-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-23-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:54PM -0800, Abhinav Kumar wrote:
> As required by the hardware programming guide, always program
> the MST_FIFO_CONSTANT_FILL for MST use-cases.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  3 +++
>  3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 4826a698979ce7c37112812299879411c5743fa9..3cfa9fd0c6f5e664a65e6d9b74e5c9f22ad711f2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -1009,6 +1009,30 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
>  	return 0;
>  }
>  
> +int msm_dp_catalog_mst_async_fifo(struct msm_dp_catalog *msm_dp_catalog)
> +{
> +	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
> +							      struct msm_dp_catalog_private,
> +							      msm_dp_catalog);
> +
> +	u32 reg;
> +
> +	if (msm_dp_catalog->stream_id == DP_STREAM_0)
> +		reg = msm_dp_read_p0(catalog, MMSS_DP_ASYNC_FIFO_CONFIG);
> +	else
> +		reg = msm_dp_read_p1(catalog, MMSS_DP_ASYNC_FIFO_CONFIG);
> +
> +	/* enable MST_FIFO_CONSTANT_FILL */
> +	reg |= BIT(0);

#define

> +
> +	if (msm_dp_catalog->stream_id == DP_STREAM_0)
> +		msm_dp_write_p0(catalog, MMSS_DP_ASYNC_FIFO_CONFIG, reg);
> +	else
> +		msm_dp_write_p1(catalog, MMSS_DP_ASYNC_FIFO_CONFIG, reg);
> +
> +	return 0;
> +}
> +
>  static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp)
>  {
>  	struct msm_dp_catalog_private *catalog;
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 323858c587f85996d296156c7b8b201cdb7b7eb4..0025ecc0adb2f351c44f10af82332a6622749416 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -150,5 +150,6 @@ void msm_dp_catalog_mst_channel_alloc(struct msm_dp_catalog *ctrl,
>  				      u32 ch, u32 ch_start_slot, u32 tot_slot_cnt);
>  void msm_dp_catalog_ctrl_update_rg(struct msm_dp_catalog *ctrl, u32 stream,
>  				   u32 x_int, u32 y_frac_enum);
> +int msm_dp_catalog_mst_async_fifo(struct msm_dp_catalog *dp_catalog);
>  
>  #endif /* _DP_CATALOG_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 2288c379283c721a01c81302f8d307d0b3c76527..d4915a962f97b3d2a347456e197265a5dc043eb0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -236,6 +236,9 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
>  	cc = msm_dp_link_get_colorimetry_config(ctrl->link);
>  	msm_dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
>  	msm_dp_panel_timing_cfg(msm_dp_panel);
> +
> +	if (ctrl->mst_active)
> +		msm_dp_catalog_mst_async_fifo(ctrl->catalog);

Should it be disabled further on in a non-MST case?

>  }
>  
>  /*
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
