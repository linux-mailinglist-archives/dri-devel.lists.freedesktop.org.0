Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3A461134F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 15:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AFB10E835;
	Fri, 28 Oct 2022 13:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8349F10E830;
 Fri, 28 Oct 2022 13:44:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A79D5628A3;
 Fri, 28 Oct 2022 13:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F03C4FF10;
 Fri, 28 Oct 2022 13:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666964683;
 bh=LcKz3O85jBpORVzoqD8hoLCMY+nPoqxJwOLtUvB36iA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r37lpyLRxXnxvD0akaCLv34DqqisYLps+u/LHPs3w1mwog9eES0udif1wSfocOSZO
 pkVjJWtwjzvzG/BqCatD7SGYXYlDl7eLokaLMRIJVOLidhIQAJG1PF2+PsJSdGylgN
 RdRW6X8S647MQ/mQUOCXhH/KJBQajjjQX9rnuuH3HXKUFy9Hle646o8Wei9dIJr6q5
 cIWks98dOZAZ+SQJJi4e635yOhVT1rbiV/HM+urocmQbWlIcckPTZLOXbUb6iJqea5
 2ycHu9aZGRaupG7zF/1CobmpTaPSGOATqfWziSh1PwA3ZLaVtF8u8qxIkUMXO/O5sO
 DREHJfM+tVLLg==
Date: Fri, 28 Oct 2022 08:44:39 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1 6/9] arm64: dts: qcom: sm8350: Use 2 interconnect cells
Message-ID: <20221028134439.ugja55guopmql4nk@baldur>
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-7-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028120812.339100-7-robert.foss@linaro.org>
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 02:08:09PM +0200, Robert Foss wrote:
> Use two interconnect cells in order to optionally
> support a path tag.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 606fab087945..b6e44cd3b394 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1543,56 +1543,56 @@ apps_smmu: iommu@15000000 {
>  		config_noc: interconnect@1500000 {
>  			compatible = "qcom,sm8350-config-noc";
>  			reg = <0 0x01500000 0 0xa580>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;

You also need amend all the interconnects references with the additional
tag cell.

Regards,
Bjorn

>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
>  		mc_virt: interconnect@1580000 {
>  			compatible = "qcom,sm8350-mc-virt";
>  			reg = <0 0x01580000 0 0x1000>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
>  		system_noc: interconnect@1680000 {
>  			compatible = "qcom,sm8350-system-noc";
>  			reg = <0 0x01680000 0 0x1c200>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
>  		aggre1_noc: interconnect@16e0000 {
>  			compatible = "qcom,sm8350-aggre1-noc";
>  			reg = <0 0x016e0000 0 0x1f180>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
>  		aggre2_noc: interconnect@1700000 {
>  			compatible = "qcom,sm8350-aggre2-noc";
>  			reg = <0 0x01700000 0 0x33000>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
>  		mmss_noc: interconnect@1740000 {
>  			compatible = "qcom,sm8350-mmss-noc";
>  			reg = <0 0x01740000 0 0x1f080>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
>  		lpass_ag_noc: interconnect@3c40000 {
>  			compatible = "qcom,sm8350-lpass-ag-noc";
>  			reg = <0 0x03c40000 0 0xf080>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
>  		compute_noc: interconnect@a0c0000{
>  			compatible = "qcom,sm8350-compute-noc";
>  			reg = <0 0x0a0c0000 0 0xa180>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> @@ -2420,14 +2420,14 @@ usb_2_ssphy: phy@88ebe00 {
>  		dc_noc: interconnect@90c0000 {
>  			compatible = "qcom,sm8350-dc-noc";
>  			reg = <0 0x090c0000 0 0x4200>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
>  		gem_noc: interconnect@9100000 {
>  			compatible = "qcom,sm8350-gem-noc";
>  			reg = <0 0x09100000 0 0xb4000>;
> -			#interconnect-cells = <1>;
> +			#interconnect-cells = <2>;
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> -- 
> 2.34.1
> 
