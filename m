Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9645171C3
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E9310EFF8;
	Mon,  2 May 2022 14:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DABE10EFF8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651502388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=58rLakAFNoJNnG5Di+FTawUYlxOYFnmmF/e8CRlldJQ=;
 b=XaWBx3UaLYto3CrEY2g6TqTneyKwqD1dLY5r/sR57GfbRtQ87lEquDK1MHtb58MhwYOsL4
 2ssNFwItwzrpMxYQ5AqlIR8CeOx8JvFPgn3FfiBqsEIxHJn0jdsPYP1my7AsFxUwVDbTv0
 fs0n5l7wMCRkj/ZPxpkmM6HoDDFv3Xw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-b6I-6TIrMMatGFUaghQByw-1; Mon, 02 May 2022 10:39:44 -0400
X-MC-Unique: b6I-6TIrMMatGFUaghQByw-1
Received: by mail-wm1-f70.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so4650794wmj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 07:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=58rLakAFNoJNnG5Di+FTawUYlxOYFnmmF/e8CRlldJQ=;
 b=hb28v7D3m5YkXE3o0BBHiGP9BIOq5TIuFNudqhY6YOyq80QBaRXEa0iVsKPuCgN6DG
 4ktOn8hVFVDxINNdJmGgoOjQ+EaIeBR9XD344BpK5R0FIpScU36ZnEDAZTfMqV0bWmFW
 r9nUbAcavifZzl8k82sjNt/8h+AN8VKO0qZDczm9BtUeIWuLQGEcpxxth0Pn5xEtApYV
 y2d7mn9KyKmAqhuyF7apPYBpGQW8vyclg81IjFbqwWX03Cgmy1BW1PGmLCWkz/gPdNWi
 WDH8mTnNSijTkLwtlV1yD/diAxpJmlJ1pZwIg216UWwY5oO/LU1RlsUIESoIxFxB8EXD
 Gaew==
X-Gm-Message-State: AOAM530azr7o5Okn1fLq3+rLZll7eePI/fmmKb/zLov9kKKkbHwXYl7V
 +y5f0vIs3G8BCR2mN+Y2JMl1sJ1QwDWz7n0EzxqIOW1T/MrRZLt6AFivjItJFA/0P49iTaqdWHb
 FKnwAPZ0NjFUkWlXbTN6HECmFyEM4I+DCFfwWhW9GdhP4
X-Received: by 2002:a7b:cb47:0:b0:393:dd9f:e64a with SMTP id
 v7-20020a7bcb47000000b00393dd9fe64amr15053005wmj.170.1651502383716; 
 Mon, 02 May 2022 07:39:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeSqSrtlczNXNP5eDjRGWp+ntWxu/JB9aqmsfOg0rqpKIibXazTKglVMoMhIkmYF6H1Dn/NKWLxpLeWCbfFDQ=
X-Received: by 2002:a7b:cb47:0:b0:393:dd9f:e64a with SMTP id
 v7-20020a7bcb47000000b00393dd9fe64amr15052989wmj.170.1651502383468; Mon, 02
 May 2022 07:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220420095720.3331609-1-kherbst@redhat.com>
In-Reply-To: <20220420095720.3331609-1-kherbst@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 2 May 2022 16:39:32 +0200
Message-ID: <CACO55tv6rKETHhx=1yJ7Gf91sq1cDHyNgZxEdaN48PFBRdKu2g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915: Fix race in __i915_vma_remove_closed
To: LKML <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

friendly ping.

I am not even myself completely convinced that this is the correct
patch and it might just workaround some issues, but list_debug.c does
check if a list was already deleted and throws an error if it was and
this patch indeed fixes this one issue as multiple threads could enter
__i915_vma_remove_closed on the same vma.


On Wed, Apr 20, 2022 at 11:57 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> i915_vma_reopen checked if the vma is closed before without taking the
> lock. So multiple threads could attempt removing the vma.
>
> Instead the lock needs to be taken before actually checking.
>
> v2: move struct declaration
>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5732
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/i915/i915_vma.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 162e8d83691b..2efdad2b43fa 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1615,17 +1615,17 @@ void i915_vma_close(struct i915_vma *vma)
>
>  static void __i915_vma_remove_closed(struct i915_vma *vma)
>  {
> -       struct intel_gt *gt = vma->vm->gt;
> -
> -       spin_lock_irq(&gt->closed_lock);
>         list_del_init(&vma->closed_link);
> -       spin_unlock_irq(&gt->closed_lock);
>  }
>
>  void i915_vma_reopen(struct i915_vma *vma)
>  {
> +       struct intel_gt *gt = vma->vm->gt;
> +
> +       spin_lock_irq(&gt->closed_lock);
>         if (i915_vma_is_closed(vma))
>                 __i915_vma_remove_closed(vma);
> +       spin_unlock_irq(&gt->closed_lock);
>  }
>
>  static void force_unbind(struct i915_vma *vma)
> @@ -1641,6 +1641,7 @@ static void force_unbind(struct i915_vma *vma)
>  static void release_references(struct i915_vma *vma, bool vm_ddestroy)
>  {
>         struct drm_i915_gem_object *obj = vma->obj;
> +       struct intel_gt *gt = vma->vm->gt;
>
>         GEM_BUG_ON(i915_vma_is_active(vma));
>
> @@ -1651,7 +1652,9 @@ static void release_references(struct i915_vma *vma, bool vm_ddestroy)
>
>         spin_unlock(&obj->vma.lock);
>
> +       spin_lock_irq(&gt->closed_lock);
>         __i915_vma_remove_closed(vma);
> +       spin_unlock_irq(&gt->closed_lock);
>
>         if (vm_ddestroy)
>                 i915_vm_resv_put(vma->vm);
> --
> 2.35.1
>

