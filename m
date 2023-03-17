Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFA06BE8DF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF8010EEED;
	Fri, 17 Mar 2023 12:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00A110EEED
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:09:58 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y20so6209712lfj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 05:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679054997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jNiR0NLTuJj+aWp4YB9vTYSgpZApuVfwOdJ5ZUsnGj0=;
 b=YcGwRdgSUFM5T1XagjtlvRNmVe4Jf7NuzX+OWI7+j3ovglq4UV/JKpah/ATZQasTG6
 rwkRVwxVIeG5yVHBjuefiW9ETbkBVgDgpZfTRkQh0m5y+wJFjEitN4kLIEqI2CnC3kxz
 /iuweDgmIkQ7NOR+eVh180t3UrWe4FSPNjUqmafK8JZl6j0pius6GpDc4MS4Dple9BHx
 EdR1BWZYTdUUvJktXdxJoWYsH8HVEB5yL3J3Glp4NxV4eAvL0A8kjJ6sTAG55u108YPz
 XJT4J3p/EW3FWugSjA3LOwOlbLyroTbfHa3YGw5ZLCcFAq5THSe3TeKG5FPScqOw88zA
 2paA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679054997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jNiR0NLTuJj+aWp4YB9vTYSgpZApuVfwOdJ5ZUsnGj0=;
 b=kADxhb7g/IAzc1s4hynXP5Hy/AofRoYM2+l7iwhZL2V99A4DDQXFoic8RDZzE1L8Z0
 GmxgrujLkMGoc6tdrT9ue0hHQN5MQAWtgdrtTFjLfRQpsfRr+LdSq6+lc3ach4TLz6UN
 i8Z0QCCvrTA0K3rMskY/75JZKccTSVecfuqscRk/DMJXkeDA1we9qJc8LkjPUEW5Qb7M
 ZH66wnhc6MKoFnQqx74+A0JdOQX7zfdtx/yROFniybJJp9pk6d4fNA0sR2/BY9dn4Qzp
 79PB8bPAM6Ihf7sXICDqqVtq2w3FQjN8D9+1jSMi4PtuwXcd7+tDuS8eq0RXK1uGFb0d
 0fKQ==
X-Gm-Message-State: AO0yUKWir6M5ai66wwtai8rQYoxX8AHsLAQCBADMZ/igKSvMb4ikYge8
 N5Uuf2vtYDxRngQvbpktlLkNmg==
X-Google-Smtp-Source: AK7set/J4wuWg4OytN80EDGFmX2hbBh16ONc9kAfE7OVJZXwNRrc3IJx9b1HCdYwn/r8MRS+n9Q9cQ==
X-Received: by 2002:a05:6512:406:b0:4e9:59cd:4171 with SMTP id
 u6-20020a056512040600b004e959cd4171mr1956040lfk.60.1679054996939; 
 Fri, 17 Mar 2023 05:09:56 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a056512102a00b004e7b84c6419sm343432lfr.192.2023.03.17.05.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 05:09:56 -0700 (PDT)
Message-ID: <ab6391c4-ff38-8286-77ff-c781669f5aa0@linaro.org>
Date: Fri, 17 Mar 2023 14:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: sm8450: switch to usb3/dp combo
 phy
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v5-0-a27f1b26ebe8@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v5-4-a27f1b26ebe8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v5-4-a27f1b26ebe8@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/03/2023 11:12, Neil Armstrong wrote:
> The QMP PHY is a USB3/DP combo phy, switch to the newly
> documented bindings and register the clocks to the GCC
> and DISPCC controllers.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 42 +++++++++++++-----------------------
>   1 file changed, 15 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 69695eb83897..0b5a151ce138 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -11,6 +11,7 @@
>   #include <dt-bindings/dma/qcom-gpi.h>
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include <dt-bindings/interconnect/qcom,sm8450.h>
>   #include <dt-bindings/soc/qcom,gpr.h>
> @@ -748,7 +749,7 @@ gcc: clock-controller@100000 {
>   				 <&ufs_mem_phy_lanes 0>,
>   				 <&ufs_mem_phy_lanes 1>,
>   				 <&ufs_mem_phy_lanes 2>,
> -				 <0>;
> +				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>   			clock-names = "bi_tcxo",
>   				      "sleep_clk",
>   				      "pcie_0_pipe_clk",
> @@ -2034,37 +2035,24 @@ usb_1_hsphy: phy@88e3000 {
>   			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>   		};
>   
> -		usb_1_qmpphy: phy-wrapper@88e9000 {
> -			compatible = "qcom,sm8450-qmp-usb3-phy";
> -			reg = <0 0x088e9000 0 0x200>,
> -			      <0 0x088e8000 0 0x20>;
> -			status = "disabled";
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +		usb_1_qmpphy: phy@88e8000 {
> +			compatible = "qcom,sm8450-qmp-usb3-dp-phy";
> +			reg = <0 0x088e8000 0 0x4000>;

This should be 0x3000 too, like 8350

>   
>   			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>   				 <&rpmhcc RPMH_CXO_CLK>,
> -				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> -			clock-names = "aux", "ref_clk_src", "com_aux";
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
>   
>   			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>   				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>   			reset-names = "phy", "common";
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
>   		};
>   
>   		remoteproc_slpi: remoteproc@2400000 {
> @@ -2972,8 +2960,8 @@ dispcc: clock-controller@af00000 {
>   				 <&mdss_dsi0_phy 1>,
>   				 <&mdss_dsi1_phy 0>,
>   				 <&mdss_dsi1_phy 1>,
> -				 <0>, /* dp0 */
> -				 <0>,
> +				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>   				 <0>, /* dp1 */
>   				 <0>,
>   				 <0>, /* dp2 */
> @@ -4168,7 +4156,7 @@ usb_1_dwc3: usb@a600000 {
>   				iommus = <&apps_smmu 0x0 0x0>;
>   				snps,dis_u2_susphy_quirk;
>   				snps,dis_enblslpm_quirk;
> -				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>   				phy-names = "usb2-phy", "usb3-phy";
>   			};
>   		};
> 

-- 
With best wishes
Dmitry

