Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA08E64812A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 11:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511A810E51B;
	Fri,  9 Dec 2022 10:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFDC10E51A;
 Fri,  9 Dec 2022 10:52:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C0DC2CE292E;
 Fri,  9 Dec 2022 10:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C35C433D2;
 Fri,  9 Dec 2022 10:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670583152;
 bh=o9FfYOP4Nba34okMWYDXu//OQ/cniqD18C4Lv486QRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bOWW1rflKNE0DPBc807Nr5sPCK6BYhZ3AKzevIyF+8XjwE0cPAHgcSBAGn6/4ZAdo
 Xh9QbOuTggQp7nEgT8sKcdJnGgfIY7bdgUe/AcjHXCHU6AWhxLNpVJrgchbG7fK/Wp
 ubfQJK81PlZGbDwDrrL8MxYkQme5eumvZdLW3eg6cVg16SUWN1n8Q9HdK6WTpYJiqv
 F0IMBOJm1Ev9YDO2EW955WXtztWjnJDmUCRR2t+pGUEVpWEy2YreHzscmaBzE+Gil9
 f2RpQcrBZkbwVLGcrO4bNM/t5ik8A6ZprAw2s1I6CFxnTaaw7IEgbT9yXKCPc0c54g
 aRD1VzcCSOtlA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1p3azn-0003vN-AJ; Fri, 09 Dec 2022 11:52:48 +0100
Date: Fri, 9 Dec 2022 11:52:47 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sc8280xp: Define some of the
 display blocks
Message-ID: <Y5MTfzTENln1MqFt@hovoldconsulting.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-11-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207220012.16529-11-quic_bjorande@quicinc.com>
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
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 07, 2022 at 02:00:10PM -0800, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Define the display clock controllers, the MDSS instances, the DP phys
> and connect these together.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> Changes since v4:
> - None
> 
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 838 +++++++++++++++++++++++++
>  1 file changed, 838 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 9f3132ac2857..c2f186495506 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
 
> +		mdss0: display-subsystem@ae00000 {
> +			compatible = "qcom,sc8280xp-mdss";
> +			reg = <0 0x0ae00000 0 0x1000>;
> +			reg-names = "mdss";
> +
> +			power-domains = <&dispcc0 MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
> +				 <&dispcc0 DISP_CC_MDSS_MDP_CLK>;
> +			clock-names = "iface",
> +				      "ahb",
> +				      "core";
> +
> +			resets = <&dispcc0 DISP_CC_MDSS_CORE_BCR>;
> +
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +			iommus = <&apps_smmu 0x1000 0x402>;
> +
> +			status = "disabled";

Please move status last.

> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			mdss0_mdp: display-controller@ae01000 {

[...]

> +		mdss1: display-subsystem@22000000 {
> +			compatible = "qcom,sc8280xp-mdss";
> +			reg = <0 0x22000000 0 0x1000>;
> +			reg-names = "mdss";
> +
> +			power-domains = <&dispcc1 MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
> +				 <&dispcc1 DISP_CC_MDSS_MDP_CLK>;
> +			clock-names = "iface",
> +				      "ahb",
> +				      "core";
> +
> +			resets = <&dispcc1 DISP_CC_MDSS_CORE_BCR>;
> +
> +			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interconnects = <&mmss_noc MASTER_MDP_CORE1_0 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_MDP_CORE1_1 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +			iommus = <&apps_smmu 0x1800 0x402>;
> +
> +			status = "disabled";

Same here.

> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			mdss1_mdp: display-controller@22001000 {

Johan
