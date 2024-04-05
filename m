Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9FE89A3CA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 19:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF7A10E383;
	Fri,  5 Apr 2024 17:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZXvPOZU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AE410E2A2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 17:59:31 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-56e32b439c5so430015a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712339970; x=1712944770; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxQtwbSHbxkYXoMg2wRUHnRYLyYbVqO8UKCdJttIqfc=;
 b=ZXvPOZU1D7ZjN7CVqX3fkgVJ+t3X2UY2NbnbWhKb69+HgV3eFWU8fIzDt9O0iVXwgp
 xUUSPKwoeSuGARb57JmBq5UWLI2kFc42Vzy/2fnC0KBXI5sIdFuvlQ+dS77BwFcCVcD2
 sm30EEFyZTi/GxkuXJfIIxi5DAV4JFoBTrF3erAj0W+FD/2WtE6oJCVJZEoyiGAh1rbL
 NVFOSVPDdXRrUHTpqxH21nM1Wm3nLR+cLSDlcl6C+lHHMqbDfB1PD2UwOlGnliQzozw7
 Ey/02AJ644YTbf+5YesfTOmuliQG2LZzQs8MeO0KUhFdo2EfmE4UsCxONKI0x70ztiI1
 GWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712339970; x=1712944770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RxQtwbSHbxkYXoMg2wRUHnRYLyYbVqO8UKCdJttIqfc=;
 b=c26HKXGMRR7bW+PYrCykZQ8Wy8loi4P7aXwQ1e12FuJCcPpVVfhdYmyRF9k0Z8d9De
 fXKPjeokNDrHDV2YBFb7GANRMA/0uHe71f7+Kfd4SVSVcWzW0Ywtwbn7RoCFQBg3ay6p
 WkZYmxt0jO2mJosxw4o9oVNUzHGBbHvR1K4ffT0axMzomOIcMiT6zniwUKNx4kSe63Fx
 pGPS2xU46YEX0Pg/WKChDe/qkj27dl5M9NQL/a3YEraM7Il1DxlHZfgLfwwnSbCGyF+p
 6ud9gXiKKZIARBnuJQ2fTLSzYRlAg2AAXobVTItS22Fhp1v/yDUm8Oald9vfN/XYuxnq
 s3DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzfzNM+XZb25vc8IfmW2q2aAYM+sAJ6pp213WXQpT3zLv8orV+tPDeC3T78VOLk9ZlZm7c74I9nMDT5cUCWHlVje/KetVecdrH5sgR9/z8
X-Gm-Message-State: AOJu0YykWTLzkPRXm4uh7F5U59ZQ41R6Fl1KyEclw7GcISp+N43zBgv9
 F7EWOSILvydaYBBq7iYZ+7XZ8bHuSZknDtpaOhL05SO3RjJc88gyK/Zv5AnMdv7Fsk1ukf5K2ms
 vwkuwCgiykdnz3BW7tjureP6amEc=
X-Google-Smtp-Source: AGHT+IH4r9q9rrjrKyAJ7QfGnmsE9QleqStJZC2e963aF+0dladLufCglT2YNtAWewZ6AchQx+vhek+cVD39oOWcTvo=
X-Received: by 2002:a50:cd97:0:b0:565:f7c7:f23c with SMTP id
 p23-20020a50cd97000000b00565f7c7f23cmr2035660edi.3.1712339969335; Fri, 05 Apr
 2024 10:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240403182951.724488-1-adrian.larumbe@collabora.com>
In-Reply-To: <20240403182951.724488-1-adrian.larumbe@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 5 Apr 2024 10:59:17 -0700
Message-ID: <CAF6AEGsWtJs2xcZx59P9_maxn1RqCO6-4GwEp2fL31bZtTyuoA@mail.gmail.com>
Subject: Re: [PATCH] drm/sysfs: Add drm class-wide attribute to get active
 device clients
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, kernel@collabora.com, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 3, 2024 at 11:37=E2=80=AFAM Adri=C3=A1n Larumbe
<adrian.larumbe@collabora.com> wrote:
>
> Up to this day, all fdinfo-based GPU profilers must traverse the entire
> /proc directory structure to find open DRM clients with fdinfo file
> descriptors. This is inefficient and time-consuming.
>
> This patch adds a new device class attribute that will install a sysfs fi=
le
> per DRM device, which can be queried by profilers to get a list of PIDs f=
or
> their open clients. This file isn't human-readable, and it's meant to be
> queried only by GPU profilers like gputop and nvtop.
>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Christopher Healy <healych@amazon.com>
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

It does seem like a good idea.. idk if there is some precedent to
prefer binary vs ascii in sysfs, but having a way to avoid walking
_all_ processes is a good idea.

BR,
-R

> ---
>  drivers/gpu/drm/drm_internal.h       |  2 +-
>  drivers/gpu/drm/drm_privacy_screen.c |  2 +-
>  drivers/gpu/drm/drm_sysfs.c          | 89 ++++++++++++++++++++++------
>  3 files changed, 74 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_interna=
l.h
> index 2215baef9a3e..9a399b03d11c 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -145,7 +145,7 @@ bool drm_master_internal_acquire(struct drm_device *d=
ev);
>  void drm_master_internal_release(struct drm_device *dev);
>
>  /* drm_sysfs.c */
> -extern struct class *drm_class;
> +extern struct class drm_class;
>
>  int drm_sysfs_init(void);
>  void drm_sysfs_destroy(void);
> diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_p=
rivacy_screen.c
> index 6cc39e30781f..2fbd24ba5818 100644
> --- a/drivers/gpu/drm/drm_privacy_screen.c
> +++ b/drivers/gpu/drm/drm_privacy_screen.c
> @@ -401,7 +401,7 @@ struct drm_privacy_screen *drm_privacy_screen_registe=
r(
>         mutex_init(&priv->lock);
>         BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
>
> -       priv->dev.class =3D drm_class;
> +       priv->dev.class =3D &drm_class;
>         priv->dev.type =3D &drm_privacy_screen_type;
>         priv->dev.parent =3D parent;
>         priv->dev.release =3D drm_privacy_screen_device_release;
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index a953f69a34b6..56ca9e22c720 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -58,8 +58,6 @@ static struct device_type drm_sysfs_device_connector =
=3D {
>         .name =3D "drm_connector",
>  };
>
> -struct class *drm_class;
> -
>  #ifdef CONFIG_ACPI
>  static bool drm_connector_acpi_bus_match(struct device *dev)
>  {
> @@ -128,6 +126,62 @@ static const struct component_ops typec_connector_op=
s =3D {
>
>  static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
>
> +static ssize_t clients_show(struct device *cd, struct device_attribute *=
attr, char *buf)
> +{
> +       struct drm_minor *minor =3D cd->driver_data;
> +       struct drm_device *ddev =3D minor->dev;
> +       struct drm_file *priv;
> +       ssize_t offset =3D 0;
> +       void *pid_buf;
> +
> +       if (minor->type !=3D DRM_MINOR_RENDER)
> +               return 0;
> +
> +       pid_buf =3D kvmalloc(PAGE_SIZE, GFP_KERNEL);
> +       if (!pid_buf)
> +               return 0;
> +
> +       mutex_lock(&ddev->filelist_mutex);
> +       list_for_each_entry_reverse(priv, &ddev->filelist, lhead) {
> +               struct pid *pid;
> +
> +               if (drm_WARN_ON(ddev, (PAGE_SIZE - offset) < sizeof(pid_t=
)))
> +                       break;
> +
> +               rcu_read_lock();
> +               pid =3D rcu_dereference(priv->pid);
> +               (*(pid_t *)(pid_buf + offset)) =3D pid_vnr(pid);
> +               rcu_read_unlock();
> +
> +               offset +=3D sizeof(pid_t);
> +       }
> +       mutex_unlock(&ddev->filelist_mutex);
> +
> +       if (offset < PAGE_SIZE)
> +               (*(pid_t *)(pid_buf + offset)) =3D 0;
> +
> +       memcpy(buf, pid_buf, offset);
> +
> +       kvfree(pid_buf);
> +
> +       return offset;
> +
> +}
> +static DEVICE_ATTR_RO(clients);
> +
> +static struct attribute *drm_device_attrs[] =3D {
> +       &dev_attr_clients.attr,
> +       NULL,
> +};
> +ATTRIBUTE_GROUPS(drm_device);
> +
> +struct class drm_class =3D {
> +       .name           =3D "drm",
> +       .dev_groups     =3D drm_device_groups,
> +};
> +
> +static bool drm_class_initialised;
> +
>  /**
>   * drm_sysfs_init - initialize sysfs helpers
>   *
> @@ -142,18 +196,19 @@ int drm_sysfs_init(void)
>  {
>         int err;
>
> -       drm_class =3D class_create("drm");
> -       if (IS_ERR(drm_class))
> -               return PTR_ERR(drm_class);
> +       err =3D class_register(&drm_class);
> +       if (err)
> +               return err;
>
> -       err =3D class_create_file(drm_class, &class_attr_version.attr);
> +       err =3D class_create_file(&drm_class, &class_attr_version.attr);
>         if (err) {
> -               class_destroy(drm_class);
> -               drm_class =3D NULL;
> +               class_destroy(&drm_class);
>                 return err;
>         }
>
> -       drm_class->devnode =3D drm_devnode;
> +       drm_class.devnode =3D drm_devnode;
> +
> +       drm_class_initialised =3D true;
>
>         drm_sysfs_acpi_register();
>         return 0;
> @@ -166,12 +221,12 @@ int drm_sysfs_init(void)
>   */
>  void drm_sysfs_destroy(void)
>  {
> -       if (IS_ERR_OR_NULL(drm_class))
> +       if (!drm_class_initialised)
>                 return;
>         drm_sysfs_acpi_unregister();
> -       class_remove_file(drm_class, &class_attr_version.attr);
> -       class_destroy(drm_class);
> -       drm_class =3D NULL;
> +       class_remove_file(&drm_class, &class_attr_version.attr);
> +       class_destroy(&drm_class);
> +       drm_class_initialised =3D false;
>  }
>
>  static void drm_sysfs_release(struct device *dev)
> @@ -372,7 +427,7 @@ int drm_sysfs_connector_add(struct drm_connector *con=
nector)
>                 return -ENOMEM;
>
>         device_initialize(kdev);
> -       kdev->class =3D drm_class;
> +       kdev->class =3D &drm_class;
>         kdev->type =3D &drm_sysfs_device_connector;
>         kdev->parent =3D dev->primary->kdev;
>         kdev->groups =3D connector_dev_groups;
> @@ -550,7 +605,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor=
 *minor)
>                         minor_str =3D "card%d";
>
>                 kdev->devt =3D MKDEV(DRM_MAJOR, minor->index);
> -               kdev->class =3D drm_class;
> +               kdev->class =3D &drm_class;
>                 kdev->type =3D &drm_sysfs_device_minor;
>         }
>
> @@ -579,10 +634,10 @@ struct device *drm_sysfs_minor_alloc(struct drm_min=
or *minor)
>   */
>  int drm_class_device_register(struct device *dev)
>  {
> -       if (!drm_class || IS_ERR(drm_class))
> +       if (!drm_class_initialised)
>                 return -ENOENT;
>
> -       dev->class =3D drm_class;
> +       dev->class =3D &drm_class;
>         return device_register(dev);
>  }
>  EXPORT_SYMBOL_GPL(drm_class_device_register);
>
> base-commit: 45c734fdd43db14444025910b4c59dd2b8be714a
> --
> 2.44.0
>
