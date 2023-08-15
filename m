Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB5977CDBC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 16:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A193B10E24E;
	Tue, 15 Aug 2023 14:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D291410E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 14:02:00 +0000 (UTC)
Received: from xpredator (unknown
 [IPv6:2a02:2f08:470d:cf00:7656:3cff:fe3f:7ce9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 88C1F66071F0;
 Tue, 15 Aug 2023 15:01:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692108119;
 bh=WmoWxyrjOh1kRTgRWY//MX772lQdQiNQTzfkQL8io3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W8uGCd1gSBz6skMxS/qUiw9GNgsPHkUG33Ad/owjouxAoeZqNv4uWL+N/eyrDuNnq
 sWLiUXD6er3Rz/mKxYr1izfIcOmF8ZZOBepf2LDWqt4NrQekJUL69ZAgt3jsYoCYku
 qMQgk9QTHuUzIOAT/2V+RBScBgdCAhjdf+2thVV1OyFh/gDdOlfAqpShABHoHr/o6R
 CKiLulEbKI5FnePWVpYfbDNbJjAbExFIeKVaB1ViUwgNK4k/p1PkD7+hFM9WRxqwEg
 /0yx9IQtHsPooFb9ouU5bNBT68P/Ejpe3xWHUhsSjLFSZ5uP4zHUo2AmBSzUVA5GQm
 qnkJil2R2QNjw==
Date: Tue, 15 Aug 2023 17:01:55 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Jim Shargo <jshargo@chromium.org>
Subject: Re: [PATCH v2 5/6] drm/vkms: Support enabling ConfigFS devices
Message-ID: <ZNuFU3VbiKhZTIWk@xpredator>
References: <20230623222353.97283-1-jshargo@chromium.org>
 <20230623222353.97283-6-jshargo@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7mVKmyV3VPXXjhnm"
Content-Disposition: inline
In-Reply-To: <20230623222353.97283-6-jshargo@chromium.org>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <melissa.srw@gmail.com>, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7mVKmyV3VPXXjhnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

See below some minor comments:

On Fri, Jun 23, 2023 at 06:23:47PM -0400, Jim Shargo wrote:
> VKMS now supports creating and using virtual devices!
>=20
> In addition to the enabling logic, this commit also prevents users from
> adding new objects once a card is registered.
>=20
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---
>  drivers/gpu/drm/vkms/vkms_configfs.c |  37 +++--
>  drivers/gpu/drm/vkms/vkms_crtc.c     |   4 +-
>  drivers/gpu/drm/vkms/vkms_drv.c      |   3 +-
>  drivers/gpu/drm/vkms/vkms_drv.h      |   2 +-
>  drivers/gpu/drm/vkms/vkms_output.c   | 201 +++++++++++++++++++++++----
>  5 files changed, 202 insertions(+), 45 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/=
vkms_configfs.c
> index 544024735d19..f5eed6d23dcd 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -504,29 +504,40 @@ static ssize_t device_enabled_store(struct config_i=
tem *item, const char *buf,
>  {
>  	struct vkms_configfs *configfs =3D item_to_configfs(item);
>  	struct vkms_device *device;
> -	int value, ret;
> +	int enabled, ret;
> =20
> -	ret =3D kstrtoint(buf, 0, &value);
> +	ret =3D kstrtoint(buf, 0, &enabled);
>  	if (ret)
>  		return ret;
> =20
> -	if (value !=3D 1)
> -		return -EINVAL;
> -
> -	mutex_lock(&configfs->lock);
> -
> -	if (configfs->vkms_device) {
> +	if (enabled =3D=3D 0) {
> +		mutex_lock(&configfs->lock);
> +		if (configfs->vkms_device) {
> +			vkms_remove_device(configfs->vkms_device);
> +			configfs->vkms_device =3D NULL;
> +		}
>  		mutex_unlock(&configfs->lock);
> +
>  		return len;
>  	}
> =20
> -	device =3D vkms_add_device(configfs);
> -	mutex_unlock(&configfs->lock);
> +	if (enabled =3D=3D 1) {
> +		mutex_lock(&configfs->lock);
> +		if (!configfs->vkms_device) {
> +			device =3D vkms_add_device(configfs);
> +			if (IS_ERR(device)) {
> +				mutex_unlock(&configfs->lock);
> +				return -PTR_ERR(device);
> +			}
> +
> +			configfs->vkms_device =3D device;
> +		}
> +		mutex_unlock(&configfs->lock);
> =20
> -	if (IS_ERR(device))
> -		return -PTR_ERR(device);
> +		return len;
> +	}
> =20
> -	return len;
> +	return -EINVAL;
>  }
> =20
>  CONFIGFS_ATTR(device_, enabled);
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index d91e49c53adc..5ebb5264f6ef 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -278,7 +278,7 @@ static const struct drm_crtc_helper_funcs vkms_crtc_h=
elper_funcs =3D {
> =20
>  struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>  				 struct drm_plane *primary,
> -				 struct drm_plane *cursor)
> +				 struct drm_plane *cursor, const char *name)
>  {
>  	struct drm_device *dev =3D &vkmsdev->drm;
>  	struct vkms_crtc *vkms_crtc;
> @@ -290,7 +290,7 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *=
vkmsdev,
>  	vkms_crtc =3D &vkmsdev->output.crtcs[vkmsdev->output.num_crtcs++];
> =20
>  	ret =3D drmm_crtc_init_with_planes(dev, &vkms_crtc->base, primary, curs=
or,
> -					 &vkms_crtc_funcs, NULL);
> +					 &vkms_crtc_funcs, name);
>  	if (ret) {
>  		DRM_ERROR("Failed to init CRTC\n");
>  		goto out_error;
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 1b5b7143792f..314a04659c5f 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -210,7 +210,7 @@ static int vkms_platform_probe(struct platform_device=
 *pdev)
>  	ret =3D drm_dev_register(&vkms_device->drm, 0);
>  	if (ret) {
>  		DRM_ERROR("Unable to register device with id %d\n", pdev->id);
> -		return ret;
> +		goto out_release_group;
>  	}
> =20
>  	drm_fbdev_generic_setup(&vkms_device->drm, 0);
> @@ -256,6 +256,7 @@ struct vkms_device *vkms_add_device(struct vkms_confi=
gfs *configfs)
>  			dev, &vkms_platform_driver.driver))) {
>  		pdev =3D to_platform_device(dev);
>  		max_id =3D max(max_id, pdev->id);
> +		put_device(dev);
>  	}
> =20
>  	pdev =3D platform_device_register_data(NULL, DRIVER_NAME, max_id + 1,
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 3634eeeb4548..3d592d085f49 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -239,7 +239,7 @@ void vkms_remove_device(struct vkms_device *vkms_devi=
ce);
>  /* CRTC */
>  struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>  				 struct drm_plane *primary,
> -				 struct drm_plane *cursor);
> +				 struct drm_plane *cursor, const char *name);
> =20
>  int vkms_output_init(struct vkms_device *vkmsdev);
>  int vkms_output_init_default(struct vkms_device *vkmsdev);
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index c9e6c653de19..806ff01954ad 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -2,8 +2,10 @@
> =20
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_plane.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> =20
> @@ -82,7 +84,6 @@ static struct drm_encoder *vkms_encoder_init(struct vkm=
s_device *vkms_device)
> =20
>  int vkms_output_init_default(struct vkms_device *vkmsdev)
>  {
> -	struct vkms_output *output =3D &vkmsdev->output;
>  	struct drm_device *dev =3D &vkmsdev->drm;
>  	struct drm_connector *connector;
>  	struct drm_encoder *encoder;
> @@ -101,8 +102,7 @@ int vkms_output_init_default(struct vkms_device *vkms=
dev)
>  			struct vkms_plane *overlay =3D vkms_plane_init(
>  				vkmsdev, DRM_PLANE_TYPE_OVERLAY);
>  			if (IS_ERR(overlay)) {
> -				ret =3D PTR_ERR(overlay);
> -				goto err_planes;
> +				return PTR_ERR(overlay);
>  			}
>  		}
>  	}
> @@ -110,17 +110,16 @@ int vkms_output_init_default(struct vkms_device *vk=
msdev)
>  	if (vkmsdev->config.cursor) {
>  		cursor =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
>  		if (IS_ERR(cursor)) {
> -			ret =3D PTR_ERR(cursor);
> -			goto err_planes;
> +			return PTR_ERR(cursor);
>  		}
>  	}
> =20
>  	vkms_crtc =3D vkms_crtc_init(vkmsdev, &primary->base,
> -				   cursor ? &cursor->base : NULL);
> +				   cursor ? &cursor->base : NULL,
> +				   "crtc-default");
>  	if (IS_ERR(vkms_crtc)) {
>  		DRM_ERROR("Failed to init crtc\n");
> -		ret =3D PTR_ERR(vkms_crtc);
> -		goto err_planes;
> +		return PTR_ERR(vkms_crtc);
>  	}
> =20
>  	for (int i =3D 0; i < vkmsdev->output.num_planes; i++) {
> @@ -131,22 +130,20 @@ int vkms_output_init_default(struct vkms_device *vk=
msdev)
>  	connector =3D vkms_connector_init(vkmsdev);
>  	if (IS_ERR(connector)) {
>  		DRM_ERROR("Failed to init connector\n");
> -		ret =3D PTR_ERR(connector);
> -		goto err_connector;
> +		return PTR_ERR(connector);
>  	}
> =20
>  	encoder =3D vkms_encoder_init(vkmsdev);
>  	if (IS_ERR(encoder)) {
>  		DRM_ERROR("Failed to init encoder\n");
> -		ret =3D PTR_ERR(encoder);
> -		goto err_encoder;
> +		return PTR_ERR(encoder);
>  	}
>  	encoder->possible_crtcs |=3D drm_crtc_mask(&vkms_crtc->base);
> =20
>  	ret =3D drm_connector_attach_encoder(connector, encoder);
>  	if (ret) {
>  		DRM_ERROR("Failed to attach connector to encoder\n");
> -		goto err_attach;
> +		return ret;
>  	}
> =20
>  	if (vkmsdev->config.writeback) {
> @@ -158,27 +155,175 @@ int vkms_output_init_default(struct vkms_device *v=
kmsdev)
>  	drm_mode_config_reset(dev);
> =20
>  	return 0;
> +}
> =20
> -err_attach:
> -	drm_encoder_cleanup(encoder);
> +static bool is_object_linked(struct vkms_config_links *links, unsigned l=
ong idx)
> +{
> +	return links->linked_object_bitmap & (1 << idx);
> +}
> =20
> -err_encoder:
> -	drm_connector_cleanup(connector);
> +int vkms_output_init(struct vkms_device *vkmsdev)
> +{
> +	struct drm_device *dev =3D &vkmsdev->drm;
> +	struct vkms_configfs *configfs =3D vkmsdev->configfs;
> +	struct vkms_output *output =3D &vkmsdev->output;
> +	struct plane_map {
> +		struct vkms_config_plane *config_plane;
> +		struct vkms_plane *plane;
> +	} plane_map[VKMS_MAX_PLANES] =3D { 0 };
> +	struct encoder_map {
> +		struct vkms_config_encoder *config_encoder;
> +		struct drm_encoder *encoder;
> +	} encoder_map[VKMS_MAX_OUTPUT_OBJECTS] =3D { 0 };
> +	struct config_item *item;
> +	int map_idx =3D 0;
> +
> +	list_for_each_entry(item, &configfs->planes_group.cg_children,
> +			    ci_entry) {
> +		struct vkms_config_plane *config_plane =3D
> +			item_to_config_plane(item);
> +		struct vkms_plane *plane =3D
> +			vkms_plane_init(vkmsdev, config_plane->type);
> +
> +		if (IS_ERR(plane)) {
> +			DRM_ERROR("Unable to init plane from config: %s",
> +				  item->ci_name);
> +			return PTR_ERR(plane);
> +		}
> =20
> -err_connector:
> -	drm_crtc_cleanup(&vkms_crtc->base);
> +		plane_map[map_idx].config_plane =3D config_plane;
> +		plane_map[map_idx].plane =3D plane;
> +		map_idx +=3D 1;
> +	}
> =20
> -err_planes:
> -	for (int i =3D 0; i < output->num_planes; i++) {
> -		drm_plane_cleanup(&output->planes[i].base);
> +	map_idx =3D 0;
> +	list_for_each_entry(item, &configfs->encoders_group.cg_children,
> +			    ci_entry) {
> +		struct vkms_config_encoder *config_encoder =3D
> +			item_to_config_encoder(item);
> +		struct drm_encoder *encoder =3D vkms_encoder_init(vkmsdev);
> +
> +		if (IS_ERR(encoder)) {
> +			DRM_ERROR("Failed to init config encoder: %s",
> +				  item->ci_name);
> +			return PTR_ERR(encoder);
> +		}
> +		encoder_map[map_idx].config_encoder =3D config_encoder;
A two connector configuration without an encoder would have the
potential of blowing up if we don't create a second_encoder.
> +		encoder_map[map_idx].encoder =3D encoder;
> +		map_idx +=3D 1;
>  	}
> =20
> -	memset(output, 0, sizeof(*output));
> +	list_for_each_entry(item, &configfs->connectors_group.cg_children,
> +			    ci_entry) {
> +		struct vkms_config_connector *config_connector =3D
> +			item_to_config_connector(item);
> +		struct drm_connector *connector =3D vkms_connector_init(vkmsdev);
> =20
> -	return ret;
> -}
> +		if (IS_ERR(connector)) {
> +			DRM_ERROR("Failed to init connector from config: %s",
> +				  item->ci_name);
> +			return PTR_ERR(connector);
> +		}
> =20
> -int vkms_output_init(struct vkms_device *vkmsdev)
> -{
> -	return -ENOTSUPP;
> +		for (int j =3D 0; j < output->num_connectors; j++) {
> +			struct encoder_map *encoder =3D &encoder_map[j];
> +
> +			if (is_object_linked(
> +				    &config_connector->possible_encoders,
> +				    encoder->config_encoder
> +					    ->encoder_config_idx)) {
Here encoder->config_encoder for two connectors but a single encoder
will give back a empty encoder.
> +				drm_connector_attach_encoder(connector,
> +							     encoder->encoder);
> +			}
> +		}
> +	}
> +
> +	list_for_each_entry(item, &configfs->crtcs_group.cg_children,
> +			    ci_entry) {
> +		struct vkms_config_crtc *config_crtc =3D
> +			item_to_config_crtc(item);
> +		struct vkms_crtc *vkms_crtc;
> +		struct drm_plane *primary =3D NULL, *cursor =3D NULL;
> +
> +		for (int j =3D 0; j < output->num_planes; j++) {
> +			struct plane_map *plane_entry =3D &plane_map[j];
> +			struct drm_plane *plane =3D &plane_entry->plane->base;
> +
> +			if (!is_object_linked(
> +				    &plane_entry->config_plane->possible_crtcs,
> +				    config_crtc->crtc_config_idx)) {
> +				continue;
> +			}
> +
> +			if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> +				if (primary) {
> +					DRM_WARN(
> +						"Too many primary planes found for crtc %s.",
> +						item->ci_name);
> +					return EINVAL;
> +				}
> +				primary =3D plane;
> +			} else if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> +				if (cursor) {
> +					DRM_WARN(
> +						"Too many cursor planes found for crtc %s.",
> +						item->ci_name);
> +					return EINVAL;
> +				}
> +				cursor =3D plane;
> +			}
> +		}
> +
> +		if (!primary) {
> +			DRM_WARN("No primary plane configured for crtc %s",
> +				 item->ci_name);
> +			return EINVAL;
> +		}
> +
> +		vkms_crtc =3D
> +			vkms_crtc_init(vkmsdev, primary, cursor, item->ci_name);
> +		if (IS_ERR(vkms_crtc)) {
> +			DRM_WARN("Unable to init crtc from config: %s",
> +				 item->ci_name);
> +			return PTR_ERR(vkms_crtc);
> +		}
> +
> +		for (int j =3D 0; j < output->num_planes; j++) {
> +			struct plane_map *plane_entry =3D &plane_map[j];
> +
> +			if (!plane_entry->plane)
> +				break;
> +
> +			if (is_object_linked(
> +				    &plane_entry->config_plane->possible_crtcs,
> +				    config_crtc->crtc_config_idx)) {
> +				plane_entry->plane->base.possible_crtcs |=3D
> +					drm_crtc_mask(&vkms_crtc->base);
> +			}
> +		}
> +
> +		for (int j =3D 0; j < output->num_encoders; j++) {
> +			struct encoder_map *encoder_entry =3D &encoder_map[j];
> +
> +			if (is_object_linked(&encoder_entry->config_encoder
> +						      ->possible_crtcs,
> +					     config_crtc->crtc_config_idx)) {
> +				encoder_entry->encoder->possible_crtcs |=3D
> +					drm_crtc_mask(&vkms_crtc->base);
> +			}
> +		}
> +
> +		if (vkmsdev->config.writeback) {
> +			int ret =3D vkms_enable_writeback_connector(vkmsdev,
> +								  vkms_crtc);
> +			if (ret)
> +				DRM_WARN(
> +					"Failed to init writeback connector for config crtc: %s. Error code=
 %d",
> +					item->ci_name, ret);
> +		}
> +	}
I think we might be needing here a test for missing symlinks - invalid
configurations, like unused crtcs, encoders, connectors. I
suppose anything that's not matched with is_object_linked(),
such we avoid invalid configuration found by drm_mode_config_validate()=20
and inform users about missing them.

An example here would be to create a second encoder, connector, crtc and
not symlink them to their possible_encoders,possible_crtcs mask. An
i-g-t test for this very thing would be needed to stress different kind
of combinations.

> +
> +	drm_mode_config_reset(dev);
> +
> +	return 0;
>  }
> --=20
> 2.41.0.162.gfafddb0af9-goog
>=20

--7mVKmyV3VPXXjhnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmTbhVAACgkQ9jQS5glH
1u9JeBAAg7X7ZPxpaFSyYbJXx6IH2TE0FVKh7r66TIKEFaCMhezqty1sDmntyyPr
HcTpLQuyApNhKPmOYFIqR0Ii+oXuUw0g2vsOfex5KJV4dwrA2alopeH5WnBWaxEa
mhxGu4O96oWOC/j2vL301hfpXIUd5iggqZwgGwT5/qCZSCbTlBu98ld2ZmG8km5f
PzWfq7LJjDfZQCGm2aylOvmblPkvoSFsGk8QKiySaK+AyI5BMr6JVuZ/f1ozAYgs
rjNIIi8gcBS9uPH/4xpqw14aHrkAQ3DDx0kTv8qqh6IhPyrtghPedVMH3TdCnwFF
xy64GpUBj3gPdtyTrKBscw7vterRNrDawyu5LpV9Y/ScBinpBChNHGr2/fIvoACA
dmZSYrzp7YfvTpaadF50Z44peGPDhEfP/4sMrJzBdj8u7Ochkz3J1EqF8OxtRJnj
AKM2Q/LfzWHrzEybH6bFjzoOJ2DmUpPtflVpXYItsR3tQujzfm6M1gv89mQcBrQ1
873OGn9GoVdNc9WIfle+WsqrSp3R2ESgFHIhzVyeoqqCePMdCiFB20kCFcjRt4ZX
zYSX+TP12VqAucFPusccBu0Tz5p1V8GPCcyszPLfXZlDuJhDdIIxlyeEBxWJKyF5
NatoH6vbrhs0hjo19KMOy3tVUtxoyRXcvYr70kTSwSrJhoQ+tAA=
=ZxkW
-----END PGP SIGNATURE-----

--7mVKmyV3VPXXjhnm--
