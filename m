Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0188B827A32
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 22:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E986A10E315;
	Mon,  8 Jan 2024 21:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0118E10E312;
 Mon,  8 Jan 2024 21:28:04 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5986ea37615so342563eaf.2; 
 Mon, 08 Jan 2024 13:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704749284; x=1705354084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3+nq7nB/6IK1DfCTTtYUEB9ndrdC6cOr1y6h7L7cNRc=;
 b=RqnlUaDdm/y+RUTNPNTk7cVucvMuLHwZm5KmH57nuZQ+qjBF2XVzR9ILiFdZz4FSAB
 byNPJfrnTUrRIo8nT9Qab2QdA7UvBPAYzGXDkXeCm6QAqWmlWYysz63N3oVnSWrnIfpA
 p4pS9H1O1IZhYvpRY4r8oz5g3NEoKEg7PjMPUEwLcsiHafL5jljsCwqGrfQRiNEiG67K
 F9QJn7fQcnLN7oJlW/tEK6vOPXaDMFs5gRCpfl6CMbzSLOh7vxKFE85HYbOgP90Og3JM
 Xbn1UbBmImdGFE7VlL6qnTY5xFsXNNSeKAwnOp62wQ6ekr+MMKIfj1OmCgzo/tFQvfTz
 jK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704749284; x=1705354084;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3+nq7nB/6IK1DfCTTtYUEB9ndrdC6cOr1y6h7L7cNRc=;
 b=ZQ18UIEoKN0Rvf++K34tuhg0wklobrn1H0yDbJ1NmKZAniJsJlRuiVFG6LSUXvzefk
 ROrMtCOjJOCEwFNdObGgtnffXSuVn+G7KnMbFqrB2CRVx/wmf4EUvPS+H9j73g6FTZEy
 U4SM1wGxHGR2jQbJ4iBfoDb1VZJk2TH7y2HgLdKqEMI+QaJTchRh/t8kqTHv+lj7kAij
 tKEFs2T9VAAivrDKFA5dZF05+cb0XJyEW2oRGoZq6GCKgkXqNt5SYWk+FxemZiUCAoSO
 KOFR/b5PuUfy2YfY42e9vTvGjuaVpu5mQigLLg4EKlXmk5oz8LqGXm/mv5f4f+g8NvNa
 +HRw==
X-Gm-Message-State: AOJu0YwdB7IHsigJyxjlHuOeY/rLXr32zxzMvf4kn3JpRao7HnBMpXsj
 pnoAf6uDpzJmNZKE09YqBzxUVuFUwaPdqd6pifM=
X-Google-Smtp-Source: AGHT+IHLdbmsVhMvpQ/95aX/xIDVOmeo27sf4cq5UZJghMUfnyUSaCxqBB8Nw4RXz1b/Wn/srAxVAZmGPGCmobx5SpE=
X-Received: by 2002:a05:6870:418e:b0:204:14ac:afff with SMTP id
 y14-20020a056870418e00b0020414acafffmr5453540oac.63.1704749284115; Mon, 08
 Jan 2024 13:28:04 -0800 (PST)
MIME-Version: 1.0
References: <20231207180225.439482-1-alexander.deucher@amd.com>
 <20231207180225.439482-3-alexander.deucher@amd.com>
In-Reply-To: <20231207180225.439482-3-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jan 2024 16:27:53 -0500
Message-ID: <CADnq5_MurazPCjnR6dbzbpue-EmmqWXHtYtv4JKUi0GeaAuyjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: add shared fdinfo stats
To: Alex Deucher <alexander.deucher@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping?

Alex

On Thu, Dec 7, 2023 at 1:03=E2=80=AFPM Alex Deucher <alexander.deucher@amd.=
com> wrote:
>
> Add shared stats.  Useful for seeing shared memory.
>
> v2: take dma-buf into account as well
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: Rob Clark <robdclark@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
>  3 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_fdinfo.c
> index 5706b282a0c7..c7df7fa3459f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -97,6 +97,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct =
drm_file *file)
>                    stats.requested_visible_vram/1024UL);
>         drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
>                    stats.requested_gtt/1024UL);
> +       drm_printf(p, "drm-shared-vram:\t%llu KiB\n", stats.vram_shared/1=
024UL);
> +       drm_printf(p, "drm-shared-gtt:\t%llu KiB\n", stats.gtt_shared/102=
4UL);
> +       drm_printf(p, "drm-shared-cpu:\t%llu KiB\n", stats.cpu_shared/102=
4UL);
> +
>         for (hw_ip =3D 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
>                 if (!usage[hw_ip])
>                         continue;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index d79b4ca1ecfc..1b37d95475b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1287,25 +1287,36 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
>                           struct amdgpu_mem_stats *stats)
>  {
>         uint64_t size =3D amdgpu_bo_size(bo);
> +       struct drm_gem_object *obj;
>         unsigned int domain;
> +       bool shared;
>
>         /* Abort if the BO doesn't currently have a backing store */
>         if (!bo->tbo.resource)
>                 return;
>
> +       obj =3D &bo->tbo.base;
> +       shared =3D (obj->handle_count > 1) || obj->dma_buf;
> +
>         domain =3D amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
>         switch (domain) {
>         case AMDGPU_GEM_DOMAIN_VRAM:
>                 stats->vram +=3D size;
>                 if (amdgpu_bo_in_cpu_visible_vram(bo))
>                         stats->visible_vram +=3D size;
> +               if (shared)
> +                       stats->vram_shared +=3D size;
>                 break;
>         case AMDGPU_GEM_DOMAIN_GTT:
>                 stats->gtt +=3D size;
> +               if (shared)
> +                       stats->gtt_shared +=3D size;
>                 break;
>         case AMDGPU_GEM_DOMAIN_CPU:
>         default:
>                 stats->cpu +=3D size;
> +               if (shared)
> +                       stats->cpu_shared +=3D size;
>                 break;
>         }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.h
> index d28e21baef16..0503af75dc26 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -138,12 +138,18 @@ struct amdgpu_bo_vm {
>  struct amdgpu_mem_stats {
>         /* current VRAM usage, includes visible VRAM */
>         uint64_t vram;
> +       /* current shared VRAM usage, includes visible VRAM */
> +       uint64_t vram_shared;
>         /* current visible VRAM usage */
>         uint64_t visible_vram;
>         /* current GTT usage */
>         uint64_t gtt;
> +       /* current shared GTT usage */
> +       uint64_t gtt_shared;
>         /* current system memory usage */
>         uint64_t cpu;
> +       /* current shared system memory usage */
> +       uint64_t cpu_shared;
>         /* sum of evicted buffers, includes visible VRAM */
>         uint64_t evicted_vram;
>         /* sum of evicted buffers due to CPU access */
> --
> 2.42.0
>
