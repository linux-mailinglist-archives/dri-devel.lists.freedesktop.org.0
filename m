Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5B01292BE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84D46E203;
	Mon, 23 Dec 2019 08:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD1D6EBC7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 03:20:39 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id p8so6693237iln.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 19:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SXtqcttKLWZ67QzGf6zW6Mb+RordXMuCQM4bcsq63Ew=;
 b=eyK9YQy/lE6L+bXC+B5o4JUrisPmeN/WR/NhSkJG61OBZLc/sKtHiC5FP0XgVog6gB
 u+wmXubHt2HBBX37rdh5RoBotClfBPjJdpEg+e0kI9d3LRIT/8g1wPy9zc31bjN+bohW
 QFTLizraMP9mVU87dth7H7qpI+fbhYqBz+EKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SXtqcttKLWZ67QzGf6zW6Mb+RordXMuCQM4bcsq63Ew=;
 b=Nd4FIJuZah5/daWqvwnfvtp25DJjaRQMJEmuJmY3aN2qGJY27EPi+hpRpGXc4gVIqO
 RbiU0MPSI5+Yr1/S2y5Hd1R8Y6KKrKDoqjRDXl0cItbrnn2R87KQHEjenN2uSK2qUyZf
 838VONVzHJ4ahhtETFkpfT6gu2seqW8Px7zH/2eik4Z1kszlh8+N85NqtwbdNMOSE9cI
 mfIT4svAiS3uNagwZJDHhYOPVxjflVyd+H6+VvDLW2cen23cdzz0GISH4WXsFViMGSiF
 XKRAM39MUtiXpqG9Y4GdS4uHyEy9u2zlfLe8Ik/8pa8kgDLBt2XAi1oBc+DDagzIw4wP
 zNsQ==
X-Gm-Message-State: APjAAAUUAcrH+r8zuGZHax05jRWG07Owh4A8p/DoufXBA6x3JCI8pzH2
 FbJboTLXvS0+ePB1XKYqF0qEwZL867FleBHyRu4Hpg==
X-Google-Smtp-Source: APXvYqy7u7wzTGXLrsZ+AXTg1p3cHCghbe0rKg+y/NZ+ag2qe3QXozlNdrsEwzL28gnj/FhLLbWiw1JrD5C1rI9j66A=
X-Received: by 2002:a92:af8e:: with SMTP id v14mr10037048ill.150.1576812038892; 
 Thu, 19 Dec 2019 19:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-2-hsinyi@chromium.org>
 <20191219204524.GA7841@bogus>
In-Reply-To: <20191219204524.GA7841@bogus>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 20 Dec 2019 11:20:13 +0800
Message-ID: <CAJMQK-gYFJ-F9_rkPsxXS+qc40OwU-di2tdLLbL7x=smbRNujw@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/4] dt-bindings: drm/bridge: analogix-anx7688: Add
 ANX7688 transmitter binding
To: Rob Herring <robh@kernel.org>
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
 Devicetree List <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <mbrugger@suse.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 4:45 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Dec 11, 2019 at 02:19:08PM +0800, Hsin-Yi Wang wrote:
> > From: Nicolas Boichat <drinkcat@chromium.org>
> >
> > Add support for analogix,anx7688
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > Change from RFC to v1:
> > - txt to yaml
> > ---
> >  .../bindings/display/bridge/anx7688.yaml      | 60 +++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> > new file mode 100644
> > index 000000000000..cf79f7cf8fdf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/anx7688.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analogix ANX7688 SlimPort (Single-Chip Transmitter for DP over USB-C)
> > +
> > +maintainers:
> > +  - Nicolas Boichat <drinkcat@chromium.org>
> > +
> > +description: |
> > +  The ANX7688 is a single-chip mobile transmitter to support 4K 60 frames per
> > +  second (4096x2160p60) or FHD 120 frames per second (1920x1080p120) video
> > +  resolution from a smartphone or tablet with full function USB-C.
> > +
> > +  This binding only describes the HDMI to DP display bridge.
> > +
> > +properties:
> > +  compatible:
> > +    const: analogix,anx7688
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: I2C address of the device
> > +
> > +  ports:
> > +    type: object
> > +
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: |
> > +          Video port for HDMI input
> > +
> > +      port@1:
> > +        type: object
> > +        description: |
> > +          Video port for eDP output
> > +
> > +    required:
> > +      - port@0
>
> Sometimes you have no output?
Yes, only input is required.
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - ports
>
> The example will have errors because it is missing 'ports'. Run 'make
> dt_binding_check'.
>
> Add:
>
> additionalProperties: false
>
Ack, will fix this. Thanks
> > +
> > +examples:
> > +  - |
> > +    anx7688: anx7688@2c {
> > +      compatible = "analogix,anx7688";
> > +      reg = <0x2c>;
> > +
> > +      port {
> > +        anx7688_in: endpoint {
> > +          remote-endpoint = <&hdmi0_out>;
> > +        };
> > +      };
> > +    };
> > --
> > 2.24.0.525.g8f36a354ae-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
