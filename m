Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7AAA5CA7B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 17:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9574E10E29F;
	Tue, 11 Mar 2025 16:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KM0sz2kL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1013E10E29F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 16:12:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 19E5E5C6409;
 Tue, 11 Mar 2025 16:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEA8C4CEE9;
 Tue, 11 Mar 2025 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741709565;
 bh=Vv+W8BWsFIppfBrJLl0xt21IvxzSdTfjfugnv+BbV0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KM0sz2kLlgIEOGF3OtSqFogA8Rmo8q8WX37MYFiIEKqkHGKYSaY7bTOBsT/xXLh/Q
 wfUFMWhut+plVI6fu95jyUAjRsllmezflUIEg+AqBA5UpdmCE1Y18mPoGtte9V39hL
 WilpP39C5rm3SxsmxmLnX5CT0zFbsz8Q0tEp9/839Qjukp3cvmhxbhW8xdN0G0X+WK
 3myKIRnSTXnuExb9sVqvX8HodJn1scg5rBf6654KrdBTOWkse3hdGwsIL/xtJGWJkG
 exFtj9Gng4QHT/Vg4f8wdzpC+CIEorxtqjQ+Uopa6J4y0MnunpbBLoAYuK5FFGCvti
 HJ6Ef3L3cy5Fw==
Date: Tue, 11 Mar 2025 17:12:42 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] drm/tests: hdmi: Add macros to simplify EDID setup
Message-ID: <20250311-spiritual-hornet-of-prestige-ef4132@houat>
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
 <20250311-hdmi-conn-yuv-v2-5-fbdb94f02562@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ehgan4hodvsqo6jl"
Content-Disposition: inline
In-Reply-To: <20250311-hdmi-conn-yuv-v2-5-fbdb94f02562@collabora.com>
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


--ehgan4hodvsqo6jl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/7] drm/tests: hdmi: Add macros to simplify EDID setup
MIME-Version: 1.0

On Tue, Mar 11, 2025 at 12:57:37PM +0200, Cristian Ciocaltea wrote:
> Introduce a few macros to facilitate setting custom (i.e. non-default)
> EDID data during connector initialization.
>=20
> This helps reducing boilerplate code while also drops some redundant
> calls to set_connector_edid().
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 245 ++++++++-------=
------
>  1 file changed, 93 insertions(+), 152 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index e97efd3af9ed18e6cf8ee66b4923dfc805b34e19..a3f7f3ce31c73335c2c2643bd=
c5395b6ceb6f071 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -183,10 +183,12 @@ static const struct drm_connector_funcs dummy_conne=
ctor_funcs =3D {
> =20
>  static
>  struct drm_atomic_helper_connector_hdmi_priv *
> -drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
> -					   unsigned int formats,
> -					   unsigned int max_bpc,
> -					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
> +connector_hdmi_init_funcs_set_edid(struct kunit *test,
> +				   unsigned int formats,
> +				   unsigned int max_bpc,
> +				   const struct drm_connector_hdmi_funcs *hdmi_funcs,
> +				   const char *edid_data,
> +				   size_t edid_len)
>  {
>  	struct drm_atomic_helper_connector_hdmi_priv *priv;
>  	struct drm_connector *conn;
> @@ -240,30 +242,27 @@ drm_kunit_helper_connector_hdmi_init_funcs(struct k=
unit *test,
> =20
>  	drm_mode_config_reset(drm);
> =20
> +	if (edid_data && edid_len) {
> +		ret =3D set_connector_edid(test, &priv->connector, edid_data, edid_len=
);
> +		KUNIT_ASSERT_GT(test, ret, 0);
> +	}
> +
>  	return priv;
>  }
> =20
> -static
> -struct drm_atomic_helper_connector_hdmi_priv *
> -drm_kunit_helper_connector_hdmi_init(struct kunit *test,
> -				     unsigned int formats,
> -				     unsigned int max_bpc)
> -{
> -	struct drm_atomic_helper_connector_hdmi_priv *priv;
> -	int ret;
> +#define drm_kunit_helper_connector_hdmi_init_funcs_set_edid(test, format=
s, max_bpc, funcs, edid) \
> +	connector_hdmi_init_funcs_set_edid(test, formats, max_bpc, funcs, edid,=
 ARRAY_SIZE(edid))
> =20
> -	priv =3D drm_kunit_helper_connector_hdmi_init_funcs(test,
> -							  formats, max_bpc,
> -							  &dummy_connector_hdmi_funcs);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
> +#define drm_kunit_helper_connector_hdmi_init_funcs(test, formats, max_bp=
c, funcs)		\
> +	connector_hdmi_init_funcs_set_edid(test, formats, max_bpc, funcs, NULL,=
 0)
> =20
> -	ret =3D set_connector_edid(test, &priv->connector,
> -				 test_edid_hdmi_1080p_rgb_max_200mhz,
> -				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
> -	KUNIT_ASSERT_GT(test, ret, 0);
> +#define drm_kunit_helper_connector_hdmi_init_set_edid(test, formats, max=
_bpc, edid)		\
> +	drm_kunit_helper_connector_hdmi_init_funcs_set_edid(test, formats, max_=
bpc,		\
> +							    &dummy_connector_hdmi_funcs, edid)
> =20
> -	return priv;
> -}
> +#define drm_kunit_helper_connector_hdmi_init(test, formats, max_bpc)				\
> +	drm_kunit_helper_connector_hdmi_init_set_edid(test, formats, max_bpc,		=
	\
> +						      test_edid_hdmi_1080p_rgb_max_200mhz)

I'd really prefer to have functions to macros here. They are easier to
read, extend, and don't have any particular drawbacks.

I also don't think we need that many, looking at the tests:

  - We need drm_kunit_helper_connector_hdmi_init() to setup a connector
    with test_edid_hdmi_1080p_rgb_max_200mhz and
    dummy_connector_hdmi_funcs()

  - We need to create a
    drm_kunit_helper_connector_hdmi_init_with_edid_funcs() to pass both
    the funcs and edid pointers

And that's it, right?

>  /*
>   * Test that if we change the RGB quantization property to a different
> @@ -771,19 +770,15 @@ static void drm_test_check_output_bpc_crtc_mode_cha=
nged(struct kunit *test)
>  	struct drm_crtc *crtc;
>  	int ret;
> =20
> -	priv =3D drm_kunit_helper_connector_hdmi_init(test,
> -						    BIT(HDMI_COLORSPACE_RGB),
> -						    10);
> +	priv =3D drm_kunit_helper_connector_hdmi_init_set_edid(test,
> +				BIT(HDMI_COLORSPACE_RGB),
> +				10,
> +				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);

I think that convertion should be part of another patch.

Maxime

--ehgan4hodvsqo6jl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ9Bg+gAKCRDj7w1vZxhR
xZ0RAP9ZOjOoFg8CpHr2Bi37SQdP5J9ZAOHIW8zTNCC42bKF4QD/UBVPIUNL6Bc7
5qTju7pvnBUnivSNbLt4ywKJ7QsASAo=
=VrjK
-----END PGP SIGNATURE-----

--ehgan4hodvsqo6jl--
