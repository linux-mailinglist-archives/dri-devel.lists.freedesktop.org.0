Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAE29D6A5D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 17:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5386210E488;
	Sat, 23 Nov 2024 16:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UQ0s9NER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F331810E488
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 16:53:22 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53dd59a2bc1so1955783e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 08:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732380801; x=1732985601; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uGUPwF57lUpDM+09PDJEdBkBeZ3TV2DKEpTu1KqQPqA=;
 b=UQ0s9NERNdDpbFSFXpSDki6KLfFMeKSDZzmAuxb8YaltcaQR1aT6O7eksF6ncHYr7a
 YyghFRPDNFtFlUtsMpy/ArRJkgBSyAproqg+cL+taOnJY+DyUMUz9kgoI017aGpjqhnZ
 aaq2ZKAmVLnZkEEsqjswbDDVymJiPGKRXWLVyQveYC6+guB7TiLUN40aeFZtvRpqAi3M
 7D4986zK84Z5YuKtNPf2Z9JsLT3mkmqhVpUKkB7mNNYTlgG7rWll3w8aHN3AuzqBlXtz
 k45V9oBJDDongnooW4HlEhvNTV3BQGHnmBm+FI/Z11Fjs+PIIXPp2AQp9uaDzSW+cNuD
 A3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732380801; x=1732985601;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGUPwF57lUpDM+09PDJEdBkBeZ3TV2DKEpTu1KqQPqA=;
 b=gZd12DIXn7YtbityibhdyXT21Y32fWeY2LPv5pwzpTvdW/0YErE0K6ItGy/tTk18yn
 +luutAmZOydLoky2gfV9i+6ym0EvzlNuXRmRjt6T5osffPTuE81YtjN2EKKkmCIxrbs9
 LWcVsMYwBNEoiBuk0RaMazHXMm7joOVuhV1PI3svreZk0tsExlpRgu/lHmQCMSM0Vw1x
 fyPNSE6JmenojxSg4FhzIfyKJC1tfmxQknW2xYP+y3EgfMssYkKR+FugONWLT684nhfF
 TpQUj61JTk7JihUXesfdt/3a49AIwJlUlWaMjYvxMlrYYQJFSlnueb2dDT/LNgS1GDWT
 gztw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHn/DBE+KRnFAbCfGHDeI2LpQJVYZPytyalrLy19D8jyx0wk57c+6f4CoXB4ulJ0mH5OJ+AitjE2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKunTeRv2DedSoSKw3rJQmTAfAYZeftXd1pMWk3lduA3mUVCKz
 /A0NS9JNjzlrPtSJKwQGPiwU9pM7PGc6JwXarBfmJQk20RtlU4AA8s06MOVnAHOVS9OucCNSYcl
 w
X-Gm-Gg: ASbGnctv7rqhUmUKecIfWEEt2UCpPEtS6D7DG8q7Z19XesCNJh2lL+DU3SJN/ixei47
 6zVcy5sKtT691itF7EhIN2zL1EsrEbEctFWaMr0FzgD/eRM6bMp8DvvSQmkP71y53ER3bVAMnSa
 ipg8icwhnddXd01lQJPWpMG83aT0GvWVLBSIQ/iwmLeIAP1NAQW5hIbOWz+hPdyU3jF5PLlypUO
 1w8h43B742kwBo3BpZH/G2Ab6xIhqpWfwPi2el/31jhx0lcrrcW65ZVfQUPgmVqYxFqjqe5eVrO
 UZsDkMKECf67Z6j14+gaTdD+2wyDqw==
X-Google-Smtp-Source: AGHT+IEGUEUW/qjW1XWol/fb/+AKJJnBh0CubV0b0MiwHenTkb70vpQEXvskpJZN/kj1uuxbzT7hnA==
X-Received: by 2002:a05:6512:308b:b0:53d:de12:f344 with SMTP id
 2adb3069b0e04-53dde12f5acmr825645e87.9.1732380801124; 
 Sat, 23 Nov 2024 08:53:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2481424sm982082e87.133.2024.11.23.08.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 08:53:19 -0800 (PST)
Date: Sat, 23 Nov 2024 18:53:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: maud_spierings@hotmail.com
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
Message-ID: <si5njacaffc3iajhjqwtdfsouj4vrhzvdicp2tu4t32ra5d6xj@gsppoxpxw2xh>
References: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
 <20241123-asus_qcom_display-v2-4-a0bff8576024@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

On Sat, Nov 23, 2024 at 01:58:56PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
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
> +	bluetooth: bt_wcn7850 {
> +		compatible = "qcom,wcn7850-bt";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en_default>;
> +		enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +		max-speed = <3200000>;

Please describe the PMU as per the qualcomm-bluetooth.yaml

> +	};
> +};
> +
>  &usb_1_ss0_hsphy {
>  	vdd-supply = <&vreg_l3j_0p8>;
>  	vdda12-supply = <&vreg_l2j_1p2>;
> 
> -- 
> 2.47.0
> 
> 

-- 
With best wishes
Dmitry
