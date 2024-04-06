Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E089A8A7
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 05:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE97810EDFE;
	Sat,  6 Apr 2024 03:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s/NX/G9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471E410EDF9
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Apr 2024 03:25:33 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-516d68d7a8bso948405e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 20:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712373931; x=1712978731; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9LciZ4M+VANz8QCgE6eASTV8GxrZiI5bh38iNvVv6oo=;
 b=s/NX/G9Tt4Vv4h1PhogQu/poyYhWG6J9NCpXqInIW0FnNXAe2UggwcaTdeuT3xM045
 XeTfw5ICU2l6r+WmsaZRaL3je3aQr7kX5LngeUzh7lVZJYqa+cH/7ND1y/c2dmjWvSGh
 E7vcpt5632PanRzjOKFUUCbdbKEui7eYYi5XNClwuBrHbbipCRb1QKB/TZLBOQcwNTvA
 jm7B8PrldJQqeKcDfAvRMtG2ryrWU1Xn+92cOefXI+eGVrkEP/YXOIde9uWmeckiXg7A
 gDKSx8SVQecKrIzUDLLapsib0TqXJhdZVQuFsfTCnOWIdjv0YLOgnyuSp1jNc0moe6Ww
 OCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712373931; x=1712978731;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9LciZ4M+VANz8QCgE6eASTV8GxrZiI5bh38iNvVv6oo=;
 b=Bhv0+XmcRYxkQqv2fQY94FWT+MNXUHrD2QisiG+k3NiaWzB5Z10rxdRQpSc7YuTYo+
 tW0WhA09K9BH3jzhEVmQe6Tz8tYNJCuJQKAr2t2yAMrubgSSggAmas7DguDsIyiPQftK
 Wk9i+dLTltTdACt2ggY9A6RXItjqpUvdPzHrAHF8It+l4axqXviNgTkzUgMLR0dE3DVS
 o2XotBJ/u8iFf5D52lmPFl2os+4tJ0wEG1MxUD3ymvSCq17m6SHqf3iH/MAPbcYo+fEZ
 nSjindu4f2h291311IZhA7FuY/v75+K5H4+FObIMkf7HcuBEI7raHycR4sAi+5unCUpL
 TeCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOVSb2BTSiewH7/hx3Woiu/SXPMlPJOqF1/ucwAPtIC5n0dWDFxaP3Ua8ldcuY07x4oRku8SgzZgEvqao3m98D7Tjjxm6OgmBZwWBjj9dZ
X-Gm-Message-State: AOJu0Yz9qyPPhgXxU8+1kmfT2IER75cSvz0QuOS9RXimx5XhNV3RlDUK
 ySLvXWmwNvXhwkGmvpSpyGB8HkeOMoly5Aa3zMxkx120FLOy2POxm5u1TnPndSs=
X-Google-Smtp-Source: AGHT+IGrOU69waftjh0A7Nz5z2x9mrFhq3iGFQehyEz3srd6rEvrnruaA7pMOhjxQkC8Bwvyg1Nrsw==
X-Received: by 2002:a05:6512:548:b0:513:d167:f245 with SMTP id
 h8-20020a056512054800b00513d167f245mr1201499lfl.27.1712373930833; 
 Fri, 05 Apr 2024 20:25:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a19740c000000b00516c2413c55sm357348lfe.49.2024.04.05.20.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 20:25:30 -0700 (PDT)
Date: Sat, 6 Apr 2024 06:25:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] drm/msm/adreno: Add speedbin data for SM8550 / A740
Message-ID: <nek4paofg3hturvjwpa2bnsvmicwmvwixzr6e6iuqstemgrqyo@cagcrnzjsne2>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-5-ce2b864251b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405-topic-smem_speedbin-v1-5-ce2b864251b1@linaro.org>
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

On Fri, Apr 05, 2024 at 10:41:33AM +0200, Konrad Dybcio wrote:
> Add speebin data for A740, as found on SM8550 and derivative SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 901ef767e491..c976a485aef2 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -570,6 +570,20 @@ static const struct adreno_info gpulist[] = {
>  		.zapfw = "a740_zap.mdt",
>  		.hwcg = a740_hwcg,
>  		.address_space_size = SZ_16G,
> +		.speedbins = ADRENO_SPEEDBINS(

I think this deserves either a comment or some info in the commit
message.

> +			{ ADRENO_SKU_ID(SOCINFO_PC_UNKNOWN, SOCINFO_FC_AC), 0 },
> +			{ ADRENO_SKU_ID(SOCINFO_PC_UNKNOWN, SOCINFO_FC_AF), 0 },
> +			{ ADRENO_SKU_ID(SOCINFO_PCn(1), SOCINFO_FC_UNKNOWN), 1 },
> +			{ ADRENO_SKU_ID(SOCINFO_PCn(2), SOCINFO_FC_Yn(0x0)), 0 },
> +			{ ADRENO_SKU_ID(SOCINFO_PCn(2), SOCINFO_FC_Yn(0x2)), 0 },
> +			{ ADRENO_SKU_ID(SOCINFO_PCn(4), SOCINFO_FC_Yn(0x0)), 0 },
> +			{ ADRENO_SKU_ID(SOCINFO_PCn(4), SOCINFO_FC_Yn(0x2)), 0 },
> +			{ ADRENO_SKU_ID(SOCINFO_PCn(6), SOCINFO_FC_Yn(0x0)), 0 },
> +			{ ADRENO_SKU_ID(SOCINFO_PCn(6), SOCINFO_FC_Yn(0x1)), 0 },
> +			{ ADRENO_SKU_ID(SOCINFO_PCn(6), SOCINFO_FC_Yn(0xd)), 0 },
> +			{ ADRENO_SKU_ID(SOCINFO_PCn(6), SOCINFO_FC_Yn(0xe)), 0 },
> +		),
> +		.default_speedbin = 1,
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
>  		.family = ADRENO_7XX_GEN3,
> 
> -- 
> 2.40.1
> 

-- 
With best wishes
Dmitry
