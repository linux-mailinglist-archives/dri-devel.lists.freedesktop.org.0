Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B538866BC24
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 11:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93DE10E3C0;
	Mon, 16 Jan 2023 10:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CD810E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 10:49:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBE04802;
 Mon, 16 Jan 2023 11:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673866161;
 bh=QPKbaBg15FIAAfwmoECrnTKED2vhulpywKn1lrKXHwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rsA5uz9qrZPSpxqp6TK4pQviMeiZZ0RpR5R1xNmbXmObdIByNf0plUQnAoTpzwGNj
 PSQE1Fh0fK1GjZ0oR+CAEnITmGOsbwrgs//zvN3ENei9t61JeVVqe5LDRgR0Lhi2q6
 4Gf4QXelvSnd430RTAICZbhE6AiPNRTrr/9NhjDY=
Date: Mon, 16 Jan 2023 12:49:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 5/6] ARM: dts: renesas: Use new media bus type macros
Message-ID: <Y8UrsSnhGd7GQEIJ@pendragon.ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
 <Y8LJkPLghb/8Y+iQ@pendragon.ideasonboard.com>
 <CAMuHMdXnssq_tGbg+vL7BuLK5sa4Lg1xx0106uMFthRfUoq7=Q@mail.gmail.com>
 <Y8UpDsTixfacduXl@pendragon.ideasonboard.com>
 <CAMuHMdVHnJ2Q1CCDUiTUPcESp2cExu6BynoscTGOiD6UA1u7_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVHnJ2Q1CCDUiTUPcESp2cExu6BynoscTGOiD6UA1u7_w@mail.gmail.com>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 11:44:13AM +0100, Geert Uytterhoeven wrote:
> On Mon, Jan 16, 2023 at 11:38 AM Laurent Pinchart wrote:
> > On Mon, Jan 16, 2023 at 11:24:10AM +0100, Geert Uytterhoeven wrote:
> > > On Sat, Jan 14, 2023 at 4:26 PM Laurent Pinchart wrote:
> > > > Geert, could you please take this in your tree for v6.3 ? The two
> > > > patches that the DT changes depend on have been merged in v6.2.
> > >
> > > Thank you, I had missed these.
> > >
> > > > On Thu, Jun 16, 2022 at 01:14:09AM +0300, Laurent Pinchart wrote:
> > > > > Now that a header exists with macros for the media interface bus-type
> > > > > values, replace hardcoding numerical constants with the corresponding
> > > > > macros in the DT sources.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > > > ---
> > > > >  arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
> > > > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
> > > > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
> > > > >  3 files changed, 13 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > > index 4e58c54cde17..33ac4bd1e63b 100644
> > > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > > @@ -7,6 +7,9 @@
> > > > >   */
> > > > >
> > > > >  /dts-v1/;
> > > > > +
> > > > > +#include <dt-bindings/media/video-interfaces.h>
> > > > > +
> > > > >  #include "r8a7742-iwg21d-q7.dts"
> > > > >
> > > > >  / {
> > > > > @@ -242,7 +245,7 @@ port {
> > > > >               vin0ep: endpoint {
> > > > >                       remote-endpoint = <&cam0ep>;
> > > > >                       bus-width = <8>;
> > > > > -                     bus-type = <6>;
> > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > >               };
> > > > >       };
> > > > >  };
> > > > > @@ -273,7 +276,7 @@ port {
> > > > >               vin1ep: endpoint {
> > > > >                       remote-endpoint = <&cam1ep>;
> > > > >                       bus-width = <8>;
> > > > > -                     bus-type = <6>;
> > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > >               };
> > > > >       };
> > > > >  };
> > > > > @@ -305,7 +308,7 @@ vin2ep: endpoint {
> > > > >                       remote-endpoint = <&cam2ep>;
> > > > >                       bus-width = <8>;
> > > > >                       data-shift = <8>;
> > > > > -                     bus-type = <6>;
> > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > >               };
> > > > >       };
> > > > >  };
> > > > > @@ -335,7 +338,7 @@ port {
> > > > >               vin3ep: endpoint {
> > > > >                       remote-endpoint = <&cam3ep>;
> > > > >                       bus-width = <8>;
> > > > > -                     bus-type = <6>;
> > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > >               };
> > > > >       };
> > > > >  };
> > > > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > > index 40cef0b1d1e6..c73160df619d 100644
> > > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > > @@ -7,6 +7,8 @@
> > > > >   * Copyright (C) 2020 Renesas Electronics Corp.
> > > > >   */
> > > > >
> > > > > +#include <dt-bindings/media/video-interfaces.h>
> > >
> > > This .dtsi file is only intended to be included by
> > > arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts, which already has
> > > the include.  Hence if you don't mind, I would like to drop this part
> > > while applying  and queuing in renesas-devel for v6.3.
> >
> > Isn't it better to include headers as needed to avoid depending on
> > indirect includes ?
> 
> In general, I agree.
> In this particular case, (the multiple inclusions of) the
> r8a7742-iwg21d-q7-dbcm-ov*-single.dtsi files are tied very intimately
> to r8a7742-iwg21d-q7-dbcm-ca.dts.

I'd still prefer keeping the #include here, but you're the maintainer
:-)

-- 
Regards,

Laurent Pinchart
