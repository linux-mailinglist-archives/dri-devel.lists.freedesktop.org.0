Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BFE343231
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 13:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447E26E1CF;
	Sun, 21 Mar 2021 12:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66856E1CF
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 12:01:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB9806EF;
 Sun, 21 Mar 2021 13:01:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616328077;
 bh=uQPPcJrUWiDnFYI/0TmpYQ30SpOmt42O1YYziYPGS5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gXy+qJIBEtJKf3TNhvRwWvjBf46zHFbguuExd643koDTmpiopv294YiW5mk4n+n0R
 hGUrXQ09cfzImL7ZuQnb6jFBPaounN73se/jZJN70ifDG7asFCSZiep8DlTo42X0GS
 CPQPnohxNwgt5R4lNrvOiVU3+k1MBJEPzTnq5A8g=
Date: Sun, 21 Mar 2021 14:00:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v6 1/5] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
Message-ID: <YFc1ZlmSiNJOAoOl@pendragon.ideasonboard.com>
References: <cover.1616135353.git.xji@analogixsemi.com>
 <4b09b40ce53c5b5fe7d2ba65a3c7a1b23f6eec04.1616135353.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b09b40ce53c5b5fe7d2ba65a3c7a1b23f6eec04.1616135353.git.xji@analogixsemi.com>
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
Cc: Nicolas Boichat <drinkcat@google.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 Mark Brown <broonie@kernel.org>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Bernie Liang <bliang@analogixsemi.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin,

Thank you for the patch.

On Fri, Mar 19, 2021 at 02:32:39PM +0800, Xin Ji wrote:
> Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
> lane1 swing register array define, and audio enable flag.
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../display/bridge/analogix,anx7625.yaml      | 58 ++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index c789784efe30..3f54d5876982 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -34,6 +34,26 @@ properties:
>      description: used for reset chip control, RESET_N pin B7.
>      maxItems: 1
>  
> +  analogix,lane0-swing:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 20
> +    description:
> +      an array of swing register setting for DP tx lane0 PHY, please don't
> +      add this property, or contact vendor.

DT properties need to be documented. Contacting the vendor doesn't count
as documentation I'm afraid.

> +
> +  analogix,lane1-swing:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 20
> +    description:
> +      an array of swing register setting for DP tx lane1 PHY, please don't
> +      add this property, or contact vendor.
> +
> +  analogix,audio-enable:
> +    type: boolean
> +    description: let the driver enable audio HDMI codec function or not.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -41,13 +61,43 @@ properties:
>        port@0:
>          $ref: /schemas/graph.yaml#/properties/port
>          description:
> -          Video port for MIPI DSI input.
> +          MIPI DSI/DPI input.
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +              bus-type: true
> +              data-lanes: true
> +
> +            required:
> +              - remote-endpoint
> +
> +        required:
> +          - endpoint
> +
>  
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
>          description:
>            Video port for panel or connector.
>  
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +            required:
> +              - remote-endpoint
> +
>      required:
>        - port@0
>        - port@1
> @@ -73,6 +123,10 @@ examples:
>              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
>              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
>  
> +            analogix,audio-enable;
> +            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> +            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> +
>              ports {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> @@ -81,6 +135,8 @@ examples:
>                      reg = <0>;
>                      anx7625_in: endpoint {
>                          remote-endpoint = <&mipi_dsi>;
> +                        bus-type = <5>;
> +                        data-lanes = <0 1 2 3>;
>                      };
>                  };
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
