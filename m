Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25D26D9BEE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 17:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B132510E195;
	Thu,  6 Apr 2023 15:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CA710E195
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 15:15:45 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-17aeb49429eso42684501fac.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 08:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680794145;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DaH4L1i/JuWu0RboKl6tYhjCF4zs4iv94Q8hNFPaJg4=;
 b=RnayrLcPccDxqHsFysdXFKBXH5RJ74IRwuQp/c7HQ4giNm8KFt3OKE7Vxu700eDTA0
 VxFXQnmNDGDAleHcSLldl6wTB2HoP6SF1yQqPmCFrzY3xWq83BpzG7q+Rc2QOr4/hEkO
 9+QuNyIdc/HT2RFqlNW0Zymd0OCroD1RCdqhvQxabTz4xvEVQLsKrHFNWRXQvWHVQqUR
 UhE26AjY/ZcPSWkFJtS7F8uzvtbzUNbF9uXu1x9+IJcITF4sg/y7uL67LTh1MX+y3/TB
 Gm0pCNcJfDREMja2xGN3Ukxw0wC1NbWMAuux/FkEgabD5ueOvt04qfTpjiSxKXsFvvi1
 0+Nw==
X-Gm-Message-State: AAQBX9dD0rZhi+02764uqps33t2TrmHdoV0fIFV8c2spcyeTcSzV73UU
 7RbXXj7TevK2tI+LADf//Q==
X-Google-Smtp-Source: AKy350ab6kYansrJ3l5RjxAfs2sJ/EBZU6O1HI4iQMiG6ufcJX2X+MYT39U+pMtntzqTGpOBuRaX9Q==
X-Received: by 2002:a05:6871:14d:b0:17a:f6df:7f21 with SMTP id
 z13-20020a056871014d00b0017af6df7f21mr5346178oab.2.1680794144957; 
 Thu, 06 Apr 2023 08:15:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f11-20020a9d7b4b000000b0069d602841e7sm755208oto.72.2023.04.06.08.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 08:15:44 -0700 (PDT)
Received: (nullmailer pid 3114304 invoked by uid 1000);
 Thu, 06 Apr 2023 15:15:43 -0000
Date: Thu, 6 Apr 2023 10:15:43 -0500
From: Rob Herring <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v15 08/10] dt-bindings: display: bridge: it6505: Add
 mode-switch support
Message-ID: <20230406151543.GA3098002-robh@kernel.org>
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-9-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331091145.737305-9-treapking@chromium.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 05:11:43PM +0800, Pin-yen Lin wrote:
> ITE IT6505 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.
> 
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> (no changes since v12)
> 
> Changes in v12:
> - Fixed the schema of "data-lanes" property for it6505
> - Reworded the description of the mode-switch property
> 
> Changes in v11:
> - Updated the description of the endpoints in the bindings
> - Referenced video-interfaces.yaml instead for the endpoints binding
> - Removed duplicated definitions from inherited schema
> 
> Changes in v9:
> - Fixed subject prefix again
> - Changed the naming of the example node for it6505
> 
> Changes in v8:
> - Updated bindings for data-lanes property
> - Fixed subject prefix
> 
> Changes in v7:
> - Fixed issues reported by dt_binding_check.
> - Updated the schema and the example dts for data-lanes.
> - Changed to generic naming for the example dts node.
> 
> Changes in v6:
> - Remove switches node and use endpoints and data-lanes property to
>   describe the connections.
> 
>  .../bindings/display/bridge/ite,it6505.yaml   | 101 +++++++++++++++---
>  1 file changed, 88 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index c9a882ee6d98..348b02f26041 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -75,22 +75,49 @@ properties:
>        port@1:
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
> -        description: Video port for DP output
> +        description:
> +          Video port for DP output. Each endpoint connects to a video output
> +          downstream, and the "data-lanes" property is used to describe the pin
> +          connections. 0, 1, 2, 3 in "data-lanes" maps to TX0, TX1, TX2, TX3,
> +          respectively.
>  
> -        properties:
> -          endpoint:
> -            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +
> +        patternProperties:
> +          "^endpoint@[01]$":
> +            $ref: /schemas/media/video-interfaces.yaml#
>              unevaluatedProperties: false
>  
>              properties:
> +              reg: true
> +
> +              remote-endpoint: true

You don't need to list these 2.

> +
>                data-lanes:
> -                minItems: 1
> -                uniqueItems: true
> -                items:
> -                  - enum: [ 0, 1 ]
> -                  - const: 1
> -                  - const: 2
> -                  - const: 3
> +                oneOf:
> +                  - items:
> +                      - enum: [0, 3]

Only lane 1 wasn't valid? If so, mention that in the commit message.

> +
> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +
> +                  - items:
> +                      - const: 3
> +                      - const: 2
> +
> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +                      - const: 2
> +                      - const: 3

Isn't this the default if 'data-lanes' is omitted.

> +
> +              mode-switch:
> +                type: boolean
> +                description: Serves as Type-C mode switch if present.
> +
> +            required:
> +              - reg
> +              - remote-endpoint

required can be dropped.

>  
>      required:
>        - port@0
> @@ -102,7 +129,6 @@ required:
>    - pwr18-supply
>    - interrupts
>    - reset-gpios
> -  - extcon
>    - ports
>  
>  additionalProperties: false
> @@ -139,8 +165,11 @@ examples:
>                  };
>  
>                  port@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
>                      reg = <1>;
> -                    it6505_out: endpoint {
> +                    it6505_out: endpoint@0 {
> +                        reg = <0>;
>                          remote-endpoint = <&dp_in>;
>                          data-lanes = <0 1>;
>                      };
> @@ -148,3 +177,49 @@ examples:
>              };
>          };
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {

Why do we need a whole new example? Just extend the existing example 
with new properties/nodes.

Rob
