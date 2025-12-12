Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8532CCB869E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 10:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D6110E587;
	Fri, 12 Dec 2025 09:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WxUHWMzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04B010E5C2;
 Fri, 12 Dec 2025 09:19:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 71E02418B3;
 Fri, 12 Dec 2025 09:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05CDC4CEF1;
 Fri, 12 Dec 2025 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765531156;
 bh=rTVFEIXlAg4LKVZxNm5Zj42H5X95E6SJwUkQ3nsB4/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WxUHWMzf+cKqrT/hmU19HU6p9JKSZpHCh0Vh9QdfCoh2bxafgcT3npLlPcUEV2xUp
 1OLeISnrsthiDXk7NmXqos5Wh2OTLSa5DhrIJ/gX7NrQUHlGkylNTyqRbgfTmWOcWP
 yhOHPIRC3ffNYfwJESW5hsnEXBYHuV8i+V9MFWlo5PCn9Kahza4Q9w8cOdKqD6iHhF
 uucV7m+wdXGTqr9aK2Q1bTFLo93QK0jWShlYUKFLkypQuOCzvY6pJYB0fpRf8TkljL
 5NQu8NDLNXcK0wQ6dzCc9Ftgtky/5+7UpTBJpa4dMlju1E9F9zpSzpOMhNIPsOEEaa
 0YEULTJDFf+QA==
Date: Fri, 12 Dec 2025 10:19:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v5 17/17] drm/tests: hdmi: Add tests for the color_format
 property
Message-ID: <20251212-discreet-wisteria-perch-edccad@penduick>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <20251128-color-format-v5-17-63e82f1db1e1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7b5r3ycny55zq4mq"
Content-Disposition: inline
In-Reply-To: <20251128-color-format-v5-17-63e82f1db1e1@collabora.com>
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


--7b5r3ycny55zq4mq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 17/17] drm/tests: hdmi: Add tests for the color_format
 property
MIME-Version: 1.0

On Fri, Nov 28, 2025 at 10:05:53PM +0100, Nicolas Frattaroli wrote:
> Add some KUnit tests to check the color_format property is working as
> expected with the HDMI state helper.
>=20
> The added tests check that AUTO results in RGB, and the YCBCR modes
> result in the corresponding YUV modes. An additional test ensures that
> only DRM_COLOR_FORMAT_AUTO falls back to YUV420 with a YUV420-only mode,
> and RGB errors out instead, while explicitly asking for YUV420 still
> works.
>=20
> This requires exporting hdmi_compute_config, so that it is accessible
> from the tests.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   3 +-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 109 +++++++++++++++=
++++++
>  include/drm/display/drm_hdmi_state_helper.h        |   4 +
>  3 files changed, 115 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 1800e00b30c5..e86fb837ceaf 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -641,7 +641,7 @@ hdmi_compute_format_bpc(const struct drm_connector *c=
onnector,
>  	return -EINVAL;
>  }
> =20
> -static int
> +int
>  hdmi_compute_config(const struct drm_connector *connector,
>  		    struct drm_connector_state *conn_state,
>  		    const struct drm_display_mode *mode)
> @@ -680,6 +680,7 @@ hdmi_compute_config(const struct drm_connector *conne=
ctor,
> =20
>  	return ret;
>  }
> +EXPORT_SYMBOL(hdmi_compute_config);

I don't think we need to export hdmi_compute_config directly, and if we
do, it shouldn't be named that way.

The rest of the tests in the suite manage to test everything fine
without exporting it. Is there any reason you can't do it for these
tests?

>  static int hdmi_generate_avi_infoframe(const struct drm_connector *conne=
ctor,
>  				       struct drm_connector_state *conn_state)
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 8bd412735000..e7050cd9cb12 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -55,6 +55,23 @@ static struct drm_display_mode *find_preferred_mode(st=
ruct drm_connector *connec
>  	return preferred;
>  }
> =20
> +static struct drm_display_mode *find_420_only_mode(struct drm_connector =
*connector)
> +{
> +	struct drm_device *drm =3D connector->dev;
> +	struct drm_display_mode *mode;
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	list_for_each_entry(mode, &connector->modes, head) {
> +		if (drm_mode_is_420_only(&connector->display_info, mode)) {
> +			mutex_unlock(&drm->mode_config.mutex);
> +			return mode;
> +		}
> +	}
> +	mutex_unlock(&drm->mode_config.mutex);
> +
> +	return NULL;
> +}
> +
>  static int set_connector_edid(struct kunit *test, struct drm_connector *=
connector,
>  			      const void *edid, size_t edid_len)
>  {
> @@ -1999,6 +2016,95 @@ static void drm_test_check_disable_connector(struc=
t kunit *test)
>  	drm_modeset_acquire_fini(&ctx);
>  }
> =20
> +struct color_format_test_param {
> +	enum drm_color_format fmt;
> +	enum hdmi_colorspace expected;
> +	const char *desc;
> +};
> +
> +/* Test that AUTO results in RGB, and explicit choices result in those */

We need a bit more details. Which EDID are you using, with which monitor
capabilities?

IIRC, we already have tests to make sure that the fallback happens and
only when it's supposed to. We just need to make sure we have asserts on
the property being auto for those.

This means we only need to test the !auto values, but we need to test it
both ways: that when the property is set and the display supports it,
the format chosen is indeed the one we asked for, but also that when the
property is set but the display doesn't support it, we get an error.

> +static void drm_test_check_hdmi_color_format(struct kunit *test)
> +{
> +	const struct color_format_test_param *param =3D test->param_value;
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector_state *conn_state;
> +	struct drm_display_info *info;
> +	struct drm_display_mode *preferred;
> +	int ret;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> +				BIT(HDMI_COLORSPACE_RGB) |
> +				BIT(HDMI_COLORSPACE_YUV422) |
> +				BIT(HDMI_COLORSPACE_YUV420) |
> +				BIT(HDMI_COLORSPACE_YUV444),
> +				12,
> +				&dummy_connector_hdmi_funcs,
> +				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn_state =3D priv->connector.state;
> +	info =3D &priv->connector.display_info;
> +	conn_state->color_format =3D param->fmt;
> +	KUNIT_ASSERT_TRUE(test, priv->connector.ycbcr_420_allowed);
> +
> +	preferred =3D find_preferred_mode(&priv->connector);
> +	KUNIT_ASSERT_TRUE(test, drm_mode_is_420(info, preferred));
> +
> +	ret =3D hdmi_compute_config(&priv->connector, conn_state, preferred);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, param->expected);
> +}
> +
> +static const struct color_format_test_param hdmi_color_format_params[] =
=3D {
> +	{ DRM_COLOR_FORMAT_AUTO, HDMI_COLORSPACE_RGB, "AUTO -> RGB" },
> +	{ DRM_COLOR_FORMAT_YCBCR422, HDMI_COLORSPACE_YUV422, "YCBCR422 -> YUV42=
2" },
> +	{ DRM_COLOR_FORMAT_YCBCR420, HDMI_COLORSPACE_YUV420, "YCBCR420 -> YUV42=
0" },
> +	{ DRM_COLOR_FORMAT_YCBCR444, HDMI_COLORSPACE_YUV444, "YCBCR444 -> YUV44=
4" },
> +	{ DRM_COLOR_FORMAT_RGB444, HDMI_COLORSPACE_RGB, "RGB -> RGB" },
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(check_hdmi_color_format,
> +		  hdmi_color_format_params, desc);
> +
> +
> +/* Test that AUTO falls back to YUV420, and that RGB does not, but YUV42=
0 works */

Same thing, the description needs to be improved here.

Maxime

--7b5r3ycny55zq4mq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTveEAAKCRAnX84Zoj2+
dhf5AX0axu9eaz5PUFxm9wL8Scfvc12z75lvKpvF0Wa+0bZkHwFULJ8HlYvqkr0u
oaYG9h0Bf0ZRw+vCCL1izypO7FHFjavaMv/SjEhLVwTma92SorSqBsGraXbbXej1
NHkfv9J3OA==
=9ejj
-----END PGP SIGNATURE-----

--7b5r3ycny55zq4mq--
