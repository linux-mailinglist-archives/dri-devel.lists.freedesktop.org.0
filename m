Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPKRKxX+pWnvIgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:16:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182621E2346
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2799A10E5C6;
	Mon,  2 Mar 2026 21:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="uvv5ft+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4640C10E5C6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 21:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=NnJ8pv/fOL8GSKK5hN49M8Ny5MsaLE7zYWAtl179zfM=; b=uvv5ft+7aehu5i17DBQoMd/vkq
 EEOy9hjnpHHy5eRL0mIOZNx+XYLH8ppqd9PBO1H/lq0oVjfs7YWFFKvIdFyI00S3e2TsqT5fLYLb4
 JpOpLBKgxJ7DssHRipUkhgGLMH4xfNe2ZqzfbvNUOH4p1d23ODHWIgWLm75pooi7fLBc=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:40712
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vxAcE-0004ca-C0; Mon, 02 Mar 2026 16:15:47 -0500
Date: Mon, 2 Mar 2026 16:15:45 -0500
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
Message-Id: <20260302161545.f6b76209400e8fbe35cd51a0@hugovil.com>
In-Reply-To: <aaX5E7-3xvkaVV-o@lizhi-Precision-Tower-5810>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-9-hugo@hugovil.com>
 <aaX5E7-3xvkaVV-o@lizhi-Precision-Tower-5810>
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
Subject: Re: [PATCH 08/14] ARM: dts: imx6ul-var-som: factor out SD card support
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
X-Rspamd-Queue-Id: 182621E2346
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=x];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shawnguo@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:antonin.godard@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:hvilleneuve@dimonoff.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[hugovil.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[hugo@hugovil.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,pengutronix.de,bootlin.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,dimonoff.com];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[hugovil.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Frank,

On Mon, 2 Mar 2026 15:54:43 -0500
Frank Li <Frank.li@nxp.com> wrote:

> On Mon, Mar 02, 2026 at 02:03:44PM -0500, Hugo Villeneuve wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >
> > Move SD support to a separate include, since it cannot be used at the
> 
> s/include/dtsi/

Ok. I will also change it in all the other commit messages.

 
> > same time as the Wifi/BT module.
> 
> what's relation ship between wifi/bt? you just move sd related part to a
> dtsi file.

As stated in commit message, the SD card interface cannot be used if
the Wifi/BT module is in use.

Sd card is not mandatory, for example on our board we do not have it,
so we need to have it disabled.

Hugo.



> 
> Frank
> >
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > ---
> >  .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 33 ++++++++++++
> >  .../imx/imx6ul-var-som-concerto-common.dtsi   | 51 -------------------
> >  .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |  1 +
> >  .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   | 27 ++++++++++
> >  .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  1 +
> >  5 files changed, 62 insertions(+), 51 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > index 22b0c4e0725a5..dd4ecff1eb786 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > @@ -139,6 +139,39 @@ MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
> >  		>;
> >  	};
> >
> > +	pinctrl_usdhc1: usdhc1grp {
> > +		fsl,pins = <
> > +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
> > +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
> > +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
> > +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
> > +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
> > +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> > +		fsl,pins = <
> > +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
> > +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
> > +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
> > +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
> > +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
> > +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> > +		fsl,pins = <
> > +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
> > +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
> > +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
> > +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
> > +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
> > +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
> > +		>;
> > +	};
> > +
> >  	pinctrl_usdhc2: usdhc2grp {
> >  		fsl,pins = <
> >  			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> > index 10a23ae104359..ea8d9905ce6e7 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> > @@ -186,45 +186,6 @@ MX6UL_PAD_UART3_TX_DATA__ANATOP_OTG1_ID	0x17059
> >  		>;
> >  	};
> >
> > -	pinctrl_usdhc1: usdhc1grp {
> > -		fsl,pins = <
> > -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
> > -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
> > -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
> > -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
> > -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
> > -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> > -		fsl,pins = <
> > -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
> > -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
> > -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
> > -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
> > -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
> > -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> > -		fsl,pins = <
> > -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
> > -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
> > -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
> > -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
> > -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
> > -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
> > -		fsl,pins = <
> > -			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x1b0b1 /* CD */
> > -		>;
> > -	};
> > -
> >  	pinctrl_wdog: wdoggrp {
> >  		fsl,pins = <
> >  			MX6UL_PAD_GPIO1_IO01__WDOG1_WDOG_B	0x78b0
> > @@ -286,18 +247,6 @@ &usbotg2 {
> >  	status = "okay";
> >  };
> >
> > -&usdhc1 {
> > -	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > -	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> > -	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> > -	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> > -	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> > -	no-1-8-v;
> > -	keep-power-in-suspend;
> > -	wakeup-source;
> > -	status = "okay";
> > -};
> > -
> >  &wdog1 {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_wdog>;
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > index 11b45f105b7ad..85ebac30d7bed 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > @@ -11,6 +11,7 @@
> >
> >  #include "imx6ul-var-som.dtsi"
> >  #include "imx6ul-var-som-concerto-common.dtsi"
> > +#include "imx6ul-var-som-sd.dtsi"
> >
> >  / {
> >  	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
> > new file mode 100644
> > index 0000000000000..0e6d9b945eb4a
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
> > @@ -0,0 +1,27 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Support optional SD card interface on Variscite VAR-SOM-6UL module.
> > + *
> > + * Copyright 2019-2024 Variscite Ltd.
> > + * Copyright 2026 Dimonoff
> > + */
> > +
> > +&iomuxc {
> > +	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
> > +		fsl,pins = <
> > +			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x1b0b1 /* CD */
> > +		>;
> > +	};
> > +};
> > +
> > +&usdhc1 {
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> > +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> > +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> > +	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> > +	no-1-8-v;
> > +	keep-power-in-suspend;
> > +	wakeup-source;
> > +	status = "okay";
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> > index 7c601af2657d7..ebf88c3e1addc 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> > @@ -10,6 +10,7 @@
> >
> >  #include "imx6ull-var-som.dtsi"
> >  #include "imx6ul-var-som-concerto-common.dtsi"
> > +#include "imx6ul-var-som-sd.dtsi"
> >
> >  / {
> >  	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
> > --
> > 2.47.3
> >
> 


-- 
Hugo Villeneuve
