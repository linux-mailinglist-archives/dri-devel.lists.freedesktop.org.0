Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BE850D2F4
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 17:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5DD10EE21;
	Sun, 24 Apr 2022 15:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2245E10EE21
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 15:44:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F0B630B;
 Sun, 24 Apr 2022 17:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650815055;
 bh=wRIeNrks/S3W0CSNWzdwa/hP/i+vgQrx8t91l+9ccjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LEAmwamPFNiFIX5z4fRFH8Y5r20FuU4mm8Iw/IHZBb/lKNAq4nNvdONkR+MWFB7s3
 2lMQtNbwKdt7WYOh/oE8Qzox6T7Vt8MVSCr6g6eWdv2CxjK0xbAo4bXMe5CJUngpUo
 TDlnIAoLq6fISRuCs0itOjvWAYUpzLRuGeUXxgVw=
Date: Sun, 24 Apr 2022 18:44:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 2/4] drm: rcar-du: Fix typo
Message-ID: <YmVwT0ZKInxbgKQ7@pendragon.ideasonboard.com>
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdV_eNxM4yHgkUFPz58KyiGFtjjBeePtuAg8pZYfsS5t9g@mail.gmail.com>
 <OS0PR01MB59222BB60DE4DFEA83A851C186F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59222BB60DE4DFEA83A851C186F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Apr 22, 2022 at 09:38:00AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH v3 2/4] drm: rcar-du: Fix typo
> > On Thu, Apr 21, 2022 at 6:31 PM Biju Das wrote:
> > > Fix typo rcar_du_vsp.h->rcar_du_vsp.c
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > 
> > Thanks for your patch!
> > 
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > > @@ -1,6 +1,6 @@
> > >  // SPDX-License-Identifier: GPL-2.0+
> > >  /*
> > > - * rcar_du_vsp.h  --  R-Car Display Unit VSP-Based Compositor
> > > + * rcar_du_vsp.c  --  R-Car Display Unit VSP-Based Compositor
> > 
> > Perhaps drop the file name completely instead?
> 
> Currently all the R-Car DU files have file name. May be
> A single patch to remove all off them if we are planning to do.
> 
> Laurent, please share your thoughts on this.

Geert has a point, the file names cause issues and don't add much value.
Would you like to send a patch to drop them all, to replace this one ? I
can also handle it myself if you prefer.

-- 
Regards,

Laurent Pinchart
