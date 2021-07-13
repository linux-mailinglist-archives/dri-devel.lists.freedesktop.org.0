Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32133C796D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 00:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC94F89938;
	Tue, 13 Jul 2021 22:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C794789938
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 22:10:22 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id h3so24702066ilc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 15:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I836Y03DloC/Q/3mWy2ffCQlaq2BnV1RVfWxpJJqnrc=;
 b=cxUNGkGZkg88XmQ8CXAlSiJWCDRGxxl/6Ne/+bpRFVVOcThNI7xYdzI+zh2S2QcnHP
 SGQT28lq8UaMzLp3W7HaDhunLmEBP583IuHUJmQaiGXhiYHc8pzRvIXPyOk1Jq6VucSS
 JueJMkGyfs7kAUCrdRA1qVzkL/X9407IZ9osAiQzVRoaT9Q3NV/E+9uJ7PQf2f/b7DCu
 aLTGAeTbeP4yhorCFAp/GQzotlyfbJZtJiKQmv9Ejwe5RkGzfyvkrFNWvcBKIp4awJdQ
 nL5Ryir+7F/ZCuEJxeQGrgny3AYQMnosGzaltFAQ+Bv0KXRoWSq3FYil56x4Gz2sA5FU
 1HrA==
X-Gm-Message-State: AOAM533O6exRzXkCwYt2PdeVi7tHZQDZvbw8I5/ZwCyC1DHFbIXitAxz
 HIjRWyd7q/CXi5s1TqBV1w==
X-Google-Smtp-Source: ABdhPJxe/x6Fgg1IHu4QCdFXT48XelScmqOeXRMOVdkc3PeJRWWeb0LQHPvVdUUEzFgOIeIK/WQEEw==
X-Received: by 2002:a92:7d08:: with SMTP id y8mr4125420ilc.43.1626214222086;
 Tue, 13 Jul 2021 15:10:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id b9sm161468ilo.23.2021.07.13.15.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:21 -0700 (PDT)
Received: (nullmailer pid 934954 invoked by uid 1000);
 Tue, 13 Jul 2021 22:10:10 -0000
Date: Tue, 13 Jul 2021 16:10:10 -0600
From: Rob Herring <robh@kernel.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v9 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
Message-ID: <20210713221010.GA916196@robh.at.kernel.org>
References: <cover.1624349479.git.xji@analogixsemi.com>
 <308427448195e2db37a32997c6d32905c96ca876.1624349480.git.xji@analogixsemi.com>
 <CAG3jFys6D=-L-Aez4aWuE4nM7qJCtn4wPws3TKxbkRzcAoFR0A@mail.gmail.com>
 <20210707073051.GA936385@anxtwsw-Precision-3640-Tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707073051.GA936385@anxtwsw-Precision-3640-Tower>
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
Cc: Nicolas Boichat <drinkcat@google.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 dri-devel@lists.freedesktop.org, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Mark Brown <broonie@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Bernie Liang <bliang@analogixsemi.com>,
 Sheng Pan <span@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 07, 2021 at 03:30:51PM +0800, Xin Ji wrote:
> On Thu, Jun 24, 2021 at 01:57:22PM +0200, Robert Foss wrote:
> > Hey Xin,
> > 
> > I would like to merge this series now, but this patch needs a review
> > first. Maybe Laurent/Rob Herring are good candidates.
> > 
> > 
> > Rob.
> Hi Rob, I get Laurent/Rob comments before, and explained why we needs
> these DT properties, so far, I didn't get any response.

Do I have to go dig that up? If it was more than a week ago, assume I 
don't remember. This is 1 of 100 bindings a week.

Justify why this is needed in your commit message.

> Hi Rob Herring and Laurent, for the DT property lane0/1-swing, Google
> engineer has strong demond for them, they don't want to move DP swing
> adjusting to kernel, thus may cause change the driver code in each
> project, so config them in DT is a best option.

Where's the ack from a Google engineer?

> 
> Thanks,
> Xin
> > 
> > On Tue, 22 Jun 2021 at 14:31, Xin Ji <xji@analogixsemi.com> wrote:
> > >
> > > Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
> > > lane1 swing register array define, and audio enable flag.
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  .../display/bridge/analogix,anx7625.yaml      | 57 ++++++++++++++++++-
> > >  1 file changed, 56 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > index ab48ab2f4240..9e604d19a3d5 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > @@ -43,6 +43,26 @@ properties:
> > >    vdd33-supply:
> > >      description: Regulator that provides the supply 3.3V power.
> > >
> > > +  analogix,lane0-swing:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    minItems: 1
> > > +    maxItems: 20
> > > +    description:
> > > +      an array of swing register setting for DP tx lane0 PHY, please don't
> > > +      add this property, or contact vendor.

Why do we have the property if we're not supposed to add it.

> > > +
> > > +  analogix,lane1-swing:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    minItems: 1
> > > +    maxItems: 20
> > > +    description:
> > > +      an array of swing register setting for DP tx lane1 PHY, please don't
> > > +      add this property, or contact vendor.
> > > +
> > > +  analogix,audio-enable:
> > > +    type: boolean
> > > +    description: let the driver enable audio HDMI codec function or not.

Wouldn't we have a 'port' node if audio is to be enabled?

> > > +
> > >    ports:
> > >      $ref: /schemas/graph.yaml#/properties/ports
> > >
> > > @@ -50,13 +70,43 @@ properties:
> > >        port@0:
> > >          $ref: /schemas/graph.yaml#/properties/port
> > >          description:
> > > -          Video port for MIPI DSI input.
> > > +          MIPI DSI/DPI input.
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > +            type: object
> > > +            additionalProperties: false

Use 'unevaluatedProperties: false' instead...

> > > +
> > > +            properties:
> > > +              remote-endpoint: true

...And drop this.

> > > +              bus-type: true

This device supports all the possible bus types? What's the default as 
it is not required?

> > > +              data-lanes: true

And up to 8 lanes? 

> > > +
> > > +            required:
> > > +              - remote-endpoint
> > > +
> > > +        required:
> > > +          - endpoint

You can drop both 'required'.

> > > +
> > >
> > >        port@1:
> > >          $ref: /schemas/graph.yaml#/properties/port
> > >          description:
> > >            Video port for panel or connector.
> > >
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/media/video-interfaces.yaml#

Doesn't look like anything from video-interfaces.yaml is used. This 
whole chunk is not needed.

> > > +            type: object
> > > +            additionalProperties: false
> > > +
> > > +            properties:
> > > +              remote-endpoint: true
> > > +
> > > +            required:
> > > +              - remote-endpoint
> > > +
> > >      required:
> > >        - port@0
> > >        - port@1
> > > @@ -87,6 +137,9 @@ examples:
> > >              vdd10-supply = <&pp1000_mipibrdg>;
> > >              vdd18-supply = <&pp1800_mipibrdg>;
> > >              vdd33-supply = <&pp3300_mipibrdg>;
> > > +            analogix,audio-enable;
> > > +            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > > +            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > >
> > >              ports {
> > >                  #address-cells = <1>;
> > > @@ -96,6 +149,8 @@ examples:
> > >                      reg = <0>;
> > >                      anx7625_in: endpoint {
> > >                          remote-endpoint = <&mipi_dsi>;
> > > +                        bus-type = <5>;
> > > +                        data-lanes = <0 1 2 3>;
> > >                      };
> > >                  };
> > >
> > > --
> > > 2.25.1
> > >
> 
