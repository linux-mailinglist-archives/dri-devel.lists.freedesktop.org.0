Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8EC960B92
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 15:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CFA10E317;
	Tue, 27 Aug 2024 13:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ftb70ojq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF3610E317
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 13:15:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 785D0A418B7;
 Tue, 27 Aug 2024 13:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71B8C61042;
 Tue, 27 Aug 2024 13:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724764552;
 bh=D23zuocXZqUjo7IpJ+JfE57T8hPk8Zxdo5HWhXEbNXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ftb70ojq/Bx5i3eIwH8rMEXF1B/BVsE1hJfGMk/rpBZLe4txbxPpef2kpsnK7c4iu
 kmpHKkAOJ0I3TIXoUyBGcla/SoObzl4EE+s8iBp0obesitFpFLNa46TIRROSDp+HKm
 cPRMd+YXlT+Qqm4qDXvWAL2ICjMAyG5Uf0UtE+EleAwvDMPr6w2cgWCSeOBWorfz7R
 1OotpgP9wKkR6ZyCQtvl2WX1CQUrBmkzqOy+hI05oO6FHFF2hN8Ow7rKCRRvwFWrWJ
 F6sVmZy/IABYwsR/xNeFfd4z+zAxx0YJlDr0+EAk5R3OUEsG+3kd6ojzxfrT99gBcj
 EC3OXd35lNsjw==
Date: Tue, 27 Aug 2024 15:15:49 +0200
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
Subject: Re: [PATCH v2 1/6] drm/vkms: Switch to managed for connector
Message-ID: <20240827-dynamic-acoustic-guillemot-ddde49@houat>
References: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
 <20240827-google-vkms-managed-v2-1-f41104553aeb@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vrglarcftye54dnb"
Content-Disposition: inline
In-Reply-To: <20240827-google-vkms-managed-v2-1-f41104553aeb@bootlin.com>
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


--vrglarcftye54dnb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 27, 2024 at 11:57:36AM GMT, Louis Chauvet wrote:
> The current VKMS driver uses non-managed function to create connectors. It
> is not an issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
>  drivers/gpu/drm/vkms/vkms_output.c | 22 ++++++++++++----------
>  2 files changed, 12 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 5e46ea5b96dc..9a3c6c34d1f6 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -99,7 +99,6 @@ struct vkms_crtc_state {
>  struct vkms_output {
>  	struct drm_crtc crtc;
>  	struct drm_encoder encoder;
> -	struct drm_connector connector;
>  	struct drm_writeback_connector wb_connector;
>  	struct hrtimer vblank_hrtimer;
>  	ktime_t period_ns;
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index 5ce70dd946aa..4fe6b88e8081 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -3,11 +3,11 @@
>  #include "vkms_drv.h"
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
> =20
>  static const struct drm_connector_funcs vkms_connector_funcs =3D {
>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
> -	.destroy =3D drm_connector_cleanup,
>  	.reset =3D drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> @@ -50,7 +50,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int i=
ndex)
>  {
>  	struct vkms_output *output =3D &vkmsdev->output;
>  	struct drm_device *dev =3D &vkmsdev->drm;
> -	struct drm_connector *connector =3D &output->connector;
> +	struct drm_connector *connector;
>  	struct drm_encoder *encoder =3D &output->encoder;
>  	struct drm_crtc *crtc =3D &output->crtc;
>  	struct vkms_plane *primary, *cursor =3D NULL;
> @@ -80,8 +80,15 @@ int vkms_output_init(struct vkms_device *vkmsdev, int =
index)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D drm_connector_init(dev, connector, &vkms_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VIRTUAL);
> +	connector =3D drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
> +	if (!connector) {
> +		DRM_ERROR("Failed to allocate connector\n");
> +		ret =3D -ENOMEM;
> +		goto err_connector;
> +	}
> +

I think it would be worth explaining why you need to move to a separate
allocation for the connector now.

Maxime

--vrglarcftye54dnb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZs3RhAAKCRAnX84Zoj2+
dp6mAX4oTq8+wGRS/+ubo/twHMugq+86ZPxe6xrYcFPBoHukpI9H6UgmsopfjZQK
50YOzzsBgPwpwaRq6xKl9k12Va7BPJvDRl4JTQ427SCWr7ftzbNFzedITGFCM/jG
0Xldo5f41Q==
=1hkH
-----END PGP SIGNATURE-----

--vrglarcftye54dnb--
