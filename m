Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2AEABB78A
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 10:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B68510E231;
	Mon, 19 May 2025 08:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ruo60tw3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D27510E231
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:42:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 262D25C0F67;
 Mon, 19 May 2025 08:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE772C4CEE4;
 Mon, 19 May 2025 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747644160;
 bh=+03kt9iwtLbG5099ncvcgBRXBcr3CMG+xuHJpXjVv8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ruo60tw34zleKTt4jpUqfFIJ3YMcB6k/v+uuq3cOv/rMDR3RnaOVZyEtJ4734/L3E
 +EkCePqWJBJHrJQPrIlBrQtPFSyt9DGBzarHT4rYTGE06RNeUuufcGFHLYxV8p9Ecw
 Un2quvG4Yg/hYIB1CoTUlveWIZno3351Jfk0Qvi2PRhIyPFO1lcSsrk9VpOxnrCgjv
 QJ7F99dUA6Zphj32joniv6FSThYfSMeDX5Xl+myxNH1711W+EI9gQJ+h9Hr14wD5eB
 I7X0FyI0VfAIzJKW/CwMDSl9J2VAtx1mFE7aDhsnD2mWywA9WIGm49Uzfk7dHXHe8V
 cBYQ72jCr/LZw==
Date: Mon, 19 May 2025 10:42:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 23/23] drm/tests: hdmi: Add test for unsupported
 RGB/YUV420 mode
Message-ID: <20250519-classy-millipede-of-competence-4bb6ad@houat>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-23-5e55e2aaa3fa@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="itn5qs25mfwdt27d"
Content-Disposition: inline
In-Reply-To: <20250425-hdmi-conn-yuv-v4-23-5e55e2aaa3fa@collabora.com>
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


--itn5qs25mfwdt27d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 23/23] drm/tests: hdmi: Add test for unsupported
 RGB/YUV420 mode
MIME-Version: 1.0

Hi,

On Fri, Apr 25, 2025 at 01:27:14PM +0300, Cristian Ciocaltea wrote:
> Provide a test to verify that if both driver and screen support RGB and
> YUV420 formats, drm_atomic_helper_connector_hdmi_check() cannot succeed
> when trying to set a mode unsupported by the display.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 66 ++++++++++++++++=
++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index d79084cfb516b69c4244098c0767d604ad02f2c3..6337a1c52b86810c638f446c4=
995e7ee63dbc084 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -1622,6 +1622,71 @@ static void drm_test_check_driver_unsupported_fall=
back_yuv420(struct kunit *test
>  	drm_modeset_acquire_fini(&ctx);
>  }
> =20
> +/*
> + * Test that if a driver and screen supports RGB and YUV420 formats, but=
 the
> + * chosen mode cannot be supported by the screen, we end up with unsucce=
ssful
> + * fallback attempts.
> + */
> +static void drm_test_check_display_unsupported_fallback_rgb_yuv420(struc=
t kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_atomic_state *state;
> +	struct drm_display_info *info;
> +	struct drm_display_mode *preferred, *unsupported_mode;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> +				BIT(HDMI_COLORSPACE_RGB) |
> +				BIT(HDMI_COLORSPACE_YUV420),
> +				10,
> +				&dummy_connector_hdmi_funcs,
> +				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	drm =3D &priv->drm;
> +	crtc =3D priv->crtc;
> +	conn =3D &priv->connector;
> +	info =3D &conn->display_info;
> +	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
> +	KUNIT_ASSERT_TRUE(test, conn->ycbcr_420_allowed);
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	unsupported_mode =3D drm_kunit_display_mode_from_cea_vic(test, drm, 96);
> +	KUNIT_ASSERT_NOT_NULL(test, unsupported_mode);

I'm not sure what this one is supposed to test. If the mode is
unsupported by the screen, it will be for both YUV and RGB, right? So
what are we testing here?

Maxime

--itn5qs25mfwdt27d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCru/QAKCRAnX84Zoj2+
dpkPAX9GdEFrGMnaPgHsQYafngD7rrP1g7XAmzcFOpgFYItZhI1qolmUM49ckdRB
yBw98JEBfjSASo48jnLPA51hoO+zrUdLQpRH8EB3d50j+yyodfMb5jxLo1SqUfCF
Y6qeLcFhyw==
=4oAs
-----END PGP SIGNATURE-----

--itn5qs25mfwdt27d--
