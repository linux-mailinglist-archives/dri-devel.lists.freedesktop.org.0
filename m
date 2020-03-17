Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AE01881FA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 12:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BE089272;
	Tue, 17 Mar 2020 11:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C8B89272
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 11:22:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 690B880475;
 Tue, 17 Mar 2020 12:22:33 +0100 (CET)
Date: Tue, 17 Mar 2020 12:22:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: drop data-mapping from
 panel-dpi
Message-ID: <20200317112231.GA7981@ravnborg.org>
References: <20200314153047.2486-1-sam@ravnborg.org>
 <20200314153047.2486-2-sam@ravnborg.org>
 <20200317084959.atqs2anx56kamrsy@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317084959.atqs2anx56kamrsy@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=P1BnusSwAAAA:8 a=VwQbUJbxAAAA:8 a=QAgE-FV-s0_cZOTFy9cA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime.

On Tue, Mar 17, 2020 at 09:49:59AM +0100, Maxime Ripard wrote:
> Hi Sam,
> 
> On Sat, Mar 14, 2020 at 04:30:45PM +0100, Sam Ravnborg wrote:
> > data-mapping may not be the best way to describe the
> > data format used between panels and display interface.
> >
> > Drop it from the panel-dpi binding so we do not start to rely on it.
> > We can then work out how to best describe this mapping and when
> > we know it, we can add it to this binding.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> 
> I can't say whether it's the right decision or not, but if you want to
> go forward with this, you should maintain the backward compatibility,
> so leave the code to deal with this as a fallback solution...

This was all introduced very recently and is for now only present in
drm-misc-next.
The idea was to revert is *before* people started to rely on this new
mapping. So we avoid all the backward compatibility fun.
I had hoped the revert could land before the 5.7 pull, alas that was not
the case.

	Sam

> 
> > ---
> >  .../devicetree/bindings/display/panel/panel-dpi.yaml   | 10 ----------
> >  1 file changed, 10 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > index f63870384c00..0cd74c8dab42 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > @@ -21,15 +21,6 @@ properties:
> >        - {}
> >        - const: panel-dpi
> >
> > -  data-mapping:
> > -    enum:
> > -      - rgb24
> > -      - rgb565
> > -      - bgr666
> > -    description: |
> > -      Describes the media format, how the display panel is connected
> > -      to the display interface.
> > -
> 
> And keep that DT property documented too.
> 
> You can express that it's only here for compatibility using the
> deprecated keyword though.
> 
> It doesn't do anything at the moment, but the next spec of the schema
> language uses it, so as soon as the library implements it we'll report
> it.
> 
> Maxime


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
