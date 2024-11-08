Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8B29C1EFC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDCB10E9CA;
	Fri,  8 Nov 2024 14:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o3XGPCC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4E910E9DA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:17:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8698D5C5561;
 Fri,  8 Nov 2024 14:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2001DC4CECD;
 Fri,  8 Nov 2024 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731075445;
 bh=npXiV0Zdu+5mwIgUPe5eyEBvN9gxnHjA1tmkq1U38Bo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o3XGPCC2JeGREj1diLd8DjXPL5g7dqqN8cpW9mAyLRe3KxohBcxZgKKpt/KKGz/TO
 NEVRPu5LgdvaqMberM3f+zOsGsLwq9r5XW7yFO/Z7cvCpP6DfHLL9YSapFmBS3daFA
 Z8rt+4nIVyBhim6feo96bpU3xQjwWqHvEOcv81+edqhjWDW0m2HPu/5JpAbxRUgACO
 LMxMSqHToSdTExMCdA3UAF6X0d13zoGVSK3YJ9T00nAF1ucGJSOIgFi469M3+2adc1
 YUbLVBKc+1pPa3LoTe2jX/7DyPE2+j0SxX4ypoonurRJEDdS26zvqWY78iakCIA/Rp
 Rridz5RCFbe1A==
Date: Fri, 8 Nov 2024 15:17:22 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/6] drm/display: hdmi: add generic mode_valid helper
Message-ID: <20241108-certain-kickass-goshawk-a3c596@houat>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
 <20241101-hdmi-mode-valid-v2-1-a6478fd20fa6@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="djhp567d3zkb2vx4"
Content-Disposition: inline
In-Reply-To: <20241101-hdmi-mode-valid-v2-1-a6478fd20fa6@linaro.org>
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


--djhp567d3zkb2vx4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/6] drm/display: hdmi: add generic mode_valid helper
MIME-Version: 1.0

Hi,

On Fri, Nov 01, 2024 at 02:25:04AM +0200, Dmitry Baryshkov wrote:
> Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
> It can be either used directly or as a part of the .mode_valid callback.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_helper.c          |  45 ++++++
>  drivers/gpu/drm/display/drm_hdmi_helper_internal.h |  11 ++
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  26 +---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 168 +++++++++++++++=
+++++-
>  include/drm/display/drm_hdmi_helper.h              |   4 +
>  5 files changed, 229 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/=
display/drm_hdmi_helper.c
> index 74dd4d01dd9bb2c9e69ec1c60b0056bd69417e8a..560c5d4365ca54d3f66939534=
9cedfd6f75fa033 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> @@ -9,6 +9,8 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_property.h>
> =20
> +#include "drm_hdmi_helper_internal.h"
> +
>  static inline bool is_eotf_supported(u8 output_eotf, u8 sink_eotf)
>  {
>  	return sink_eotf & BIT(output_eotf);
> @@ -256,3 +258,46 @@ drm_hdmi_compute_mode_clock(const struct drm_display=
_mode *mode,
>  	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
>  }
>  EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
> +
> +enum drm_mode_status
> +__drm_hdmi_connector_clock_valid(const struct drm_connector *connector,
> +				 const struct drm_display_mode *mode,
> +				 unsigned long long clock)
> +{
> +	const struct drm_connector_hdmi_funcs *funcs =3D connector->hdmi.funcs;
> +	const struct drm_display_info *info =3D &connector->display_info;
> +
> +	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (funcs && funcs->tmds_char_rate_valid) {
> +		enum drm_mode_status status;
> +
> +		status =3D funcs->tmds_char_rate_valid(connector, mode, clock);
> +		if (status !=3D MODE_OK)
> +			return status;
> +	}
> +
> +	return MODE_OK;
> +}
> +
> +/**
> + * drm_hdmi_connector_mode_valid() - Check if mode is valid for HDMI con=
nector
> + * @connector: DRM connector to validate the mode
> + * @mode: Display mode to validate
> + *
> + * Generic .mode_valid implementation for HDMI connectors.
> + */
> +enum drm_mode_status
> +drm_hdmi_connector_mode_valid(struct drm_connector *connector,
> +			      struct drm_display_mode *mode)
> +{
> +	unsigned long long clock;
> +
> +	clock =3D drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> +	if (!clock)
> +		return MODE_ERROR;
> +
> +	return __drm_hdmi_connector_clock_valid(connector, mode, clock);
> +}
> +EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);

It's not clear to me why you want to place it in drm_hdmi_helper? It's
relying quite heavily on the HDMI infrastructure, so it would make more
sense to me that it would be part of drm_hdmi_state_helper.c.

> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 34ee95d41f2966ab23a60deb37d689430f6b0985..8640e7280053bd95852f53b92=
159f493b141f2bf 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -43,10 +43,12 @@ struct drm_atomic_helper_connector_hdmi_priv {
>  static struct drm_display_mode *find_preferred_mode(struct drm_connector=
 *connector)
>  {
>  	struct drm_device *drm =3D connector->dev;
> -	struct drm_display_mode *mode, *preferred;
> +	struct drm_display_mode *mode, *preferred =3D NULL;
> =20
>  	mutex_lock(&drm->mode_config.mutex);
> -	preferred =3D list_first_entry(&connector->modes, struct drm_display_mo=
de, head);
> +	if (!list_empty(&connector->modes))
> +		preferred =3D list_first_entry(&connector->modes, struct drm_display_m=
ode, head);
> +

What is this fixing?

>  	list_for_each_entry(mode, &connector->modes, head)
>  		if (mode->type & DRM_MODE_TYPE_PREFERRED)
>  			preferred =3D mode;
> @@ -125,6 +127,18 @@ static const struct drm_connector_hdmi_funcs reject_=
connector_hdmi_funcs =3D {
>  	.tmds_char_rate_valid	=3D reject_connector_tmds_char_rate_valid,
>  };
> =20
> +static enum drm_mode_status
> +reject_100MHz_connector_tmds_char_rate_valid(const struct drm_connector =
*connector,
> +					     const struct drm_display_mode *mode,
> +					     unsigned long long tmds_rate)
> +{
> +	return (tmds_rate > 100ULL * 1000 * 1000) ? MODE_BAD : MODE_OK;
> +}
> +
> +static const struct drm_connector_hdmi_funcs reject_100_MHz_connector_hd=
mi_funcs =3D {
> +	.tmds_char_rate_valid	=3D reject_100MHz_connector_tmds_char_rate_valid,
> +};
> +
>  static int dummy_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct drm_atomic_helper_connector_hdmi_priv *priv =3D
> @@ -147,6 +161,33 @@ static int dummy_connector_get_modes(struct drm_conn=
ector *connector)
>  static const struct drm_connector_helper_funcs dummy_connector_helper_fu=
ncs =3D {
>  	.atomic_check	=3D drm_atomic_helper_connector_hdmi_check,
>  	.get_modes	=3D dummy_connector_get_modes,
> +	.mode_valid		=3D drm_hdmi_connector_mode_valid,
> +};
> +
> +static int dummy_connector_get_modes_100MHz_max_clock(struct drm_connect=
or *connector)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv =3D
> +		connector_to_priv(connector);
> +	const struct drm_edid *edid;
> +	unsigned int num_modes;
> +
> +	edid =3D drm_edid_alloc(priv->current_edid, priv->current_edid_len);
> +	if (!edid)
> +		return -EINVAL;
> +
> +	drm_edid_connector_update(connector, edid);
> +	connector->display_info.max_tmds_clock =3D 100 * 1000;
> +	num_modes =3D drm_edid_connector_add_modes(connector);
> +
> +	drm_edid_free(edid);
> +
> +	return num_modes;
> +}
> +
> +static const struct drm_connector_helper_funcs dummy_connector_helper_fu=
ncs_max_tmds_clock =3D {
> +	.atomic_check	=3D drm_atomic_helper_connector_hdmi_check,
> +	.get_modes	=3D dummy_connector_get_modes_100MHz_max_clock,
> +	.mode_valid		=3D drm_hdmi_connector_mode_valid,
>  };
> =20
>  static void dummy_hdmi_connector_reset(struct drm_connector *connector)
> @@ -1734,9 +1775,132 @@ static struct kunit_suite drm_atomic_helper_conne=
ctor_hdmi_reset_test_suite =3D {
>  	.test_cases	=3D drm_atomic_helper_connector_hdmi_reset_tests,
>  };
> =20
> +static void drm_test_check_mode_valid(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector *conn;
> +	struct drm_display_mode *preferred;
> +
> +	priv =3D drm_atomic_helper_connector_hdmi_init(test,
> +						     BIT(HDMI_COLORSPACE_RGB),
> +						     8);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn =3D &priv->connector;
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 1920);
> +	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 1080);
> +	KUNIT_EXPECT_EQ(test, preferred->clock, 148500);
> +}
> +
> +static void drm_test_check_mode_valid_reject(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector *conn;
> +	struct drm_display_mode *preferred;
> +	struct drm_device *drm;
> +	int ret;
> +
> +	priv =3D drm_atomic_helper_connector_hdmi_init(test,
> +						     BIT(HDMI_COLORSPACE_RGB),
> +						     8);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn =3D &priv->connector;
> +
> +	/* You shouldn't be doing that at home. */
> +	conn->hdmi.funcs =3D &reject_connector_hdmi_funcs;
> +
> +	priv->current_edid =3D test_edid_hdmi_1080p_rgb_max_200mhz;
> +	priv->current_edid_len =3D ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200m=
hz);
> +
> +	drm =3D &priv->drm;
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	ret =3D conn->funcs->fill_modes(conn, 4096, 4096);
> +	mutex_unlock(&drm->mode_config.mutex);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NULL(test, preferred);
> +}
> +
> +static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector *conn;
> +	struct drm_display_mode *preferred;
> +	int ret;
> +
> +	priv =3D drm_atomic_helper_connector_hdmi_init(test,
> +						     BIT(HDMI_COLORSPACE_RGB),
> +						     8);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn =3D &priv->connector;
> +
> +	/* You shouldn't be doing that at home. */
> +	conn->hdmi.funcs =3D &reject_100_MHz_connector_hdmi_funcs;
> +
> +	ret =3D set_connector_edid(test, conn,
> +				 test_edid_hdmi_1080p_rgb_max_200mhz,
> +				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
> +	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
> +	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
> +}
> +
> +static void drm_test_check_mode_valid_reject_max_clock(struct kunit *tes=
t)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector *conn;
> +	struct drm_display_mode *preferred;
> +	int ret;
> +
> +	priv =3D drm_atomic_helper_connector_hdmi_init(test,
> +						     BIT(HDMI_COLORSPACE_RGB),
> +						     8);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn =3D &priv->connector;
> +
> +	drm_connector_helper_add(conn, &dummy_connector_helper_funcs_max_tmds_c=
lock);
> +
> +	ret =3D set_connector_edid(test, conn,
> +				 test_edid_hdmi_1080p_rgb_max_200mhz,
> +				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
> +	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
> +	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
> +}
> +
> +static struct kunit_case drm_atomic_helper_connector_hdmi_mode_valid_tes=
ts[] =3D {
> +	KUNIT_CASE(drm_test_check_mode_valid),
> +	KUNIT_CASE(drm_test_check_mode_valid_reject),
> +	KUNIT_CASE(drm_test_check_mode_valid_reject_rate),
> +	KUNIT_CASE(drm_test_check_mode_valid_reject_max_clock),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_atomic_helper_connector_hdmi_mode_valid_te=
st_suite =3D {
> +	.name		=3D "drm_atomic_helper_connector_hdmi_mode_valid",
> +	.test_cases	=3D drm_atomic_helper_connector_hdmi_mode_valid_tests,
> +};
> +

We need some documentation for these tests too, and what you're trying
to test exactly with that 100MHz cutout.

Maxime

--djhp567d3zkb2vx4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZy4dbQAKCRAnX84Zoj2+
djiJAX4vy2JId0Es+ece492YhmY1L4zYjTAxwEad3K4thxyZbXbrtmHVnhvXmKDI
CSsFHNEBf3bkff69Gkk2n7nYVNRtgi7KmEwxvDo9Y1KIL24mAv3ubFgJ51FVaPIl
8LuFnarhSA==
=Zhra
-----END PGP SIGNATURE-----

--djhp567d3zkb2vx4--
