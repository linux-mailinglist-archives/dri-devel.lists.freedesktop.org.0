Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABA569B391
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 21:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D32710F0C3;
	Fri, 17 Feb 2023 20:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D996E10F0BE;
 Fri, 17 Feb 2023 20:13:18 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id az13so2329110oib.12;
 Fri, 17 Feb 2023 12:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KFm7WaExp5WwVWUUAbWztiYHU+nx+kZyDDSBaORY1Nc=;
 b=g/8fw4deAu8AO7RzztHNBFojMn99oRyRQ8bfV0ms/oT3d3UIuWOM6dprj6vluM02j+
 2Mo61FgfpDBpoIO+urORHK3Ieg2LducxqWjAm9r7ILJVlAvSbHLHembVYldLY/8zr8al
 UAhl+/1UKZSOcmoL4Td6gQqkBP+c7K4Q0GzePG6EDNJ7+pjn09e4ie30S3Pw9lmy9ahg
 QdESGh7WHY3IAqQ6M2N7keUtGxuDcqV0kobzgglLbPFw+Cjdj0EFEgRCRv6+AI1q+neG
 cC+176XcY7XnEkSfmTG59ZS2bYQikBkqoc3gCirqtYW28RGkCE9N5PeKrO6+vOyWgJkV
 1asA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KFm7WaExp5WwVWUUAbWztiYHU+nx+kZyDDSBaORY1Nc=;
 b=Xk4jgXgG6Y7hPGVNG2HM76E2tRSvvlNyWDWiDRxuTVdql+Bs/cOZ3qIUskQuBVKto8
 y9maTRd1APz3zwojDfMPHwcVNAK7yxXFr+8r7RkZj+AXn5+RazxLM18RiDlzvU/DMcsO
 wmiAkDyLDTipejF0ICt2Z3JC3XXUaMeLTRVq4Lz8Z/0gH9gX2QmXJmhT3+8H9Lssny4e
 jW3p2W69u/KbkQMPcBL2l5HzrHtGV/Lo0r3jCwXd29Y0PJbx+m2w8LXe+uVN+5j1htwy
 ArRbkZiv71vhVr8txj7tfXjgjPBrdGK5EpT9XbYhmZ6U+nMlftTRZW//PqqI0Nu3pjsO
 vh1g==
X-Gm-Message-State: AO0yUKUvk498ShxmoeNSgIS/JMo+iz/yvd5FMxCvSxRdlCDl33Bfzq7+
 OsSrPjTbsz6f//mn1wtneWv5i+G4Rf3x/Xidd0s=
X-Google-Smtp-Source: AK7set/WrFku/eEVrcL1BMBWFkRCWXC8vI3o3ijD7Lr2Eb2ou1mnM6KaqUm9YbpSZJbWFsveQcy8R2iXcQiADfMf6FE=
X-Received: by 2002:a05:6808:1287:b0:37d:7bc1:889 with SMTP id
 a7-20020a056808128700b0037d7bc10889mr602982oiw.138.1676664797886; Fri, 17 Feb
 2023 12:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20230216-kobj_type-amdgpu-v1-1-b382ab606dc7@weissschuh.net>
 <ba5c8e8d-2418-aca0-59b0-721d08af452c@amd.com>
In-Reply-To: <ba5c8e8d-2418-aca0-59b0-721d08af452c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Feb 2023 15:13:06 -0500
Message-ID: <CADnq5_OBX4E0TZWrRdZY5opiWXJ9NWUvscYsY59jeujYMHjtng@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: make kobj_type structures constant
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Feb 16, 2023 at 1:59 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.02.23 um 02:07 schrieb Thomas Wei=C3=9Fschuh:
> > Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
> > the driver core allows the usage of const struct kobj_type.
> >
> > Take advantage of this to constify the structure definitions to prevent
> > modification at runtime.
> >
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 10 +++++-----
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |  2 +-
> >   2 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_discovery.c
> > index 1bbd56029a4f..8e04952e5144 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> > @@ -704,7 +704,7 @@ static void ip_hw_instance_release(struct kobject *=
kobj)
> >       kfree(ip_hw_instance);
> >   }
> >
> > -static struct kobj_type ip_hw_instance_ktype =3D {
> > +static const struct kobj_type ip_hw_instance_ktype =3D {
> >       .release =3D ip_hw_instance_release,
> >       .sysfs_ops =3D &ip_hw_instance_sysfs_ops,
> >       .default_groups =3D ip_hw_instance_groups,
> > @@ -723,7 +723,7 @@ static void ip_hw_id_release(struct kobject *kobj)
> >       kfree(ip_hw_id);
> >   }
> >
> > -static struct kobj_type ip_hw_id_ktype =3D {
> > +static const struct kobj_type ip_hw_id_ktype =3D {
> >       .release =3D ip_hw_id_release,
> >       .sysfs_ops =3D &kobj_sysfs_ops,
> >   };
> > @@ -786,18 +786,18 @@ static const struct sysfs_ops ip_die_entry_sysfs_=
ops =3D {
> >       .show =3D ip_die_entry_attr_show,
> >   };
> >
> > -static struct kobj_type ip_die_entry_ktype =3D {
> > +static const struct kobj_type ip_die_entry_ktype =3D {
> >       .release =3D ip_die_entry_release,
> >       .sysfs_ops =3D &ip_die_entry_sysfs_ops,
> >       .default_groups =3D ip_die_entry_groups,
> >   };
> >
> > -static struct kobj_type die_kobj_ktype =3D {
> > +static const struct kobj_type die_kobj_ktype =3D {
> >       .release =3D die_kobj_release,
> >       .sysfs_ops =3D &kobj_sysfs_ops,
> >   };
> >
> > -static struct kobj_type ip_discovery_ktype =3D {
> > +static const struct kobj_type ip_discovery_ktype =3D {
> >       .release =3D ip_disc_release,
> >       .sysfs_ops =3D &kobj_sysfs_ops,
> >   };
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_xgmi.c
> > index 4b9e7b050ccd..6d13ce6ec9cc 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> > @@ -228,7 +228,7 @@ static const struct sysfs_ops amdgpu_xgmi_hive_ops =
=3D {
> >       .show =3D amdgpu_xgmi_show_attrs,
> >   };
> >
> > -struct kobj_type amdgpu_xgmi_hive_type =3D {
> > +static const struct kobj_type amdgpu_xgmi_hive_type =3D {
> >       .release =3D amdgpu_xgmi_hive_release,
> >       .sysfs_ops =3D &amdgpu_xgmi_hive_ops,
> >       .default_groups =3D amdgpu_xgmi_hive_groups,
> >
> > ---
> > base-commit: 033c40a89f55525139fd5b6342281b09b97d05bf
> > change-id: 20230216-kobj_type-amdgpu-4d3f0e1e05d4
> >
> > Best regards,
>
