Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908C6766947
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADDC10E023;
	Fri, 28 Jul 2023 09:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FB110E06F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:49:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qPK5u-0001Jj-EN; Fri, 28 Jul 2023 11:49:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qPK5n-002g3u-Jg; Fri, 28 Jul 2023 11:49:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qPK5m-008Spn-RG; Fri, 28 Jul 2023 11:49:02 +0200
Date: Fri, 28 Jul 2023 11:49:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Zhu Wang <wangzhu9@huawei.com>
Subject: Re: [PATCH -next v2] drm/bridge: fix -Wunused-const-variable= warning
Message-ID: <20230728094902.cthnfoa5znnht5mc@pengutronix.de>
References: <20230728091208.45506-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m76qh45nffv6qqsv"
Content-Disposition: inline
In-Reply-To: <20230728091208.45506-1-wangzhu9@huawei.com>
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
Cc: penguin-kernel@I-love.SAKURA.ne.jp, dri-devel@lists.freedesktop.org,
 sebastian.reichel@collabora.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, drinkcat@chromium.org, rfoss@kernel.org,
 a-bhatia1@ti.com, javierm@redhat.com, jernej.skrabec@gmail.com,
 tomi.valkeinen@ti.com, treding@nvidia.com, nikhil.nd@ti.com,
 tzimmermann@suse.de, arnd@arndb.de, jonas@kwiboo.se, neil.armstrong@linaro.org,
 dmitry.torokhov@gmail.com, dianders@chromium.org, luzmaximilian@gmail.com,
 peda@axentia.se, eballetbo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--m76qh45nffv6qqsv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 05:12:08PM +0800, Zhu Wang wrote:
> When building with W=3D1, the following warning occurs.
>=20
> drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:48:17: warning: =E2=80=
=98anx781x_i2c_addresses=E2=80=99 defined but not used [-Wunused-const-vari=
able=3D]  static const u8 anx781x_i2c_addresses[] =3D {
>                  ^~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:40:17: warning: =E2=80=
=98anx7808_i2c_addresses=E2=80=99 defined but not used [-Wunused-const-vari=
able=3D]  static const u8 anx7808_i2c_addresses[] =3D {
>=20
> When CONFIG_IO is disabled, above two variables are not used,
> since the place where it is used is inclueded in the macro
> CONFIG_OF.
>=20
> The drivers under the directory drivers/gpu/drm/bridge depends
> on the macro CONFIG_OF, it is not necessary to use CONFIG_OF
> or of_match_ptr in related files in this directory, so we just
> remove them all.
>=20
> Fixes: 0647e7dd3f7a ("drm/bridge: Add Analogix anx78xx support")
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
>=20
> Changes in v2
> - remove CONFIG_OF and of_match_ptr in following files:
>   drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
>   drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>   drivers/gpu/drm/bridge/chrontel-ch7033.c
>   drivers/gpu/drm/bridge/sil-sii8620.c
>   drivers/gpu/drm/bridge/ti-tfp410.c
> ---

Note that the changelog between patch series version usually goes below
the triple-dash.

Otherwise looks good to me,
Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--m76qh45nffv6qqsv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmTDjw0ACgkQj4D7WH0S
/k62vwgAlxqTmjI1ccBbFyijUpVHYPqq22PRYEmYrxOameZLphg4ioYXbnple4C0
Y1mFEiiIzjdq2xC2TqDtxVrqUS6YkRVMxeM3os3PC8b1TULqBU8UzcH7Fp70YhOZ
ouAENFEpRRKxnijtXMub1VU5c9bU3wDaEMpH3OoGn8zp9hgzmeIcfaatrEy4OgQ6
HsBZLY7LjktoH8lm9Ns0E845W0oqT7CfEtPq0aB9aWLCVcx6je1DBHHAVaKSbLtR
miyBTn9CwM5h9PFxPSmAHT8uHAP2NK/OI0WyrFU4DMGjseYnsQLhm0diiYg9+oOo
oL+jIMRQbkWydohChfQCBSL0+7Xkag==
=dAwV
-----END PGP SIGNATURE-----

--m76qh45nffv6qqsv--
