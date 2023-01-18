Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76198671169
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F11E10E650;
	Wed, 18 Jan 2023 02:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC3310E650
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:58:30 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id tz11so15610944ejc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/jxMstUvueEQASfZNGKQtozJSkPqyF+FQ0f5CH6JWto=;
 b=Ewt84ua+9q2pPgw239vJZTEcpW5L79v2xH2x/6HFk8bN5JP8eYr9cEKvJEWJhoGWYE
 DIyriS8A5mmAUfdMwjXXiiKI376zR2cqXGWbOWmgAviSzQTdKxTT/bdCfD5I2IaoEC9w
 jwbQJab/9765992rtPSxzGY8PEA4DVY/XGQ8kLH4NhAT2lD/V7i8huNlHj6WRWOYH5pL
 OlmlcKQcSRDjkohjLwMQnNzF5z/WL+dfgpz1OwWdpVBzyIksOz1Tpe06CnqVcCAR6QMC
 65W9m8cOxFC+1RxPzn8I4yG37K+5nHIvsyjE1VKTUQLiocp2JVQSvZTFXxe1tzwBrrkz
 HcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/jxMstUvueEQASfZNGKQtozJSkPqyF+FQ0f5CH6JWto=;
 b=04PqwhZtff8MEcY6FyXW4GwyRZc91x076FRNaxrxHi1IG/UC6lI6DUe/FJ1q+R/njx
 JUjIpcgyBflXPi+196d1P1ce3zuOcegsSFR3/1d7FsPwFQafjcBnInzBAHb+RW4TBOfY
 oVWmKd70J1q+Nw61lhs/O+Otg2vWmtH7XGKUBlv2d0UkdUDRSml0EabNeBNmymmiUG2t
 sG1o6eRjWWUbSIclMsZ3+/dcZ2v6LgcFlsDJnEVe/zZLyGlQKJRP/pIJ7xR6mVZFJGb0
 qIOh7jfNA8ukqHAn6nE6ybeV0aB7clxrn6RjmRxOaKOKtX64TWkAF/2eAx7vhKqRmAcH
 MIrg==
X-Gm-Message-State: AFqh2kq/GUBFpzlTgBvTJO9eDu6bFm6+rLyK+SwBRy0xlgFBDIJUsqqp
 Hn0SYBGs59EM90YbnRV6Gd3TeA==
X-Google-Smtp-Source: AMrXdXtanBFiuO6F4QWUHNIZE17iB+p93sQtCEfM2tNe9hI+JXrj35iHPaKIWAXkSIORjuT0gYFAPw==
X-Received: by 2002:a17:906:6846:b0:84d:2fdf:a41b with SMTP id
 a6-20020a170906684600b0084d2fdfa41bmr4755294ejs.50.1674010708743; 
 Tue, 17 Jan 2023 18:58:28 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 gk8-20020a17090790c800b0084d35ffbc20sm12875378ejb.68.2023.01.17.18.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 18:58:28 -0800 (PST)
Message-ID: <6e7b1518-0dd5-59a6-128a-e3c3c194bf52@linaro.org>
Date: Wed, 18 Jan 2023 04:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sc8280xp: Define some of the
 display blocks
Content-Language: en-GB
To: Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-11-quic_bjorande@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221207220012.16529-11-quic_bjorande@quicinc.com>
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

On 08/12/2022 00:00, Bjorn Andersson wrote:
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
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 838 +++++++++++++++++++++++++
>   1 file changed, 838 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 9f3132ac2857..c2f186495506 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4,6 +4,7 @@
>    * Copyright (c) 2022, Linaro Limited
>    */
>   
> +#include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
>   #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/interconnect/qcom,sc8280xp.h>
> @@ -1698,6 +1699,44 @@ usb_1_qmpphy: phy@8903000 {
>   			status = "disabled";
>   		};
>   
> +		mdss1_dp0_phy: phy@8909a00 {
> +			compatible = "qcom,sc8280xp-dp-phy";
> +			reg = <0 0x08909a00 0 0x19c>,
> +			      <0 0x08909200 0 0xec>,
> +			      <0 0x08909600 0 0xec>,
> +			      <0 0x08909000 0 0x1c8>;
> +
> +			clocks = <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
> +			clock-names = "aux", "cfg_ahb";
> +
> +			power-domains = <&rpmhpd SC8280XP_MX>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		mdss1_dp1_phy: phy@890ca00 {
> +			compatible = "qcom,sc8280xp-dp-phy";
> +			reg = <0 0x0890ca00 0 0x19c>,
> +			      <0 0x0890c200 0 0xec>,
> +			      <0 0x0890c600 0 0xec>,
> +			      <0 0x0890c000 0 0x1c8>;
> +
> +			clocks = <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
> +				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
> +			clock-names = "aux", "cfg_ahb";
> +
> +			power-domains = <&rpmhpd SC8280XP_MX>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
>   		system-cache-controller@9200000 {
>   			compatible = "qcom,sc8280xp-llcc";
>   			reg = <0 0x09200000 0 0x58000>, <0 0x09600000 0 0x58000>;
> @@ -1813,6 +1852,326 @@ usb_1_dwc3: usb@a800000 {
>   			};
>   		};
>   
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
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			mdss0_mdp: display-controller@ae01000 {
> +				compatible = "qcom,sc8280xp-dpu";
> +				reg = <0 0x0ae01000 0 0x8f000>,
> +				      <0 0x0aeb0000 0 0x2008>;
> +				reg-names = "mdp", "vbif";
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&gcc GCC_DISP_SF_AXI_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_MDP_LUT_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "bus",
> +					      "nrt_bus",
> +					      "iface",
> +					      "lut",
> +					      "core",
> +					      "vsync";
> +
> +				assigned-clocks = <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
> +						  <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <460000000>,
> +						       <19200000>;
> +
> +				operating-points-v2 = <&mdss0_mdp_opp_table>;
> +				power-domains = <&rpmhpd SC8280XP_MMCX>;
> +
> +				interrupt-parent = <&mdss0>;
> +				interrupts = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@5 {
> +						reg = <5>;
> +						mdss0_intf5_out: endpoint {
> +							remote-endpoint = <&mdss0_dp3_in>;
> +						};
> +					};
> +
> +					port@6 {
> +						reg = <6>;
> +						mdss0_intf6_out: endpoint {
> +							remote-endpoint = <&mdss0_dp2_in>;
> +						};
> +					};
> +				};

This now fails with:

arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: display-controller@ae01000: 
ports: 'port@0' is a required property
	From schema: 
Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: display-controller@ae01000: 
Unevaluated properties are not allowed ('ports' was unexpected)
	From schema: 
Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml

We do not map reg ids to INTF indices. So, unless you plan to change 
that, could you please change these to port@0 / port@1 ?

[skipped the rest]

-- 
With best wishes
Dmitry

