Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B60CE2D5550
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F576EA2E;
	Thu, 10 Dec 2020 08:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4D36E9EC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 11:02:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 754C4AD11;
 Wed,  9 Dec 2020 11:02:12 +0000 (UTC)
Message-ID: <e8f10e8a3b5b66c31011a1e282c65979580e2957.camel@suse.de>
Subject: Re: [PATCH 1/8] drm/vc4: drv: Remove the DSI pointer in vc4_drv
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@intel.com>, David
 Airlie <airlied@linux.ie>
Date: Wed, 09 Dec 2020 12:02:10 +0100
In-Reply-To: <20201203132543.861591-2-maxime@cerno.tech>
References: <20201203132543.861591-1-maxime@cerno.tech>
 <20201203132543.861591-2-maxime@cerno.tech>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:40 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============2119220737=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2119220737==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-W310H53AKpoprfZflRY7"


--=-W310H53AKpoprfZflRY7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-12-03 at 14:25 +0100, Maxime Ripard wrote:
> That pointer isn't used anywhere, so there's no point in keeping it.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

> =C2=A0drivers/gpu/drm/vc4/vc4_drv.h | 1 -
> =C2=A0drivers/gpu/drm/vc4/vc4_dsi.c | 9 ---------
> =C2=A02 files changed, 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.=
h
> index c5f2944d5bc6..ee95b4327796 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -77,7 +77,6 @@ struct vc4_dev {
> =C2=A0	struct vc4_hvs *hvs;
> =C2=A0	struct vc4_v3d *v3d;
> =C2=A0	struct vc4_dpi *dpi;
> -	struct vc4_dsi *dsi1;
> =C2=A0	struct vc4_vec *vec;
> =C2=A0	struct vc4_txp *txp;
> =C2=A0
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.=
c
> index 19aab4e7e209..b1d8765795f1 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1459,7 +1459,6 @@ static int vc4_dsi_bind(struct device *dev, struct =
device *master, void *data)
> =C2=A0{
> =C2=A0	struct platform_device *pdev =3D to_platform_device(dev);
> =C2=A0	struct drm_device *drm =3D dev_get_drvdata(master);
> -	struct vc4_dev *vc4 =3D to_vc4_dev(drm);
> =C2=A0	struct vc4_dsi *dsi =3D dev_get_drvdata(dev);
> =C2=A0	struct vc4_dsi_encoder *vc4_dsi_encoder;
> =C2=A0	struct drm_panel *panel;
> @@ -1612,9 +1611,6 @@ static int vc4_dsi_bind(struct device *dev, struct =
device *master, void *data)
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
>=20
> -	if (dsi->port =3D=3D 1)
> -		vc4->dsi1 =3D dsi;
> -
> =C2=A0	drm_simple_encoder_init(drm, dsi->encoder, DRM_MODE_ENCODER_DSI);
> =C2=A0	drm_encoder_helper_add(dsi->encoder, &vc4_dsi_encoder_helper_funcs=
);
> =C2=A0
>=20
> @@ -1643,8 +1639,6 @@ static int vc4_dsi_bind(struct device *dev, struct =
device *master, void *data)
> =C2=A0static void vc4_dsi_unbind(struct device *dev, struct device *maste=
r,
> =C2=A0			   void *data)
> =C2=A0{
> -	struct drm_device *drm =3D dev_get_drvdata(master);
> -	struct vc4_dev *vc4 =3D to_vc4_dev(drm);
> =C2=A0	struct vc4_dsi *dsi =3D dev_get_drvdata(dev);
> =C2=A0
>=20
> =C2=A0	if (dsi->bridge)
> @@ -1656,9 +1650,6 @@ static void vc4_dsi_unbind(struct device *dev, stru=
ct device *master,
> =C2=A0	 */
> =C2=A0	list_splice_init(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
> =C2=A0	drm_encoder_cleanup(dsi->encoder);
> -
> -	if (dsi->port =3D=3D 1)
> -		vc4->dsi1 =3D NULL;
> =C2=A0}
> =C2=A0
>=20
> =C2=A0static const struct component_ops vc4_dsi_ops =3D {



--=-W310H53AKpoprfZflRY7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl/QrrIACgkQlfZmHno8
x/540wf+ND6znsjHiOM+az4yatUTs5lz/oS/rTm8WkX6vDwo/y0j+4g4zbwqwS9t
DaVWAG/ec5FH2rQhsHC8CYv8Y4bNtkE06xsJuttcqcE+8fJHaYiEUwusBkmyQIhP
JL1Oh90uR98h332leBngUfrK+peoKebbXNc3cuQh0wzZYtEWdFBVubdSBIjvtiU7
H28Y/fXDZ8QKewvB/1OzERWwT6Ho8kgc1HXPOAo7+wROu2XuwoFtKaVf8nRw0ooi
ELs3oftUfkOiid69BZLTjQfZA8r5cgdfAie09llTlAKJZmzPxXLxKNfenCZS5Fjs
slp1uz7UOulgKfa/0CUSo85ZgvIikw==
=/qS2
-----END PGP SIGNATURE-----

--=-W310H53AKpoprfZflRY7--


--===============2119220737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2119220737==--

