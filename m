Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C74B9BE4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 10:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1625C10ED5D;
	Thu, 17 Feb 2022 09:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB1310ED5D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 09:21:19 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C27C4405E0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645089677;
 bh=iGUMpZLTiOK0bpy2WJNAycUkijWoscQeYWckgRO2kR4=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=o2u2y3Xs0yA65LfBb785cCqW8zzomnKX4ItGUOOsSuaBhD4qBuaWIGKTvCGzLw6Ns
 rWjVLo3DzUmkN/vvf6uL2JxjZrGW6sqAqcJCuWPODxhxjK9b4/SXWuDmIkVj6wd/uO
 ub4XpLidJT8ZcTuN+K+6hNae5eMzVgrr+VNJ52EinqNt2KKC2Bx2pG6NQcLG434zdF
 xlpNlPMM2TG3TSm/SEGhzKSzZzkkSQ7hZJw3yKMl2tMNYqftNROBPMYeIZP+Q7jJah
 GPWfn6Ji+obE29/S7GSETtU6vbJWQJJjtMFoKn5/V+Xy4RPHY9WUn+2myHO71l25mV
 QvHqHeFov3nqw==
Received: by mail-ed1-f69.google.com with SMTP id
 b26-20020a056402139a00b004094fddbbdfso3171172edv.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 01:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iGUMpZLTiOK0bpy2WJNAycUkijWoscQeYWckgRO2kR4=;
 b=Qu1yyBAMx41p0eVbxDGcADiZqhoKL6M/lUHY5ibNuFVm7M8Bfm6UJPyaOYOKRSmwt4
 JuP68Zi+GUnUAded4/RFgAEdZYqVD6T6pFPylJ+lAEo1fWLadU0PhGHuBRb6yegf0s8T
 XSebJX0hWwEQ22uKUxWJRPIWGBuhxuAt1aUJHbEtebvVXXmWquXfuFqzmC7dDTFbFIh2
 7/pR4prNnVdNPCFoTSkQHy8UInx1Ul8bTbbgRML40PRXdX/igxfJYdHle9oBRg09dVqH
 1t7F1CVFC1tqsa4DU2/8i9zTte68LK3DIOxBVvWvNO+4zvjgT7MP6xyfluAyWPn/LxmY
 BbKg==
X-Gm-Message-State: AOAM533IOAIIuTv6Gcu4RtyD7PlsjhPgfdZDKZE5g8C6gtozNkO08x15
 WskGacgzdDMcwRuV6SNA15Umy4Faf2qj103TeHb9Q0fN3s476FwKlE24/nPT2l07ZaR61q4GJvS
 BYd8yzecEvVrPOdAwIM11V8tsS5gLQ8BZtnNMXZuW3rFLFQ==
X-Received: by 2002:a17:906:6d09:b0:6b9:2e0e:5bdd with SMTP id
 m9-20020a1709066d0900b006b92e0e5bddmr1550157ejr.246.1645089677440; 
 Thu, 17 Feb 2022 01:21:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrSkSRiW1n+S2aXKQGX6pReGWI5bN2uBCxC4z+CWEqBvQjNv71P/WiSARBLKend/Tl14hoJg==
X-Received: by 2002:a17:906:6d09:b0:6b9:2e0e:5bdd with SMTP id
 m9-20020a1709066d0900b006b92e0e5bddmr1550138ejr.246.1645089677191; 
 Thu, 17 Feb 2022 01:21:17 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id h11sm956107ejg.109.2022.02.17.01.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 01:21:16 -0800 (PST)
Message-ID: <36445c86-036e-0942-a9a4-919595886c67@canonical.com>
Date: Thu, 17 Feb 2022 10:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/6] dt-bindings: display: imx: Add EPDC
Content-Language: en-US
To: Andreas Kemnade <andreas@kemnade.info>, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alistair@alistair23.me, samuel@sholland.org,
 josua.mayer@jm0.eu, letux-kernel@openphoenux.org
References: <20220206080016.796556-1-andreas@kemnade.info>
 <20220206080016.796556-2-andreas@kemnade.info>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220206080016.796556-2-andreas@kemnade.info>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/02/2022 09:00, Andreas Kemnade wrote:
> Add a binding for the Electrophoretic Display Controller found at least
> in the i.MX6.
> The timing subnode is directly here to avoid having display parameters
> spread all over the plate.
> 
> Supplies are organized the same way as in the fbdev driver in the
> NXP/Freescale kernel forks. The regulators used for that purpose,
> like the TPS65185, the SY7636A and MAX17135 have typically a single bit to
> start a bunch of regulators of higher or negative voltage with a
> well-defined timing. VCOM can be handled separately, but can also be
> incorporated into that single bit.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../bindings/display/imx/fsl,mxc-epdc.yaml    | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> new file mode 100644
> index 000000000000..7e0795cc3f70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,mxc-epdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX6 EPDC
> +
> +maintainers:
> +  - Andreas Kemnade <andreas@kemnade.info>
> +
> +description: |
> +  The EPDC is a controller for handling electronic paper displays found in
> +  i.MX6 SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx6sl-epdc
> +      - fsl,imx6sll-epdc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: Pixel clock
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: pix
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vscan-holdoff:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1

Except what Rob already said, all these are not arrays, so maxItems is
not appropriate. You can define minimum/maximum values instead.

> +
> +  sdoed-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  sdoed-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  sdoez-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  sdoez-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  gdclk-hp-offs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  gdsp-offs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  gdoe-offs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  gdclk-offs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  num-ce:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  timing:
> +    $ref: /display/panel/panel-timing.yaml#
> +
> +  DISPLAY-supply:
> +    description:
> +      A couple of +/- voltages automatically powered on in a defintive order

Typo, definitive?

> +
> +  VCOM-supply:
> +    description: compensation voltage
> +
> +  V3P3-supply:

All of supplies names - lowercase.

> +    description: V3P3 supply
> +
> +  epd-thermal-zone:
> +    description:
> +      Zone to get temperature of the EPD from, practically ambient temperature.

Is it a phandle?

> +
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - vscan-holdoff
> +  - sdoed-width
> +  - sdoed-delay
> +  - sdoez-width
> +  - sdoez-delay
> +  - gdclk-hp-offs
> +  - gdsp-offs
> +  - gdoe-offs
> +  - gdclk-offs
> +  - num-ce
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx6sl-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    epdc: epdc@20f4000 {

Generic node name, e.g. display-controller

> +        compatible = "fsl,imx6sl-epdc";
> +        reg = <0x020f4000 0x4000>;
> +        interrupts = <0 97 IRQ_TYPE_LEVEL_HIGH>;

s/0/GIC_SPI/

> +        clocks = <&clks IMX6SL_CLK_EPDC_AXI>, <&clks IMX6SL_CLK_EPDC_PIX>;
> +        clock-names = "axi", "pix";
> +


Best regards,
Krzysztof
