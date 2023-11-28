Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCA57FC0A3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A603010E182;
	Tue, 28 Nov 2023 17:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D0A10E034;
 Tue, 28 Nov 2023 17:52:33 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54917ef6c05so7698478a12.1; 
 Tue, 28 Nov 2023 09:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701193951; x=1701798751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmw2mUW+PTirMGKyBiA0Ej+OMU3c3B1BycO7cp9qoHM=;
 b=UjS18mKJRuVUaIXa0gW50B78QU15yP4ytVxknX0p60paJxRp5B97cchv6E/8OB3Ops
 E0O0loUvavG72Urq4zTyQvcIEGFYrUo2g07Fp3TpGmxBpkoS/e+gyuSDxuqtwZCQA0eX
 sxl8Qd2BEyj0iOv5WL3srmLzr4F2R9qBdmt46auAM1nWZebCUIXk1FNVn5l5XRADklG3
 zQrpVPOge3rgplIRoFpAIRdqb8NhzF0QiimP0kbfgdWR6sDBPLCGxIR7D8COdynKQ/th
 c88cowUXDLzhtELlKboVUYOzR9bCudFbY9MRdfuL35oBF5+YQ7M9KW2L1ol6gz7zolAR
 iFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701193951; x=1701798751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hmw2mUW+PTirMGKyBiA0Ej+OMU3c3B1BycO7cp9qoHM=;
 b=GWDh7nTWizRNv6+hDkpgIQVi1hUlupUtNgdrd8x+Lif/g+laKg5GVg7KtPJixGVI3H
 axnI7hKZv93zFKjEBdSGKqNyKppwxziyMkzoRM/h9ivH9nMxJqLw62tS15PPoeKCW96a
 BMBipkCnLp+/DTrDXnK8eidkVB/fG7v6xxHfRIShlFHl28sDtyTDV13YjWUZfAcQCyLR
 XA2L/EToH6NecBXGSUiPnXdHkBxO/csz6vKConCTau8cf4+65ci/2C+wj3chjB41+2DX
 vJgTIBAOMm7VqoA2do3ZEb8QI55DiWtKH5QvabzD40CJk292dZuhEhoH9iIAZzvikpjI
 rUGQ==
X-Gm-Message-State: AOJu0Yxn2Oh/jsPP+WpKYkW2wcZKfWP6mNkyCYAItNY7ZJ12rT46B3zJ
 pm8MeBEtvsWHoiKBzQKCEM5yR6nicuZVUWnEcrI=
X-Google-Smtp-Source: AGHT+IGw9RGIXsMdNCRhL+af9PGPXqu0MUs4xP6dw11yU/WyyYG4DI+5vcjhPCp0tXpRu0ISDVmAYt0J7p+yJpa1MmU=
X-Received: by 2002:a50:fb0e:0:b0:54b:d16:4c4a with SMTP id
 d14-20020a50fb0e000000b0054b0d164c4amr8558114edq.6.1701193951144; Tue, 28 Nov
 2023 09:52:31 -0800 (PST)
MIME-Version: 1.0
References: <20231117195626.13599-1-alexander.deucher@amd.com>
 <a42a4321-9dce-4c76-9578-8ea665b874f8@gmail.com>
 <CADnq5_NiHRhDJt+bkdy35GPfTaTUdSRrf_aVVQobfFgayHP2hw@mail.gmail.com>
In-Reply-To: <CADnq5_NiHRhDJt+bkdy35GPfTaTUdSRrf_aVVQobfFgayHP2hw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Nov 2023 09:52:19 -0800
Message-ID: <CAF6AEGvVdnTsj1DZjOYn6YaygEqsJDkAUzbF_thgAw2CTLfBxA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add shared fdinfo stats
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@chromium.org>, amd-gfx@lists.freedesktop.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 6:28=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Tue, Nov 28, 2023 at 9:17=E2=80=AFAM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 17.11.23 um 20:56 schrieb Alex Deucher:
> > > Add shared stats.  Useful for seeing shared memory.
> > >
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
> > >   3 files changed, 21 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_fdinfo.c
> > > index 5706b282a0c7..c7df7fa3459f 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> > > @@ -97,6 +97,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p, str=
uct drm_file *file)
> > >                  stats.requested_visible_vram/1024UL);
> > >       drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
> > >                  stats.requested_gtt/1024UL);
> > > +     drm_printf(p, "drm-shared-vram:\t%llu KiB\n", stats.vram_shared=
/1024UL);
> > > +     drm_printf(p, "drm-shared-gtt:\t%llu KiB\n", stats.gtt_shared/1=
024UL);
> > > +     drm_printf(p, "drm-shared-cpu:\t%llu KiB\n", stats.cpu_shared/1=
024UL);
> > > +
> > >       for (hw_ip =3D 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
> > >               if (!usage[hw_ip])
> > >                       continue;
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_object.c
> > > index d79b4ca1ecfc..c24f7b2c04c1 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > @@ -1287,25 +1287,36 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *b=
o,
> > >                         struct amdgpu_mem_stats *stats)
> > >   {
> > >       uint64_t size =3D amdgpu_bo_size(bo);
> > > +     struct drm_gem_object *obj;
> > >       unsigned int domain;
> > > +     bool shared;
> > >
> > >       /* Abort if the BO doesn't currently have a backing store */
> > >       if (!bo->tbo.resource)
> > >               return;
> > >
> > > +     obj =3D &bo->tbo.base;
> > > +     shared =3D obj->handle_count > 1;
> >
> > Interesting approach but I don't think that this is correct.
> >
> > The handle_count is basically how many GEM handles are there for BO, so
> > for example it doesn't catch sharing things with V4L.
> >
> > What we should probably rather do is to take a look if
> > bo->tbo.base.dma_buf is NULL or not.
>
> +Rob, dri-devel
>
> This is what the generic drm helper code does.  See
> drm_show_memory_stats().  If that is not correct that code should
> probably be fixed too.

OTOH, v4l doesn't expose fdinfo.  What "shared" is telling you is
whether the BO is counted multiple times when you look at all
processes fdinfo.

But I guess it would be ok to look for obj->handle_count > 1 || obj->dma_bu=
f

BR,
-R

>
> Alex
>
> >
> > Regards,
> > Christian.
> >
> >
> > > +
> > >       domain =3D amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type=
);
> > >       switch (domain) {
> > >       case AMDGPU_GEM_DOMAIN_VRAM:
> > >               stats->vram +=3D size;
> > >               if (amdgpu_bo_in_cpu_visible_vram(bo))
> > >                       stats->visible_vram +=3D size;
> > > +             if (shared)
> > > +                     stats->vram_shared +=3D size;
> > >               break;
> > >       case AMDGPU_GEM_DOMAIN_GTT:
> > >               stats->gtt +=3D size;
> > > +             if (shared)
> > > +                     stats->gtt_shared +=3D size;
> > >               break;
> > >       case AMDGPU_GEM_DOMAIN_CPU:
> > >       default:
> > >               stats->cpu +=3D size;
> > > +             if (shared)
> > > +                     stats->cpu_shared +=3D size;
> > >               break;
> > >       }
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_object.h
> > > index d28e21baef16..0503af75dc26 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > > @@ -138,12 +138,18 @@ struct amdgpu_bo_vm {
> > >   struct amdgpu_mem_stats {
> > >       /* current VRAM usage, includes visible VRAM */
> > >       uint64_t vram;
> > > +     /* current shared VRAM usage, includes visible VRAM */
> > > +     uint64_t vram_shared;
> > >       /* current visible VRAM usage */
> > >       uint64_t visible_vram;
> > >       /* current GTT usage */
> > >       uint64_t gtt;
> > > +     /* current shared GTT usage */
> > > +     uint64_t gtt_shared;
> > >       /* current system memory usage */
> > >       uint64_t cpu;
> > > +     /* current shared system memory usage */
> > > +     uint64_t cpu_shared;
> > >       /* sum of evicted buffers, includes visible VRAM */
> > >       uint64_t evicted_vram;
> > >       /* sum of evicted buffers due to CPU access */
> >
