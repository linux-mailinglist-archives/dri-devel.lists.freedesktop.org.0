Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C550B42946F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 18:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D00F6E527;
	Mon, 11 Oct 2021 16:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA406E527
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 16:24:05 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 9dc8c04f-2aaf-11ec-ac3c-0050568cd888;
 Mon, 11 Oct 2021 16:23:49 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B3C82194B6F;
 Mon, 11 Oct 2021 18:23:49 +0200 (CEST)
Date: Mon, 11 Oct 2021 18:24:00 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm: panel-simple: Add support for the Innolux
 G070Y2-T02 panel
Message-ID: <YWRlIMEb0j9ji9T4@ravnborg.org>
References: <20210930100501.15690-1-o.rempel@pengutronix.de>
 <20210930100501.15690-2-o.rempel@pengutronix.de>
 <YWGxbKm/5r/J1Vi6@ravnborg.org>
 <20211011090148.GA28262@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011090148.GA28262@pengutronix.de>
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

Hi Oleksij,
On Mon, Oct 11, 2021 at 11:01:48AM +0200, Oleksij Rempel wrote:
> On Sat, Oct 09, 2021 at 05:12:44PM +0200, Sam Ravnborg wrote:
> > Hi Oleksij, Robin,
> > 
> > On Thu, Sep 30, 2021 at 12:05:00PM +0200, Oleksij Rempel wrote:
> > > Add compatible and timings for the Innolux G070Y2-T02 panel. It is 7"
> > > WVGA (800x480) TFT LCD panel with TTL interface and a backlight unit.
> > > 
> > > Co-Developed-by: Robin van der Gracht <robin@protonic.nl>
> > > Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index 9b6c4e6c38a1..a03b60f6fa99 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -2524,6 +2524,19 @@ static const struct panel_desc innolux_g070y2_l01 = {
> > >  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> > >  };
> > >  
> > > +static const struct panel_desc innolux_g070y2_t02 = {
> > > +	.modes = &innolux_at070tn92_mode,
> > 
> > It is suprising to see that the innolux_g070y2_t02 uses the mode
> > innolux_at070tn92_mode.
> > Is it on purpose?
> 
> yes.
> 
> > If yes then I would expect the changelog to say so.
> > 
> > In most (all?) other cases the panel provide their own mode.
> 
> It works with same timing values. What is the preferred way, add own
> mode or extend the changelog?

Both works for me, but I would duplicate the timings.
Only because I do not trust anyone that comes later to see that the
timings are used twice.

	Sam
