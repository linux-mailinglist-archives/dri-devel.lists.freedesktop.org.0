Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E0B93DF1B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 13:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBBD10E039;
	Sat, 27 Jul 2024 11:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rrhjpaXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5145110E039
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 11:15:15 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ee920b0781so22304711fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 04:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722078913; x=1722683713; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F6IkcugCt219ovB+QT/C8OnX7+9cAi+LnPtWh9ZzNwI=;
 b=rrhjpaXY5c42KVCV9i3hn8jr5SA56OD5ZZx2CufVi9UNJ5NqXfi4+r9V26syJcH7A0
 qRemoZWy1nfT7ZfSWbuLs04vUcWaX8LciJsoolqJ91AFTh74Y4FCmAl4cd3G83KqSwsu
 KUh3xIlR8hk4OslTGmZCpJG5a2o4ORkulqJ+Xmb3e6yn3zUfyKpPFYHUYR2XwWA8axv9
 22kKbtqpYRlJiMWegbmzheoCZjST4SyDsxvyNYULl7zxIkO0Y/AiaqmrgKDNlVY4YkyO
 hxGeQ0rECzGWd8PLDwXyQIxV+2tGGDy9RABvr6MHzWS3MBuPbjfdiM+/KTJjsGtXzZca
 1GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722078913; x=1722683713;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6IkcugCt219ovB+QT/C8OnX7+9cAi+LnPtWh9ZzNwI=;
 b=FQyC7Nh1PwQMPJ5/r+WPGgenqd9/ilF5owvloRWumuxJU2AUDGXKwHTgY2pOdngrQR
 p04AQE4dPmBwlbdjQfThnuGBECF3pXLE6snowc5pgBcYxVSH66gEsPB96fUE0CNIZ1Tj
 zQ//GGYe2F1MhI9c1JnlmTX3lCZN2wjFaN4v/e66ptS+j0/OnFORUL+DTRiQmtnAx5A7
 uIomiiMbkre+awagua0ZEMNvj0Tdf6CSdbV0lprMTOOqQQhJJgf2xbq5Cs7M6eSnhRrh
 wRvuICZis3SQ6NvBMwwyYma3sX6hTpGcYowjnZxObBNNXCUT96bWRhm0G1tsncQla0Ac
 JqlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoMhR/mIW1FnKCe6F1+7w9vDL3KwgeC6meefWyG/0Bo3mqc2MV2rrWzDyGW+CPbarxaDStylFLRelUFYltHEOoVogyt3uhE/rL9wJAYrzz
X-Gm-Message-State: AOJu0YxBQU5CKz2UUY3KsBSCxdYEjpF8EaTHpQSaGh+YcUpOdcZRfced
 PD0UA/nlmtfI3OdmNfao6NY7LuN/Q6n9OR/7vB/4C/pseuOLswdNwN2NEmsO6aM=
X-Google-Smtp-Source: AGHT+IFVXUmMe+3AT1Z/H4tmBdr6d67ABfA5prOEZcm0+0GcEzV9I7RRCuZCY8eehOOL6sI8HfvrCg==
X-Received: by 2002:a2e:9d99:0:b0:2ef:24dd:8d86 with SMTP id
 38308e7fff4ca-2f12ee634a8mr12638391fa.49.1722078912885; 
 Sat, 27 Jul 2024 04:15:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03cf0f9bfsm6943141fa.16.2024.07.27.04.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 04:15:12 -0700 (PDT)
Date: Sat, 27 Jul 2024 14:15:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 saravanak@google.com
Subject: Re: [RFC PATCH] ARM: dts: imx53-qsb: Add MCIMX-LVDS1 display module
 support
Message-ID: <xoj4sypxndql62k64ztmco5ufddeysp26fyc46prwr4ezik223@sssy5zmefwtg>
References: <20240726065012.618606-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726065012.618606-1-victor.liu@nxp.com>
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

On Fri, Jul 26, 2024 at 02:50:12PM GMT, Liu Ying wrote:
> MCIMX-LVDS1[1] display module integrates a HannStar HSD100PXN1 LVDS
> display panel and a touch IC.  Add an overlay to support the LVDS
> panel on i.MX53 QSB / QSRB platforms.
> 
> [1] https://www.nxp.com/part/MCIMX-LVDS1
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> I mark RFC in patch subject prefix because if the DT overlay is used, both ldb
> and panel devices end up as devices deferred.  However, if the DT overlay is
> not used and the devices are defined in imx53-qsb-common.dtsi, then they can be
> probed ok.
> 
> With a dev_err_probe() added to imx_ldb_probe() in imx-ldb.c, devices_deferred
> indicates 53fa8008.ldb and panel-lvds kind of depend on each other.
> 
> root@imx53qsb:~# cat /sys/kernel/debug/devices_deferred
> 53fa8008.ldb    imx-ldb: failed to find panel or bridge for channel0
> panel-lvds      platform: wait for supplier /soc/bus@50000000/ldb@53fa8008/lvds-channel@0
> 
> It looks like the issue is related to fw_devlink, because if "fw_devlink=off"
> is added to kernel bootup command line, then the issue doesn't happen.

Could you please fdtdump /sys/firmware/fdt (or just generated DTB files)
in both cases and compare the dumps for sensible differences?

> 
> Saravana, DT folks, any ideas?
> 
> Thanks.
> 
>  arch/arm/boot/dts/nxp/imx/Makefile            |  4 ++
>  .../boot/dts/nxp/imx/imx53-qsb-common.dtsi    |  4 +-
>  .../dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso    | 43 +++++++++++++++++++
>  3 files changed, 49 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 92e291603ea1..7116889e1515 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -46,8 +46,10 @@ dtb-$(CONFIG_SOC_IMX53) += \
>  	imx53-ppd.dtb \
>  	imx53-qsb.dtb \
>  	imx53-qsb-hdmi.dtb \
> +	imx53-qsb-mcimx-lvds1.dtb \
>  	imx53-qsrb.dtb \
>  	imx53-qsrb-hdmi.dtb \
> +	imx53-qsrb-mcimx-lvds1.dtb \
>  	imx53-sk-imx53.dtb \
>  	imx53-sk-imx53-atm0700d4-lvds.dtb \
>  	imx53-sk-imx53-atm0700d4-rgb.dtb \
> @@ -57,7 +59,9 @@ dtb-$(CONFIG_SOC_IMX53) += \
>  	imx53-usbarmory.dtb \
>  	imx53-voipac-bsb.dtb
>  imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
> +imx53-qsb-mcimx-lvds1-dtbs := imx53-qsb.dtb imx53-qsb-mcimx-lvds1.dtbo
>  imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
> +imx53-qsrb-mcimx-lvds1-dtbs := imx53-qsrb.dtb imx53-qsb-mcimx-lvds1.dtbo
>  dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6dl-alti6p.dtb \
>  	imx6dl-apf6dev.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
> index 05d7a462ea25..430792a91ccf 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
> @@ -16,7 +16,7 @@ memory@70000000 {
>  		      <0xb0000000 0x20000000>;
>  	};
>  
> -	backlight_parallel: backlight-parallel {
> +	backlight: backlight {

Nit: this seems unrelated to the LVDS support

>  		compatible = "pwm-backlight";
>  		pwms = <&pwm2 0 5000000 0>;
>  		brightness-levels = <0 4 8 16 32 64 128 255>;
> @@ -89,7 +89,7 @@ panel_dpi: panel {
>  		compatible = "sii,43wvf1g";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_display_power>;
> -		backlight = <&backlight_parallel>;
> +		backlight = <&backlight>;
>  		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
>  
>  		port {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso b/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
> new file mode 100644
> index 000000000000..27f6bedf3d39
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	panel-lvds {

Nit: Just 'panel' should be enough.

> +		compatible = "hannstar,hsd100pxn1";
> +		backlight = <&backlight>;
> +		power-supply = <&reg_3p2v>;
> +
> +		port {
> +			panel_lvds_in: endpoint {
> +				remote-endpoint = <&lvds0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&ldb {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	lvds-channel@0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		fsl,data-mapping = "spwg";
> +		fsl,data-width = <18>;
> +		status = "okay";
> +
> +		port@2 {
> +			reg = <2>;
> +
> +			lvds0_out: endpoint {
> +				remote-endpoint = <&panel_lvds_in>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
