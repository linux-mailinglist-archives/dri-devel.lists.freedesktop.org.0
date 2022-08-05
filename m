Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD7A58B12D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7E6B9DC8;
	Fri,  5 Aug 2022 21:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F9DBA3F2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 21:23:02 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id h8so2618839qvs.6
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 14:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=eAQ4jbMWk0on5JHZqof4aVuLjrj0v8LiL7D1ewEbUqc=;
 b=Pz2yVYVkeRjrwonIPMM7IqiqG2Xf/hRm5V3VWwwhrNmCxBVICmkHRqTZ/mSQzV6km9
 LywUNkU0UDUhC/n3kdjskkiTwWTTzj3Is2WkO5Wd7L2aEUoqX31upxGiyqVSAj/g5uZy
 teulAJCsSIE3sZVdSZpLE3pCzqIBu5lDG/TcbEMRiANmy5NS557yiPftGqpjoi2Qqxjl
 /cPkYJLdUnS0ecDoXJlX2ZUYC/29HxLnNIqnGN15arTkOd+L9wDmZHX2zpvkdIFT1jeU
 9PTr+UQjUorqyvnDLfcdfJyEoXByfVMP9rsrRUXH/Qe1TC7UL0t1W+02hIsNtASeo0v3
 fehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=eAQ4jbMWk0on5JHZqof4aVuLjrj0v8LiL7D1ewEbUqc=;
 b=My0wWvnsItBUbEQvMvezGu470w36DMT1Ex1Omjfcpb7E+jssJBSmKeK9bJRI3bUttb
 6wNUXALG7GET1NhJi2xZKAWcPSeIBYpKo3XvStLTyj7rmVgHDWVQOUhJX4NPf0C7FPE9
 1oQ/gjwcrOr0VIY5/w3PxNsert1cqKpp4G2F+VEUsKXdvXXfgWLEO1gZHgf5d6WifW03
 Ujl4Up2LEaDoLKzioZkFsq0WNtJ3fKH7ey+kSjDXHnKSB1AfX/r0CziZDD3d1y2AUHTJ
 SS0BbobHrhFxOEjTOJWy9gr8crEHiVPEr4q943fhGlfZVUPYMxb0MLEabHH9AIW4tiMd
 tI/A==
X-Gm-Message-State: ACgBeo0EeeF1dbWMHVA3wEPoAxsgec1bwqmKAoZoQavo6tkGZ6mbUj3q
 c8NXs/LFHu1vwOfMaXzgTG6VIA==
X-Google-Smtp-Source: AA6agR7EVN77LIrKl3o8+Wke+y6G0Jmde57BOWLoHCYA+GcRXaeISwwR8H1OjEbHuC54XbUzbi67ow==
X-Received: by 2002:a05:6214:c25:b0:476:eb9c:fc7b with SMTP id
 a5-20020a0562140c2500b00476eb9cfc7bmr7252469qvd.108.1659734581872; 
 Fri, 05 Aug 2022 14:23:01 -0700 (PDT)
Received: from localhost (48.230.85.34.bc.googleusercontent.com.
 [34.85.230.48]) by smtp.gmail.com with ESMTPSA id
 s65-20020a372c44000000b006b5cc25535fsm3595165qkh.99.2022.08.05.14.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:23:01 -0700 (PDT)
Date: Fri, 5 Aug 2022 21:23:00 +0000
From: Sean Paul <sean@poorly.run>
To: Jim Shargo <jshargo@chromium.org>
Subject: Re: [PATCH 4/5] drm/vkms: Add ConfigFS scaffolding to VKMS
Message-ID: <Yu2KNDd02LB99ghX@art_vandelay>
References: <20220722213214.1377835-1-jshargo@chromium.org>
 <20220722213214.1377835-5-jshargo@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722213214.1377835-5-jshargo@chromium.org>
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
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>, jshargo@google.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 05:32:12PM -0400, Jim Shargo wrote:
> This change adds the basic scaffolding for ConfigFS, including setting
> up the default directories. It does not allow for the registration of
> configfs-backed devices, which is complex and provided in a follow-up
> commit.
> 
> This CL includes docs about using ConfigFS with VKMS, but I'll summarize
> in brief here as well (assuming ConfigFS is mounted at /config/):
> 
> To create a new configuration, you can do so via `mkdir
> /config/vkms/my-device`.
> 
> This will create a number of directories and files automatically:
> 
> 	/config
> 	`-- vkms
> 	    `-- my-device
> 		|-- connectors
> 		|-- crtcs
> 		|-- encoders
> 		|-- planes
> 		`-- is_registered
> 
> You can then configure objects by mkdir'ing in each of the directories.
> 
> When you're satisfied, you can `echo 1 > /config/vkms/my-device/is_registered`.
> This will create a new device according to your configuration.
> 
> For now, this will fail, but the next change will add support for it.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---
>  Documentation/gpu/vkms.rst           |  76 ++++
>  drivers/gpu/drm/Kconfig              |   1 +
>  drivers/gpu/drm/vkms/Makefile        |   1 +
>  drivers/gpu/drm/vkms/vkms_configfs.c | 527 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.c      |  28 +-
>  drivers/gpu/drm/vkms/vkms_drv.h      |  75 +++-
>  drivers/gpu/drm/vkms/vkms_output.c   |  11 +-
>  7 files changed, 711 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 9c873c3912cc..f5f8ea0de5bc 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -51,6 +51,82 @@ To disable the driver, use ::
>  
>    sudo modprobe -r vkms
>  
> +Configuration With ConfigFS
> +===========================
> +
> +VKMS is instrumented with support for configuration via `ConfigFS`. With VKMS
> +installed, you can mount ConfigFS at /config/ like so::
> +
> +  mkdir -p /config/
> +  sudo mount -t configfs none /config
> +
> +This allows you to configure multiple virtual cards in addition to an immutable
> +"default" card created by the driver at initialization time.

Is the default for backwards compatibility?

> +
> +To set up a new card, create a new directory under the vkms configfs 
> +directory::
> +
> +  $ mkdir /config/vkms/test
> +
> +With your card created you'll find an new directory ready to be configured::
> +
> +  /config
> +  `-- vkms
> +      |-- default
> +      |   `-- is_registered
> +      `-- test
> +          |-- connectors
> +          |-- crtcs
> +          |-- encoders
> +          |-- planes
> +          `-- is_registered
> +
> +Each directory you add within the connectors, crtcs, encoders, and planes
> +directories will let you configure a new object of that type. Adding new
> +objects will automatically create a set of default files and folders you can
> +use to configure that object.
> +
> +For instance, we can set up a very basic driver like so::
> +
> +  DRM_PLANE_TYPE_PRIMARY=1
> +  DRM_PLANE_TYPE_CURSOR=2
> +  DRM_PLANE_TYPE_OVERLAY=0
> +
> +  mkdir /config/vkms/test/planes/primary
> +  echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/type
> +
> +  mkdir /config/vkms/test/planes/other_primary
> +  echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_primary/type
> +
> +  mkdir /config/vkms/test/planes/cursor
> +  echo $DRM_PLANE_TYPE_CURSOR > /config/vkms/test/planes/cursor/type
> +
> +  mkdir /config/vkms/test/planes/overlay
> +  echo $DRM_PLANE_TYPE_OVERLAY > /config/vkms/test/planes/overlay/type
> +
> +  mkdir /config/vkms/test/crtcs/crtc
> +  mkdir /config/vkms/test/crtcs/crtc_other
> +  mkdir /config/vkms/test/encoders/encoder
> +  mkdir /config/vkms/test/connectors/connector
> +
> +  ln -s /config/vkms/test/encoders/encoder /config/vkms/test/connectors/connector/possible_encoders
> +  ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/encoders/encoder/possible_crtcs/
> +  ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/primary/possible_crtcs/
> +  ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/cursor/possible_crtcs/
> +  ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/overlay/possible_crtcs/
> +  ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/overlay/possible_crtcs/
> +
> +You can see that specific attributes, such as `.../<plane>/type`, can be
> +configured by writing into them. Associating objects together can be done via
> +symlinks.
> +
> +Finally, to register your newly configured objects with DRM so you can use your
> +virtual device, all you need to do is write `1` into the special file 
> +`/config/vkms/test/is_registered``, which will return non-zero on error.
> +
> +When you're done with the virtual card, all you need to do is `rmdir` the root
> +directory.

There seems to be some amount of overlap between this blurb and the one in
vkms_configfs.c. IMO it'd be better to unify these in the source and link it
here using:

.. kernel-doc:: drivers/gpu/drm/vkms/vkms_configfs.c
   :doc: ConfigFS Support for VKMS

> +
>  Testing With IGT
>  ================
>  
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f1422bee3dcc..5c90c82fab6d 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -307,6 +307,7 @@ config DRM_VKMS
>  	depends on DRM && MMU
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_SHMEM_HELPER
> +	select CONFIGFS_FS
>  	select CRC32
>  	default n
>  	help
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 72f779cbfedd..3efb7b0f5319 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -3,6 +3,7 @@ vkms-y := \
>  	vkms_drv.o \
>  	vkms_plane.o \
>  	vkms_output.o \
> +	vkms_configfs.o \
>  	vkms_crtc.o \
>  	vkms_composer.o \
>  	vkms_writeback.o
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> new file mode 100644
> index 000000000000..fa0d8700258e
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -0,0 +1,527 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <linux/configfs.h>
> +#include <linux/kernel.h>

Same comment re: kernel.h

> +#include <linux/mutex.h>
> +
> +#include <drm/drm_plane.h>
> +#include <drm/drm_print.h>
> +
> +#include "vkms_drv.h"
> +
> +/**
> + * DOC: ConfigFS Support for VKMS
> + *
> + * When ConfigFS is mounted, say at /config/, we add a /config/vkms/
> + * directory. Each folder in this directory represents a different
> + * virtual driver. Drivers can be "registered", meaning that they're
> + * available to use as a DRM driver. Initially, this just contains a
> + * registered "default" device.

Nit: s/driver/device/ since the term drm device is much better specified than
drm driver.

> + *
> + * Users can mkdir in this the VKMS directory to begin the process of
> + * configuring a new device. Users can mkdir in the automatically
> + * created "connectors", "crtcs", "encoders", and "planes" folders to
> + * set up those objects.
> + *
> + * In order to create associations between objects, users can symlink
> + * the object's directory. For instance, to make a plane work with a
> + * CRTC, the user will add a symlink like so:
> + * /config/vkms/card/planes/<plane>/possible_crtcs/<crtc_symlink>
> + *
> + * Objects may have files (in ConfigFS-speak, attributes) that allow
> + * for additional configuration. For instance, a user can set the
> + * plane type by writing the appropriate value to the "type" property
> + * in the plane's directory.
> + *
> + * Once the driver is configured, the user can write a "1" to the
> + * "is_registered" file/attribute in the driver's directory. Until a
> + * virtual driver is registered, nothing DRM-related is set up.
> + */
> +
> +static struct config_item_type card_group_type;
> +static struct config_item_type connectors_group_type;
> +static struct config_item_type crtcs_group_type;
> +static struct config_item_type encoders_group_type;
> +static struct config_item_type planes_group_type;

Could you reorder things to avoid these icky forward declarations?

> +
> +static void vkms_configfs_setup_default_groups(struct vkms_configfs *configfs,
> +					       const char *name)
> +{
> +	config_group_init_type_name(&configfs->card_group, name,
> +				    &card_group_type);
> +
> +	config_group_init_type_name(&configfs->connectors_group, "connectors",
> +				    &connectors_group_type);
> +	configfs_add_default_group(&configfs->connectors_group,
> +				   &configfs->card_group);
> +
> +	config_group_init_type_name(&configfs->crtcs_group, "crtcs",
> +				    &crtcs_group_type);
> +	configfs_add_default_group(&configfs->crtcs_group,
> +				   &configfs->card_group);
> +
> +	config_group_init_type_name(&configfs->encoders_group, "encoders",
> +				    &encoders_group_type);
> +	configfs_add_default_group(&configfs->encoders_group,
> +				   &configfs->card_group);
> +
> +	config_group_init_type_name(&configfs->planes_group, "planes",
> +				    &planes_group_type);
> +	configfs_add_default_group(&configfs->planes_group,
> +				   &configfs->card_group);
> +}
> +
> +/* Root directory group and subsystem, e.g. /config/vkms/ */
> +
> +static struct config_group *make_root_group(struct config_group *group,
> +					    const char *name)
> +{
> +	struct vkms_configfs *configfs =
> +		kzalloc(sizeof(struct vkms_configfs), GFP_KERNEL);

Nit: sizeof(*configfs) would be more compact. You could probably use
devm_kzalloc if you passed in device to avoid the kfree in drop_root_group().

> +
> +	if (!configfs)
> +		return ERR_PTR(ENOMEM);
> +
> +	vkms_configfs_setup_default_groups(configfs, name);
> +
> +	return &configfs->card_group;
> +}
> +
> +static void drop_root_group(struct config_group *group,
> +			    struct config_item *item)
> +{
> +	struct vkms_configfs *configfs = item_to_configfs(item);
> +
> +	if (configfs->card)
> +		vkms_card_destroy(configfs->card);
> +
> +	kfree(configfs);
> +}
> +
> +static struct configfs_group_operations root_group_ops = {
> +	.make_group = &make_root_group,
> +	.drop_item = &drop_root_group,
> +};
> +
> +static struct config_item_type vkms_type = {
> +	.ct_group_ops = &root_group_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +static struct configfs_subsystem vkms_subsys = {
> +	.su_group = {
> +		.cg_item = {
> +			.ci_name = "vkms",
> +			.ci_type = &vkms_type,
> +		},
> +	},

If you do the following you can remove the mutex_init() below:

        .su_mutex = __MUTEX_INITIALIZER(vkms_subsys.su_mutex),

> +};
> +
> +int vkms_init_configfs(void)
> +{
> +	config_group_init(&vkms_subsys.su_group);
> +	mutex_init(&vkms_subsys.su_mutex);
> +	return configfs_register_subsystem(&vkms_subsys);
> +}
> +
> +void vkms_unregister_configfs(void)
> +{
> +	configfs_unregister_subsystem(&vkms_subsys);
> +}
> +
> +/*
> + * Common helpers (common sub-groups)
> + */
> +
> +/* Possible CRTCs, e.g. /config/vkms/card/<object>/possible_crtcs/<symlink> */
> +
> +static struct config_item_type crtc_type;

Nit: Same comment re: forward declaration (and below too, I'll stop mentioning
it)

> +
> +static int possible_crtcs_allow_link(struct config_item *src,
> +				     struct config_item *target)
> +{
> +	struct vkms_config_links *links = item_to_config_links(src);
> +	struct vkms_config_crtc *crtc;
> +
> +	if (target->ci_type != &crtc_type) {
> +		DRM_ERROR("Unable to link non-CRTCs.");
> +		return -EINVAL;
> +	}
> +
> +	crtc = item_to_config_crtc(target);
> +
> +	if (links->linked_object_bitmap & (1 << crtc->crtc_config_idx)) {
> +		DRM_ERROR(
> +			"Tried to add two symlinks to the same CRTC from the same object");
> +		return -EINVAL;
> +	}
> +
> +	links->linked_object_bitmap |= 1 << crtc->crtc_config_idx;

Nit: you can replace the shift with BIT(crtc->crtc_config_idx). Same comment
elsewhere in the file.

> +
> +	return 0;
> +}
> +
> +static void possible_crtcs_drop_link(struct config_item *src,
> +				     struct config_item *target)
> +{
> +	struct vkms_config_links *links = item_to_config_links(src);
> +	struct vkms_config_crtc *crtc = item_to_config_crtc(target);
> +
> +	links->linked_object_bitmap &= ~(1 << crtc->crtc_config_idx);
> +}
> +
> +static struct configfs_item_operations possible_crtcs_item_ops = {
> +	.allow_link = &possible_crtcs_allow_link,
> +	.drop_link = &possible_crtcs_drop_link,
> +};
> +
> +static struct config_item_type possible_crtcs_group_type = {
> +	.ct_item_ops = &possible_crtcs_item_ops,
> +	.ct_owner = THIS_MODULE,
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
> +/* Possible encoders, e.g. /config/vkms/card/connector/possible_encoders/<symlink> */
> +
> +static struct config_item_type encoder_type;
> +
> +static int possible_encoders_allow_link(struct config_item *src,
> +					struct config_item *target)
> +{
> +	struct vkms_config_links *links = item_to_config_links(src);
> +	struct vkms_config_encoder *encoder;
> +
> +	if (target->ci_type != &encoder_type) {
> +		DRM_ERROR("Unable to link non-encoders.");
> +		return -EINVAL;
> +	}
> +
> +	encoder = item_to_config_encoder(target);
> +
> +	if (links->linked_object_bitmap & (1 << encoder->encoder_config_idx)) {
> +		DRM_ERROR(
> +			"Tried to add two symlinks to the same encoder from the same object");
> +		return -EINVAL;
> +	}
> +
> +	links->linked_object_bitmap |= 1 << encoder->encoder_config_idx;
> +
> +	return 0;
> +}
> +
> +static void possible_encoders_drop_link(struct config_item *src,
> +					struct config_item *target)
> +{
> +	struct vkms_config_links *links = item_to_config_links(src);
> +	struct vkms_config_encoder *encoder = item_to_config_encoder(target);
> +
> +	links->linked_object_bitmap &= ~(1 << encoder->encoder_config_idx);
> +}
> +
> +static struct configfs_item_operations possible_encoders_item_ops = {
> +	.allow_link = &possible_encoders_allow_link,
> +	.drop_link = &possible_encoders_drop_link,
> +};
> +
> +static struct config_item_type possible_encoders_group_type = {
> +	.ct_item_ops = &possible_encoders_item_ops,
> +	.ct_owner = THIS_MODULE,
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
> +/*  Connector item, e.g. /config/vkms/card/connectors/ID */
> +
> +static struct config_item_type connector_type = {
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +/*  Crtc item, e.g. /config/vkms/card/crtcs/ID */
> +
> +static int crtc_allow_link(struct config_item *src, struct config_item *target)
> +{
> +	// TODO delete?

Could you expand on this TODO?

> +	return 0;
> +}
> +
> +static struct configfs_item_operations crtc_item_ops = {
> +	.allow_link = &crtc_allow_link,
> +};
> +
> +static struct config_item_type crtc_type = {
> +	.ct_item_ops = &crtc_item_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +/*  Encoder item, e.g. /config/vkms/card/encoder/ID */
> +
> +static struct config_item_type encoder_type = {
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +/*  Plane item, e.g. /config/vkms/card/planes/ID */
> +
> +static ssize_t plane_type_show(struct config_item *item, char *buf)
> +{
> +	struct vkms_config_plane *plane = item_to_config_plane(item);
> +	return sprintf(buf, "%u", plane->type);
> +}
> +
> +static ssize_t plane_type_store(struct config_item *item, const char *buf,
> +				size_t len)
> +{
> +	struct vkms_config_plane *plane = item_to_config_plane(item);
> +	int val, ret;
> +
> +	ret = kstrtouint(buf, 10, &val);
> +	if (ret) {
> +		return -ret;

I think kstrtouint already returns negative errno.

> +	}

Nit: Remove braces

> +
> +	if (val != DRM_PLANE_TYPE_PRIMARY && val != DRM_PLANE_TYPE_CURSOR &&
> +	    val != DRM_PLANE_TYPE_OVERLAY) {
> +		return -EINVAL;
> +	}

Nit: Here too

> +
> +	plane->type = val;
> +
> +	return len;
> +}
> +
> +CONFIGFS_ATTR(plane_, type);
> +
> +static struct configfs_attribute *plane_attrs[] = {
> +	&plane_attr_type,
> +	NULL,
> +};
> +
> +static struct config_item_type plane_type = {
> +	.ct_attrs = plane_attrs,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +/*
> + * Directory groups, e.g. /config/vkms/card/{planes, crtcs, ...}
> + */
> +
> +/* Connectors group: /config/vkms/card/connectors/ */
> +
> +static struct config_group *connectors_group_make(struct config_group *group,
> +						  const char *name)
> +{
> +	struct vkms_config_connector *connector =
> +		kzalloc(sizeof(struct vkms_config_connector), GFP_KERNEL);

Nit: Add blank line here, use sizeof(*connector) and consider switching to
devm_kzalloc. There might be other places I missed with this feedback.

> +	if (!connector)
> +		return ERR_PTR(ENOMEM);

Can you please return negative errno? There are a few other places with positive
ERR_PTR values which should be converted.

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
> +	struct vkms_config_connector *connector =
> +		item_to_config_connector(item);

Nit: Here too.

> +	kfree(connector);
> +}
> +
> +static struct configfs_group_operations connectors_group_ops = {
> +	.make_group = &connectors_group_make,
> +	.drop_item = &connectors_group_drop,
> +};
> +
> +static struct config_item_type connectors_group_type = {
> +	.ct_group_ops = &connectors_group_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +/* CRTCs group: /config/vkms/card/crtcs/ */
> +
> +static struct config_group *crtcs_group_make(struct config_group *group,
> +					     const char *name)
> +{
> +	struct vkms_configfs *configfs =
> +		container_of(group, struct vkms_configfs, crtcs_group);
> +	unsigned long next_idx = find_first_zero_bit(&configfs->allocated_crtcs,
> +						     VKMS_MAX_OUTPUT_OBJECTS);
> +	struct vkms_config_crtc *crtc;
> +
> +	if (next_idx == VKMS_MAX_OUTPUT_OBJECTS) {
> +		DRM_ERROR("Unable to allocate another CRTC.");
> +		return ERR_PTR(ENOMEM);
> +	}
> +
> +	crtc = kzalloc(sizeof(struct vkms_config_crtc), GFP_KERNEL);
> +	if (!crtc)
> +		return ERR_PTR(ENOMEM);
> +
> +	config_group_init_type_name(&crtc->config_group, name, &crtc_type);
> +	crtc->crtc_config_idx = next_idx;
> +
> +	set_bit(next_idx, &configfs->allocated_crtcs);
> +
> +	return &crtc->config_group;
> +}
> +
> +static void crtcs_group_drop(struct config_group *group,
> +			     struct config_item *item)
> +{
> +	struct vkms_config_crtc *crtc = item_to_config_crtc(item);
> +	kfree(crtc);
> +}
> +
> +static struct configfs_group_operations crtcs_group_ops = {
> +	.make_group = &crtcs_group_make,
> +	.drop_item = &crtcs_group_drop,
> +};
> +
> +static struct config_item_type crtcs_group_type = {
> +	.ct_group_ops = &crtcs_group_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +/* Encoders group: /config/vkms/card/encoders/ */
> +
> +static struct config_group *encoders_group_make(struct config_group *group,
> +						const char *name)
> +{
> +	struct vkms_configfs *configfs =
> +		container_of(group, struct vkms_configfs, encoders_group);
> +	unsigned long next_idx = find_first_zero_bit(
> +		&configfs->allocated_encoders, VKMS_MAX_OUTPUT_OBJECTS);
> +	struct vkms_config_encoder *encoder;
> +
> +	if (next_idx == VKMS_MAX_OUTPUT_OBJECTS) {
> +		DRM_ERROR("Unable to allocate another encoder.");
> +		return ERR_PTR(ENOMEM);
> +	}
> +
> +	encoder = kzalloc(sizeof(struct vkms_config_encoder), GFP_KERNEL);
> +	if (!encoder)
> +		return ERR_PTR(ENOMEM);
> +
> +	config_group_init_type_name(&encoder->config_group, name,
> +				    &encoder_type);
> +	add_possible_crtcs(&encoder->config_group,
> +			   &encoder->possible_crtcs.group);
> +	encoder->encoder_config_idx = next_idx;
> +	set_bit(next_idx, &configfs->allocated_encoders);
> +
> +	return &encoder->config_group;
> +}
> +
> +static void encoders_group_drop(struct config_group *group,
> +				struct config_item *item)
> +{
> +	struct vkms_config_encoder *encoder = item_to_config_encoder(item);
> +	kfree(encoder);
> +}
> +
> +static struct configfs_group_operations encoders_group_ops = {
> +	.make_group = &encoders_group_make,
> +	.drop_item = &encoders_group_drop,
> +};
> +
> +static struct config_item_type encoders_group_type = {
> +	.ct_group_ops = &encoders_group_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +/* Planes group: /config/vkms/card/planes/ */
> +
> +static struct config_group *make_plane_group(struct config_group *group,
> +					     const char *name)
> +{
> +	struct vkms_config_plane *plane =
> +		kzalloc(sizeof(struct vkms_config_plane), GFP_KERNEL);
> +	if (!plane)
> +		return ERR_PTR(ENOMEM);
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
> +	struct vkms_config_plane *plane = item_to_config_plane(item);
> +	kfree(plane);
> +}
> +
> +static struct configfs_group_operations plane_group_ops = {
> +	.make_group = &make_plane_group,
> +	.drop_item = &drop_plane_group,
> +};
> +
> +static struct config_item_type planes_group_type = {
> +	.ct_group_ops = &plane_group_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +/* Root directory group, e.g. /config/vkms/card */
> +
> +static ssize_t card_is_registered_show(struct config_item *item, char *buf)
> +{
> +	struct vkms_configfs *configfs = item_to_configfs(item);
> +	return sprintf(buf, "%d", configfs->card != NULL);
> +}
> +
> +static ssize_t card_is_registered_store(struct config_item *item,
> +					const char *buf, size_t len)
> +{
> +	struct vkms_configfs *configfs = item_to_configfs(item);
> +	struct vkms_card *card;
> +	int value, ret;
> +
> +	ret = kstrtoint(buf, 0, &value);
> +	if (ret)
> +		return ret;
> +
> +	if (value != 1)
> +		return -EINVAL;
> +
> +	if (configfs->card)
> +		return len;
> +
> +	card = vkms_card_init(item->ci_name, configfs);
> +	if (IS_ERR(card))
> +		return -PTR_ERR(card);

I just realized that vkms_card_init() returns a combination of positive and
negative errnos (encoded as PTR). We'll probably want to convert all of those to
negative errnos and return PTR_ERR(card) here.

Generally speaking, everything should return negative errno on error.

> +
> +	return len;
> +}
> +
> +CONFIGFS_ATTR(card_, is_registered);
> +
> +static struct configfs_attribute *card_group_attrs[] = {
> +	&card_attr_is_registered,
> +	NULL,
> +};
> +
> +static struct config_item_type card_group_type = {
> +	.ct_attrs = card_group_attrs,
> +	.ct_owner = THIS_MODULE,
> +};
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 266c9f643f70..37b95ca28672 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -9,6 +9,9 @@
>   * the GPU in DRM API tests.
>   */
>  
> +#include <linux/configfs.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -152,7 +155,7 @@ static int vkms_modeset_init(struct vkms_card *card)
>  	dev->mode_config.preferred_depth = 0;
>  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>  
> -	return card->is_default ? vkms_output_init_default(card, 0) : -ENOTSUPP;
> +	return card->is_default ? vkms_output_init_default(card, 0) : vkms_output_init(card, 0);
>  }
>  
>  static void vkms_device_destroy(void)
> @@ -166,7 +169,7 @@ static void vkms_device_destroy(void)
>  	memset(&vkms_device, 0, sizeof(struct vkms_device));
>  }
>  
> -struct vkms_card *vkms_card_init(const char *name, bool is_default)
> +struct vkms_card *vkms_card_init(const char *name, struct vkms_configfs *configfs)
>  {
>  	char unique_name[64] = { 0 };
>  	struct platform_device *pdev;
> @@ -190,7 +193,7 @@ struct vkms_card *vkms_card_init(const char *name, bool is_default)
>  		ret = ENOMEM;
>  		goto out_platform_device;
>  	}
> -
> +	

Nit: Trailing whitespace introduction?

>  	card = devm_drm_dev_alloc(&pdev->dev, &vkms_driver, struct vkms_card,
>  				  drm);
>  	if (IS_ERR(card)) {
> @@ -202,7 +205,8 @@ struct vkms_card *vkms_card_init(const char *name, bool is_default)
>  	card->platform = pdev;
>  	card->drm.unique = card->name_buf;
>  	card->vkms_device = &vkms_device;
> -	card->is_default = is_default;
> +	card->configfs = configfs;
> +	card->is_default = configfs == NULL;

IMO we should get rid of is_default and just check !configfs if they're
equivalent.

>  	card->is_registered = false;
>  	card->resource_group_id = grp;
>  
> @@ -235,7 +239,10 @@ struct vkms_card *vkms_card_init(const char *name, bool is_default)
>  
>  	devres_close_group(&pdev->dev, grp);
>  	list_add_tail(&card->node, &vkms_device.cards);
> -	
> +
> +	if (configfs)
> +		configfs->card = card;
> +
>  	return card;
>  
>  out_release_group:
> @@ -260,16 +267,24 @@ void vkms_card_destroy(struct vkms_card *card)
>  static int __init vkms_init(void)
>  {
>  	struct vkms_card *card;
> +	int ret;
>  
>  	vkms_device.config.cursor = enable_cursor;
>  	vkms_device.config.writeback = enable_writeback;
>  	vkms_device.config.overlay = enable_overlay;
>  	INIT_LIST_HEAD(&vkms_device.cards);
> +	
> +	ret = vkms_init_configfs();
> +	if (ret) {
> +		DRM_ERROR("Unable to initialize configfs\n");
> +		return ret;
> +	}
>  
>  	card = vkms_card_init("default", /* configfs */ NULL);
>  	if (IS_ERR(card)) {
> -		DRM_ERROR("Unable to init default card");
> +		DRM_ERROR("Unable to init default card\n");

Does this belong in an earlier change?

>  		vkms_device_destroy();
> +		vkms_unregister_configfs();

vkms_unregister_configfs() always directly follows vkms_device_destroy(), seems
like it could just be called from destroy?

>  		return PTR_ERR(card);
>  	}
>  
> @@ -279,6 +294,7 @@ static int __init vkms_init(void)
>  static void __exit vkms_exit(void)
>  {
>  	vkms_device_destroy();
> +	vkms_unregister_configfs();
>  }
>  
>  module_init(vkms_init);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 30ae06d7af71..f43e4c563863 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -3,6 +3,7 @@
>  #ifndef _VKMS_DRV_H_
>  #define _VKMS_DRV_H_
>  
> +#include <linux/configfs.h>
>  #include <linux/hrtimer.h>
>  #include <linux/kernel.h>
>  
> @@ -10,6 +11,7 @@
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_plane.h>
>  #include <drm/drm_writeback.h>
>  
>  #define XRES_MIN    20
> @@ -116,11 +118,59 @@ struct vkms_config {
>  	bool overlay;
>  };
>  
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
> +	struct config_group config_group;
> +	struct vkms_config_links possible_crtcs;
> +	enum drm_plane_type type;
> +};
> +
> +struct vkms_card;
> +
> +struct vkms_configfs {
> +	/* Directory group containing connector configs, e.g. /config/vkms/card/ */
> +	struct config_group card_group;
> +	/* Directory group containing connector configs, e.g. /config/vkms/card/connectors/ */
> +	struct config_group connectors_group;
> +	/* Directory group containing CRTC configs, e.g. /config/vkms/card/crtcs/ */
> +	struct config_group crtcs_group;
> +	/* Directory group containing encoder configs, e.g. /config/vkms/card/encoders/ */
> +	struct config_group encoders_group;
> +	/* Directory group containing plane configs, e.g. /config/vkms/card/planes/ */
> +	struct config_group planes_group;
> +	
> +	unsigned long allocated_crtcs;
> +	unsigned long allocated_encoders;

For bitmasks you probably want to explicitly specify their length by using
u32/u64 types. This probably applies elsewhere too.

> +
> +	struct vkms_card *card;
> +};
> +
>  struct vkms_card {
>  	struct platform_device *platform;
>  	struct drm_device drm;
>  	struct list_head node;
>  	struct vkms_output output;
> +	struct vkms_configfs *configfs;
>  	struct vkms_device *vkms_device;
>  	/* storage for the value of drm->unique, giving this dev a unique busid */
>  	char name_buf[64];
> @@ -149,8 +199,27 @@ struct vkms_device {
>  #define to_vkms_plane_state(target)\
>  	container_of(target, struct vkms_plane_state, base.base)
>  
> +#define item_to_configfs(item)\
> +	container_of(to_config_group(item), struct vkms_configfs, card_group)
> +
> +#define item_to_config_connector(item)\
> +	container_of(to_config_group(item), struct vkms_config_connector, config_group)
> +
> +#define item_to_config_crtc(item) \
> +	container_of(to_config_group(item), struct vkms_config_crtc, config_group)
> +
> +#define item_to_config_encoder(item) \
> +	container_of(to_config_group(item), struct vkms_config_encoder, config_group)
> +
> +#define item_to_config_plane(item) \
> +	container_of(to_config_group(item), struct vkms_config_plane, config_group)
> +
> +#define item_to_config_links(item) \
> +	container_of(to_config_group(item), struct vkms_config_links, group)
> +
>  /* Cards */
> -struct vkms_card *vkms_card_init(const char *name, bool is_default);
> +struct vkms_card *vkms_card_init(const char *name,
> +				 struct vkms_configfs *configfs);
>  void vkms_card_destroy(struct vkms_card *card);
>  
>  /* CRTC */
> @@ -176,4 +245,8 @@ void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled);
>  /* Writeback */
>  int vkms_enable_writeback_connector(struct vkms_card *card, struct vkms_crtc *vkms_crtc);
>  
> +/* ConfigFS Support */
> +int vkms_init_configfs(void);
> +void vkms_unregister_configfs(void);
> +
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 2b72d8e763a8..e343a9c1f311 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -1,10 +1,14 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
> -#include "vkms_drv.h"
> +#include <linux/configfs.h>
> +#include <linux/kernel.h>
> +
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
> +#include "vkms_drv.h"
> +
>  static void vkms_connector_destroy(struct drm_connector *connector)
>  {
>  	drm_connector_cleanup(connector);
> @@ -171,3 +175,8 @@ int vkms_output_init_default(struct vkms_card *card, int index)
>  
>  	return ret;
>  }
> +
> +int vkms_output_init(struct vkms_card *card, int index)
> +{
> +	return -ENOTSUPP;
> +}

I think you can drop this from the patch and introduce it when it's useful.

> -- 
> 2.37.1.359.gd136c6c3e2-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
