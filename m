Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE95224F084
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 01:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3791A6EB7E;
	Sun, 23 Aug 2020 23:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5B86EB7E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 23:27:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DA63279;
 Mon, 24 Aug 2020 01:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1598225264;
 bh=y5PKWoMR1TCqt9mOcUpEsoGFDWYp1Fdx5FvlPyNutvs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F17HerOmtF5pq9pFmlFr10kSICNvrjHm8f9K9hZMEIHZs8/2qY13f2v++SCRTbaiB
 cZDWv0oI7r9w4UsJUXkp87NZCxeFFxePntRcbeVBCzvLyWpenyUfonlP6VetoYrvl/
 e+WiEAti3hjSV4wIQpA79C72CsBX7U42zHv1A7hE=
Date: Mon, 24 Aug 2020 02:27:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 4/8] dt-bindings: display: mxsfb: Rename to fsl, lcdif.yaml
Message-ID: <20200823232726.GP6002@pendragon.ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-5-laurent.pinchart@ideasonboard.com>
 <2a74823ac7b6f978d36185aac34de383@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a74823ac7b6f978d36185aac34de383@agner.ch>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

On Fri, Aug 21, 2020 at 04:55:38PM +0200, Stefan Agner wrote:
> On 2020-08-13 03:29, Laurent Pinchart wrote:
> > Rename the mxsfb.yaml binding schema to fsl,lcdif.yaml to match the
> > usual bindings naming scheme.
> 
> I tend to prefer to just name it fsl,lcdif.yaml from the get-go.
> 
> If you prefer keeping it separate, then it should be patch 2 of the
> series.

I'm certainly fine squashing this with 1/8. Should I submit a v2, or
would you like to squash them locally before applying ? If you would
like a v2, have you reviewed the entire series, or should I still wait ?

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../devicetree/bindings/display/{mxsfb.yaml => fsl,lcdif.yaml}  | 2 +-
> >  MAINTAINERS                                                     | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >  rename Documentation/devicetree/bindings/display/{mxsfb.yaml =>
> > fsl,lcdif.yaml} (98%)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml
> > b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > similarity index 98%
> > rename from Documentation/devicetree/bindings/display/mxsfb.yaml
> > rename to Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > index d15bb8edc29f..60210775c31e 100644
> > --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  %YAML 1.2
> >  ---
> > -$id: http://devicetree.org/schemas/display/mxsfb.yaml#
> > +$id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> >  title: Freescale/NXP i.MX LCD Interface (LCDIF)
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e3fac23383d2..fe1bda639a39 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11757,7 +11757,7 @@ M:	Stefan Agner <stefan@agner.ch>
> >  L:	dri-devel@lists.freedesktop.org
> >  S:	Supported
> >  T:	git git://anongit.freedesktop.org/drm/drm-misc
> > -F:	Documentation/devicetree/bindings/display/mxsfb.yaml
> > +F:	Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> >  F:	drivers/gpu/drm/mxsfb/
> >  
> >  MYLEX DAC960 PCI RAID Controller

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
