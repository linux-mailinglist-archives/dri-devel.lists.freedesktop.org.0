Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F5C674099
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 19:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A038F10E1C6;
	Thu, 19 Jan 2023 18:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0CB10E19C;
 Thu, 19 Jan 2023 18:12:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30JHwKpD014280; Thu, 19 Jan 2023 18:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=0t2cAvZhP3n5DRBDOYFkpTsSxhPTrz9mt2vhX4yrNnk=;
 b=Apuur0BlUxrFtAbJqmBUC2zxULdrbVdhD0QihvWBprkyLve9rePPCNWL6qyvkmYNhyZ7
 9NI55chMnODc6W1xmtRKMCicZuhLagIlTyhFzK64jk1NDDbcrXzYqSlurRAzJwl+MCIt
 ctqdLxmHqISLE/Dt/wZBVlz8xyzaxKZ/Ap53OaXDKrGBOLeLLvXg2+mJAFDLrUQGlQoZ
 NzjLpZtd9RsOvaDFSS/U8VVcq/tlphC5XJZ5xCZzyByl8Ebg18EO+OTQ1pBb1dgndtW7
 T9wlVzBl5xUBBbsMwWrZnU0klrsvLJSOGN3Xc7BYpgTw+vf5pzWXjiQj2D/UaIuuthmD ng== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6vg026e7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 18:12:23 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30JICNkF002387
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 18:12:23 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 10:12:22 -0800
Date: Thu, 19 Jan 2023 10:12:21 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sc8280xp: Define some of the
 display blocks
Message-ID: <20230119181221.GA3951310@hu-bjorande-lv.qualcomm.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-11-quic_bjorande@quicinc.com>
 <6e7b1518-0dd5-59a6-128a-e3c3c194bf52@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6e7b1518-0dd5-59a6-128a-e3c3c194bf52@linaro.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xAP35k12o5c-4LTeND7FjchopdsRVfqB
X-Proofpoint-GUID: xAP35k12o5c-4LTeND7FjchopdsRVfqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_11,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190150
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 04:58:26AM +0200, Dmitry Baryshkov wrote:
> On 08/12/2022 00:00, Bjorn Andersson wrote:
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > Define the display clock controllers, the MDSS instances, the DP phys
> > and connect these together.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> > 
> > Changes since v4:
> > - None
> > 
> >   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 838 +++++++++++++++++++++++++
> >   1 file changed, 838 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > index 9f3132ac2857..c2f186495506 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > @@ -4,6 +4,7 @@
> >    * Copyright (c) 2022, Linaro Limited
> >    */
> > +#include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
> >   #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
> >   #include <dt-bindings/clock/qcom,rpmh.h>
> >   #include <dt-bindings/interconnect/qcom,sc8280xp.h>
> > @@ -1698,6 +1699,44 @@ usb_1_qmpphy: phy@8903000 {
> >   			status = "disabled";
> >   		};
> > +		mdss1_dp0_phy: phy@8909a00 {
> > +			compatible = "qcom,sc8280xp-dp-phy";
> > +			reg = <0 0x08909a00 0 0x19c>,
> > +			      <0 0x08909200 0 0xec>,
> > +			      <0 0x08909600 0 0xec>,
> > +			      <0 0x08909000 0 0x1c8>;
> > +
> > +			clocks = <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
> > +				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
> > +			clock-names = "aux", "cfg_ahb";
> > +
> > +			power-domains = <&rpmhpd SC8280XP_MX>;
> > +
> > +			#clock-cells = <1>;
> > +			#phy-cells = <0>;
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		mdss1_dp1_phy: phy@890ca00 {
> > +			compatible = "qcom,sc8280xp-dp-phy";
> > +			reg = <0 0x0890ca00 0 0x19c>,
> > +			      <0 0x0890c200 0 0xec>,
> > +			      <0 0x0890c600 0 0xec>,
> > +			      <0 0x0890c000 0 0x1c8>;
> > +
> > +			clocks = <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
> > +				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
> > +			clock-names = "aux", "cfg_ahb";
> > +
> > +			power-domains = <&rpmhpd SC8280XP_MX>;
> > +
> > +			#clock-cells = <1>;
> > +			#phy-cells = <0>;
> > +
> > +			status = "disabled";
> > +		};
> > +
> >   		system-cache-controller@9200000 {
> >   			compatible = "qcom,sc8280xp-llcc";
> >   			reg = <0 0x09200000 0 0x58000>, <0 0x09600000 0 0x58000>;
> > @@ -1813,6 +1852,326 @@ usb_1_dwc3: usb@a800000 {
> >   			};
> >   		};
> > +		mdss0: display-subsystem@ae00000 {
> > +			compatible = "qcom,sc8280xp-mdss";
> > +			reg = <0 0x0ae00000 0 0x1000>;
> > +			reg-names = "mdss";
> > +
> > +			power-domains = <&dispcc0 MDSS_GDSC>;
> > +
> > +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> > +				 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
> > +				 <&dispcc0 DISP_CC_MDSS_MDP_CLK>;
> > +			clock-names = "iface",
> > +				      "ahb",
> > +				      "core";
> > +
> > +			resets = <&dispcc0 DISP_CC_MDSS_CORE_BCR>;
> > +
> > +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-controller;
> > +			#interrupt-cells = <1>;
> > +
> > +			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> > +					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
> > +			interconnect-names = "mdp0-mem", "mdp1-mem";
> > +
> > +			iommus = <&apps_smmu 0x1000 0x402>;
> > +
> > +			status = "disabled";
> > +
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			ranges;
> > +
> > +			mdss0_mdp: display-controller@ae01000 {
> > +				compatible = "qcom,sc8280xp-dpu";
> > +				reg = <0 0x0ae01000 0 0x8f000>,
> > +				      <0 0x0aeb0000 0 0x2008>;
> > +				reg-names = "mdp", "vbif";
> > +
> > +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> > +					 <&gcc GCC_DISP_SF_AXI_CLK>,
> > +					 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
> > +					 <&dispcc0 DISP_CC_MDSS_MDP_LUT_CLK>,
> > +					 <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
> > +					 <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
> > +				clock-names = "bus",
> > +					      "nrt_bus",
> > +					      "iface",
> > +					      "lut",
> > +					      "core",
> > +					      "vsync";
> > +
> > +				assigned-clocks = <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
> > +						  <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
> > +				assigned-clock-rates = <460000000>,
> > +						       <19200000>;
> > +
> > +				operating-points-v2 = <&mdss0_mdp_opp_table>;
> > +				power-domains = <&rpmhpd SC8280XP_MMCX>;
> > +
> > +				interrupt-parent = <&mdss0>;
> > +				interrupts = <0>;
> > +
> > +				ports {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					port@5 {
> > +						reg = <5>;
> > +						mdss0_intf5_out: endpoint {
> > +							remote-endpoint = <&mdss0_dp3_in>;
> > +						};
> > +					};
> > +
> > +					port@6 {
> > +						reg = <6>;
> > +						mdss0_intf6_out: endpoint {
> > +							remote-endpoint = <&mdss0_dp2_in>;
> > +						};
> > +					};
> > +				};
> 
> This now fails with:
> 
> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: display-controller@ae01000:
> ports: 'port@0' is a required property
> 	From schema:
> Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: display-controller@ae01000:
> Unevaluated properties are not allowed ('ports' was unexpected)
> 	From schema:
> Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
> 
> We do not map reg ids to INTF indices. So, unless you plan to change that,
> could you please change these to port@0 / port@1 ?
> 

Too bad, I liked the fact that I gave these numbers any form of meaning.
I guess we can change it to just be an arbitrary index, and keep the
intf-information in the label...

Regards,
Bjorn

> [skipped the rest]
> 
> -- 
> With best wishes
> Dmitry
> 
