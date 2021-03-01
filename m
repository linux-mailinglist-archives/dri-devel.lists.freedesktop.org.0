Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC01A3282B5
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 16:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5433E6E047;
	Mon,  1 Mar 2021 15:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE3F6E047
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 15:42:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 544A541;
 Mon,  1 Mar 2021 16:41:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1614613318;
 bh=6k5y3m4IymgIJtPRDoiiX5wSgKRAQSjYdROeaIAxcnQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DZAoMNjchVA9b+5jgR6LObPIBvCh11KDFoWk3MFd/GLdASIcTbzYJTN9TBqc9gKCJ
 xETTnXQf3DAkQ/RJMJz+xVgJ4MygnBHfGAPzgvbAI2d4KWFP6Utx+pJdQm9II6eAr2
 Q/z1A2nVCmFuXJUZAIXRlW4Tw5v26HJrjPfgyrtY=
Date: Mon, 1 Mar 2021 17:41:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Message-ID: <YD0LKg3Jl5nauMqF@pendragon.ideasonboard.com>
References: <1614597685-4192-1-git-send-email-pthombar@cadence.com>
 <1614597746-4563-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614597746-4563-1-git-send-email-pthombar@cadence.com>
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kishon@ti.com,
 a.hajda@samsung.com, robh+dt@kernel.org, robert.foss@linaro.org,
 sjakhade@cadence.com, nikhil.nd@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Parshuram,

Thank you for the patch.

On Mon, Mar 01, 2021 at 12:22:26PM +0100, Parshuram Thombare wrote:
> Add binding changes for HDCP in the MHDP8546 DPI/DP bridge binding.
> This binding is not used in any upstreamed DTS yet, so changing
> index of property 'j721e-intg' should not affect anything.
> 
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
>  .../display/bridge/cdns,mhdp8546.yaml         | 29 ++++++++++++-------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index 63427878715e..5fdadadaac16 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> @@ -17,21 +17,24 @@ properties:
>        - ti,j721e-mhdp8546
>  
>    reg:
> -    minItems: 1
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - description:
>            Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
>            The AUX and PMA registers are not part of this range, they are instead
>            included in the associated PHY.
> +      - description:
> +          Register block of mhdptx sapb registers.
>        - description:
>            Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
>  
>    reg-names:
> -    minItems: 1
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - const: mhdptx
> +      - const: mhdptx-sapb
>        - const: j721e-intg
>  
>    clocks:
> @@ -53,6 +56,11 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  hdcp-config:
> +    maxItems: 1
> +    description:
> +      HDCP version supported. Bit [0]:HDCP2.2 [1]:HDCP1.4.
> +

Is this a property of the hardware, that is, are there multiple versions
of this IP core covered by the same compatible string that support HDCP
1.4 only, DHCP 2.2 only or both ? Or is it a way to select what a given
system will offer ?

>    interrupts:
>      maxItems: 1
>  
> @@ -98,15 +106,15 @@ allOf:
>      then:
>        properties:
>          reg:
> -          minItems: 2
> +          minItems: 3
>          reg-names:
> -          minItems: 2
> +          minItems: 3
>      else:
>        properties:
>          reg:
> -          maxItems: 1
> +          maxItems: 2
>          reg-names:
> -          maxItems: 1
> +          maxItems: 2
>  
>  required:
>    - compatible
> @@ -129,8 +137,9 @@ examples:
>  
>          mhdp: dp-bridge@f0fb000000 {
>              compatible = "cdns,mhdp8546";
> -            reg = <0xf0 0xfb000000 0x0 0x1000000>;
> -            reg-names = "mhdptx";
> +            reg = <0xf0 0xfb000000 0x0 0x1000000>,
> +                  <0x0 0x4f48000 0x0 0x74>;
> +            reg-names = "mhdptx", "mhdptx-sapb";
>              clocks = <&mhdp_clock>;
>              phys = <&dp_phy>;
>              phy-names = "dpphy";

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
