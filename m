Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF914366F7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 17:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405086ECBC;
	Thu, 21 Oct 2021 15:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9016ECB6;
 Thu, 21 Oct 2021 15:58:21 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id v17so933748qtp.1;
 Thu, 21 Oct 2021 08:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HvH+/l2njxx4Ke2vRINQSFTt0ijW8lYgJb/ZBYjDrsw=;
 b=fyEP+m7fvg4hEJJJrsHQ1SKt2JRVrfspY3kvaMBo61kdGL3P0D6mkka+HKiiwG4LZO
 cMVr3MINGcxqMdKJqD1wM2BwaefjRAt/a75I3voWTs4eW3aAV6LVZBJkRafr3deVNOr1
 vDjgA67BTEzQ3u6mMHn+WK4/ARkM7nquDQ9krlxVlWVO5RKZ30lf6v4NByZO2j6eq3t2
 Xs2qLY6xiBJdH6LxCKiLMzXLCDXi6yE+K+2K09b6Pv8lW+1wMB97r0pbInrTcaQRRqti
 /3GzCoC1aGWy6HB/fnV4VUl9VNHv//0Ps6TTSUMCO4PtSJBbzKln7YkLWae1cpRGwj0e
 oNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HvH+/l2njxx4Ke2vRINQSFTt0ijW8lYgJb/ZBYjDrsw=;
 b=Hqnho59x5ofeS3OoAZwM8WzHeyY15zsfCF93cFDKqsuYv78Aylk3RN6J3vq9FVSNcy
 RzJTbDiXGIe44y+hwKV/TJeaJbqA9nH5IlbnXeVe96dsLXr9vyEahv3uXS6R0KIgxIEy
 4/ywXjM+f1GtjbR6QWQAW8cAyUNBDLiWCu2eJZCHt7lD9KDe5c529qUvmpaz4hDkCbK+
 GMTjNX4Z2d9Pb7DnrjDGTKIH0eVhnThAYfO25IrvzhUiqp9vuarepUJxFTCZq9Z1P07l
 kfDM1cbuyNEmhSbnCM/8frX9tu/wQpqwcw4/pJ1aQj5rQaDL2gjkb3dW/+hOmoi7YmGq
 5bFA==
X-Gm-Message-State: AOAM531z/eW3M2T+MfQrfUTwh61x8Wm18Ni6Y0ZckFAgdcqNwgcmBlYK
 OGf5XzAw4jyGcPiRM8ohT9DD78d+phzaPWYZDLP/6ivOhJg=
X-Google-Smtp-Source: ABdhPJyRElJ58pWlvpi31LvNCH56m6ZdMnGiX0OkMsqpRxVpeSidYe5HCyqv6pBFavocPs0TPevmUDN0P0WHKRhlwJE=
X-Received: by 2002:a05:622a:1998:: with SMTP id
 u24mr6958822qtc.156.1634831900274; 
 Thu, 21 Oct 2021 08:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-8-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-8-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 21 Oct 2021 16:57:52 +0100
Message-ID: <CAM0jSHN7htNjZORSqA=YDRP3TuWq6Xs+su8wF_hBqcu0qukvpA@mail.gmail.com>
Subject: Re: [PATCH 08/28] drm/i915: Create a full object for mock_ring, v2.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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

On Thu, 21 Oct 2021 at 11:36, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> This allows us to finally get rid of all the assumptions that vma->obj is NULL.
>
> Changes since v1:
> - Ensure the mock_ring vma is pinned to prevent a fault.
> - Pin it high to avoid failure in evict_for_vma selftest.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/mock_engine.c | 38 ++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
> index 8b89215afe46..bb99fc03f503 100644
> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
> @@ -35,9 +35,31 @@ static void mock_timeline_unpin(struct intel_timeline *tl)
>         atomic_dec(&tl->pin_count);
>  }
>
> +static struct i915_vma *create_ring_vma(struct i915_ggtt *ggtt, int size)
> +{
> +       struct i915_address_space *vm = &ggtt->vm;
> +       struct drm_i915_private *i915 = vm->i915;
> +       struct drm_i915_gem_object *obj;
> +       struct i915_vma *vma;
> +
> +       obj = i915_gem_object_create_internal(i915, size);
> +       if (IS_ERR(obj))
> +               return ERR_CAST(obj);

We didn't want to use the dummy object here also? I guess meh?

> +
> +       vma = i915_vma_instance(obj, vm, NULL);
> +       if (IS_ERR(vma))
> +               goto err;
> +
> +       return vma;
> +
> +err:
> +       i915_gem_object_put(obj);
> +       return vma;
> +}
> +
>  static struct intel_ring *mock_ring(struct intel_engine_cs *engine)
>  {
> -       const unsigned long sz = PAGE_SIZE / 2;
> +       const unsigned long sz = PAGE_SIZE;

Is that significant?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>


>         struct intel_ring *ring;
>
>         ring = kzalloc(sizeof(*ring) + sz, GFP_KERNEL);
> @@ -50,15 +72,11 @@ static struct intel_ring *mock_ring(struct intel_engine_cs *engine)
>         ring->vaddr = (void *)(ring + 1);
>         atomic_set(&ring->pin_count, 1);
>
> -       ring->vma = i915_vma_alloc();
> -       if (!ring->vma) {
> +       ring->vma = create_ring_vma(engine->gt->ggtt, PAGE_SIZE);
> +       if (IS_ERR(ring->vma)) {
>                 kfree(ring);
>                 return NULL;
>         }
> -       i915_active_init(&ring->vma->active, NULL, NULL, 0);
> -       __set_bit(I915_VMA_GGTT_BIT, __i915_vma_flags(ring->vma));
> -       __set_bit(DRM_MM_NODE_ALLOCATED_BIT, &ring->vma->node.flags);
> -       ring->vma->node.size = sz;
>
>         intel_ring_update_space(ring);
>
> @@ -67,8 +85,7 @@ static struct intel_ring *mock_ring(struct intel_engine_cs *engine)
>
>  static void mock_ring_free(struct intel_ring *ring)
>  {
> -       i915_active_fini(&ring->vma->active);
> -       i915_vma_free(ring->vma);
> +       i915_vma_put(ring->vma);
>
>         kfree(ring);
>  }
> @@ -125,6 +142,7 @@ static void mock_context_unpin(struct intel_context *ce)
>
>  static void mock_context_post_unpin(struct intel_context *ce)
>  {
> +       i915_vma_unpin(ce->ring->vma);
>  }
>
>  static void mock_context_destroy(struct kref *ref)
> @@ -169,7 +187,7 @@ static int mock_context_alloc(struct intel_context *ce)
>  static int mock_context_pre_pin(struct intel_context *ce,
>                                 struct i915_gem_ww_ctx *ww, void **unused)
>  {
> -       return 0;
> +       return i915_vma_pin_ww(ce->ring->vma, ww, 0, 0, PIN_GLOBAL | PIN_HIGH);
>  }
>
>  static int mock_context_pin(struct intel_context *ce, void *unused)
> --
> 2.33.0
>
