Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4B67FBCB3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 15:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2704F10E551;
	Tue, 28 Nov 2023 14:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA7E10E551;
 Tue, 28 Nov 2023 14:28:23 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1fa1c3755afso1495601fac.1; 
 Tue, 28 Nov 2023 06:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701181703; x=1701786503; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1tmejyirwISX4dtXX4YWaEBQtRgR13R/FrRlHHYvz9E=;
 b=CCh1Egy6ZwlsFjbmxCLlNIHCw/DvczY5fe1SdvkSNcvS8BwwYhhGhTGh8EMD3hFXOA
 IkUnDhwnxJX6rcWsZG9u8tZaHi14UitQ35K5zdmxOhqitns0rhkvrgfEoAyxzKWh9RC7
 XiehEweHhN6GKksJdL7LPOKmRRapuJeG4tnrY/WmHmNA0yzLcqrUoLhEc5BcjA5eOgSu
 RHDLhwNwDOtr78LCIxuEph7eV+8Wwp4SZMf2IXtODlC69HzcNAs7H3Xt1wzARIT6CgEX
 3fEHDBmInpmWdU/59VeR6F6U5+hp0eAADibpJPDm/PT1vXuJ+JT/dfZEjBXBJ3kVUXpV
 6i4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701181703; x=1701786503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1tmejyirwISX4dtXX4YWaEBQtRgR13R/FrRlHHYvz9E=;
 b=uF9zlnR09gv/RQuTZyG0NFZ9yiX+bXew+635Pfq2qjLawInQ038A63eSICdu2im8IO
 kvaBAyAzguo60bhS6bXNbudFcNcS30HpRGuviBiJ3ualYC7KHCHi9RKEyPmmAr8wqkAg
 cfUXq9lKuzujlry2czm7QxTKHEj2rWc/AT9pBlb7lROvLOiH4tCHpsUVEADCyAMkQynM
 2EVm4kz7N/N3sYanCHEWGddExDX4nqoLY7Hl/g9O7B5QQkc6jfJLkozsBHgTzLUOkNha
 6pkyefLf0OLbsXLHOVZuJZxSzzNCg4YgEbg1ep27kus8niPZJYVkMSw0Ioi66O/zxVDA
 HxqQ==
X-Gm-Message-State: AOJu0YyEmvt0qxxCRQ5KtP8G5vFREfwL55q0m1DFfVxMIH+0hcnLgGIu
 My4WIHHpxzedkTFi+OR5F/H9MxlPMDaDWOa2nfo=
X-Google-Smtp-Source: AGHT+IHqvv5vkT2KyCNQ9HDx6yVhLVzpq+34e4q3Z60lsALZ2oCr3sOI+M40yctwzPkYJsqvJprCy82Lb0EPxBoUqlE=
X-Received: by 2002:a05:6870:b510:b0:1fa:25d6:9010 with SMTP id
 v16-20020a056870b51000b001fa25d69010mr5653711oap.18.1701181702740; Tue, 28
 Nov 2023 06:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20231117195626.13599-1-alexander.deucher@amd.com>
 <a42a4321-9dce-4c76-9578-8ea665b874f8@gmail.com>
In-Reply-To: <a42a4321-9dce-4c76-9578-8ea665b874f8@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Nov 2023 09:28:11 -0500
Message-ID: <CADnq5_NiHRhDJt+bkdy35GPfTaTUdSRrf_aVVQobfFgayHP2hw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add shared fdinfo stats
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Rob Clark <robdclark@gmail.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 9:17=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 17.11.23 um 20:56 schrieb Alex Deucher:
> > Add shared stats.  Useful for seeing shared memory.
> >
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
> >   3 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_fdinfo.c
> > index 5706b282a0c7..c7df7fa3459f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> > @@ -97,6 +97,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struc=
t drm_file *file)
> >                  stats.requested_visible_vram/1024UL);
> >       drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
> >                  stats.requested_gtt/1024UL);
> > +     drm_printf(p, "drm-shared-vram:\t%llu KiB\n", stats.vram_shared/1=
024UL);
> > +     drm_printf(p, "drm-shared-gtt:\t%llu KiB\n", stats.gtt_shared/102=
4UL);
> > +     drm_printf(p, "drm-shared-cpu:\t%llu KiB\n", stats.cpu_shared/102=
4UL);
> > +
> >       for (hw_ip =3D 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
> >               if (!usage[hw_ip])
> >                       continue;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_object.c
> > index d79b4ca1ecfc..c24f7b2c04c1 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > @@ -1287,25 +1287,36 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
> >                         struct amdgpu_mem_stats *stats)
> >   {
> >       uint64_t size =3D amdgpu_bo_size(bo);
> > +     struct drm_gem_object *obj;
> >       unsigned int domain;
> > +     bool shared;
> >
> >       /* Abort if the BO doesn't currently have a backing store */
> >       if (!bo->tbo.resource)
> >               return;
> >
> > +     obj =3D &bo->tbo.base;
> > +     shared =3D obj->handle_count > 1;
>
> Interesting approach but I don't think that this is correct.
>
> The handle_count is basically how many GEM handles are there for BO, so
> for example it doesn't catch sharing things with V4L.
>
> What we should probably rather do is to take a look if
> bo->tbo.base.dma_buf is NULL or not.

+Rob, dri-devel

This is what the generic drm helper code does.  See
drm_show_memory_stats().  If that is not correct that code should
probably be fixed too.

Alex

>
> Regards,
> Christian.
>
>
> > +
> >       domain =3D amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
> >       switch (domain) {
> >       case AMDGPU_GEM_DOMAIN_VRAM:
> >               stats->vram +=3D size;
> >               if (amdgpu_bo_in_cpu_visible_vram(bo))
> >                       stats->visible_vram +=3D size;
> > +             if (shared)
> > +                     stats->vram_shared +=3D size;
> >               break;
> >       case AMDGPU_GEM_DOMAIN_GTT:
> >               stats->gtt +=3D size;
> > +             if (shared)
> > +                     stats->gtt_shared +=3D size;
> >               break;
> >       case AMDGPU_GEM_DOMAIN_CPU:
> >       default:
> >               stats->cpu +=3D size;
> > +             if (shared)
> > +                     stats->cpu_shared +=3D size;
> >               break;
> >       }
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_object.h
> > index d28e21baef16..0503af75dc26 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > @@ -138,12 +138,18 @@ struct amdgpu_bo_vm {
> >   struct amdgpu_mem_stats {
> >       /* current VRAM usage, includes visible VRAM */
> >       uint64_t vram;
> > +     /* current shared VRAM usage, includes visible VRAM */
> > +     uint64_t vram_shared;
> >       /* current visible VRAM usage */
> >       uint64_t visible_vram;
> >       /* current GTT usage */
> >       uint64_t gtt;
> > +     /* current shared GTT usage */
> > +     uint64_t gtt_shared;
> >       /* current system memory usage */
> >       uint64_t cpu;
> > +     /* current shared system memory usage */
> > +     uint64_t cpu_shared;
> >       /* sum of evicted buffers, includes visible VRAM */
> >       uint64_t evicted_vram;
> >       /* sum of evicted buffers due to CPU access */
>
