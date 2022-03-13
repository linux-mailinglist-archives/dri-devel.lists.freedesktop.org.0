Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADB54D7689
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 16:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CCA10E0E6;
	Sun, 13 Mar 2022 15:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D9110E0E6
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 15:47:32 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id bi12so29061712ejb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 08:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+J66zNpFvN8CMM3eFxF/kEqoRx1HJ2YiAzWmUAb6vO8=;
 b=dXfgyHJlRycyFmYNI+UA5wny3/Co5JzNih+NaK5e8akdxH+fGsDM5KB303YiS0KhfF
 3+9l8AHevm5c+9wdn59lrDmTLKpk7/uetmNdimlnk7zwRty8joj6sJ9sV6il6lX7jr21
 VrxIHriJCRYL2isO63d16WKFfnkAMy5Lul28beGMBNG0oYjVMXa6s+k1oC43mt/3jDMb
 TRU70KgR/gXpwR9wO8tzeWdaxwHxAbk13DD0Z4g/8FklU+on6HZnmulFgjS3/SWJYiSp
 EBHKp5wlfVMX6/BsFzzet/j5QK5F2lToSy2tToyYhLC61WtOLkXUkf5Dmm3/uQtKwu+O
 d51Q==
X-Gm-Message-State: AOAM533QDMqgeyy4dcYBt5tJh+w/B4Ii4AdIOjKYU0CEZdqgfYqxy/tW
 wstgvWuXwiunTsyNE0q/k6k=
X-Google-Smtp-Source: ABdhPJzynD+14kn/ewgktDK8H2gtiMqqONT47lKLXWhLW0uOF3q+DOzEebJV/+b2qHrEwT9fS6yuXA==
X-Received: by 2002:a17:907:7b8b:b0:6da:bad3:88b6 with SMTP id
 ne11-20020a1709077b8b00b006dabad388b6mr15521339ejc.360.1647186451068; 
 Sun, 13 Mar 2022 08:47:31 -0700 (PDT)
Received: from [192.168.0.152] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.googlemail.com with ESMTPSA id
 y6-20020a056402358600b004166413d27bsm6428246edc.97.2022.03.13.08.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 08:47:30 -0700 (PDT)
Message-ID: <9bda9a09-ec0a-0b6f-56b1-dff18821aa5d@kernel.org>
Date: Sun, 13 Mar 2022 16:47:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: ldb: Implement simple
 NXP i.MX8M LDB bridge
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20220313123852.207257-1-marex@denx.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220313123852.207257-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Maxime Ripard <maxime@cerno.tech>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/03/2022 13:38, Marek Vasut wrote:
> The i.MX8MP contains two syscon registers which are responsible
> for configuring the on-SoC DPI-to-LVDS serializer. Add DT binding
> which represents this serializer as a bridge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../bindings/display/bridge/nxp,ldb.yaml      | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
> new file mode 100644
> index 0000000000000..a05dd05547836
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/nxp,ldb.yaml#

In title, description and commit msg you point this is specific to
i.MX8M, so maybe reflect it in the file name as well.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8M DPI to LVDS bridge chip
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  The i.MX8MP contains two syscon registers which are responsible
> +  for configuring the on-SoC DPI-to-LVDS serializer. This describes
> +  those registers as bridge within the DT.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: nxp,imx8mp-ldb

No items.

> +
> +  clocks:
> +    minItems: 1

maxItems

> +
> +  clock-names:
> +    const: "ldb"

No quotes

> +
> +  syscon:

You need a specific name with vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/phandle> +    description: A phandle to media block controller.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for DPI input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for LVDS Channel-A output (panel or bridge).
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for LVDS Channel-B output (panel or bridge).
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - syscon
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +
> +    lvds-ldb {

Generic node name, so "bridge" or "display-bridge"

> +        #address-cells = <0>;
> +        #size-cells = <0>;

Why do you need address and size cells? This will complain if you test
your bindings with proper compatible.

> +        compatible = "fsl,imx8mp-ldb";

This does not look the same as documented here.


Best regards,
Krzysztof
