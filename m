Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B30B14F170
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 18:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E726FBB0;
	Fri, 31 Jan 2020 17:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2336FBB0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 17:41:07 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D309F21734
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580492467;
 bh=xszzaaEpbbEax08VU5xvCuq9Bsf/JjNpN40JCLkc/ss=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zFJ50GvvgGvwOd4S131/LAWEV5D59UCMMcy57VtdUrH4vyDwsdwQF50mukUDrAe8k
 44Qm9aUry4G4qVscxUQtOvuzIuvZWbTKcId4qRNN3PBpt8fpGHhtwSakLOARGU8ang
 NV0izsQ/GlBeB8amLbHa0sPuw+GX3eLGLugIw+Uc=
Received: by mail-qt1-f178.google.com with SMTP id v25so6018940qto.7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 09:41:06 -0800 (PST)
X-Gm-Message-State: APjAAAU7hZPVwZTaAmgm9uL9UdPMXBe68sMr2NaNojmNsKWigbQPzxEc
 ENgz8mnkI9i87tpoE0F5McnxJ5TK7/64y7ixtQ==
X-Google-Smtp-Source: APXvYqxjrrfRA36fdNqYp2gGKshUBhzz5J2P7CvcW484UyPS5Uj9LBhdDLwrtMPg8pFT8K7FzHjA1iCSpTCU2LcBqsA=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr12050220qtj.300.1580492466005; 
 Fri, 31 Jan 2020 09:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20200125203454.7450-1-sam@ravnborg.org>
 <20200125203454.7450-4-sam@ravnborg.org>
In-Reply-To: <20200125203454.7450-4-sam@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 Jan 2020 11:40:53 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+JsEk1qz7NQc0ybO0xgmTB+YcmUL_d=u7_Y0A56v18nw@mail.gmail.com>
Message-ID: <CAL_Jsq+JsEk1qz7NQc0ybO0xgmTB+YcmUL_d=u7_Y0A56v18nw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: convert panel-dpi to DT
 schema
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 25, 2020 at 2:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> With panel-timing converted, now convert the single
> remaining .txt user in panel/ of panel-timing to DT schema.
>
> v2:
>   - Drop Thierry as maintainer, as this is not a general panel binding
>     and I have no acks.
>   - Drop requirement for a panel- specific binding - "panel-dpi" is enough
>   - Updated example
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---
>  .../bindings/display/panel/panel-dpi.txt      | 50 -------------
>  .../bindings/display/panel/panel-dpi.yaml     | 71 +++++++++++++++++++
>  2 files changed, 71 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt b/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
> deleted file mode 100644
> index 6b203bc4d932..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Generic MIPI DPI Panel
> -======================
> -
> -Required properties:
> -- compatible: "panel-dpi"
> -
> -Optional properties:
> -- label: a symbolic name for the panel
> -- enable-gpios: panel enable gpio
> -- reset-gpios: GPIO to control the RESET pin
> -- vcc-supply: phandle of regulator that will be used to enable power to the display
> -- backlight: phandle of the backlight device
> -
> -Required nodes:
> -- "panel-timing" containing video timings
> -  (Documentation/devicetree/bindings/display/panel/display-timing.txt)
> -- Video port for DPI input
> -
> -Example
> --------
> -
> -lcd0: display@0 {
> -        compatible = "samsung,lte430wq-f0c", "panel-dpi";
> -        label = "lcd";
> -
> -        backlight = <&backlight>;
> -
> -        port {
> -            lcd_in: endpoint {
> -                    remote-endpoint = <&dpi_out>;
> -            };
> -        };
> -
> -        panel-timing {
> -                clock-frequency = <9200000>;
> -                hactive = <480>;
> -                vactive = <272>;
> -                hfront-porch = <8>;
> -                hback-porch = <4>;
> -                hsync-len = <41>;
> -                vback-porch = <2>;
> -                vfront-porch = <4>;
> -                vsync-len = <10>;
> -
> -                hsync-active = <0>;
> -                vsync-active = <0>;
> -                de-active = <1>;
> -                pixelclk-active = <1>;
> -        };
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> new file mode 100644
> index 000000000000..a8e37318ec05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic MIPI DPI Panel
> +
> +maintainers:
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: panel-dpi
> +    description:
> +      Shall contain "panel-dpi" in addition to an optional panel-specific
> +      compatible string defined in individual panel bindings.
> +      "panel-dpi" can be used alone, thus no dedicated binding file
> +      is required for each and every panel.

While this has occurred, I don't think the schema should allow it. I
think a 'minItems: 2' should be added here.

AFAIK, MIPI DPI just defines a spec for what already existed. Maybe it
constrains things somewhat, but to the extent why we require a panel
specific compatible in the first place? Doubtful...

Rob

> +  port: true
> +
> +required:
> +  - panel-timing
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    panel@0 {
> +      compatible = "panel-dpi";
> +      label = "lcd";
> +      vcc-supply = <&vcc_supply>;
> +
> +      backlight = <&backlight>;
> +
> +      port {
> +        lcd_in: endpoint {
> +          remote-endpoint = <&dpi_out>;
> +        };
> +      };
> +      panel-timing {
> +        clock-frequency = <9200000>;
> +        hactive = <800>;
> +        vactive = <480>;
> +        hfront-porch = <8>;
> +        hback-porch = <4>;
> +        hsync-len = <41>;
> +        vback-porch = <2>;
> +        vfront-porch = <4>;
> +        vsync-len = <10>;
> +
> +        hsync-active = <0>;
> +        vsync-active = <0>;
> +        de-active = <1>;
> +        pixelclk-active = <1>;
> +      };
> +    };
> --
> 2.20.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
