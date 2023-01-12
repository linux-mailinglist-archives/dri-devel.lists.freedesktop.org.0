Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6905B666ACE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 06:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D4E10E876;
	Thu, 12 Jan 2023 05:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F5F10E876
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 05:26:14 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id p9so8575803iod.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 21:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QY1E4/I6RghVeieKHKvp0MOZpx6IxtkejP5Fijsma7E=;
 b=jbR5QkZ9oTOTD86R7m2LvwAPxczUOeacx5dN+653AdySSX+Bpcf9XBGnH5lRRbfmJR
 sodSwRDpEyXjrQYEpdkNwDmY15Zav2XcpqVRXZ75WdQZUPSp+HD1LkCWASmj4amyOICs
 w6vxJaQ3oShEPZfh2OZMYmsk6/4BLAxTKyfBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QY1E4/I6RghVeieKHKvp0MOZpx6IxtkejP5Fijsma7E=;
 b=p36duNUbJTqLSy2mZGNA5d8tpjSByX5/qQbOlChJdNFDwO2k9TZHM0Q2hLlIJI5NXM
 cjo4o7FhXfRj3ZfuvIgDVdZKAr+9EfNKmV5Vt5PU77FWhC92EAnfxsWQSdlyPUQSuUmz
 YVwcKcZD/aLzPBgDwKo4NQjX55eFjzy4YAHMP8773iUFZaDJcs6sBGJfgJ03x1B5bKyC
 rvtOT/OcF4Cd1akFlgpmYQPrlZVtvPCpBBv6q0WAyaSOcPaSpNmYBhq+9vn5RZRh4ZAc
 GB0gGiJQk8eBICWLEeFTGeeMiUpfz9pGhEeljutcVvL8MOpt3rP8e2NMN+1TsohX+CcM
 WtRw==
X-Gm-Message-State: AFqh2kpnEtiYjNOSCcvOHzcLqbC3/MNYNcFAHbb7EGeFrivzLVh8+7nK
 hBXVZWIxG7m8PHxgQJ5jeYs7OZh9DkyuSWtrbf6sZA==
X-Google-Smtp-Source: AMrXdXugCp7x+cUdqaG8tZQfFSqRksTZdbCE7QDMdiXrvqvOB3sTUbzLnrw6wV699TgRxXpVeA0/zh1LOZOk5XKNk3c=
X-Received: by 2002:a05:6638:58:b0:38a:9192:2ba6 with SMTP id
 a24-20020a056638005800b0038a91922ba6mr7600948jap.76.1673501173912; Wed, 11
 Jan 2023 21:26:13 -0800 (PST)
MIME-Version: 1.0
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-5-treapking@chromium.org>
 <fce16123-e157-bcd6-553d-6c1926fe1d46@linaro.org>
In-Reply-To: <fce16123-e157-bcd6-553d-6c1926fe1d46@linaro.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 12 Jan 2023 13:26:03 +0800
Message-ID: <CAEXTbpfrwRxT7hov1G_URGdVY+n-RWRZrGA8C2zjcnX=6QaOvg@mail.gmail.com>
Subject: Re: [PATCH v10 4/9] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thanks for the review.

On Thu, Jan 12, 2023 at 12:43 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 12/01/2023 06:20, Pin-yen Lin wrote:
> > Analogix 7625 can be used in systems to switch the DP traffic between
> > two downstreams, which can be USB Type-C DisplayPort alternate mode
> > lane or regular DisplayPort output ports.
> >
> > Update the binding to accommodate this usage by introducing a
> > data-lanes and a mode-switch property on endpoints.
> >
> > Also include the link to the product brief in the bindings.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >
> > ---
> >
> > Changes in v10:
> > - Collected Reviewed-by and Tested-by tags
> >
> > Changes in v9:
> > - Collected Reviewed-by tag
> >
> > Changes in v8:
> > - Updated anx7625 bindings for data-lane property
> > - Fixed the subject prefix
> >
> > Changes in v7:
> > - Fixed issues reported by dt_binding_check
> > - Updated the schema and the example dts for data-lanes.
> > - Changed to generic naming for the example dts node.
> >
> > Changes in v6:
> > - Remove switches node and use endpoints and data-lanes property to
> >    describe the connections.
> >
> >   .../display/bridge/analogix,anx7625.yaml      | 99 ++++++++++++++++++-
> >   1 file changed, 96 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 4590186c4a0b..b49a350c40e3 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -12,7 +12,8 @@ maintainers:
> >
> >   description: |
> >     The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
> > -  designed for portable devices.
> > +  designed for portable devices. Product brief is available at
> > +  https://www.analogix.com/en/system/files/AA-002291-PB-6-ANX7625_ProductBrief.pdf
> >
> >   properties:
> >     compatible:
> > @@ -112,10 +113,48 @@ properties:
> >                 data-lanes: true
> >
> >         port@1:
> > -        $ref: /schemas/graph.yaml#/properties/port
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> >           description:
> >             Video port for panel or connector.
> >
> > +        patternProperties:
> > +          "^endpoint@[01]$":
> > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              reg:
> > +                maxItems: 1
>
> Please remove duplicates to the graph.yaml. You have several of them here.

I'll fix this in v11.
>
> > +
> > +              remote-endpoint: true
> > +
> > +              data-lanes:
> > +                oneOf:
> > +                  - items:
> > +                      - enum: [0, 1, 2, 3]
> > +
> > +                  - items:
> > +                      - const: 0
> > +                      - const: 1
> > +
> > +                  - items:
> > +                      - const: 2
> > +                      - const: 3
> > +
> > +                  - items:
> > +                      - const: 0
> > +                      - const: 1
> > +                      - const: 2
> > +                      - const: 3
> > +
> > +              mode-switch:
> > +                type: boolean
> > +                description: Register this node as a Type-C mode switch or not.
> > +
> > +            required:
> > +              - reg
> > +              - remote-endpoint
> > +
> >       required:
> >         - port@0
> >         - port@1
> > @@ -164,8 +203,12 @@ examples:
> >                   };
> >
> >                   mipi2dp_bridge_out: port@1 {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +
> >                       reg = <1>;
> > -                    anx7625_out: endpoint {
> > +                    anx7625_out: endpoint@0 {
>
> But why? It's perfectly fine from the graph perspective to omit the
> index if there is jus a single endpoint.

This is because "reg" property is added as a required property. Do you
suggest making "reg" property optional and only add it when there are
multiple ports?
>
> > +                        reg = <0>;
> >                           remote-endpoint = <&panel_in>;
> >                       };
> >                   };
> > @@ -186,3 +229,53 @@ examples:
> >               };
> >           };
> >       };
> > +  - |
> > +    i2c3 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        encoder@58 {
> > +            compatible = "analogix,anx7625";
> > +            reg = <0x58>;
> > +            pinctrl-names = "default";
> > +            pinctrl-0 = <&anx7625_dp_pins>;
> > +            enable-gpios = <&pio 176 GPIO_ACTIVE_HIGH>;
> > +            reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
> > +            vdd10-supply = <&pp1100_dpbrdg>;
> > +            vdd18-supply = <&pp1800_dpbrdg_dx>;
> > +            vdd33-supply = <&pp3300_dpbrdg_dx>;
> > +            analogix,audio-enable;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +                    anx7625_dp_in: endpoint {
> > +                        bus-type = <7>;
> > +                        remote-endpoint = <&dpi_out>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +
> > +                    reg = <1>;
> > +                    anx_typec0: endpoint@0 {
> > +                        reg = <0>;
> > +                        mode-switch;
> > +                        data-lanes = <0 1>;
> > +                        remote-endpoint = <&typec_port0>;
> > +                    };
> > +                    anx_typec1: endpoint@1 {
> > +                        reg = <1>;
> > +                        mode-switch;
> > +                        data-lanes = <2 3>;
> > +                        remote-endpoint = <&typec_port1>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
>
> --
> With best wishes
> Dmitry
>

Best regards,
Pin-yen
