Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE1E61139D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 15:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A2A10E83E;
	Fri, 28 Oct 2022 13:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E00410E83D;
 Fri, 28 Oct 2022 13:51:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6CAB3B82A3B;
 Fri, 28 Oct 2022 13:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241EEC433C1;
 Fri, 28 Oct 2022 13:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666965115;
 bh=8LGyRSk3SzWLea/SocQw2KYwe2/s43N0zn66ZL8tl3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ocZDdUVBp9IQpEIWrO89mtv1ATbEs0Eyw3QCvjwXDwKu8rEU585hPJeUPquXYXb0c
 E1ryS39iHtVvHHnYXb/kiTKxA7NJ6UETpmJtRBvXEZ4T/Q6d+Gey3Vzl7lNC98/Zw3
 ONWGqUtio6PeKcJOYunHWtjntQ27XotjpZTnmq+xv+8Buswq0rskVxviWz8/+jQbQX
 EMPPcjBqs1Zb//8p4dN0O8+DDI4iXPYFNxUHsH63yU8UnYB2Em2bN49ZCD+SxqCL5t
 u0B1hxwIRwUkPK4nx9KbCfBJD8fuHINT0cao8JGLnfnONuGhoYOij79HlELi1ZB6mj
 IFD/F/zqBUjZg==
Date: Fri, 28 Oct 2022 08:51:51 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1 8/9] arm64: dts: qcom: sm8350-hdk: Enable display &
 dsi nodes
Message-ID: <20221028135150.6rkih4d67trs23h4@baldur>
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-9-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028120812.339100-9-robert.foss@linaro.org>
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

On Fri, Oct 28, 2022 at 02:08:11PM +0200, Robert Foss wrote:
> Enable the display subsystem and the dsi0 output for
> the sm8350-hdk board.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index e6deb08c6da0..6e07feb4b3b2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -213,10 +213,32 @@ &cdsp {
>  	firmware-name = "qcom/sm8350/cdsp.mbn";
>  };
>  
> +&dispcc {
> +	status = "okay";
> +};
> +
> +&dsi0 {

If you prefix the label for the dsi controller and phy with mdss_ they
sort nicely together with the other display nodes.

Regards,
Bjorn

> +	status = "okay";
> +	vdda-supply = <&vreg_l6b_1p2>;
> +};
> +
> +&dsi0_phy  {
> +	status = "okay";
> +	vdds-supply = <&vreg_l5b_0p88>;
> +};
> +
>  &gpi_dma1 {
>  	status = "okay";
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_mdp {
> +	status = "okay";
> +};
> +
>  &mpss {
>  	status = "okay";
>  	firmware-name = "qcom/sm8350/modem.mbn";
> -- 
> 2.34.1
> 
