Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA21119D088
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 08:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9976EAFC;
	Fri,  3 Apr 2020 06:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.theobroma-systems.com (vegas.theobroma-systems.com
 [144.76.126.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D836EA8D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 13:20:22 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]:38526
 helo=diego.localnet) by mail.theobroma-systems.com with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
 (envelope-from <heiko.stuebner@theobroma-systems.com>)
 id 1jJzlc-0001zZ-7t; Thu, 02 Apr 2020 15:20:20 +0200
From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 05/33] drm/panel-leadtek-ltk500hd1829: Fix dotclock
Date: Thu, 02 Apr 2020 15:20:19 +0200
Message-ID: <1998457.Xmjr8ndcq5@diego>
Organization: Theobroma Systems
In-Reply-To: <20200402131310.GU13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <175919560.moPVmXkzvO@diego> <20200402131310.GU13686@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 03 Apr 2020 06:54:15 +0000
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, 2. April 2020, 15:13:10 CEST schrieb Ville Syrj=E4l=E4:
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

hmm, not sure which one you want, so please pick one
Acked-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

or for the address I use whan applying drm-misc commits:
Acked-by: Heiko Stuebner <heiko@sntech.de>


Heiko

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

> =





_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
