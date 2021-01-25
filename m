Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68750302709
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 16:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1524589A61;
	Mon, 25 Jan 2021 15:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6EB89A61
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 15:41:46 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id h192so15223668oib.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 07:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B8cSsgK1OJbt9UtsbW56xNd3MLuKfJjKmdscWoF6SM0=;
 b=jbWdijQUot/F5ZWJ0Z+QwH10Ubs+Rdam0ffTeYBxPidijwF+2fcD+w1dj96MAjoMwj
 wrJoTFZMEhA2t3kwL3ya/wMOaXnyXopM+rV1Ary/oEMX5hfclR6OZC6+nE0iuUOFTt8p
 6aV99SIGBroc+ML45KzCqeYp36yYiVbJLcp50StYhpgAYvVvK61a8OUmQ20OtvyUyV0f
 NgszzUL/jbeiX1v3HO+lIweCefgMn52UCXhzLlNATb+tcpv5UzGJBdYbo3e1jJJYYh+5
 MXWGwMX7XSwf0OhcX7ZGoYjcQ0GzPru+ZJvCUTTZj3KemuGvryST2f969BdQR7S/u5aQ
 rS2Q==
X-Gm-Message-State: AOAM531qcmnSRCf+fJ/lB4wGMCszeWDwaWP35FDRQx78bttl/nbcNIs2
 q3jScRXURZlZ6RcUiGQOgw==
X-Google-Smtp-Source: ABdhPJw7rPbq44YNT18tcIBSrVSoi2LhkyC7PmEte7IMU+tVb7Cgdi2UXZwo67k1IJ62kD5qcmagfw==
X-Received: by 2002:aca:b4d5:: with SMTP id d204mr450168oif.165.1611589306006; 
 Mon, 25 Jan 2021 07:41:46 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a96sm3514973otb.12.2021.01.25.07.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 07:41:44 -0800 (PST)
Received: (nullmailer pid 417209 invoked by uid 1000);
 Mon, 25 Jan 2021 15:41:43 -0000
Date: Mon, 25 Jan 2021 09:41:43 -0600
From: Rob Herring <robh@kernel.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v3 1/3] dt-bindings:drm/bridge:anx7625:add HDCP support
 flag and swing reg
Message-ID: <20210125154143.GA390777@robh.at.kernel.org>
References: <cover.1611572142.git.xji@analogixsemi.com>
 <75e29d7386df2ebca4a8e3f0b91c8370a4a8f74f.1611572143.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75e29d7386df2ebca4a8e3f0b91c8370a4a8f74f.1611572143.git.xji@analogixsemi.com>
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
Cc: Nicolas Boichat <drinkcat@google.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 07:12:21PM +0800, Xin Ji wrote:
> Add 'bus-type' and 'data-lanes' define for port0, add HDCP support
> flag and DP tx lane0 and lane1 swing register array define.
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml  | 57 ++++++++++++++++++++--
>  1 file changed, 54 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 60585a4..3b1cbe0 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -34,23 +34,69 @@ properties:
>      description: used for reset chip control, RESET_N pin B7.
>      maxItems: 1
>  
> +  analogix,lane0-swing:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      an array of swing register setting for DP tx lane0 PHY, please don't
> +      add this property, or contact vendor.
> +
> +  analogix,lane1-swing:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      an array of swing register setting for DP tx lane1 PHY, please don't
> +      add this property, or contact vendor.
> +
> +  analogix,hdcp-support:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: indicate the DP tx HDCP support or not.

Sounds like a boolean.

> +
>    ports:
>      type: object
> +    additionalProperties: false
>  
>      properties:
>        port@0:
>          type: object
>          description:
> -          Video port for MIPI DSI input.
> +          Video port for MIPI input.

You're going to need to rebase this one drm-misc-next which uses the 
graph schema now.

> +
> +        properties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            # Properties described in
> +            # Documentation/devicetree/bindings/media/video-interfaces.txt
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
>  
>        port@1:
>          type: object
>          description:
>            Video port for panel or connector.
>  
> +        properties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            required:
> +              - remote-endpoint
> +
> +        required:
> +          - endpoint
> +
>      required:
> -        - port@0
> -        - port@1
> +      - port@0
> +      - port@1
>  
>  required:
>    - compatible
> @@ -73,6 +119,10 @@ examples:
>              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
>              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
>  
> +            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> +            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> +            analogix,hdcp-support = <0>;
> +
>              ports {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> @@ -81,6 +131,7 @@ examples:
>                      reg = <0>;
>                      anx7625_in: endpoint {
>                          remote-endpoint = <&mipi_dsi>;
> +                        bus-type = <5>;
>                      };
>                  };
>  
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
