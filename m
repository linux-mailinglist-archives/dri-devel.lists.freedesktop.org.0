Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7519C657
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 17:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12ED6E120;
	Thu,  2 Apr 2020 15:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A141D6E120
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 15:49:18 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id AD8C5804BA;
 Thu,  2 Apr 2020 17:49:14 +0200 (CEST)
Date: Thu, 2 Apr 2020 17:49:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 05/33] drm/panel-leadtek-ltk500hd1829: Fix dotclock
Message-ID: <20200402154913.GA6048@ravnborg.org>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-6-ville.syrjala@linux.intel.com>
 <175919560.moPVmXkzvO@diego> <20200402131310.GU13686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402131310.GU13686@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=NXpJzYs8AAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=mmHeL_GypjD_Pr93wLUA:9
 a=wPNLvfGTeEIA:10 a=cwV61pgf2j4Cq8VD9hE_:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville.

On Thu, Apr 02, 2020 at 04:13:10PM +0300, Ville Syrj=E4l=E4 wrote:
> On Tue, Mar 03, 2020 at 01:52:27PM +0100, Heiko Stuebner wrote:
> > Hi,
> > =

> > Am Montag, 2. M=E4rz 2020, 21:34:24 CET schrieb Ville Syrjala:
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > =

> > > The currently listed dotclock disagrees with the currently
> > > listed vrefresh rate. Change the dotclock to match the vrefresh.
> > > =

> > > Someone tell me which (if either) of the dotclock or vreresh is
> > > correct?
> > =

> > The values came that way from the vendor .
> > And lookin at other Leadtek display datasheets, 60Hz should be the
> > correct refresh rate.
> > =

> > The display is also running happily at the 69MHz of
> > your patch, so
> > =

> > Tested-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> =

> Thanks for confirming.
> =

> I think this patch the last one with a huge difference between
> vrefresh and clock. So once this goes in I'm thinking of declaring
> the remaining patches as not important and pushing ahead with the
> mode dieting. Can someone ack this so I can get it in?

You have done a very good job following up on the individual panels and
the above seems like a good plan moving forward.
So for the remaining patches:

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
> =

> > Heiko
> > =

> > > =

> > > Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > =

> > > diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/dri=
vers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> > > index 76ecf2de9c44..113ab9c0396b 100644
> > > --- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> > > +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> > > @@ -377,7 +377,7 @@ static const struct drm_display_mode default_mode=
 =3D {
> > >  	.vsync_end	=3D 1280 + 30 + 4,
> > >  	.vtotal		=3D 1280 + 30 + 4 + 12,
> > >  	.vrefresh	=3D 60,
> > > -	.clock		=3D 41600,
> > > +	.clock		=3D 69217,
> > >  	.width_mm	=3D 62,
> > >  	.height_mm	=3D 110,
> > >  };
> > > =

> > =

> > =

> > =

> =

> -- =

> Ville Syrj=E4l=E4
> Intel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
