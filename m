Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5608D68BAE6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 12:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D874110E175;
	Mon,  6 Feb 2023 11:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCCC10E175
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 11:03:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id hr39so3443206ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 03:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r46kwHvPKE8Px9ZiS/xnYK0EPgLQiTPTfjFiyC1D1lc=;
 b=n4ZLojagyh2idCX10gQdGqNty036l66vbIydottcRCLjJ424NEtb2qRX2+Juv7iSJ/
 bjp48RgQ52+opyYT2RlQADpKMj6tPLVPdAjB8+zmOkg/3rKN1sLYA9eh90gI4QhWtT7o
 hVHv7yKbQ8OvVk1jf8sBO7sdIk/MP6HKNYjvGyFDCINoGuuVoJHjJd5YcFINhxQZMfop
 O6XTZKeUBBAJl0obKonjRzwLx1FAn9lgXy5JiwYUrW1c8HVYoiOm2YEnnJOym2Km8ewM
 DV7ZwJi4MX/DKRcLkH19J8GpE0btE02ls1Jd1d5t2bHJsdlb3A1JJWunTqKdcr7M3mNZ
 q5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r46kwHvPKE8Px9ZiS/xnYK0EPgLQiTPTfjFiyC1D1lc=;
 b=rHIF1Tl4kPgStLpFEJd5/IlKdCFqUX3YJ/1ZoQ0qtFeiL3LRvFIFkaTbnrtB1Hm/r4
 N+WXQugjeHIsQFW53tQdYctojPBaJB2PazLsYCIAaNIcAoLQM5x/OLDnupddI4q1mni5
 Ws0PDMvgUAhry3clPrJKBRHM3SVrZpv/ZLAB4yFwli4dhFdRfQOrJ5OQ4zH4B7IZJzeV
 wUMsyna4zFOKeQsPMerVl9o1dZpjQ7nx8k8NtGWVAnawf6eNdJCCr2PfFGlToGdsFXck
 D/ak6OgBnxaWRuYeDnokE14OOojUE2FL9hPBpzVjVwW5Pks98beWk3lkoJuBlGnbFV23
 5M6Q==
X-Gm-Message-State: AO0yUKXkgmn6ee4LmZqjlt1lCR/5yRrgb0NjQ1QgYWW3/FqTiVkL16EI
 2xTAhAnM11tfzCAFz3NFJzRhbg==
X-Google-Smtp-Source: AK7set+YdZnL+f48weeelNcGbGXE0glbzkIvqdl18mZf7i07CH/EKsdWggKbRZNvM7syo13PzUWaPw==
X-Received: by 2002:a17:906:7c88:b0:879:2a5:dc40 with SMTP id
 w8-20020a1709067c8800b0087902a5dc40mr20746955ejo.76.1675681398790; 
 Mon, 06 Feb 2023 03:03:18 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
 by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907920600b0080345493023sm5246275ejb.167.2023.02.06.03.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:03:18 -0800 (PST)
Message-ID: <9e6be00e-305e-b4d1-049d-5205ac77f576@linaro.org>
Date: Mon, 6 Feb 2023 12:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/5] arm64: dst: qcom: sm8450: switch to usb3/dp combo phy
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v1-4-f1345872ed19@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v1-4-f1345872ed19@linaro.org>
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

subject: s/dst/dts here and in 5/5

On 6.02.2023 11:17, Neil Armstrong wrote:
> The QMP PHY is a USB3/DP combo phy, switch to the newly
> documented bindings and register the clocks to the GCC
> and DISPCC controllers.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 38 +++++++++++++-----------------------
>  1 file changed, 14 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index d66dcd8fe61f..757b7c56d5f5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -748,7 +748,7 @@ gcc: clock-controller@100000 {
>  				 <&ufs_mem_phy_lanes 0>,
>  				 <&ufs_mem_phy_lanes 1>,
>  				 <&ufs_mem_phy_lanes 2>,
> -				 <0>;
> +				 <&usb_1_qmpphy 0>;
>  			clock-names = "bi_tcxo",
>  				      "sleep_clk",
>  				      "pcie_0_pipe_clk",
> @@ -2038,37 +2038,27 @@ usb_1_hsphy: phy@88e3000 {
>  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>  		};
>  
> -		usb_1_qmpphy: phy-wrapper@88e9000 {
> -			compatible = "qcom,sm8450-qmp-usb3-phy";
> -			reg = <0 0x088e9000 0 0x200>,
> -			      <0 0x088e8000 0 0x20>;
> -			status = "disabled";
> +		usb_1_qmpphy: phy@88e8000 {
> +			compatible = "qcom,sm8450-qmp-usb3-dp-phy";
> +			reg = <0 0x088e8000 0 0x4000>;

>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
These can go since you're removing the subnode, I think..
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
>  		remoteproc_slpi: remoteproc@2400000 {
> @@ -2976,8 +2966,8 @@ dispcc: clock-controller@af00000 {
>  				 <&mdss_dsi0_phy 1>,
>  				 <&mdss_dsi1_phy 0>,
>  				 <&mdss_dsi1_phy 1>,
> -				 <0>, /* dp0 */
> -				 <0>,
> +				 <&usb_1_qmpphy 0>,
> +				 <&usb_1_qmpphy 1>,
>  				 <0>, /* dp1 */
>  				 <0>,
>  				 <0>, /* dp2 */
> @@ -4157,7 +4147,7 @@ usb_1_dwc3: usb@a600000 {
>  				iommus = <&apps_smmu 0x0 0x0>;
>  				snps,dis_u2_susphy_quirk;
>  				snps,dis_enblslpm_quirk;
> -				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +				phys = <&usb_1_hsphy>, <&usb_1_qmpphy 0>;
>  				phy-names = "usb2-phy", "usb3-phy";
BTW msm-5.10 marks the dwc3 subdevice dma-coherent, maybe we should too?

Konrad
>  			};
>  		};
> 
