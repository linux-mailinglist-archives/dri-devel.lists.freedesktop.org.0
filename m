Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77715F618
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 19:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583846FB90;
	Fri, 14 Feb 2020 18:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4C36FB89
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 18:49:40 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id e9so4279833pjr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 10:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Z9X+mnbPdiAT3gi0kBtvocX45hqfGLXwGRWm7XiWrUQ=;
 b=fiI9CoPovHs74fmaFmlOCZw+PBp/qyX6P9JdrzpnP5akcLRhqwvvQHZCkXeNg27/P9
 B0OGzoMmcNxWD9DcINrkF7JnQM4nNUjE/5vVWFOQskW4tj4YgXhlcvetn50Uw0hx+GBL
 mdFjE0+85VM45BpsczLNE11gS4Gl5UCjOmCAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z9X+mnbPdiAT3gi0kBtvocX45hqfGLXwGRWm7XiWrUQ=;
 b=IbT3o6LBIiiZwxv1GVjRcEhPmgEcj8DvQbQYse0nkCtJSRdBrlCqEhsb7FqG7Vzpkc
 oRzOlaRU/kO1WUGpESw2eBer0eBO+eyMLWkutVGQ9J0trmDu5ieFOIYph7LCfWsHVTml
 oLox5wceO/3AtYJb75AjKvpoKqmP21lx3iVvKkyqLtk5cZSOm4UnISTCkc3N50rQIugg
 +NwFctji1rEnlXuMjM8g7Kl4GWXkrdcfIbbg86HYvkK1SLf4XdyS9WUEe3Evz8MGFcs0
 919Zc9F5edScEhgedSyHBmO8INYzuQ//XCqcYbBdlTuHbx+/nq4I7q6xU/7gl9UyVkXc
 dNjw==
X-Gm-Message-State: APjAAAXJdsmH5gDvBSptctQYymMPD2rX274By8ZCFY0NllOpnY1V8qIx
 aSHSO9FQr5UGSKQwMy1ihVzr/A==
X-Google-Smtp-Source: APXvYqynq99jlrl1qDm8z7d+FI9VC6ZSrWYeVFxihmLzWem1+jdU3ObIhzmt20oiM2H6je9jvHluKg==
X-Received: by 2002:a17:902:6ac2:: with SMTP id
 i2mr4611111plt.221.1581706179645; 
 Fri, 14 Feb 2020 10:49:39 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id h3sm7530961pfo.102.2020.02.14.10.49.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 10:49:38 -0800 (PST)
Date: Fri, 14 Feb 2020 10:49:37 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [v2] arm64: dts: sc7180: add dsi controller and phy entries for
 idp dts
Message-ID: <20200214184937.GA15781@google.com>
References: <20200211113735.6840-1-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211113735.6840-1-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 05:07:35PM +0530, Harigovindan P wrote:

> subject: arm64: dts: sc7180: add dsi controller and phy entries for idp dts

nit: 'dts' at the end is redundant, the prefixes make it clear that this
is about DT entries.

Also the message isn't really concise. The main entries for the DSI
controller and the PHY are in sc7180.dtsi. I would suggest to drop
any mentions of DSI controller and PHYs, and just say something like
'Add nodes for IDP display'. In the body you could mention that the
display is the Visionox RM69299.

> Adding dsi controller and phy entries for idp dt.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v1:
> 	- Added dsi controller and dsi phy entries for idp dts

Changes in v1 is pointless, it's the first patch

> Changes in v2:
> 	- Adding dependency patchwork series
> 	- Removing suspend configuration
> 	- Adding blank before curly brace
> 
> This patch depends on following patchwork series:
> 
> https://patchwork.kernel.org/patch/11364687/
> https://patchwork.kernel.org/patch/11366303/
> 
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 55 +++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50ad4fde..6ccf8c3603ab 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -7,6 +7,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sc7180.dtsi"
>  #include "pm6150.dtsi"
> @@ -232,6 +233,49 @@ vreg_bob: bob {
>  	};
>  };
>  
> +&dsi0 {
> +	status = "okay";
> +
> +	vdda-supply = <&vreg_l3c_1p2>;
> +
> +	panel@0 {
> +		compatible = "visionox,rm69299-1080p-display";
> +		reg = <0>;
> +
> +		vdda-supply = <&vreg_l8c_1p8>;
> +		vdd3p3-supply = <&vreg_l18a_2p8>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&disp_pins>;
> +
> +		reset-gpios = <&pm6150l_gpio 3 GPIO_ACTIVE_HIGH>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			port@0 {
> +				reg = <0>;
> +				panel0_in: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&panel0_in>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_phy {
> +	status = "okay";
> +};
> +
>  &qspi {
>  	status = "okay";
>  	pinctrl-names = "default";
> @@ -289,6 +333,17 @@ &usb_1_qmpphy {
>  
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>  
> +&pm6150l_gpio {
> +	disp_pins: disp-pins {
> +		pins = "gpio3";
> +		function = "func1";
> +		qcom,drive-strength = <2>;
> +		power-source = <0>;
> +		bias-disable;
> +		output-low;
> +	};
> +};
> +
>  &qspi_clk {
>  	pinconf {
>  		pins = "gpio63";

To get the display actually to work you also need this:

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 88919da1510b03..fdbcb56dfa81f9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -276,6 +276,14 @@
        status = "okay";
 };

+&mdp {
+       status = "okay";
+};
+
+&mdss {
+       status = "okay";
+};
+
 &qspi {
        status = "okay";
        pinctrl-names = "default";

Maybe just add this to this patch?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
