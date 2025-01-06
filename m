Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274BA0220F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 10:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F86F10E209;
	Mon,  6 Jan 2025 09:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D30hOUp2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0BA10E209
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 09:43:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CDED0A41349;
 Mon,  6 Jan 2025 09:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE30EC4CED2;
 Mon,  6 Jan 2025 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736156595;
 bh=Am1upAm9duRmcKQiHZvn5Fk4ib0c9TJ6pXdDabnpuCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D30hOUp2WPGyAxoilb3pUH9u6mLN0sRfGw/RALHLBnzomAhB9AHrYmisOjaMgO8YQ
 Gk4z/fHfhQBxR/YWdQ3g4XcQoqEfHitCc54C0AP57Y0GlsHUeq8uEK/lmsmJjiFlNT
 LXu64zKwwqCykpnEGv9QQcEmbg8K2RaFyKvD6bbry+QEigwmKEHDBGxXIWJ+QChrBF
 RwdJ0bdGfhpkHlmDGQUNpwlLL+7THCGgqVFoRIYp4Xn5SnKyc1kxeoeamC4hJoPu6P
 iVV/MLzAtLqkx5CnDB7hiMpEdfg75mWPoMCPBPptPg5Q/R+t0zOUz/Rfb8Sd6417eM
 rXlb5CYYQRUVA==
Date: Mon, 6 Jan 2025 10:43:12 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v6 4/8] drm: writeback: Introduce cleanup function
Message-ID: <20250106-straight-cyan-hare-50d8e0@houat>
References: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
 <20241230-google-vkms-managed-v6-4-15c7d65cd63b@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ms2zusdi6h6qpedv"
Content-Disposition: inline
In-Reply-To: <20241230-google-vkms-managed-v6-4-15c7d65cd63b@bootlin.com>
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


--ms2zusdi6h6qpedv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 4/8] drm: writeback: Introduce cleanup function
MIME-Version: 1.0

On Mon, Dec 30, 2024 at 07:37:34PM +0100, Louis Chauvet wrote:
> Currently there is no cleanup function for writeback connectors. To allows
> implementation of drmm variant of writeback connector, create a cleanup
> function that can be used to properly remove all the writeback-specific
> properties and allocations.
>=20
> This also introduce an helper to cleanup only the drm_writeback_connector
> properties, so it can be used during initialization to cleanup in case of
> failure.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 43 +++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 43 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeb=
ack.c
> index 33a3c98a962d1ec49ac4b353902036cf74290ae6..c274cba257cde5f4b446df385=
4974e690c60bf7b 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_property.h>
>  #include <drm/drm_writeback.h>
> @@ -140,6 +141,22 @@ static int create_writeback_properties(struct drm_de=
vice *dev)
>  	return 0;
>  }
> =20
> +static void delete_writeback_properties(struct drm_device *dev)
> +{
> +	if (dev->mode_config.writeback_pixel_formats_property) {
> +		drm_property_destroy(dev, dev->mode_config.writeback_pixel_formats_pro=
perty);
> +		dev->mode_config.writeback_pixel_formats_property =3D NULL;
> +	}
> +	if (dev->mode_config.writeback_out_fence_ptr_property) {
> +		drm_property_destroy(dev, dev->mode_config.writeback_out_fence_ptr_pro=
perty);
> +		dev->mode_config.writeback_out_fence_ptr_property =3D NULL;
> +	}
> +	if (dev->mode_config.writeback_fb_id_property) {
> +		drm_property_destroy(dev, dev->mode_config.writeback_fb_id_property);
> +		dev->mode_config.writeback_fb_id_property =3D NULL;
> +	}
> +}
> +
>  static const struct drm_encoder_funcs drm_writeback_encoder_funcs =3D {
>  	.destroy =3D drm_encoder_cleanup,
>  };
> @@ -284,6 +301,32 @@ int drm_writeback_connector_init_with_encoder(struct=
 drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
> =20
> +/**
> + * drm_writeback_connector_cleanup - Cleanup the writeback connector
> + * @dev: DRM device
> + * @wb_connector: Pointer to the writeback connector to clean up
> + *
> + * This will decrement the reference counter of blobs and destroy proper=
ties. It
> + * will also clean the remaining jobs in this writeback connector. Cauti=
on: This helper will not
> + * clean up the attached encoder and the drm_connector.
> + */
> +static void drm_writeback_connector_cleanup(struct drm_device *dev,
> +					    struct drm_writeback_connector *wb_connector)
> +{
> +	unsigned long flags;
> +	struct drm_writeback_job *pos, *n;
> +
> +	delete_writeback_properties(dev);
> +	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
> +
> +	spin_lock_irqsave(&wb_connector->job_lock, flags);
> +	list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry) {
> +		drm_writeback_cleanup_job(pos);
> +		list_del(&pos->list_entry);
> +	}
> +	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
> +}
> +

Given that this function is static now, it should be merged with the
patch using it.

Maxime

--ms2zusdi6h6qpedv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ3ulqwAKCRAnX84Zoj2+
dnbuAX44qK1eRM529azS8s7oe9uBDW/qiucXZvTDGw+Pc8EqHQSHgD6mPe8m6k7X
iGKFQ2EBgJGKFRP+mmqXmCymlMMy35FTR0D82Oh2JGFJ9GbQPwVC/hswWc0zK7Pd
3j2nv0zlxg==
=NLCS
-----END PGP SIGNATURE-----

--ms2zusdi6h6qpedv--
