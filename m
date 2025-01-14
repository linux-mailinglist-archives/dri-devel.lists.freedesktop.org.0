Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7E9A10DF4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 18:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D25610E44E;
	Tue, 14 Jan 2025 17:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h9Xcymd+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368ED10E452
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 17:41:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F0885A41587;
 Tue, 14 Jan 2025 17:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E3FC4CEDD;
 Tue, 14 Jan 2025 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736876463;
 bh=NGdcjsaTGwFBPV6RjjZcaVo+BPeZfxxGO4N3r0WMXgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h9Xcymd+6MD4YeRqNJ0GPbInRAcnGqK4aWfDSm/L7+rwH9rakyHOLU5sEGxrFo2lx
 5CzYeDRvAoP5ou+XauTYm1XgTLWc0Y1MaXwIqABsXr3I/GMPYysMRHqvgmkE0OzJJ6
 4VTHOt/if9Dh4QOTSemPXF9vXGrOV5MMctMgZRG1YNWofpyHtkOFM9H5wPqPsHEt4L
 xzV07SPl5fE8MfREY+c2/zm4koQwSihkH5NWuoGmuHOHHDZTatP+UlsCbXcbzoqfE1
 C6V6jyahujvQAP3YLMC6uVZnnI1AWaiKhNt7LRbRv1Trca9ytZl3c3jP0AXlmbO9+7
 DUCKPUvfUQ4dQ==
Date: Tue, 14 Jan 2025 18:41:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/tests: hdmi: Add connector's CRTC
 deactivation tests
Message-ID: <20250114-silky-nippy-woodlouse-0f6d4a@houat>
References: <20250109-hdmi-conn-null-mode-v2-0-9eeaf1109547@collabora.com>
 <20250109-hdmi-conn-null-mode-v2-2-9eeaf1109547@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="r4wrewugdpgyh7r3"
Content-Disposition: inline
In-Reply-To: <20250109-hdmi-conn-null-mode-v2-2-9eeaf1109547@collabora.com>
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


--r4wrewugdpgyh7r3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] drm/tests: hdmi: Add connector's CRTC
 deactivation tests
MIME-Version: 1.0

Hi,

On Thu, Jan 09, 2025 at 12:03:40AM +0200, Cristian Ciocaltea wrote:
> Following up a fixed bug in drm_atomic_helper_connector_hdmi_check(),
> discovered while unloading a DRM module, add a couple of tests to make
> sure the helper will not exhibit any abnormal behaviour for use cases
> that involve shutting down the connector's CRTC.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 173 +++++++++++++++=
++++++
>  1 file changed, 173 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index c3b693bb966f1f8b04066d19f520bfa4bf11c23d..98187ecee5d77b5f758af29f4=
c4bfddbd1f658fd 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -1568,6 +1568,177 @@ static void drm_test_check_output_bpc_format_disp=
lay_8bpc_only(struct kunit *tes
>  	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_R=
GB);
>  }
> =20
> +/*
> + * Test that if we deactivate connector's CRTC, we trigger a mode change
> + * on that CRTC, along with setting {connectors|active}_changed.
> + */
> +static void drm_test_check_crtc_deactivate_mode_changed(struct kunit *te=
st)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx *ctx;
> +	struct drm_connector_state *old_conn_state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc_state *old_crtc_state;
> +	struct drm_crtc_state *new_crtc_state;
> +	struct drm_atomic_state *state;
> +	struct drm_display_mode *preferred;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init(test,
> +						    BIT(HDMI_COLORSPACE_RGB),
> +						    8);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn =3D &priv->connector;
> +	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
> +
> +	ctx =3D drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	drm =3D &priv->drm;
> +	crtc =3D priv->crtc;
> +	ret =3D light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	state =3D drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	old_conn_state =3D drm_atomic_get_old_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +	new_crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
> +
> +	old_crtc_state =3D drm_atomic_get_old_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_crtc_state);
> +
> +	ret =3D drm_atomic_set_mode_for_crtc(new_crtc_state, NULL);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	KUNIT_ASSERT_NE(test, old_crtc_state->enable, new_crtc_state->enable);
> +
> +	new_crtc_state->active =3D false;
> +	KUNIT_ASSERT_NE(test, old_crtc_state->active, new_crtc_state->active);
> +
> +	ret =3D drm_atomic_set_crtc_for_connector(new_conn_state, NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	KUNIT_ASSERT_PTR_NE(test, old_conn_state->crtc, new_conn_state->crtc);
> +
> +	ret =3D drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	new_crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
> +	KUNIT_EXPECT_TRUE(test, new_crtc_state->mode_changed);
> +	KUNIT_EXPECT_TRUE(test, new_crtc_state->connectors_changed);
> +	KUNIT_EXPECT_TRUE(test, new_crtc_state->active_changed);
> +}

This one looks good to me

> +/*
> + * Test that if we deactivate connector's CRTC, while changing the max
> + * bpc property to a different value, will not have any effect on the
> + * output bpc property. However, we still trigger a mode change on that
> + * CRTC, along with setting {connectors|active}_changed.
> + */
> +static void drm_test_check_crtc_deactivate_output_bpc_not_changed(struct=
 kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx *ctx;
> +	struct drm_connector_state *old_conn_state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc_state *old_crtc_state;
> +	struct drm_crtc_state *new_crtc_state;
> +	struct drm_atomic_state *state;
> +	struct drm_display_mode *preferred;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init(test,
> +						    BIT(HDMI_COLORSPACE_RGB),
> +						    10);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn =3D &priv->connector;
> +	ret =3D set_connector_edid(test, conn,
> +				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
> +				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
> +	KUNIT_ASSERT_GT(test, ret, 0);
> +
> +	ctx =3D drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	drm =3D &priv->drm;
> +	crtc =3D priv->crtc;
> +	ret =3D light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	state =3D drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	old_conn_state =3D drm_atomic_get_old_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +	new_conn_state->max_requested_bpc =3D 8;
> +
> +	KUNIT_ASSERT_NE(test,
> +			old_conn_state->max_requested_bpc,
> +			new_conn_state->max_requested_bpc);
> +
> +	new_crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
> +
> +	old_crtc_state =3D drm_atomic_get_old_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_crtc_state);
> +
> +	ret =3D drm_atomic_set_mode_for_crtc(new_crtc_state, NULL);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	KUNIT_ASSERT_NE(test, old_crtc_state->enable, new_crtc_state->enable);
> +
> +	new_crtc_state->active =3D false;
> +	KUNIT_ASSERT_NE(test, old_crtc_state->active, new_crtc_state->active);
> +
> +	ret =3D drm_atomic_set_crtc_for_connector(new_conn_state, NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	KUNIT_ASSERT_PTR_NE(test, old_conn_state->crtc, new_conn_state->crtc);
> +
> +	ret =3D drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	old_conn_state =3D drm_atomic_get_old_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +	new_conn_state =3D drm_atomic_get_new_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	KUNIT_EXPECT_EQ(test,
> +			old_conn_state->hdmi.output_bpc,
> +			new_conn_state->hdmi.output_bpc);
> +
> +	new_crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
> +	KUNIT_EXPECT_TRUE(test, new_crtc_state->mode_changed);
> +	KUNIT_EXPECT_TRUE(test, new_crtc_state->connectors_changed);
> +	KUNIT_EXPECT_TRUE(test, new_crtc_state->active_changed);
> +}
> +

However, it's not clear to me why changing bpc should change anything,
or why it's worth testing?

Maxime

--r4wrewugdpgyh7r3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4ahrAAKCRAnX84Zoj2+
dnO7AX9kbFCWn8HSLo3zxzwKXr1ehzbpmDrn+ZZBTd7VqinEPi4p+c5dqrZJ4sNo
lfjMEKUBgJmjA55ffFIhUO1L9qQEGuwNrNlWDHhCGjZGMWLhDV8epgHdLduIvqts
SQydPfUMPg==
=aJAU
-----END PGP SIGNATURE-----

--r4wrewugdpgyh7r3--
