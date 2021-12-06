Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A77469695
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 14:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1B06EC7C;
	Mon,  6 Dec 2021 13:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892986EC7C;
 Mon,  6 Dec 2021 13:14:21 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id 193so10977519qkh.10;
 Mon, 06 Dec 2021 05:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vwE7Yfv/5lqOGhXiEv9k+TCoiOpS8ND3tuZ2+vP6UV8=;
 b=n1zgLRUzGeOC5DS2Yu09qeoLz7WF4j/wc3n5CjT5xWJjDmnUMnUXovylgQNnusliS4
 BNRTiL33ANkLFh/WQofr+niBt2vuV9hWSSy4sn+JM4Ab4jvVG3XATUIImDsc1oek4CKE
 polOBcPTqGGbg0AXyHfolX6330CCPuYZ/7cGWioxuWGZqhN3gF7RDSpJ+HNDTRn68eqh
 bpP8FNetCsLWxjCFibY1Yg6eU/3AE2qED/avqEBLHZLJfNym/kHQCyUjhtBVQfOyUHvp
 KzB14iXYskzMG2w5RNPuuG8720Qd0aDINfzgtxvBU0+ntUHmyJM/EPhMw7THNrQfen3z
 D3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vwE7Yfv/5lqOGhXiEv9k+TCoiOpS8ND3tuZ2+vP6UV8=;
 b=Gy38YuQW4HtR2nn71co5zqxNPOARXW8QgtHMAjRXNPsiqNYOhVUzgNRoiOFtCO7sTA
 25RQpr1alY0cSVSBy/01ONnlUiduVTt6SYe6ef/BGw63OJFm/nu/hDrU0MbE9vr5UDMD
 4qFFL2R1ndcs81qngzjfK5BMYBn4LwghUcXQQCvrc0oS23El9X6lnvJKbIAmwMx0w040
 6MkxDVGXsjf51JpgKkVtRpv1ENO6rDRGfNwfTpuMu0ir5veA4EMKvp+hZ/0mnQ5wUESt
 xXOQuFQPvi/nj2qzyNzZJe0VQ34z/5Q8F8yXdL7rLDS4oC/IdKN3h3gMJ8gfl0feh+3G
 cxfw==
X-Gm-Message-State: AOAM530Y9ae/aYWe/IuCXx4cMqZa4oiY2kgUaeWJ/15x63tW03IwGGSr
 U8eYB8rmHsHeDScsWT1yNdTS22HwvGkqrPq9/aiPtitR8K0=
X-Google-Smtp-Source: ABdhPJyZc/GpU5/q4u3UHyBAd31QoXsMTb57FLp0+YVVqonOt/piZIFZq3iQzKEW0MUYxz/bKFpYMiWA0LhkebvOG0k=
X-Received: by 2002:a05:620a:4244:: with SMTP id
 w4mr32696564qko.569.1638796460452; 
 Mon, 06 Dec 2021 05:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-4-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211129134735.628712-4-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 6 Dec 2021 13:13:54 +0000
Message-ID: <CAM0jSHPcJJLV7Sx170FWBdGhc1X+bwC=cshP3ndEHYJvZDmMYw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 03/16] drm/i915: Remove pages_mutex and
 intel_gtt->vma_ops.set/clear_pages members, v2.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Nov 2021 at 13:57, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Big delta, but boils down to moving set_pages to i915_vma.c, and removing
> the special handling, all callers use the defaults anyway. We only remap
> in ggtt, so default case will fall through.
>
> Because we still don't require locking in i915_vma_unpin(), handle this by
> using xchg in get_pages(), as it's locked with obj->mutex, and cmpxchg in
> unpin, which only fails if we race a against a new pin.
>
> Changes since v1:
> - aliasing gtt sets ZERO_SIZE_PTR, not -ENODEV, remove special case
>   from __i915_vma_get_pages(). (Matt)
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dpt.c      |   2 -
>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  15 -
>  drivers/gpu/drm/i915/gt/intel_ggtt.c          | 403 ----------------
>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  13 -
>  drivers/gpu/drm/i915/gt/intel_gtt.h           |   7 -
>  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  12 -
>  drivers/gpu/drm/i915/i915_vma.c               | 444 ++++++++++++++++--
>  drivers/gpu/drm/i915/i915_vma.h               |   3 +
>  drivers/gpu/drm/i915/i915_vma_types.h         |   1 -
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  12 +-
>  drivers/gpu/drm/i915/selftests/mock_gtt.c     |   4 -
>  11 files changed, 424 insertions(+), 492 deletions(-)
>

<snip>

>  }
> @@ -854,18 +1233,22 @@ static int vma_get_pages(struct i915_vma *vma)
>  static void __vma_put_pages(struct i915_vma *vma, unsigned int count)
>  {
>         /* We allocate under vma_get_pages, so beware the shrinker */
> -       mutex_lock_nested(&vma->pages_mutex, SINGLE_DEPTH_NESTING);
> +       struct sg_table *pages = READ_ONCE(vma->pages);
> +
>         GEM_BUG_ON(atomic_read(&vma->pages_count) < count);
> +
>         if (atomic_sub_return(count, &vma->pages_count) == 0) {

Does this emit a barrier? Or can the READ_ONCE(vma->pages) be moved
past this, and does that matter?

> -               vma->ops->clear_pages(vma);
> -               GEM_BUG_ON(vma->pages);
> +               if (pages == cmpxchg(&vma->pages, pages, NULL) &&

try_cmpxchg? Also can pages be NULL here?

As an aside, is it somehow possible to re-order the series or
something to avoid introducing the transient lockless trickery here? I
know by the end of the series this all gets removed, but still just
slightly worried here.

> +                   pages != vma->obj->mm.pages) {
> +                       sg_free_table(pages);
> +                       kfree(pages);
> +               }
>
>                 i915_gem_object_unpin_pages(vma->obj);
>         }
> -       mutex_unlock(&vma->pages_mutex);
>  }
