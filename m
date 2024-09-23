Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B22197F183
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 22:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125E410E48B;
	Mon, 23 Sep 2024 20:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GprJa2hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C402C10E48A;
 Mon, 23 Sep 2024 20:05:54 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NB0kfs004282;
 Mon, 23 Sep 2024 20:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UamudfL21Lb2M9lBmhoBDp2W
 oIDD5EOwv+TFnn9srvg=; b=GprJa2hiTo1Damd0slzujVHSvkllpBn5GWSUbRqc
 Q5tgTpuK+9mxg4GdnEMFI0xXgKCVq7fpTV1hQOf/vxOknpzaefghmNdI0Ozc7hhL
 pdtjJtTfb2dgWZAqn4Y/OE45penl9RxwoURHB4dyQCZQrnTPCOLmjrZpCWdshcvb
 v3+RJDaU4Y8raouaXe6NyFmFjuMJdUk+iKInc/vG1oAeEdxnEoWgrri/JFl9B8ww
 qkxnnMAAFb2zybEvM3ITIccGR4I9y6SDZdKwaWvDg4UkgDrbiaNLtFpTTR4QeG4R
 VSti8U1QqJS/0TBKkkRNjOYls9dV1DcqHhirY6dgtqC72g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakdtqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2024 20:05:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48NK5llQ003734
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2024 20:05:47 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Sep 2024 13:05:41 -0700
Date: Tue, 24 Sep 2024 01:35:37 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Puranam V G Tejaswi"
 <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Message-ID: <20240923200537.q5rcw66wmqnwmtpk@hu-akhilpo-hyd.qualcomm.com>
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
 <20240918-a663-gpu-support-v1-3-25fea3f3d64d@quicinc.com>
 <udt76i3sl7zekhudqpnvhvhfxchvixwoinz7metuwfrpynl47k@wlpforwv7mcf>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <udt76i3sl7zekhudqpnvhvhfxchvixwoinz7metuwfrpynl47k@wlpforwv7mcf>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Z1IHc7ztRIcqQB16xIqxzTzLQGLbnF3B
X-Proofpoint-GUID: Z1IHc7ztRIcqQB16xIqxzTzLQGLbnF3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409230145
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

On Wed, Sep 18, 2024 at 12:27:03AM +0300, Dmitry Baryshkov wrote:
> On Wed, Sep 18, 2024 at 02:08:43AM GMT, Akhil P Oommen wrote:
> > From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > 
> > Add gpu and gmu nodes for sa8775p based platforms.
> 
> Which platforms? The commit adds nodes to the SoC and the single RIDE
> platform.
> 
> > 
> > Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  8 ++++
> >  arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 75 ++++++++++++++++++++++++++++++
> >  2 files changed, 83 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > index 2a6170623ea9..a01e6675c4bb 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > @@ -407,6 +407,14 @@ queue3 {
> >  	};
> >  };
> >  
> > +&gpu {
> > +	status = "okay";
> > +
> > +	zap-shader {
> 
> It's easier to add gpu_zap_shader_link label in the DTSI file and then
> reference it instead of using the subnode again.
> 
> > +		firmware-name = "qcom/sa8775p/a663_zap.mbn";
> > +	};
> > +};
> 
> Separate patch, please.
> 
> > +
> >  &i2c11 {
> >  	clock-frequency = <400000>;
> >  	pinctrl-0 = <&qup_i2c11_default>;
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > index 23f1b2e5e624..12c79135a303 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > @@ -2824,6 +2824,81 @@ tcsr_mutex: hwlock@1f40000 {
> >  			#hwlock-cells = <1>;
> >  		};
> >  
> > +		gpu: gpu@3d00000 {
> > +			compatible = "qcom,adreno-663.0", "qcom,adreno";
> > +			reg = <0 0x03d00000 0 0x40000>,
> > +			      <0 0x03d9e000 0 0x1000>,
> > +			      <0 0x03d61000 0 0x800>;
> 
> I think it's suggested to use 0x0 now
> 
> > +			reg-names = "kgsl_3d0_reg_memory",
> > +				    "cx_mem",
> > +				    "cx_dbgc";
> > +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> > +			iommus = <&adreno_smmu 0 0xc00>,
> > +				 <&adreno_smmu 1 0xc00>;
> > +			operating-points-v2 = <&gpu_opp_table>;
> > +			qcom,gmu = <&gmu>;
> > +			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> 
> QCOM_ICC_TAG_ALWAYS instead of 0
> 
> > +			interconnect-names = "gfx-mem";
> > +			#cooling-cells = <2>;
> 
> No speed bins?

Thanks for the review. Agree on all comments.

Speedbins were missed because we are sharing these changes early in the
developement cycle, sort of like what we did for chromeos develeopment.
Will try to pick it up in the next patchset.

-Akhil

> 
> > +
> > +			status = "disabled";
> > +
> > +			zap-shader {
> 
> gpu_zap_shader: zap-shader
> 
> > +				memory-region = <&pil_gpu_mem>;
> > +			};
> > +
> > +			gpu_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-405000000 {
> 
> Just a single freq?
> 
> > +					opp-hz = /bits/ 64 <405000000>;
> > +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > +					opp-peak-kBps = <8368000>;
> > +				};
> > +
> 
> Drop the empty line, please.
> 
> > +			};
> > +		};
> > +
> > +		gmu: gmu@3d6a000 {
> > +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> > +			reg = <0 0x03d6a000 0 0x34000>,
> > +				<0 0x3de0000 0 0x10000>,
> > +				<0 0x0b290000 0 0x10000>;
> 
> Wrong indentation, please align to the angle bracket.
> Also I think it's suggested to use 0x0 now
> 
> > +			reg-names = "gmu", "rscc", "gmu_pdc";
> > +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> > +					<GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> 
> And here
> 
> > +			interrupt-names = "hfi", "gmu";
> > +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> > +				 <&gpucc GPU_CC_CXO_CLK>,
> > +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> > +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> > +				 <&gpucc GPU_CC_AHB_CLK>,
> > +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> > +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> > +			clock-names = "gmu",
> > +				      "cxo",
> > +				      "axi",
> > +				      "memnoc",
> > +				      "ahb",
> > +				      "hub",
> > +				      "smmu_vote";
> > +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
> > +					<&gpucc GPU_CC_GX_GDSC>;
> > +			power-domain-names = "cx",
> > +					     "gx";
> > +			iommus = <&adreno_smmu 5 0xc00>;
> > +			operating-points-v2 = <&gmu_opp_table>;
> > +
> > +			gmu_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-200000000 {
> > +					opp-hz = /bits/ 64 <200000000>;
> > +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> > +				};
> > +			};
> > +		};
> > +
> >  		gpucc: clock-controller@3d90000 {
> >  			compatible = "qcom,sa8775p-gpucc";
> >  			reg = <0x0 0x03d90000 0x0 0xa000>;
> > 
> > -- 
> > 2.45.2
> > 
> 
> -- 
> With best wishes
> Dmitry
