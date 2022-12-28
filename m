Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2A165727D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 05:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C3610E195;
	Wed, 28 Dec 2022 04:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FF810E193;
 Wed, 28 Dec 2022 04:17:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 346F2B8120C;
 Wed, 28 Dec 2022 04:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC78C433D2;
 Wed, 28 Dec 2022 04:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672201021;
 bh=SyZwAIfCIe+nPNd7fL8fQATUZCtF6aJlDxCufbaWZTc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JOAgldYrZRGkV0vejQ7l6WfCI9SO7cVjGTEwV5ArIu+bLURQMqt9RZ8lmBlo0RBox
 NNIiiZJLefSLR39n1TblsE213/6NM3kyej9S5GCCp+3Ws3JIVOjb8JrzdCWJWhOyjB
 F8QKKINiKpqGhYrufk9eeIxx6n1vj43gbUx+pz4jj+5GXxKJouJceXcOofL/ltRmJv
 RkccPlsljqu3iSNARhoh8Ztio2Xd5HjAcDHawEsrPuKIqhwmQValT+2uehK/Z5O4Ht
 pAZspM+2zLlyr52BatwyE5uvSopJO/JpI4aIqkhFcGBqDDp6PrMwQlnoc6lTAyAtzm
 nMjLm27ml4Teg==
Date: Tue, 27 Dec 2022 22:16:58 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8150: Add DISPCC node
Message-ID: <20221228041658.hpmlspnhm2ssinai@builder.lan>
References: <20221212093315.11390-1-konrad.dybcio@linaro.org>
 <20221212093315.11390-2-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212093315.11390-2-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 krzysztof.kozlowski@linaro.org, agross@kernel.org,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 12, 2022 at 10:33:13AM +0100, Konrad Dybcio wrote:
> Years after the SoC support has been added, it's high time for it to
> get dispcc going. Add the node to ensure that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index a0c57fb798d3..ff04397777f4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3579,6 +3579,32 @@ camnoc_virt: interconnect@ac00000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		dispcc: clock-controller@af00000 {
> +			compatible = "qcom,sm8150-dispcc";
> +			reg = <0 0x0af00000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
> +			clock-names = "bi_tcxo",
> +				      "dsi0_phy_pll_out_byteclk",
> +				      "dsi0_phy_pll_out_dsiclk",
> +				      "dsi1_phy_pll_out_byteclk",
> +				      "dsi1_phy_pll_out_dsiclk",
> +				      "dp_phy_pll_link_clk",
> +				      "dp_phy_pll_vco_div_clk";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +
> +			power-domains = <&rpmhpd SM8150_MMCX>;
> +			/* TODO: Maybe rpmhpd_opp_min_svs could work as well? */

The power-domain being not disabled should be sufficient for us to
access the dispcc. Beyond that votes would be needed for particular
frequencies, and that goes in the client nodes/opp-tables.

So you should be able to drop this comment and the required-opps.

Regards,
Bjorn

> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sm8150-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x400>;
> -- 
> 2.38.1
> 
