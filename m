Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70440A83AA8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 09:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA4410E78B;
	Thu, 10 Apr 2025 07:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V3W3xpkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EB810E78B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 07:18:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 414426112C;
 Thu, 10 Apr 2025 07:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43DFC4CEDD;
 Thu, 10 Apr 2025 07:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744269487;
 bh=RPqTnJ/QuU6c7Vz94rJS5I2gE1lvGYBFuCtJfdTNPUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V3W3xpkBgSMundI1nubCYRb8AJ1P3+3K7anjt2FEl2zGc6GLhDLivFOwuBlu2ZT9K
 yvQVFxLYvyRC9bfYMzyvQdSpSRCnggFqjNidP/6giJhlycRtIvcRUESnqPXNazES0x
 6PgazKW8pEfbioBXbPwekhAD5jjqargS3ERa+GnOdof4kAa+4qBvIczAPKvm6rCZqM
 cqEXghd/caoVElNrgx72mJq5Fk3/sMhZ9qNuXprAEaOTE7mp79ExNzQkpXkQzUBOz2
 YlM6EWOB16fDdfpvb0mnbkkvhT3MJSZ/XoUH4AHFbGJnrCpqjMAYxo6yoQrLTCSt4H
 xArG1GcxFunqg==
Date: Thu, 10 Apr 2025 09:18:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/15] drm/tests: hdmi: Add limited range tests for
 YUV420 mode
Message-ID: <20250410-daffodil-toucanet-of-effort-b4dcbd@houat>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-13-294d3ebbb4b2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iacvktpbodag7b3c"
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-13-294d3ebbb4b2@collabora.com>
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


--iacvktpbodag7b3c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 13/15] drm/tests: hdmi: Add limited range tests for
 YUV420 mode
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:20:02PM +0200, Cristian Ciocaltea wrote:
> Provide tests to verify that drm_atomic_helper_connector_hdmi_check()
> helper behaviour when using YUV420 output format is to always set the
> limited RGB quantization range to 'limited', no matter what the value of
> Broadcast RGB property is.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  89 +++++++++++++++-
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 112 +++++++++++++++=
++++++
>  2 files changed, 196 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 6897515189a0649a267196b246944efc92ace336..3fae7ccf65309a1d8a4acf12d=
e961713b9163096 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -731,6 +731,88 @@ static void drm_test_check_broadcast_rgb_limited_cea=
_mode_vic_1(struct kunit *te
>  	drm_modeset_acquire_fini(&ctx);
>  }
> =20
> +/*
> + * Test that for an HDMI connector, with an HDMI monitor, we will
> + * get a limited RGB Quantization Range with a YUV420 mode, no
> + * matter what the value of the Broadcast RGB property is set to.
> + */
> +static void drm_test_check_broadcast_rgb_cea_mode_yuv420(struct kunit *t=
est)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	enum drm_hdmi_broadcast_rgb broadcast_rgb;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_connector_state *conn_state;
> +	struct drm_atomic_state *state;
> +	struct drm_display_mode *mode;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	broadcast_rgb =3D *(enum drm_hdmi_broadcast_rgb *)test->param_value;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid(test,
> +				BIT(HDMI_COLORSPACE_RGB) |
> +				BIT(HDMI_COLORSPACE_YUV420),
> +				8,
> +				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	drm =3D &priv->drm;
> +	crtc =3D priv->crtc;
> +	conn =3D &priv->connector;
> +	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
> +
> +	mode =3D drm_kunit_display_mode_from_cea_vic(test, drm, 95);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	ret =3D drm_kunit_helper_enable_crtc_connector(test, drm,
> +						     crtc, conn,
> +						     mode, &ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);

drm_kunit_helper_enable_crtc_connector() can return EDEADLK, so you need
to handle it and restart the sequence if it happens.

> +	state =3D drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);

Ditto.

> +	conn_state->hdmi.broadcast_rgb =3D broadcast_rgb;
> +
> +	ret =3D drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);

Ditto, but I'm not sure you need drm_atomic_get_connector_state() here.
We know at this point that the state is there and we don't need to
allocate it anymore. drm_atomic_get_new_connector_state() will probably
be enough, and that one can't return EDEADLK.

Maxime

--iacvktpbodag7b3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/dwqwAKCRDj7w1vZxhR
xUVkAQDPHdzs1uf4gAreGMyea33yc+4ArZelLLVNJA9bDTX2HwD9HVrFce52lhG9
9u/HrTLFeDQND27IlE2UDAnyjOWbfAs=
=eWAt
-----END PGP SIGNATURE-----

--iacvktpbodag7b3c--
