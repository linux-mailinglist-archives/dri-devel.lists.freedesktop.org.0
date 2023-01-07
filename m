Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BDB660D3A
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 10:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BE110E18D;
	Sat,  7 Jan 2023 09:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFA710E18D
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 09:19:58 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id d10so2185384ilc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 01:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PbK2+hAlju8ZkGAxc+UQ8RxlZcml7uwUsydLc2gyPEg=;
 b=kfpfmOt+J4n/7SFbmM1pUbeuoX2q1niSB/uKPzsnGL7+M0JwLgagBJO3UnWh65gVeF
 XO11m2J1IDe09i1vfxNVoD6lJRkxkJ4n+RqYZKMvsVrWoM/SCt0NBGzC/SMOz697A2pZ
 YKJvooichUSfD0CDPe7PH0T5W+F3TJ6QkCkz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PbK2+hAlju8ZkGAxc+UQ8RxlZcml7uwUsydLc2gyPEg=;
 b=IMsyKsCIsX1swVWiOnfh87WQzjAdjnitreshMKZgTgi7llaecbfFtzocdDevQgxEIs
 wYdENeKZ7Z7g6PkHvk+hRreKCUDWbuY2IKlf3aV19qWH0TSFS1F7aVHGq6+zoe4RH4Nc
 vprgr1/5ANd2cFuXPe775EdoW3DJ3y/NYHBlRnaRDrtgdHHw/b6nIDJWF2nyNUhe8Hdu
 UklMO3r5YqTMWDCJNF0ur5y2uiqW08RNCvMiD2sLKgn9AvKwScRFdqJ6Ka3JBDmNTEIV
 ap2HsQooaGopcaSo2D9w46qp3DX5b4q7K3J4mXk2TDpUkQAf2ELYJTIyIEZY5IJDYrqv
 g8oA==
X-Gm-Message-State: AFqh2kow2DZ/aZmaxDGuK/95x4fPi9hmGazcEXjPPPFFxuUXqCfyT8N8
 2Dwk8tx+YmqIegZ5G4mi+grEYuQYH1ZTFnJ41kMC6w==
X-Google-Smtp-Source: AMrXdXvICIhe7IxdthfJp4igZhpX85NTS+E2nKcOMieonKi7rm9RWK0+me5+LzCr+2tJ6fmZgXKyCZIwff6ecY8f7CA=
X-Received: by 2002:a92:d0f:0:b0:303:96b3:c8a0 with SMTP id
 15-20020a920d0f000000b0030396b3c8a0mr5352459iln.192.1673083197870; Sat, 07
 Jan 2023 01:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20230105132457.4125372-1-treapking@chromium.org>
 <20230105132457.4125372-8-treapking@chromium.org>
 <5ad7a6bc-0ffd-9d2d-ed80-62c3530cf2fa@linaro.org>
In-Reply-To: <5ad7a6bc-0ffd-9d2d-ed80-62c3530cf2fa@linaro.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Sat, 7 Jan 2023 17:19:46 +0800
Message-ID: <CAEXTbpdxQDvkJTX0XgNkn8s=KMZHuLaPN8nnyfcbkxJ3fgQbdA@mail.gmail.com>
Subject: Re: [PATCH v7 7/9] dt/bindings: drm/bridge: it6505: Add mode-switch
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

Thanks for the review.

On Fri, Jan 6, 2023 at 8:48 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/01/2023 14:24, Pin-yen Lin wrote:
> > ITE IT6505 can be used in systems to switch the DP traffic between
> > two downstreams, which can be USB Type-C DisplayPort alternate mode
> > lane or regular DisplayPort output ports.
>
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching).

I'll fix this in this patch and the one for anx7625.
>
> >
> > Update the binding to accommodate this usage by introducing a
> > data-lanes and a mode-switch property on endpoints.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
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
> >  .../bindings/display/bridge/ite,it6505.yaml   | 95 ++++++++++++++++---
> >  1 file changed, 84 insertions(+), 11 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > index b16a9d9127dd..1ee7cd0d2035 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > @@ -77,20 +77,45 @@ properties:
> >          unevaluatedProperties: false
> >          description: Video port for DP output
> >
> > -        properties:
> > -          endpoint:
> > +        patternProperties:
> > +          "^endpoint@[01]$":
> >              $ref: /schemas/graph.yaml#/$defs/endpoint-base
> >              unevaluatedProperties: false
> >
> >              properties:
> > +              reg:
> > +                maxItems: 1
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
> > +                  - minItems: 1
>
> Drop minItems.
>
> > +                    maxItems: 1
>
> Actually drop this as well and just use items with one item (enum).

Sure I'll update this in v8.
>
> > +                    items:
> > +                      enum: [0, 1, 2, 3]
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
> >
> >      required:
> >        - port@0
> > @@ -102,7 +127,6 @@ required:
> >    - pwr18-supply
> >    - interrupts
> >    - reset-gpios
> > -  - extcon
> >    - ports
> >
> >  additionalProperties: false
> > @@ -139,8 +163,11 @@ examples:
> >                  };
> >
> >                  port@1 {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> >                      reg = <1>;
> > -                    it6505_out: endpoint {
> > +                    it6505_out: endpoint@0 {
> > +                        reg = <0>;
> >                          remote-endpoint = <&dp_in>;
> >                          data-lanes = <0 1>;
> >                      };
> > @@ -148,3 +175,49 @@ examples:
> >              };
> >          };
> >      };
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c3 {
>
> Just i2c

Will fix in v8.
>
> Best regards,
> Krzysztof
>

Best regards,
Pin-yen
