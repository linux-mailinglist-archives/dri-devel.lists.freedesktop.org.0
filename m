Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081BA826BCD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 11:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEE610E177;
	Mon,  8 Jan 2024 10:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31C310E07F;
 Mon,  8 Jan 2024 10:47:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0515160ED0;
 Mon,  8 Jan 2024 10:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517DBC433C8;
 Mon,  8 Jan 2024 10:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704710852;
 bh=dmaBrp9KY2QVBWgy7KW3qoX2FUl+4p1SCBb6S4fQ9Lk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SVhRemVpxFamoIn708UyKd9RW/PtshX20Q3yPAGUxhzPNPZy/srq/ea54Do4J6C7M
 xu5deaDoadRKYOXj3Klc6A4wAsHFepMOnkMfJdZrJ8/Rnxro7FtTXORggn5x/Ajnie
 sux0WaiMwa7zVnO7rXmwt4fn6ZyWZ4uceKRAce9Jmr5oAQH5xgafKou3xHiOcwEqcT
 ZHSGbMRaoncCvvOkWbd7Tz/DQ3nOfEg8T4H6FR30nRwISiJ+5CJFe+PafWM3RvcwDX
 3K+8sq9lQDXmVrsTbaquTqo9dbp73wirKng6y5qMByWFX4khpMjLFlzsIAE5JXmRrA
 WW5Z1vX55tbSg==
Date: Mon, 8 Jan 2024 11:47:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v4 4/6] drm/tests: managed: Add comments and expect fail
 messages
Message-ID: <3shr5njdajcgjc5ogaf2bgbnmd4mzhjmhmhzhngawsft4cpkf3@txec5av6wsfa>
References: <20240105101324.26811-1-michal.winiarski@intel.com>
 <20240105101324.26811-5-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lukyo5knmjm62jpd"
Content-Disposition: inline
In-Reply-To: <20240105101324.26811-5-michal.winiarski@intel.com>
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
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org, Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lukyo5knmjm62jpd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2024 at 11:13:22AM +0100, Micha=C5=82 Winiarski wrote:
> Add comments explaining the intention behind the test and certain
> implementation details related to device lifetime.
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/tests/drm_managed_test.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/t=
ests/drm_managed_test.c
> index e4790ae838ba7..986a38c9144a5 100644
> --- a/drivers/gpu/drm/tests/drm_managed_test.c
> +++ b/drivers/gpu/drm/tests/drm_managed_test.c
> @@ -19,6 +19,10 @@ static void drm_action(struct drm_device *drm, void *p=
tr)
>  	priv->action_done =3D true;
>  }
> =20
> +/*
> + * The test verifies that the release action is called automatically whe=
n the
> + * device is released.
> + */
>  static void drm_test_managed_run_action(struct kunit *test)
>  {
>  	struct managed_test_priv *priv;
> @@ -32,6 +36,11 @@ static void drm_test_managed_run_action(struct kunit *=
test)
>  	dev =3D drm_kunit_helper_alloc_device(test);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> =20
> +	/*
> +	 * DRM device can't be embedded in priv, since priv->action_done needs
> +	 * to remain allocated beyond both parent device and drm_device
> +	 * lifetime.
> +	 */
>  	drm =3D __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0,=
 DRIVER_MODESET);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
> =20
> @@ -44,7 +53,7 @@ static void drm_test_managed_run_action(struct kunit *t=
est)
>  	drm_dev_unregister(drm);
>  	drm_kunit_helper_free_device(test, dev);
> =20
> -	KUNIT_EXPECT_TRUE(test, priv->action_done);
> +	KUNIT_EXPECT_TRUE_MSG(test, priv->action_done, "Release action was not =
called");

I'm fine with the other two comments, but I'm not really sure what that
message brings to the table. It should be pretty obvious from the
function name, variable name and comments already.

Maxime

--lukyo5knmjm62jpd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZvSwQAKCRDj7w1vZxhR
xSZBAP4ptsPag+C91bzoIBqAmBdTbkAsS5CeGNI1w24L6aauQwD/ZYhmou/zzgCe
UloSBBNotq1rzb92bPzOnzdZcU0fyw4=
=vGjv
-----END PGP SIGNATURE-----

--lukyo5knmjm62jpd--
