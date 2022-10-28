Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90352611D18
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 00:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD18D10E1F9;
	Fri, 28 Oct 2022 22:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D2E10E1F9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 22:01:32 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id g16so4361452qtu.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 15:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yr8HUh+1Ce740LCeQRhqA45PIBCHDZMjS7OE/YrOh64=;
 b=W9FqxqVnRpTbDGEs374QqsqI4sSBT2PWyKERYSuC+2neXgYNGwjuSYr2/ApwF+NVbA
 Q0dM2jBrF/UfnRAISug35FgYcv+0fw1/fP8rQjcNcQqzwBX1dcTG2rjQR1QFp1y+jbUi
 x/iJ2p04XhKdaEihWKAwmWZgdiFh5NgEZmNSQNVQGIFbWT5OGVgvuHZgAU/rKnCpX7K1
 iEEBWzFeK7MFsIiUkty+mxSGdp7Nrm4qCKQ9JmB6yOiQmXHKkEOABaJPN7Z6qnDReXJL
 tEDtNEtKQdTZGwleHGGLIGKq9hGWtKu8CTF4MgTEXtiMWesmIw1Pix067DtUo8NvsXSQ
 NI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yr8HUh+1Ce740LCeQRhqA45PIBCHDZMjS7OE/YrOh64=;
 b=U1EKI36O5OId7jlZpeCf3MhnDMy41gr8N+aI0F3jz3EIIIXdqyH/DmR4xO9YdEH9tO
 /3Xu4hEZh/++Q1UoixcY1Cx4m1vuCqPkoErpGUzmUJCL70m1aL78y1+5pPpTSVFn44jk
 lIvgu+mJ6lksYRV+3uSBGiMZbfmGYso0qmN9oebXZGDkcAhBSyw44gFUmgPyADMdmhA6
 Sx737BSmt6VG052vW46fhEioOv7XbwEvhfnxbxkhOFUuPd+9lh1bOgP3xwb/sFJvX3Dn
 zFmyZ+BSDPXw/YM0EyOr/eUmfUJsMsPlX2/C9+9Zx/7KXxOBSHhORkSM7UkV4Z0O2wc6
 VJ1A==
X-Gm-Message-State: ACrzQf0pAFSGRetER1ij7XzbXugITlpRKftJFPl9J2xKxuneP8GuRhnO
 8XmEVVFGwAoqK44Tz3XffGRKFg==
X-Google-Smtp-Source: AMsMyM6orjMbEmKKnktdS6B4pHMzgMLO4tFbtwa8t4mwDA17uPa9xsXNo4D2AWjXskqRxr20EIO8Og==
X-Received: by 2002:a05:622a:1114:b0:3a4:f4e4:6430 with SMTP id
 e20-20020a05622a111400b003a4f4e46430mr1443085qty.337.1666994491244; 
 Fri, 28 Oct 2022 15:01:31 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05620a24c800b006ce515196a7sm3784993qkn.8.2022.10.28.15.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 15:01:30 -0700 (PDT)
Message-ID: <c868e55d-b808-0ca9-4e84-baf94c469182@linaro.org>
Date: Fri, 28 Oct 2022 18:01:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v1 7/9] arm64: dts: qcom: sm8350: Add display system nodes
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
 swboyd@chromium.org, angelogioacchino.delregno@somainline.org,
 loic.poulain@linaro.org, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-8-robert.foss@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028120812.339100-8-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/10/2022 08:08, Robert Foss wrote:
> Add mdss, mdss_mdp, dsi0, dsi0_phy nodes. With these
> nodes the display subsystem is configured to support
> one DSI output.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 196 ++++++++++++++++++++++++++-
>  1 file changed, 192 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index b6e44cd3b394..eaa3cdee1860 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2020, Linaro Limited
>   */
>  
> +#include <dt-bindings/interconnect/qcom,sm8350.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
>  #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> @@ -2535,14 +2536,200 @@ usb_2_dwc3: usb@a800000 {
>  			};
>  		};
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
> +			status = "ok";

No need for this.

> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			mdss_mdp: mdp@ae01000 {

Node name: display-controller
> +				compatible = "qcom,sm8350-dpu";
> +				reg = <0 0x0ae01000 0 0x8f000>,
> +				      <0 0x0aeb0000 0 0x2008>;
> +				reg-names = "mdp", "vbif";
> +				iommus = <&apps_smmu 0x820 0x402>;
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
> +				status = "ok";
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
> +				mdp_opp_table: mdp-opp-table {

I have doubts that it passes dtbs_checks... opp-table

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
> +			dsi0_phy: dsi-phy@ae94400 {

Just "phy". I think Dmitry was renaming all of these.

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

opp-table

Run `make dtbs_check`


Best regards,
Krzysztof

