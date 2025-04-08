Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3406AA80904
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65C710E22C;
	Tue,  8 Apr 2025 12:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M7aS5y54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AAA10E22C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:50:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F1BFC6843C;
 Tue,  8 Apr 2025 12:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4769EC4CEE5;
 Tue,  8 Apr 2025 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744116624;
 bh=CgX78u6QLtk+HdwkTlv62EHL+PkIaRGJiQ/dBa/8aTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M7aS5y54ieYe0am2eoJ6POBlvSEmVkvP7M0Rv8jXs2r0/Y6iiIvEQaIHBqYjoIWMx
 aD9carIF2Z1tAjMENYQoBmSGS4PC6BlgS230z7CgtwebGkY6pNuIRdgnxxbXhCdYjk
 CQOYcgWGQepy44N7NSB/WBeC49uSuSX31nBfdHwJGOk9jYQlgrsix5M5IP1/+Kw0Cj
 0nNMR6RDiOvQTUGPkyeLq9PV1PYMVwP+ofJo5Bx0LkaEmQCH6rMUQkvfqHDzUCHLGe
 rirJuhrmM57EWxcwwBUo+sAkcJXB3VCG4fX6pANLC5NlVgTBRIrFyGBIFgA1WhDCE3
 3dtsk4FaMYk4g==
Date: Tue, 8 Apr 2025 14:50:22 +0200
From: Maxime Ripard <mripard@kernel.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, "Deak, Imre" <imre.deak@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Douglas Anderson <dianders@chromium.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
Message-ID: <20250408-industrious-impetuous-wombat-f6d7dc@houat>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
 <20250401-b4-drm-panel-mass-driver-convert-v1-4-cdd7615e1f93@redhat.com>
 <Z_P0A9lxWD0aAdjp@ideak-desk.fi.intel.com>
 <85a58rsgjj.wl-ashutosh.dixit@intel.com>
 <87bjt7eca8.wl-ashutosh.dixit@intel.com>
 <87a58re8hj.wl-ashutosh.dixit@intel.com>
 <854iyzs3na.wl-ashutosh.dixit@intel.com>
 <SJ1PR11MB6129F0A86E4A543021A636E6B9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cgdp2tgcb2tejubf"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6129F0A86E4A543021A636E6B9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
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


--cgdp2tgcb2tejubf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0

On Tue, Apr 08, 2025 at 06:47:06AM +0000, Borah, Chaitanya Kumar wrote:
>=20
>=20
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of =
Dixit,
> > Ashutosh
> > Sent: Tuesday, April 8, 2025 9:31 AM
> > To: Anusha Srivatsa <asrivats@redhat.com>
> > Cc: Deak, Imre <imre.deak@intel.com>; Neil Armstrong
> > <neil.armstrong@linaro.org>; Jessica Zhang <quic_jesszhan@quicinc.com>;
> > Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> > David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Linus
> > Walleij <linus.walleij@linaro.org>; Joel Selvaraj <jo@jsfamily.in>; Dou=
glas
> > Anderson <dianders@chromium.org>; dri-devel@lists.freedesktop.org; linu=
x-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocati=
on
> > in place of devm_kzalloc()
> >=20
> > On Mon, 07 Apr 2025 18:40:24 -0700, Dixit, Ashutosh wrote:
> > >
> > > On Mon, 07 Apr 2025 17:18:23 -0700, Dixit, Ashutosh wrote:
> > > >
> > > > On Mon, 07 Apr 2025 16:22:40 -0700, Dixit, Ashutosh wrote:
> > > > >
> > > > > On Mon, 07 Apr 2025 08:49:23 -0700, Imre Deak wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Tue, Apr 01, 2025 at 12:03:47PM -0400, Anusha Srivatsa wrote:
> > > > > > > Move to using the new API devm_drm_panel_alloc() to allocate
> > > > > > > the panel.
> > > > > > >
> > > > > > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/panel/panel-auo-a030jtn01.c | 10 ++++------
> > > > > > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> > > > > > > b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> > > > > > > index
> > > > > > >
> > 77604d6a4e72c915c40575be0e47810c90b4ed71..83529b1c2bac2e29f41e
> > > > > > > faf4028950214b056a95 100644
> > > > > > > --- a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> > > > > > > +++ b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> > > > > > > @@ -200,9 +200,10 @@ static int a030jtn01_probe(struct
> > > > > > > spi_device *spi)
> > > > > > >
> > > > > > >	spi->mode |=3D SPI_MODE_3 | SPI_3WIRE;
> > > > > > >
> > > > > > > -	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > > > > -	if (!priv)
> > > > > > > -		return -ENOMEM;
> > > > > > > +	panel =3D devm_drm_panel_alloc(dev, struct a030jtn01, panel,
> > > > > > > +				     &a030jtn01_funcs,
> > DRM_MODE_CONNECTOR_DPI);
> > > > > >
> > > > > > This doesn't compile and (yet) it's pushed already to drm-tip.
> > > > > >AFAIU  it's supposed to be
> > > > > >	priv =3D devm_drm_panel_alloc(...);
> > > > >
> > > > > Yes:
> > > > >
> > > > > drivers/gpu/drm/panel/panel-auo-a030jtn01.c: In function
> > =E2=80=98a030jtn01_probe=E2=80=99:
> > > > > drivers/gpu/drm/panel/panel-auo-a030jtn01.c:203:9: error: =E2=80=
=98panel=E2=80=99
> > undeclared (first use in this function)
> > > > >   203 |         panel =3D devm_drm_panel_alloc(dev, struct a030jt=
n01, panel,
> > > > >       |         ^~~~~
> > > > > drivers/gpu/drm/panel/panel-auo-a030jtn01.c:203:9: note: each
> > > > > undeclared identifier is reported only once for each function it
> > > > > appears in
> > > > >
> > > > > Please turn on the config options for particular module if you are
> > > > > making changes to that module.
> > > >
> > > > Though probably, you can argue, that the pre-merge CI build should
> > > > already be doing this. A sort of allmodconfig for the DRM subsystem,
> > > > so that these kinds of issues don't get missed.
> > >
> > > More compile errors:
> > >
> > > I'm still getting some allmodconfig errors:
> > >
> > > ../drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c: In function
> > 'boe_th101mb31ig002_dsi_probe':
> > > ../drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c:352:9: error:
> > 'panel' undeclared (first use in this function)
> > >   352 |         panel =3D devm_drm_panel_alloc(dev, struct panel_desc=
, panel,
> > >       |         ^~~~~
> > > ../drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c:352:9: note:
> > > each undeclared identifier is reported only once for each function it=
 appears
> > in In file included from ../drivers/gpu/drm/panel/panel-boe-
> > th101mb31ig002-28a.c:18:
> > > ../drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c:352:38: error:
> > 'dev' undeclared (first use in this function); did you mean 'cdev'?
> > >   352 |         panel =3D devm_drm_panel_alloc(dev, struct panel_desc=
, panel,
> > >       |                                      ^~~
> > > ../include/drm/drm_panel.h:305:41: note: in definition of macro
> > 'devm_drm_panel_alloc'
> > >   305 |         ((type *)__devm_drm_panel_alloc(dev, sizeof(type), \
> > >       |                                         ^~~
> > > In file included from ../include/uapi/linux/posix_types.h:5,
> > >                  from ../include/uapi/linux/types.h:14,
> > >                  from ../include/linux/types.h:6,
> > >                  from ../include/linux/math.h:5,
> > >                  from ../include/linux/delay.h:12,
> > >                  from ../drivers/gpu/drm/panel/panel-boe-th101mb31ig0=
02-
> > 28a.c:8:
> > > ../include/linux/stddef.h:16:33: error: 'struct panel_desc' has no me=
mber
> > named 'panel'
> > >    16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMB=
ER)
> > >       |                                 ^~~~~~~~~~~~~~~~~~
> > > ../include/drm/drm_panel.h:306:41: note: in expansion of macro 'offse=
tof'
> > >   306 |                                         offsetof(type, member=
), funcs, \
> > >       |                                         ^~~~~~~~
> > > ../drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c:352:17: note:
> > in expansion of macro 'devm_drm_panel_alloc'
> > >   352 |         panel =3D devm_drm_panel_alloc(dev, struct panel_desc=
, panel,
> > >       |                 ^~~~~~~~~~~~~~~~~~~~
> > >
> >=20
> > In case it is not clear, to reproduce and fix these, do:
> >=20
> > 	make -j$(nproc) allmodconfig
> >=20
> >=20
>=20
> We will need more changes than fixing the variable names.
>=20
> I get this error
>=20
> ERROR: modpost: "__devm_drm_panel_alloc" [drivers/gpu/drm/panel/panel-auo=
-a030jtn01.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[1]: *** [/home/chaitanya/exodus/repos/drm-tip-sandbox/Makefile:1956:=
 modpost] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>=20
> after making the following change.

I couldn't reproduce this one on current drm-misc-next with arm64 and
x86 allmodconfig. Could you share your configuration?

Maxime

--cgdp2tgcb2tejubf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/UbjQAKCRDj7w1vZxhR
xehPAQDPuFHIcDvI2SYrAH7QQbORAsFU/ZbLPU/hvTZFtLRdtgEA6FCah2YA30JM
npLQ1E15tQwgGpP8shDvyTkvFOeayAQ=
=aMNG
-----END PGP SIGNATURE-----

--cgdp2tgcb2tejubf--
