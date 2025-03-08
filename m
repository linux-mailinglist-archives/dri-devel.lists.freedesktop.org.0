Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E00AA57791
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 03:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE9210EC69;
	Sat,  8 Mar 2025 02:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nIjKltTQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534A310EC41
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 02:00:21 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30bf1d48843so16900651fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 18:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741399219; x=1742004019; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NjVkCifx/RSQQ8Da117ebd6rVOl6XM9uzHnpVWsZ5zs=;
 b=nIjKltTQUa7zOpvF9yX0NCWRpGa8ckjSnoQZoQDCYgehbthTLU3r31Dhsgjw95jjqd
 q5gKJkOr9xcxEJgyHNqhQvI5qou9k6Gp+jnI0TGFt/+H7ZPOdYRCJIKzLALzqG1Zx3qI
 irAh0UpyUuWxaKuFC9wdOBmVuoG69xyedlydc3bCH3OrSTIJSo4A5Ew9MWgYbyRRlj8K
 dBn29Zq9iAwuvau7i/IN3GGNZuH81LMehcf4Cr0G5lpMbT0RrBe3fP6UCBKCw1dI/vqr
 vWJF+xvXf9H90I5iI+mtKudL4C9ojGZUIKUfShfkQhPaQmxUEb4J8qhZnqsKGablWs/v
 jQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741399219; x=1742004019;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NjVkCifx/RSQQ8Da117ebd6rVOl6XM9uzHnpVWsZ5zs=;
 b=f6La9DTKKWAatxbJcnPSqRiJhg9EF/Ff7oW/yU0p61PSlfsVLfLO+P/QIFdumvqqDK
 ZLF2PDdNPUxF3oSTsGMny1gm2ONM7qwyJxN1lfPmzpi4t5b/AD7pqHB+kTP8VLoYc/36
 1vXCJlE+chy+3nz9aDjEMFQ+IqwUaZLNzb/09XETpqJboIDuE9Wj5gBBM5BiI3mLEyK6
 VMRhcNdIrBRzeHRlIA9gOD9XXMs3/XK5vp3ZzFEkgf7ZpFE2eCDHQ9hgzPtCS4a8dEw8
 uZ2jlYqsEEhiiy/hVzwPs3D2HLwYN6+8+tJ/j3deQImQrzPtQja9LUKD0jlupLugMMMb
 hbTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw+pf71xxgqTzyrTvEqlQ5TWhN3NMFgwntgAAAPKlD/ajZdPkkm+knpYOdBW0OgS61m4fucYkn0Bs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjmUkZ3pMpFhjo7XMlJNYIhOuFbUdSAQZfiOqlp5cFvrk4jU7A
 IecbcbA0keTlid/mrC1gcwTUQ3AnPxI03FtaPeukM3erFaPx3cSNA9HsfIuuFys=
X-Gm-Gg: ASbGnctMICwk4C43g9Oo1D+wYsMaWWVBH2L8axlzjwxnpCD5gLbJpBHK6riumjWtpX+
 ZKa2zCMU8LssqElRgcRFFAAKky6S0ugEcYIiIKRaCHKmvlYQ48ikf9WoItwIwSHLo5GHt35Vgsr
 8JSyo4jxhptYtgmP5iZgQ2TP8U/Hss0Rr5HjzgtJAfqWBfrb1vIf4OG4/ntI6NicnAnOpz7K2YB
 xnV9vlFm8vtBTQ/+kXZxH3o54Sr18lZGqroVUTBRA1s/W9FmNatfMXJ6oQqBsg5Y78VWlPaMZnz
 TC67Z4Qx7dpuSzXy/z12XA6joj3Uajb+H1gPSJI4XSnhBJIOySKJOCXe6Wa5MUSdQyMlez0zJGa
 M0PBq9KZWmTHkBjH13thMaZbG
X-Google-Smtp-Source: AGHT+IHD+uwBqwVOK6PF+JlAvIXYtVL34Ab2L2yfhLPX2xkxj8BVZbxw9BTY9Ei5g5385gK2RsIBIw==
X-Received: by 2002:a05:6512:3dab:b0:549:8ed4:fb46 with SMTP id
 2adb3069b0e04-54990e676f0mr1813977e87.26.1741399219383; 
 Fri, 07 Mar 2025 18:00:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b1c33bfsm680563e87.236.2025.03.07.18.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 18:00:18 -0800 (PST)
Date: Sat, 8 Mar 2025 04:00:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, 
 Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] drm/msm/mdss: add SAR2130P device configuration
Message-ID: <kifzy754m7zygspknsk4a4aeuqxkt4bkyp5jbu6ul43gon7je3@yleqikfmh4lp>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-6-1d4c30f43822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-6-1d4c30f43822@linaro.org>
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

On Sat, Mar 08, 2025 at 03:42:24AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add compatible and device configuration for the Qualcomm SAR2130P
> platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3e82ba0885d03107d54eab9569bb4c5395454c7a 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
>  	.reg_bus_bw = 74000,
>  };
>  
> +static const struct msm_mdss_data sar2130p_data = {
> +	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
> +	.ubwc_dec_version = UBWC_4_3,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,

This should have been .ubwc_bank_spread = true.
I have been rebasing the series from the earlier kernel and I'm not sure
why this didn't show up during the build phase.

> +	.highest_bank_bit = 0,
> +	.macrotile_mode = 1,
> +	.reg_bus_bw = 74000,
> +};
> +
>  static const struct msm_mdss_data sc7180_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> @@ -738,6 +748,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>  	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
>  	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
> +	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
>  	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>  	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
>  	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
