Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AAC74257C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 14:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0072810E13A;
	Thu, 29 Jun 2023 12:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E4710E13A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 12:14:14 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl
 [82.72.63.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 911C73ED7C;
 Thu, 29 Jun 2023 14:14:05 +0200 (CEST)
Date: Thu, 29 Jun 2023 14:14:04 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: sm6125: Add dispcc node
Message-ID: <kisifidg4bdb4v6fb6nvgt5omsprssd4bxrn6wqehjo66l2y4a@7nfaydtafzpn>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-13-03e430a2078c@somainline.org>
 <4a267feb-5855-1427-c378-b2615eae4f84@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a267feb-5855-1427-c378-b2615eae4f84@linaro.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-29 13:56:25, Dmitry Baryshkov wrote:
> On 27/06/2023 23:14, Marijn Suijten wrote:
> > Enable and configure the dispcc node on SM6125 for consumption by MDSS
> > later on.
> > 
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sm6125.dtsi | 25 +++++++++++++++++++++++++
> >   1 file changed, 25 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> > index edb03508dba3..a5cc0d43d2d9 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> > @@ -3,6 +3,7 @@
> >    * Copyright (c) 2021, Martin Botka <martin.botka@somainline.org>
> >    */
> >   
> > +#include <dt-bindings/clock/qcom,dispcc-sm6125.h>
> >   #include <dt-bindings/clock/qcom,gcc-sm6125.h>
> >   #include <dt-bindings/clock/qcom,rpmcc.h>
> >   #include <dt-bindings/dma/qcom-gpi.h>
> > @@ -1203,6 +1204,30 @@ sram@4690000 {
> >   			reg = <0x04690000 0x10000>;
> >   		};
> >   
> > +		dispcc: clock-controller@5f00000 {
> > +			compatible = "qcom,sm6125-dispcc";
> > +			reg = <0x05f00000 0x20000>;
> > +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <&gcc GCC_DISP_AHB_CLK>,
> > +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
> > +			clock-names = "bi_tcxo",
> > +				      "dsi0_phy_pll_out_byteclk",
> > +				      "dsi0_phy_pll_out_dsiclk",
> > +				      "dsi1_phy_pll_out_dsiclk",
> > +				      "dp_phy_pll_link_clk",
> > +				      "dp_phy_pll_vco_div_clk",
> > +				      "cfg_ahb_clk",
> > +				      "gcc_disp_gpll0_div_clk_src";
> > +			power-domains = <&rpmpd SM6125_VDDCX>;
> 
> Would it be logical to specify the required-opps too?

Perhaps, but barely any other SoC aside from sm8x50 sets it on dispcc.
What should it be, rpmhpd_opp_low_svs?  IIRC we used "svs" for the DSI
PHY despite not having a reference value downstream (it sets a range of
NOM-TURBO_NO_CPR, and RETENTION when it's off).

- Marijn

> 
> > +			#clock-cells = <1>;
> > +			#power-domain-cells = <1>;
> > +		};
> > +
> >   		apps_smmu: iommu@c600000 {
> >   			compatible = "qcom,sm6125-smmu-500", "qcom,smmu-500", "arm,mmu-500";
> >   			reg = <0x0c600000 0x80000>;
> > 
> 
> -- 
> With best wishes
> Dmitry
> 
