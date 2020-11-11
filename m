Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FAE2AF2F0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 15:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5386E02C;
	Wed, 11 Nov 2020 14:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE256E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 14:02:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AAC3A19;
 Wed, 11 Nov 2020 15:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1605103327;
 bh=6Z1/wh+8hONI84xujrOkT9PwzR2zTz2ecP9q5IMUpkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RNF3y0w9hT1PxFIpbQ3Vygjq+QpdQ2u7/xwliTUJVDq9Gi6Vc6kTCnDq+q3Ua5tXZ
 VkM40KBSKeGwNlv4LwmV8P55FHum94Cnj5cQRFafdl4CNn10QDgLvYvw/EnblHI1EW
 324vBFazsY7Wk5AF4oA/AXAKc+HtjkJ4GuiPwChI=
Date: Wed, 11 Nov 2020 16:02:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: panel: common: Add reference to
 graph schema
Message-ID: <20201111140204.GF4115@pendragon.ideasonboard.com>
References: <20201102203656.220187-1-robh@kernel.org>
 <20201102203656.220187-4-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102203656.220187-4-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Mon, Nov 02, 2020 at 02:36:56PM -0600, Rob Herring wrote:
> Now that we have a graph schema, reference it from the common panel
> schema.
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3: new patch
> 
>  .../devicetree/bindings/display/panel/panel-common.yaml    | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index cd6dc5461721..a3a72c574213 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -68,16 +68,15 @@ properties:
> 
>    # Connectivity
>    port:
> -    type: object
> +    $ref: /schemas/graph.yaml#/properties/port
> 
>    ports:
> -    type: object
> +    $ref: /schemas/graph.yaml#/properties/ports
>      description:
>        Panels receive video data through one or multiple connections. While
>        the nature of those connections is specific to the panel type, the
>        connectivity is expressed in a standard fashion using ports as specified
> -      in the device graph bindings defined in
> -      Documentation/devicetree/bindings/graph.txt.
> +      in the device graph bindings.
> 
>    ddc-i2c-bus:
>      $ref: /schemas/types.yaml#/definitions/phandle

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
