Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF71D34D1
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 17:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F606EB61;
	Thu, 14 May 2020 15:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84456EB2F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 15:17:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E53FA259;
 Thu, 14 May 2020 17:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589469450;
 bh=IQ/w7wNceyepVhZCFavDD7WAfqN9SfwRMZjfpAXoYxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y/Mj54TvBe8FySE2wDJYUPU6rnYLTLTzjRWUxwsBSWobCbdpzJYLmlZSEz9uBaDe1
 /ypUmEmHkSummueBxEXO3/x0eHNhrvnRy4DbvUgkmFamJef2IF2tGwnf3MovyG6DT2
 jP8qOajAXVuGxJjXAHw/g4hBKIH1edCshHUpggcw=
Date: Thu, 14 May 2020 18:17:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1.1 4/4] dt-bindings: display: bridge: renesas,lvds:
 Convert binding to YAML
Message-ID: <20200514151721.GF5955@pendragon.ideasonboard.com>
References: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
 <20200513232840.22687-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXRiP3topBOeLdLhJ9wMBAMFEnLYJPPpdmmdK7TKN4X6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXRiP3topBOeLdLhJ9wMBAMFEnLYJPPpdmmdK7TKN4X6g@mail.gmail.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Thu, May 14, 2020 at 09:31:53AM +0200, Geert Uytterhoeven wrote:
> On Thu, May 14, 2020 at 1:29 AM Laurent Pinchart wrote:
> > Convert the Renesas R-Car LVDS encoder text binding to YAML.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> 
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > +    #include <dt-bindings/power/r8a7795-sysc.h>
> > +
> > +    lvds@feb90000 {
> > +        compatible = "renesas,r8a7795-lvds";
> > +        reg = <0 0xfeb90000 0 0x14>;
> 
> #{address,size}-cells = <1> for examples.
> Applies to all nodes below, too.

Why ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
