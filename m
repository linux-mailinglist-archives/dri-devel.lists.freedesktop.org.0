Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8288F70D672
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152B010E3DA;
	Tue, 23 May 2023 07:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE7610E3DD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 07:59:56 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f3baf04f0cso3005520e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684828795; x=1687420795;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h/aoipumKtjIgmVBCWgRH2IIEC1OCL6rlPm9b4d5hh0=;
 b=UqbKskCFs7Yylj9hk2lyeQnecJv2S5XiLMPo7CBLXsyqv9nhEVaK7jYaIEv038CJ60
 1qbpk+82UE+DJdIvpD8BuQ8g6Z7O9EzcBaeXR9Oe+HepXRI+StsADCOn6m9rYIB1fQST
 RVvX0B4ihaF9/OyksAhqxMHOUZ9ybGrlNC6H7P8GSsc38KA/Ec+wU9k7GqFa9OL+K2Bw
 g1MHwmB0xmqOeN8gg8o8LqQeU5raJPB+E3kIBduR5e5s9sU8N7Pz8RBt1dDoHwwdL6jr
 x8yuI6CoRcRQ6mTMUGvrX7WAF/L/IsnTGd/ZggoxkZOuIo8rdg05zZabhem+qlk9hltP
 l5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684828795; x=1687420795;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h/aoipumKtjIgmVBCWgRH2IIEC1OCL6rlPm9b4d5hh0=;
 b=eCPvibG+kRLJQACchXAnZGLDjX/QyBsZPbME3OHNeq/uvW0q6/nlfQCS9J6QVyv4JN
 5v7Z0AWE5VPFBhsdAhO2r6QrbsrXb5iNk4Q2H/qVy8vYv/jO6Zjn2CmeJzJheOb3EMiz
 EBlBNOy9dyyZeiKHqPgX/29vc+iog1cCV4OszjqTwLcyPNP3tF/JvRRcSiBlwomex9EM
 2s6GlQD/r+e4M9IjhCTu9O5IchJqYxfS9G8QtygKlcanSUzSf/vGR1XZivlGu8DR9lri
 Ph7bsOtjW0ahZnUT944bFVDJtUos/Txpv9y+L9SDxtBh/DzO5Q+vfzJ/cLo4NqezM2DH
 E4FA==
X-Gm-Message-State: AC+VfDzSpAu8+26GSPQMJ6EL87lPUycA9dJCoU41dtpTk/zzYfgQQYy6
 fSKaOaTdOwllgdo0XCpO4sERRQ==
X-Google-Smtp-Source: ACHHUZ4hBzBfGUkzVb30MbKl54siE4/TDVUICuxRJ347mzFww1b7qcAvP1rxrghl9gmrYfd6X7qPlQ==
X-Received: by 2002:a05:6512:510:b0:4f3:8196:80c8 with SMTP id
 o16-20020a056512051000b004f3819680c8mr3993040lfb.1.1684828794784; 
 Tue, 23 May 2023 00:59:54 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a2e9ac4000000b002a774fb7923sm1522807ljj.45.2023.05.23.00.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 00:59:54 -0700 (PDT)
Message-ID: <097944b0-fa7a-ad4d-1c3d-e74ab2b977de@linaro.org>
Date: Tue, 23 May 2023 09:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
 <20230523011522.65351-3-quic_bjorande@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sc8280xp: Add GPU related nodes
In-Reply-To: <20230523011522.65351-3-quic_bjorande@quicinc.com>
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 johan@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23.05.2023 03:15, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add Adreno SMMU, GPU clock controller, GMU and GPU nodes for the
> SC8280XP.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> 
> Changes since v1:
> - Dropped gmu_pdc_seq region from &gmu, as it shouldn't have been used.
> - Added missing compatible to &adreno_smmu.
> - Dropped aoss_qmp clock in &gmu and &adreno_smmu.
>  
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 169 +++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index d2a2224d138a..329ec2119ecf 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
>  #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
> +#include <dt-bindings/clock/qcom,gpucc-sc8280xp.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,sc8280xp.h>
> @@ -2331,6 +2332,174 @@ tcsr: syscon@1fc0000 {
>  			reg = <0x0 0x01fc0000 0x0 0x30000>;
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-690.0", "qcom,adreno";
> +
> +			reg = <0 0x03d00000 0 0x40000>,
> +			      <0 0x03d9e000 0 0x1000>,
> +			      <0 0x03d61000 0 0x800>;
> +			reg-names = "kgsl_3d0_reg_memory",
> +				    "cx_mem",
> +				    "cx_dbgc";
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus = <&adreno_smmu 0 0xc00>, <&adreno_smmu 1 0xc00>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +
> +			qcom,gmu = <&gmu>;
> +			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "gfx-mem";
> +			#cooling-cells = <2>;
> +
> +			status = "disabled";
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-270000000 {
> +					opp-hz = /bits/ 64 <270000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					opp-peak-kBps = <451000>;
> +				};
> +
> +				opp-410000000 {
> +					opp-hz = /bits/ 64 <410000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					opp-peak-kBps = <1555000>;
> +				};
> +
> +				opp-500000000 {
> +					opp-hz = /bits/ 64 <500000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-peak-kBps = <1555000>;
> +				};
> +
> +				opp-547000000 {
> +					opp-hz = /bits/ 64 <547000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +					opp-peak-kBps = <1555000>;
> +				};
> +
> +				opp-606000000 {
> +					opp-hz = /bits/ 64 <606000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-peak-kBps = <2736000>;
> +				};
> +
> +				opp-640000000 {
> +					opp-hz = /bits/ 64 <640000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					opp-peak-kBps = <2736000>;
> +				};
> +
> +				opp-690000000 {
> +					opp-hz = /bits/ 64 <690000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					opp-peak-kBps = <2736000>;
> +				};
> +			};
> +		};
> +
> +		gmu: gmu@3d6a000 {
> +			compatible = "qcom,adreno-gmu-690.0", "qcom,adreno-gmu";
> +			reg = <0 0x03d6a000 0 0x34000>,
> +			      <0 0x03de0000 0 0x10000>,
> +			      <0 0x0b290000 0 0x10000>;
> +			reg-names = "gmu", "rscc", "gmu_pdc";
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hfi", "gmu";
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
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
> +					<&gpucc GPU_CC_GX_GDSC>;
> +			power-domain-names = "cx",
> +					     "gx";
> +			iommus = <&adreno_smmu 5 0xc00>;
> +			operating-points-v2 = <&gmu_opp_table>;
> +
> +			status = "disabled";
I've recently discovered that - and I am not 100% sure - all GMUs are
cache-coherent. Could you please ask somebody at qc about this?

> +
> +			gmu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +				};
Missing 500MHz + RPMH_REGULATOR_LEVEL_SVS

(that may be used in the future for hw scheduling)
> +			};
> +		};
> +
> +		gpucc: clock-controller@3d90000 {
> +			compatible = "qcom,sc8280xp-gpucc";
> +			reg = <0 0x03d90000 0 0x9000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +			clock-names = "bi_tcxo",
> +				      "gcc_gpu_gpll0_clk_src",
> +				      "gcc_gpu_gpll0_div_clk_src";
FWIW the driver doesn't use clock-names, but the binding defines it,
so I suppose it's fine

> +
> +			power-domains = <&rpmhpd SC8280XP_GFX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +
> +			status = "disabled";
> +		};
> +
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,sc8280xp-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
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
> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HUB_AON_CLK>;
> +			clock-names = "gcc_gpu_memnoc_gfx_clk",
> +				      "gcc_gpu_snoc_dvm_gfx_clk",
> +				      "gpu_cc_ahb_clk",
> +				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
> +				      "gpu_cc_cx_gmu_clk",
> +				      "gpu_cc_hub_cx_int_clk",
> +				      "gpu_cc_hub_aon_clk";
> +
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +
> +			status = "disabled";
This one should be dma-coherent (per downstream, plus 8350's mmu is for sure)

Konrad
> +		};
> +
>  		usb_0_hsphy: phy@88e5000 {
>  			compatible = "qcom,sc8280xp-usb-hs-phy",
>  				     "qcom,usb-snps-hs-5nm-phy";
