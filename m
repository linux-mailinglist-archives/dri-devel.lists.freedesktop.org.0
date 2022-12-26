Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE2565614F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 09:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8592B10E1BB;
	Mon, 26 Dec 2022 08:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3624C10E033
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 08:57:12 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id h6so5435003iof.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 00:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y9TbX3Ceh1FvaBv664udZf8XfrOpdKKd1+DeV95MdyU=;
 b=Bi5owdA6WovVAMZcv9Xg7UtskNw4+684vpuoZJeflxtV3ZDO4PKd2iJDfmLTyqqNpq
 lOVR9fPEoBWOyeiHd85xuiPaMJnyBllR19W6q6zN8qOmAkm9E7Kl+IrfWMsltiZ4cmA1
 C+ow+S7IbcqHZPmSLrl2qKxwome1/bjEv8xaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y9TbX3Ceh1FvaBv664udZf8XfrOpdKKd1+DeV95MdyU=;
 b=in8qhCFSBeXidrxgtKYfM+JSw8o+Sh6umwgE5dvB4bN6LMTg9CU/Dsq/n61bSQUPXS
 PUx+tS8iduDqwflFdqS1Ot5vN/N+1HpBuFlILxkRouOU/4sldy0wwqLc5wuLoaBGe4w3
 HELpXDXv8amOIqwsT6476DYIk0Su+bOIMKVBZMiHyL5WU2kHcfQ+elUDQYa4CSwJgxm4
 9pcAD2G+4Tuubvb2eWG5X1dHCwPTEhPfVNtJWIXblj1VNSieG0FM2jW4J3mXGmnU2SV3
 e6VMHQvFtb4gFkEeSQfICh4I3Ke1zKbAL8daCf+kPb1ZPTsmZfLdo3PIl0isB56So52x
 6yUw==
X-Gm-Message-State: AFqh2krzlyqZKDt8JpYsPC2I7kofxmuAKB6btWyfNaHxGGCmjKrZ43Ip
 kbJn5QyjosTDmftu7uh6E0c9QxdhTBJaYIvrCZ75fg==
X-Google-Smtp-Source: AMrXdXvZZwiu7qagoS6yQmOv/xa7NoF2r1prkxbf2PgG2eUjFk6I49fFzrxM9Ian30iQB4AcDtL7g9FaZUcFi4kfwfI=
X-Received: by 2002:a6b:490f:0:b0:6e3:29a8:47a with SMTP id
 u15-20020a6b490f000000b006e329a8047amr1409337iob.209.1672045032266; Mon, 26
 Dec 2022 00:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-7-treapking@chromium.org>
 <a2a8cd80-a614-e96f-90ab-a98c60527344@linaro.org>
In-Reply-To: <a2a8cd80-a614-e96f-90ab-a98c60527344@linaro.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 26 Dec 2022 16:57:01 +0800
Message-ID: <CAEXTbpeYZTeWvnGtRo3i7eGSAoQnkSmcpV=SS8MZA+an3SHUwQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] dt/bindings: drm/bridge: it6505: Add mode-switch
 support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On Mon, Nov 28, 2022 at 5:02 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/11/2022 11:20, Pin-yen Lin wrote:
> > ITE IT6505 can be used in systems to switch the DP traffic between
> > two downstreams, which can be USB Type-C DisplayPort alternate mode
> > lane or regular DisplayPort output ports.
> >
> > Update the binding to accommodate this usage by introducing a
> > data-lanes and a mode-switch property on endpoints.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> > Changes in v6:
> > - Remove switches node and use endpoints and data-lanes property to
> >   describe the connections.
> >
> >  .../bindings/display/bridge/ite,it6505.yaml   | 94 ++++++++++++++++++-
> >  1 file changed, 90 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > index 833d11b2303a..b4b9881c7759 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > @@ -52,9 +52,53 @@ properties:
> >      maxItems: 1
> >      description: extcon specifier for the Power Delivery
> >
> > -  port:
> > -    $ref: /schemas/graph.yaml#/properties/port
> > -    description: A port node pointing to DPI host port node
> > +  data-lanes:
> > +    maxItems: 1
> > +    description: restrict the dp output data-lanes with value of 1-4
>
> Hm, where is the definition of this type? For example it comes with
> video-interfaces, which you did not reference here.
>
Actually I messed up here with another accepted patch:
https://lore.kernel.org/all/20221103091243.96036-2-allen.chen@ite.com.tw/

This and the next new property have been added in that patch.
> > +
> > +  max-pixel-clock-khz:
>
> There is no such unit accepted:
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml
>
> > +    maxItems: 1
>
> maxItems of what type? What is this?
>
> > +    description: restrict max pixel clock
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
>
> This is incompatible change... how do you handle now ABI break?
>
This is also added in another patch, and currently we don't have any
upstream it6505 users now.
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
>
> Why changing the ref?

The `unevaluatedProperties: false` in
`/schemas/graph.yaml#/properties/port` does not allow me to add new
properties here.
>
> > +        unevaluatedProperties: false
> > +        description: A port node pointing to DPI host port node
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port-base
> > +        description:
> > +          Video port for panel or connector.
> > +
> > +        patternProperties:
> > +          "^endpoint@[01]$":
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            type: object
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              reg:
> > +                maxItems: 1
> > +
> > +              remote-endpoint: true
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                uniqueItems: true
> > +                items:
> > +                  - enum: [ 0, 1, 2, 3]
>
> Same problem as your previouspatch.
>
> > +
> > +              mode-switch:
> > +                type: boolean
> > +                description: Register this node as a Type-C mode switch or not.
> > +
> > +         required:
> > +        - reg
> > +           - remote-endpoint
> >
> >  required:
> >    - compatible
> > @@ -62,7 +106,7 @@ required:
> >    - pwr18-supply
> >    - interrupts
> >    - reset-gpios
> > -  - extcon
> > +  - ports
> >
> >  additionalProperties: false
> >
> > @@ -92,3 +136,45 @@ examples:
> >              };
> >          };
> >      };
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    &i2c3 {
> > +        clock-frequency = <100000>;
> > +
> > +        it6505dptx: it6505dptx@5c {
>
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
I'll fix this in v7.
> > +            compatible = "ite,it6505";
> > +            interrupts = <8 IRQ_TYPE_LEVEL_LOW 8 0>;
> > +            reg = <0x5c>;
> > +            pinctrl-names = "default";
> > +            pinctrl-0 = <&it6505_pins>;
> > +            ovdd-supply = <&mt6366_vsim2_reg>;
> > +            pwr18-supply = <&pp1800_dpbrdg_dx>;
> > +            reset-gpios = <&pio 177 0>;
> > +            hpd-gpios = <&pio 10 0>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                port@0 {
> > +                    reg = <0>;
> > +                    it6505_in: endpoint {
> > +                        remote-endpoint = <&dpi_out>;
> > +                    };
> > +                };
> > +                port@1 {
> > +                    reg = <1>;
> > +                    ite_typec0: endpoint@0 {
> > +                        mode-switch;
> > +                        data-lanes = <0 1>;
>
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
Sorry for not checking the documentation and testing the patches
before submitting this.

I'll fix the errors in v7.

Best regards,
Pin-yen
>
> Best regards,
> Krzysztof
>
