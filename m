Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A61055A018B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AED5C1426;
	Wed, 24 Aug 2022 18:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9EDB1D4A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 00:31:07 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-334dc616f86so1895187b3.8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 17:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=IDkxEYka9y8CI7sHx+/XwxR7dJg/alMNpeUwlWvFzWQ=;
 b=etelrkO7Ud083AZn86yYDgFKaJAhvi8Bg+Zu3beXfR6qBF98NfVFwg/NKYnQZKiaKB
 PGLhGumERFEx964JnqwVWBwVKXoT+Sf4QN87pGjkJqvsQ5lm6W5GnVfAfQnmgAXaKHG4
 ZFIZc9FI/Fcqa3/iEzdkmELOZb0CegGmkPLjAZ9Da/Q9TiamEnPIhK2iXkrAPxz8Gv1+
 g6VLCg5cGSG7IX6YqKxRLHxY9j0a84NdBWKf2xLTUlqDfGtelqAsUvLEu0HTf97l2u1y
 FxN+2qOv2u7u9xIwU0FXj3veWoUnKP3VjPz/bchSGb1hLsjZXC70z+ueolkSTmo403TW
 ltiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=IDkxEYka9y8CI7sHx+/XwxR7dJg/alMNpeUwlWvFzWQ=;
 b=tAc7tN71ENNvftGy8G0Vu44JdjjqV755Dl4mtQspoxbx3VOlUAPL/GCy78bhVrLEI6
 rFvZnAl/zOtsd5nPv+bDzwIKjsnxjoXpszCZFDQttuPuHd3fAacrd35UAlPAgcQ5ulNA
 hJ/4td12abBG0Bud4KPDMZ6gVXRjE0aaetDlhKzUEa5juF7SbKmFCyxDWXgEucdTeW5z
 xbFZ6h3hm6vaYJ2lRQjTVlqSkAsMXwLg6Hvp9+g5ZcCXLq2jlwGKD/hy6yjXYacuC2zk
 ZQUstVoZt5cXq8Uj6j1gVHzQbhCusEYtHtjQKQNgRi70vq26MHvbHGLEjo2PnR7c6kvD
 iIkw==
X-Gm-Message-State: ACgBeo0DzqW1UUWq4fXoepNnBnS22EMdGwC3DG2aB1c/qcgfnUgE4k7k
 OTYVvX9C/WdUFFtiNPeg7OLPaFf1KPR/Zepajnib0A==
X-Google-Smtp-Source: AA6agR6PxX9rVuWWrBfXC2CPHKp6jKTdntGBSgsCxNZJZZ3jN2wsXdcX1DKxG+LFn/WpLUiAEy+Ri8jZ7J9jBMPVI90=
X-Received: by 2002:a0d:ef44:0:b0:332:77e4:ea39 with SMTP id
 y65-20020a0def44000000b0033277e4ea39mr620903ywe.330.1660782666516; Wed, 17
 Aug 2022 17:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
 <20220813012801.1115950-2-bas@basnieuwenhuizen.nl>
 <60ac78e0-e65f-89c2-8404-2b65911f3e05@amd.com>
In-Reply-To: <60ac78e0-e65f-89c2-8404-2b65911f3e05@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Thu, 18 Aug 2022 02:30:57 +0200
Message-ID: <CAP+8YyE7DrWHFML5FHyuDdtZW7iY9FLR8Jma2Ar5C9qB8rWReQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/ttm: Add usage to ttm_validate_buffer.
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 12:04 AM Felix Kuehling <felix.kuehling@amd.com> wrote:
>
> Am 2022-08-12 um 21:27 schrieb Bas Nieuwenhuizen:
> > This way callsites can choose between READ/BOOKKEEP reservations.
> >
> > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 5 +++++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           | 9 +++++++--
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c          | 1 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          | 8 ++++++--
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c          | 1 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 1 +
> >   drivers/gpu/drm/amd/amdkfd/kfd_svm.c             | 1 +
> >   drivers/gpu/drm/qxl/qxl_release.c                | 1 +
> >   drivers/gpu/drm/radeon/radeon_cs.c               | 2 ++
> >   drivers/gpu/drm/radeon/radeon_gem.c              | 1 +
> >   drivers/gpu/drm/radeon/radeon_vm.c               | 2 ++
> >   drivers/gpu/drm/ttm/ttm_execbuf_util.c           | 3 +--
> >   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c         | 7 ++++++-
> >   drivers/gpu/drm/vmwgfx/vmwgfx_validation.c       | 1 +
> >   include/drm/ttm/ttm_execbuf_util.h               | 2 ++
> >   15 files changed, 38 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > index 4608599ba6bb..a6eb7697c936 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > @@ -775,6 +775,7 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
> >
> >       INIT_LIST_HEAD(&entry->head);
> >       entry->num_shared = 1;
> > +     entry->usage = DMA_RESV_USAGE_READ;
>
> KFD code never calls ttm_eu_fence_buffer_objects. Does it make sense to
> set this field at all in this case?

Okay, not super familiar with this code, just wanted to make sure that
whatever we're doing in this patch is obviously not a functional
change. I guess it isn't strictly necessaru.


>
> Furthermore, I remember reviewing an RFC patch series by Christian that
> replaced all the execbuf_util functions with an iterator API. Is
> Christian's work abandoned or still in progress? How will that interact
> with your patch series?

I think instead of doing the above one would just adjust the
DMA_RESV_USAGE_WRITE references in
https://patchwork.freedesktop.org/patch/484765/?series=103522&rev=1 to
DMA_RESV_USAGE_BOOKKEEP if the submission is on a context with
disabledimplicit sync. And then obviously this patch wouldn't be
necessary anymore (as well as the PD patch).

>
> Regards,
>    Felix
>
>
> >       entry->bo = &bo->tbo;
> >       mutex_lock(&process_info->lock);
> >       if (userptr)
> > @@ -919,6 +920,7 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
> >       ctx->kfd_bo.priority = 0;
> >       ctx->kfd_bo.tv.bo = &bo->tbo;
> >       ctx->kfd_bo.tv.num_shared = 1;
> > +     ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
> >       list_add(&ctx->kfd_bo.tv.head, &ctx->list);
> >
> >       amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
> > @@ -982,6 +984,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
> >       ctx->kfd_bo.priority = 0;
> >       ctx->kfd_bo.tv.bo = &bo->tbo;
> >       ctx->kfd_bo.tv.num_shared = 1;
> > +     ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
> >       list_add(&ctx->kfd_bo.tv.head, &ctx->list);
> >
> >       i = 0;
> > @@ -2207,6 +2210,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
> >               list_add_tail(&mem->resv_list.head, &resv_list);
> >               mem->resv_list.bo = mem->validate_list.bo;
> >               mem->resv_list.num_shared = mem->validate_list.num_shared;
> > +             mem->resv_list.usage = mem->validate_list.usage;
> >       }
> >
> >       /* Reserve all BOs and page tables for validation */
> > @@ -2406,6 +2410,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
> >               list_add_tail(&mem->resv_list.head, &ctx.list);
> >               mem->resv_list.bo = mem->validate_list.bo;
> >               mem->resv_list.num_shared = mem->validate_list.num_shared;
> > +             mem->resv_list.usage = mem->validate_list.usage;
> >       }
> >
> >       ret = ttm_eu_reserve_buffers(&ctx.ticket, &ctx.list,
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > index d8f1335bc68f..f1ceb25d1b84 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -57,6 +57,7 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
> >       p->uf_entry.tv.bo = &bo->tbo;
> >       /* One for TTM and two for the CS job */
> >       p->uf_entry.tv.num_shared = 3;
> > +     p->uf_entry.tv.usage = DMA_RESV_USAGE_READ;
> >
> >       drm_gem_object_put(gobj);
> >
> > @@ -522,8 +523,10 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
> >       mutex_lock(&p->bo_list->bo_list_mutex);
> >
> >       /* One for TTM and one for the CS job */
> > -     amdgpu_bo_list_for_each_entry(e, p->bo_list)
> > +     amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> >               e->tv.num_shared = 2;
> > +             e->tv.usage = DMA_RESV_USAGE_READ;
> > +     }
> >
> >       amdgpu_bo_list_get_list(p->bo_list, &p->validated);
> >
> > @@ -1282,8 +1285,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
> >       amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
> >
> >       /* Make sure all BOs are remembered as writers */
> > -     amdgpu_bo_list_for_each_entry(e, p->bo_list)
> > +     amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> >               e->tv.num_shared = 0;
> > +             e->tv.usage = DMA_RESV_USAGE_WRITE;
> > +     }
> >
> >       ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
> >       mutex_unlock(&p->adev->notifier_lock);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> > index c6d4d41c4393..24941ed1a5ec 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> > @@ -75,6 +75,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
> >       INIT_LIST_HEAD(&csa_tv.head);
> >       csa_tv.bo = &bo->tbo;
> >       csa_tv.num_shared = 1;
> > +     csa_tv.usage = DMA_RESV_USAGE_READ;
> >
> >       list_add(&csa_tv.head, &list);
> >       amdgpu_vm_get_pd_bo(vm, &list, &pd);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > index 8ef31d687ef3..f8cf52eb1931 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > @@ -208,6 +208,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
> >
> >       tv.bo = &bo->tbo;
> >       tv.num_shared = 2;
> > +     tv.usage = DMA_RESV_USAGE_READ;
> >       list_add(&tv.head, &list);
> >
> >       amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
> > @@ -733,10 +734,13 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
> >                       return -ENOENT;
> >               abo = gem_to_amdgpu_bo(gobj);
> >               tv.bo = &abo->tbo;
> > -             if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
> > +             if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID) {
> >                       tv.num_shared = 1;
> > -             else
> > +                     tv.usage = DMA_RESV_USAGE_READ;
> > +             } else {
> >                       tv.num_shared = 0;
> > +                     tv.usage = DMA_RESV_USAGE_WRITE;
> > +             }
> >               list_add(&tv.head, &list);
> >       } else {
> >               gobj = NULL;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > index 69a70a0aaed9..6b1da37c2280 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > @@ -996,6 +996,7 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
> >
> >       csa_tv.bo = &ctx_data->meta_data_obj->tbo;
> >       csa_tv.num_shared = 1;
> > +     csa_tv.usage = DMA_RESV_USAGE_READ;
> >
> >       list_add(&csa_tv.head, &list);
> >       amdgpu_vm_get_pd_bo(vm, &list, &pd);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > index dc76d2b3ce52..1b5d2317b987 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -325,6 +325,7 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
> >       entry->tv.bo = &vm->root.bo->tbo;
> >       /* Two for VM updates, one for TTM and one for the CS job */
> >       entry->tv.num_shared = 4;
> > +     entry->tv.usage = DMA_RESV_USAGE_READ;
> >       entry->user_pages = NULL;
> >       list_add(&entry->tv.head, validated);
> >   }
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > index 7b332246eda3..83531b00b29d 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > @@ -1410,6 +1410,7 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
> >
> >               ctx->tv[gpuidx].bo = &vm->root.bo->tbo;
> >               ctx->tv[gpuidx].num_shared = 4;
> > +             ctx->tv[gpuidx].usage = DMA_RESV_USAGE_READ;
> >               list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
> >       }
> >
> > diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> > index 368d26da0d6a..0c6e45992604 100644
> > --- a/drivers/gpu/drm/qxl/qxl_release.c
> > +++ b/drivers/gpu/drm/qxl/qxl_release.c
> > @@ -184,6 +184,7 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
> >       qxl_bo_ref(bo);
> >       entry->tv.bo = &bo->tbo;
> >       entry->tv.num_shared = 0;
> > +     entry->tv.usage = DMA_RESV_USAGE_WRITE;
> >       list_add_tail(&entry->tv.head, &release->bos);
> >       return 0;
> >   }
> > diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
> > index 446f7bae54c4..6cc470dcf177 100644
> > --- a/drivers/gpu/drm/radeon/radeon_cs.c
> > +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> > @@ -184,6 +184,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
> >
> >               p->relocs[i].tv.bo = &p->relocs[i].robj->tbo;
> >               p->relocs[i].tv.num_shared = !r->write_domain;
> > +             p->relocs[i].tv.usage = r->write_domain ? DMA_RESV_USAGE_WRITE :
> > +                                                       DMA_RESV_USAGE_READ;
> >
> >               radeon_cs_buckets_add(&buckets, &p->relocs[i].tv.head,
> >                                     priority);
> > diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> > index 8c01a7f0e027..e7abd535bdc2 100644
> > --- a/drivers/gpu/drm/radeon/radeon_gem.c
> > +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> > @@ -636,6 +636,7 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
> >
> >       tv.bo = &bo_va->bo->tbo;
> >       tv.num_shared = 1;
> > +     tv.usage = DMA_RESV_USAGE_READ;
> >       list_add(&tv.head, &list);
> >
> >       vm_bos = radeon_vm_get_bos(rdev, bo_va->vm, &list);
> > diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
> > index 987cabbf1318..72ff5347b56d 100644
> > --- a/drivers/gpu/drm/radeon/radeon_vm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_vm.c
> > @@ -144,6 +144,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
> >       list[0].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
> >       list[0].tv.bo = &vm->page_directory->tbo;
> >       list[0].tv.num_shared = 1;
> > +     list[0].tv.usage = DMA_RESV_USAGE_READ;
> >       list[0].tiling_flags = 0;
> >       list_add(&list[0].tv.head, head);
> >
> > @@ -156,6 +157,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
> >               list[idx].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
> >               list[idx].tv.bo = &list[idx].robj->tbo;
> >               list[idx].tv.num_shared = 1;
> > +             list[idx].tv.usage = DMA_RESV_USAGE_READ;
> >               list[idx].tiling_flags = 0;
> >               list_add(&list[idx++].tv.head, head);
> >       }
> > diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> > index dbee34a058df..44a6bce66cf7 100644
> > --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> > @@ -154,8 +154,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
> >       list_for_each_entry(entry, list, head) {
> >               struct ttm_buffer_object *bo = entry->bo;
> >
> > -             dma_resv_add_fence(bo->base.resv, fence, entry->num_shared ?
> > -                                DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
> > +             dma_resv_add_fence(bo->base.resv, fence, entry->usage);
> >               ttm_bo_move_to_lru_tail_unlocked(bo);
> >               dma_resv_unlock(bo->base.resv);
> >       }
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> > index a7d62a4eb47b..0de0365504d6 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> > @@ -131,6 +131,7 @@ static void vmw_resource_release(struct kref *kref)
> >
> >                       val_buf.bo = bo;
> >                       val_buf.num_shared = 0;
> > +                     val_buf.usage = DMA_RESV_USAGE_WRITE;
> >                       res->func->unbind(res, false, &val_buf);
> >               }
> >               res->backup_dirty = false;
> > @@ -553,6 +554,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
> >       ttm_bo_get(&res->backup->base);
> >       val_buf->bo = &res->backup->base;
> >       val_buf->num_shared = 0;
> > +     val_buf->usage = DMA_RESV_USAGE_WRITE;
> >       list_add_tail(&val_buf->head, &val_list);
> >       ret = ttm_eu_reserve_buffers(ticket, &val_list, interruptible, NULL);
> >       if (unlikely(ret != 0))
> > @@ -658,6 +660,7 @@ static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
> >
> >       val_buf.bo = NULL;
> >       val_buf.num_shared = 0;
> > +     val_buf.usage = DMA_RESV_USAGE_WRITE;
> >       ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf);
> >       if (unlikely(ret != 0))
> >               return ret;
> > @@ -709,6 +712,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
> >
> >       val_buf.bo = NULL;
> >       val_buf.num_shared = 0;
> > +     val_buf.usage = DMA_RESV_USAGE_WRITE;
> >       if (res->backup)
> >               val_buf.bo = &res->backup->base;
> >       do {
> > @@ -777,7 +781,8 @@ void vmw_resource_unbind_list(struct vmw_buffer_object *vbo)
> >   {
> >       struct ttm_validate_buffer val_buf = {
> >               .bo = &vbo->base,
> > -             .num_shared = 0
> > +             .num_shared = 0,
> > +             .usage = DMA_RESV_USAGE_WRITE
> >       };
> >
> >       dma_resv_assert_held(vbo->base.base.resv);
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> > index f46891012be3..913e91962af1 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> > @@ -289,6 +289,7 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
> >               if (!val_buf->bo)
> >                       return -ESRCH;
> >               val_buf->num_shared = 0;
> > +             val_buf->usage = DMA_RESV_USAGE_WRITE;
> >               list_add_tail(&val_buf->head, &ctx->bo_list);
> >               bo_node->as_mob = as_mob;
> >               bo_node->cpu_blit = cpu_blit;
> > diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
> > index a99d7fdf2964..5b65f5e1354a 100644
> > --- a/include/drm/ttm/ttm_execbuf_util.h
> > +++ b/include/drm/ttm/ttm_execbuf_util.h
> > @@ -41,12 +41,14 @@
> >    * @head:           list head for thread-private list.
> >    * @bo:             refcounted buffer object pointer.
> >    * @num_shared:     How many shared fences we want to add.
> > + * @usage           dma resv usage of the fences to add.
> >    */
> >
> >   struct ttm_validate_buffer {
> >       struct list_head head;
> >       struct ttm_buffer_object *bo;
> >       unsigned int num_shared;
> > +     enum dma_resv_usage usage;
> >   };
> >
> >   /**
