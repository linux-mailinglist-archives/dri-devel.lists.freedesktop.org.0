Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C3323BF1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 13:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786FF6E8C2;
	Wed, 24 Feb 2021 12:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825AD6E8C2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 12:37:56 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id l12so2297998edt.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 04:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g07oglWDP6MW/sT/0KORfHFay4I08yTBqKpnsZcOxR0=;
 b=JkQw5OpKBkdZyh07F+JVOE82ubO8e/yH6drILRD6olCknp04OYbWD4oNqMHuM/UjK7
 +zBfNqPxRal7XD1E0ebOlxQAfduFI6Nn9+JmjgCYDPZg4HrB9UR3emBLUwvTq68oONb0
 9DnsGxRqNiIwUq3wwJU0Ww3mcInwW+P7LtdMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g07oglWDP6MW/sT/0KORfHFay4I08yTBqKpnsZcOxR0=;
 b=UwpkzkVZBL/leSYzQV/zcNftWORBTqgfPnTq5GlWpTH0+WqJueS7CbOEPsyaZ0mBKO
 r21sauvPxcLFUseJEB5MEyvo5ed1BZZRPSk834JuHhaHPV0A6d+aJ424E1shJBXdZ95M
 Dob7kPAD4kFwPrd0+6lgWIOdDR/u9C7LJEVIrs0qJ8qgZvkLrskwIJ/T2wKI+nNZCaAF
 R3HFlqDAzdvNUm0S7nMQeogYUt0Oh5fBYvXf6+c0N5BeQk6s9rfgr7aA3lnvquE2rlzc
 9L+EnRTDT9t0ioqWeOre2pOq58Pz+EDOWmaKO383+UdscV8jDNOyjqJzGH4YtaJ3SIF1
 DyJQ==
X-Gm-Message-State: AOAM533mJz1LGUiHf7lLI8voOdS+TEj7CCsozrJSunhrZIqWOlpyKYN/
 lRMdF7ogqfBk1mdqQcp0dXewKSFcyU28xrq21XzOIw==
X-Google-Smtp-Source: ABdhPJyVP8jYaoGikQdL4uI2tbLxt5QZyKSbb5dZCpNiGmPPFJtjCN7iayaf+Wq/05Dty7VWud+PoyKrDNCgfqwiU/c=
X-Received: by 2002:a05:6402:33a:: with SMTP id
 q26mr28983732edw.150.1614170275198; 
 Wed, 24 Feb 2021 04:37:55 -0800 (PST)
MIME-Version: 1.0
References: <20210214175211.105107-1-jagan@amarulasolutions.com>
 <YCpmZWRoiWULiANx@pendragon.ideasonboard.com>
In-Reply-To: <YCpmZWRoiWULiANx@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 24 Feb 2021 18:07:43 +0530
Message-ID: <CAMty3ZDt2EDB8E2nNLx_jfqE7-ActVYVoeFo2Eso+nVuUfVL+w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 Chipone ICN6211
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Feb 15, 2021 at 5:48 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> Thank you for the patch.
>
> On Sun, Feb 14, 2021 at 11:22:10PM +0530, Jagan Teki wrote:
> > ICN6211 is MIPI-DSI to RGB Convertor bridge from Chipone.
> >
> > It has a flexible configuration of MIPI DSI signal input and
> > produce RGB565, RGB666, RGB888 output format.
> >
> > Add dt-bingings for it.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v3:
> > - updated to new dt-bindings style
> >
> >  .../display/bridge/chipone,icn6211.yaml       | 90 +++++++++++++++++++
> >  1 file changed, 90 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > new file mode 100644
> > index 000000000000..13764f13fe46
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > @@ -0,0 +1,90 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/chipone,icn6211.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Chipone ICN6211 MIPI-DSI to RGB Converter bridge
> > +
> > +maintainers:
> > +  - Jagan Teki <jagan@amarulasolutions.com>
> > +
> > +description: |
> > +  ICN6211 is MIPI-DSI to RGB Convertor bridge from chipone.
> > +
> > +  It has a flexible configuration of MIPI DSI signal input and
> > +  produce RGB565, RGB666, RGB888 output format.
>
> How does one select between the output formats ? Should the output
> connection option be described in the device tree ?

I think that is a good option to select output formats via dts. what
if it makes it a generic property like data-lanes? since it is common
across many other bridges.

>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - chipone,icn6211
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: virtual channel number of a DSI peripheral
> > +
> > +  reset-gpios:
> > +    description: GPIO connected for the reset pin
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Video port for MIPI DSI input
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Video port for MIPI DPI output (panel or connector).
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reset-gpios
> > +  - ports
>
> How about regulators ?

Will add it in the next version.

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
