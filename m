Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDCB666AD2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 06:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493B110E877;
	Thu, 12 Jan 2023 05:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A43D10E877
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 05:27:18 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-4b6255ce5baso224110847b3.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 21:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W81qYRj136ZMi8gnoxmrpE+c6dWTmqDu5iOCxT+D93k=;
 b=ApQLrEvpAvQbUESAFdbxL9lFk6YchMZR56RNiw1hXfi7tlm5IX8TnDRtgGOCnN5A/D
 Vw4GZi9K8QM5ktnOAF3eEl3k47d87tm/zpBTkGWEo7JxrwFIFXO+5bqpC7U7izWNOM+A
 E2TiA17Kg+nlmhrfEX0Iuxom+i2FRHLs6ehytpBmodNDBdSXSPSZ7DggeB7+MMekuRdj
 c2TiCTsismGrzsA/OAtLOLz1mJXMhpi6unCZjJu8qd9vmo7T/HEWIbPXB2xf8ZfPwW3l
 FM9HnSr9msHt8a8mEPdfgVgnaGi8fdeaCeekOXe+5nAxN1+Fca6tHzp9rEnJ0fybaeUE
 UiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W81qYRj136ZMi8gnoxmrpE+c6dWTmqDu5iOCxT+D93k=;
 b=ntZfr286dtdEInyvuew3DiAFMPNPiq21pUh++a1DbcYpACq9WI5PhrUuNfEbeoJmYt
 J3wBD2aADq5k//LUoCeoMpY11fA1d8YfUj9w6NQKHRf037jZagdYMltm1nmFB4y4Kd8C
 grzGD/qS/zot154MRL/ZQEcRu9VOOdhHNIUnN0Kp2filSKge+Fu2Bq/q8RjLMg9dJtjB
 aeFn4O8PU+8pKCYluI8tN8Pe9NalUM77O18f4Dbz/o5WDfZKNgkX79kNMQqVNU6jTDcL
 FVvPd8oPl01GOLfepqlMuItNgEFOFCOPtg/NCXa5P6f1Pw3rqwUw9B/UuGOfJstHFkh2
 ogZw==
X-Gm-Message-State: AFqh2koHrqjcKY5zoLqJNdgEBkYXUmtoDDtJ9+Uz+fHpp+FA+ipI1sZG
 1B1oUyfhLWPGfezHzvqxdak+8ew2q/Ha9lidFIHFUQ==
X-Google-Smtp-Source: AMrXdXsN9ZzMoh6GztA7oevHJsnLBjufVL7YcFalYR9xPRpW+LU8oeBMzrbRYwPFRy/Fqu/62DtxWpSHaDjBecZgHQc=
X-Received: by 2002:a05:690c:fd5:b0:4a4:7135:9214 with SMTP id
 dg21-20020a05690c0fd500b004a471359214mr6683518ywb.378.1673501237477; Wed, 11
 Jan 2023 21:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-5-treapking@chromium.org>
 <fce16123-e157-bcd6-553d-6c1926fe1d46@linaro.org>
 <CAEXTbpfrwRxT7hov1G_URGdVY+n-RWRZrGA8C2zjcnX=6QaOvg@mail.gmail.com>
In-Reply-To: <CAEXTbpfrwRxT7hov1G_URGdVY+n-RWRZrGA8C2zjcnX=6QaOvg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Jan 2023 07:27:06 +0200
Message-ID: <CAA8EJpqXwoFvr08oH1VKnNef1nuuysBUxD+nJE_7LWjY0sCLUQ@mail.gmail.com>
Subject: Re: [PATCH v10 4/9] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
To: Pin-yen Lin <treapking@chromium.org>
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

On Thu, 12 Jan 2023 at 07:26, Pin-yen Lin <treapking@chromium.org> wrote:
>
> Hi Dmitry,
>
> Thanks for the review.
>
> On Thu, Jan 12, 2023 at 12:43 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On 12/01/2023 06:20, Pin-yen Lin wrote:
> > > Analogix 7625 can be used in systems to switch the DP traffic between
> > > two downstreams, which can be USB Type-C DisplayPort alternate mode
> > > lane or regular DisplayPort output ports.
> > >
> > > Update the binding to accommodate this usage by introducing a
> > > data-lanes and a mode-switch property on endpoints.
> > >
> > > Also include the link to the product brief in the bindings.
> > >
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > >
> > > ---
> > >
> > > Changes in v10:
> > > - Collected Reviewed-by and Tested-by tags
> > >
> > > Changes in v9:
> > > - Collected Reviewed-by tag
> > >
> > > Changes in v8:
> > > - Updated anx7625 bindings for data-lane property
> > > - Fixed the subject prefix
> > >
> > > Changes in v7:
> > > - Fixed issues reported by dt_binding_check
> > > - Updated the schema and the example dts for data-lanes.
> > > - Changed to generic naming for the example dts node.
> > >
> > > Changes in v6:
> > > - Remove switches node and use endpoints and data-lanes property to
> > >    describe the connections.
> > >
> > >   .../display/bridge/analogix,anx7625.yaml      | 99 ++++++++++++++++++-
> > >   1 file changed, 96 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > index 4590186c4a0b..b49a350c40e3 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > @@ -12,7 +12,8 @@ maintainers:
> > >
> > >   description: |
> > >     The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
> > > -  designed for portable devices.
> > > +  designed for portable devices. Product brief is available at
> > > +  https://www.analogix.com/en/system/files/AA-002291-PB-6-ANX7625_ProductBrief.pdf
> > >
> > >   properties:
> > >     compatible:
> > > @@ -112,10 +113,48 @@ properties:
> > >                 data-lanes: true
> > >
> > >         port@1:
> > > -        $ref: /schemas/graph.yaml#/properties/port
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > >           description:
> > >             Video port for panel or connector.
> > >
> > > +        patternProperties:
> > > +          "^endpoint@[01]$":
> > > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              reg:
> > > +                maxItems: 1
> >
> > Please remove duplicates to the graph.yaml. You have several of them here.
>
> I'll fix this in v11.
> >
> > > +
> > > +              remote-endpoint: true
> > > +
> > > +              data-lanes:
> > > +                oneOf:
> > > +                  - items:
> > > +                      - enum: [0, 1, 2, 3]
> > > +
> > > +                  - items:
> > > +                      - const: 0
> > > +                      - const: 1
> > > +
> > > +                  - items:
> > > +                      - const: 2
> > > +                      - const: 3
> > > +
> > > +                  - items:
> > > +                      - const: 0
> > > +                      - const: 1
> > > +                      - const: 2
> > > +                      - const: 3
> > > +
> > > +              mode-switch:
> > > +                type: boolean
> > > +                description: Register this node as a Type-C mode switch or not.
> > > +
> > > +            required:
> > > +              - reg
> > > +              - remote-endpoint
> > > +
> > >       required:
> > >         - port@0
> > >         - port@1
> > > @@ -164,8 +203,12 @@ examples:
> > >                   };
> > >
> > >                   mipi2dp_bridge_out: port@1 {
> > > +                    #address-cells = <1>;
> > > +                    #size-cells = <0>;
> > > +
> > >                       reg = <1>;
> > > -                    anx7625_out: endpoint {
> > > +                    anx7625_out: endpoint@0 {
> >
> > But why? It's perfectly fine from the graph perspective to omit the
> > index if there is jus a single endpoint.
>
> This is because "reg" property is added as a required property. Do you
> suggest making "reg" property optional and only add it when there are
> multiple ports?

Yes. I think it makes sense.

> >
> > > +                        reg = <0>;
> > >                           remote-endpoint = <&panel_in>;
> > >                       };
> > >                   };
> > > @@ -186,3 +229,53 @@ examples:
> > >               };
> > >           };
> > >       };
> > > +  - |
> > > +    i2c3 {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        encoder@58 {
> > > +            compatible = "analogix,anx7625";
> > > +            reg = <0x58>;
> > > +            pinctrl-names = "default";
> > > +            pinctrl-0 = <&anx7625_dp_pins>;
> > > +            enable-gpios = <&pio 176 GPIO_ACTIVE_HIGH>;
> > > +            reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
> > > +            vdd10-supply = <&pp1100_dpbrdg>;
> > > +            vdd18-supply = <&pp1800_dpbrdg_dx>;
> > > +            vdd33-supply = <&pp3300_dpbrdg_dx>;
> > > +            analogix,audio-enable;
> > > +
> > > +            ports {
> > > +                #address-cells = <1>;
> > > +                #size-cells = <0>;
> > > +
> > > +                port@0 {
> > > +                    reg = <0>;
> > > +                    anx7625_dp_in: endpoint {
> > > +                        bus-type = <7>;
> > > +                        remote-endpoint = <&dpi_out>;
> > > +                    };
> > > +                };
> > > +
> > > +                port@1 {
> > > +                    #address-cells = <1>;
> > > +                    #size-cells = <0>;
> > > +
> > > +                    reg = <1>;
> > > +                    anx_typec0: endpoint@0 {
> > > +                        reg = <0>;
> > > +                        mode-switch;
> > > +                        data-lanes = <0 1>;
> > > +                        remote-endpoint = <&typec_port0>;
> > > +                    };
> > > +                    anx_typec1: endpoint@1 {
> > > +                        reg = <1>;
> > > +                        mode-switch;
> > > +                        data-lanes = <2 3>;
> > > +                        remote-endpoint = <&typec_port1>;
> > > +                    };
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> >
> > --
> > With best wishes
> > Dmitry
> >
>
> Best regards,
> Pin-yen



-- 
With best wishes
Dmitry
