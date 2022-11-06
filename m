Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C8E61E043
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 05:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECB110E202;
	Sun,  6 Nov 2022 04:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFAD10E200;
 Sun,  6 Nov 2022 04:30:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7132FB80690;
 Sun,  6 Nov 2022 04:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A597C433C1;
 Sun,  6 Nov 2022 04:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667709014;
 bh=zrkn1G+w9Wm/7JS5FLoHzU9ltDXv9SgNtssolctSshw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JTlEEyeCq+jdsxB6DGbRvgG6hh9j0gwEOJDZRkFOSyWdc/wmIU3e/PlvQlMeGQcZW
 +1/mv85O3GiEh0ixlGFdOzNUH0cK0Ah9hrFOkp7wDxKlWmBFDU3SVR+5+vtmAZ4iku
 LDgIIhDmiWvCffgOT8hjBCNJXfbEGIhoKIVNSUOpdwRJLlp18fvZn5s35Xxxu2Wn3Z
 m4mXS15QD4jU+zWZIxgswsNH/CMexPDpNjFGOTe0w1i0iC1A5xdCbgBYomeigJvjC/
 FsAJYFdtP5iqdlEsqMl0YDqE0EP1GACqfiR6kBCoogo9+J+ZW3yPAjKy8NLJaygEfv
 uKo3apx6NNCsA==
Date: Sat, 5 Nov 2022 23:30:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v1 3/5] arm64: dts: qcom: sm8450-hdk: enable display
 hardware
Message-ID: <20221106043011.pw5fqeame7otzdcn@builder.lan>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104131358.1025987-4-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 04, 2022 at 04:13:56PM +0300, Dmitry Baryshkov wrote:
> Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
> configuration (yet).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index 38ccd44620d0..e1a4cf1ee51d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -442,3 +442,21 @@ &usb_1_qmpphy {
>  	vdda-phy-supply = <&vreg_l6b_1p2>;
>  	vdda-pll-supply = <&vreg_l1b_0p91>;
>  };
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_mdp {
> +	status = "okay";
> +};
> +
> +&dsi0 {

Please prefix the labels with "mdss_" so that you can keep them sorted
alphabetically.

THanks,
Bjorn

> +	status = "okay";
> +	vdda-supply = <&vreg_l6b_1p2>;
> +};
> +
> +&dsi0_phy {
> +	status = "okay";
> +	vdds-supply = <&vreg_l5b_0p88>;
> +};
> -- 
> 2.35.1
> 
