Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1341553CA99
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 15:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA01F1136A7;
	Fri,  3 Jun 2022 13:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7C91136A7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 13:23:15 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2ef5380669cso81854697b3.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VlOL8OPievhpWrRG3L+OH1IX7fMnqXuv11z5flO7otk=;
 b=FzGAhVHrukzfeKPIbDPKutwUFebiJgodJslycio+4LMhxsrz3JTDxaPuSEF3ao+1fg
 7r7aWWH0rfee3xi5Uy+iOc7K84llNABEZXhYV4OjITP9k4jBVy4VK5dsVhSJJseiaBS2
 u6USDWzVrCar8+D05kDe+E0QrVpuH30CtHh/3sc4diFXdr0+jZe+LdKmGu9NCxAUGpFk
 OvJF7b9QEpqE78dGU1lnQ3IIp7SlNZstww9JL9wah/RSjmSQNkS4JyJjE9JklcDFlRAB
 8s1xnQS033mlK0R97JGwS0a+e/AcqzXqrDFIC3gvp4Il4sM28cBAaokqgwaValtFvZvg
 P9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VlOL8OPievhpWrRG3L+OH1IX7fMnqXuv11z5flO7otk=;
 b=CwRT7gYmCWafS+K6ckFx4qF2THRaVY0hWGri7dcvyPh9khA6XdKBnQF9T4l/Io/7bk
 lLV0FZXIPkQkrROqOK1tPwnURRCrAPfeDqhHYo+E6k/DyNOCjIMdFRECQrgO5PKtt+VY
 nY9PsV0OiopLNdxg0Kn9ZExGmwM/zSgE6x8VP+zBJgRUu0jh2F8FYR+5qH6dLRsbDuqP
 rOVBHLblXvcp8Ddb+NXwik6Sog/z1RI1VbjAIHffh/czidBChCT0L0fjI9LdwltfcAgq
 LCrFsT7cyS5sN6NzSvs9Xb5fN8izP3dbt4+8kaPlzcmw3NE9ZHf1+7viVWavJs/T71v1
 JEbg==
X-Gm-Message-State: AOAM533s4nh07I3Uzd6PL4lyocGGX2SI8JajzfIE2XHUM7amLLCx410P
 riq/SIIoy1MDT5yM+LasUiEtQCEPeDjdeRic4k0ZFg==
X-Google-Smtp-Source: ABdhPJz8IZfGHxg0GWJ1TSxRJXhcDikiACUzjfMw7Yg+uQl6ePokFuE74N/b6DdsrxVBb+rOY5I0fKzOuhV9/VXwiz8=
X-Received: by 2002:a81:1358:0:b0:30c:2e28:4050 with SMTP id
 85-20020a811358000000b0030c2e284050mr11255981ywt.206.1654262594135; Fri, 03
 Jun 2022 06:23:14 -0700 (PDT)
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
 <CAP+8YyHnR=eQZMkxn=RpdzYF69y-54ri2pFrTj8DJuRTtwrDaA@mail.gmail.com>
 <7cba4b1d-724a-3c32-2546-015fa069342d@amd.com>
 <CAP+8YyEMDNR_5=uGf8BEV5DCovr-Z_ZDWS2E7-7zqSFGG7bdKg@mail.gmail.com>
 <6c7e8167-fd72-ef7f-c390-8750c61bc411@amd.com>
In-Reply-To: <6c7e8167-fd72-ef7f-c390-8750c61bc411@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 3 Jun 2022 15:23:25 +0200
Message-ID: <CAP+8YyGRf2XRoaw9aZhwFBryxccYTRrpSLVh8X6WG02zO5ed0A@mail.gmail.com>
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

On Fri, Jun 3, 2022 at 2:49 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 03.06.22 um 14:39 schrieb Bas Nieuwenhuizen:
> > On Fri, Jun 3, 2022 at 2:08 PM Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> >> Am 03.06.22 um 13:07 schrieb Bas Nieuwenhuizen:
> >>> On Fri, Jun 3, 2022 at 12:16 PM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>> Am 03.06.22 um 12:08 schrieb Bas Nieuwenhuizen:
> >>>>> [SNIP]
> >>>>>>> I do have to fix some stuff indeed, especially for the GEM close =
but
> >>>>>>> with that we should be able to keep the same basic approach?
> >>>>>> Nope, not even remotely.
> >>>>>>
> >>>>>> What we need is the following:
> >>>>>> 1. Rolling out my drm_exec patch set, so that we can lock buffers =
as needed.
> >>>>>> 2. When we get a VM operation we not only lock the VM page tables,=
 but
> >>>>>> also all buffers we potentially need to unmap.
> >>>>>> 3. Nuking the freed list in the amdgpu_vm structure by updating fr=
eed
> >>>>>> areas directly when they are unmapped.
> >>>>>> 4. Tracking those updates inside the bo_va structure for the BO+VM
> >>>>>> combination.
> >>>>>> 5. When the bo_va structure is destroy because of closing the hand=
le
> >>>>>> move the last clear operation over to the VM as implicit sync.
> >>>>>>
> >>>>> Hi Christian, isn't that a different problem though (that we're als=
o
> >>>>> trying to solve, but in your series)?
> >>>>>
> >>>>> What this patch tries to achieve:
> >>>>>
> >>>>> (t+0) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
> >>>>> (t+1) a VM operation on a BO/VM accessed by the CS.
> >>>>>
> >>>>> to run concurrently. What it *doesn't* try is
> >>>>>
> >>>>> (t+0) a VM operation on a BO/VM accessed by the CS.
> >>>>> (t+1) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
> >>>>>
> >>>>> to run concurrently. When you write
> >>>>>
> >>>>>> Only when all this is done we then can resolve the dependency that=
 the
> >>>>>> CS currently must wait for any clear operation on the VM.
> >>>>> isn't that all about the second problem?
> >>>> No, it's the same.
> >>>>
> >>>> See what we do in the VM code is to artificially insert a bubble so =
that
> >>>> all VM clear operations wait for all CS operations and then use the
> >>>> clear fence to indicate when the backing store of the BO can be free=
d.
> >>> Isn't that remediated with something like the code below? At least th=
e
> >>> gem_close case should be handled with this, and the move case was
> >>> already handled by the copy operation.
> >> That is one necessary puzzle piece, yes. But you need more than that.
> >>
> >> Especially the explicit unmap operation needs to be converted into an
> >> implicit unmap to get the TLB flush right.
> > This doesn't change anything about the TLB flush though? Since all
> > unmap -> later jobs dependencies are still implicit.
> >
> > So the worst what could happen (i.f. e.g. userspace gets the
> > waits/dependencies wrong) is
> >
> > 1) non-implicit CS gets submitted that touches a BO
> > 2)  VM unmap on that BO happens
> > 2.5) the CS from 1 is still active due to missing dependencies
> > 2.6) but any CS submission after 2 will trigger a TLB flush
>
> Yeah, but that's exactly the bubble we try to avoid. Isn't it?

For this series, not really.  To clarify there are two sides for
getting GPU bubbles and no overlap:

(1) VM operations implicitly wait for earlier CS submissions
(2) CS submissions implicitly wait for earlier VM operations

Together, these combine to ensure that you get a (potentially small)
bubble any time VM work happens.

Your series (and further ideas) tackles (2), and is a worthwhile thing
to do. However, while writing the userspace for this I noticed this
isn't enough to get rid of all our GPU bubbles. In particular when
doing a non-sparse map of a new BO, that tends to need to be waited on
for the next CS anyway for API semantics. Due to VM operations
happening on a single timeline that means this high priority map can
end up being blocked by earlier sparse maps and hence the bubble in
that case still exists.

So in this series I try to tackle (1) instead. Since GPU work
typically lags behind CPU submissions and VM operations aren't that
slow, we can typically execute VM operations early enough that any
implicit syncs from (2) are less/no issue. In particular, by doing all
dependency waits in userspace, we can make almost all VM operations
start pretty much immediately (with a bunch of exceptions, like other
VM work that takes time, radeonsi still submitting implicitly synced
stuff etc.).

So I think (2) is valuable, just not what this series tries to focus
on or touch at all.

(And then the cherry on top would be having two timelines for VM
operations, a high priority one for non-sparse bindings and a low
priority one for sparse bindings, but that is very complex and not
super high value on top of eliminating (1) + (2), so I'd punt that for
"maybe later". See e.g. the discussion wrt Intel at
https://patchwork.freedesktop.org/patch/486604/#comment_879193)

>
> When we want to do a TLB flush the unmap operation must already be
> completed. Otherwise the flush is rather pointless since any access
> could reloads the not yet updated PTEs.
>
> And this means that we need to artificially add a dependency on every
> command submission after 2 to wait until the unmap operation is completed=
.
>
> Christian.
>
> > 3) A TLB flush happens for a new CS
> > 4) All CS submissions here see the TLB flush and hence the unmap
> >
> > So the main problem would be the CS from step 1, but (a) if that
> > VMFaults that is the apps own fault and (b) because we don't free the
> > memory until (1) finishes it is not a security issue kernel-wise.
> >
> >> I think I know all the necessary steps now, it's just tons of work to =
do.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> >>> @@ -187,6 +187,39 @@ static int amdgpu_gem_object_open(struct
> >>> drm_gem_object *obj,
> >>>          return 0;
> >>> }
> >>>
> >>> +static void dma_resv_copy(struct dma_resv *src, struct dma_resv *dst=
)
> >>> +{
> >>> +       struct dma_resv_iter cursor;
> >>> +       struct dma_fence *f;
> >>> +       int r;
> >>> +       unsigned num_fences =3D 0;
> >>> +
> >>> +       if (src =3D=3D dst)
> >>> +               return;
> >>> +
> >>> +       /* We assume the later loops get the same fences as the calle=
r should
> >>> +        * lock the resv. */
> >>> +       dma_resv_for_each_fence(&cursor, src, DMA_RESV_USAGE_BOOKKEEP=
, f) {
> >>> +               ++num_fences;
> >>> +               dma_fence_put(f);
> >>> +       }
> >>> +
> >>> +       r =3D dma_resv_reserve_fences(dst, num_fences);
> >>> +       if (r) {
> >>> +               /* As last resort on OOM we block for the fence */
> >>> +               dma_resv_for_each_fence(&cursor, src,
> >>> DMA_RESV_USAGE_BOOKKEEP, f) {
> >>> +                       dma_fence_wait(f, false);
> >>> +                       dma_fence_put(f);
> >>> +               }
> >>> +       }
> >>> +
> >>> +       dma_resv_for_each_fence(&cursor, src, DMA_RESV_USAGE_BOOKKEEP=
, f) {
> >>> +               dma_resv_add_fence(dst, f, dma_resv_iter_usage(&curso=
r));
> >>> +               dma_fence_put(f);
> >>> +       }
> >>> +}
> >>> +
> >>> +
> >>> static void amdgpu_gem_object_close(struct drm_gem_object *obj,
> >>>                                      struct drm_file *file_priv)
> >>> {
> >>> @@ -233,6 +266,8 @@ static void amdgpu_gem_object_close(struct
> >>> drm_gem_object *obj,
> >>>          amdgpu_bo_fence(bo, fence, true);
> >>>          dma_fence_put(fence);
> >>>
> >>> +       dma_resv_copy(vm->root.bo->tbo.base.resv, bo->tbo.base.resv);
> >>> +
> >>> out_unlock:
> >>>          if (unlikely(r < 0))
> >>>                  dev_err(adev->dev, "failed to clear page "
> >>>
> >>>> When you want to remove this bubble (which is certainly a good idea)=
 you
> >>>> need to first come up with a different approach to handle the clear
> >>>> operations.
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>>
>
