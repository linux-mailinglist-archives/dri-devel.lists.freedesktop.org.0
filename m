Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30C0A82992
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DEF10E924;
	Wed,  9 Apr 2025 15:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uqd/k6WG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E056010E924
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:11:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 600B161127;
 Wed,  9 Apr 2025 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD55C4CEE2;
 Wed,  9 Apr 2025 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744211517;
 bh=9zEvmNFlQZZmYfUY7s7s4qVdIjQmXfR0n8TD+iHvIys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uqd/k6WGDY2YY9TkGdFJSudBsy9nQNK4bhZusAwhojB5RwFEq/RwRwntqDMjfDFLq
 n7YxZQDPx55+eLK8hnuz/FELuyfplqqc5WOQWSBbhea6Spmsj+kQNNiv4gvL6CC4ZU
 jg9GbZCW0jDtHOGFmEQgUKrRiR8buCsYo7OHn10kTNgwgu0GVT7U1ZBXcPqfrPlcBR
 uq5okBHT2RQbeAFVhOAeCin9gguV7Ou+Df4MITb0aU3NTQkgbWHv7nzjbLB2r/pbIi
 x8GJzPNlfuQBSoprLTKg/e15SYA1DEObikyKi/PcKepz5vUBacFJ90Bn8U11VvbB5b
 35KoK/oyM4qbA==
Date: Wed, 9 Apr 2025 17:11:55 +0200
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
Subject: Re: [PATCH v3 08/15] drm/tests: hdmi: Add macros to simplify EDID
 setup
Message-ID: <20250409-ubiquitous-amethyst-trogon-bbb3cf@houat>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-8-294d3ebbb4b2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5lzskk4kxc2hm5gh"
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-8-294d3ebbb4b2@collabora.com>
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


--5lzskk4kxc2hm5gh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 08/15] drm/tests: hdmi: Add macros to simplify EDID
 setup
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:19:57PM +0200, Cristian Ciocaltea wrote:
> Introduce a few macros to facilitate setting custom (i.e. non-default)
> EDID data during connector initialization.
>=20
> The actual conversion to use the new helpers is handled separately.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 43 +++++++++++-----=
------
>  1 file changed, 21 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 7ffd666753b10bc991894e238206a3c5328d0e23..bcbd146fb655f4402529e59af=
09c99dbae7be0bf 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -140,10 +140,12 @@ static const struct drm_connector_funcs dummy_conne=
ctor_funcs =3D {
> =20
>  static
>  struct drm_atomic_helper_connector_hdmi_priv *
> -drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
> -					   unsigned int formats,
> -					   unsigned int max_bpc,
> -					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
> +connector_hdmi_init_with_edid_funcs(struct kunit *test,
> +				    unsigned int formats,
> +				    unsigned int max_bpc,
> +				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
> +				    const char *edid_data,
> +				    size_t edid_len)
>  {
>  	struct drm_atomic_helper_connector_hdmi_priv *priv;
>  	struct drm_connector *conn;
> @@ -197,30 +199,27 @@ drm_kunit_helper_connector_hdmi_init_funcs(struct k=
unit *test,
> =20
>  	drm_mode_config_reset(drm);
> =20
> +	if (edid_data && edid_len) {
> +		ret =3D set_connector_edid(test, &priv->connector, edid_data, edid_len=
);
> +		KUNIT_ASSERT_GT(test, ret, 0);
> +	}
> +
>  	return priv;
>  }
> =20
> -static
> -struct drm_atomic_helper_connector_hdmi_priv *
> -drm_kunit_helper_connector_hdmi_init(struct kunit *test,
> -				     unsigned int formats,
> -				     unsigned int max_bpc)
> -{
> -	struct drm_atomic_helper_connector_hdmi_priv *priv;
> -	int ret;
> +#define drm_kunit_helper_connector_hdmi_init_funcs(test, formats, max_bp=
c, funcs)		\
> +	connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, NULL=
, 0)

Again, we don't need that one. All current users would actually use
drm_kunit_helper_connector_hdmi_init_with_edid_funcs().

Maxime

--5lzskk4kxc2hm5gh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/aOOgAKCRDj7w1vZxhR
xdhZAQC2LBoDd/fH5aNs4u8Ya9lcI1PiTisit5ZjnQvPOmHlgQEAjracjEHWyXkC
uTkpjHqU0kwHuF1xfWwfwvuEXkMgkgg=
=Tpyq
-----END PGP SIGNATURE-----

--5lzskk4kxc2hm5gh--
