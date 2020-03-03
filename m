Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C0C177EA0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 19:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1189089F6F;
	Tue,  3 Mar 2020 18:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFCA89F6F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 18:55:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 268082AF;
 Tue,  3 Mar 2020 19:55:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583261752;
 bh=noy1WADc0ET4QwWSlF8Wtcknw2DcH2OWioSBI/pWkjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n+e9/HdHilEFMQIN0V+Cyum7cPa4meETRYSjov9d8t8btYaAW01uq3IQiPX0Rfmwz
 zZBqG+9PF5OCQFc9TcukzgXxTkiVFKNzWlOvA3eqsjVmuI0sVx97Li/drc4MBgTC9C
 WfbFakiGAjB7B33Cfdzj69j8ibXDj6cKpHf1TSmw=
Date: Tue, 3 Mar 2020 20:55:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 4/5] dt-bindings: display: add data-mapping to panel-dpi
Message-ID: <20200303185531.GJ11333@pendragon.ideasonboard.com>
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-5-sam@ravnborg.org>
 <CAL_Jsq+AbXEiLCYiAvwr5qzbSnuo9G8bTwAM3G9J4cPYz1_FMw@mail.gmail.com>
 <20200218221638.GA27927@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218221638.GA27927@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Tue, Feb 18, 2020 at 11:16:38PM +0100, Sam Ravnborg wrote:
> On Tue, Feb 18, 2020 at 02:13:45PM -0600, Rob Herring wrote:
> > On Sun, Feb 16, 2020 at 12:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Add data-mapping property that can be used to specify
> > > the media format used for the connection betwwen the
> > > display controller (connector) and the panel.
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Missing blank line.
> > 
> > > ---
> > >  .../devicetree/bindings/display/panel/panel-dpi.yaml | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > index 40079fc24a63..6a03d2449701 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > @@ -21,6 +21,16 @@ properties:
> > >        - {}
> > >        - const: panel-dpi
> > >
> > > +  data-mapping:
> > > +    enum:
> > > +      - rgb24
> > > +      - rgb565
> > > +      - bgr666
> > > +      - lvds666
> > 
> > Doesn't lvds666 come from i.MX IPU which as I remember has built-in
> > LVDS block? I'd think this format would be implicit when using the
> > LVDS block and panel. It doesn't seem this is actually used anywhere
> > either.
>
> I must admit that I just copied this list from Oleksandrs original
> patch. The MEDIA type it identifies(MEDIA_BUS_FMT_RGB666_1X24_CPADHI) looks special.
> I will drop lvds666 while applying, unless I get other feedback.
> (Note: travelling, earliest in the weekend)

There are different data mappings defined for LVDS, we should follow
them. lvds666 is wrong in any case, and doesn't apply to a DPI panel
anyway.

I don't like the name data-mapping much for DPI panels I'm afraid. It
made sense for LVDS as it's really about how the different data bits are
mapped to LVDS time slots, but for DPI, what we need to describe is the
format. I also wonder whether multiple formats wouldn't be required when
the panel supports more than one, but that may not apply to panels
covered by these bindings.

If a panel expects RGB888 and receives RGB666 with the two LSBs of each
component hardwired to GND on the PCB, should DT report RGB888 or RGB666
on the panel side ? I'm tempted by the former, and specifying the latter
on the transmitting side.

Please also note that this case is already described by
Documentation/devicetree/bindings/media/video-interfaces.txt through two
entirely different properties, bus-width and data-shift. I think we
should try to standardize mappings between display and capture. This new
property should be reconsidered in my opinion, I think it was merged too
soon.

> Btw. anyway I can add data-mapping to panel-common - and then list the
> allowed enum values in each binding?
> 
> I would love to have a central definition of data-mapping, and then let
> the users only allow the relevant subset so we catch errors in DT files
> early.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
