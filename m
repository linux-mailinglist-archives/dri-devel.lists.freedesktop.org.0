Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C0AEB2D0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052BD10E992;
	Fri, 27 Jun 2025 09:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D9PBbt61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60A110E992
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:25:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 10F9CA5263D;
 Fri, 27 Jun 2025 09:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F69FC4CEE3;
 Fri, 27 Jun 2025 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751016337;
 bh=RjOuz95NmQNjCtEfnlq89SW3Z5ZuO4FlViZ8lGUPb4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D9PBbt61e3T0ATcRzVHgzye4UzRWdrPxVGqXAyZM+B/cN1ws4mtPl2WIoqLfWa5yn
 MjCgvfeWNwmNvyBGQ6r7IUzw8AZQr8xq62B0f2V86470yRdjVRMhWLK7oz7EQhOqDv
 /gIIWL0FEtXV+q/beHTkY2v3b6PgfiKwt20Q4EtoGNrr89L/zMQ1B4XZ2bUaI7OBcd
 eN53e1aGatuCqHR4hXavKDBM0BJCJMv18I4WP/nvmXOT+ZSB3igdmiBE5WsTV+h/Jt
 IkkloytT23cOpeQUAZouMsaOItDjvryGAkZzCt4W8btBzDV5LAsZ7lkgBOXN7FzXG+
 TDqkmYGhcEcYA==
Date: Fri, 27 Jun 2025 11:25:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] drm/mipi-dsi: Add dev_is_mipi_dsi function
Message-ID: <20250627-manipulative-condor-of-faith-389bce@houat>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-1-5afcaa608bdc@kernel.org>
 <87cyapd08f.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="oo5w6c3i24xyxwvo"
Content-Disposition: inline
In-Reply-To: <87cyapd08f.fsf@minerva.mail-host-address-is-not-set>
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


--oo5w6c3i24xyxwvo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/5] drm/mipi-dsi: Add dev_is_mipi_dsi function
MIME-Version: 1.0

On Fri, Jun 27, 2025 at 11:04:16AM +0200, Javier Martinez Canillas wrote:
> Maxime Ripard <mripard@kernel.org> writes:
>=20
> Hello Maxime,
>=20
> > This will be especially useful for generic panels (like panel-simple)
> > which can take different code path depending on if they are MIPI-DSI
> > devices or platform devices.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_mipi_dsi.c | 3 ++-
> >  include/drm/drm_mipi_dsi.h     | 3 +++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_=
dsi.c
> > index e5184a0c24651756ee0b1eb27d94083d63eb35a7..21fd647f8ce1a6a862e2f8f=
b5320e701f26f614f 100644
> > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > @@ -89,16 +89,17 @@ static const struct dev_pm_ops mipi_dsi_device_pm_o=
ps =3D {
> >  	.thaw =3D pm_generic_thaw,
> >  	.poweroff =3D pm_generic_poweroff,
> >  	.restore =3D pm_generic_restore,
> >  };
> > =20
> > -static const struct bus_type mipi_dsi_bus_type =3D {
> > +const struct bus_type mipi_dsi_bus_type =3D {
> >  	.name =3D "mipi-dsi",
> >  	.match =3D mipi_dsi_device_match,
> >  	.uevent =3D mipi_dsi_uevent,
> >  	.pm =3D &mipi_dsi_device_pm_ops,
> >  };
> > +EXPORT_SYMBOL_GPL(mipi_dsi_bus_type);
> > =20
> >  /**
> >   * of_find_mipi_dsi_device_by_node() - find the MIPI DSI device matchi=
ng a
> >   *    device tree node
> >   * @np: device tree node
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index b37860f4a895c25ef8ba1c5b3f44827ef53aa100..6d2c08e8110151a97620389=
197f1ef79c058329d 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -221,10 +221,13 @@ struct mipi_dsi_multi_context {
> > =20
> >  #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
> > =20
> >  #define to_mipi_dsi_device(__dev)	container_of_const(__dev, struct mip=
i_dsi_device, dev)
> > =20
> > +extern const struct bus_type mipi_dsi_bus_type;
> > +#define dev_is_mipi_dsi(dev)	((dev)->bus =3D=3D &mipi_dsi_bus_type)
> > +
>=20
> Usually I prefer to have static inline functions instead of macros to have
> type checking. I see that this header has a mix of both, so I don't have a
> strong opinion on what to use in this case.
>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your review!

For the record, it's also how the platform bus defines its equivalent
macro, so that's why I went with it.

Maxime

--oo5w6c3i24xyxwvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaF5jjgAKCRAnX84Zoj2+
dnxHAYDvKAslH9a+3jo1syyXRBG1bO78Ql/LPw2GemDSTM6Yj5g41ZixnLMfufLX
B1WLsgABf1eCkEdSJrW7+ThutdAWpwTSD9zqTpA1s0putcQ4NflHIa/46/4KEIUK
VJUqMYrcgg==
=gkVH
-----END PGP SIGNATURE-----

--oo5w6c3i24xyxwvo--
