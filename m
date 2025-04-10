Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3B8A83E5C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8001110E2B1;
	Thu, 10 Apr 2025 09:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VNGNo81G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E707110E2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:21:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BFC105C4964;
 Thu, 10 Apr 2025 09:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28655C4CEDD;
 Thu, 10 Apr 2025 09:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744276883;
 bh=1rOZ6n546c/Vow+AbiFEcm+j1AVgdBOMTM24Q9DKhyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VNGNo81G6X5eKl1W9ENtuaAvfVGfqCwicipWmRyz/7mED+zpiD7LKiTUytvtYZFRz
 hWvBZ5HG74rldEtBziE5uLOlKnpFN7kUe5kvebIL6hjfwErV3vnHiRxtz7F0Sp0RWc
 4ucFs7+psu1frE28L3uF6hpnKxIgAWHXLgReLqlbbAnSz4oS8WYc6cscfp9yK/SWlG
 dPRD3EA79j8C70/Es+h8xGWOkxAKk6YzrJbfEEepJZB3PZ139aeCpRRxWZc31tOtIr
 SFLkGg25pftcl4lRG/L4DiGk+sYPT7gH6B9uJuQOj0Lp9MFtBSt/9oP4Z+m41M15yO
 WNqdn0G/Jv18g==
Date: Thu, 10 Apr 2025 11:21:20 +0200
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
Subject: Re: [PATCH v3 15/15] drm/tests: hdmi: Add test for unsuccessful
 forced fallback to YUV420
Message-ID: <20250410-singing-scarlet-carp-d136f9@houat>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-15-294d3ebbb4b2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5ld6zqabluy4kzlv"
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-15-294d3ebbb4b2@collabora.com>
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


--5ld6zqabluy4kzlv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 15/15] drm/tests: hdmi: Add test for unsuccessful
 forced fallback to YUV420
MIME-Version: 1.0

Hi,

On Wed, Mar 26, 2025 at 12:20:04PM +0200, Cristian Ciocaltea wrote:
> Provide test to verify a forced fallback to YUV420 output cannot succeed
> when driver doesn't advertise YUV420 support.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 46 ++++++++++++++++=
++++++
>  1 file changed, 46 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 99bedb2d6f555b3b140256000dfa7491d2a8f515..c2976b42aa2aacd2a68a871bf=
fe97e795ca713d4 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -1493,6 +1493,51 @@ static void drm_test_check_max_tmds_rate_format_fa=
llback_yuv420(struct kunit *te
>  	drm_modeset_acquire_fini(&ctx);
>  }
> =20
> +/*
> + * Test that if a driver supports only RGB, but the chosen mode can be
> + * supported by the screen only in YUV420 output format, we end up with
> + * an unsuccessful forced fallback attempt.

What do you mean by "forced"?

> + */
> +static void drm_test_check_driver_unsupported_fallback_yuv420(struct kun=
it *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_display_info *info;
> +	struct drm_display_mode *yuv420_only_mode;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid(test,
> +				BIT(HDMI_COLORSPACE_RGB),
> +				12,
> +				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	drm =3D &priv->drm;
> +	crtc =3D priv->crtc;
> +	conn =3D &priv->connector;
> +	info =3D &conn->display_info;
> +	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
> +	KUNIT_ASSERT_FALSE(test, conn->ycbcr_420_allowed);
> +
> +	yuv420_only_mode =3D drm_kunit_display_mode_from_cea_vic(test, drm, 95);
> +	KUNIT_ASSERT_NOT_NULL(test, yuv420_only_mode);
> +	KUNIT_ASSERT_TRUE(test, drm_mode_is_420_only(info, yuv420_only_mode));
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	ret =3D drm_kunit_helper_enable_crtc_connector(test, drm,
> +						     crtc, conn,
> +						     yuv420_only_mode,
> +						     &ctx);
> +	KUNIT_EXPECT_LT(test, ret, 0);

I think that's where your current approach falls a bit short. You should
really craft the state yourself and check the returned value of
drm_atomic_check_only(), not rely on
drm_kunit_helper_enable_crtc_connector() doing the right thing, when it
doesn't really tell you :)

> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +}
> +

We still need to do the same with a driver that supports both, but the
monitor doesn't.

Maxime

--5ld6zqabluy4kzlv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/eNjwAKCRDj7w1vZxhR
xSKiAQDkonxN60rz0JspyRR0uvsBoq64KXR4Thvx3Z/3zkrEigEA+UTBeBBhzess
N1PNe2Ay/+jreFxiZR9K5z4jOlxhfA4=
=JsA3
-----END PGP SIGNATURE-----

--5ld6zqabluy4kzlv--
