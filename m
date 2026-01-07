Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F2CCFDA13
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3A010E5A2;
	Wed,  7 Jan 2026 12:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J0nSTSyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185C210E5A1;
 Wed,  7 Jan 2026 12:23:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AA406407DE;
 Wed,  7 Jan 2026 12:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF50FC4CEF7;
 Wed,  7 Jan 2026 12:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767788615;
 bh=T/cjhFB51SISxj4fnymPs7QhWK6NI0j3bfSS88pre7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J0nSTSyN3enTWg40xoiktROKvtQvPV+nSkU4c7WwItGVjWZzL7eABERYDtRJPFwOn
 TtJ1yv/xXlpSBO2jvsEzLSYHcLz6lSVXJ0BMOBCrosbSdDb2MaxDkqZJHkZ9Yfoh3s
 X0VpJS7RCvC8bopN2WzFm87Qf6ozQDOfcmkYbOWdZop0Mpt49aMmtsTXt+Iy/3NUgq
 jBJbYkL3i9h3nJjeCllPMwqkvpigSdWDTZ1Fs2MaN3RK4K3wrSRJQAFwt8T2dwtwyx
 yoIzPweH0enZY9VtVp9Cs/jMOLPfB/QJ1EW0PDj1tDamo5iG0/v2FYoRA3HRc3lraj
 26xu4WFvUvvsw==
Date: Wed, 7 Jan 2026 13:23:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 01/10] drm/tests: hdmi: check the infoframes behaviour
Message-ID: <20260107-white-ape-of-culture-cd46f3@penduick>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
 <20251224-limit-infoframes-2-v3-1-7fd3cacfefed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4rsiinaxqk6us3ah"
Content-Disposition: inline
In-Reply-To: <20251224-limit-infoframes-2-v3-1-7fd3cacfefed@oss.qualcomm.com>
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


--4rsiinaxqk6us3ah
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/10] drm/tests: hdmi: check the infoframes behaviour
MIME-Version: 1.0

On Wed, Dec 24, 2025 at 03:02:50AM +0200, Dmitry Baryshkov wrote:
> Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> unsupported doesn't result in a commit error. Also check that HDR and
> Audio InfoFrames are not triggered if corresponding features are not
> enabled.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/tests/drm_client_modeset_test.c    |   3 +
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 485 +++++++++++++++=
++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 119 +++++
>  3 files changed, 607 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gp=
u/drm/tests/drm_client_modeset_test.c
> index 3f44fe5e92e4..ec58fe064d86 100644
> --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> @@ -5,6 +5,7 @@
> =20
>  #include <kunit/test.h>
> =20
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_drv.h>
> @@ -48,6 +49,8 @@ static const struct drm_connector_helper_funcs drm_clie=
nt_modeset_connector_help
>  };
> =20
>  static const struct drm_connector_funcs drm_client_modeset_connector_fun=
cs =3D {
> +	.atomic_destroy_state   =3D drm_atomic_helper_connector_destroy_state,
> +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state
>  };
> =20
>  static int drm_client_modeset_test_init(struct kunit *test)
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 8bd412735000..bdf14a0623b2 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -40,6 +40,9 @@ struct drm_atomic_helper_connector_hdmi_priv {
>  #define connector_to_priv(c) \
>  	container_of_const(c, struct drm_atomic_helper_connector_hdmi_priv, con=
nector)
> =20
> +#define encoder_to_priv(e) \
> +	container_of_const(e, struct drm_atomic_helper_connector_hdmi_priv, enc=
oder)
> +
>  static struct drm_display_mode *find_preferred_mode(struct drm_connector=
 *connector)
>  {
>  	struct drm_device *drm =3D connector->dev;
> @@ -138,6 +141,24 @@ static const struct drm_connector_funcs dummy_connec=
tor_funcs =3D {
>  	.reset			=3D dummy_hdmi_connector_reset,
>  };
> =20
> +static int hdmi_update_failures;

It looks like it's only ever used between atomic_enable and the test
itself. Any reason we don't add it to
drm_atomic_helper_connector_hdmi_priv ?

That way, we wouldn't have to deal with the previous state, it's all
local to the test.

> +static void test_encoder_atomic_enable(struct drm_encoder *encoder,
> +			      struct drm_atomic_state *state)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv =3D
> +		encoder_to_priv(encoder);
> +	int ret;
> +
> +	ret =3D drm_atomic_helper_connector_hdmi_update_infoframes(&priv->conne=
ctor, state);
> +	if (ret)
> +		hdmi_update_failures++;
> +}
> +
> +static const struct drm_encoder_helper_funcs test_encoder_helper_funcs =
=3D {
> +	.atomic_enable =3D test_encoder_atomic_enable,
> +};
> +
>  static
>  struct drm_atomic_helper_connector_hdmi_priv *
>  __connector_hdmi_init(struct kunit *test,
> @@ -2323,10 +2344,474 @@ static struct kunit_suite drm_atomic_helper_conn=
ector_hdmi_mode_valid_test_suite
>  	.test_cases	=3D drm_atomic_helper_connector_hdmi_mode_valid_tests,
>  };
> =20
> +/*
> + * Test that the default behaviour works without errors.
> + */

The default behaviour can change. We should document what our
expectations are here, so something like "we expect the infoframes
related hooks to be called without error" or something.

> +static void drm_test_check_infoframes(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_atomic_state *state;
> +	struct drm_display_mode *preferred;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int old_hdmi_update_failures;
> +	int ret;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> +				BIT(HDMI_COLORSPACE_RGB),
> +				8,
> +				&dummy_connector_hdmi_funcs,
> +				test_edid_hdmi_1080p_rgb_max_200mhz);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	drm =3D &priv->drm;
> +	crtc =3D priv->crtc;
> +	conn =3D &priv->connector;
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	ret =3D drm_kunit_helper_enable_crtc_connector(test, drm,
> +						     crtc, conn,
> +						     preferred,
> +						     &ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	state =3D drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +	crtc_state->mode_changed =3D true;
> +
> +	old_hdmi_update_failures =3D hdmi_update_failures;
> +
> +	ret =3D drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D drm_atomic_commit(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	KUNIT_ASSERT_EQ(test, old_hdmi_update_failures, hdmi_update_failures);
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +}
> +
> +static int reject_avi_infoframe_write_infoframe(struct drm_connector *co=
nnector,
> +						enum hdmi_infoframe_type type,
> +						const u8 *buffer, size_t len)
> +{
> +	if (type =3D=3D HDMI_INFOFRAME_TYPE_AVI)
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
> +static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_f=
uncs =3D {
> +	.write_infoframe =3D reject_avi_infoframe_write_infoframe,
> +};
> +
> +/*
> + * Test that the rejection of AVI InfoFrame results in the failure of
> + * drm_atomic_helper_connector_hdmi_update_infoframes().
> + */
> +static void drm_test_check_reject_avi_infoframe(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_display_mode *preferred;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int old_hdmi_update_failures;
> +	int ret;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> +				BIT(HDMI_COLORSPACE_RGB),
> +				8,
> +				&reject_avi_infoframe_hdmi_funcs,
> +				test_edid_hdmi_1080p_rgb_max_200mhz);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	drm =3D &priv->drm;
> +	crtc =3D priv->crtc;
> +	conn =3D &priv->connector;
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	ret =3D drm_kunit_helper_enable_crtc_connector(test, drm,
> +						     crtc, conn,
> +						     preferred,
> +						     &ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
> +
> +	state =3D drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +	crtc_state->mode_changed =3D true;
> +
> +	old_hdmi_update_failures =3D hdmi_update_failures;
> +
> +	ret =3D drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D drm_atomic_commit(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	KUNIT_ASSERT_NE(test, old_hdmi_update_failures, hdmi_update_failures);

I'd say we expect it to be greater than old_hdmi_update_failures. We
also shouldn't really use ASSERT here, but rather EXPECT.

We should also handle EDEADLK.

> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +}
> +
> +static int reject_hdr_infoframe_write_infoframe(struct drm_connector *co=
nnector,
> +						enum hdmi_infoframe_type type,
> +						const u8 *buffer, size_t len)
> +{
> +	if (type =3D=3D HDMI_INFOFRAME_TYPE_DRM)
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
> +static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_f=
uncs =3D {
> +	.write_infoframe =3D reject_hdr_infoframe_write_infoframe,
> +};
> +
> +/*
> + * Test that the HDR InfoFrame isn't programmed in
> + * drm_atomic_helper_connector_hdmi_update_infoframes() if the max_bpc i=
s 8.
> + */
> +static void drm_test_check_reject_hdr_infoframe_bpc_8(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_display_mode *preferred;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int old_hdmi_update_failures;
> +	int ret;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> +				BIT(HDMI_COLORSPACE_RGB),
> +				8,
> +				&reject_hdr_infoframe_hdmi_funcs,
> +				test_edid_hdmi_1080p_rgb_max_200mhz_hdr);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	drm =3D &priv->drm;
> +	crtc =3D priv->crtc;
> +	conn =3D &priv->connector;
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	ret =3D drm_kunit_helper_enable_crtc_connector(test, drm,
> +						     crtc, conn,
> +						     preferred,
> +						     &ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
> +
> +	state =3D drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +	/* Verify that there is no HDR property, so "userspace" can't set it. */
> +	for (int i =3D 0; i < conn->base.properties->count; i++)
> +		KUNIT_ASSERT_PTR_NE(test,
> +				    drm->mode_config.hdr_output_metadata_property,
> +				    conn->base.properties->properties[i]);
> +
> +	crtc_state->mode_changed =3D true;
> +
> +	old_hdmi_update_failures =3D hdmi_update_failures;
> +
> +	ret =3D drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D drm_atomic_commit(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	KUNIT_ASSERT_EQ(test, old_hdmi_update_failures, hdmi_update_failures);
> +
> +	new_conn_state =3D conn->state;
> +	KUNIT_ASSERT_NOT_NULL(test, new_conn_state);
> +
> +	KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.output_bpc, 8);
> +	KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.infoframes.hdr_drm.set, fals=
e);
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +}
> +
> +/*
> + * Test that the rejection of HDR InfoFrame results in the failure of
> + * drm_atomic_helper_connector_hdmi_update_infoframes() in the high bpc =
is
> + * supported.
> + */
> +static void drm_test_check_reject_hdr_infoframe_bpc_10(struct kunit *tes=
t)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_display_mode *preferred;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int old_hdmi_update_failures;
> +	struct hdr_output_metadata hdr_data;
> +	struct drm_property_blob *hdr_blob;
> +	bool replaced;
> +	int ret;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> +				BIT(HDMI_COLORSPACE_RGB),
> +				10,
> +				&reject_hdr_infoframe_hdmi_funcs,
> +				test_edid_hdmi_1080p_rgb_max_200mhz_hdr);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	drm =3D &priv->drm;
> +	crtc =3D priv->crtc;
> +	conn =3D &priv->connector;
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	ret =3D drm_kunit_helper_enable_crtc_connector(test, drm,
> +						     crtc, conn,
> +						     preferred,
> +						     &ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
> +
> +	state =3D drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +	hdr_data.metadata_type =3D HDMI_STATIC_METADATA_TYPE1;
> +	hdr_data.hdmi_metadata_type1.eotf =3D HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
> +	hdr_data.hdmi_metadata_type1.metadata_type =3D HDMI_STATIC_METADATA_TYP=
E1;
> +
> +	hdr_blob =3D drm_property_create_blob(drm, sizeof(hdr_data), &hdr_data);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hdr_blob);
> +
> +	ret =3D drm_property_replace_blob_from_id(drm,
> +						&new_conn_state->hdr_output_metadata,
> +						hdr_blob->base.id,
> +						sizeof(struct hdr_output_metadata), -1,
> +						&replaced);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_ASSERT_EQ(test, replaced, true);
> +
> +	crtc_state->mode_changed =3D true;
> +
> +	old_hdmi_update_failures =3D hdmi_update_failures;
> +
> +	ret =3D drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D drm_atomic_commit(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	KUNIT_ASSERT_NE(test, old_hdmi_update_failures, hdmi_update_failures);
> +
> +	new_conn_state =3D conn->state;
> +	KUNIT_ASSERT_NOT_NULL(test, new_conn_state);
> +
> +	KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.output_bpc, 10);
> +	KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.infoframes.hdr_drm.set, true=
);
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +}
> +
> +static int reject_audio_infoframe_write_infoframe(struct drm_connector *=
connector,
> +						  enum hdmi_infoframe_type type,
> +						  const u8 *buffer, size_t len)
> +{
> +	if (type =3D=3D HDMI_INFOFRAME_TYPE_AUDIO)
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
> +static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi=
_funcs =3D {
> +	.write_infoframe =3D reject_audio_infoframe_write_infoframe,
> +};
> +
> +/*
> + * Test that Audio InfoFrame is only programmed if we call a correspondi=
ng API,
> + * thus the drivers can safely assume that they won't get Audio InfoFram=
es if
> + * they don't call it.
> + */
> +static void drm_test_check_reject_audio_infoframe(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_display_mode *preferred;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int old_hdmi_update_failures;
> +	struct hdmi_audio_infoframe cea;
> +	int ret;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> +				BIT(HDMI_COLORSPACE_RGB),
> +				8,
> +				&reject_audio_infoframe_hdmi_funcs,
> +				test_edid_hdmi_1080p_rgb_max_200mhz);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	drm =3D &priv->drm;
> +	crtc =3D priv->crtc;
> +	conn =3D &priv->connector;
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	ret =3D drm_kunit_helper_enable_crtc_connector(test, drm,
> +						     crtc, conn,
> +						     preferred,
> +						     &ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
> +
> +	state =3D drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +	crtc_state->mode_changed =3D true;
> +
> +	old_hdmi_update_failures =3D hdmi_update_failures;
> +
> +	ret =3D drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D drm_atomic_commit(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	KUNIT_ASSERT_EQ(test, old_hdmi_update_failures, hdmi_update_failures);
> +
> +	/*
> +	 * So, it works without Audio InfoFrame, let's fail with it in place,
> +	 * checking that writing the infofraem actually gets triggered.
> +	 */
> +
> +	hdmi_audio_infoframe_init(&cea);
> +	cea.channels =3D 2;
> +	cea.coding_type =3D HDMI_AUDIO_CODING_TYPE_STREAM;
> +	cea.sample_size =3D HDMI_AUDIO_SAMPLE_SIZE_STREAM;
> +	cea.sample_frequency =3D HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
> +
> +	ret =3D drm_atomic_helper_connector_hdmi_update_audio_infoframe(conn, &=
cea);
> +	KUNIT_ASSERT_EQ(test, ret, -EOPNOTSUPP);
> +
> +	state =3D drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state =3D drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +	crtc_state->mode_changed =3D true;
> +
> +	old_hdmi_update_failures =3D hdmi_update_failures;
> +
> +	ret =3D drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D drm_atomic_commit(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	KUNIT_ASSERT_NE(test, old_hdmi_update_failures, hdmi_update_failures);
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +}
> +
> +
> +static struct kunit_case drm_atomic_helper_connector_hdmi_infoframes_tes=
ts[] =3D {
> +	KUNIT_CASE(drm_test_check_infoframes),
> +	KUNIT_CASE(drm_test_check_reject_avi_infoframe),
> +	KUNIT_CASE(drm_test_check_reject_hdr_infoframe_bpc_8),
> +	KUNIT_CASE(drm_test_check_reject_hdr_infoframe_bpc_10),
> +	KUNIT_CASE(drm_test_check_reject_audio_infoframe),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_atomic_helper_connector_hdmi_infoframes_te=
st_suite =3D {
> +	.name		=3D "drm_atomic_helper_connector_hdmi_infoframes",
> +	.test_cases	=3D drm_atomic_helper_connector_hdmi_infoframes_tests,
> +};
> +
>  kunit_test_suites(
>  	&drm_atomic_helper_connector_hdmi_check_test_suite,
>  	&drm_atomic_helper_connector_hdmi_reset_test_suite,
>  	&drm_atomic_helper_connector_hdmi_mode_valid_test_suite,
> +	&drm_atomic_helper_connector_hdmi_infoframes_test_suite,
>  );
> =20
>  MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
> diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tes=
ts/drm_kunit_edid.h
> index c59c8528a3f7..f4923157f5bf 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_edid.h
> +++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
> @@ -293,6 +293,125 @@ static const unsigned char test_edid_hdmi_1080p_rgb=
_max_200mhz[] =3D {
>  	0x00, 0x00, 0x00, 0xfc
>  };
> =20
> +/*
> + * edid-decode (hex):
> + *
> + * 00 ff ff ff ff ff ff 00 31 d8 2a 00 00 00 00 00
> + * 00 21 01 03 81 a0 5a 78 02 00 00 00 00 00 00 00
> + * 00 00 00 20 00 00 01 01 01 01 01 01 01 01 01 01
> + * 01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
> + * 45 00 40 84 63 00 00 1e 00 00 00 fc 00 54 65 73
> + * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 32
> + * 46 1e 46 0f 00 0a 20 20 20 20 20 20 00 00 00 10
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 92
> + *
> + * 02 03 1c 81 e3 05 c0 20 41 10 e2 00 4a 67 03 0c
> + * 00 12 34 00 28 e6 06 05 01 52 52 51 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 4e
> + *
> + * ----------------
> + *
> + * Block 0, Base EDID:
> + *   EDID Structure Version & Revision: 1.3
> + *   Vendor & Product Identification:
> + *     Manufacturer: LNX
> + *     Model: 42
> + *     Made in: 2023
> + *   Basic Display Parameters & Features:
> + *     Digital display
> + *     DFP 1.x compatible TMDS
> + *     Maximum image size: 160 cm x 90 cm
> + *     Gamma: 2.20
> + *     Monochrome or grayscale display
> + *     First detailed timing is the preferred timing
> + *   Color Characteristics:
> + *     Red  : 0.0000, 0.0000
> + *     Green: 0.0000, 0.0000
> + *     Blue : 0.0000, 0.0000
> + *     White: 0.0000, 0.0000
> + *   Established Timings I & II:
> + *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.1=
75000 MHz
> + *   Standard Timings: none
> + *   Detailed Timing Descriptors:
> + *     DTD 1:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.5000=
00 MHz (1600 mm x 900 mm)
> + *                  Hfront   88 Hsync  44 Hback  148 Hpol P
> + *                  Vfront    4 Vsync   5 Vback   36 Vpol P
> + *     Display Product Name: 'Test EDID'
> + *     Display Range Limits:
> + *       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150=
 MHz
> + *     Dummy Descriptor:
> + *   Extension blocks: 1
> + * Checksum: 0x92
> + *
> + * ----------------
> + *
> + * Block 1, CTA-861 Extension Block:
> + *   Revision: 3
> + *   Underscans IT Video Formats by default
> + *   Native detailed modes: 1
> + *   Colorimetry Data Block:
> + *     BT2020YCC
> + *     BT2020RGB
> + *     sRGB
> + *   Video Data Block:
> + *     VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.50=
0000 MHz
> + *   Video Capability Data Block:
> + *     YCbCr quantization: No Data
> + *     RGB quantization: Selectable (via AVI Q)
> + *     PT scan behavior: No Data
> + *     IT scan behavior: Always Underscanned
> + *     CE scan behavior: Always Underscanned
> + *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> + *     Source physical address: 1.2.3.4
> + *     Maximum TMDS clock: 200 MHz
> + *   HDR Static Metadata Data Block:
> + *     Electro optical transfer functions:
> + *       Traditional gamma - SDR luminance range
> + *       SMPTE ST2084
> + *     Supported static metadata descriptors:
> + *       Static metadata type 1
> + *     Desired content max luminance: 82 (295.365 cd/m^2)
> + *     Desired content max frame-average luminance: 82 (295.365 cd/m^2)
> + *     Desired content min luminance: 81 (0.298 cd/m^2)
> + * Checksum: 0x4e  Unused space in Extension Block: 99 bytes
> + *
> + * ----------------
> + *
> + * edid-decode 1.31.0-5387
> + * edid-decode SHA: 5508bc4301ac 2025-08-25 08:14:22
> + *
> + * EDID conformity: PASS
> + */
> +static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz_hdr[] =3D=
 {
> +	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
> +	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
> +	0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> +	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a, 0x80, 0x18, 0x71, 0x38,
> +	0x2d, 0x40, 0x58, 0x2c, 0x45, 0x00, 0x40, 0x84, 0x63, 0x00, 0x00, 0x1e,
> +	0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44,
> +	0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x32,
> +	0x46, 0x1e, 0x46, 0x0f, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +	0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x92, 0x02, 0x03, 0x1c, 0x81,
> +	0xe3, 0x05, 0xc0, 0x20, 0x41, 0x10, 0xe2, 0x00, 0x4a, 0x67, 0x03, 0x0c,
> +	0x00, 0x12, 0x34, 0x78, 0x28, 0xe6, 0x06, 0x05, 0x01, 0x52, 0x52, 0x51,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0xd6,
> +};
> +
>  /*
>   * edid-decode (hex):
>   *
>=20
> --=20
> 2.47.3
>=20

--4rsiinaxqk6us3ah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaV5QPgAKCRAnX84Zoj2+
dm6zAX0UI5ACdFd2NtlQk34rXFHpUcctkHn9pnuPC/mrlLdqiEaYt4iz1MjHRu70
RIcpEGMBgMkmn2yC3SqJT3atIqyk4JkeGBEmcBTsxZ7caEG17b2DfSTX3v1CTeFc
eWg+9zeizg==
=alSq
-----END PGP SIGNATURE-----

--4rsiinaxqk6us3ah--
