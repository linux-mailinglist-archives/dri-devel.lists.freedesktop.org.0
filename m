Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E29FDD49
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 05:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F7F10E20D;
	Sun, 29 Dec 2024 04:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Fj/HCPlc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E47310E20D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 04:43:46 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso8431514e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 20:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735447364; x=1736052164; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=49KnvXyqtzHNP5zpXwkwN+VDBQ2sz7fI/cBjo8ecRUM=;
 b=Fj/HCPlcAaDjVCoxorN5pqmpWUDNsKiCv+GaGIs/PHOmC0s1GNn32bHhny5ZjBGC5v
 Br7+wlnR/l9VujCTv6M7HlCe6WpKY9a5Vnh+ArNwR+PJGJLh8RMd3sxqLSJ0aS7dCD3v
 cNCOTVNMLXTsbvgVvPVSeBr8tDhLSrTzeLHVP+EaQbrT6hr2lyeZccHsalPhwxOi9wRn
 Ca9kwPsVvCQIQ/e4j10ktzt9HhEfpxch2Om7Vdo9rfl8xvOUjg7GhPcIO7fCG6nLq2pu
 9x9ZaGiJp31u+lo0WA03KajSFYrKr2ejiQtOmc0kBrO9Hmj3YyWE16Y4gPExMBj4Dia3
 ZcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735447364; x=1736052164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=49KnvXyqtzHNP5zpXwkwN+VDBQ2sz7fI/cBjo8ecRUM=;
 b=ScgQhLp+owJc+rVTb/sMLUOOKdfHzX5eK3MDVmYdJulqqJItQj9saPT/8ubA4l+l11
 IbSO7vPsw0H9+sGjcDFMCvrRF1wjk/FONfBeH9Lni+hFn6H45Uki0onx/pi+JiZeQfOy
 s5d0C70Smwf8dIR1MRpNp6ocCeICKbre6bhLE7vZpQ8gAxgMK7/v6tUjma3tlDuRcKYV
 ilzS7eSC9Ug3Zflm4qlgfC8CRwwIyYLnKfAzqiXb1bATkXmdwYPTaQxCz3BtmAhL4sqY
 0RHFfY/ukUL/1OQwO54vSbjMlC6FwRLakF6xtUFrb5H5nPpcu2yKLkWcV12OgHShOrqa
 jMdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIp/d/P+zeFsx5sCYUr1uvMvnepXiLuMjFZsNE2zGZ7L9hVIbBtYtgrN1GtLYdT0uVDZ2dScDQNpE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx45RxhbiUH9Zsks6F0vFOK0VuyjWCGqRg1MrvxhXdihCWFa9CG
 L/GJQ84uI1YMabUW44VhuVWYzWAgoRXCyJvjJ/ZjmPMcn+7OZGvwI3YN//bIEMw=
X-Gm-Gg: ASbGnctkGwpflaTC3xyEecs2lM2R1bHSzom3gKX53mwr7pyCQxU+xrOtiWfIAv9a0n7
 kXW9j0Ddb5QIh9fR88Ccsu6aWjtC7VCul9SOeE/RPAH5A6DdJj+nndh0MU9Dq59fFoESksqrcyH
 BqhGRGAgYwla2pRIM0U+vJ5qRKeTGD16Nk1dNCcmM/zS7OEg4V7WYtAMZPloEMT1n9wyKLn7vUe
 K0WRacwr4mTPhJ+hfc40BrYe5QLgC/KwEEg5JzlHhSpTWBUv2SgbE9VXq36bmOGi94m6bUsZIh7
 338rKektHxt/pene5NcKlnV5TwDdu5rvecTK
X-Google-Smtp-Source: AGHT+IHofLwFYxWucuHyLIawAriYNYKQ/SrKehOlm3Ec2J5KACyiss5kzgeMpgISL832D3TRqtyLHg==
X-Received: by 2002:a05:6512:3e23:b0:53e:12dc:e805 with SMTP id
 2adb3069b0e04-54229582252mr9675190e87.45.1735447364447; 
 Sat, 28 Dec 2024 20:42:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301e0sm2834926e87.248.2024.12.28.20.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 20:42:43 -0800 (PST)
Date: Sun, 29 Dec 2024 06:42:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: phy: Add eDP PHY compatible for
 QCS8300
Message-ID: <kz5qakmiy7n72p5yrrkgcjrmtvwl7knnkbzmh44g6cfunpjxad@3titlwwt32ux>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
 <20241226-mdssdt_qcs8300-v2-4-acba0db533ce@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226-mdssdt_qcs8300-v2-4-acba0db533ce@quicinc.com>
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

On Thu, Dec 26, 2024 at 05:40:48PM +0800, Yongxing Mou wrote:
> Add compatible string for the supported eDP PHY on QCS8300 platform.
> QCS8300 have the same eDP PHY with SA8775P.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml         | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)

Everything else is display, this one is PHY. Consider separating this
one to a separate series.

> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index 293fb6a9b1c330438bceba15226c91e392c840fb..eb97181cbb9579893b4ee26a39c3559ad87b2fba 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -16,13 +16,18 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,sa8775p-edp-phy
> -      - qcom,sc7280-edp-phy
> -      - qcom,sc8180x-edp-phy
> -      - qcom,sc8280xp-dp-phy
> -      - qcom,sc8280xp-edp-phy
> -      - qcom,x1e80100-dp-phy
> +    oneOf:
> +      - enum:
> +          - qcom,sa8775p-edp-phy
> +          - qcom,sc7280-edp-phy
> +          - qcom,sc8180x-edp-phy
> +          - qcom,sc8280xp-dp-phy
> +          - qcom,sc8280xp-edp-phy
> +          - qcom,x1e80100-dp-phy
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-edp-phy
> +          - const: qcom,sa8775p-edp-phy
>  
>    reg:
>      items:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
