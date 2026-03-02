Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELO+FFwEpmnvIwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:42:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAA61E3CD5
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6486A10E5D9;
	Mon,  2 Mar 2026 21:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="utmx1okq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283AB10E5D9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 21:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=SbUPvehf+QyZOUPTnLgB6JAtmjiDQpVgtr3+W2oHI28=; b=utmx1okq7eUH/KjH8E+HRAMnSK
 5B1DGn9AaCRO6FWjYexpr10Jd0KPzuakm9jE9JEhIMKMPgjkGVsOSXfU8WKZ6rvhj3lXFhCD28abK
 cxJqqWoc0XkF7o7gPezUo+VhP6XWaXPYgmxpPReFQUHKI3gZ8OMve5+vD7e1HP2wmq0w=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:35228
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vxB28-0005MW-Lf; Mon, 02 Mar 2026 16:42:33 -0500
Date: Mon, 2 Mar 2026 16:42:31 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, laurent.pinchart+renesas@ideasonboard.com,
 antonin.godard@bootlin.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>
Message-Id: <20260302164231.616bd69c106cbcdd107d9cbb@hugovil.com>
In-Reply-To: <aaX6P_ulJTq_pipa@lizhi-Precision-Tower-5810>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-10-hugo@hugovil.com>
 <aaX6P_ulJTq_pipa@lizhi-Precision-Tower-5810>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -2.0 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-4.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH 09/14] ARM: dts: imx6ul-var-som: add proper Wifi and
 Bluetooth support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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
X-Rspamd-Queue-Id: 9AAA61E3CD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=x];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shawnguo@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:antonin.godard@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:hvilleneuve@dimonoff.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[hugovil.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[hugo@hugovil.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,pengutronix.de,bootlin.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,dimonoff.com];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[hugovil.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dimonoff.com:email,hugovil.com:dkim,hugovil.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,4.196.180.0:email]
X-Rspamd-Action: no action

On Mon, 2 Mar 2026 15:59:43 -0500
Frank Li <Frank.li@nxp.com> wrote:

> On Mon, Mar 02, 2026 at 02:03:45PM -0500, Hugo Villeneuve wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >
> > The existing configuration of the optional Wifi/Bluetooth module was
> > copied from the original Variscite kernel tree, and requires custom
> > scripts to properly configure the Wifi/Bluetooth module.
> >
> > Add proper support for the optional Wifi and Bluetooth configuration on
> > VAR-SOM-6UL so that it works out of the box, without any custom scripts.
> >
> > The SD card interface cannot be used if the Wifi/BT module is in use.
> 
> ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support

This looks identical to the initial commit message?

> Add the optional Wifi and Bluetooth dtb on AR-SOM-6UL so that it works out
> of the box.

See comments below about name of dtb.


> The SD card interface cannot be used if the Wifi/BT module is in use.
> 
> 
> >
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile            |  2 +
> >  .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 18 ++---
> >  .../nxp/imx/imx6ul-var-som-concerto-full.dts  | 18 +++++
> >  .../boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi | 75 +++++++++++++++++++
> >  arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 15 ++++
> >  .../nxp/imx/imx6ull-var-som-concerto-full.dts | 18 +++++
> >  .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi | 15 ++++
> >  7 files changed, 151 insertions(+), 10 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> > index bc534d0fb1412..c7f24ee63071f 100644
> > --- a/arch/arm/boot/dts/nxp/imx/Makefile
> > +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> > @@ -339,6 +339,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
> >  	imx6ul-tx6ul-0011.dtb \
> >  	imx6ul-tx6ul-mainboard.dtb \
> >  	imx6ul-var-som-concerto.dtb \
> > +	imx6ul-var-som-concerto-full.dtb \
> 
> how about imx6ul-var-som-concerto-wifi.dtb?

There is an exponential number of possible configurations (sd + wifi,
eemc + wifi, eemc + eth and no wifi, etc). To simplify, I am simply
adding a full DTB which will support all options on the EVK.

Hugo.


> >  	imx6ull-14x14-evk.dtb \
> >  	imx6ull-colibri-aster.dtb \
> >  	imx6ull-colibri-emmc-aster.dtb \
> > @@ -377,6 +378,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
> >  	imx6ull-tqma6ull2-mba6ulx.dtb \
> >  	imx6ull-tqma6ull2l-mba6ulx.dtb \
> >  	imx6ull-var-som-concerto.dtb \
> > +	imx6ull-var-som-concerto-full.dtb \
> >  	imx6ull-uti260b.dtb \
> >  	imx6ulz-14x14-evk.dtb \
> >  	imx6ulz-bsh-smm-m2.dtb
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > index dd4ecff1eb786..af8c5d2db53d4 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > @@ -19,6 +19,14 @@ memory@80000000 {
> >  		reg = <0x80000000 0x20000000>;
> >  	};
> >
> > +	reg_3p3v: regulator-3p3v {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "3P3V";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-always-on;
> > +	};
> > +
> >  	reg_gpio_dvfs: reg-gpio-dvfs {
> >  		compatible = "regulator-gpio";
> >  		regulator-min-microvolt = <1300000>;
> > @@ -68,9 +76,6 @@ ethphy0: ethernet-phy@1 {
> >  };
> >
> >  &iomuxc {
> > -	pinctrl-names = "default";
> > -	pinctrl-0 = <&pinctrl_hog>;
> > -
> >  	pinctrl_enet1: enet1grp {
> >  		fsl,pins = <
> >  			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
> > @@ -97,13 +102,6 @@ MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
> >  		>;
> >  	};
> >
> > -	pinctrl_hog: hoggrp {
> > -		fsl,pins = <
> > -			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT Enable */
> > -			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029	/* WLAN Enable */
> > -		>;
> > -	};
> > -
> >  	pinctrl_i2c1: i2c1grp {
> >  		fsl,pins = <
> >  			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> > new file mode 100644
> > index 0000000000000..519250b31db24
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> > @@ -0,0 +1,18 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> > + * Variscite SoM mounted on it (6UL CPU variant).
> > + *
> > + * Copyright 2026 Dimonoff
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "imx6ul-var-som.dtsi"
> > +#include "imx6ul-var-som-concerto-common.dtsi"
> > +#include "imx6ul-var-som-wifi.dtsi"
> > +
> > +/ {
> > +	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
> > +	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> > new file mode 100644
> > index 0000000000000..6d16ff7909dab
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> > @@ -0,0 +1,75 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Support optional Wifi/Bluetooth on Variscite VAR-SOM-6UL module.
> > + *
> > + * Copyright 2019-2024 Variscite Ltd.
> > + * Copyright 2026 Dimonoff
> > + */
> > +
> > +/ {
> > +	reg_sd1_vmmc: regulator_sd1_vmmc {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VMMC1";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		startup-delay-us = <10000>;
> > +	};
> > +
> > +	usdhc1_pwrseq: usdhc1-pwrseq {
> > +		compatible = "mmc-pwrseq-simple";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_brcm_wifi>;
> > +		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
> > +	};
> > +};
> > +
> > +&iomuxc {
> > +	pinctrl_32k_clk: 32kclkgrp {
> > +		/*
> > +		 * For TP option, an additional oscillator is assembled on the
> > +		 * SOM to provide 32 kHz to the WiFi module. Without TP option,
> > +		 * this pin is configured to provide the 32 KHz clock to the
> > +		 * WiFi module.
> > +		 */
> > +		fsl,pins = <
> > +			MX6UL_PAD_GPIO1_IO03__OSC32K_32K_OUT	0x03029
> > +		>;
> > +	};
> > +};
> > +
> > +&tsc {
> > +	status = "disabled";
> > +};
> > +
> > +/* Bluetooth UART */
> > +&uart2 {
> > +	bluetooth {
> > +		compatible = "brcm,bcm43438-bt";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_brcm_bt>;
> > +		shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
> > +		vbat-supply = <&reg_3p3v>;
> > +		vddio-supply = <&reg_3p3v>;
> > +	};
> > +};
> > +
> > +&usdhc1 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_32k_clk>;
> > +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>;
> > +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>;
> > +	no-1-8-v;
> > +	non-removable;
> > +	mmc-pwrseq = <&usdhc1_pwrseq>;
> > +	vmmc-supply = <&reg_sd1_vmmc>;
> > +	status = "okay";
> > +
> > +	brcmf: wifi@1 {
> > +		compatible = "brcm,bcm4329-fmac"; /* LWB option: Sterling LWB5 */
> > +		reg = <1>;
> > +	};
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> > index 35a0c0b3603fd..b4e6a9316dd81 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> > @@ -15,3 +15,18 @@ / {
> >  	model = "Variscite VAR-SOM-6UL module";
> >  	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
> >  };
> > +
> > +&iomuxc {
> > +	pinctrl_brcm_bt: brcm-bt-grp {
> > +		fsl,pins = <
> > +			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
> > +		>;
> > +	};
> > +
> > +	pinctrl_brcm_wifi: brcm-wifi-grp {
> > +		fsl,pins = <
> > +			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
> > +			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
> > +		>;
> > +	};
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
> > new file mode 100644
> > index 0000000000000..7c0e313603630
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
> > @@ -0,0 +1,18 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> > + * Variscite SoM mounted on it (6ULL CPU variant).
> > + *
> > + * Copyright 2026 Dimonoff
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "imx6ull-var-som.dtsi"
> > +#include "imx6ul-var-som-concerto-common.dtsi"
> > +#include "imx6ul-var-som-wifi.dtsi"
> > +
> > +/ {
> > +	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
> > +	compatible = "variscite,mx6ullconcerto", "variscite,var-som-imx6ull", "fsl,imx6ull";
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> > index ba482a97623b2..3067ff6a1bc74 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> > @@ -13,3 +13,18 @@ / {
> >  	model = "Variscite VAR-SOM-6UL module";
> >  	compatible = "variscite,var-som-imx6ull", "fsl,imx6ull";
> >  };
> > +
> > +&iomuxc {
> > +	pinctrl_brcm_bt: brcm-bt-grp {
> > +		fsl,pins = <
> > +			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
> > +		>;
> > +	};
> > +
> > +	pinctrl_brcm_wifi: brcm-wifi-grp {
> > +		fsl,pins = <
> > +			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
> > +			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
> > +		>;
> > +	};
> > +};
> > --
> > 2.47.3
> >
> 


-- 
Hugo Villeneuve
