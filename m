Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92DD507112
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5D789F08;
	Tue, 19 Apr 2022 14:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF7A89E08
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:53:34 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id c23so16033461plo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 07:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c4jz1QTzif//5wCIw3BdEbaKBs0UpQUXyXv6HJnmb1Y=;
 b=cQQS3EgJnb4tSSobdbHC+yTwfXxfo/QLfNUmLKx9JpLVsqDezr1nYXR+MifghjZPlu
 BGjYRTFi9gEmxPsMtEfviqSotyLcBGaDWVD5E45Ct75ql+Wg7WaQFwlypmcOqHnPXJR3
 E1kT7Hcsb0hVv7cNCHM3JLFm/u5M9nP2sUczuZqnkKeq6HnICph2o1SXugQJ8QNB+Hb5
 eEX4xfQRy2uhZ8I3t/T65S/yzK2QaRynWT3lfI4ChCv8slblP6AZ+wnUwyg0aLOyNMRV
 TbpeC6f2JYz44y3MNXJXTMXsLYRLAMu7fVa6/GsQMGx6rtZ+ZvdAvEP6hi8F2VQpuJZh
 TGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c4jz1QTzif//5wCIw3BdEbaKBs0UpQUXyXv6HJnmb1Y=;
 b=a4lmVkvWxwC2nBPoj7ramq0R9iPFhR/N6VdvNI9Oa4pPPc8cXyzAIyvt5pqhdYHd8A
 L5zo1cYDBtgyHXhRKPXP1LS1p0EGjJEOhMVNuniopfqxBsvGurjvdgnqHoOQxEJRrL9L
 DsfXIYwj8Mnd2ZfUCq/oRvExoua7+Cj4BlHukIV9rOU3ldpRsBLqgjbTmmNYIzkSboPu
 c54/fngRpzR3CVCOPBVyoiIq3WaIcBrQPqPrwuxo5XmaLn0pBGHnAKcPKoeGJbvY4hBf
 UVmigKZh5iSj7mOmZe5EI7lzT9JDpgsypUmkMaBbSOBOXgfaPz9khUrcQsm1+vT5mOqR
 Kh4w==
X-Gm-Message-State: AOAM530ciyMZnyv+mDwr6z5ESIoBJ1dWIXXbOdsgSY9dbFMsqULu+dHN
 RN2W4m8ynlZJx92xYPVRi9g5Yb8BPpuEnTQ0BaaYIQ==
X-Google-Smtp-Source: ABdhPJysg1S0yfLnJY0LTZXuMVeY7fujC50SzKWOpcmKnfOJ+CCSl0nFh1XwjqlfVeDB6KlGfIrJ6vtls1+fOAsFVWQ=
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id
 gx12-20020a17090b124c00b001bc369b7db5mr24341841pjb.179.1650380013966; Tue, 19
 Apr 2022 07:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220419143958.94873-1-marex@denx.de>
In-Reply-To: <20220419143958.94873-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Apr 2022 16:53:22 +0200
Message-ID: <CAG3jFyvao_dUHsuphR6EvY1NFk1Z2g+CsD65zP6xfBXgQ8-khw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: lt9211: Add Lontium
 LT9211 bridge driver
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Apr 2022 at 16:40, Marek Vasut <marex@denx.de> wrote:
>
> Add bindings for Lontium LT9211 Single/Dual-Link DSI/LVDS or Single DPI to
> Single-link/Dual-Link DSI/LVDS or Single DPI bridge. This chip is highly
> capable at converting formats, but sadly it is also highly undocumented.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Fix up s@i2c10@i2c@ in binding example
>     - Add RB from Rob
> ---
>  .../display/bridge/lontium,lt9211.yaml        | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
> new file mode 100644
> index 0000000000000..9a6e9b25d14a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/lontium,lt9211.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lontium LT9211 DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  The LT9211 are bridge devices which convert Single/Dual-Link DSI/LVDS
> +  or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lontium,lt9211
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to active high RESET pin.
> +
> +  vccio-supply:
> +    description: Regulator for 1.8V IO power.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Primary MIPI DSI port-1 for MIPI input or
> +          LVDS port-1 for LVDS input or DPI input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Additional MIPI port-2 for MIPI input or LVDS port-2
> +          for LVDS input. Used in combination with primary
> +          port-1 to drive higher resolution displays
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Primary MIPI DSI port-1 for MIPI output or
> +          LVDS port-1 for LVDS output or DPI output.
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Additional MIPI port-2 for MIPI output or LVDS port-2
> +          for LVDS output. Used in combination with primary
> +          port-1 to drive higher resolution displays.
> +
> +    required:
> +      - port@0
> +      - port@2
> +
> +required:
> +  - compatible
> +  - reg
> +  - vccio-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      hdmi-bridge@3b {
> +        compatible = "lontium,lt9211";
> +        reg = <0x3b>;
> +
> +        reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
> +        interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_FALLING>;
> +
> +        vccio-supply = <&lt9211_1v8>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +              remote-endpoint = <&dsi0_out>;
> +            };
> +          };
> +
> +          port@2 {
> +            reg = <2>;
> +
> +            endpoint {
> +              remote-endpoint = <&panel_in_lvds>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +...

Applied series to drm-misc-next


Rob.
