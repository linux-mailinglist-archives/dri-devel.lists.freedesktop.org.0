Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF066C3C3C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 21:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0964A10E2F6;
	Tue, 21 Mar 2023 20:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406AD10E2F6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 20:51:38 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id x17so20781467lfu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 13:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679431896;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eKWhu/7fxkKK1XhIKWyiKLRoNftSH0tG13Cl4ydh5kE=;
 b=YWyfDTdk3ZLPMeCcQdUtXZeSjbsAcurRnXz9ikuqmlauXD5e4hMi8wqGI1w4wOwUsC
 Xknw9QNDDWsWXRY6/oZIuecHdxPkeVNxBqTeoQuuoOqvwm56KeV2kqrurxA0v2tBSZ9F
 +KGJ+s0ZWUZ30aZPSiSeptskNCb1ymiq3eTRvLdCug3LmDK6FZKmR1jUAAPJzRJeyHgp
 ILhpL7lgct28YU8agmpgE4Av9Z/9THQoM7o367h46k2y/JoRbbGAH2Zf5G+tb53t1lHC
 Q0m2GWhVUtVEUJZ0IkMXafnwpFdVUbuuW9SdGPWSFJPEQOoxAEiFM/9JXcdrmwakZNa7
 6Pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679431896;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eKWhu/7fxkKK1XhIKWyiKLRoNftSH0tG13Cl4ydh5kE=;
 b=6nD7Srapf2Sv9+wgr6W0EB+IINkUl/BzgJmvcC3SYBrag9DKzuckffOaWSXTHpIQGm
 12n+fpCE/kIzp70DaxeTOtxFQmemuifotoa2dgeA6Tnqw8mMg7344XOMYAvYW0j4D+qF
 XrEiZyajVFFAh3VVP7Fgu/MG6DsCh+mlc6r0UXOsWmQtzJE+jzD75Jf2pFRAUDR7ciT9
 XbuvHbGacZIEdAdHHbM/n/f8Cpy972fe+oD3b4/46Khdn0TaMSfEVLKUQ45CeT6MaHMx
 CWJCYKUk0/Z8xGvA6Amt/i8UbBXG8lxA8rlUl7ltAnUfqT6UADn3dxmUDsaSHQgrcfVr
 Galw==
X-Gm-Message-State: AO0yUKXHlpih+b63f6n0Yd6icnqFsOOI+CFoXS49NqNRnk/sMoQPFTfv
 WrCcVr2ncS4ezhGmnyv5cdKyrA==
X-Google-Smtp-Source: AK7set+NLZEYdMSH+1uGPF9bttBCNzvYGp4nyjMPrmc4asW1hTHH4rA1OHm0X7nNb/Q0nT1c6OcsGw==
X-Received: by 2002:a05:6512:68:b0:4cb:2aa:9e58 with SMTP id
 i8-20020a056512006800b004cb02aa9e58mr1217358lfo.13.1679431896402; 
 Tue, 21 Mar 2023 13:51:36 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
 by smtp.gmail.com with ESMTPSA id
 y17-20020ac24211000000b004ddaea30ba6sm2293727lfh.235.2023.03.21.13.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 13:51:35 -0700 (PDT)
Message-ID: <b1e6ca00-348b-4d61-6e90-30bef756732c@linaro.org>
Date: Tue, 21 Mar 2023 21:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sm8450: add dp controller
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v6-5-d78313cbc41d@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v6-5-d78313cbc41d@linaro.org>
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



On 17.03.2023 16:06, Neil Armstrong wrote:
> Add the Display Port controller subnode to the MDSS node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 97ce5fe0e9b0..da6d1881ef60 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2751,6 +2751,13 @@ dpu_intf2_out: endpoint {
>  						};
>  					};
>  
> +					port@2 {
> +						reg = <2>;
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp0_in>;
> +						};
> +					};
> +
>  				};
>  
>  				mdp_opp_table: opp-table {
> @@ -2783,6 +2790,78 @@ opp-500000000 {
>  				};
>  			};
>  
> +			mdss_dp0: displayport-controller@ae90000 {
> +				compatible = "qcom,sm8450-dp", "qcom,sm8350-dp";
> +				reg = <0 0xae90000 0 0x200>,
> +				      <0 0xae90200 0 0x200>,
> +				      <0 0xae90400 0 0xc00>,
> +				      <0 0xae91000 0 0x400>,
> +				      <0 0xae91400 0 0x400>;
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
I applied this locally and noticed line has 2x 8 spaces.. Bjorn, could
you please take care of that when applying?

Konrad
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
>  			mdss_dsi0: dsi@ae94000 {
>  				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae94000 0 0x400>;
> 
