Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AD4691D74
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 12:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3840F10ECD9;
	Fri, 10 Feb 2023 11:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5772710ECD7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 11:00:56 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id v13so4388632eda.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 03:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xB1OYQZVG8OLqpTp+fXEkB8+PqKD9vdmFhelUczRsh4=;
 b=SUvrG5J/DfoTMuh+maWLM1dvf+iSEVQ8TW/ZpzSVAqtyZmkZEK3XQ3174F209dIC6c
 nZ+mNboevjsvgBDaZcuJIVu/AMKsanDKspKGAKZlDo0EddtuvnevGWJbSH35WVWoXEvW
 Ifmf33HzzwNpK9wKK6JbAlWZu1fhZIDn/YUsN5l/oWxr86AXXjAw5sibv6lmDTPYNOnG
 qtQ255W7wXrQ8ZcXzDSbyBlEA2bdHEQd6ANgyFZHDDqIUbYxWU90ntfZls2k/O+FnGCl
 6VmYCD7C4tOmUqfAyNGLl1I5UGl37br3r+ReBPvz38zZGNyAU5Gd4XNzabJOxbJay7ht
 Dggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xB1OYQZVG8OLqpTp+fXEkB8+PqKD9vdmFhelUczRsh4=;
 b=o3t6GZWcIVk//V0h78HfAsfVgQcMzIP0nBJ5ctVgVDhelsyL5BnV4K2kdfJe0lPvzL
 4Qx3yICcwIcvuQxwUotGub6vJ7Jk8vleEgmwsPFVwd7dRxJaNXq8/Oi6hbODzt7za+yo
 6hQkJuIUUbW31srx5gkwOnv0kfgaqCRQ+rJgMFSZCzM50PtjSn/LossuEu/zNwpeEP47
 gnKOWh/PV1HhQXAVAVtP6KdAXXmrcc/+eM0pTV9eeZOs0p3k8WhP2dns9eV5BeYQALmx
 ivk2IxEmRooURuKcVOJKPtH4tigt+s4oLiwhj6PrrDpMCxFyZF0aSsq8MNM0EzfieHlr
 Xj0w==
X-Gm-Message-State: AO0yUKUwvXOgKAVltFhbIqz076g09hcDPVIaqtb5nuTw5jUTDlM58CxD
 KQXo56sGD3COEoCpgUNEG+PFKw==
X-Google-Smtp-Source: AK7set/QBspTB7GmXObNLkHG58t7jXg5pr3WL6IjkXG7nDSUNRwwFdCFst4DHzBImkd7bstb5OZaig==
X-Received: by 2002:a50:d548:0:b0:4a2:223d:4514 with SMTP id
 f8-20020a50d548000000b004a2223d4514mr15861524edj.8.1676026854881; 
 Fri, 10 Feb 2023 03:00:54 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a50c351000000b004aacd6b88ccsm2016167edb.90.2023.02.10.03.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 03:00:54 -0800 (PST)
Message-ID: <30c8c24b-4ae1-2623-a547-6dcb16b3974b@linaro.org>
Date: Fri, 10 Feb 2023 12:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: sm8350: switch to combo usb3/dp
 phy
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v2-2-529da2203659@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v2-2-529da2203659@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10.02.2023 11:34, Neil Armstrong wrote:
> The first QMP PHY is an USB3/DP combo phy, switch to the newly
> documented bindings and register the clocks to the GCC
> and DISPCC controllers.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 40 ++++++++++++------------------------
>  1 file changed, 13 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 04bb838189a6..d490ce84a022 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -652,7 +652,7 @@ gcc: clock-controller@100000 {
>  				 <&ufs_mem_phy_lanes 0>,
>  				 <&ufs_mem_phy_lanes 1>,
>  				 <&ufs_mem_phy_lanes 2>,
> -				 <0>,
> +				 <&usb_1_qmpphy 0>,
Please use the defines from include/dt-bindings/phy/phy-qcom-qmp.h

>  				 <0>;
>  		};
>  
> @@ -2601,37 +2601,24 @@ usb_2_hsphy: phy@88e4000 {
>  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
>  		};
>  
> -		usb_1_qmpphy: phy-wrapper@88e9000 {
> -			compatible = "qcom,sm8350-qmp-usb3-phy";
> -			reg = <0 0x088e9000 0 0x200>,
> -			      <0 0x088e8000 0 0x20>;
> -			status = "disabled";
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +		usb_1_qmpphy: phy@88e9000 {
> +			compatible = "qcom,sm8350-qmp-usb3-dp-phy";
> +			reg = <0 0x088e8000 0 0x3000>;
>  
>  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK>,
> -				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> -			clock-names = "aux", "ref_clk_src", "com_aux";
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
>  
>  			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>  				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>  			reset-names = "phy", "common";
>  
> -			usb_1_ssphy: phy@88e9200 {
> -				reg = <0 0x088e9200 0 0x200>,
> -				      <0 0x088e9400 0 0x200>,
> -				      <0 0x088e9c00 0 0x400>,
> -				      <0 0x088e9600 0 0x200>,
> -				      <0 0x088e9800 0 0x200>,
> -				      <0 0x088e9a00 0 0x100>;
> -				#phy-cells = <0>;
> -				#clock-cells = <0>;
> -				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> -				clock-names = "pipe0";
> -				clock-output-names = "usb3_phy_pipe_clk_src";
> -			};
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			status = "disabled";
>  		};
>  
>  		usb_2_qmpphy: phy-wrapper@88eb000 {
> @@ -2727,7 +2714,7 @@ usb_1_dwc3: usb@a600000 {
>  				iommus = <&apps_smmu 0x0 0x0>;
>  				snps,dis_u2_susphy_quirk;
>  				snps,dis_enblslpm_quirk;
> -				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +				phys = <&usb_1_hsphy>, <&usb_1_qmpphy 0>;
And here too.

Otherwise LGTM!

Konrad
>  				phy-names = "usb2-phy", "usb3-phy";
>  			};
>  		};
> @@ -3092,8 +3079,7 @@ dispcc: clock-controller@af00000 {
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
>  				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
>  				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
> -				 <0>,
> -				 <0>;
> +				 <&usb_1_qmpphy 1>, <&usb_1_qmpphy 2>;
>  			clock-names = "bi_tcxo",
>  				      "dsi0_phy_pll_out_byteclk",
>  				      "dsi0_phy_pll_out_dsiclk",
> 
