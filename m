Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E31AC262
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2019 00:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6ED892B7;
	Fri,  6 Sep 2019 22:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E81892B7;
 Fri,  6 Sep 2019 22:16:19 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id f12so16221885iog.12;
 Fri, 06 Sep 2019 15:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=38nnCfPigNI1/uHMmV2XQ1uO6AO0xaUYtuRBzn2zHCQ=;
 b=JiGrYvB48ROpX/XmB1nUbfTttdbqKGoTsu+wTBAXnZGaqYaB5TgxZ2YL4XHT36ZO8I
 g7SQ6pmMpxgoeUPBgMPI6itTpR32MZ0AavSrjbM7q8bg0ngQpnYxQVAvBqBZr5xfSii5
 2WVDEMEPIjp7VLGLraYlnxLpGjFN8bZMrqFaApMRMSXM42FSkKYXrn1ua1gLchfLMPfG
 CbrEF86ihEAIlA6CG8pCqLc78yjpvLRthCYPjD+dP5BalN6Sf7wXjl8pgH0M3mDbg6w9
 uorAC3ZmrTwYdIIKclrjvGJ/UiXbBvjBxB5Jv994i/MiUDMMKWSlYqRI1qVogH2wRzHo
 cNfw==
X-Gm-Message-State: APjAAAU377lfJ+3ks3X0KK8sJt1BBiTfRCqbQ5o0EDiwLzQFfndAZKdm
 ib5JzB5ggPknQfOtWVDk466b0C/Pup1xJpLcMkTpKg==
X-Google-Smtp-Source: APXvYqwDZRv4SZ0zNi01uQULmpyHePOo6igTtKNh8i2C69PvVrz+h05HhRCYxcj12Vx+9O/UZI1uttqIEvBiGPx/7FM=
X-Received: by 2002:a5d:9a01:: with SMTP id s1mr516030iol.255.1567808178461;
 Fri, 06 Sep 2019 15:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190903214040.2386-1-sonny.jiang@amd.com>
In-Reply-To: <20190903214040.2386-1-sonny.jiang@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 6 Sep 2019 18:15:41 -0400
Message-ID: <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
Subject: Re: [PATCH] drm: add drm device name
To: dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=38nnCfPigNI1/uHMmV2XQ1uO6AO0xaUYtuRBzn2zHCQ=;
 b=MNmg2wwCvLreQD3jZOQtkENmmlww2DvJi1H4DEKyNpYmBIioQAupIIpffbSamiSi/k
 TU8RAq5UTNuFMpsRIM11kaEVOOZzrgbapUOPzrAw/wvNa+fCGK6N8mIZhfF7R2Z4obJR
 vZCI5+1P4visaYCLP/xvZC7IviZu/gMByHWfILsTJhLPClfiyttTV9Mt80gxFGdcsZNV
 OKA4la0HP/ShikJxbLnd8IIlcwvlx33Rp3Nme0PvHv/MaMN1QgUUpcdOonoqVrad7ZRt
 lxapQSMHwHDHwfGWPZDT2Ic3losiUc13t9f8vJKclpx9/w0H8sC0bEpj6tjgfQ0sOJRG
 YaWw==
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0449115473=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0449115473==
Content-Type: multipart/alternative; boundary="0000000000008d9f850591e9c93b"

--0000000000008d9f850591e9c93b
Content-Type: text/plain; charset="UTF-8"

+ dri-devel

On Tue, Sep 3, 2019 at 5:41 PM Jiang, Sonny <Sonny.Jiang@amd.com> wrote:

> Add DRM device name and use DRM_IOCTL_VERSION ioctl drmVersion::desc
> passing it to user space
> instead of unused DRM driver name descriptor.
>
> Change-Id: I809f6d3e057111417efbe8fa7cab8f0113ba4b21
> Signed-off-by: Sonny Jiang <sonny.jiang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 ++
>  drivers/gpu/drm/drm_drv.c                  | 17 +++++++++++++++++
>  drivers/gpu/drm/drm_ioctl.c                |  2 +-
>  include/drm/drm_device.h                   |  3 +++
>  include/drm/drm_drv.h                      |  1 +
>  5 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 67b09cb2a9e2..8f0971cea363 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2809,6 +2809,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>         /* init the mode config */
>         drm_mode_config_init(adev->ddev);
>
> +       drm_dev_set_name(adev->ddev, amdgpu_asic_name[adev->asic_type]);
> +
>         r = amdgpu_device_ip_init(adev);
>         if (r) {
>                 /* failed in exclusive mode due to timeout */
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 862621494a93..6c33879bb538 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -802,6 +802,7 @@ void drm_dev_fini(struct drm_device *dev)
>         mutex_destroy(&dev->struct_mutex);
>         drm_legacy_destroy_members(dev);
>         kfree(dev->unique);
> +       kfree(dev->name);
>  }
>  EXPORT_SYMBOL(drm_dev_fini);
>
> @@ -1078,6 +1079,22 @@ int drm_dev_set_unique(struct drm_device *dev,
> const char *name)
>  }
>  EXPORT_SYMBOL(drm_dev_set_unique);
>
> +/**
> + * drm_dev_set_name - Set the name of a DRM device
> + * @dev: device of which to set the name
> + * @name: name to be set
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_dev_set_name(struct drm_device *dev, const char *name)
> +{
> +       kfree(dev->name);
> +       dev->name = kstrdup(name, GFP_KERNEL);
> +
> +       return dev->name ? 0 : -ENOMEM;
> +}
> +EXPORT_SYMBOL(drm_dev_set_name);
> +
>  /*
>   * DRM Core
>   * The DRM core module initializes all global DRM objects and makes them
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 2263e3ddd822..61f02965106b 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -506,7 +506,7 @@ int drm_version(struct drm_device *dev, void *data,
>                                 dev->driver->date);
>         if (!err)
>                 err = drm_copy_field(version->desc, &version->desc_len,
> -                               dev->driver->desc);
> +                               dev->name);
>
>         return err;
>  }
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 7f9ef709b2b6..e29912c484e4 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -123,6 +123,9 @@ struct drm_device {
>         /** @unique: Unique name of the device */
>         char *unique;
>
> +       /** @name: device name */
> +       char *name;
> +
>         /**
>          * @struct_mutex:
>          *
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 68ca736c548d..f742e2bde467 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -798,6 +798,7 @@ static inline bool drm_drv_uses_atomic_modeset(struct
> drm_device *dev)
>
>
>  int drm_dev_set_unique(struct drm_device *dev, const char *name);
> +int drm_dev_set_name(struct drm_device *dev, const char *name);
>
>
>  #endif
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--0000000000008d9f850591e9c93b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+ dri-devel<br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 3, 2019 at 5:41 PM Jiang, Sonny=
 &lt;<a href=3D"mailto:Sonny.Jiang@amd.com">Sonny.Jiang@amd.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add DRM devi=
ce name and use DRM_IOCTL_VERSION ioctl drmVersion::desc passing it to user=
 space<br>
instead of unused DRM driver name descriptor.<br>
<br>
Change-Id: I809f6d3e057111417efbe8fa7cab8f0113ba4b21<br>
Signed-off-by: Sonny Jiang &lt;<a href=3D"mailto:sonny.jiang@amd.com" targe=
t=3D"_blank">sonny.jiang@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |=C2=A0 2 ++<br>
=C2=A0drivers/gpu/drm/drm_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 17 +++++++++++++++++<br>
=C2=A0drivers/gpu/drm/drm_ioctl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0include/drm/drm_device.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0include/drm/drm_drv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A05 files changed, 24 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c<br>
index 67b09cb2a9e2..8f0971cea363 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
@@ -2809,6 +2809,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* init the mode config */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_mode_config_init(adev-&gt;ddev);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dev_set_name(adev-&gt;ddev, amdgpu_asic_nam=
e[adev-&gt;asic_type]);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D amdgpu_device_ip_init(adev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* failed in exclus=
ive mode due to timeout */<br>
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c<br>
index 862621494a93..6c33879bb538 100644<br>
--- a/drivers/gpu/drm/drm_drv.c<br>
+++ b/drivers/gpu/drm/drm_drv.c<br>
@@ -802,6 +802,7 @@ void drm_dev_fini(struct drm_device *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_destroy(&amp;dev-&gt;struct_mutex);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_legacy_destroy_members(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(dev-&gt;unique);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(dev-&gt;name);<br>
=C2=A0}<br>
=C2=A0EXPORT_SYMBOL(drm_dev_fini);<br>
<br>
@@ -1078,6 +1079,22 @@ int drm_dev_set_unique(struct drm_device *dev, const=
 char *name)<br>
=C2=A0}<br>
=C2=A0EXPORT_SYMBOL(drm_dev_set_unique);<br>
<br>
+/**<br>
+ * drm_dev_set_name - Set the name of a DRM device<br>
+ * @dev: device of which to set the name<br>
+ * @name: name to be set<br>
+ *<br>
+ * Return: 0 on success or a negative error code on failure.<br>
+ */<br>
+int drm_dev_set_name(struct drm_device *dev, const char *name)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(dev-&gt;name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;name =3D kstrdup(name, GFP_KERNEL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return dev-&gt;name ? 0 : -ENOMEM;<br>
+}<br>
+EXPORT_SYMBOL(drm_dev_set_name);<br>
+<br>
=C2=A0/*<br>
=C2=A0 * DRM Core<br>
=C2=A0 * The DRM core module initializes all global DRM objects and makes t=
hem<br>
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c<br>
index 2263e3ddd822..61f02965106b 100644<br>
--- a/drivers/gpu/drm/drm_ioctl.c<br>
+++ b/drivers/gpu/drm/drm_ioctl.c<br>
@@ -506,7 +506,7 @@ int drm_version(struct drm_device *dev, void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev-&gt;driver-&gt;date);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!err)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D drm_copy_fi=
eld(version-&gt;desc, &amp;version-&gt;desc_len,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;driver-&gt;desc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;name);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
=C2=A0}<br>
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h<br>
index 7f9ef709b2b6..e29912c484e4 100644<br>
--- a/include/drm/drm_device.h<br>
+++ b/include/drm/drm_device.h<br>
@@ -123,6 +123,9 @@ struct drm_device {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** @unique: Unique name of the device */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *unique;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @name: device name */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *name;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /**<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* @struct_mutex:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h<br>
index 68ca736c548d..f742e2bde467 100644<br>
--- a/include/drm/drm_drv.h<br>
+++ b/include/drm/drm_drv.h<br>
@@ -798,6 +798,7 @@ static inline bool drm_drv_uses_atomic_modeset(struct d=
rm_device *dev)<br>
<br>
<br>
=C2=A0int drm_dev_set_unique(struct drm_device *dev, const char *name);<br>
+int drm_dev_set_name(struct drm_device *dev, const char *name);<br>
<br>
<br>
=C2=A0#endif<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/amd-gfx</a></blockquote></div>

--0000000000008d9f850591e9c93b--

--===============0449115473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0449115473==--
