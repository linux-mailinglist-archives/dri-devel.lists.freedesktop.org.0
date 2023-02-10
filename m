Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A060691DB5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 12:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC7910ECE0;
	Fri, 10 Feb 2023 11:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D086710ECE5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 11:11:02 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id dr8so14808207ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 03:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qgWJuGv7qAa+OIP5368ASPn0mZLCIxffBkoZw2ekc4M=;
 b=p7UVbyLug+HSUYCDPAxCY6XUm8NXVFz4oKUOA1Jo6+eKKmBhExhPVRn3azE9HfjYKm
 Od2cW3bJfmjcY4bEDBnwuXuhwmF+W+7n4bABeVrgxJYixvoqDn40Sm1yE5XkTqRGukXG
 GFzu88it/EbeHZamm63Q3lr9BnbQBi74wD/s94FVk1wDCiniVQUshdam+TT3t2hgN/f/
 cy29urmyssI5QzwigNSZFrFDrT4kabHqDgg6UmJkvdKNGKDfJdzOuizXZv7HWKWp7b6n
 9bl95BGbJY7cjZWBh0Okkr0yuP6dKnwQPcftfDByL/oE1R/hSOvKG8Tdvc8sdnBzMYIZ
 nA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qgWJuGv7qAa+OIP5368ASPn0mZLCIxffBkoZw2ekc4M=;
 b=iR9kuB0DYowa0iffz7Vf9dXLCWMhjfUI9gHdHHGoJfQyuCSuKHDxWPmnk0GCJtzc3H
 k4NLZz3cMQWwtoIF1mlGZTIsIAxazoK0T0cKn6lerR0zXd510A/2N7vWSu1kTwY0iUHV
 tRbhzzKLdzDsxrgockEGKAUTBFrJ7i5p2HEglKoQpavjneHOF8INWbSwEPcXNKkOUj/H
 2fBkpLumzaeAhwmUrrQYf63CGm6RrVbDkUpYdFr7bCgOW3UonoukIUMPgLQVyZ5VR7Qs
 d2UgpOXchRsvJZGb8iPbnESBldzv+Z7iNMlTmJBixkMoKnF4m/jHYji5FMhqnG4YYn6G
 HyXQ==
X-Gm-Message-State: AO0yUKXFRmE8ctV5QjQRMkPOtuxvEZYmYDGdcy8HtcCF81VERVfYhM0K
 FQhVLh2nGVHf5lRImCSg1+WUBQ==
X-Google-Smtp-Source: AK7set/GQ7C/jQwOpemLr8TPGRW0K9nXeyCfDYiUhMk28h8kDUs2Ewh1yvWPA7JfUTeUqImAbZrS3g==
X-Received: by 2002:a17:907:76d2:b0:88c:ea64:4ff0 with SMTP id
 kf18-20020a17090776d200b0088cea644ff0mr15213203ejc.19.1676027461379; 
 Fri, 10 Feb 2023 03:11:01 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906025400b008841aa86484sm2219660ejl.211.2023.02.10.03.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 03:11:00 -0800 (PST)
Message-ID: <0ae75004-1cbb-4b72-0492-942becc401d6@linaro.org>
Date: Fri, 10 Feb 2023 12:10:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and
 SMMU nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
 <20230209133839.762631-6-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230209133839.762631-6-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9.02.2023 14:38, Dmitry Baryshkov wrote:
> Add device nodes required to enable GPU on the SM8350 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 178 +++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 742e9dd17084..4c1a2f814b5c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
>  #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> +#include <dt-bindings/clock/qcom,gpucc-sm8350.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
> @@ -1765,6 +1766,183 @@ tcsr_mutex: hwlock@1f40000 {
>  			#hwlock-cells = <1>;
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-660.1", "qcom,adreno";
> +
The newlines between compatible and reg trigger my OCD..

But the patch looks good!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

P.S I can add binning after the big GMUless series lands..
And maybe I should also rework the binning code a bit to
be cleaner..


> +			reg = <0 0x03d00000 0 0x40000>,
> +			      <0 0x03d9e000 0 0x1000>,
> +			      <0 0x03d61000 0 0x800>;
> +			reg-names = "kgsl_3d0_reg_memory",
> +				    "cx_mem",
> +				    "cx_dbgc";
> +
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			iommus = <&adreno_smmu 0 0x400>, <&adreno_smmu 1 0x400>;
> +
> +			operating-points-v2 = <&gpu_opp_table>;
> +
> +			qcom,gmu = <&gmu>;
> +
> +			status = "disabled";
> +
> +			zap-shader {
> +				memory-region = <&pil_gpu_mem>;
> +			};
> +
> +			/* note: downstream checks gpu binning for 670 Mhz */
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-840000000 {
> +					opp-hz = /bits/ 64 <840000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +				};
> +
> +				opp-778000000 {
> +					opp-hz = /bits/ 64 <778000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +				};
> +
> +				opp-738000000 {
> +					opp-hz = /bits/ 64 <738000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +				};
> +
> +				opp-676000000 {
> +					opp-hz = /bits/ 64 <676000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +				};
> +
> +				opp-608000000 {
> +					opp-hz = /bits/ 64 <608000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +				};
> +
> +				opp-540000000 {
> +					opp-hz = /bits/ 64 <540000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +				};
> +
> +				opp-491000000 {
> +					opp-hz = /bits/ 64 <491000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
> +				};
> +
> +				opp-443000000 {
> +					opp-hz = /bits/ 64 <443000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +				};
> +
> +				opp-379000000 {
> +					opp-hz = /bits/ 64 <379000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
> +				};
> +
> +				opp-315000000 {
> +					opp-hz = /bits/ 64 <315000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +				};
> +			};
> +		};
> +
> +		gmu: gmu@3d6a000 {
> +			compatible = "qcom,adreno-gmu-660.1", "qcom,adreno-gmu";
> +
> +			reg = <0 0x03d6a000 0 0x34000>,
> +			      <0 0x03de0000 0 0x10000>,
> +			      <0 0x0b290000 0 0x10000>;
> +			reg-names = "gmu", "rscc", "gmu_pdc";
> +
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hfi", "gmu";
> +
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> +			clock-names = "gmu",
> +				      "cxo",
> +				      "axi",
> +				      "memnoc",
> +				      "ahb",
> +				      "hub",
> +				      "smmu_vote";
> +
> +			power-domains = <&gpucc GPU_CX_GDSC>,
> +					<&gpucc GPU_GX_GDSC>;
> +			power-domain-names = "cx",
> +					     "gx";
> +
> +			iommus = <&adreno_smmu 5 0x400>;
> +
> +			operating-points-v2 = <&gmu_opp_table>;
> +
> +			gmu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +				};
> +			};
> +		};
> +
> +		gpucc: clock-controller@3d90000 {
> +			compatible = "qcom,sm8350-gpucc";
> +			reg = <0 0x03d90000 0 0x9000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +			clock-names = "bi_tcxo",
> +				      "gcc_gpu_gpll0_clk_src",
> +				      "gcc_gpu_gpll0_div_clk_src";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,sm8350-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
> +			reg = <0 0x03da0000 0 0x20000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <2>;
> +			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HUB_AON_CLK>;
> +			clock-names = "bus",
> +				      "iface",
> +				      "ahb",
> +				      "hlos1_vote_gpu_smmu",
> +				      "cx_gmu",
> +				      "hub_cx_int",
> +				      "hub_aon";
> +
> +			power-domains = <&gpucc GPU_CX_GDSC>;
> +			dma-coherent;
> +		};
> +
>  		lpass_ag_noc: interconnect@3c40000 {
>  			compatible = "qcom,sm8350-lpass-ag-noc";
>  			reg = <0 0x03c40000 0 0xf080>;
