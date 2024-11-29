Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6797B9DEC3D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 19:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD01810E57E;
	Fri, 29 Nov 2024 18:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vek/dz36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB5310E57C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 18:55:05 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53de84e4005so2654106e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 10:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732906503; x=1733511303; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wVpqKF5HDzWaD9sXJQFFkWoO/IvzFlRLrdhxrF/ucgg=;
 b=vek/dz368glpASKhoK/Bw9tciL7XIJc5ViAqzVZF2RUkgOWr738QOofw00FDydBcfg
 GcGoIla4aRQtqu87Vr8zVj8d7SWRJ3VrYnImTfFYYEmgXb1SvigySqpZ/ZQbEfW1JFv9
 NrV6b5EzUkwS+p4y7G+Tb/U+IZ5udU62NkXFpAG6h5EdpM9VAEBGSMpaiXK8/tSYKvoV
 ghzIsaweztTSAnp4wG1fhp7KYNdZ7QtZhN7deH4AQl+cg3+aQUpCU9YOU2+7ByOQh0qw
 8XNBbQ+mPjdZsBzqaU/oUDISVLPEnP/YOeEfsh31DznwnxjdjvpKkcNN3sl+HmkGdt8m
 KHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732906503; x=1733511303;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wVpqKF5HDzWaD9sXJQFFkWoO/IvzFlRLrdhxrF/ucgg=;
 b=xUWElamavAea0DQGVy+zfpzB+xW99oAZxqv3IVOx3kFEd5tmL1ZdvOPEzUlEId5Phe
 +OHAXx50luAcgQes4Ffo09MuHx7eu46N9C2uBJQkIMa5m1XCBN44wWGaY46lTTdHGq6c
 QVczFsmfLLFTRVpHiiVdOFsGubTXUDO34ZdQwBPrOYksM0XLPlaQKfUKAc9L4akIVrdb
 iCIhHBZXcru34t+R/ot8cRv/ZaLCFxnW3i7LvuQ3/l3e8z+nFeKS4wwlQuXUcAgUon0A
 7jMXtdbP8Bt2TwHaC6z8U7w14jrRGHIxoKgpHrmYQdpjbVxFSfzkSUOWiaV/z6PJsJ5M
 wXAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ/ELkwXjPT6kpjPincksvpTuuu335meWiUXCfapgtKYkrjo+wJ6hZ1JRBG7biujFOZGQO8PWpb9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyveniKGlrHYTNecllOwy+wzBrI1LnA7cM5lRhkWnC9I7JQGreh
 chQ3eorCl3hIyEcDKNswCJbWPT7MQrQBbqjceeS2QelzMDYdggxevHt37QqUSvA=
X-Gm-Gg: ASbGnct/RSmRFZm+WNlzFV99LS3EE75Y6vBPxU+iaB2/6LDfUdqKxl/5ZjCj11rer0Q
 kixeZscyyBg+0w0lzdpHdoGxdSuRwYTob55tn0/BvsroeGPU2QuaBc0uDSx/4f6uALo6aXfXNxx
 qOiWtFDq8GOQXG3G1hY6pzpnOsAG1kyXRCxwRBQc37pHWtt92AMzFcK+JSG0+zxQZ2w34Ab1/CJ
 dhcHBky+K9OAIirx9x7+vLK0UfXCgvFfB9KuIJ7az6YOtwPGTTCOY2jVXZcUj/PJn1/mt7cCXvY
 ZuVSUzzviDL9UloUOgJLfO8t3huoyQ==
X-Google-Smtp-Source: AGHT+IHl0rMozF8fyncgtwJnZuDNJR8Pa97HnX5NDJ1ulE+L6RXtTTJfzmFUESI9fNeMlRvrFf1Ojw==
X-Received: by 2002:a05:6512:400f:b0:53d:a93c:649e with SMTP id
 2adb3069b0e04-53df0109024mr9144690e87.35.1732906503152; 
 Fri, 29 Nov 2024 10:55:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6496a43sm552760e87.213.2024.11.29.10.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 10:55:01 -0800 (PST)
Date: Fri, 29 Nov 2024 20:55:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add QCS8300 support
Message-ID: <wbw7ftf7ogcylxbeav3vegyfgz32sc2h5plneo2w7djsy2kaeo@enkcbukosern>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com>
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

On Wed, Nov 27, 2024 at 03:05:03PM +0800, Yongxing Mou wrote:
> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Once rebased on top of [1]:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[1] https://lore.kernel.org/dri-devel/20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/

> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index b7bd899ead44bf86998e7295bccb31a334fa6811..90d8fe469d3134ec73f386153509ac257d75930a 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -568,6 +568,16 @@ static const struct msm_mdss_data qcm2290_data = {
>  	.reg_bus_bw = 76800,
>  };
>  
> +static const struct msm_mdss_data qcs8300_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,
> +	.highest_bank_bit = 3,
> +	.macrotile_mode = 1,
> +	.reg_bus_bw = 74000,
> +};
> +
>  static const struct msm_mdss_data sa8775p_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> @@ -715,6 +725,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>  	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
> +	{ .compatible = "qcom,qcs8300-mdss", .data = &qcs8300_data },
>  	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
>  	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>  	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
