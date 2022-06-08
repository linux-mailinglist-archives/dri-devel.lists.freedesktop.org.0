Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B231543EE8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B465112159;
	Wed,  8 Jun 2022 21:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A867D112144
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:56:54 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ef5380669cso223250507b3.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o/FxEvZvW1gTJxwxNX2DkDyV7vVmddxl0z+6t//DzGw=;
 b=GfP2IP4Fat3QQOJUQ1zjmZgkYIDYRLt6vRQO45pbcMcGVtU5pBvQcFY5UvJcGk8abd
 +JSzoHHE0NFLzvXxIbPCxL7Mld79vHYVn5PIdyGBgg0FkKvkhTDeiTe8VNdYvnRPSjGO
 KRwPsYoXEKfCPsnJrtFV9ohI5YEFExn5kwhkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o/FxEvZvW1gTJxwxNX2DkDyV7vVmddxl0z+6t//DzGw=;
 b=JMHI4Md1Y7Rv96T9+l35s7PpNYIyZBDkD3kQa/CqyhciTcvJeJr9NpPaxYfzPumMvO
 IsqWKWGm2YnOzMVcJTaKomGoGW4j5qmhGKCyFow48Fu0yuSZBkXXwXub6Zns0W+KL/YK
 kHqiT6jDpgy5NDEUfXz9TqgxN/IKZOOfmyi/IWG1Zu771f0/mOtyF0fY2ymm/xDGpJuI
 rlzYEZbyuVNZ8JPB7FeKXIw8YxF2v3MYYYmXweXGGeG+/Az9qb01aMdwN4HX9GKh6cb9
 PwpDr5LPgU9p2wBNZ7AOo7oUp8XGk148QiMI9GxFmiqIrSlIgHX6iSLjGGZxquzu/VI7
 L68w==
X-Gm-Message-State: AOAM533t5Hc4+8/10X7Si3aGcHolff5u67nz8vu8QonYWDIQ6MihAFnu
 fj3BQ2+zbitRGk/W4Eo6T93O1UlB/Av0aNtKvKBKWQ==
X-Google-Smtp-Source: ABdhPJyNxCPNzrOQbcyyyd4qjPEc47HfGivnM4HCR4GSlQ1K3nk/S/w0ukyRatBku42k6tv5eQ/gkohhiS9vlMCItdg=
X-Received: by 2002:a81:54c5:0:b0:302:53b8:806b with SMTP id
 i188-20020a8154c5000000b0030253b8806bmr39710077ywb.432.1654725413771; Wed, 08
 Jun 2022 14:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220607190131.1647511-1-pmalani@chromium.org>
 <20220607190131.1647511-5-pmalani@chromium.org>
 <fbc48d41-b2cc-86f6-5f1c-7cfcbdb41e46@linaro.org>
 <YqDXfGa9bugnLFGH@chromium.org>
In-Reply-To: <YqDXfGa9bugnLFGH@chromium.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 8 Jun 2022 14:56:42 -0700
Message-ID: <CACeCKaeHocnAuY5D-oVt1fhgRGkNT014RcK3JSe6piKoXNtKCQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 8, 2022 at 10:08 AM Prashant Malani <pmalani@chromium.org> wrote:
>
> Hi Krzysztof,
>
> Thank you for looking at the patch.
>
> On Jun 08 11:24, Krzysztof Kozlowski wrote:
> > On 07/06/2022 21:00, Prashant Malani wrote:
> > > Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
> > > alternate mode lane traffic between 2 Type-C ports.
> > >
> > > Update the binding to accommodate this usage by introducing a switch
> > > property.
> > >
> > > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > > ---
> > >  .../display/bridge/analogix,anx7625.yaml      | 56 +++++++++++++++++++
> > >  1 file changed, 56 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > index 35a48515836e..7e1f655ddfcc 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > @@ -105,6 +105,26 @@ properties:
> > >        - port@0
> > >        - port@1
> > >
> > > +  switches:
> > > +    type: object
> > > +    description: Set of switches controlling DisplayPort traffic on
> > > +      outgoing RX/TX lanes to Type C ports.
> > > +
> > > +    properties:
> > > +      switch:
> >
> > You allow only one switch with such schema, so no need for "switches"...
>
> See below comment (summary: we'd like to allow 1 or 2 switches).
> >
> > > +        $ref: /schemas/usb/typec-switch.yaml#
> > > +        maxItems: 2
> >
> > Are you sure this works? what are you limiting here with maxItems? I
> > think you wanted patternProperties...
>
> Yeah, I might not have used the DT syntax correctly here.
> What I'm aiming for is:
> "switches" should can contain 1 or 2 "switch" nodes.
> 2 is the maximum (limitation of the hardware).
>
> >
> > > +
> > > +        properties:
> > > +          reg:
> > > +            maxItems: 1
> > > +
> > > +        required:
> > > +          - reg
> > > +
> > > +    required:
> > > +      - switch@0
> >
> > This does not match the property.
> >
> > You also need unevaluatedProperties:false
>
> Ack, will update this in the next version.

Actually, could you kindly clarify which of the two needs this?
"switches" or "switch" ?
I interpreted "switch" as requiring it, but I thought it better to confirm.

>
> >
> >
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -167,5 +187,41 @@ examples:
> > >                      };
> > >                  };
> > >              };
> > > +            switches {
> > > +                #address-cells = <1>;
> > > +                #size-cells = <0>;
> > > +                switch@0 {
> > > +                    compatible = "typec-switch";
> > > +                    reg = <0>;
> > > +                    mode-switch;
> > > +
> > > +                    ports {
> > > +                        #address-cells = <1>;
> > > +                        #size-cells = <0>;
> > > +                        port@0 {
> > > +                            reg = <0>;
> > > +                            anx_typec0: endpoint {
> > > +                              remote-endpoint = <&typec_port0>;
> >
> > Messed up indentation. Your previous patch should also switch to 4-space
> > as recommended by schema coding style.
>
> Sorry about that, will fix up the indentation in the next version.
>
> >
> > > +                            };
> > > +                        };
> > > +                    };
> > > +                };
> > > +                switch@1 {
> > > +                    compatible = "typec-switch";
> > > +                    reg = <1>;
> > > +                    mode-switch;
> > > +
> > > +                    ports {
> > > +                        #address-cells = <1>;
> > > +                        #size-cells = <0>;
> > > +                        port@0 {
> > > +                            reg = <0>;
> > > +                            anx_typec1: endpoint {
> > > +                              remote-endpoint = <&typec_port1>;
> >
> > Ditto.
> >
> > > +                            };
> > > +                        };
> > > +                    };
> > > +                };
> > > +            };
> > >          };
> > >      };
> >
> >
> > Best regards,
> > Krzysztof
