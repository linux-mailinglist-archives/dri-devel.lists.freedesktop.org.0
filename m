Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE9B7FF42D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 16:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2451F10E725;
	Thu, 30 Nov 2023 15:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B603710E720;
 Thu, 30 Nov 2023 15:58:53 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9c82a976bso13194971fa.3; 
 Thu, 30 Nov 2023 07:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701359932; x=1701964732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMfpPWvvOS/pqqTijpiTUrfaw4nNKBiKYLTOjNXXmQM=;
 b=ENMuqosXixRRwUDdF3OomG1xC2Lut6c+Lae6U7Pc/Ea6ZofJEw+Y8H8x0q2aNT4XzD
 dX0arxOgmep+tSkl7IRxWaD0lBknh3PcJip/Hkhd7qcIwzXNaCwnjAqbgEQ2Ngmh2F4K
 irkl7ksX82i8OEBqWK+IiBEnkAdOjFjXqfC30AA/03KebaUXJlZZAQD1wZkQqjSWDTdI
 WDM9OLIeYMapzh6PUJyljwejQrcXRgEpzpitQgg5DCuAWQK+tBvc8ep6Fp+M15WX3/Mp
 ad7R7ULGXNWe/0sJuV2SaPTU/XP+7DIC5xDAD/hJ/mckFvt4PW0zBFBGkIK37VmKIEF7
 zjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701359932; x=1701964732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMfpPWvvOS/pqqTijpiTUrfaw4nNKBiKYLTOjNXXmQM=;
 b=wSfYPDeqNplY+IWMyaFcPKslW5bxrIN+z61as9MADiIzpZxPURjP0YpmXukIuh6Fir
 h3brM9lH/8OiSA+XLxUwVi1mEtsBMWNDb6hsMcF5gqCLAZuTtnrB4mB1vCBoTLH2d5qf
 +woc6twnIO07QD1kT1G1XhK2OwH4kHptoHf7PpFecnIql0TcdqTIX4ERZU/0+R9cPHcY
 J2Cixgse9KxgzjMw9JVweMolZgeE1FTyBEfRL6jBiGvqIhAUu9mk7bcawJDxjkaQkjHD
 O33xs0RTe/Rf6U1NVB45v5CzXTXw6wx/YrJ2XC3XPzvAFhg7To9xXSDsQc49VrlViyhP
 JHKw==
X-Gm-Message-State: AOJu0YykqY6k8RNur12kqLCfNTLbgLI8kpDg2V8esivwoNu45KJT1F6t
 US3NXsxaD9u+783dU0HTmRea/lQt66I4oPLnQU6F0MmG
X-Google-Smtp-Source: AGHT+IH2AjCWu6xpohb9lGVdGtan2lRuEIdIaB760syTV7hgBQ9rT+fD5P5Wca9J9sqwNrI6WWsQUm+/KOJ6TaK6rQM=
X-Received: by 2002:ac2:55ad:0:b0:50b:bfaa:317b with SMTP id
 y13-20020ac255ad000000b0050bbfaa317bmr5044312lfg.11.1701359931507; Thu, 30
 Nov 2023 07:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20231117195626.13599-1-alexander.deucher@amd.com>
 <a42a4321-9dce-4c76-9578-8ea665b874f8@gmail.com>
 <CADnq5_NiHRhDJt+bkdy35GPfTaTUdSRrf_aVVQobfFgayHP2hw@mail.gmail.com>
 <CAF6AEGvVdnTsj1DZjOYn6YaygEqsJDkAUzbF_thgAw2CTLfBxA@mail.gmail.com>
 <9853f121-be57-4be1-9fc6-247254a12653@gmail.com>
In-Reply-To: <9853f121-be57-4be1-9fc6-247254a12653@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 30 Nov 2023 07:58:38 -0800
Message-ID: <CAF6AEGtvB0Cf=c==TOaYFYWHUDQg5x8TuJNUHm--Nz5x786cdw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add shared fdinfo stats
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
 Rob Clark <robdclark@chromium.org>, amd-gfx@lists.freedesktop.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 5:13=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 28.11.23 um 18:52 schrieb Rob Clark:
> > On Tue, Nov 28, 2023 at 6:28=E2=80=AFAM Alex Deucher <alexdeucher@gmail=
.com> wrote:
> >> On Tue, Nov 28, 2023 at 9:17=E2=80=AFAM Christian K=C3=B6nig
> >> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>> Am 17.11.23 um 20:56 schrieb Alex Deucher:
> >>>> Add shared stats.  Useful for seeing shared memory.
> >>>>
> >>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >>>> ---
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
> >>>>    3 files changed, 21 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_fdinfo.c
> >>>> index 5706b282a0c7..c7df7fa3459f 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> >>>> @@ -97,6 +97,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p, st=
ruct drm_file *file)
> >>>>                   stats.requested_visible_vram/1024UL);
> >>>>        drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
> >>>>                   stats.requested_gtt/1024UL);
> >>>> +     drm_printf(p, "drm-shared-vram:\t%llu KiB\n", stats.vram_share=
d/1024UL);
> >>>> +     drm_printf(p, "drm-shared-gtt:\t%llu KiB\n", stats.gtt_shared/=
1024UL);
> >>>> +     drm_printf(p, "drm-shared-cpu:\t%llu KiB\n", stats.cpu_shared/=
1024UL);
> >>>> +
> >>>>        for (hw_ip =3D 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
> >>>>                if (!usage[hw_ip])
> >>>>                        continue;
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_object.c
> >>>> index d79b4ca1ecfc..c24f7b2c04c1 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >>>> @@ -1287,25 +1287,36 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *=
bo,
> >>>>                          struct amdgpu_mem_stats *stats)
> >>>>    {
> >>>>        uint64_t size =3D amdgpu_bo_size(bo);
> >>>> +     struct drm_gem_object *obj;
> >>>>        unsigned int domain;
> >>>> +     bool shared;
> >>>>
> >>>>        /* Abort if the BO doesn't currently have a backing store */
> >>>>        if (!bo->tbo.resource)
> >>>>                return;
> >>>>
> >>>> +     obj =3D &bo->tbo.base;
> >>>> +     shared =3D obj->handle_count > 1;
> >>> Interesting approach but I don't think that this is correct.
> >>>
> >>> The handle_count is basically how many GEM handles are there for BO, =
so
> >>> for example it doesn't catch sharing things with V4L.
> >>>
> >>> What we should probably rather do is to take a look if
> >>> bo->tbo.base.dma_buf is NULL or not.
> >> +Rob, dri-devel
> >>
> >> This is what the generic drm helper code does.  See
> >> drm_show_memory_stats().  If that is not correct that code should
> >> probably be fixed too.
> > OTOH, v4l doesn't expose fdinfo.  What "shared" is telling you is
> > whether the BO is counted multiple times when you look at all
> > processes fdinfo.
>
> Oh, then that's not fully correct either.
>
> You can have multiple handles for the same GEM object in a single client
> as well.
>
> This for example happens when you interact with KMS to get an handle for
> a displayed BO.

so, the handle is unique per drm_file which is (at least usually)
unique per process.  The handle_count is agnostic to _how_ you got the
handle (ie. via flink or dma-buf)

> DRM flink was one of the major other reasons, but I hope we are not
> using that widely any more.
>
> What exactly is the purpose? To avoid counting a BO multiple times
> because you go over the handles in the common code?
>
> If yes than I would say use obj->handle_count in the common code and
> ob->dma_buf in amdgpu because that is certainly unique.

Because the drm_file is (usually) unique per process, the purpose was
to show the amount of memory that is getting counted against multiple
processes.  The intention behind using handle_count was just that it
didn't care _how_ the buffer was shared, just that it is mapped into
more than a single drm_file.

Maybe amd userspace is doing something unique that I'm not aware of?

BR,
-R

> Regards,
> Christian.
>
> >
> > But I guess it would be ok to look for obj->handle_count > 1 || obj->dm=
a_buf
> >
> > BR,
> > -R
> >
> >> Alex
> >>
> >>> Regards,
> >>> Christian.
> >>>
> >>>
> >>>> +
> >>>>        domain =3D amdgpu_mem_type_to_domain(bo->tbo.resource->mem_ty=
pe);
> >>>>        switch (domain) {
> >>>>        case AMDGPU_GEM_DOMAIN_VRAM:
> >>>>                stats->vram +=3D size;
> >>>>                if (amdgpu_bo_in_cpu_visible_vram(bo))
> >>>>                        stats->visible_vram +=3D size;
> >>>> +             if (shared)
> >>>> +                     stats->vram_shared +=3D size;
> >>>>                break;
> >>>>        case AMDGPU_GEM_DOMAIN_GTT:
> >>>>                stats->gtt +=3D size;
> >>>> +             if (shared)
> >>>> +                     stats->gtt_shared +=3D size;
> >>>>                break;
> >>>>        case AMDGPU_GEM_DOMAIN_CPU:
> >>>>        default:
> >>>>                stats->cpu +=3D size;
> >>>> +             if (shared)
> >>>> +                     stats->cpu_shared +=3D size;
> >>>>                break;
> >>>>        }
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_object.h
> >>>> index d28e21baef16..0503af75dc26 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> >>>> @@ -138,12 +138,18 @@ struct amdgpu_bo_vm {
> >>>>    struct amdgpu_mem_stats {
> >>>>        /* current VRAM usage, includes visible VRAM */
> >>>>        uint64_t vram;
> >>>> +     /* current shared VRAM usage, includes visible VRAM */
> >>>> +     uint64_t vram_shared;
> >>>>        /* current visible VRAM usage */
> >>>>        uint64_t visible_vram;
> >>>>        /* current GTT usage */
> >>>>        uint64_t gtt;
> >>>> +     /* current shared GTT usage */
> >>>> +     uint64_t gtt_shared;
> >>>>        /* current system memory usage */
> >>>>        uint64_t cpu;
> >>>> +     /* current shared system memory usage */
> >>>> +     uint64_t cpu_shared;
> >>>>        /* sum of evicted buffers, includes visible VRAM */
> >>>>        uint64_t evicted_vram;
> >>>>        /* sum of evicted buffers due to CPU access */
>
