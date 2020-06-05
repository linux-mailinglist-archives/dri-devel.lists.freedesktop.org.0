Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D541EFE62
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 19:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5245D6E949;
	Fri,  5 Jun 2020 17:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EA86E949
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 17:00:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9357A2002F;
 Fri,  5 Jun 2020 19:00:03 +0200 (CEST)
Date: Fri, 5 Jun 2020 19:00:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 2/6] drm: panel-simple: add Seiko 70WVW2T 7" simple
 panel
Message-ID: <20200605170002.GC207594@ravnborg.org>
References: <20200601083309.712606-1-sam@ravnborg.org>
 <20200601083309.712606-3-sam@ravnborg.org>
 <CAD=FV=VSyODjtVtEe6H46U6xNraD2LUUi+xt8cxraaqXom=64g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VSyODjtVtEe6H46U6xNraD2LUUi+xt8cxraaqXom=64g@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8 a=pGLkceISAAAA:8
 a=aPMyHXCWJWEOWkbedn4A:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug.

On Mon, Jun 01, 2020 at 05:31:06PM -0700, Doug Anderson wrote:
> Hi,
> =

> On Mon, Jun 1, 2020 at 1:33 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > The Seiko 70WVW2T is a discontinued product, but may be used somewhere.
> > Tested on a proprietary product.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: S=F8ren Andersen <san@skov.dk>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
> > index b067f66cea0e..8624bb80108c 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -3194,6 +3194,31 @@ static const struct panel_desc shelly_sca07010_b=
fn_lnn =3D {
> >         .bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
> >  };
> >
> > +static const struct drm_display_mode sii_70wvw2t_mode =3D {
> > +       .clock =3D 33000,
> > +       .hdisplay =3D 800,
> > +       .hsync_start =3D 800 + 256,
> > +       .hsync_end =3D 800 + 256 + 0,
> > +       .htotal =3D 800 + 256 + 0 + 0,
> > +       .vdisplay =3D 480,
> > +       .vsync_start =3D 480 + 0,
> > +       .vsync_end =3D 480 + 0 + 0,
> > +       .vtotal =3D 480 + 0 + 0 + 45,
> =

> Important to have a "vrefresh"?
> =

> =

> > +       .flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> > +};
> > +
> > +static const struct panel_desc sii_70wvw2t =3D {
> > +       .modes =3D &sii_70wvw2t_mode,
> > +       .num_modes =3D 1,
> =

> Do we want "bpc =3D 6"?
> =

> =

> > +       .size =3D {
> > +               .width =3D 152,
> > +               .height =3D 91,
> > +       },
> > +       .bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
> =

> Should this be a 666 format?  Random internet-found data sheet says
> 262K colors...

Thanks for catching this!
You are indeed right, this is MEDIA_BUS_FMT_RGB666_1X18 and only bpc =3D 6.
My bad excuse is that other displays for the same HW is RGB888 and bpc =3D =
8.

Will fix and repost.

	Sam

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
