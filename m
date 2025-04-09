Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA8A829BB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA62E10E919;
	Wed,  9 Apr 2025 15:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qGAsuyCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5BA10E919
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:15:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4952C440F0;
 Wed,  9 Apr 2025 15:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DC9C4CEE2;
 Wed,  9 Apr 2025 15:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744211718;
 bh=+hr1leVk+vEvAiLuvc2P3kcQ9inzGoIyYb2ePAU5BBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qGAsuyCFY9mN4YiIigVo0qC9BC11jhzYB7tXR1yoN/jJmvi7Wy7Z63vhfpidEZ558
 tzgLqdBNY36YQ7DIymQaMlsN24/kqBLhYQmhHDuvcshbIsvCCogn6CuwOQn9EeL6vN
 gDlbb1FgQ9DyNLs48Y5BfJjiA8cGbw0ZuM049hOWvVg4sMOBfbQiNeVh6VHlZOEaVZ
 xfRaVKRteNNwQYaQhT1xtrTMqOY4e0B5C99dcmY5zAQVHp1L00cMu5NhDfNM/v4PcJ
 PPHUhwdcEKTlWPYskKJZ2J3KPvAhRDz+JgPIrwOSf0wP6YPl7g2NB9u9Jxs6GizuyQ
 zMQr6QuXsg4JA==
Date: Wed, 9 Apr 2025 17:15:16 +0200
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
Subject: Re: [PATCH v3 10/15] drm/tests: hdmi: Replace open coded EDID setup
Message-ID: <20250409-spectral-persimmon-gorilla-4827ad@houat>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-10-294d3ebbb4b2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hyq7kc3elzthcf4g"
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-10-294d3ebbb4b2@collabora.com>
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


--hyq7kc3elzthcf4g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 10/15] drm/tests: hdmi: Replace open coded EDID setup
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:19:59PM +0200, Cristian Ciocaltea wrote:
> Make use of the recently introduced macros to reduce boilerplate code
> around EDID setup. This also helps dropping the redundant calls to
> set_connector_edid().
>=20
> No functional changes intended.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 220 ++++++++-------=
------
>  1 file changed, 78 insertions(+), 142 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 284bd9b1418a454d05c4a38263519eb8ae450090..7b2aaee5009ce58e6edf2649e=
2182c43ba834523 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -751,19 +751,15 @@ static void drm_test_check_output_bpc_crtc_mode_cha=
nged(struct kunit *test)
>  	struct drm_crtc *crtc;
>  	int ret;
> =20
> -	priv =3D drm_kunit_helper_connector_hdmi_init(test,
> -						    BIT(HDMI_COLORSPACE_RGB),
> -						    10);
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid(test,
> +				BIT(HDMI_COLORSPACE_RGB),
> +				10,
> +				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
>  	KUNIT_ASSERT_NOT_NULL(test, priv);
> =20
>  	drm =3D &priv->drm;
>  	crtc =3D priv->crtc;
>  	conn =3D &priv->connector;
> -	ret =3D set_connector_edid(test, conn,
> -				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
> -				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
> -	KUNIT_ASSERT_GT(test, ret, 0);
> -

Yeah, ok, nvm what I said on the previous patch, it's needed.

>  	preferred =3D find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
> =20
> @@ -830,19 +826,15 @@ static void drm_test_check_output_bpc_crtc_mode_not=
_changed(struct kunit *test)
>  	struct drm_crtc *crtc;
>  	int ret;
> =20
> -	priv =3D drm_kunit_helper_connector_hdmi_init(test,
> -						    BIT(HDMI_COLORSPACE_RGB),
> -						    10);
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid(test,
> +				BIT(HDMI_COLORSPACE_RGB),
> +				10,
> +				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);

Alignment is off.

Maxime

--hyq7kc3elzthcf4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/aPBAAKCRDj7w1vZxhR
xc0XAP9a63kRQwFIOR8U0+DDlR4KQjNFtiXjm4xBOWVEheu3HwD/Wc4jrx4iQgQE
DXP1igU/FIQ1fA7j/37yxVx4SuH7AQc=
=8z5y
-----END PGP SIGNATURE-----

--hyq7kc3elzthcf4g--
