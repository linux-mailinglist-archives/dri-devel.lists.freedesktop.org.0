Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A48B117EB80
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 22:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9026A6E5A2;
	Mon,  9 Mar 2020 21:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911236E5A2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 21:47:45 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8915A20021;
 Mon,  9 Mar 2020 22:47:40 +0100 (CET)
Date: Mon, 9 Mar 2020 22:47:39 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [RESEND PATCH v7] dt-bindings: display: Add idk-2121wr binding
Message-ID: <20200309214739.GA11495@ravnborg.org>
References: <20200306152031.14212-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200309203242.GA14486@bogus>
 <CA+V-a8uAhrkRPUaQOOAUgeKFnwH7zZOF-raQiYvtc9edUeHJ7g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8uAhrkRPUaQOOAUgeKFnwH7zZOF-raQiYvtc9edUeHJ7g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
 a=yC-0_ovQAAAA:8 a=NcFk6D9gAAAA:8 a=S6n1fyGeoZp7psgl2-IA:9
 a=CjuIK1q_8ugA:10 a=gDps05xe3HUA:10 a=-FEs8UIgK8oA:10 a=CojVow1nldcA:10
 a=NWVoK91CQyQA:10 a=AjGcO6oz07-iQ99wixmX:22 a=QsnFDINu91a9xkgZirup:22
 a=dT0RXAwTRpxWjiziVLXF:22
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar

On Mon, Mar 09, 2020 at 09:23:24PM +0000, Lad, Prabhakar wrote:
> Hi Rob,
> 
> On Mon, Mar 9, 2020 at 8:32 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri,  6 Mar 2020 15:20:31 +0000, Lad Prabhakar wrote:
> > > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > Add binding for the idk-2121wr LVDS panel from Advantech.
> > >
> > > Some panel-specific documentation can be found here:
> > > https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > Apologies for flooding in I missed to add the ML email-ids for the earlier
> > > version so resending it.
> > >
> > > Hi All,
> > >
> > > This patch is part of series [1] ("Add dual-LVDS panel support to EK874),
> > > all the patches have been accepted from it except this one. I have fixed
> > > Rob's comments in this version of the patch.
> > >
> > > [1] https://patchwork.kernel.org/cover/11297589/
> > >
> > > v6->7
> > >  * Added reference to lvds.yaml
> > >  * Changed maintainer to myself
> > >  * Switched to dual license
> > >  * Dropped required properties except for ports as rest are already listed
> > >    in lvds.panel
> > >  * Dropped Reviewed-by tag of Laurent, due to the changes made it might not
> > >    be valid.
> > >
> > > v5->v6:
> > >  * No change
> > >
> > > v4->v5:
> > > * No change
> > >
> > > v3->v4:
> > > * Absorbed patch "dt-bindings: display: Add bindings for LVDS
> > >   bus-timings"
> > > * Big restructuring after Rob's and Laurent's comments
> > >
> > > v2->v3:
> > > * New patch
> > >
> > >  .../display/panel/advantech,idk-2121wr.yaml        | 120 +++++++++++++++++++++
> > >  1 file changed, 120 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
> >
> This panel is a dual channel LVDS, as a result the root port is called as
> ports instead of port and the child node port@0 and port@1 are used for
> even and odd pixels, hence binding has required property as ports instead
> of port.

What goes wrong is that you have a ref to lvds.yaml - and thus you get
also required from that file.

So basically - I think this binding should not have a ref to lvds.yaml -
as the binding needs to be different.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
