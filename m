Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FD230F94C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 18:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CECF6E10A;
	Thu,  4 Feb 2021 17:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862C66E10A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 17:15:37 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id d15so2891623qtw.12
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 09:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b+yvAuTbc5rOIvErc7i//BiGa1eCFc8XljrLssj6usE=;
 b=OSNMKczffRNRoVWXWit2rArCrXNQl2I7ejm+26dEvVNB9Vu2mk5djVZqhmOml0LyfB
 1gO+w1xjAGKgYq3kyM1PsBjWUKxGlfmRoEfLDthDuYDIBoCh+XC6a/+Xpqa7Y7TythCG
 4rcAQmB0FVUXSDqTUFY6Mcmm6YwztYa1J73r8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b+yvAuTbc5rOIvErc7i//BiGa1eCFc8XljrLssj6usE=;
 b=LTpPzYvmzpWrwwyGpvPYBc9Rrx2FW5UZQUIXcpYzWuQPi6b2sdSCg07JszdUiLEGrE
 HBdfz9ZtSHBHSJ88iiJYQq45oBw7byoLVqPzvpQ6Hf47D3loJlHmEq/t/344WNAgc3As
 JQQ8CjZDv9wN7vnwMMXODyk34cTNj5VN9nZ6q6neuWaFEdprjxdDB1d16bvl0R4weYu7
 HyxKhfQtXhfd5LGxurPkqJYzwTBMLQyTOyFA2/KiKhWnBiIWEmY9Y/Eyx1Mjt/dX8qvh
 o7dqobRR5okCEDA3dVnTkiH9kJVUzXDCd1kM949P/PQIE6i2uX7iU3Z3I+I6m8x8cypI
 Ar4A==
X-Gm-Message-State: AOAM530B3CvSbnU5mcZxo/wlIuFStYit7dr+55nhfkedHiZqMbZFsd9z
 /YVL70i1Dx5Oj3RaXL/ZukKjbWv7rQgKAQ==
X-Google-Smtp-Source: ABdhPJxBrVfG7xdQZep530s4k/3oBEdONUS7/5ktC0Nzir//+yAyV42g8g2pGvq9wUV2LbSXs0KkHg==
X-Received: by 2002:aed:2e26:: with SMTP id j35mr539749qtd.59.1612458936350;
 Thu, 04 Feb 2021 09:15:36 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id f14sm5594401qkl.76.2021.02.04.09.15.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:15:35 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id y128so3886259ybf.10
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 09:15:35 -0800 (PST)
X-Received: by 2002:a25:4fc3:: with SMTP id d186mr229242ybb.343.1612458934778; 
 Thu, 04 Feb 2021 09:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20210130181014.161457-1-marex@denx.de>
In-Reply-To: <20210130181014.161457-1-marex@denx.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Feb 2021 09:15:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UzkP8Rp6BDNVr1FmOK4GY9_dSeT6fCjQLMatHftyj9iA@mail.gmail.com>
Message-ID: <CAD=FV=UzkP8Rp6BDNVr1FmOK4GY9_dSeT6fCjQLMatHftyj9iA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 bindings
To: Marek Vasut <marex@denx.de>
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
 <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jan 30, 2021 at 10:10 AM Marek Vasut <marex@denx.de> wrote:
>
> Add DT binding document for TI SN65DSI83 DSI to LVDS bridge.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)

I'll preface by saying that I'm nowhere near an expert on any of this
stuff.  I've done a bunch of hacking on the sn65dsi86 driver but
mostly I'm a DRM noob and don't have any super expertise in MIPI or
LVDS.


>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> new file mode 100644
> index 000000000000..77e1bafd8cd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SN65DSI83 DSI to LVDS bridge chip
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  The Texas Instruments SN65DSI83 bridge takes MIPI DSI in and outputs LVDS.
> +  https://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi83&fileType=pdf
> +
> +properties:
> +  compatible:
> +    const: ti,sn65dsi83
> +
> +  reg:
> +    const: 0x2d
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specifier for bridge_en pin (active high).

I see two regulators: vcc and vcore.  Shouldn't those be listed?

I also see an interrupt pin on the datasheet.  Probably should be
listed too even if the chip can be made to work fine without hooking
it up.  It can just be optional, right?

It wouldn't hurt to list the refclk here too even if the code doesn't
use it.  From sn65dsi86 it was handy that the bindings already had all
this type of stuff so that when we added the feature we didn't have to
go back to the bindings.

> +  ports:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        additionalProperties: false
> +
> +        description:
> +          Video port for MIPI DSI input
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +            properties:
> +              remote-endpoint: true
> +              data-lanes:
> +                description: array of physical DSI data lane indexes.

The chip doesn't allow for arbitrary remapping here, right?  So you're
just using this as the official way to specify the number of lanes?  I
guess the only valid values are:

<0>
<0 1>
<0 1 2>
<0 1 2 3>

In sn65dsi86 we attempted to enforce that a valid option was selected
for the output lanes.  Could you do something similar?  If nothing
else adding a description of the valid options would be good.


> +        required:
> +          - reg
> +
> +      port@1:
> +        type: object
> +        additionalProperties: false
> +
> +        description:
> +          Video port for LVDS output (panel or bridge).
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +            properties:
> +              remote-endpoint: true

Worth adding the data-lanes here too?  I guess this part allows you
two different orders for the LVDS outputs?


> +
> +        required:
> +          - reg
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      bridge@2d {
> +        compatible = "ti,sn65dsi83";
> +        reg = <0x2d>;
> +
> +        enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            endpoint {
> +              remote-endpoint = <&dsi0_out>;
> +              data-lanes = <1 2 3 4>;

Should the above be <0 1 2 3>?



> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            endpoint {
> +              remote-endpoint = <&panel_in_lvds>;
> +            };
> +          };
> +        };
> +      };
> +    };
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
