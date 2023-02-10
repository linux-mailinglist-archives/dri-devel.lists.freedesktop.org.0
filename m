Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD169220F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 16:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FD810ED64;
	Fri, 10 Feb 2023 15:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD97110ED66
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 15:24:16 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id m2so16758930ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 07:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gCHYjcncflVx/yjUEZZwsiDoD/DvS3T0rRLgLEJn6PA=;
 b=cXGPeltBt6F1AY3xiK843QltijxYiz660ivWON60ggvCiutjrd/373RJLmscVYJr6j
 fA35d4famGzTBbF7gsH+gsNA4pKIEE0R/P3oEreOERvASYZGhjFrTIPDd3X4tCTF23A8
 F4llHl3Vthej69NZiZDOOQHuW6fTbsMpf/SE4T9PpCBtS0AY0gCm+vtvrZWLW3kX2dqQ
 o9Vj7Pyg7iazqlp8ngjJQbX/EED7mjrm/jorfaM8KEd84hVSnKnC7i3PYKJUo3SIUxVU
 hg0fhuvC7XWxL1Xq8QgKQXl6+3etHJrhAPiDO5WvNTw/H0WbpwtqmZs4TkkLOVgq7ywV
 qEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gCHYjcncflVx/yjUEZZwsiDoD/DvS3T0rRLgLEJn6PA=;
 b=t8E1+8JNu3dgZ8A9QudDirAFXB6QFra9qfEdyANpm1uumufFVRRWSAjTnfO4iVUqgN
 1Z5/IYE1d7UwzHE/d5IDUwYs3DwewUpSv9Lzm3Y7ZJhgC0dS0hvvmo7PY+eOeU0CDaNq
 VRUmpvg7/1Hsb6/fjElSN5GUgdNYdZdrbvR2pWRZ0kmNgvuA9vSl9eHK+APnTwi2ml3o
 FV/Fq8TOfyU2YchDyqsYqjNKWctkPetNZOnXyOhVR2QHHzNV41nOHOuzPEg17srEFAvL
 YZnmE3H6JQ82TiJAUHq7eJkAxbpNmZ6iC4EeoFhsZoERvl/DHRNZKZA6BNuRjXbaAIXG
 FICg==
X-Gm-Message-State: AO0yUKWT/v7kntAnR8xQAvuRV+rEBoS9FDvK/pBy6nHYzOJs2BDAFHcZ
 /IOBg+ilCxjlPVBXemdyb6QOAg==
X-Google-Smtp-Source: AK7set/KUCOzTCOVo2Vq2CGBzdc457jv12fo4H0oyU1WQa8Q4BmAWpLgg/AbmeTYX5Nv/2vROWHkng==
X-Received: by 2002:a17:906:3810:b0:888:952f:fec5 with SMTP id
 v16-20020a170906381000b00888952ffec5mr15692985ejc.8.1676042655400; 
 Fri, 10 Feb 2023 07:24:15 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 mv9-20020a170907838900b0087bd2ebe474sm2485375ejc.208.2023.02.10.07.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 07:24:14 -0800 (PST)
Message-ID: <347a5193-f7b1-7f8e-0c60-3d435bdf952c@linaro.org>
Date: Fri, 10 Feb 2023 17:24:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sm8450: add dp controller
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v3-5-636ef9e99932@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v3-5-636ef9e99932@linaro.org>
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

On 10/02/2023 16:44, Neil Armstrong wrote:
> Add the Display Port controller subnode to the MDSS node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 6caa2c8efb46..72d54beb7d7c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2751,6 +2751,13 @@ dpu_intf2_out: endpoint {
>   						};
>   					};
>   
> +					port@2 {
> +						reg = <2>;
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp0_in>;
> +						};
> +					};
> +
>   				};
>   
>   				mdp_opp_table: opp-table {
> @@ -2783,6 +2790,78 @@ opp-500000000 {
>   				};
>   			};
>   
> +			mdss_dp0: displayport-controller@ae90000 {
> +				compatible = "qcom,sm8350-dp";

Missing "qcom,sm8450-dp". As I wrote in the comment to patch 1, I'd 
suggest having just a single entry here rather than keeping both 8350 
and 8450 entries.

> +				reg = <0 0xae90000 0 0xfc>,
> +				      <0 0xae90200 0 0xc0>,
> +				      <0 0xae90400 0 0x770>,
> +				      <0 0xae91000 0 0x98>,
> +				      <0 0xae91400 0 0x98>;


While this sounds correct, usually we used the even size here (0x200, 
0x400, etc.). Can we please switch to it (especially since sm8350-dp 
uses even sizes).

> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +			                      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
> +			        phy-names = "dp";
> +
> +			        #sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd SM8450_MMCX>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +				};
> +
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
>   			mdss_dsi0: dsi@ae94000 {
>   				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>   				reg = <0 0x0ae94000 0 0x400>;
> 

-- 
With best wishes
Dmitry

