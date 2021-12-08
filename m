Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B549746D5CC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 15:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019CA6E0EE;
	Wed,  8 Dec 2021 14:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CF56E0EE;
 Wed,  8 Dec 2021 14:34:38 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id s9so2341699qvk.12;
 Wed, 08 Dec 2021 06:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mcFphCTs+sM87oOs36zSiu54nixYkDUQ7GPYZCibiMI=;
 b=mo/UPLBqvxcC1sZ6w6RJKk82jnMd6wrDjdNSN8IfHbb9F5K3XA7gnfAaM44j1ZnZmf
 4HXe/NPt2A7nSst3IRH72PRIoMIvdvPH7wYkiUE/udaZVtABE7u7FbwRmYR1pZ3E0/nV
 nntfTeC+yEOwu715jIjdNasETvoY+6xfo5rkiDVNC9dVIu8B5p6JcXSMahq4Gv9XouZW
 9xvNR82gnvg68RaKn78NrxuZB37LOIxTRoq68R5W4xQg6fRJ05dEIC6RD81SZfayZIZJ
 gHn6Qt7x6XnTooCpUUD5Jt780HNgytcZf/rt8S8xCfCHxaakKVwMCfCXKXh3Ogl/s7Zw
 Pi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mcFphCTs+sM87oOs36zSiu54nixYkDUQ7GPYZCibiMI=;
 b=hYP1xce/btiScTHNivs3oBIG9yZ+xgXzWaeTfJU+rybUnly6QnGTzewULZIMj+2tDC
 X3RtPtDdSRkBtyO6aRMEhoQy3T+e/Fb5Uwfez4w+MncSG5jfu0WjHwUZOvJHYf2U4YUR
 H9sLt/Qic/QkaRHQYw+KSt1HumfaytPC6w511Nt/5NeO39dHBeBheD9RMn7eV+u3H2uu
 WY9258++2YsGXqXSYgVa6iD+g5ROeVTfLiiB2AVGd+zk2X6EHdGL/YhQLbtZC1mYqJu3
 jDkrghul5jgUmotL37/Jwn1Y8YvVDER5MdQMo2TAHRETikaXM8MJz51QkV6KMcp+mBPE
 hNBg==
X-Gm-Message-State: AOAM533N9Hf/dGXptReMyCckWHfRnPXAqhcE/QPqDqhDtYuTUO3KKASY
 v/1bNac8xVfatFffUSUzeJcIY0IhL6HxDpyQGLI=
X-Google-Smtp-Source: ABdhPJy2EMvMhZg2y6wr88fJwlOUnOWUuPLAOj1LVb1r7tLbcfTbKFfnqcqanh6vwN/CfFGEbRYjcyN+04TvQXaXqro=
X-Received: by 2002:ad4:4ea6:: with SMTP id ed6mr7679612qvb.54.1638974077384; 
 Wed, 08 Dec 2021 06:34:37 -0800 (PST)
MIME-Version: 1.0
References: <20211208141613.7251-1-ramalingam.c@intel.com>
 <20211208141613.7251-3-ramalingam.c@intel.com>
In-Reply-To: <20211208141613.7251-3-ramalingam.c@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 8 Dec 2021 14:34:11 +0000
Message-ID: <CAM0jSHPQwFvn5exHVB2yShGxiXHQrE6vyQz2d70ySQmTYDis+A@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/i915/xehpsdv: set min page-size to 64K
To: Ramalingam C <ramalingam.c@intel.com>
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Dec 2021 at 14:16, Ramalingam C <ramalingam.c@intel.com> wrote:
>
> From: Matthew Auld <matthew.auld@intel.com>
>
> LMEM should be allocated at 64K granularity, since 4K page support will
> eventually be dropped for LMEM when using the PPGTT.

s/will eventually be dropped/has been dropped/ as per Thomas' suggestion.

>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c  | 6 +++++-
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c | 5 ++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index bce03d74a0b4..ba90ab47d838 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -780,6 +780,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>         struct intel_uncore *uncore = &i915->uncore;
>         struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>         struct intel_memory_region *mem;
> +       resource_size_t min_page_size;
>         resource_size_t io_start;
>         resource_size_t lmem_size;
>         u64 lmem_base;
> @@ -791,8 +792,11 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>         lmem_size = pci_resource_len(pdev, 2) - lmem_base;
>         io_start = pci_resource_start(pdev, 2) + lmem_base;
>
> +       min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
> +                                               I915_GTT_PAGE_SIZE_4K;
> +
>         mem = intel_memory_region_create(i915, lmem_base, lmem_size,
> -                                        I915_GTT_PAGE_SIZE_4K, io_start,
> +                                        min_page_size, io_start,
>                                          type, instance,
>                                          &i915_region_stolen_lmem_ops);
>         if (IS_ERR(mem))
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index 9ea49e0a27c0..fde2dcb59809 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -197,6 +197,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>         struct intel_uncore *uncore = gt->uncore;
>         struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>         struct intel_memory_region *mem;
> +       resource_size_t min_page_size;
>         resource_size_t io_start;
>         resource_size_t lmem_size;
>         int err;
> @@ -211,10 +212,12 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>         if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
>                 return ERR_PTR(-ENODEV);
>
> +       min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
> +                                               I915_GTT_PAGE_SIZE_4K;
>         mem = intel_memory_region_create(i915,
>                                          0,
>                                          lmem_size,
> -                                        I915_GTT_PAGE_SIZE_4K,
> +                                        min_page_size,
>                                          io_start,
>                                          INTEL_MEMORY_LOCAL,
>                                          0,
> --
> 2.20.1
>
