Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E94166E9E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 05:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DF789D60;
	Fri, 21 Feb 2020 04:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF6C6E1E6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 04:45:53 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z16so982602iod.11
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 20:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MOJCFLrpibzbUCFTeKYxS+nOTwA+Bh/K4bVFAoPkuXA=;
 b=JP/WmM8MQw3QmBmHqFBswuyfy/L0xQk2OmXv1Rns6C+Y+BgwbuGaMf/ksqFn0vd9o9
 WNny7fcda8GZZEifIWSF7szi02awQOnZtqIyXOBH8HCp/23qG61C1CmXdVcQH9hNEnDi
 l9tAcFZoHExrS8XhsmPaeq1zh02VQ8a0l9NhR4udWXHE/iwGNwx7jxcz9qvRIwWIVpx7
 uTdCXQvOrUwYm7ccEW/k1B6pE8/wdvvrcm5yU+xwN3fk644vMTPKtdQWC3RomvT2CPPm
 oRQLZ4nZh7JRdD+lUG2CyfDl0RtVc1/Y5mAFuMQ7gNDRSGMNZmhNdfkGlKg0phptnVgk
 rFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MOJCFLrpibzbUCFTeKYxS+nOTwA+Bh/K4bVFAoPkuXA=;
 b=mNuVWvOEN1ZGS07OAV+hPpX6SQCuVNERuBX3VQ1IZGAKwgm4+1F83sdfAU4C68Tjxg
 3iFrmlpIXfG0RS2uGWMnNd+d2LmQD/5Vh5aNZkWORc0sadNYZT1o43Apmt+A3APBwFKj
 KXyglkYfnQqIjrPMxmd4+U7WydigUWpnC2AhG3ZqscjJ8X61/nTBRm7ygaovOo0iLADu
 QZnSB9EPwgTjj0vYMPPbLU+d+gbPLihMvnCY57cFAMojcfg2n2eU+zWmXzngXZv5/Pab
 SiGAJVpg4O5R08c2uqccaSWGesUn6QkaMBrOxmz2xxr8s/pL9CLqlKshHxMu1EsoG2xv
 ALIA==
X-Gm-Message-State: APjAAAURREBAvUKa1JkKUeACQgNne/qRs8H5YYs4DWO3xk3ImDvFVyiV
 lpW9akwIBN6kGVdjd3dBj721MItuBFisT8eij9o=
X-Google-Smtp-Source: APXvYqxUg5EctbLMNdM72q5f+FbgLdNGkxZUu0Sa1H3WRdx2obCEB4ljKQhYCCFMVleFmVB6sqGIMzQJ2/JCjJpoZjM=
X-Received: by 2002:a6b:e705:: with SMTP id b5mr30365172ioh.139.1582260353151; 
 Thu, 20 Feb 2020 20:45:53 -0800 (PST)
MIME-Version: 1.0
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
 <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
 <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
 <20200214195229.GF20690@linux.intel.com>
 <CAPaKu7Q4gehyhEgG_Nw=tiZiTh+7A8-uuXq1w4he6knp6NWErQ@mail.gmail.com>
 <CALMp9eRwTxdqxAcobZ7sYbD=F8Kga=jR3kaz-OEYdA9fV0AoKQ@mail.gmail.com>
 <20200214220341.GJ20690@linux.intel.com>
 <d3a6fac6-3831-3b8e-09b6-bfff4592f235@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78D6F4@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7RyTbuTPf0Tp=0DAD80G-RySLrON8OQsHJzhAYDh7zHuA@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78EE65@SHSMSX104.ccr.corp.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78EF58@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7RFY3nar9hmAdx6RYdZFPK3Cdg1O3cS+OvsEOT=yupyrQ@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D792415@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D792415@SHSMSX104.ccr.corp.intel.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 20 Feb 2020 20:45:40 -0800
Message-ID: <CAPaKu7RHu5rz1Dvkvp4SDrZ0fAYq37xwRqUsdAiOmRTOz2sFTw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] KVM: x86: honor guest memory type
To: "Tian, Kevin" <kevin.tian@intel.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, kvm list <kvm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, "Christopherson,
 Sean J" <sean.j.christopherson@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>
Content-Type: multipart/mixed; boundary="===============1533105844=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1533105844==
Content-Type: multipart/alternative; boundary="0000000000004abae4059f0eb2de"

--0000000000004abae4059f0eb2de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 4:23 PM Tian, Kevin <kevin.tian@intel.com> wrote:

> > From: Chia-I Wu <olvaffe@gmail.com>
> > Sent: Friday, February 21, 2020 6:24 AM
> >
> > On Wed, Feb 19, 2020 at 6:38 PM Tian, Kevin <kevin.tian@intel.com>
> wrote:
> > >
> > > > From: Tian, Kevin
> > > > Sent: Thursday, February 20, 2020 10:05 AM
> > > >
> > > > > From: Chia-I Wu <olvaffe@gmail.com>
> > > > > Sent: Thursday, February 20, 2020 3:37 AM
> > > > >
> > > > > On Wed, Feb 19, 2020 at 1:52 AM Tian, Kevin <kevin.tian@intel.com=
>
> > wrote:
> > > > > >
> > > > > > > From: Paolo Bonzini
> > > > > > > Sent: Wednesday, February 19, 2020 12:29 AM
> > > > > > >
> > > > > > > On 14/02/20 23:03, Sean Christopherson wrote:
> > > > > > > >> On Fri, Feb 14, 2020 at 1:47 PM Chia-I Wu <
> olvaffe@gmail.com>
> > > > wrote:
> > > > > > > >>> AFAICT, it is currently allowed on ARM (verified) and AMD
> (not
> > > > > > > >>> verified, but svm_get_mt_mask returns 0 which supposedly
> > means
> > > > > the
> > > > > > > NPT
> > > > > > > >>> does not restrict what the guest PAT can do).  This diff
> would do
> > the
> > > > > > > >>> trick for Intel without needing any uapi change:
> > > > > > > >> I would be concerned about Intel CPU errata such as SKX40
> and
> > > > SKX59.
> > > > > > > > The part KVM cares about, #MC, is already addressed by
> forcing
> > UC
> > > > for
> > > > > > > MMIO.
> > > > > > > > The data corruption issue is on the guest kernel to
> correctly use
> > WC
> > > > > > > > and/or non-temporal writes.
> > > > > > >
> > > > > > > What about coherency across live migration?  The userspace
> > process
> > > > > would
> > > > > > > use cached accesses, and also a WBINVD could potentially
> corrupt
> > guest
> > > > > > > memory.
> > > > > > >
> > > > > >
> > > > > > In such case the userspace process possibly should
> conservatively use
> > > > > > UC mapping, as if for MMIO regions on a passthrough device.
> > However
> > > > > > there remains a problem. the definition of KVM_MEM_DMA implies
> > > > > > favoring guest setting, which could be whatever type in concept=
.
> Then
> > > > > > assuming UC is also problematic. I'm not sure whether inventing
> > another
> > > > > > interface to query effective memory type from KVM is a good ide=
a.
> > There
> > > > > > is no guarantee that the guest will use same type for every pag=
e
> in the
> > > > > > same slot, then such interface might be messy. Alternatively,
> maybe
> > > > > > we could just have an interface for KVM userspace to force memo=
ry
> > type
> > > > > > for a given slot, if it is mainly used in para-virtualized
> scenarios (e.g.
> > > > > > virtio-gpu) where the guest is enlightened to use a forced type
> (e.g.
> > WC)?
> > > > > KVM forcing the memory type for a given slot should work too.  Bu=
t
> the
> > > > > ignore-guest-pat bit seems to be Intel-specific.  We will need to
> > > > > define how the second-level page attributes combine with the gues=
t
> > > > > page attributes somehow.
> > > >
> > > > oh, I'm not aware of that difference. without an ipat-equivalent
> > > > capability, I'm not sure how to forcing random type here. If you
> look at
> > > > table 11-7 in Intel SDM, none of MTRR (EPT) memory type can lead to
> > > > consistent effective type when combining with random PAT value. So
> > > >  it is definitely a dead end.
> > > >
> > > > >
> > > > > KVM should in theory be able to tell that the userspace region is
> > > > > mapped with a certain memory type and can force the same memory
> > type
> > > > > onto the guest.  The userspace does not need to be involved.  But
> that
> > > > > sounds very slow?  This may be a dumb question, but would it help
> to
> > > > > add KVM_SET_DMA_BUF and let KVM negotiate the memory type with
> > the
> > > > > in-kernel GPU drivers?
> > > > >
> > > > >
> > > >
> > > > KVM_SET_DMA_BUF looks more reasonable. But I guess we don't need
> > > > KVM to be aware of such negotiation. We can continue your original
> > > > proposal to have KVM simply favor guest memory type (maybe still ca=
ll
> > > > KVM_MEM_DMA). On the other hand, Qemu should just mmap on the
> > > > fd handle of the dmabuf passed from the virtio-gpu device backend,
> e.g.
> > > > to conduct migration. That way the mmap request is finally served b=
y
> > > > DRM and underlying GPU drivers, with proper type enforced
> > automatically.
> > > >
> > >
> > > Thinking more possibly we don't need introduce new interface to KVM.
> > > As long as Qemu uses dmabuf interface to mmap the specific region,
> > > KVM can simply check memory type in host page table given hva of a
> > > memslot. If the type is UC or WC, it implies that userspace wants a
> > > non-coherent mapping which should be reflected in the guest side too.
> > > In such case, KVM can go to non-cohenrent DMA path and favor guest
> > > memory type automatically.
> > Sorry, I mixed two things together.
> >
> > Userspace access to dmabuf mmap must be guarded by
> > DMA_BUF_SYNC_{START,END} ioctls.  It is possible that the GPU driver
> > always picks a WB mapping and let the ioctls flush/invalidate CPU
> > caches.  We actually want the guest memory type to match vkMapMemory's
> > memory type, which can be different from dmabuf mmap's memory type.
> > It is not enough for KVM to inspect the hva's memory type.
>
> I'm not familiar with dmabuf and what is the difference between
> vkMapMemory and mmap. Just a simple thought that whatever
> memory type/synchronization enforced on the host userspace should
> ideally be applied to guest userspace too. e.g. in above example we
> possibly want the guest to use WB and issue flush/invalidate hypercalls
> to guard with other potential parallel operations in the host side.
> otherwise I cannot see how synchronization can be done when one
> use WB with sync primitives while the other simply use WC w/o such
> primitives.
>

I am reasonably familiar with the GPU stacks, but I am not familiar with
KVM :)

When allocating a GPU memory, the userspace can specify whether it wants a
coherent one or an incoherent one.  vkMapMemory returns a coherent or a
incoherent mapping respectively.  Indeed we also want the guest userspace
to have a coherent or a incoherent mapping respectively.

The GPU memory can be exported as a dmabuf to share with another device or
process.  For security, we allocate the GPU memory in a GPU process and we
export the dmabuf to the hypervisor.  mmap of dmabuf semantically returns
an incoherent mapping.  As a result, the guest will set up a mapping that
has the same memory type as the vkMapMemory mapping does, but the hva in
KVM_SET_USER_MEMORY_REGION points to the dmabuf's incoherent mapping.

If you think it is the best for KVM to inspect hva to determine the memory
type with page granularity, that is reasonable and should work for us too.
The userspace can do something (e.g., add a GPU driver dependency to the
hypervisor such that the dma-buf is imported as a GPU memory and mapped
using vkMapMemory) or I can work with dma-buf maintainers to see if
dma-buf's semantics can be changed.


> >
> > KVM_SET_DMA_BUF, if supported, is a signal to KVM that the guest
> > memory type should be honored (or forced if there is a new op in
> > dma_buf_ops that tells KVM which memory type to force).  KVM_MEM_DMA
> > flag in this RFC sends the same signal.  Unless KVM_SET_DMA_BUF gives
> > the userspace other features such as setting unlimited number of
> > dmabufs to subregions of a memslot, it is not very useful.
>
> the good part of a new interface is its simplicity, but only in slot
> granularity. instead having KVM to inspect hva can support page
> granularity, but adding run-time overhead. Let's see how Paolo
> thinks. =F0=9F=98=8A
>
> >
> > If uapi change is to be avoided, it is the easiest that guest memory
> > type is always honored unless it causes #MC (i.e.,is_mmio=3D=3Dtrue).
> >
>
> I feel this goes too far...
>
> Thanks
> Kevin
>

--0000000000004abae4059f0eb2de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 20, 2020 at 4:23 PM Tian,=
 Kevin &lt;<a href=3D"mailto:kevin.tian@intel.com">kevin.tian@intel.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;=
 From: Chia-I Wu &lt;<a href=3D"mailto:olvaffe@gmail.com" target=3D"_blank"=
>olvaffe@gmail.com</a>&gt;<br>
&gt; Sent: Friday, February 21, 2020 6:24 AM<br>
&gt; <br>
&gt; On Wed, Feb 19, 2020 at 6:38 PM Tian, Kevin &lt;<a href=3D"mailto:kevi=
n.tian@intel.com" target=3D"_blank">kevin.tian@intel.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; From: Tian, Kevin<br>
&gt; &gt; &gt; Sent: Thursday, February 20, 2020 10:05 AM<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; From: Chia-I Wu &lt;<a href=3D"mailto:olvaffe@gmail.com=
" target=3D"_blank">olvaffe@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Sent: Thursday, February 20, 2020 3:37 AM<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, Feb 19, 2020 at 1:52 AM Tian, Kevin &lt;<a href=
=3D"mailto:kevin.tian@intel.com" target=3D"_blank">kevin.tian@intel.com</a>=
&gt;<br>
&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; From: Paolo Bonzini<br>
&gt; &gt; &gt; &gt; &gt; &gt; Sent: Wednesday, February 19, 2020 12:29 AM<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On 14/02/20 23:03, Sean Christopherson wrote:=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; On Fri, Feb 14, 2020 at 1:47 PM Chia=
-I Wu &lt;<a href=3D"mailto:olvaffe@gmail.com" target=3D"_blank">olvaffe@gm=
ail.com</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;&gt; AFAICT, it is currently allowed =
on ARM (verified) and AMD (not<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;&gt; verified, but svm_get_mt_mask re=
turns 0 which supposedly<br>
&gt; means<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; NPT<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;&gt; does not restrict what the guest=
 PAT can do).=C2=A0 This diff would do<br>
&gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;&gt; trick for Intel without needing =
any uapi change:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; I would be concerned about Intel CPU=
 errata such as SKX40 and<br>
&gt; &gt; &gt; SKX59.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; The part KVM cares about, #MC, is alread=
y addressed by forcing<br>
&gt; UC<br>
&gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; &gt; &gt; MMIO.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; The data corruption issue is on the gues=
t kernel to correctly use<br>
&gt; WC<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; and/or non-temporal writes.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; What about coherency across live migration?=
=C2=A0 The userspace<br>
&gt; process<br>
&gt; &gt; &gt; &gt; would<br>
&gt; &gt; &gt; &gt; &gt; &gt; use cached accesses, and also a WBINVD could =
potentially corrupt<br>
&gt; guest<br>
&gt; &gt; &gt; &gt; &gt; &gt; memory.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; In such case the userspace process possibly should=
 conservatively use<br>
&gt; &gt; &gt; &gt; &gt; UC mapping, as if for MMIO regions on a passthroug=
h device.<br>
&gt; However<br>
&gt; &gt; &gt; &gt; &gt; there remains a problem. the definition of KVM_MEM=
_DMA implies<br>
&gt; &gt; &gt; &gt; &gt; favoring guest setting, which could be whatever ty=
pe in concept. Then<br>
&gt; &gt; &gt; &gt; &gt; assuming UC is also problematic. I&#39;m not sure =
whether inventing<br>
&gt; another<br>
&gt; &gt; &gt; &gt; &gt; interface to query effective memory type from KVM =
is a good idea.<br>
&gt; There<br>
&gt; &gt; &gt; &gt; &gt; is no guarantee that the guest will use same type =
for every page in the<br>
&gt; &gt; &gt; &gt; &gt; same slot, then such interface might be messy. Alt=
ernatively, maybe<br>
&gt; &gt; &gt; &gt; &gt; we could just have an interface for KVM userspace =
to force memory<br>
&gt; type<br>
&gt; &gt; &gt; &gt; &gt; for a given slot, if it is mainly used in para-vir=
tualized scenarios (e.g.<br>
&gt; &gt; &gt; &gt; &gt; virtio-gpu) where the guest is enlightened to use =
a forced type (e.g.<br>
&gt; WC)?<br>
&gt; &gt; &gt; &gt; KVM forcing the memory type for a given slot should wor=
k too.=C2=A0 But the<br>
&gt; &gt; &gt; &gt; ignore-guest-pat bit seems to be Intel-specific.=C2=A0 =
We will need to<br>
&gt; &gt; &gt; &gt; define how the second-level page attributes combine wit=
h the guest<br>
&gt; &gt; &gt; &gt; page attributes somehow.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; oh, I&#39;m not aware of that difference. without an ipat-eq=
uivalent<br>
&gt; &gt; &gt; capability, I&#39;m not sure how to forcing random type here=
. If you look at<br>
&gt; &gt; &gt; table 11-7 in Intel SDM, none of MTRR (EPT) memory type can =
lead to<br>
&gt; &gt; &gt; consistent effective type when combining with random PAT val=
ue. So<br>
&gt; &gt; &gt;=C2=A0 it is definitely a dead end.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; KVM should in theory be able to tell that the userspace=
 region is<br>
&gt; &gt; &gt; &gt; mapped with a certain memory type and can force the sam=
e memory<br>
&gt; type<br>
&gt; &gt; &gt; &gt; onto the guest.=C2=A0 The userspace does not need to be=
 involved.=C2=A0 But that<br>
&gt; &gt; &gt; &gt; sounds very slow?=C2=A0 This may be a dumb question, bu=
t would it help to<br>
&gt; &gt; &gt; &gt; add KVM_SET_DMA_BUF and let KVM negotiate the memory ty=
pe with<br>
&gt; the<br>
&gt; &gt; &gt; &gt; in-kernel GPU drivers?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; KVM_SET_DMA_BUF looks more reasonable. But I guess we don&#3=
9;t need<br>
&gt; &gt; &gt; KVM to be aware of such negotiation. We can continue your or=
iginal<br>
&gt; &gt; &gt; proposal to have KVM simply favor guest memory type (maybe s=
till call<br>
&gt; &gt; &gt; KVM_MEM_DMA). On the other hand, Qemu should just mmap on th=
e<br>
&gt; &gt; &gt; fd handle of the dmabuf passed from the virtio-gpu device ba=
ckend,=C2=A0 e.g.<br>
&gt; &gt; &gt; to conduct migration. That way the mmap request is finally s=
erved by<br>
&gt; &gt; &gt; DRM and underlying GPU drivers, with proper type enforced<br=
>
&gt; automatically.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Thinking more possibly we don&#39;t need introduce new interface =
to KVM.<br>
&gt; &gt; As long as Qemu uses dmabuf interface to mmap the specific region=
,<br>
&gt; &gt; KVM can simply check memory type in host page table given hva of =
a<br>
&gt; &gt; memslot. If the type is UC or WC, it implies that userspace wants=
 a<br>
&gt; &gt; non-coherent mapping which should be reflected in the guest side =
too.<br>
&gt; &gt; In such case, KVM can go to non-cohenrent DMA path and favor gues=
t<br>
&gt; &gt; memory type automatically.<br>
&gt; Sorry, I mixed two things together.<br>
&gt; <br>
&gt; Userspace access to dmabuf mmap must be guarded by<br>
&gt; DMA_BUF_SYNC_{START,END} ioctls.=C2=A0 It is possible that the GPU dri=
ver<br>
&gt; always picks a WB mapping and let the ioctls flush/invalidate CPU<br>
&gt; caches.=C2=A0 We actually want the guest memory type to match vkMapMem=
ory&#39;s<br>
&gt; memory type, which can be different from dmabuf mmap&#39;s memory type=
.<br>
&gt; It is not enough for KVM to inspect the hva&#39;s memory type.<br>
<br>
I&#39;m not familiar with dmabuf and what is the difference between<br>
vkMapMemory and mmap. Just a simple thought that whatever<br>
memory type/synchronization enforced on the host userspace should<br>
ideally be applied to guest userspace too. e.g. in above example we<br>
possibly want the guest to use WB and issue flush/invalidate hypercalls<br>
to guard with other potential parallel operations in the host side. <br>
otherwise I cannot see how synchronization can be done when one<br>
use WB with sync primitives while the other simply use WC w/o such<br>
primitives.<br></blockquote><div><br></div><div><div>I am reasonably famili=
ar with the GPU stacks, but I am not familiar with KVM :)</div><div></div><=
/div><div><br></div><div>When allocating a GPU memory, the userspace can sp=
ecify whether it wants a coherent one or an incoherent one.=C2=A0 vkMapMemo=
ry returns a coherent or a incoherent mapping respectively.=C2=A0 Indeed we=
 also want the guest userspace to have a coherent or a incoherent mapping r=
espectively.</div><div><br></div><div>The GPU memory can be exported as a d=
mabuf to share with another device or process.=C2=A0 For security, we alloc=
ate the GPU memory in a GPU process and we export the dmabuf to the hypervi=
sor.=C2=A0 mmap of dmabuf semantically returns an incoherent mapping.=C2=A0=
 As a result, the guest will set up a mapping that has the same memory type=
 as the vkMapMemory mapping does, but the hva in KVM_SET_USER_MEMORY_REGION=
 points to the dmabuf&#39;s incoherent mapping.</div><div><br></div><div>If=
 you think it is the best for KVM to inspect hva to determine the memory ty=
pe with page granularity, that is reasonable and should work for us too.=C2=
=A0 The userspace can do something (e.g., add a GPU driver dependency to th=
e hypervisor such that the dma-buf is imported as a GPU memory and mapped u=
sing vkMapMemory) or I can work with dma-buf maintainers to see if dma-buf&=
#39;s semantics can be changed.</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; KVM_SET_DMA_BUF, if supported, is a signal to KVM that the guest<br>
&gt; memory type should be honored (or forced if there is a new op in<br>
&gt; dma_buf_ops that tells KVM which memory type to force).=C2=A0 KVM_MEM_=
DMA<br>
&gt; flag in this RFC sends the same signal.=C2=A0 Unless KVM_SET_DMA_BUF g=
ives<br>
&gt; the userspace other features such as setting unlimited number of<br>
&gt; dmabufs to subregions of a memslot, it is not very useful.<br>
<br>
the good part of a new interface is its simplicity, but only in slot<br>
granularity. instead having KVM to inspect hva can support page<br>
granularity, but adding run-time overhead. Let&#39;s see how Paolo<br>
thinks. =F0=9F=98=8A<br>
<br>
&gt; <br>
&gt; If uapi change is to be avoided, it is the easiest that guest memory<b=
r>
&gt; type is always honored unless it causes #MC (i.e.,is_mmio=3D=3Dtrue).<=
br>
&gt; <br>
<br>
I feel this goes too far...<br>
<br>
Thanks<br>
Kevin<br>
</blockquote></div></div>

--0000000000004abae4059f0eb2de--

--===============1533105844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1533105844==--
