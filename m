Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CEE53CEFB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 19:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4C611222C;
	Fri,  3 Jun 2022 17:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886A711222C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 17:50:30 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id u3so5289605ybi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 10:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Dn1Rx/0ForaqttkHf5uR0+FhPCHgcdsTXuZwAObeapM=;
 b=HynSxfyf3xxthd/uQ3vH18Q7fQ+FexdE1iryabM2gaYkRAnKNUJ7kMcTNlPki0duFc
 ZInCaQZ/rgffwIlAtEcVBnYPzoIPc8HBQr/MKfCM1/7zr2J5+yWA6Vmyf0cJ5x42RKjm
 4gTeaEu/vPd7Da3BavN7c1B7A0wicNoBtR4BocfJK1vdfWoFXBDNalgKcOu1kkuTivAT
 KR9X6Lizw1SJUeX07zgzI45MCoKHTZ4+ZWWpoeINC9crQjgwJSyYzgFp/MkTwbNgFxRm
 rLXrejbxH7y9PYcZdgQJk1V82+Cg5IRCxvSnJT/FcJ/uKA4yu0/DPiJg9ch7OVs4OjjE
 AviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Dn1Rx/0ForaqttkHf5uR0+FhPCHgcdsTXuZwAObeapM=;
 b=t/dGayRvkmm5tb8Wfm+N8Ga+PfKGPmO8jEF7fvgpLveaczKa5r0ERk0e6WysfrmaaE
 Q9oSiicmkCTORVIxaRM490qV5MkSdLX3UeroAHrIHQjmBSE8eJ9Q9kDGBEbWu/YX3QxY
 iEUnj/dnLFg5cxW5UAg7p0OE/qDSUE4V+c/oHlWDLH33RgQOwHQLVu+BYs4DcJx5Zyjw
 8Sen6rLhdxD6zyt9tpA6jy28sv0Ucc9hk77P5/cqUQ0GPslvJYlauRq6e092r+R3F0kv
 u0BcXduoGbjBCmV/btnSXJ7+v+2gEfksjivLWqQQTqu4URwyEMNTnuqjBZBM36ZkRbQi
 r23w==
X-Gm-Message-State: AOAM532o4sr/H4DkZ1IJw9jFx7WA49+MjWEg9F0MLFBYOM+kaUu9STVc
 p2neAsqn1QLlET6dkXZwDd44JoJn56OAhq6oCJiiKA==
X-Google-Smtp-Source: ABdhPJwVbuyE6dt7mL0aZtF1MdZgTFy+1QjwjIJSHNICoanqMqueos0fSFgSz7TzINGVk8rBUmgGlhlhOZSdLpJYPuU=
X-Received: by 2002:a05:6902:108:b0:621:165e:5c1e with SMTP id
 o8-20020a056902010800b00621165e5c1emr11710310ybh.204.1654278629687; Fri, 03
 Jun 2022 10:50:29 -0700 (PDT)
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
 <CAP+8YyGRf2XRoaw9aZhwFBryxccYTRrpSLVh8X6WG02zO5ed0A@mail.gmail.com>
 <4d30fb54-be88-7913-74f5-fa998c28f033@amd.com>
In-Reply-To: <4d30fb54-be88-7913-74f5-fa998c28f033@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 3 Jun 2022 19:50:40 +0200
Message-ID: <CAP+8YyFKOM1qztPBNGk4nzsaX7Dq8-cwg0h_GUgz6sUxBZLhEw@mail.gmail.com>
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

On Fri, Jun 3, 2022 at 7:42 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 03.06.22 um 15:23 schrieb Bas Nieuwenhuizen:
> > On Fri, Jun 3, 2022 at 2:49 PM Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> >> Am 03.06.22 um 14:39 schrieb Bas Nieuwenhuizen:
> >>> On Fri, Jun 3, 2022 at 2:08 PM Christian K=C3=B6nig <christian.koenig=
@amd.com> wrote:
> >>>> Am 03.06.22 um 13:07 schrieb Bas Nieuwenhuizen:
> >>>>> On Fri, Jun 3, 2022 at 12:16 PM Christian K=C3=B6nig
> >>>>> <christian.koenig@amd.com> wrote:
> >>>>>> Am 03.06.22 um 12:08 schrieb Bas Nieuwenhuizen:
> >>>>>>> [SNIP]
> >>>>>>>>> I do have to fix some stuff indeed, especially for the GEM clos=
e but
> >>>>>>>>> with that we should be able to keep the same basic approach?
> >>>>>>>> Nope, not even remotely.
> >>>>>>>>
> >>>>>>>> What we need is the following:
> >>>>>>>> 1. Rolling out my drm_exec patch set, so that we can lock buffer=
s as needed.
> >>>>>>>> 2. When we get a VM operation we not only lock the VM page table=
s, but
> >>>>>>>> also all buffers we potentially need to unmap.
> >>>>>>>> 3. Nuking the freed list in the amdgpu_vm structure by updating =
freed
> >>>>>>>> areas directly when they are unmapped.
> >>>>>>>> 4. Tracking those updates inside the bo_va structure for the BO+=
VM
> >>>>>>>> combination.
> >>>>>>>> 5. When the bo_va structure is destroy because of closing the ha=
ndle
> >>>>>>>> move the last clear operation over to the VM as implicit sync.
> >>>>>>>>
> >>>>>>> Hi Christian, isn't that a different problem though (that we're a=
lso
> >>>>>>> trying to solve, but in your series)?
> >>>>>>>
> >>>>>>> What this patch tries to achieve:
> >>>>>>>
> >>>>>>> (t+0) CS submission setting BOOKKEEP fences (i.e. no implicit syn=
c)
> >>>>>>> (t+1) a VM operation on a BO/VM accessed by the CS.
> >>>>>>>
> >>>>>>> to run concurrently. What it *doesn't* try is
> >>>>>>>
> >>>>>>> (t+0) a VM operation on a BO/VM accessed by the CS.
> >>>>>>> (t+1) CS submission setting BOOKKEEP fences (i.e. no implicit syn=
c)
> >>>>>>>
> >>>>>>> to run concurrently. When you write
> >>>>>>>
> >>>>>>>> Only when all this is done we then can resolve the dependency th=
at the
> >>>>>>>> CS currently must wait for any clear operation on the VM.
> >>>>>>> isn't that all about the second problem?
> >>>>>> No, it's the same.
> >>>>>>
> >>>>>> See what we do in the VM code is to artificially insert a bubble s=
o that
> >>>>>> all VM clear operations wait for all CS operations and then use th=
e
> >>>>>> clear fence to indicate when the backing store of the BO can be fr=
eed.
> >>>>> Isn't that remediated with something like the code below? At least =
the
> >>>>> gem_close case should be handled with this, and the move case was
> >>>>> already handled by the copy operation.
> >>>> That is one necessary puzzle piece, yes. But you need more than that=
.
> >>>>
> >>>> Especially the explicit unmap operation needs to be converted into a=
n
> >>>> implicit unmap to get the TLB flush right.
> >>> This doesn't change anything about the TLB flush though? Since all
> >>> unmap -> later jobs dependencies are still implicit.
> >>>
> >>> So the worst what could happen (i.f. e.g. userspace gets the
> >>> waits/dependencies wrong) is
> >>>
> >>> 1) non-implicit CS gets submitted that touches a BO
> >>> 2)  VM unmap on that BO happens
> >>> 2.5) the CS from 1 is still active due to missing dependencies
> >>> 2.6) but any CS submission after 2 will trigger a TLB flush
> >> Yeah, but that's exactly the bubble we try to avoid. Isn't it?
> > For this series, not really.  To clarify there are two sides for
> > getting GPU bubbles and no overlap:
> >
> > (1) VM operations implicitly wait for earlier CS submissions
> > (2) CS submissions implicitly wait for earlier VM operations
> >
> > Together, these combine to ensure that you get a (potentially small)
> > bubble any time VM work happens.
> >
> > Your series (and further ideas) tackles (2), and is a worthwhile thing
> > to do. However, while writing the userspace for this I noticed this
> > isn't enough to get rid of all our GPU bubbles. In particular when
> > doing a non-sparse map of a new BO, that tends to need to be waited on
> > for the next CS anyway for API semantics. Due to VM operations
> > happening on a single timeline that means this high priority map can
> > end up being blocked by earlier sparse maps and hence the bubble in
> > that case still exists.
> >
> > So in this series I try to tackle (1) instead. Since GPU work
> > typically lags behind CPU submissions and VM operations aren't that
> > slow, we can typically execute VM operations early enough that any
> > implicit syncs from (2) are less/no issue.
>
> Ok, once more since you don't seem to understand what I want to say: It
> isn't possible to fix #1 before you have fixed #2.
>
> The VM unmap operation here is a barrier which divides the CS operations
> in a before and after. This is intentional design.

Why is that barrier needed? The two barriers I got and understood and
I think we can deal with:

1) the VM unmap is a barrier between prior CS and later memory free.
2) The TLB flush need to happen between a VM unmap and later CS.

But why do we need the VM unmap to be a strict barrier between prior
CS and later CS?

>
> To get rid of this barrier you must first fix the part where CS
> submissions wait for the VM operation to complete, e.g. the necessity of
> the barrier.
>
> I'm working on this for a couple of years now and I'm really running out
> of idea how to explain this restriction.
>
> Regards,
> Christian.
>
