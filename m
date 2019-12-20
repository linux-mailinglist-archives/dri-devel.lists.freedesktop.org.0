Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA11292CE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D776E598;
	Mon, 23 Dec 2019 08:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89E16E0AA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 03:51:35 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id a6so6745615ili.9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 19:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6r/8NIk3RYdI6wFY0dB/seZoz3Q74hZA4zM4nK3WDAo=;
 b=JJtfIKZ6x/JIgDR5/VOL2xi9eryZpZ3n8J+MQt9kquUUhFoqUm+r5CrtZlMdpJ/FXD
 yzcNGtFI5asTB3gRXgoea+0JTHZydQYywtTjAa5gneKcM9z78vYFIu0dIRfto9WEi4U5
 fu4iXF/1vyRYlSjH6UEr0B9THzWR0RgYdMBEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6r/8NIk3RYdI6wFY0dB/seZoz3Q74hZA4zM4nK3WDAo=;
 b=LdGDOOJpecPP5f1rIoEvtHZ3FNvc55BegyHWK4iAXKwQ+pNgh2choxGoF5TnI2cBmH
 yQtbHuS3S5nuc/AEZjJDe6jWJkEE1fqpTv+DRahdWaSUo3wC5TjltqlUZVEzjzwyTw3A
 eBE1xI9zfpj28K5/q/pEzDeD97jTmC1RLdhvejy1d0J9cJ1xiQRnwd2D7qAYjximJ0jE
 641cRSA0UMsxaWfXvjna5jZmzKjI4/+qk+gWgAI8FFTYhV9gq85cpooQeDQdnWvBLgBL
 V8I46kTQWzkE43KXb01LEFYztZ4wYUf6seCLGDFe+YGYlci41U5DtsSfsBJAGSb143Ri
 qfpg==
X-Gm-Message-State: APjAAAUvvubfb0f9HrJoVZ/FyrHokXNJZvUjWlBHmUU4VgeSqyJRfSVT
 VvE8n3gOghNT0tW0IubzVivdWgSts7ugx6vGnqak3A==
X-Google-Smtp-Source: APXvYqyndRV+iEzKuq/l9AzfCSdSOFPEKgF32LyHvX4lpMzRKalBaQGQ9YDmLQzKVfLdX3rry9VxuHbcThX6Zg70M4A=
X-Received: by 2002:a92:d610:: with SMTP id w16mr10176825ilm.283.1576813895178; 
 Thu, 19 Dec 2019 19:51:35 -0800 (PST)
MIME-Version: 1.0
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-2-hsinyi@chromium.org>
 <20191219204524.GA7841@bogus>
 <CAJMQK-gYFJ-F9_rkPsxXS+qc40OwU-di2tdLLbL7x=smbRNujw@mail.gmail.com>
 <20191220032238.GA5342@pendragon.ideasonboard.com>
In-Reply-To: <20191220032238.GA5342@pendragon.ideasonboard.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 20 Dec 2019 11:51:09 +0800
Message-ID: <CAJMQK-j1GPxipMkba1VO3xCEOiLJi4ibotKFeRSGZ0e6nOG3Ng@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/4] dt-bindings: drm/bridge: analogix-anx7688: Add
 ANX7688 transmitter binding
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 11:22 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Hsin-Yi,
>
> On Fri, Dec 20, 2019 at 11:20:13AM +0800, Hsin-Yi Wang wrote:
> > On Fri, Dec 20, 2019 at 4:45 AM Rob Herring wrote:
> > > On Wed, Dec 11, 2019 at 02:19:08PM +0800, Hsin-Yi Wang wrote:
> > > > From: Nicolas Boichat <drinkcat@chromium.org>
> > > >
> > > > Add support for analogix,anx7688
> > > >
> > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > ---
> > > > Change from RFC to v1:
> > > > - txt to yaml
> > > > ---
> > > >  .../bindings/display/bridge/anx7688.yaml      | 60 +++++++++++++++++++
> > > >  1 file changed, 60 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> > > > new file mode 100644
> > > > index 000000000000..cf79f7cf8fdf
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> > > > @@ -0,0 +1,60 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/bridge/anx7688.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Analogix ANX7688 SlimPort (Single-Chip Transmitter for DP over USB-C)
> > > > +
> > > > +maintainers:
> > > > +  - Nicolas Boichat <drinkcat@chromium.org>
> > > > +
> > > > +description: |
> > > > +  The ANX7688 is a single-chip mobile transmitter to support 4K 60 frames per
> > > > +  second (4096x2160p60) or FHD 120 frames per second (1920x1080p120) video
> > > > +  resolution from a smartphone or tablet with full function USB-C.
> > > > +
> > > > +  This binding only describes the HDMI to DP display bridge.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: analogix,anx7688
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +    description: I2C address of the device
> > > > +
> > > > +  ports:
> > > > +    type: object
> > > > +
> > > > +    properties:
> > > > +      port@0:
> > > > +        type: object
> > > > +        description: |
> > > > +          Video port for HDMI input
> > > > +
> > > > +      port@1:
> > > > +        type: object
> > > > +        description: |
> > > > +          Video port for eDP output
> > > > +
> > > > +    required:
> > > > +      - port@0
> > >
> > > Sometimes you have no output?
> >
> > Yes, only input is required.
>
> But what happens in that case ? What's the use of a bridge with a
> non-connected output ? :-)
>
There's output connected, but doesn't need a driver. For example, in
our use case it's connected to a usb-c connector. We don't need to
state it in dts.
I also checked https://elixir.bootlin.com/linux/v5.5-rc2/source/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
and thought that output could be optional. Also
https://elixir.bootlin.com/linux/v5.5-rc2/source/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts#L116
Or maybe we can add output in example as anx6345?
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - ports
> > >
> > > The example will have errors because it is missing 'ports'. Run 'make
> > > dt_binding_check'.
> > >
> > > Add:
> > >
> > > additionalProperties: false
> > >
> >
> > Ack, will fix this. Thanks
> >
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    anx7688: anx7688@2c {
> > > > +      compatible = "analogix,anx7688";
> > > > +      reg = <0x2c>;
> > > > +
> > > > +      port {
> > > > +        anx7688_in: endpoint {
> > > > +          remote-endpoint = <&hdmi0_out>;
> > > > +        };
> > > > +      };
> > > > +    };
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
