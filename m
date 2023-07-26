Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE845763455
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 12:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397AF10E459;
	Wed, 26 Jul 2023 10:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A45110E458
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 10:55:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qOcAE-0007Wi-1w; Wed, 26 Jul 2023 12:54:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qOcA9-002DKt-3e; Wed, 26 Jul 2023 12:54:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qOcA8-007usd-AZ; Wed, 26 Jul 2023 12:54:36 +0200
Date: Wed, 26 Jul 2023 12:54:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Zhu Wang <wangzhu9@huawei.com>
Subject: Re: [PATCH -next] drm/bridge: fix -Wunused-const-variable= warning
Message-ID: <20230726105436.h3kqtjzbhvjrg6kp@pengutronix.de>
References: <20230726100626.167490-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n566atc4ik7hamup"
Content-Disposition: inline
In-Reply-To: <20230726100626.167490-1-wangzhu9@huawei.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: kabel@kernel.org, neil.armstrong@linaro.org, benjamin.mugnier@foss.st.com,
 mripard@kernel.org, rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, duwe@suse.de,
 javierm@redhat.com, jernej.skrabec@gmail.com, dianders@chromium.org,
 anarsoul@gmail.com, Arnd Bergmann <arnd@arndb.de>,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--n566atc4ik7hamup
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Cc +=3D Arnd, Andy who did similar changes in the past]

Hello,

On Wed, Jul 26, 2023 at 06:06:26PM +0800, Zhu Wang wrote:
> When building with W=3D1, the following warning occurs.
>=20
> drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:48:17: warning: =E2=80=
=98anx781x_i2c_addresses=E2=80=99 defined but not used [-Wunused-const-vari=
able=3D]
>  static const u8 anx781x_i2c_addresses[] =3D {
>                  ^~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:40:17: warning: =E2=80=
=98anx7808_i2c_addresses=E2=80=99 defined but not used [-Wunused-const-vari=
able=3D]
>  static const u8 anx7808_i2c_addresses[] =3D {
>=20
> The definition of above two data variables is included by the
> macro CONFIG_OF, so we also include the data variable
> definitions in the macro CONFIG_OF. And in addition the data
> variable anx78xx_match_table is included in the macro CONFIG_OF,
> so we add CONFIG_OF to the place where it is used.
>=20
> Fixes: 5d97408e0d70 ("drm/bridge: move ANA78xx driver to analogix subdire=
ctory")
>=20
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers=
/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 06a3e3243e19..799b33cebdd5 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -37,6 +37,7 @@
> =20
>  #define XTAL_CLK		270 /* 27M */
> =20
> +#if IS_ENABLED(CONFIG_OF)
>  static const u8 anx7808_i2c_addresses[] =3D {
>  	[I2C_IDX_TX_P0] =3D 0x78,
>  	[I2C_IDX_TX_P1] =3D 0x7a,
> @@ -52,6 +53,7 @@ static const u8 anx781x_i2c_addresses[] =3D {
>  	[I2C_IDX_RX_P0] =3D 0x7e,
>  	[I2C_IDX_RX_P1] =3D 0x80,
>  };
> +#endif

You can mark anx7808_i2c_addresses with __maybe_unused, then the #if
isn't needed.

>  struct anx78xx_platform_data {
>  	struct regulator *dvdd10;
> @@ -1387,7 +1389,9 @@ MODULE_DEVICE_TABLE(of, anx78xx_match_table);
>  static struct i2c_driver anx78xx_driver =3D {
>  	.driver =3D {
>  		   .name =3D "anx7814",
> +#if IS_ENABLED(CONFIG_OF)
>  		   .of_match_table =3D of_match_ptr(anx78xx_match_table),
> +#endif

If CONFIG_OF is disabled of_match_ptr(something) evaluates to NULL, so
you can drop the #if here.

Having said that the better fix is probably to just do

	.of_match_table =3D anx78xx_match_table,

as systems using ACPI can benefit from the of_match_table, too.
See b89a9e9890d4 ("gpio: aggregator: Remove CONFIG_OF and of_match_ptr()
protections") for an example.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--n566atc4ik7hamup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmTA+2sACgkQj4D7WH0S
/k5IkQf/UiCNWdf5PQ12tW8jtHdordqEjaTmwCkuIwlNiTVWG9BTSeTBXebKEiJQ
O5Be9nB362lFl/t8RO/qjuV1/yZ5Kyj93Ytd4BVoO57eMGiJTIyc1agnb9Fy0xry
WFMqBlhl8Q6o+Zt+pzB9K1dtfKZWb4bL8yTItsYcs1J1FzHi6+72/BbK1749Jqjl
y4jOCO7jm1TNR5YB1wGr7h+Mq7DIcIb3JUq2JjSucFbJ5TCAGtxVN03knQlLZ5Oi
azm0Uwn9pqQa2iyGuiprICP1ZM5d16Oqo++TiwLWPUfl05EtFVwaNFqmV9XMCTET
YPBu6FUJrkuDmyLCnxGdTPSdwlZjww==
=rwcQ
-----END PGP SIGNATURE-----

--n566atc4ik7hamup--
