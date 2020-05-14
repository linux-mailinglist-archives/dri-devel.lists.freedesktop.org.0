Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1931D4031
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 23:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0656E32E;
	Thu, 14 May 2020 21:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280A66E32E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 21:37:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E16B626A;
 Thu, 14 May 2020 23:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589492270;
 bh=r7w1seKk94lC635xvi8ddGdPNjZzV7G8rR6A8E6Nsaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ax8svKia4yEKShB3qJmaCJybaNITWBYQC5Ogg3Bw0vlgSXWM2ZC8KEgvzYDH7s5gr
 yQmt/IxAmMTHQZqAjxs1IhZDGyovMWc1L+EB+oyUrgvQGKtjBqJnbrWZCbAykJT2BJ
 Dg8HueHTzqZ4v08G9ATowJ8Bj5QlpX4wuy9w9vKg=
Date: Fri, 15 May 2020 00:37:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1.1 4/4] dt-bindings: display: bridge: renesas,lvds:
 Convert binding to YAML
Message-ID: <20200514213742.GO5955@pendragon.ideasonboard.com>
References: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
 <20200513232840.22687-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXRiP3topBOeLdLhJ9wMBAMFEnLYJPPpdmmdK7TKN4X6g@mail.gmail.com>
 <20200514151721.GF5955@pendragon.ideasonboard.com>
 <CAMuHMdVrO8WfKVdp2wONSYg=cbK=CWyXMyC+Hqv4tkiuCm5WAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVrO8WfKVdp2wONSYg=cbK=CWyXMyC+Hqv4tkiuCm5WAQ@mail.gmail.com>
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

On Thu, May 14, 2020 at 09:02:54PM +0200, Geert Uytterhoeven wrote:
> On Thu, May 14, 2020 at 5:17 PM Laurent Pinchart wrote:
> > On Thu, May 14, 2020 at 09:31:53AM +0200, Geert Uytterhoeven wrote:
> > > On Thu, May 14, 2020 at 1:29 AM Laurent Pinchart wrote:
> > > > Convert the Renesas R-Car LVDS encoder text binding to YAML.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > >
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > >
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > > +    #include <dt-bindings/power/r8a7795-sysc.h>
> > > > +
> > > > +    lvds@feb90000 {
> > > > +        compatible = "renesas,r8a7795-lvds";
> > > > +        reg = <0 0xfeb90000 0 0x14>;
> > >
> > > #{address,size}-cells = <1> for examples.
> > > Applies to all nodes below, too.
> >
> > Why ?
> 
> See "[PATCH 5/5] dt-bindings: Fix incorrect 'reg' property sizes"
> https://lore.kernel.org/linux-devicetree/20200512204543.22090-5-robh@kernel.org/

I don't like this much as it creates invalid examples, but until we have
a better solution, I'll reduce the number of cells.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
