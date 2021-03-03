Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A66032BEE2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 23:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD6E6E1F3;
	Wed,  3 Mar 2021 22:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718566E1F3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 22:59:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 461498DE;
 Wed,  3 Mar 2021 23:59:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1614812390;
 bh=FY7RDvOyDuyrLYN60fJkrRyy7oaq4NoG/d+IagzZCkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1prsOhxNcgaGbPAMiXowZ5sblQpnh9rqRIulCZ18EqXJ+M9skF3IW/PaNn6AIkV9
 c3CGM+ca2xdWljuAt1sQ5ZXVdqF7rEm3yjO1py+/cd2rsKuOjMKi+wlFVsBftATpdL
 Ri7mltwwGcvuUp7wI6Qma6zKxxXg/HodfMM+6qfo=
Date: Thu, 4 Mar 2021 00:59:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 Chipone ICN6211
Message-ID: <YEAUyUsZb+4Oe0Ye@pendragon.ideasonboard.com>
References: <20210214175211.105107-1-jagan@amarulasolutions.com>
 <YCpmZWRoiWULiANx@pendragon.ideasonboard.com>
 <CAMty3ZDt2EDB8E2nNLx_jfqE7-ActVYVoeFo2Eso+nVuUfVL+w@mail.gmail.com>
 <YDZRFeuzsamKyIJo@pendragon.ideasonboard.com>
 <CAMty3ZBHKzksbrWoWapZb9h4hmbL9Lk1baqS_Lb7WPdmRr2hGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMty3ZBHKzksbrWoWapZb9h4hmbL9Lk1baqS_Lb7WPdmRr2hGQ@mail.gmail.com>
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

Hi Jagan,

On Wed, Mar 03, 2021 at 08:08:35PM +0530, Jagan Teki wrote:
> On Wed, Feb 24, 2021 at 6:44 PM Laurent Pinchart wrote:
> > On Wed, Feb 24, 2021 at 06:07:43PM +0530, Jagan Teki wrote:
> > > On Mon, Feb 15, 2021 at 5:48 PM Laurent Pinchart wrote:
> > > > On Sun, Feb 14, 2021 at 11:22:10PM +0530, Jagan Teki wrote:
> > > > > ICN6211 is MIPI-DSI to RGB Convertor bridge from Chipone.
> > > > >
> > > > > It has a flexible configuration of MIPI DSI signal input and
> > > > > produce RGB565, RGB666, RGB888 output format.
> > > > >
> > > > > Add dt-bingings for it.
> > > > >
> > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > ---
> > > > > Changes for v3:
> > > > > - updated to new dt-bindings style
> > > > >
> > > > >  .../display/bridge/chipone,icn6211.yaml       | 90 +++++++++++++++++++
> > > > >  1 file changed, 90 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..13764f13fe46
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > > > > @@ -0,0 +1,90 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/display/bridge/chipone,icn6211.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Chipone ICN6211 MIPI-DSI to RGB Converter bridge
> > > > > +
> > > > > +maintainers:
> > > > > +  - Jagan Teki <jagan@amarulasolutions.com>
> > > > > +
> > > > > +description: |
> > > > > +  ICN6211 is MIPI-DSI to RGB Convertor bridge from chipone.
> > > > > +
> > > > > +  It has a flexible configuration of MIPI DSI signal input and
> > > > > +  produce RGB565, RGB666, RGB888 output format.
> > > >
> > > > How does one select between the output formats ? Should the output
> > > > connection option be described in the device tree ?
> > >
> > > I think that is a good option to select output formats via dts. what
> > > if it makes it a generic property like data-lanes? since it is common
> > > across many other bridges.
> >
> > Describing the output connection in the device tree sounds like a good
> > idea indeed. The bus-width property could be used for this, maybe along
> > the lines of
> > https://lore.kernel.org/dri-devel/20201013020619.GG3942@pendragon.ideasonboard.com/.
> 
> I have seen an issue by passing bus-width where the same bus-with 24
> can use by RGB888 and RGB666 according to
> mipi_dsi_pixel_format_to_bpp. Having a default RGB888 format now and
> update it when it supports properly, can be a good Idea I thought of.
> Let me know if you have any comments?

I'm fine with hardcoding a default for now. If a given bus wiring (which
is described in DT by bus-width) can transport different formats, that's
something that should be configured dynamically, either by querying what
format a sink (such as a panel) requires, or if both the source and the
sink can support different formats, possibly by involving userspace in
the selection.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
