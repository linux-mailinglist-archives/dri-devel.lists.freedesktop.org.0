Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4B66E38FF
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 15:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDA810E117;
	Sun, 16 Apr 2023 13:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E3910E117
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 13:47:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE2D010A;
 Sun, 16 Apr 2023 15:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1681652832;
 bh=aCQGE+X4vixWX0Y2gnNPv0AMGUzX4NVMijBWevQnQgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i6p3uNmQ6M1tr/N4sM/bXA2w6U4nkP0nQzlxDRuLc0gMgJNmDhTGmKCd+v6JXiBut
 YZf49SnfbPbMwl5kutwGjuLoACKv0M9mUW2OdNWDFBcUOG8fRbPHrh0jg4IaODmh2k
 oZH+OIYWRAw+JKWU/xi7kDupzj5VEsnlX0zzD3dc=
Date: Sun, 16 Apr 2023 16:47:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: h3: beelink-x2: Disable DW-HDMI CEC
Message-ID: <20230416134728.GB28551@pendragon.ideasonboard.com>
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
 <20230415104613.61224-4-jernej.skrabec@gmail.com>
 <20230416132531.GA28551@pendragon.ideasonboard.com>
 <2675247.mvXUDI8C0e@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2675247.mvXUDI8C0e@jernej-laptop>
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, andrzej.hajda@intel.com,
 samuel@sholland.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 hverkuil-cisco@xs4all.nl, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 16, 2023 at 03:31:56PM +0200, Jernej Škrabec wrote:
> Dne nedelja, 16. april 2023 ob 15:25:31 CEST je Laurent Pinchart napisal(a):
> > Hi Jernej,
> > 
> > Thank you for the patch.
> > 
> > On Sat, Apr 15, 2023 at 12:46:13PM +0200, Jernej Skrabec wrote:
> > > Beelink X2 uses software implementation of CEC even though DW-HDMI has
> > > working hardware implementation.
> > 
> > Why ? The reason should be explained in the commit message.
> 
> Maybe I should reword this differently. It uses software implementation through 
> GPIO pin. Dedicated DW-HDMI CEC pin is left unconnected.

That's a very good reason :-) I'm then fine with this patch, with a
reworded commit message. The DT bindings should be updated accordingly
as well, to explain the use case.

> > > Disable unused DW-HDMI CEC.
> > > 
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > > 
> > >  arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> > > b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts index
> > > a6d38ecee141..38f40d69e5c5 100644
> > > --- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> > > +++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> > > @@ -150,6 +150,7 @@ &emac {
> > >  };
> > >  
> > >  &hdmi {
> > > +	snps,disable-cec;
> > >  	status = "okay";
> > >  };

-- 
Regards,

Laurent Pinchart
