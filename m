Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3D460D220
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 18:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DA810E0BB;
	Tue, 25 Oct 2022 16:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10F110E069;
 Tue, 25 Oct 2022 16:58:12 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id be13so23243092lfb.4;
 Tue, 25 Oct 2022 09:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NAHiAkoIs5ZI+H9CpjNWTVdFP+rcVNGHdF+ZYWpNgJw=;
 b=aeyA8OCdNMJTgH0GxIhSLZ47lpjVytIrVZB8TQdCA+Q1fz6jsTPTP95Rm18KHmQAlW
 k3A7tWwJ1z1kPPZve3gfBRmy6Pa63xBukM33ppUirPMEH89H6Z8aibmh7ZN4d6e/dinM
 GIIa6uYv5bB5M3g+agJ2/VMk7AT4h4kB8LuNDSGNr8n/RRxo2m8+h0cjVZpW8PptU0aR
 TBWseI8GhVi6HNSexUxfR5oADCOltgIQjuaNL1FJOscf+1wJMfTj5fLvrjKVdaB3Lu96
 R5ZaxDG6Yj9V37+l18h71BEE6iMsjYA6HZlsbRq4ZIRDHMutj5RuZ4zV7lABnChMRMUF
 +S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NAHiAkoIs5ZI+H9CpjNWTVdFP+rcVNGHdF+ZYWpNgJw=;
 b=erbB8IME7dgQlbDeNK9jMB60BK6WHZkCox4/9/hTq1UKlIfdRmhw+GpBpnkV8LiaPB
 2PnWYGiyCCfYvRlYcTbgIHF5H+7+5FaZhUkGdP0zZBqm7rpjTpIahX97/2i6fHMcvd83
 XrPCxmZB+uFghmRA9+NIfMcTVqvKcSgyJeYyd1bRCjl1TDapFJHxL4lQ232CzmwX9owe
 xxuZkBHZJ+JfnqKj60w2NnMvmN48vjLyQVJjloeNos0oX5b7xOlg9DMRuhYlYJ6QBVB9
 CMSht/LSDIfJpR3PzSm5hOkKMsFGjGk+MQykv8ZXE6lqHZ5JwBu3ZbbEuZwH0qzw1/3S
 AA2Q==
X-Gm-Message-State: ACrzQf325dUniUWpFR8HpGmzej/suEYu7jdDUjywsnnPdZNHIPW+fez5
 EV1JRuTx8HOtlKBbFVmsg1Y304905OQzL8DgRaA=
X-Google-Smtp-Source: AMsMyM7VpG5aEAjnwI16RrAXQ317hqiN/l8jCG36xqgn50w47doHkKJQpqB9zSfCHLXWIlZPEG/LJqSarvitSifNl9U=
X-Received: by 2002:ac2:514e:0:b0:4a2:34a4:2d9b with SMTP id
 q14-20020ac2514e000000b004a234a42d9bmr15472216lfd.166.1666717091127; Tue, 25
 Oct 2022 09:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221025155057.40128-1-Amaranath.Somalapuram@amd.com>
In-Reply-To: <20221025155057.40128-1-Amaranath.Somalapuram@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 25 Oct 2022 17:57:42 +0100
Message-ID: <CAM0jSHP+XMuk1D1P9jz7onApv6MMfXfEV1pygTbZHJFne=w+Hw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/ttm: rework on ttm_resource to use
 size_t type
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
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
Cc: arunpravin.paneerselvam@amd.com, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Oct 2022 at 16:51, Somalapuram Amaranath
<Amaranath.Somalapuram@amd.com> wrote:
>
> Change ttm_resource structure from num_pages to size_t size in bytes.
> v1 -> v2: change PFN_UP(dst_mem->size) to ttm->num_pages
> v1 -> v2: change bo->resource->size to bo->base.size at some places
> v1 -> v2: remove the local variable
> v1 -> v2: cleanup cmp_size_smaller_first()
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c    |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c        |  6 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c   |  8 ++++----
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c        |  2 +-
>  drivers/gpu/drm/i915/i915_scatterlist.c        |  4 ++--
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c  | 12 ++++++------
>  drivers/gpu/drm/i915/intel_region_ttm.c        |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.c           |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_bo0039.c       |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_bo5039.c       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo74c1.c       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo85b5.c       |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_bo9039.c       |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_bo90b5.c       |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_boa0b5.c       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c          |  5 ++---
>  drivers/gpu/drm/nouveau/nouveau_mem.c          |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_ttm.c          |  2 +-
>  drivers/gpu/drm/radeon/radeon_cs.c             |  7 +++++--
>  drivers/gpu/drm/radeon/radeon_object.c         |  4 ++--
>  drivers/gpu/drm/radeon/radeon_trace.h          |  2 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c            |  4 ++--
>  drivers/gpu/drm/ttm/ttm_bo.c                   |  3 ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c              |  6 +++---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c                |  4 ++--
>  drivers/gpu/drm/ttm/ttm_range_manager.c        |  2 +-
>  drivers/gpu/drm/ttm/ttm_resource.c             | 14 ++++++--------
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c           |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c             |  6 +++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c        |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c        |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c  |  6 +++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c            |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c     |  6 +++---
>  include/drm/ttm/ttm_resource.h                 |  4 ++--
>  38 files changed, 79 insertions(+), 81 deletions(-)
>

<snip>

> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 38119311284d..f86dc92965bb 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -217,7 +217,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>         page_last = vma_pages(vma) + vma->vm_pgoff -
>                 drm_vma_node_start(&bo->base.vma_node);
>
> -       if (unlikely(page_offset >= bo->resource->num_pages))
> +       if (unlikely(page_offset >= bo->base.size))

At a glance it looks like we are missing PFN_UP(bo->base.size) for this one?
