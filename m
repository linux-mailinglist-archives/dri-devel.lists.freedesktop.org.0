Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EDB6DF8DB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E740F10E839;
	Wed, 12 Apr 2023 14:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AC010E839
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:43:02 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 q33-20020a056830442100b006a419d3fd20so1136178otv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681310581; x=1683902581;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+FI6J1Aq3xprTpYhYsMGs52RQmrOIvrXof6A+8YxDL0=;
 b=XHYBimxHLOiDuekXOGLbzMH1kCRGStzE1mbeQ9gcRz5t+3olWVt3pLS97D4AOs3nWC
 NVmamgUfC/waBbtZhtjI/wl1LRkMXPoeIccHuT6og7CNY/h9FKxmP7C1Db51pCw+4B2j
 Uc2FGRhQRD4sxJcj5y2XGv5xBBqFeXt+hFUdSJp1MMg0MeF+db9wbKwH3ya03mmqTWmW
 +LDhM9zF/flfXgNSuOEJhAZ6VAxsda7eKPAY+hUqNp1oMnwoyfycK0xIB9JixdzNs4Tt
 IzFM+Ck67D1CEiY8M+EUOmev1HC+YwZgjDYrbuk+nog9R7H/heTNbJRlM8X49eyLOXkd
 RLLw==
X-Gm-Message-State: AAQBX9fNTtDkfzsCycObSNwsXG2OloRJhB9uzQV+3+sLieYtcQ5msfdM
 J5lmwwVbTExG8wXxiAnROw==
X-Google-Smtp-Source: AKy350Yp6Elm43BeF/wg/B27ZoM+VDpsZRo7DkdSXDConjZkBM+2hM68wlR0kA18HoviM6WOWgKmtA==
X-Received: by 2002:a9d:4d81:0:b0:69f:97e1:3bbb with SMTP id
 u1-20020a9d4d81000000b0069f97e13bbbmr1186557otk.17.1681310581606; 
 Wed, 12 Apr 2023 07:43:01 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k22-20020a056830151600b0068bd922a244sm6574055otp.20.2023.04.12.07.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 07:43:01 -0700 (PDT)
Received: (nullmailer pid 2336874 invoked by uid 1000);
 Wed, 12 Apr 2023 14:43:00 -0000
Date: Wed, 12 Apr 2023 09:43:00 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: samsung,mipi-dsim: Add
 'lane-polarities'
Message-ID: <20230412144300.GA2328336-robh@kernel.org>
References: <20230406190354.1641352-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406190354.1641352-1-festevam@gmail.com>
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
Cc: marex@denx.de, neil.armstrong@linaro.org, Fabio Estevam <festevam@denx.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 04:03:53PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The Samsung DSIM IP block allows the inversion of the clock and
> data lanes.
> 
> Add an optional property called 'lane-polarities' that describes the
> polarities of the MIPI DSI clock and data lanes.
> 
> This property is useful for properly describing the hardware when the
> board designer decided to switch the polarities of the MIPI DSI
> clock and/or data lanes.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Rebased against drm-misc-next that has samsung,mipi-dsim.yaml.
> 
>  .../display/bridge/samsung,mipi-dsim.yaml     | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> index e841659e20cd..04eb440ade72 100644
> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> @@ -105,6 +105,35 @@ properties:
>            DSI output port node to the panel or the next bridge
>            in the chain.
>  
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base

No, this should be video-interfaces.yaml since you use properties from 
it.

> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                oneOf:
> +                  - minItems: 1
> +                    maxItems: 4
> +                    uniqueItems: true
> +                    items:
> +                      enum: [ 1, 2, 3, 4 ]

The h/w really supports any combination of lanes to be used?

> +                    description:
> +                      See ../../media/video-interfaces.yaml for details.
> +
> +              lane-polarities:
> +                minItems: 1
> +                maxItems: 5
> +                items:
> +                  enum: [ 0, 1 ]
> +                description:
> +                  See ../../media/video-interfaces.yaml for details.
> +                  The Samsung MIPI DSI IP requires that all the data lanes have
> +                  the same polarity.

Sounds like a constraint:

oneOf:
  - items:
      const: 0
  - items:
      const: 1

> +
> +            dependencies:
> +              lane-polarities: [data-lanes]
> +
>  required:
>    - clock-names
>    - clocks
> -- 
> 2.34.1
> 
