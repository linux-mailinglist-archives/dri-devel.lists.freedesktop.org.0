Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D946953C925
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 13:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838D710E5BA;
	Fri,  3 Jun 2022 11:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05D810E5BA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 11:07:11 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id u3so3413348ybi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 04:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fjns1RcZ0ohRibu4aZBKsD8Lc8hnMx9n6WE5+03a2WU=;
 b=FXoOKaWhaCoFxijY18SXB0a9z9hBQfWk/YtwHxnKsoSBij7poGE8HUKXNoMFI6++os
 pAc2j15fr+jMs74Z0gfk3tUjXqiZ5Jk6kmggDXyQnN7gGnWe0MrQqXvfmBwSJE1WLpl5
 uSxyfR/Xhkt2yl1/tfVCL+pDQTkTjaozDBNPGT0GOF8xYOYFe/diOGiwnxejpazYZC91
 a7NYkvUwOqpcrhsPhpOrD+LG+QIhSn3XHYYjFXXVG+v5tGkuhoT0uPxcdxTjP1hx4Fc0
 eNOTnOZ1QsLPg7rUHci9aHbU2x/Qto0ayXIrLZgA+ohlAxHLZyn8r0K1dqSw7R7iYNBt
 6PuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fjns1RcZ0ohRibu4aZBKsD8Lc8hnMx9n6WE5+03a2WU=;
 b=5N72dKWbea73Bb/PDsEUE1nhcnDmJOAvaugrBKIh67yGiWtqDiAltZk74hqknPCknu
 c53JLQUT+o8sHljivPt66QojVxBWN2ojOXTs+QFJWgWiTpHo+Xv2OmoNTZvRDHU0+H9K
 u4yvM7R03ifn0HfGy3N2xJlOQqM50Kshc1LlzKcCuG868tQ/hB5NDzZ9z5VEmadTsBSO
 27qIK8GJ0qjwGHTFOVU7bcCd3f/3LN+Bs55wi7vmJtQoREiXi7irQaUsrQF7DM7sPXuh
 UpvBres//CNpbd6X3b0KirGryKawx9q63EhcUE8a5DnjMC7fMQThqEFFb5CCzMJVJLPN
 7xBg==
X-Gm-Message-State: AOAM532rTltJaomGg5hcEfs9ibcvmR0r99XNQQPFYRmlusSWs5YD1uK/
 quwU4+z0W+Y6vZlH20m5tiTOgJFn1BNi5a+kzSbpJ/3ArcLOPw==
X-Google-Smtp-Source: ABdhPJyfAgRrOQpD4qgA+lA3QNOjub88+ARo1uhbhgpLheBZ6zXUFqhJiI/K+mvIr75mhMz9hMSVmYnR4LcWTYTBrmQ=
X-Received: by 2002:a05:6902:1546:b0:65d:a1f9:23e6 with SMTP id
 r6-20020a056902154600b0065da1f923e6mr10789851ybu.6.1654254431079; Fri, 03 Jun
 2022 04:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
 <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
 <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
 <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
 <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
 <bd850268-8324-79cb-854f-b0c843f9581b@amd.com>
 <CAP+8YyGuU_fBMLkSuqBMk7uy-F=BAaopWS-Vxi=-E0P5LGbsRQ@mail.gmail.com>
 <ea49dfd3-3c20-c330-3412-5b48481331cd@amd.com>
 <CAP+8YyGgam6Hr40PS_Rc7Dg=S2dLJdce=87=wNt2B0yAyPEPOw@mail.gmail.com>
 <237f28b7-258e-8b6c-f7b3-93f0db9676d3@amd.com>
In-Reply-To: <237f28b7-258e-8b6c-f7b3-93f0db9676d3@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 3 Jun 2022 13:07:22 +0200
Message-ID: <CAP+8YyHnR=eQZMkxn=RpdzYF69y-54ri2pFrTj8DJuRTtwrDaA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 3, 2022 at 12:16 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 03.06.22 um 12:08 schrieb Bas Nieuwenhuizen:
> > [SNIP]
> >>> I do have to fix some stuff indeed, especially for the GEM close but
> >>> with that we should be able to keep the same basic approach?
> >> Nope, not even remotely.
> >>
> >> What we need is the following:
> >> 1. Rolling out my drm_exec patch set, so that we can lock buffers as n=
eeded.
> >> 2. When we get a VM operation we not only lock the VM page tables, but
> >> also all buffers we potentially need to unmap.
> >> 3. Nuking the freed list in the amdgpu_vm structure by updating freed
> >> areas directly when they are unmapped.
> >> 4. Tracking those updates inside the bo_va structure for the BO+VM
> >> combination.
> >> 5. When the bo_va structure is destroy because of closing the handle
> >> move the last clear operation over to the VM as implicit sync.
> >>
> > Hi Christian, isn't that a different problem though (that we're also
> > trying to solve, but in your series)?
> >
> > What this patch tries to achieve:
> >
> > (t+0) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
> > (t+1) a VM operation on a BO/VM accessed by the CS.
> >
> > to run concurrently. What it *doesn't* try is
> >
> > (t+0) a VM operation on a BO/VM accessed by the CS.
> > (t+1) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
> >
> > to run concurrently. When you write
> >
> >> Only when all this is done we then can resolve the dependency that the
> >> CS currently must wait for any clear operation on the VM.
> > isn't that all about the second problem?
>
> No, it's the same.
>
> See what we do in the VM code is to artificially insert a bubble so that
> all VM clear operations wait for all CS operations and then use the
> clear fence to indicate when the backing store of the BO can be freed.

Isn't that remediated with something like the code below? At least the
gem_close case should be handled with this, and the move case was
already handled by the copy operation.


--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -187,6 +187,39 @@ static int amdgpu_gem_object_open(struct
drm_gem_object *obj,
       return 0;
}

+static void dma_resv_copy(struct dma_resv *src, struct dma_resv *dst)
+{
+       struct dma_resv_iter cursor;
+       struct dma_fence *f;
+       int r;
+       unsigned num_fences =3D 0;
+
+       if (src =3D=3D dst)
+               return;
+
+       /* We assume the later loops get the same fences as the caller shou=
ld
+        * lock the resv. */
+       dma_resv_for_each_fence(&cursor, src, DMA_RESV_USAGE_BOOKKEEP, f) {
+               ++num_fences;
+               dma_fence_put(f);
+       }
+
+       r =3D dma_resv_reserve_fences(dst, num_fences);
+       if (r) {
+               /* As last resort on OOM we block for the fence */
+               dma_resv_for_each_fence(&cursor, src,
DMA_RESV_USAGE_BOOKKEEP, f) {
+                       dma_fence_wait(f, false);
+                       dma_fence_put(f);
+               }
+       }
+
+       dma_resv_for_each_fence(&cursor, src, DMA_RESV_USAGE_BOOKKEEP, f) {
+               dma_resv_add_fence(dst, f, dma_resv_iter_usage(&cursor));
+               dma_fence_put(f);
+       }
+}
+
+
static void amdgpu_gem_object_close(struct drm_gem_object *obj,
                                   struct drm_file *file_priv)
{
@@ -233,6 +266,8 @@ static void amdgpu_gem_object_close(struct
drm_gem_object *obj,
       amdgpu_bo_fence(bo, fence, true);
       dma_fence_put(fence);

+       dma_resv_copy(vm->root.bo->tbo.base.resv, bo->tbo.base.resv);
+
out_unlock:
       if (unlikely(r < 0))
               dev_err(adev->dev, "failed to clear page "

>
> When you want to remove this bubble (which is certainly a good idea) you
> need to first come up with a different approach to handle the clear
> operations.
>
> Regards,
> Christian.
>
> >
> >
> >> Regards,
> >> Christian.
> >>
> >>
>
