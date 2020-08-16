Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BE4245638
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 08:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512CA89E57;
	Sun, 16 Aug 2020 06:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D64E89E57
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 06:39:37 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 29D2C20021;
 Sun, 16 Aug 2020 08:39:35 +0200 (CEST)
Date: Sun, 16 Aug 2020 08:39:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/8] dt-bindings: display: mxsfb: Add and fix compatible
 strings
Message-ID: <20200816063933.GC1201814@ravnborg.org>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=61xgh838un-h8gKOHdQA:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 04:29:04AM +0300, Laurent Pinchart wrote:
> Additional compatible strings have been added in DT source for the
> i.MX6SL, i.MX6SLL, i.MX6UL and i.MX7D without updating the bindings.
> Most of the upstream DT sources use the fsl,imx28-lcdif compatible
> string, which mostly predates the realization that the LCDIF in the
> i.MX6 and newer SoCs have extra features compared to the i.MX28.
> 
> Update the bindings to add the missing compatible strings, with the
> correct fallback values. This fails to validate some of the upstream DT
> sources. Instead of adding the incorrect compatible fallback to the
> binding, the sources should be updated separately.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/mxsfb.yaml     | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
> index 202381ec5bb7..ec6533b1d4a3 100644
> --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> @@ -15,11 +15,19 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx23-lcdif
> -      - fsl,imx28-lcdif
> -      - fsl,imx6sx-lcdif
> -      - fsl,imx8mq-lcdif
> +    oneOf:
> +      - enum:
> +          - fsl,imx23-lcdif
> +          - fsl,imx28-lcdif
> +          - fsl,imx6sx-lcdif
Indent correct.

> +      - items:
> +        - enum:
> +          - fsl,imx6sl-lcdif
> +          - fsl,imx6sll-lcdif
> +          - fsl,imx6ul-lcdif
> +          - fsl,imx7d-lcdif
> +          - fsl,imx8mq-lcdif
Indent shall be two more spaces like above.
(This is at least my best uderstanding)

> +        - const: fsl,imx6sx-lcdif

With the above the following compatibles are supported:

	"fsl,imx23-lcdif"
	"fsl,imx28-lcdif"
	"fsl,imx6sx-lcdif"
	"fsl,imx8mq-lcdif"

	"fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif"
	"fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif"
	"fsl,imx6ul-lcdif", "fsl,imx6sx-lcdif"
	"fsl,imx7d-lcdif", "fsl,imx6sx-lcdif"
	"fsl,imx8mq-lcdif", "fsl,imx6sx-lcdif"

So the fallback value is the later "fsl,imx6sx-lcdif" which looks ok.

With indent fixed (or explained why I am wrong):
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


>  
>    reg:
>      maxItems: 1
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
