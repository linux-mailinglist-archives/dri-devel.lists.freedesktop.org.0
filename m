Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224573B1A98
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 14:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1207489938;
	Wed, 23 Jun 2021 12:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBB989938
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 12:58:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E72B9AA;
 Wed, 23 Jun 2021 14:58:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624453110;
 bh=PoI3uyMbudFJL9C12/C2MbS0ALkBMEjg8aIMinrYFmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SiCDwopvFxqu8yVC6wZm8Dgl9nuayKsEQzCg5bkoBiJpnydGtUuyT0n+pPMacmwJD
 zFV2+8AduJ8JAWbRkuEWxNzpdhfKZUYe16eIMX0RMKIYqiZFZXBDByCtjnMDm2yPZh
 T5XwZlHkIEN3u0z6NkuZ4tluEaJ7s/KoI790kTsY=
Date: Wed, 23 Jun 2021 15:58:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Provide bindings for
 r8a779a0
Message-ID: <YNMv2KSjbwX5aAK2@pendragon.ideasonboard.com>
References: <20210622231146.3208404-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdW8vYC3+gVCv5eG_vkX79vU8RQL-6fSJd9McetDzikzSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdW8vYC3+gVCv5eG_vkX79vU8RQL-6fSJd9McetDzikzSA@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Wed, Jun 23, 2021 at 02:53:33PM +0200, Geert Uytterhoeven wrote:
> On Wed, Jun 23, 2021 at 1:11 AM Kieran Bingham wrote:
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > @@ -39,6 +39,7 @@ properties:
> >        - renesas,du-r8a77980 # for R-Car V3H compatible DU
> >        - renesas,du-r8a77990 # for R-Car E3 compatible DU
> >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> > +      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> >
> >    reg:
> >      maxItems: 1
> > @@ -774,6 +775,57 @@ allOf:
> >          - reset-names
> >          - renesas,vsps
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,du-r8a779a0
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Functional clock for DU0
> > +            - description: Functional clock for DU1
> > +
> > +        clock-names:
> > +          items:
> > +            - const: du.0
> > +            - const: du.1
> 
> The hardware block has only a single function clock for both channels,
> like on R-Car H1.
> 
> And what about DU_DOTCLKIN?

As far as I can tell, there's no DU_DOTCLKIN in V3U.

-- 
Regards,

Laurent Pinchart
