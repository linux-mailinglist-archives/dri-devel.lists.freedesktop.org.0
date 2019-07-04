Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8555F721
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 13:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3DA6E32D;
	Thu,  4 Jul 2019 11:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828886E32A;
 Thu,  4 Jul 2019 11:12:33 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k18so5755162ljc.11;
 Thu, 04 Jul 2019 04:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=6AGps1TjpwhlUOIDW0wfZ2+PMXWrnH6nfkX5lTs2xRw=;
 b=WZ3vUi2PxTp5R29Y+Y8ZLACrZd61Wx2YdS811xLEiWc/ONpxoKQB0yDHXxamuJSu/d
 l1B6D4/2c7HbS5za256ijFzIyhlz9f0tlqrr4LvmGcxZLOTZ5NzvrcArOeVipQv0gtSm
 r9D3xDmQtoHtUXYrw99fnyVveUDA6xSCDIJfUVedhjD562j6c71EZbDvnCL2TjGSwmRW
 lHukV14sfjnohDOzPAaLU/j4lQ+/MeMtO5qERdO5VPj489mF5H4TON5BmrQl0SZU0PEq
 TWus0LOnoKQuVLetHzq2lG2peckX9h5uuAX9gc0I36MSBwk7AUmAT0WUZh8fpR2Eh5K7
 bDyg==
X-Gm-Message-State: APjAAAW3u4PVM7BC8loFiKGNFRAHHfleZRc+5ltEwF5LFicS5lKhTMBu
 NK9US0fU/PF2+s9HQ9Nyvcff1cVU
X-Google-Smtp-Source: APXvYqwH1SdHbwv2UVtipX0IL09qnRo6/C9dqdc9hk0J544AJSb8284ttQ7MV7SJpxBJtauQVoZfxg==
X-Received: by 2002:a2e:63cd:: with SMTP id s74mr24182552lje.164.1562238751927; 
 Thu, 04 Jul 2019 04:12:31 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z30sm923018lfj.63.2019.07.04.04.12.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 04:12:31 -0700 (PDT)
Date: Thu, 4 Jul 2019 14:12:27 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Message-ID: <20190704141227.048bbef5@eldfell.localdomain>
In-Reply-To: <20190507162745.25600-10-ramalingam.c@intel.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
 <20190507162745.25600-10-ramalingam.c@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=6AGps1TjpwhlUOIDW0wfZ2+PMXWrnH6nfkX5lTs2xRw=;
 b=sOENypYEDzfqcQROgX4sytP7I9u5ztb+j/fOEguLaKhMytR9vuJaPT3zb9v4UD8i5T
 KYKOlpEJaEYIu8TUorvV/MQtCrKLxH0Nbx/ifmM/A4YlK08ntYMHqhQaxBB36awTJG7X
 fuhnLyTMKuaO/sXyIcv4V5zdUYGH3+AHUbGtLcxa4iow0UBSnxNBHNcXyo53JqlX7woO
 iJ0SLNwn21rZpU+nL+Kc/007k+9s4SIZq5lyrMG2vqiXblHh+sraIwlq6H+uGP5wRpy5
 Qu6p69HbV2TFzCBOm/bisvn04Y/zPGgMh9f8nLqk1Qsoq6ggRuX1zpWmxlrq+B2e0hbE
 z+Dw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, gwan-gyeong.mun@intel.com
Content-Type: multipart/mixed; boundary="===============0144731049=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0144731049==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iCEpovGxtrtcHj9QbJ=dTwz"; protocol="application/pgp-signature"

--Sig_/iCEpovGxtrtcHj9QbJ=dTwz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  7 May 2019 21:57:43 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> DRM API for generating uevent for a status changes of connector's
> property.
>=20
> This uevent will have following details related to the status change:
>=20
>   HOTPLUG=3D1, CONNECTOR=3D<connector_id> and PROPERTY=3D<property_id>
>=20
> Need ACK from this uevent from userspace consumer.
>=20
> v2:
>   Minor fixes at KDoc comments [Daniel]
> v3:
>   Check the property is really attached with connector [Daniel]
>=20
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 35 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_sysfs.h     |  5 ++++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 18b1ac442997..63fa951a20db 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -21,6 +21,7 @@
>  #include <drm/drm_sysfs.h>
>  #include <drm/drmP.h>
>  #include "drm_internal.h"
> +#include "drm_crtc_internal.h"
> =20
>  #define to_drm_minor(d) dev_get_drvdata(d)
>  #define to_drm_connector(d) dev_get_drvdata(d)
> @@ -320,6 +321,9 @@ void drm_sysfs_lease_event(struct drm_device *dev)
>   * Send a uevent for the DRM device specified by @dev.  Currently we only
>   * set HOTPLUG=3D1 in the uevent environment, but this could be expanded=
 to
>   * deal with other types of events.
> + *
> + * Any new uapi should be using the drm_sysfs_connector_status_event()
> + * for uevents on connector status change.
>   */
>  void drm_sysfs_hotplug_event(struct drm_device *dev)
>  {
> @@ -332,6 +336,37 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_sysfs_hotplug_event);
> =20
> +/**
> + * drm_sysfs_connector_status_event - generate a DRM uevent for connector
> + * property status change
> + * @connector: connector on which property status changed
> + * @property: connector property whoes status changed.
> + *
> + * Send a uevent for the DRM device specified by @dev.  Currently we
> + * set HOTPLUG=3D1 and connector id along with the attached property id
> + * related to the status change.
> + */
> +void drm_sysfs_connector_status_event(struct drm_connector *connector,
> +				      struct drm_property *property)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	char hotplug_str[] =3D "HOTPLUG=3D1", conn_id[30], prop_id[30];
> +	char *envp[4] =3D { hotplug_str, conn_id, prop_id, NULL };
> +
> +	WARN_ON(!drm_mode_obj_find_prop_id(&connector->base,
> +					   property->base.id));
> +
> +	snprintf(conn_id, ARRAY_SIZE(conn_id),
> +		 "CONNECTOR=3D%u", connector->base.id);
> +	snprintf(prop_id, ARRAY_SIZE(prop_id),
> +		 "PROPERTY=3D%u", property->base.id);
> +
> +	DRM_DEBUG("generating connector status event\n");
> +
> +	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_sysfs_connector_status_event);
> +
>  static void drm_sysfs_release(struct device *dev)
>  {
>  	kfree(dev);
> diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
> index 4f311e836cdc..d454ef617b2c 100644
> --- a/include/drm/drm_sysfs.h
> +++ b/include/drm/drm_sysfs.h
> @@ -4,10 +4,13 @@
> =20
>  struct drm_device;
>  struct device;
> +struct drm_connector;
> +struct drm_property;
> =20
>  int drm_class_device_register(struct device *dev);
>  void drm_class_device_unregister(struct device *dev);
> =20
>  void drm_sysfs_hotplug_event(struct drm_device *dev);
> -
> +void drm_sysfs_connector_status_event(struct drm_connector *connector,
> +				      struct drm_property *property);
>  #endif

Hi,

this patch is completely missing the UAPI documentation.

Weston in
https://gitlab.freedesktop.org/wayland/weston/merge_requests/48
does have good looking code to parse this event.


Thanks,
pq

--Sig_/iCEpovGxtrtcHj9QbJ=dTwz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0d3xsACgkQI1/ltBGq
qqcOGRAAqGi8Fq0WjMV9B/lSxAggL7TAvXpcq1I35SmuAXu1XZyFRbO6fj+fI0pQ
6pV91Z2qb1beCZm8nS5CV3l9wQXsxuLqMZJTc2Lk6TxLhmQbaM1/i1LHuL5DWzbe
6VDLh7gWie1Osqu2qmxl0glbPJyx5GBbmysoXHoKqQmr1/s5v0sakL00AA/gWwml
kEThnPfzcSsmWJeVNIKYqcrluslomuUgz3VLmhAuTSM2rMN1ffj4gEDTEx2VmYQq
Dug2px6MWMSrSnSHUuG3+GLVz1hrX8tsURLeyeF0G2tw6JdZgvKH9Gj5OH7AQqrw
zStNvCHbbs/hniW3gwIi/2rnrfpZquVhwYkrQP0qA7XbKQ3N1qcszcuZP8hRIn3D
Ed5xX+4Q1pS8lkPIHwzzwXAu98IshSk4PXyMmLtm5z4YTbVDnx2OiKrcE0b3B9KH
MCooeZmG9eQ2N5e7gIbe7YULTfLlbJb3LOMopmuLZRNILX7xnYq+29rorPu5hse6
oTU6WOSKFHzzTgVdaXRC7F5DgFyN6wmkI2SxPUHHlgQqxKbnmaTTYtjGhdYKcIy+
pQt+OkTEZ8z6Ki3cSRoIeiZ6HpCkbKXjWeduG6MaYo31uQrCzDRSbBnnyU769AJ4
2jY02NAuNEZTi6IjowyBs3tPFgycPWxqqNNsIxvNkvdOTJE2FhM=
=j3uw
-----END PGP SIGNATURE-----

--Sig_/iCEpovGxtrtcHj9QbJ=dTwz--

--===============0144731049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0144731049==--
