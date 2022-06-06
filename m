Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6E853E414
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 12:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDDB10E529;
	Mon,  6 Jun 2022 10:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C0F10E529
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 10:30:03 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2f83983782fso138392357b3.6
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 03:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w0Kz9D/3vP2LDqIOv6SYLVKg4AEyhTrK23bQ1Z+qnn8=;
 b=JlE1XfQs6DGhuGLY4zj7mfloL/5Z5H4Y/Mgbr9o5q4rtwHddUgO8yJKPNWrkR/30PR
 wjvZg7cp51pbAXMRGyrJi+bPHeUBUi1eDIHhkEjnBmy4FeXK5/KXBV8rJSLH0l9i9DMY
 47fV9mQJojo7JZKlgx+pZyONWPBU5DpWJUlHDisGGbXg0fq8KRU5p3OhNblnb8Z6HTw5
 LIH6r3ABhwyoM38gssVFSaUlyPtmDu81u014vCDs0nBuW1i11OAKnzS3TUYDLSVxfEkf
 kQDDHOhD0Qc675JBLesUJjWCgY38FJz9Sj2qVnKETUpU+WvaZ7QcURPiQ+JsqsGtUeXm
 FUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w0Kz9D/3vP2LDqIOv6SYLVKg4AEyhTrK23bQ1Z+qnn8=;
 b=LCS4OaAA4gArPOaLHsq7vkJCdpkZeWECxDWuUlOQtGKQpoivNAWvLjBJm6vIob2w1+
 sqwQdqGq/3A6GbCkuAWRH0nkjXomXeG8fmibHJxP0/E98qsnaBUuaJGUZsEFz++EThki
 VxGejIgtxyZ57EVoKpM867DTapi+S90v+SnHp4CD9hx/9CO6ZEpqPK7CIQ9IaZ6ovAwX
 gJZe+XwbcyPkVsMVtBf1KNgFbfMkj7ONWTg3sE3jNRQ76FvSNVOa11uK0z7m1GrtQAoR
 EOB1nhAJ3N71ND42Te1yLWA/PJGGXtXuyzapUnU2YejHrFGuuVzqAaHDspFXQX4p8nrL
 CCbg==
X-Gm-Message-State: AOAM532wYFMBb7FHWKyoMizXPVlbc4rwWbRlY7AuP8zXNNf5vE6pxE4I
 xITVHfeICdvkjojQDiOk76onY3hlzS84jpN38Rf2TtXs6Z3BHA==
X-Google-Smtp-Source: ABdhPJwPdRBpY7BT9L4gzWzVbbj8GTXtt/lA/0iIzxWI74vslA3DLLt0pmTRUcuqHZAxyHYjAnuke1m+dW0xu005cy8=
X-Received: by 2002:a81:2008:0:b0:2f8:3968:e70a with SMTP id
 g8-20020a812008000000b002f83968e70amr26006160ywg.321.1654511402882; Mon, 06
 Jun 2022 03:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
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
 <CAP+8YyGRf2XRoaw9aZhwFBryxccYTRrpSLVh8X6WG02zO5ed0A@mail.gmail.com>
 <4d30fb54-be88-7913-74f5-fa998c28f033@amd.com>
 <CAP+8YyFKOM1qztPBNGk4nzsaX7Dq8-cwg0h_GUgz6sUxBZLhEw@mail.gmail.com>
 <98c1ea95-2b1e-36dd-6706-b3667f0f5f47@amd.com>
 <CAP+8YyEWE9KCmo2pGOHMyT3fSEXskTG-tfymwQmmy7d1c9CuRQ@mail.gmail.com>
 <3b6a7d56-6c65-046d-0a51-bbe167e04322@amd.com>
In-Reply-To: <3b6a7d56-6c65-046d-0a51-bbe167e04322@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Mon, 6 Jun 2022 12:30:16 +0200
Message-ID: <CAP+8YyGL_WEME-1_oB_K5_K600c5kcmO0GxXBQGVQEF7aP_D7w@mail.gmail.com>
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

On Mon, Jun 6, 2022 at 12:15 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 03.06.22 um 21:11 schrieb Bas Nieuwenhuizen:
> > On Fri, Jun 3, 2022 at 8:41 PM Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> >> Am 03.06.22 um 19:50 schrieb Bas Nieuwenhuizen:
> >>> [SNIP]
> >>>>>> Yeah, but that's exactly the bubble we try to avoid. Isn't it?
> >>>>> For this series, not really.  To clarify there are two sides for
> >>>>> getting GPU bubbles and no overlap:
> >>>>>
> >>>>> (1) VM operations implicitly wait for earlier CS submissions
> >>>>> (2) CS submissions implicitly wait for earlier VM operations
> >>>>>
> >>>>> Together, these combine to ensure that you get a (potentially small=
)
> >>>>> bubble any time VM work happens.
> >>>>>
> >>>>> Your series (and further ideas) tackles (2), and is a worthwhile th=
ing
> >>>>> to do. However, while writing the userspace for this I noticed this
> >>>>> isn't enough to get rid of all our GPU bubbles. In particular when
> >>>>> doing a non-sparse map of a new BO, that tends to need to be waited=
 on
> >>>>> for the next CS anyway for API semantics. Due to VM operations
> >>>>> happening on a single timeline that means this high priority map ca=
n
> >>>>> end up being blocked by earlier sparse maps and hence the bubble in
> >>>>> that case still exists.
> >>>>>
> >>>>> So in this series I try to tackle (1) instead. Since GPU work
> >>>>> typically lags behind CPU submissions and VM operations aren't that
> >>>>> slow, we can typically execute VM operations early enough that any
> >>>>> implicit syncs from (2) are less/no issue.
> >>>> Ok, once more since you don't seem to understand what I want to say:=
 It
> >>>> isn't possible to fix #1 before you have fixed #2.
> >>>>
> >>>> The VM unmap operation here is a barrier which divides the CS operat=
ions
> >>>> in a before and after. This is intentional design.
> >>> Why is that barrier needed? The two barriers I got and understood and
> >>> I think we can deal with:
> >>>
> >>> 1) the VM unmap is a barrier between prior CS and later memory free.
> >>> 2) The TLB flush need to happen between a VM unmap and later CS.
> >>>
> >>> But why do we need the VM unmap to be a strict barrier between prior
> >>> CS and later CS?
> >> Exactly because of the two reasons you mentioned.
> > This is the part I'm not seeing. I get that removing #2 is a
> > nightmare, which is why I did something that doesn't violate that
> > constraint.
> >
> > Like if an explicit CS that was running before the VM operation  runs
> > till after the VM operation (and hence possibly till after the TLB
> > flush, or otherwise have the TLB flush not apply due to lack of async
> > TLB flush support), that is not an issue. It might see the state from
> > before the unmap, or after the unmap, or some intermediate state and
> > all of those would be okay.
> >
> > We still get the constraint that the TLB flush happens between the VM
> > unmap and later CS and hence the unmap is certainly visible to them.
>
> So you basically just want to set the sync mode in
> amdgpu_vm_update_range() to AMDGPU_SYNC_EXPLICIT even when it is an unmap=
?

Yes, with the caveat that I want to do that only for
DMA_RESV_USAGE_BOOKKEEP or higher (i.e. if we submit a CS with
implicit sync we get the old implicit behavior, if we submit a CS with
explicit sync we get the new explicit behavior). The rest of the
series is basically just for enabling explicit sync submissions.

> That should be doable, but then you don't need any of the other changes.
>
> Regards,
> Christian.
>
> >
> >> #1 Is rather easy to fix, you just need to copy all dma_fences from th=
e
> >> page table dma_resv object over to the BOs dma_resv object in the gem
> >> close handler. E.g. exactly what you suggested with the dma_resv_copy
> >> function.
> >>
> >> #2 is a nightmare.
> >>
> >> We can't move the TLB flush at the end of the unmap operation because =
on
> >> async TLB flushes are either a bit complicated (double flushes etc..) =
or
> >> don't even work at all because of hw bugs. So to have a reliable TLB
> >> flush we must make sure that nothing else is ongoing and that means
> >> CS->VM->CS barrier.
> >>
> >> We try very hard to circumvent that already on maps by (for example)
> >> using a completely new VMID for CS after the VM map operation.
> >>
> >> But for the unmap operation we would need some kind special dma_fence
> >> implementation which would not only wait for all existing dma_fence bu=
t
> >> also for the one added until the unmap operation is completed. Cause
> >> otherwise our operation we do at #1 would simply not catch all
> >> dma_fences which have access to the memory.
> >>
> >> That's certainly doable, but I think just using the drm_exec stuff I
> >> already came up with is easier.
> >>
> >> When we can grab locks for all the BOs involved amdgpu_vm_clear_freed(=
)
> >> goes away and we can keep track of the unmap operations in the bo_va
> >> structure.
> >>
> >> With that done you can make the explicit sync you noted in the bo_va
> >> structure and implicit sync when the bo_va structure goes away.
> >>
> >> Then the only reason I can see why we would need a CS->VM dependency i=
s
> >> implicit synchronization, and that's what we are trying to avoid here =
in
> >> the first place.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>> To get rid of this barrier you must first fix the part where CS
> >>>> submissions wait for the VM operation to complete, e.g. the necessit=
y of
> >>>> the barrier.
> >>>>
> >>>> I'm working on this for a couple of years now and I'm really running=
 out
> >>>> of idea how to explain this restriction.
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>>>
>
