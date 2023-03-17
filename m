Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49BB6BE90B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E2E10E112;
	Fri, 17 Mar 2023 12:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A16210E112
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:16:10 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id b13so4835394ljf.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679055368;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EB1pjDrIFDWl/GpnCbpbfSmQwQ+xIhoM1uzp4DIQHWQ=;
 b=H6MhW6SzQiMeHBTvrvFr8MqEKjtlxGlnonkYx+iGaNrit8BJgHWetw67L/OP1m4Ay8
 9ntl5JOeLbwVH4RqpdhWw4olLzgfP7Jkl8MqZd4mn4NfrYwauMdzHpJdQHBmnsa/p9D2
 ynAvhUoL3P9sZPhVlywR5Z/pdqGzyPkpFaFyziF0BwDnCMH1GtmQmFZl61H9YH98tW3g
 X0tn8FVQfYrE20ZPR4U0FVkg+C6W+yO6U/18IYQciRXC8hwLJsu+wk67tF0EOJWqdVO6
 tgcAIDXNNCFlUB2NOBZe5SqRmn59p0nqQQVYtN+VAyumq6JXpmMDHl3pB/P/SaxQZL2q
 c2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679055368;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EB1pjDrIFDWl/GpnCbpbfSmQwQ+xIhoM1uzp4DIQHWQ=;
 b=PpScMY8MMTcfFJRFOwTPILSR5wSFJRFesIl6pG39mhYxRey7NolcphLDoxC03YKJgz
 EyiJmquf7vK8olQSZNyyTW3mFgYj+DgdpdmOTj+ljU+BwaJidnCCyYGBXvf0Y9sDl8kr
 cPMEzQaih++bbzBPbVDtyB4PdEUSXzSp6HyzS01dMa7N5ImD3JiainWK60vKccwtRCWe
 2QOJshc/18GIqe8w6sR5Ag7b+Y7TG6saZeQMvZEtKBW5vOQxxafJfPfmUE0/P3/ObiR+
 gUsS58GavQ8pAbtIRHVi/0304IqBM7MJYmUJEAay2nJFhyKHu8pvj3xBEKQOyUCcB0oD
 ckpA==
X-Gm-Message-State: AO0yUKV0tpqsASr/j54qN/V6fl1D8C4XJd4353tY/WHoUpPSqyBt2sUM
 CyrDmjNLmNbOODXnxSUWeW/HujSGPr1u2HqG8Ky0U+h8
X-Google-Smtp-Source: AK7set9FBPeEYHssajhG7VTonP8sMECPpkGtXFquBIb7N6Ao22R/+hFH2lC+l6bFgRFFTNA/f++GWg==
X-Received: by 2002:a05:651c:550:b0:290:6e01:8d0b with SMTP id
 q16-20020a05651c055000b002906e018d0bmr4207323ljp.26.1679055368130; 
 Fri, 17 Mar 2023 05:16:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a2e8782000000b0029335c12997sm380673lji.58.2023.03.17.05.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 05:16:07 -0700 (PDT)
Message-ID: <ac42e079-6db2-0934-bdcf-836229b3d0a5@linaro.org>
Date: Fri, 17 Mar 2023 14:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: sm8350: add dp controller
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
 <20230206-topic-sm8450-upstream-dp-controller-v5-3-a27f1b26ebe8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v5-3-a27f1b26ebe8@linaro.org>
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
> Add the Display Port controller subnode to the MDSS node.
> 
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #SM8350-HDK
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 74 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 975ab4cbe57e..37ae4a948be1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -2415,6 +2415,80 @@ dpu_intf2_out: endpoint {
>   							remote-endpoint = <&mdss_dsi1_in>;
>   						};
>   					};
> +
> +					port@2 {
> +						reg = <2>;
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp_in>;
> +						};
> +					};
> +				};
> +			};
> +
> +			mdss_dp: displayport-controller@ae90000 {
> +				compatible = "qcom,sm8350-dp";
> +				reg = <0 0xae90000 0 0x200>,
> +				      <0 0xae90200 0 0x200>,
> +				      <0 0xae90400 0 0x600>,
> +				      <0 0xae91000 0 0x400>,
> +				      <0 0xae91400 0 0x400>;
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +			                      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
> +			        phy-names = "dp";
> +
> +			        #sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd SM8350_MMCX>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dp_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +				};
> +
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";

I think we still need an OPP entry for RBR rate (160000000). Downstream 
would resort to low_svs in such case, the min voltage for MMCX domain.

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
>   				};
>   			};
>   
> 

-- 
With best wishes
Dmitry

