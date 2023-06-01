Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6311A7197F3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 11:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E19810E221;
	Thu,  1 Jun 2023 09:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D6B10E53B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 09:58:40 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f4bd608cf4so687666e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685613519; x=1688205519;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NqAsn5Q85J3c7XSLh3IAE2t7rNKZWZ7VbEFAEiDLDYA=;
 b=agcTDv9a1g00uH7eoyOcguszWGCywHuqzxV+NZUp012NODJleh9Y5z6ptVNYgSdmtX
 8F+TXH5LNrlnF0kTdnei8T+PE4y7PWFCLJEuvkUrLP7arJe74gH2s9HMVLHopLe/Dm6T
 ixDYDVag5R4OGMb97zZ+Ge2fKkBYBJ+yGZsjG1o6ADwvfq0p+ukMh1frxUVu2Cazdxe/
 CVR1NTMnVnetB8X0HAd548kZ0xJJwf3ioefwC3QKnWw5YpzkGfleyqj8S9PMg6XIGY/j
 ZFuMJ8Gta7UC6Q1k/SNCmPtAC1xAerVi64SWB2ThLqtGQvuZeDicTddV61Vxtxbd44N4
 3M3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685613519; x=1688205519;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NqAsn5Q85J3c7XSLh3IAE2t7rNKZWZ7VbEFAEiDLDYA=;
 b=YmZhJtytDtg5QJQNKKzq0PJYznjc5fnTfDJScNjd2PShImURO40HpV79NTop6H7nvw
 oWNw1hhijEVsS6p4WRBqsEJUBFtCAMu7VAjpmFB3EXkSjvLv+eE9RlBEORx4dwfN39rr
 bvJMrv/HxY4MDlUCtlnE0FhUzku5QuNyGjB8AuLJn/+LhSbyYoAgzhBfHeY3eHgxhb0D
 2pHJhKNkq5zFAO/ivHsiDKS2+kzh6ps+cnBMkLgquFSz2HHWblq/hlabnAMO0U+AwnHQ
 8iGYxwyzWTNO6Qf/oLGvEf0pQjDIT26NVcBHzmVmRB1+IUTw4rIXFqtjUA51QCFa/VAX
 OxyA==
X-Gm-Message-State: AC+VfDyFTyc8Wo+V7tWnmRGt0WoGBm7K4apQL3bTNQ0hvFngZnicMLJy
 H+YXfdjOSZZQ7pSiZmgT6b078Q==
X-Google-Smtp-Source: ACHHUZ4iFrRTM8PObxaqSl3SWf3yJ3DQfdOVEwYZ4x8BW9seDxRuGv7X4OG8uoX/OTH8pDwEkMWAmg==
X-Received: by 2002:ac2:548e:0:b0:4f2:6656:d602 with SMTP id
 t14-20020ac2548e000000b004f26656d602mr980878lfk.9.1685613518782; 
 Thu, 01 Jun 2023 02:58:38 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a19ac08000000b004f1400630d3sm1037217lfc.35.2023.06.01.02.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 02:58:37 -0700 (PDT)
Message-ID: <4c565a7b-3041-e3f3-7174-282348b74575@linaro.org>
Date: Thu, 1 Jun 2023 11:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: add display port nodes
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230601-topic-sm8550-upstream-dp-v1-0-29efe2689553@linaro.org>
 <20230601-topic-sm8550-upstream-dp-v1-2-29efe2689553@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v1-2-29efe2689553@linaro.org>
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



On 1.06.2023 11:52, Neil Armstrong wrote:
> Add the Display Port controller subnode to the MDSS node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 89 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 75cd374943eb..73524afc2e3a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2495,6 +2495,13 @@ dpu_intf2_out: endpoint {
>  							remote-endpoint = <&mdss_dsi1_in>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp0_in>;
> +						};
> +					};
>  				};
>  
>  				mdp_opp_table: opp-table {
> @@ -2522,6 +2529,84 @@ opp-514000000 {
>  				};
>  			};
>  
> +			mdss_dp0: displayport-controller@ae90000 {
> +				compatible = "qcom,sm8550-dp", "qcom,sm8350-dp";
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
> +					      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd SM8550_CX>;
MMCX

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
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dp0_out: endpoint {
> +						};
> +					};
> +				};
> +
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-162000000 {
> +						opp-hz = /bits/ 64 <162000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
_d1

> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
low_svs

With these fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
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
>  				compatible = "qcom,sm8550-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae94000 0 0x400>;
> @@ -2705,8 +2790,8 @@ dispcc: clock-controller@af00000 {
>  				 <&mdss_dsi0_phy 1>,
>  				 <&mdss_dsi1_phy 0>,
>  				 <&mdss_dsi1_phy 1>,
> -				 <0>, /* dp0 */
> -				 <0>,
> +				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  				 <0>, /* dp1 */
>  				 <0>,
>  				 <0>, /* dp2 */
> 
