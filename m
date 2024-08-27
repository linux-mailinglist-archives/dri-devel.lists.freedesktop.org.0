Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CC1960B94
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 15:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D416010E316;
	Tue, 27 Aug 2024 13:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uSiM+BDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEDC10E316
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 13:16:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A2303A41967;
 Tue, 27 Aug 2024 13:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEADDC61042;
 Tue, 27 Aug 2024 13:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724764573;
 bh=RKcLEBk536RgZEhapsaAUKUNdcvZATGF7TO5Eqcp8IE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uSiM+BDcxnO03IrEmJUs7JISWCps24dSWnnJUWXXE2dDcJ9pE0BljHKSuoFbBCRQu
 PBNmS7YJ3dH4zrdHmlG4h+Tf0qiZSWuwQ3nmnHA/bJ/uU1eLjz94wdGrJhPMqfPAc2
 qS6GLzyf27gUb5UIVDJHgtrPa2xzAxvDjoNPBa3brUzUoUDLcM19E+ZSImqwqZyMek
 qde8Qt25pezjQ55UHzyEWEpAPyPG0oXhtDjVGyDfpnT18PKn2a5SxnueBSA7MJvsHt
 KBWXOQwSqkebfudObs6hAk6TAlaSTompew7QZW+8pKrke8H3y9FzcV6lDlMy7BUAxa
 Rj2leG62yggEA==
Date: Tue, 27 Aug 2024 15:16:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v2 2/6] drm/vkms: Switch to managed for encoder
Message-ID: <20240827-military-quartz-myna-e3a85a@houat>
References: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
 <20240827-google-vkms-managed-v2-2-f41104553aeb@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ly6lup4ybb6mzqsj"
Content-Disposition: inline
In-Reply-To: <20240827-google-vkms-managed-v2-2-f41104553aeb@bootlin.com>
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


--ly6lup4ybb6mzqsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 11:57:37AM GMT, Louis Chauvet wrote:
> The current VKMS driver uses non-managed function to create encoders. It
> is not an issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
>  drivers/gpu/drm/vkms/vkms_output.c | 22 +++++++++++-----------
>  2 files changed, 11 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 9a3c6c34d1f6..101993378b49 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -98,7 +98,6 @@ struct vkms_crtc_state {
> =20
>  struct vkms_output {
>  	struct drm_crtc crtc;
> -	struct drm_encoder encoder;
>  	struct drm_writeback_connector wb_connector;
>  	struct hrtimer vblank_hrtimer;
>  	ktime_t period_ns;
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index 4fe6b88e8081..bbec7c14229c 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -13,10 +13,6 @@ static const struct drm_connector_funcs vkms_connector=
_funcs =3D {
>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
>  };
> =20
> -static const struct drm_encoder_funcs vkms_encoder_funcs =3D {
> -	.destroy =3D drm_encoder_cleanup,
> -};
> -
>  static int vkms_conn_get_modes(struct drm_connector *connector)
>  {
>  	int count;
> @@ -51,7 +47,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int i=
ndex)
>  	struct vkms_output *output =3D &vkmsdev->output;
>  	struct drm_device *dev =3D &vkmsdev->drm;
>  	struct drm_connector *connector;
> -	struct drm_encoder *encoder =3D &output->encoder;
> +	struct drm_encoder *encoder;
>  	struct drm_crtc *crtc =3D &output->crtc;
>  	struct vkms_plane *primary, *cursor =3D NULL;
>  	int ret;
> @@ -96,18 +92,24 @@ int vkms_output_init(struct vkms_device *vkmsdev, int=
 index)
> =20
>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> =20
> -	ret =3D drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	encoder =3D drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
> +	if (!encoder) {
> +		DRM_ERROR("Failed to allocate encoder\n");
> +		ret =3D -ENOMEM;
> +		goto err_connector;
> +	}
> +

Ditto.

--ly6lup4ybb6mzqsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZs3RmgAKCRAnX84Zoj2+
doFlAX9LdntQ4Io5AvnDm0wYtbE3fUESzEB5Lo1e/xnBY+JyYWxACtm84Z8U3b3b
lO7cjjgBf2669cbfn4CpVsmxPQHrVB6JrGrWiBAC+etozYX1E3X60b79Uf/fcycV
23xuD+eoKg==
=auUp
-----END PGP SIGNATURE-----

--ly6lup4ybb6mzqsj--
