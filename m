Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA44D9C1F13
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D12310E9C9;
	Fri,  8 Nov 2024 14:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E+fguDqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05B910E9C9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:20:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 743BF5C5B9E;
 Fri,  8 Nov 2024 14:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B64C4CECD;
 Fri,  8 Nov 2024 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731075651;
 bh=+q0qEsBDCiPhMWR7oV4gj4QZkmFaEibfjsdafrLmT4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E+fguDqUZzds/s62J2FRJKXpIHF9SiBdeqDRHOFj1puHeT9Rfs8Gz0pBAJJMm6Ntm
 PwoNHPqpD1ZelyBArc3eWms30jlbXdkxuY/FzHiaAF2ZN2EmIJG1HOnCGsGXXGqm8B
 0c+PEPB5d/pXomyA1Qk8cWldofbfPuJ3tBZwduZq5+TJGPakKgM6U1ZjGRd70hVnVk
 0ef1ogB5MN9+QNPkpamIs8/v/Zf4yoU7aZOSVrtuuTijau6rpkwSem2axYahfoqrtJ
 UFzhbBGJnnVJDd8Hkmwv+mqgFu8LdsqduJ6tFRrZjA2uGiya/XeYokhh8tanp+f45p
 cM9NzRpuYPclw==
Date: Fri, 8 Nov 2024 15:20:48 +0100
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
Subject: Re: [PATCH v2 2/6] drm/sun4i: use drm_hdmi_connector_mode_valid()
Message-ID: <20241108-gainful-lionfish-of-progress-758dcb@houat>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
 <20241101-hdmi-mode-valid-v2-2-a6478fd20fa6@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gvl6jdeilsq4eowj"
Content-Disposition: inline
In-Reply-To: <20241101-hdmi-mode-valid-v2-2-a6478fd20fa6@linaro.org>
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


--gvl6jdeilsq4eowj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/6] drm/sun4i: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0

On Fri, Nov 01, 2024 at 02:25:05AM +0200, Dmitry Baryshkov wrote:
> Use new drm_hdmi_connector_mode_valid() helper instead of a
> module-specific copy.
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index b3649449de3026784ae2f3466906403a0b6e3b47..54b72fe220afacc208b3fd48d=
5160031127ea14a 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -205,16 +205,6 @@ static int sun4i_hdmi_connector_atomic_check(struct =
drm_connector *connector,
>  	return 0;
>  }
> =20
> -static enum drm_mode_status
> -sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
> -				struct drm_display_mode *mode)
> -{
> -	unsigned long long rate =3D drm_hdmi_compute_mode_clock(mode, 8,
> -							      HDMI_COLORSPACE_RGB);
> -
> -	return sun4i_hdmi_connector_clock_valid(connector, mode, rate);
> -}
> -
>  static int sun4i_hdmi_get_modes(struct drm_connector *connector)
>  {
>  	struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hdmi(connector);
> @@ -269,7 +259,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hd=
mi_hdmi_connector_funcs =3D {
> =20
>  static const struct drm_connector_helper_funcs sun4i_hdmi_connector_help=
er_funcs =3D {
>  	.atomic_check	=3D sun4i_hdmi_connector_atomic_check,
> -	.mode_valid	=3D sun4i_hdmi_connector_mode_valid,
> +	.mode_valid	=3D drm_hdmi_connector_mode_valid,
>  	.get_modes	=3D sun4i_hdmi_get_modes,
>  };

It's only slightly related, but the atomic_check implementation that
will be the last (direct) user of sun4i_hdmi_clock_valid is wrong and
doesn't call drm_atomic_helper_connector_hdmi_check

Maxime

--gvl6jdeilsq4eowj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZy4eQAAKCRAnX84Zoj2+
dtxCAXwL8U3Kdj+wVwDFf28N7fDsoRIKg9nowztcUuKe2dbb1TyT4t581CFQhhgH
4fyRrqQBfRWeXpD5+rE7haWwmaaAYN/WyuoOSkc7MRtD8MkiWahxYbD77ClE2BO2
hfikHA1jXg==
=SsWk
-----END PGP SIGNATURE-----

--gvl6jdeilsq4eowj--
