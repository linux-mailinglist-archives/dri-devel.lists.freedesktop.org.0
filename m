Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9E41C7A3D
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 21:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D536E8CF;
	Wed,  6 May 2020 19:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92776E8CF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 19:25:49 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id f7so1521016pfa.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CwlP6EYHN6g+DNT34PQdILeoztGCENWoPR/CrDmj7cM=;
 b=Oy6t/RM9X407g9VMd/oZUFCv1R2vqkGVDxiJqcLgBRjg6gGsAhHbK5XNjSaZDrGR6i
 hcvJ0DAA6cLxzphFrdMOSLz1Thq0IJ6BUo4ADyQqma2/3XAmeQfPKXE3JtmPTSVbT1tC
 c0QAA53U7nJEzR6q/TNrMoYN80r0hy3OKaacY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CwlP6EYHN6g+DNT34PQdILeoztGCENWoPR/CrDmj7cM=;
 b=jsC+LV8mGFir0yUuWru3sfqTPajWOikylYLWNBMrwsCrcoI9vUEbToSCF5pbusIaXj
 hOpgQXaSvOoCB8iq5doyQOnjfAOl3lrlru4EUKyGTtnDYLhHcGkr+N5u9zoX40xb4vfb
 3Yyfik9c1+csfwvnvBdbqjX3ZeoHOT38AXt5Rc8OK+IITRiMBpDshVYseLWEcFJPYh0u
 QRaNaudlfCsJ22I09cbtrarLiTwhRy5gaHzbo2jfPyiHuC4WAEjQ0RBTQZUUxXNa5YX0
 hupOdyAt7XjJjzHAgugRD0SJg1wvdlVi0Zx8hDjoIFxndpAEglg4WfugYI5ztviXNwkM
 +81Q==
X-Gm-Message-State: AGi0PuZOPfMUuW3+4EyWnCEMW7Sy8ltgr+WGxTM9Rvjtnh1FybXkDrZf
 HVwhU+gjw2/gf8rUE7us8oS0Qg==
X-Google-Smtp-Source: APiQypLUKuBtus1IitoTsBLnaDmsbHfvQH+D98llQB+TKmq2UsX5RoGXA/K8c4olMhXO8vUm9fsIvw==
X-Received: by 2002:a63:3d43:: with SMTP id k64mr8230250pga.150.1588793149484; 
 Wed, 06 May 2020 12:25:49 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id l6sm2597373pfl.128.2020.05.06.12.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 12:25:48 -0700 (PDT)
Date: Wed, 6 May 2020 12:25:47 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [v2] arm64: dts: sc7180: add dsi controller and phy entries for
 idp dts
Message-ID: <20200506192547.GY4525@google.com>
References: <20200211113735.6840-1-harigovi@codeaurora.org>
 <20200214184937.GA15781@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214184937.GA15781@google.com>
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

On Fri, Feb 14, 2020 at 10:49:37AM -0800, Matthias Kaehlcke wrote:
> On Tue, Feb 11, 2020 at 05:07:35PM +0530, Harigovindan P wrote:
> 
> > subject: arm64: dts: sc7180: add dsi controller and phy entries for idp dts
> 
> nit: 'dts' at the end is redundant, the prefixes make it clear that this
> is about DT entries.
> 
> Also the message isn't really concise. The main entries for the DSI
> controller and the PHY are in sc7180.dtsi. I would suggest to drop
> any mentions of DSI controller and PHYs, and just say something like
> 'Add nodes for IDP display'. In the body you could mention that the
> display is the Visionox RM69299.
> 
> > Adding dsi controller and phy entries for idp dt.
> > 
> > Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> > ---
> > 
> > Changes in v1:
> > 	- Added dsi controller and dsi phy entries for idp dts
> 
> Changes in v1 is pointless, it's the first patch
> 
> > Changes in v2:
> > 	- Adding dependency patchwork series
> > 	- Removing suspend configuration
> > 	- Adding blank before curly brace
> > 
> > This patch depends on following patchwork series:
> > 
> > https://patchwork.kernel.org/patch/11364687/
> > https://patchwork.kernel.org/patch/11366303/
> > 
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 55 +++++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 388f50ad4fde..6ccf8c3603ab 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -7,6 +7,7 @@
> >  
> >  /dts-v1/;
> >  
> > +#include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >  #include "sc7180.dtsi"
> >  #include "pm6150.dtsi"
> > @@ -232,6 +233,49 @@ vreg_bob: bob {
> >  	};
> >  };
> >  
> > +&dsi0 {
> > +	status = "okay";
> > +
> > +	vdda-supply = <&vreg_l3c_1p2>;
> > +
> > +	panel@0 {
> > +		compatible = "visionox,rm69299-1080p-display";
> > +		reg = <0>;
> > +
> > +		vdda-supply = <&vreg_l8c_1p8>;
> > +		vdd3p3-supply = <&vreg_l18a_2p8>;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&disp_pins>;
> > +
> > +		reset-gpios = <&pm6150l_gpio 3 GPIO_ACTIVE_HIGH>;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			port@0 {
> > +				reg = <0>;
> > +				panel0_in: endpoint {
> > +					remote-endpoint = <&dsi0_out>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	ports {
> > +		port@1 {
> > +			endpoint {
> > +				remote-endpoint = <&panel0_in>;
> > +				data-lanes = <0 1 2 3>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&dsi_phy {
> > +	status = "okay";
> > +};
> > +
> >  &qspi {
> >  	status = "okay";
> >  	pinctrl-names = "default";
> > @@ -289,6 +333,17 @@ &usb_1_qmpphy {
> >  
> >  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> >  
> > +&pm6150l_gpio {
> > +	disp_pins: disp-pins {
> > +		pins = "gpio3";
> > +		function = "func1";
> > +		qcom,drive-strength = <2>;
> > +		power-source = <0>;
> > +		bias-disable;
> > +		output-low;
> > +	};
> > +};
> > +
> >  &qspi_clk {
> >  	pinconf {
> >  		pins = "gpio63";
> 
> To get the display actually to work you also need this:
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 88919da1510b03..fdbcb56dfa81f9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -276,6 +276,14 @@
>         status = "okay";
>  };
> 
> +&mdp {
> +       status = "okay";
> +};
> +
> +&mdss {
> +       status = "okay";
> +};
> +
>  &qspi {
>         status = "okay";
>         pinctrl-names = "default";
> 
> Maybe just add this to this patch?

ping

the display driver landed in drm-misc, but this patch still needs a
respin.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
