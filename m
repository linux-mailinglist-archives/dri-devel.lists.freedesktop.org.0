Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8250E74E065
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 23:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E833310E2DA;
	Mon, 10 Jul 2023 21:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CA310E2DA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 21:45:08 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-bcb6dbc477eso4559039276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 14:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689025506; x=1691617506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e4br8m75UQLAFBW55S+BMhoPzicapbO24k6v6FEOg9M=;
 b=ncwSyUKtPtk26GVkCYe2MpRpHRyTfYbgUmlX5H8OciauhCtRH3+wOoNvyuBKJxYvk3
 rtZink6BvMKotnMG0fs1mkjvqp2M5BAhPBfGwey0poicMedJqf+c1J+JHI4a3DqCbosO
 LzRKmwPjQvLueHRjaIIyGytDUWQSFLvf0wB48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689025506; x=1691617506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e4br8m75UQLAFBW55S+BMhoPzicapbO24k6v6FEOg9M=;
 b=eYpPWLpbi9CdAAuS+yGSDGQujYLUCYm1p0f83xkFEHQGW+/BbNnx9icmYO8vYgcP/Z
 N61UdNctJDnkr7Y9L8ZwnzTVA10Wp/w4AHdQ802iMdSDRKjkHEW/oT1/bJE4IAyVLcrr
 cR6GXtKPNj5lB2QBHivNmfr0UdcsEMcuqLHwyidYZ85zpPAktted5XpYo1XRMXEnAsQu
 BAiGKwivER/4GdAiJPkmEp3INLZhOmDV/ehyI82DvtmASFEuF57un2Onus+eJSiBob4p
 PPUsqABTxzbw5kqB2xgVJOEb+oFHHixXtsGsBcvTIAgznya9HRLZY6m5sixHAbD8AuHk
 TCcw==
X-Gm-Message-State: ABy/qLbvJkFMGpVI4fml/vJBpnWuEa8sKE6QDkFZHe/ET1gnGOrM4md9
 wEa/eCweCJreR29geTj119DKmqTerWsrTmuHGYVPiQ==
X-Google-Smtp-Source: APBJJlETfSHdSEzh5Ly+6+PqJhj7LbMYBgMfHO133PBN/obyHsnTHJuBTADBy1P1X+s2bGg4v21UZA==
X-Received: by 2002:a25:abae:0:b0:c1b:4347:b3d4 with SMTP id
 v43-20020a25abae000000b00c1b4347b3d4mr11153120ybi.7.1689025506195; 
 Mon, 10 Jul 2023 14:45:06 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 a1-20020a25bac1000000b00c6051b16f8bsm155995ybk.8.2023.07.10.14.45.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 14:45:05 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-579de633419so56653687b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 14:45:05 -0700 (PDT)
X-Received: by 2002:a0d:ef42:0:b0:576:888e:6219 with SMTP id
 y63-20020a0def42000000b00576888e6219mr12392088ywe.34.1689025504785; Mon, 10
 Jul 2023 14:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230623222353.97283-1-jshargo@chromium.org>
 <20230706050820.3853824-1-brpol@chromium.org>
In-Reply-To: <20230706050820.3853824-1-brpol@chromium.org>
From: Jim Shargo <jshargo@chromium.org>
Date: Mon, 10 Jul 2023 17:44:51 -0400
X-Gmail-Original-Message-ID: <CACmi3jEfrbJR53vjY33t4VrLjDxejcnLJGiV_QiHP5ZfNJDm0A@mail.gmail.com>
Message-ID: <CACmi3jEfrbJR53vjY33t4VrLjDxejcnLJGiV_QiHP5ZfNJDm0A@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms Add hotplug support via configfs to VKMS.
To: Brandon Pollack <brpol@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 corbet@lwn.net, yixie@chromium.org, mripard@kernel.org, melissa.srw@gmail.com,
 mairacanal@riseup.net, dri-devel@lists.freedesktop.org, jshargo@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yay! Glad to see the configfs stuff being extended!

Overall I don't see anything of major concern. Great stuff!

I'd be curious about how the IGT tests would look for this. Creating
before and after registration would be sufficient until removal is
added.

On Thu, Jul 6, 2023 at 1:08=E2=80=AFAM Brandon Pollack <brpol@chromium.org>=
 wrote:
>
> This change adds the ability to read or write a "1" or a "0" to the
> newly added "connected" attribute of a connector in the vkms entry in
> configfs.
>
> A write will trigger a call to drm_kms_helper_hotplug_event, causing a
> hotplug uevent.
>
> With this we can write virtualized multidisplay tests that involve
> hotplugging displays (eg recompositing windows when a monitor is turned
> off).
>
> ---
>
> This is a first attempt and I am sure I could use some feedback.  I have
> this working locally and I'm continuing to develop the test framework
> around this prototype, but I'm ready to switch gears back to addressing
> your feedback!
>
> This is also only my second patch ever to the kernel, so if my patch
> sending process is a little strange or I'm missing something feedback is
> appreciated.
>
> I also am basing these off of jshargo's not yet submitted configFS
> changes so I added an in-reply-to to that series.  Not sure if that is
> alright.
>
> Signed-off-by: Brandon Pollack <brpol@chromium.org>
> ---
>  Documentation/gpu/vkms.rst            |  2 +-
>  drivers/gpu/drm/vkms/vkms_configfs.c  | 96 ++++++++++++++++++++++-----
>  drivers/gpu/drm/vkms/vkms_drv.h       | 11 +++
>  drivers/gpu/drm/vkms/vkms_output.c    | 47 ++++++++++++-
>  drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
>  5 files changed, 138 insertions(+), 20 deletions(-)
>
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 2c342ef0fb7b..1eaae9f48693 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -144,7 +144,7 @@ Runtime Configuration
>  We want to vkms instances without having to reload the module. Such
>  configuration can be added as extensions to vkms's ConfigFS support. Use=
-cases:
>
> -- Hotplug/hotremove connectors on the fly (to be able to test DP MST han=
dling
> +- Hotremove connectors on the fly (to be able to test DP MST handling
>    of compositors).
>
>  - Change output configuration: Plug/unplug screens, change EDID, allow c=
hanging
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/=
vkms_configfs.c
> index f5eed6d23dcd..84cdb8d02ee7 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>
> +#include "drm/drm_probe_helper.h"
>  #include <linux/configfs.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> @@ -30,7 +31,7 @@
>   *
>   *   mkdir /config/vkms/test
>   *
> - * With your device created you'll find an new directory ready to be
> + * With your device created you'll find an new directory ready to be
>   * configured::
>   *
>   *   /config
> @@ -39,6 +40,7 @@
>   *       |   `-- enabled
>   *       `-- test
>   *           |-- connectors
> + *                `-- connected
>   *           |-- crtcs
>   *           |-- encoders
>   *           |-- planes
> @@ -48,25 +50,25 @@
>   * directories will let you configure a new object of that type. Adding =
new
>   * objects will automatically create a set of default files and folders =
you can
>   * use to configure that object.
> - *
> + *
>   * For instance, we can set up a two-output device like so::
> - *
> + *
>   *   DRM_PLANE_TYPE_PRIMARY=3D1
>   *   DRM_PLANE_TYPE_CURSOR=3D2
>   *   DRM_PLANE_TYPE_OVERLAY=3D0
> - *
> + *
>   *   mkdir /config/vkms/test/planes/primary
>   *   echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/typ=
e
> - *
> + *
>   *   mkdir /config/vkms/test/planes/other_primary
>   *   echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_prima=
ry/type
> - *
> + *
>   *   mkdir /config/vkms/test/planes/cursor
>   *   echo $DRM_PLANE_TYPE_CURSOR > /config/vkms/test/planes/cursor/type
> - *
> + *
>   *   mkdir /config/vkms/test/planes/overlay
>   *   echo $DRM_PLANE_TYPE_OVERLAY > /config/vkms/test/planes/overlay/typ=
e
> - *
> + *
>   *   mkdir /config/vkms/test/crtcs/crtc
>   *   mkdir /config/vkms/test/crtcs/crtc_other
>   *   mkdir /config/vkms/test/encoders/encoder
> @@ -75,25 +77,33 @@
>   * You can see that specific attributes, such as ``.../<plane>/type``, c=
an be
>   * configured by writing into them. Associating objects together can be =
done via
>   * symlinks::
> - *
> + *
>   *   ln -s /config/vkms/test/encoders/encoder /config/vkms/test/connecto=
rs/connector/possible_encoders
> - *
> + *
>   *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/encoders/encod=
er/possible_crtcs/
>   *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/primary=
/possible_crtcs/
>   *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/cursor/=
possible_crtcs/
>   *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/overlay=
/possible_crtcs/
> - *
> + *
>   *   ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/o=
verlay/possible_crtcs/
>   *   ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/o=
ther_primary/possible_crtcs/
> - *
> + *
>   * Finally, to enable your configured device, just write 1 to the ``enab=
led``
>   * file::
> - *
> + *
>   *   echo 1 > /config/vkms/test/enabled
>   *
> + * By default no display is "connected" so to connect a connector you'll=
 also
> + * have to write 1 to a connectors "connected" attribute::
> + *
> + *   echo 1 > /config/vkms/test/connectors/connector/connected
> + *

[nit] I think it'd be nice to note in the docs that this can be set
before enabling

> + * One an verify that this is worked using the `modetest` utility or the

can

> + * equivalent for your platform.
> + *
>   * When you're done with the virtual device, you can clean up the device=
 like
>   * so::
> - *
> + *
>   *   echo 0 > /config/vkms/test/enabled
>   *
>   *   rm /config/vkms/test/connectors/connector/possible_encoders/encoder
> @@ -236,7 +246,58 @@ static void add_possible_encoders(struct config_grou=
p *parent,
>
>  /*  Connector item, e.g. /config/vkms/device/connectors/ID */
>
> +static ssize_t connector_connected_show(struct config_item *item, char *=
buf)
> +{
> +       struct vkms_config_connector *connector =3D
> +               item_to_config_connector(item);
> +       struct vkms_configfs *configfs =3D connector_item_to_configfs(ite=
m);
> +       bool connected =3D false;
> +
> +       mutex_lock(&configfs->lock);
> +       connected =3D connector->connected;
> +       mutex_unlock(&configfs->lock);
> +
> +       return sprintf(buf, "%d\n", connected);
> +}
> +
> +static ssize_t connector_connected_store(struct config_item *item,
> +                                        const char *buf, size_t len)
> +{
> +       struct vkms_config_connector *connector =3D
> +               item_to_config_connector(item);
> +       struct vkms_configfs *configfs =3D connector_item_to_configfs(ite=
m);
> +       int val, ret;
> +
> +       ret =3D kstrtouint(buf, 10, &val);
> +       if (ret)
> +               return ret;
> +
> +       if (val !=3D 1 && val !=3D 0)
> +               return -EINVAL;
> +
> +       mutex_lock(&configfs->lock);
> +       connector->connected =3D val;
> +       if (!connector->connector) {
> +               pr_warn("VKMS Device %s is not yet enabled, connector wil=
l be enabled on start",
> +                       configfs->device_group.cg_item.ci_name);

IMO I don't think that this rises to warning, since many usecases
might set it by default. INFO if anything?

This also slightly changes the behavior of the API--configs that would
have been connected in the past now aren't. The changes aren't merged
yet, so IDK how much of an actual concern that is for now.

> +       }
> +       mutex_unlock(&configfs->lock);
> +
> +       if (connector->connector)
> +               drm_kms_helper_hotplug_event(connector->connector->dev);
> +
> +       return len;
> +}
> +
> +CONFIGFS_ATTR(connector_, connected);
> +
> +static struct configfs_attribute *connector_attrs[] =3D {
> +       &connector_attr_connected,
> +       NULL,
> +};
> +
>  static struct config_item_type connector_type =3D {
> +       .ct_attrs =3D connector_attrs,
>         .ct_owner =3D THIS_MODULE,
>  };
>
> @@ -264,7 +325,7 @@ static ssize_t plane_type_show(struct config_item *it=
em, char *buf)
>         plane_type =3D plane->type;
>         mutex_unlock(&configfs->lock);
>
> -       return sprintf(buf, "%u", plane_type);
> +       return sprintf(buf, "%u\n", plane_type);
>  }
>
>  static ssize_t plane_type_store(struct config_item *item, const char *bu=
f,
> @@ -319,6 +380,7 @@ static struct config_group *connectors_group_make(str=
uct config_group *group,
>                                     &connector_type);
>         add_possible_encoders(&connector->config_group,
>                               &connector->possible_encoders.group);
> +       connector->connected =3D false;
>
>         return &connector->config_group;
>  }
> @@ -496,7 +558,7 @@ static ssize_t device_enabled_show(struct config_item=
 *item, char *buf)
>         is_enabled =3D configfs->vkms_device !=3D NULL;
>         mutex_unlock(&configfs->lock);
>
> -       return sprintf(buf, "%d", is_enabled);
> +       return sprintf(buf, "%d\n", is_enabled);
>  }
>
>  static ssize_t device_enabled_store(struct config_item *item, const char=
 *buf,
> @@ -553,7 +615,7 @@ static ssize_t device_id_show(struct config_item *ite=
m, char *buf)
>         }
>         mutex_unlock(&configfs->lock);
>
> -       return sprintf(buf, "%d", id);
> +       return sprintf(buf, "%d\n", id);
>  }
>
>  CONFIGFS_ATTR_RO(device_, id);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 8f476ef4009b..7b9b189511c2 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -3,6 +3,7 @@
>  #ifndef _VKMS_DRV_H_
>  #define _VKMS_DRV_H_
>
> +#include "drm/drm_connector.h"
>  #include <linux/configfs.h>
>  #include <linux/hrtimer.h>
>
> @@ -135,7 +136,9 @@ struct vkms_config_links {
>
>  struct vkms_config_connector {
>         struct config_group config_group;
> +       struct drm_connector *connector;
>         struct vkms_config_links possible_encoders;
> +       bool connected;
>  };
>
>  struct vkms_config_crtc {
> @@ -208,6 +211,10 @@ struct vkms_device {
>  #define item_to_configfs(item) \
>         container_of(to_config_group(item), struct vkms_configfs, device_=
group)
>
> +#define connector_item_to_configfs(item)                                =
     \
> +       container_of(to_config_group(item->ci_parent), struct vkms_config=
fs, \
> +                    connectors_group)
> +
>  #define item_to_config_connector(item)                                  =
  \
>         container_of(to_config_group(item), struct vkms_config_connector,=
 \
>                      config_group)
> @@ -267,4 +274,8 @@ int vkms_enable_writeback_connector(struct vkms_devic=
e *vkmsdev,
>  int vkms_init_configfs(void);
>  void vkms_unregister_configfs(void);
>
> +/* Connector hotplugging */
> +enum drm_connector_status vkms_connector_detect(struct drm_connector *co=
nnector,
> +                                               bool force);
> +
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index 806ff01954ad..28a50d2149f5 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>
> +#include <drm/drm_print.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
> @@ -8,10 +9,12 @@
>  #include <drm/drm_plane.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> +#include <linux/printk.h>
>
>  #include "vkms_drv.h"
>
>  static const struct drm_connector_funcs vkms_connector_funcs =3D {
> +       .detect =3D vkms_connector_detect,
>         .fill_modes =3D drm_helper_probe_single_connector_modes,
>         .destroy =3D drm_connector_cleanup,
>         .reset =3D drm_atomic_helper_connector_reset,
> @@ -19,6 +22,48 @@ static const struct drm_connector_funcs vkms_connector=
_funcs =3D {
>         .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_sta=
te,
>  };
>
> +static const struct vkms_config_connector *
> +find_config_for_connector(struct drm_connector *connector)
> +{
> +       struct vkms_device *vkms =3D drm_device_to_vkms_device(connector-=
>dev);
> +       struct vkms_configfs *configfs =3D vkms->configfs;
> +       struct config_item *item;
> +
> +       if (!configfs) {
> +               pr_info("Default connector has no configfs entry");
> +               return NULL;
> +       }
> +
> +       list_for_each_entry(item, &configfs->connectors_group.cg_children=
,
> +                           ci_entry) {
> +               struct vkms_config_connector *config_connector =3D
> +                       item_to_config_connector(item);
> +               if (config_connector->connector =3D=3D connector)
> +                       return config_connector;
> +       }
> +
> +       pr_warn("Could not find config to match connector %s, but configf=
s was initialized",
> +               connector->name);
> +
> +       return NULL;
> +}
> +
> +enum drm_connector_status vkms_connector_detect(struct drm_connector *co=
nnector,
> +                                               bool force)
> +{
> +       enum drm_connector_status status =3D connector_status_connected;
> +       const struct vkms_config_connector *config_connector =3D
> +               find_config_for_connector(connector);
> +
> +       if (!config_connector)
> +               return connector_status_connected;
> +
> +       if (!config_connector->connected)
> +               status =3D connector_status_disconnected;
> +
> +       return status;
> +}
> +
>  static const struct drm_encoder_funcs vkms_encoder_funcs =3D {
>         .destroy =3D drm_encoder_cleanup,
>  };
> @@ -218,12 +263,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>                 struct vkms_config_connector *config_connector =3D
>                         item_to_config_connector(item);
>                 struct drm_connector *connector =3D vkms_connector_init(v=
kmsdev);
> -
>                 if (IS_ERR(connector)) {
>                         DRM_ERROR("Failed to init connector from config: =
%s",
>                                   item->ci_name);
>                         return PTR_ERR(connector);
>                 }
> +               config_connector->connector =3D connector;
>
>                 for (int j =3D 0; j < output->num_connectors; j++) {
>                         struct encoder_map *encoder =3D &encoder_map[j];
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index a77d9a6c9b74..47449979c564 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -145,7 +145,7 @@ static void vkms_wb_atomic_commit(struct drm_connecto=
r *conn,
>         spin_lock_irq(&vkms_crtc->composer_lock);
>         crtc_state->active_writeback =3D active_wb;
>         crtc_state->wb_pending =3D true;
> -       spin_unlock_irq(&output->composer_lock);
> +       spin_unlock_irq(&vkms_crtc->composer_lock);
>
>         wb_frame_info->offset =3D fb->offsets[0];
>         wb_frame_info->pitch =3D fb->pitches[0];
> --
> 2.41.0.255.g8b1d071c50-goog
>
