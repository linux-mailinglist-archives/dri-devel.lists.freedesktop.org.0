Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6718C60B1CE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 18:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E1110E3AC;
	Mon, 24 Oct 2022 16:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7833510E3AC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 16:37:48 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id y67so11444404oiy.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 09:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOoFVDrlFCXyPe4ykRkCLwV8gspUR1CaRwsm4ruVJbA=;
 b=Lfjiigs9dPr+50NqFgBudyeZpvSv7e1NUY/hVN+Efzu48r55UMumS/AuRS6MPioPuv
 tx9t7CfDwZrUmKMxwD1ljAc6Bnn9XVhxR0Nl+Xs10UNvK4RZkMCcI49up2LG724Yg0Jz
 4/rDhsekGCQKTq1tkAtxkBFIYgOJ9dPjgYTG96IK9LNIBGxbiYlmhBFUl0XXGNHFEFhn
 R8uqidiZ+v5zm7FZ7tDg3LWOY0vzgvnr8hH7Jcdex42tPE8llOuPeQ9fmcRDfD2IO5VI
 hW9Ipt+iR3/IYQBmnHzsS7DD8TpAeOxIVrF2VWwj+lcgmc4yWjWWDlQOQDGEd9NZ8Cru
 jfsQ==
X-Gm-Message-State: ACrzQf1oM1cAMbgk4Qm2slzWkRypHdHHOXqrar2uqP1P0EWLNhX9/OH4
 4b73j+HaLOaRzlChGAs+3A==
X-Google-Smtp-Source: AMsMyM7BYFIVCv9m681xgXMIdDkPKek6Ray0BuFNbjaOLDFF1olqQy4TW/prVpLatIFhLXtzzy8dNg==
X-Received: by 2002:a05:6808:1483:b0:355:1d32:26ab with SMTP id
 e3-20020a056808148300b003551d3226abmr17317907oiw.120.1666629467514; 
 Mon, 24 Oct 2022 09:37:47 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y19-20020a544d93000000b0035437f4deefsm28390oix.26.2022.10.24.09.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 09:37:46 -0700 (PDT)
Received: (nullmailer pid 1890695 invoked by uid 1000);
 Mon, 24 Oct 2022 16:37:48 -0000
Date: Mon, 24 Oct 2022 11:37:48 -0500
From: Rob Herring <robh@kernel.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v5 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Message-ID: <20221024163748.GA1874793-robh@kernel.org>
References: <20221019093215.8204-1-allen.chen@ite.com.tw>
 <20221019093215.8204-2-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019093215.8204-2-allen.chen@ite.com.tw>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pin-Yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 05:32:13PM +0800, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> Add properties to restrict dp output data-lanes and clock.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it6505.yaml   | 89 +++++++++++++++++--
>  1 file changed, 83 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index 833d11b2303a7..8e607b6929fc9 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -52,9 +52,70 @@ properties:
>      maxItems: 1
>      description: extcon specifier for the Power Delivery
>  
> -  port:
> -    $ref: /schemas/graph.yaml#/properties/port
> -    description: A port node pointing to DPI host port node

No existing users you are breaking? The commit msg should explain.

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: A port node pointing to DPI host port node
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +
> +            properties:
> +              link-frequencies:
> +                minItems: 1
> +                maxItems: 1
> +                description: Allowed max link frequencies in Hz
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Video port for DP output
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                oneOf:
> +                  - minItems: 1
> +                    maxItems: 1
> +                    uniqueItems: true
> +                    items:
> +                      enum:
> +                        - 0
> +                        - 1
> +                    description: For one lane operation.
> +
> +                  - minItems: 2
> +                    maxItems: 2
> +                    uniqueItems: true
> +                    items:
> +                      enum:
> +                        - 0
> +                        - 1
> +                    description: For two lanes operation.
> +
> +                  - minItems: 4
> +                    maxItems: 4
> +                    uniqueItems: true
> +                    items:
> +                      enum:
> +                        - 0
> +                        - 1
> +                        - 2
> +                        - 3
> +                    description: For four lanes operation.

I would do just:

data-lanes:
  minItems: 1
  items:
    - enum: [ 0, 1 ]
    - const: 1
    - const: 2
    - const: 3

It does allow 3 lanes, but I don't think that's a big deal. What it does 
doesn't allow is any order and yours does.

Rob
