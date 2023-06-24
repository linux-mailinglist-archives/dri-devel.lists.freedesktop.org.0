Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4901773C5F1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 03:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD8D10E6F9;
	Sat, 24 Jun 2023 01:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5403110E6F9
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 01:43:26 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f875b267d9so1769096e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 18:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687571004; x=1690163004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FJu328CuD0FpfwTO8re7cLemAMEGjdbgxO2wkNCuWs4=;
 b=Huvl/IsXBiNB6PHLiIGpsqlH//TabGsHUSokzqBsuO084KzFFFGnVpjHZ8I8BApZtC
 4nh5NY4dsFx2IhnOMvm5a6UvhPhznMX7vYaCung0sKFyh5sZJa3/YIsSsW3HTMbdFaGz
 xddKwRGKx8Oc57sGO9eNdU2I+f6sUfwgyfbFOo9tqWZWYvnXaPn29Z93WBxOM3ecgJpm
 8oPpvVMYAM7Ai12qSJzvEgopRO32Vwc/ZLVs/JGem5iQ2LsQ3bc5eJ95ejyMnei5LThW
 crFnDFVwBuvADU5AI2PFD8L7zIErCvJl6h4PPaWd9sIPH+ly9qnGa2iD71Sass4C8MTL
 NMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687571004; x=1690163004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FJu328CuD0FpfwTO8re7cLemAMEGjdbgxO2wkNCuWs4=;
 b=QEtUV1kQh3e15GniwS6DP14eM60mYUN7tgl4XIlEsxDf6coiPqfpc3V1+8cumQI/JX
 niMCuJwuaYU/cxrEoQAkTGMokNSUNIrwe8LGsdpozISheTfrWIEF0wO+2XVFTH14Rk6t
 ttEY9mrWucnopo622OVwBK39PKPOE0EOYDNduEHQ2c6QFh+yYzTjVWZ+hJWqE9vvogUl
 vSf4LgG3RpMImdmBHCC8JpbttcnMPgq2101ke7DD6WEmvjaiU1lMjV9KSrAPN0rx4bAo
 Ug0kpmKYZ3OCGNeeYs9B11+4VC30rQqoX5PIWJRg0s+O46vKp4XeX3XseKh77mKGvVy/
 3Ayg==
X-Gm-Message-State: AC+VfDzSyXbPU6FbdQQICAvAW9usd/WthxEFOajDr8EvGlEtK6NXnpYY
 3jXB4blKvn/rFu6xhrCgE18WIQ==
X-Google-Smtp-Source: ACHHUZ79nWqogKy/8Yh1jokr5cO+Vt//UYSZuqtf/o9Edq3PDMHTZ9jAcj594JH3NhOIPESHp42T/g==
X-Received: by 2002:a19:6755:0:b0:4f8:57b8:8efe with SMTP id
 e21-20020a196755000000b004f857b88efemr14798210lfj.55.1687571004247; 
 Fri, 23 Jun 2023 18:43:24 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
 by smtp.gmail.com with ESMTPSA id
 g4-20020ac25384000000b004f26f437ad8sm99250lfh.53.2023.06.23.18.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 18:43:23 -0700 (PDT)
Message-ID: <a2a79b58-c7a9-9099-028c-5ca79cf8f711@linaro.org>
Date: Sat, 24 Jun 2023 03:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/15] arm64: dts: qcom: sm6125: Sort spmi_bus node
 numerically by reg
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-1-1d5a638cebf2@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-1-1d5a638cebf2@somainline.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.06.2023 02:40, Marijn Suijten wrote:
> This node has always resided in the wrong spot, making it somewhat
> harder to contribute new node entries while maintaining proper sorting
> around it.  Move the node up to sit after hsusb_phy1 where it maintains
> proper numerial
numerical

sorting on the (first of its many) reg address property.
> 
> Fixes: cff4bbaf2a2d ("arm64: dts: qcom: Add support for SM6125")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 38 ++++++++++++++++++------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index a596baa6ce3e..722dde560bec 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -679,6 +679,24 @@ hsusb_phy1: phy@1613000 {
>  			status = "disabled";
>  		};
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
>  		rpm_msg_ram: sram@45f0000 {
>  			compatible = "qcom,rpm-msg-ram";
>  			reg = <0x045f0000 0x7000>;
> @@ -1184,27 +1202,9 @@ sram@4690000 {
>  			reg = <0x04690000 0x10000>;
>  		};
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
>  		apps_smmu: iommu@c600000 {
>  			compatible = "qcom,sm6125-smmu-500", "qcom,smmu-500", "arm,mmu-500";
> -			reg = <0xc600000 0x80000>;
> +			reg = <0x0c600000 0x80000>;
>  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> 
