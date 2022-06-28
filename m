Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7EA55EB60
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 19:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19983113BE7;
	Tue, 28 Jun 2022 17:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F206511B3AF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 17:54:19 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id r9so10520871ljp.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YsbR8XD51+2fDUx1DJn2r9aSmkJF1zCJMEEsWt0x5vM=;
 b=B3w6v5CCgKL41pcP+L2EqP7McAN7ZEWhXVobCQ0dUTE60bcgOwn6Q8f+c5O1e2Uxiw
 apFzNVvwz2N6tmXHzs5TGZeD8peEZrx4cfaze9Soa8XDpIK6uoVnqQvbyDxNgvZh8rDe
 nmcuyp58AN0coqb9rVIJ3MgAIQ+J28eiosYE40v8hq5IJJHcoPomcIY9atsa2q+LmiuU
 bkHVc9GwytBXLjqfmKyeryaorexOFNajbKdFzhxpQ9q+7NV6Nk+5cz7/uH2lNNb47OTt
 HpO7g5JevqN+629w3g/cEGgD4LSHUCcujOxc4BlMchbgk0vH0blQ6WI9y7B1qGbdFXhw
 parw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YsbR8XD51+2fDUx1DJn2r9aSmkJF1zCJMEEsWt0x5vM=;
 b=3i9E4rwi27HtTc1Kyu/rxYxw50Lpd6cCU/7ZyyTFUvP1l15BhH1Ly8k7xGd5cPKbxl
 0xaLngNxTEV+xRLRxvvrQAvsDS9U13D0MZ59wpoR+NAFX9+BB9LYk7aaSr70pTwJjhGc
 ciXoEpwyuod5HDPjG692K7oIHv3172LweA43WbkurSZ3mkVvz5mqMCJ5gA47zlTlTVPW
 stY1pgG4nA5xXkzUO6smR52BKe0q5xzS40SD4k9tRj3M1fLohUdWRpBZT0UNG2e/hX2z
 BFIM4+4xlr44lgzLr5UdyeTelLJIqonor6inz8tWAVTjUfJ2yH390xlYk3HbWV25RgCJ
 nzcQ==
X-Gm-Message-State: AJIora9rHabG0ahPLaFnKFtxIY7zKui94gf1x1FgrhfWGoYK2ThDvSAy
 TTR1zcwoSyUFscT/aRAO3DgoxckQcpX/idaXaDI=
X-Google-Smtp-Source: AGRyM1sc6rUvzMNS3CKVGGXthQEHrKyFKK272MHUdtCpLmeRrPJMb4swE1HCuDd+KRVsOiR0yo3ur2dSKywPSi48Sx0=
X-Received: by 2002:a2e:bc22:0:b0:25b:c3b6:eb11 with SMTP id
 b34-20020a2ebc22000000b0025bc3b6eb11mr6134193ljf.122.1656438858054; Tue, 28
 Jun 2022 10:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220518115541.38407-1-max.oss.09@gmail.com>
 <20220518115541.38407-2-max.oss.09@gmail.com>
 <20220601201658.GA342879-robh@kernel.org>
In-Reply-To: <20220601201658.GA342879-robh@kernel.org>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Tue, 28 Jun 2022 19:54:06 +0200
Message-ID: <CAEHkU3UFSUq3sFTX8wC4+PYCN9gG4Lbgkao3E3VkQGxQzRZy0g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: add new bus-format property
 for panel-dpi
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob

Thanks for the feedback.

On Wed, Jun 1, 2022 at 10:17 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, May 18, 2022 at 01:55:38PM +0200, Max Krummenacher wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > The property is used to set the enum bus_format and infer the bpc
> > for a panel defined by 'panel-dpi'.
> > This specifies how the panel is connected to the display interface.
> >
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > ---
> >
> > Changes in v2:
> >     - Fix errors found by dt_binding_check
> >
> >  .../bindings/display/panel/panel-dpi.yaml     | 11 +++++++++
> >  .../dt-bindings/display/dt-media-bus-format.h | 23 +++++++++++++++++++
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 include/dt-bindings/display/dt-media-bus-format.h
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > index dae0676b5c6e..a20b5898941e 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > @@ -21,6 +21,14 @@ properties:
> >        - {}
> >        - const: panel-dpi
> >
> > +  bus-format:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Constraints?

Will limit the range to the one used for RGB formats in v3.
>
> > +    description: |
> > +      Describes how the display panel is connected to the display interface.
> > +      Valid values are defined in <dt-bindings/display/dt-media-bus-format.h>.
> > +      The mapping between the color/significance of the panel lines to the
> > +      parallel data lines are defined in [1].
>
> Just drop the [1] and use a colon.

Done in v3.

>
> > +      [1] https://www.kernel.org/doc/html/v5.17/userspace-api/media/v4l/subdev-formats.html#packed-rgb-formats
>
> Why not just use the V4L number space rather than invent yet another
> number space?

That was a proposal from here:
https://lore.kernel.org/all/20220323155817.xcsqxothziot7ba3@houat/
But probably it makes more sense to use the number space as is, changed in v3.

>
> Need a blank line here too.
>
> >    backlight: true
> >    enable-gpios: true
> >    height-mm: true
> > @@ -39,11 +47,14 @@ additionalProperties: false
> >
> >  examples:
> >    - |
> > +    #include <dt-bindings/display/dt-media-bus-format.h>
> > +
> >      panel {
> >          compatible = "startek,startek-kd050c", "panel-dpi";
> >          label = "osddisplay";
> >          power-supply = <&vcc_supply>;
> >          backlight = <&backlight>;
> > +        bus-format = <DT_MEDIA_BUS_FMT_RGB888_1X24>;
>
> Other properties describing the interface have been put in the endpoint
> node. This should too I think.

That makes a lot of sense. Changed to be part of the endpoint node in v3.

Cheers
Max

>
> >
> >          port {
> >              lcd_in: endpoint {
> > diff --git a/include/dt-bindings/display/dt-media-bus-format.h b/include/dt-bindings/display/dt-media-bus-format.h
> > new file mode 100644
> > index 000000000000..c0f2a7b59aa1
> > --- /dev/null
> > +++ b/include/dt-bindings/display/dt-media-bus-format.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> > +/*
> > + * Copyright 2022 Max Krummenacher <max.krummenacher@toradex.com>
> > + */
> > +
> > +#ifndef __DT_BINDINGS_DT_MEDIA_BUS_FORMAT_H
> > +#define __DT_BINDINGS_DT_MEDIA_BUS_FORMAT_H
> > +
> > +/*
> > + * Attention: Keep these macro names in sync with
> > + * include/uapi/linux/media-bus-format.h
> > + */
> > +
> > +#define DT_MEDIA_BUS_FMT_RGB565_1X16         1
> > +#define DT_MEDIA_BUS_FMT_RGB666_1X18         2
> > +#define DT_MEDIA_BUS_FMT_RBG888_1X24         3
> > +#define DT_MEDIA_BUS_FMT_RGB666_1X24_CPADHI  4
> > +#define DT_MEDIA_BUS_FMT_BGR888_1X24         5
> > +#define DT_MEDIA_BUS_FMT_GBR888_1X24         6
> > +#define DT_MEDIA_BUS_FMT_RGB888_1X24         7
> > +#define DT_MEDIA_BUS_FMT_RGB888_1X32_PADHI   8
> > +
> > +#endif /* __DT_BINDINGS_DT_MEDIA_BUS_FORMAT_H */
> > --
> > 2.20.1
> >
> >
