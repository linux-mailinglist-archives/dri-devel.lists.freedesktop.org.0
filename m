Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42B817799F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 15:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0971E6EA83;
	Tue,  3 Mar 2020 14:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5415E6EA83
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:52:55 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 06:52:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="351853186"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 03 Mar 2020 06:52:51 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Mar 2020 16:52:51 +0200
Date: Tue, 3 Mar 2020 16:52:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 15/33] drm/panel-simple: Fix dotclock for EDT ET035012DM6
Message-ID: <20200303145251.GX13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-16-ville.syrjala@linux.intel.com>
 <20200303073320.2udpokcs2ync4hpy@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303073320.2udpokcs2ync4hpy@pengutronix.de>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Tue, Mar 03, 2020 at 08:33:20AM +0100, Marco Felsch wrote:
> Hi Ville,
> =

> On 20-03-02 22:34, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > The currently listed dotclock disagrees with the currently
> > listed vrefresh rate. Change the dotclock to match the vrefresh.
> > =

> > Someone tell me which (if either) of the dotclock or vreresh is
> > correct?
> =

> Pls, check the datasheet which is linked within the comment. We hit the
> vrefresh exactly if we are in SYNC MODE.

It's too much work to start hunting datasheets for all these
and figuring out what's going on in each case. Pls just
inform me which way is correct if you know the details.

> =

> Regards,
>   Marco
> =

> > Cc: Andreas Pretzsch <apr@cn-eng.de>
> > Cc: Marco Felsch <m.felsch@pengutronix.de>
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
> > index 93e5bc32fb59..35750229189f 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -1342,7 +1342,7 @@ static const struct panel_desc dlc_dlc1010gig =3D=
 {
> >  };
> >  =

> >  static const struct drm_display_mode edt_et035012dm6_mode =3D {
> > -	.clock =3D 6500,
> > +	.clock =3D 6414,
> >  	.hdisplay =3D 320,
> >  	.hsync_start =3D 320 + 20,
> >  	.hsync_end =3D 320 + 20 + 30,
> > -- =

> > 2.24.1
> > =

> > =

> =

> -- =

> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
