Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481C99D6A33
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 17:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06F110E483;
	Sat, 23 Nov 2024 16:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Dy7Be1X9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E9810E483
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 16:35:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8BFBE5C561A;
 Sat, 23 Nov 2024 16:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2337AC4CECD;
 Sat, 23 Nov 2024 16:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732379705;
 bh=LSC+296eaCcRWoAQlKto1Dt7qRuEDTSbc/MEcKKwOm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dy7Be1X9vO6UhYEQiyxyN8wmUAjyBZsC62gv/GMPvQt2+/RYpZaTTgko10yk1wKuL
 v5nlug+eq02tgXA6HrZFl1Ii1elQ5MmZMCMp8Zu8Yq/6zaiTB8Jeiw6j5mc0RMiP6P
 8VOBA0ANFlZD0WzuuEIW4pip3GZ5zmBMVr1hV2jp/embmjQNrBFRXbzwM8kK93T0Jh
 6h8p42NoZgTvh650fHW6dC0kxZiZON+7Zdlk8KA67+A3tWY3pBdgrGL7s3tyTWl6aR
 Zsht0jGWtTYUbM2xW0h0E5G0umQD8JzM7CT6MpHlQWchUBDVCo/gVuvw57OMi7t/j/
 nIoXQN3dgiK3w==
Date: Sat, 23 Nov 2024 17:35:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-vivobook-s15: Add
 bluetooth
Message-ID: <qr2kblpejiif3y3hnyvsidso5plemeh2mkyf2xjzcprhiwohlo@itd5uiok63w4>
References: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
 <20241123-asus_qcom_display-v2-4-a0bff8576024@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241123-asus_qcom_display-v2-4-a0bff8576024@hotmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 23, 2024 at 01:58:56PM +0100, Maud Spierings wrote:
> Add bluetooth for the asus vivobook s15
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> index d0bee4b6fc0be6fe40d335f4d50dde495853b315..caf7509692db84c69ad375b5dd07054ac0adcb52 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -18,6 +18,11 @@ / {
>  	compatible = "asus,vivobook-s15", "qcom,x1e80100";
>  	chassis-type = "laptop";
>  
> +	aliases {
> +		serial0 = &uart21;
> +		serial1 = &uart14;
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		pinctrl-0 = <&hall_int_n_default>;
> @@ -545,6 +550,14 @@ &tlmm {
>  			       <44 4>, /* SPI (TPM) */
>  			       <238 1>; /* UFS Reset */
>  
> +	bt_en_default: bt-en-sleep {
> +		pins = "gpio116";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;
> +		qcom,drive-strength = <16>;

Hm? There is no such property for TLMM. Which node is it?

> +	};
> +
>  	edp_reg_en: edp-reg-en-state {
>  		pins = "gpio70";
>  		function = "gpio";
> @@ -624,6 +637,17 @@ tpad_default: tpad-default-state {
>  	};
>  };
>  
> +&uart14 {
> +	status = "okay";

Missing blank line

> +	bluetooth: bt_wcn7850 {

Underscores are not allowed in node names.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Best regards,
Krzysztof

