Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D5A808BD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC67F10E21E;
	Tue,  8 Apr 2025 12:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mAvc2Ul/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E55C10E21E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:48:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7327CA42F74;
 Tue,  8 Apr 2025 12:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785F6C4CEE7;
 Tue,  8 Apr 2025 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744116500;
 bh=n7hZWm4hEGMIXkiXJPZh2thJyrSuP0mwBU3cOm7mlxU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mAvc2Ul/TCE8NYjLMBHFVG9CNdLD8M05j7P7ZD/x9dMOlYiDZFy/NBAzSANciwbgl
 1RfxYb7XuLr6DyFoO7KW6EfKjC5SeGeWDaASw+0Soh9BYSgaIyE5FARzdBeGXGNfHE
 p081tgS4tRk4/RMj7lHbEBdGeSfCSFxw/0AMwjX0J71159EEfZQmwPlmJ0b7f6PQjj
 asUTpsbPkRdsfMJ9CSr/PbQSKeeGcZ0BzMJuUrkWw4Ha94qBUlfSrZ6Hm8O8u9C7Qw
 S1JJEcUmsN2oCakMjdKZoBdzVVqFS65HhPs+/jEHxjkt8mhQKslXZVVHphlZmbgUIi
 IZQwMGUNC69Qw==
Date: Tue, 8 Apr 2025 14:48:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Imre Deak <imre.deak@intel.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
Message-ID: <20250408-curly-cyan-pig-06adb5@houat>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
 <20250401-b4-drm-panel-mass-driver-convert-v1-4-cdd7615e1f93@redhat.com>
 <Z_P0A9lxWD0aAdjp@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qh44r2bhb2petyd4"
Content-Disposition: inline
In-Reply-To: <Z_P0A9lxWD0aAdjp@ideak-desk.fi.intel.com>
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


--qh44r2bhb2petyd4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0

On Mon, Apr 07, 2025 at 06:49:23PM +0300, Imre Deak wrote:
> Hi,
>=20
> On Tue, Apr 01, 2025 at 12:03:47PM -0400, Anusha Srivatsa wrote:
> > Move to using the new API devm_drm_panel_alloc() to allocate the
> > panel.
> >=20
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >  drivers/gpu/drm/panel/panel-auo-a030jtn01.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c b/drivers/gpu/=
drm/panel/panel-auo-a030jtn01.c
> > index 77604d6a4e72c915c40575be0e47810c90b4ed71..83529b1c2bac2e29f41efaf=
4028950214b056a95 100644
> > --- a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> > +++ b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> > @@ -200,9 +200,10 @@ static int a030jtn01_probe(struct spi_device *spi)
> > =20
> >  	spi->mode |=3D SPI_MODE_3 | SPI_3WIRE;
> > =20
> > -	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > -	if (!priv)
> > -		return -ENOMEM;
> > +	panel =3D devm_drm_panel_alloc(dev, struct a030jtn01, panel,
> > +				     &a030jtn01_funcs, DRM_MODE_CONNECTOR_DPI);
>=20
> This doesn't compile and (yet) it's pushed already to drm-tip. AFAIU
> it's supposed to be
> 	priv =3D devm_drm_panel_alloc(...);
>=20

I fixed it (and the other breakages) there:
https://lore.kernel.org/dri-devel/20250408122008.1676235-1-mripard@kernel.o=
rg/

Maxime

--qh44r2bhb2petyd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/UbEQAKCRDj7w1vZxhR
xcZqAP966SLTnEp6eyDZo1BA/w8YWa7ZWe1NkYqO9UoGKy4WGgEA1D3m44KtlLp0
AwfPo85Tk4acs0XXo8McgO6YcaJ1aw0=
=FUeB
-----END PGP SIGNATURE-----

--qh44r2bhb2petyd4--
