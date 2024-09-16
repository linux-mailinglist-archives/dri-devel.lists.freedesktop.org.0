Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F476979E1F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 11:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8560E10E319;
	Mon, 16 Sep 2024 09:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ojSHmGni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4A410E319
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 09:15:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7FF80A41964;
 Mon, 16 Sep 2024 09:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BD4C4CEC4;
 Mon, 16 Sep 2024 09:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726478120;
 bh=fnAPuBUu0/tTI7HoyZunJlTeMOKUsprJK+29sxMVwYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ojSHmGni3OGFIo7vnOCzqgHL0on0uhCTGQ91p/OyZ0gOs3O7l6ZurMGkGXB7dVVAF
 CwxpFZxFfb2CIuVFDU9gKjMofYfKcsmxS84cZ6o9ExrXvt3sCQDJCpTBwhKkXmngK/
 XVNyaKI5TXDzaxQXCBUtpsouMDwuTe/6jhKRNHZxY80MiRjXgwZAH0aiSg7E0iM6/A
 FTkSBqwe4qQLxbg8vdiwOaW16KvQ9ejeSGamh875/C1zPnXt3lSZ5OpNtX5aP3308I
 rgHfQkOIX839Icqxqkq5O2znrKoJSx9EZl96CGAYEWDDar5BgxxH1KM5gO+4nxYUqE
 lPhQQYLL3sSiw==
Date: Mon, 16 Sep 2024 11:15:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Simona Vetter <simona@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 23/27] arm64: dts: qcom: starqltechn: add display PMIC
Message-ID: <rfoxnd4axyqxvexgq3mm2zntzvpihv4g424hepkoh7bfr2izjz@htjeqbfuq2gu>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-23-2d2efd5c5877@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-23-2d2efd5c5877@gmail.com>
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

On Fri, Sep 13, 2024 at 06:08:06PM +0300, Dzmitry Sankouski wrote:
> Add support for s2dos05 display / touchscreen PMIC
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index 865253d8f0c7..5e5684f84ffb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -39,6 +39,9 @@ framebuffer: framebuffer@9d400000 {
>  			height = <2960>;
>  			stride = <(1440 * 4)>;
>  			format = "a8r8g8b8";
> +			vci-supply = <&s2dos05_ldo4>;
> +			vddr-supply = <&s2dos05_buck1>;
> +			vdd3-supply = <&s2dos05_ldo1>;
>  		};
>  	};
>  
> @@ -101,6 +104,66 @@ key-wink {
>  		};
>  	};
>  
> +	i2c21 {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm 127 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
> +		i2c-gpio,delay-us = <2>;
> +		pinctrl-0 = <&i2c21_sda_state &i2c21_scl_state>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmic@60 {
> +			compatible = "samsung,s2dos05";
> +			reg = <0x60>;
> +
> +			regulators {
> +				s2dos05_ldo1: ldo1 {
> +					regulator-active-discharge = <1>;
> +					regulator-enable-ramp-delay = <12000>;
> +					regulator-min-microvolt = <1500000>;
> +					regulator-max-microvolt = <2000000>;
> +					regulator-name = "s2dos05-ldo1";

Useless name. Please use rather names from the schematics, but I guess
you might not have them, so maybe downstream has reasonable name?

Best regards,
Krzysztof

