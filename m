Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FEF9C937E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 21:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0F610E372;
	Thu, 14 Nov 2024 20:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xd+/2wSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092B610E371;
 Thu, 14 Nov 2024 20:53:45 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2e9ecb67701so153353a91.1; 
 Thu, 14 Nov 2024 12:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731617624; x=1732222424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AKcSpj7khO8+TCIDRUA8b+7C9CtuE4YnmQ1ETsOGD7w=;
 b=Xd+/2wSLmAbe6+gIhCZAHn0ds53qSZFIiXFpFg/xEQBzO+Vg6XUKM7/TyjPLJL+J6a
 c7ITM/j4iSAuVkAH+nQwE9eBACYwc54cQ9M22mkR/mP1TIRqqmAqHGluBqegtOatxYYf
 7a7MMrOtwjL8cnqnYMWYq2Up5D+OkNlQvQT4P/KaeopZY0TY9apRha+OYfvSgiiPTS47
 yBuAYiQXvasuc7PeuYAjh5V0pVsUOMeQrlinYalQ3oMAq0a0agNitj5f+Os6SSAIwGO/
 8SbZIyKeYZAThhi9XiYYz8S9aGhesdJr+Il8SEM+2yUtC/7idFiEwC06C7TM7vDO5ybU
 eV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731617624; x=1732222424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AKcSpj7khO8+TCIDRUA8b+7C9CtuE4YnmQ1ETsOGD7w=;
 b=E+uZGhvaxcu6ARNTJwWR+80IDjfPo3ANtuRCGR7PQtcOmdQBxaYX1W4Rfm8fISV8ix
 k6aY0mXWAqkGPTEZD7u2cwQSv97BPDDAJ7weJz/LZYjk+8eHqC7TN0d9LRNhogN+jXj9
 WfjxpwTZma4m01+jY3rrZg4LVR/Sae4al0SHu+ece/9b9kNmY7H8smruG8wtPrgXsEhh
 9vxZ15uNiqqsGvyW5jvDbvEfZPqL/4qhkZmHWZaofhOSPfsT2Ecf+eYyfStsy4W3otFK
 Fbk+4LcyluSUW8cwxupQ+/0/3ZxCAfpVdURoFWQb9H6Qop7ndclbww7s06rKZ1kXysEy
 8O4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC84EZsXeaVt0MI9wOQTSRt3y8lJ0IXRmSInSP0BB5IFMxF+q+rNOWY+vRyci9a2q+8XFwvRpj1xQ=@lists.freedesktop.org,
 AJvYcCXOqoMyMrs0Jjqp2/mBjgasDpjQKZ9pVUHj++OHG5kpjzYJcdTUeb+W2rWB9MdfdZrQKxDEOpEL@lists.freedesktop.org,
 AJvYcCXxD/xorMBQme6CUBeAfA7kkSEGL2DLXNMglosj/k0qsrOquQA00NprQSk4mGcocnapDqQDuVfValYr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybI77VEI1Zkn5gU3tbifMEV5xUEkfW5QrxNMpqhJcAHHWQvkYr
 3CiTB0Wbd6N6rjlpjHTu6kywMUAElBvNVlHPtGLFkwfOR0GwHTP/odBxGkh7uMumz22QF0RA8tg
 +wq7C+BJrtvP/I5gFQ9xZhq6HaJs9wQ==
X-Gm-Gg: ASbGncsraBE0Ayu1tBqCM8Buf1rRHlE1SgFmo9cFBbJtYkhTLjcwrTQH1r1w2ZhGnJ9
 ZSxG+zuYHv2fV9qgRm4VbJwenS6hhUj8=
X-Google-Smtp-Source: AGHT+IGqvuOsaaHV/+kDB6dUWSr1m9S2FJB+Wn8XuP/Le0cYeK0HVo/syS0/AFk02EAm93ftWyTb8IbMRCtBvaQAkho=
X-Received: by 2002:a17:90b:4b0c:b0:2e2:e860:f69d with SMTP id
 98e67ed59e1d1-2ea1559443amr147853a91.7.1731617624235; Thu, 14 Nov 2024
 12:53:44 -0800 (PST)
MIME-Version: 1.0
References: <20241114153020.6209-1-christian.koenig@amd.com>
 <20241114153020.6209-3-christian.koenig@amd.com>
In-Reply-To: <20241114153020.6209-3-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Nov 2024 15:53:30 -0500
Message-ID: <CADnq5_OC9bLC8ZuPQatmYSVmjDspwgdLcv8Xd251fr=nhHgOSA@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/qxl: switch to using drm_exec v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: kraxel@redhat.com, airlied@redhat.com, alexander.deucher@amd.com, 
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
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

On Thu, Nov 14, 2024 at 10:44=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Just a straightforward conversion without any optimization.
>
> Only compile tested for now.
>
> v2: rebase
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/qxl/Kconfig       |  1 +
>  drivers/gpu/drm/qxl/qxl_drv.h     |  7 ++--
>  drivers/gpu/drm/qxl/qxl_release.c | 68 ++++++++++++++++---------------
>  3 files changed, 40 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/qxl/Kconfig b/drivers/gpu/drm/qxl/Kconfig
> index 1992df4a82d2..ebf452aa1e80 100644
> --- a/drivers/gpu/drm/qxl/Kconfig
> +++ b/drivers/gpu/drm/qxl/Kconfig
> @@ -6,6 +6,7 @@ config DRM_QXL
>         select DRM_KMS_HELPER
>         select DRM_TTM
>         select DRM_TTM_HELPER
> +       select DRM_EXEC
>         select CRC32
>         help
>           QXL virtual GPU for Spice virtualization desktop integration.
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.=
h
> index 32069acd93f8..b5fc14c9525d 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.h
> +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> @@ -38,12 +38,12 @@
>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_exec.h>
>  #include <drm/drm_gem_ttm_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_gem.h>
>  #include <drm/qxl_drm.h>
>  #include <drm/ttm/ttm_bo.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_placement.h>
>
>  #include "qxl_dev.h"
> @@ -101,7 +101,8 @@ struct qxl_gem {
>  };
>
>  struct qxl_bo_list {
> -       struct ttm_validate_buffer tv;
> +       struct qxl_bo           *bo;
> +       struct list_head        list;
>  };
>
>  struct qxl_crtc {
> @@ -150,7 +151,7 @@ struct qxl_release {
>         struct qxl_bo *release_bo;
>         uint32_t release_offset;
>         uint32_t surface_release_id;
> -       struct ww_acquire_ctx ticket;
> +       struct drm_exec exec;
>         struct list_head bos;
>  };
>
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_=
release.c
> index 368d26da0d6a..05204a6a3fa8 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -121,13 +121,11 @@ qxl_release_free_list(struct qxl_release *release)
>  {
>         while (!list_empty(&release->bos)) {
>                 struct qxl_bo_list *entry;
> -               struct qxl_bo *bo;
>
>                 entry =3D container_of(release->bos.next,
> -                                    struct qxl_bo_list, tv.head);
> -               bo =3D to_qxl_bo(entry->tv.bo);
> -               qxl_bo_unref(&bo);
> -               list_del(&entry->tv.head);
> +                                    struct qxl_bo_list, list);
> +               qxl_bo_unref(&entry->bo);
> +               list_del(&entry->list);
>                 kfree(entry);
>         }
>         release->release_bo =3D NULL;
> @@ -172,8 +170,8 @@ int qxl_release_list_add(struct qxl_release *release,=
 struct qxl_bo *bo)
>  {
>         struct qxl_bo_list *entry;
>
> -       list_for_each_entry(entry, &release->bos, tv.head) {
> -               if (entry->tv.bo =3D=3D &bo->tbo)
> +       list_for_each_entry(entry, &release->bos, list) {
> +               if (entry->bo =3D=3D bo)
>                         return 0;
>         }
>
> @@ -182,9 +180,8 @@ int qxl_release_list_add(struct qxl_release *release,=
 struct qxl_bo *bo)
>                 return -ENOMEM;
>
>         qxl_bo_ref(bo);
> -       entry->tv.bo =3D &bo->tbo;
> -       entry->tv.num_shared =3D 0;
> -       list_add_tail(&entry->tv.head, &release->bos);
> +       entry->bo =3D bo;
> +       list_add_tail(&entry->list, &release->bos);
>         return 0;
>  }
>
> @@ -221,21 +218,28 @@ int qxl_release_reserve_list(struct qxl_release *re=
lease, bool no_intr)
>         if (list_is_singular(&release->bos))
>                 return 0;
>
> -       ret =3D ttm_eu_reserve_buffers(&release->ticket, &release->bos,
> -                                    !no_intr, NULL);
> -       if (ret)
> -               return ret;
> -
> -       list_for_each_entry(entry, &release->bos, tv.head) {
> -               struct qxl_bo *bo =3D to_qxl_bo(entry->tv.bo);
> -
> -               ret =3D qxl_release_validate_bo(bo);
> -               if (ret) {
> -                       ttm_eu_backoff_reservation(&release->ticket, &rel=
ease->bos);
> -                       return ret;
> +       drm_exec_init(&release->exec, no_intr ? 0 :
> +                     DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> +       drm_exec_until_all_locked(&release->exec) {
> +               list_for_each_entry(entry, &release->bos, list) {
> +                       ret =3D drm_exec_prepare_obj(&release->exec,
> +                                                  &entry->bo->tbo.base,
> +                                                  1);
> +                       drm_exec_retry_on_contention(&release->exec);
> +                       if (ret)
> +                               goto error;
>                 }
>         }
> +
> +       list_for_each_entry(entry, &release->bos, list) {
> +               ret =3D qxl_release_validate_bo(entry->bo);
> +               if (ret)
> +                       goto error;
> +       }
>         return 0;
> +error:
> +       drm_exec_fini(&release->exec);
> +       return ret;
>  }
>
>  void qxl_release_backoff_reserve_list(struct qxl_release *release)
> @@ -245,7 +249,7 @@ void qxl_release_backoff_reserve_list(struct qxl_rele=
ase *release)
>         if (list_is_singular(&release->bos))
>                 return;
>
> -       ttm_eu_backoff_reservation(&release->ticket, &release->bos);
> +       drm_exec_fini(&release->exec);
>  }
>
>  int qxl_alloc_surface_release_reserved(struct qxl_device *qdev,
> @@ -404,18 +408,18 @@ void qxl_release_unmap(struct qxl_device *qdev,
>
>  void qxl_release_fence_buffer_objects(struct qxl_release *release)
>  {
> -       struct ttm_buffer_object *bo;
>         struct ttm_device *bdev;
> -       struct ttm_validate_buffer *entry;
> +       struct qxl_bo_list *entry;
>         struct qxl_device *qdev;
> +       struct qxl_bo *bo;
>
>         /* if only one object on the release its the release itself
>            since these objects are pinned no need to reserve */
>         if (list_is_singular(&release->bos) || list_empty(&release->bos))
>                 return;
>
> -       bo =3D list_first_entry(&release->bos, struct ttm_validate_buffer=
, head)->bo;
> -       bdev =3D bo->bdev;
> +       bo =3D list_first_entry(&release->bos, struct qxl_bo_list, list)-=
>bo;
> +       bdev =3D bo->tbo.bdev;
>         qdev =3D container_of(bdev, struct qxl_device, mman.bdev);
>
>         /*
> @@ -426,14 +430,12 @@ void qxl_release_fence_buffer_objects(struct qxl_re=
lease *release)
>                        release->id | 0xf0000000, release->base.seqno);
>         trace_dma_fence_emit(&release->base);
>
> -       list_for_each_entry(entry, &release->bos, head) {
> +       list_for_each_entry(entry, &release->bos, list) {
>                 bo =3D entry->bo;
>
> -               dma_resv_add_fence(bo->base.resv, &release->base,
> +               dma_resv_add_fence(bo->tbo.base.resv, &release->base,
>                                    DMA_RESV_USAGE_READ);
> -               ttm_bo_move_to_lru_tail_unlocked(bo);
> -               dma_resv_unlock(bo->base.resv);
> +               ttm_bo_move_to_lru_tail_unlocked(&bo->tbo);
>         }
> -       ww_acquire_fini(&release->ticket);
> +       drm_exec_fini(&release->exec);
>  }
> -
> --
> 2.34.1
>
