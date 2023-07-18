Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCCB758816
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 00:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C319210E0BA;
	Tue, 18 Jul 2023 22:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7793010E3C6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 22:03:00 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fd32e611e0so235367e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689717778; x=1690322578;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rNDKOzlYPxGuMs2KncsT0nwhwoFvuzBBjJp1G8pPnVI=;
 b=vuZIUV0MiW49B1TR2RK+zQrigyap1MzpeYpQr5n+DE/3s2R6OB3VXg+eUeNSA2wqwu
 dYTjRPR2v0yrtgdEhzKD5hpgEf2V5Cub4MA/Nkq/vEBwf/2dss24wWvT4aMK2kZsls1d
 5vJfVRBtNE9MHqGHkqxv3k9wfZ0PwOXygRTOQ5JIklydupo/LhD8XiA3VK1q9hYeue6t
 tKLjWTrl2D88zC+ihLPYVIwwHKnzx1eMR7zBKHU4MVHq+XJsO9HF5/3mGE9tRa+31Ifp
 hIypLS+CHYwBfwj8bDXVmkoQNxZMDkZCFZRsuCfhmbBl270ihN+STJzxACCADrNlhANs
 cT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689717778; x=1690322578;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rNDKOzlYPxGuMs2KncsT0nwhwoFvuzBBjJp1G8pPnVI=;
 b=cfyytYMixpwEK07gi3WJPulSFobOUXrirEylZxHlcxYwH1u0250WmFLgq17qBYnhYU
 1tEqULIsGxL1Ka6DuLXXeHfFw5VNa8E9frwbHULoIZT0KRX/IjE3bow7p3WZF8o8djtj
 m7GCe+Vgpr5OVXVN28yqV6gAV14qBzgGZKEble6Kx+mhackXcxPqFW498uCz4Lzkd1kX
 NJ1ttCsnOL9SeXIwHg/T+AoLlqLtU1cZk1DsatmtlOkAkAnIZGeJXu029ZInAfbXesFs
 vfCNfEQNDJ1ilO/kKwnnduS4d15PVWrAVE7Y09IwoLBmghzNGaVLJCaemI3G7cejTrT0
 /e+Q==
X-Gm-Message-State: ABy/qLbr/PlVmy/6bVRfh9ugl+G9LXhGdddWxHtE0RGVRLNAO9i8mTCq
 NrC315lEk7xgdGK0F7GdNx3Q5A==
X-Google-Smtp-Source: APBJJlEzzO92pAca9uOAcmF9Oxp3Fq4quU2D8QWHbF3UNYaUO4bu8i3x2boSfuxbQYAJ/7rubYq1CA==
X-Received: by 2002:a05:6512:3da4:b0:4fd:c8fb:eb71 with SMTP id
 k36-20020a0565123da400b004fdc8fbeb71mr132296lfv.11.1689717778055; 
 Tue, 18 Jul 2023 15:02:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f25-20020ac251b9000000b004eb0c51780bsm636973lfk.29.2023.07.18.15.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 15:02:57 -0700 (PDT)
Message-ID: <149d15e6-4995-8ff6-5191-77783c3dedb8@linaro.org>
Date: Wed, 19 Jul 2023 01:02:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 02/15] arm64: dts: qcom: sm6125: Sort spmi_bus node
 numerically by reg
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230718-sm6125-dpu-v3-0-6c5a56e99820@somainline.org>
 <20230718-sm6125-dpu-v3-2-6c5a56e99820@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230718-sm6125-dpu-v3-2-6c5a56e99820@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/07/2023 00:24, Marijn Suijten wrote:
> This node has always resided in the wrong spot, making it somewhat
> harder to contribute new node entries while maintaining proper sorting
> around it.  Move the node up to sit after hsusb_phy1 where it maintains
> proper numerical sorting on the (first of its many) reg address
> property.
> 
> Fixes: cff4bbaf2a2d ("arm64: dts: qcom: Add support for SM6125")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   arch/arm64/boot/dts/qcom/sm6125.dtsi | 38 ++++++++++++++++++------------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index 6937c7ebdb81..cfd0901d4555 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -684,6 +684,24 @@ hsusb_phy1: phy@1613000 {
>   			status = "disabled";
>   		};
>   
> +		spmi_bus: spmi@1c40000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0x01c40000 0x1100>,
> +			      <0x01e00000 0x2000000>,
> +			      <0x03e00000 0x100000>,
> +			      <0x03f00000 0xa0000>,
> +			      <0x01c0a000 0x26000>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> +			interrupt-names = "periph_irq";
> +			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,ee = <0>;
> +			qcom,channel = <0>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +		};
> +
>   		rpm_msg_ram: sram@45f0000 {
>   			compatible = "qcom,rpm-msg-ram";
>   			reg = <0x045f0000 0x7000>;
> @@ -1189,27 +1207,9 @@ sram@4690000 {
>   			reg = <0x04690000 0x10000>;
>   		};
>   
> -		spmi_bus: spmi@1c40000 {
> -			compatible = "qcom,spmi-pmic-arb";
> -			reg = <0x01c40000 0x1100>,
> -			      <0x01e00000 0x2000000>,
> -			      <0x03e00000 0x100000>,
> -			      <0x03f00000 0xa0000>,
> -			      <0x01c0a000 0x26000>;
> -			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> -			interrupt-names = "periph_irq";
> -			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
> -			qcom,ee = <0>;
> -			qcom,channel = <0>;
> -			#address-cells = <2>;
> -			#size-cells = <0>;
> -			interrupt-controller;
> -			#interrupt-cells = <4>;
> -		};
> -
>   		apps_smmu: iommu@c600000 {
>   			compatible = "qcom,sm6125-smmu-500", "qcom,smmu-500", "arm,mmu-500";
> -			reg = <0xc600000 0x80000>;
> +			reg = <0x0c600000 0x80000>;

Irrelevant, please split.

>   			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> 

-- 
With best wishes
Dmitry

