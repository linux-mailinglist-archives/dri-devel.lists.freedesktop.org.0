Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8065614C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 09:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A330D10E00E;
	Mon, 26 Dec 2022 08:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843EA10E00E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 08:49:14 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id v2so5440448ioe.4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 00:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2GeevI+7bf+WdnjCpmvJ+ryR3Rl0w6Jx09kir3h8qMo=;
 b=A9q8tX198F/2Z/0BSktVTjH8jcNAq1fdLNcR5/WqXtgUvu36TiKPpvatfDNeleCBNv
 lkNJTFuEQZMnTD9qhgg6HKcGsFqiS9jvvpMSdNyiREwvfRXKbQGuZhkmQAg4Yf9MJBd0
 0a3PRkzf2unQBF24GU5DTrxglocRfR4jJ/8Ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2GeevI+7bf+WdnjCpmvJ+ryR3Rl0w6Jx09kir3h8qMo=;
 b=mHQQ9FvxSpZThiGIUlS8KOlybGuRsES3sAe2gx03Wk62RTwGq1ACOnmwbfiwMKzjqY
 v0+mD+GI+GkKZQeW4QJLnJJ4X4aEewWKumbPJAEpjcOVkXUkAcevlxBmmc3wvxL8JE0F
 6f067DRLAVhhx88vH2mcX+2dumt5xLocKcW0G8I0/WnCyQmJl13mfd1EZWWIHqakFIS2
 0/iRW93AIKebOoYgXZyiU3iv/lkDW5u5LWFoXpWuwWnTBjwIT2Vh0ynBWq9x3WqguSrG
 G6XUE23W6+pUECMSqLGc2lRwn/HMIn1xFOq9pVpv2pgMuWR9ArlB7B8eAaQ/SFuQpT5S
 aN7A==
X-Gm-Message-State: AFqh2kqOW/qK2Q0HC2Wv0QZuG0TRlxwPxzga4SKM3xp753iiOP1aPrGH
 Me6En4peYgx8xvgL8bUx4SEn6+aC0FTSxRQOwQzCCA==
X-Google-Smtp-Source: AMrXdXuoIUzBqmDwKs1PuREjFiXYUco2lpJxyc5dz0d+UodE12xrOWp1ECASRqgdbQyL/HzV1vUTTbOYxbxmKfzXt3E=
X-Received: by 2002:a6b:7a0a:0:b0:6e9:b3db:b5ce with SMTP id
 h10-20020a6b7a0a000000b006e9b3dbb5cemr1327069iom.179.1672044553677; Mon, 26
 Dec 2022 00:49:13 -0800 (PST)
MIME-Version: 1.0
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-4-treapking@chromium.org>
 <00cc31a2-39b1-9bb3-5b79-3c6d51cd5d51@linaro.org>
In-Reply-To: <00cc31a2-39b1-9bb3-5b79-3c6d51cd5d51@linaro.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 26 Dec 2022 16:49:02 +0800
Message-ID: <CAEXTbpfhBCWvZCziyc6chR2Vjc=SJSxYfYpdX8gd8PkG4G0+3w@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
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

On Mon, Nov 28, 2022 at 4:58 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/11/2022 11:20, Pin-yen Lin wrote:
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
> >
> > ---
> >
> > Changes in v6:
> > - Remove switches node and use endpoints and data-lanes property to
> >   describe the connections.
>
> Except missing testing few things...
>
> >
> >  .../display/bridge/analogix,anx7625.yaml      | 73 ++++++++++++++++++-
> >  1 file changed, 71 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 4590186c4a0b..5fdbf1f3bab8 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -12,7 +12,8 @@ maintainers:
> >
> >  description: |
> >    The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
> > -  designed for portable devices.
> > +  designed for portable devices. Product brief is available at
> > +  https://www.analogix.com/en/system/files/AA-002291-PB-6-ANX7625_ProductBrief.pdf
> >
> >  properties:
> >    compatible:
> > @@ -112,10 +113,36 @@ properties:
> >                data-lanes: true
> >
> >        port@1:
> > -        $ref: /schemas/graph.yaml#/properties/port
> > +        $ref: /schemas/graph.yaml#/properties/port-base
>
> I don't understand why you are changing this line.

Without this change, the `unevaluatedProperties: false` in
`/schemas/graph.yaml#/properties/port` does not allow me to add new
properties.
>
> >          description:
> >            Video port for panel or connector.
> >
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
>
> These are confusing... you allow only one item, so why minItems and
> uniqueItems?

What I want to use is something like:
```
items:
  enum: [0,1, 2, 3]
```
That is, all the items should be an integer between 0 and 3. I'll
update this to a stricter version in v7.
>
> > +                items:
> > +                  - enum: [ 0, 1, 2, 3]
> > +
> > +              mode-switch:
> > +                type: boolean
> > +                description: Register this node as a Type-C mode switch or not.
> > +
> > +            required:
> > +              - reg
> > +              - remote-endpoint
> > +
> >      required:
> >        - port@0
> >        - port@1
> > @@ -186,3 +213,45 @@ examples:
> >              };
> >          };
> >      };
> > +  - |
> > +    &i2c3 {
> > +     anx_bridge_dp: anx7625-dp@58 {
>
> Messed up indentation.
I'll fix this in the next version.
>
> > +         compatible = "analogix,anx7625
>
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
I'll update this in v7.
>
> ";
> > +         reg = <0x58>;
>
> Best regards,
> Krzysztof
>

Best regards,
Pin-yen
