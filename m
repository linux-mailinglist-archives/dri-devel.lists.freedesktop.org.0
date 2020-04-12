Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12E1A6065
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 22:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C5789F92;
	Sun, 12 Apr 2020 20:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82D089F92
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 20:04:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7FE5E80478;
 Sun, 12 Apr 2020 22:04:51 +0200 (CEST)
Date: Sun, 12 Apr 2020 22:04:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/36] dt-bindings: display: allow port and ports in
 panel-lvds
Message-ID: <20200412200450.GB711@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-2-sam@ravnborg.org>
 <CAL_JsqKp9r6sQuyKtqZnx26-2kzwkQSaa7N6Lbs2g6rC-Rpx1w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqKp9r6sQuyKtqZnx26-2kzwkQSaa7N6Lbs2g6rC-Rpx1w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=yC-0_ovQAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
 a=FrqY3B3J1LyIZVayq4MA:9 a=CjuIK1q_8ugA:10 a=CojVow1nldcA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=QsnFDINu91a9xkgZirup:22
 a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob.

On Thu, Apr 09, 2020 at 10:11:10AM -0600, Rob Herring wrote:
> On Wed, Apr 8, 2020 at 1:51 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Both port and ports names may be used.
> > port - for a single port
> > ports - if there is more than one port in sub-nodes
> >
> > Fixes the following warning:
> > advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
> >
> > advantech,idk-2121wr.yaml needs several ports, so uses a ports node.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  Documentation/devicetree/bindings/display/panel/lvds.yaml | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> 
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > index d0083301acbe..f9132d50821c 100644
> > --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > @@ -102,6 +102,12 @@ required:
> >    - width-mm
> >    - height-mm
> >    - panel-timing
> > -  - port
> > +
> > +if:
> > +  required:
> > +    - port
> > +else:
> > +  required:
> > +    - ports
> 
> Humm, I guess 'then' is not required. That's a bit weird IMO.
> 
> I usually do a 'oneOf' for these cases.

For the record, I re-did this patch using oneOf - much nicer.
And since the patch was re-written I dropped you r-b.

> 
> Either way, please apply this to drm-misc-fixes (or
> drm-misc-next-fixes depending on the state of the tree). Or I can take
> it. I'd like to get all the warnings cleared up by rc2.

Will take care after -rc1 is out. Needs drm-fixes to be updated with -rc1 first.
Will make sure to cover all bindings warnigns in panel/

	Sam

> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Rob
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
