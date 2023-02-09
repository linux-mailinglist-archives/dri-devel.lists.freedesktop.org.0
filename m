Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9722668FE2B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 05:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF2610E096;
	Thu,  9 Feb 2023 04:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5979710E096
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 04:00:10 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id z2so389916ilq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 20:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=34Uu0qtbvg+E2V6qRqNRr/5yhYdeODS4LYeIVgn0e/w=;
 b=L+LZotxGbkC/ea5aziXyB5kDAXu/00XaiNFq7qjU349gx85ZWVqVqVJOPx1Ycff2Qj
 h9UJ2Ky7l/C0ANtBgLm94WG8B/uljRTSCOr0gkEnhmz9BJrAf8vzCjo4x/zeFrokxA4f
 riR65zYnEeV4d4dQc08Og30zjVbziNpDdwsMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=34Uu0qtbvg+E2V6qRqNRr/5yhYdeODS4LYeIVgn0e/w=;
 b=uByIPaiw5S/d39Gp8514YQtHyvs5hoZ7pzhVC51+iV3S4z5O9GDPGXlNr0UY8TQfZw
 98w2zc/o6vKXKd9VdmvNg7agMLeruV3o5bGfHA/KpP8Eu40aih8rRj8KPOLbDTmwdl8I
 4T48LFiIeW653ot1UcDw82lPu2njcHfXgNAHd6x9gCK6EFLDsPLTrLOBjgFzvKbewPSI
 D4VQyTIbO63bQFBBNTNM1t9mXqCfR3whZkTsPzpbdpy5t9hx9RKPWIOTpF3zEQd+Ikzv
 N3VyN9df3OKCafFOgwadYpUKEcq33CqcpoK5c86y2EqLHGfhyD6/hRYZONun5iMDHGpf
 zKBw==
X-Gm-Message-State: AO0yUKXmJEPTPc1Q7bPPaRHqY2bMeqj9AiUukImu6mmFtV9Ir67bvvsE
 qoj/4lJy3nARgE4AWIECH9gtsC7PEV/vfWNX3OAaOxtkx09bhA==
X-Google-Smtp-Source: AK7set+l0pt1FAbMRKYKU/2kZgCf6I4kbl87a3ND+oDvLUM04gmKSbfsd44gMP6Wx2Z/u6v4Lr8N353uQ/EI6t+S3hc=
X-Received: by 2002:a92:670a:0:b0:310:e753:59c9 with SMTP id
 b10-20020a92670a000000b00310e75359c9mr5569807ilc.10.1675915209445; Wed, 08
 Feb 2023 20:00:09 -0800 (PST)
MIME-Version: 1.0
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-8-treapking@chromium.org>
 <20230207205221.GA4121517-robh@kernel.org>
In-Reply-To: <20230207205221.GA4121517-robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 9 Feb 2023 11:59:58 +0800
Message-ID: <CAEXTbpf5KqH7zev+kooUmz2DiMya-53UmvAMJfcOYcm7CCDthQ@mail.gmail.com>
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

Hi Rob,

Thanks for the review.

On Wed, Feb 8, 2023 at 4:52 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Feb 04, 2023 at 09:30:38PM +0800, Pin-yen Lin wrote:
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
> > Changes in v11:
> > - Updated the description of the endpoints in the bindings
> > - Referenced video-interfaces.yaml instead for the endpoints binding
> > - Removed duplicated definitions from inherited schema
> >
> > Changes in v9:
> > - Fixed subject prefix again
> > - Changed the naming of the example node for it6505
> >
> > Changes in v8:
> > - Updated bindings for data-lanes property
> > - Fixed subject prefix
> >
> > Changes in v7:
> > - Fixed issues reported by dt_binding_check.
> > - Updated the schema and the example dts for data-lanes.
> > - Changed to generic naming for the example dts node.
> >
> > Changes in v6:
> > - Remove switches node and use endpoints and data-lanes property to
> >   describe the connections.
> >
> >  .../bindings/display/bridge/ite,it6505.yaml   | 101 +++++++++++++++---
> >  1 file changed, 88 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > index b16a9d9127dd..8ae9c5cba22c 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > @@ -75,22 +75,49 @@ properties:
> >        port@1:
> >          $ref: /schemas/graph.yaml#/$defs/port-base
> >          unevaluatedProperties: false
> > -        description: Video port for DP output
> > +        description:
> > +          Video port for DP output. Each endpoint connects to a video output
> > +          downstream, and the "data-lanes" property is used to describe the pin
> > +          connections. 0, 1, 2, 3 in "data-lanes" maps to TX0, TX1, TX2, TX3,
> > +          respectively.
> >
> > -        properties:
> > -          endpoint:
> > -            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +
> > +        patternProperties:
> > +          "^endpoint@[01]$":
> > +            $ref: /schemas/media/video-interfaces.yaml#
> >              unevaluatedProperties: false
> >
> >              properties:
> > +              reg: true
> > +
> > +              remote-endpoint: true
> > +
> >                data-lanes:
> > -                minItems: 1
> > -                uniqueItems: true
> > -                items:
> > -                  - enum: [ 0, 1 ]
> > -                  - const: 1
> > -                  - const: 2
> > -                  - const: 3
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
>
> Existing users put this property in the device's node, not the endpoint.
> That seems more like a property of the device, than the DP link.

In our use case, we want to register two mode switches for the same
device. That's why we put the "mode-switch" property in the endpoints
instead of the device node.

>
> You are using fwnode_typec_mux_get(), right?

Yes. This is called by cros_ec_typec.c[1] in our use case.

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/platform/chrome/cros_ec_typec.c#L148

Regards,
Pin-yen
>
> Rob
