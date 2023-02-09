Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FAE68FDEE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 04:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA36F10E8F1;
	Thu,  9 Feb 2023 03:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185D910E1F0;
 Thu,  9 Feb 2023 03:26:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37B9CB81F18;
 Thu,  9 Feb 2023 03:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD21C433EF;
 Thu,  9 Feb 2023 03:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675913190;
 bh=5HiY3jWHqPZ1Bbw5dwuKPf/lQ5bc5AYMyeM3AiYk2j4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hEZBRdh1X3iltKZBnx1GPbQO5nn9f3FIVYYcbimh7NynbNPRWvWoflK9QYmooed+8
 jjKzTc0pF9fUPMy4S1b+4sb3yIJWZfhMscMgPa41uvPhQ3o+sbpKf8HpFZmq6wyIsU
 iRa4SAFYnk0jTEt4xS9uX0d3eiIN/nXYkaXMyIDrypB+UZV0hM5bJMYa5cWQlGZAyQ
 Fy/Duvo9F0jhkkvrjsYUpgepNhA13BErEEzuALl+GgwF9a5OXuZpVcmmCDxuQe0wK8
 Cfne0fkQ9ablKgu/RlBwtPg/A6/bp/3/Ags+yDtMTtgVAHROU5gKlyH+UPta0KP7xc
 hwAWfHOg1MnRA==
Date: Wed, 8 Feb 2023 19:28:41 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: sm8350: reorder device nodes
Message-ID: <20230209032841.ybqveepeyjqo63ql@ripper>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
 <20230206145707.122937-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206145707.122937-5-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 06, 2023 at 04:57:03PM +0200, Dmitry Baryshkov wrote:
> Start ordering DT nodes according to agreed order. Move apps SMMU, GIC,
> timer, apps RSC, cpufreq ADSP and cDSP nodes to the end to the proper
> position at the end of /soc/.
> 

I think "according to agreed order" means "sorted by address", but it
would be nice to have that expressed in the message. If nothing else for
others to know what such agreed order might be.


Unfortunately this doesn't apply to my tree, and it's not clear where it
failed. Could you please rebase this?

Thanks,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 1228 +++++++++++++-------------
>  1 file changed, 614 insertions(+), 614 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 0de42a333d32..061aa3fec1c4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1423,111 +1423,6 @@ spi13: spi@a94000 {
>  			};
>  		};
>  
> -		apps_smmu: iommu@15000000 {
> -			compatible = "qcom,sm8350-smmu-500", "arm,mmu-500";
> -			reg = <0 0x15000000 0 0x100000>;
> -			#iommu-cells = <2>;
> -			#global-interrupts = <2>;
> -			interrupts =    <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
> -					<GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
> -		};
> -
>  		config_noc: interconnect@1500000 {
>  			compatible = "qcom,sm8350-config-noc";
>  			reg = <0 0x01500000 0 0xa580>;
> @@ -2126,253 +2021,92 @@ rng: rng@10d3000 {
>  			clock-names = "core";
>  		};
>  
> -		intc: interrupt-controller@17a00000 {
> -			compatible = "arm,gic-v3";
> -			#interrupt-cells = <3>;
> -			interrupt-controller;
> -			#redistributor-regions = <1>;
> -			redistributor-stride = <0 0x20000>;
> -			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
> -			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
> -			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> -		};
> +		ufs_mem_hc: ufshc@1d84000 {
> +			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
> +				     "jedec,ufs-2.0";
> +			reg = <0 0x01d84000 0 0x3000>;
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +			phys = <&ufs_mem_phy_lanes>;
> +			phy-names = "ufsphy";
> +			lanes-per-direction = <2>;
> +			#reset-cells = <1>;
> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> +			reset-names = "rst";
>  
> -		timer@17c20000 {
> -			compatible = "arm,armv7-timer-mem";
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			ranges = <0 0 0 0x20000000>;
> -			reg = <0x0 0x17c20000 0x0 0x1000>;
> -			clock-frequency = <19200000>;
> +			power-domains = <&gcc UFS_PHY_GDSC>;
>  
> -			frame@17c21000 {
> -				frame-number = <0>;
> -				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> -					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x17c21000 0x1000>,
> -				      <0x17c22000 0x1000>;
> -			};
> +			iommus = <&apps_smmu 0xe0 0x0>;
>  
> -			frame@17c23000 {
> -				frame-number = <1>;
> -				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x17c23000 0x1000>;
> -				status = "disabled";
> -			};
> +			clock-names =
> +				"core_clk",
> +				"bus_aggr_clk",
> +				"iface_clk",
> +				"core_clk_unipro",
> +				"ref_clk",
> +				"tx_lane0_sync_clk",
> +				"rx_lane0_sync_clk",
> +				"rx_lane1_sync_clk";
> +			clocks =
> +				<&gcc GCC_UFS_PHY_AXI_CLK>,
> +				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +				<&gcc GCC_UFS_PHY_AHB_CLK>,
> +				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +				<&rpmhcc RPMH_CXO_CLK>,
> +				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> +				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> +			freq-table-hz =
> +				<75000000 300000000>,
> +				<0 0>,
> +				<0 0>,
> +				<75000000 300000000>,
> +				<0 0>,
> +				<0 0>,
> +				<0 0>,
> +				<0 0>;
> +			status = "disabled";
> +		};
>  
> -			frame@17c25000 {
> -				frame-number = <2>;
> -				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x17c25000 0x1000>;
> -				status = "disabled";
> -			};
> +		ufs_mem_phy: phy@1d87000 {
> +			compatible = "qcom,sm8350-qmp-ufs-phy";
> +			reg = <0 0x01d87000 0 0x1c4>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			clock-names = "ref",
> +				      "ref_aux";
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
>  
> -			frame@17c27000 {
> -				frame-number = <3>;
> -				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x17c27000 0x1000>;
> -				status = "disabled";
> -			};
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";
> +			status = "disabled";
>  
> -			frame@17c29000 {
> -				frame-number = <4>;
> -				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x17c29000 0x1000>;
> -				status = "disabled";
> +			ufs_mem_phy_lanes: phy@1d87400 {
> +				reg = <0 0x01d87400 0 0x188>,
> +				      <0 0x01d87600 0 0x200>,
> +				      <0 0x01d87c00 0 0x200>,
> +				      <0 0x01d87800 0 0x188>,
> +				      <0 0x01d87a00 0 0x200>;
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
>  			};
> +		};
>  
> -			frame@17c2b000 {
> -				frame-number = <5>;
> -				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x17c2b000 0x1000>;
> -				status = "disabled";
> -			};
> +		slpi: remoteproc@5c00000 {
> +			compatible = "qcom,sm8350-slpi-pas";
> +			reg = <0 0x05c00000 0 0x4000>;
>  
> -			frame@17c2d000 {
> -				frame-number = <6>;
> -				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x17c2d000 0x1000>;
> -				status = "disabled";
> -			};
> -		};
> +			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
>  
> -		apps_rsc: rsc@18200000 {
> -			label = "apps_rsc";
> -			compatible = "qcom,rpmh-rsc";
> -			reg = <0x0 0x18200000 0x0 0x10000>,
> -				<0x0 0x18210000 0x0 0x10000>,
> -				<0x0 0x18220000 0x0 0x10000>;
> -			reg-names = "drv-0", "drv-1", "drv-2";
> -			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> -			qcom,tcs-offset = <0xd00>;
> -			qcom,drv-id = <2>;
> -			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
> -					  <WAKE_TCS    3>, <CONTROL_TCS 0>;
> -			power-domains = <&CLUSTER_PD>;
> -
> -			rpmhcc: clock-controller {
> -				compatible = "qcom,sm8350-rpmh-clk";
> -				#clock-cells = <1>;
> -				clock-names = "xo";
> -				clocks = <&xo_board>;
> -			};
> -
> -			rpmhpd: power-controller {
> -				compatible = "qcom,sm8350-rpmhpd";
> -				#power-domain-cells = <1>;
> -				operating-points-v2 = <&rpmhpd_opp_table>;
> -
> -				rpmhpd_opp_table: opp-table {
> -					compatible = "operating-points-v2";
> -
> -					rpmhpd_opp_ret: opp1 {
> -						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> -					};
> -
> -					rpmhpd_opp_min_svs: opp2 {
> -						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> -					};
> -
> -					rpmhpd_opp_low_svs: opp3 {
> -						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> -					};
> -
> -					rpmhpd_opp_svs: opp4 {
> -						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> -					};
> -
> -					rpmhpd_opp_svs_l1: opp5 {
> -						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> -					};
> -
> -					rpmhpd_opp_nom: opp6 {
> -						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> -					};
> -
> -					rpmhpd_opp_nom_l1: opp7 {
> -						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> -					};
> -
> -					rpmhpd_opp_nom_l2: opp8 {
> -						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
> -					};
> -
> -					rpmhpd_opp_turbo: opp9 {
> -						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> -					};
> -
> -					rpmhpd_opp_turbo_l1: opp10 {
> -						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> -					};
> -				};
> -			};
> -
> -			apps_bcm_voter: bcm-voter {
> -				compatible = "qcom,bcm-voter";
> -			};
> -		};
> -
> -		cpufreq_hw: cpufreq@18591000 {
> -			compatible = "qcom,sm8350-cpufreq-epss", "qcom,cpufreq-epss";
> -			reg = <0 0x18591000 0 0x1000>,
> -			      <0 0x18592000 0 0x1000>,
> -			      <0 0x18593000 0 0x1000>;
> -			reg-names = "freq-domain0", "freq-domain1", "freq-domain2";
> -
> -			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
> -			clock-names = "xo", "alternate";
> -
> -			#freq-domain-cells = <1>;
> -		};
> -
> -		ufs_mem_hc: ufshc@1d84000 {
> -			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
> -				     "jedec,ufs-2.0";
> -			reg = <0 0x01d84000 0 0x3000>;
> -			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> -			phys = <&ufs_mem_phy_lanes>;
> -			phy-names = "ufsphy";
> -			lanes-per-direction = <2>;
> -			#reset-cells = <1>;
> -			resets = <&gcc GCC_UFS_PHY_BCR>;
> -			reset-names = "rst";
> -
> -			power-domains = <&gcc UFS_PHY_GDSC>;
> -
> -			iommus = <&apps_smmu 0xe0 0x0>;
> -
> -			clock-names =
> -				"core_clk",
> -				"bus_aggr_clk",
> -				"iface_clk",
> -				"core_clk_unipro",
> -				"ref_clk",
> -				"tx_lane0_sync_clk",
> -				"rx_lane0_sync_clk",
> -				"rx_lane1_sync_clk";
> -			clocks =
> -				<&gcc GCC_UFS_PHY_AXI_CLK>,
> -				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> -				<&gcc GCC_UFS_PHY_AHB_CLK>,
> -				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> -				<&rpmhcc RPMH_CXO_CLK>,
> -				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> -				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> -				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> -			freq-table-hz =
> -				<75000000 300000000>,
> -				<0 0>,
> -				<0 0>,
> -				<75000000 300000000>,
> -				<0 0>,
> -				<0 0>,
> -				<0 0>,
> -				<0 0>;
> -			status = "disabled";
> -		};
> -
> -		ufs_mem_phy: phy@1d87000 {
> -			compatible = "qcom,sm8350-qmp-ufs-phy";
> -			reg = <0 0x01d87000 0 0x1c4>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> -			clock-names = "ref",
> -				      "ref_aux";
> -			clocks = <&rpmhcc RPMH_CXO_CLK>,
> -				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> -
> -			resets = <&ufs_mem_hc 0>;
> -			reset-names = "ufsphy";
> -			status = "disabled";
> -
> -			ufs_mem_phy_lanes: phy@1d87400 {
> -				reg = <0 0x01d87400 0 0x188>,
> -				      <0 0x01d87600 0 0x200>,
> -				      <0 0x01d87c00 0 0x200>,
> -				      <0 0x01d87800 0 0x188>,
> -				      <0 0x01d87a00 0 0x200>;
> -				#clock-cells = <1>;
> -				#phy-cells = <0>;
> -			};
> -		};
> -
> -		slpi: remoteproc@5c00000 {
> -			compatible = "qcom,sm8350-slpi-pas";
> -			reg = <0 0x05c00000 0 0x4000>;
> -
> -			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
> -					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
> -			interrupt-names = "wdog", "fatal", "ready",
> -					  "handover", "stop-ack";
> -
> -			clocks = <&rpmhcc RPMH_CXO_CLK>;
> -			clock-names = "xo";
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
>  
>  			power-domains = <&rpmhpd SM8350_LCX>,
>  					<&rpmhpd SM8350_LMX>;
> @@ -2427,176 +2161,67 @@ compute-cb@3 {
>  			};
>  		};
>  
> -		cdsp: remoteproc@98900000 {
> -			compatible = "qcom,sm8350-cdsp-pas";
> -			reg = <0 0x98900000 0 0x1400000>;
> -
> -			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
> -					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
> -			interrupt-names = "wdog", "fatal", "ready",
> -					  "handover", "stop-ack";
> +		sdhc_2: mmc@8804000 {
> +			compatible = "qcom,sm8350-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0 0x08804000 0 0x1000>;
>  
> -			clocks = <&rpmhcc RPMH_CXO_CLK>;
> -			clock-names = "xo";
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
>  
> -			power-domains = <&rpmhpd SM8350_CX>,
> -					<&rpmhpd SM8350_MXC>;
> -			power-domain-names = "cx", "mxc";
> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&gcc GCC_SDCC2_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface", "core", "xo";
> +			resets = <&gcc GCC_SDCC2_BCR>;
> +			interconnects = <&aggre2_noc MASTER_SDCC_2 &mc_virt SLAVE_EBI1>,
> +					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_SDCC_2>;
> +			interconnect-names = "sdhc-ddr","cpu-sdhc";
> +			iommus = <&apps_smmu 0x4a0 0x0>;
> +			power-domains = <&rpmhpd SM8350_CX>;
> +			operating-points-v2 = <&sdhc2_opp_table>;
> +			bus-width = <4>;
> +			dma-coherent;
>  
> -			interconnects = <&compute_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
> +			status = "disabled";
>  
> -			memory-region = <&pil_cdsp_mem>;
> +			sdhc2_opp_table: opp-table {
> +				compatible = "operating-points-v2";
>  
> -			qcom,qmp = <&aoss_qmp>;
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
>  
> -			qcom,smem-states = <&smp2p_cdsp_out 0>;
> -			qcom,smem-state-names = "stop";
> +				opp-202000000 {
> +					opp-hz = /bits/ 64 <202000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +			};
> +		};
>  
> +		usb_1_hsphy: phy@88e3000 {
> +			compatible = "qcom,sm8350-usb-hs-phy",
> +				     "qcom,usb-snps-hs-7nm-phy";
> +			reg = <0 0x088e3000 0 0x400>;
>  			status = "disabled";
> +			#phy-cells = <0>;
>  
> -			glink-edge {
> -				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
> -							     IPCC_MPROC_SIGNAL_GLINK_QMP
> -							     IRQ_TYPE_EDGE_RISING>;
> -				mboxes = <&ipcc IPCC_CLIENT_CDSP
> -						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "ref";
>  
> -				label = "cdsp";
> -				qcom,remote-pid = <5>;
> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +		};
>  
> -				fastrpc {
> -					compatible = "qcom,fastrpc";
> -					qcom,glink-channels = "fastrpcglink-apps-dsp";
> -					label = "cdsp";
> -					qcom,non-secure-domain;
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> +		usb_2_hsphy: phy@88e4000 {
> +			compatible = "qcom,sm8250-usb-hs-phy",
> +				     "qcom,usb-snps-hs-7nm-phy";
> +			reg = <0 0x088e4000 0 0x400>;
> +			status = "disabled";
> +			#phy-cells = <0>;
>  
> -					compute-cb@1 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <1>;
> -						iommus = <&apps_smmu 0x2161 0x0400>,
> -							 <&apps_smmu 0x1181 0x0420>;
> -					};
> -
> -					compute-cb@2 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <2>;
> -						iommus = <&apps_smmu 0x2162 0x0400>,
> -							 <&apps_smmu 0x1182 0x0420>;
> -					};
> -
> -					compute-cb@3 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <3>;
> -						iommus = <&apps_smmu 0x2163 0x0400>,
> -							 <&apps_smmu 0x1183 0x0420>;
> -					};
> -
> -					compute-cb@4 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <4>;
> -						iommus = <&apps_smmu 0x2164 0x0400>,
> -							 <&apps_smmu 0x1184 0x0420>;
> -					};
> -
> -					compute-cb@5 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <5>;
> -						iommus = <&apps_smmu 0x2165 0x0400>,
> -							 <&apps_smmu 0x1185 0x0420>;
> -					};
> -
> -					compute-cb@6 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <6>;
> -						iommus = <&apps_smmu 0x2166 0x0400>,
> -							 <&apps_smmu 0x1186 0x0420>;
> -					};
> -
> -					compute-cb@7 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <7>;
> -						iommus = <&apps_smmu 0x2167 0x0400>,
> -							 <&apps_smmu 0x1187 0x0420>;
> -					};
> -
> -					compute-cb@8 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <8>;
> -						iommus = <&apps_smmu 0x2168 0x0400>,
> -							 <&apps_smmu 0x1188 0x0420>;
> -					};
> -
> -					/* note: secure cb9 in downstream */
> -				};
> -			};
> -		};
> -
> -		sdhc_2: mmc@8804000 {
> -			compatible = "qcom,sm8350-sdhci", "qcom,sdhci-msm-v5";
> -			reg = <0 0x08804000 0 0x1000>;
> -
> -			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "hc_irq", "pwr_irq";
> -
> -			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> -				 <&gcc GCC_SDCC2_APPS_CLK>,
> -				 <&rpmhcc RPMH_CXO_CLK>;
> -			clock-names = "iface", "core", "xo";
> -			resets = <&gcc GCC_SDCC2_BCR>;
> -			interconnects = <&aggre2_noc MASTER_SDCC_2 &mc_virt SLAVE_EBI1>,
> -					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_SDCC_2>;
> -			interconnect-names = "sdhc-ddr","cpu-sdhc";
> -			iommus = <&apps_smmu 0x4a0 0x0>;
> -			power-domains = <&rpmhpd SM8350_CX>;
> -			operating-points-v2 = <&sdhc2_opp_table>;
> -			bus-width = <4>;
> -			dma-coherent;
> -
> -			status = "disabled";
> -
> -			sdhc2_opp_table: opp-table {
> -				compatible = "operating-points-v2";
> -
> -				opp-100000000 {
> -					opp-hz = /bits/ 64 <100000000>;
> -					required-opps = <&rpmhpd_opp_low_svs>;
> -				};
> -
> -				opp-202000000 {
> -					opp-hz = /bits/ 64 <202000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
> -				};
> -			};
> -		};
> -
> -		usb_1_hsphy: phy@88e3000 {
> -			compatible = "qcom,sm8350-usb-hs-phy",
> -				     "qcom,usb-snps-hs-7nm-phy";
> -			reg = <0 0x088e3000 0 0x400>;
> -			status = "disabled";
> -			#phy-cells = <0>;
> -
> -			clocks = <&rpmhcc RPMH_CXO_CLK>;
> -			clock-names = "ref";
> -
> -			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> -		};
> -
> -		usb_2_hsphy: phy@88e4000 {
> -			compatible = "qcom,sm8250-usb-hs-phy",
> -				     "qcom,usb-snps-hs-7nm-phy";
> -			reg = <0 0x088e4000 0 0x400>;
> -			status = "disabled";
> -			#phy-cells = <0>;
> -
> -			clocks = <&rpmhcc RPMH_CXO_CLK>;
> -			clock-names = "ref";
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "ref";
>  
>  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
>  		};
> @@ -2987,190 +2612,565 @@ mdss_dsi0_phy: phy@ae94400 {
>  				status = "disabled";
>  			};
>  
> -			mdss_dsi1: dsi@ae96000 {
> -				compatible = "qcom,mdss-dsi-ctrl";
> -				reg = <0 0x0ae96000 0 0x400>;
> -				reg-names = "dsi_ctrl";
> +			mdss_dsi1: dsi@ae96000 {
> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0 0x0ae96000 0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <5>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> +				assigned-clock-parents = <&mdss_dsi1_phy 0>,
> +							 <&mdss_dsi1_phy 1>;
> +
> +				operating-points-v2 = <&dsi1_opp_table>;
> +				power-domains = <&rpmhpd SM8350_MMCX>;
> +
> +				phys = <&mdss_dsi1_phy>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +
> +				dsi1_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					/* TODO: opp-187500000 should work with
> +					 * &rpmhpd_opp_low_svs, but one some of
> +					 * sm8350_hdk boards reboot using this
> +					 * opp.
> +					 */
> +					opp-187500000 {
> +						opp-hz = /bits/ 64 <187500000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-300000000 {
> +						opp-hz = /bits/ 64 <300000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dsi1_in: endpoint {
> +							remote-endpoint = <&dpu_intf2_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dsi1_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			mdss_dsi1_phy: phy@ae96400 {
> +				compatible = "qcom,sm8350-dsi-phy-5nm";
> +				reg = <0 0x0ae96400 0 0x200>,
> +				      <0 0x0ae96600 0 0x280>,
> +				      <0 0x0ae96900 0 0x27c>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +		};
> +
> +		dispcc: clock-controller@af00000 {
> +			compatible = "qcom,sm8350-dispcc";
> +			reg = <0 0x0af00000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
> +				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
> +				 <0>,
> +				 <0>;
> +			clock-names = "bi_tcxo",
> +				      "dsi0_phy_pll_out_byteclk",
> +				      "dsi0_phy_pll_out_dsiclk",
> +				      "dsi1_phy_pll_out_byteclk",
> +				      "dsi1_phy_pll_out_dsiclk",
> +				      "dp_phy_pll_link_clk",
> +				      "dp_phy_pll_vco_div_clk";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +
> +			power-domains = <&rpmhpd SM8350_MMCX>;
> +		};
> +
> +		apps_smmu: iommu@15000000 {
> +			compatible = "qcom,sm8350-smmu-500", "arm,mmu-500";
> +			reg = <0 0x15000000 0 0x100000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <2>;
> +			interrupts =    <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		adsp: remoteproc@17300000 {
> +			compatible = "qcom,sm8350-adsp-pas";
> +			reg = <0 0x17300000 0 0x100>;
> +
> +			interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd SM8350_LCX>,
> +					<&rpmhpd SM8350_LMX>;
> +			power-domain-names = "lcx", "lmx";
> +
> +			memory-region = <&pil_adsp_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_adsp_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_LPASS
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "lpass";
> +				qcom,remote-pid = <2>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					qcom,non-secure-domain;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x1803 0x0>;
> +					};
> +
> +					compute-cb@4 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <4>;
> +						iommus = <&apps_smmu 0x1804 0x0>;
> +					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu 0x1805 0x0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		intc: interrupt-controller@17a00000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			#redistributor-regions = <1>;
> +			redistributor-stride = <0 0x20000>;
> +			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
> +			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		timer@17c20000 {
> +			compatible = "arm,armv7-timer-mem";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0 0 0x20000000>;
> +			reg = <0x0 0x17c20000 0x0 0x1000>;
> +			clock-frequency = <19200000>;
> +
> +			frame@17c21000 {
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17c21000 0x1000>,
> +				      <0x17c22000 0x1000>;
> +			};
> +
> +			frame@17c23000 {
> +				frame-number = <1>;
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17c23000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c25000 {
> +				frame-number = <2>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17c25000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c27000 {
> +				frame-number = <3>;
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17c27000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c29000 {
> +				frame-number = <4>;
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17c29000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c2b000 {
> +				frame-number = <5>;
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17c2b000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c2d000 {
> +				frame-number = <6>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17c2d000 0x1000>;
> +				status = "disabled";
> +			};
> +		};
>  
> -				interrupt-parent = <&mdss>;
> -				interrupts = <5>;
> +		apps_rsc: rsc@18200000 {
> +			label = "apps_rsc";
> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0x0 0x18200000 0x0 0x10000>,
> +				<0x0 0x18210000 0x0 0x10000>,
> +				<0x0 0x18220000 0x0 0x10000>;
> +			reg-names = "drv-0", "drv-1", "drv-2";
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,tcs-offset = <0xd00>;
> +			qcom,drv-id = <2>;
> +			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
> +					  <WAKE_TCS    3>, <CONTROL_TCS 0>;
> +			power-domains = <&CLUSTER_PD>;
>  
> -				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
> -					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
> -					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
> -					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -					 <&gcc GCC_DISP_HF_AXI_CLK>;
> -				clock-names = "byte",
> -					      "byte_intf",
> -					      "pixel",
> -					      "core",
> -					      "iface",
> -					      "bus";
> +			rpmhcc: clock-controller {
> +				compatible = "qcom,sm8350-rpmh-clk";
> +				#clock-cells = <1>;
> +				clock-names = "xo";
> +				clocks = <&xo_board>;
> +			};
>  
> -				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> -				assigned-clock-parents = <&mdss_dsi1_phy 0>,
> -							 <&mdss_dsi1_phy 1>;
> +			rpmhpd: power-controller {
> +				compatible = "qcom,sm8350-rpmhpd";
> +				#power-domain-cells = <1>;
> +				operating-points-v2 = <&rpmhpd_opp_table>;
>  
> -				operating-points-v2 = <&dsi1_opp_table>;
> -				power-domains = <&rpmhpd SM8350_MMCX>;
> +				rpmhpd_opp_table: opp-table {
> +					compatible = "operating-points-v2";
>  
> -				phys = <&mdss_dsi1_phy>;
> +					rpmhpd_opp_ret: opp1 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> +					};
>  
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> +					rpmhpd_opp_min_svs: opp2 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +					};
>  
> -				status = "disabled";
> +					rpmhpd_opp_low_svs: opp3 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					};
>  
> -				dsi1_opp_table: opp-table {
> -					compatible = "operating-points-v2";
> +					rpmhpd_opp_svs: opp4 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					};
>  
> -					/* TODO: opp-187500000 should work with
> -					 * &rpmhpd_opp_low_svs, but one some of
> -					 * sm8350_hdk boards reboot using this
> -					 * opp.
> -					 */
> -					opp-187500000 {
> -						opp-hz = /bits/ 64 <187500000>;
> -						required-opps = <&rpmhpd_opp_svs>;
> +					rpmhpd_opp_svs_l1: opp5 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>  					};
>  
> -					opp-300000000 {
> -						opp-hz = /bits/ 64 <300000000>;
> -						required-opps = <&rpmhpd_opp_svs>;
> +					rpmhpd_opp_nom: opp6 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
>  					};
>  
> -					opp-358000000 {
> -						opp-hz = /bits/ 64 <358000000>;
> -						required-opps = <&rpmhpd_opp_svs_l1>;
> +					rpmhpd_opp_nom_l1: opp7 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
>  					};
> -				};
>  
> -				ports {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> +					rpmhpd_opp_nom_l2: opp8 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
> +					};
>  
> -					port@0 {
> -						reg = <0>;
> -						mdss_dsi1_in: endpoint {
> -							remote-endpoint = <&dpu_intf2_out>;
> -						};
> +					rpmhpd_opp_turbo: opp9 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
>  					};
>  
> -					port@1 {
> -						reg = <1>;
> -						mdss_dsi1_out: endpoint {
> -						};
> +					rpmhpd_opp_turbo_l1: opp10 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
>  					};
>  				};
>  			};
>  
> -			mdss_dsi1_phy: phy@ae96400 {
> -				compatible = "qcom,sm8350-dsi-phy-5nm";
> -				reg = <0 0x0ae96400 0 0x200>,
> -				      <0 0x0ae96600 0 0x280>,
> -				      <0 0x0ae96900 0 0x27c>;
> -				reg-names = "dsi_phy",
> -					    "dsi_phy_lane",
> -					    "dsi_pll";
> -
> -				#clock-cells = <1>;
> -				#phy-cells = <0>;
> -
> -				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -					 <&rpmhcc RPMH_CXO_CLK>;
> -				clock-names = "iface", "ref";
> -
> -				status = "disabled";
> +			apps_bcm_voter: bcm-voter {
> +				compatible = "qcom,bcm-voter";
>  			};
>  		};
>  
> -		dispcc: clock-controller@af00000 {
> -			compatible = "qcom,sm8350-dispcc";
> -			reg = <0 0x0af00000 0 0x10000>;
> -			clocks = <&rpmhcc RPMH_CXO_CLK>,
> -				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
> -				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
> -				 <0>,
> -				 <0>;
> -			clock-names = "bi_tcxo",
> -				      "dsi0_phy_pll_out_byteclk",
> -				      "dsi0_phy_pll_out_dsiclk",
> -				      "dsi1_phy_pll_out_byteclk",
> -				      "dsi1_phy_pll_out_dsiclk",
> -				      "dp_phy_pll_link_clk",
> -				      "dp_phy_pll_vco_div_clk";
> -			#clock-cells = <1>;
> -			#reset-cells = <1>;
> -			#power-domain-cells = <1>;
> +		cpufreq_hw: cpufreq@18591000 {
> +			compatible = "qcom,sm8350-cpufreq-epss", "qcom,cpufreq-epss";
> +			reg = <0 0x18591000 0 0x1000>,
> +			      <0 0x18592000 0 0x1000>,
> +			      <0 0x18593000 0 0x1000>;
> +			reg-names = "freq-domain0", "freq-domain1", "freq-domain2";
>  
> -			power-domains = <&rpmhpd SM8350_MMCX>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
> +			clock-names = "xo", "alternate";
> +
> +			#freq-domain-cells = <1>;
>  		};
>  
> -		adsp: remoteproc@17300000 {
> -			compatible = "qcom,sm8350-adsp-pas";
> -			reg = <0 0x17300000 0 0x100>;
> +		cdsp: remoteproc@98900000 {
> +			compatible = "qcom,sm8350-cdsp-pas";
> +			reg = <0 0x98900000 0 0x1400000>;
>  
> -			interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
> -					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
>  			interrupt-names = "wdog", "fatal", "ready",
>  					  "handover", "stop-ack";
>  
>  			clocks = <&rpmhcc RPMH_CXO_CLK>;
>  			clock-names = "xo";
>  
> -			power-domains = <&rpmhpd SM8350_LCX>,
> -					<&rpmhpd SM8350_LMX>;
> -			power-domain-names = "lcx", "lmx";
> +			power-domains = <&rpmhpd SM8350_CX>,
> +					<&rpmhpd SM8350_MXC>;
> +			power-domain-names = "cx", "mxc";
>  
> -			memory-region = <&pil_adsp_mem>;
> +			interconnects = <&compute_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
> +
> +			memory-region = <&pil_cdsp_mem>;
>  
>  			qcom,qmp = <&aoss_qmp>;
>  
> -			qcom,smem-states = <&smp2p_adsp_out 0>;
> +			qcom,smem-states = <&smp2p_cdsp_out 0>;
>  			qcom,smem-state-names = "stop";
>  
>  			status = "disabled";
>  
>  			glink-edge {
> -				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
> +				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> -				mboxes = <&ipcc IPCC_CLIENT_LPASS
> +				mboxes = <&ipcc IPCC_CLIENT_CDSP
>  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
>  
> -				label = "lpass";
> -				qcom,remote-pid = <2>;
> +				label = "cdsp";
> +				qcom,remote-pid = <5>;
>  
>  				fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
> -					label = "adsp";
> +					label = "cdsp";
>  					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +						iommus = <&apps_smmu 0x2161 0x0400>,
> +							 <&apps_smmu 0x1181 0x0420>;
> +					};
> +
> +					compute-cb@2 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <2>;
> +						iommus = <&apps_smmu 0x2162 0x0400>,
> +							 <&apps_smmu 0x1182 0x0420>;
> +					};
> +
>  					compute-cb@3 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <3>;
> -						iommus = <&apps_smmu 0x1803 0x0>;
> +						iommus = <&apps_smmu 0x2163 0x0400>,
> +							 <&apps_smmu 0x1183 0x0420>;
>  					};
>  
>  					compute-cb@4 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <4>;
> -						iommus = <&apps_smmu 0x1804 0x0>;
> +						iommus = <&apps_smmu 0x2164 0x0400>,
> +							 <&apps_smmu 0x1184 0x0420>;
>  					};
>  
>  					compute-cb@5 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <5>;
> -						iommus = <&apps_smmu 0x1805 0x0>;
> +						iommus = <&apps_smmu 0x2165 0x0400>,
> +							 <&apps_smmu 0x1185 0x0420>;
> +					};
> +
> +					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x2166 0x0400>,
> +							 <&apps_smmu 0x1186 0x0420>;
>  					};
> +
> +					compute-cb@7 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <7>;
> +						iommus = <&apps_smmu 0x2167 0x0400>,
> +							 <&apps_smmu 0x1187 0x0420>;
> +					};
> +
> +					compute-cb@8 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <8>;
> +						iommus = <&apps_smmu 0x2168 0x0400>,
> +							 <&apps_smmu 0x1188 0x0420>;
> +					};
> +
> +					/* note: secure cb9 in downstream */
>  				};
>  			};
>  		};
> -- 
> 2.39.1
> 
