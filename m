Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F6746517A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A752D6E8CF;
	Wed,  1 Dec 2021 15:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4B96E970
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:23:36 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so14171962otu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 07:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9+xNJVk8HaWXrz0AyxQ/3VS9PEvSB6w7UJMIbnaoCx4=;
 b=Xy1CH92TddcQ/sbu1yk2gMq8epXWc8xm0RAWuszpNYrw24WQ88tlk5ucl9YH+NB8Zm
 OCaisjnB/qvFJioEQ4114EyarXUUjC0NNLhJW53iFHiF6r9RcVmofXsYzgBCQYozxQSI
 khng6Y1I+pQ5d5bgHbkf7Tr2Vsks5QssTp7b3IwVbp971VzP1Hl3R69nx+2ZnBtVZmZW
 q7b2D8A/vsrU0JkTScW1A7iaVr7jtNnfMNDBAEmPG+lsTwN3N75ygAN3zhL8WmJCS622
 y57YIwX8T/i2LcNjSjJCWmRQIESkytKTxk2PuWYRveSfX+/1hb0GOVxCs7BNJx9Veq8y
 9EMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9+xNJVk8HaWXrz0AyxQ/3VS9PEvSB6w7UJMIbnaoCx4=;
 b=1ujHQFC4KYeAb4K/m0vuDefcxXDJUUpE1++IVdc23Mla38o6qdCBifVpYrTdrD3SGD
 OPiDzBkrtnssxmKccg2mMNzeIpHuEhA/qvr+VXOgxh57NikWQQ1Ua6ZExAvFQ+rr+2VZ
 mR+Y2Fc38UZIDyL+5fmW5kCIOjI4xWEKSYKxqnURkw420LXgO24g/RW1qXBZ9RcPCGAX
 cXXbtNJwFgJVagRpwqDMhpAqB8Dve3BIKt+BeJ2YMmjt3kzwZfPPaIYJlIxIzr0ZygUl
 7t2jykccE2AGu95xPuJSUZ1ko7XNuJtD8mAaG/2APehVH/SmhQ+kY/RsdPgnwa7GfN5T
 S1lg==
X-Gm-Message-State: AOAM531OnwMGls2wYNOHFoMSYUsqwPMV84qzuMzMGTK3eZH8kTr+vkny
 TaKtxy2JOWCUS6YAK0KICm36Eg==
X-Google-Smtp-Source: ABdhPJwroTxLQszV8WreruCOvQLv3di1HHM7v1yitiEuvrBNj3Ia6KwKOOw3SuNlqkZzq+8iWr5nJg==
X-Received: by 2002:a9d:373:: with SMTP id 106mr6293793otv.127.1638372215677; 
 Wed, 01 Dec 2021 07:23:35 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g1sm4449ooq.2.2021.12.01.07.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:23:35 -0800 (PST)
Date: Wed, 1 Dec 2021 09:23:30 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: sc7280: Add Display Port node
Message-ID: <YaeTckalY6BZJqdb@builder.lan>
References: <1637580555-1079-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637580555-1079-1-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org, dianders@chromium.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Kuogee Hsieh <khsieh@codeaurora.org>, robh+dt@kernel.org,
 agross@kernel.org, seanpaul@chromium.org, quic_mkrishn@quicinc.com,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 22 Nov 05:29 CST 2021, Sankeerth Billakanti wrote:

> From: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

Can you please update this to make From: and Signed-off-by: match.


Also I don't know how you prepared this patch series, because this says
patch 4/4, but it's not part of the same series as the other patches.

I did pick up the first  3 patches, but then noticed that you are back
at using the original labels, so please see below and send all 4 patches
in a proper series.

> ---
> 
> Changes in v4:
>     - Add the patch to display DT change series (Bjorn Andersson)
>     - Remove the trailing whitespaces
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 90 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 5ad500e..0b2ffd5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2693,8 +2693,8 @@
>  				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>  				 <&dsi_phy 0>,
>  				 <&dsi_phy 1>,
> -				 <0>,
> -				 <0>,
> +				 <&dp_phy 0>,
> +				 <&dp_phy 1>,
>  				 <&edp_phy 0>,
>  				 <&edp_phy 1>;
>  			clock-names = "bi_tcxo",
> @@ -2791,6 +2791,13 @@
>  							remote-endpoint = <&edp_in>;
>  						};
>  					};
> +
> +					port@2 {
> +                                                reg = <2>;
> +                                                dpu_intf0_out: endpoint {
> +                                                        remote-endpoint = <&dp_in>;
> +                                                };
> +                                        };
>  				};
>  
>  				mdp_opp_table: opp-table {
> @@ -3002,6 +3009,79 @@
>  
>  				status = "disabled";
>  			};
> +
> +			msm_dp: displayport-controller@ae90000 {

As requested previously, can you please label this mdss_dp, to make it
sort nicely in the dts?

Thanks,
Bjorn

> +				compatible = "qcom,sc7280-dp";
> +
> +				reg = <0 0x0ae90000 0 0x1400>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +				clock-names =	"core_iface",
> +						"core_aux",
> +						"ctrl_link",
> +						"ctrl_link_iface",
> +						"stream_pixel";
> +				#clock-cells = <1>;
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
> +				phys = <&dp_phy>;
> +				phy-names = "dp";
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd SC7280_CX>;
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					port@0 {
> +						reg = <0>;
> +						dp_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dp_out: endpoint { };
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
>  		};
>  
>  		pdc: interrupt-controller@b220000 {
> @@ -3104,6 +3184,12 @@
>  				bias-pull-up;
>  			};
>  
> +			dp_hot_plug_det: dp-hot-plug-det {
> +				pins = "gpio47";
> +				function = "dp_hot";
> +				bias-disable;
> +                        };
> +
>  			qspi_clk: qspi-clk {
>  				pins = "gpio14";
>  				function = "qspi_clk";
> -- 
> 2.7.4
> 
