Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24151635E7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 23:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F29E6EABE;
	Tue, 18 Feb 2020 22:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EA36EABE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 22:16:44 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D4B7680535;
 Tue, 18 Feb 2020 23:16:39 +0100 (CET)
Date: Tue, 18 Feb 2020 23:16:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/5] dt-bindings: display: add data-mapping to panel-dpi
Message-ID: <20200218221638.GA27927@ravnborg.org>
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-5-sam@ravnborg.org>
 <CAL_Jsq+AbXEiLCYiAvwr5qzbSnuo9G8bTwAM3G9J4cPYz1_FMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+AbXEiLCYiAvwr5qzbSnuo9G8bTwAM3G9J4cPYz1_FMw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=VQIv7C4PpHhCiZb-sUYA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 02:13:45PM -0600, Rob Herring wrote:
> On Sun, Feb 16, 2020 at 12:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Add data-mapping property that can be used to specify
> > the media format used for the connection betwwen the
> > display controller (connector) and the panel.
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Missing blank line.
> 
> > ---
> >  .../devicetree/bindings/display/panel/panel-dpi.yaml | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > index 40079fc24a63..6a03d2449701 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > @@ -21,6 +21,16 @@ properties:
> >        - {}
> >        - const: panel-dpi
> >
> > +  data-mapping:
> > +    enum:
> > +      - rgb24
> > +      - rgb565
> > +      - bgr666
> > +      - lvds666
> 
> Doesn't lvds666 come from i.MX IPU which as I remember has built-in
> LVDS block? I'd think this format would be implicit when using the
> LVDS block and panel. It doesn't seem this is actually used anywhere
> either.
I must admit that I just copied this list from Oleksandrs original
patch. The MEDIA type it identifies(MEDIA_BUS_FMT_RGB666_1X24_CPADHI) looks special.
I will drop lvds666 while applying, unless I get other feedback.
(Note: travelling, earliest in the weekend)

Btw. anyway I can add data-mapping to panel-common - and then list the
allowed enum values in each binding?

I would love to have a central definition of data-mapping, and then let
the users only allow the relevant subset so we catch errors in DT files
early.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
