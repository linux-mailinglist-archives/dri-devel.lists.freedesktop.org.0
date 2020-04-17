Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA1E1ADE0D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 15:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD926EBDD;
	Fri, 17 Apr 2020 13:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5C66EBDD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:11:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87B6597D;
 Fri, 17 Apr 2020 15:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587129070;
 bh=7193wIuK9xxfxyCeMGXk0h21dUcBAn3R8Nhtk/5Ub2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sxkGqCfAyOynGO7MzoiD7coZhOWcbA2kmtLP+iIVIXvdQd/N6WYRmyarKl4OzuWEV
 oUgbMHtO29y2XW9Tl1hkYFH7YgFBaWfG88skKE6D6oWJHdPqafxQVJgevugNDHFduZ
 VSexBtTPfQl1b0MhLCDM20aE4F9IPJqXtbnymtgY=
Date: Fri, 17 Apr 2020 16:10:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Set AUO G101EVN010 panel type
Message-ID: <20200417131058.GC4748@pendragon.ideasonboard.com>
References: <20200417114043.25381-1-tomi.valkeinen@ti.com>
 <1163e6e1-254d-07c9-496b-7bf2d3157a51@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1163e6e1-254d-07c9-496b-7bf2d3157a51@ti.com>
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
Cc: Alex Gonzalez <alex.gonzalez@digi.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Fri, Apr 17, 2020 at 04:00:34PM +0300, Tomi Valkeinen wrote:
> (Adding Alex to the thread)
> 
> On 17/04/2020 14:40, Tomi Valkeinen wrote:
> > The AUO G101EVN010 is a 18-bit LVDS panel, not a parallel panel, as
> > indicated by the current bus_format.
> > 
> > Fix the bus_format to MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, and also set the
> > connector_type to LVDS.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

I'll trust you on the format,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > ---
> >   drivers/gpu/drm/panel/panel-simple.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 3ad828eaefe1..bf781e260fe7 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -836,7 +836,8 @@ static const struct panel_desc auo_g101evn010 = {
> >   		.width = 216,
> >   		.height = 135,
> >   	},
> > -	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> > +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> > +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >   };
> >   
> >   static const struct drm_display_mode auo_g104sn02_mode = {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
