Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509C153CA18
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 14:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E398D10E1CB;
	Fri,  3 Jun 2022 12:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D885310E1CB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 12:38:55 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-30c1c9b9b6cso80525257b3.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LQ9LbAf9wXAmGn/O8980DbDJtMR66Tj4Vl4MoT61m6k=;
 b=DkB/GKnpnJBrFnTNDsyVVhLBkZfNijtKEeCge6KZXu9kaQR41nBfAya3Jcy9IUpICA
 B6TfjkjZonQBwMyz22Yy7eWRjOuGA6ux9GSMyhcjoO1rkNkVfkNPQPjq2Vjq8EXLXVnK
 VgqdcVmi8v6R9zNku04i89NxigDum1tG98H1V8N5Jh66xGhZTowAiUhBiRE3Sa/V8nmH
 +GEEn94z0mbUfkRDez/WK8EJcArXZnrabFcmxwCiwumYbJ/jVBw/Qy1TlXyKFnnQj3yw
 ipH2KIbA9mVI2K7evb/+YMlA32OZC/oc9XG+PI4Fmi1A9muSkQ3Xo4Fq2J3NL+btf+pJ
 TEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LQ9LbAf9wXAmGn/O8980DbDJtMR66Tj4Vl4MoT61m6k=;
 b=3R97uooi916AwdpfA9CN3j2gJCj4KJ2wy8S9ctXytg87lA/bY0QgJHxjbMx0ocBWcG
 MUZ+r78dL17BndSfv4ABSkY65MniGF5gv39KnXMPBFhEIF+hK4IncokNP391roYw6CuV
 W06XIGDfVNz7aUI2gkQRH/gNUH6D8SLn3PmD+ToiUMWifK9Zxm8OXEfw6usaJ/+MNki4
 Blsk3W2xdGbxbiimn1d6O1EuMZyISX1RyHREQ/rOV6iBX/8wDi6AiuD4IpPmI2u+pToD
 zGwBkwAiOdRVVCb1NM3yvgThEFw3QEbqOOyUVGny3XGkskXWurV/O/PszSr32EytQuGj
 lNnA==
X-Gm-Message-State: AOAM531CjrUTmuv00TrpUCSvjracKiQrAy3U9uv87p657D8PLZHKl85D
 WnKJWU4k6c8MpbaiVhEIzbvRSelJ3HKAN9Jm4uUORw==
X-Google-Smtp-Source: ABdhPJySwlROwAfGq791PwBCtelHedMj23hyGwnzErBFrerJpvhojZF08hUFaXP2/C8/DyYm0aZfS41nx889tfYmo/Q=
X-Received: by 2002:a0d:f541:0:b0:2fe:ca9a:dbbe with SMTP id
 e62-20020a0df541000000b002feca9adbbemr11188985ywf.254.1654259934984; Fri, 03
 Jun 2022 05:38:54 -0700 (PDT)
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
In-Reply-To: <7cba4b1d-724a-3c32-2546-015fa069342d@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 3 Jun 2022 14:39:05 +0200
Message-ID: <CAP+8YyEMDNR_5=uGf8BEV5DCovr-Z_ZDWS2E7-7zqSFGG7bdKg@mail.gmail.com>
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

On Fri, Jun 3, 2022 at 2:08 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 03.06.22 um 13:07 schrieb Bas Nieuwenhuizen:
> > On Fri, Jun 3, 2022 at 12:16 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 03.06.22 um 12:08 schrieb Bas Nieuwenhuizen:
> >>> [SNIP]
> >>>>> I do have to fix some stuff indeed, especially for the GEM close bu=
t
> >>>>> with that we should be able to keep the same basic approach?
> >>>> Nope, not even remotely.
> >>>>
> >>>> What we need is the following:
> >>>> 1. Rolling out my drm_exec patch set, so that we can lock buffers as=
 needed.
> >>>> 2. When we get a VM operation we not only lock the VM page tables, b=
ut
> >>>> also all buffers we potentially need to unmap.
> >>>> 3. Nuking the freed list in the amdgpu_vm structure by updating free=
d
> >>>> areas directly when they are unmapped.
> >>>> 4. Tracking those updates inside the bo_va structure for the BO+VM
> >>>> combination.
> >>>> 5. When the bo_va structure is destroy because of closing the handle
> >>>> move the last clear operation over to the VM as implicit sync.
> >>>>
> >>> Hi Christian, isn't that a different problem though (that we're also
> >>> trying to solve, but in your series)?
> >>>
> >>> What this patch tries to achieve:
> >>>
> >>> (t+0) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
> >>> (t+1) a VM operation on a BO/VM accessed by the CS.
> >>>
> >>> to run concurrently. What it *doesn't* try is
> >>>
> >>> (t+0) a VM operation on a BO/VM accessed by the CS.
> >>> (t+1) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
> >>>
> >>> to run concurrently. When you write
> >>>
> >>>> Only when all this is done we then can resolve the dependency that t=
he
> >>>> CS currently must wait for any clear operation on the VM.
> >>> isn't that all about the second problem?
> >> No, it's the same.
> >>
> >> See what we do in the VM code is to artificially insert a bubble so th=
at
> >> all VM clear operations wait for all CS operations and then use the
> >> clear fence to indicate when the backing store of the BO can be freed.
> > Isn't that remediated with something like the code below? At least the
> > gem_close case should be handled with this, and the move case was
> > already handled by the copy operation.
>
> That is one necessary puzzle piece, yes. But you need more than that.
>
> Especially the explicit unmap operation needs to be converted into an
> implicit unmap to get the TLB flush right.

This doesn't change anything about the TLB flush though? Since all
unmap -> later jobs dependencies are still implicit.

So the worst what could happen (i.f. e.g. userspace gets the
waits/dependencies wrong) is

1) non-implicit CS gets submitted that touches a BO
2)  VM unmap on that BO happens
2.5) the CS from 1 is still active due to missing dependencies
2.6) but any CS submission after 2 will trigger a TLB flush
3) A TLB flush happens for a new CS
4) All CS submissions here see the TLB flush and hence the unmap

So the main problem would be the CS from step 1, but (a) if that
VMFaults that is the apps own fault and (b) because we don't free the
memory until (1) finishes it is not a security issue kernel-wise.

>
> I think I know all the necessary steps now, it's just tons of work to do.
>
> Regards,
> Christian.
>
> >
> >
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > @@ -187,6 +187,39 @@ static int amdgpu_gem_object_open(struct
> > drm_gem_object *obj,
> >         return 0;
> > }
> >
> > +static void dma_resv_copy(struct dma_resv *src, struct dma_resv *dst)
> > +{
> > +       struct dma_resv_iter cursor;
> > +       struct dma_fence *f;
> > +       int r;
> > +       unsigned num_fences =3D 0;
> > +
> > +       if (src =3D=3D dst)
> > +               return;
> > +
> > +       /* We assume the later loops get the same fences as the caller =
should
> > +        * lock the resv. */
> > +       dma_resv_for_each_fence(&cursor, src, DMA_RESV_USAGE_BOOKKEEP, =
f) {
> > +               ++num_fences;
> > +               dma_fence_put(f);
> > +       }
> > +
> > +       r =3D dma_resv_reserve_fences(dst, num_fences);
> > +       if (r) {
> > +               /* As last resort on OOM we block for the fence */
> > +               dma_resv_for_each_fence(&cursor, src,
> > DMA_RESV_USAGE_BOOKKEEP, f) {
> > +                       dma_fence_wait(f, false);
> > +                       dma_fence_put(f);
> > +               }
> > +       }
> > +
> > +       dma_resv_for_each_fence(&cursor, src, DMA_RESV_USAGE_BOOKKEEP, =
f) {
> > +               dma_resv_add_fence(dst, f, dma_resv_iter_usage(&cursor)=
);
> > +               dma_fence_put(f);
> > +       }
> > +}
> > +
> > +
> > static void amdgpu_gem_object_close(struct drm_gem_object *obj,
> >                                     struct drm_file *file_priv)
> > {
> > @@ -233,6 +266,8 @@ static void amdgpu_gem_object_close(struct
> > drm_gem_object *obj,
> >         amdgpu_bo_fence(bo, fence, true);
> >         dma_fence_put(fence);
> >
> > +       dma_resv_copy(vm->root.bo->tbo.base.resv, bo->tbo.base.resv);
> > +
> > out_unlock:
> >         if (unlikely(r < 0))
> >                 dev_err(adev->dev, "failed to clear page "
> >
> >> When you want to remove this bubble (which is certainly a good idea) y=
ou
> >> need to first come up with a different approach to handle the clear
> >> operations.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>
>
