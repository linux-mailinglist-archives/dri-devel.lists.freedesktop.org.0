Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDD38C727C
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 10:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DB710E2F0;
	Thu, 16 May 2024 08:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TFfq3JU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCF510E3C2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 08:11:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 19901CE0682;
 Thu, 16 May 2024 08:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E717EC113CC;
 Thu, 16 May 2024 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715847060;
 bh=BRmFhShoWqXO+RMaXZ6QcmRSB4WF0s9bSCjoMQyYH+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TFfq3JU9kClf6Fd7tvIXE7Y56dguu22/4+EVp//3L9GvgEtaTwLKo80BP/JNqDGn0
 4oyiZLkES47mbrMfnkd1xZ0S/0rn6hSaDj50ygyofk1df7KQcm1KHL17DAw9elTEtN
 H7vt8ugQ9PRgramYdz68rMo7K35332ScZ2sPcizX0kFO461G8t0cPakJqyxsRu1Oas
 qUTfqTljA0AzQPHYl96LuAWE5ObFm2v4iehRrHeuUS5lP/cUzMeFEUXtqdKFXYwT9f
 f1En5jxzRikHvxswPCjB+qnRNjLupZ8opoaYNCqdcRcDlwuwzQHSObsCJU0qTRfDAY
 JYuBUoq/7i0Wg==
Date: Thu, 16 May 2024 10:10:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Boris Brezillon <boris.brezillon@bootlin.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, 
 Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH 1/7] drm/tidss: Add CRTC mode_fixup
Message-ID: <20240516-tuscan-mamba-of-debate-c4cddf@penduick>
References: <20240511153051.1355825-1-a-bhatia1@ti.com>
 <20240511153051.1355825-2-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mgwxmljliai55uxs"
Content-Disposition: inline
In-Reply-To: <20240511153051.1355825-2-a-bhatia1@ti.com>
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


--mgwxmljliai55uxs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, May 11, 2024 at 09:00:45PM +0530, Aradhya Bhatia wrote:
> Add support for mode_fixup for the tidss CRTC.
>=20
> Some bridges like the cdns-dsi consume the crtc_* timing parameters for
> programming the blanking values. Allow for the normal timing parameters
> to get copied to crtc_* timing params.
>=20
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_crtc.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/t=
idss_crtc.c
> index 94f8e3178df5..797ef53d9ad2 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -309,12 +309,23 @@ enum drm_mode_status tidss_crtc_mode_valid(struct d=
rm_crtc *crtc,
>  	return dispc_vp_mode_valid(tidss->dispc, tcrtc->hw_videoport, mode);
>  }
> =20
> +static
> +bool tidss_crtc_mode_fixup(struct drm_crtc *crtc,
> +			   const struct drm_display_mode *mode,
> +			   struct drm_display_mode *adjusted_mode)
> +{
> +	drm_mode_set_crtcinfo(adjusted_mode, 0);
> +
> +	return true;
> +}
> +
>  static const struct drm_crtc_helper_funcs tidss_crtc_helper_funcs =3D {
>  	.atomic_check =3D tidss_crtc_atomic_check,
>  	.atomic_flush =3D tidss_crtc_atomic_flush,
>  	.atomic_enable =3D tidss_crtc_atomic_enable,
>  	.atomic_disable =3D tidss_crtc_atomic_disable,
> =20
> +	.mode_fixup =3D tidss_crtc_mode_fixup,
>  	.mode_valid =3D tidss_crtc_mode_valid,
>  };

mode_fixup is deprecated for atomic drivers, so the solution must be
different there.

It's also not clear to me how it could change anything there:
drm_mode_set_crtcinfo with no flags will make crtc_* field exactly
identical to their !crtc counterparts.

Maxime

--mgwxmljliai55uxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkW/jwAKCRAnX84Zoj2+
dhopAX9rYsjJXGouUM2wpIcUr0980woll7lZpm+3BsbWdQnFxhf6beZRHsBDAQ6+
F2BYULABgK7TsoZbNSb5Q12oWnnuWVM9+qXVDwDDzzSRwFIK3QrhqLBb/cGxoqUi
dgdthA19rg==
=Kkys
-----END PGP SIGNATURE-----

--mgwxmljliai55uxs--
