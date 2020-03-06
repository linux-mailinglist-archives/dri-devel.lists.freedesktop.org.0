Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32717B7DC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3CD6EC68;
	Fri,  6 Mar 2020 08:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311086EC68
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 08:02:59 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1jA7wf-0002P1-NS; Fri, 06 Mar 2020 09:02:57 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1jA7wf-0005Dm-2H; Fri, 06 Mar 2020 09:02:57 +0100
Date: Fri, 6 Mar 2020 09:02:57 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 15/33] drm/panel-simple: Fix dotclock for EDT ET035012DM6
Message-ID: <20200306080257.2v7knpjavace7jw4@pengutronix.de>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-16-ville.syrjala@linux.intel.com>
 <20200303073320.2udpokcs2ync4hpy@pengutronix.de>
 <20200303145251.GX13686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303145251.GX13686@intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:01:19 up 111 days, 23:19, 135 users,  load average: 0.62, 0.65,
 0.37
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Cc: Thierry Reding <treding@nvidia.com>, Andreas Pretzsch <apr@cn-eng.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20-03-03 16:52, Ville Syrj=E4l=E4 wrote:
> On Tue, Mar 03, 2020 at 08:33:20AM +0100, Marco Felsch wrote:
> > Hi Ville,
> > =

> > On 20-03-02 22:34, Ville Syrjala wrote:
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > =

> > > The currently listed dotclock disagrees with the currently
> > > listed vrefresh rate. Change the dotclock to match the vrefresh.
> > > =

> > > Someone tell me which (if either) of the dotclock or vreresh is
> > > correct?
> > =

> > Pls, check the datasheet which is linked within the comment. We hit the
> > vrefresh exactly if we are in SYNC MODE.
> =

> It's too much work to start hunting datasheets for all these
> and figuring out what's going on in each case. Pls just
> inform me which way is correct if you know the details.

How do you know that the clock is wrong if it is to much work? As I said
the clock is completely fine.

Regards,
  Marco

> > =

> > Regards,
> >   Marco
> > =

> > > Cc: Andreas Pretzsch <apr@cn-eng.de>
> > > Cc: Marco Felsch <m.felsch@pengutronix.de>
> > > Cc: Thierry Reding <treding@nvidia.com>
> > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > =

> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/p=
anel/panel-simple.c
> > > index 93e5bc32fb59..35750229189f 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -1342,7 +1342,7 @@ static const struct panel_desc dlc_dlc1010gig =
=3D {
> > >  };
> > >  =

> > >  static const struct drm_display_mode edt_et035012dm6_mode =3D {
> > > -	.clock =3D 6500,
> > > +	.clock =3D 6414,
> > >  	.hdisplay =3D 320,
> > >  	.hsync_start =3D 320 + 20,
> > >  	.hsync_end =3D 320 + 20 + 30,
> > > -- =

> > > 2.24.1
> > > =

> > > =

> > =

> > -- =

> > Pengutronix e.K.                           |                           =
  |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/=
  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0  =
  |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
> =

> -- =

> Ville Syrj=E4l=E4
> Intel
> =


-- =

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
