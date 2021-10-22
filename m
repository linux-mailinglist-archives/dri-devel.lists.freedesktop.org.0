Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 559A5437248
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 08:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A6189DC0;
	Fri, 22 Oct 2021 06:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8C189DC0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 06:51:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B902E276;
 Fri, 22 Oct 2021 08:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634885514;
 bh=Ow6sSnuG+BhhS9fwW+LpDPdkihVmkI3bNLiF7Er3Vpc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gknfHsIl2kVd7ZeoMejDEeqMwd9LtGEuFHptNZw3p9jm9TxKq82nQLlCyGzoTqjH8
 eT3nxK6eDvtDrZGRKuvOZCFbgCst0+VDpzjyYmBNdumfhXHVG5+IGM4f32+XUMiGlW
 rqubdkeuKr+f2LnA95y6j2ctRQx+NxBeS8bSTsrE=
Date: Fri, 22 Oct 2021 09:51:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/7] dt-bindings: display: sun4i: Add LVDS Dual-Link
 property
Message-ID: <YXJfdivkCx2NHCRQ@pendragon.ideasonboard.com>
References: <20210929084234.1271915-1-maxime@cerno.tech>
 <20210929084234.1271915-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210929084234.1271915-4-maxime@cerno.tech>
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

Hi Maxime,

Thank you for the patch.

I may have written "Add LVDS link companion" property in the subject
line.

On Wed, Sep 29, 2021 at 10:42:30AM +0200, Maxime Ripard wrote:
> The Allwinner SoCs with two TCONs and LVDS output can use both to drive an
> LVDS dual-link. Add a new property to express that link between these two
> TCONs.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> index 3a7d5d731712..d01b0689785c 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> @@ -113,6 +113,12 @@ properties:
>            - const: edp
>            - const: lvds
>  
> +  link-companion:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: >
> +      Phandle to the other TCON in the system used to drive a dual-link LVDS
> +      output.

Should this be expanded to indicate that the property shall be set in
both TCON instances ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  

-- 
Regards,

Laurent Pinchart
