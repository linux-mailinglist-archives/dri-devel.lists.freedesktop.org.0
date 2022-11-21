Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD37631F48
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 12:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1024910E2A7;
	Mon, 21 Nov 2022 11:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EA610E2A7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 11:07:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E39B74C;
 Mon, 21 Nov 2022 12:07:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669028826;
 bh=jGpOQO+X5hH4cZCBKqCtuHwespayHBV2l8MWJKlO3OE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cxCLAMKONpic0LLC+0kgMunFgGttSqr/Oedn8hwZiQA+2voVIscLoaDfKy2v6HV0n
 wU1ni4YP1Fckr1aV11bksXPJXR11Rw4QWqAODJpytsWu/qP/Zi12dWtQ7jfsOcxNUU
 OSt7m4U19PECxa54AOxueJREEjY8nkbExTbHXfhc=
Date: Mon, 21 Nov 2022 13:06:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 0/6] dt-bindings: Add macros for video interface bus
 types
Message-ID: <Y3tbzArGt9yap6x7@pendragon.ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <YtOyCBOqCR71uG1i@paasikivi.fi.intel.com>
 <Y3dPGkFaz/qo/drw@pyrite.rasen.tech>
 <Y3krOMoBLKpF1L7/@pendragon.ideasonboard.com>
 <Y3tYyRHkvgei5We9@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y3tYyRHkvgei5We9@paasikivi.fi.intel.com>
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sakari,

On Mon, Nov 21, 2022 at 10:54:01AM +0000, Sakari Ailus wrote:
> On Sat, Nov 19, 2022 at 09:15:04PM +0200, Laurent Pinchart wrote:
> > On Fri, Nov 18, 2022 at 06:23:38PM +0900, Paul Elder wrote:
> > > On Sun, Jul 17, 2022 at 06:54:00AM +0000, Sakari Ailus wrote:
> > > > Folks,
> > > > 
> > > > > Laurent Pinchart (6):
> > > > >   dt-bindings: media: Add macros for video interface bus types
> > > > >   dt-bindings: Use new video interface bus type macros in examples
> > > > >   ARM: dts: freescale: Use new media bus type macros
> > > > >   ARM: dts: omap: Use new media bus type macros
> > > > >   ARM: dts: renesas: Use new media bus type macros
> > > > >   ARM: dts: stm32: Use new media bus type macros
> > > > 
> > > > What's the preference on the tree through which these would be merged?
> > > > 
> > > > The two first should probably go through the media tree but what about the
> > > > DTS? There's a dependency to the first patch. I can take these all if
> > > > people are fine with that.
> > > 
> > > How is this going?
> > 
> > Sakari, if there's a concern taking patches 3/6 to 6/6 in the media
> > tree, could you merge 1/6 and 2/6 ? If they can still be included in a
> > pull request for v6.2, I'll work on getting the dts changes in v6.3
> > through their respective trees.
> 
> I think I was expecting v4 from you. But I can address the comments, too,
> they were minor matters.

That would be nice :-) Could it still be done for v6.2 ?

> For applying the DTS patches I'd like to have ack from respective
> treemaintainers it's fine to take these through the media tree.

Works for me, this can be done in v6.3.

-- 
Regards,

Laurent Pinchart
