Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667BF6C107E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 12:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1644510E3BC;
	Mon, 20 Mar 2023 11:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22AD10E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 11:15:12 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b10so13219889lfb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 04:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679310911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qc9ZRBjX1gW/PO4dTPRCMAuvrMhl5YVmAVdMbAlY9ZM=;
 b=aot7YGzMwa4OyDGUggFQuMJBby5EaYqELcWCgvcByo9h9VJi2vnicCwCfp01DYyrOK
 UDkXOEkEijJm1Q6f5Q9pqV59feHdJak4Ws9bshNfbo2yn5uUyfeynocp6xiN8m721mkU
 Yg8R+UXEun+WPawxCN3IK6eMg4ZUPmUdJCNGN93uhbmAOaJtXR5o11GzmA0W3Sm06CAJ
 +OjOfccuUZ4aLe5+3YdTysCY4EPv7U6/NKf0ik41l9Oge8PMSd6erzVSD2UWUogdvYPm
 jVVBDkessYZ3JAOfaIWWjNhAbDh7w864UD5jExuo60V17+H1KZVKXInXkg1f3Ygs2d3j
 Jwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679310911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qc9ZRBjX1gW/PO4dTPRCMAuvrMhl5YVmAVdMbAlY9ZM=;
 b=gP8HzcBw1u/nI9bXFEhSDRV7WjnJtZUm2T2U9Cqzq7837Gr+7gmcGrK3yMcIgJ/GcH
 mt82JNIxQAsWXYQZDIkDjKPUK1daIesyc0LgG5lFzLKcyiyeJcLwQyY+75oID7EM4+ox
 nMY9y4CjFnZtAad0giReJlXQbwaTeHcG0CvHSr2ioZbttZghc5HZ4g3hfOOqI2AzIsjE
 t5Vu1pECF/5Fhqf6WVIIzf2hF1mCVab9FjU8bs+nKSG3X/RLkX0uyWj6w019iZjduALz
 UBf16RuS9HSLJO4Ce/k2yPQ8AMb+xFdj4K7N42A+AjqvdbzNGEX28l9dOQ9l0y70oEvA
 i/1g==
X-Gm-Message-State: AO0yUKXnmfneh2+qxqiNrso0NJapm2GCsfmz4TqWXDbfWeloOeE1cdVa
 MNrXbra7Xd8S9vQjUcD1IFROig==
X-Google-Smtp-Source: AK7set8UnMd1OzsvH506jzTAXguOjt9jhFowcEhBvlLI0aobMm+h6RFRFYtbc1BRFsHPA5F/LTjLkQ==
X-Received: by 2002:ac2:5334:0:b0:4e8:502e:b331 with SMTP id
 f20-20020ac25334000000b004e8502eb331mr5611701lfh.14.1679310910883; 
 Mon, 20 Mar 2023 04:15:10 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a19ac0c000000b004dda76fad5asm1655955lfc.218.2023.03.20.04.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 04:15:10 -0700 (PDT)
Message-ID: <62f9ff47-7934-e2e4-aec2-01e9ed2f0a45@linaro.org>
Date: Mon, 20 Mar 2023 12:15:08 +0100
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
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
