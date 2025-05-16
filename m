Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CF5AB9D0A
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 15:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2ACF10EAB6;
	Fri, 16 May 2025 13:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZndHyWnU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2F310EAB6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 13:16:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 861734A193;
 Fri, 16 May 2025 13:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325BCC4CEE4;
 Fri, 16 May 2025 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747401360;
 bh=uvvI8RXh4rZJqEJHK/WRU2hAsaJ0v4o/pfgSZSgKH6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZndHyWnUtTl2Ohswj3nHyvVAXeQ6TjP9gkXk8xPOjGtX+f72esC2vbnNw1DiGIsWJ
 lVmTjzE6CFCeoxIoO7Fzxlzlpv6FYXhIYKd8Df5jjx3X0QECNmguPuz39ToUNPw4SR
 +2TlFO+0konrNtwjzaoH1QfK5O8JErI6U271cSAk7f0buYA0Cst4GxwngMj9+d6Y13
 i2kluMysPKw/7TCqX7HtmVaMcS0DowRMkuDGNek6kb7JH8M4bCglgD1FFzLFHy1nkK
 4l+rSc8F8qckDFHv15znnxQsvBRYX1wX8rF3f0ySanQYhuMr/UqkF/gOkTu4ik8IDa
 ZSUQMXC7NUzAA==
Date: Fri, 16 May 2025 15:15:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/23] drm/tests: helpers: Add a (re)try helper
 variant to enable CRTC connector
Message-ID: <n2ojf77winz6b4kchmt6bnppomb6cpg4okrwnh6iibsemou4as@t5lhg3m24bjm>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-12-5e55e2aaa3fa@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="btnk46swg4gpsgrg"
Content-Disposition: inline
In-Reply-To: <20250425-hdmi-conn-yuv-v4-12-5e55e2aaa3fa@collabora.com>
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


--btnk46swg4gpsgrg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 12/23] drm/tests: helpers: Add a (re)try helper
 variant to enable CRTC connector
MIME-Version: 1.0

Hi,

On Fri, Apr 25, 2025 at 01:27:03PM +0300, Cristian Ciocaltea wrote:
> Provide a wrapper over drm_kunit_helper_enable_crtc_connector() to
> automatically handle EDEADLK.
>=20
> This is going to help improve the error handling in a bunch of test
> cases without open coding the restart of the atomic sequence.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 39 +++++++++++++++++++++++++=
++++++
>  include/drm/drm_kunit_helpers.h           |  7 ++++++
>  2 files changed, 46 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/=
tests/drm_kunit_helpers.c
> index 5f7257840d8ef0aeabe5f00802f5037ed652ae66..4e1174c50b1f2b6358eb740cd=
73c6d86e53d0df9 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -332,6 +332,45 @@ int drm_kunit_helper_enable_crtc_connector(struct ku=
nit *test,
>  }
>  EXPORT_SYMBOL_GPL(drm_kunit_helper_enable_crtc_connector);
> =20
> +/**
> + * drm_kunit_helper_try_enable_crtc_connector - (Re)tries to enable a CR=
TC -> Connector output
> + * @test: The test context object
> + * @drm: The device to alloc the plane for
> + * @crtc: The CRTC to enable
> + * @connector: The Connector to enable
> + * @mode: The display mode to configure the CRTC with
> + * @ctx: Locking context
> + *
> + * This function is a wrapper over @drm_kunit_helper_enable_crtc_connect=
or
> + * to automatically handle EDEADLK and (re)try to enable the route from
> + * @crtc to @connector, with the given @mode.
> + *
> + * Returns:
> + *
> + * A pointer to the new CRTC, or an ERR_PTR() otherwise.
> + */
> +int drm_kunit_helper_try_enable_crtc_connector(struct kunit *test,
> +					       struct drm_device *drm,
> +					       struct drm_crtc *crtc,
> +					       struct drm_connector *connector,
> +					       const struct drm_display_mode *mode,
> +					       struct drm_modeset_acquire_ctx *ctx)
> +{
> +	int ret;
> +
> +retry_enable:
> +	ret =3D drm_kunit_helper_enable_crtc_connector(test, drm, crtc, connect=
or,
> +						     mode, ctx);
> +	if (ret =3D=3D -EDEADLK) {
> +		ret =3D drm_modeset_backoff(ctx);
> +		if (!ret)
> +			goto retry_enable;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(drm_kunit_helper_try_enable_crtc_connector);

I'm not sure it's a good idea. This function might affect the locking
context of the caller without even reporting it.

Generally speaking, I'd really prefer to have explicit locking, even if
it means slightly more boilerplate.

Maxime

--btnk46swg4gpsgrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCc6hwAKCRAnX84Zoj2+
dvcBAYDcTwDF538RFQHBgVAINQXEsJRaLAEAcd9prk21mK44LnqoDRgF5/Yg5F+n
we44oSABgKmQossFkY00emM9Nm+PKxJYxKdSsPJzFceIrdumROrLzgfYnB1zHpOz
wWLd/RlkyA==
=kUrs
-----END PGP SIGNATURE-----

--btnk46swg4gpsgrg--
