Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC60C6F246F
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 13:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B97E10E150;
	Sat, 29 Apr 2023 11:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at gabe;
 Sat, 29 Apr 2023 11:20:34 UTC
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238F110E150
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 11:20:34 +0000 (UTC)
Received: from g550jk.localnet (unknown [62.108.10.64])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 9293DC76D6;
 Sat, 29 Apr 2023 11:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1682766853; bh=A8QySs6SKhnXKBxkO0+a10Q3xy1UQlrC6oSknuRX0p0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=U7zokl7PwDhkg2mUuKqWuwfT1MxrzqVZ/5hi6RDzgNWum9wURWdBcStFGLcfBVMY8
 UaDtySh/ktQAX2Bj61orQkqqmlcte/2DFaVZsjjcp4LVEPFIEio70LtCzx+VEJ1/eZ
 gUtBK5DhbsU6wGkMv9uelFv8KytbxGpGtKzr0API=
From: Luca Weiss <luca@z3ntu.xyz>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] ARM: dts: adapt to LP855X bindings changes
Date: Sat, 29 Apr 2023 13:14:12 +0200
Message-ID: <3414865.QJadu78ljV@z3ntu.xyz>
In-Reply-To: <20230429104534.28943-4-aweber.kernel@gmail.com>
References: <20230429104534.28943-1-aweber.kernel@gmail.com>
 <20230429104534.28943-4-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, linux-pwm@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Samstag, 29. April 2023 12:45:33 CEST Artur Weber wrote:
> Change underscores in ROM node names to dashes, and remove deprecated
> pwm-period property.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Reviewed-by: Luca Weiss <luca@z3ntu.xyz>

> ---
>  .../dts/qcom-apq8026-samsung-matisse-wifi.dts |  1 -
>  ...-msm8974pro-sony-xperia-shinano-castor.dts | 23 ++++++++++---------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
> b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts index
> 91b860e24681..884d99297d4c 100644
> --- a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
> +++ b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
> @@ -99,7 +99,6 @@ backlight@2c {
> 
>  			dev-ctrl = /bits/ 8 <0x80>;
>  			init-brt = /bits/ 8 <0x3f>;
> -			pwm-period = <100000>;
> 
>  			pwms = <&backlight_pwm 0 100000>;
>  			pwm-names = "lp8556";
> diff --git
> a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts index
> 04bc58d87abf..2396253f953a 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> @@ -150,47 +150,48 @@ lp8566_wled: backlight@2c {
>  		bl-name = "backlight";
>  		dev-ctrl = /bits/ 8 <0x05>;
>  		init-brt = /bits/ 8 <0x3f>;
> -		rom_a0h {
> +
> +		rom-a0h {
>  			rom-addr = /bits/ 8 <0xa0>;
>  			rom-val = /bits/ 8 <0xff>;
>  		};
> -		rom_a1h {
> +		rom-a1h {
>  			rom-addr = /bits/ 8 <0xa1>;
>  			rom-val = /bits/ 8 <0x3f>;
>  		};
> -		rom_a2h {
> +		rom-a2h {
>  			rom-addr = /bits/ 8 <0xa2>;
>  			rom-val = /bits/ 8 <0x20>;
>  		};
> -		rom_a3h {
> +		rom-a3h {
>  			rom-addr = /bits/ 8 <0xa3>;
>  			rom-val = /bits/ 8 <0x5e>;
>  		};
> -		rom_a4h {
> +		rom-a4h {
>  			rom-addr = /bits/ 8 <0xa4>;
>  			rom-val = /bits/ 8 <0x02>;
>  		};
> -		rom_a5h {
> +		rom-a5h {
>  			rom-addr = /bits/ 8 <0xa5>;
>  			rom-val = /bits/ 8 <0x04>;
>  		};
> -		rom_a6h {
> +		rom-a6h {
>  			rom-addr = /bits/ 8 <0xa6>;
>  			rom-val = /bits/ 8 <0x80>;
>  		};
> -		rom_a7h {
> +		rom-a7h {
>  			rom-addr = /bits/ 8 <0xa7>;
>  			rom-val = /bits/ 8 <0xf7>;
>  		};
> -		rom_a9h {
> +		rom-a9h {
>  			rom-addr = /bits/ 8 <0xa9>;
>  			rom-val = /bits/ 8 <0x80>;
>  		};
> -		rom_aah {
> +		rom-aah {
>  			rom-addr = /bits/ 8 <0xaa>;
>  			rom-val = /bits/ 8 <0x0f>;
>  		};
> -		rom_aeh {
> +		rom-aeh {
>  			rom-addr = /bits/ 8 <0xae>;
>  			rom-val = /bits/ 8 <0x0f>;
>  		};




