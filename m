Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B4932CF4A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 10:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB6388065;
	Thu,  4 Mar 2021 09:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F82D88065
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 09:10:28 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ci14so28869214ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Mar 2021 01:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gynRsFiEHgePHyaarQ8hzDU1xilkr7SD/fM6H3+AlvU=;
 b=Ubk+98S/cBq11/zbb9HafDOhME3HEcJiiJ9bhN0cmVHvYm+yV1zUxk0XEoHEOILs2U
 IsQvDjENTdrE5Qd6gE3jWnmlU4Bwz4XdeOL+0PXqWiisZKTwlfjlo3vM3gTcLKsBpWk+
 Rvg2jE/LhIV2dt4MSiRaFrasfcMztTaMte5s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gynRsFiEHgePHyaarQ8hzDU1xilkr7SD/fM6H3+AlvU=;
 b=UbpVTUd/1KGHNRQc4tlGEAXBrvBb1aIr/w1c1s7HdS+0CIds7Z+44wd68pjJCq2IRG
 Ur7kchb/hWbfnQdGMKUsh3lv7U2xkoITrUWmVygjdJ+pk7mjIdzTAaMMyEx15tKNqkKE
 5VX4g4tP3dUjwIMzwmsg44J8B/in3I89bE3lt3owiahP9yeyfa58ApAJ03GhfiQiLBys
 0mwrG1PDPZDiV/fqC6kE8YthTM5fYoZKmzlt6z/t3eRQJjfsCyhBY46hoUu6j+IEgwpj
 dzemgKzuJaqy4xNJbHcrLfc8sn3oTeLVUcT8Ow/whGuODRG4MT+01SXwF3xLlVdt7FWn
 TD9w==
X-Gm-Message-State: AOAM5322NKp0ME/69sJt7CceQabg+yzFhVZNZ1luaoXQlItzIpZaJ93s
 7KhJDknE/ZDKndjOPM2+VsSBI+hEUd7dkNGUXy0IQ/Ou4weFEQ==
X-Google-Smtp-Source: ABdhPJzSTAn6jTvFpWH0XRgSeuhut8parDgXEnI2p1Z+Nx534TlGSdgNeTzbFxrQs/g2tJzgq9KJrXI9ySKVZuruQc4=
X-Received: by 2002:a17:906:3fc3:: with SMTP id
 k3mr3172834ejj.522.1614849026928; 
 Thu, 04 Mar 2021 01:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20210214175211.105107-1-jagan@amarulasolutions.com>
 <YCpmZWRoiWULiANx@pendragon.ideasonboard.com>
 <CAMty3ZDt2EDB8E2nNLx_jfqE7-ActVYVoeFo2Eso+nVuUfVL+w@mail.gmail.com>
 <YDZRFeuzsamKyIJo@pendragon.ideasonboard.com>
 <CAMty3ZBHKzksbrWoWapZb9h4hmbL9Lk1baqS_Lb7WPdmRr2hGQ@mail.gmail.com>
 <YEAUyUsZb+4Oe0Ye@pendragon.ideasonboard.com>
In-Reply-To: <YEAUyUsZb+4Oe0Ye@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 4 Mar 2021 14:40:15 +0530
Message-ID: <CAMty3ZDAz28BWUJRLW0LwmJ5v6dOPZmxRzfzseoQMiMkTVBW6Q@mail.gmail.com>
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

On Thu, Mar 4, 2021 at 4:29 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> On Wed, Mar 03, 2021 at 08:08:35PM +0530, Jagan Teki wrote:
> > On Wed, Feb 24, 2021 at 6:44 PM Laurent Pinchart wrote:
> > > On Wed, Feb 24, 2021 at 06:07:43PM +0530, Jagan Teki wrote:
> > > > On Mon, Feb 15, 2021 at 5:48 PM Laurent Pinchart wrote:
> > > > > On Sun, Feb 14, 2021 at 11:22:10PM +0530, Jagan Teki wrote:
> > > > > > ICN6211 is MIPI-DSI to RGB Convertor bridge from Chipone.
> > > > > >
> > > > > > It has a flexible configuration of MIPI DSI signal input and
> > > > > > produce RGB565, RGB666, RGB888 output format.
> > > > > >
> > > > > > Add dt-bingings for it.
> > > > > >
> > > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > > ---
> > > > > > Changes for v3:
> > > > > > - updated to new dt-bindings style
> > > > > >
> > > > > >  .../display/bridge/chipone,icn6211.yaml       | 90 +++++++++++++++++++
> > > > > >  1 file changed, 90 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..13764f13fe46
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > > > > > @@ -0,0 +1,90 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/display/bridge/chipone,icn6211.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Chipone ICN6211 MIPI-DSI to RGB Converter bridge
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Jagan Teki <jagan@amarulasolutions.com>
> > > > > > +
> > > > > > +description: |
> > > > > > +  ICN6211 is MIPI-DSI to RGB Convertor bridge from chipone.
> > > > > > +
> > > > > > +  It has a flexible configuration of MIPI DSI signal input and
> > > > > > +  produce RGB565, RGB666, RGB888 output format.
> > > > >
> > > > > How does one select between the output formats ? Should the output
> > > > > connection option be described in the device tree ?
> > > >
> > > > I think that is a good option to select output formats via dts. what
> > > > if it makes it a generic property like data-lanes? since it is common
> > > > across many other bridges.
> > >
> > > Describing the output connection in the device tree sounds like a good
> > > idea indeed. The bus-width property could be used for this, maybe along
> > > the lines of
> > > https://lore.kernel.org/dri-devel/20201013020619.GG3942@pendragon.ideasonboard.com/.
> >
> > I have seen an issue by passing bus-width where the same bus-with 24
> > can use by RGB888 and RGB666 according to
> > mipi_dsi_pixel_format_to_bpp. Having a default RGB888 format now and
> > update it when it supports properly, can be a good Idea I thought of.
> > Let me know if you have any comments?
>
> I'm fine with hardcoding a default for now. If a given bus wiring (which
> is described in DT by bus-width) can transport different formats, that's
> something that should be configured dynamically, either by querying what
> format a sink (such as a panel) requires, or if both the source and the
> sink can support different formats, possibly by involving userspace in
> the selection.

Not sure how we can get userspace involvement in DRM here, but if
source and sink can have different formats then having precedence to
the source would be a good option as it handles low-level
configuration for formats.

Look like it is worth trying-feature. Maybe we can come up with some
RFC and have a discussion.

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
