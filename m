Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F21717783
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 09:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EC410E483;
	Wed, 31 May 2023 07:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 717 seconds by postgrey-1.36 at gabe;
 Tue, 30 May 2023 19:24:54 UTC
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FDF10E40D;
 Tue, 30 May 2023 19:24:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1685473973; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=qU7DNAy+pcGWmhjuiAm9kRZRamd3CjaN4FZNo9xxupruZsjDBjvzGYUulmhex1Zlwp
 DOiZ4qkHMR/aQpg2cu0cRw20HEyDKlNDudjwV+BGS/gjuN9rUd2pllHPAADyp9DAEgSY
 htpHb/Va2PtU8Z5jl4OlABXcLf3Ii9niXp55rSKDaqyelj8Q+1ZlB3gjIt/0RGdKCY6Y
 msD/Hql5puJ3ip7ltNIILq8P5PBiVq/L0zjFu3QoLgXMXbsjAvoPJb0w9/TxmAs0v2Bc
 kfqzMJ1IYgz6CskDpEtINT8vQsL6LcawSHipczl9zx0gY8zdJLJqLRhZiJ280SfBRzfp
 t0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685473973;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=SWANTZ5LEi/i+/1OmwNVpeU8Q7B6L98dYRwCag1X3IU=;
 b=I/X0CW8WhEp2A4za5NpiYhBoom9IHdgSls/ubMEOPaT8J1rbLK3S1KeSPh9/cdkImH
 Mc8Gtpp5K7lG02FNrycaMZHZZneNAaamPSrI3sLh3NStwALNiYBo6Ba6gzeVo48veVVv
 N5jF3q9VoQqQkomhORZllXoV/2IWine2tS9h2wO8CB+tepaYN5KpXU+NufA+68ihYoGw
 cujGTpWNvsslgYNFMWeB28bjgScQ4WGRPHD8ST6PW5hl9eYrF+7T46DPoFYNxtfZNSe4
 7iMTZcmRrH7j8YkVp4sBWi4RRA4b9+tJtwumAF2NhFfz8kAZp4PuRDdb9TRFjh3WBYqE
 GTrw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685473973;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=SWANTZ5LEi/i+/1OmwNVpeU8Q7B6L98dYRwCag1X3IU=;
 b=FP15hFHt7bpGY5RHvuIydONPTqUWgn24aeD7J7cIsVVjJXLrUejy1YuCBUDpJevVXz
 rPBRIk/7SgXG2EaWgrXi0HBJVyZ7muRUNHrCjJhuyeCCi31FNHu8r9kcSGXq+Uh2H+qE
 CaYRYiiwjsGhO0zC4y5I2XPVjzAeRPWjr2MNaunRs9YQpWYliWqoYHmc5At14PMNm8Kx
 Xphp8uejnz0yblvdUpE7iYSL45VJuH5lT/g2uZXqGKgIgVAgj3qFjZZxaVcMtQWp00CU
 00mW+9EyixBVFTDmsODxP1yOZ5bsRMtTO+bofUgdoFf9drpApWxf5CShK7feZklkUKNl
 YxIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685473973;
 s=strato-dkim-0003; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=SWANTZ5LEi/i+/1OmwNVpeU8Q7B6L98dYRwCag1X3IU=;
 b=0vKC/pbXCFw865TKgWIbeMWtQkGyD0pg9Z0RZOOHqaY3uiXaPDPu+L1OTpT1tORz68
 RTtLOfqc4pWs5wpougBg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA95nh"
Received: from gerhold.net by smtp.strato.de (RZmta 49.4.0 DYNA|AUTH)
 with ESMTPSA id j6420az4UJCqjnU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 30 May 2023 21:12:52 +0200 (CEST)
Date: Tue, 30 May 2023 21:12:46 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH v2 7/7] ARM: dts: qcom: msm8226: Add mdss nodes
Message-ID: <ZHZKriRXoh9gHpWg@gerhold.net>
References: <20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz>
 <20230308-msm8226-mdp-v2-7-e005b769ee28@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308-msm8226-mdp-v2-7-e005b769ee28@z3ntu.xyz>
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 31 May 2023 07:06:45 +0000
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
 devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 30, 2023 at 08:24:17PM +0200, Luca Weiss wrote:
> Add the nodes that describe the mdss so that display can work on
> MSM8226.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Can you update this to use labels like in [1]? See inline below.
This will allow proper grouping of the labels in the board DT.

Thanks,
Stephan

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=835f939501769253eb7eb2dc5389b8592a63a3ed

> ---
>  arch/arm/boot/dts/qcom-msm8226.dtsi | 127 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
> index 42acb9ddb8cc..c794f5ece1d1 100644
> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -636,6 +636,133 @@ smd-edge {
>  				label = "lpass";
>  			};
>  		};
> +
> +		mdss: display-subsystem@fd900000 {
> +			compatible = "qcom,mdss";
> +			reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
> +			reg-names = "mdss_phys", "vbif_phys";
> +
> +			power-domains = <&mmcc MDSS_GDSC>;
> +
> +			clocks = <&mmcc MDSS_AHB_CLK>,
> +				 <&mmcc MDSS_AXI_CLK>,
> +				 <&mmcc MDSS_VSYNC_CLK>;
> +			clock-names = "iface",
> +				      "bus",
> +				      "vsync";
> +
> +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			status = "disabled";
> +
> +			mdp: display-controller@fd900000 {

			mdss_mdp:

> +				compatible = "qcom,msm8226-mdp5", "qcom,mdp5";
> +				reg = <0xfd900100 0x22000>;
> +				reg-names = "mdp_phys";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;
> +
> +				clocks = <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_AXI_CLK>,
> +					 <&mmcc MDSS_MDP_CLK>,
> +					 <&mmcc MDSS_VSYNC_CLK>;
> +				clock-names = "iface",
> +					      "bus",
> +					      "core",
> +					      "vsync";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdp5_intf1_out: endpoint {

						mdss_mdp_intf1_out:

> +							remote-endpoint = <&dsi0_in>;
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi0: dsi@fd922800 {

			mdss_dsi0:

> +				compatible = "qcom,msm8226-dsi-ctrl",
> +					     "qcom,mdss-dsi-ctrl";
> +				reg = <0xfd922800 0x1f8>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
> +
> +				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
> +						  <&mmcc PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&dsi_phy0 0>,
> +							 <&dsi_phy0 1>;
> +
> +				clocks = <&mmcc MDSS_MDP_CLK>,
> +					 <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_AXI_CLK>,
> +					 <&mmcc MDSS_BYTE0_CLK>,
> +					 <&mmcc MDSS_PCLK0_CLK>,
> +					 <&mmcc MDSS_ESC0_CLK>,
> +					 <&mmcc MMSS_MISC_AHB_CLK>;
> +				clock-names = "mdp_core",
> +					      "iface",
> +					      "bus",
> +					      "byte",
> +					      "pixel",
> +					      "core",
> +					      "core_mmss";
> +
> +				phys = <&dsi_phy0>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi0_in: endpoint {

						mdss_dsi0_in:

> +							remote-endpoint = <&mdp5_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi0_out: endpoint {

						mdss_dsi0_out:

> +						};
> +					};
> +				};
> +			};
> +
> +			dsi_phy0: phy@fd922a00 {

			mdss_dsi0_phy:

> +				compatible = "qcom,dsi-phy-28nm-8226";
> +				reg = <0xfd922a00 0xd4>,
> +				      <0xfd922b00 0x280>,
> +				      <0xfd922d80 0x30>;
> +				reg-names = "dsi_pll",
> +					    "dsi_phy",
> +					    "dsi_phy_regulator";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&mmcc MDSS_AHB_CLK>,
> +					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +				clock-names = "iface",
> +					      "ref";
> +			};
> +		};
>  	};
>  
>  	timer {
> 
> -- 
> 2.40.1
> 
