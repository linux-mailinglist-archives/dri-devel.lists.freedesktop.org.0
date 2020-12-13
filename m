Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E42D8AE0
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 02:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCCA89E38;
	Sun, 13 Dec 2020 01:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B69C89E35
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Dec 2020 01:44:42 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id v5so253258qtv.7
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 17:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EbKGOofZuukmi96AVVTAKNtSltGDXcNJvJuia5Wjs/g=;
 b=RRTU2JwC7OL/3VA66lXSduHKkFEcU2yInfsSIrWZ5K2WZnT+65yTpxlSU9yrOpujC3
 YTNrTnLiL6tkTw6x9leLR4+EZWawQryPo1koQlLcdLY2/NfVJFGzgNoMdLc+3hlE6ner
 WyJ3NHLhB1gFQIYb3ZT1SZzaAjPRwhDeBR8nT99Vx2jlbG4HezBjhuGuVKydRfOy7QOK
 +RTnFNDbPfJmIi7jyxB1z+YJUUT9lsTF8UgpMb6FcPnIIYUzAay13tbaUQlYF4XO5QpN
 SWTk2fY4aIgBod+IqFj9JEfpNObL7Vbd3tT5Xye5vSHW2nVXCl+LKGhcDIJCZ5MzOrhh
 r57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EbKGOofZuukmi96AVVTAKNtSltGDXcNJvJuia5Wjs/g=;
 b=fw803CsIah6ufUE4FpM1VIocaLkN4FXz6U/i4QZa4yLNHdqG1yFGZXB+sGngxw7BqS
 pj6deoAa0Qx91Y7U9ii1/5WV+mK4vFX07nZrAthJl7yWqRT6SOSPew1JwGPFC1AkoYTj
 bPXQ6gFVHb8Zs9vYy1gBbplRTOL+MVhlQzOpiGx5LyOf9mOYlbWDB3D8akINgSYbzj0J
 nbZq2HgRvIcQsovWo59z8NVvUyunHlQJpgfmf111yJx6b6VobznmUBsHvLwIS3y03fYs
 EOEw+XTXOf/f9Di9cxm8b5NSCtK2Jhy4DX8owjZT4sAg19uehfuSAd2oTRUeqatyujmO
 4tMQ==
X-Gm-Message-State: AOAM532XiyCwXHqxXI8gY4//+XwBoJXLS9VhrLTzfzFggIDyiv82DrTq
 4+PT2hs532HLEzPLdhBHJIEgD6qoBN7N3yE6Q5BInw==
X-Google-Smtp-Source: ABdhPJzA/dp83M4doXqsQZSGLNpX8tFyYokDuiGat1Ud3bZroNh5lElssKoElEqvyH4/SWfH4FZzGzV0x/mZzG27pyQ=
X-Received: by 2002:ac8:5990:: with SMTP id e16mr25065400qte.52.1607823880982; 
 Sat, 12 Dec 2020 17:44:40 -0800 (PST)
MIME-Version: 1.0
References: <20201109005432.861936-1-airlied@gmail.com>
 <20201109005432.861936-3-airlied@gmail.com>
In-Reply-To: <20201109005432.861936-3-airlied@gmail.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Sun, 13 Dec 2020 01:44:30 +0000
Message-ID: <CAHbf0-FRoNoTJuVfs_Ywx0Edie6opa6AKLtxjOkejwPCeE-f1A@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/amdgpu/ttm: use multihop
To: Dave Airlie <airlied@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

This patch is causing issues for me on both a Raven system and a Tonga
(PRIME) system

https://gitlab.freedesktop.org/drm/amd/-/issues/1405

It's only recently been merged into agd5f's tree - which is why I'm
only just noticing it

I realise this has now been submitted for rc1 - please can someone take a look

Thanks

Mike

On Mon, 9 Nov 2020 at 00:54, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> This removes the code to move resources directly between
> SYSTEM and VRAM in favour of using the core ttm mulithop code.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 136 +++---------------------
>  1 file changed, 13 insertions(+), 123 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index ce0d82802333..e1458d575aa9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -512,119 +512,6 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>         return r;
>  }
>
> -/**
> - * amdgpu_move_vram_ram - Copy VRAM buffer to RAM buffer
> - *
> - * Called by amdgpu_bo_move().
> - */
> -static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
> -                               struct ttm_operation_ctx *ctx,
> -                               struct ttm_resource *new_mem)
> -{
> -       struct ttm_resource *old_mem = &bo->mem;
> -       struct ttm_resource tmp_mem;
> -       struct ttm_place placements;
> -       struct ttm_placement placement;
> -       int r;
> -
> -       /* create space/pages for new_mem in GTT space */
> -       tmp_mem = *new_mem;
> -       tmp_mem.mm_node = NULL;
> -       placement.num_placement = 1;
> -       placement.placement = &placements;
> -       placement.num_busy_placement = 1;
> -       placement.busy_placement = &placements;
> -       placements.fpfn = 0;
> -       placements.lpfn = 0;
> -       placements.mem_type = TTM_PL_TT;
> -       placements.flags = 0;
> -       r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
> -       if (unlikely(r)) {
> -               pr_err("Failed to find GTT space for blit from VRAM\n");
> -               return r;
> -       }
> -
> -       r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> -       if (unlikely(r))
> -               goto out_cleanup;
> -
> -       /* Bind the memory to the GTT space */
> -       r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
> -       if (unlikely(r)) {
> -               goto out_cleanup;
> -       }
> -
> -       /* blit VRAM to GTT */
> -       r = amdgpu_move_blit(bo, evict, &tmp_mem, old_mem);
> -       if (unlikely(r)) {
> -               goto out_cleanup;
> -       }
> -
> -       r = ttm_bo_wait_ctx(bo, ctx);
> -       if (unlikely(r))
> -               goto out_cleanup;
> -
> -       amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
> -       ttm_resource_free(bo, &bo->mem);
> -       ttm_bo_assign_mem(bo, new_mem);
> -out_cleanup:
> -       ttm_resource_free(bo, &tmp_mem);
> -       return r;
> -}
> -
> -/**
> - * amdgpu_move_ram_vram - Copy buffer from RAM to VRAM
> - *
> - * Called by amdgpu_bo_move().
> - */
> -static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
> -                               struct ttm_operation_ctx *ctx,
> -                               struct ttm_resource *new_mem)
> -{
> -       struct ttm_resource *old_mem = &bo->mem;
> -       struct ttm_resource tmp_mem;
> -       struct ttm_placement placement;
> -       struct ttm_place placements;
> -       int r;
> -
> -       /* make space in GTT for old_mem buffer */
> -       tmp_mem = *new_mem;
> -       tmp_mem.mm_node = NULL;
> -       placement.num_placement = 1;
> -       placement.placement = &placements;
> -       placement.num_busy_placement = 1;
> -       placement.busy_placement = &placements;
> -       placements.fpfn = 0;
> -       placements.lpfn = 0;
> -       placements.mem_type = TTM_PL_TT;
> -       placements.flags = 0;
> -       r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
> -       if (unlikely(r)) {
> -               pr_err("Failed to find GTT space for blit to VRAM\n");
> -               return r;
> -       }
> -
> -       /* move/bind old memory to GTT space */
> -       r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> -       if (unlikely(r))
> -               return r;
> -
> -       r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
> -       if (unlikely(r)) {
> -               goto out_cleanup;
> -       }
> -
> -       ttm_bo_assign_mem(bo, &tmp_mem);
> -       /* copy to VRAM */
> -       r = amdgpu_move_blit(bo, evict, new_mem, old_mem);
> -       if (unlikely(r)) {
> -               goto out_cleanup;
> -       }
> -out_cleanup:
> -       ttm_resource_free(bo, &tmp_mem);
> -       return r;
> -}
> -
>  /**
>   * amdgpu_mem_visible - Check that memory can be accessed by ttm_bo_move_memcpy
>   *
> @@ -664,6 +551,17 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>         struct ttm_resource *old_mem = &bo->mem;
>         int r;
>
> +       if ((old_mem->mem_type == TTM_PL_SYSTEM &&
> +            new_mem->mem_type == TTM_PL_VRAM) ||
> +           (old_mem->mem_type == TTM_PL_VRAM &&
> +            new_mem->mem_type == TTM_PL_SYSTEM)) {
> +               hop->fpfn = 0;
> +               hop->lpfn = 0;
> +               hop->mem_type = TTM_PL_TT;
> +               hop->flags = 0;
> +               return -EMULTIHOP;
> +       }
> +
>         if (new_mem->mem_type == TTM_PL_TT) {
>                 r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, new_mem);
>                 if (r)
> @@ -717,16 +615,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>                 goto memcpy;
>         }
>
> -       if (old_mem->mem_type == TTM_PL_VRAM &&
> -           new_mem->mem_type == TTM_PL_SYSTEM) {
> -               r = amdgpu_move_vram_ram(bo, evict, ctx, new_mem);
> -       } else if (old_mem->mem_type == TTM_PL_SYSTEM &&
> -                  new_mem->mem_type == TTM_PL_VRAM) {
> -               r = amdgpu_move_ram_vram(bo, evict, ctx, new_mem);
> -       } else {
> -               r = amdgpu_move_blit(bo, evict,
> -                                    new_mem, old_mem);
> -       }
> +       r = amdgpu_move_blit(bo, evict,
> +                            new_mem, old_mem);
>
>         if (r) {
>  memcpy:
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
