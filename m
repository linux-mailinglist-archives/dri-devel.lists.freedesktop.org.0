Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 787637EDF10
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2530510E260;
	Thu, 16 Nov 2023 11:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F87A10E260
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:03:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6035AB9A;
 Thu, 16 Nov 2023 12:03:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1700132589;
 bh=8KfXW81x5VjBr1pKmdlrsWa2u337baN/WeSu/7376cE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mt0s/JqxJ4FOgo8/bn6edwtI8gv68bfmcElRNzH8s8xTijQkXz4xIghopZDaqHsui
 VpU1843edCzDk+0hNTyT2kIPTed+IBST2hX9/nblKJSr83I7YYvvGqLFoxU1guFj62
 5he4bhKazx1SsrygYHEAO8hiCQ1sA1Jc+sUqSTns=
Date: Thu, 16 Nov 2023 13:03:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the
 comment in rzg2l_mipi_dsi_start_video()
Message-ID: <20231116110342.GB20846@pendragon.ideasonboard.com>
References: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB1126962629C0E20D78BDE8C8386B0A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYCPR01MB1126962629C0E20D78BDE8C8386B0A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
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
Cc: "biju.das.au" <biju.das.au@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Pavel Machek <pavel@denx.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Thu, Nov 16, 2023 at 10:58:56AM +0000, Biju Das wrote:
> Hi All,
> 
> Gentle ping. It is reviewed by both Laurent and Geert. 
> 
> Can it be applied to drm-misc-next, if everyone is happy with this patch?

Yes, now that v6.7-rc1 is out I'll send pull requests shortly.

> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Wednesday, September 6, 2023 10:44 AM
> > Subject: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the comment
> > in rzg2l_mipi_dsi_start_video()
> > 
> > Add missing space in the comment in rzg2l_mipi_dsi_start_video().
> > 
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Closes:
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > This issue is noticed while backporting this driver to 6.1.y-cip [1].
> > 
> > [1]
> > ---
> >  drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> > b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> > index 10febea473cd..9b5cfdd3e1c5 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> > @@ -479,7 +479,7 @@ static int rzg2l_mipi_dsi_start_video(struct
> > rzg2l_mipi_dsi *dsi)
> >  	u32 status;
> >  	int ret;
> > 
> > -	/* Configuration for Blanking sequence and start video input*/
> > +	/* Configuration for Blanking sequence and start video input */
> >  	vich1set0r = VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
> >  		     VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
> >  	rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, vich1set0r);

-- 
Regards,

Laurent Pinchart
