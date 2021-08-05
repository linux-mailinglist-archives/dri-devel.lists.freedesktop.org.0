Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDFE3E1222
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A536E4A5;
	Thu,  5 Aug 2021 10:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426206E4A5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:08:21 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1mBaIS-00089a-BI; Thu, 05 Aug 2021 12:08:16 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ore@pengutronix.de>)
 id 1mBaIQ-0007sL-P3; Thu, 05 Aug 2021 12:08:14 +0200
Date: Thu, 5 Aug 2021 12:08:14 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 1/2] drm/panel: simple: add Multi-Innotechnology
 MI1010AIT-1CP1
Message-ID: <20210805100814.zdulbeqbrbq2omks@pengutronix.de>
References: <20210805043702.24715-1-o.rempel@pengutronix.de>
 <1462f001-a01f-9634-744c-8981f72663f6@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1462f001-a01f-9634-744c-8981f72663f6@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:05:08 up 246 days, 11 min, 23 users,  load average: 0.30, 0.11,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
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

On Thu, Aug 05, 2021 at 07:52:24AM +0200, Ahmad Fatoum wrote:
> Hello Oleksij,
> 
> On 05.08.21 06:37, Oleksij Rempel wrote:
> > From: Sam Ravnborg <sam@ravnborg.org>
> > 
> > The Multi Innotechnology is a 10.1" 1280x800 panel.
> > 
> > The datasheet did not specify specific values for sync, back, front porch.
> > The values are a best guess based on values for similar panels.
> > 
> > Co-Developed-by: Sam Ravnborg <sam@ravnborg.org>
> > Co-Developed-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 21939d4352cf..fda79a986d12 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -3033,6 +3033,37 @@ static const struct panel_desc mitsubishi_aa070mc01 = {
> >  	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> >  };
> >  
> > +static const struct display_timing multi_inno_mi1010ait_1cp_timing = {
> > +	.pixelclock = { 68900000, 70000000, 73400000 },
> > +	.hactive = { 1280, 1280, 1280 },
> > +	.hfront_porch = { 30, 60, 71 },
> > +	.hback_porch = { 30, 60, 71 },
> > +	.hsync_len = { 10, 10, 48 },
> > +	.vactive = { 800, 800, 800 },
> > +	.vfront_porch = { 5, 10, 10 },
> > +	.vback_porch = { 5, 10, 10 },
> > +	.vsync_len = { 5, 6, 13 },
> > +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> > +		 DISPLAY_FLAGS_DE_HIGH,
> > +};
> 
> Here you specify DISPLAY_FLAGS_DE_HIGH.
> 
> > +
> > +static const struct panel_desc multi_inno_mi1010ait_1cp = {
> > +	.timings = &multi_inno_mi1010ait_1cp_timing,
> > +	.num_timings = 1,
> > +	.bpc = 8,
> > +	.size = {
> > +		.width = 217,
> > +		.height = 136,
> > +	},
> > +	.delay = {
> > +		.enable = 50,
> > +		.disable = 50,
> > +	},
> > +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> 
> And here DRM_BUS_FLAG_DE_HIGH. I see that some other panels do this too
> and some only specify one of them. Do you know if they are redundant
> or one of them is ignored?

Hmm... there is a drm_bus_flags_from_videomode():
        if (vm->flags & DISPLAY_FLAGS_DE_HIGH)
                *bus_flags |= DRM_BUS_FLAG_DE_HIGH;


It looks like for DPI panel it would be set automatically. This
function is not execute in case of LVDS panel.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
