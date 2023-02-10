Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9202C691A2F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 09:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A886E10ECA0;
	Fri, 10 Feb 2023 08:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822F510ECA0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 08:43:13 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id l128so1686556iof.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 00:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bZdTaoQdI84eQVm+vowEVZgNB1qPoT93d6+CHcz4blI=;
 b=iyvEHGe6/7SbWqRS09KX0I+WywD0bnenAZGLlHm5sfjEHyNlDI4l22hm+KQEtrgKZE
 R1fXVtPTQCsz8siZwhwpUvt+AwDA7Np2E63V//ExCV+a0C3BJUGbXnV4efB3gR+9zt2h
 qlR2l5eyXw1krz28H+TQq+pLLfQ0HzyhMAQcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bZdTaoQdI84eQVm+vowEVZgNB1qPoT93d6+CHcz4blI=;
 b=tvAUBjLpAAa2rl2ToeYeZAwpP4DG99rgXTOpZTii3rJaKqegc5CfgYbs7pzprwyMDm
 XFxlrlw8dKs8WNnKmdFxph9xi8Epm362W994oHOLgSIbEbOR6K2nWgRAEkywCo/31U5Z
 c7u4HdasnuR66VVQlHb2hw1wNs2NnxY85/eEex4uTI33byrBTZspXr+C7hasugIF2YV5
 FNgC3qYsLs6rroCS0WhfyoSYnb2FaYwBpJt7t9UJHNTrKioxnsQWvR9joHPHaKU5KFja
 2Tw2kftYRpf4gll09Y2+t27h0TnQ0/JECfNReckDAzonOMUaC+Lc+6Orm0/mtepgpGHs
 wbRg==
X-Gm-Message-State: AO0yUKU4RpbYIcylc7/oVK9ggimUH20jjyFVAF8F3CWYFiiYhg/Nhr0S
 WyOGlgsLcuxnJOdU+OzeOB6TXrqD07qv+aznuRY8nw==
X-Google-Smtp-Source: AK7set/VfS77SYvoCBXeLjVPuFwQjPzNpXxw20gUzrrgPUaIYOvSb9+5aL4Cd9lr+FCStNinLRHbmx9wj26VQvZpD4w=
X-Received: by 2002:a05:6602:348:b0:6de:383e:4146 with SMTP id
 w8-20020a056602034800b006de383e4146mr7976471iou.48.1676018592711; Fri, 10 Feb
 2023 00:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-8-treapking@chromium.org>
 <20230207205221.GA4121517-robh@kernel.org>
 <CAEXTbpf5KqH7zev+kooUmz2DiMya-53UmvAMJfcOYcm7CCDthQ@mail.gmail.com>
 <CAL_JsqJ35gJnpwfOtW8jQP2RmzJtLG2YdTC6dt7pf-GjJggORw@mail.gmail.com>
In-Reply-To: <CAL_JsqJ35gJnpwfOtW8jQP2RmzJtLG2YdTC6dt7pf-GjJggORw@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 10 Feb 2023 16:43:01 +0800
Message-ID: <CAEXTbpcoS6us6Qz4UmdR8zC7n-euLQr25dv4Hg2JkqVL2pX5LA@mail.gmail.com>
Subject: Re: [PATCH v11 7/9] dt-bindings: display: bridge: it6505: Add
 mode-switch support
To: Rob Herring <robh@kernel.org>
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

On Thu, Feb 9, 2023 at 9:58 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Feb 8, 2023 at 10:00 PM Pin-yen Lin <treapking@chromium.org> wrote:
> >
> > Hi Rob,
> >
> > Thanks for the review.
> >
> > On Wed, Feb 8, 2023 at 4:52 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Sat, Feb 04, 2023 at 09:30:38PM +0800, Pin-yen Lin wrote:
> > > > ITE IT6505 can be used in systems to switch the DP traffic between
> > > > two downstreams, which can be USB Type-C DisplayPort alternate mode
> > > > lane or regular DisplayPort output ports.
> > > >
> > > > Update the binding to accommodate this usage by introducing a
> > > > data-lanes and a mode-switch property on endpoints.
> > > >
> > > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > > >
> > > > ---
> > > >
> > > > Changes in v11:
> > > > - Updated the description of the endpoints in the bindings
> > > > - Referenced video-interfaces.yaml instead for the endpoints binding
> > > > - Removed duplicated definitions from inherited schema
> > > >
> > > > Changes in v9:
> > > > - Fixed subject prefix again
> > > > - Changed the naming of the example node for it6505
> > > >
> > > > Changes in v8:
> > > > - Updated bindings for data-lanes property
> > > > - Fixed subject prefix
> > > >
> > > > Changes in v7:
> > > > - Fixed issues reported by dt_binding_check.
> > > > - Updated the schema and the example dts for data-lanes.
> > > > - Changed to generic naming for the example dts node.
> > > >
> > > > Changes in v6:
> > > > - Remove switches node and use endpoints and data-lanes property to
> > > >   describe the connections.
> > > >
> > > >  .../bindings/display/bridge/ite,it6505.yaml   | 101 +++++++++++++++---
> > > >  1 file changed, 88 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > > > index b16a9d9127dd..8ae9c5cba22c 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > > > @@ -75,22 +75,49 @@ properties:
> > > >        port@1:
> > > >          $ref: /schemas/graph.yaml#/$defs/port-base
> > > >          unevaluatedProperties: false
> > > > -        description: Video port for DP output
> > > > +        description:
> > > > +          Video port for DP output. Each endpoint connects to a video output
> > > > +          downstream, and the "data-lanes" property is used to describe the pin
> > > > +          connections. 0, 1, 2, 3 in "data-lanes" maps to TX0, TX1, TX2, TX3,
> > > > +          respectively.
> > > >
> > > > -        properties:
> > > > -          endpoint:
> > > > -            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > > +
> > > > +        patternProperties:
> > > > +          "^endpoint@[01]$":
> > > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > >              unevaluatedProperties: false
> > > >
> > > >              properties:
> > > > +              reg: true
> > > > +
> > > > +              remote-endpoint: true
> > > > +
> > > >                data-lanes:
> > > > -                minItems: 1
> > > > -                uniqueItems: true
> > > > -                items:
> > > > -                  - enum: [ 0, 1 ]
> > > > -                  - const: 1
> > > > -                  - const: 2
> > > > -                  - const: 3
> > > > +                oneOf:
> > > > +                  - items:
> > > > +                      - enum: [0, 1, 2, 3]
> > > > +
> > > > +                  - items:
> > > > +                      - const: 0
> > > > +                      - const: 1
> > > > +
> > > > +                  - items:
> > > > +                      - const: 2
> > > > +                      - const: 3
> > > > +
> > > > +                  - items:
> > > > +                      - const: 0
> > > > +                      - const: 1
> > > > +                      - const: 2
> > > > +                      - const: 3
> > > > +
> > > > +              mode-switch:
> > > > +                type: boolean
> > > > +                description: Register this node as a Type-C mode switch or not.
> > >
> > > Existing users put this property in the device's node, not the endpoint.
> > > That seems more like a property of the device, than the DP link.
> >
> > In our use case, we want to register two mode switches for the same
> > device. That's why we put the "mode-switch" property in the endpoints
> > instead of the device node.
>
> Then do that. Register a mode switch for each endpoint connected to a
> USB-C connector. You can walk the graph to see what type of connector.
>
> The only way I could see this as an issue is you have 2 USB-C
> connectors and one is a mode switch and one is not. Not sure if such a
> scenario is likely or possible. If it is, please educate me.

We can know which endpoints should be registered as a MUX by walking
through the graph, but the typec_mux_match[1] checks if the node
explicitly specifies a "mode-switch" property. So we still have to put
the property in the endpoints.

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/usb/typec/mux.c#L265
>
> > > You are using fwnode_typec_mux_get(), right?
> >
> > Yes. This is called by cros_ec_typec.c[1] in our use case.
>
> That code looks for 'mode-switch' in the device's node, not the
> endpoint. So how does it work for you?

We modified the function in patch 1/9 of this series to make it also
look for endpoints.
>
> Rob

Regards,
Pin-yen
