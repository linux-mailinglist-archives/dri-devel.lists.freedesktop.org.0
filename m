Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B67691DA4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 12:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA6010ECE7;
	Fri, 10 Feb 2023 11:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66F610ECE5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 11:09:07 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ml19so15029339ejb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 03:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RCNLlZNbq0af8em4NGdiPJLnjWJLq3RloIQVA1vNkuU=;
 b=XGFH2mPS9zSjWAMEJCNcR1G4jikKVaTlc/ALFCHB/t2yK5daA1syqkT73o4M4Yi7aa
 EWp7V7TKW4DU9C4EafPZsjC2y1T4Yu2X7s277uLdAjsmKnWvElZEXgmeBp/Av9JePFE4
 JHQvGJTwf6Lpehb2A5V1bH8eY0nZInEygCxwmPxgJMVv83GnO1RtPTZBV9Da55L5dckU
 mpRfmWf00T14NT0eUU7S6FhmS6zRRNj9x/xRWf3jmhN04sWvlzv/djv3XQ/aCpY9PYGL
 pDAUGm2C8YceB0QYe1j7VSx8jO5zCCE6rMgRAG1OcI1BEEz6N4oY9TuMb1b1+V/goruX
 iFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RCNLlZNbq0af8em4NGdiPJLnjWJLq3RloIQVA1vNkuU=;
 b=JyTUyrAud2sD06AM+pFGzkaSip5pV8U3bnZkmJTlNgLLY+8LEUqxBmHILhWkgGES0Y
 lwrtsJ3sP0RXi9E3+8xSDAfd1jvKc828LXZiH4Z59yfUb9nywceDU6ZM1WBve9h7Xlyn
 8SZxGCUudRYNNEokmVWvKwbndfsjATEWpQm++D/QEC5IzneSiFgdkHmZ1cLzZE26820t
 c/pvOdd85C9B+bUFsE7GPRf898sgvj/wpCG0d3nobGSAYwHGOZDtqp2zgRkjO0fiWjoi
 gsZanNLADcH7N5FjgqCSPgMgdDLTLuKIQbMaS0Tun1y+185t4b9O/MJTiYdmmynu4J27
 lSFw==
X-Gm-Message-State: AO0yUKXq9tyCVJubvvk5YdAkD3ikZYsYHuI2UUAXVwps5+Ffm04YYFhz
 M30hQDyzANz3GmAqIt2UqpRN8w==
X-Google-Smtp-Source: AK7set+ENOFkTBIOQyxihdzqybS5kJnd7Jqms4otHG4vgA6p2gUTXZycXHM9ad0gQvDwpBPIbd+7DQ==
X-Received: by 2002:a17:906:46d3:b0:88d:ba89:183f with SMTP id
 k19-20020a17090646d300b0088dba89183fmr9165774ejs.16.1676027346249; 
 Fri, 10 Feb 2023 03:09:06 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 fi9-20020a170906da0900b0084c6ec69a9dsm2210093ejb.124.2023.02.10.03.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 03:09:05 -0800 (PST)
Message-ID: <a8bb4bf1-c4b6-ff02-d2e6-1407900bb006@linaro.org>
Date: Fri, 10 Feb 2023 12:09:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: sm8350: finish reordering nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
 <20230209133839.762631-5-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230209133839.762631-5-dmitry.baryshkov@linaro.org>
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
> Finish reordering DT nodes by their address. Move PDC, tsens, AOSS,
> SRAM, SPMI and TLMM nodes to the proper position.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
[...]

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
It's not a part of this patch, but an idea came into my
head.. could you check with socid that your HDK has an
8350v2.1?

As for the patch itself.. I *think* I don't see anything
wrong..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

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
> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,sm8350-pdc", "qcom,pdc";
> +			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
> +			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,   <55 306 4>,
> +					  <59 312 3>, <62 374 2>,  <64 434 2>,   <66 438 3>,
> +					  <69 86 1>,  <70 520 54>, <124 609 31>, <155 63 1>,
> +					  <156 716 12>;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&intc>;
> +			interrupt-controller;
> +		};
> +
> +		tsens0: thermal-sensor@c263000 {
> +			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c263000 0 0x1ff>, /* TM */
> +			      <0 0x0c222000 0 0x8>; /* SROT */
> +			#qcom,sensors = <15>;
> +			interrupts-extended = <&pdc 26 IRQ_TYPE_LEVEL_HIGH>,
> +				     <&pdc 28 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		tsens1: thermal-sensor@c265000 {
> +			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c265000 0 0x1ff>, /* TM */
> +			      <0 0x0c223000 0 0x8>; /* SROT */
> +			#qcom,sensors = <14>;
> +			interrupts-extended = <&pdc 27 IRQ_TYPE_LEVEL_HIGH>,
> +				     <&pdc 29 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		aoss_qmp: power-management@c300000 {
> +			compatible = "qcom,sm8350-aoss-qmp", "qcom,aoss-qmp";
> +			reg = <0 0x0c300000 0 0x400>;
> +			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
> +						     IRQ_TYPE_EDGE_RISING>;
> +			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +			#clock-cells = <0>;
> +		};
> +
> +		sram@c3f0000 {
> +			compatible = "qcom,rpmh-stats";
> +			reg = <0 0x0c3f0000 0 0x400>;
> +		};
> +
> +		spmi_bus: spmi@c440000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0x0 0x0c440000 0x0 0x1100>,
> +			      <0x0 0x0c600000 0x0 0x2000000>,
> +			      <0x0 0x0e600000 0x0 0x100000>,
> +			      <0x0 0x0e700000 0x0 0xa0000>,
> +			      <0x0 0x0c40a000 0x0 0x26000>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> +			interrupt-names = "periph_irq";
> +			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,ee = <0>;
> +			qcom,channel = <0>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +		};
> +
> +		tlmm: pinctrl@f100000 {
> +			compatible = "qcom,sm8350-tlmm";
> +			reg = <0 0x0f100000 0 0x300000>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 204>;
> +			wakeup-parent = <&pdc>;
> +
> +			sdc2_default_state: sdc2-default-state {
> +				clk-pins {
> +					pins = "sdc2_clk";
> +					drive-strength = <16>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc2_cmd";
> +					drive-strength = <16>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc2_data";
> +					drive-strength = <16>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			sdc2_sleep_state: sdc2-sleep-state {
> +				clk-pins {
> +					pins = "sdc2_clk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
>  
> -				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -					 <&rpmhcc RPMH_CXO_CLK>;
> -				clock-names = "iface", "ref";
> +				cmd-pins {
> +					pins = "sdc2_cmd";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
>  
> -				status = "disabled";
> +				data-pins {
> +					pins = "sdc2_data";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
>  			};
>  
> -			mdss_dsi1: dsi@ae96000 {
> -				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> -				reg = <0 0x0ae96000 0 0x400>;
> -				reg-names = "dsi_ctrl";
> +			qup_uart3_default_state: qup-uart3-default-state {
> +				rx-pins {
> +					pins = "gpio18";
> +					function = "qup3";
> +				};
> +				tx-pins {
> +					pins = "gpio19";
> +					function = "qup3";
> +				};
> +			};
>  
> -				interrupt-parent = <&mdss>;
> -				interrupts = <5>;
> +			qup_uart6_default: qup-uart6-default-state {
> +				pins = "gpio30", "gpio31";
> +				function = "qup6";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
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
> +			qup_uart18_default: qup-uart18-default-state {
> +				pins = "gpio58", "gpio59";
> +				function = "qup18";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
>  
> -				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> -				assigned-clock-parents = <&mdss_dsi1_phy 0>,
> -							 <&mdss_dsi1_phy 1>;
> +			qup_i2c0_default: qup-i2c0-default-state {
> +				pins = "gpio4", "gpio5";
> +				function = "qup0";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  
> -				operating-points-v2 = <&dsi1_opp_table>;
> -				power-domains = <&rpmhpd SM8350_MMCX>;
> +			qup_i2c1_default: qup-i2c1-default-state {
> +				pins = "gpio8", "gpio9";
> +				function = "qup1";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  
> -				phys = <&mdss_dsi1_phy>;
> +			qup_i2c2_default: qup-i2c2-default-state {
> +				pins = "gpio12", "gpio13";
> +				function = "qup2";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> +			qup_i2c4_default: qup-i2c4-default-state {
> +				pins = "gpio20", "gpio21";
> +				function = "qup4";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  
> -				status = "disabled";
> +			qup_i2c5_default: qup-i2c5-default-state {
> +				pins = "gpio24", "gpio25";
> +				function = "qup5";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  
> -				dsi1_opp_table: opp-table {
> -					compatible = "operating-points-v2";
> +			qup_i2c6_default: qup-i2c6-default-state {
> +				pins = "gpio28", "gpio29";
> +				function = "qup6";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  
> -					/* TODO: opp-187500000 should work with
> -					 * &rpmhpd_opp_low_svs, but one some of
> -					 * sm8350_hdk boards reboot using this
> -					 * opp.
> -					 */
> -					opp-187500000 {
> -						opp-hz = /bits/ 64 <187500000>;
> -						required-opps = <&rpmhpd_opp_svs>;
> -					};
> +			qup_i2c7_default: qup-i2c7-default-state {
> +				pins = "gpio32", "gpio33";
> +				function = "qup7";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
>  
> -					opp-300000000 {
> -						opp-hz = /bits/ 64 <300000000>;
> -						required-opps = <&rpmhpd_opp_svs>;
> -					};
> +			qup_i2c8_default: qup-i2c8-default-state {
> +				pins = "gpio36", "gpio37";
> +				function = "qup8";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  
> -					opp-358000000 {
> -						opp-hz = /bits/ 64 <358000000>;
> -						required-opps = <&rpmhpd_opp_svs_l1>;
> -					};
> -				};
> +			qup_i2c9_default: qup-i2c9-default-state {
> +				pins = "gpio40", "gpio41";
> +				function = "qup9";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  
> -				ports {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> +			qup_i2c10_default: qup-i2c10-default-state {
> +				pins = "gpio44", "gpio45";
> +				function = "qup10";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  
> -					port@0 {
> -						reg = <0>;
> -						mdss_dsi1_in: endpoint {
> -							remote-endpoint = <&dpu_intf2_out>;
> -						};
> -					};
> +			qup_i2c11_default: qup-i2c11-default-state {
> +				pins = "gpio48", "gpio49";
> +				function = "qup11";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  
> -					port@1 {
> -						reg = <1>;
> -						mdss_dsi1_out: endpoint {
> -						};
> -					};
> -				};
> +			qup_i2c12_default: qup-i2c12-default-state {
> +				pins = "gpio52", "gpio53";
> +				function = "qup12";
> +				drive-strength = <2>;
> +				bias-pull-up;
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
> +			qup_i2c13_default: qup-i2c13-default-state {
> +				pins = "gpio0", "gpio1";
> +				function = "qup13";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  
> -				#clock-cells = <1>;
> -				#phy-cells = <0>;
> +			qup_i2c14_default: qup-i2c14-default-state {
> +				pins = "gpio56", "gpio57";
> +				function = "qup14";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
>  
> -				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -					 <&rpmhcc RPMH_CXO_CLK>;
> -				clock-names = "iface", "ref";
> +			qup_i2c15_default: qup-i2c15-default-state {
> +				pins = "gpio60", "gpio61";
> +				function = "qup15";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
>  
> -				status = "disabled";
> +			qup_i2c16_default: qup-i2c16-default-state {
> +				pins = "gpio64", "gpio65";
> +				function = "qup16";
> +				drive-strength = <2>;
> +				bias-disable;
>  			};
> -		};
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
> +			qup_i2c17_default: qup-i2c17-default-state {
> +				pins = "gpio72", "gpio73";
> +				function = "qup17";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
>  
> -			power-domains = <&rpmhpd SM8350_MMCX>;
> +			qup_i2c19_default: qup-i2c19-default-state {
> +				pins = "gpio76", "gpio77";
> +				function = "qup19";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
>  		};
>  
>  		apps_smmu: iommu@15000000 {
