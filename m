Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 363F878B2B3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 16:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D249E10E2E9;
	Mon, 28 Aug 2023 14:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D0B10E2E8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 14:10:54 +0000 (UTC)
Received: from xpredator (unknown
 [IPv6:2a02:2f08:4c00:5d00:7656:3cff:fe3f:7ce9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 18FF566003AE;
 Mon, 28 Aug 2023 15:10:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693231853;
 bh=qNT9bjwBwzbdfijWWQBiPp1qJ5+LhBT+GkoAfTEoB/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZFTQqSY+bfdj4rU+jglmrDBBnR2Bco4yCveJBfGaoVM8aN75IvmpyzsHIJADsk11k
 piPn/cXeL//ttUOhMPjUuqzl37v2jgpD71Z94V0+yEJbb6ykyclCBQ/AYW2GIYjKJ6
 tM92jhyieH1WuM8SCQ5mpeBduwsen65vzw1bGS7qhErinKnOkZfgbn5o57O52PLTjZ
 I6rpvEmrUkuPjq5y0Vrm0TQZnDnMzP0aJF/VlpP7JVj49QHToO7oLfDDb6pVvHif2q
 YpNC6LKA7sJIua4ToIkcKBMHqtsGwlVFNyIHK5L7oYg29Uet7YbjmeH8oRVDrxr71q
 mQeA60nkOx2QQ==
Date: Mon, 28 Aug 2023 17:10:48 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Brandon Pollack <brpol@chromium.org>
Subject: Re: [PATCH v5 4/7] drm/vkms: Add ConfigFS scaffolding to VKMS
Message-ID: <ZOyq6B+xkrjP8BnM@xpredator>
References: <20230828081929.3574228-1-brpol@chromium.org>
 <20230828081929.3574228-5-brpol@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XKHxjJeNr/LLLTmV"
Content-Disposition: inline
In-Reply-To: <20230828081929.3574228-5-brpol@chromium.org>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, mduggan@chromium.org, corbet@lwn.net,
 hirono@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, mairacanal@riseup.net,
 mripard@kernel.org, tzimmermann@suse.de, jshargo@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--XKHxjJeNr/LLLTmV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Brandon,

See some minor missing rmdirs for connector_other and encoder_other.

On Mon, Aug 28, 2023 at 08:17:06AM +0000, Brandon Pollack wrote:
> From: Jim Shargo <jshargo@chromium.org>
>=20
> This change adds the basic scaffolding for ConfigFS, including setting
> up the default directories. It does not allow for the registration of
> configfs-backed devices, which is complex and provided in a follow-up
> commit.
>=20
> This CL includes docs about using ConfigFS with VKMS, but I'll summarize
> in brief here as well (assuming ConfigFS is mounted at /config/):
>=20
> To create a new device, you can do so via `mkdir
> /config/vkms/my-device`.
>=20
> This will create a number of directories and files automatically:
>=20
> 	/config
> 	`-- vkms
> 	    `-- my-device
> 		|-- connectors
> 		|-- crtcs
> 		|-- encoders
> 		|-- planes
> 		`-- enabled
>=20
> You can then configure objects by mkdir'ing in each of the directories.
>=20
> When you're satisfied, you can `echo 1 > /config/vkms/my-device/enabled`.
> This will create a new device according to your configuration.
>=20
> For now, this will fail, but the next change will add support for it.
>=20
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> Signed-off-by: Brandon Pollack <brpol@chromium.org>
> ---
>  Documentation/gpu/vkms.rst           |  18 +-
>  drivers/gpu/drm/Kconfig              |   1 +
>  drivers/gpu/drm/vkms/Makefile        |   1 +
>  drivers/gpu/drm/vkms/vkms_configfs.c | 648 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.c      |  56 ++-
>  drivers/gpu/drm/vkms/vkms_drv.h      |  92 +++-
>  drivers/gpu/drm/vkms/vkms_output.c   |   5 +
>  7 files changed, 804 insertions(+), 17 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
>=20
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index ba04ac7c2167..c3875bf66dba 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -51,6 +51,12 @@ To disable the driver, use ::
> =20
>    sudo modprobe -r vkms
> =20
> +Configuration With ConfigFS
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +.. kernel-doc:: drivers/gpu/drm/vkms/vkms_configfs.c
> +   :doc: ConfigFS Support for VKMS
> +
>  Testing With IGT
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -135,22 +141,16 @@ project.
>  Runtime Configuration
>  ---------------------
> =20
> -We want to be able to reconfigure vkms instance without having to reload=
 the
> -module. Use/Test-cases:
> +We want to be able to manipulate vkms instances without having to reload=
 the
> +module. Such configuration can be added as extensions to vkms's ConfigFS
> +support. Use-cases:
> =20
>  - Hotplug/hotremove connectors on the fly (to be able to test DP MST han=
dling
>    of compositors).
> =20
> -- Configure planes/crtcs/connectors (we'd need some code to have more th=
an 1 of
> -  them first).
> -
>  - Change output configuration: Plug/unplug screens, change EDID, allow c=
hanging
>    the refresh rate.
> =20
> -The currently proposed solution is to expose vkms configuration through
> -configfs. All existing module options should be supported through config=
fs
> -too.
> -
>  Writeback support
>  -----------------
> =20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index ab9ef1c20349..e39ee0e8ca06 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -284,6 +284,7 @@ config DRM_VKMS
>  	depends on DRM && MMU
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_SHMEM_HELPER
> +	select CONFIGFS_FS
>  	select CRC32
>  	default n
>  	help
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 1b28a6a32948..6b83907ad554 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  vkms-y :=3D \
> +	vkms_configfs.o \
>  	vkms_drv.o \
>  	vkms_plane.o \
>  	vkms_output.o \
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/=
vkms_configfs.c
> new file mode 100644
> index 000000000000..f2439629b37b
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -0,0 +1,648 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <linux/configfs.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_plane.h>
> +#include <drm/drm_print.h>
> +
> +#include "vkms_drv.h"
> +
> +/**
> + * DOC: ConfigFS Support for VKMS
> + *
> + * VKMS is instrumented with support for configuration via :doc:`ConfigFS
> + * <../filesystems/configfs>`.
> + *
> + * With VKMS installed, you can mount ConfigFS at ``/config/`` like so::
> + *
> + *   mkdir -p /config/
> + *   sudo mount -t configfs none /config
> + *
> + * This allows you to configure multiple virtual devices. Note
> + * that the default device which can be enabled in the module params wit=
h::
> + *
> + *  modprobe vkms default_device=3D1
> + *
> + * is immutable because we cannot pre-populate ConfigFS directories with=
 normal
> + * files.
> + *
> + * To set up a new device, create a new directory under the VKMS configfs
> + * directory::
> + *
> + *   mkdir /config/vkms/test
> + *
> + * With your device created you'll find an new directory ready to be
> + * configured::
> + *
> + *   /config
> + *   `-- vkms
> + *       `-- test
> + *           |-- connectors
> + *           |-- crtcs
> + *           |-- encoders
> + *           |-- planes
> + *           `-- enabled
> + *
> + * Each directory you add within the connectors, crtcs, encoders, and pl=
anes
> + * directories will let you configure a new object of that type. Adding =
new
> + * objects will automatically create a set of default files and folders =
you can
> + * use to configure that object.
> + *
> + * For instance, we can set up a two-output device like so::
> + *
> + *   DRM_PLANE_TYPE_PRIMARY=3D1
> + *   DRM_PLANE_TYPE_CURSOR=3D2
> + *   DRM_PLANE_TYPE_OVERLAY=3D0
> + *
> + *   mkdir /config/vkms/test/planes/primary
> + *   echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/type
> + *
> + *   mkdir /config/vkms/test/planes/other_primary
> + *   echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_prima=
ry/type
> + *
> + *   mkdir /config/vkms/test/crtcs/crtc
> + *   mkdir /config/vkms/test/crtcs/crtc_other
> + *
> + *   mkdir /config/vkms/test/encoders/encoder
> + *   mkdir /config/vkms/test/encoders/encoder_other
> + *
> + *   mkdir /config/vkms/test/connectors/connector
> + *   mkdir /config/vkms/test/connectors/connector_other
> + *
> + * You can see that specific attributes, such as ``.../<plane>/type``, c=
an be
> + * configured by writing into them. Associating objects together can be =
done via
> + * symlinks::
> + *
> + *   ln -s /config/vkms/test/encoders/encoder       /config/vkms/test/co=
nnectors/connector/possible_encoders
> + *   ln -s /config/vkms/test/encoders/encoder_other /config/vkms/test/co=
nnectors/connector_other/possible_encoders
> + *
> + *   ln -s /config/vkms/test/crtcs/crtc             /config/vkms/test/pl=
anes/primary/possible_crtcs/
> + *   ln -s /config/vkms/test/crtcs/crtc_other       /config/vkms/test/pl=
anes/other_primary/possible_crtcs/
> + *
> + *   ln -s /config/vkms/test/crtcs/crtc             /config/vkms/test/en=
coders/encoder/possible_crtcs/
> + *   ln -s /config/vkms/test/crtcs/crtc_other       /config/vkms/test/en=
coders/encoder_other/possible_crtcs/
> + *
> + * Finally, to enable your configured device, just write 1 to the ``enab=
led``
> + * file::
> + *
> + *   echo 1 > /config/vkms/test/enabled
> + *
> + * When you're done with the virtual device, you can clean up the device=
 like
> + * so::
> + *
> + *   echo 0 > /config/vkms/test/enabled
> + *
> + *   rm /config/vkms/test/connectors/connector/possible_encoders/encoder
> + *   rm /config/vkms/test/encoders/encoder/possible_crtcs/crtc
> + *   rm /config/vkms/test/planes/primary/possible_crtcs/crtc
> + *   rm /config/vkms/test/planes/cursor/possible_crtcs/crtc
> + *   rm /config/vkms/test/planes/overlay/possible_crtcs/crtc
> + *   rm /config/vkms/test/planes/overlay/possible_crtcs/crtc_other
> + *   rm /config/vkms/test/planes/other_primary/possible_crtcs/crtc_other
> + *
> + *   rmdir /config/vkms/test/planes/primary
> + *   rmdir /config/vkms/test/planes/other_primary
> + *   rmdir /config/vkms/test/planes/cursor
> + *   rmdir /config/vkms/test/planes/overlay
> + *   rmdir /config/vkms/test/crtcs/crtc
> + *   rmdir /config/vkms/test/crtcs/crtc_other
> + *   rmdir /config/vkms/test/encoders/encoder
rmdir /config/vkms/test/encoders/encoder_other
> + *   rmdir /config/vkms/test/connectors/connector
rmdir /config/vkms/test/connectors/connector_other
> + *
> + *   rmdir /config/vkms/test
> + */
> +
> +/*
> + * Common helpers (i.e. common sub-groups)
> + */
> +
> +/* Possible CRTCs, e.g. /config/vkms/device/<object>/possible_crtcs/<sym=
link> */
> +
> +static struct config_item_type crtc_type;
> +
> +static int possible_crtcs_allow_link(struct config_item *src,
> +				     struct config_item *target)
> +{
> +	struct vkms_config_links *links =3D item_to_config_links(src);
> +	struct vkms_config_crtc *crtc;
> +
> +	if (target->ci_type !=3D &crtc_type) {
> +		DRM_ERROR("Unable to link non-CRTCs.\n");
> +		return -EINVAL;
> +	}
> +
> +	crtc =3D item_to_config_crtc(target);
> +
> +	if (links->linked_object_bitmap & BIT(crtc->crtc_config_idx)) {
> +		DRM_ERROR(
> +			"Tried to add two symlinks to the same CRTC from the same object\n");
> +		return -EINVAL;
> +	}
> +
> +	links->linked_object_bitmap |=3D BIT(crtc->crtc_config_idx);
> +
> +	return 0;
> +}
> +
> +static void possible_crtcs_drop_link(struct config_item *src,
> +				     struct config_item *target)
> +{
> +	struct vkms_config_links *links =3D item_to_config_links(src);
> +	struct vkms_config_crtc *crtc =3D item_to_config_crtc(target);
> +
> +	links->linked_object_bitmap &=3D ~BIT(crtc->crtc_config_idx);
> +}
> +
> +static struct configfs_item_operations possible_crtcs_item_ops =3D {
> +	.allow_link =3D &possible_crtcs_allow_link,
> +	.drop_link =3D &possible_crtcs_drop_link,
> +};
> +
> +static struct config_item_type possible_crtcs_group_type =3D {
> +	.ct_item_ops =3D &possible_crtcs_item_ops,
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +static void add_possible_crtcs(struct config_group *parent,
> +			       struct config_group *possible_crtcs)
> +{
> +	config_group_init_type_name(possible_crtcs, "possible_crtcs",
> +				    &possible_crtcs_group_type);
> +	configfs_add_default_group(possible_crtcs, parent);
> +}
> +
> +/* Possible encoders, e.g. /config/vkms/device/connector/possible_encode=
rs/<symlink> */
> +
> +static struct config_item_type encoder_type;
> +
> +static int possible_encoders_allow_link(struct config_item *src,
> +					struct config_item *target)
> +{
> +	struct vkms_config_links *links =3D item_to_config_links(src);
> +	struct vkms_config_encoder *encoder;
> +
> +	if (target->ci_type !=3D &encoder_type) {
> +		DRM_ERROR("Unable to link non-encoders.\n");
> +		return -EINVAL;
> +	}
> +
> +	encoder =3D item_to_config_encoder(target);
> +
> +	if (links->linked_object_bitmap & BIT(encoder->encoder_config_idx)) {
> +		DRM_ERROR(
> +			"Tried to add two symlinks to the same encoder from the same object\n=
");
> +		return -EINVAL;
> +	}
> +
> +	links->linked_object_bitmap |=3D BIT(encoder->encoder_config_idx);
> +
> +	return 0;
> +}
> +
> +static void possible_encoders_drop_link(struct config_item *src,
> +					struct config_item *target)
> +{
> +	struct vkms_config_links *links =3D item_to_config_links(src);
> +	struct vkms_config_encoder *encoder =3D item_to_config_encoder(target);
> +
> +	links->linked_object_bitmap &=3D ~BIT(encoder->encoder_config_idx);
> +}
> +
> +static struct configfs_item_operations possible_encoders_item_ops =3D {
> +	.allow_link =3D &possible_encoders_allow_link,
> +	.drop_link =3D &possible_encoders_drop_link,
> +};
> +
> +static struct config_item_type possible_encoders_group_type =3D {
> +	.ct_item_ops =3D &possible_encoders_item_ops,
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +static void add_possible_encoders(struct config_group *parent,
> +				  struct config_group *possible_encoders)
> +{
> +	config_group_init_type_name(possible_encoders, "possible_encoders",
> +				    &possible_encoders_group_type);
> +	configfs_add_default_group(possible_encoders, parent);
> +}
> +
> +/*
> + * Individual objects (connectors, crtcs, encoders, planes):
> + */
> +
> +/*  Connector item, e.g. /config/vkms/device/connectors/ID */
> +
> +static struct config_item_type connector_type =3D {
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +/*  Crtc item, e.g. /config/vkms/device/crtcs/ID */
> +
> +static struct config_item_type crtc_type =3D {
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +/*  Encoder item, e.g. /config/vkms/device/encoder/ID */
> +
> +static struct config_item_type encoder_type =3D {
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +/*  Plane item, e.g. /config/vkms/device/planes/ID */
> +
> +static ssize_t plane_type_show(struct config_item *item, char *buf)
> +{
> +	struct vkms_config_plane *plane =3D item_to_config_plane(item);
> +	struct vkms_configfs *configfs =3D plane_item_to_configfs(item);
> +	enum drm_plane_type plane_type;
> +
> +	mutex_lock(&configfs->lock);
> +	plane_type =3D plane->type;
> +	mutex_unlock(&configfs->lock);
> +
> +	return sprintf(buf, "%u", plane_type);
> +}
> +
> +static ssize_t plane_type_store(struct config_item *item, const char *bu=
f,
> +				size_t len)
> +{
> +	struct vkms_config_plane *plane =3D item_to_config_plane(item);
> +	struct vkms_configfs *configfs =3D plane_item_to_configfs(item);
> +	int val, ret;
> +
> +	ret =3D kstrtouint(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val !=3D DRM_PLANE_TYPE_PRIMARY && val !=3D DRM_PLANE_TYPE_CURSOR &&
> +	    val !=3D DRM_PLANE_TYPE_OVERLAY)
> +		return -EINVAL;
> +
> +	mutex_lock(&configfs->lock);
> +	plane->type =3D val;
> +	mutex_unlock(&configfs->lock);
> +
> +	return len;
> +}
> +
> +CONFIGFS_ATTR(plane_, type);
> +
> +static struct configfs_attribute *plane_attrs[] =3D {
> +	&plane_attr_type,
> +	NULL,
> +};
> +
> +static struct config_item_type plane_type =3D {
> +	.ct_attrs =3D plane_attrs,
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +/*
> + * Directory groups, e.g. /config/vkms/device/{planes, crtcs, ...}
> + */
> +
> +/* Connectors group: /config/vkms/device/connectors/ */
> +
> +static struct config_group *connectors_group_make(struct config_group *g=
roup,
> +						  const char *name)
> +{
> +	struct vkms_config_connector *connector =3D
> +		kzalloc(sizeof(*connector), GFP_KERNEL);
> +	if (!connector)
> +		return ERR_PTR(-ENOMEM);
> +
> +	config_group_init_type_name(&connector->config_group, name,
> +				    &connector_type);
> +	add_possible_encoders(&connector->config_group,
> +			      &connector->possible_encoders.group);
> +
> +	return &connector->config_group;
> +}
> +
> +static void connectors_group_drop(struct config_group *group,
> +				  struct config_item *item)
> +{
> +	struct vkms_config_connector *connector =3D
> +		item_to_config_connector(item);
> +	kfree(connector);
> +}
> +
> +static struct configfs_group_operations connectors_group_ops =3D {
> +	.make_group =3D &connectors_group_make,
> +	.drop_item =3D &connectors_group_drop,
> +};
> +
> +static struct config_item_type connectors_group_type =3D {
> +	.ct_group_ops =3D &connectors_group_ops,
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +/* CRTCs group: /config/vkms/device/crtcs/ */
> +
> +static struct config_group *crtcs_group_make(struct config_group *group,
> +					     const char *name)
> +{
> +	struct vkms_configfs *configfs =3D
> +		container_of(group, struct vkms_configfs, crtcs_group);
> +	unsigned long next_idx;
> +	struct vkms_config_crtc *crtc;
> +
> +	mutex_lock(&configfs->lock);
> +
> +	next_idx =3D find_first_zero_bit(&configfs->allocated_crtcs,
> +				       VKMS_MAX_OUTPUT_OBJECTS);
> +
> +	if (next_idx =3D=3D VKMS_MAX_OUTPUT_OBJECTS) {
> +		DRM_ERROR("Unable to allocate another CRTC.\n");
> +		mutex_unlock(&configfs->lock);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	crtc =3D kzalloc(sizeof(*crtc), GFP_KERNEL);
> +	if (!crtc) {
> +		DRM_ERROR("Unable to allocate CRTC.\n");
> +		mutex_unlock(&configfs->lock);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	config_group_init_type_name(&crtc->config_group, name, &crtc_type);
> +	crtc->crtc_config_idx =3D next_idx;
> +
> +	set_bit(next_idx, &configfs->allocated_crtcs);
> +
> +	mutex_unlock(&configfs->lock);
> +
> +	return &crtc->config_group;
> +}
> +
> +static void crtcs_group_drop(struct config_group *group,
> +			     struct config_item *item)
> +{
> +	struct vkms_config_crtc *crtc =3D item_to_config_crtc(item);
> +
> +	kfree(crtc);
> +}
> +
> +static struct configfs_group_operations crtcs_group_ops =3D {
> +	.make_group =3D &crtcs_group_make,
> +	.drop_item =3D &crtcs_group_drop,
> +};
> +
> +static struct config_item_type crtcs_group_type =3D {
> +	.ct_group_ops =3D &crtcs_group_ops,
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +/* Encoders group: /config/vkms/device/encoders/ */
> +
> +static struct config_group *encoders_group_make(struct config_group *gro=
up,
> +						const char *name)
> +{
> +	struct vkms_configfs *configfs =3D
> +		container_of(group, struct vkms_configfs, encoders_group);
> +	unsigned long next_idx;
> +	struct vkms_config_encoder *encoder;
> +
> +	mutex_lock(&configfs->lock);
> +
> +	next_idx =3D find_first_zero_bit(&configfs->allocated_encoders,
> +				       VKMS_MAX_OUTPUT_OBJECTS);
> +
> +	if (next_idx =3D=3D VKMS_MAX_OUTPUT_OBJECTS) {
> +		DRM_ERROR("Unable to allocate another encoder.\n");
> +		mutex_unlock(&configfs->lock);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	encoder =3D kzalloc(sizeof(*encoder), GFP_KERNEL);
> +	if (!encoder) {
> +		DRM_ERROR("Unable to allocate encoder.\n");
> +		mutex_unlock(&configfs->lock);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	config_group_init_type_name(&encoder->config_group, name,
> +				    &encoder_type);
> +	add_possible_crtcs(&encoder->config_group,
> +			   &encoder->possible_crtcs.group);
> +	encoder->encoder_config_idx =3D next_idx;
> +	set_bit(next_idx, &configfs->allocated_encoders);
> +
> +	mutex_unlock(&configfs->lock);
> +
> +	return &encoder->config_group;
> +}
> +
> +static void encoders_group_drop(struct config_group *group,
> +				struct config_item *item)
> +{
> +	struct vkms_config_encoder *encoder =3D item_to_config_encoder(item);
> +
> +	kfree(encoder);
> +}
> +
> +static struct configfs_group_operations encoders_group_ops =3D {
> +	.make_group =3D &encoders_group_make,
> +	.drop_item =3D &encoders_group_drop,
> +};
> +
> +static struct config_item_type encoders_group_type =3D {
> +	.ct_group_ops =3D &encoders_group_ops,
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +/* Planes group: /config/vkms/device/planes/ */
> +
> +static struct config_group *make_plane_group(struct config_group *group,
> +					     const char *name)
> +{
> +	struct vkms_config_plane *plane =3D kzalloc(sizeof(*plane), GFP_KERNEL);
> +
> +	if (!plane)
> +		return ERR_PTR(-ENOMEM);
> +
> +	config_group_init_type_name(&plane->config_group, name, &plane_type);
> +	add_possible_crtcs(&plane->config_group, &plane->possible_crtcs.group);
> +
> +	return &plane->config_group;
> +}
> +
> +static void drop_plane_group(struct config_group *group,
> +			     struct config_item *item)
> +{
> +	struct vkms_config_plane *plane =3D item_to_config_plane(item);
> +
> +	kfree(plane);
> +}
> +
> +static struct configfs_group_operations plane_group_ops =3D {
> +	.make_group =3D &make_plane_group,
> +	.drop_item =3D &drop_plane_group,
> +};
> +
> +static struct config_item_type planes_group_type =3D {
> +	.ct_group_ops =3D &plane_group_ops,
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +/* Root directory group, e.g. /config/vkms/device */
> +
> +static ssize_t device_enabled_show(struct config_item *item, char *buf)
> +{
> +	struct vkms_configfs *configfs =3D item_to_configfs(item);
> +	bool is_enabled;
> +
> +	mutex_lock(&configfs->lock);
> +	is_enabled =3D configfs->vkms_device !=3D NULL;
> +	mutex_unlock(&configfs->lock);
> +
> +	return sprintf(buf, "%d", is_enabled);
> +}
> +
> +static ssize_t device_enabled_store(struct config_item *item, const char=
 *buf,
> +				    size_t len)
> +{
> +	struct vkms_configfs *configfs =3D item_to_configfs(item);
> +	struct vkms_device *device;
> +	int value, ret;
> +
> +	ret =3D kstrtoint(buf, 0, &value);
> +	if (ret)
> +		return ret;
> +
> +	if (value !=3D 1)
> +		return -EINVAL;
> +
> +	mutex_lock(&configfs->lock);
> +
> +	if (configfs->vkms_device) {
> +		mutex_unlock(&configfs->lock);
> +		return len;
> +	}
> +
> +	device =3D vkms_add_device(configfs);
> +	mutex_unlock(&configfs->lock);
> +
> +	if (IS_ERR(device))
> +		return -PTR_ERR(device);
> +
> +	return len;
> +}
> +
> +CONFIGFS_ATTR(device_, enabled);
> +
> +static ssize_t device_id_show(struct config_item *item, char *buf)
> +{
> +	struct vkms_configfs *configfs =3D item_to_configfs(item);
> +	int id =3D -1;
> +
> +	mutex_lock(&configfs->lock);
> +	if (configfs->vkms_device)
> +		id =3D configfs->vkms_device->platform->id;
> +
> +	mutex_unlock(&configfs->lock);
> +
> +	return sprintf(buf, "%d", id);
> +}
> +
> +CONFIGFS_ATTR_RO(device_, id);
> +
> +static struct configfs_attribute *device_group_attrs[] =3D {
> +	&device_attr_id,
> +	&device_attr_enabled,
> +	NULL,
> +};
> +
> +static struct config_item_type device_group_type =3D {
> +	.ct_attrs =3D device_group_attrs,
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +static void vkms_configfs_setup_default_groups(struct vkms_configfs *con=
figfs,
> +					       const char *name)
> +{
> +	config_group_init_type_name(&configfs->device_group, name,
> +				    &device_group_type);
> +
> +	config_group_init_type_name(&configfs->connectors_group, "connectors",
> +				    &connectors_group_type);
> +	configfs_add_default_group(&configfs->connectors_group,
> +				   &configfs->device_group);
> +
> +	config_group_init_type_name(&configfs->crtcs_group, "crtcs",
> +				    &crtcs_group_type);
> +	configfs_add_default_group(&configfs->crtcs_group,
> +				   &configfs->device_group);
> +
> +	config_group_init_type_name(&configfs->encoders_group, "encoders",
> +				    &encoders_group_type);
> +	configfs_add_default_group(&configfs->encoders_group,
> +				   &configfs->device_group);
> +
> +	config_group_init_type_name(&configfs->planes_group, "planes",
> +				    &planes_group_type);
> +	configfs_add_default_group(&configfs->planes_group,
> +				   &configfs->device_group);
> +}
> +
> +/* Root directory group and subsystem, e.g. /config/vkms/ */
> +
> +static struct config_group *make_root_group(struct config_group *group,
> +					    const char *name)
> +{
> +	struct vkms_configfs *configfs =3D kzalloc(sizeof(*configfs), GFP_KERNE=
L);
> +
> +	if (!configfs)
> +		return ERR_PTR(-ENOMEM);
> +
> +	vkms_configfs_setup_default_groups(configfs, name);
> +	mutex_init(&configfs->lock);
> +
> +	return &configfs->device_group;
> +}
> +
> +static void drop_root_group(struct config_group *group,
> +			    struct config_item *item)
> +{
> +	struct vkms_configfs *configfs =3D item_to_configfs(item);
> +
> +	mutex_lock(&configfs->lock);
> +	if (configfs->vkms_device)
> +		vkms_remove_device(configfs->vkms_device);
> +	mutex_unlock(&configfs->lock);
> +
> +	kfree(configfs);
> +}
> +
> +static struct configfs_group_operations root_group_ops =3D {
> +	.make_group =3D &make_root_group,
> +	.drop_item =3D &drop_root_group,
> +};
> +
> +static struct config_item_type vkms_type =3D {
> +	.ct_group_ops =3D &root_group_ops,
> +	.ct_owner =3D THIS_MODULE,
> +};
> +
> +static struct configfs_subsystem vkms_subsys =3D {
> +	.su_group =3D {
> +		.cg_item =3D {
> +			.ci_name =3D "vkms",
> +			.ci_type =3D &vkms_type,
> +		},
> +	},
> +	.su_mutex =3D __MUTEX_INITIALIZER(vkms_subsys.su_mutex),
> +};
> +
> +int vkms_init_configfs(void)
> +{
> +	config_group_init(&vkms_subsys.su_group);
> +	return configfs_register_subsystem(&vkms_subsys);
> +}
> +
> +void vkms_unregister_configfs(void)
> +{
> +	configfs_unregister_subsystem(&vkms_subsys);
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 6c94c2b5d529..819e880a8cf7 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -9,8 +9,10 @@
>   * the GPU in DRM API tests.
>   */
> =20
> -#include "asm-generic/errno-base.h"
> +#include <linux/configfs.h>
>  #include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/dma-mapping.h>
> @@ -172,8 +174,8 @@ static int vkms_modeset_init(struct vkms_device *vkms=
dev)
>  	dev->mode_config.preferred_depth =3D 0;
>  	dev->mode_config.helper_private =3D &vkms_mode_config_helpers;
> =20
> -	return vkmsdev->is_default ? vkms_output_init_default(vkmsdev) :
> -				     -EINVAL;
> +	return vkmsdev->configfs ? vkms_output_init(vkmsdev) :
> +				   vkms_output_init_default(vkmsdev);
>  }
> =20
>  static int vkms_platform_probe(struct platform_device *pdev)
> @@ -184,8 +186,10 @@ static int vkms_platform_probe(struct platform_devic=
e *pdev)
>  	void *grp;
> =20
>  	grp =3D devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
> -	if (!grp)
> +	if (!grp) {
> +		DRM_ERROR("Could not open devres group\n");
>  		return -ENOMEM;
> +	}
> =20
>  	vkms_device =3D devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
>  					 struct vkms_device, drm);
> @@ -198,7 +202,7 @@ static int vkms_platform_probe(struct platform_device=
 *pdev)
>  	vkms_device->config.cursor =3D enable_cursor;
>  	vkms_device->config.writeback =3D enable_writeback;
>  	vkms_device->config.overlay =3D enable_overlay;
> -	vkms_device->is_default =3D vkms_device_setup->is_default;
> +	vkms_device->configfs =3D vkms_device_setup->configfs;
> =20
>  	ret =3D dma_coerce_mask_and_coherent(vkms_device->drm.dev,
>  					   DMA_BIT_MASK(64));
> @@ -258,12 +262,43 @@ static struct platform_driver vkms_platform_driver =
=3D {
>  	.driver.name =3D DRIVER_NAME,
>  };
> =20
> +struct vkms_device *vkms_add_device(struct vkms_configfs *configfs)
> +{
> +	struct device *dev =3D NULL;
> +	struct platform_device *pdev;
> +	int max_id =3D 1;
> +	struct vkms_device_setup vkms_device_setup =3D {
> +		.configfs =3D configfs,
> +	};
> +
> +	while ((dev =3D platform_find_device_by_driver(
> +			dev, &vkms_platform_driver.driver))) {
> +		pdev =3D to_platform_device(dev);
> +		max_id =3D max(max_id, pdev->id);
> +	}
> +
> +	pdev =3D platform_device_register_data(NULL, DRIVER_NAME, max_id + 1,
> +					     &vkms_device_setup,
> +					     sizeof(vkms_device_setup));
> +	if (IS_ERR(pdev)) {
> +		DRM_ERROR("Unable to register vkms device'\n");
> +		return ERR_PTR(PTR_ERR(pdev));
> +	}
> +
> +	return platform_get_drvdata(pdev);
> +}
> +
> +void vkms_remove_device(struct vkms_device *vkms_device)
> +{
> +	platform_device_unregister(vkms_device->platform);
> +}
> +
>  static int __init vkms_init(void)
>  {
>  	int ret;
>  	struct platform_device *pdev;
>  	struct vkms_device_setup vkms_device_setup =3D {
> -		.is_default =3D true,
> +		.configfs =3D NULL,
>  	};
> =20
>  	ret =3D platform_driver_register(&vkms_platform_driver);
> @@ -281,6 +316,13 @@ static int __init vkms_init(void)
>  		return PTR_ERR(pdev);
>  	}
> =20
> +	ret =3D vkms_init_configfs();
> +	if (ret) {
> +		DRM_ERROR("Unable to initialize configfs\n");
> +		platform_device_unregister(pdev);
> +		platform_driver_unregister(&vkms_platform_driver);
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -288,6 +330,8 @@ static void __exit vkms_exit(void)
>  {
>  	struct device *dev;
> =20
> +	vkms_unregister_configfs();
> +
>  	while ((dev =3D platform_find_device_by_driver(
>  			NULL, &vkms_platform_driver.driver))) {
>  		// platform_find_device_by_driver increments the refcount. Drop
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 4262dcffd7e1..8cdd7949f661 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -3,6 +3,7 @@
>  #ifndef _VKMS_DRV_H_
>  #define _VKMS_DRV_H_
> =20
> +#include <linux/configfs.h>
>  #include <linux/hrtimer.h>
> =20
>  #include <drm/drm.h>
> @@ -10,6 +11,7 @@
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_plane.h>
>  #include <drm/drm_writeback.h>
> =20
>  #define XRES_MIN    10
> @@ -138,14 +140,65 @@ struct vkms_config {
>  	bool overlay;
>  };
> =20
> +struct vkms_config_links {
> +	struct config_group group;
> +	unsigned long linked_object_bitmap;
> +};
> +
> +struct vkms_config_connector {
> +	struct config_group config_group;
> +	struct vkms_config_links possible_encoders;
> +};
> +
> +struct vkms_config_crtc {
> +	struct config_group config_group;
> +	unsigned long crtc_config_idx;
> +};
> +
> +struct vkms_config_encoder {
> +	struct config_group config_group;
> +	struct vkms_config_links possible_crtcs;
> +	unsigned long encoder_config_idx;
> +};
> +
> +struct vkms_config_plane {
> +	struct vkms_configfs *configfs;
> +	struct config_group config_group;
> +	struct vkms_config_links possible_crtcs;
> +	enum drm_plane_type type;
> +};
> +
> +struct vkms_configfs {
> +	/* Directory group containing connector configs, e.g. /config/vkms/devi=
ce/ */
> +	struct config_group device_group;
> +	/* Directory group containing connector configs, e.g. /config/vkms/devi=
ce/connectors/ */
> +	struct config_group connectors_group;
> +	/* Directory group containing CRTC configs, e.g. /config/vkms/device/cr=
tcs/ */
> +	struct config_group crtcs_group;
> +	/* Directory group containing encoder configs, e.g. /config/vkms/device=
/encoders/ */
> +	struct config_group encoders_group;
> +	/* Directory group containing plane configs, e.g. /config/vkms/device/p=
lanes/ */
> +	struct config_group planes_group;
> +
> +	unsigned long allocated_crtcs;
> +	unsigned long allocated_encoders;
> +
> +	struct mutex lock;
> +
> +	/* The platform device if this is registered, otherwise NULL */
> +	struct vkms_device *vkms_device;
> +};
> +
>  struct vkms_device_setup {
> -	bool is_default;
> +	// Is NULL in the case of the default card.
> +	struct vkms_configfs *configfs;
>  };
> =20
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
> -	bool is_default;
> +	// Is NULL in the case of the default card.
> +	struct vkms_configfs *configfs;
>  	struct vkms_output output;
>  	struct vkms_config config;
>  };
> @@ -164,11 +217,42 @@ struct vkms_device {
>  #define to_vkms_plane_state(target)\
>  	container_of(target, struct vkms_plane_state, base.base)
> =20
> +#define item_to_configfs(item) \
> +	container_of(to_config_group(item), struct vkms_configfs, device_group)
> +
> +#define item_to_config_connector(item)                                  =
  \
> +	container_of(to_config_group(item), struct vkms_config_connector, \
> +		     config_group)
> +
> +#define item_to_config_crtc(item)                                    \
> +	container_of(to_config_group(item), struct vkms_config_crtc, \
> +		     config_group)
> +
> +#define item_to_config_encoder(item)                                    \
> +	container_of(to_config_group(item), struct vkms_config_encoder, \
> +		     config_group)
> +
> +#define item_to_config_plane(item)                                    \
> +	container_of(to_config_group(item), struct vkms_config_plane, \
> +		     config_group)
> +
> +#define item_to_config_links(item) \
> +	container_of(to_config_group(item), struct vkms_config_links, group)
> +
> +#define plane_item_to_configfs(item)                                    =
     \
> +	container_of(to_config_group(item->ci_parent), struct vkms_configfs, \
> +		     planes_group)
> +
> +/* Devices */
> +struct vkms_device *vkms_add_device(struct vkms_configfs *configfs);
> +void vkms_remove_device(struct vkms_device *vkms_device);
> +
>  /* CRTC */
>  struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>  				 struct drm_plane *primary,
>  				 struct drm_plane *cursor);
> =20
> +int vkms_output_init(struct vkms_device *vkmsdev);
>  int vkms_output_init_default(struct vkms_device *vkmsdev);
> =20
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> @@ -191,4 +275,8 @@ void vkms_writeback_row(struct vkms_writeback_job *wb=
, const struct line_buffer
>  int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
>  				    struct vkms_crtc *vkms_crtc);
> =20
> +/* ConfigFS Support */
> +int vkms_init_configfs(void);
> +void vkms_unregister_configfs(void);
> +
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index bfc2e2362c6d..dc69959c5e1d 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -176,3 +176,8 @@ int vkms_output_init_default(struct vkms_device *vkms=
dev)
> =20
>  	return ret;
>  }
> +
> +int vkms_output_init(struct vkms_device *vkmsdev)
> +{
> +	return -EOPNOTSUPP;
> +}
> --=20
> 2.42.0.rc1.204.g551eb34607-goog
>=20

--XKHxjJeNr/LLLTmV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmTsqugACgkQ9jQS5glH
1u82IA//ef8SDqo6MAvJWQ5GzyF0lceaqGGgq6EsRRQQOt/yF8LTWJV6o7aJJOvV
OFEE3ufF66Sla9YAKkYxZOKGeO3TKQ3oh/5psW1nmTZwYoAYGHOibww/b/ECxUo6
b/t0/lppm6DqDPFoTV4mVj0muzT+O08iMDqVyU0UH9r8y+Vz3HWy7vXehqlIhfxg
m+eg9U6ZLCCW0SxndWi0RCEf2EVZm1t3XxZQIX1EPPh8bCJ+Ii+uifJTuseiQSTj
c4Kv4IUCnvnS3f6RCS6K+whLT5NUq0LJj6Om270UvUCqh5su0bxqDLhvj9C34wH/
Vd+0Vwdl1evPKBx2J2oNG8voS/FP2govWNBL5hPE72iJs2P0IVDNNMU5+AahFret
VrMa1R1uENCIDwOXODBI/v6jw91/eJ4f5e++jZLKzgTPm2I7Jcf5kxk/OuNyq2E0
ADWIwfPDYct38MSUQKKla4fzPvYfXR16d/JOfmx25tgX/iwv6G8BkGQ9eOH0+XKS
ZbNpTRrVSIw7WijJHQFxgLBhvRCJFEy+1rDA6FkIEm//t0YWq9O7gZhlEpR3yyrq
3sOQaD3RgXN+8V/wiJwfVN5MKgOMHEG52LdIBL+PKbBaKsOnO9tEQY/LCAXU97m2
8OxBIZwFNrZ+WLWhwqZuO6pZU1DNNckJdr03wEf5/aNyqKuWmTM=
=w4FC
-----END PGP SIGNATURE-----

--XKHxjJeNr/LLLTmV--
