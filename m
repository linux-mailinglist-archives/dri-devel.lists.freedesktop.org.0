Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982D93F4C73
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 16:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838D589E5B;
	Mon, 23 Aug 2021 14:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8802289E5B;
 Mon, 23 Aug 2021 14:35:04 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so28364950otg.11; 
 Mon, 23 Aug 2021 07:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XgOXv9hBmtE5f7y6QsBO8K1XJAJ8y+cvtkl7Fv+4L6Q=;
 b=eoAs6ywolFNJ1+ayQ9E5Zf8t9YpcloyJtBG7I3KV556wk1qKb5NqzH1GyQMo+mlV3g
 4kSwBvR87oZbF/Lusto9T+PNUgLqTAzr0Po4C70VWruNfembRzBuSH0rBjCXgxzZ0Vfo
 Tb6FMe9U5hRELjGmC2bUajciCyZF13rLbV6r0IjIs6Dnh0cvBNW0qVT+xunyf/+nU9D6
 hF2wI6HJmJQf83TGGyLx82XQr0bHqjlGxTQEtKN4r0G+6fYPc8J7H3GV9ICgkIsID7xB
 2f0RXGzM4egqJzLPPLsKNDFqnrtTRfRkm1tpK1wNNNSYr+RJnttOErhzJsco9ayXKILp
 BUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XgOXv9hBmtE5f7y6QsBO8K1XJAJ8y+cvtkl7Fv+4L6Q=;
 b=Avxlxr5A2JNEaX2pegV4mRv1jio6S9y/zHBNllI7k5CVwz9KZSMTgiYggr9DcH4PAT
 D0gYwUpPcfXEwaCk5edIpFty9XVdqCmE+fFf+Ff1nsO1QsCj7NbvT6mum9mrHfSIwwYz
 X5WTaJhe++RymTEK7mRhGI6+SY9A3+XbiNpMQg8wsR3FzHi1Z0O+xa+KSGGW73Jm6fw8
 eEZx8RROB1RRfJucfVWAJb4Ey0OnwP9zSMq7Ll+YrCRwcYBJikPBUHDGsx+QZmzm5mIw
 g5yjy3837lX0eYXsP4EjgiiN1jKjJAI4yDplcealFTUCgh9q4Dtfzji5tko/w5972LIl
 8RuQ==
X-Gm-Message-State: AOAM530N819XlHe4GUZCgt67R0AyJ1CUypFzWBKQoe7j1Gb/ZVg0YB3h
 6H4dPGLm1J6Rah+0Jf7nBkJoJpf6zPEEfiDvF6o=
X-Google-Smtp-Source: ABdhPJxsIAjPqPk9Sp6v4AwVB8tD+eTvHkyD8t4hVwHOVcuZooIZjbwrqRsGKT1xWeEpsHiTWT9aIRcFNFPY9CWFt7I=
X-Received: by 2002:a05:6830:4:: with SMTP id c4mr27849060otp.23.1629729303838; 
 Mon, 23 Aug 2021 07:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210821082141.8608-1-liviu.cheru@gmail.com>
In-Reply-To: <20210821082141.8608-1-liviu.cheru@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Aug 2021 10:34:52 -0400
Message-ID: <CADnq5_PSKvmgfsO3DrNsyWqhgVnU312ijZ_BA92K3MDQU23JMA@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: amd: amdgpu: Fixed a few warnings
To: Liviu Cheru <liviucheru@gmail.com>
Cc: Dave Airlie <airlied@linux.ie>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, liviu.cheru@gmail.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 21, 2021 at 4:46 AM Liviu Cheru <liviucheru@gmail.com> wrote:
>
> Fixed warnings regarding SPDX license, using "unsigned" instead
> of "unsigned int", wrong function parameter name for the
> documentation and a space between the function name and "(".
>

In general, please split these up by the type of change.

> Signed-off-by: Liviu Cheru <liviu.cheru@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 795fa7445abe..af1abb281c6d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

The license is MIT not GPL.  See the actual license on the file.

>  /*
>   * Copyright 2009 Jerome Glisse.
>   * All Rights Reserved.
> @@ -129,7 +130,7 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
>         u32 c = 0;
>
>         if (domain & AMDGPU_GEM_DOMAIN_VRAM) {
> -               unsigned visible_pfn = adev->gmc.visible_vram_size >> PAGE_SHIFT;
> +               unsigned int visible_pfn = adev->gmc.visible_vram_size >> PAGE_SHIFT;
>
>                 places[c].fpfn = 0;
>                 places[c].lpfn = 0;
> @@ -731,7 +732,7 @@ int amdgpu_bo_validate(struct amdgpu_bo *bo)
>  /**
>   * amdgpu_bo_add_to_shadow_list - add a BO to the shadow list
>   *
> - * @bo: BO that will be inserted into the shadow list
> + * @vmbo: BO that will be inserted into the shadow list
>   *
>   * Insert a BO to the shadow list.
>   */

This code has already been fixed.

> @@ -957,7 +958,7 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
>                 bo->flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>         amdgpu_bo_placement_from_domain(bo, domain);
>         for (i = 0; i < bo->placement.num_placement; i++) {
> -               unsigned fpfn, lpfn;
> +               unsigned int fpfn, lpfn;
>
>                 fpfn = min_offset >> PAGE_SHIFT;
>                 lpfn = max_offset >> PAGE_SHIFT;
> @@ -1175,7 +1176,7 @@ void amdgpu_bo_get_tiling_flags(struct amdgpu_bo *bo, u64 *tiling_flags)
>   * Returns:
>   * 0 for success or a negative error code on failure.
>   */
> -int amdgpu_bo_set_metadata (struct amdgpu_bo *bo, void *metadata,
> +int amdgpu_bo_set_metadata(struct amdgpu_bo *bo, void *metadata,
>                             uint32_t metadata_size, uint64_t flags)
>  {
>         struct amdgpu_bo_user *ubo;
> --
> 2.30.2
>
