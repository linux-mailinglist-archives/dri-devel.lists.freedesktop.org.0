Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09569DA8F2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 14:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7593610EAD6;
	Wed, 27 Nov 2024 13:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VEU2gMiV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED6E10EAD6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 13:46:47 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ffb3cbcbe4so46293521fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 05:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732715206; x=1733320006; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gTlm0pK08VxN90bSYKa0+atSkrR5Fs4v3H4AKqAzKv8=;
 b=VEU2gMiV1ysMVCoif1HiP9u/zupDgyJIorUDZjUPerekRBPPjnJKrIHoXYOf8F3Z6C
 CyLY8HGpJlzH1xCHckBuqTkcvhxSVhwl16bQGG79ja0z2FY1bAkM9GOKfprsTuYRBLTC
 3m0BauzOqjU8U3uXJ8RDv1T4Dn90jlQxbrp/yhIDtEEzwcljoIAXUk3sgGpWZHGVpmIl
 pHUbf/ZibdildOceAjrlvFgsA8BOX9e3ULpjMuE8vVgsHiDolOKtFHBONV5naaun00z9
 V103GGoDDPeLKTyiEG0Y/p8XOmjomSvYUnjSDwhXY8FANJH65KDBF8ssKBJkXm97h5Hf
 TDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732715206; x=1733320006;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gTlm0pK08VxN90bSYKa0+atSkrR5Fs4v3H4AKqAzKv8=;
 b=VTR9tVS4kVUOpxYUQz5oTEN7anqr72kWDMKzBS3cwbnqg1BEAX46u9yV2gqr1y5mmg
 rv95gPen4ptPtqCepfOVHB70rRL9tPhU9WrH3EeOZdQs+bEbIktKcsgPxId0eTR/TamI
 Pa56Yeyj5SQj0jTdLDPL4+6qeFkIpPZpzR5cdapbg+hdwx0lZt2vzeO5Z2AaW6yn4U+D
 csV4EIHmtMdL4tvuLl9xlQQPjdrTa++k0VjvQNy9XQWFXdguSKRCe3W2iqFExf9EF6Yi
 vgFltSYzOgWKoxe4crH6H7D9FE7yFHiBf0DL/05K6hLNmvSwQrqf8CFL6L0BMapQTOme
 5vAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVla9otuXn7en+9tMpQLW3Hvg1O7108tM5fxA0sWXVvWELpEuFV+zXlVoM0YFN5BUcKgsgXsEev58I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVg96uuavwiJUDpCzV2DYLbBWZzD3sfYjsjdu/P/v0gbdIZ5Rc
 AJSpLRGf3dRJx71gWl+3BRXDvv80/Q+gyntKGOrhdGmDk8yfPOp+bap9WFRj2nE=
X-Gm-Gg: ASbGncsoavu8saHY07RWxbuq/B4iWKZ2LeXwnOlgh75CE7HY+ocawA4SklLvdvDP8Qz
 hvf5uwPqlvPYhSW7b+UDcP+6OYqEn4HuAB2INv+rvzleK3rnc8ln8dq79K6SDTbpFCnG5wIR3GS
 TStA7UH8uwfsj5hS39MJA1Fc44i6UOeis3+nvG4z6m9PaOYybD9Ynm4K//j/MsM9CybNp5qXwW9
 bhLZQQbkflkO0IjhmX+cu2Hj+3RGQjKdSuPiROmDkT0wCpzaoQcSzt+UnVE2WpYaGLXMln3cHp9
 1cC2V+4zWVar+u162KKORpyrsvKAqQ==
X-Google-Smtp-Source: AGHT+IE5YvUnBxv51yjqkhV3Fi45R5BfRmA/OHDbr1MX0yiJhZssNxaHBIh9Ihr9OWpmi0uPhR+jZg==
X-Received: by 2002:a05:651c:220d:b0:2ff:a8e9:a64d with SMTP id
 38308e7fff4ca-2ffd5ff5131mr17990441fa.2.1732715205762; 
 Wed, 27 Nov 2024 05:46:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffd3269561sm3194711fa.45.2024.11.27.05.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 05:46:45 -0800 (PST)
Date: Wed, 27 Nov 2024 15:46:42 +0200
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
Message-ID: <nllulh3vskl3hm3hvjux4khxtanqj7cpoytodwkzphwn4ajmo7@g46rgnhp637b>
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

Please mention, why do you need it at all. I see that the UBWC swizzle
and HBB settings are different. Is this really the case? Is it because
of the different memory being used on those platforms?

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
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
