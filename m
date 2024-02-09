Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F66984FEE0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 22:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F0C10FE27;
	Fri,  9 Feb 2024 21:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="omwadLeB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6AA10EB6E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 21:29:30 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-46d3d03bb35so182144137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 13:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707514165; x=1708118965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6t7JxYzUYe1G5tyy354y/OPoxlWnEMIYfd55PcMEAnU=;
 b=omwadLeBjD0NecXE/91yLDsk6aa+p1CDQAQ9J/boHInqkIMbMC83iUn7I0ZxhVhmac
 76h2XByHTDwQ1xHXpL2063MIRb/E/MR7PKSB96lNW8Ed1nsGo1aKOUsq39PGYecLICvk
 /5/cR8G1Y8l4Bp3MAdWXt24KPgV2ZiU+NECW+Y8AL3SiAvTqkOKJqx2/Mv3y8YlyCU1Q
 pXR6Gbn8R+p+BKgM7NBkBpFy1bhAnYBlFxl5vaaxZSDSvJpNDlw+6AomZlSNdrn4DdJz
 6ZavJVE5gp57TCgS9IjC1qzCLmIlSLg1bgqhwe94NaWjCvYhE9FTMeC3HCj3g4ygC+qV
 0oyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707514165; x=1708118965;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6t7JxYzUYe1G5tyy354y/OPoxlWnEMIYfd55PcMEAnU=;
 b=pLy0RMu4ZdM3JLyP0akYGWBM7xz0CN4xUL/SucRlk8MCS+dzxSvzlwF9i5RsIrEiG6
 Q6rJ2iUIaDO55kQit1lgrRptqv2EyebrAellcgAx8aX5qKTj0FIPBzwQDHlL5FBuwl3U
 BR68qhZk+uqpUwUNE+l4xSIX3pdlbqWSKrNIH31dSX9FCyD4k8qKTNCZ4qBwS6LGkOV0
 6qzAdoA2C/MWIIOQedj6XFyx0piGCEv7RUQ10RezNUy0sOfcyKi+9AUIyiv78HKgys6O
 58quC04SylDX7n/8F1oL4mhJbx1eeT5S5rMY72WnHnbVuHFooXT1QpuSkHTVsKPrbxcG
 UT6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2v5FBedriuejC9VqqUGo0kwdNI/u9suOzF/0ZTQ7J3XsZugWUBjXqGQ4mRp71amnOS9w9w8ZbtyNt5FMCdGCdEfh4Qv1Cn7q3AD/RI5OF
X-Gm-Message-State: AOJu0Yy48i6VaWbEDkgPOAJ+CPmao3YGqyJf6GGbbH9joq6hA6qAmRAk
 I9U12Rknez26I8DT7JLjZJn3qaNAjHPBFdj68JloF9w0kJLUFhMrHpcgedLjLc8=
X-Google-Smtp-Source: AGHT+IFhUodESDe8mt61qKpTTqFTzwMEjBVpz0ybXibJ7A3O5xt3dKTI0pK2CAdiM6pE73oilv1FeQ==
X-Received: by 2002:a05:6102:2322:b0:46d:210f:20fd with SMTP id
 b2-20020a056102232200b0046d210f20fdmr647367vsa.18.1707514165164; 
 Fri, 09 Feb 2024 13:29:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUaxdtMY0BJKPa7zdVAd0dpwWZsnh/A3jFMcCGpvSDsERIAP92g7x8mxj4PdyC9EGZhc7uOMmzJrGviP9cAdUHOKRAl2ZjHDak9gqUZZPhnNhhKS/vQkf+4aZ04cdI2T4CFWdUms/HkdFdyUAIfjK4DGQ3Rw+10EY5g2ibFA36ro2CS7Lb3fwmW5nMgCkEwcsHZatTcazhCV8UCfJ73bVVv8zZLNDD9xSY8n1X5dE85NASVc3tYomL0U1sxjP1noD4VjEbcC8muLk4xF6K60jv32xmgNh6nnlBbhGWOhIKlInTvMOXgJAszJhfrvwl9sMIWNxSvjTPvBGg4tuNdLERM0yVXJAEvDeZBIDajp9ksCZOwam59mbQSlKjnU7SbO5z8/yWAJJCBJUEfZmwyEHh/O95I73vWJ+DmZ4OZdWT29ia4G+ug7+rrj2MFjvEN86NBrZrpM+P+zLFfFpcAOdvQCKMLPsa8VrWkvK3XuIV+CEfCl5q9JIhHWRNKO8QaCcpYceZkZPRKFITIM8sS4SqIpON/MjL/VSbuGzjXTsl9tlYYxLrFohCg3scs2PyLea6J8gssBTqyEWhySQu25d2o00rsC+/TH6tQgAlCM2LRF9AQ7c8jRPTDx4lV5Q3zz5GRmqchWOFuT8ZGXnLCBkZNf6Ih6Z+xdq2fMeZAGNamfHbIqw8O5sBGljWxLSfXxPuGCT2W7c8P1NMgOa88EGRa
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl.
 [37.8.245.233]) by smtp.gmail.com with ESMTPSA id
 o35-20020a0561023fa300b0046af097562bsm49535vsv.9.2024.02.09.13.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 13:29:24 -0800 (PST)
Message-ID: <45f8b1a6-9611-41f5-9d50-6a74fcd2382a@linaro.org>
Date: Fri, 9 Feb 2024 22:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: msm8976: Add MDSS nodes
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240121194221.13513-1-a39.skl@gmail.com>
 <20240121194221.13513-5-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240121194221.13513-5-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 21.01.2024 20:41, Adam Skladowski wrote:
> Add MDSS nodes to support displays on MSM8976 SoC.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 268 +++++++++++++++++++++++++-
>  1 file changed, 264 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index 118174cfd4d3..2d71ce34f00e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -785,10 +785,10 @@ gcc: clock-controller@1800000 {
>  
>  			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>  				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>;
> +				 <&mdss_dsi0_phy 1>,
> +				 <&mdss_dsi0_phy 0>,
> +				 <&mdss_dsi1_phy 1>,
> +				 <&mdss_dsi1_phy 0>;
>  			clock-names = "xo",
>  				      "xo_a",
>  				      "dsi0pll",
> @@ -808,6 +808,266 @@ tcsr: syscon@1937000 {
>  			reg = <0x01937000 0x30000>;
>  		};
>  
> +		mdss: display-subsystem@1a00000 {
> +			compatible = "qcom,mdss";
> +
> +			reg = <0x01a00000 0x1000>,
> +			      <0x01ab0000 0x3000>;
> +			reg-names = "mdss_phys", "vbif_phys";
> +
> +			power-domains = <&gcc MDSS_GDSC>;
> +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_MDSS_AXI_CLK>,
> +				 <&gcc GCC_MDSS_VSYNC_CLK>,
> +				  <&gcc GCC_MDSS_MDP_CLK>;

The last entry is misaligned

[...]

> +					port@0 {
> +						reg = <0>;

Please add a newline between properties and subnodes

And then the rest looks good, I think!

Konrad
