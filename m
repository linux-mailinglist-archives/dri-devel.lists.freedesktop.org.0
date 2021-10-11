Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B560428956
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 11:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B61B6E44F;
	Mon, 11 Oct 2021 09:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B180F6E44F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 09:01:59 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1mZrBu-0005tB-0R; Mon, 11 Oct 2021 11:01:50 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1mZrBs-0002N4-4R; Mon, 11 Oct 2021 11:01:48 +0200
Date: Mon, 11 Oct 2021 11:01:48 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm: panel-simple: Add support for the Innolux
 G070Y2-T02 panel
Message-ID: <20211011090148.GA28262@pengutronix.de>
References: <20210930100501.15690-1-o.rempel@pengutronix.de>
 <20210930100501.15690-2-o.rempel@pengutronix.de>
 <YWGxbKm/5r/J1Vi6@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YWGxbKm/5r/J1Vi6@ravnborg.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:00:14 up 235 days, 12:24, 140 users,  load average: 0.70, 0.28,
 0.26
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 09, 2021 at 05:12:44PM +0200, Sam Ravnborg wrote:
> Hi Oleksij, Robin,
> 
> On Thu, Sep 30, 2021 at 12:05:00PM +0200, Oleksij Rempel wrote:
> > Add compatible and timings for the Innolux G070Y2-T02 panel. It is 7"
> > WVGA (800x480) TFT LCD panel with TTL interface and a backlight unit.
> > 
> > Co-Developed-by: Robin van der Gracht <robin@protonic.nl>
> > Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 9b6c4e6c38a1..a03b60f6fa99 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -2524,6 +2524,19 @@ static const struct panel_desc innolux_g070y2_l01 = {
> >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >  
> > +static const struct panel_desc innolux_g070y2_t02 = {
> > +	.modes = &innolux_at070tn92_mode,
> 
> It is suprising to see that the innolux_g070y2_t02 uses the mode
> innolux_at070tn92_mode.
> Is it on purpose?

yes.

> If yes then I would expect the changelog to say so.
> 
> In most (all?) other cases the panel provide their own mode.

It works with same timing values. What is the preferred way, add own
mode or extend the changelog?

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
