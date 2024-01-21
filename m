Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F08835833
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 23:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4501710E2EB;
	Sun, 21 Jan 2024 22:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 590 seconds by postgrey-1.36 at gabe;
 Sun, 21 Jan 2024 22:26:43 UTC
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D8810E2E9
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 22:26:41 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 101771FF15;
 Sun, 21 Jan 2024 23:16:42 +0100 (CET)
Date: Sun, 21 Jan 2024 23:16:40 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Adam Skladowski <a39.skl@gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: msm8976: Declare and wire SDC pins
Message-ID: <umllfip5rqeo5q65jbvdpisy5yaxpl54j4zdhi2hisdha5da4y@lwf2mjxuhiga>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>, 
 Adam Skladowski <a39.skl@gmail.com>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240121194221.13513-1-a39.skl@gmail.com>
 <20240121194221.13513-8-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240121194221.13513-8-a39.skl@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Andy Gross <agross@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-01-21 20:41:05, Adam Skladowski wrote:
> Declare pinctrls for SDC pins and wire them to consumers.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Where'd the original sign-offs go?

https://lore.kernel.org/linux-arm-msm/20221214232049.703484-1-marijn.suijten@somainline.org/

Thanks taking taking care of this SoC though.  My SM8976 Suzu device finally
emitted the magic smoke after rebasing on the latest MSM8976 patches, and will
need board repairs or a replacement before patches can be tested again :(

- Marijn

> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 100 ++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index 765c90ac14cb..5a7be93a0115 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -771,6 +771,96 @@ blsp2_i2c4_sleep: blsp2-i2c4-sleep-state {
>  				drive-strength = <2>;
>  				bias-disable;
>  			};
> +
> +			sdc1_default: sdc1-default-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					drive-strength = <16>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc1_cmd";
> +					drive-strength = <10>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc1_data";
> +					drive-strength = <10>;
> +					bias-pull-up;
> +				};
> +
> +				rclk-pins {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc1_sleep: sdc1-sleep-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc1_cmd";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc1_data";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				rclk-pins {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc2_default: sdc2-default-state {
> +				clk-pins {
> +					pins = "sdc2_clk";
> +					drive-strength = <16>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc2_cmd";
> +					drive-strength = <10>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc2_data";
> +					drive-strength = <10>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			sdc2_sleep: sdc2-sleep-state {
> +				clk-pins {
> +					pins = "sdc2_clk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc2_cmd";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc2_data";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
>  		};
>  
>  		gcc: clock-controller@1800000 {
> @@ -1246,6 +1336,11 @@ sdhc_1: mmc@7824900 {
>  				 <&gcc GCC_SDCC1_APPS_CLK>,
>  				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
>  			clock-names = "iface", "core", "xo";
> +
> +			pinctrl-0 = <&sdc1_default>;
> +			pinctrl-1 = <&sdc1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
>  			status = "disabled";
>  		};
>  
> @@ -1262,6 +1357,11 @@ sdhc_2: mmc@7864900 {
>  				 <&gcc GCC_SDCC2_APPS_CLK>,
>  				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
>  			clock-names = "iface", "core", "xo";
> +
> +			pinctrl-0 = <&sdc2_default>;
> +			pinctrl-1 = <&sdc2_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
>  			status = "disabled";
>  		};
>  
> -- 
> 2.43.0
> 
