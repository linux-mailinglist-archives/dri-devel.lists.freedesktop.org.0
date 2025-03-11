Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0049BA5CA97
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 17:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FB610E270;
	Tue, 11 Mar 2025 16:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tk20rqU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9440F10E229
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 16:17:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A61CDA44224;
 Tue, 11 Mar 2025 16:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC667C4CEEC;
 Tue, 11 Mar 2025 16:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741709831;
 bh=dAacS6pM8DLqKxFPAs1POWYCMSIz8OriSExs4t/LaOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tk20rqU6xAF2qgFtUDzvKzc/ddb0gLaMjtKWiUUihY5eP+co3hVIi2UtIfdXWy5dm
 LnvwX9PHDfrX2VbHON3+ABY/DLdSBTu/7R6oEm8+p66birFi8OqAex749+N0fKugNY
 oSt3pV7tYHebYXOaK+4Iv41FJRSt1k9988czDtzJe+EfyZMW0lixwoEb6iB5WMxNhO
 4IgaqylCwV65/TNlMXwmr/1rRiLu8PMGb00mglEprxtiuK4d0aSrc7YYm+3E4QO6Al
 FqoewVvw+nXYpRhGUmUtPX4e9B7LUA/zPOqbGUQEJ+debksDv89cV9wX3MbrET4HTe
 cEEYXrwKbe0ZQ==
Date: Tue, 11 Mar 2025 17:17:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] drm/tests: hdmi: Add limited range tests for
 YUV420 mode
Message-ID: <20250311-burgundy-cat-of-diversity-b89681@houat>
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
 <20250311-hdmi-conn-yuv-v2-6-fbdb94f02562@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="csssixfkyybruyh2"
Content-Disposition: inline
In-Reply-To: <20250311-hdmi-conn-yuv-v2-6-fbdb94f02562@collabora.com>
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


--csssixfkyybruyh2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 6/7] drm/tests: hdmi: Add limited range tests for
 YUV420 mode
MIME-Version: 1.0

On Tue, Mar 11, 2025 at 12:57:38PM +0200, Cristian Ciocaltea wrote:
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
> index a3f7f3ce31c73335c2c2643bdc5395b6ceb6f071..1df12c0b7768e4f85f4c94384=
0d9b4dcb6e079e0 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -227,6 +227,8 @@ connector_hdmi_init_funcs_set_edid(struct kunit *test,
>  	enc->possible_crtcs =3D drm_crtc_mask(priv->crtc);
> =20
>  	conn =3D &priv->connector;
> +	conn->ycbcr_420_allowed =3D !!(formats & BIT(HDMI_COLORSPACE_YUV420));
> +
>  	ret =3D drmm_connector_hdmi_init(drm, conn,
>  				       "Vendor", "Product",
>  				       &dummy_connector_funcs,
> @@ -751,6 +753,86 @@ static void drm_test_check_broadcast_rgb_limited_cea=
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
> +	priv =3D drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
> +	ret =3D light_up_connector(test, drm, crtc, conn, mode, &ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	state =3D drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +	conn_state->hdmi.broadcast_rgb =3D broadcast_rgb;
> +
> +	ret =3D drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +	KUNIT_ASSERT_EQ(test, conn_state->hdmi.broadcast_rgb, broadcast_rgb);
> +	KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_Y=
UV420);
> +
> +	KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_limited_range);
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +}
> +
> +static const enum drm_hdmi_broadcast_rgb check_broadcast_rgb_cea_mode_yu=
v420_tests[] =3D {
> +	DRM_HDMI_BROADCAST_RGB_AUTO,
> +	DRM_HDMI_BROADCAST_RGB_FULL,
> +	DRM_HDMI_BROADCAST_RGB_LIMITED,
> +};
> +
> +static void
> +check_broadcast_rgb_cea_mode_yuv420_desc(const enum drm_hdmi_broadcast_r=
gb *broadcast_rgb,
> +					 char *desc)
> +{
> +	sprintf(desc, "%s", drm_hdmi_connector_get_broadcast_rgb_name(*broadcas=
t_rgb));
> +}
> +
> +KUNIT_ARRAY_PARAM(check_broadcast_rgb_cea_mode_yuv420,
> +		  check_broadcast_rgb_cea_mode_yuv420_tests,
> +		  check_broadcast_rgb_cea_mode_yuv420_desc);
> +

We need more tests than that to test the various combinations, whether
the fallback to YUV420 should work or not depending on the EDID, the
driver capabilities, YUV420-only vs YUV420-also, etc.

Maxime

--csssixfkyybruyh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ9BiBAAKCRDj7w1vZxhR
xUvlAQDL6N83IyNqafHlo3sadwTdpCNWd+crAmiVsRLfUEdeDgD7BDjL6Nksg1DW
BZWzwo42fBiibREgpgNWMFayg7P33gw=
=9aiN
-----END PGP SIGNATURE-----

--csssixfkyybruyh2--
