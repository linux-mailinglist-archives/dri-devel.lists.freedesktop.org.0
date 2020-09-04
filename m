Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AD325DCB9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 17:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EC66EC56;
	Fri,  4 Sep 2020 15:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FFA6EC56
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 15:03:59 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kEDFh-00045v-PT; Fri, 04 Sep 2020 17:03:45 +0200
Message-ID: <38c8ba6d1ca4e982626bbaefbec620fdce2cd024.camel@pengutronix.de>
Subject: Re: [PATCH 10/13] arm64: dts: imx8mq: Add missing interrupts to GPC
From: Lucas Stach <l.stach@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Russell
 King <linux+etnaviv@armlinux.org.uk>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, Lee Jones <lee.jones@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam@ravnborg.org>, Li
 Yang <leoyang.li@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, Matti
 Vaittinen <matti.vaittinen@fi.rohmeurope.com>,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org,  linux-arm-kernel@lists.infradead.org
Date: Fri, 04 Sep 2020 17:04:04 +0200
In-Reply-To: <20200904145312.10960-11-krzk@kernel.org>
References: <20200904145312.10960-1-krzk@kernel.org>
 <20200904145312.10960-11-krzk@kernel.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2020-09-04 at 16:53 +0200, Krzysztof Kozlowski wrote:
> The i.MX General Power Controller v2 device node was missing interrupts
> property necessary to route its interrupt to GIC.  This also fixes the
> dbts_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mq-evk.dt.yaml: gpc@303a0000:
>     {'compatible': ... '$nodename': ['gpc@303a0000']} is not valid under any of the given schemas
>   arch/arm64/boot/dts/freescale/imx8mq-evk.dt.yaml: gpc@303a0000: 'interrupts' is a required property
> 
> Fixes: fdbcc04da246 ("arm64: dts: imx8mq: add GPC power domains")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index aad3b9f2f35c..5e0e7d0f1bc4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -623,6 +623,7 @@
>  			gpc: gpc@303a0000 {
>  				compatible = "fsl,imx8mq-gpc";
>  				reg = <0x303a0000 0x10000>;
> +				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
>  				interrupt-parent = <&gic>;
>  				interrupt-controller;
>  				#interrupt-cells = <3>;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
