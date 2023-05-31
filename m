Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 764387189FB
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 21:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613D410E50A;
	Wed, 31 May 2023 19:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D268E10E50A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 19:18:11 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-96fe88cd2fcso1035176466b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 12:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685560689; x=1688152689;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n8yZnUSUyLkwq+12ZSohTFTCzqIRJUZ2nM3Mlv8CU5Y=;
 b=jfD6XoFfiHEkI6WEaIYim/I1vasSk7JBwLyK4bqK4cFbR1EzpJgrKmMCfMG2T7+66I
 eW9Llzy3mxw+298elWEbeXxW3aL9FHM2KkaiElY/aP0PwzJaOdpdzKzjKdCRWlFPPo79
 1Ba993qLQcmyLM2pyDgBcXT05a27vA/WHrnCkXEvROkoSk4OCIZDZrfFvh+dq91xiBsw
 54J8wYpJxdGkStZv3l1ftgxsmOABW8duZRt33/F/pky5TsBbkgODNRf4LNtlGg7O8DDj
 8+N9LbG+N8V1lWuYI3pxgJsOi6uboOUv7nCQiIqsAn8b1axOFJe6mIxfXZmOPsiXSegQ
 t0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685560689; x=1688152689;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n8yZnUSUyLkwq+12ZSohTFTCzqIRJUZ2nM3Mlv8CU5Y=;
 b=U2w8n66uYB/nq/no4VxnA+dc3pM1gQW0PYeg9xmFP5eS3dZrUmGOvyyZuJTxuVf+4S
 tavt1gQVxH+mRHLwO3MLrBKUnADHE/Nbkklifivo0NWZ8ow4ubVQdP+OiYcRZTdt06kY
 SsZwr+/NrefP/Zo7U7wSYbkk/ca4hT0gDZjUwm7TzumZgpV9rc2ss5dDqbGJ9RqjPI5T
 Ko2fkIXAPRzFMdPEnvEvrLg9jnWOXNoUG/LK0Egqm68xbKa4zElk39nlmaoJN8v1LDnz
 SLHNGG+RaNL2wAHmwUvcM/rk/vOD2XShZJ1fI3Mdqh0v/pBSfQivzbIo+J+SwQxf4nfV
 xUww==
X-Gm-Message-State: AC+VfDw0cqJbt6kv7qIYgXr6ghK6bKU7ENfCEnd/bYG9h4iBy2+2EAqL
 3P5/wAMwybUo3LFgTJSJswlf2A==
X-Google-Smtp-Source: ACHHUZ5gK/WE6u0PV2dcnqH5U9LEV1u5gmQFRpnBznnE0qZHTuxx3M0czajnS24w4LjSg6uOfAD9Uw==
X-Received: by 2002:a17:906:5d10:b0:969:813c:9868 with SMTP id
 g16-20020a1709065d1000b00969813c9868mr5844763ejt.18.1685560689407; 
 Wed, 31 May 2023 12:18:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 qw23-20020a170906fcb700b0096f71ace804sm9491344ejb.99.2023.05.31.12.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 12:18:08 -0700 (PDT)
Message-ID: <ce7366d0-616d-f5f4-56be-714e65a0a96e@linaro.org>
Date: Wed, 31 May 2023 21:18:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next v5 2/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Content-Language: en-US
To: Justin Chen <justin.chen@broadcom.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com
References: <1684969313-35503-1-git-send-email-justin.chen@broadcom.com>
 <1684969313-35503-3-git-send-email-justin.chen@broadcom.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1684969313-35503-3-git-send-email-justin.chen@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: andrew@lunn.ch, conor+dt@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, christian.koenig@amd.com,
 simon.horman@corigine.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 sumit.semwal@linaro.org, edumazet@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/05/2023 01:01, Justin Chen wrote:
> From: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> Add a binding document for the Broadcom ASP 2.0 Ethernet
> controller.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> ---
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
>  .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 149 +++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> new file mode 100644
> index 000000000000..c4cd24492bfd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> @@ -0,0 +1,149 @@
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
> +  '#address-cells':

Judging by more comments, there will be a v6, thus please also use
consistent quotes - either ' or ".

> +    const: 1
> +  '#size-cells':
> +    const: 1
> +
> +  compatible:

As Conor pointed out, compatible is always first.

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
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^port@[0-9]+$":
> +        type: object
> +
> +        $ref: ethernet-controller.yaml#
> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +            description: Port number
> +
> +          brcm,channel:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: ASP channel number

Why do you need it? reg defines it. Your description does not explain
here much, except copying property name. Can we please avoid
descriptions which just copy name?

> +
> +        required:
> +          - reg
> +          - brcm,channel
> +
> +    additionalProperties: false
> +
> +patternProperties:
> +  "^mdio@[0-9a-f]+$":

Isn't mdio a property of each ethernet port? Existing users
(e.g.bcmgenet, owl-emac, switches) do it that way...

Otherwise how do you define relation-ship? Can one mdio fit multiple ports?


> +    type: object
> +    $ref: brcm,unimac-mdio.yaml
> +
> +    description:
> +      ASP internal UniMAC MDIO bus
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks


Best regards,
Krzysztof

