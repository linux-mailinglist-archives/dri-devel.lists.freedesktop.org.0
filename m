Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4B67ACD4B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 02:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F2910E1BD;
	Mon, 25 Sep 2023 00:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1368610E1BC;
 Mon, 25 Sep 2023 00:43:37 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9b275afb6abso331528666b.1; 
 Sun, 24 Sep 2023 17:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695602615; x=1696207415; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=voLpRV9BzDd7KFcn1zScjesjTJxbnSzvVJd4Ts99MQs=;
 b=bU3b3EYQlrJF9b9sNY4CWD+WTgeVN7aCHGBnxv+fabd90CoWNglWpwkyVwjMuadIve
 +FxnM/sCAbJiSuD4PuCdDtBa81SNnMTVuHz/EZfecM8joVVb8pOJ0A3C4iZh3esxJFuw
 DrGfqev/eCziaDEfthlAR22FoUcbzuECmBw+g4yONgEvakMvXmeautY0dNdQrNrLkpUE
 A9RPc7LVa3+XQkB08LkGd8PZc9yeQCahx0X72Zshu5fvtSYZJWecQw5JyjEILsdIBjf2
 0LR+ITEbqm5gyL6ZFRSXzhrPYJ18QV1tJpydz0GSuYCCk+NsT/0VySA5m0CiI2uQ6t7N
 4cZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695602615; x=1696207415;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=voLpRV9BzDd7KFcn1zScjesjTJxbnSzvVJd4Ts99MQs=;
 b=F8ueQJabOiB56cHbUaexTEcK/F/pLse/pWU1WBRT0zROyEiRzBcgNmS+vK6fXKulws
 owQ8VeU5gZ7MGNJxcoH0ndwRtco5VizYKQa+/en/Tvk1telkU5gLu7Q4/5EySbUrskPJ
 HDrXOdXfX7gkVz3dZuFpqN8PqVhLFtxhGZBSZBbIzubZpWhsTg1xVeLIOxAXhx/61u4x
 QQHENm7Qdt+GPGIcxDlejBoDqBFWn2hGF40R/rTvp3aA47N1+6qrLm8pTgoqz2r7vJa9
 8Mv76sznurlTrE+uo2rQyr2lN3cgNJDLtR0rjbGmBimCy5NvJ7LaaHlgLEYWrv5l1ai2
 4I4A==
X-Gm-Message-State: AOJu0YwQcYnzfsBALRYFPvT7v3WFHULjcyi4k18YGafR9hOWNamZEUVY
 mWPkhSy88xoE4UZEOXgpQE01Cwz38w9bIvJmFxVArFs1e/BUrQ==
X-Google-Smtp-Source: AGHT+IEaESKn3LhZPlfSbobeZNZQTAicxTBJOIIaFkSdoe4C6shOEgEdtRfmXOhL86rO6SVgWD2YYaBjDP2lHVuToCo=
X-Received: by 2002:a17:906:ca08:b0:9a5:aa43:1c7c with SMTP id
 jt8-20020a170906ca0800b009a5aa431c7cmr8856060ejb.26.1695602615372; Sun, 24
 Sep 2023 17:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-4-dakr@redhat.com>
In-Reply-To: <20230920144343.64830-4-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 25 Sep 2023 10:43:23 +1000
Message-ID: <CAPM=9txPkeaTb3sRMqdmDDKmMgaL4eNvSZ64tkfDDTr-ULjVmw@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v4 3/8] drm/nouveau: uvmm: rename 'umgr' to
 'base'
To: Danilo Krummrich <dakr@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 boris.brezillon@collabora.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Sept 2023 at 00:44, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Rename struct drm_gpuvm within struct nouveau_uvmm from 'umgr' to base.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Dave Airlie <airlied@redhat.com>


> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_exec.c    |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c    | 32 +++++++++++------------
>  drivers/gpu/drm/nouveau/nouveau_uvmm.h    |  6 ++---
>  4 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 053f703f2f68..e83db051e851 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -231,7 +231,7 @@ nouveau_debugfs_gpuva(struct seq_file *m, void *data)
>                         continue;
>
>                 nouveau_uvmm_lock(uvmm);
> -               drm_debugfs_gpuva_info(m, &uvmm->umgr);
> +               drm_debugfs_gpuva_info(m, &uvmm->base);
>                 seq_puts(m, "\n");
>                 nouveau_debugfs_gpuva_regions(m, uvmm);
>                 nouveau_uvmm_unlock(uvmm);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
> index c001952cd678..b4239af29e5a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> @@ -106,8 +106,8 @@ nouveau_exec_job_submit(struct nouveau_job *job)
>         drm_exec_until_all_locked(exec) {
>                 struct drm_gpuva *va;
>
> -               drm_gpuvm_for_each_va(va, &uvmm->umgr) {
> -                       if (unlikely(va == &uvmm->umgr.kernel_alloc_node))
> +               drm_gpuvm_for_each_va(va, &uvmm->base) {
> +                       if (unlikely(va == &uvmm->base.kernel_alloc_node))
>                                 continue;
>
>                         ret = drm_exec_prepare_obj(exec, va->gem.obj, 1);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index c750072cb268..6c86b64273c3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -329,7 +329,7 @@ nouveau_uvma_region_create(struct nouveau_uvmm *uvmm,
>         struct nouveau_uvma_region *reg;
>         int ret;
>
> -       if (!drm_gpuva_interval_empty(&uvmm->umgr, addr, range))
> +       if (!drm_gpuva_interval_empty(&uvmm->base, addr, range))
>                 return -ENOSPC;
>
>         ret = nouveau_uvma_region_alloc(&reg);
> @@ -384,7 +384,7 @@ nouveau_uvma_region_empty(struct nouveau_uvma_region *reg)
>  {
>         struct nouveau_uvmm *uvmm = reg->uvmm;
>
> -       return drm_gpuva_interval_empty(&uvmm->umgr,
> +       return drm_gpuva_interval_empty(&uvmm->base,
>                                         reg->va.addr,
>                                         reg->va.range);
>  }
> @@ -589,7 +589,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
>         uvma->region = args->region;
>         uvma->kind = args->kind;
>
> -       drm_gpuva_map(&uvmm->umgr, &uvma->va, op);
> +       drm_gpuva_map(&uvmm->base, &uvma->va, op);
>
>         /* Keep a reference until this uvma is destroyed. */
>         nouveau_uvma_gem_get(uvma);
> @@ -1194,7 +1194,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
>                                 goto unwind_continue;
>                         }
>
> -                       op->ops = drm_gpuvm_sm_unmap_ops_create(&uvmm->umgr,
> +                       op->ops = drm_gpuvm_sm_unmap_ops_create(&uvmm->base,
>                                                                 op->va.addr,
>                                                                 op->va.range);
>                         if (IS_ERR(op->ops)) {
> @@ -1205,7 +1205,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
>                         ret = nouveau_uvmm_sm_unmap_prepare(uvmm, &op->new,
>                                                             op->ops);
>                         if (ret) {
> -                               drm_gpuva_ops_free(&uvmm->umgr, op->ops);
> +                               drm_gpuva_ops_free(&uvmm->base, op->ops);
>                                 op->ops = NULL;
>                                 op->reg = NULL;
>                                 goto unwind_continue;
> @@ -1240,7 +1240,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
>                                 }
>                         }
>
> -                       op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->umgr,
> +                       op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
>                                                               op->va.addr,
>                                                               op->va.range,
>                                                               op->gem.obj,
> @@ -1256,7 +1256,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
>                                                           op->va.range,
>                                                           op->flags & 0xff);
>                         if (ret) {
> -                               drm_gpuva_ops_free(&uvmm->umgr, op->ops);
> +                               drm_gpuva_ops_free(&uvmm->base, op->ops);
>                                 op->ops = NULL;
>                                 goto unwind_continue;
>                         }
> @@ -1264,7 +1264,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
>                         break;
>                 }
>                 case OP_UNMAP:
> -                       op->ops = drm_gpuvm_sm_unmap_ops_create(&uvmm->umgr,
> +                       op->ops = drm_gpuvm_sm_unmap_ops_create(&uvmm->base,
>                                                                 op->va.addr,
>                                                                 op->va.range);
>                         if (IS_ERR(op->ops)) {
> @@ -1275,7 +1275,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
>                         ret = nouveau_uvmm_sm_unmap_prepare(uvmm, &op->new,
>                                                             op->ops);
>                         if (ret) {
> -                               drm_gpuva_ops_free(&uvmm->umgr, op->ops);
> +                               drm_gpuva_ops_free(&uvmm->base, op->ops);
>                                 op->ops = NULL;
>                                 goto unwind_continue;
>                         }
> @@ -1404,7 +1404,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
>                         break;
>                 }
>
> -               drm_gpuva_ops_free(&uvmm->umgr, op->ops);
> +               drm_gpuva_ops_free(&uvmm->base, op->ops);
>                 op->ops = NULL;
>                 op->reg = NULL;
>         }
> @@ -1509,7 +1509,7 @@ nouveau_uvmm_bind_job_free_work_fn(struct work_struct *work)
>                 }
>
>                 if (!IS_ERR_OR_NULL(op->ops))
> -                       drm_gpuva_ops_free(&uvmm->umgr, op->ops);
> +                       drm_gpuva_ops_free(&uvmm->base, op->ops);
>
>                 if (obj)
>                         drm_gem_object_put(obj);
> @@ -1836,7 +1836,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
>         uvmm->kernel_managed_addr = kernel_managed_addr;
>         uvmm->kernel_managed_size = kernel_managed_size;
>
> -       drm_gpuvm_init(&uvmm->umgr, cli->name,
> +       drm_gpuvm_init(&uvmm->base, cli->name,
>                        NOUVEAU_VA_SPACE_START,
>                        NOUVEAU_VA_SPACE_END,
>                        kernel_managed_addr, kernel_managed_size,
> @@ -1855,7 +1855,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
>         return 0;
>
>  out_free_gpuva_mgr:
> -       drm_gpuvm_destroy(&uvmm->umgr);
> +       drm_gpuvm_destroy(&uvmm->base);
>  out_unlock:
>         mutex_unlock(&cli->mutex);
>         return ret;
> @@ -1877,11 +1877,11 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
>         wait_event(entity->job.wq, list_empty(&entity->job.list.head));
>
>         nouveau_uvmm_lock(uvmm);
> -       drm_gpuvm_for_each_va_safe(va, next, &uvmm->umgr) {
> +       drm_gpuvm_for_each_va_safe(va, next, &uvmm->base) {
>                 struct nouveau_uvma *uvma = uvma_from_va(va);
>                 struct drm_gem_object *obj = va->gem.obj;
>
> -               if (unlikely(va == &uvmm->umgr.kernel_alloc_node))
> +               if (unlikely(va == &uvmm->base.kernel_alloc_node))
>                         continue;
>
>                 drm_gpuva_remove(va);
> @@ -1910,7 +1910,7 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
>
>         mutex_lock(&cli->mutex);
>         nouveau_vmm_fini(&uvmm->vmm);
> -       drm_gpuvm_destroy(&uvmm->umgr);
> +       drm_gpuvm_destroy(&uvmm->base);
>         mutex_unlock(&cli->mutex);
>
>         dma_resv_fini(&uvmm->resv);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
> index e96c9919d1bd..a308c59760a5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
> @@ -8,8 +8,8 @@
>  #include "nouveau_drv.h"
>
>  struct nouveau_uvmm {
> +       struct drm_gpuvm base;
>         struct nouveau_vmm vmm;
> -       struct drm_gpuvm umgr;
>         struct maple_tree region_mt;
>         struct mutex mutex;
>         struct dma_resv resv;
> @@ -41,10 +41,10 @@ struct nouveau_uvma {
>         u8 kind;
>  };
>
> -#define uvmm_from_mgr(x) container_of((x), struct nouveau_uvmm, umgr)
> +#define uvmm_from_gpuvm(x) container_of((x), struct nouveau_uvmm, base)
>  #define uvma_from_va(x) container_of((x), struct nouveau_uvma, va)
>
> -#define to_uvmm(x) uvmm_from_mgr((x)->va.vm)
> +#define to_uvmm(x) uvmm_from_gpuvm((x)->va.vm)
>
>  struct nouveau_uvmm_bind_job {
>         struct nouveau_job base;
> --
> 2.41.0
>
