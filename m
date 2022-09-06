Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D574A5AEEFB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 17:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8EE10E6E0;
	Tue,  6 Sep 2022 15:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D421310E6E0;
 Tue,  6 Sep 2022 15:36:39 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 92-20020a9d0be5000000b0063946111607so8305860oth.10; 
 Tue, 06 Sep 2022 08:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kyc7bxuF/MOj4opkZXlh6NcWSth9xN0XkkZ0B/cEQGs=;
 b=aPElF2JldDnBC7r0QU1r4YqTBzxi2E4Q+DePT5N4FZfXUjybW3gTHevWTih1Sxst5j
 j3CcULe1Z4zxdebOiynDpLujPn7dbNCyvtXNHKfD5SPYusRNkZjqxY51bPnBtpM8RD9k
 4z3Slm40kj7NPPo87I1rq/tbnTT/36X3LJB159Wo5KFoOsDyVhNia5gQig0GicvbMo1n
 0eBQrvtdnim1M14PT935GahpuNCpCYeVWBRoSME9N469Ky+tx8Oclgl5iMPPk1fhBayl
 nq97AAAHm7iZKThwREBRee6gGWL6tW672lhUfhho/KURrn8x/QfMo7LA/1442XRDi6gC
 eWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kyc7bxuF/MOj4opkZXlh6NcWSth9xN0XkkZ0B/cEQGs=;
 b=RfhqJuBhTWoVtMdgueUiZv3eOfKj8zfqUsDcSkiEHUi5ZYjVsaSjdGbKU472kM5Aqi
 wyLWf0iPNGbvYbY7e7YvgAo+8swjHz0lb56DvJy8uQk+thc8JTLYh7LEIHSX01rXealP
 8MO5z9+OELd/XVw6Fk3SKj0hNS9gE9HeQnOmNf1IZqv2AMKNgwLJeqoiqqHvVf57QApe
 9wiF2+LMTqD0NHyI6Xqa8nLfqew5NrKG+UNwUmnuLi8PWjfCn90BFE/Bucn+vuGjedik
 8znqwk/GHBSSvgAlBsL7FrH3tcrZiPW/BLzn2XV190073HMcDDKqQ401o7bHjJElliJ1
 iFxw==
X-Gm-Message-State: ACgBeo1zurOn3InennaRue0ayrTiPBne2Valnx+JzaIG7F1FZA5EgQZl
 N8VMfpow6PcjL44K5Ex11LzVc5fUfVY8niyDjfQ=
X-Google-Smtp-Source: AA6agR4d09ZClAbs2F8gPL7mf8Lj8ehTZw1MEqdDLPyjccmMTPR9TlMlFFr+EVa8i9RdU3LT7nA7EEVfBeH4NEyepuM=
X-Received: by 2002:a9d:6ad7:0:b0:636:f76b:638a with SMTP id
 m23-20020a9d6ad7000000b00636f76b638amr22585680otq.233.1662478599143; Tue, 06
 Sep 2022 08:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220905073922.22738-1-jingyuwang_vip@163.com>
In-Reply-To: <20220905073922.22738-1-jingyuwang_vip@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Sep 2022 11:36:28 -0400
Message-ID: <CADnq5_OeOy-X=FX19SFn+XaT0X_DAOPgf3i4cfdHUzS813H_=g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: recleanup coding style in amdgpu_fence.c
To: Jingyu Wang <jingyuwang_vip@163.com>
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
Cc: Jack.Xiao@amd.com, len.brown@intel.com, airlied@linux.ie,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ray.huang@amd.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, Likun.Gao@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 3:40 AM Jingyu Wang <jingyuwang_vip@163.com> wrote:
>
> Fix everything checkpatch.pl complained about in amdgpu_fence.c,
> modified use "} else {", sent it again, thx.
>
> Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 8adeb7469f1e..0759d86d92da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: MIT
>  /*
>   * Copyright 2009 Jerome Glisse.
>   * All Rights Reserved.
> @@ -42,7 +43,6 @@
>  #include "amdgpu_reset.h"
>
>  /*
> - * Fences

What is the point of this change?

Alex

>   * Fences mark an event in the GPUs pipeline and are used
>   * for GPU/CPU synchronization.  When the fence is written,
>   * it is expected that all buffers associated with that fence
> @@ -139,7 +139,7 @@ static u32 amdgpu_fence_read(struct amdgpu_ring *ring)
>   * Returns 0 on success, -ENOMEM on failure.
>   */
>  int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amdgpu_job *job,
> -                     unsigned flags)
> +                     unsigned int flags)
>  {
>         struct amdgpu_device *adev = ring->adev;
>         struct dma_fence *fence;
> @@ -173,11 +173,11 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
>                                        adev->fence_context + ring->idx, seq);
>                         /* Against remove in amdgpu_job_{free, free_cb} */
>                         dma_fence_get(fence);
> -               }
> -               else
> +               } else {
>                         dma_fence_init(fence, &amdgpu_fence_ops,
>                                        &ring->fence_drv.lock,
>                                        adev->fence_context + ring->idx, seq);
> +               }
>         }
>
>         amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
> @@ -393,7 +393,7 @@ signed long amdgpu_fence_wait_polling(struct amdgpu_ring *ring,
>   * Returns the number of emitted fences on the ring.  Used by the
>   * dynpm code to ring track activity.
>   */
> -unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring)
> +unsigned int amdgpu_fence_count_emitted(struct amdgpu_ring *ring)
>  {
>         uint64_t emitted;
>
> @@ -422,7 +422,7 @@ unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring)
>   */
>  int amdgpu_fence_driver_start_ring(struct amdgpu_ring *ring,
>                                    struct amdgpu_irq_src *irq_src,
> -                                  unsigned irq_type)
> +                                  unsigned int irq_type)
>  {
>         struct amdgpu_device *adev = ring->adev;
>         uint64_t index;
> @@ -594,6 +594,7 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev)
>
>         for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>                 struct amdgpu_ring *ring = adev->rings[i];
> +
>                 if (!ring || !ring->fence_drv.initialized)
>                         continue;
>
> @@ -772,6 +773,7 @@ static int amdgpu_debugfs_fence_info_show(struct seq_file *m, void *unused)
>
>         for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>                 struct amdgpu_ring *ring = adev->rings[i];
> +
>                 if (!ring || !ring->fence_drv.initialized)
>                         continue;
>
> @@ -845,6 +847,7 @@ static void amdgpu_debugfs_reset_work(struct work_struct *work)
>                                                   reset_work);
>
>         struct amdgpu_reset_context reset_context;
> +
>         memset(&reset_context, 0, sizeof(reset_context));
>
>         reset_context.method = AMD_RESET_METHOD_NONE;
>
> base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
> --
> 2.34.1
>
