Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7426F629B01
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0915D10E3F6;
	Tue, 15 Nov 2022 13:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2750210E3F4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:47:21 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id j4so24552800lfk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D1lsJdjigIX8ZDz/U2Ud7ZNMW6v6rQsSpoxZd5XzRCU=;
 b=toZYMHYHTMpkCtWeEVOJGZddt5opCfkJre25TDxhpInMjQ13zbH8ndmt4JbDPDyKI4
 Ygx606/KjsyiP9FDUiRTSLYEi74hurhoTA7pAnMO6MPGAo4dMHHNSYB4LivXKi1OhD2g
 NHRGtdtq6I3izbstBC7OHL8IaIp+njwTn3PVXkgEW+lUru48QoI0Kl7XEhbjxepVLfcU
 RaDN3MdNZBt+bdUYqvAUiQBQJbv1nMxRKGcVg9sqH3E8pUlXZjWBBBaM4CnhM5yybMsw
 Zkacv+sfli28hw4WE59YZhDvPNk9rvkIMtfQGQUQSlwOposIpikkeUJ6TJu7lG1eujoe
 fTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=D1lsJdjigIX8ZDz/U2Ud7ZNMW6v6rQsSpoxZd5XzRCU=;
 b=0xuG4v51l0KThhkVX151MBPnQZqsxd4h7q8JYm7d9H5qmzSKk7ndPQyouWEl7cdS95
 S6yflu+PxYjb4XWdPwNb8MmBnZGbndTNW6eFOaRI8vZxtbL35uIzm40nqULXDdLw1PvQ
 Uf8fJ4uhpMqZVvKtn7Cid2gf9VUh0W0E2EiRZRc48U3zOSexftMulKN38C+bVsZAgLbO
 EGpiVMQSEMNFyw96LX38CcEMZK00z+wYe05jZXnmfB0onyxXOtw9NNVYYUNUqeU0n6wP
 ISyde8rxnkJl4WH23GBAzY/oP7bLcnTnOvIIBCBDO5idLoS7vcR9VRjgaprvQqtbrAmR
 y7OQ==
X-Gm-Message-State: ANoB5pmHzx+tjoTydd/sdYdvtgm4qRpUV/AH+ZQivYSau84/45WdIFe3
 7wA4gQYgsLJuN+T7a3Q5ExmzoA==
X-Google-Smtp-Source: AA0mqf5xZIdpKC+8d2I3BbXfsVS3Y6jQcYqCsbUQ+AHMtLAbUdSpt3NQjEc8eMotSJsgEv7BcpI0qQ==
X-Received: by 2002:a19:e01a:0:b0:4b1:61a6:fc45 with SMTP id
 x26-20020a19e01a000000b004b161a6fc45mr5503018lfg.224.1668520039387; 
 Tue, 15 Nov 2022 05:47:19 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a056512211700b0049e9122bd1bsm2209533lfr.164.2022.11.15.05.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:47:18 -0800 (PST)
Message-ID: <dc138171-f7b1-2761-d800-620e85afd6d9@linaro.org>
Date: Tue, 15 Nov 2022 14:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 10/12] arm64: dts: qcom: sm8350: Add display system
 nodes
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221115133105.980877-1-robert.foss@linaro.org>
 <20221115133105.980877-11-robert.foss@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221115133105.980877-11-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15/11/2022 14:31, Robert Foss wrote:
> Add mdss, mdss_mdp, dsi0, dsi0_phy nodes. With these
> nodes the display subsystem is configured to support
> one DSI output.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 197 ++++++++++++++++++++++++++-
>   1 file changed, 193 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 434f8e8b12c1..5c98e5cf5ad0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2020, Linaro Limited
>    */
>   
> +#include <dt-bindings/interconnect/qcom,sm8350.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
>   #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> @@ -2536,14 +2537,201 @@ usb_2_dwc3: usb@a800000 {
>   			};
>   		};
>   
> +		mdss: mdss@ae00000 {
> +			compatible = "qcom,sm8350-mdss";
> +			reg = <0 0x0ae00000 0 0x1000>;
> +			reg-names = "mdss";
> +
> +			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +			power-domains = <&dispcc MDSS_GDSC>;
> +			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +
> +			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
> +				 <&gcc GCC_DISP_SF_AXI_CLK>,
> +				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +			clock-names = "iface", "bus", "nrt_bus", "core";
> +
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			iommus = <&apps_smmu 0x820 0x402>;
> +
> +			status = "disabled";
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,sm8350-dpu";
> +				reg = <0 0x0ae01000 0 0x8f000>,
> +				      <0 0x0aeb0000 0 0x2008>;
> +				reg-names = "mdp", "vbif";
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					<&gcc GCC_DISP_SF_AXI_CLK>,
> +					<&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					<&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +					<&dispcc DISP_CC_MDSS_MDP_CLK>,
> +					<&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "bus",
> +					      "nrt_bus",
> +					      "iface",
> +					      "lut",
> +					      "core",
> +					      "vsync";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <19200000>;
> +
> +				operating-points-v2 = <&mdp_opp_table>;
> +				power-domains = <&rpmhpd SM8350_MMCX>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;
> +
> +				status = "disabled";
It doesn't make sense to disable mdp separately, as mdss is essentially 
useless without it.

> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&dsi0_in>;
> +						};
> +					};
> +				};
> +
> +				mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-200000000 {
> +						opp-hz = /bits/ 64 <200000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-300000000 {
> +						opp-hz = /bits/ 64 <300000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-345000000 {
> +						opp-hz = /bits/ 64 <345000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-460000000 {
> +						opp-hz = /bits/ 64 <460000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +			dsi0: dsi@ae94000 {
> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0 0x0ae94000 0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&dsi0_phy 0>,
> +							 <&dsi0_phy 1>;
> +
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmhpd SM8350_MMCX>;
> +
> +				phys = <&dsi0_phy>;
> +				phy-names = "dsi";
I think that was dropped as of late.

> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi0_in: endpoint {
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,dsi-phy-5nm-8350";
> +				reg = <0 0x0ae94400 0 0x200>,
> +				      <0 0x0ae94600 0 0x280>,
> +				      <0 0x0ae94900 0 0x260>;
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
> +
> +				dsi_opp_table: dsi-opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-187500000 {
> +						opp-hz = /bits/ 64 <187500000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
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
> +			};
> +		};
> +
>   		dispcc: clock-controller@af00000 {
>   			compatible = "qcom,sm8350-dispcc";
>   			reg = <0 0x0af00000 0 0x10000>;
>   			clocks = <&rpmhcc RPMH_CXO_CLK>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> +				 <&dsi0_phy 0>, <&dsi0_phy 1>,
> +				 <0>, <0>,
>   				 <0>,
>   				 <0>;
>   			clock-names = "bi_tcxo",
> @@ -2558,6 +2746,7 @@ dispcc: clock-controller@af00000 {
>   			#power-domain-cells = <1>;
>   
>   			power-domains = <&rpmhpd SM8350_MMCX>;
> +			required-opps = <&rpmhpd_opp_turbo>;
A turbo vote is required for it to function? Seems a bit high..

Konrad
>   		};
>   
>   		adsp: remoteproc@17300000 {
