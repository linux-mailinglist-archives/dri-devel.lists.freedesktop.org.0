Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D337323EAA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 14:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61C96EAB2;
	Wed, 24 Feb 2021 13:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70AA6EAB2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 13:46:49 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id g5so3173186ejt.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 05:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8fSkNXLVwfaOZwL997IP3xh+QkpM3w54V6mdvtgPHDo=;
 b=R8IbeDKckrUJCPV8WkN11D1QAcubF61ffw5bKVMkjYp2iHLYaS4xLjPgW4eJnE+mUs
 fJj/TrfQYj/jth+4BdkHMZPvhwR+qEbr18htei7UfCQlkbJOfd1jMvoVrfBaOVad2+d/
 529Gvy9eHyMT0FTSBhWs0AnAWOTPmtShwwYtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8fSkNXLVwfaOZwL997IP3xh+QkpM3w54V6mdvtgPHDo=;
 b=Hkam8jLt+yqRU9Cedr2ZN+60ntryJzvHjoonbw+QRwJCm2dUVHVQ4D/opH6Eh/ToIy
 i/LIc4MiYaRRGWVro1xrRC+vy8FepQauyvz14kBPNB+PeY+ScwZvb1aEbRWRQr3MZ2qL
 eugeF5wqe+DJ8dMmklqwEILLxBrY1ciHaXoY7at+LPDJHdQiPMoxhHllduNC20SeG+hj
 muF6O9Xnh/bfeonx/jAGZvWr7CvUitGQueeqwWpQRTjOrEFiQkm+9xP4qg8DLNrTDFnd
 rGMlwNRdwfLODwONb9Td+40jmO/iWyytWzXsjIJqiokFHxZp1h6hRKKGnTsK25w4pvfn
 TC6Q==
X-Gm-Message-State: AOAM533VuV2Suho9liHpLZb20cUXssOSIkgsg/vLXwMw10/DS1KZVaT7
 DyjtjHSIweuTpVQ5Quv6Lv4OpRaZ5WpPmQdAgeo2ZA==
X-Google-Smtp-Source: ABdhPJy4M7Jrx45XkSBdTw0LnVY5/pPeBd7sbCgZ6AyCdvMI1KeuGBbDsK9rvPWI7uWXwL9SimiWGVVLwBPeagSkZnI=
X-Received: by 2002:a17:906:b0d8:: with SMTP id
 bk24mr31788687ejb.252.1614174408444; 
 Wed, 24 Feb 2021 05:46:48 -0800 (PST)
MIME-Version: 1.0
References: <20210214175211.105107-1-jagan@amarulasolutions.com>
 <YCpmZWRoiWULiANx@pendragon.ideasonboard.com>
 <CAMty3ZDt2EDB8E2nNLx_jfqE7-ActVYVoeFo2Eso+nVuUfVL+w@mail.gmail.com>
 <YDZRFeuzsamKyIJo@pendragon.ideasonboard.com>
In-Reply-To: <YDZRFeuzsamKyIJo@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 24 Feb 2021 19:16:31 +0530
Message-ID: <CAMty3ZBsfwoWq4Cm6hxFD2rJkLHA5H_zjgemfyx-SJ-gNL=W-Q@mail.gmail.com>
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

On Wed, Feb 24, 2021 at 6:44 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> On Wed, Feb 24, 2021 at 06:07:43PM +0530, Jagan Teki wrote:
> > On Mon, Feb 15, 2021 at 5:48 PM Laurent Pinchart wrote:
> > > On Sun, Feb 14, 2021 at 11:22:10PM +0530, Jagan Teki wrote:
> > > > ICN6211 is MIPI-DSI to RGB Convertor bridge from Chipone.
> > > >
> > > > It has a flexible configuration of MIPI DSI signal input and
> > > > produce RGB565, RGB666, RGB888 output format.
> > > >
> > > > Add dt-bingings for it.
> > > >
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > ---
> > > > Changes for v3:
> > > > - updated to new dt-bindings style
> > > >
> > > >  .../display/bridge/chipone,icn6211.yaml       | 90 +++++++++++++++++++
> > > >  1 file changed, 90 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > > > new file mode 100644
> > > > index 000000000000..13764f13fe46
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > > > @@ -0,0 +1,90 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/bridge/chipone,icn6211.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Chipone ICN6211 MIPI-DSI to RGB Converter bridge
> > > > +
> > > > +maintainers:
> > > > +  - Jagan Teki <jagan@amarulasolutions.com>
> > > > +
> > > > +description: |
> > > > +  ICN6211 is MIPI-DSI to RGB Convertor bridge from chipone.
> > > > +
> > > > +  It has a flexible configuration of MIPI DSI signal input and
> > > > +  produce RGB565, RGB666, RGB888 output format.
> > >
> > > How does one select between the output formats ? Should the output
> > > connection option be described in the device tree ?
> >
> > I think that is a good option to select output formats via dts. what
> > if it makes it a generic property like data-lanes? since it is common
> > across many other bridges.
>
> Describing the output connection in the device tree sounds like a good
> idea indeed. The bus-width property could be used for this, maybe along
> the lines of
> https://lore.kernel.org/dri-devel/20201013020619.GG3942@pendragon.ideasonboard.com/.

I think this bridge is doing, what we discussed? am I correct?
Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml

>
> If, for a given wiring of the output, different formats could be used,
> then we would need to select them at runtime.

That means the opposite of what mipi_dsi_pixel_format_to_bpp is doing
right? like given bpp we need to select format.

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
