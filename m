Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17701A8499
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 18:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E206E10C;
	Tue, 14 Apr 2020 16:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A073E6E10C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 16:24:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 19CB02001F;
 Tue, 14 Apr 2020 18:24:15 +0200 (CEST)
Date: Tue, 14 Apr 2020 18:24:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: allow port and ports in
 panel-lvds
Message-ID: <20200414162413.GA31129@ravnborg.org>
References: <20200412132139.11418-1-sam@ravnborg.org>
 <20200412132139.11418-2-sam@ravnborg.org>
 <20200414135501.GA22903@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414135501.GA22903@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=Ccqcp6awhqx6kVkmrOQA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob.

> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org
> > ---
> >  .../devicetree/bindings/display/panel/lvds.yaml        | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> One nit below...
> 
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > index d0083301acbe..a5587c4f5ad0 100644
> > --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > @@ -96,12 +96,20 @@ properties:
> >        If set, reverse the bit order described in the data mappings below on all
> >        data lanes, transmitting bits for slots 6 to 0 instead of 0 to 6.
> >  
> > +  port: true
> > +  ports: true
> > +
> >  required:
> >    - compatible
> >    - data-mapping
> >    - width-mm
> >    - height-mm
> >    - panel-timing
> > -  - port
> > +
> > +oneOf:
> > +  - required:
> > +    - port
> > +  - required:
> > +    - ports
> 
> Should be indented 2 more spaces. It only matters for any scripted 
> processing we do on the files.

Fixed and pushed to drm-misc-next.
Will cherry-pick to drm-fixes.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
