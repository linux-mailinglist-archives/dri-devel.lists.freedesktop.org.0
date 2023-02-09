Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E4690B20
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B6C10E1E7;
	Thu,  9 Feb 2023 13:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110A210E1E7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:58:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44EDE61AA5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AD4C433A8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675951109;
 bh=93VyRdd+x46c6JfnCI26c2eQ2tKwTRA+5LoCiqT+VC0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jmQdnIc4ohWuhyM/wboCHrBLSTj4CBb+bA/6XmgM59Q+I305QMacZrl3VDyL2kBav
 V+1/wPdF7b0HEIXSoijDHkuPV5z0XqxTJanmcMWS5lO34S8DhKBpd7T3TP+FUZpLUh
 tZJBxTdDaccDbjmQ5ndcwIGj+l7Iwvq8iMsQdVXrYHTIqdPf/Gw/zaZWqIXkyFj5of
 ajadWgbeABINJgNePiULZcqGc0DQSJYpJMU7JkD0JEAX7Zszy2qoLcTzfAMF02hgoF
 XsPx7jDziQAd1KU3raoq78O7x+gHUmPk6F1amZhrmlpRwglJ1YOlWVIOES7eTgbJAT
 oO2I2RcwNsTZA==
Received: by mail-vs1-f47.google.com with SMTP id p24so1344412vsn.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 05:58:28 -0800 (PST)
X-Gm-Message-State: AO0yUKU6gXuLCn0wTBtxCG2ikWRRjR6YVIUK1YaI26UdVBMtNbyQh2pg
 3+y+dKLV9i6vrNHiMUf+4wmQI39UJT+3/SPrdw==
X-Google-Smtp-Source: AK7set+jecLjckPcdRc6heEopqoGnC8BMT68O2x6tSHaNNqZRNC1BW5aLQrtdmUMcVM3DFY1urReQ/39uyBueeBrXyw=
X-Received: by 2002:a67:cc1d:0:b0:3f3:5ce0:85ab with SMTP id
 q29-20020a67cc1d000000b003f35ce085abmr3125109vsl.26.1675951107969; Thu, 09
 Feb 2023 05:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-8-treapking@chromium.org>
 <20230207205221.GA4121517-robh@kernel.org>
 <CAEXTbpf5KqH7zev+kooUmz2DiMya-53UmvAMJfcOYcm7CCDthQ@mail.gmail.com>
In-Reply-To: <CAEXTbpf5KqH7zev+kooUmz2DiMya-53UmvAMJfcOYcm7CCDthQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 9 Feb 2023 07:58:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ35gJnpwfOtW8jQP2RmzJtLG2YdTC6dt7pf-GjJggORw@mail.gmail.com>
Message-ID: <CAL_JsqJ35gJnpwfOtW8jQP2RmzJtLG2YdTC6dt7pf-GjJggORw@mail.gmail.com>
Subject: Re: [PATCH v11 7/9] dt-bindings: display: bridge: it6505: Add
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
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
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

On Wed, Feb 8, 2023 at 10:00 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> Hi Rob,
>
> Thanks for the review.
>
> On Wed, Feb 8, 2023 at 4:52 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Sat, Feb 04, 2023 at 09:30:38PM +0800, Pin-yen Lin wrote:
> > > ITE IT6505 can be used in systems to switch the DP traffic between
> > > two downstreams, which can be USB Type-C DisplayPort alternate mode
> > > lane or regular DisplayPort output ports.
> > >
> > > Update the binding to accommodate this usage by introducing a
> > > data-lanes and a mode-switch property on endpoints.
> > >
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > >
> > > ---
> > >
> > > Changes in v11:
> > > - Updated the description of the endpoints in the bindings
> > > - Referenced video-interfaces.yaml instead for the endpoints binding
> > > - Removed duplicated definitions from inherited schema
> > >
> > > Changes in v9:
> > > - Fixed subject prefix again
> > > - Changed the naming of the example node for it6505
> > >
> > > Changes in v8:
> > > - Updated bindings for data-lanes property
> > > - Fixed subject prefix
> > >
> > > Changes in v7:
> > > - Fixed issues reported by dt_binding_check.
> > > - Updated the schema and the example dts for data-lanes.
> > > - Changed to generic naming for the example dts node.
> > >
> > > Changes in v6:
> > > - Remove switches node and use endpoints and data-lanes property to
> > >   describe the connections.
> > >
> > >  .../bindings/display/bridge/ite,it6505.yaml   | 101 +++++++++++++++---
> > >  1 file changed, 88 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > > index b16a9d9127dd..8ae9c5cba22c 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > > @@ -75,22 +75,49 @@ properties:
> > >        port@1:
> > >          $ref: /schemas/graph.yaml#/$defs/port-base
> > >          unevaluatedProperties: false
> > > -        description: Video port for DP output
> > > +        description:
> > > +          Video port for DP output. Each endpoint connects to a video output
> > > +          downstream, and the "data-lanes" property is used to describe the pin
> > > +          connections. 0, 1, 2, 3 in "data-lanes" maps to TX0, TX1, TX2, TX3,
> > > +          respectively.
> > >
> > > -        properties:
> > > -          endpoint:
> > > -            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +
> > > +        patternProperties:
> > > +          "^endpoint@[01]$":
> > > +            $ref: /schemas/media/video-interfaces.yaml#
> > >              unevaluatedProperties: false
> > >
> > >              properties:
> > > +              reg: true
> > > +
> > > +              remote-endpoint: true
> > > +
> > >                data-lanes:
> > > -                minItems: 1
> > > -                uniqueItems: true
> > > -                items:
> > > -                  - enum: [ 0, 1 ]
> > > -                  - const: 1
> > > -                  - const: 2
> > > -                  - const: 3
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
> >
> > Existing users put this property in the device's node, not the endpoint.
> > That seems more like a property of the device, than the DP link.
>
> In our use case, we want to register two mode switches for the same
> device. That's why we put the "mode-switch" property in the endpoints
> instead of the device node.

Then do that. Register a mode switch for each endpoint connected to a
USB-C connector. You can walk the graph to see what type of connector.

The only way I could see this as an issue is you have 2 USB-C
connectors and one is a mode switch and one is not. Not sure if such a
scenario is likely or possible. If it is, please educate me.

> > You are using fwnode_typec_mux_get(), right?
>
> Yes. This is called by cros_ec_typec.c[1] in our use case.

That code looks for 'mode-switch' in the device's node, not the
endpoint. So how does it work for you?

Rob
