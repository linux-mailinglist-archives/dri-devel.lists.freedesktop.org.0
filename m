Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996D9C21C01
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D828310E8BC;
	Thu, 30 Oct 2025 18:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zeq3Ll3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA7110E8BC;
 Thu, 30 Oct 2025 18:23:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 95BAE41996;
 Thu, 30 Oct 2025 18:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B814EC4CEF1;
 Thu, 30 Oct 2025 18:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761848626;
 bh=UsFyb5LwLc+VPhhExCfcPzJaryjFY+bm+a2YZeSYVs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zeq3Ll3Qhj8fO2nXwKC0IlLvlsoJicbj4rr/bpl4NHhmMR49sXbKfQndSNLgY+v19
 ph8ogI467aKXAZct7Q1ubvTmJZLsxyf8dbRdzE88nALb00Lgg/+ITBxMkyLPXcNFVw
 cmq5R4VvOdqu2ZUYnpDHdG3s+iTOQqlGh/IdmHVOrR6QEJSUibx0e6jNq3YSEWa7uD
 FozxFt2Up/9SwhLritwpKUKpifEb0htJWWSKrspYY+PzyOIcy3y4Letz/MJtJDVi1Y
 AprFwePjXuhcTlivXL/z+8RypM43T46v6iR623vsjemku6EFaXiO1D8IPduap/rPrP
 sj8niayBo1GlA==
Date: Thu, 30 Oct 2025 13:26:54 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
Message-ID: <nopwvwal3el37fln4zmvg5n2ik5wq6k72tflktcl2r7dof5fmy@m4tglis55mt5>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-3-c4316975dd0e@oss.qualcomm.com>
 <xjes5h45y44cahs7avj4xngprwnks3alnf25tsbptyvckajz3q@lhawlg5vamls>
 <da6eebe0-13ec-4168-aac1-2eef9db3bd13@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da6eebe0-13ec-4168-aac1-2eef9db3bd13@oss.qualcomm.com>
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

On Thu, Oct 30, 2025 at 03:21:09PM +0800, Xiangxu Yin wrote:
> 
> On 10/30/2025 1:32 AM, Bjorn Andersson wrote:
> > On Fri, Oct 24, 2025 at 01:21:03PM +0800, Xiangxu Yin via B4 Relay wrote:
> >> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>
> > Please fix the subject prefix and drop the "for SM6150" suffix.
> >
> > Regards,
> > Bjorn
> 
> 
> Ok, due to sm6150.dtsi have renamed to talos.dtsi in newest version.
> 
> Will update to 'arm64: dts: qcom: talos: Add DisplayPort and QMP USB3DP PHY'
> 

I'd be happy with that, thank you.

Regards,
Bjorn

> 
> >> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
> >> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
> >> clock assignments for proper DP integration.
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 115 ++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 113 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> >> index 6128d8c48f9c0807ac488ddac3b2377678e8f8c3..9741f8d14c72ed7dd6a5e483c5c0d578662f1d31 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> >> @@ -14,6 +14,7 @@
> >>  #include <dt-bindings/interconnect/qcom,icc.h>
> >>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
> >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +#include <dt-bindings/phy/phy-qcom-qmp.h>
> >>  #include <dt-bindings/power/qcom-rpmpd.h>
> >>  #include <dt-bindings/power/qcom,rpmhpd.h>
> >>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> >> @@ -3717,6 +3718,7 @@ port@0 {
> >>  						reg = <0>;
> >>  
> >>  						dpu_intf0_out: endpoint {
> >> +							remote-endpoint = <&mdss_dp0_in>;
> >>  						};
> >>  					};
> >>  
> >> @@ -3749,6 +3751,89 @@ opp-307200000 {
> >>  				};
> >>  			};
> >>  
> >> +			mdss_dp0: displayport-controller@ae90000 {
> >> +				compatible = "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom,sm8350-dp";
> >> +
> >> +				reg = <0x0 0x0ae90000 0x0 0x200>,
> >> +				      <0x0 0x0ae90200 0x0 0x200>,
> >> +				      <0x0 0x0ae90400 0x0 0x600>,
> >> +				      <0x0 0x0ae90a00 0x0 0x600>,
> >> +				      <0x0 0x0ae91000 0x0 0x600>;
> >> +
> >> +				interrupt-parent = <&mdss>;
> >> +				interrupts = <12>;
> >> +
> >> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> >> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> >> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> >> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> >> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> >> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
> >> +				clock-names = "core_iface",
> >> +					      "core_aux",
> >> +					      "ctrl_link",
> >> +					      "ctrl_link_iface",
> >> +					      "stream_pixel",
> >> +					      "stream_1_pixel";
> >> +
> >> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> >> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> >> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
> >> +				assigned-clock-parents = <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
> >> +							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>,
> >> +							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;
> >> +
> >> +				phys = <&usb_qmpphy_2 QMP_USB43DP_DP_PHY>;
> >> +				phy-names = "dp";
> >> +
> >> +				operating-points-v2 = <&dp_opp_table>;
> >> +				power-domains = <&rpmhpd RPMHPD_CX>;
> >> +
> >> +				#sound-dai-cells = <0>;
> >> +
> >> +				status = "disabled";
> >> +
> >> +				ports {
> >> +					#address-cells = <1>;
> >> +					#size-cells = <0>;
> >> +
> >> +					port@0 {
> >> +						reg = <0>;
> >> +
> >> +						mdss_dp0_in: endpoint {
> >> +							remote-endpoint = <&dpu_intf0_out>;
> >> +						};
> >> +					};
> >> +
> >> +					port@1 {
> >> +						reg = <1>;
> >> +
> >> +						mdss_dp0_out: endpoint {
> >> +							data-lanes = <3 2 0 1>;
> >> +						};
> >> +					};
> >> +				};
> >> +
> >> +				dp_opp_table: opp-table {
> >> +					compatible = "operating-points-v2";
> >> +
> >> +					opp-160000000 {
> >> +						opp-hz = /bits/ 64 <160000000>;
> >> +						required-opps = <&rpmhpd_opp_low_svs>;
> >> +					};
> >> +
> >> +					opp-270000000 {
> >> +						opp-hz = /bits/ 64 <270000000>;
> >> +						required-opps = <&rpmhpd_opp_svs>;
> >> +					};
> >> +
> >> +					opp-540000000 {
> >> +						opp-hz = /bits/ 64 <540000000>;
> >> +						required-opps = <&rpmhpd_opp_svs_l1>;
> >> +					};
> >> +				};
> >> +			};
> >> +
> >>  			mdss_dsi0: dsi@ae94000 {
> >>  				compatible = "qcom,sm6150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> >>  				reg = <0x0 0x0ae94000 0x0 0x400>;
> >> @@ -3844,8 +3929,8 @@ dispcc: clock-controller@af00000 {
> >>  				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> >>  				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
> >>  				 <0>,
> >> -				 <0>,
> >> -				 <0>;
> >> +				 <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
> >> +				 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;
> >>  
> >>  			#clock-cells = <1>;
> >>  			#reset-cells = <1>;
> >> @@ -4214,6 +4299,32 @@ usb_qmpphy: phy@88e6000 {
> >>  			status = "disabled";
> >>  		};
> >>  
> >> +		usb_qmpphy_2: phy@88e8000 {
> >> +			compatible = "qcom,qcs615-qmp-usb3-dp-phy";
> >> +			reg = <0x0 0x088e8000 0x0 0x2000>;
> >> +
> >> +			clocks = <&gcc GCC_USB2_SEC_PHY_AUX_CLK>,
> >> +				 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
> >> +				 <&gcc GCC_AHB2PHY_WEST_CLK>,
> >> +				 <&gcc GCC_USB2_SEC_PHY_PIPE_CLK>;
> >> +			clock-names = "aux",
> >> +				      "ref",
> >> +				      "cfg_ahb",
> >> +				      "pipe";
> >> +
> >> +			resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
> >> +				 <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
> >> +			reset-names = "phy_phy",
> >> +				      "dp_phy";
> >> +
> >> +			#clock-cells = <1>;
> >> +			#phy-cells = <1>;
> >> +
> >> +			qcom,tcsr-reg = <&tcsr 0xbff0 0xb24c>;
> >> +
> >> +			status = "disabled";
> >> +		};
> >> +
> >>  		usb_1: usb@a6f8800 {
> >>  			compatible = "qcom,qcs615-dwc3", "qcom,dwc3";
> >>  			reg = <0x0 0x0a6f8800 0x0 0x400>;
> >>
> >> -- 
> >> 2.34.1
> >>
> >>
