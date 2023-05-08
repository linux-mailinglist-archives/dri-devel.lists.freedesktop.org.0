Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64646FA2FD
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 11:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB7610E1A7;
	Mon,  8 May 2023 09:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21E210E1A7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 09:09:43 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f14ec4efb0so2677163e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 02:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683536982; x=1686128982;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XLm7AdpaWx+8rYMuzi3BjIbkTFvyrXGpj/w3QLDCRhk=;
 b=pC/3lGt1s7oCKAexq4WkMenYzNMw5XLlO2tcOQUyZjv25pJk77d3HATPSdu2dSiwVa
 IUTI9th28NtvaMndosS1O1ODOXokuaaxjnJvnwCRP3oyFSq0+aBJVOvhexLBi/BIwWdc
 GizzdSIZBOG/ni6Kk8x62cuXNB9xvdfXzWk4eSgFweoOZQDhMLuAPIeUGnUeB6JkIov/
 wautuuyiWOtr3KF6kgS9mblyUZHap25+1pr3J3Aqa7haTDS1qgOx+fJZSM4myXQfcX7O
 3d2P0SfE+O42J6iRIylsVX8jmONavAoFh1g+qS9edW6LbuBa83n208cToM+xSrPuTgGg
 u4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683536982; x=1686128982;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XLm7AdpaWx+8rYMuzi3BjIbkTFvyrXGpj/w3QLDCRhk=;
 b=ci9abQa7wUqNPTPTiqS8RcK8H4n5KuZk0r5a4G7k4klm5X2TcMnRH5leZCZSMmzinF
 RluwjTJUtkvmZOxh61OFpzvM28fX/yp8Rfghkbq1h+O2nfOIED7xJ/UiMHaQR0Gpj+di
 CFEpYHuilZ5wzeKq5XcroW+hB/og1ccGMY74FR9YjLFApR/3RssIVnQCatHYdI3CObe7
 qcbQ67Uilsv+n9vUJSx2dPdo0Mnv0kHAefazsu+Fsdvauhwm8qkM6zGJkB8a3kibW1zp
 UtQSE86IPhZwxXTi4Sx/G1UxfhOVnzI74WqaCyWWS9agRR+xg2n361/qgrlhDXlaBuqk
 FU4Q==
X-Gm-Message-State: AC+VfDzW/ZHFnErtX7fKAZQmrP722eNjLVkwpBnHos4sA2HlfD+XA5Dw
 fUxP3Ak/E8AMOl2aD9KGcKJvvQ==
X-Google-Smtp-Source: ACHHUZ5F6obglJyHPsXi4ZWFMKfGnDZYUJDB9yjOwr+BXdmUc+8ECiwRSxaiQ5exXwTTcbZmVFmLzg==
X-Received: by 2002:ac2:5d69:0:b0:4ea:f632:4738 with SMTP id
 h9-20020ac25d69000000b004eaf6324738mr2181920lft.6.1683536982113; 
 Mon, 08 May 2023 02:09:42 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 f6-20020ac24e46000000b004f00279c307sm1226461lfr.245.2023.05.08.02.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 02:09:41 -0700 (PDT)
Message-ID: <29d30e11-54f1-5398-9e3d-5e390b6b0ee3@linaro.org>
Date: Mon, 8 May 2023 11:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH v1 2/3] ARM: dts: qcom: msm8974: add support for the
 HDMI output
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
 <20230507202841.2339127-3-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507202841.2339127-3-dmitry.baryshkov@linaro.org>
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



On 7.05.2023 22:28, Dmitry Baryshkov wrote:
> Add HDMI and HDMI PHY device nodes for the Qualcomm MSM8974 SoC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 90 ++++++++++++++++++++++++++++-
>  1 file changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index fb661c1bd3d5..fbe74eeef863 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1805,6 +1805,21 @@ cci_i2c1_sleep: cci-i2c1-sleep-pins {
>  				};
>  			};
>  
> +			hdmi_default: hdmi-default-state {
> +				cec-pins {
> +					pins = "gpio31";
> +					function = "hdmi_cec";
> +				};
add a newline before each consecutive subnode, please

> +				ddc-pins {
> +					pins = "gpio32", "gpio33";
> +					function = "hdmi_ddc";
> +				};
> +				hpd-pins {
> +					pins = "gpio34";
> +					function = "hdmi_hpd";
> +				};
> +			};
> +
>  			spi8_default: spi8_default-state {
>  				mosi-pins {
>  					pins = "gpio45";
> @@ -1840,7 +1855,7 @@ mmcc: clock-controller@fd8c0000 {
>  				 <&dsi0_phy 0>,
>  				 <&dsi1_phy 1>,
>  				 <&dsi1_phy 0>,
> -				 <0>,
> +				 <&mdss_hdmi_phy>,
>  				 <0>,
>  				 <0>;
>  			clock-names = "xo",
> @@ -1914,6 +1929,13 @@ mdp5_intf2_out: endpoint {
>  							remote-endpoint = <&dsi1_in>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +						mdp5_intf3_out: endpoint {
> +							remote-endpoint = <&mdss_hdmi_in>;
> +						};
> +					};
>  				};
>  			};
>  
> @@ -1970,6 +1992,72 @@ dsi0_out: endpoint {
>  				};
>  			};
>  
> +			mdss_hdmi: hdmi-tx@fd922100 {
> +				compatible = "qcom,hdmi-tx-8974";
> +				reg = <0xfd922100 0x35c>,
> +				      <0xfc4b8000 0x60f0>;
> +				reg-names = "core_physical",
> +					    "qfprom_physical";
> +
> +				pinctrl-0 = <&hdmi_default>;
> +				pinctrl-names = "default";
property-n
property-names

since the pinctrl driver only allows these functions on these pins,
it's okay for it to stay in the SoC dtsi

> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <8>;
> +
> +				clocks = <&mmcc MDSS_MDP_CLK>,
> +					 <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_HDMI_CLK>,
> +					 <&mmcc MDSS_HDMI_AHB_CLK>,
> +					 <&mmcc MDSS_EXTPCLK_CLK>;
> +				clock-names =
> +					"mdp_core",
> +					"iface",
> +					"core",
> +					"alt_iface",
> +					"extp";
broken indentation

> +
> +				phys = <&mdss_hdmi_phy>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
add a newline before properties and subnodes, please

Konrad
> +						mdss_hdmi_in: endpoint {
> +							remote-endpoint = <&mdp5_intf3_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_hdmi_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			mdss_hdmi_phy: hdmi-phy@fd922500 {
> +				compatible = "qcom,hdmi-phy-8974";
> +				reg = <0xfd922500 0x7c>,
> +				      <0xfd922700 0xd4>;
> +				reg-names = "hdmi_phy",
> +					    "hdmi_pll";
> +
> +				clocks = <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_HDMI_AHB_CLK>;
> +				clock-names = "iface",
> +					      "alt_iface";
> +
> +				#phy-cells = <0>;
> +				#clock-cells = <0>;
> +
> +				status = "disabled";
> +			};
> +
>  			dsi0_phy: phy@fd922a00 {
>  				compatible = "qcom,dsi-phy-28nm-hpm";
>  				reg = <0xfd922a00 0xd4>,
