Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEA67E7C6C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 14:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D365310E043;
	Fri, 10 Nov 2023 13:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931B410E043
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 13:14:26 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5446c9f3a77so3469973a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 05:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699622065; x=1700226865; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p9JHns6zyKkZ5RtdPvtlBA1z5tFdRVVt9Vp5AUAZ8X8=;
 b=pwVivaOSE7SFJ0vyArkaeUQEBkhyWWVel52KE0Jvzp9WLHMHQCzsJ8EkywfqgKn2I4
 FsFeQx/a4Eom3SqGn/ktcGmIpnqoZQYAB7ByhGnxnlEr1F92ejTfx3FEb5urvYNWP58P
 iYCS4gh6PNGoQf2Xs1NC/E03hMDnRY7a2v2iHfCisdZ/pOu+OqVARGBjcuOKpJZuXiQA
 QyOPornpI1wluA4TBWc2zeufeQtKKjpgSGKuOLbmGVbZuNHO9S9WDqKdf1wr0BdWbwVT
 OdmbizW9YY3tKiUKs8QqcrXkfF9ty89Kx6oRvRGyqWgfaQQcz7HxDC3MvD82hWzjQMdg
 sjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699622065; x=1700226865;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p9JHns6zyKkZ5RtdPvtlBA1z5tFdRVVt9Vp5AUAZ8X8=;
 b=loSeKCUGNUVjygo2NW1e1aFAUU5TyK5esgST4F+A8dx66MtQKX0/oeuyzdMZZiqpDR
 pNUt2XgwUZqwzex5DkM5H5cutFmn3pfP7gl1/AAIDZqhlSyebRAVTCZ4Mub0q70oLw8O
 AnUO9akhtzgQ9D/3tqRBB4YHhlqeFx9IZoqoYgFX7NS32969G55zs7/bSz0RhFqmBwXF
 Kyoi3Kjxn0rarvY7dy6GRousflA+nJXGlUsRL2XhGcW3/gKrBe2IJzV0uwEm95xGxm72
 1lJErps+fLPpu8hCKea4dADMpuRziVX9UK274WZfMAv2Us3aPg5GtSESJiSvoWWAbSSy
 V0Ig==
X-Gm-Message-State: AOJu0YynsGXk5LsfNOrEjVMz97XykilZUQWqXoWLMk7Vxoo8RkxWUKJr
 cSt7XkmFdxLCPcsb4hHETmHpLQ==
X-Google-Smtp-Source: AGHT+IFHLIhkk5Fhis0pSnaEPm4kr+9yKb63zrJPfV3HV+9ueyhy789I+teQbGDTSDLBdCHJVblrcQ==
X-Received: by 2002:a17:907:7ea9:b0:9c6:10d4:d09f with SMTP id
 qb41-20020a1709077ea900b009c610d4d09fmr7961509ejc.63.1699622065013; 
 Fri, 10 Nov 2023 05:14:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a170906841600b009b27d4153c0sm3938708ejx.178.2023.11.10.05.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 05:14:24 -0800 (PST)
Message-ID: <15be209c-753d-469b-a7c4-7403c7745a9f@linaro.org>
Date: Fri, 10 Nov 2023 14:14:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/4] arm64: dts: rockchip: add Powkiddy RK2023
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
References: <20231109215007.66826-1-macroalpha82@gmail.com>
 <20231109215007.66826-5-macroalpha82@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231109215007.66826-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2023 22:50, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Powkiddy RK2023. The Powkiddy RK2023 is a handheld
> gaming device with a 3.5 inch screen powered by the Rockchip RK3566
> SoC. The device is almost identical to the Anbernic RG353P except it
> lacks eMMC, a function button, a touch screen, no UART headers on the
> board, and the panel has slightly different timings.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3566-powkiddy-rk2023.dts   | 161 ++++++++++++++++++
>  2 files changed, 162 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index a18f33bf0c0e..f969618da352 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg503.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.1.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rgb30.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rk2023.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-a.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-b.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-radxa-cm3-io.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
> new file mode 100644
> index 000000000000..5740412f6b2b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include "rk3566-anbernic-rg353x.dtsi"
> +
> +/ {
> +	model = "RK2023";
> +	compatible = "powkiddy,rk2023", "rockchip,rk3566";
> +
> +	aliases {
> +		mmc1 = &sdmmc0;
> +		mmc2 = &sdmmc1;
> +		mmc3 = &sdmmc2;
> +	};
> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +		charge-full-design-microamp-hours = <3151000>;
> +		charge-term-current-microamp = <300000>;
> +		constant-charge-current-max-microamp = <2000000>;
> +		constant-charge-voltage-max-microvolt = <4250000>;
> +		factory-internal-resistance-micro-ohms = <117000>;
> +		voltage-max-design-microvolt = <4172000>;
> +		voltage-min-design-microvolt = <3400000>;
> +
> +		ocv-capacity-celsius = <20>;
> +		ocv-capacity-table-0 =  <4172000 100>, <4092000 95>, <4035000 90>, <3990000 85>,
> +					<3939000 80>, <3895000 75>, <3852000 70>, <3807000 65>,
> +					<3762000 60>, <3713000 55>, <3672000 50>, <3647000 45>,
> +					<3629000 40>, <3613000 35>, <3598000 30>, <3578000 25>,
> +					<3550000 20>, <3519000 15>, <3479000 10>, <3438000 5>,
> +					<3400000 0>;
> +	};
> +
> +	/* Channels reversed for headphones. */
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "rk817_int";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
> +		simple-audio-card,mclk-fs = <256>;
> +		simple-audio-card,widgets =
> +			"Microphone", "Mic Jack",
> +			"Headphone", "Headphones",
> +			"Speaker", "Internal Speakers";
> +		simple-audio-card,routing =
> +			"MICL", "Mic Jack",
> +			"Headphones", "HPOL",
> +			"Headphones", "HPOR",
> +			"Internal Speakers", "SPKO";
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&rk817>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&i2s1_8ch>;
> +		};
> +	};
> +
> +};
> +
> +/delete-node/ &adc_keys;
> +
> +&chosen {
> +	/delete-property/ stdout-path;
> +};

If you have to delete so many nodes and properties, this means your
common DTSI is not that common.

Common DTSI means there is shared hardware. If you take shared hardware
and put it into another board, pieces of the shared hardware do not
disappear.


Best regards,
Krzysztof

