Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78871F24B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 20:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CDC10E063;
	Thu,  1 Jun 2023 18:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC1210E063;
 Thu,  1 Jun 2023 18:46:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351IV73l011329; Thu, 1 Jun 2023 18:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=F0WJVLyRQu7X8JxkRniXUb+QdkBHIpcaPwMpaFf3WGM=;
 b=Gj8dtd4RhryW2b/3x927fC5Wh6Nfz112H/MgwMldSobPBPjm4q0YCTj0BLpmQGoxEpC6
 Qhz8ywlX0St9afdDJCLlKKtCHECEnklFPfObq8RTFNUeB867Ivd4ilSYWqicztIS/pGC
 4wCI9sAa8qK3LtsOsReh66au8dmWfxhwcPHvyetofY4qSZcdbQckHf+cgLpzFaDzHNVB
 RdTOY2/N+b4Kq/rj7waXp97LQ5M1K8RC793uNy1lCkarB84aN06xU82wK9dusoGbeg7H
 IBOLqPoj9pc/r0f8nXWjZHSwFLqtVVBfXodaD5rFN3oUk3GmNoDp+BJqb+TfzHRimz+T Vg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qxqne9k9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jun 2023 18:46:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 351IkIiG004585
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Jun 2023 18:46:18 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 1 Jun 2023 11:46:15 -0700
Date: Fri, 2 Jun 2023 00:16:12 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sc8280xp: Add GPU related nodes
Message-ID: <loayg6bkpcq5iy7oc5ag6gnlyh4crqjyzgwxfh75qfgepk5iqh@64lut5tgumof>
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
 <20230523011522.65351-3-quic_bjorande@quicinc.com>
 <097944b0-fa7a-ad4d-1c3d-e74ab2b977de@linaro.org>
 <20230528170717.GG2814@thinkpad>
 <a64ac105-90cf-eea0-5cb2-74be201386a9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a64ac105-90cf-eea0-5cb2-74be201386a9@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: sAa5Zpn6kBN-dzLFg1e8x18zqKnT8RSg
X-Proofpoint-GUID: sAa5Zpn6kBN-dzLFg1e8x18zqKnT8RSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306010162
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, johan@kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 29, 2023 at 09:38:59AM +0200, Konrad Dybcio wrote:
> 
> 
> 
> On 28.05.2023 19:07, Manivannan Sadhasivam wrote:
> > On Tue, May 23, 2023 at 09:59:53AM +0200, Konrad Dybcio wrote:
> >>
> >>
> >> On 23.05.2023 03:15, Bjorn Andersson wrote:
> >>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>>
> >>> Add Adreno SMMU, GPU clock controller, GMU and GPU nodes for the
> >>> SC8280XP.
> >>>
> >>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> >>> ---
> >> It does not look like you tested the DTS against bindings. Please run
> >> `make dtbs_check` (see
> >> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> >>
> >>>
> >>> Changes since v1:
> >>> - Dropped gmu_pdc_seq region from &gmu, as it shouldn't have been used.
> >>> - Added missing compatible to &adreno_smmu.
> >>> - Dropped aoss_qmp clock in &gmu and &adreno_smmu.
> >>>  
> >>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 169 +++++++++++++++++++++++++
> >>>  1 file changed, 169 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> >>> index d2a2224d138a..329ec2119ecf 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> >>> @@ -6,6 +6,7 @@
> >>>  
> >>>  #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
> >>>  #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
> >>> +#include <dt-bindings/clock/qcom,gpucc-sc8280xp.h>
> >>>  #include <dt-bindings/clock/qcom,rpmh.h>
> >>>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> >>>  #include <dt-bindings/interconnect/qcom,sc8280xp.h>
> >>> @@ -2331,6 +2332,174 @@ tcsr: syscon@1fc0000 {
> >>>  			reg = <0x0 0x01fc0000 0x0 0x30000>;
> >>>  		};
> >>>  
> >>> +		gpu: gpu@3d00000 {
> >>> +			compatible = "qcom,adreno-690.0", "qcom,adreno";
> >>> +
> >>> +			reg = <0 0x03d00000 0 0x40000>,
> >>> +			      <0 0x03d9e000 0 0x1000>,
> >>> +			      <0 0x03d61000 0 0x800>;
> >>> +			reg-names = "kgsl_3d0_reg_memory",
> >>> +				    "cx_mem",
> >>> +				    "cx_dbgc";
> >>> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> >>> +			iommus = <&adreno_smmu 0 0xc00>, <&adreno_smmu 1 0xc00>;
> >>> +			operating-points-v2 = <&gpu_opp_table>;
> >>> +
> >>> +			qcom,gmu = <&gmu>;
> >>> +			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> >>> +			interconnect-names = "gfx-mem";
> >>> +			#cooling-cells = <2>;
> >>> +
> >>> +			status = "disabled";
> >>> +
> >>> +			gpu_opp_table: opp-table {
> >>> +				compatible = "operating-points-v2";
> >>> +
> >>> +				opp-270000000 {
> >>> +					opp-hz = /bits/ 64 <270000000>;
> >>> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> >>> +					opp-peak-kBps = <451000>;
> >>> +				};
> >>> +
> >>> +				opp-410000000 {
> >>> +					opp-hz = /bits/ 64 <410000000>;
> >>> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> >>> +					opp-peak-kBps = <1555000>;
> >>> +				};
> >>> +
> >>> +				opp-500000000 {
> >>> +					opp-hz = /bits/ 64 <500000000>;
> >>> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> >>> +					opp-peak-kBps = <1555000>;
> >>> +				};
> >>> +
> >>> +				opp-547000000 {
> >>> +					opp-hz = /bits/ 64 <547000000>;
> >>> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> >>> +					opp-peak-kBps = <1555000>;
> >>> +				};
> >>> +
> >>> +				opp-606000000 {
> >>> +					opp-hz = /bits/ 64 <606000000>;
> >>> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> >>> +					opp-peak-kBps = <2736000>;
> >>> +				};
> >>> +
> >>> +				opp-640000000 {
> >>> +					opp-hz = /bits/ 64 <640000000>;
> >>> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> >>> +					opp-peak-kBps = <2736000>;
> >>> +				};
> >>> +
> >>> +				opp-690000000 {
> >>> +					opp-hz = /bits/ 64 <690000000>;
> >>> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> >>> +					opp-peak-kBps = <2736000>;
> >>> +				};
> >>> +			};
> >>> +		};
> >>> +
> >>> +		gmu: gmu@3d6a000 {
> >>> +			compatible = "qcom,adreno-gmu-690.0", "qcom,adreno-gmu";
> >>> +			reg = <0 0x03d6a000 0 0x34000>,
> >>> +			      <0 0x03de0000 0 0x10000>,
> >>> +			      <0 0x0b290000 0 0x10000>;
> >>> +			reg-names = "gmu", "rscc", "gmu_pdc";
> >>> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> >>> +			interrupt-names = "hfi", "gmu";
> >>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> >>> +				 <&gpucc GPU_CC_CXO_CLK>,
> >>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> >>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> >>> +				 <&gpucc GPU_CC_AHB_CLK>,
> >>> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> >>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> >>> +			clock-names = "gmu",
> >>> +				      "cxo",
> >>> +				      "axi",
> >>> +				      "memnoc",
> >>> +				      "ahb",
> >>> +				      "hub",
> >>> +				      "smmu_vote";
> >>> +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
> >>> +					<&gpucc GPU_CC_GX_GDSC>;
> >>> +			power-domain-names = "cx",
> >>> +					     "gx";
> >>> +			iommus = <&adreno_smmu 5 0xc00>;
> >>> +			operating-points-v2 = <&gmu_opp_table>;
> >>> +
> >>> +			status = "disabled";
> >> I've recently discovered that - and I am not 100% sure - all GMUs are
> >> cache-coherent. Could you please ask somebody at qc about this?

If supported at hw and necessary pte attributes are present, all GPU transactions are
cache-coherent. Since gmu is part of GPU, it is a fairly good assumption that it would
be too. 

But current set of GMUs doesn't do enough frequent chatter with CPU to
get any meaningful benefit with coherency. So I feel it is better to
leave it similar to downstream.

-Akhil

> >>
> > 
> > AFAIU, GMU's job is controlling the voltage and clock to the GPU.
> Not just that, it's only the limited functionality we've implemented
> upstream so far.
> 
> It doesn't do
> > any data transactions on its own.
> Of course it does. AP communication is done through MMIO writes and
> the GMU talks to RPMh via the GPU RSC directly. Apart from that, some
> of the GPU registers (that nota bene don't have anything to do with
> the GMU M3 core itself) lay within the GMU address space.
> 
> 
> Bjorn noticed that this coherent mask setting downstream may be
> a bluff, but I guess we could poke Qualcomm about whether it's
> cache-coherent (Akhil, could you say anything about that?).
> 
> Konrad
> 
> So cache-coherent doesn't make sense to me.
> > 
> > - Mani
> > 
> >>> +
> >>> +			gmu_opp_table: opp-table {
> >>> +				compatible = "operating-points-v2";
> >>> +
> >>> +				opp-200000000 {
> >>> +					opp-hz = /bits/ 64 <200000000>;
> >>> +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> >>> +				};
> >> Missing 500MHz + RPMH_REGULATOR_LEVEL_SVS
> >>
> >> (that may be used in the future for hw scheduling)
> >>> +			};
> >>> +		};
> >>> +
> >>> +		gpucc: clock-controller@3d90000 {
> >>> +			compatible = "qcom,sc8280xp-gpucc";
> >>> +			reg = <0 0x03d90000 0 0x9000>;
> >>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> >>> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> >>> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> >>> +			clock-names = "bi_tcxo",
> >>> +				      "gcc_gpu_gpll0_clk_src",
> >>> +				      "gcc_gpu_gpll0_div_clk_src";
> >> FWIW the driver doesn't use clock-names, but the binding defines it,
> >> so I suppose it's fine
> >>
> >>> +
> >>> +			power-domains = <&rpmhpd SC8280XP_GFX>;
> >>> +			#clock-cells = <1>;
> >>> +			#reset-cells = <1>;
> >>> +			#power-domain-cells = <1>;
> >>> +
> >>> +			status = "disabled";
> >>> +		};
> >>> +
> >>> +		adreno_smmu: iommu@3da0000 {
> >>> +			compatible = "qcom,sc8280xp-smmu-500", "qcom,adreno-smmu",
> >>> +				     "qcom,smmu-500", "arm,mmu-500";
> >>> +			reg = <0 0x03da0000 0 0x20000>;
> >>> +			#iommu-cells = <2>;
> >>> +			#global-interrupts = <2>;
> >>> +			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>;
> >>> +
> >>> +			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> >>> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
> >>> +				 <&gpucc GPU_CC_AHB_CLK>,
> >>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
> >>> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
> >>> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> >>> +				 <&gpucc GPU_CC_HUB_AON_CLK>;
> >>> +			clock-names = "gcc_gpu_memnoc_gfx_clk",
> >>> +				      "gcc_gpu_snoc_dvm_gfx_clk",
> >>> +				      "gpu_cc_ahb_clk",
> >>> +				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
> >>> +				      "gpu_cc_cx_gmu_clk",
> >>> +				      "gpu_cc_hub_cx_int_clk",
> >>> +				      "gpu_cc_hub_aon_clk";
> >>> +
> >>> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> >>> +
> >>> +			status = "disabled";
> >> This one should be dma-coherent (per downstream, plus 8350's mmu is for sure)
> >>
> >> Konrad
> >>> +		};
> >>> +
> >>>  		usb_0_hsphy: phy@88e5000 {
> >>>  			compatible = "qcom,sc8280xp-usb-hs-phy",
> >>>  				     "qcom,usb-snps-hs-5nm-phy";
> > 
