Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3E768BACE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 11:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0027110E2C7;
	Mon,  6 Feb 2023 10:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAA210E175
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 10:52:01 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id l12so2280628edb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 02:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PA/OQTy1XXwabj9MrmhG05gDuPJ3LuUKwhOj43vyYxs=;
 b=xt1KZ+EcjUSNe3cPHIOZDLCJ/sI3aqaz+2JUO6I3qJjRk1GaSkwi18GuNmR2rC3qJ+
 OhNgrxpCBgU+U3wZzkYaJL6KbhW3VWPq8U0zII/CDqBrrK1viVmJA0JFG6m9znpCAXYM
 uy3ntceac4PumPWFNOdZ01AjF6dY1ra1+Z34dXv4H12coMuEIuUFIHj1sJlaj13CgNhg
 PyeXmXGq6YxbJhL1e7PVwIKHdZNFcsxjD2YWuUhIgKBupIA1JcqSIa73tIPAxajwTETh
 zD/3TOaqWmL+nRT225F4ebek1wSQqiuqxvcvRRSNMYQT8vVWPzsNnHKQCvWUJiyZ6ONv
 0QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PA/OQTy1XXwabj9MrmhG05gDuPJ3LuUKwhOj43vyYxs=;
 b=DBzPJ6Zq4n8Oi2QVUF2yjJftjAzBaI2QGER5di1zolb0UsKLVrfvPGtKWYuJzZdbOh
 UCJIAKcQIAyNmKlAsZFvpPmAcGDoXCv6DdfT/q5LqgKwHy/lkpEc1ldL93OulAZYKNWw
 6Y3mqRiM4CMzjy1sYqcwZFtX2V097Qy8LOZekZWJl8pdq9CfflAUdCNFZHh3DVShdmGh
 fsXFAwilZD9I0XJ1VgafcgcLbwj1FCPglOw2vqFm3MnA4UdNw/McKgzH/vVK6bPpYZhz
 uSCBS6WHzzRIY4vj3hucxJo8DcfvKeA5dx8zdl08amLt+B5GUAdXJwxwiqPH8S2EPNDu
 NZ6w==
X-Gm-Message-State: AO0yUKWPfGG0MpUFyKwlstgm1z6+WPEKO6JGXBaadStRcLPXPUfIsQbH
 QLzHDU/oRebILpaRQGWpfdShag==
X-Google-Smtp-Source: AK7set+abnAtpli6WCC0tB+Zk85CoYAkS2fh3VxD8O8B5Dw1R7K43nJiYTBWHIOQdg9N8llFOCs8gA==
X-Received: by 2002:a50:d0ce:0:b0:4aa:b2a6:d933 with SMTP id
 g14-20020a50d0ce000000b004aab2a6d933mr2986077edf.27.1675680719814; 
 Mon, 06 Feb 2023 02:51:59 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a056402518a00b00463bc1ddc76sm4879337edd.28.2023.02.06.02.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 02:51:59 -0800 (PST)
Message-ID: <a09a26cd-5b46-214e-90b3-a4388b8b2a5a@linaro.org>
Date: Mon, 6 Feb 2023 11:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and
 SMMU nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-9-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206002735.2736935-9-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6.02.2023 01:27, Dmitry Baryshkov wrote:
> Add device nodes required to enable GPU on the SM8350 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 179 +++++++++++++++++++++++++++
>  1 file changed, 179 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index e5b308957f88..a73cd9eb63e0 100644
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
> @@ -1767,6 +1768,184 @@ tcsr_mutex: hwlock@1f40000 {
>  			#hwlock-cells = <1>;
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-660.1",
> +				     "qcom,adreno";
No need to wrap this line.

> +
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
> +				/* not for v1 */
The shipping version is v2.1 and you defined the 660.1 chipid,
which maps to lahaina(>=v2)

> +				opp-840000000 {
> +					opp-hz = /bits/ 64 <840000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +				};
> +
> +				/* not for v1 */
> +				opp-778000000 {
> +					opp-hz = /bits/ 64 <778000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +				};
> +
> +				/* not for v1 */
> +				opp-738000000 {
> +					opp-hz = /bits/ 64 <738000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +				};
> +
> +				/* for v1
> +				opp-710000000 {
> +					opp-hz = /bits/ 64 <710000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +				};
> +				*/
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
> +				/* not for v1 */
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
> +				/* not for v1 */
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
Shouldn't this one belong to the smmu?

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
> +			clocks = <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
> +			clock-names = "ahb", "bus", "iface";
> +
> +			power-domains = <&gpucc GPU_CX_GDSC>;
Downstream marks this smmu dma-coherent

Konrad
> +		};
> +
>  		lpass_ag_noc: interconnect@3c40000 {
>  			compatible = "qcom,sm8350-lpass-ag-noc";
>  			reg = <0 0x03c40000 0 0xf080>;
