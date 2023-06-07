Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BE572718F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 00:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B6610E55D;
	Wed,  7 Jun 2023 22:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7D710E55D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 22:24:17 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-33b0cae115bso9806135ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 15:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686176656; x=1688768656;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AxfRqxa7wvCqUms2E38nnMVQFutEDvjD8qThmFlsqqQ=;
 b=RX7E3u/S1oN9YtJ5t4DinnCYUFOD2+FvtjxIzrFuoyqvbxNOs9ZMlnWjOIUI/zHhCe
 H7ErbmW2/vrNi0OUq9TDhrkoRhhq2oegCzke0ouZ7lmmXeoJJML7uvbOTAuNn70FloUU
 HsH21ofLx4Eaegvjik08ZeflfwNYo2BTMRW9gTHW4otyJgeT8E1o10T9zm9eONMtnTRC
 5fjI83jhBPA9c25J0SWD38W7oYdQEAA1BoOTvALCCRCm/fdGHU6bmgKRdx/cf+jQQqA3
 1yBkW3LasMchP8zCMOnQoL3MtX5mhgpxrZ/lGoWuBZ13+lWc0rf/IwRUClATlLxt+1wO
 lutw==
X-Gm-Message-State: AC+VfDxg8KgsbxB4qSWos0BNif87JqDRYUOdOdNXQ2GunJBd7u0JedcI
 O0migCq173Dx6HWo4Mpr2g==
X-Google-Smtp-Source: ACHHUZ6g3hXuPC4eptqJpM9Vm8vqGL9XoBgHJL+4Z05vG5yQgGzwgK5jP92Mg64iLxbMmF/99uNaQg==
X-Received: by 2002:a92:d341:0:b0:331:1834:7494 with SMTP id
 a1-20020a92d341000000b0033118347494mr9400434ilh.20.1686176656039; 
 Wed, 07 Jun 2023 15:24:16 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 dq31-20020a0566384d1f00b0041f5061884asm2602719jab.29.2023.06.07.15.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 15:24:15 -0700 (PDT)
Received: (nullmailer pid 88530 invoked by uid 1000);
 Wed, 07 Jun 2023 22:24:13 -0000
Date: Wed, 7 Jun 2023 16:24:13 -0600
From: Rob Herring <robh@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v6 2/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Message-ID: <20230607222413.GA84415-robh@kernel.org>
References: <1685657551-38291-1-git-send-email-justin.chen@broadcom.com>
 <1685657551-38291-3-git-send-email-justin.chen@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1685657551-38291-3-git-send-email-justin.chen@broadcom.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, andrew@lunn.ch, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, edumazet@google.com,
 bcm-kernel-feedback-list@broadcom.com, krzysztof.kozlowski+dt@linaro.org,
 simon.horman@corigine.com, kuba@kernel.org, christian.koenig@amd.com,
 pabeni@redhat.com, sumit.semwal@linaro.org, davem@davemloft.net,
 hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 01, 2023 at 03:12:27PM -0700, Justin Chen wrote:
> From: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> Add a binding document for the Broadcom ASP 2.0 Ethernet
> controller.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> ---
> v6
> 	- Moved compatible to the top
> 	- Changed quotes to be consistent
> 	- Elaborated on brcm,channel description
> 
> v5
> 	- Fix compatible string yaml format to properly capture what we want
> 
> v4
>         - Adjust compatible string example to reference SoC and HW ver
> 
> v3
>         - Minor formatting issues
>         - Change channel prop to brcm,channel for vendor specific format
>         - Removed redundant v2.0 from compat string
>         - Fix ranges field
> 
> v2
>         - Minor formatting issues
> 
>  .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 153 +++++++++++++++++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> new file mode 100644
> index 000000000000..3f2bf64b65c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> @@ -0,0 +1,153 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/brcm,asp-v2.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom ASP 2.0 Ethernet controller
> +
> +maintainers:
> +  - Justin Chen <justin.chen@broadcom.com>
> +  - Florian Fainelli <florian.fainelli@broadcom.com>
> +
> +description: Broadcom Ethernet controller first introduced with 72165
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - brcm,bcm74165-asp
> +          - const: brcm,asp-v2.1
> +      - items:
> +          - enum:
> +              - brcm,bcm72165-asp
> +          - const: brcm,asp-v2.0
> +
> +  "#address-cells":
> +    const: 1
> +  "#size-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges: true
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: RX/TX interrupt
> +      - description: Port 0 Wake-on-LAN
> +      - description: Port 1 Wake-on-LAN
> +
> +  clocks:
> +    maxItems: 1
> +
> +  ethernet-ports:
> +    type: object
> +    properties:
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^port@[0-9]+$":
> +        type: object
> +
> +        $ref: ethernet-controller.yaml#

           unevaluatedProperties: false

> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +            description: Port number
> +
> +          brcm,channel:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: |
> +              ASP Channel Number
> +
> +              The depacketizer channel that consumes packets from
> +              the unimac/port.
> +
> +        required:
> +          - reg
> +          - brcm,channel
> +
> +    additionalProperties: false
