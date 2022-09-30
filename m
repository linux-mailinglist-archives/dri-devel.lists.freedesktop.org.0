Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802975F0950
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 12:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F1A10EC79;
	Fri, 30 Sep 2022 10:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D14010EC79
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 10:51:10 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id p5so4357413ljc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 03:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=vctQn9qSs7FuCLhaQLDTmKpuEEYLPcLRtdcGf2Kulu8=;
 b=xQMgXQDX7Cbw+Y4w41fTe1Sm//2pCxed3mYlyy2Auw+7V2wjHYrk57k3NOl8Zigrui
 H588ZQZIgQ7JsqY6zUN8UU57Gv7MPyVVKzFckFckztxpGlQj/FGHEmKOqV4XtiBvjWJJ
 YdEQ5D+KMVFIppWrOa/aR58H2vFjRax45F236sHk6Ro2ocmjcoviP31915oW/SOIHpFv
 hG0wfWb8mj1XpZ9l+VaDgmBjN5a9l++rdkcNMnzhkM8b9NuRjPpDj5gHtzCmjfj0y+/u
 TSsY3Nc63VlX8tUINUCSRLeKvczWmipfQ3ILELQrgKQVPost0bbK9fzY/036UFdCMQLZ
 /nRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=vctQn9qSs7FuCLhaQLDTmKpuEEYLPcLRtdcGf2Kulu8=;
 b=r59RucZgfyxjQmc2953BvWwM5PJ9Iq9AmEDt3VSgnY9Y6Y71b1Xxd1aie8/CRduDKW
 dI9yXO3LktNi8BVtL7ZvyTvmBV1A27UUdq/f48O70GlMkHBzfz4no0CmUCw/hYcotntE
 uA6AQkHL4fy3mnuEUVALnNl+uv/IneL3GSVQG+MTDNZqnItZ3iHunpbyrIcb3cA9BUi1
 tcOOLL0s8HBsnrsAEYdRjH2UqT+sNiZqGHYdN+NQ0geYqDMyBBqS1+31osy91x6XUSaw
 2I2E4QSDbScB2E6/I1yVow2Bg1DRCdRqgJE32O8ANOaPIItq3v/GGGwyOopJHzPfgcKP
 OOdA==
X-Gm-Message-State: ACrzQf3+NOz1oPk0lxj7nHxFdIImceZBTMGHgZlc3DfZu8y7bXJwdDrb
 Jbh/lK10kOo52pmFiMLqraax8A==
X-Google-Smtp-Source: AMsMyM7U0+RvpMpI946u7FIRiKfT/TPyCq1p54TSPJaH8GXCjHw/ftEk6RPODWpLAOZjysiQrhWClA==
X-Received: by 2002:a05:651c:19a6:b0:26c:4a66:aa42 with SMTP id
 bx38-20020a05651c19a600b0026c4a66aa42mr2970064ljb.231.1664535068835; 
 Fri, 30 Sep 2022 03:51:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b004948497e07esm265561lfb.15.2022.09.30.03.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 03:51:08 -0700 (PDT)
Message-ID: <23bc38b8-ed67-d243-9739-f07b7411be3a@linaro.org>
Date: Fri, 30 Sep 2022 12:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 4/4] arm64: dts: smaug: Add display panel node
Content-Language: en-US
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-tegra@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/09/2022 19:05, Diogo Ivo wrote:
> The Google Pixel C has a JDI LPM102A188A display panel. Add a
> DT node for it. Tested on Pixel C.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> index 20d092812984..271ef70747f1 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -31,6 +31,39 @@ memory {
>  	};
>  
>  	host1x@50000000 {
> +		dc@54200000 {
> +			status = "okay";

You should override by labels, not by full path.

> +		};
> +
> +		dsia: dsi@54300000 {
> +			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
> +			nvidia,boot-on;
> +			status = "okay";
> +
> +			link2: panel@0 {
> +				compatible = "jdi,lpm102a188a";
> +				reg = <0>;
> +			};
> +		};
> +
> +		dsib: dsi@54400000 {
> +			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
> +			nvidia,ganged-mode = <&dsia>;
> +			nvidia,boot-on;
> +			status = "okay";
> +
> +			link1: panel@0 {
> +				compatible = "jdi,lpm102a188a";
> +				reg = <0>;
> +				power-supply = <&pplcd_vdd>;
> +				ddi-supply = <&pp1800_lcdio>;
> +				enable-gpios = <&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
> +				link2 = <&link2>;
> +				backlight = <&backlight>;
> +			};
> +		};
> +
>  		dpaux: dpaux@545c0000 {
>  			status = "okay";
>  		};
> @@ -1627,6 +1660,37 @@ nau8825@1a {
>  			status = "okay";
>  		};
>  
> +		backlight: lp8557-backlight@2c {

Node names should be generic: backlight
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "ti,lp8557";
> +			reg = <0x2c>;
> +			power-supply = <&pplcd_vdd>;
> +			enable-supply = <&pp1800_lcdio>;
> +			bl-name = "lp8557-backlight";
> +			dev-ctrl = /bits/ 8 <0x01>;
> +			init-brt = /bits/ 8 <0x80>;
> +
> +			/* Full scale current, 20mA */
> +			rom_11h {

No underscores in node names, unless something requires it?

> +				rom-addr = /bits/ 8 <0x11>;
> +				rom-val = /bits/ 8 <0x05>;
> +			};

Best regards,
Krzysztof

