Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815FC46D9B0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 18:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8C46F487;
	Wed,  8 Dec 2021 17:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B916F487
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 17:30:27 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id e3so10919301edu.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 09:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ydOJ0hWrH2W863CXj5rQJLRBf2Rbaq8al5HKjs+MyVo=;
 b=ShR73ntBzMEb995czFVKuH8ZLEJZUxeLPIVLlBpLGte9x1IWheq8x2oO+lV0T+F+um
 m46ZS5+GKmoKJKgUtdans/WAj35TOVx9K3fKTnVjIz0AHutPzKgIjw9hDnqalTmq0BNr
 hSTGLd9E4+yuIzOMoiSf5YVcBvL1xmlKG3pIRta6N/kKtVGwk0/oj8dWzOtVCZb7ru02
 7jIgmhaA8b+ZCK1zpAmFZUZi9a0A3lL0+Tkw68q/6zlp7d+I74e7lwyH1vs/RgfXeMsc
 znyMmIkygAi/pTEf3e3uan9mcNlCVceFHkd/fEixT4FXOeYvFX376EXSEXXvt17EXMsx
 v3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ydOJ0hWrH2W863CXj5rQJLRBf2Rbaq8al5HKjs+MyVo=;
 b=ysVk9/aBAz50G9No36J5I/eHMP+1PQSVtuvMeJ0iBImvOfE+iiBWvno29uhCRH6ebk
 W4yRYs+whQq4DrapHnCCTb6Gf404udE1gnTyIYiJqXEUfsq/IiC76jx56j/By6JXOOS9
 mKZrP1nn6aw39xjuI1+LBqDLkwDQsGhs3c9HPMzlH9x4CL67IQSYwFzKJKv/TbwO4g2o
 WeMDMmZa0bw0Dzg5SIeqaC9Mk0/hpT9uynnhiD57wAD76GeYyzF6BpG72b6+HT9pXTcg
 m3yzs9s/dYAQDGFcxZZkebAzmiMZ7zezVxWSwqy6u13xZK6rVc4Vf7km7QL25h8Ok/cc
 9gOQ==
X-Gm-Message-State: AOAM531klE9Vuo+oB9KxhRjbUSrwYCPSxLujSBzcUK+Wq/JczbwkXnL2
 sv+auNWzB6y3rSB5OAwbJHc=
X-Google-Smtp-Source: ABdhPJw+ovJtjKkNdHnhkIk7BXnlqFxjaC23mAjpEC1jxW/SwfvYnT2NSYbB3BCv0AVqIS77XrEyRQ==
X-Received: by 2002:a50:9eca:: with SMTP id a68mr21586619edf.127.1638984625713; 
 Wed, 08 Dec 2021 09:30:25 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 sd2sm2012033ejc.22.2021.12.08.09.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 09:30:25 -0800 (PST)
Subject: Re: [PATCH 13/18] arm64: dts: rockchip: rk3568-evb: Enable VOP2 and
 hdmi
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20211208151230.3695378-1-s.hauer@pengutronix.de>
 <20211208151230.3695378-14-s.hauer@pengutronix.de>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <bed5f9a3-611b-86be-798e-1034b25e7ba1@gmail.com>
Date: Wed, 8 Dec 2021 18:30:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211208151230.3695378-14-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Could add a patch version to the subject?

On 12/8/21 4:12 PM, Sascha Hauer wrote:
> This enabled the VOP2 display controller along with hdmi and the
> required port routes which is enough to get a picture out of the
> hdmi port of the board.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../boot/dts/rockchip/rk3568-evb1-v10.dts     | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> index 184e2aa2416af..b1b0963fa8525 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> @@ -7,6 +7,7 @@
>  /dts-v1/;
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
>  #include "rk3568.dtsi"
>  
>  / {
> @@ -106,6 +107,12 @@ &gmac1m1_rgmii_clk
>  	status = "okay";
>  };
>  
> +&hdmi {

> +	status = "okay";
> +	avdd-0v9-supply = <&vdda0v9_image>;
> +	avdd-1v8-supply = <&vcca1v8_image>;

status below

> +};

===
Example from rk3066a-mk808.dts
In dtsi:
	hdmi {
		ports {
			#address-cells = <1>;
			#size-cells = <0>;
			hdmi_in: port@0 {
				reg = <0>;
				#address-cells = <1>;
				#size-cells = <0>;
			};

			hdmi_out: port@1 {
				reg = <1>;
			};

===
In dts:
	hdmi-con {
		compatible = "hdmi-connector";
		type = "c";

		port {
			hdmi_con_in: endpoint {
				remote-endpoint = <&hdmi_out_con>;
			};
		};
	};

===

&hdmi_out {
	hdmi_out_con: endpoint {
		remote-endpoint = <&hdmi_con_in>;
	};
};

===

> +
>  &i2c0 {
>  	status = "okay";
>  
> @@ -390,3 +397,27 @@ &sdmmc0 {
>  &uart2 {
>  	status = "okay";
>  };
> +
> +&vop {

> +	status = "okay";
> +	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
> +	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;

status below

> +};
> +
> +&vop_mmu {
> +	status = "okay";
> +};
> +
> +&hdmi_in {
> +	hdmi_in_vp0: endpoint@0 {
> +		reg = <0>;
> +		remote-endpoint = <&vp0_out_hdmi>;
> +	};
> +};
> +
> +&vp0 {
> +	vp0_out_hdmi: endpoint@RK3568_VOP2_EP_HDMI {
> +		reg = <RK3568_VOP2_EP_HDMI>;
> +		remote-endpoint = <&hdmi_in_vp0>;
> +	};
> +};
> 
