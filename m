Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEA046A286
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D7172E65;
	Mon,  6 Dec 2021 17:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2AB72E65;
 Mon,  6 Dec 2021 17:10:56 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id 132so11815349qkj.11;
 Mon, 06 Dec 2021 09:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zjYSXYg470nR7ckqptIrxorwhCDAywKz/IJWQi0knlY=;
 b=OjDn0B63a1TiKO+9wFFBS+U+DVk8jlVf7A6foGuf+xYa5Pw3ixcinA1Zzm3W4bNlwV
 hT1hDtZ1WsTOG1kx/tWA20HV0an0gcy6d7WudzDK3JYTvvQlmGdVrWUvBwVcNaUeoXcN
 h7Kx3LFGbSc5OvEzYiKZ9Xbe8P0RCETS0SbTZrNMfKVju5tvdyb/gDdLyvoqkJoYlhGU
 lsbt80Reox8aGkZxqBhtOchTU6iO/TLEOv5qlwgL/GH2W7Dprn0zaGuR+DqAslBGMTay
 bc/q58K3GvaPzCu78CA1cFmAmghlURxdci5Mz5YX9wn7VQHLusdwsOasXwCmMFiXCJA4
 xYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zjYSXYg470nR7ckqptIrxorwhCDAywKz/IJWQi0knlY=;
 b=1s+oym8k7aBKSwXgVexS7ueASkbvlG1iBZzXNva9l9uo1WPBYk41lvilJKguy4ozxE
 HCEP3XYCUiXbnqORpb05G194+kzgibwZ0VzQHt007ShGWRseuVlkK/9iXlnAb5nxdaq1
 XSgxm7LCDvVPfc+Ei0jI1Hi4F3W3feiBZyCFiFlxpu4cPiJenmgcbPM2P6UH/WYkR2y6
 3OUf0Wb6cy5XwZPM8digRX1o91p1Yd1JLKXrdx5Erztpca0U808uAbucLlPRxp6H8wxq
 4/B/pKefC1bo/K9cdKmOzt8jHQEg5aHRZyH53HzCGQBJ2GutK5E3iwjI5ZfbVrwU/Xoc
 C1BA==
X-Gm-Message-State: AOAM530xWHIsC1UFkjIr1ErEEck59wM1KwozEgiHooY1AVTArcFkbiQK
 Frr8KGt6NnDpz5jCGVBnY22/sow2RIvIM8Ozi1c=
X-Google-Smtp-Source: ABdhPJzHc/tptzMUMYRywMiUVFxk7zo+/7BASxQGX8bRB6yZfgx94t5pUJoQ8sia21yooGLIMcF1y0Aq8EhKoRQi9wU=
X-Received: by 2002:a37:a353:: with SMTP id m80mr35112086qke.7.1638810655968; 
 Mon, 06 Dec 2021 09:10:55 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-4-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211129134735.628712-4-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 6 Dec 2021 17:10:29 +0000
Message-ID: <CAM0jSHMdahtPqwh559wBNitxm=XBm1Mws6F7UEWVrns2Qtxa1g@mail.gmail.com>
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

<snip>

> +static int
> +__i915_vma_get_pages(struct i915_vma *vma)
> +{
> +       struct sg_table *pages;
> +       int ret;
> +
> +       /*
> +        * The vma->pages are only valid within the lifespan of the borrowed
> +        * obj->mm.pages. When the obj->mm.pages sg_table is regenerated, so
> +        * must be the vma->pages. A simple rule is that vma->pages must only
> +        * be accessed when the obj->mm.pages are pinned.
> +        */
> +       GEM_BUG_ON(!i915_gem_object_has_pinned_pages(vma->obj));
> +
> +       switch (vma->ggtt_view.type) {
> +       default:
> +               GEM_BUG_ON(vma->ggtt_view.type);
> +               fallthrough;
> +       case I915_GGTT_VIEW_NORMAL:
> +               pages = vma->obj->mm.pages;
> +               break;
> +
> +       case I915_GGTT_VIEW_ROTATED:
> +               pages =
> +                       intel_rotate_pages(&vma->ggtt_view.rotated, vma->obj);
> +               break;
> +
> +       case I915_GGTT_VIEW_REMAPPED:
> +               pages =
> +                       intel_remap_pages(&vma->ggtt_view.remapped, vma->obj);
> +               break;
> +
> +       case I915_GGTT_VIEW_PARTIAL:
> +               pages = intel_partial_pages(&vma->ggtt_view, vma->obj);
> +               break;
> +       }
> +
> +       ret = 0;
> +       if (IS_ERR(pages)) {
> +               ret = PTR_ERR(pages);
> +               pages = NULL;
> +               drm_err(&vma->vm->i915->drm,
> +                       "Failed to get pages for VMA view type %u (%d)!\n",
> +                       vma->ggtt_view.type, ret);
> +       }
> +
> +       pages = xchg(&vma->pages, pages);
> +
> +       /* did we race against a put_pages? */
> +       if (pages && pages != vma->obj->mm.pages) {
> +               sg_free_table(vma->pages);
> +               kfree(vma->pages);

So should this one rather be:

sg_free_table(pages);
kfree(pages);

Or am I missing something?
