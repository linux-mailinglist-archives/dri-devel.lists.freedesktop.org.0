Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DAD4EB687
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 01:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580AF10E3E1;
	Tue, 29 Mar 2022 23:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D357410EF95
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 23:12:17 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id kc20so15635338qvb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 16:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n6vWTraAsAXZyoxXb5nGqr8Xvv6u1uNOFT9gzXod7MU=;
 b=lrcyCWDOqOxO9wCi2nrBbFWLAXPmN/zMCf+GKCrnvI1MXLtLvpFS/l1LrzNxBKgtRy
 Kh68qURm+JpyIlmsWejxvlOYcD5GTvLDgMiYBEcTmWt+oVNnMaGP+1/dJ+80lJlqbVVu
 QPIQEB9C9ePTP5q+tLtr503SoNIzn1Y6B2cljtpneGelOAzUamc9iZYVrVdxNg3ZjtuQ
 b4ZMLbo118AhBn2q9qWtDsEck9MQ/q+B94Utp/GRNdBRYs8iGk1joAJfZA+zW2Zicca/
 414XHibgqbelTR0OM/6IrXjZDeHSE+7Vc9Wd8X4xtHGZ4wS8jIzD5lgop4Gn1Mbd1Dx5
 uCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n6vWTraAsAXZyoxXb5nGqr8Xvv6u1uNOFT9gzXod7MU=;
 b=nDcwbmCv9CnSW+VCLp2rQyclgQB2KuXU8st0mVpVpnsRrIGe1ZgFQ8sOj5w/lERP2c
 lq5m9qC7KDrRW2i3VxSlyNwhNw2ITn4f/OHXA0SN31IUUkh9ULdtcPDDQxlpJnxRPbhD
 VGJ9S7an+rwjCPM4vfPqKTEdvpjJGkruvhU0hpadQPfn/KRBVIw92xHa22zKkJHrNhBE
 VU9qyvm4fOkpljTuqj9s/6rt2h/MOLL0jXCeLjAFlRj15ZQJSq8lzb3N0Re2iXkqZbzU
 Rj2eLd3y2uXOGxB3qWjfOEbChs53oe8UzZt/TlG3iUrgKyev/iMHlJ9XGgJYYKp4fqKW
 cyYg==
X-Gm-Message-State: AOAM5326swT65LiWdvVvkmmkhZ6ZWNEhxiFH7ZQ1SIUHhFBG24zYFIZM
 W02QconlgSUfU6RWSiYZ5eeEPZR4EvB/9M7ocJfkCQ==
X-Google-Smtp-Source: ABdhPJxGlyUsavxvZz+wrGPPpn1hCoskHO8lnZxYdfbtZXqrZ0pf8Rpn7CB+Rg7A1nA7ueADpoYPw8edRdkuWFzDSr0=
X-Received: by 2002:a05:6214:20e4:b0:441:7bed:5ccd with SMTP id
 4-20020a05621420e400b004417bed5ccdmr24699137qvk.119.1648595536890; Tue, 29
 Mar 2022 16:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220329230105.601666-1-robdclark@gmail.com>
 <20220329230105.601666-5-robdclark@gmail.com>
In-Reply-To: <20220329230105.601666-5-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Mar 2022 02:12:05 +0300
Message-ID: <CAA8EJppk3odaF-kuLz4bsB21bxwfKFjg26fVRwSiaZXxRrHdhQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm/msm/gem: Drop PAGE_SHIFT for address space mm
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Mar 2022 at 02:00, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Get rid of all the unnecessary conversion between address/size and page
> offsets.  It just confuses things.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c         |  5 ++---
>  drivers/gpu/drm/msm/msm_gem.h         |  4 ++--
>  drivers/gpu/drm/msm/msm_gem_vma.c     | 16 ++++++++--------
>  4 files changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 3e325e2a2b1b..9f76f5b15759 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1172,7 +1172,7 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
>                 return PTR_ERR(bo->obj);
>
>         ret = msm_gem_get_and_pin_iova_range(bo->obj, gmu->aspace, &bo->iova,
> -               range_start >> PAGE_SHIFT, range_end >> PAGE_SHIFT);
> +                                            range_start, range_end);
>         if (ret) {
>                 drm_gem_object_put(bo->obj);
>                 return ret;
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index f96d1dc72021..f4b68bb28a4d 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -392,7 +392,7 @@ static int get_iova_locked(struct drm_gem_object *obj,
>                 if (IS_ERR(vma))
>                         return PTR_ERR(vma);
>
> -               ret = msm_gem_init_vma(aspace, vma, obj->size >> PAGE_SHIFT,
> +               ret = msm_gem_init_vma(aspace, vma, obj->size,
>                         range_start, range_end);
>                 if (ret) {
>                         del_vma(vma);
> @@ -434,8 +434,7 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
>         if (IS_ERR(pages))
>                 return PTR_ERR(pages);
>
> -       ret = msm_gem_map_vma(aspace, vma, prot,
> -                       msm_obj->sgt, obj->size >> PAGE_SHIFT);
> +       ret = msm_gem_map_vma(aspace, vma, prot, msm_obj->sgt, obj->size);
>
>         if (!ret)
>                 msm_obj->pin_count++;
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 1b7f0f0b88bf..090c3b1a6d9a 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -59,7 +59,7 @@ struct msm_gem_vma {
>  };
>
>  int msm_gem_init_vma(struct msm_gem_address_space *aspace,
> -               struct msm_gem_vma *vma, int npages,
> +               struct msm_gem_vma *vma, int size,
>                 u64 range_start, u64 range_end);
>  bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
>  void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
> @@ -68,7 +68,7 @@ void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma);
>  int msm_gem_map_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma, int prot,
> -               struct sg_table *sgt, int npages);
> +               struct sg_table *sgt, int size);
>  void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma);
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index dc2ae097805e..4949899f1fc7 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -46,7 +46,7 @@ bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
>  void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma)
>  {
> -       unsigned size = vma->node.size << PAGE_SHIFT;
> +       unsigned size = vma->node.size;
>
>         /* Print a message if we try to purge a vma in use */
>         if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
> @@ -73,9 +73,8 @@ void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
>  int
>  msm_gem_map_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma, int prot,
> -               struct sg_table *sgt, int npages)
> +               struct sg_table *sgt, int size)
>  {
> -       unsigned size = npages << PAGE_SHIFT;
>         int ret = 0;
>
>         if (GEM_WARN_ON(!vma->iova))
> @@ -120,7 +119,7 @@ void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>
>  /* Initialize a new vma and allocate an iova for it */
>  int msm_gem_init_vma(struct msm_gem_address_space *aspace,
> -               struct msm_gem_vma *vma, int npages,
> +               struct msm_gem_vma *vma, int size,
>                 u64 range_start, u64 range_end)
>  {
>         int ret;
> @@ -129,14 +128,15 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
>                 return -EBUSY;
>
>         spin_lock(&aspace->lock);
> -       ret = drm_mm_insert_node_in_range(&aspace->mm, &vma->node, npages, 0,
> -               0, range_start, range_end, 0);
> +       ret = drm_mm_insert_node_in_range(&aspace->mm, &vma->node,
> +                                         size, PAGE_SIZE, 0,
> +                                         range_start, range_end, 0);
>         spin_unlock(&aspace->lock);
>
>         if (ret)
>                 return ret;
>
> -       vma->iova = vma->node.start << PAGE_SHIFT;
> +       vma->iova = vma->node.start;
>         vma->mapped = false;
>
>         kref_get(&aspace->kref);
> @@ -161,7 +161,7 @@ msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
>         aspace->name = name;
>         aspace->mmu = mmu;
>
> -       drm_mm_init(&aspace->mm, va_start >> PAGE_SHIFT, size >> PAGE_SHIFT);
> +       drm_mm_init(&aspace->mm, va_start, size);
>
>         kref_init(&aspace->kref);
>
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
