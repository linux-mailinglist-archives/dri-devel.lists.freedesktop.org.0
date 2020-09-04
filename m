Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5B225DC91
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B986EC38;
	Fri,  4 Sep 2020 14:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5466EC38
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:58:46 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kEDAY-00038C-T1; Fri, 04 Sep 2020 16:58:26 +0200
Message-ID: <b8a54ab935d8a56e056f4e333d60a1a47e4604cc.camel@pengutronix.de>
Subject: Re: [PATCH 01/13] dt-bindings: power: fsl,imx-gpcv2: Document
 interrupt controller properties
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
Date: Fri, 04 Sep 2020 16:58:44 +0200
In-Reply-To: <20200904145312.10960-2-krzk@kernel.org>
References: <20200904145312.10960-1-krzk@kernel.org>
 <20200904145312.10960-2-krzk@kernel.org>
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
> The i.MX General Power Controller v2 is also an interrupt controller so
> document additional properties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mq-evk.dt.yaml: gpc@303a0000:
>     '#interrupt-cells', 'interrupt-controller' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml
> index bde09a0b2da3..a96e6dbf1858 100644
> --- a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml
> +++ b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml
> @@ -33,6 +33,10 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  interrupt-controller: true
> +  '#interrupt-cells':
> +    const: 3
> +
>    pgc:
>      type: object
>      description: list of power domains provided by this controller.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
