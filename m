Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0E1A10E1F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 18:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CDA10E3F7;
	Tue, 14 Jan 2025 17:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RR5ANG8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8724410E3F7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 17:48:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 89E6DA4190A;
 Tue, 14 Jan 2025 17:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F322AC4CEDD;
 Tue, 14 Jan 2025 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736876901;
 bh=ReEvutLUNBrKUqbYwUgL4AaEgaDl+0Mo8nAOAWGVGQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RR5ANG8WOfVOM8zc7wSfqgfR/XxhjJyde/DAAb1oi5hOHP59HsLCEkJlxLT9sfYqo
 6fL+kvvzAYTSV0zwx1OGskkvxGFrP80jPH3iJHDPy9yIx2kbvE0leO2utqRI0eA5dR
 ujfBlFocuM2lIrsSN8LyTenzmYvT6JiN8GEGJII16FAki+xF8u9JPlSq4nTC+kgX/r
 8nx9KIeVFf2+PjEIal8zZE0OjVst8T9jxvt67KX/ikhioVT6ReuplIo20ebIMatko4
 axqWWbw4tZu8pdfYvsG472M2tX6+zVDnb72c4lBA/tu9JNSlxY5zU2SObKpOeIQYFG
 4hu9D7yyQWSVA==
Date: Tue, 14 Jan 2025 18:48:18 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v2 2/2] drm/tests: hdmi: Add connector disablement test
Message-ID: <20250114-voracious-melodic-partridge-60aebd@houat>
References: <20250110084821.3239518-1-victor.liu@nxp.com>
 <20250110084821.3239518-3-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nn6bgf2xstftnujg"
Content-Disposition: inline
In-Reply-To: <20250110084821.3239518-3-victor.liu@nxp.com>
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


--nn6bgf2xstftnujg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] drm/tests: hdmi: Add connector disablement test
MIME-Version: 1.0

On Fri, Jan 10, 2025 at 04:48:21PM +0800, Liu Ying wrote:
> Atomic check should succeed when disabling a connector. Add a test
> case drm_test_check_disabling_connector() to make sure of this.
>=20
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * New patch to add the test case. (Dmitry)
>=20
>  .../drm/tests/drm_hdmi_state_helper_test.c    | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index c3b693bb966f..8f7a39c9a1bb 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -1568,6 +1568,57 @@ static void drm_test_check_output_bpc_format_displ=
ay_8bpc_only(struct kunit *tes
>  	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_R=
GB);
>  }
> =20
> +/* Test that atomic check succeeds when disabling a connector. */
> +static void drm_test_check_disabling_connector(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx *ctx;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
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
> +	ctx =3D drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +	conn =3D &priv->connector;
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
> +	crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +	crtc_state->active =3D false;
> +	ret =3D drm_atomic_set_mode_for_crtc(crtc_state, NULL);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +	ret =3D drm_atomic_set_crtc_for_connector(conn_state, NULL);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	ret =3D drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +}
> +
>  static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] =
=3D {
>  	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode),
>  	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode_vic_1),
> @@ -1605,6 +1656,7 @@ static struct kunit_case drm_atomic_helper_connecto=
r_hdmi_check_tests[] =3D {
>  	 * picked up aside from changing the BPC or mode which would
>  	 * already trigger a mode change.
>  	 */
> +	KUNIT_CASE(drm_test_check_disabling_connector),

I've changed slightly that test name (s/disabling/disable/) to make it
consistent with the rest when applying, and ordered it alphabetically.
Thanks!

Maxime

--nn6bgf2xstftnujg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4ajYgAKCRAnX84Zoj2+
dlKcAX4yYBJRr1MygPbb1tTv3FnEIhsIDeA8CXtTVPYu0zrgUxVZKPt5E0lFMslK
f+WbU30BgLsW9m8Ez4uH+lBAsNtVHpTOVco/40WqSKVULimx0N4cJBHy9OPdYNpU
lp+d+UgDJA==
=5uFn
-----END PGP SIGNATURE-----

--nn6bgf2xstftnujg--
