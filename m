Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 770BE5A0B65
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 10:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A912E10E08A;
	Thu, 25 Aug 2022 08:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2900B10E08A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 08:26:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE0A72B3;
 Thu, 25 Aug 2022 10:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661415968;
 bh=X4RKLM6nZha11KVzOR4E3qEaILGKdu9AsG61iMaOD6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GKqHIYed1FsvhTFUXye6GN7FYnGtdKtVnLewNV+R1gj8BitTCRU4Rf8Ca3y+Y8tLY
 bxJZab2tA4yoV99a6SzBDm/lr0DYW/IuQa19+n/pyCSWojsjDZSO0HjTlAc319HhSz
 5uV1iSXeKY9cN8BBWEXXx34FYFRd4Tr/Hq29K4vw=
Date: Thu, 25 Aug 2022 11:26:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: adi,adv75xx: Add missing graph
 schema references
Message-ID: <YwcyGfJ+vTx09cAN@pendragon.ideasonboard.com>
References: <20220823145649.3118479-12-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220823145649.3118479-12-robh@kernel.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Tue, Aug 23, 2022 at 09:56:43AM -0500, Rob Herring wrote:
> DT bindings using the graph binding must have references to the graph
> binding schema. These are missing from the adi,adv7511 and adi,adv7533
> bindings, so add them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bindings/display/bridge/adi,adv7511.yaml       | 14 ++++++--------
>  .../bindings/display/bridge/adi,adv7533.yaml       | 14 ++++++--------
>  2 files changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
> index f08a01dfedf3..5bbe81862c8f 100644
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
> @@ -117,23 +117,21 @@ properties:
>  
>    ports:
>      description:
> -      The ADV7511(W)/13 has two video ports and one audio port. This node
> -      models their connections as documented in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt
> -      Documentation/devicetree/bindings/graph.txt
> -    type: object
> +      The ADV7511(W)/13 has two video ports and one audio port.
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
>      properties:
>        port@0:
>          description: Video port for the RGB or YUV input.
> -        type: object
> +        $ref: /schemas/graph.yaml#/properties/port
>  
>        port@1:
>          description: Video port for the HDMI output.
> -        type: object
> +        $ref: /schemas/graph.yaml#/properties/port
>  
>        port@2:
>          description: Audio port for the HDMI output.
> -        type: object
> +        $ref: /schemas/graph.yaml#/properties/port
>  
>  # adi,input-colorspace and adi,input-clock are required except in
>  # "rgb 1x" and "yuv444 1x" modes, in which case they must not be
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> index f36209137c8a..987aa83c2649 100644
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> @@ -91,25 +91,23 @@ properties:
>  
>    ports:
>      description:
> -      The ADV7533/35 has two video ports and one audio port. This node
> -      models their connections as documented in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt
> -      Documentation/devicetree/bindings/graph.txt
> -    type: object
> +      The ADV7533/35 has two video ports and one audio port.
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
>      properties:
>        port@0:
>          description:
>            Video port for the DSI input. The remote endpoint phandle
>            should be a reference to a valid mipi_dsi_host_device.
> -        type: object
> +        $ref: /schemas/graph.yaml#/properties/port
>  
>        port@1:
>          description: Video port for the HDMI output.
> -        type: object
> +        $ref: /schemas/graph.yaml#/properties/port
>  
>        port@2:
>          description: Audio port for the HDMI output.
> -        type: object
> +        $ref: /schemas/graph.yaml#/properties/port
>  
>  required:
>    - compatible

-- 
Regards,

Laurent Pinchart
