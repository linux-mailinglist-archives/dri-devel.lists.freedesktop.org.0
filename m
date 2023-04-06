Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79046D9CB0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 17:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B76C10EC2E;
	Thu,  6 Apr 2023 15:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9E710EC1D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 15:50:28 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id k7so8054531ils.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 08:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680796227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0vw0nTdNNDBdzuVwl43PcGSuAabOdNNAGw61ZkrRkbk=;
 b=Dtaox/tAdrkSpD669sTOy5nmorhEWtnr2dEZhlXAIztSf8/6EGk9IhwTcZdL7c/db2
 u6lLo0Y8U87ixfZ8UekNOlIlfm43vhfpljRczsbpKkEj3Mbc67SuOZfWOnjS+GpHflXK
 KHsDapHN2Z+wChVdC81Qj+SyTaL/1CyjiZFO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680796227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0vw0nTdNNDBdzuVwl43PcGSuAabOdNNAGw61ZkrRkbk=;
 b=Kz1axqgeHlZKEdyPjWfkib8EEnEH6e5HcyykbcnXMtx8dZHX0UkNtBFJE+yl7Dq877
 cuSbN2uV3F8xTgSS5FD1wwET44d1RpF08X8qpBgawokWnL+g6/KxIMDigtpcIwy9EDUe
 KMV/YBo+0VONtgUV00zwIJcuAQQculXg3472N4BO/ZunRQYN442qMPlQqC4eb+ANu0La
 Z/3mzjBEoO8LPzcfmXiEqAj8RXCh50qkIrmzFVxTDbAU61MOEiejpCpqUNYF7gkkFthe
 icR80t4D1HqsZ843cfIXr4SnxIJq/1dzGit/pjfeQ5NG2RA7itE7MNlY2lihuzww5nY+
 v2TA==
X-Gm-Message-State: AAQBX9dQ5ggvI3EI//v5qu7usxmJk724gT5Tb/1/IKu/A/tiXVjlPUMI
 17l3H0RECQTP7Fp4hYNWrZxzWca1Y9bzguZnRXjy9w==
X-Google-Smtp-Source: AKy350ahTRwqxB32fuHDEhVOj2irSRSGAPqf/lRVAs2lliq4tse2KYN9S3pr/GdI7YCuZClMvusqhNNTlPDqjQeaHO0=
X-Received: by 2002:a05:6e02:1208:b0:325:e737:9d62 with SMTP id
 a8-20020a056e02120800b00325e7379d62mr6445519ilq.6.1680796227515; Thu, 06 Apr
 2023 08:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-9-treapking@chromium.org>
 <20230406151543.GA3098002-robh@kernel.org>
In-Reply-To: <20230406151543.GA3098002-robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 7 Apr 2023 00:50:16 +0900
Message-ID: <CAEXTbpfwMBOTSe3Vp8arTGK1hanrS7qZTFeaN+qN148XcZ4-Fg@mail.gmail.com>
Subject: Re: [PATCH v15 08/10] dt-bindings: display: bridge: it6505: Add
 mode-switch support
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Stephen Boyd <swboyd@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for the review.

On Fri, Apr 7, 2023 at 12:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Mar 31, 2023 at 05:11:43PM +0800, Pin-yen Lin wrote:
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
> > (no changes since v12)
> >
> > Changes in v12:
> > - Fixed the schema of "data-lanes" property for it6505
> > - Reworded the description of the mode-switch property
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
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it650=
5.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > index c9a882ee6d98..348b02f26041 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > @@ -75,22 +75,49 @@ properties:
> >        port@1:
> >          $ref: /schemas/graph.yaml#/$defs/port-base
> >          unevaluatedProperties: false
> > -        description: Video port for DP output
> > +        description:
> > +          Video port for DP output. Each endpoint connects to a video =
output
> > +          downstream, and the "data-lanes" property is used to describ=
e the pin
> > +          connections. 0, 1, 2, 3 in "data-lanes" maps to TX0, TX1, TX=
2, TX3,
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
>
> You don't need to list these 2.
>
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
> > +                      - enum: [0, 3]
>
> Only lane 1 wasn't valid? If so, mention that in the commit message.

Tha IT6505 bridge only supports "lane swapping" that reverses the
output pins, so only lane 1 or lane 2 is not valid. I'll update this
in the commit message as well.
>
> > +
> > +                  - items:
> > +                      - const: 0
> > +                      - const: 1
> > +
> > +                  - items:
> > +                      - const: 3
> > +                      - const: 2
> > +
> > +                  - items:
> > +                      - const: 0
> > +                      - const: 1
> > +                      - const: 2
> > +                      - const: 3
>
> Isn't this the default if 'data-lanes' is omitted.

I don't think we have a "default" in the IT6505 driver because it
currently doesn't have any use case that has all 4 pins described in
an output node. The old use case uses an extcon node to describe the
output, and a 4-pin connection makes no sense for mode switches.

However, we can drop this binding and make it the default when
'data-lanes' is omitted. This will be useful when we migrate the
extcon description to the an output port node.
>
> > +
> > +              mode-switch:
> > +                type: boolean
> > +                description: Serves as Type-C mode switch if present.
> > +
> > +            required:
> > +              - reg
> > +              - remote-endpoint
>
> required can be dropped.
>
> >
> >      required:
> >        - port@0
> > @@ -102,7 +129,6 @@ required:
> >    - pwr18-supply
> >    - interrupts
> >    - reset-gpios
> > -  - extcon
> >    - ports
> >
> >  additionalProperties: false
> > @@ -139,8 +165,11 @@ examples:
> >                  };
> >
> >                  port@1 {
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> >                      reg =3D <1>;
> > -                    it6505_out: endpoint {
> > +                    it6505_out: endpoint@0 {
> > +                        reg =3D <0>;
> >                          remote-endpoint =3D <&dp_in>;
> >                          data-lanes =3D <0 1>;
> >                      };
> > @@ -148,3 +177,49 @@ examples:
> >              };
> >          };
> >      };
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
>
> Why do we need a whole new example? Just extend the existing example
> with new properties/nodes.

I added a new example because I don't think extcon and mode switches
can co-exist. Should I merge the examples to one anyway?
>
> Rob

I'll address other comments in the next version.

Best regards,
Pin-yen
