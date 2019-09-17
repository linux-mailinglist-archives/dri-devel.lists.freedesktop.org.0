Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F15BAB44C7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 02:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1A16EAB2;
	Tue, 17 Sep 2019 00:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059806EAAC;
 Tue, 17 Sep 2019 00:06:55 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id r26so3250033ioh.8;
 Mon, 16 Sep 2019 17:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PnnJfaovXmPSUefwi8d5uYVtKpfZtE6+IKO9zn2U5Fc=;
 b=I48iL0Lqqtpu9bjR/SGP2uAjVrOtX6LEz0rnADIhM5HmnTlQC5/eon06cq6rp3pqCm
 CjNTS23+wjQ7/rVa1mwG055XGCN30qSra/V0K/LuzyFUqJA14avHiixUSr5+DtOhVz1C
 Kg7sb1LWaaAaIQHLLtI4HsS89vgTW2cZKqIsCcPqgiQBJy0SW+adZE10xUGQdG5ZbgFl
 NNOvlNR7cvD925CUzXVO+R0qD1dsknRceudjToPf1/9t1L6TKZxd0oqMGt0T23A2r9VG
 eDi5ZkuCDih6cNRm2+QndK/FJm5AccLaW7Z1JJf0Frxw2PMf81grsQ0lzzxb04c1Zi7+
 w81w==
X-Gm-Message-State: APjAAAWYepWCOA8CSzi4RGzeOTJX5wIMOxIBKyjxdgd7VEfHjmU1TUd7
 oXwZ+Q7lyurMBIjR1mAUhRKMRaPVAHSVc8ghDHLPxA==
X-Google-Smtp-Source: APXvYqwO3tA1ywDX2ktZL5BvrqmcTUV3LlRL9KlhqMKNAHTL9zvbNI9GH6E+9Bb19HDwwaAqfgdcOH8hYEBnwCHAQog=
X-Received: by 2002:a5d:9a01:: with SMTP id s1mr601748iol.255.1568678813015;
 Mon, 16 Sep 2019 17:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 16 Sep 2019 20:06:16 -0400
Message-ID: <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
Subject: Re: [PATCH] drm: add drm device name
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PnnJfaovXmPSUefwi8d5uYVtKpfZtE6+IKO9zn2U5Fc=;
 b=RILWdZoMBMVAWs9uvq3y1ToUuNPDxpK6pC17cozPhzc9BiGTaj4qJ+eBlE+KuJ211r
 wgiufyyLS0W1MAhksF01PcquDm/xjqAZUhYNkSOR7CZrOl9D0DmYWygwKRbHgtK/AuLZ
 C90EJqTgMnbO4CS3KXLZVPTiuFNkOPqGpxOkFjY1KgRwET94EkJpSkfZ+OOf43FFCiBR
 CSmkOKEht94VPvcw6RwFpxJ+zCRLS7yX8qiZPGy5ffGk6KVK5LAx+pEdZ9lDY82uuv+U
 9KPwM3En2Y2UO1p6zsKOZH2boZpmyXRoWWYl5Egdr/YoQKZvGETLLwQ4qf0YFfbZb8Yz
 dqpQ==
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1122264637=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1122264637==
Content-Type: multipart/alternative; boundary="0000000000006aaa5f0592b47fe5"

--0000000000006aaa5f0592b47fe5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The purpose is to get rid of all PCI ID tables for all drivers in
userspace. (or at least stop updating them)

Mesa common code and modesetting will use this.

Marek

On Sat, Sep 7, 2019 at 3:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Sat, Sep 7, 2019 at 3:18 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, Sep 6, 2019 at 3:16 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com>=
 wrote:
> > >
> > > + dri-devel
> > >
> > > On Tue, Sep 3, 2019 at 5:41 PM Jiang, Sonny <Sonny.Jiang@amd.com>
> wrote:
> > >>
> > >> Add DRM device name and use DRM_IOCTL_VERSION ioctl drmVersion::desc
> passing it to user space
> > >> instead of unused DRM driver name descriptor.
> > >>
> > >> Change-Id: I809f6d3e057111417efbe8fa7cab8f0113ba4b21
> > >> Signed-off-by: Sonny Jiang <sonny.jiang@amd.com>
> > >> ---
> > >>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 ++
> > >>  drivers/gpu/drm/drm_drv.c                  | 17 +++++++++++++++++
> > >>  drivers/gpu/drm/drm_ioctl.c                |  2 +-
> > >>  include/drm/drm_device.h                   |  3 +++
> > >>  include/drm/drm_drv.h                      |  1 +
> > >>  5 files changed, 24 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > >> index 67b09cb2a9e2..8f0971cea363 100644
> > >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > >> @@ -2809,6 +2809,8 @@ int amdgpu_device_init(struct amdgpu_device
> *adev,
> > >>         /* init the mode config */
> > >>         drm_mode_config_init(adev->ddev);
> > >>
> > >> +       drm_dev_set_name(adev->ddev,
> amdgpu_asic_name[adev->asic_type]);
> > >> +
> > >>         r =3D amdgpu_device_ip_init(adev);
> > >>         if (r) {
> > >>                 /* failed in exclusive mode due to timeout */
> > >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > >> index 862621494a93..6c33879bb538 100644
> > >> --- a/drivers/gpu/drm/drm_drv.c
> > >> +++ b/drivers/gpu/drm/drm_drv.c
> > >> @@ -802,6 +802,7 @@ void drm_dev_fini(struct drm_device *dev)
> > >>         mutex_destroy(&dev->struct_mutex);
> > >>         drm_legacy_destroy_members(dev);
> > >>         kfree(dev->unique);
> > >> +       kfree(dev->name);
> > >>  }
> > >>  EXPORT_SYMBOL(drm_dev_fini);
> > >>
> > >> @@ -1078,6 +1079,22 @@ int drm_dev_set_unique(struct drm_device *dev=
,
> const char *name)
> > >>  }
> > >>  EXPORT_SYMBOL(drm_dev_set_unique);
> > >>
> > >> +/**
> > >> + * drm_dev_set_name - Set the name of a DRM device
> > >> + * @dev: device of which to set the name
> > >> + * @name: name to be set
> > >> + *
> > >> + * Return: 0 on success or a negative error code on failure.
> > >> + */
> > >> +int drm_dev_set_name(struct drm_device *dev, const char *name)
> > >> +{
> > >> +       kfree(dev->name);
> > >> +       dev->name =3D kstrdup(name, GFP_KERNEL);
> > >> +
> > >> +       return dev->name ? 0 : -ENOMEM;
> > >> +}
> > >> +EXPORT_SYMBOL(drm_dev_set_name);
> > >> +
> > >>  /*
> > >>   * DRM Core
> > >>   * The DRM core module initializes all global DRM objects and makes
> them
> > >> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl=
.c
> > >> index 2263e3ddd822..61f02965106b 100644
> > >> --- a/drivers/gpu/drm/drm_ioctl.c
> > >> +++ b/drivers/gpu/drm/drm_ioctl.c
> > >> @@ -506,7 +506,7 @@ int drm_version(struct drm_device *dev, void
> *data,
> > >>                                 dev->driver->date);
> > >>         if (!err)
> > >>                 err =3D drm_copy_field(version->desc,
> &version->desc_len,
> > >> -                               dev->driver->desc);
> > >> +                               dev->name);
> >
> > I suspect this needs to be something like dev->name ? dev->name :
> > dev->driver->desc
> >
> > Or somewhere something needs to arrange for dev->name to default to
> > dev->driver->desc
> >
> > And maybe this should be dev->desc instead of dev->name.. that at
> > least seems less confusing to me.
> >
> > other than that, I don't see a big problem
>
> (recap from irc)
>
> I thought we're using this as essentially an uapi identifier, so that
> you know which kind of ioctl set a driver supports. Not so big deal on
> pci, where we match against pci ids anyway, kinda bigger deal where
> that's not around. Listing codenames and or something else that
> changes all the time feels a bit silly for that. Imo if you just want
> to expose this to userspace, stuff it into an amdgpu info/query ioctl.
>
> So what do you need this for exactly, where's the userspace that needs
> this?
> -Daniel
>
> >
> > BR,
> > -R
> >
> > >>
> > >>         return err;
> > >>  }
> > >> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > >> index 7f9ef709b2b6..e29912c484e4 100644
> > >> --- a/include/drm/drm_device.h
> > >> +++ b/include/drm/drm_device.h
> > >> @@ -123,6 +123,9 @@ struct drm_device {
> > >>         /** @unique: Unique name of the device */
> > >>         char *unique;
> > >>
> > >> +       /** @name: device name */
> > >> +       char *name;
> > >> +
> > >>         /**
> > >>          * @struct_mutex:
> > >>          *
> > >> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > >> index 68ca736c548d..f742e2bde467 100644
> > >> --- a/include/drm/drm_drv.h
> > >> +++ b/include/drm/drm_drv.h
> > >> @@ -798,6 +798,7 @@ static inline bool
> drm_drv_uses_atomic_modeset(struct drm_device *dev)
> > >>
> > >>
> > >>  int drm_dev_set_unique(struct drm_device *dev, const char *name);
> > >> +int drm_dev_set_name(struct drm_device *dev, const char *name);
> > >>
> > >>
> > >>  #endif
> > >> --
> > >> 2.17.1
> > >>
> > >> _______________________________________________
> > >> amd-gfx mailing list
> > >> amd-gfx@lists.freedesktop.org
> > >> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>

--0000000000006aaa5f0592b47fe5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The purpose is to get rid of all PCI ID tables for al=
l drivers in userspace. (or at least stop updating them)<br></div><div><br>=
</div><div>Mesa common code and modesetting will use this.<br></div><div><b=
r></div><div>Marek<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, Sep 7, 2019 at 3:48 PM Daniel Vetter &lt;<a h=
ref=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Sep 7, 2019 at 3:18 A=
M Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank">ro=
bdclark@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Sep 6, 2019 at 3:16 PM Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"ma=
ilto:maraeo@gmail.com" target=3D"_blank">maraeo@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt;<br>
&gt; &gt; + dri-devel<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Sep 3, 2019 at 5:41 PM Jiang, Sonny &lt;<a href=3D"mailto=
:Sonny.Jiang@amd.com" target=3D"_blank">Sonny.Jiang@amd.com</a>&gt; wrote:<=
br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Add DRM device name and use DRM_IOCTL_VERSION ioctl drmVersio=
n::desc passing it to user space<br>
&gt; &gt;&gt; instead of unused DRM driver name descriptor.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Change-Id: I809f6d3e057111417efbe8fa7cab8f0113ba4b21<br>
&gt; &gt;&gt; Signed-off-by: Sonny Jiang &lt;<a href=3D"mailto:sonny.jiang@=
amd.com" target=3D"_blank">sonny.jiang@amd.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |=C2=A0 2 ++=
<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/drm_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 +++++++++++++++++<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/drm_ioctl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;&gt;=C2=A0 include/drm/drm_device.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
&gt; &gt;&gt;=C2=A0 include/drm/drm_drv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;&gt;=C2=A0 5 files changed, 24 insertions(+), 1 deletion(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/dri=
vers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; &gt;&gt; index 67b09cb2a9e2..8f0971cea363 100644<br>
&gt; &gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; &gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; &gt;&gt; @@ -2809,6 +2809,8 @@ int amdgpu_device_init(struct amdgpu_de=
vice *adev,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* init the mode config */<b=
r>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_mode_config_init(adev-&g=
t;ddev);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dev_set_name(adev-&gt;ddev, a=
mdgpu_asic_name[adev-&gt;asic_type]);<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D amdgpu_device_ip_init(=
adev);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r) {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* failed in exclusive mode due to timeout */<br>
&gt; &gt;&gt; diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_=
drv.c<br>
&gt; &gt;&gt; index 862621494a93..6c33879bb538 100644<br>
&gt; &gt;&gt; --- a/drivers/gpu/drm/drm_drv.c<br>
&gt; &gt;&gt; +++ b/drivers/gpu/drm/drm_drv.c<br>
&gt; &gt;&gt; @@ -802,6 +802,7 @@ void drm_dev_fini(struct drm_device *dev)=
<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_destroy(&amp;dev-&gt;s=
truct_mutex);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_legacy_destroy_members(d=
ev);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(dev-&gt;unique);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(dev-&gt;name);<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt;=C2=A0 EXPORT_SYMBOL(drm_dev_fini);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -1078,6 +1079,22 @@ int drm_dev_set_unique(struct drm_devi=
ce *dev, const char *name)<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt;=C2=A0 EXPORT_SYMBOL(drm_dev_set_unique);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +/**<br>
&gt; &gt;&gt; + * drm_dev_set_name - Set the name of a DRM device<br>
&gt; &gt;&gt; + * @dev: device of which to set the name<br>
&gt; &gt;&gt; + * @name: name to be set<br>
&gt; &gt;&gt; + *<br>
&gt; &gt;&gt; + * Return: 0 on success or a negative error code on failure.=
<br>
&gt; &gt;&gt; + */<br>
&gt; &gt;&gt; +int drm_dev_set_name(struct drm_device *dev, const char *nam=
e)<br>
&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(dev-&gt;name);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;name =3D kstrdup(name, GF=
P_KERNEL);<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return dev-&gt;name ? 0 : -ENOMEM=
;<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; +EXPORT_SYMBOL(drm_dev_set_name);<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;=C2=A0 /*<br>
&gt; &gt;&gt;=C2=A0 =C2=A0* DRM Core<br>
&gt; &gt;&gt;=C2=A0 =C2=A0* The DRM core module initializes all global DRM =
objects and makes them<br>
&gt; &gt;&gt; diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/dr=
m_ioctl.c<br>
&gt; &gt;&gt; index 2263e3ddd822..61f02965106b 100644<br>
&gt; &gt;&gt; --- a/drivers/gpu/drm/drm_ioctl.c<br>
&gt; &gt;&gt; +++ b/drivers/gpu/drm/drm_ioctl.c<br>
&gt; &gt;&gt; @@ -506,7 +506,7 @@ int drm_version(struct drm_device *dev, v=
oid *data,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;driver-&gt;=
date);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!err)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
err =3D drm_copy_field(version-&gt;desc, &amp;version-&gt;desc_len,<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;driver-&gt;desc=
);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;name);<br>
&gt;<br>
&gt; I suspect this needs to be something like dev-&gt;name ? dev-&gt;name =
:<br>
&gt; dev-&gt;driver-&gt;desc<br>
&gt;<br>
&gt; Or somewhere something needs to arrange for dev-&gt;name to default to=
<br>
&gt; dev-&gt;driver-&gt;desc<br>
&gt;<br>
&gt; And maybe this should be dev-&gt;desc instead of dev-&gt;name.. that a=
t<br>
&gt; least seems less confusing to me.<br>
&gt;<br>
&gt; other than that, I don&#39;t see a big problem<br>
<br>
(recap from irc)<br>
<br>
I thought we&#39;re using this as essentially an uapi identifier, so that<b=
r>
you know which kind of ioctl set a driver supports. Not so big deal on<br>
pci, where we match against pci ids anyway, kinda bigger deal where<br>
that&#39;s not around. Listing codenames and or something else that<br>
changes all the time feels a bit silly for that. Imo if you just want<br>
to expose this to userspace, stuff it into an amdgpu info/query ioctl.<br>
<br>
So what do you need this for exactly, where&#39;s the userspace that needs =
this?<br>
-Daniel<br>
<br>
&gt;<br>
&gt; BR,<br>
&gt; -R<br>
&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt; diff --git a/include/drm/drm_device.h b/include/drm/drm_devic=
e.h<br>
&gt; &gt;&gt; index 7f9ef709b2b6..e29912c484e4 100644<br>
&gt; &gt;&gt; --- a/include/drm/drm_device.h<br>
&gt; &gt;&gt; +++ b/include/drm/drm_device.h<br>
&gt; &gt;&gt; @@ -123,6 +123,9 @@ struct drm_device {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/** @unique: Unique name of =
the device */<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *unique;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @name: device name */<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0char *name;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * @struct_mutex:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; &gt;&gt; diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h<br=
>
&gt; &gt;&gt; index 68ca736c548d..f742e2bde467 100644<br>
&gt; &gt;&gt; --- a/include/drm/drm_drv.h<br>
&gt; &gt;&gt; +++ b/include/drm/drm_drv.h<br>
&gt; &gt;&gt; @@ -798,6 +798,7 @@ static inline bool drm_drv_uses_atomic_mo=
deset(struct drm_device *dev)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 int drm_dev_set_unique(struct drm_device *dev, const ch=
ar *name);<br>
&gt; &gt;&gt; +int drm_dev_set_name(struct drm_device *dev, const char *nam=
e);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 #endif<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.17.1<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; _______________________________________________<br>
&gt; &gt;&gt; amd-gfx mailing list<br>
&gt; &gt;&gt; <a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_b=
lank">amd-gfx@lists.freedesktop.org</a><br>
&gt; &gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd=
-gfx" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/ma=
ilman/listinfo/amd-gfx</a><br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; dri-devel mailing list<br>
&gt; &gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_bla=
nk">dri-devel@lists.freedesktop.org</a><br>
&gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-dev=
el" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mail=
man/listinfo/dri-devel</a><br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
+41 (0) 79 365 57 48 - <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" =
target=3D"_blank">http://blog.ffwll.ch</a><br>
</blockquote></div></div>

--0000000000006aaa5f0592b47fe5--

--===============1122264637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1122264637==--
