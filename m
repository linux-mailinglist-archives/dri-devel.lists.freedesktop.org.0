Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE66F54F810
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 15:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C6E10F02E;
	Fri, 17 Jun 2022 13:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D329710EE59
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:03:44 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id x38so7147845ybd.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 06:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G0KliWss/mxrN5qYXUbhNpz5QnejjUtEtU7W5RZR5no=;
 b=imqoFvVUwT28DJYwwjoHQVPxETCWkY/H9ZzYN2gXwuyu4izN1V+QVTQgtodFzu/UrF
 An8KSjbbyNT832bUrdjyikmyCz31JFMUzpuPcNm9nTNdBDj0rUkp99g+o/GVnjt2RnJ0
 C3V/V2DiwjFmML3E0/0TPz/FvQdlo9rOdv0iCOVKh4RQhYn0ejP763QrGtUblE9O+3q/
 wnlmZ91Dg48OomfUgvSijObaiHS44qLvNRwRzEAj8oEi0C+xK4gCU/DAQp6lzUAME4vX
 Hmd+3zI7DUvIGPIO3HuQz4egaYMrnmZ8er+AV3FIAAYQsJ8eJ/mPqmnJGNrRBpXpEAke
 7crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G0KliWss/mxrN5qYXUbhNpz5QnejjUtEtU7W5RZR5no=;
 b=iREDbr73qwimaP+P9cwBxO/DuVK/EqudY3eOsZiucvcbqYOIAOWrNy5Jw8oMPeboRu
 lVid0iPUzot1+7EoynJyNdwSwuXV4NJsnS2UD4e0ZfTIQ4znAwK6iRQbuxjtNTgrU642
 HO2oYfCcWdspwvq6YAhhUoxSASlQWyPLf5F9eAIiuHjBQqChr8v7h9wNv5SRf8gGtmKX
 kMPvTKl3jRSsew7thzyN0iNYXumCQQoTc1M87XkJ0cAGdG7EZtFbprIldgr0JqmGUBbK
 0OGRopE20C31vHYJBg+p2O95zeeEMWxB+pJES/7Q2b9jZQwte9N1seBqweDjgeiQeGQH
 bBvw==
X-Gm-Message-State: AJIora+46C28IrsdzO/k0BXUTr37gxPqEOQ4anzZ0tQ2qelqrM6AfrZi
 nno3xPCGj/1cu83GbUmVzFFHffGhyjfVKMq4KDZ07m+sa7QgwQ==
X-Google-Smtp-Source: AGRyM1uKos0bFstueg6PGxY0wysUds5Do5AiVk9iHaRFxnFg+FHxdLwCV646JOs/X3LgX3s6hNajFvWBTbwEtV2STiU=
X-Received: by 2002:a25:2ccd:0:b0:668:bfc8:d69b with SMTP id
 s196-20020a252ccd000000b00668bfc8d69bmr1808687ybs.204.1655471023883; Fri, 17
 Jun 2022 06:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
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
 <CAP+8YyGL_WEME-1_oB_K5_K600c5kcmO0GxXBQGVQEF7aP_D7w@mail.gmail.com>
 <91e843ca-928a-7ab1-12e4-89fbba085403@amd.com>
 <CAP+8YyHqcoxVeropBpeuSRX4kNtVezi1-s3FKSic_Z_OQ8BcAg@mail.gmail.com>
 <1e04e766-4a5b-6825-6991-3bd542f562b5@amd.com>
In-Reply-To: <1e04e766-4a5b-6825-6991-3bd542f562b5@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 17 Jun 2022 15:03:52 +0200
Message-ID: <CAP+8YyGEHUZhCCUa-3sSVmgGMrTkj=vQomPar=hTN=3-RCznOA@mail.gmail.com>
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

On Wed, Jun 15, 2022 at 9:00 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 06.06.22 um 13:00 schrieb Bas Nieuwenhuizen:
> > On Mon, Jun 6, 2022 at 12:35 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> [SNIP]
> >> That part won't work at all and would cause additional synchronization
> >> problems.
> >>
> >> First of all for implicit synced CS we should use READ, not BOOKKEEP.
> >> Because BOOKKEEP would incorrectly be ignored by OpenGL importers. I'v=
e
> >> fixed that this causes memory corruption, but it is still nice to avoi=
d.
> > Yes, what I'm saying is that on implicit sync CS submission should add
> > READ fences to the dma resv and on explicit sync CS submission should
> > add BOOKKEEP fences.
>
> No, exactly that is wrong.
>
> Implicit CS submissions should add WRITE fences.
>
> Explicit CS submissions should add READ fences.
>
> Only VM updates should add BOOKKEEP fences.
>
> >> BOOKKEEP can only be used by VM updates themselves. So that they don't
> >> interfere with CS.
> > That is the point why we would go BOOKKEEP for explicit sync CS
> > submissions, no? Explicit submission shouldn't interfere with any
> > other CS submissions. That includes being totally ignored by GL
> > importers (if we want to have synchronization there between an
> > explicit submission and GL, userspace is expected to use Jason's
> > dmabuf fence import/export IOCTLs)
>
> No, that would break existing DMA-buf rules.
>
> Explicit CS submissions are still a dependency for implicit submissions.

This is explicitly what we don't want for explicit submissions and why
I waited with this series until the DMA_RESV_USAGE series landed. We
wish to opt out from implicit sync completely, and just use the IOCTLs
Jason wrote for back-compat with windowing systems that need it.

If BOOKKEEP isn't for that, should we add a new USAGE?

>
> >
> > Then the second problem is that the VM IOCTL has absolutely no idea wha=
t
> > the CS IOCTL would be doing. That's why we have added the EXPLICIT sync
> > flag on the BO.
> > It doesn't need to? We just use a different sync_mode for BOOKKEEP
> > fences vs others:
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
chwork.freedesktop.org%2Fpatch%2F487887%2F%3Fseries%3D104578%26rev%3D2&amp;=
data=3D05%7C01%7Cchristian.koenig%40amd.com%7C81db0fea1c854076fc4408da47aba=
faa%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637901099957139870%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DF72Boaesx83MD2pjGuucA1buawi205XLSsQHg5=
EH39A%3D&amp;reserved=3D0
>
> No, exactly that's completely broken.
>
> Regards,
> Christian.
>
> >
> > (the nice thing about doing it this way is that it is independent of
> > the IOCTL, i.e. also works for the delayed mapping changes we trigger
> > on CS submit)
> >
> >> Regards,
> >> Christian.
> >>
> >>>> That should be doable, but then you don't need any of the other chan=
ges.
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>>> #1 Is rather easy to fix, you just need to copy all dma_fences fro=
m the
> >>>>>> page table dma_resv object over to the BOs dma_resv object in the =
gem
> >>>>>> close handler. E.g. exactly what you suggested with the dma_resv_c=
opy
> >>>>>> function.
> >>>>>>
> >>>>>> #2 is a nightmare.
> >>>>>>
> >>>>>> We can't move the TLB flush at the end of the unmap operation beca=
use on
> >>>>>> async TLB flushes are either a bit complicated (double flushes etc=
..) or
> >>>>>> don't even work at all because of hw bugs. So to have a reliable T=
LB
> >>>>>> flush we must make sure that nothing else is ongoing and that mean=
s
> >>>>>> CS->VM->CS barrier.
> >>>>>>
> >>>>>> We try very hard to circumvent that already on maps by (for exampl=
e)
> >>>>>> using a completely new VMID for CS after the VM map operation.
> >>>>>>
> >>>>>> But for the unmap operation we would need some kind special dma_fe=
nce
> >>>>>> implementation which would not only wait for all existing dma_fenc=
e but
> >>>>>> also for the one added until the unmap operation is completed. Cau=
se
> >>>>>> otherwise our operation we do at #1 would simply not catch all
> >>>>>> dma_fences which have access to the memory.
> >>>>>>
> >>>>>> That's certainly doable, but I think just using the drm_exec stuff=
 I
> >>>>>> already came up with is easier.
> >>>>>>
> >>>>>> When we can grab locks for all the BOs involved amdgpu_vm_clear_fr=
eed()
> >>>>>> goes away and we can keep track of the unmap operations in the bo_=
va
> >>>>>> structure.
> >>>>>>
> >>>>>> With that done you can make the explicit sync you noted in the bo_=
va
> >>>>>> structure and implicit sync when the bo_va structure goes away.
> >>>>>>
> >>>>>> Then the only reason I can see why we would need a CS->VM dependen=
cy is
> >>>>>> implicit synchronization, and that's what we are trying to avoid h=
ere in
> >>>>>> the first place.
> >>>>>>
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>>>> To get rid of this barrier you must first fix the part where CS
> >>>>>>>> submissions wait for the VM operation to complete, e.g. the nece=
ssity of
> >>>>>>>> the barrier.
> >>>>>>>>
> >>>>>>>> I'm working on this for a couple of years now and I'm really run=
ning out
> >>>>>>>> of idea how to explain this restriction.
> >>>>>>>>
> >>>>>>>> Regards,
> >>>>>>>> Christian.
> >>>>>>>>
>
